--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Calendars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Calendars" (
    "Id" uuid NOT NULL,
    "Year" integer NOT NULL,
    "IsMain" boolean NOT NULL,
    "WelderId" uuid,
    "WeldingEquipmentId" uuid,
    "IdFromSystem" text
);


--
-- Name: Chiefs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Chiefs" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WorkshopId" uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "IdFromSystem" text
);


--
-- Name: Days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Days" (
    "Id" uuid NOT NULL,
    "MonthNumber" integer NOT NULL,
    "Number" integer NOT NULL,
    "IsWorkingDay" boolean NOT NULL,
    "CalendarId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: DefectiveReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DefectiveReasons" (
    "Id" uuid NOT NULL,
    "DetectedDefectiveDate" timestamp without time zone NOT NULL,
    "Reason" text NOT NULL,
    "DetectedDefects" text NOT NULL,
    "WeldingTaskId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: DowntimeReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DowntimeReasons" (
    "Id" uuid NOT NULL,
    "Reason" text NOT NULL,
    "IdFromSystem" text
);


--
-- Name: EventLogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."EventLogs" (
    "Id" uuid NOT NULL,
    "Information" text NOT NULL,
    "DateTime" timestamp without time zone NOT NULL,
    "UserId" uuid,
    "IdFromSystem" text
);


--
-- Name: Inspectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Inspectors" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Masters" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Posts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "ProductionAreaId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: ProductAccountWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductAccountWeldingEquipment" (
    "ProductAccountsId" uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
);


--
-- Name: ProductAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductAccounts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "AmountFromPlan" integer NOT NULL,
    "DateFromPlan" timestamp without time zone NOT NULL,
    "ProductId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: ProductInsides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductInsides" (
    "MainProductId" uuid NOT NULL,
    "InsideProductId" uuid NOT NULL
);


--
-- Name: ProductResults; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductResults" (
    "Id" uuid NOT NULL,
    "Amount" integer NOT NULL,
    "Status" integer NOT NULL,
    "Reason" text,
    "DetectedDefects" text,
    "ProductAccountId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: ProductionAreas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductionAreas" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Number" integer NOT NULL,
    "WorkshopId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Products" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Number" text NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "ManufacturingTime" double precision NOT NULL,
    "ProductType" integer NOT NULL,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid NOT NULL,
    "MasterId" uuid,
    "InspectorId" uuid,
    "WorkplaceId" uuid,
    "IdFromSystem" text
);


--
-- Name: SeamAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SeamAccounts" (
    "Id" uuid NOT NULL,
    "DateFromPlan" timestamp without time zone NOT NULL,
    "SeamId" uuid NOT NULL,
    "ProductAccountId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: SeamResults; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SeamResults" (
    "Id" uuid NOT NULL,
    "Amount" integer NOT NULL,
    "Status" integer NOT NULL,
    "Reason" text,
    "DetectedDefects" text,
    "SeamAccountId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Seams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seams" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Length" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsPerformed" boolean NOT NULL,
    "ProductId" uuid NOT NULL,
    "TechnologicalInstructionId" uuid,
    "InspectorId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "IdFromSystem" text
);


--
-- Name: TechnologicalInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalInstructions" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "IdFromSystem" text
);


--
-- Name: TechnologicalProcesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalProcesses" (
    "Id" uuid NOT NULL,
    "Number" text NOT NULL,
    "Name" text NOT NULL,
    "PdmSystemFileLink" text,
    "IdFromSystem" text
);


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "FirstName" text NOT NULL,
    "LastName" text NOT NULL,
    "MiddleName" text NOT NULL,
    "UserName" text,
    "Email" text,
    "IsEmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "Position" text,
    "ServiceNumber" text,
    "CertificateValidityPeriod" timestamp without time zone,
    "Role" integer NOT NULL,
    "ProductionAreaId" uuid,
    "IdFromSystem" text,
    "RfidTag" text
);


--
-- Name: WeldPassageInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldPassageInstructions" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "WeldingCurrentMin" double precision,
    "WeldingCurrentMax" double precision,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "PreheatingTemperatureMin" double precision,
    "PreheatingTemperatureMax" double precision,
    "TechnologicalInstructionId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: WeldPassages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldPassages" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "PreheatingTemperature" double precision,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "IsEnsuringCurrentAllowance" boolean,
    "IsEnsuringVoltageAllowance" boolean,
    "IsEnsuringTemperatureAllowance" boolean,
    "Estimation" double precision,
    "WeldingRecordId" uuid NOT NULL,
    "WeldingTaskId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: WelderWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WelderWeldingEquipment" (
    "WeldersId" uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
);


--
-- Name: Welders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Welders" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WorkplaceId" uuid,
    "IdFromSystem" text
);


--
-- Name: WeldingEquipmentConditionTimes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipmentConditionTimes" (
    "Id" uuid NOT NULL,
    "Condition" integer NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "StartConditionTime" interval NOT NULL,
    "Time" double precision NOT NULL,
    "WeldingEquipmentId" uuid NOT NULL,
    "WelderId" uuid NOT NULL,
    "DowntimeReasonId" uuid,
    "IdFromSystem" text
);


--
-- Name: WeldingEquipmentWorkplace; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipmentWorkplace" (
    "WeldingEquipmentsId" uuid NOT NULL,
    "WorkplacesId" uuid NOT NULL
);


--
-- Name: WeldingEquipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipments" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Marking" text NOT NULL,
    "FactoryNumber" text NOT NULL,
    "CommissioningDate" timestamp without time zone NOT NULL,
    "CurrentCondition" integer NOT NULL,
    "Height" integer,
    "Width" integer,
    "Lenght" integer,
    "GroupNumber" text NOT NULL,
    "ManufacturerName" text NOT NULL,
    "NextAttestationDate" timestamp without time zone,
    "WeldingProcess" text NOT NULL,
    "IdleVoltage" double precision,
    "WeldingCurrentMin" double precision,
    "WeldingCurrentMax" double precision,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "LoadDuration" double precision,
    "PostId" uuid,
    "MasterId" uuid,
    "IdFromSystem" text,
    "RfidTag" text
);


--
-- Name: WeldingRecords; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingRecords" (
    "Id" uuid NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "WeldingEquipmentId" uuid NOT NULL,
    "WelderId" uuid NOT NULL,
    "MasterId" uuid,
    "IdFromSystem" text
);


--
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Status" integer NOT NULL,
    "TaskStatus" integer NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "WeldingDate" timestamp without time zone NOT NULL,
    "BasicMaterial" text,
    "MainMaterialBatchNumber" text,
    "WeldingMaterial" text,
    "WeldingMaterialBatchNumber" text,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamAccountId" uuid NOT NULL,
    "WelderId" uuid,
    "MasterId" uuid,
    "InspectorId" uuid,
    "IdFromSystem" text
);


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."WeldingTasks" ALTER COLUMN "Number" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."WeldingTasks_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: WorkingShifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WorkingShifts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "ShiftStart" interval NOT NULL,
    "ShiftEnd" interval NOT NULL,
    "BreakStart" interval,
    "BreakEnd" interval,
    "DayId" uuid,
    "CalendarId" uuid,
    "IdFromSystem" text
);


--
-- Name: Workplaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workplaces" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "PostId" uuid,
    "ProductionAreaId" uuid,
    "IdFromSystem" text
);


--
-- Name: Workshops; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workshops" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Number" integer NOT NULL,
    "IdFromSystem" text
);


--
-- Data for Name: Calendars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Calendars" ("Id", "Year", "IsMain", "WelderId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
d466fed3-aad8-479f-962f-9d0af9b83836	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
5aba01c4-f143-41b9-b027-488bc9defd7b	16aab4da-7be4-41e8-9501-e449a0f58b97	a0b29c6f-d4ea-4d68-b584-31b519469891	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
05cffb4c-4bf0-4ba6-a491-dcdea46733f5	4	22	t	d466fed3-aad8-479f-962f-9d0af9b83836	\N
0d7bb627-739a-40a1-a6e7-a4db0419d92f	3	8	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
13ed1321-b417-4393-8774-6d953501960c	8	26	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
14a065e2-7cb1-433e-964d-a3c164419034	10	21	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
160714da-c412-4978-abdf-9357cd578e1b	3	19	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
17d60a0f-2e52-4c93-8fdd-c028f1350568	3	18	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
19801eee-9eb4-45ea-81ef-8659dacdcb7b	2	11	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
1b3ed1ce-5641-44c6-bcd1-be3c18643db0	11	26	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
1d035800-10c9-44b9-9cf7-6b947eaa9b4e	12	16	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
23563802-7e9d-45b8-b5fd-a5b6a287fb94	12	10	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
24d9fa1d-05ae-4388-aa4b-9e9dc1a14589	1	7	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
2524deaa-2bd9-4e8d-9ee8-f68f78a2916b	5	8	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
252b1d69-dacf-4ee6-8111-eef3ea58dad7	12	31	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
2735504e-be16-48f8-918e-e8bf9585d16e	12	23	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
278f4344-3107-4e77-b0db-1a799e1d788a	3	4	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
283d9e26-5258-492d-9d7a-bf20efc3f714	3	11	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
284fbb71-a893-4f52-b453-a9535c398b41	10	15	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
28fbedb9-22a7-4028-8a66-6b18418a724c	5	14	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
2a58e2f4-6a26-4127-a606-55f716866502	6	11	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
2d9bd7a3-1edf-499b-a288-3edaa72fddca	12	30	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
318ae8eb-fb9b-4b1b-859a-0b2697e75f56	3	25	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
32a81eee-0005-4c4f-986b-c503d3c7ac03	1	22	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
37a379ae-47fe-4d29-a541-f96c3c6ebc71	2	26	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
3ab510e5-d553-48ef-ab42-9d4951fd7994	5	28	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
3cebb0fe-5289-4bdb-9f0a-26057c2c6577	1	8	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
3ecc3e48-16d4-4e91-b8d4-40c4ffc6c013	9	2	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
40179142-0724-430a-997b-efb94f5cfd8b	1	2	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
406a0f3c-b075-4f83-bcf9-4c3386d6e033	3	12	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
43d38b03-ceb4-4f5b-87df-47eb1304394d	7	8	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
4807f085-bf5f-4793-8128-ca951b1eca61	7	15	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
4840e2f6-4175-4aab-b4e4-5580f8de329c	11	25	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
4d540988-273f-462b-872c-7cedc507f27d	4	24	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
52292aa7-5e14-4171-b7f4-76d88a289f26	2	12	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
5393b9bd-3d18-4ba7-8415-6fb99545ffd8	9	9	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
54b9d8de-4d5d-4db1-929a-031cfd47756e	12	3	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
5612619d-942a-4abc-8de5-54be306bc475	12	25	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
56f15811-783b-4730-92a4-9eb194211aab	9	23	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
57c13d6f-eb87-4c67-8bcc-d383f77f22a8	1	14	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
59415541-b00b-46c4-bb2d-2f6b65af6921	5	7	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
5f84b8ed-e651-45c3-9e3d-fa82cd32f4ff	8	6	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
5fe53bc9-adc8-48e2-9bfb-ee8411d92c1b	9	16	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
62cbed19-cedb-41c8-bf78-4104b8a4d82f	6	10	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
647ae394-8947-40e9-8e02-9b4d1eb68f44	5	6	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
65f7d0e5-afed-4f8c-8840-8b3c57e041f3	2	5	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
6effa626-f305-4a2e-9b46-215975b2e646	9	24	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
7086792c-6ce9-4e51-b8ba-63fbab97c520	9	17	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
72444f84-bf7d-4223-ab6c-a5ac43b03398	4	8	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
72b2f145-8eb7-47c1-9204-eab1eebe621c	7	2	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
734b321b-7b50-4c87-8e73-f0ba805d786d	5	1	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
73cc5088-6557-467b-80d4-06f791ae905b	7	30	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
7b01d2a9-8475-40e0-9f1a-ff187143f0b0	1	1	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8131dc96-4ad7-43c7-bbdf-15017786e186	4	16	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
82713d3a-9102-48ca-a7ac-141d3976fc82	10	7	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
85e365c2-ed69-4aec-89ae-0e58bd1ef361	3	5	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8706ee2c-2714-44d4-bed8-245e7bed040d	6	24	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8783bdc0-6c8a-48e2-a9e5-851e88aa35fc	7	1	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8cf9452d-988e-43be-a50c-4d99a72a924e	8	5	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8cfb0a46-2dcf-4cd3-9701-3bac0d9cdd0b	6	3	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8e4c9f63-163e-42a9-bc6a-236e910f560e	11	12	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
8e5d5c58-991a-4cd4-b3a1-88931a6eb504	9	3	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
937faf18-d861-413b-baa4-16bbc2c96a8f	10	1	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
98cdee44-aae8-457d-8e9d-11a14f87cd14	5	9	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
98e8bcb6-4b03-4644-a1ce-1fcb6cc4acd2	8	19	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
997c3314-752d-4335-9336-f22ea6840ab4	10	29	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
9a73150f-1bdb-4b06-bbcf-694703db695b	7	29	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
9b20588e-17f5-41cc-be9c-38f272060e73	5	20	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
9ba90f6b-3dbf-4d47-b00d-775f5a47fa1c	10	8	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
9e861aec-0d67-4b3c-aa21-8e3e12973191	3	7	t	d466fed3-aad8-479f-962f-9d0af9b83836	\N
a29af889-75b2-45a7-a598-1309e6272439	11	7	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
a3834913-402d-4c51-b9ce-876bde921982	4	25	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
a4cfbf4f-fecf-4993-ba67-aab6e4648235	9	10	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
a4f70d90-eeea-44cb-b713-272478e7c7ac	4	2	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
a7f89f1a-3306-4c2e-8676-b095664d6fae	4	30	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ab7fda43-37f3-4a43-84f4-2151da0e73ec	2	19	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ae2940a8-c944-4168-870f-a4f487009ebe	1	21	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
aea9c6da-dab7-430e-a159-de46a567d5ce	5	21	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
aef50479-3cb0-4667-ac55-03bbed98b34a	12	9	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
af6c88e2-59c4-41ff-8f7e-1bb7f90c90e5	10	28	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
b2fff2e2-af1a-40f8-9560-dcca25282215	8	13	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
b360b69c-fd05-4b2c-993c-12d8567136f2	7	9	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
b903a518-ee4e-4114-9041-dcd59d62cb19	1	6	t	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ba742d0d-c434-412b-9d26-db9f72f69e8d	7	22	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
bb45fbc6-aedc-453e-b060-669d1143bfc0	4	9	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
be27463d-c1be-4a75-9a52-e428683409f8	4	23	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
bed27a4d-b19c-425b-8214-3147020a11eb	4	29	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c29d993f-5efd-4fb0-981e-12a536e36970	11	11	t	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c3827e1f-f3e4-41bb-a318-82d2141fd62b	6	25	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c5390e96-1785-42fa-b27f-96b398e9cb50	11	18	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c56a21da-ee53-4ec1-bd1e-f3c00efb267b	7	16	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c87916c7-a6a1-40e7-82b9-63b2b5aad1a4	1	15	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c9144adf-be9d-4f80-8c59-30c91ceca4ce	5	13	t	d466fed3-aad8-479f-962f-9d0af9b83836	\N
c9a31dea-6140-4971-ba78-04e20e4ac020	6	18	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ca058b44-e891-4f71-b972-55d591bcc6e6	1	29	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ca3b2e19-78c8-4538-8a9c-4df425ccd005	8	20	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ca50bbd8-f66d-4d46-89c5-54c638688fce	11	5	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
cad5c7c7-2fc7-48df-af17-f55726eac529	4	15	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
cfddfdba-e3df-4257-907e-69b331f78533	10	22	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
d33a62f1-2698-4a9f-9b44-8d06075f90f6	6	4	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
d656b77f-3abe-475f-a50d-6ec4be1c9ce7	2	4	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
d861505b-0703-480c-b2a6-bcbe6c16f2ae	1	28	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
d9e91144-9deb-4e2b-a539-fd0c7c6ac7d9	10	14	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e35f4d51-660a-49af-a704-41a7ae47a274	4	1	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e40b4327-bfe9-413e-9b7c-a57496d88efa	5	27	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e5bf1898-f6c9-43d2-b991-9d91eeedc6ca	12	2	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e64bbe53-41fd-4754-a16b-132c072730c4	12	17	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e756e598-ef0d-44bb-a697-aab0a30de011	11	6	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e802db6a-32ad-48c9-8d63-d6dfb608ecb5	3	26	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
e846b279-77ea-4ed4-b4de-1ec121903c17	6	17	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ea676568-a9c7-4ff8-8307-bb770379a3a5	8	27	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
eeec77e2-2ca7-40a1-b651-6a2e6b002ed9	2	18	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
efa95b63-a1f9-4c59-a810-6d0429ea2c11	9	30	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
f2fb9bce-6a96-44fd-932c-943665d2a5e7	12	24	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
f67b139a-9460-469d-864a-ff995c2740e7	7	23	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
f779baf5-4b47-4361-ae0c-33654313eb41	8	12	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
fde93cd8-8e4f-44dc-af9c-dc4b15271e61	2	25	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
fe601c62-f64b-4280-b5b7-dc4987e2c93d	11	4	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
ff217755-c1a2-4240-9fea-ab7f5daddc25	11	19	f	d466fed3-aad8-479f-962f-9d0af9b83836	\N
\.


--
-- Data for Name: DefectiveReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DefectiveReasons" ("Id", "DetectedDefectiveDate", "Reason", "DetectedDefects", "WeldingTaskId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
083f9c66-fa13-4af5-a63a-403d6943def5	Отсутствие крана, транспорта	\N
16d22407-96fb-41ef-adf4-68d0db28c7e3	Сборочные операции	\N
274018f5-df28-4688-b96c-0558af360a64	Естественные надобности	\N
425fc8c5-4212-4a6c-af44-ed28c76151d6	Установка, выверка, снятие детали	\N
4fb29bb4-30ab-4b7c-9a20-df085a7a44af	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
5ed18223-fea3-4da8-bce7-bf6ce5b6a3f5	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
6092f021-7f2a-4350-9dd3-de339547916f	Нерабочее время по графику согласно сменности	\N
705f889f-121a-485a-9626-2877561b4028	Отсутствие материала, заготовок, деталей	\N
74a76f1e-0a6c-4a77-88dd-f28d3f5a5160	Установка, выверка, снятие детали	\N
788c6227-ab7e-4dfb-bcc6-1cd00a7bb2f5	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
795c3b4e-877b-4166-95b5-2fa04198f0d3	Отсутствие сотрудника ОТК	\N
8c531223-7b7a-433f-87c1-555fa3b4dd11	Работа по карте несоответствий	\N
9204c10c-9a86-41aa-9cc6-79576966ecaf	Контроль на рабочем месте	\N
94b99154-e187-4ec4-aaaf-6bd0d3638d10	Неявка оператора (б/лист, отпуск, и пр.)	\N
9e1f03b8-e9b3-4893-bc1a-f2ed31b0eaf7	Изменение режимов, смена инструмента, приспособления	\N
9fe38918-edb6-4e55-8e56-41dc9e9afc92	Обед	\N
b920402d-0a72-4f74-ba0c-61ba6025e669	Отсутствие оператора в связи с необеспеченностью	\N
ba16cd2d-0661-4975-b5bf-9c69eb0e22f5	Аварийный ремонт централизованными службами	\N
bdcdaca5-6aa8-4e46-a77d-68c7be1a60fe	Отсутствие заданий	\N
d3a6c727-879b-4d1e-b35f-d85be8034d81	Праздники и выходные	\N
dba9dd4c-578d-4802-b07f-a4cb7d05380f	Отсутствие конструктора, технолога или ожидание его решения	\N
de5a137a-5268-439b-a324-1a86de766021	Отсутствие энергоносителей	\N
dff527e2-d57a-4e4f-b1ff-b4f36f58d376	Ознакомление с работой, документацией, инструктаж	\N
e68c0180-280c-4284-a440-185f9237f20e	Плановый ремонт централизованными службами	\N
e8919b88-2c64-4e49-9064-be190aa92ccc	Работа с управляющей программой	\N
\.


--
-- Data for Name: EventLogs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."EventLogs" ("Id", "Information", "DateTime", "UserId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: Inspectors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Inspectors" ("Id", "UserId", "IdFromSystem") FROM stdin;
1387e1d0-78db-4e75-80e6-c4562a6065ef	8b74f8e7-008d-45a2-a175-c7108ed96ef7	249550
eea8a88c-1ca8-492b-a95e-7f5c3fce6d25	c1207987-26c9-4489-90ab-ee25cb88d2db	219379
3aa6f081-ce03-4a07-9cb5-1ad930aafaf9	3400650a-8688-4e44-a504-a22b623b5e9c	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
276b959d-94a3-49d7-89dc-c6c27a9a7a7b	ce11cd89-6ad6-48e9-a8d1-52213ba9181f	614962
c93e934f-e4d9-4d56-a427-5e9bc100f2bc	1a0ca3e9-1c3a-4fa4-b3fb-21d068213bc7	610422
cc7e13b0-7e83-4a8d-b02b-5e5ea3e1d3d9	846e2e7c-2af4-4e5e-ba27-2abe5efee843	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductAccountWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccountWeldingEquipment" ("ProductAccountsId", "WeldingEquipmentsId") FROM stdin;
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
42cae60e-177a-450a-a42d-09a2c42032b3	986c8132-3b1a-4bb1-a4f3-ae6f74af9f95
ee3200ba-9064-4015-b917-869087d10f2b	9e866953-1041-4eb9-84a8-bf35ad2b47f9
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
92572b8b-5b02-4a23-a5ee-b2c11f40d953	Сборка, сварка рам к/с г/п 120-130 т.	6	a0b29c6f-d4ea-4d68-b584-31b519469891	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ManufacturingTime", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
42cae60e-177a-450a-a42d-09a2c42032b3	Рама	7513D-2800010-20	t	10	1	bc7b2d88-cd0c-4f58-8d80-54789dec6380	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N	\N	4536492774
986c8132-3b1a-4bb1-a4f3-ae6f74af9f95	Поперечина рамы задняя	75131-2801300-20	t	20	2	bc7b2d88-cd0c-4f58-8d80-54789dec6380	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N	\N	\N
9e866953-1041-4eb9-84a8-bf35ad2b47f9	Поперечина рамы задняя	75131-2801300-20	t	41	2	54ecf52e-f34e-483d-8ef4-4bdba9e2409d	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N	\N	\N
ee3200ba-9064-4015-b917-869087d10f2b	Рама	75131-2800010-70	t	11	1	54ecf52e-f34e-483d-8ef4-4bdba9e2409d	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N	\N	4536479362
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
021e83e0-4b13-477d-8d0e-1c47de364190	55	400	t	f	ee3200ba-9064-4015-b917-869087d10f2b	d7671bd8-29de-4413-821c-7cbcd08cff96	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
05c48ae5-19f9-42d7-8b34-10df61b60e0f	39	280	t	f	42cae60e-177a-450a-a42d-09a2c42032b3	865b8871-4169-4a22-8929-2cb9cf2309c3	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
0c6046a7-4f80-4bfc-8a41-50e4562b8231	1	1900	t	f	986c8132-3b1a-4bb1-a4f3-ae6f74af9f95	334672c7-9334-46ca-a7af-ef09a9fd5670	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
1c0507cd-5b64-4022-9377-54dd4d1ca4ce	57	400	t	f	42cae60e-177a-450a-a42d-09a2c42032b3	701423b0-49f5-48a9-8d6d-7b82d983223d	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
43befaa0-3c90-4cb3-8a6b-b7f092961f89	54	400	t	f	ee3200ba-9064-4015-b917-869087d10f2b	09480995-6e58-4f95-adfa-1d5399f59031	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
54d2aadb-1d44-4338-a0b7-8516eb172dbe	58	900	t	f	42cae60e-177a-450a-a42d-09a2c42032b3	bb347afa-5dc3-4876-8f01-87e06ab21bcb	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
5edd6d86-231b-4408-9d0f-213180f7349e	2	1880	t	f	9e866953-1041-4eb9-84a8-bf35ad2b47f9	256f57ca-e491-4857-9fed-ed16182652a4	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
72e3b173-3e66-48e6-943f-395e53ce292c	39	280	t	f	ee3200ba-9064-4015-b917-869087d10f2b	865b8871-4169-4a22-8929-2cb9cf2309c3	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
8033099d-ce1a-4d22-9b34-67447ad35b8d	18	4000	t	f	ee3200ba-9064-4015-b917-869087d10f2b	125a4b85-fa6f-4acd-af0c-c8009f09d017	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
8a483cc4-7cb2-4b88-9f39-b2959a255664	55	400	t	f	42cae60e-177a-450a-a42d-09a2c42032b3	d7671bd8-29de-4413-821c-7cbcd08cff96	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
91eaf72d-c228-4e3e-aeac-c5404403ee48	58	900	t	f	ee3200ba-9064-4015-b917-869087d10f2b	bb347afa-5dc3-4876-8f01-87e06ab21bcb	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
9c0072b5-d54f-4617-be2e-c1950a68c8ab	52	1200	t	f	9e866953-1041-4eb9-84a8-bf35ad2b47f9	692845c7-b2de-4ccf-be25-013f76129b0d	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
a98b4f82-e27f-4114-ab46-f7e4aebe691a	57	400	t	f	ee3200ba-9064-4015-b917-869087d10f2b	701423b0-49f5-48a9-8d6d-7b82d983223d	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
b8614352-61b2-4305-9f60-4c060e79d575	2	1880	t	f	986c8132-3b1a-4bb1-a4f3-ae6f74af9f95	256f57ca-e491-4857-9fed-ed16182652a4	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
ba4d33ab-315a-4584-9da4-0510f8df1bce	18	4000	t	f	42cae60e-177a-450a-a42d-09a2c42032b3	125a4b85-fa6f-4acd-af0c-c8009f09d017	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
c007c188-94eb-4ae0-8cc0-1c3af760ab11	54	400	t	f	42cae60e-177a-450a-a42d-09a2c42032b3	09480995-6e58-4f95-adfa-1d5399f59031	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
cd2dd2d5-272f-4b21-96fc-728e1e072c27	1	1900	t	f	9e866953-1041-4eb9-84a8-bf35ad2b47f9	334672c7-9334-46ca-a7af-ef09a9fd5670	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
f00d9d27-7943-4de4-b59d-3fa2766b93eb	52	1200	t	f	986c8132-3b1a-4bb1-a4f3-ae6f74af9f95	692845c7-b2de-4ccf-be25-013f76129b0d	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
09480995-6e58-4f95-adfa-1d5399f59031	54	Инструкция 54	54
125a4b85-fa6f-4acd-af0c-c8009f09d017	18	Инструкция 18	18
256f57ca-e491-4857-9fed-ed16182652a4	2	Инструкция 2	2
334672c7-9334-46ca-a7af-ef09a9fd5670	1	Инструкция 1	1
692845c7-b2de-4ccf-be25-013f76129b0d	52	Инструкция 52	52
701423b0-49f5-48a9-8d6d-7b82d983223d	57	Инструкция 57	57
865b8871-4169-4a22-8929-2cb9cf2309c3	39	Инструкция 39	39
8bf16eb3-bad9-4e3b-9abb-fe7157c6c07f	48	Инструкция 48	48
ab62d96f-97e8-437b-aa0f-f3f978e90d5d	56	Инструкция 56	56
bb347afa-5dc3-4876-8f01-87e06ab21bcb	58	Инструкция 58	58
d7671bd8-29de-4413-821c-7cbcd08cff96	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
45014f63-10e7-4b22-9456-499af73b0efb	75131-2801300-20	Поперечина рамы задняя	\N	2868425
54ecf52e-f34e-483d-8ef4-4bdba9e2409d	75131-2800010-70	Рама	\N	3291137
bc7b2d88-cd0c-4f58-8d80-54789dec6380	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "IsEmailConfirmed", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "Role", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
8b74f8e7-008d-45a2-a175-c7108ed96ef7	Екатерина	Сергеевна	Грук	\N	\N	f	\N	Контролер сварочных работ	49550	\N	4	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
c1207987-26c9-4489-90ab-ee25cb88d2db	Мария	Николаевна	Шабалинская	\N	\N	f	\N	Контролер сварочных работ	19379	\N	4	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
1a0ca3e9-1c3a-4fa4-b3fb-21d068213bc7	Сергей	Николаевич	Беляцкий	\N	\N	f	\N	Мастер производственного участка	10422	\N	2	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
ce11cd89-6ad6-48e9-a8d1-52213ba9181f	Геннадий	Александрович	Алёксов	\N	\N	f	\N	Мастер производственного участка	14962	\N	2	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
249f30e1-59a8-48a6-89ec-398860aee321	Валерий	Сергеевич	Зубковский	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	97:17:60:B4
3a89a0a4-65c5-4af2-9375-86a4d9c99e2a	Юрий	Сергеевич	Буландо	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	17:CD:7F:5A
4ee7ef9e-04a0-4377-94ba-bd16346fc3e2	Василий	Владимирович	Казинец	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	B7:5A:79:B5
52f918f4-7243-423c-b9cf-7d8051393fca	Владимир	Францевич	Виторский	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	D7:95:55:B4
5a085bb5-1ae8-4df0-9b8c-ccb02bbb7864	Максим	Александрович	Костюкевич	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	67:CD:7E:5A
7e2c32c4-2b4e-4cc7-8b76-8325eeacd32c	Сергей	Анатольевич	Казачёнок	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	67:5A:70:B4
9f930d75-4f22-446f-b8b7-e89f54e4de44	Александр	Васильевич	Михейчик	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	27:45:7E:B4
ffd11cb1-c6d1-47d6-bdda-aca13c32e774	Виталий	Владимирович	Казинец	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	3	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	D7:F1:7D:5A
16aab4da-7be4-41e8-9501-e449a0f58b97	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	f	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	5	\N	\N	RFID метка начальника цеха 1
de3a8584-f7eb-49ad-a279-bac3bc8d6aa1	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	f	$MYHASH$V1$10000$8bkRoOq4xuMcGmELs2pWtHoHBbXZC1YpGFt5eZZ9uo1XVNu+	\N	\N	\N	1	\N	\N	\N
b65de5c6-2f3c-421f-a2cf-d9d5b1a5922c	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	f	$MYHASH$V1$10000$yTH0mysBNWkPC1NvzHelPNw0np6o71H+AWZPJjpaw0+yVLzH	\N	\N	\N	3	\N	\N	\N
3400650a-8688-4e44-a504-a22b623b5e9c	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	f	$MYHASH$V1$10000$xN4G8QRZb0I8iYw3icRZYjWpEuUgiINigMq1Qhsc+eT8xdkX	\N	\N	\N	4	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
26a061a4-3176-42ed-a434-942f452af341	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	f	$MYHASH$V1$10000$oNKhsWrSoKA9TeideEw3E37/EiuqgNDhAGjc/C8klbG3x+18	\N	\N	\N	5	\N	\N	\N
846e2e7c-2af4-4e5e-ba27-2abe5efee843	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	f	$MYHASH$V1$10000$oTqZnvl4ymV1vdOw2CZsSgxncW1dsomuh+4bbyaDSf3YWWUy	\N	\N	\N	2	92572b8b-5b02-4a23-a5ee-b2c11f40d953	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0c4a9c6b-2a21-4bf8-a689-f92838d457aa	1	Корневой	200	270	23	26	\N	\N	09480995-6e58-4f95-adfa-1d5399f59031	\N
0d7086dd-c1b3-4f55-8e14-92ab492aa2ae	2	Заполняющий	270	310	23	26	\N	\N	692845c7-b2de-4ccf-be25-013f76129b0d	\N
152613bd-a33b-4776-9d19-253abebab72a	1	Корневой	200	270	23	26	\N	\N	8bf16eb3-bad9-4e3b-9abb-fe7157c6c07f	\N
3205e632-0619-4946-9835-667439f85eac	1	Корневой	200	270	23	26	\N	\N	334672c7-9334-46ca-a7af-ef09a9fd5670	\N
3aa8702d-dd7b-4e0b-b0c5-70409efe1cb1	2	Заполняющий	270	310	23	26	\N	\N	865b8871-4169-4a22-8929-2cb9cf2309c3	\N
3d5fc7cb-bb1a-427f-adc6-61883790ba22	1	Корневой	200	270	23	26	\N	\N	692845c7-b2de-4ccf-be25-013f76129b0d	\N
4d17bb50-4d30-4561-8b49-abccc26bd2c6	1	Корневой	200	270	23	26	\N	\N	865b8871-4169-4a22-8929-2cb9cf2309c3	\N
57a74844-5188-4019-8d31-237426e97d8c	2	Заполняющий	270	310	23	26	\N	\N	256f57ca-e491-4857-9fed-ed16182652a4	\N
5b25dbc0-f7be-4c95-a2ff-db76a75d06fe	2	Заполняющий	270	310	23	26	\N	\N	701423b0-49f5-48a9-8d6d-7b82d983223d	\N
90b8ece0-8834-43d8-a588-3305117538a9	2	Заполняющий	270	310	23	26	\N	\N	bb347afa-5dc3-4876-8f01-87e06ab21bcb	\N
a080eaa3-156c-41b8-8431-6852e2e15497	1	Корневой	200	270	23	26	\N	\N	256f57ca-e491-4857-9fed-ed16182652a4	\N
adf0ce0f-3bdf-4d5e-bddc-a337e1e4df8b	1	Корневой	200	270	23	26	\N	\N	701423b0-49f5-48a9-8d6d-7b82d983223d	\N
c3aa6a16-e4ac-4446-a1cf-e94e91006618	2	Заполняющий	270	310	23	26	\N	\N	334672c7-9334-46ca-a7af-ef09a9fd5670	\N
c7615150-dcf2-46b5-867b-f4414e5d30a3	1	Корневой	200	270	23	26	\N	\N	d7671bd8-29de-4413-821c-7cbcd08cff96	\N
d06cf6bc-75b8-4037-a1d7-86773dda233f	1	Корневой	200	270	23	26	\N	\N	ab62d96f-97e8-437b-aa0f-f3f978e90d5d	\N
ddd6edba-55ee-421c-b11c-41a267b1dff6	2	Заполняющий	270	310	23	26	\N	\N	125a4b85-fa6f-4acd-af0c-c8009f09d017	\N
e8a61707-8bd1-4b2b-a702-23da3bcdd60e	2	Заполняющий	270	310	23	26	\N	\N	09480995-6e58-4f95-adfa-1d5399f59031	\N
f40ea546-7c7b-4fd1-a2b7-35c85245eae5	2	Заполняющий	270	310	23	26	\N	\N	d7671bd8-29de-4413-821c-7cbcd08cff96	\N
f50441f8-2398-4b0b-9fba-9f86a1f5c453	2	Заполняющий	270	310	23	26	\N	\N	8bf16eb3-bad9-4e3b-9abb-fe7157c6c07f	\N
f5c048bb-d789-4e9d-aa39-9c5062f78cd9	1	Корневой	200	270	23	26	\N	\N	125a4b85-fa6f-4acd-af0c-c8009f09d017	\N
f9757c52-eeb8-47f9-8773-8c6516c145bf	2	Заполняющий	270	310	23	26	\N	\N	ab62d96f-97e8-437b-aa0f-f3f978e90d5d	\N
feb5c1c0-a19e-4878-9e71-d65901bfe9b6	1	Корневой	200	270	23	26	\N	\N	bb347afa-5dc3-4876-8f01-87e06ab21bcb	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "Estimation", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
25db4abe-0643-4c5d-851a-ef1d66aec72c	7f8ceaac-5353-48df-a7a6-030cf58ed36a
2b4a9dc7-8d64-4d9f-bad8-6f9d5053ed4e	7f8ceaac-5353-48df-a7a6-030cf58ed36a
41e60745-3006-4dcd-b0aa-a5487faede18	49dca54f-f925-471a-b036-8081f41d63c7
41e60745-3006-4dcd-b0aa-a5487faede18	88a1a5d5-db4d-4cdf-8046-c8f90025c69e
745b0f74-cde2-47f0-96d8-3bdbd040027e	49dca54f-f925-471a-b036-8081f41d63c7
745b0f74-cde2-47f0-96d8-3bdbd040027e	88a1a5d5-db4d-4cdf-8046-c8f90025c69e
867f1d73-4c4f-4337-b74c-90fd63348cb9	175b939e-d28a-46ad-9f2e-92f4d7cb2896
d65c2058-ed74-4fb3-aec0-6ad1239a927d	49dca54f-f925-471a-b036-8081f41d63c7
d65c2058-ed74-4fb3-aec0-6ad1239a927d	88a1a5d5-db4d-4cdf-8046-c8f90025c69e
d833e44d-5018-4c89-88e8-33d06c435b7f	175b939e-d28a-46ad-9f2e-92f4d7cb2896
fda1e5cc-3997-4601-8d3a-c46efb2d34bb	49dca54f-f925-471a-b036-8081f41d63c7
fda1e5cc-3997-4601-8d3a-c46efb2d34bb	88a1a5d5-db4d-4cdf-8046-c8f90025c69e
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
25db4abe-0643-4c5d-851a-ef1d66aec72c	4ee7ef9e-04a0-4377-94ba-bd16346fc3e2	\N	121267
2b4a9dc7-8d64-4d9f-bad8-6f9d5053ed4e	7e2c32c4-2b4e-4cc7-8b76-8325eeacd32c	\N	117390
41e60745-3006-4dcd-b0aa-a5487faede18	249f30e1-59a8-48a6-89ec-398860aee321	\N	150838
745b0f74-cde2-47f0-96d8-3bdbd040027e	ffd11cb1-c6d1-47d6-bdda-aca13c32e774	\N	114729
867f1d73-4c4f-4337-b74c-90fd63348cb9	5a085bb5-1ae8-4df0-9b8c-ccb02bbb7864	\N	122575
d65c2058-ed74-4fb3-aec0-6ad1239a927d	3a89a0a4-65c5-4af2-9375-86a4d9c99e2a	\N	150882
d833e44d-5018-4c89-88e8-33d06c435b7f	52f918f4-7243-423c-b9cf-7d8051393fca	\N	132695
fda1e5cc-3997-4601-8d3a-c46efb2d34bb	9f930d75-4f22-446f-b8b7-e89f54e4de44	\N	146164
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "WelderId", "DowntimeReasonId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingEquipmentWorkplace; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkplace" ("WeldingEquipmentsId", "WorkplacesId") FROM stdin;
175b939e-d28a-46ad-9f2e-92f4d7cb2896	52c51e71-82d7-4785-8f1c-75acb235d4c1
175b939e-d28a-46ad-9f2e-92f4d7cb2896	b155df6c-c51f-48f7-b2f3-df4b706aafe2
49dca54f-f925-471a-b036-8081f41d63c7	125a45fa-9264-4950-8167-885d8b5e0d27
49dca54f-f925-471a-b036-8081f41d63c7	50a38d2a-ca0f-40ff-9f80-e2a55e163474
49dca54f-f925-471a-b036-8081f41d63c7	b155df6c-c51f-48f7-b2f3-df4b706aafe2
49dca54f-f925-471a-b036-8081f41d63c7	fdcdf7c3-f5ee-4bba-824c-43b8955e48fe
7f8ceaac-5353-48df-a7a6-030cf58ed36a	c79ab09e-e669-4dbc-b4bb-066e9f11de86
7f8ceaac-5353-48df-a7a6-030cf58ed36a	fdcdf7c3-f5ee-4bba-824c-43b8955e48fe
88a1a5d5-db4d-4cdf-8046-c8f90025c69e	125a45fa-9264-4950-8167-885d8b5e0d27
88a1a5d5-db4d-4cdf-8046-c8f90025c69e	50a38d2a-ca0f-40ff-9f80-e2a55e163474
88a1a5d5-db4d-4cdf-8046-c8f90025c69e	b155df6c-c51f-48f7-b2f3-df4b706aafe2
88a1a5d5-db4d-4cdf-8046-c8f90025c69e	fdcdf7c3-f5ee-4bba-824c-43b8955e48fe
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
175b939e-d28a-46ad-9f2e-92f4d7cb2896	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	c93e934f-e4d9-4d56-a427-5e9bc100f2bc	49286	35:4E:AC:A5
49dca54f-f925-471a-b036-8081f41d63c7	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	c93e934f-e4d9-4d56-a427-5e9bc100f2bc	49283	A6:F1:CF:48
7f8ceaac-5353-48df-a7a6-030cf58ed36a	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	c93e934f-e4d9-4d56-a427-5e9bc100f2bc	49232	03:3D:93:0D
88a1a5d5-db4d-4cdf-8046-c8f90025c69e	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	c93e934f-e4d9-4d56-a427-5e9bc100f2bc	49141	93:57:D8:0B
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
2929e4b7-42b8-434a-a750-de4ab76afe55	1	07:30:00	16:00:00	12:00:00	12:30:00	\N	d466fed3-aad8-479f-962f-9d0af9b83836	\N
66615441-2058-4036-ac8f-65914acf7c6e	3	00:30:00	07:50:00	02:00:00	02:20:00	\N	d466fed3-aad8-479f-962f-9d0af9b83836	\N
efca7c3d-adb6-46d3-97c8-63494c41064f	2	16:00:00	00:30:00	20:00:00	20:30:00	\N	d466fed3-aad8-479f-962f-9d0af9b83836	\N
181d6435-5e4e-47a6-94f0-4165731ad65d	2	16:00:00	23:30:00	20:00:00	20:30:00	05cffb4c-4bf0-4ba6-a491-dcdea46733f5	\N	\N
1a4fd242-067f-4211-80c3-4c421b832dfe	1	07:30:00	15:00:00	12:00:00	12:30:00	b903a518-ee4e-4114-9041-dcd59d62cb19	\N	\N
1c68817c-f846-4656-a734-25fc50b3e98c	3	00:30:00	06:50:00	02:00:00	02:20:00	b903a518-ee4e-4114-9041-dcd59d62cb19	\N	\N
236fccca-cf2a-4bf9-9a9b-15adc226a6b6	2	16:00:00	23:30:00	20:00:00	20:30:00	b903a518-ee4e-4114-9041-dcd59d62cb19	\N	\N
25c9921b-d6b4-41a4-b173-73c4591a4980	3	00:30:00	06:50:00	02:00:00	02:20:00	c29d993f-5efd-4fb0-981e-12a536e36970	\N	\N
2ff18c5c-9e89-4bb4-954b-d7708b85eab0	2	16:00:00	23:30:00	20:00:00	20:30:00	c29d993f-5efd-4fb0-981e-12a536e36970	\N	\N
3944974e-3959-4090-8149-866dfcf2a895	1	07:30:00	15:00:00	12:00:00	12:30:00	9e861aec-0d67-4b3c-aa21-8e3e12973191	\N	\N
43443ed5-07e8-4107-a1c1-4eca1d614e7c	2	16:00:00	23:30:00	20:00:00	20:30:00	c9144adf-be9d-4f80-8c59-30c91ceca4ce	\N	\N
49ff6111-de90-491a-8eaf-bf954c0f6552	1	07:30:00	15:00:00	12:00:00	12:30:00	c29d993f-5efd-4fb0-981e-12a536e36970	\N	\N
7888d898-51dd-436a-9a0a-dc4d01a7d5ee	1	07:30:00	15:00:00	12:00:00	12:30:00	05cffb4c-4bf0-4ba6-a491-dcdea46733f5	\N	\N
7c63977a-c860-4771-a64a-3a1059459bae	3	00:30:00	06:50:00	02:00:00	02:20:00	c9144adf-be9d-4f80-8c59-30c91ceca4ce	\N	\N
b137dcbe-8d38-4848-873d-68f972e062f0	1	07:30:00	15:00:00	12:00:00	12:30:00	c9144adf-be9d-4f80-8c59-30c91ceca4ce	\N	\N
b281a718-e8d2-4206-b7a5-8547c0a07e89	3	00:30:00	06:50:00	02:00:00	02:20:00	9e861aec-0d67-4b3c-aa21-8e3e12973191	\N	\N
cfb559c7-0977-4fd0-bd03-3034b116ff55	3	00:30:00	06:50:00	02:00:00	02:20:00	05cffb4c-4bf0-4ba6-a491-dcdea46733f5	\N	\N
de2c172d-0db8-4ec7-be6f-f1fc68a7f294	2	16:00:00	23:30:00	20:00:00	20:30:00	9e861aec-0d67-4b3c-aa21-8e3e12973191	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
125a45fa-9264-4950-8167-885d8b5e0d27	3690	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	3690
50a38d2a-ca0f-40ff-9f80-e2a55e163474	3550	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	3550
52c51e71-82d7-4785-8f1c-75acb235d4c1	3510	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	3510
b155df6c-c51f-48f7-b2f3-df4b706aafe2	3500	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	3500
c79ab09e-e669-4dbc-b4bb-066e9f11de86	3600	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	3600
fdcdf7c3-f5ee-4bba-824c-43b8955e48fe	3610	\N	92572b8b-5b02-4a23-a5ee-b2c11f40d953	3610
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
a0b29c6f-d4ea-4d68-b584-31b519469891	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 1, false);


--
-- Name: Calendars PK_Calendars; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Calendars"
    ADD CONSTRAINT "PK_Calendars" PRIMARY KEY ("Id");


--
-- Name: Chiefs PK_Chiefs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chiefs"
    ADD CONSTRAINT "PK_Chiefs" PRIMARY KEY ("Id");


--
-- Name: Days PK_Days; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Days"
    ADD CONSTRAINT "PK_Days" PRIMARY KEY ("Id");


--
-- Name: DefectiveReasons PK_DefectiveReasons; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DefectiveReasons"
    ADD CONSTRAINT "PK_DefectiveReasons" PRIMARY KEY ("Id");


--
-- Name: DowntimeReasons PK_DowntimeReasons; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DowntimeReasons"
    ADD CONSTRAINT "PK_DowntimeReasons" PRIMARY KEY ("Id");


--
-- Name: EventLogs PK_EventLogs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EventLogs"
    ADD CONSTRAINT "PK_EventLogs" PRIMARY KEY ("Id");


--
-- Name: Inspectors PK_Inspectors; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Inspectors"
    ADD CONSTRAINT "PK_Inspectors" PRIMARY KEY ("Id");


--
-- Name: Masters PK_Masters; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Masters"
    ADD CONSTRAINT "PK_Masters" PRIMARY KEY ("Id");


--
-- Name: Posts PK_Posts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "PK_Posts" PRIMARY KEY ("Id");


--
-- Name: ProductAccountWeldingEquipment PK_ProductAccountWeldingEquipment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccountWeldingEquipment"
    ADD CONSTRAINT "PK_ProductAccountWeldingEquipment" PRIMARY KEY ("ProductAccountsId", "WeldingEquipmentsId");


--
-- Name: ProductAccounts PK_ProductAccounts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccounts"
    ADD CONSTRAINT "PK_ProductAccounts" PRIMARY KEY ("Id");


--
-- Name: ProductInsides PK_ProductInsides; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductInsides"
    ADD CONSTRAINT "PK_ProductInsides" PRIMARY KEY ("InsideProductId", "MainProductId");


--
-- Name: ProductResults PK_ProductResults; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductResults"
    ADD CONSTRAINT "PK_ProductResults" PRIMARY KEY ("Id");


--
-- Name: ProductionAreas PK_ProductionAreas; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductionAreas"
    ADD CONSTRAINT "PK_ProductionAreas" PRIMARY KEY ("Id");


--
-- Name: Products PK_Products; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "PK_Products" PRIMARY KEY ("Id");


--
-- Name: SeamAccounts PK_SeamAccounts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamAccounts"
    ADD CONSTRAINT "PK_SeamAccounts" PRIMARY KEY ("Id");


--
-- Name: SeamResults PK_SeamResults; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamResults"
    ADD CONSTRAINT "PK_SeamResults" PRIMARY KEY ("Id");


--
-- Name: Seams PK_Seams; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "PK_Seams" PRIMARY KEY ("Id");


--
-- Name: TechnologicalInstructions PK_TechnologicalInstructions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstructions"
    ADD CONSTRAINT "PK_TechnologicalInstructions" PRIMARY KEY ("Id");


--
-- Name: TechnologicalProcesses PK_TechnologicalProcesses; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalProcesses"
    ADD CONSTRAINT "PK_TechnologicalProcesses" PRIMARY KEY ("Id");


--
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- Name: WeldPassageInstructions PK_WeldPassageInstructions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassageInstructions"
    ADD CONSTRAINT "PK_WeldPassageInstructions" PRIMARY KEY ("Id");


--
-- Name: WeldPassages PK_WeldPassages; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "PK_WeldPassages" PRIMARY KEY ("Id");


--
-- Name: WelderWeldingEquipment PK_WelderWeldingEquipment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WelderWeldingEquipment"
    ADD CONSTRAINT "PK_WelderWeldingEquipment" PRIMARY KEY ("WeldersId", "WeldingEquipmentsId");


--
-- Name: Welders PK_Welders; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "PK_Welders" PRIMARY KEY ("Id");


--
-- Name: WeldingEquipmentConditionTimes PK_WeldingEquipmentConditionTimes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentConditionTimes"
    ADD CONSTRAINT "PK_WeldingEquipmentConditionTimes" PRIMARY KEY ("Id");


--
-- Name: WeldingEquipmentWorkplace PK_WeldingEquipmentWorkplace; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkplace"
    ADD CONSTRAINT "PK_WeldingEquipmentWorkplace" PRIMARY KEY ("WeldingEquipmentsId", "WorkplacesId");


--
-- Name: WeldingEquipments PK_WeldingEquipments; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "PK_WeldingEquipments" PRIMARY KEY ("Id");


--
-- Name: WeldingRecords PK_WeldingRecords; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "PK_WeldingRecords" PRIMARY KEY ("Id");


--
-- Name: WeldingTasks PK_WeldingTasks; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "PK_WeldingTasks" PRIMARY KEY ("Id");


--
-- Name: WorkingShifts PK_WorkingShifts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WorkingShifts"
    ADD CONSTRAINT "PK_WorkingShifts" PRIMARY KEY ("Id");


--
-- Name: Workplaces PK_Workplaces; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workplaces"
    ADD CONSTRAINT "PK_Workplaces" PRIMARY KEY ("Id");


--
-- Name: Workshops PK_Workshops; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workshops"
    ADD CONSTRAINT "PK_Workshops" PRIMARY KEY ("Id");


--
-- Name: IX_Calendars_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Calendars_IdFromSystem" ON public."Calendars" USING btree ("IdFromSystem");


--
-- Name: IX_Calendars_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Calendars_WelderId" ON public."Calendars" USING btree ("WelderId");


--
-- Name: IX_Calendars_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Calendars_WeldingEquipmentId" ON public."Calendars" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Chiefs_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Chiefs_IdFromSystem" ON public."Chiefs" USING btree ("IdFromSystem");


--
-- Name: IX_Chiefs_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Chiefs_UserId" ON public."Chiefs" USING btree ("UserId");


--
-- Name: IX_Chiefs_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Chiefs_WeldingEquipmentId" ON public."Chiefs" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Chiefs_WorkshopId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Chiefs_WorkshopId" ON public."Chiefs" USING btree ("WorkshopId");


--
-- Name: IX_Days_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Days_CalendarId" ON public."Days" USING btree ("CalendarId");


--
-- Name: IX_Days_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Days_IdFromSystem" ON public."Days" USING btree ("IdFromSystem");


--
-- Name: IX_DefectiveReasons_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_DefectiveReasons_IdFromSystem" ON public."DefectiveReasons" USING btree ("IdFromSystem");


--
-- Name: IX_DefectiveReasons_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_DefectiveReasons_WeldingTaskId" ON public."DefectiveReasons" USING btree ("WeldingTaskId");


--
-- Name: IX_DowntimeReasons_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_DowntimeReasons_IdFromSystem" ON public."DowntimeReasons" USING btree ("IdFromSystem");


--
-- Name: IX_EventLogs_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_EventLogs_IdFromSystem" ON public."EventLogs" USING btree ("IdFromSystem");


--
-- Name: IX_EventLogs_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_EventLogs_UserId" ON public."EventLogs" USING btree ("UserId");


--
-- Name: IX_Inspectors_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Inspectors_IdFromSystem" ON public."Inspectors" USING btree ("IdFromSystem");


--
-- Name: IX_Inspectors_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Inspectors_UserId" ON public."Inspectors" USING btree ("UserId");


--
-- Name: IX_Masters_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Masters_IdFromSystem" ON public."Masters" USING btree ("IdFromSystem");


--
-- Name: IX_Masters_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Masters_UserId" ON public."Masters" USING btree ("UserId");


--
-- Name: IX_Posts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Posts_IdFromSystem" ON public."Posts" USING btree ("IdFromSystem");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_ProductAccountWeldingEquipment_WeldingEquipmentsId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductAccountWeldingEquipment_WeldingEquipmentsId" ON public."ProductAccountWeldingEquipment" USING btree ("WeldingEquipmentsId");


--
-- Name: IX_ProductAccounts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductAccounts_IdFromSystem" ON public."ProductAccounts" USING btree ("IdFromSystem");


--
-- Name: IX_ProductAccounts_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductAccounts_ProductId" ON public."ProductAccounts" USING btree ("ProductId");


--
-- Name: IX_ProductInsides_InsideProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductInsides_InsideProductId" ON public."ProductInsides" USING btree ("InsideProductId");


--
-- Name: IX_ProductInsides_MainProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductInsides_MainProductId" ON public."ProductInsides" USING btree ("MainProductId");


--
-- Name: IX_ProductResults_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductResults_IdFromSystem" ON public."ProductResults" USING btree ("IdFromSystem");


--
-- Name: IX_ProductResults_ProductAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductResults_ProductAccountId" ON public."ProductResults" USING btree ("ProductAccountId");


--
-- Name: IX_ProductionAreas_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductionAreas_IdFromSystem" ON public."ProductionAreas" USING btree ("IdFromSystem");


--
-- Name: IX_ProductionAreas_WorkshopId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductionAreas_WorkshopId" ON public."ProductionAreas" USING btree ("WorkshopId");


--
-- Name: IX_Products_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Products_IdFromSystem" ON public."Products" USING btree ("IdFromSystem");


--
-- Name: IX_Products_InspectorId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_InspectorId" ON public."Products" USING btree ("InspectorId");


--
-- Name: IX_Products_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_MasterId" ON public."Products" USING btree ("MasterId");


--
-- Name: IX_Products_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_ProductionAreaId" ON public."Products" USING btree ("ProductionAreaId");


--
-- Name: IX_Products_TechnologicalProcessId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_TechnologicalProcessId" ON public."Products" USING btree ("TechnologicalProcessId");


--
-- Name: IX_Products_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_WorkplaceId" ON public."Products" USING btree ("WorkplaceId");


--
-- Name: IX_SeamAccounts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_SeamAccounts_IdFromSystem" ON public."SeamAccounts" USING btree ("IdFromSystem");


--
-- Name: IX_SeamAccounts_ProductAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamAccounts_ProductAccountId" ON public."SeamAccounts" USING btree ("ProductAccountId");


--
-- Name: IX_SeamAccounts_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamAccounts_SeamId" ON public."SeamAccounts" USING btree ("SeamId");


--
-- Name: IX_SeamResults_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_SeamResults_IdFromSystem" ON public."SeamResults" USING btree ("IdFromSystem");


--
-- Name: IX_SeamResults_SeamAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamResults_SeamAccountId" ON public."SeamResults" USING btree ("SeamAccountId");


--
-- Name: IX_Seams_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Seams_IdFromSystem" ON public."Seams" USING btree ("IdFromSystem");


--
-- Name: IX_Seams_InspectorId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_InspectorId" ON public."Seams" USING btree ("InspectorId");


--
-- Name: IX_Seams_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_ProductId" ON public."Seams" USING btree ("ProductId");


--
-- Name: IX_Seams_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_ProductionAreaId" ON public."Seams" USING btree ("ProductionAreaId");


--
-- Name: IX_Seams_TechnologicalInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_TechnologicalInstructionId" ON public."Seams" USING btree ("TechnologicalInstructionId");


--
-- Name: IX_Seams_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_WorkplaceId" ON public."Seams" USING btree ("WorkplaceId");


--
-- Name: IX_TechnologicalInstructions_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstructions_IdFromSystem" ON public."TechnologicalInstructions" USING btree ("IdFromSystem");


--
-- Name: IX_TechnologicalProcesses_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalProcesses_IdFromSystem" ON public."TechnologicalProcesses" USING btree ("IdFromSystem");


--
-- Name: IX_Users_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Users_IdFromSystem" ON public."Users" USING btree ("IdFromSystem");


--
-- Name: IX_Users_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Users_ProductionAreaId" ON public."Users" USING btree ("ProductionAreaId");


--
-- Name: IX_Users_RfidTag; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Users_RfidTag" ON public."Users" USING btree ("RfidTag");


--
-- Name: IX_WeldPassageInstructions_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassageInstructions_IdFromSystem" ON public."WeldPassageInstructions" USING btree ("IdFromSystem");


--
-- Name: IX_WeldPassageInstructions_TechnologicalInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassageInstructions_TechnologicalInstructionId" ON public."WeldPassageInstructions" USING btree ("TechnologicalInstructionId");


--
-- Name: IX_WeldPassages_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassages_IdFromSystem" ON public."WeldPassages" USING btree ("IdFromSystem");


--
-- Name: IX_WeldPassages_WeldingRecordId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassages_WeldingRecordId" ON public."WeldPassages" USING btree ("WeldingRecordId");


--
-- Name: IX_WeldPassages_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_WeldingTaskId" ON public."WeldPassages" USING btree ("WeldingTaskId");


--
-- Name: IX_WelderWeldingEquipment_WeldingEquipmentsId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WelderWeldingEquipment_WeldingEquipmentsId" ON public."WelderWeldingEquipment" USING btree ("WeldingEquipmentsId");


--
-- Name: IX_Welders_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Welders_IdFromSystem" ON public."Welders" USING btree ("IdFromSystem");


--
-- Name: IX_Welders_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_UserId" ON public."Welders" USING btree ("UserId");


--
-- Name: IX_Welders_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_WorkplaceId" ON public."Welders" USING btree ("WorkplaceId");


--
-- Name: IX_WeldingEquipmentConditionTimes_DowntimeReasonId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentConditionTimes_DowntimeReasonId" ON public."WeldingEquipmentConditionTimes" USING btree ("DowntimeReasonId");


--
-- Name: IX_WeldingEquipmentConditionTimes_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipmentConditionTimes_IdFromSystem" ON public."WeldingEquipmentConditionTimes" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingEquipmentConditionTimes_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentConditionTimes_WelderId" ON public."WeldingEquipmentConditionTimes" USING btree ("WelderId");


--
-- Name: IX_WeldingEquipmentConditionTimes_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentConditionTimes_WeldingEquipmentId" ON public."WeldingEquipmentConditionTimes" USING btree ("WeldingEquipmentId");


--
-- Name: IX_WeldingEquipmentWorkplace_WorkplacesId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentWorkplace_WorkplacesId" ON public."WeldingEquipmentWorkplace" USING btree ("WorkplacesId");


--
-- Name: IX_WeldingEquipments_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_IdFromSystem" ON public."WeldingEquipments" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingEquipments_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_MasterId" ON public."WeldingEquipments" USING btree ("MasterId");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingEquipments_RfidTag; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_RfidTag" ON public."WeldingEquipments" USING btree ("RfidTag");


--
-- Name: IX_WeldingRecords_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingRecords_IdFromSystem" ON public."WeldingRecords" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingRecords_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingRecords_MasterId" ON public."WeldingRecords" USING btree ("MasterId");


--
-- Name: IX_WeldingRecords_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingRecords_WelderId" ON public."WeldingRecords" USING btree ("WelderId");


--
-- Name: IX_WeldingRecords_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingRecords_WeldingEquipmentId" ON public."WeldingRecords" USING btree ("WeldingEquipmentId");


--
-- Name: IX_WeldingTasks_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_IdFromSystem" ON public."WeldingTasks" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingTasks_InspectorId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_InspectorId" ON public."WeldingTasks" USING btree ("InspectorId");


--
-- Name: IX_WeldingTasks_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_MasterId" ON public."WeldingTasks" USING btree ("MasterId");


--
-- Name: IX_WeldingTasks_SeamAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_SeamAccountId" ON public."WeldingTasks" USING btree ("SeamAccountId");


--
-- Name: IX_WeldingTasks_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_WelderId" ON public."WeldingTasks" USING btree ("WelderId");


--
-- Name: IX_WorkingShifts_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WorkingShifts_CalendarId" ON public."WorkingShifts" USING btree ("CalendarId");


--
-- Name: IX_WorkingShifts_DayId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WorkingShifts_DayId" ON public."WorkingShifts" USING btree ("DayId");


--
-- Name: IX_WorkingShifts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WorkingShifts_IdFromSystem" ON public."WorkingShifts" USING btree ("IdFromSystem");


--
-- Name: IX_Workplaces_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Workplaces_IdFromSystem" ON public."Workplaces" USING btree ("IdFromSystem");


--
-- Name: IX_Workplaces_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Workplaces_PostId" ON public."Workplaces" USING btree ("PostId");


--
-- Name: IX_Workplaces_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Workplaces_ProductionAreaId" ON public."Workplaces" USING btree ("ProductionAreaId");


--
-- Name: IX_Workshops_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Workshops_IdFromSystem" ON public."Workshops" USING btree ("IdFromSystem");


--
-- Name: Calendars FK_Calendars_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Calendars"
    ADD CONSTRAINT "FK_Calendars_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: Calendars FK_Calendars_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Calendars"
    ADD CONSTRAINT "FK_Calendars_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


--
-- Name: Chiefs FK_Chiefs_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chiefs"
    ADD CONSTRAINT "FK_Chiefs_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Chiefs FK_Chiefs_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chiefs"
    ADD CONSTRAINT "FK_Chiefs_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


--
-- Name: Chiefs FK_Chiefs_Workshops_WorkshopId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chiefs"
    ADD CONSTRAINT "FK_Chiefs_Workshops_WorkshopId" FOREIGN KEY ("WorkshopId") REFERENCES public."Workshops"("Id") ON DELETE CASCADE;


--
-- Name: Days FK_Days_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Days"
    ADD CONSTRAINT "FK_Days_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id") ON DELETE CASCADE;


--
-- Name: DefectiveReasons FK_DefectiveReasons_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DefectiveReasons"
    ADD CONSTRAINT "FK_DefectiveReasons_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id") ON DELETE CASCADE;


--
-- Name: EventLogs FK_EventLogs_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EventLogs"
    ADD CONSTRAINT "FK_EventLogs_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id");


--
-- Name: Inspectors FK_Inspectors_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Inspectors"
    ADD CONSTRAINT "FK_Inspectors_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Masters FK_Masters_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Masters"
    ADD CONSTRAINT "FK_Masters_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Posts FK_Posts_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "FK_Posts_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE CASCADE;


--
-- Name: ProductAccountWeldingEquipment FK_ProductAccountWeldingEquipment_ProductAccounts_ProductAccou~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccountWeldingEquipment"
    ADD CONSTRAINT "FK_ProductAccountWeldingEquipment_ProductAccounts_ProductAccou~" FOREIGN KEY ("ProductAccountsId") REFERENCES public."ProductAccounts"("Id") ON DELETE CASCADE;


--
-- Name: ProductAccountWeldingEquipment FK_ProductAccountWeldingEquipment_WeldingEquipments_WeldingEqu~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccountWeldingEquipment"
    ADD CONSTRAINT "FK_ProductAccountWeldingEquipment_WeldingEquipments_WeldingEqu~" FOREIGN KEY ("WeldingEquipmentsId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


--
-- Name: ProductAccounts FK_ProductAccounts_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccounts"
    ADD CONSTRAINT "FK_ProductAccounts_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- Name: ProductInsides FK_ProductInsides_Products_InsideProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductInsides"
    ADD CONSTRAINT "FK_ProductInsides_Products_InsideProductId" FOREIGN KEY ("InsideProductId") REFERENCES public."Products"("Id") ON DELETE RESTRICT;


--
-- Name: ProductInsides FK_ProductInsides_Products_MainProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductInsides"
    ADD CONSTRAINT "FK_ProductInsides_Products_MainProductId" FOREIGN KEY ("MainProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- Name: ProductResults FK_ProductResults_ProductAccounts_ProductAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductResults"
    ADD CONSTRAINT "FK_ProductResults_ProductAccounts_ProductAccountId" FOREIGN KEY ("ProductAccountId") REFERENCES public."ProductAccounts"("Id") ON DELETE CASCADE;


--
-- Name: ProductionAreas FK_ProductionAreas_Workshops_WorkshopId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductionAreas"
    ADD CONSTRAINT "FK_ProductionAreas_Workshops_WorkshopId" FOREIGN KEY ("WorkshopId") REFERENCES public."Workshops"("Id") ON DELETE CASCADE;


--
-- Name: Products FK_Products_Inspectors_InspectorId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Inspectors_InspectorId" FOREIGN KEY ("InspectorId") REFERENCES public."Inspectors"("Id");


--
-- Name: Products FK_Products_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id");


--
-- Name: Products FK_Products_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE CASCADE;


--
-- Name: Products FK_Products_TechnologicalProcesses_TechnologicalProcessId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_TechnologicalProcesses_TechnologicalProcessId" FOREIGN KEY ("TechnologicalProcessId") REFERENCES public."TechnologicalProcesses"("Id");


--
-- Name: Products FK_Products_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: SeamAccounts FK_SeamAccounts_ProductAccounts_ProductAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamAccounts"
    ADD CONSTRAINT "FK_SeamAccounts_ProductAccounts_ProductAccountId" FOREIGN KEY ("ProductAccountId") REFERENCES public."ProductAccounts"("Id") ON DELETE CASCADE;


--
-- Name: SeamAccounts FK_SeamAccounts_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamAccounts"
    ADD CONSTRAINT "FK_SeamAccounts_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: SeamResults FK_SeamResults_SeamAccounts_SeamAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamResults"
    ADD CONSTRAINT "FK_SeamResults_SeamAccounts_SeamAccountId" FOREIGN KEY ("SeamAccountId") REFERENCES public."SeamAccounts"("Id") ON DELETE CASCADE;


--
-- Name: Seams FK_Seams_Inspectors_InspectorId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Inspectors_InspectorId" FOREIGN KEY ("InspectorId") REFERENCES public."Inspectors"("Id");


--
-- Name: Seams FK_Seams_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id");


--
-- Name: Seams FK_Seams_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- Name: Seams FK_Seams_TechnologicalInstructions_TechnologicalInstructionId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_TechnologicalInstructions_TechnologicalInstructionId" FOREIGN KEY ("TechnologicalInstructionId") REFERENCES public."TechnologicalInstructions"("Id");


--
-- Name: Seams FK_Seams_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: Users FK_Users_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "FK_Users_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id");


--
-- Name: WeldPassageInstructions FK_WeldPassageInstructions_TechnologicalInstructions_Technolog~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassageInstructions"
    ADD CONSTRAINT "FK_WeldPassageInstructions_TechnologicalInstructions_Technolog~" FOREIGN KEY ("TechnologicalInstructionId") REFERENCES public."TechnologicalInstructions"("Id") ON DELETE CASCADE;


--
-- Name: WeldPassages FK_WeldPassages_WeldingRecords_WeldingRecordId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_WeldingRecords_WeldingRecordId" FOREIGN KEY ("WeldingRecordId") REFERENCES public."WeldingRecords"("Id") ON DELETE CASCADE;


--
-- Name: WeldPassages FK_WeldPassages_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id") ON DELETE CASCADE;


--
-- Name: WelderWeldingEquipment FK_WelderWeldingEquipment_Welders_WeldersId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WelderWeldingEquipment"
    ADD CONSTRAINT "FK_WelderWeldingEquipment_Welders_WeldersId" FOREIGN KEY ("WeldersId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


--
-- Name: WelderWeldingEquipment FK_WelderWeldingEquipment_WeldingEquipments_WeldingEquipmentsId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WelderWeldingEquipment"
    ADD CONSTRAINT "FK_WelderWeldingEquipment_WeldingEquipments_WeldingEquipmentsId" FOREIGN KEY ("WeldingEquipmentsId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


--
-- Name: Welders FK_Welders_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Welders FK_Welders_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: WeldingEquipmentConditionTimes FK_WeldingEquipmentConditionTimes_DowntimeReasons_DowntimeReas~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentConditionTimes"
    ADD CONSTRAINT "FK_WeldingEquipmentConditionTimes_DowntimeReasons_DowntimeReas~" FOREIGN KEY ("DowntimeReasonId") REFERENCES public."DowntimeReasons"("Id");


--
-- Name: WeldingEquipmentConditionTimes FK_WeldingEquipmentConditionTimes_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentConditionTimes"
    ADD CONSTRAINT "FK_WeldingEquipmentConditionTimes_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipmentConditionTimes FK_WeldingEquipmentConditionTimes_WeldingEquipments_WeldingEqu~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentConditionTimes"
    ADD CONSTRAINT "FK_WeldingEquipmentConditionTimes_WeldingEquipments_WeldingEqu~" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipmentWorkplace FK_WeldingEquipmentWorkplace_WeldingEquipments_WeldingEquipmen~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkplace"
    ADD CONSTRAINT "FK_WeldingEquipmentWorkplace_WeldingEquipments_WeldingEquipmen~" FOREIGN KEY ("WeldingEquipmentsId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipmentWorkplace FK_WeldingEquipmentWorkplace_Workplaces_WorkplacesId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkplace"
    ADD CONSTRAINT "FK_WeldingEquipmentWorkplace_Workplaces_WorkplacesId" FOREIGN KEY ("WorkplacesId") REFERENCES public."Workplaces"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipments FK_WeldingEquipments_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id");


--
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: WeldingRecords FK_WeldingRecords_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "FK_WeldingRecords_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id");


--
-- Name: WeldingRecords FK_WeldingRecords_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "FK_WeldingRecords_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


--
-- Name: WeldingRecords FK_WeldingRecords_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "FK_WeldingRecords_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_Inspectors_InspectorId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Inspectors_InspectorId" FOREIGN KEY ("InspectorId") REFERENCES public."Inspectors"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_SeamAccounts_SeamAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_SeamAccounts_SeamAccountId" FOREIGN KEY ("SeamAccountId") REFERENCES public."SeamAccounts"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: WorkingShifts FK_WorkingShifts_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WorkingShifts"
    ADD CONSTRAINT "FK_WorkingShifts_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id");


--
-- Name: WorkingShifts FK_WorkingShifts_Days_DayId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WorkingShifts"
    ADD CONSTRAINT "FK_WorkingShifts_Days_DayId" FOREIGN KEY ("DayId") REFERENCES public."Days"("Id");


--
-- Name: Workplaces FK_Workplaces_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workplaces"
    ADD CONSTRAINT "FK_Workplaces_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: Workplaces FK_Workplaces_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workplaces"
    ADD CONSTRAINT "FK_Workplaces_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id");


--
-- PostgreSQL database dump complete
--

