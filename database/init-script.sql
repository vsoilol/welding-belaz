--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
    "UserId" uuid NOT NULL,
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
    "UniqueNumber" integer,
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
    "ConfirmEmailToken" text,
    "ResetPasswordToken" text,
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
fb048641-30c9-4cf8-bd0d-8e533fcbd43c	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
00c31ff9-fed9-48b5-afd4-eceef92c27c2	5	1	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
00f1d102-f6bb-4767-af30-6d6a25b2fffc	1	15	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
01bd73d7-064b-45dc-ba99-bc88dd1f8bea	12	31	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
02616a0a-0ad9-4549-a163-8311e429aa97	3	18	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
0a5aecd4-965c-459c-8344-fd0e2d25773b	5	20	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
0a9634cb-1975-4cf8-9039-2ceab5737c29	6	18	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
0be0f4f2-cab5-490c-9de2-5bef83a7479f	9	16	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
0f32688b-e23e-4d94-ad66-742219b4f813	4	1	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
0f3b3c80-c9cc-408b-95d8-72d604dbe79e	11	4	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
0f4fc00c-4f46-4814-a815-0e29c768f33b	11	7	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
11e30013-0f2f-455b-9f6b-f88a973bdb2e	5	13	t	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
1238e3ba-065d-4cbb-82fe-d2ac4c6bbeb7	9	24	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
168e8f73-b8e1-4b76-8d9b-96d102573205	6	10	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
186de798-fcbf-4e9e-bbe4-31930e125b68	9	30	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
19ec5684-56db-4f46-917b-a7e1d56cd0d6	7	8	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
1b95ff54-d67e-4756-b9c6-914e2725f3ae	11	18	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
1c8b0483-7582-4393-ae56-aa72a3fd21f2	8	6	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
229a0d1a-ecfe-4609-8c49-011bca8e6c47	7	15	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
242c9f5c-779f-41e8-9e4d-e7cb35cba9c8	8	27	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
25ed298b-bd62-4ac4-be58-c2ef44ae7a64	7	30	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
265b8f8a-594d-44b9-8610-39d3ebbcb8b1	1	7	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
2822989e-d4c8-4bda-9e23-cf4beeb1b1dc	5	7	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
2847a094-0740-4d7b-9b4c-fea8b9988efc	4	30	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
2b3da661-40be-4f1b-b446-123e4cf1232c	9	2	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
32fae822-e486-4b3f-8868-f368e9fbae6f	11	5	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
355a4bc0-df92-4920-87ec-898f94798e0d	10	22	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
3955f401-8c6c-4123-9a6d-ed373963a38e	7	22	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
39f48db1-9c55-478b-a00f-f484fd9bce4b	10	29	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
3bad3e62-caaf-4214-bc64-80dda8fbb952	11	6	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
3cdbb5b7-ef35-4454-8c58-013190c648cd	11	25	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
40c36544-32cd-4b9f-bfe3-25b3eeb501fc	12	23	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
42dd3d4c-4b7a-49c0-899f-49a3a9474bde	12	25	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
44626be5-8a20-49a5-8982-4effeacbdefa	9	17	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4a160510-26ab-4446-83a7-809a2cf3d0f2	2	11	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4baaa1ac-4957-4a50-8ac4-deed74e0d6b3	11	26	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4bdf72e9-0e5f-4a08-ab01-e53185b551e0	7	16	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4c2073f4-3136-46f3-bea4-25db383d2e5f	12	24	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4e2b1a32-2b46-4e28-8da0-5e932fcf6ee9	9	10	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4fb444ee-9d41-4b50-8593-e23fd22bea80	9	3	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
4fbdff87-a261-4301-a9b4-c61b76885bfb	3	5	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
525ba0a3-3170-4c24-895b-16c6756f1a08	12	17	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
537c7f5f-3708-4e51-91b4-ae590f2aff5c	10	21	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
54e49957-9812-4e26-b4d1-f1d5dcc4cfff	4	16	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
5534ffe2-0423-4e5c-8832-5b5f11f9eaae	11	11	t	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
5602f463-274e-49af-a269-825c597457c2	8	13	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
587e4eba-2b03-4fd7-a383-ea0ab9449f08	10	14	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
590294bd-2fa4-4c20-8110-af6b7c6a88ae	9	23	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
59915e1f-52f3-4032-99fe-6431a3d73b43	10	7	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
59ddc48f-b9dc-4bd9-9e5b-9a34e24c085a	6	11	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
5a30b656-ecec-441a-8431-15c86a4d8f9a	2	25	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
5eb0e5ca-4def-4ec2-9714-0eb5f4c44f12	4	29	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
5f988b5b-5a79-4c30-9a8e-2ba2c05ee16a	12	9	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
63f0d4ed-e7d7-43c1-ac4c-c4e303e7eabe	7	2	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
64d5ebe0-3aec-4938-96dc-dd190a84d2e2	10	28	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
65d9fba8-b5ae-4976-9b15-e0e2fbf21fff	3	11	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
6631aed6-f155-41f7-a733-e9152f319c1d	8	12	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
67d485b4-96aa-407b-ae91-de313375eb65	2	12	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
68f692e8-d004-4277-b510-d04757994105	12	2	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
6f997d38-48b2-4bda-9a3a-8e1c02531923	5	6	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
72314e15-13bd-49bf-9271-f1a75da08531	6	17	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
726bc029-8dbe-4297-86fb-6eb0b2f5eb2b	12	3	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
72ad8d14-4907-496b-8a0b-19ec3b7c60c5	6	4	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
75281a1c-beeb-4462-b2b8-cb084e78d11d	12	10	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
76efdf9f-2b41-48bf-931a-be51538b12b6	5	9	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
79d3bd58-f615-4785-81d9-b559cbfacf18	8	20	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
7eb6d6a9-709f-4d43-a4c8-20835e61c265	8	5	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
7f63c273-d698-43b0-baa9-d4e34689f692	1	6	t	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
804fece7-3ddb-40e0-aac1-03a5163ab58f	5	14	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
80c6c608-da1a-4e11-8450-53ff6a46cc30	4	25	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
80d52113-8b15-4b4c-a4c2-c1d377640954	4	15	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
8374118c-fd3d-4d73-8477-b491e9d752f4	2	5	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
86d765bd-4f7b-4fc0-a6a4-afb297796da0	3	26	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
8aab4efd-7287-41ae-9cbc-956debfc9a81	5	21	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
8bdfa020-abe8-49eb-be10-f9e3d3ae25d9	3	12	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
8c1c950f-f03e-4f81-a943-4c2960d59111	3	7	t	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
8d2fbcf5-92df-4f03-817b-6173ac71a8e1	5	28	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
8f957bad-034a-4e54-85cb-27a2b4b8ebde	3	19	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
93a4b9b2-fdc4-4d52-9e85-e10f28c72ec0	2	4	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
9a38a058-537a-4cd1-b6a9-bbeb22ce158d	8	19	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
9ba19bbf-2dee-48c9-b805-a10db55de0ba	4	2	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
9d2e501e-c38e-48f5-8516-188ca8aa9b83	4	9	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
a0a98e65-2d84-41fa-bb98-ba634928d263	11	12	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
a2cd2efb-67c1-4539-a5c5-587bef022400	1	8	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
a84d418b-cf7e-47a3-976a-58b3ffe5e8fc	7	29	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
ac636048-9fac-4fc4-af38-0f85559eb5b2	7	23	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
ade51287-36c3-4c9d-98cc-22e6685492e5	4	22	t	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
aff40a55-72c8-4f66-83b2-3e23c2780c11	12	16	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
b3090df0-ed11-466e-9078-f509ffb1e6ac	9	9	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
bb704a0b-7913-4c42-b1cf-e4f68b718063	1	14	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
c0eef074-37b2-4a13-bffc-d84682cc0125	5	8	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
c5ab2fae-b96f-4adf-9d1b-436a1601b961	4	23	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
c96323af-7673-447a-baf0-af9f2c38080f	1	29	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
cbbcc107-e0d1-4779-9a48-4618f030951c	2	26	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
d1d0270e-6dfb-42e7-a0a8-2d7d114d0dd5	3	4	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
d27d0f04-7dc8-4d85-b237-5c7ee4b47ac9	10	8	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
d37babf0-0e54-4a10-94fd-ba09cc4af245	1	1	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
d5d8775d-f046-4e5d-9dbe-c4b2850eba6d	4	8	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
d6596c84-b56c-4891-a8a2-cdd29aac77d1	5	27	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
d7a4da73-b807-47d4-af95-de5950090c27	3	8	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
db91b50e-0981-486f-9291-674758fcd78b	6	3	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
dc07596f-f185-4749-bed9-cb5f7c3523be	10	15	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
dc0c78ee-c427-4528-b5e6-8e944a6e8da0	6	24	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
e00154e6-0109-433d-94ef-d30d58110d66	3	25	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
e3d3074b-1780-4ab9-8956-47e76f19f75d	10	1	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
e82c5412-873b-45a2-99a9-0ee56158db12	7	9	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
eb4180b6-6fdb-4bc1-a669-11fe0fd7960b	1	21	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
eb6128f8-d06b-410f-8625-90773b15d196	6	25	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
ede4c745-a362-4d4d-87d1-1151c2053c1b	2	18	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
ef135f05-855c-47ee-888f-65e1a6c79f03	12	30	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
f017e43f-dc87-480b-acdb-8df69a302be1	1	22	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
f10f3fb1-1006-4ccc-999c-f5ea3aa6a2d5	8	26	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
f1b651ad-09c5-46ed-8b8c-40d836473cc8	1	28	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
f56934ac-e516-4fa1-9d7f-f67a5fad0a79	1	2	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
f870d7dd-a3b6-4c78-8830-1f7af711d3c9	7	1	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
f9ca5c94-da96-4028-b52f-c7e77559940f	4	24	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
fbd78e80-8abd-4141-a341-e0b5ce0cee39	2	19	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
ff50b35d-9adf-402d-899b-bac61ef7dc94	11	19	f	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
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
0737dd4c-03f7-40e0-8dea-6994e8376f3b	Отсутствие крана, транспорта	\N
1950e872-e3ac-4bd8-a465-cce8fc275cec	Неявка оператора (б/лист, отпуск, и пр.)	\N
1fa945df-44fe-411d-b2ef-5caab38dd5c4	Обед	\N
25cf129c-0ae3-47b6-b405-887a82315760	Естественные надобности	\N
37a47260-06a9-4d36-aa9f-ef94d2e65780	Отсутствие материала, заготовок, деталей	\N
5462a6bb-cf2a-4df0-9d84-1f621a637bd9	Установка, выверка, снятие детали	\N
561682fc-5868-49ce-8d80-7f7bfd422b95	Отсутствие конструктора, технолога или ожидание его решения	\N
60bfdf3c-79c7-41bb-b039-48c123e8b9b7	Работа с управляющей программой	\N
610b8007-7c98-4259-a68f-ddd8530ce89f	Изменение режимов, смена инструмента, приспособления	\N
7561ed59-bfef-457f-beba-3e9d43d092b5	Отсутствие сотрудника ОТК	\N
79485f2a-5e01-42a0-80b9-c3279dcb2cc8	Праздники и выходные	\N
7deb45de-a4a1-4ace-a117-410a4b43290d	Контроль на рабочем месте	\N
89d27f41-5f8f-4f49-b53b-ecec6b178252	Отсутствие заданий	\N
8ace29e3-c89e-4674-9975-188c16b05ebe	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
9f10b91b-8858-438d-81fd-8a57ec1df3ba	Отсутствие энергоносителей	\N
c384eaba-0d64-42b6-bb51-208bb2ac23b6	Установка, выверка, снятие детали	\N
c973d5d7-c8c1-495c-9588-896880b96ab5	Отсутствие оператора в связи с необеспеченностью	\N
ca0eaa5d-dc90-4dd4-9820-e519dde36a15	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
dfdddc9e-67f2-4276-81b3-9e8c4ab7f9bd	Плановый ремонт централизованными службами	\N
e26c93ba-2efd-467c-9225-05c3738b977d	Нерабочее время по графику согласно сменности	\N
f0ce34e7-7a87-4eef-9d70-cd5cbfefdffb	Ознакомление с работой, документацией, инструктаж	\N
f3b41b58-b95c-4af9-a629-e470f470cfd1	Работа по карте несоответствий	\N
f8c86d35-d63e-426e-8dd9-27601797e63f	Сборочные операции	\N
fb8755c1-3b8d-483d-83c7-2144d238b8db	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
fea73de3-cdf9-45d3-b7ba-d7229823a33e	Аварийный ремонт централизованными службами	\N
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
4e51bb84-8080-487e-8fc5-65fb26793774	e1d1df32-89c6-4f53-97af-12a16dee378d	249550
ceed41bb-9a39-465f-b196-fe2ccb266393	5b812036-9e0f-4376-a2ae-2854d7cce5be	219379
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
41858470-6bbf-47f1-9a37-6a071033cf38	fdc99a67-e252-48dc-ab43-07fdc94fedda	614962
d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	7f1d8dd5-6649-48da-8657-87fb2cde3739	610422
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

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "UniqueNumber", "ProductId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
645e14f9-fa85-4f89-b5bc-bea4bc2936f2	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb
c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	7e8c5fe8-431e-497b-9b13-2da25d6e5158
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
57f33be5-0220-4e06-b57c-b674c26ff068	Сборка, сварка рам к/с г/п 120-130 т.	6	a968ed54-a55b-4481-bda2-1a81f5909013	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ManufacturingTime", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
645e14f9-fa85-4f89-b5bc-bea4bc2936f2	Рама	7513D-2800010-20	t	10	1	99fc55a8-e7f7-4d70-9772-f4b205503134	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	4536492774
6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	Поперечина рамы задняя	75131-2801300-20	t	10	2	99fc55a8-e7f7-4d70-9772-f4b205503134	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
7e8c5fe8-431e-497b-9b13-2da25d6e5158	Поперечина рамы задняя	75131-2801300-20	t	10	2	ce4d451a-35de-4a97-99c9-185b56d09d85	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	Рама	75131-2800010-70	t	10	1	ce4d451a-35de-4a97-99c9-185b56d09d85	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	4536479362
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
03876726-8de8-486d-a01b-50b644cc76f1	18	4000	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	8fd0d98d-6868-4412-9a66-78839fa644f1	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
05d627b6-e193-4251-88b9-635cba1b9370	57	400	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
1b6a85ad-6da0-4269-a86f-180ec363cb9e	54	400	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
3af46b20-224a-4f72-97b6-5297d2b75bf5	55	400	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1	52	1200	t	f	7e8c5fe8-431e-497b-9b13-2da25d6e5158	9398fa25-e906-406e-8e09-beb60975f75b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
6eb38dfc-df1a-42c4-8b12-f9956cad632e	52	1200	t	f	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	9398fa25-e906-406e-8e09-beb60975f75b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
7d83ba4e-5b00-4935-baf1-df3ad86b15c8	57	400	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
a3b759d7-555a-41ea-93bf-2d9c7ce48371	58	900	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
ace294ec-b133-4fcb-aca8-7bdefef745f1	54	400	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
b04049d0-5026-4014-bd26-e61dbd0bda14	58	900	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
b275eb65-ca76-4272-9662-d9b92e109177	39	280	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	4b73a99f-0fb7-49fc-b930-521e67691895	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
b7703aeb-535a-4be2-a171-b71fbe3cec42	39	280	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	4b73a99f-0fb7-49fc-b930-521e67691895	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
c07e6c99-6ab0-4e57-8ea3-53bb68ffa507	1	1900	t	f	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
c4309e97-a1e8-49de-b124-c1aa1e89de8a	1	1900	t	f	7e8c5fe8-431e-497b-9b13-2da25d6e5158	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
d8955c29-4257-4705-afc3-552316d0e8bf	55	400	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
dc631901-db09-4add-9e04-3e5e006c2271	2	1880	t	f	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
dfbf3824-def3-485b-b5af-66c0fcd1adca	2	1880	t	f	7e8c5fe8-431e-497b-9b13-2da25d6e5158	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
f43dc5cf-191d-4ba5-ab5f-5865f73589e0	18	4000	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	8fd0d98d-6868-4412-9a66-78839fa644f1	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
09c84b21-5f0c-4fae-9dac-ceb5abc1917e	2	Инструкция 2	2
26693f0d-6c87-4210-8bb3-cee7fd394a08	48	Инструкция 48	48
3fb871cf-9101-4eee-8ee8-cb1c6c03978c	54	Инструкция 54	54
4b73a99f-0fb7-49fc-b930-521e67691895	39	Инструкция 39	39
7ea73afd-78ac-4b39-ba12-a6816a764ec8	1	Инструкция 1	1
8fd0d98d-6868-4412-9a66-78839fa644f1	18	Инструкция 18	18
9398fa25-e906-406e-8e09-beb60975f75b	52	Инструкция 52	52
aff9dccb-145d-4e42-8c34-8bb5579f522b	55	Инструкция 55	55
c050ab9a-1195-42f5-a27d-343d2d8d8c4d	56	Инструкция 56	56
d6068081-5eac-49bb-b6be-30f3aa5febf4	58	Инструкция 58	58
ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	57	Инструкция 57	57
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
05fb5b9e-115d-4afd-be72-ddc178b0194c	75131-2801300-20	Поперечина рамы задняя	ims://docid/1333514/view	2868425
99fc55a8-e7f7-4d70-9772-f4b205503134	7513D-2800010-20	Рама	ims://docid/2440459/view	3330041
ce4d451a-35de-4a97-99c9-185b56d09d85	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "IsEmailConfirmed", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "Role", "ProductionAreaId", "ConfirmEmailToken", "ResetPasswordToken", "IdFromSystem", "RfidTag") FROM stdin;
11506328-827d-42fa-9bfb-328308ec4914	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	f	$MYHASH$V1$10000$ghqyzdnfjI+uNru6pK5JHJJuAN6hD/YP9vcUP+uDlTYP7QUv	\N	\N	\N	1	\N	\N	\N	\N	\N
5b812036-9e0f-4376-a2ae-2854d7cce5be	Мария	Николаевна	Шабалинская	\N	\N	f	\N	Контролер сварочных работ	19379	\N	4	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
e1d1df32-89c6-4f53-97af-12a16dee378d	Екатерина	Сергеевна	Грук	\N	\N	f	\N	Контролер сварочных работ	49550	\N	4	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
7f1d8dd5-6649-48da-8657-87fb2cde3739	Сергей	Николаевич	Беляцкий	\N	\N	f	\N	Мастер производственного участка	10422	\N	2	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
fdc99a67-e252-48dc-ab43-07fdc94fedda	Геннадий	Александрович	Алёксов	\N	\N	f	\N	Мастер производственного участка	14962	\N	2	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
028b5ac3-8122-41fe-bbbc-36b056ca9fd8	Виталий	Владимирович	Казинец	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	D7:F1:7D:5A
29a5eb5c-478d-4156-ad77-46cdb5779b61	Юрий	Сергеевич	Буландо	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	17:CD:7F:5A
4aae0c43-0edf-4e49-87db-043bbec1ebc5	Максим	Александрович	Костюкевич	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	67:CD:7E:5A
4de2c415-5229-442a-bf81-62c543f67446	Василий	Владимирович	Казинец	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	B7:5A:79:B5
5e9706ed-9a44-455b-b599-230e5822df9f	Сергей	Анатольевич	Казачёнок	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	67:5A:70:B4
90c5adb1-c374-4a62-ac69-5e37fd2bb06a	Валерий	Сергеевич	Зубковский	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	97:17:60:B4
9b5f302b-f6ce-40e6-a294-5cef58bef456	Владимир	Францевич	Виторский	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	D7:95:55:B4
a056ae81-9750-46e8-a1f0-6f85e6845015	Александр	Васильевич	Михейчик	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	3	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	27:45:7E:B4
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
03099708-040b-4244-8f48-9ad379d62746	1	Корневой	200	270	23	26	\N	\N	9398fa25-e906-406e-8e09-beb60975f75b	\N
0c82e207-ec76-4040-94ed-46c6bbc2b932	1	Корневой	200	270	23	26	\N	\N	26693f0d-6c87-4210-8bb3-cee7fd394a08	\N
26703804-4bd5-4468-ab40-2f2ed750ea5a	2	Заполняющий	270	310	23	26	\N	\N	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N
2ce20312-25f8-4d36-a24b-068b2cac2313	1	Корневой	200	270	23	26	\N	\N	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N
3d8349dd-23de-4bfa-b654-0886ce421978	2	Заполняющий	270	310	23	26	\N	\N	c050ab9a-1195-42f5-a27d-343d2d8d8c4d	\N
3d9bcfd9-c9a5-4c62-a2ac-9ee09296fa73	2	Заполняющий	270	310	23	26	\N	\N	26693f0d-6c87-4210-8bb3-cee7fd394a08	\N
57a6ed41-80b6-4cea-b59a-0979f45b5c19	1	Корневой	200	270	23	26	\N	\N	8fd0d98d-6868-4412-9a66-78839fa644f1	\N
5eda9f2c-7abf-4553-882d-3bc0a1bedc0b	2	Заполняющий	270	310	23	26	\N	\N	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N
705b0fd8-cdc7-4a6e-93bd-bf8f77ab1664	1	Корневой	200	270	23	26	\N	\N	c050ab9a-1195-42f5-a27d-343d2d8d8c4d	\N
7b644a2d-a20e-46bf-b7a1-25ef68fa045d	1	Корневой	200	270	23	26	\N	\N	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N
88711a65-1df4-4c49-a0ab-08a91757fe76	1	Корневой	200	270	23	26	\N	\N	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N
8fd32666-98ae-4e85-992b-0db59dfceb1e	2	Заполняющий	270	310	23	26	\N	\N	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N
962261ec-e72b-4d71-8f06-f9f67471c9ac	1	Корневой	200	270	23	26	\N	\N	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N
9b64ea13-e089-4a52-bf04-4714e62782ae	2	Заполняющий	270	310	23	26	\N	\N	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N
9df0e673-781b-42c2-a55b-ca627d4a7817	1	Корневой	200	270	23	26	\N	\N	4b73a99f-0fb7-49fc-b930-521e67691895	\N
9fdc57ae-25b3-4f6f-8dd5-c7278608356b	2	Заполняющий	270	310	23	26	\N	\N	4b73a99f-0fb7-49fc-b930-521e67691895	\N
ad8df5f0-2d0f-413c-be9b-38d23c380325	2	Заполняющий	270	310	23	26	\N	\N	9398fa25-e906-406e-8e09-beb60975f75b	\N
c382a15c-23cb-4e9e-a572-ceb7132c64a0	1	Корневой	200	270	23	26	\N	\N	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N
deab1cdf-d29a-4e2c-bfe2-109d58809b5b	2	Заполняющий	270	310	23	26	\N	\N	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N
edf1e954-4a81-403f-b289-bd5f161002d6	2	Заполняющий	270	310	23	26	\N	\N	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N
f82de241-4fb9-4e8a-a043-b5a354a36996	1	Корневой	200	270	23	26	\N	\N	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N
fdd6d112-bb06-4cb6-8651-87c300b6aa42	2	Заполняющий	270	310	23	26	\N	\N	8fd0d98d-6868-4412-9a66-78839fa644f1	\N
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
04ad8b7d-7c32-432e-95b2-df9291291d66	7895122d-186d-47ea-9a69-463515f335d6
04ad8b7d-7c32-432e-95b2-df9291291d66	a623d6e5-7a95-4c22-addb-35ec1a76e606
120b75d9-39ca-4280-bd39-abf3edfdc577	a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a
19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e	7895122d-186d-47ea-9a69-463515f335d6
19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e	a623d6e5-7a95-4c22-addb-35ec1a76e606
285c7225-d2cb-487f-b8b7-a5205e3dd41b	7895122d-186d-47ea-9a69-463515f335d6
285c7225-d2cb-487f-b8b7-a5205e3dd41b	a623d6e5-7a95-4c22-addb-35ec1a76e606
2881ef4f-7783-4d22-8ff4-847d9bf70b13	5f8a0d82-9648-4b94-9b9b-60888960210c
398d8d0a-9d53-4632-8559-245816abd384	a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a
63d79615-e349-4cf0-8f38-816277172795	5f8a0d82-9648-4b94-9b9b-60888960210c
7e0519ae-a0cf-4fba-b678-359b93ee3642	7895122d-186d-47ea-9a69-463515f335d6
7e0519ae-a0cf-4fba-b678-359b93ee3642	a623d6e5-7a95-4c22-addb-35ec1a76e606
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
04ad8b7d-7c32-432e-95b2-df9291291d66	028b5ac3-8122-41fe-bbbc-36b056ca9fd8	\N	114729
120b75d9-39ca-4280-bd39-abf3edfdc577	9b5f302b-f6ce-40e6-a294-5cef58bef456	\N	132695
19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e	90c5adb1-c374-4a62-ac69-5e37fd2bb06a	\N	150838
285c7225-d2cb-487f-b8b7-a5205e3dd41b	29a5eb5c-478d-4156-ad77-46cdb5779b61	\N	150882
2881ef4f-7783-4d22-8ff4-847d9bf70b13	4de2c415-5229-442a-bf81-62c543f67446	\N	121267
398d8d0a-9d53-4632-8559-245816abd384	4aae0c43-0edf-4e49-87db-043bbec1ebc5	\N	122575
63d79615-e349-4cf0-8f38-816277172795	5e9706ed-9a44-455b-b599-230e5822df9f	\N	117390
7e0519ae-a0cf-4fba-b678-359b93ee3642	a056ae81-9750-46e8-a1f0-6f85e6845015	\N	146164
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
5f8a0d82-9648-4b94-9b9b-60888960210c	92d5a5ef-6961-480a-805d-af4646800c77
5f8a0d82-9648-4b94-9b9b-60888960210c	d840b4bb-f8af-4568-bed6-3061267f9220
7895122d-186d-47ea-9a69-463515f335d6	5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e
7895122d-186d-47ea-9a69-463515f335d6	ad15addb-3100-4fac-b70a-5f1db1d94893
7895122d-186d-47ea-9a69-463515f335d6	d840b4bb-f8af-4568-bed6-3061267f9220
7895122d-186d-47ea-9a69-463515f335d6	e9b97962-ade8-41b6-b1e9-64b830da256f
a623d6e5-7a95-4c22-addb-35ec1a76e606	5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e
a623d6e5-7a95-4c22-addb-35ec1a76e606	ad15addb-3100-4fac-b70a-5f1db1d94893
a623d6e5-7a95-4c22-addb-35ec1a76e606	d840b4bb-f8af-4568-bed6-3061267f9220
a623d6e5-7a95-4c22-addb-35ec1a76e606	e9b97962-ade8-41b6-b1e9-64b830da256f
a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a	5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e
a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a	9b64e6fa-f620-423f-a9a0-6edc86fbd88c
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
5f8a0d82-9648-4b94-9b9b-60888960210c	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49232	03:3D:93:0D
7895122d-186d-47ea-9a69-463515f335d6	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49141	93:57:D8:0B
a623d6e5-7a95-4c22-addb-35ec1a76e606	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49283	A6:F1:CF:48
a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49286	35:4E:AC:A5
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
15e3e736-4d5d-4107-a682-74d3b7c80ff7	3	00:30:00	07:50:00	02:00:00	02:20:00	\N	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
84fcd983-19ec-4f7d-9b2a-2920c7dccd26	1	07:30:00	16:00:00	12:00:00	12:30:00	\N	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
fecec088-e966-4c91-bb40-28b9d3cc27c7	2	16:00:00	00:30:00	20:00:00	20:30:00	\N	fb048641-30c9-4cf8-bd0d-8e533fcbd43c	\N
02c4c4d6-ef14-4ffa-8941-dfd18ad0d9c6	3	00:30:00	06:50:00	02:00:00	02:20:00	11e30013-0f2f-455b-9f6b-f88a973bdb2e	\N	\N
0ce0f838-222e-415a-a04a-a9245df740fc	1	07:30:00	15:00:00	12:00:00	12:30:00	8c1c950f-f03e-4f81-a943-4c2960d59111	\N	\N
0e7704a0-15c3-457d-ac83-8e6b4acc56db	2	16:00:00	23:30:00	20:00:00	20:30:00	7f63c273-d698-43b0-baa9-d4e34689f692	\N	\N
10449f0f-fe2e-404f-99c1-529a1cf6b012	2	16:00:00	23:30:00	20:00:00	20:30:00	5534ffe2-0423-4e5c-8832-5b5f11f9eaae	\N	\N
379417e9-0d93-4c86-953d-8a64a4534afb	1	07:30:00	15:00:00	12:00:00	12:30:00	7f63c273-d698-43b0-baa9-d4e34689f692	\N	\N
5de245ae-b093-4879-bcad-dcf5e463b227	3	00:30:00	06:50:00	02:00:00	02:20:00	ade51287-36c3-4c9d-98cc-22e6685492e5	\N	\N
66c844c0-1868-4348-abda-8cfe8689840d	1	07:30:00	15:00:00	12:00:00	12:30:00	11e30013-0f2f-455b-9f6b-f88a973bdb2e	\N	\N
7526607d-bcbf-4d37-9356-561da858d0fe	3	00:30:00	06:50:00	02:00:00	02:20:00	7f63c273-d698-43b0-baa9-d4e34689f692	\N	\N
92c27f3f-e95c-434b-8ce3-760e6de1d477	3	00:30:00	06:50:00	02:00:00	02:20:00	5534ffe2-0423-4e5c-8832-5b5f11f9eaae	\N	\N
a7801276-459f-4915-a836-42aaf4408b28	2	16:00:00	23:30:00	20:00:00	20:30:00	8c1c950f-f03e-4f81-a943-4c2960d59111	\N	\N
aa516c5a-1ca6-4086-86b9-a17c3bc3aa49	1	07:30:00	15:00:00	12:00:00	12:30:00	5534ffe2-0423-4e5c-8832-5b5f11f9eaae	\N	\N
c2431b6d-5394-40b9-a578-dd73b6f341d6	2	16:00:00	23:30:00	20:00:00	20:30:00	ade51287-36c3-4c9d-98cc-22e6685492e5	\N	\N
de032fe6-482b-4bcf-9de6-6322efe711ae	3	00:30:00	06:50:00	02:00:00	02:20:00	8c1c950f-f03e-4f81-a943-4c2960d59111	\N	\N
f0dd6271-4e13-429c-9209-77e0c89037e2	2	16:00:00	23:30:00	20:00:00	20:30:00	11e30013-0f2f-455b-9f6b-f88a973bdb2e	\N	\N
fc154566-beae-4319-aa7f-cb4372dd219a	1	07:30:00	15:00:00	12:00:00	12:30:00	ade51287-36c3-4c9d-98cc-22e6685492e5	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e	3500	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3500
92d5a5ef-6961-480a-805d-af4646800c77	3600	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3600
9b64e6fa-f620-423f-a9a0-6edc86fbd88c	3510	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3510
ad15addb-3100-4fac-b70a-5f1db1d94893	3550	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3550
d840b4bb-f8af-4568-bed6-3061267f9220	3610	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3610
e9b97962-ade8-41b6-b1e9-64b830da256f	3690	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3690
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
a968ed54-a55b-4481-bda2-1a81f5909013	Сварочный цех	50	050
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
    ADD CONSTRAINT "FK_EventLogs_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


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

