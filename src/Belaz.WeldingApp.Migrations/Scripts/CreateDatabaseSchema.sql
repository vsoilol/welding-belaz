CREATE OR REPLACE FUNCTION public.add_unique_number_function() RETURNS trigger
    LANGUAGE plpgsql
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



--
-- Name: calculate_term_deviation(double precision[], double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE OR REPLACE FUNCTION public.calculate_term_deviation(input_values double precision[], min double precision,
                                                max double precision)
    RETURNS TABLE
            (
                long_term_count  integer,
                short_term_count integer
            )
    LANGUAGE plpgsql
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

$$;


--
-- Name: check_welding_task_number_function(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE OR REPLACE FUNCTION public.check_welding_task_number_function() RETURNS trigger
    LANGUAGE plpgsql
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


--
-- Name: set_welding_record_limit_function(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE OR REPLACE FUNCTION public.set_welding_record_limit_function() RETURNS trigger
    LANGUAGE plpgsql
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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Calendars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Calendars"
(
    "Id"                 uuid    NOT NULL,
    "Year"               integer NOT NULL,
    "IsMain"             boolean NOT NULL,
    "WelderId"           uuid,
    "WeldingEquipmentId" uuid,
    "IdFromSystem"       text
);


--
-- Name: Chiefs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Chiefs"
(
    "Id"                 uuid NOT NULL,
    "UserId"             uuid NOT NULL,
    "WorkshopId"         uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "IdFromSystem"       text
);


--
-- Name: Days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Days"
(
    "Id"           uuid    NOT NULL,
    "MonthNumber"  integer NOT NULL,
    "Number"       integer NOT NULL,
    "IsWorkingDay" boolean NOT NULL,
    "CalendarId"   uuid    NOT NULL,
    "IdFromSystem" text
);


--
-- Name: DefectiveReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."DefectiveReasons"
(
    "Id"                    uuid                        NOT NULL,
    "DetectedDefectiveDate" timestamp without time zone NOT NULL,
    "Reason"                text                        NOT NULL,
    "DetectedDefects"       text                        NOT NULL,
    "WeldingTaskId"         uuid                        NOT NULL,
    "IdFromSystem"          text
);


--
-- Name: DowntimeReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."DowntimeReasons"
(
    "Id"           uuid NOT NULL,
    "Reason"       text NOT NULL,
    "IdFromSystem" text
);


--
-- Name: EventLogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."EventLogs"
(
    "Id"           uuid                        NOT NULL,
    "Information"  text                        NOT NULL,
    "DateTime"     timestamp without time zone NOT NULL,
    "UserId"       uuid                        NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Inspectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Inspectors"
(
    "Id"           uuid NOT NULL,
    "UserId"       uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Masters"
(
    "Id"           uuid NOT NULL,
    "UserId"       uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Posts"
(
    "Id"               uuid    NOT NULL,
    "Number"           integer NOT NULL,
    "Name"             text    NOT NULL,
    "ProductionAreaId" uuid    NOT NULL,
    "IdFromSystem"     text
);


--
-- Name: ProductAccountWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."ProductAccountWeldingEquipment"
(
    "ProductAccountsId"   uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
);


--
-- Name: ProductAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."ProductAccounts"
(
    "Id"             uuid                        NOT NULL,
    "Number"         integer                     NOT NULL,
    "AmountFromPlan" integer                     NOT NULL,
    "DateFromPlan"   timestamp without time zone NOT NULL,
    "ProductId"      uuid                        NOT NULL,
    "IdFromSystem"   text,
    "UniqueNumber"   integer
);


--
-- Name: ProductInsides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."ProductInsides"
(
    "MainProductId"   uuid NOT NULL,
    "InsideProductId" uuid NOT NULL
);


--
-- Name: ProductResults; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."ProductResults"
(
    "Id"               uuid    NOT NULL,
    "Amount"           integer NOT NULL,
    "Status"           integer NOT NULL,
    "Reason"           text,
    "DetectedDefects"  text,
    "ProductAccountId" uuid    NOT NULL,
    "IdFromSystem"     text
);


--
-- Name: ProductionAreas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."ProductionAreas"
(
    "Id"           uuid    NOT NULL,
    "Name"         text    NOT NULL,
    "Number"       integer NOT NULL,
    "WorkshopId"   uuid    NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Products"
(
    "Id"                     uuid             NOT NULL,
    "Name"                   text             NOT NULL,
    "Number"                 text             NOT NULL,
    "IsControlSubject"       boolean          NOT NULL,
    "ManufacturingTime"      double precision NOT NULL,
    "ProductType"            integer          NOT NULL,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId"       uuid             NOT NULL,
    "MasterId"               uuid,
    "InspectorId"            uuid,
    "WorkplaceId"            uuid,
    "IdFromSystem"           text
);


--
-- Name: SeamAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."SeamAccounts"
(
    "Id"               uuid                        NOT NULL,
    "DateFromPlan"     timestamp without time zone NOT NULL,
    "SeamId"           uuid                        NOT NULL,
    "ProductAccountId" uuid                        NOT NULL,
    "IdFromSystem"     text
);


--
-- Name: SeamResults; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."SeamResults"
(
    "Id"              uuid    NOT NULL,
    "Amount"          integer NOT NULL,
    "Status"          integer NOT NULL,
    "Reason"          text,
    "DetectedDefects" text,
    "SeamAccountId"   uuid    NOT NULL,
    "IdFromSystem"    text
);


--
-- Name: Seams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Seams"
(
    "Id"                         uuid    NOT NULL,
    "Number"                     integer NOT NULL,
    "Length"                     integer NOT NULL,
    "IsControlSubject"           boolean NOT NULL,
    "IsPerformed"                boolean NOT NULL,
    "ProductId"                  uuid    NOT NULL,
    "TechnologicalInstructionId" uuid,
    "InspectorId"                uuid,
    "ProductionAreaId"           uuid,
    "WorkplaceId"                uuid,
    "IdFromSystem"               text
);


--
-- Name: TechnologicalInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."TechnologicalInstructions"
(
    "Id"           uuid NOT NULL,
    "Number"       text NOT NULL,
    "Name"         text NOT NULL,
    "IdFromSystem" text
);


--
-- Name: TechnologicalProcesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."TechnologicalProcesses"
(
    "Id"                uuid NOT NULL,
    "Number"            text NOT NULL,
    "Name"              text NOT NULL,
    "PdmSystemFileLink" text,
    "IdFromSystem"      text
);


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Users"
(
    "Id"                        uuid                 NOT NULL,
    "FirstName"                 text                 NOT NULL,
    "LastName"                  text                 NOT NULL,
    "MiddleName"                text                 NOT NULL,
    "UserName"                  text,
    "Email"                     text,
    "IsEmailConfirmed"          boolean              NOT NULL,
    "PasswordHash"              text,
    "Position"                  text,
    "ServiceNumber"             text,
    "CertificateValidityPeriod" timestamp without time zone,
    "Role"                      integer              NOT NULL,
    "ProductionAreaId"          uuid,
    "ConfirmEmailToken"         text,
    "ResetPasswordToken"        text,
    "IdFromSystem"              text,
    "RfidTag"                   text,
    "IsFirstLogin"              boolean DEFAULT true NOT NULL
);


--
-- Name: WeldPassageInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldPassageInstructions"
(
    "Id"                         uuid    NOT NULL,
    "Number"                     integer NOT NULL,
    "Name"                       text    NOT NULL,
    "WeldingCurrentMin"          double precision,
    "WeldingCurrentMax"          double precision,
    "ArcVoltageMin"              double precision,
    "ArcVoltageMax"              double precision,
    "PreheatingTemperatureMin"   double precision,
    "PreheatingTemperatureMax"   double precision,
    "TechnologicalInstructionId" uuid    NOT NULL,
    "IdFromSystem"               text
);


--
-- Name: WeldPassages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldPassages"
(
    "Id"                             uuid    NOT NULL,
    "Number"                         integer NOT NULL,
    "Name"                           text    NOT NULL,
    "PreheatingTemperature"          double precision,
    "ShortTermDeviation"             double precision,
    "LongTermDeviation"              double precision,
    "IsEnsuringCurrentAllowance"     boolean,
    "IsEnsuringVoltageAllowance"     boolean,
    "IsEnsuringTemperatureAllowance" boolean,
    "Estimation"                     double precision,
    "WeldingRecordId"                uuid    NOT NULL,
    "WeldingTaskId"                  uuid    NOT NULL,
    "IdFromSystem"                   text
);


--
-- Name: WelderWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WelderWeldingEquipment"
(
    "WeldersId"           uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
);


--
-- Name: Welders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Welders"
(
    "Id"           uuid NOT NULL,
    "UserId"       uuid NOT NULL,
    "WorkplaceId"  uuid,
    "IdFromSystem" text
);


--
-- Name: WeldingEquipmentConditionTimes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldingEquipmentConditionTimes"
(
    "Id"                 uuid                        NOT NULL,
    "Condition"          integer                     NOT NULL,
    "Date"               timestamp without time zone NOT NULL,
    "StartConditionTime" interval                    NOT NULL,
    "Time"               double precision            NOT NULL,
    "WeldingEquipmentId" uuid                        NOT NULL,
    "WelderId"           uuid                        NOT NULL,
    "DowntimeReasonId"   uuid,
    "IdFromSystem"       text
);


--
-- Name: WeldingEquipmentWorkplace; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldingEquipmentWorkplace"
(
    "WeldingEquipmentsId" uuid NOT NULL,
    "WorkplacesId"        uuid NOT NULL
);


--
-- Name: WeldingEquipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldingEquipments"
(
    "Id"                  uuid                        NOT NULL,
    "Name"                text                        NOT NULL,
    "Marking"             text                        NOT NULL,
    "FactoryNumber"       text                        NOT NULL,
    "CommissioningDate"   timestamp without time zone NOT NULL,
    "CurrentCondition"    integer                     NOT NULL,
    "Height"              integer,
    "Width"               integer,
    "Lenght"              integer,
    "GroupNumber"         text                        NOT NULL,
    "ManufacturerName"    text                        NOT NULL,
    "NextAttestationDate" timestamp without time zone,
    "WeldingProcess"      text                        NOT NULL,
    "IdleVoltage"         double precision,
    "WeldingCurrentMin"   double precision,
    "WeldingCurrentMax"   double precision,
    "ArcVoltageMin"       double precision,
    "ArcVoltageMax"       double precision,
    "LoadDuration"        double precision,
    "PostId"              uuid,
    "MasterId"            uuid,
    "IdFromSystem"        text,
    "RfidTag"             text
);


--
-- Name: WeldingRecordLimits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldingRecordLimits"
(
    "Id"                uuid NOT NULL,
    "WeldingCurrentMin" double precision,
    "WeldingCurrentMax" double precision,
    "ArcVoltageMin"     double precision,
    "ArcVoltageMax"     double precision,
    "IdFromSystem"      text
);


--
-- Name: WeldingRecords; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldingRecords"
(
    "Id"                         uuid                                                                  NOT NULL,
    "Date"                       timestamp without time zone                                           NOT NULL,
    "WeldingStartTime"           interval                                                              NOT NULL,
    "WeldingEndTime"             interval                                                              NOT NULL,
    "WeldingCurrentValues"       double precision[]                                                    NOT NULL,
    "ArcVoltageValues"           double precision[]                                                    NOT NULL,
    "WeldingEquipmentId"         uuid                                                                  NOT NULL,
    "WelderId"                   uuid                                                                  NOT NULL,
    "MasterId"                   uuid,
    "IdFromSystem"               text,
    "WeldingRecordLimitId"       uuid             DEFAULT '849a489d-cf3b-421d-8ca1-4c4547f10fae'::uuid NOT NULL,
    "IsEnsuringCurrentAllowance" boolean,
    "IsEnsuringVoltageAllowance" boolean,
    "WeldingCurrentAverage"      double precision DEFAULT 0                                            NOT NULL,
    "ArcVoltageAverage"          double precision DEFAULT 0                                            NOT NULL,
    "SequenceNumber"             integer
);


--
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WeldingTasks"
(
    "Id"                         uuid                        NOT NULL,
    "Number"                     integer                     NOT NULL,
    "Status"                     integer                     NOT NULL,
    "TaskStatus"                 integer                     NOT NULL,
    "IsAddManually"              boolean                     NOT NULL,
    "WeldingDate"                timestamp without time zone NOT NULL,
    "BasicMaterial"              text,
    "MainMaterialBatchNumber"    text,
    "WeldingMaterial"            text,
    "WeldingMaterialBatchNumber" text,
    "ProtectiveGas"              text,
    "ProtectiveGasBatchNumber"   text,
    "SeamAccountId"              uuid                        NOT NULL,
    "WelderId"                   uuid,
    "MasterId"                   uuid,
    "InspectorId"                uuid,
    "IdFromSystem"               text
);


--
-- Name: WorkingShifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."WorkingShifts"
(
    "Id"           uuid     NOT NULL,
    "Number"       integer  NOT NULL,
    "ShiftStart"   interval NOT NULL,
    "ShiftEnd"     interval NOT NULL,
    "BreakStart"   interval,
    "BreakEnd"     interval,
    "DayId"        uuid,
    "CalendarId"   uuid,
    "IdFromSystem" text
);


--
-- Name: Workplaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Workplaces"
(
    "Id"               uuid    NOT NULL,
    "Number"           integer NOT NULL,
    "PostId"           uuid,
    "ProductionAreaId" uuid,
    "IdFromSystem"     text
);


--
-- Name: Workshops; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public."Workshops"
(
    "Id"           uuid    NOT NULL,
    "Name"         text    NOT NULL,
    "Number"       integer NOT NULL,
    "IdFromSystem" text
);
