ALTER TABLE public."WeldingTasks"
ALTER COLUMN "Number" DROP IDENTITY;

DO
$$
    DECLARE
        welding_task_cursor CURSOR FOR
            SELECT *
            FROM "WeldingTasks"
            ORDER BY "WeldingDate", "Number";
        user_id      uuid;
        role_name    text;
        row          "WeldingTasks"%ROWTYPE;
        start_number integer;
    BEGIN
        start_number := 1;

        OPEN welding_task_cursor;

        LOOP
            FETCH NEXT FROM welding_task_cursor INTO row;
            EXIT WHEN NOT FOUND;

            UPDATE "WeldingTasks" SET "Number" = start_number WHERE "Id" = row."Id";
            start_number := start_number + 1;

            IF row."WeldingDate"::DATE < CURRENT_DATE AND row."TaskStatus" = 2 THEN
                UPDATE "WeldingTasks" SET "TaskStatus" = 3 WHERE "Id" = row."Id";
            end if;
        END LOOP;

        CLOSE welding_task_cursor;
        -- your code here
    END
$$;

CREATE OR REPLACE FUNCTION add_unique_number_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
DECLARE
    last_number integer;
BEGIN
    SELECT COALESCE(MAX("Number"), 0) INTO last_number FROM "WeldingTasks";
    NEW."Number" := last_number + 1; -- Set the value of the "Number" column for the new row
    RETURN NEW;
END;
$$;

CREATE TRIGGER add_unique_number_trigger
    BEFORE INSERT
    ON "WeldingTasks"
    FOR EACH ROW
EXECUTE PROCEDURE add_unique_number_function();

CREATE OR REPLACE FUNCTION check_welding_task_number_function()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
AS
$$
DECLARE
    number_exists BOOLEAN;
    last_number   integer;
BEGIN
    SELECT EXISTS(SELECT 1
                  FROM "WeldingTasks"
                  WHERE "Number" = NEW."Number"
                    AND "Id" != NEW."Id")
    INTO number_exists;

    IF number_exists THEN
        SELECT COALESCE(MAX("Number"), 0) INTO last_number FROM "WeldingTasks";

        NEW."Number" := last_number + 1;

        UPDATE "WeldingTasks" SET "Number" = NEW."Number" WHERE "Id" = NEW."Id";
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER check_welding_task_number_trigger
    AFTER UPDATE
    ON "WeldingTasks"
    FOR EACH ROW
EXECUTE PROCEDURE check_welding_task_number_function();