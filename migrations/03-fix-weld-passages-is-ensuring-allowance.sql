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
        weld_passage_cursor CURSOR FOR
            SELECT *
            FROM "WeldPassages";
        weld_passage_row              "WeldPassages"%ROWTYPE;
        welding_record_row            "WeldingRecords"%ROWTYPE;
        weld_passage_instructions_row "WeldPassageInstructions"%ROWTYPE;
        amperes_long_term_deviation   integer;
        voltages_long_term_deviation  integer;
        amperes_short_term_deviation  integer;
        voltages_short_term_deviation integer;
        short_term_deviation          double precision;
        long_term_deviation           double precision;
        is_ensuring_current_allowance boolean;
        is_ensuring_voltage_allowance boolean;
        array_length                  integer;
        end_interval                  interval;
        seconds                       float;
    BEGIN
        OPEN weld_passage_cursor;

        LOOP
            FETCH NEXT FROM weld_passage_cursor INTO weld_passage_row;
            EXIT WHEN NOT FOUND;

            SELECT *
            FROM "WeldPassageInstructions"
                     INNER JOIN "WeldingTasks" WT on WT."Id" = weld_passage_row."WeldingTaskId"
                     INNER JOIN "SeamAccounts" SA on SA."Id" = WT."SeamAccountId"
                     INNER JOIN "Seams" on "Seams"."Id" = SA."SeamId"
                     INNER JOIN "TechnologicalInstructions" TI on TI."Id" = "Seams"."TechnologicalInstructionId"
            WHERE "WeldPassageInstructions"."TechnologicalInstructionId" = TI."Id" AND "WeldPassageInstructions"."Number" = weld_passage_row."Number"
            LIMIT 1
            INTO weld_passage_instructions_row;

            SELECT *
            FROM "WeldingRecords"
            WHERE "WeldingRecords"."Id" = weld_passage_row."WeldingRecordId"
            LIMIT 1
            INTO welding_record_row;

            SELECT array_length(welding_record_row."WeldingCurrentValues", 1) INTO array_length;
            seconds := array_length::float / 10;
            end_interval := welding_record_row."WeldingStartTime" + MAKE_INTERVAL(secs => seconds);

            UPDATE "WeldingRecords"
            SET "WeldingEndTime" = end_interval
            WHERE "Id" = welding_record_row."Id";

            SELECT long_term_count, short_term_count
            INTO amperes_long_term_deviation, amperes_short_term_deviation
            FROM calculate_term_deviation(
                    welding_record_row."WeldingCurrentValues",
                    weld_passage_instructions_row."WeldingCurrentMin",
                    weld_passage_instructions_row."WeldingCurrentMax");

            SELECT long_term_count, short_term_count
            INTO voltages_long_term_deviation, voltages_short_term_deviation
            FROM calculate_term_deviation(
                    welding_record_row."ArcVoltageValues",
                    weld_passage_instructions_row."ArcVoltageMin",
                    weld_passage_instructions_row."ArcVoltageMax");

            IF amperes_short_term_deviation > voltages_short_term_deviation OR
               amperes_long_term_deviation > voltages_long_term_deviation THEN
                short_term_deviation := amperes_short_term_deviation * 0.1;
                long_term_deviation := amperes_long_term_deviation * 0.1;
            ELSE
                short_term_deviation := voltages_short_term_deviation * 0.1;
                long_term_deviation := voltages_long_term_deviation * 0.1;
            END IF;

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

            UPDATE "WeldPassages"
            SET "ShortTermDeviation"         = short_term_deviation,
                "LongTermDeviation"          = long_term_deviation,
                "IsEnsuringCurrentAllowance" = is_ensuring_current_allowance,
                "IsEnsuringVoltageAllowance" = is_ensuring_voltage_allowance
            WHERE "Id" = weld_passage_row."Id";
        END LOOP;

        CLOSE weld_passage_cursor;
    END
$$;