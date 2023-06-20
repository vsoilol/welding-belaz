-- changeset vsoil:1686746075555-2
CREATE TABLE "WeldingRecordLimits" ("Id" UUID NOT NULL, "WeldingCurrentMin" DOUBLE PRECISION, "WeldingCurrentMax" DOUBLE PRECISION, "ArcVoltageMin" DOUBLE PRECISION, "ArcVoltageMax" DOUBLE PRECISION, "IdFromSystem" TEXT, CONSTRAINT "PK_WeldingRecordLimits" PRIMARY KEY ("Id"));

-- changeset vsoil:1686746075555-3
CREATE UNIQUE INDEX "IX_WeldingRecordLimits_IdFromSystem" ON "WeldingRecordLimits"("IdFromSystem");

INSERT INTO "WeldingRecordLimits" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax")
VALUES ('849a489d-cf3b-421d-8ca1-4c4547f10fae', 100, 300, 20, 40);

-- changeset vsoil:1686746075555-10
ALTER TABLE "WeldingRecords" ADD "WeldingRecordLimitId" UUID NOT NULL DEFAULT '849a489d-cf3b-421d-8ca1-4c4547f10fae';

-- changeset vsoil:1686746075555-4
CREATE INDEX "IX_WeldingRecords_WeldingRecordLimitId" ON "WeldingRecords"("WeldingRecordLimitId");

-- changeset vsoil:1686746075555-5
ALTER TABLE "Users" ADD "IsFirstLogin" BOOLEAN NOT NULL DEFAULT TRUE;

-- changeset vsoil:1686746075555-6
ALTER TABLE "WeldingRecords" ADD "IsEnsuringCurrentAllowance" BOOLEAN;

-- changeset vsoil:1686746075555-7
ALTER TABLE "WeldingRecords" ADD "IsEnsuringVoltageAllowance" BOOLEAN;

-- changeset vsoil:1686746075555-8
ALTER TABLE "WeldingRecords" ADD "WeldingCurrentAverage" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- changeset vsoil:1686746075555-9
ALTER TABLE "WeldingRecords" ADD "ArcVoltageAverage" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- changeset vsoil:1686746075555-11
ALTER TABLE "WeldingRecords" ADD CONSTRAINT "FK_WeldingRecords_WeldingRecordLimits_WeldingRecordLimitId" FOREIGN KEY ("WeldingRecordLimitId") REFERENCES "WeldingRecordLimits" ("Id") ON UPDATE NO ACTION ON DELETE CASCADE;

-- changeset vsoil:1686746075555-1
ALTER TABLE "TechnologicalInstructions" ALTER COLUMN "Number" TYPE TEXT USING ("Number"::TEXT);

CREATE OR REPLACE FUNCTION calculate_term_deviation(input_values double precision[],
                                                         min double precision, max double precision)
    RETURNS TABLE
            (
                long_term_count  integer,
                short_term_count integer
            )
AS
$$
DECLARE
    long_term_count  integer := 0;
    short_term_count integer := 0;
    i                integer;
    count_sequential integer := 0;
    array_length     integer;
BEGIN
    IF min IS NULL OR max IS NULL THEN
        RETURN QUERY
            SELECT 0, 0;
        RETURN;
    END IF;

    SELECT array_length(input_values, 1) INTO array_length;

    FOR i IN array_lower(input_values, 1)..array_upper(input_values, 1)
        LOOP
            IF input_values[i] < min OR input_values[i] > max THEN
                count_sequential := count_sequential + 1;

                IF i != array_length THEN
                    CONTINUE;
                END IF;
            END IF;

            IF count_sequential > 50 THEN
                long_term_count := long_term_count + count_sequential;
            END IF;

            IF count_sequential != 0 AND count_sequential <= 50 THEN
                short_term_count := short_term_count + count_sequential;
            END IF;

            count_sequential := 0;

        END LOOP;

    RETURN QUERY
        SELECT long_term_count, short_term_count;
END;
$$ LANGUAGE plpgsql;

DO
$$
    DECLARE
        welding_record_cursor CURSOR FOR
            SELECT *
            FROM "WeldingRecords";
        welding_record_row            "WeldingRecords"%ROWTYPE;
        welding_record_limits_row     "WeldingRecordLimits"%ROWTYPE;
        amperes_long_term_deviation   integer;
        arc_voltage_average           double precision;
        welding_current_average       double precision;
        voltages_long_term_deviation  integer;
        amperes_short_term_deviation  integer;
        voltages_short_term_deviation integer;
        is_ensuring_current_allowance boolean;
        is_ensuring_voltage_allowance boolean;
    BEGIN
        OPEN welding_record_cursor;

        LOOP
            FETCH NEXT FROM welding_record_cursor INTO welding_record_row;
            EXIT WHEN NOT FOUND;

            SELECT ROUND(AVG(value)::numeric, 2)
            INTO arc_voltage_average
            FROM unnest(welding_record_row."ArcVoltageValues") AS value;

            SELECT ROUND(AVG(value)::numeric, 2)
            INTO welding_current_average
            FROM unnest(welding_record_row."WeldingCurrentValues") AS value;

            UPDATE "WeldingRecords"
            SET "ArcVoltageAverage"     = arc_voltage_average,
                "WeldingCurrentAverage" = welding_current_average
            WHERE "Id" = welding_record_row."Id";

            IF EXISTS(SELECT 1 FROM "WeldPassages" WHERE "WeldingRecordId" = welding_record_row."Id") THEN
                CONTINUE;
            END IF;

            SELECT * FROM "WeldingRecordLimits" LIMIT 1 INTO welding_record_limits_row;

            SELECT long_term_count, short_term_count
            INTO amperes_long_term_deviation, amperes_short_term_deviation
            FROM calculate_term_deviation(
                    welding_record_row."WeldingCurrentValues",
                    welding_record_limits_row."WeldingCurrentMin",
                    welding_record_limits_row."WeldingCurrentMax");

            SELECT long_term_count, short_term_count
            INTO voltages_long_term_deviation, voltages_short_term_deviation
            FROM calculate_term_deviation(
                    welding_record_row."ArcVoltageValues",
                    welding_record_limits_row."ArcVoltageMin",
                    welding_record_limits_row."ArcVoltageMax");

            IF amperes_long_term_deviation > 0 THEN
                is_ensuring_current_allowance := FALSE;
            ELSE
                is_ensuring_current_allowance := TRUE;
            END IF;

            IF voltages_long_term_deviation > 0 THEN
                is_ensuring_voltage_allowance := FALSE;
            ELSE
                is_ensuring_voltage_allowance := TRUE;
            END IF;

            UPDATE "WeldingRecords"
            SET "IsEnsuringCurrentAllowance" = is_ensuring_current_allowance,
                "IsEnsuringVoltageAllowance" = is_ensuring_voltage_allowance
            WHERE "Id" = welding_record_row."Id";
        END LOOP;

        CLOSE welding_record_cursor;
    END
$$;

CREATE OR REPLACE FUNCTION set_welding_record_limit_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
DECLARE
    welding_record_limit_id uuid;
BEGIN
    SELECT "Id" from "WeldingRecordLimits" LIMIT 1 INTO welding_record_limit_id;

    NEW."WeldingRecordLimitId" = welding_record_limit_id;

    RETURN NEW;
END;
$$;

CREATE TRIGGER set_welding_record_limit_trigger
    BEFORE INSERT OR UPDATE
    ON "WeldingRecords"
    FOR EACH ROW
EXECUTE PROCEDURE set_welding_record_limit_function();