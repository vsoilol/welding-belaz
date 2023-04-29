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
-- Name: Roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Roles" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
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
-- Name: UserRoles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."UserRoles" (
    "UserId" uuid NOT NULL,
    "RoleId" uuid NOT NULL
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
    "PasswordHash" text,
    "Position" text,
    "ServiceNumber" text,
    "CertificateValidityPeriod" timestamp without time zone,
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
ff416f7b-f798-45a1-bd38-5f889eb9c683	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
cd037ad5-73b3-4b4f-a302-05c012e37703	314cae7a-86fa-4908-a442-22f3a87baf71	131e8092-997f-4a03-b7ce-f37ed559934a	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
01cf99da-aa5d-4f7f-a901-2e2baf37036f	7	29	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
04fb6729-2c25-4a68-8c9c-2aa39c90208f	9	16	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
06a0bacb-0459-4cc6-8744-4ec9eec4b359	8	6	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
0719bb31-78cf-4553-a55b-76782f48af8a	6	3	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
07eca568-8e29-41c2-9ce5-daa9f4563eea	5	13	t	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
092cce9e-3b38-4c22-b3d6-cf60526a5751	6	11	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
099f195d-7477-403f-97d7-e768dfb6ba1d	9	2	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
0a0a8e51-6058-46e2-85a7-7ff9ba851e7e	10	14	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
0a2ff955-4c2b-4618-9845-4b3d115cd6b9	4	8	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
0a6f8d2e-7c80-4f27-8d6d-b70092df9a88	5	8	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
0bee2b76-8ffc-4a99-91d9-0e3f9931431d	9	23	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
105b06ee-c427-4aed-ae56-aa77967c7365	10	29	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
186f62e6-2f69-452c-9e73-715b7771461a	11	7	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
1ab081fd-95e7-44a7-9bdd-52b556eb5f0f	3	26	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
1ac1e5e6-e29b-4367-abb4-5845cd5223e4	5	6	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
1c953a7b-233e-43ab-a4dc-f2c028acc48d	8	19	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
1f54243a-9896-4ddb-802b-c42604588df7	6	17	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
24851c65-49c1-41e9-bf3c-a52a9bbd1857	2	18	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
28072694-4e1a-413b-bd64-240a870515df	4	15	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
2b8053e1-b0a1-477a-814a-70785904bd35	1	15	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
2b9fff5d-ed3d-4513-8d43-a39ee38035b1	1	21	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
2f37f1a4-eb5a-46b9-924f-fc78de75b611	4	29	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
31006212-b33c-40ee-b934-4d664155186d	11	25	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
36180549-9261-41ce-a424-1c6513b5bbf2	9	9	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
3a24b06b-1788-48eb-b8a5-fc740f157278	6	24	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
3ac24a9a-fa59-4e4f-bc31-21d3cdcad8f5	8	13	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
3e1ae6c6-50ea-49f1-b8b2-83f8b9a5bd72	2	25	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
3e6585ea-c2d6-48f6-8570-51acdb87efc2	12	9	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
41e2caa6-7d1d-4a7b-8df9-960b94a57b18	7	9	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
457cff38-d157-4497-bcbf-58b69e9cb0a4	10	21	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
45bff4c0-26e6-451c-abf4-edc58bbdd90b	4	2	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
485cc5a4-cd84-441e-bf82-7dd3db43c44e	8	27	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
48b458fa-28e0-4dd1-9c0b-d7cfbcaa121f	11	6	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
4abdd208-8f97-45cd-9946-cba1481b6fb1	12	25	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
4dabe1d9-053d-45a5-bb83-f7f2687f28de	10	7	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
52c80d68-89c0-43f8-b028-b22eba399e7f	1	7	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
532f35ec-e4f6-4dee-ae82-2f39a935c4cd	10	28	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
5498b819-0e50-4032-9d9e-4768b5584a26	8	5	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
55f5504d-e08e-4ac4-8ed1-c10e27fd7a97	3	8	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
59ef4c02-e63b-44d7-a709-968334268760	8	26	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
5b7394b4-3b1a-4bfc-9ca0-77c9f3a8956f	5	21	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
5c11b5a4-b6ff-4916-81a6-d44b6317642e	3	12	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
61a4b43d-3c62-4691-8112-8ae1bda1c7af	4	30	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
6563a1fa-3b5b-46f5-8d97-4df2a01e1fdb	3	11	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
66b3b1b3-2630-4b6e-aa08-157138da8b8b	6	25	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
6b2ec487-a0e3-4147-a611-c6f848177661	9	30	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
6b4739f1-84bf-4696-9eb9-868f3d1be44d	11	26	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
6bc20270-5799-426b-9f86-d39632ccf9bd	2	11	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
6c0c3967-9dca-480c-b772-44a4d1e8307b	7	1	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
7007f924-482b-45e1-9f1c-36d20cb922cd	7	30	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
71ac7f84-de9d-4b9a-96fe-bcc02b4f5629	5	20	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
741122ea-c533-4dbf-96fe-f068cc2028b5	1	22	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
7628c77d-a6d5-4d0d-91e6-60f9c3a165e9	5	14	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
796701e4-d82f-49a3-9e15-0ca0d5bbdfb4	7	2	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
79b9c8a4-0855-422f-be33-b1bd81e9e8ab	12	31	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
7a6e7837-b2fe-4074-a3eb-c15a7f9fa04e	4	9	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
7c419f31-000d-4476-bae1-84d6644d5002	5	7	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
81b126b3-37e8-42b6-91c6-b64cfc64bc3e	10	1	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
82850398-ae5d-4b38-adad-2361889e6aed	3	18	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
847fe607-1c61-4e30-903c-86f603ec9ef6	9	24	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
8ec63227-dd76-4afe-88b8-1fc72384e11e	1	1	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
910e26da-8ba2-4063-9cfb-79c9f462f87c	7	16	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
951ef04b-a289-476e-8c25-a1c59ca85bb9	9	10	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
983e19ae-2bd5-4007-9b86-690cf9c083aa	1	6	t	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
99001197-ec94-4c3e-b96d-b8e487c3492f	11	18	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
9fd5c81d-9366-426f-81db-5c60d70cfe98	1	2	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
a1e30fd9-4560-4196-a107-4b0c33096355	4	16	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
a3010dc5-c092-4b93-8219-b29500ee50ef	10	22	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
a68bdeb2-15d5-40d8-a015-35030f75d634	9	17	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
a76448fe-8477-46f2-849a-d4504b85326d	9	3	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ada80310-492a-49ad-a434-5724a8537033	12	16	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
adfcb5ee-595d-4144-b7a0-0ffa8cff026d	6	4	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ae5e65bb-4f31-4a05-a1b7-b16a7495520b	3	19	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
aec5c3ba-d466-4235-9c3b-7f32967b3df0	11	19	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
b2904a28-32ba-4cc3-b4ef-b500034bf0a7	4	1	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
b400a0ab-e136-4117-b18f-29701860a638	2	12	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
b51cb9b1-f9f3-4676-af8b-7beea03c25b2	10	15	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
b80f8106-05fe-4867-9c4d-44ec39b42590	4	24	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
b8e6e94e-a6e8-4ba7-8801-cc9dac8dce6c	2	19	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
bb321deb-fa53-4f3f-83c5-976dc950847f	8	20	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
bb78efc3-9f1b-40e5-85db-ede48f6c1683	1	14	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
bca97db3-fd78-4c01-aa51-f9f33ac68f44	12	30	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
bec18a1e-9acd-4edc-83d2-06ce000793ab	3	7	t	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
c1ae60e7-f399-4896-b05e-cfedf34edf06	10	8	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
c293a615-70f0-4c6c-b220-aff50f8cccf1	7	8	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
c3d1a769-c434-48f3-a0f8-8beca53a42ab	1	29	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
c409ac60-9aeb-4dc1-ae7e-d0e9f3bb6417	8	12	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
caef25f7-f535-409d-8dd9-4bac7640324a	2	4	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
cb3bcd46-4485-4e6b-9138-63264eefd925	5	27	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
cdb3071d-ed29-4093-ad7a-302aacdcb4e4	4	23	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ce70d930-3c36-42c6-8821-2f72e4cf043c	6	18	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ce7247d1-c28f-4a59-a09b-0f7118d32f3b	5	1	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d099e52e-3391-4c02-96cb-7b88b3d405d2	2	26	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d0da70de-629e-4bf9-a2c6-ba42bb1be50d	5	28	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d1d4cb7b-462d-464e-92fb-d13b59a6b864	7	22	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d747115d-fd57-4d45-a6b9-0b7de2804199	12	10	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d7b7e131-8277-438c-9a6f-68fb843f00a5	1	8	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d8158cdc-34b9-45ba-ad71-aa44b3014aab	12	2	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
d9b0be37-48ff-439b-a732-a2ad6a394669	3	5	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
db098d60-261e-46a0-9177-f1dc874ce2f6	11	12	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
dd3dc147-2ad6-4df1-abcc-c085af19bc36	3	4	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
e01a15bc-aaa3-417b-b1dd-3ea543c8407d	3	25	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
e271a214-5efb-4aba-8812-bb03d41f0bcc	7	15	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
eb4c0e20-3c0a-4c91-9e95-26c66a12b569	4	25	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ebc0b679-7389-4554-a429-de76decd9d2c	12	23	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ee77b2e6-99c9-4a89-8fee-076e8c9fe036	11	4	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ef60e1a9-d01b-4dd5-84d8-773fe64fc2c3	1	28	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f52123c1-d3a5-4eea-8d2e-0081958bc0fb	12	17	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f542c1a9-76ae-4a42-880b-f1c22fa663e4	12	3	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f5a5796d-8052-4c45-82a8-aeb3911f6483	11	5	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f5cc8b94-dbbd-4cf0-8628-dbb60cff308c	6	10	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f7b89390-1b4c-4afd-b81a-cf8f2f65ae87	12	24	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f83f6f97-2b63-423b-a5ad-a93dccbf88a3	7	23	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
fa6e0d86-8b04-49df-aed1-4cc357f898e8	4	22	t	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
fcfb9040-ef8c-433e-9ca0-64c365497ed9	2	5	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
fec8ee66-8e3a-4d8f-aef9-7324f0e172b6	11	11	t	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
ff15bcf1-3ee5-46f6-9e88-19f26160fe24	5	9	f	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
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
04e80f4a-48aa-4ae2-8303-b4d923fbbe18	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
0a5dadad-2d23-4353-8801-daa69c67af12	Контроль на рабочем месте	\N
401d9656-0b4c-4ed5-9c52-68191da1e73e	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
562a8c9b-f9fb-491d-843d-fbc614c1f70a	Ознакомление с работой, документацией, инструктаж	\N
5dfba46a-63f5-4f31-b99e-dabcad81c03b	Отсутствие материала, заготовок, деталей	\N
67b6b6fe-850b-4f2b-9db9-dc8b384218af	Работа с управляющей программой	\N
69533081-96b0-49ae-99a8-568ac21fc4af	Обед	\N
6cbc0d42-d4a1-46dd-b4fe-11324aa3fbd1	Отсутствие крана, транспорта	\N
6cfe5af9-126f-4416-8a1c-3e8d89336928	Изменение режимов, смена инструмента, приспособления	\N
75ef7cb8-6b45-4874-a971-1147120a6df7	Установка, выверка, снятие детали	\N
77eb1ed9-7409-478f-9f64-1ca13afb794a	Аварийный ремонт централизованными службами	\N
7db97cdd-be1a-43e8-8074-129318f78398	Отсутствие сотрудника ОТК	\N
8cd48f05-8880-4c39-9590-c7cf57c340eb	Отсутствие конструктора, технолога или ожидание его решения	\N
9b9ae185-4bd6-4b89-b0ee-ea12f057df9f	Неявка оператора (б/лист, отпуск, и пр.)	\N
a233e878-2abb-42e4-921e-0f1298d84c45	Работа по карте несоответствий	\N
a6d5aab8-4b5f-4c50-8c6e-d60f04693d3c	Сборочные операции	\N
a7eba74b-ac97-4023-8e1d-5f3c245e69cd	Праздники и выходные	\N
aea31ca9-adac-4142-8e39-0f9f3820e868	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
b0686c79-8830-4e82-ba7d-6450ccd94931	Отсутствие заданий	\N
b1b1c1ea-8647-408a-aa4c-93d8ebd8a421	Отсутствие оператора в связи с необеспеченностью	\N
ca9863e0-d01a-4059-83f8-9649713e884f	Плановый ремонт централизованными службами	\N
d8ce7011-055e-4803-870f-8181c6aa2d1e	Отсутствие энергоносителей	\N
e512c141-3bca-4c50-8998-d0cf8049c5bc	Нерабочее время по графику согласно сменности	\N
eab52e95-1523-4da0-9b69-8de8e7ee5c57	Установка, выверка, снятие детали	\N
f83b182e-7bf2-43b4-bb7c-f8e8bbd32eb9	Естественные надобности	\N
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
58f9027f-9076-4642-8e2a-8cd580b8e662	e95d40e8-a80b-4021-aae9-ea699f90ccaf	249550
9745f797-2821-4bc9-94e0-5dd0a12b7561	a14d22c0-bfe9-4d43-a6c2-edc4be553cff	219379
0e28cc08-7158-499d-b877-44bfca9d91ee	9de84c68-6cc6-4a0d-ad12-27921d2a05f0	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
792fab3a-c5b6-4d7b-994b-bff28f30b254	6a9d6928-15b2-4f47-bd6b-fab77935ef08	610422
e7cd5146-4376-4e28-8844-3886c970b899	81657bfd-85b6-40e2-8ef3-8d6a10015d4d	614962
e7fb6a37-9057-4e5e-b985-e7d422e44766	96484ca9-24b6-4b8e-a7f1-8108bf416e67	\N
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
65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	1dbe86bf-2b2b-44cf-8f50-0b76234a43a9
f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	cb221d13-7e78-49b0-ae5e-649add11ab79
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
00fd1329-92f2-46d5-8b0e-ef3e39496a22	Сборка, сварка рам к/с г/п 120-130 т.	6	131e8092-997f-4a03-b7ce-f37ed559934a	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ManufacturingTime", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
1dbe86bf-2b2b-44cf-8f50-0b76234a43a9	Поперечина рамы задняя	75131-2801300-20	t	20	2	7cb821d8-da73-479b-8451-a8121b5dc9d9	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N	\N	\N
65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	Рама	7513D-2800010-20	t	10	1	7cb821d8-da73-479b-8451-a8121b5dc9d9	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N	\N	4536492774
cb221d13-7e78-49b0-ae5e-649add11ab79	Поперечина рамы задняя	75131-2801300-20	t	41	2	159b8e4c-51a7-4cb6-a467-70b558eb1bbc	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N	\N	\N
f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	Рама	75131-2800010-70	t	11	1	159b8e4c-51a7-4cb6-a467-70b558eb1bbc	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N	\N	4536479362
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
d0e0ffc1-a9c3-4892-bb29-8e01e4eb9589	Admin	\N
d65f2a5c-43de-4386-9b12-73802a434eee	Master	\N
ffb43c59-ccb8-4720-b3c9-06f8ba7c2644	Welder	\N
23596e4b-cab7-4e98-bcb6-d4a9dafce4b2	Inspector	\N
ad95564a-9956-4b75-9256-8f943484bd47	Chief	\N
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
11d1125e-e928-48d2-bf24-88796c5892bd	52	1200	t	f	1dbe86bf-2b2b-44cf-8f50-0b76234a43a9	fd11618a-5041-4a12-8aa5-d3359e8953d7	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
19c91aaa-3941-42ef-966a-8ca4dfd2fddb	18	4000	t	f	65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	6673afda-9553-4c37-876e-b2aeefc7d3ff	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
2969e3b3-5d2b-4928-a7a9-4925d9ce237c	2	1880	t	f	cb221d13-7e78-49b0-ae5e-649add11ab79	8c8699de-1891-4ac2-88a2-ad9b930a00a9	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
2ac2ca32-8873-4a5a-879c-041922bdc0c3	39	280	t	f	f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	3a0a4a9b-2971-4e55-80a6-fd7310332e5d	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
44932840-8965-4296-98d4-4a52e2a8f90e	57	400	t	f	65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	19d775bb-c7d5-4f5c-9f1e-be5893b97c61	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
44d80648-5d49-480c-8e52-28b449d39ccc	57	400	t	f	f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	19d775bb-c7d5-4f5c-9f1e-be5893b97c61	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
537e1825-9526-4302-89f0-8a0588fe0d36	18	4000	t	f	f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	6673afda-9553-4c37-876e-b2aeefc7d3ff	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
57e74f2e-3d96-4d57-bf73-c5445a1cf543	2	1880	t	f	1dbe86bf-2b2b-44cf-8f50-0b76234a43a9	8c8699de-1891-4ac2-88a2-ad9b930a00a9	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
59806023-99ef-4194-9725-9a2c09d0fad2	52	1200	t	f	cb221d13-7e78-49b0-ae5e-649add11ab79	fd11618a-5041-4a12-8aa5-d3359e8953d7	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
5f0bb3ff-233b-44d2-a177-dfa98a695025	58	900	t	f	65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	ca6e2b7a-35e3-4095-bb9f-063bcc496147	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
67aff815-4f3e-4ee9-a0fc-455b1c9884cf	1	1900	t	f	cb221d13-7e78-49b0-ae5e-649add11ab79	8e05e763-7a15-4474-8ecd-61f7d404f6c6	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
8d0a711a-6150-4f46-afc3-5951305ecb5f	54	400	t	f	65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	374be730-47be-481d-b7b0-2c62f89d0fc2	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
923cf569-d3d8-4277-998f-5c00260a27f5	54	400	t	f	f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	374be730-47be-481d-b7b0-2c62f89d0fc2	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
94f736b6-7ef5-4015-83d8-cff5a6691300	58	900	t	f	f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	ca6e2b7a-35e3-4095-bb9f-063bcc496147	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
9abdaee8-f30d-4853-b4c6-9079f33f3e88	55	400	t	f	f3f2e1f8-2001-4260-83ec-8b0ee7940c6f	ad664559-1265-4943-8748-8228fd480cb8	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
a445ba08-f0c8-40e8-b61b-6b2572920301	39	280	t	f	65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	3a0a4a9b-2971-4e55-80a6-fd7310332e5d	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
e0917cf6-fc2b-4287-82e9-c1c07cdc7a97	1	1900	t	f	1dbe86bf-2b2b-44cf-8f50-0b76234a43a9	8e05e763-7a15-4474-8ecd-61f7d404f6c6	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
f142f4d6-ea15-4867-b1a2-3e28b3616887	55	400	t	f	65c0ff67-7ec9-41a4-8d0d-79f58d1e2cad	ad664559-1265-4943-8748-8228fd480cb8	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
088df53c-2c31-4aad-b38f-5f2d74c5772e	56	Инструкция 56	56
19d775bb-c7d5-4f5c-9f1e-be5893b97c61	57	Инструкция 57	57
374be730-47be-481d-b7b0-2c62f89d0fc2	54	Инструкция 54	54
3a0a4a9b-2971-4e55-80a6-fd7310332e5d	39	Инструкция 39	39
6673afda-9553-4c37-876e-b2aeefc7d3ff	18	Инструкция 18	18
8c8699de-1891-4ac2-88a2-ad9b930a00a9	2	Инструкция 2	2
8e05e763-7a15-4474-8ecd-61f7d404f6c6	1	Инструкция 1	1
ad664559-1265-4943-8748-8228fd480cb8	55	Инструкция 55	55
b95f8177-83b1-42b3-bab6-6eadf63abe80	48	Инструкция 48	48
ca6e2b7a-35e3-4095-bb9f-063bcc496147	58	Инструкция 58	58
fd11618a-5041-4a12-8aa5-d3359e8953d7	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
159b8e4c-51a7-4cb6-a467-70b558eb1bbc	75131-2800010-70	Рама	\N	3291137
7cb821d8-da73-479b-8451-a8121b5dc9d9	7513D-2800010-20	Рама	\N	3330041
e0c09972-cd2a-4ce8-b9ba-222638c4d2e3	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
a14d22c0-bfe9-4d43-a6c2-edc4be553cff	23596e4b-cab7-4e98-bcb6-d4a9dafce4b2
e95d40e8-a80b-4021-aae9-ea699f90ccaf	23596e4b-cab7-4e98-bcb6-d4a9dafce4b2
6a9d6928-15b2-4f47-bd6b-fab77935ef08	d65f2a5c-43de-4386-9b12-73802a434eee
81657bfd-85b6-40e2-8ef3-8d6a10015d4d	d65f2a5c-43de-4386-9b12-73802a434eee
0a2174ff-caa0-4b50-b3ed-e896351431ca	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
1d846e3b-fb2d-4c66-86a2-0196643320c9	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
3c989bf8-1b78-4ad4-8b0c-d428fa1739e0	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
41abc5f0-74b1-4bcf-b491-a9dc440eed18	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
41f57dc0-de1b-44b3-8f59-144ab70cad44	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
5705fccd-a6ee-42df-b2cf-24203e941654	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
e0e2bd75-6f07-42bc-a063-7e5102fcb9a4	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
f62ef022-72b6-4dda-9adc-556315788e8f	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
314cae7a-86fa-4908-a442-22f3a87baf71	ad95564a-9956-4b75-9256-8f943484bd47
35f14cbd-3545-487b-b86a-69bd588a6dfb	d0e0ffc1-a9c3-4892-bb29-8e01e4eb9589
0256d292-36c0-40e5-8f05-70387b4141b6	ffb43c59-ccb8-4720-b3c9-06f8ba7c2644
9de84c68-6cc6-4a0d-ad12-27921d2a05f0	23596e4b-cab7-4e98-bcb6-d4a9dafce4b2
1c3a288b-133f-433f-8c27-ee9c5668e81b	ad95564a-9956-4b75-9256-8f943484bd47
96484ca9-24b6-4b8e-a7f1-8108bf416e67	d65f2a5c-43de-4386-9b12-73802a434eee
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
a14d22c0-bfe9-4d43-a6c2-edc4be553cff	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
e95d40e8-a80b-4021-aae9-ea699f90ccaf	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
6a9d6928-15b2-4f47-bd6b-fab77935ef08	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
81657bfd-85b6-40e2-8ef3-8d6a10015d4d	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
0a2174ff-caa0-4b50-b3ed-e896351431ca	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	B7:5A:79:B5
1d846e3b-fb2d-4c66-86a2-0196643320c9	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	D7:F1:7D:5A
3c989bf8-1b78-4ad4-8b0c-d428fa1739e0	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	D7:95:55:B4
41abc5f0-74b1-4bcf-b491-a9dc440eed18	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	67:5A:70:B4
41f57dc0-de1b-44b3-8f59-144ab70cad44	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	67:CD:7E:5A
5705fccd-a6ee-42df-b2cf-24203e941654	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	27:45:7E:B4
e0e2bd75-6f07-42bc-a063-7e5102fcb9a4	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	97:17:60:B4
f62ef022-72b6-4dda-9adc-556315788e8f	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	17:CD:7F:5A
314cae7a-86fa-4908-a442-22f3a87baf71	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
35f14cbd-3545-487b-b86a-69bd588a6dfb	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$JzIrqmjWygLi20K1Qt0a/MNgx8e8jWswsWkPcLOmALD38m4R	\N	\N	\N	\N	\N	\N
0256d292-36c0-40e5-8f05-70387b4141b6	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$xLwZrljIEbGjZk07IAcHb7wnjerA8zJY3qR6EBV2r0bdLfhx	\N	\N	\N	\N	\N	\N
9de84c68-6cc6-4a0d-ad12-27921d2a05f0	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$IDOVOL5dn3mhwbH2xtIfu7uFMdljUg7Qu6mljw7myeCID+H9	\N	\N	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
1c3a288b-133f-433f-8c27-ee9c5668e81b	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$3OPY9TYyvFk1CxNrwyc1U6mhWHqENBi0/c088ka5l4W2b1ET	\N	\N	\N	\N	\N	\N
96484ca9-24b6-4b8e-a7f1-8108bf416e67	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$9FW7MJcVDIjyZ8wd7/pa9AtA1gKhgxkO2otj4E7soZhPydnE	\N	\N	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
01711cd9-f0e9-4f6d-a2a6-a5f15e96a4b4	2	Заполняющий	270	310	23	26	\N	\N	8e05e763-7a15-4474-8ecd-61f7d404f6c6	\N
02383369-cbc2-47c4-b6e5-d816d1ffeeec	2	Заполняющий	270	310	23	26	\N	\N	b95f8177-83b1-42b3-bab6-6eadf63abe80	\N
02a87513-3057-492d-88f8-dfe4937c30be	2	Заполняющий	270	310	23	26	\N	\N	ca6e2b7a-35e3-4095-bb9f-063bcc496147	\N
072a0bbf-5153-4ade-bf5d-9932e89c6518	2	Заполняющий	270	310	23	26	\N	\N	19d775bb-c7d5-4f5c-9f1e-be5893b97c61	\N
0cb6884e-ce60-40c7-b2f9-46b37d04ff13	1	Корневой	200	270	23	26	\N	\N	8e05e763-7a15-4474-8ecd-61f7d404f6c6	\N
1ef2d4be-7239-47d5-9aed-0d7e2a9f2765	2	Заполняющий	270	310	23	26	\N	\N	6673afda-9553-4c37-876e-b2aeefc7d3ff	\N
28b09802-c576-49dd-85bb-f94f20c87a82	2	Заполняющий	270	310	23	26	\N	\N	3a0a4a9b-2971-4e55-80a6-fd7310332e5d	\N
2f6e34dc-ab8d-40a9-9213-8dd5cf705cd0	2	Заполняющий	270	310	23	26	\N	\N	374be730-47be-481d-b7b0-2c62f89d0fc2	\N
3123de3a-8d8e-48d0-95ce-7388e30e4c9e	1	Корневой	200	270	23	26	\N	\N	ad664559-1265-4943-8748-8228fd480cb8	\N
43d493b9-b663-4590-bf9b-604d2c35b85b	1	Корневой	200	270	23	26	\N	\N	19d775bb-c7d5-4f5c-9f1e-be5893b97c61	\N
63ee61ca-b105-468c-9b07-701a99c679b7	1	Корневой	200	270	23	26	\N	\N	3a0a4a9b-2971-4e55-80a6-fd7310332e5d	\N
69c4a7fa-daeb-4ad1-94ff-cb44512d3867	1	Корневой	200	270	23	26	\N	\N	6673afda-9553-4c37-876e-b2aeefc7d3ff	\N
725e6760-74b3-42bd-92a2-0b37fbd481d2	1	Корневой	200	270	23	26	\N	\N	ca6e2b7a-35e3-4095-bb9f-063bcc496147	\N
78fe25cf-bfe6-4bfe-a269-f940203c947a	2	Заполняющий	270	310	23	26	\N	\N	fd11618a-5041-4a12-8aa5-d3359e8953d7	\N
79bfea4c-2f63-42b1-904a-3fa82b877ccd	1	Корневой	200	270	23	26	\N	\N	374be730-47be-481d-b7b0-2c62f89d0fc2	\N
887a5da0-291a-4350-928c-0db8d5e96469	2	Заполняющий	270	310	23	26	\N	\N	ad664559-1265-4943-8748-8228fd480cb8	\N
9c9a69a1-85bf-4c73-86b9-e1cd216345c7	1	Корневой	200	270	23	26	\N	\N	8c8699de-1891-4ac2-88a2-ad9b930a00a9	\N
9d11ef1e-4c2c-43c3-8466-d1798e1aa0e7	1	Корневой	200	270	23	26	\N	\N	b95f8177-83b1-42b3-bab6-6eadf63abe80	\N
b771fa63-1d7d-4161-a1b0-6eac91bab5e1	2	Заполняющий	270	310	23	26	\N	\N	088df53c-2c31-4aad-b38f-5f2d74c5772e	\N
bb1135a1-0ec4-4487-9365-b2e62b7d162f	1	Корневой	200	270	23	26	\N	\N	fd11618a-5041-4a12-8aa5-d3359e8953d7	\N
ec20304c-1b01-40ff-b163-18320798c25d	1	Корневой	200	270	23	26	\N	\N	088df53c-2c31-4aad-b38f-5f2d74c5772e	\N
efeb29d7-c59f-465b-9209-17f12090b3a3	2	Заполняющий	270	310	23	26	\N	\N	8c8699de-1891-4ac2-88a2-ad9b930a00a9	\N
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
1ecfe705-8482-46a6-bb8e-b580721a2187	58c9bd44-3b62-4a38-a4b0-e6cee47409c6
1ecfe705-8482-46a6-bb8e-b580721a2187	664fa6b3-3e18-43a5-b788-463d0c9f86e3
55793544-ad2b-4a2f-b669-00f212463afb	58c9bd44-3b62-4a38-a4b0-e6cee47409c6
55793544-ad2b-4a2f-b669-00f212463afb	664fa6b3-3e18-43a5-b788-463d0c9f86e3
69d00c30-eca7-4447-848c-32bae138b6b0	1fd9f071-cfe5-4227-90b0-7a5b5b338430
7d400758-5eb5-47da-8bc3-b5904d65a234	df179744-7015-413f-b595-9713bdb26306
bd1be82a-e03b-4577-b845-c823c73e8a55	1fd9f071-cfe5-4227-90b0-7a5b5b338430
c917d890-560d-4b3f-b654-b7a4d148e295	df179744-7015-413f-b595-9713bdb26306
dc94328d-a40b-420f-98d9-af93592573fd	58c9bd44-3b62-4a38-a4b0-e6cee47409c6
dc94328d-a40b-420f-98d9-af93592573fd	664fa6b3-3e18-43a5-b788-463d0c9f86e3
f430668a-b5af-4f85-9d2f-4e414077bd3d	58c9bd44-3b62-4a38-a4b0-e6cee47409c6
f430668a-b5af-4f85-9d2f-4e414077bd3d	664fa6b3-3e18-43a5-b788-463d0c9f86e3
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
1ecfe705-8482-46a6-bb8e-b580721a2187	e0e2bd75-6f07-42bc-a063-7e5102fcb9a4	\N	150838
55793544-ad2b-4a2f-b669-00f212463afb	f62ef022-72b6-4dda-9adc-556315788e8f	\N	150882
69d00c30-eca7-4447-848c-32bae138b6b0	3c989bf8-1b78-4ad4-8b0c-d428fa1739e0	\N	132695
7d400758-5eb5-47da-8bc3-b5904d65a234	0a2174ff-caa0-4b50-b3ed-e896351431ca	\N	121267
bd1be82a-e03b-4577-b845-c823c73e8a55	41f57dc0-de1b-44b3-8f59-144ab70cad44	\N	122575
c917d890-560d-4b3f-b654-b7a4d148e295	41abc5f0-74b1-4bcf-b491-a9dc440eed18	\N	117390
dc94328d-a40b-420f-98d9-af93592573fd	1d846e3b-fb2d-4c66-86a2-0196643320c9	\N	114729
f430668a-b5af-4f85-9d2f-4e414077bd3d	5705fccd-a6ee-42df-b2cf-24203e941654	\N	146164
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
1fd9f071-cfe5-4227-90b0-7a5b5b338430	45f68564-9800-4a54-b876-9cf7aa6ddc1b
1fd9f071-cfe5-4227-90b0-7a5b5b338430	da913101-3766-4b52-9cf3-c6798cfaf654
58c9bd44-3b62-4a38-a4b0-e6cee47409c6	0a7ef2ef-7f35-463f-9871-6d10869a782c
58c9bd44-3b62-4a38-a4b0-e6cee47409c6	45f68564-9800-4a54-b876-9cf7aa6ddc1b
58c9bd44-3b62-4a38-a4b0-e6cee47409c6	4e176dfe-c3a6-4732-afda-8cadb7581843
58c9bd44-3b62-4a38-a4b0-e6cee47409c6	f099f74d-b2f5-463e-995d-fc66a8d47617
664fa6b3-3e18-43a5-b788-463d0c9f86e3	0a7ef2ef-7f35-463f-9871-6d10869a782c
664fa6b3-3e18-43a5-b788-463d0c9f86e3	45f68564-9800-4a54-b876-9cf7aa6ddc1b
664fa6b3-3e18-43a5-b788-463d0c9f86e3	4e176dfe-c3a6-4732-afda-8cadb7581843
664fa6b3-3e18-43a5-b788-463d0c9f86e3	f099f74d-b2f5-463e-995d-fc66a8d47617
df179744-7015-413f-b595-9713bdb26306	378857bf-a037-430c-ab18-0069f06ffd20
df179744-7015-413f-b595-9713bdb26306	f099f74d-b2f5-463e-995d-fc66a8d47617
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
1fd9f071-cfe5-4227-90b0-7a5b5b338430	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	792fab3a-c5b6-4d7b-994b-bff28f30b254	49286	35:4E:AC:A5
58c9bd44-3b62-4a38-a4b0-e6cee47409c6	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	792fab3a-c5b6-4d7b-994b-bff28f30b254	49283	A6:F1:CF:48
664fa6b3-3e18-43a5-b788-463d0c9f86e3	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	792fab3a-c5b6-4d7b-994b-bff28f30b254	49141	93:57:D8:0B
df179744-7015-413f-b595-9713bdb26306	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	792fab3a-c5b6-4d7b-994b-bff28f30b254	49232	03:3D:93:0D
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
671ed9a8-a595-442c-a764-3e9b2197ab7e	1	07:30:00	16:00:00	12:00:00	12:30:00	\N	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
74473f8b-783e-4fe8-a902-a502e78de534	2	16:00:00	00:30:00	20:00:00	20:30:00	\N	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
f7c4ba92-119e-4405-b701-1f6bece7033c	3	00:30:00	07:50:00	02:00:00	02:20:00	\N	ff416f7b-f798-45a1-bd38-5f889eb9c683	\N
01838292-b99d-453e-bbe7-77fb6f6e9965	2	16:00:00	23:30:00	20:00:00	20:30:00	fec8ee66-8e3a-4d8f-aef9-7324f0e172b6	\N	\N
0869e20c-845c-4858-b6e1-5c6d628ba669	1	07:30:00	15:00:00	12:00:00	12:30:00	07eca568-8e29-41c2-9ce5-daa9f4563eea	\N	\N
12a40462-eb63-49c5-a68b-93f97ddb2d4a	1	07:30:00	15:00:00	12:00:00	12:30:00	fa6e0d86-8b04-49df-aed1-4cc357f898e8	\N	\N
14cec5fa-5bb2-42e5-86c8-523a2eb27c30	1	07:30:00	15:00:00	12:00:00	12:30:00	983e19ae-2bd5-4007-9b86-690cf9c083aa	\N	\N
18278861-a032-4c48-976b-c945719e6b0d	2	16:00:00	23:30:00	20:00:00	20:30:00	bec18a1e-9acd-4edc-83d2-06ce000793ab	\N	\N
1b86de1e-e5eb-4084-a514-5a55b9335da3	3	00:30:00	06:50:00	02:00:00	02:20:00	bec18a1e-9acd-4edc-83d2-06ce000793ab	\N	\N
1b903c9c-f91d-4e62-8896-3ac14fd83bb7	2	16:00:00	23:30:00	20:00:00	20:30:00	07eca568-8e29-41c2-9ce5-daa9f4563eea	\N	\N
32746081-714e-4f28-8f6c-046fc1c2557d	1	07:30:00	15:00:00	12:00:00	12:30:00	bec18a1e-9acd-4edc-83d2-06ce000793ab	\N	\N
5ef55df7-6c4c-4015-90f3-8529bdeab76c	1	07:30:00	15:00:00	12:00:00	12:30:00	fec8ee66-8e3a-4d8f-aef9-7324f0e172b6	\N	\N
8a0d1231-6354-41e9-b09d-b1350cf360e5	3	00:30:00	06:50:00	02:00:00	02:20:00	fa6e0d86-8b04-49df-aed1-4cc357f898e8	\N	\N
c00a1203-58d9-45d1-a9ce-35d9dc1ac4ea	3	00:30:00	06:50:00	02:00:00	02:20:00	07eca568-8e29-41c2-9ce5-daa9f4563eea	\N	\N
db47e66d-75c6-45e9-803a-5ab76145b105	3	00:30:00	06:50:00	02:00:00	02:20:00	983e19ae-2bd5-4007-9b86-690cf9c083aa	\N	\N
dc4b2cd5-ece5-4fff-b4c9-d7c3ef23867f	2	16:00:00	23:30:00	20:00:00	20:30:00	fa6e0d86-8b04-49df-aed1-4cc357f898e8	\N	\N
ddb9e001-7497-4571-b120-348b364750ba	2	16:00:00	23:30:00	20:00:00	20:30:00	983e19ae-2bd5-4007-9b86-690cf9c083aa	\N	\N
edca0798-abd5-4af3-a0df-a049f050b5d6	3	00:30:00	06:50:00	02:00:00	02:20:00	fec8ee66-8e3a-4d8f-aef9-7324f0e172b6	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0a7ef2ef-7f35-463f-9871-6d10869a782c	3550	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	3550
378857bf-a037-430c-ab18-0069f06ffd20	3600	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	3600
45f68564-9800-4a54-b876-9cf7aa6ddc1b	3500	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	3500
4e176dfe-c3a6-4732-afda-8cadb7581843	3690	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	3690
da913101-3766-4b52-9cf3-c6798cfaf654	3510	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	3510
f099f74d-b2f5-463e-995d-fc66a8d47617	3610	\N	00fd1329-92f2-46d5-8b0e-ef3e39496a22	3610
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
131e8092-997f-4a03-b7ce-f37ed559934a	Сварочный цех	50	050
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
-- Name: Roles PK_Roles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_Roles" PRIMARY KEY ("Id");


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
-- Name: UserRoles PK_UserRoles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "PK_UserRoles" PRIMARY KEY ("RoleId", "UserId");


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
-- Name: IX_Roles_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Roles_IdFromSystem" ON public."Roles" USING btree ("IdFromSystem");


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
-- Name: IX_UserRoles_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_UserRoles_UserId" ON public."UserRoles" USING btree ("UserId");


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
-- Name: UserRoles FK_UserRoles_Roles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Roles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- Name: UserRoles FK_UserRoles_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


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

