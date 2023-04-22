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
    "Information" character varying(200) NOT NULL,
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
c3b740ce-d976-4935-bf57-b7041048afa4	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
5c33a10d-718f-43db-9833-5cb14a9ee015	444e63ba-5290-40c6-9db5-7adb6eefbdf5	82cb47d8-75ea-438a-ba46-98d8d7b87fce	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
01416889-f839-4d4b-b2e2-87505ae2d237	9	23	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
058b4bde-57d7-4dd4-b08e-05f2ac214a79	6	4	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
066de22e-99f3-446e-abd3-9320dcf629ac	2	12	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
0b20549b-dfac-41a1-93c5-6f360a288c8b	3	8	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
0e5acd88-f985-4d0f-8049-2dd2cb8f7d4b	4	24	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
0e67632c-f7b2-4966-94a7-f4ca58fa12e4	5	6	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
0eb7cf9a-58d4-417f-b52f-47e18df5c4e8	12	3	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
12723f5d-ca87-4a78-8a78-4ca44c432078	3	4	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
15b2043f-20b6-431b-b7bd-ffb9b220496a	8	6	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
163f632e-356d-4c87-a8ea-93d826df80b9	1	22	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
1ae2b2ee-f1e8-4607-b5f0-9c40411752dc	11	5	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
1c4111d1-0af7-4708-bc45-a00fb15ef732	7	2	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
1c5ae27b-1b3d-4650-b1d2-8d76832afe85	3	26	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
207f8bd0-aad1-4d3b-a1cc-c4a84f597e7e	5	7	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
23e4760c-5539-4e06-a2ef-38f289be4daf	5	8	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
24a4f850-7088-4890-8722-b13b30c0dffc	10	29	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
2a6ab28a-32f9-4501-ba94-2f3548da741b	1	2	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
2aec2641-03d9-410d-8422-893898fdebc7	3	25	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
306abc73-5090-41b2-b6cd-79eb6e271fd8	6	24	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
30b9ee68-0846-4ddd-9b06-8b6f5feeedd8	9	17	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
31420e69-b1d9-4f78-a4cb-da2fc78a348e	11	4	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
35b475f3-4e4d-4d8e-8782-1ea407816795	1	29	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
365a28fe-ded7-4bfc-a5b6-0768722b0d07	4	15	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
373be00b-f5cc-47d3-8fb1-410b77a3dc8d	11	25	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
3c00a837-e0e4-4428-b732-212aaa894f84	1	15	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
3d71311e-9d0e-431b-83ec-b2cc892a6e85	4	1	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
41ed9423-3876-4fe3-9f83-22bbbeb69948	12	24	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
47151b77-d40d-442a-9e7e-bc4cf9a6d027	5	1	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
4752fc04-89f6-4bbf-b3b9-0042379b8124	4	16	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
4a6d6edd-3424-4191-b91b-5b2787fa19f8	8	26	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
4c0d4ab6-1273-4732-b701-5cb8bd1942ba	1	1	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
4ec0655f-c210-4b19-86dc-cfa6ffe0ba71	5	9	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
558b353a-86da-4d06-a906-8eeea95805c0	9	16	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
578d69d5-22d9-494e-b89e-4cb725af9985	12	17	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
57f55e3c-a08d-4772-8751-b3a5ce8246f5	12	9	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
580a5eca-ff41-46f1-b786-be4daf17b108	2	25	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
591fdf3e-edcc-49f7-a355-e51600403986	9	2	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
5cd0bdc0-c9d8-4ba6-9a0b-0324429f0c5e	4	29	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
5d576046-644e-4272-9d35-46366e55ce34	8	27	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
643d8e4b-b706-4657-82c9-fd1db6d00bce	12	23	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
663c986e-dbf5-41f3-bdc2-3b5b6d5a3b2d	7	30	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
6705707a-c650-4125-a2b3-33595a539e55	7	23	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
67599f34-ab09-422b-abff-612ace630956	11	12	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
6812eb30-992e-45e9-931d-e648b56e3da6	4	8	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
6a763397-105f-44e5-bb92-ff1169add59f	10	22	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
6ce67feb-1553-46f9-8cf4-dee177e73da1	9	9	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
6fe2c35d-f8ed-4705-b7fc-b7df063743be	8	20	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
7181201c-bac6-4f48-aee9-2e2a2dde09cb	1	28	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
72967668-ead2-4618-98d8-3cc9e293cc33	11	7	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
76a2de32-f2fe-4afe-a841-9db1bb8c5daa	10	7	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
79412c03-b2d1-41aa-b8f5-7546bf7e1fde	12	16	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
7db8bf59-cd38-434b-891b-a9e67bf54977	3	18	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
804fa154-bcd8-452c-813e-4d9402132d90	6	3	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
80c4f373-635c-44f8-add0-1e580f1eea07	1	14	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
826b3364-42da-4ce5-b57b-4aa0bdecb4ed	9	30	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
83cc0a2c-8e53-4d8e-9ba5-ffc46691c8aa	8	12	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
8a678058-b923-4782-823e-c675cbdf3cc5	3	5	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
8c33e3bf-9848-44c8-94bc-07f12ca48f69	7	1	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
8dfcc632-492a-417e-b494-8c138c6ec5a2	11	26	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
8fb1f061-c715-4517-9948-0bdea4d3e9bb	2	19	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
90bf5607-cc31-46a5-ad69-e911257018ab	11	6	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
913ffcb2-d2ea-44ff-8af1-e423bc5e6b89	4	23	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
91870af6-a309-4834-8eb5-c5e12e3bfc86	10	1	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
92d8adec-f14a-4d32-aafc-8a9521b8d3de	12	25	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
92ef01ee-7090-4c58-899a-12dd8142037a	4	2	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
94f93d73-883c-4923-9a68-b967619b124a	1	6	t	c3b740ce-d976-4935-bf57-b7041048afa4	\N
9676d245-7411-41d8-8813-2e7d23870b9a	5	28	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
96925d45-b643-40cb-9427-326752890b40	4	22	t	c3b740ce-d976-4935-bf57-b7041048afa4	\N
98252cd5-b7db-41c9-9dc9-4f467cd593dd	2	4	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
9863ac10-f0ba-49b4-a553-6cb45c2ac852	3	12	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
9880fcb1-8594-4396-bec1-1675f19406f5	7	9	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
993d5077-c2fa-4806-84ee-de57f1fd1c16	2	11	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
9aa0bdfb-112f-4ff7-8052-e8d52b2541f3	4	9	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
9f4d0cb5-8e19-41d6-9dc7-0c34c6377798	12	31	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
a1fa1656-095b-401f-b02b-dd14b1f2df62	1	21	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
a21de0bd-cc9e-4c8a-b39c-219d187f639b	10	14	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
aa694846-11f3-4b07-993b-c1817be5dc74	2	26	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
aa806d90-94cf-4a37-b2e2-d97878a54945	3	7	t	c3b740ce-d976-4935-bf57-b7041048afa4	\N
ac760502-299b-4083-a246-bc4542a0a63a	8	19	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
b14c0ec4-7734-4b90-beb4-b4a9c4a07d2e	10	15	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
b479b767-79f7-47b9-81f7-ccf9d74336f7	7	8	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
b63112fb-c324-4bfb-8a1d-fd22cc82f5aa	6	10	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
b7f6c7aa-b715-4385-b84c-43be96256c97	9	3	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
b801ab34-e40d-479d-a244-a80708c6555e	8	5	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
bba92156-ef54-43c2-abdc-4576f3c424f1	5	14	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c25aae01-4824-4a47-8fd1-feb79af35ed7	6	11	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c445f182-845a-421b-91b8-5c1d234371fb	1	8	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c5ada36a-a8c0-4f15-9315-f88aa08d179a	10	28	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c6e8a512-5b0b-4124-8df9-e0317ddcdae3	2	5	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c803e977-2605-457a-a74d-3c13bb76e940	7	29	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c93b9dc1-b596-4f2a-966c-56227f5bbe43	4	30	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c96057d6-e455-4578-8b22-4589e8776793	6	17	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
c9ceef07-5d4c-444d-a18a-ddda7bd35a92	2	18	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
cdf91bb9-6391-4d5f-9161-7cbfb96e925e	11	19	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
d48f461e-dff8-49e4-a936-8169eb8d9c2d	5	27	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
d64b9254-a996-4fbe-9ac6-541cdb3a7e99	7	16	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
d707b88a-7403-4787-a8bb-f036264acdf8	7	15	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
d9f6c19f-dad0-40f9-b55c-f323e0f766fa	12	2	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
da8df7f3-94bb-4844-ba99-5dd29fcaf699	3	19	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
dbe9baae-c7c0-41cd-9510-873726be08d2	5	20	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
de932194-84f4-4169-9be5-5e9c1a4ab6ed	5	21	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
e03d224e-8036-4912-9405-57d378d1fd8a	8	13	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
e0503f1e-da9d-4a06-8880-2a2965631180	12	10	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
e2329a57-46fd-4c26-ba80-725d60fd78ff	12	30	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
ea5234a0-7d31-43b8-8757-e7b0ab784e50	5	13	t	c3b740ce-d976-4935-bf57-b7041048afa4	\N
eadfaf0c-857b-4b3a-aa4d-076f89b42259	7	22	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
eb98baee-7fdd-4a6f-855e-34f7034a870d	4	25	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
eccaaf59-4dce-49ed-ae25-f6b695c34fe3	6	18	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f2b47325-9bb4-4613-b72b-ee26d7bfa713	1	7	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f61a4012-374a-41cb-91e0-7ad9792b87e8	10	8	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f6421388-fed9-4719-8922-caa9e51c5005	11	18	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f6bd9e01-7bbe-47cb-beff-5d1368bc753c	9	24	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f6c473dc-3eb0-4ee2-897e-02c74ec6ab85	3	11	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f74f848d-8ef3-430b-bdae-a8a6284fdcc0	6	25	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
f79bb3b6-4586-4ff8-9c76-2b9126ef72ed	11	11	t	c3b740ce-d976-4935-bf57-b7041048afa4	\N
fa6ce8f0-824b-48e8-a003-9aecbed7be64	9	10	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
ffbdf8f4-b37d-4ca5-8b15-d68c7c6a3a63	10	21	f	c3b740ce-d976-4935-bf57-b7041048afa4	\N
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
024511f2-4708-4fa0-a0c9-c3c27338d5e7	Праздники и выходные	\N
15e506ef-fd07-4f61-ab56-0bcec751a05f	Нерабочее время по графику согласно сменности	\N
196ec30a-3177-4044-9f4c-693ebd03584e	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
2061fbf3-7286-4cb0-ae2e-434a836cb789	Неявка оператора (б/лист, отпуск, и пр.)	\N
2fbe099d-d8ae-42fd-b2dd-9e99cd9c410c	Установка, выверка, снятие детали	\N
38b6ecfc-3f13-4a57-851d-b860cc851e80	Аварийный ремонт централизованными службами	\N
58e56df1-ba33-46c0-a826-f5de08e11460	Отсутствие оператора в связи с необеспеченностью	\N
5f0f62c8-d717-4023-be15-cbf55f15f848	Обед	\N
6c3d887f-d692-4609-9aed-375c21e31f50	Ознакомление с работой, документацией, инструктаж	\N
708a1e89-07d3-4086-9f70-bdc5629be86a	Сборочные операции	\N
773d876e-c2dc-4b19-819b-1850e73c5492	Работа по карте несоответствий	\N
82b65312-e5ac-4f04-8468-65ce44b6ee6a	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
90fd41af-96c8-4e95-a292-a6805b7a7ab2	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
95060702-e4d7-4acd-94e0-b030f1edd9da	Естественные надобности	\N
9c477da8-6259-4ca4-af9b-2718a9b3e27a	Отсутствие сотрудника ОТК	\N
a0dbb534-61f1-4640-97be-38e59bce1a59	Отсутствие заданий	\N
a51de148-b3f5-4a76-ab5f-adaf5b714291	Контроль на рабочем месте	\N
a8dfd92b-1f03-4f2a-aa3e-7c6cdeae7108	Отсутствие крана, транспорта	\N
b2992f8d-0cb1-4a53-bc9f-3b4bdb56f01c	Плановый ремонт централизованными службами	\N
b5963500-9a7d-406d-afed-08ae0cc31e9c	Отсутствие конструктора, технолога или ожидание его решения	\N
baefd697-b9dd-46aa-8afd-94fa23e2e0bc	Установка, выверка, снятие детали	\N
bee2b1ec-d8a9-481e-a24c-d103b9fcdc6c	Работа с управляющей программой	\N
e255425c-4e10-4adb-b51a-1f0136d0eeaf	Изменение режимов, смена инструмента, приспособления	\N
f127cf46-7cbb-4f27-8274-70c565de8bbb	Отсутствие энергоносителей	\N
ff4ef06d-0c2d-4b6a-bb4b-6be071af67c3	Отсутствие материала, заготовок, деталей	\N
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
0a00ee32-3a05-4b1c-ba4b-d471f253d010	64f2fc38-cee7-4b31-b003-c1d2d018f9af	219379
7d870398-bcdf-43b9-b1e7-5b8f2e45e2e8	f4f8f712-be9c-40fd-accd-d69ad33a8a71	249550
75d704c4-ff5c-42a0-9c62-dd3e395e0aad	068708b3-423f-47c2-ad0e-e2bb8fe35885	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
80383e0d-86e8-4fa6-85fc-0901e5f3ad71	6e08c36d-c5e6-44a2-aa6a-7ccaa199597e	610422
8c407eed-683d-42aa-9804-804c020822bf	748e0dac-0072-4be5-8c3d-6bba4d661cf9	614962
7b6120c8-8e91-4e14-a119-07fc45e0ff52	12247a2f-d7a3-47a4-b3a3-602d19801c37	\N
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
da2f2a39-7976-4075-bd25-3228e75c6585	31e48b68-c0dc-440b-9cb6-a17beba64508
30c7788b-bc56-43d2-8d67-299a3e54808a	5199c251-fe52-48b6-a60b-81d6f6b2c4e3
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
7b47cceb-4866-4ab8-855f-437e9237e127	Сборка, сварка рам к/с г/п 120-130 т.	6	82cb47d8-75ea-438a-ba46-98d8d7b87fce	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ManufacturingTime", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
30c7788b-bc56-43d2-8d67-299a3e54808a	Рама	75131-2800010-70	t	11	1	6b22785d-efa7-49c8-a717-3412982d0710	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N	\N	4536479362
31e48b68-c0dc-440b-9cb6-a17beba64508	Поперечина рамы задняя	75131-2801300-20	t	20	2	71ba995c-ba88-4ed1-b2ec-6b4407e51c74	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N	\N	\N
5199c251-fe52-48b6-a60b-81d6f6b2c4e3	Поперечина рамы задняя	75131-2801300-20	t	41	2	6b22785d-efa7-49c8-a717-3412982d0710	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N	\N	\N
da2f2a39-7976-4075-bd25-3228e75c6585	Рама	7513D-2800010-20	t	10	1	71ba995c-ba88-4ed1-b2ec-6b4407e51c74	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N	\N	4536492774
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
a4361722-6fc3-4131-8fc9-732bdfbc76e2	Admin	\N
22238500-6efa-4c6b-9fd4-b3092ff28c3e	Master	\N
23c92f2d-8189-4b01-9db1-287c7828a671	Welder	\N
24be933e-8303-42bb-ac9a-5ec526c28494	Inspector	\N
6dbf50cd-4e18-45ec-8fd7-601ab92c945c	Chief	\N
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
07d71373-8e30-4672-8e14-15e85a349d7a	1	1900	t	f	31e48b68-c0dc-440b-9cb6-a17beba64508	3df630de-7066-41b7-9242-9c29908573e8	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
171befc7-9632-493b-9abf-87ac9e32fb51	57	400	t	f	da2f2a39-7976-4075-bd25-3228e75c6585	f62555f9-f1fb-4bed-8d03-2e32839a1631	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
1bf7a5cf-10dc-4df4-8d82-37a7fc235271	55	400	t	f	da2f2a39-7976-4075-bd25-3228e75c6585	59f52d52-cdf6-44db-96f3-2220adc882ae	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
1bfc75a2-4e2e-4b40-b75f-ffaab839afc4	54	400	t	f	da2f2a39-7976-4075-bd25-3228e75c6585	4967485e-7866-4be8-9763-c770af8ae454	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
23102cf7-ae1f-489e-8e65-83debf173ebb	39	280	t	f	30c7788b-bc56-43d2-8d67-299a3e54808a	b261c239-b62b-46d2-9012-9ce82eb2fa57	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
3d6a41c5-2573-44a3-a5f2-a8fab6b4fd16	18	4000	t	f	da2f2a39-7976-4075-bd25-3228e75c6585	d97d0b39-70c7-437f-ad28-76a687c0a148	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
55cc11c7-8873-421f-b8c6-d96068ec620f	39	280	t	f	da2f2a39-7976-4075-bd25-3228e75c6585	b261c239-b62b-46d2-9012-9ce82eb2fa57	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
640c60cb-2041-4678-8d1d-3065d73fe937	58	900	t	f	da2f2a39-7976-4075-bd25-3228e75c6585	c946c34b-7814-4d0c-8eb5-7f74247e38dc	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
6d4e951c-116c-4ab2-bda7-abe56584bb5e	1	1900	t	f	5199c251-fe52-48b6-a60b-81d6f6b2c4e3	3df630de-7066-41b7-9242-9c29908573e8	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
89d7b35d-5929-4d19-acb4-0bf54a94d891	52	1200	t	f	31e48b68-c0dc-440b-9cb6-a17beba64508	4728c4e9-ed55-4251-9aa2-bb63a3d6ef44	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
8fa02093-f1e2-4df1-8371-bb205c801a51	2	1880	t	f	5199c251-fe52-48b6-a60b-81d6f6b2c4e3	1e223e7e-d789-40f3-8717-27b4774c6d35	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
af0c30f0-f4ca-481c-8261-c8fb25a58b49	55	400	t	f	30c7788b-bc56-43d2-8d67-299a3e54808a	59f52d52-cdf6-44db-96f3-2220adc882ae	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
b6110f19-8834-4172-acd2-d93d879fd171	52	1200	t	f	5199c251-fe52-48b6-a60b-81d6f6b2c4e3	4728c4e9-ed55-4251-9aa2-bb63a3d6ef44	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
bc70bf33-96f0-4add-b343-e56e9647a8be	2	1880	t	f	31e48b68-c0dc-440b-9cb6-a17beba64508	1e223e7e-d789-40f3-8717-27b4774c6d35	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
d03e4023-3158-4d22-a407-f3c63f8c2453	57	400	t	f	30c7788b-bc56-43d2-8d67-299a3e54808a	f62555f9-f1fb-4bed-8d03-2e32839a1631	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
ec909628-da9f-490e-b6dd-30e88cc40a2e	54	400	t	f	30c7788b-bc56-43d2-8d67-299a3e54808a	4967485e-7866-4be8-9763-c770af8ae454	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
f3179a04-2e12-45c8-9917-5b1c209c027c	58	900	t	f	30c7788b-bc56-43d2-8d67-299a3e54808a	c946c34b-7814-4d0c-8eb5-7f74247e38dc	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
fb64484e-5b19-403a-84b4-643c4d979fb0	18	4000	t	f	30c7788b-bc56-43d2-8d67-299a3e54808a	d97d0b39-70c7-437f-ad28-76a687c0a148	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
1e223e7e-d789-40f3-8717-27b4774c6d35	2	Инструкция 2	2
3df630de-7066-41b7-9242-9c29908573e8	1	Инструкция 1	1
4728c4e9-ed55-4251-9aa2-bb63a3d6ef44	52	Инструкция 52	52
4967485e-7866-4be8-9763-c770af8ae454	54	Инструкция 54	54
5977aefd-87c3-4dcc-8360-d9bd0b04bcda	56	Инструкция 56	56
59f52d52-cdf6-44db-96f3-2220adc882ae	55	Инструкция 55	55
7e135513-dd1e-4b4a-acb7-9a9e90e2710b	48	Инструкция 48	48
b261c239-b62b-46d2-9012-9ce82eb2fa57	39	Инструкция 39	39
c946c34b-7814-4d0c-8eb5-7f74247e38dc	58	Инструкция 58	58
d97d0b39-70c7-437f-ad28-76a687c0a148	18	Инструкция 18	18
f62555f9-f1fb-4bed-8d03-2e32839a1631	57	Инструкция 57	57
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
6b22785d-efa7-49c8-a717-3412982d0710	75131-2800010-70	Рама	\N	3291137
6dc36886-33e6-47ff-b587-175e7e663e08	75131-2801300-20	Поперечина рамы задняя	\N	2868425
71ba995c-ba88-4ed1-b2ec-6b4407e51c74	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
64f2fc38-cee7-4b31-b003-c1d2d018f9af	24be933e-8303-42bb-ac9a-5ec526c28494
f4f8f712-be9c-40fd-accd-d69ad33a8a71	24be933e-8303-42bb-ac9a-5ec526c28494
6e08c36d-c5e6-44a2-aa6a-7ccaa199597e	22238500-6efa-4c6b-9fd4-b3092ff28c3e
748e0dac-0072-4be5-8c3d-6bba4d661cf9	22238500-6efa-4c6b-9fd4-b3092ff28c3e
361a45f2-e5b1-496d-9826-7f4b126ba221	23c92f2d-8189-4b01-9db1-287c7828a671
3bcbbcb8-69dc-4d55-8645-f15355a09998	23c92f2d-8189-4b01-9db1-287c7828a671
50256a72-cf20-40c7-a0a9-a9526ac50752	23c92f2d-8189-4b01-9db1-287c7828a671
6b40bfd7-2c87-483e-a27e-d972f1181b48	23c92f2d-8189-4b01-9db1-287c7828a671
726c1fa3-65c5-4935-8429-c0b94d27a4e7	23c92f2d-8189-4b01-9db1-287c7828a671
7c49c66f-5a46-4080-a550-7d4fcceead97	23c92f2d-8189-4b01-9db1-287c7828a671
94f831c0-c920-41ec-a0ec-b3abfcd94ba7	23c92f2d-8189-4b01-9db1-287c7828a671
b07bb229-60db-415f-9543-dc30b8cda02e	23c92f2d-8189-4b01-9db1-287c7828a671
444e63ba-5290-40c6-9db5-7adb6eefbdf5	6dbf50cd-4e18-45ec-8fd7-601ab92c945c
122e9097-201b-4e04-8001-3080b0649781	a4361722-6fc3-4131-8fc9-732bdfbc76e2
ef5566db-a102-4010-9606-f0b786c497a3	23c92f2d-8189-4b01-9db1-287c7828a671
068708b3-423f-47c2-ad0e-e2bb8fe35885	24be933e-8303-42bb-ac9a-5ec526c28494
d11d17db-6ccc-4688-aa04-4d842305ce1c	6dbf50cd-4e18-45ec-8fd7-601ab92c945c
12247a2f-d7a3-47a4-b3a3-602d19801c37	22238500-6efa-4c6b-9fd4-b3092ff28c3e
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
64f2fc38-cee7-4b31-b003-c1d2d018f9af	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
f4f8f712-be9c-40fd-accd-d69ad33a8a71	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
6e08c36d-c5e6-44a2-aa6a-7ccaa199597e	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
748e0dac-0072-4be5-8c3d-6bba4d661cf9	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
361a45f2-e5b1-496d-9826-7f4b126ba221	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	17:CD:7F:5A
3bcbbcb8-69dc-4d55-8645-f15355a09998	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	B7:5A:79:B5
50256a72-cf20-40c7-a0a9-a9526ac50752	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	67:CD:7E:5A
6b40bfd7-2c87-483e-a27e-d972f1181b48	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	D7:F1:7D:5A
726c1fa3-65c5-4935-8429-c0b94d27a4e7	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	27:45:7E:B4
7c49c66f-5a46-4080-a550-7d4fcceead97	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	97:17:60:B4
94f831c0-c920-41ec-a0ec-b3abfcd94ba7	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	D7:95:55:B4
b07bb229-60db-415f-9543-dc30b8cda02e	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	67:5A:70:B4
444e63ba-5290-40c6-9db5-7adb6eefbdf5	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
122e9097-201b-4e04-8001-3080b0649781	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$Lhcz2kludfZOO94v0FfAMLNAa0bBt9eBtjA+gpyr/hRy6Vqs	\N	\N	\N	\N	\N	\N
ef5566db-a102-4010-9606-f0b786c497a3	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$ky2/z1OdGH0t1sCLGXxAEjsST+Lhnph+hRXZ88ZhuxVyBmh0	\N	\N	\N	\N	\N	\N
068708b3-423f-47c2-ad0e-e2bb8fe35885	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$e8lwix+BZrwzp9WmGsjYxjN8Seo6Aa6awJNC6Xx4+35hgFfo	\N	\N	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
d11d17db-6ccc-4688-aa04-4d842305ce1c	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$2S1AfeKYztB4xdj9U1Na/4C4j1AqCnI4OGEswx0xYQwiW362	\N	\N	\N	\N	\N	\N
12247a2f-d7a3-47a4-b3a3-602d19801c37	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$X+ReS6U7R2oTeyn2hz4iAqY09bqH7BOx0uBhITjomr/CHZdy	\N	\N	\N	7b47cceb-4866-4ab8-855f-437e9237e127	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
001a6104-aaf4-4b84-8c09-452ea3225ced	1	Корневой	200	270	23	26	\N	\N	4728c4e9-ed55-4251-9aa2-bb63a3d6ef44	\N
2749d62c-5586-4110-94e2-da30d1c95017	1	Корневой	200	270	23	26	\N	\N	b261c239-b62b-46d2-9012-9ce82eb2fa57	\N
49b90f8d-091a-48ee-a16e-b87a8627a5e0	2	Заполняющий	270	310	23	26	\N	\N	4967485e-7866-4be8-9763-c770af8ae454	\N
501faa2e-7add-4826-9692-360bde4f59b4	1	Корневой	200	270	23	26	\N	\N	d97d0b39-70c7-437f-ad28-76a687c0a148	\N
5e7cba03-3be4-4509-8550-5eca56edf5c0	2	Заполняющий	270	310	23	26	\N	\N	4728c4e9-ed55-4251-9aa2-bb63a3d6ef44	\N
5e8e933b-170b-482c-89b9-fe7a933b990d	2	Заполняющий	270	310	23	26	\N	\N	d97d0b39-70c7-437f-ad28-76a687c0a148	\N
644c0ac9-eeac-4776-8e68-ff7e26677a9a	2	Заполняющий	270	310	23	26	\N	\N	5977aefd-87c3-4dcc-8360-d9bd0b04bcda	\N
660352e3-d1f9-4987-b1bf-ce0c204fee43	1	Корневой	200	270	23	26	\N	\N	f62555f9-f1fb-4bed-8d03-2e32839a1631	\N
6b62ce09-9e91-4d51-b261-167938700996	2	Заполняющий	270	310	23	26	\N	\N	f62555f9-f1fb-4bed-8d03-2e32839a1631	\N
79dabf73-357c-4961-87a6-54f517fc5af6	1	Корневой	200	270	23	26	\N	\N	7e135513-dd1e-4b4a-acb7-9a9e90e2710b	\N
7a3dc3b3-b764-4109-922d-05379e14850f	1	Корневой	200	270	23	26	\N	\N	1e223e7e-d789-40f3-8717-27b4774c6d35	\N
8c9b2bc3-a52f-400b-89a4-9891fcadabb5	2	Заполняющий	270	310	23	26	\N	\N	3df630de-7066-41b7-9242-9c29908573e8	\N
8e914a49-21db-446b-8be3-169cc11f81e2	2	Заполняющий	270	310	23	26	\N	\N	59f52d52-cdf6-44db-96f3-2220adc882ae	\N
97feafc2-719c-48ac-a353-7fb509c93ae8	2	Заполняющий	270	310	23	26	\N	\N	c946c34b-7814-4d0c-8eb5-7f74247e38dc	\N
a2b1e642-a569-4cfe-a1d6-0c8ed03033e6	1	Корневой	200	270	23	26	\N	\N	4967485e-7866-4be8-9763-c770af8ae454	\N
a3c197a8-2bbe-4c1f-bd35-6bac0f816897	2	Заполняющий	270	310	23	26	\N	\N	7e135513-dd1e-4b4a-acb7-9a9e90e2710b	\N
b1141ebe-6df1-4b11-bb5a-a7b15864c0ec	1	Корневой	200	270	23	26	\N	\N	c946c34b-7814-4d0c-8eb5-7f74247e38dc	\N
ba5aeeda-a6f9-4649-825d-c5be8938885b	1	Корневой	200	270	23	26	\N	\N	59f52d52-cdf6-44db-96f3-2220adc882ae	\N
c106e28f-64e7-4049-8c3d-d8962efbca7d	1	Корневой	200	270	23	26	\N	\N	5977aefd-87c3-4dcc-8360-d9bd0b04bcda	\N
e1200c3f-c95f-449d-a0a2-f6d6b01b589f	2	Заполняющий	270	310	23	26	\N	\N	b261c239-b62b-46d2-9012-9ce82eb2fa57	\N
eb3e8344-134f-4e6d-8a3d-ab566d6bd72a	1	Корневой	200	270	23	26	\N	\N	3df630de-7066-41b7-9242-9c29908573e8	\N
ee008f37-3e30-4022-afd2-d60b7b77228c	2	Заполняющий	270	310	23	26	\N	\N	1e223e7e-d789-40f3-8717-27b4774c6d35	\N
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
4c9d64a4-d91e-4a01-8748-a41bbf1edb06	5441d361-8735-4199-9c37-e164bfd2ca97
750bacac-55b6-4cfd-a002-87ec710be04b	00d07057-5a61-46a6-9f4b-67363f01a31c
750bacac-55b6-4cfd-a002-87ec710be04b	d46d7e65-47c9-4e9d-906e-d6073076a74c
86fe646b-7457-482f-b834-593f09086d3d	00d07057-5a61-46a6-9f4b-67363f01a31c
86fe646b-7457-482f-b834-593f09086d3d	d46d7e65-47c9-4e9d-906e-d6073076a74c
8dc8b2ea-84fe-4784-a937-8b401d3d33d3	5441d361-8735-4199-9c37-e164bfd2ca97
da6d9e36-f14e-46d7-b1e3-f2aa1877465d	6515de1b-d4ca-433b-9154-e81f0a508a92
ebc90508-cf86-464e-92b8-1f542fc93037	6515de1b-d4ca-433b-9154-e81f0a508a92
f9bfcdf4-7637-4588-8d09-baf20f886ede	00d07057-5a61-46a6-9f4b-67363f01a31c
f9bfcdf4-7637-4588-8d09-baf20f886ede	d46d7e65-47c9-4e9d-906e-d6073076a74c
fdf70435-ad95-496f-97df-4bc25afdc1d1	00d07057-5a61-46a6-9f4b-67363f01a31c
fdf70435-ad95-496f-97df-4bc25afdc1d1	d46d7e65-47c9-4e9d-906e-d6073076a74c
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
4c9d64a4-d91e-4a01-8748-a41bbf1edb06	50256a72-cf20-40c7-a0a9-a9526ac50752	\N	122575
750bacac-55b6-4cfd-a002-87ec710be04b	7c49c66f-5a46-4080-a550-7d4fcceead97	\N	150838
86fe646b-7457-482f-b834-593f09086d3d	6b40bfd7-2c87-483e-a27e-d972f1181b48	\N	114729
8dc8b2ea-84fe-4784-a937-8b401d3d33d3	94f831c0-c920-41ec-a0ec-b3abfcd94ba7	\N	132695
da6d9e36-f14e-46d7-b1e3-f2aa1877465d	3bcbbcb8-69dc-4d55-8645-f15355a09998	\N	121267
ebc90508-cf86-464e-92b8-1f542fc93037	b07bb229-60db-415f-9543-dc30b8cda02e	\N	117390
f9bfcdf4-7637-4588-8d09-baf20f886ede	361a45f2-e5b1-496d-9826-7f4b126ba221	\N	150882
fdf70435-ad95-496f-97df-4bc25afdc1d1	726c1fa3-65c5-4935-8429-c0b94d27a4e7	\N	146164
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
00d07057-5a61-46a6-9f4b-67363f01a31c	4d9e3338-a337-4038-9d6f-e696c124f6e6
00d07057-5a61-46a6-9f4b-67363f01a31c	b118298c-d9d4-46ac-bdbe-43ca21db0741
00d07057-5a61-46a6-9f4b-67363f01a31c	bd0ff6ee-1733-4247-8764-693c3b053e17
00d07057-5a61-46a6-9f4b-67363f01a31c	f9e7e108-fba0-4281-accd-8c79466bd4c1
5441d361-8735-4199-9c37-e164bfd2ca97	9ac9d684-b079-449f-995b-4c492cd12b28
5441d361-8735-4199-9c37-e164bfd2ca97	bd0ff6ee-1733-4247-8764-693c3b053e17
6515de1b-d4ca-433b-9154-e81f0a508a92	606f3b49-f636-445a-8f4a-4309099652dc
6515de1b-d4ca-433b-9154-e81f0a508a92	f9e7e108-fba0-4281-accd-8c79466bd4c1
d46d7e65-47c9-4e9d-906e-d6073076a74c	4d9e3338-a337-4038-9d6f-e696c124f6e6
d46d7e65-47c9-4e9d-906e-d6073076a74c	b118298c-d9d4-46ac-bdbe-43ca21db0741
d46d7e65-47c9-4e9d-906e-d6073076a74c	bd0ff6ee-1733-4247-8764-693c3b053e17
d46d7e65-47c9-4e9d-906e-d6073076a74c	f9e7e108-fba0-4281-accd-8c79466bd4c1
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
00d07057-5a61-46a6-9f4b-67363f01a31c	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	80383e0d-86e8-4fa6-85fc-0901e5f3ad71	49283	A6:F1:CF:48
5441d361-8735-4199-9c37-e164bfd2ca97	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	80383e0d-86e8-4fa6-85fc-0901e5f3ad71	49286	35:4E:AC:A5
6515de1b-d4ca-433b-9154-e81f0a508a92	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	80383e0d-86e8-4fa6-85fc-0901e5f3ad71	49232	03:3D:93:0D
d46d7e65-47c9-4e9d-906e-d6073076a74c	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	80383e0d-86e8-4fa6-85fc-0901e5f3ad71	49141	93:57:D8:0B
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
4f2ee1e1-5a2f-4417-b14f-2c022127d1eb	2	16:00:00	00:30:00	20:00:00	20:30:00	\N	c3b740ce-d976-4935-bf57-b7041048afa4	\N
60423d84-62c1-4d01-bb18-5a61d26e6e76	1	07:30:00	16:00:00	12:00:00	12:30:00	\N	c3b740ce-d976-4935-bf57-b7041048afa4	\N
808bb175-ef1c-48c3-ad3d-867a470b5d66	3	00:30:00	07:50:00	02:00:00	02:20:00	\N	c3b740ce-d976-4935-bf57-b7041048afa4	\N
0a3ae4fa-cd2b-4060-9616-f7dfc83c4ab7	1	07:30:00	15:00:00	12:00:00	12:30:00	f79bb3b6-4586-4ff8-9c76-2b9126ef72ed	\N	\N
36369b84-f4b4-4590-b9f1-b7e166e3117c	1	07:30:00	15:00:00	12:00:00	12:30:00	aa806d90-94cf-4a37-b2e2-d97878a54945	\N	\N
3c6223e7-bcc0-4e26-b7b2-63e3b7e8f6a5	3	00:30:00	06:50:00	02:00:00	02:20:00	96925d45-b643-40cb-9427-326752890b40	\N	\N
3dbc6c9f-60af-468e-8ea9-5292eaa48e3d	2	16:00:00	23:30:00	20:00:00	20:30:00	94f93d73-883c-4923-9a68-b967619b124a	\N	\N
3f790797-ef5c-4b8a-9c57-9d2d801cb76e	2	16:00:00	23:30:00	20:00:00	20:30:00	ea5234a0-7d31-43b8-8757-e7b0ab784e50	\N	\N
45bc2273-2f08-4d58-ac03-e66c9d981a28	2	16:00:00	23:30:00	20:00:00	20:30:00	aa806d90-94cf-4a37-b2e2-d97878a54945	\N	\N
4928e35e-8bd7-40af-ad05-fc2747824e0a	2	16:00:00	23:30:00	20:00:00	20:30:00	f79bb3b6-4586-4ff8-9c76-2b9126ef72ed	\N	\N
52b565d3-8a37-4447-bb85-fffefda585a2	3	00:30:00	06:50:00	02:00:00	02:20:00	94f93d73-883c-4923-9a68-b967619b124a	\N	\N
600c91e7-def5-40f8-a769-947813579a11	1	07:30:00	15:00:00	12:00:00	12:30:00	ea5234a0-7d31-43b8-8757-e7b0ab784e50	\N	\N
6a0f09b8-9292-4ba5-89e1-37189812a914	3	00:30:00	06:50:00	02:00:00	02:20:00	ea5234a0-7d31-43b8-8757-e7b0ab784e50	\N	\N
91b7f5fd-de90-423e-bce8-82a22641f839	3	00:30:00	06:50:00	02:00:00	02:20:00	aa806d90-94cf-4a37-b2e2-d97878a54945	\N	\N
b66ddd7f-f98d-452d-81cd-59b7b5c4eb9a	2	16:00:00	23:30:00	20:00:00	20:30:00	96925d45-b643-40cb-9427-326752890b40	\N	\N
cd8df428-d027-413d-b674-12193d0b4395	1	07:30:00	15:00:00	12:00:00	12:30:00	94f93d73-883c-4923-9a68-b967619b124a	\N	\N
d6602a69-eeae-41e2-ba2a-57425b9e2822	1	07:30:00	15:00:00	12:00:00	12:30:00	96925d45-b643-40cb-9427-326752890b40	\N	\N
d69059ad-e946-43a8-ae6f-fcbb9d191c5c	3	00:30:00	06:50:00	02:00:00	02:20:00	f79bb3b6-4586-4ff8-9c76-2b9126ef72ed	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
4d9e3338-a337-4038-9d6f-e696c124f6e6	3690	\N	7b47cceb-4866-4ab8-855f-437e9237e127	3690
606f3b49-f636-445a-8f4a-4309099652dc	3600	\N	7b47cceb-4866-4ab8-855f-437e9237e127	3600
9ac9d684-b079-449f-995b-4c492cd12b28	3510	\N	7b47cceb-4866-4ab8-855f-437e9237e127	3510
b118298c-d9d4-46ac-bdbe-43ca21db0741	3550	\N	7b47cceb-4866-4ab8-855f-437e9237e127	3550
bd0ff6ee-1733-4247-8764-693c3b053e17	3500	\N	7b47cceb-4866-4ab8-855f-437e9237e127	3500
f9e7e108-fba0-4281-accd-8c79466bd4c1	3610	\N	7b47cceb-4866-4ab8-855f-437e9237e127	3610
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
82cb47d8-75ea-438a-ba46-98d8d7b87fce	Сварочный цех	50	050
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

