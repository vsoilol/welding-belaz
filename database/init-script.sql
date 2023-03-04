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
    "RfidTag" text,
    "ProductionAreaId" uuid,
    "IdFromSystem" text
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
    "Time" integer NOT NULL,
    "WeldingEquipmentId" uuid NOT NULL,
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
    "RfidTag" text,
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
    "IdFromSystem" text
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
    "SeamId" uuid NOT NULL,
    "WelderId" uuid,
    "MasterId" uuid NOT NULL,
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
a93c68c9-8be2-433b-bdd2-f04a5251147f	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
e770d0b1-a07f-4acb-8faa-e8dc63e3c777	a0ab11a3-4844-471e-b015-14287d6cbf30	62cc38c7-198a-4625-b65d-b3437aa45e4b	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
8f422f13-1d1c-4f6c-a80b-34d87e15c903	1	10	t	a93c68c9-8be2-433b-bdd2-f04a5251147f	\N
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
2d96b92b-6205-461d-9c7f-3da669c6f2eb	Отсутствие оператора в связи с необеспеченностью	\N
34a2f921-9ff9-4e87-b161-d917040d9b12	Аварийный ремонт централизованными службами	\N
383ea75d-9931-4da5-b4a9-f85ca0c8eb6b	Отсутствие конструктора, технолога или ожидание его решения	\N
3de047db-5c9b-4e02-92de-ef5782ca4a7f	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
48bc70bd-33e7-4850-af4e-3083e3422890	Работа с управляющей программой	\N
4c12655e-3a04-4da5-b61e-147d7c15ea67	Неявка оператора (б/лист, отпуск, и пр.)	\N
59a78675-f516-4a9c-bb33-43701af451d3	Контроль на рабочем месте	\N
68ba1277-1c55-4b90-a359-cef36dcdead4	Установка, выверка, снятие детали	\N
775ed564-5727-4224-b884-6a99089f2d39	Сборочные операции	\N
893cb5d4-6078-4736-b1c7-8d45a0a55c3b	Отсутствие заданий	\N
8b8623bc-f81d-4252-8efb-afea52476510	Плановый ремонт централизованными службами	\N
97da14ea-cad6-409d-a538-7f6866e4543f	Нерабочее время по графику согласно сменности	\N
b1b0e9f5-ff88-4f24-b5a3-a1c1c6ad9437	Изменение режимов, смена инструмента, приспособления	\N
b3d7271c-768d-4ed9-ab2b-2a765f523ef3	Отсутствие сотрудника ОТК	\N
b8f729ba-9dc0-4708-8fe4-a9013d01c88f	Отсутствие материала, заготовок, деталей	\N
bf817ae9-6e18-40f4-9b42-bed7c834dd97	Работа по карте несоответствий	\N
c66f950c-a7ea-4388-84e6-2694d17a0494	Установка, выверка, снятие детали	\N
c6bb58c3-5c50-4360-8048-82b94ebb7efa	Праздники и выходные	\N
ce4f7304-4129-43e3-b307-c22406ed6363	Ознакомление с работой, документацией, инструктаж	\N
d3bc3363-f377-4388-9519-3785c6a031fc	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
e2a3ff59-3a40-41ee-ab6b-fa833134b6be	Естественные надобности	\N
efc663ab-6409-468b-9433-f80245b515f0	Отсутствие крана, транспорта	\N
f015ce62-92e2-41d3-9f0b-412905eaf4bf	Обед	\N
f560a7b9-791a-45e3-89ae-daa4f67ce556	Отсутствие энергоносителей	\N
fa95e913-7ac2-485f-b607-59e8f0306f48	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
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
1f8f1b30-d0b6-4128-ad3d-f5e6f78007ac	8133ae28-8262-417f-ae6a-721146eba017	249550
a632effb-1afb-4664-92bd-b4fbe5497477	21d82e4d-3c95-40e1-8f1a-75ebcb528c9b	219379
98cce026-56a5-44d1-83bc-bfc42ee3ac4e	93c343ea-0c33-409c-af56-835a86e5bbb9	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
81682f70-2924-406a-b3c1-b69f39cd7ab5	e4402047-eb55-4e55-bec3-f94f7eb83dc0	\N
ca620b97-7087-4cc0-a0a0-39ff446c3508	9824ad8d-0f0c-4c6a-89db-9fd6a1835e20	614962
dfabd7ef-58b8-428f-8e46-846726d3e4a9	94869770-73b4-4bcc-a475-7f8e0b4b6b21	610422
85636230-c649-46c4-86ae-f9d46874e243	43dbd5da-eea9-4fef-9bae-d7d3e13bd918	\N
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
051aa648-64ac-44d0-af8d-d2d10ff0c990	15	2	2023-03-04 20:25:15.239301	4ef5ec55-c3f2-430b-a3e6-2ab56efdc140	\N
082534c3-924d-4759-b38d-d3df7b1ac6d7	14	2	2023-03-04 20:25:15.239208	4b5c62d8-faed-4ef3-86a3-8698b475360b	\N
0f10bb57-e062-4813-a8df-d31c5b0f5fe6	26	2	2023-03-04 20:25:15.240261	9916b50a-221b-4ef7-bb97-c59f2633a223	\N
13a16560-ff08-4da0-b27d-a87c7433be11	22	2	2023-03-04 20:25:15.239932	8095b238-e1b1-41b9-a113-7d0f13b15c8c	\N
1691841d-be05-43c9-aadc-4904e251c7ed	11	2	2023-03-04 20:25:15.238947	43492e7c-8107-4b63-b092-1bd6434c14ad	\N
23672b8c-05a8-4a7e-8848-84b45fd15a3d	39	2	2023-03-04 20:25:15.241367	ec787539-f9cf-4b8f-84ab-117fd0bd1553	\N
26cdc7bd-3b08-407f-b855-22a897d72ebd	5	2	2023-03-04 20:25:15.238438	21f26c7c-9f52-4678-badb-c14e474f369c	\N
2d5e0c73-4020-454a-8626-c44c6a18f0fb	28	2	2023-03-04 20:25:15.240434	ac61a8ab-9f80-4368-a708-8cb91bed9a95	\N
34152f9d-acad-4711-bed1-afa14f80034b	30	2	2023-03-04 20:25:15.240597	b4675632-cf14-4980-9ffc-4b112a702fa6	\N
3cece985-1fb6-4f9e-b5fa-380b33ef9af0	10	2	2023-03-04 20:25:15.238863	3f214008-7bc1-4c46-9d88-9d7f35ba1885	\N
41246b3c-3768-4ca1-8798-c3bf722a31cd	25	2	2023-03-04 20:25:15.24018	8e83baa7-9384-4e75-aa07-6ac92443d9b6	\N
4219a3ea-8652-47a2-ba44-31b4dee04b9b	16	2	2023-03-04 20:25:15.239394	594c1c1d-867d-4e61-b581-cf07da2b1e44	\N
455176f6-0c03-4f97-8a61-b2650cba2e8a	4	2	2023-03-04 20:25:15.238346	08f4a416-ae1f-4507-90dc-f8f3f53a50e8	\N
48d685f5-2650-4699-8440-ffd792af98b5	20	2	2023-03-04 20:25:15.239754	7182fad2-bc2f-477e-b389-37023cc9da9a	\N
4f7e4545-16ab-4967-a8d3-657459f242e3	6	2	2023-03-04 20:25:15.238523	27091fd3-26d3-42df-8944-748438266635	\N
51ae2c84-a75e-402f-91b5-ac8cd67c8746	2	2	2023-03-04 20:25:15.23813	07b3980e-3a2e-459d-8314-211e8bf5a3b4	\N
563362a5-d9c2-405b-947f-cd2b48c76048	12	2	2023-03-04 20:25:15.23903	440f2cc9-3021-4114-98d4-bdfcda5f479f	\N
5dc5ef5c-a96c-4b10-9dd5-bac6f3ec7f7a	27	2	2023-03-04 20:25:15.240349	a80f7277-8553-4188-8a52-aa885c2a84d4	\N
5ef2d525-eb57-4e8d-9f9f-77e10696e774	31	2	2023-03-04 20:25:15.240684	b6eb0c91-f030-4f46-8ae8-d7d78dbb159f	\N
6256794d-03bd-4ae5-be15-f31307a9cde5	8	2	2023-03-04 20:25:15.238693	37fdcc82-dce9-4c0f-bc6a-10ab7cd167ab	\N
68ac1e5b-a905-4161-b824-e16e0320dafe	42	2	2023-03-04 20:25:15.241615	ffb60a95-ae70-46b9-8cc1-a53e1eff0a44	\N
88548633-6755-4f91-9810-4926b2cdc679	29	2	2023-03-04 20:25:15.240516	acd4c3c6-98b8-4336-ae39-04c6babd9392	\N
8955ebcd-021e-4dc9-aa63-d7416fdceff7	18	2	2023-03-04 20:25:15.239572	6d45f3c2-1678-4d7a-aeda-eaae46faac0d	\N
8ede3c03-6756-4c29-878b-c346e9e83b26	40	2	2023-03-04 20:25:15.241451	eca960be-8efb-4c38-9242-934f2443ddc6	\N
93195450-f25f-47fe-bc24-b62216d5ef70	36	2	2023-03-04 20:25:15.241093	da0a24d1-bb7f-4f4e-8fca-60a14afe45cf	\N
9686d114-7a3c-4897-a259-19dee5d7f78a	17	2	2023-03-04 20:25:15.239482	5b543510-63c5-4824-88e5-6964359c8f6d	\N
9e9873ec-516d-4e80-891f-66e80c4ca0bc	13	2	2023-03-04 20:25:15.23912	44f31441-a5f8-4a64-aedb-ac46c74d792a	\N
a12317ee-c2d8-4615-95bb-778a1ab8d245	19	2	2023-03-04 20:25:15.239661	6fa7d9b8-16cb-4232-8db7-97ab3a8543b3	\N
a608b251-47bc-4b6d-98ed-f4c8ba85e562	24	2	2023-03-04 20:25:15.240099	8b6d81d5-001c-4ea9-99b8-35a68695fe5f	\N
afaf607e-79bc-48b7-89c9-db827c3c978f	32	2	2023-03-04 20:25:15.240765	b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	\N
b1f75af8-e2af-4240-8700-7205fa39e8ad	3	2	2023-03-04 20:25:15.238254	08644e1c-ce50-4eaa-bc66-e5ae763baf69	\N
b295da1f-9bc4-4182-bbdf-84b566abf063	9	2	2023-03-04 20:25:15.238779	3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	\N
b3329bd6-f04c-435f-9f5f-8eccca75c8d5	34	2	2023-03-04 20:25:15.240927	cc4b6cd9-ca98-476b-9fd0-f80e2dcbd3c6	\N
b73aab84-0acc-427b-9682-55712674b450	33	2	2023-03-04 20:25:15.240847	c7221267-c7f4-4e88-93b5-be561d5be749	\N
b816fcca-86c2-4e9a-953b-a1f50f06891e	7	2	2023-03-04 20:25:15.238607	292717be-22b1-4810-84a0-34fda42af482	\N
b8d84502-95f5-41e0-9e1b-c2c325e32674	41	2	2023-03-04 20:25:15.241533	fbcfb5d7-1f24-4ee8-b612-63d00ae7d222	\N
c08c88b3-5ca6-4dcd-b1fa-11f61b813eb5	37	2	2023-03-04 20:25:15.241174	e0d86529-75d4-4c5a-89d9-2e0385002853	\N
cdd76479-33d5-4a28-8150-ca57bb3dd7ed	1	2	2023-03-04 20:25:15.202638	066bff1a-5d23-4c81-a08a-02eb7e3a0172	\N
dcf40340-4f09-4a2e-bd41-fdbefda155c0	23	2	2023-03-04 20:25:15.240015	88368623-eadc-4407-802c-835af463f7e0	\N
e3f1f62d-9f94-4073-96b4-cb3058765da3	35	2	2023-03-04 20:25:15.241011	d3576af5-b86d-49dc-a882-21a2827027b6	\N
ecadc056-a189-40fa-80ea-91ca3eaf05d1	21	2	2023-03-04 20:25:15.239848	7c3deac4-23e1-4f3d-8a27-a1be097f401c	\N
ef947c8d-1b2b-4db6-ab29-29d2f3f186f5	38	2	2023-03-04 20:25:15.241256	e81ac89c-654c-4cf0-a72d-5388ef6a1da7	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	066bff1a-5d23-4c81-a08a-02eb7e3a0172
b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	07b3980e-3a2e-459d-8314-211e8bf5a3b4
7c3deac4-23e1-4f3d-8a27-a1be097f401c	08644e1c-ce50-4eaa-bc66-e5ae763baf69
7c3deac4-23e1-4f3d-8a27-a1be097f401c	08f4a416-ae1f-4507-90dc-f8f3f53a50e8
292717be-22b1-4810-84a0-34fda42af482	21f26c7c-9f52-4678-badb-c14e474f369c
3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	27091fd3-26d3-42df-8944-748438266635
e0d86529-75d4-4c5a-89d9-2e0385002853	292717be-22b1-4810-84a0-34fda42af482
e0d86529-75d4-4c5a-89d9-2e0385002853	37fdcc82-dce9-4c0f-bc6a-10ab7cd167ab
7c3deac4-23e1-4f3d-8a27-a1be097f401c	3d18ef1f-b576-4a35-b79b-bc0ecb44b70b
e0d86529-75d4-4c5a-89d9-2e0385002853	3f214008-7bc1-4c46-9d88-9d7f35ba1885
7c3deac4-23e1-4f3d-8a27-a1be097f401c	43492e7c-8107-4b63-b092-1bd6434c14ad
7c3deac4-23e1-4f3d-8a27-a1be097f401c	440f2cc9-3021-4114-98d4-bdfcda5f479f
b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	44f31441-a5f8-4a64-aedb-ac46c74d792a
b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	4b5c62d8-faed-4ef3-86a3-8698b475360b
ac61a8ab-9f80-4368-a708-8cb91bed9a95	4ef5ec55-c3f2-430b-a3e6-2ab56efdc140
3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	594c1c1d-867d-4e61-b581-cf07da2b1e44
3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	5b543510-63c5-4824-88e5-6964359c8f6d
08f4a416-ae1f-4507-90dc-f8f3f53a50e8	6d45f3c2-1678-4d7a-aeda-eaae46faac0d
e0d86529-75d4-4c5a-89d9-2e0385002853	6fa7d9b8-16cb-4232-8db7-97ab3a8543b3
e0d86529-75d4-4c5a-89d9-2e0385002853	7182fad2-bc2f-477e-b389-37023cc9da9a
cc4b6cd9-ca98-476b-9fd0-f80e2dcbd3c6	8095b238-e1b1-41b9-a113-7d0f13b15c8c
3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	88368623-eadc-4407-802c-835af463f7e0
3f214008-7bc1-4c46-9d88-9d7f35ba1885	8b6d81d5-001c-4ea9-99b8-35a68695fe5f
7c3deac4-23e1-4f3d-8a27-a1be097f401c	8e83baa7-9384-4e75-aa07-6ac92443d9b6
c7221267-c7f4-4e88-93b5-be561d5be749	9916b50a-221b-4ef7-bb97-c59f2633a223
7182fad2-bc2f-477e-b389-37023cc9da9a	a80f7277-8553-4188-8a52-aa885c2a84d4
7c3deac4-23e1-4f3d-8a27-a1be097f401c	ac61a8ab-9f80-4368-a708-8cb91bed9a95
e0d86529-75d4-4c5a-89d9-2e0385002853	acd4c3c6-98b8-4336-ae39-04c6babd9392
7182fad2-bc2f-477e-b389-37023cc9da9a	b4675632-cf14-4980-9ffc-4b112a702fa6
7c3deac4-23e1-4f3d-8a27-a1be097f401c	b6eb0c91-f030-4f46-8ae8-d7d78dbb159f
e0d86529-75d4-4c5a-89d9-2e0385002853	b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5
7c3deac4-23e1-4f3d-8a27-a1be097f401c	c7221267-c7f4-4e88-93b5-be561d5be749
e0d86529-75d4-4c5a-89d9-2e0385002853	cc4b6cd9-ca98-476b-9fd0-f80e2dcbd3c6
08f4a416-ae1f-4507-90dc-f8f3f53a50e8	d3576af5-b86d-49dc-a882-21a2827027b6
b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	da0a24d1-bb7f-4f4e-8fca-60a14afe45cf
c7221267-c7f4-4e88-93b5-be561d5be749	e81ac89c-654c-4cf0-a72d-5388ef6a1da7
3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	ec787539-f9cf-4b8f-84ab-117fd0bd1553
e0d86529-75d4-4c5a-89d9-2e0385002853	eca960be-8efb-4c38-9242-934f2443ddc6
3f214008-7bc1-4c46-9d88-9d7f35ba1885	fbcfb5d7-1f24-4ee8-b612-63d00ae7d222
43492e7c-8107-4b63-b092-1bd6434c14ad	ffb60a95-ae70-46b9-8cc1-a53e1eff0a44
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
00ec79b4-6618-4590-9f45-1bc0604f06ce	0	3	\N	\N	9686d114-7a3c-4897-a259-19dee5d7f78a	\N
0119e965-aea7-43f6-961d-5f4c44274813	0	3	\N	\N	8955ebcd-021e-4dc9-aa63-d7416fdceff7	\N
02190d29-3d96-4248-b317-1f59ddcac1c3	0	1	\N	\N	88548633-6755-4f91-9810-4926b2cdc679	\N
085e2b23-ba6c-4697-bf91-f171e7615b5e	0	2	\N	\N	455176f6-0c03-4f97-8a61-b2650cba2e8a	\N
0976fd6b-2563-4891-9c20-e62647b32648	0	1	\N	\N	b8d84502-95f5-41e0-9e1b-c2c325e32674	\N
0adc8c0b-3b7e-439b-9194-e2a7d0f9d9bc	0	3	\N	\N	b8d84502-95f5-41e0-9e1b-c2c325e32674	\N
0b5ab7b2-528d-4339-8ce0-965099d29b9b	0	3	\N	\N	b295da1f-9bc4-4182-bbdf-84b566abf063	\N
0d051baa-8b40-4247-af14-17c54ea50c5c	0	2	\N	\N	ecadc056-a189-40fa-80ea-91ca3eaf05d1	\N
0d39b694-1b7f-4646-be6a-c01970d8a19a	0	3	\N	\N	93195450-f25f-47fe-bc24-b62216d5ef70	\N
0e682981-96f0-4fb1-a999-a6028856b29e	0	3	\N	\N	6256794d-03bd-4ae5-be15-f31307a9cde5	\N
0ffa80c0-3cc8-41bd-a035-6185a7bfd9b7	0	1	\N	\N	9686d114-7a3c-4897-a259-19dee5d7f78a	\N
1017e3d8-7b5d-4d7c-8f42-766d1e0ba6e4	0	3	\N	\N	dcf40340-4f09-4a2e-bd41-fdbefda155c0	\N
13c42821-603d-4b01-a807-0bb19a603da8	0	3	\N	\N	48d685f5-2650-4699-8440-ffd792af98b5	\N
158ee574-4617-49a0-80a3-2155d47cfcde	0	1	\N	\N	0f10bb57-e062-4813-a8df-d31c5b0f5fe6	\N
159d857b-9a37-49f4-836c-08bca972013c	0	2	\N	\N	b3329bd6-f04c-435f-9f5f-8eccca75c8d5	\N
1851559e-c9fe-4f9b-84d1-82cbe77965ac	0	1	\N	\N	13a16560-ff08-4da0-b27d-a87c7433be11	\N
19315365-2470-440e-820e-c6d755f1b7bd	0	3	\N	\N	082534c3-924d-4759-b38d-d3df7b1ac6d7	\N
1a144a22-2bc3-483c-b775-389fce22b6ea	0	3	\N	\N	8ede3c03-6756-4c29-878b-c346e9e83b26	\N
1b583333-8a2e-4459-840d-35e1ee22c79c	0	1	\N	\N	93195450-f25f-47fe-bc24-b62216d5ef70	\N
1b6ed6c1-69f1-42fa-bc5a-7eabd4d244bc	0	2	\N	\N	93195450-f25f-47fe-bc24-b62216d5ef70	\N
1cfb77cb-99c8-4cf6-b1c2-829a0485b0b8	0	3	\N	\N	23672b8c-05a8-4a7e-8848-84b45fd15a3d	\N
1dc6fea3-d1c4-405e-ba7e-a2ecf3a9607b	0	2	\N	\N	68ac1e5b-a905-4161-b824-e16e0320dafe	\N
226ccad3-4988-43e2-879b-b42f63941dc5	0	1	\N	\N	b73aab84-0acc-427b-9682-55712674b450	\N
231ac026-0b0c-4f88-950a-5278bd392ca4	0	3	\N	\N	455176f6-0c03-4f97-8a61-b2650cba2e8a	\N
2418a8af-b181-4e08-aa73-59666c0d1d66	0	1	\N	\N	afaf607e-79bc-48b7-89c9-db827c3c978f	\N
261ad891-cc17-46f5-b9c6-10d138293c7b	0	1	\N	\N	51ae2c84-a75e-402f-91b5-ac8cd67c8746	\N
26e75040-0107-464a-8fdd-d897793c98f9	0	1	\N	\N	ecadc056-a189-40fa-80ea-91ca3eaf05d1	\N
27b1257c-7ef8-432f-a6ac-45848fbecd48	0	3	\N	\N	51ae2c84-a75e-402f-91b5-ac8cd67c8746	\N
2820ebe3-0cf3-47fb-a8ba-29c830182c36	0	3	\N	\N	ef947c8d-1b2b-4db6-ab29-29d2f3f186f5	\N
2a65dd6f-0c5a-467c-82bb-4cc07023b139	0	3	\N	\N	26cdc7bd-3b08-407f-b855-22a897d72ebd	\N
2ae32b57-64a8-4634-ae91-cd7c4d387fce	0	1	\N	\N	b295da1f-9bc4-4182-bbdf-84b566abf063	\N
2b9e4449-db3a-4143-b4ea-233bfadf2190	0	2	\N	\N	a608b251-47bc-4b6d-98ed-f4c8ba85e562	\N
2ed1703a-e002-470b-b9e0-22d918be7a99	0	2	\N	\N	51ae2c84-a75e-402f-91b5-ac8cd67c8746	\N
308b772c-4f53-4227-8bd8-fd18257a4ac3	0	1	\N	\N	5ef2d525-eb57-4e8d-9f9f-77e10696e774	\N
37baf858-1310-44f1-8620-7c01b60665b1	0	1	\N	\N	e3f1f62d-9f94-4073-96b4-cb3058765da3	\N
3b92b57f-f414-4e09-a7ce-51bf3325017f	0	2	\N	\N	8ede3c03-6756-4c29-878b-c346e9e83b26	\N
4102fe01-f0d9-4dc5-bb1d-02e600f08041	0	1	\N	\N	4f7e4545-16ab-4967-a8d3-657459f242e3	\N
43149afb-1dfb-47c3-ad77-b4274334870b	0	3	\N	\N	afaf607e-79bc-48b7-89c9-db827c3c978f	\N
456428a1-130a-42f5-9c17-28f27b60916d	0	1	\N	\N	2d5e0c73-4020-454a-8626-c44c6a18f0fb	\N
4b840853-dbfe-4bd3-8025-2001f5fb4b49	0	1	\N	\N	41246b3c-3768-4ca1-8798-c3bf722a31cd	\N
4c50f881-784e-4669-a724-ed7885b057d7	0	3	\N	\N	a608b251-47bc-4b6d-98ed-f4c8ba85e562	\N
52efa58b-a8a7-4d1c-8a8a-19f94f5a200f	0	1	\N	\N	23672b8c-05a8-4a7e-8848-84b45fd15a3d	\N
55c5842d-cb7d-4d47-9482-91a80f12be40	0	2	\N	\N	c08c88b3-5ca6-4dcd-b1fa-11f61b813eb5	\N
572ec2eb-2992-49ee-916a-a06f8302149d	0	3	\N	\N	4219a3ea-8652-47a2-ba44-31b4dee04b9b	\N
584002d6-09bf-47e4-bba1-19b779b202dd	0	2	\N	\N	ef947c8d-1b2b-4db6-ab29-29d2f3f186f5	\N
59296002-5b93-4142-beae-3ee2ed8e3874	0	2	\N	\N	b816fcca-86c2-4e9a-953b-a1f50f06891e	\N
59475c04-a293-4ddf-9da4-4fe4213c5e6d	0	2	\N	\N	3cece985-1fb6-4f9e-b5fa-380b33ef9af0	\N
5d056823-a596-45b3-9112-31e218ec990d	0	2	\N	\N	9686d114-7a3c-4897-a259-19dee5d7f78a	\N
5dc34a6b-6c41-4148-9341-15d1ef393903	0	1	\N	\N	082534c3-924d-4759-b38d-d3df7b1ac6d7	\N
5f3929cc-40ee-4dae-aee1-78359f95a3d0	0	2	\N	\N	082534c3-924d-4759-b38d-d3df7b1ac6d7	\N
625e66a9-2b36-4192-8c4d-4d87d44eac91	0	2	\N	\N	e3f1f62d-9f94-4073-96b4-cb3058765da3	\N
6285ed38-2dd3-4ea3-8700-9ac77151c21d	0	3	\N	\N	88548633-6755-4f91-9810-4926b2cdc679	\N
62ce5687-1c1c-4755-84e9-788fb19617fd	0	2	\N	\N	563362a5-d9c2-405b-947f-cd2b48c76048	\N
63ce3eb2-130e-4a5f-bc06-c9977c4c8f90	0	2	\N	\N	88548633-6755-4f91-9810-4926b2cdc679	\N
6e0f2ad1-be8f-4ea6-8bce-2094b63dae05	0	1	\N	\N	b3329bd6-f04c-435f-9f5f-8eccca75c8d5	\N
72f1b31e-1be4-49d3-af61-3234631611d6	0	2	\N	\N	051aa648-64ac-44d0-af8d-d2d10ff0c990	\N
731b39f9-550f-4b35-9b78-674725097eff	0	1	\N	\N	8ede3c03-6756-4c29-878b-c346e9e83b26	\N
74477616-0c90-4671-9328-d6d7643e0053	0	1	\N	\N	b1f75af8-e2af-4240-8700-7205fa39e8ad	\N
75fdeb34-6e48-423d-b962-bde0b212299d	0	2	\N	\N	4f7e4545-16ab-4967-a8d3-657459f242e3	\N
77a4aa8e-ac64-4c62-b777-544b89fae375	0	2	\N	\N	1691841d-be05-43c9-aadc-4904e251c7ed	\N
787758eb-d032-4605-8c53-32ae13105c0b	0	1	\N	\N	b816fcca-86c2-4e9a-953b-a1f50f06891e	\N
7a4c677d-0065-49cc-9a23-096b5e806a49	0	2	\N	\N	2d5e0c73-4020-454a-8626-c44c6a18f0fb	\N
7d3688c3-2b44-4f0e-902b-f886be77c7ed	0	3	\N	\N	a12317ee-c2d8-4615-95bb-778a1ab8d245	\N
7f0ae70b-9ca3-40a5-9eea-df126af9af81	0	2	\N	\N	b73aab84-0acc-427b-9682-55712674b450	\N
80d5fed8-d648-4b16-a9fd-316a60282cda	0	2	\N	\N	b295da1f-9bc4-4182-bbdf-84b566abf063	\N
841a693f-b7d7-4380-8b73-a2976ba377cc	0	3	\N	\N	1691841d-be05-43c9-aadc-4904e251c7ed	\N
846c1262-1601-4f9b-858c-f42a871bf30b	0	2	\N	\N	afaf607e-79bc-48b7-89c9-db827c3c978f	\N
86d6c022-22b5-41f2-842a-282fb23245f4	0	3	\N	\N	41246b3c-3768-4ca1-8798-c3bf722a31cd	\N
873350b0-f8f5-4d45-b980-7bcacc3dae2e	0	2	\N	\N	b8d84502-95f5-41e0-9e1b-c2c325e32674	\N
8bbc4c47-da29-41f1-81ff-244aa888223e	0	3	\N	\N	13a16560-ff08-4da0-b27d-a87c7433be11	\N
8be2d104-f2f7-4b49-94ba-843a20c47ec4	0	1	\N	\N	051aa648-64ac-44d0-af8d-d2d10ff0c990	\N
8c8e5078-ffeb-4a9b-9270-a5d906d07ec9	0	2	\N	\N	5ef2d525-eb57-4e8d-9f9f-77e10696e774	\N
8d78fa28-8575-4cc6-aa9b-08bed838eaaf	0	3	\N	\N	34152f9d-acad-4711-bed1-afa14f80034b	\N
8d83e0d7-3de0-46fd-98ad-c29a442b72a2	0	2	\N	\N	6256794d-03bd-4ae5-be15-f31307a9cde5	\N
8e091382-1c45-444c-b73e-2298e497fed4	0	3	\N	\N	0f10bb57-e062-4813-a8df-d31c5b0f5fe6	\N
9225bb55-d9c4-41b1-8da8-860840f12c31	0	2	\N	\N	23672b8c-05a8-4a7e-8848-84b45fd15a3d	\N
9640cf7b-b737-4906-9d60-f9aacfa13e01	0	1	\N	\N	cdd76479-33d5-4a28-8150-ca57bb3dd7ed	\N
975683b6-f33e-4a02-ac82-c90d2f223792	0	3	\N	\N	563362a5-d9c2-405b-947f-cd2b48c76048	\N
97d60209-664a-48ec-9952-20f2a1f7ce13	0	1	\N	\N	c08c88b3-5ca6-4dcd-b1fa-11f61b813eb5	\N
9b45fdb6-977d-4ef1-81b2-85eb0964fe85	0	1	\N	\N	48d685f5-2650-4699-8440-ffd792af98b5	\N
9c31fbd2-8b81-42fb-b393-9096ed6ff12d	0	1	\N	\N	26cdc7bd-3b08-407f-b855-22a897d72ebd	\N
a1bfa5f1-ee9f-4cd4-a054-0a5756c5a17c	0	1	\N	\N	34152f9d-acad-4711-bed1-afa14f80034b	\N
a38f5497-b21b-4e85-a416-d267fd99b80e	0	3	\N	\N	5ef2d525-eb57-4e8d-9f9f-77e10696e774	\N
a7288060-2bb7-4fed-a16f-df7ef228efa0	0	3	\N	\N	3cece985-1fb6-4f9e-b5fa-380b33ef9af0	\N
a85f16a9-07cb-426d-b9a6-0584aaf931da	0	1	\N	\N	68ac1e5b-a905-4161-b824-e16e0320dafe	\N
ae573bb1-2f08-4254-ab22-19f75d02d440	0	2	\N	\N	48d685f5-2650-4699-8440-ffd792af98b5	\N
b01319d1-1309-4fdb-a816-cdafa1b3ab37	0	1	\N	\N	a608b251-47bc-4b6d-98ed-f4c8ba85e562	\N
b195f506-469d-42c2-9a7a-863c027e1ab2	0	3	\N	\N	b816fcca-86c2-4e9a-953b-a1f50f06891e	\N
b3b49676-d544-4483-832f-ecb67e26ac4e	0	3	\N	\N	c08c88b3-5ca6-4dcd-b1fa-11f61b813eb5	\N
b3fe8a06-4d58-4b8c-bb1b-62c03f06098e	0	3	\N	\N	b1f75af8-e2af-4240-8700-7205fa39e8ad	\N
b4231633-8f10-4d3a-97d6-33e8e849f8e7	0	2	\N	\N	5dc5ef5c-a96c-4b10-9dd5-bac6f3ec7f7a	\N
b7e11170-e737-4d77-a464-0d4fbba1f2c1	0	1	\N	\N	ef947c8d-1b2b-4db6-ab29-29d2f3f186f5	\N
b8783de8-ccb9-4e78-9be2-080f1ac04a55	0	2	\N	\N	13a16560-ff08-4da0-b27d-a87c7433be11	\N
b9ea731e-c85b-481f-806f-01de50bb80ad	0	2	\N	\N	dcf40340-4f09-4a2e-bd41-fdbefda155c0	\N
bd01f826-dcd2-4326-869f-bb17713271d1	0	3	\N	\N	9e9873ec-516d-4e80-891f-66e80c4ca0bc	\N
be35d634-0493-47f0-8760-495ef9b45b43	0	3	\N	\N	5dc5ef5c-a96c-4b10-9dd5-bac6f3ec7f7a	\N
bea93b08-3f5c-488a-bd27-f8737fef8519	0	2	\N	\N	a12317ee-c2d8-4615-95bb-778a1ab8d245	\N
c0b5bbb1-2587-492a-95c1-94faf0a02ac5	0	2	\N	\N	8955ebcd-021e-4dc9-aa63-d7416fdceff7	\N
c475bff3-fba3-44f7-9b5e-6812077c0ecd	0	3	\N	\N	ecadc056-a189-40fa-80ea-91ca3eaf05d1	\N
c6b4a79a-44d7-4239-9b88-aa5e6c692640	0	2	\N	\N	34152f9d-acad-4711-bed1-afa14f80034b	\N
ca5f0090-263f-4754-8841-fb480926cfc0	0	1	\N	\N	563362a5-d9c2-405b-947f-cd2b48c76048	\N
cc597015-2a1e-4fe6-858f-16e7fd44155c	0	2	\N	\N	b1f75af8-e2af-4240-8700-7205fa39e8ad	\N
ce5a43d6-6533-4fb8-80a3-34d6ca4e381b	0	2	\N	\N	26cdc7bd-3b08-407f-b855-22a897d72ebd	\N
cea37776-4726-4378-8a4d-696710e9894c	0	2	\N	\N	4219a3ea-8652-47a2-ba44-31b4dee04b9b	\N
d5ce4a2f-e249-40f8-9a7e-1b41edda364a	0	3	\N	\N	b73aab84-0acc-427b-9682-55712674b450	\N
d61c1d4d-a0b8-4686-b379-1765e375217e	0	2	\N	\N	cdd76479-33d5-4a28-8150-ca57bb3dd7ed	\N
d6bc7ced-da2b-448a-bf00-83b2f91e7e19	0	3	\N	\N	68ac1e5b-a905-4161-b824-e16e0320dafe	\N
dc089453-be5a-4942-8b9d-75efa6ec357f	0	3	\N	\N	b3329bd6-f04c-435f-9f5f-8eccca75c8d5	\N
dcd21754-6df1-4fd5-aa71-5f6382853c84	0	1	\N	\N	6256794d-03bd-4ae5-be15-f31307a9cde5	\N
dd1f980b-2b26-4a18-87f1-55655396b1d8	0	1	\N	\N	455176f6-0c03-4f97-8a61-b2650cba2e8a	\N
de85a01d-aff8-42e9-852b-64ba41bd3548	0	2	\N	\N	9e9873ec-516d-4e80-891f-66e80c4ca0bc	\N
e11975dd-6655-4a2e-b4ca-5855396d5e12	0	1	\N	\N	5dc5ef5c-a96c-4b10-9dd5-bac6f3ec7f7a	\N
e5e3f3f4-b83d-429c-9566-02bd21c2f0a9	0	3	\N	\N	051aa648-64ac-44d0-af8d-d2d10ff0c990	\N
eeb85300-7705-4561-9334-961333b38487	0	2	\N	\N	0f10bb57-e062-4813-a8df-d31c5b0f5fe6	\N
f1381b32-3ba6-48ff-8bba-1e2dbab9624e	0	1	\N	\N	3cece985-1fb6-4f9e-b5fa-380b33ef9af0	\N
f199b353-ee0c-4905-a2ce-8b3d7d8bf186	0	3	\N	\N	2d5e0c73-4020-454a-8626-c44c6a18f0fb	\N
f3556a91-fed8-4ebe-ab16-8a19d3b58295	0	1	\N	\N	dcf40340-4f09-4a2e-bd41-fdbefda155c0	\N
f3b78dd1-8c52-4d50-9420-062d90da96e4	0	1	\N	\N	4219a3ea-8652-47a2-ba44-31b4dee04b9b	\N
f4e3b27f-12d4-4bc1-948f-adbeda703a06	0	1	\N	\N	9e9873ec-516d-4e80-891f-66e80c4ca0bc	\N
f54d867b-24cb-4ea2-9be3-67a48c75e479	0	3	\N	\N	4f7e4545-16ab-4967-a8d3-657459f242e3	\N
f6244c3c-dd61-4e67-81cd-458253b91c51	0	3	\N	\N	cdd76479-33d5-4a28-8150-ca57bb3dd7ed	\N
fc7eab9f-7803-4d12-9abe-c79d80641bf7	0	1	\N	\N	a12317ee-c2d8-4615-95bb-778a1ab8d245	\N
fc9ea225-5584-4c5c-a3f7-1d56d3413393	0	2	\N	\N	41246b3c-3768-4ca1-8798-c3bf722a31cd	\N
fde2cf6a-5614-4554-ae81-426fb059b520	0	1	\N	\N	8955ebcd-021e-4dc9-aa63-d7416fdceff7	\N
fed7284b-2072-4178-9a7f-8cbd98e8d197	0	3	\N	\N	e3f1f62d-9f94-4073-96b4-cb3058765da3	\N
ffd8ba8e-fbcb-4165-bfdc-3e6476e1c162	0	1	\N	\N	1691841d-be05-43c9-aadc-4904e251c7ed	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
89ec6329-f1cc-4ffb-9ad3-296caf876c34	Сборка, сварка рам к/с г/п 120-130 т.	6	62cc38c7-198a-4625-b65d-b3437aa45e4b	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
066bff1a-5d23-4c81-a08a-02eb7e3a0172	Лист нижний	75131-2801358-10	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
07b3980e-3a2e-459d-8314-211e8bf5a3b4	Кронштейн задней опоры	75131-8521182-20	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
08644e1c-ce50-4eaa-bc66-e5ae763baf69	Усилитель	75131-2801114-01	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
08f4a416-ae1f-4507-90dc-f8f3f53a50e8	Лонжерон рамы левый	75131-2801017-70	t	2	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
21f26c7c-9f52-4678-badb-c14e474f369c	Опора	75131-2801188	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
27091fd3-26d3-42df-8944-748438266635	Кронштейн задней опоры	75131-8521183-20	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
292717be-22b1-4810-84a0-34fda42af482	Лонжерон рамы правый	75131-2801014-41	t	2	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
37fdcc82-dce9-4c0f-bc6a-10ab7cd167ab	Поперечина №3 рамы с опорами	75132-2801152	t	2	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	Поперечина рамы задняя	75131-2801300-20	t	2	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
3f214008-7bc1-4c46-9d88-9d7f35ba1885	Лонжерон рамы правый	75131-2801016-70	t	2	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
43492e7c-8107-4b63-b092-1bd6434c14ad	Лонжерон рамы левый	75131-2801015-41	t	2	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
440f2cc9-3021-4114-98d4-bdfcda5f479f	Усилитель	75131-2801115-01	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
44f31441-a5f8-4a64-aedb-ac46c74d792a	Кронштейн задней опоры	75131-8521183-20	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
4b5c62d8-faed-4ef3-86a3-8698b475360b	Поперечина	75131-2801325	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
4ef5ec55-c3f2-430b-a3e6-2ab56efdc140	Опора	75131-2801188	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
594c1c1d-867d-4e61-b581-cf07da2b1e44	Кронштейн задней опоры	75131-8521182-20	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
5b543510-63c5-4824-88e5-6964359c8f6d	Лист верхний	75131-2801357-10	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
6d45f3c2-1678-4d7a-aeda-eaae46faac0d	Опора	75131-2801188	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
6fa7d9b8-16cb-4232-8db7-97ab3a8543b3	Усилитель	75131-2801114-01	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
7182fad2-bc2f-477e-b389-37023cc9da9a	Лонжерон рамы левый	75131-2801017-70	t	2	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
7c3deac4-23e1-4f3d-8a27-a1be097f401c	Рама	7513D-2800010-20	t	1	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	4536492774
8095b238-e1b1-41b9-a113-7d0f13b15c8c	Опора	75131-2801188	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
8b6d81d5-001c-4ea9-99b8-35a68695fe5f	Опора	75131-2801188	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
8e83baa7-9384-4e75-aa07-6ac92443d9b6	Поперечина	75131-2801103-10	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
9916b50a-221b-4ef7-bb97-c59f2633a223	Опора	75131-2801188	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
a80f7277-8553-4188-8a52-aa885c2a84d4	Накладка рамы поперечная передняя	75131-2801088-70	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
ac61a8ab-9f80-4368-a708-8cb91bed9a95	Лонжерон рамы правый	75131-2801014-41	t	2	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
acd4c3c6-98b8-4336-ae39-04c6babd9392	Поперечина	75131-2801103-10	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
b4675632-cf14-4980-9ffc-4b112a702fa6	Опора	75131-2801188	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
b6eb0c91-f030-4f46-8ae8-d7d78dbb159f	Поперечина №3 рамы с опорами	75132-2801152	t	2	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	Поперечина рамы задняя	75131-2801300-20	t	2	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
c7221267-c7f4-4e88-93b5-be561d5be749	Лонжерон рамы правый	75131-2801016-70	t	2	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
d3576af5-b86d-49dc-a882-21a2827027b6	Накладка рамы поперечная передняя	75131-2801088-70	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
da0a24d1-bb7f-4f4e-8fca-60a14afe45cf	Лист верхний	75131-2801357-10	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
e0d86529-75d4-4c5a-89d9-2e0385002853	Рама	75131-2800010-70	t	1	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	4536479362
e81ac89c-654c-4cf0-a72d-5388ef6a1da7	Накладка рамы поперечная передняя	75131-2801088-70	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
ec787539-f9cf-4b8f-84ab-117fd0bd1553	Поперечина	75131-2801325	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
eca960be-8efb-4c38-9242-934f2443ddc6	Усилитель	75131-2801115-01	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
fbcfb5d7-1f24-4ee8-b612-63d00ae7d222	Накладка рамы поперечная передняя	75131-2801088-70	t	3	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
ffb60a95-ae70-46b9-8cc1-a53e1eff0a44	Опора	75131-2801188	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N	\N	\N
88368623-eadc-4407-802c-835af463f7e0	Лист нижний	75131-2801358-10	t	3	07995cf6-68ae-4d6f-a2ea-2fce11239525	89ec6329-f1cc-4ffb-9ad3-296caf876c34	dfabd7ef-58b8-428f-8e46-846726d3e4a9	\N	\N	\N
cc4b6cd9-ca98-476b-9fd0-f80e2dcbd3c6	Лонжерон рамы левый	75131-2801015-41	t	2	11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	dfabd7ef-58b8-428f-8e46-846726d3e4a9	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
5560bf02-e8a7-4caf-ae9f-c0f5fcc46047	Admin	\N
997ccc78-28c1-4829-949d-0c62fc562bba	Master	\N
df6c5bd7-1299-48ea-838c-5756ea1b27a1	Welder	\N
36c0fcdf-d451-4d8f-a88f-7d23a66f46e0	Inspector	\N
57ffd7e3-f280-42f3-9f3d-6271e3c3b762	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "IdFromSystem") FROM stdin;
005ca7b1-6181-4c47-8197-cb4f8a49828b	2023-03-04 20:25:15.263904	1811dfec-25f0-4615-9380-edbf9153e913	\N
0345f39e-c8f9-4453-89a5-8de035040723	2023-03-04 20:25:15.263984	c1f81f13-8020-4b08-b0ab-919efd398b7d	\N
04886282-efa1-494f-b67c-2a9f4f54e98e	2023-03-04 20:25:15.263744	f2a610db-35ed-4829-813f-9ad66f1ea440	\N
0edbf5a9-59a8-4e08-90c5-cf845d1ab23a	2023-03-04 20:25:15.261024	2a602d9f-b415-4554-8144-22b9e7f0fc01	\N
15045b02-914f-4a6e-bc74-11788e787eff	2023-03-04 20:25:15.262492	182678e4-f9a7-4f54-b705-7ea24ef60a14	\N
1554eaee-92a7-4909-bd95-d0ef2839d0fa	2023-03-04 20:25:15.261272	50d9e659-2e83-48a7-90cc-0498d402487e	\N
1745d6a0-73e2-4912-9fbf-8532d75c3f7d	2023-03-04 20:25:15.264215	d166f035-030c-40f8-a2a1-57e9ecfeabff	\N
1a7f8418-2d00-464d-876e-0cf128ef7fcf	2023-03-04 20:25:15.242063	9ea2634a-d6ae-4216-a242-4d49d9160712	\N
1e8b6174-1b53-4c13-87e2-7577c1a34d29	2023-03-04 20:25:15.262958	1e26b1bc-ba10-4404-8d1f-fd35667d720a	\N
31191936-05ff-4c4e-a24a-dae3c211e49b	2023-03-04 20:25:15.263115	009dcd93-2193-48f7-aabe-b6c94e307ebc	\N
379d949e-95c6-4551-8163-dddebd8f04e8	2023-03-04 20:25:15.264138	97c118f0-1063-4ade-85b6-03812a4eda24	\N
3effa23e-2725-4caf-97cf-319a18732950	2023-03-04 20:25:15.264373	169a0310-5c6a-4e3c-b187-658d38a31b1b	\N
3f27f9fd-b50c-48bf-8c7b-20b6d19987ec	2023-03-04 20:25:15.261763	49ec298f-03ef-44d7-8e71-bbfa6a8cb0d7	\N
4eb3b140-0d49-44d2-9228-836c8a5f122d	2023-03-04 20:25:15.26351	ca74edd5-e568-4a32-b934-085effdc6f8b	\N
53dba1d5-2341-4155-87b0-471956594782	2023-03-04 20:25:15.263433	416e4104-8ca1-4798-a026-273700f9d2fa	\N
5a5e1148-6c9f-4481-9e00-22d00a487a87	2023-03-04 20:25:15.263827	d96ab46c-9f3c-4179-8173-335245e29999	\N
5c003d1b-4191-41c4-aee6-57377f8fe0b1	2023-03-04 20:25:15.261531	e754c28b-3f8a-47f5-86e6-aa4f02f1cf93	\N
64628116-3ea0-4945-98a5-436dbf13899e	2023-03-04 20:25:15.26335	e6935f0f-7975-42a9-a8b3-4724b8b2d8eb	\N
66860ebc-d564-4bc5-869f-1d1e44502fe5	2023-03-04 20:25:15.264686	e0f1a070-df45-4597-bfa7-91ddc83aa56a	\N
68f956b6-9494-4ad6-ba5e-dc2e1af5cb04	2023-03-04 20:25:15.264294	89f9dc39-8dea-4162-b4fd-f07a6e67268a	\N
69569f68-c058-4cf3-a6dd-f97472bf9510	2023-03-04 20:25:15.263586	19b182a6-d012-4f34-8d98-461426abe1ad	\N
781d3add-9341-417d-9f92-01c65a5032cd	2023-03-04 20:25:15.263273	383f5208-4b74-46d6-af4e-aa49ca1388f2	\N
790a05ac-691f-4fc8-9bfd-8800abbe1d71	2023-03-04 20:25:15.26185	c04d4e55-8769-4f97-8abc-42f6328ff72a	\N
7c4f803b-19de-41c0-941e-abd54242ed6f	2023-03-04 20:25:15.262724	819f71a2-b9ca-40b2-adb7-eecaa2bd70fc	\N
82029b47-de83-47a6-98a2-e2b30734ad16	2023-03-04 20:25:15.262411	bbf74166-ce7c-4d4a-b51f-e36f5e2a662e	\N
841a7b91-8925-42d4-bf93-5a5d7f1fcaf6	2023-03-04 20:25:15.261611	90714116-1f41-4555-b690-09e866d09c61	\N
8839613d-7692-4053-8e46-410636f9ae8b	2023-03-04 20:25:15.261109	b74a5425-6259-4e2d-8199-05c97c798fc1	\N
9bcbb75e-c595-4d83-aace-0f93635cdede	2023-03-04 20:25:15.262331	33739b02-a2c6-4277-bafe-e3a1ae12ebdb	\N
9e2bbae3-5b12-40be-b08f-baf061c41551	2023-03-04 20:25:15.26094	9e8743e1-a8cd-45b8-b59a-7ea56f1a5e40	\N
9f97733c-40cd-49bc-bb42-75271df13c05	2023-03-04 20:25:15.264764	37bd6842-bc88-416b-81ca-3f79f02087cb	\N
a0165617-e8b0-4e39-9f0b-abb2b4f1f1ec	2023-03-04 20:25:15.263196	737f5b66-6827-4561-aba4-878f82b927ff	\N
a0f41b1a-f669-404f-8f24-fe8b5981ffcf	2023-03-04 20:25:15.262569	8d548e09-fd59-4c24-a454-da73eed65a9c	\N
a48baab5-2344-4b8a-a26e-fa7eab0d13d1	2023-03-04 20:25:15.262804	e0cb6f62-bf64-40d6-ae9a-e6905ed69f54	\N
b8fdfa03-6378-4580-93ad-226bcfa8716f	2023-03-04 20:25:15.261188	718d91d6-a896-47f9-a012-97a8aab412c1	\N
b9da3146-05cf-4776-8d52-b343a954f259	2023-03-04 20:25:15.264451	f1e380db-9cb8-42b0-ae3a-a281898af961	\N
c3ae0f9e-5715-41d2-946a-2e26ac6a7701	2023-03-04 20:25:15.261689	1df3fb16-8112-40a1-ade7-15b73d2d05ba	\N
c8c053bf-2d40-4277-b502-ddabb0df39f1	2023-03-04 20:25:15.264061	0ab1ce4a-8d3d-4501-9a68-5ed25835e8cb	\N
db37171c-0f17-4c47-ab54-88bf067dd8dd	2023-03-04 20:25:15.260831	dc278cd4-38e9-4870-8a6a-39b2141bf54e	\N
de1027a3-00c3-4f63-a2d0-e14a019fb7c6	2023-03-04 20:25:15.261446	97a49164-a4e2-4d24-870a-676fa755c83d	\N
e1c7d92d-7f34-45e6-9948-16981a080828	2023-03-04 20:25:15.261358	a5f2469e-cd3b-4c0a-8569-2bb5009187fd	\N
e22ebac2-1841-4e3f-9a13-443058bc2a84	2023-03-04 20:25:15.264527	b8fbed73-7365-4e42-aef5-851e1e63c921	\N
e3ed1a62-bf6f-4f43-bb41-1e63ee1bada4	2023-03-04 20:25:15.262646	35e99659-46c7-4be5-a78b-3d51db446d69	\N
e57eff6e-4500-4be2-bfb6-d3cf83a34f6e	2023-03-04 20:25:15.262163	443e6c5e-43cc-4462-84a7-0c99d8cd14bd	\N
e67dd0f1-1311-449d-b8e9-9e0ff2900ac5	2023-03-04 20:25:15.261928	c907bdaf-28c6-4a73-9d90-849a106d34c4	\N
e7ec392e-121f-4a48-af2a-a1efa7098fb8	2023-03-04 20:25:15.262243	f3ebffa3-e047-4db5-9fa6-8e9d842d332d	\N
ecd658ac-6293-4686-b7e8-9afcf16afbc8	2023-03-04 20:25:15.262882	11bfa8cb-00dc-492d-99bd-64bc31904436	\N
ed4c27ad-9129-4d93-a33a-34e9d93bae63	2023-03-04 20:25:15.262083	4aaa5377-cfe5-4d10-af7b-858159e5cedd	\N
eeefe0d5-39ac-42c2-826d-f59583fe89be	2023-03-04 20:25:15.26484	16af0499-db38-49e1-a773-7b64a4c57fcb	\N
f0d2181f-8671-41e9-b827-a46809407ff8	2023-03-04 20:25:15.262005	4c8aafc7-2af4-4fa4-93d9-9557132470d8	\N
f2b650c8-531b-4839-bc29-00c6518c6964	2023-03-04 20:25:15.263036	49980473-65f5-4ee6-b129-271ab37e38e6	\N
f33ccf62-355e-4d2d-bfd4-378a1ec07184	2023-03-04 20:25:15.264609	3fc0d2b3-78c4-4dbf-a874-1f26a34221a1	\N
fa17fae4-c230-4f29-a2fd-5c19852fb4a1	2023-03-04 20:25:15.263664	584f0f51-1818-4eea-89da-27ec92dae982	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
00fdb35d-7486-4301-a79c-ba84dd31797c	0	2	\N	\N	de1027a3-00c3-4f63-a2d0-e14a019fb7c6	\N
04771b1d-990c-405b-9043-8187cb914296	0	1	\N	\N	eeefe0d5-39ac-42c2-826d-f59583fe89be	\N
04a02394-4b5e-4244-b75a-c4d9ce44d699	0	3	\N	\N	b8fdfa03-6378-4580-93ad-226bcfa8716f	\N
05369044-808e-4fa9-adee-150d07b1c3e2	0	3	\N	\N	e1c7d92d-7f34-45e6-9948-16981a080828	\N
05acf4c1-31ec-4359-aa30-1a4f1146816a	0	1	\N	\N	1745d6a0-73e2-4912-9fbf-8532d75c3f7d	\N
09e025eb-64e9-424f-8f19-1c90d4abf916	0	1	\N	\N	04886282-efa1-494f-b67c-2a9f4f54e98e	\N
0b27234b-eee2-4791-9960-1683174a5dfd	0	2	\N	\N	c3ae0f9e-5715-41d2-946a-2e26ac6a7701	\N
0c3a353a-7773-4336-8bb5-12c957a05cd4	0	2	\N	\N	0345f39e-c8f9-4453-89a5-8de035040723	\N
0cc35486-0190-47c3-8344-20f535d9565f	0	1	\N	\N	53dba1d5-2341-4155-87b0-471956594782	\N
0d38b999-0a12-4987-af8d-dc062cec2681	0	1	\N	\N	f2b650c8-531b-4839-bc29-00c6518c6964	\N
0fad6ee0-a472-491e-9514-0c852623cb25	0	1	\N	\N	8839613d-7692-4053-8e46-410636f9ae8b	\N
1210d906-b049-46b8-ba5f-dfd7114978ed	0	1	\N	\N	1e8b6174-1b53-4c13-87e2-7577c1a34d29	\N
131cd371-fdc9-4a64-9575-9b74c08e1268	0	2	\N	\N	a48baab5-2344-4b8a-a26e-fa7eab0d13d1	\N
18485b50-f6ef-40b5-ae7d-9fc6caa32885	0	2	\N	\N	31191936-05ff-4c4e-a24a-dae3c211e49b	\N
1bb51f2d-c8ab-4df1-8d1f-ec93342b7d99	0	2	\N	\N	69569f68-c058-4cf3-a6dd-f97472bf9510	\N
1bdf6ca3-bbf4-4e93-a0d4-7ed8c03bbb99	0	2	\N	\N	8839613d-7692-4053-8e46-410636f9ae8b	\N
1bf65141-562b-4c22-b9f9-3d3077ef1440	0	1	\N	\N	f33ccf62-355e-4d2d-bfd4-378a1ec07184	\N
1c9ccb89-5f65-47db-be7b-ce5a049bf128	0	2	\N	\N	1a7f8418-2d00-464d-876e-0cf128ef7fcf	\N
1d680c71-6ffc-4e05-8dee-55e926439c57	0	3	\N	\N	31191936-05ff-4c4e-a24a-dae3c211e49b	\N
1f208297-f90d-40e6-87ea-22899bf6692b	0	1	\N	\N	e3ed1a62-bf6f-4f43-bb41-1e63ee1bada4	\N
1f4f73b2-79a1-4a6f-9e2e-8f943062aa8b	0	2	\N	\N	f0d2181f-8671-41e9-b827-a46809407ff8	\N
1fcce6e7-e363-4681-a913-705a4b98365b	0	1	\N	\N	5c003d1b-4191-41c4-aee6-57377f8fe0b1	\N
202c672f-2a8e-4bdd-a645-e0355b69324a	0	1	\N	\N	781d3add-9341-417d-9f92-01c65a5032cd	\N
217b2d34-9891-4769-a910-32556ee10f44	0	2	\N	\N	005ca7b1-6181-4c47-8197-cb4f8a49828b	\N
24bbdd4a-1fb6-433b-a5ff-9e61d0310c7b	0	1	\N	\N	de1027a3-00c3-4f63-a2d0-e14a019fb7c6	\N
2544369c-6fb3-462d-9924-09560f8acfa5	0	1	\N	\N	ecd658ac-6293-4686-b7e8-9afcf16afbc8	\N
26412088-85d5-47e1-8d6c-14e68c7bb6de	0	3	\N	\N	7c4f803b-19de-41c0-941e-abd54242ed6f	\N
28028e39-6b3b-4f27-b013-bfbdd17a6c04	0	2	\N	\N	781d3add-9341-417d-9f92-01c65a5032cd	\N
28acb44b-1fb7-4a24-ad27-1d3ae3b22a2a	0	1	\N	\N	a0f41b1a-f669-404f-8f24-fe8b5981ffcf	\N
292dea6b-e405-4512-9c41-851f06b795cf	0	1	\N	\N	379d949e-95c6-4551-8163-dddebd8f04e8	\N
299bda1c-ce7b-4e23-93d3-38509e47dc93	0	2	\N	\N	b8fdfa03-6378-4580-93ad-226bcfa8716f	\N
2c2923e0-6165-480e-9aa2-ea07178e9532	0	3	\N	\N	66860ebc-d564-4bc5-869f-1d1e44502fe5	\N
31d26557-0c0b-4e42-8b7b-aeba4deb5a79	0	3	\N	\N	5c003d1b-4191-41c4-aee6-57377f8fe0b1	\N
33c2efde-4137-400e-896f-d0d853f3399a	0	1	\N	\N	15045b02-914f-4a6e-bc74-11788e787eff	\N
34f8776f-46ce-4560-8ab7-54b89f2e5822	0	2	\N	\N	3effa23e-2725-4caf-97cf-319a18732950	\N
36509d1e-b580-4376-8d2d-418320bffb7f	0	1	\N	\N	66860ebc-d564-4bc5-869f-1d1e44502fe5	\N
366db5cf-1abe-4823-9edd-c3f71702e977	0	3	\N	\N	04886282-efa1-494f-b67c-2a9f4f54e98e	\N
37b873a2-75ba-44f6-b27c-39ec68b21ec8	0	3	\N	\N	1a7f8418-2d00-464d-876e-0cf128ef7fcf	\N
383a8f18-7c31-4eaa-9fc9-1f62dd073bb4	0	3	\N	\N	9e2bbae3-5b12-40be-b08f-baf061c41551	\N
3b6da11b-81fc-41d8-b843-5daa262bc1ce	0	1	\N	\N	5a5e1148-6c9f-4481-9e00-22d00a487a87	\N
3beb6e9f-db72-4e24-806c-0c58f64332dd	0	3	\N	\N	f33ccf62-355e-4d2d-bfd4-378a1ec07184	\N
3c3b95dd-30a9-47a6-8dda-d4ed1c6fb506	0	3	\N	\N	1554eaee-92a7-4909-bd95-d0ef2839d0fa	\N
3e29d72d-8271-4164-922c-88895d991a51	0	2	\N	\N	e7ec392e-121f-4a48-af2a-a1efa7098fb8	\N
3ea60129-9165-4756-89a3-c4838df0ad04	0	1	\N	\N	f0d2181f-8671-41e9-b827-a46809407ff8	\N
4157ea94-f0e4-4553-9006-1a42e5585c1b	0	1	\N	\N	790a05ac-691f-4fc8-9bfd-8800abbe1d71	\N
4663a80c-e1c0-476c-b922-ef4c62030c83	0	1	\N	\N	b9da3146-05cf-4776-8d52-b343a954f259	\N
4832de7f-0958-4b15-acc6-90451909015e	0	1	\N	\N	a0165617-e8b0-4e39-9f0b-abb2b4f1f1ec	\N
4833217f-4a3c-4bb0-aca2-eb7c61f5b62b	0	2	\N	\N	ecd658ac-6293-4686-b7e8-9afcf16afbc8	\N
495f203d-0420-48c3-8cb8-5b41cee9d072	0	3	\N	\N	8839613d-7692-4053-8e46-410636f9ae8b	\N
49759606-30fa-424c-8959-fa84ec5eccb4	0	3	\N	\N	c3ae0f9e-5715-41d2-946a-2e26ac6a7701	\N
4ce3e035-4bb2-4837-b331-d3575b6b1188	0	3	\N	\N	53dba1d5-2341-4155-87b0-471956594782	\N
4cec245e-26c9-41c1-b0ae-bd553f26cbd3	0	1	\N	\N	0edbf5a9-59a8-4e08-90c5-cf845d1ab23a	\N
4e7cfafa-7821-403c-a184-125683afd79b	0	1	\N	\N	841a7b91-8925-42d4-bf93-5a5d7f1fcaf6	\N
4fb71faa-03c4-48ea-9a20-d405d95d0324	0	3	\N	\N	eeefe0d5-39ac-42c2-826d-f59583fe89be	\N
5265c7ae-4e87-4a5f-9327-12225e49089b	0	2	\N	\N	9f97733c-40cd-49bc-bb42-75271df13c05	\N
53233082-9a0e-4900-bb9f-19c14ef8b251	0	2	\N	\N	53dba1d5-2341-4155-87b0-471956594782	\N
5728342a-ec0c-4338-9c09-ad396fa141ce	0	3	\N	\N	db37171c-0f17-4c47-ab54-88bf067dd8dd	\N
574f2a01-d943-4b75-abed-abe5e65d85d0	0	2	\N	\N	e22ebac2-1841-4e3f-9a13-443058bc2a84	\N
5962168a-2c0b-49d4-9912-920c507f4fc0	0	2	\N	\N	9bcbb75e-c595-4d83-aace-0f93635cdede	\N
5a9cf226-e0ba-472b-9685-a1d9c4a08c9d	0	2	\N	\N	4eb3b140-0d49-44d2-9228-836c8a5f122d	\N
5db09e97-95a9-4c31-98eb-bc821563b6f5	0	1	\N	\N	e22ebac2-1841-4e3f-9a13-443058bc2a84	\N
5eedd7b6-ffc8-42b5-b00a-6ce47e1535dc	0	3	\N	\N	1e8b6174-1b53-4c13-87e2-7577c1a34d29	\N
61f5bf9e-6da1-464c-a55e-80e392bb2fc1	0	3	\N	\N	e67dd0f1-1311-449d-b8e9-9e0ff2900ac5	\N
640d7210-61db-4e8e-8a11-21c642277968	0	3	\N	\N	e22ebac2-1841-4e3f-9a13-443058bc2a84	\N
66671219-a8be-4ece-93df-6ea35e390c87	0	3	\N	\N	005ca7b1-6181-4c47-8197-cb4f8a49828b	\N
6726c499-8c07-4aff-b11e-d2334b7aa5c0	0	2	\N	\N	1745d6a0-73e2-4912-9fbf-8532d75c3f7d	\N
672916e8-5ff5-42fa-89f6-1eba530e9a5a	0	3	\N	\N	e57eff6e-4500-4be2-bfb6-d3cf83a34f6e	\N
67ec940b-a1f4-4515-8554-405688c68671	0	1	\N	\N	e1c7d92d-7f34-45e6-9948-16981a080828	\N
6899514e-61f2-4845-9e17-b65536e42962	0	3	\N	\N	fa17fae4-c230-4f29-a2fd-5c19852fb4a1	\N
689d5131-3e92-438e-b223-fc1179f41cf4	0	3	\N	\N	1745d6a0-73e2-4912-9fbf-8532d75c3f7d	\N
6bfe4959-8544-4fd1-baca-347d91588468	0	3	\N	\N	0345f39e-c8f9-4453-89a5-8de035040723	\N
6fcdb93f-c48a-419a-a397-7131c0be7dd9	0	1	\N	\N	9bcbb75e-c595-4d83-aace-0f93635cdede	\N
7284f94d-3372-447f-96c3-d65a8b571a5f	0	3	\N	\N	64628116-3ea0-4945-98a5-436dbf13899e	\N
752837e4-74ba-435e-9e5a-57a21e0e8398	0	2	\N	\N	ed4c27ad-9129-4d93-a33a-34e9d93bae63	\N
76e68b0e-ad48-4b93-9c4a-da8951c85d62	0	3	\N	\N	ecd658ac-6293-4686-b7e8-9afcf16afbc8	\N
77e991bf-66a9-4b53-b370-3bfac9f2cbc6	0	3	\N	\N	f0d2181f-8671-41e9-b827-a46809407ff8	\N
7a2f1059-eed2-47b0-874e-5ae822b7fd7c	0	1	\N	\N	69569f68-c058-4cf3-a6dd-f97472bf9510	\N
7c6a588e-9a01-471e-8fe4-2b542cf61c9c	0	2	\N	\N	f2b650c8-531b-4839-bc29-00c6518c6964	\N
7f0a4913-2b9b-4f3f-891e-c486594d33ff	0	2	\N	\N	f33ccf62-355e-4d2d-bfd4-378a1ec07184	\N
8004a9f7-73ba-4ccd-8857-5ec4f2c8baf1	0	1	\N	\N	db37171c-0f17-4c47-ab54-88bf067dd8dd	\N
804ebe5e-63bf-4d19-a846-1e29d81ff831	0	3	\N	\N	f2b650c8-531b-4839-bc29-00c6518c6964	\N
84a8a10e-a453-4365-b517-a35253f855d0	0	1	\N	\N	31191936-05ff-4c4e-a24a-dae3c211e49b	\N
882662df-0281-42a7-9038-60828ae0f8fd	0	3	\N	\N	5a5e1148-6c9f-4481-9e00-22d00a487a87	\N
88578690-1545-4c63-9663-71af5bad36fe	0	2	\N	\N	5a5e1148-6c9f-4481-9e00-22d00a487a87	\N
8880d37d-aba6-4dff-a426-2c7d0ee6b82e	0	3	\N	\N	9bcbb75e-c595-4d83-aace-0f93635cdede	\N
8b7a267d-16fb-4318-a1bd-96861abc4eb2	0	1	\N	\N	e7ec392e-121f-4a48-af2a-a1efa7098fb8	\N
9362a40e-07ac-495b-9528-a676252961fa	0	1	\N	\N	3effa23e-2725-4caf-97cf-319a18732950	\N
9453c93f-37e3-4037-8d8f-7bf13680fa1f	0	1	\N	\N	4eb3b140-0d49-44d2-9228-836c8a5f122d	\N
96a0da9c-eb74-48aa-883b-9a12ba8a9048	0	3	\N	\N	c8c053bf-2d40-4277-b502-ddabb0df39f1	\N
97080e5c-cd49-4d59-8396-3bdd70db7e06	0	3	\N	\N	82029b47-de83-47a6-98a2-e2b30734ad16	\N
986c28e4-8715-442b-b4af-98637c7f5bb3	0	2	\N	\N	790a05ac-691f-4fc8-9bfd-8800abbe1d71	\N
989aed98-e218-4f6d-80d4-19f4f168bea9	0	3	\N	\N	3effa23e-2725-4caf-97cf-319a18732950	\N
98a7e0d2-f8bf-4bef-a019-5ea8d91f2aee	0	3	\N	\N	781d3add-9341-417d-9f92-01c65a5032cd	\N
98e44abc-fd51-4953-807b-1c392f307926	0	2	\N	\N	04886282-efa1-494f-b67c-2a9f4f54e98e	\N
9947d113-c3b0-49cb-b0cc-55b97af0cba9	0	2	\N	\N	68f956b6-9494-4ad6-ba5e-dc2e1af5cb04	\N
9a370ee8-e151-494d-bf02-6e8c3e742443	0	2	\N	\N	c8c053bf-2d40-4277-b502-ddabb0df39f1	\N
9cb2a30c-77ab-4910-a949-614da9ffcd57	0	3	\N	\N	a0165617-e8b0-4e39-9f0b-abb2b4f1f1ec	\N
a4fe87f3-13db-408b-8883-fff3e0d31dcd	0	2	\N	\N	b9da3146-05cf-4776-8d52-b343a954f259	\N
a5e1d472-3ecc-4a4a-8929-021c675ada3d	0	2	\N	\N	5c003d1b-4191-41c4-aee6-57377f8fe0b1	\N
a74c7c1c-46b7-4f3d-aae0-849ec3edc830	0	2	\N	\N	66860ebc-d564-4bc5-869f-1d1e44502fe5	\N
a99d3708-b1c9-4429-a2ef-9646f06f3146	0	3	\N	\N	3f27f9fd-b50c-48bf-8c7b-20b6d19987ec	\N
aaa5ad1d-1ddc-4dfa-8356-98236b1c0229	0	2	\N	\N	e57eff6e-4500-4be2-bfb6-d3cf83a34f6e	\N
aaa686d5-a132-4523-8bd1-8b0e3893db36	0	1	\N	\N	68f956b6-9494-4ad6-ba5e-dc2e1af5cb04	\N
ac8fad0d-c748-4558-8304-fe9971f00da0	0	1	\N	\N	1554eaee-92a7-4909-bd95-d0ef2839d0fa	\N
aca1b9a7-1f67-4a33-9365-1d12f710a3ad	0	1	\N	\N	005ca7b1-6181-4c47-8197-cb4f8a49828b	\N
adc7a845-76be-4aa2-9757-e800e303bff8	0	3	\N	\N	15045b02-914f-4a6e-bc74-11788e787eff	\N
aeb441db-85a0-47c5-8fe0-f4fbda4807a8	0	3	\N	\N	68f956b6-9494-4ad6-ba5e-dc2e1af5cb04	\N
aeedc8d0-9f45-475f-b3e7-4511e12f9f42	0	1	\N	\N	9e2bbae3-5b12-40be-b08f-baf061c41551	\N
af4e7f3a-fcad-4794-a91f-d090c5005666	0	2	\N	\N	379d949e-95c6-4551-8163-dddebd8f04e8	\N
b12d9fb3-896d-49f4-ae33-73dd73f37a9a	0	1	\N	\N	64628116-3ea0-4945-98a5-436dbf13899e	\N
b366ddcf-03d5-47d1-9418-24c5d7724ad5	0	2	\N	\N	1554eaee-92a7-4909-bd95-d0ef2839d0fa	\N
b4d9fcc4-a226-458f-b79c-90e9b3f7f2bd	0	2	\N	\N	fa17fae4-c230-4f29-a2fd-5c19852fb4a1	\N
b4fcdb6a-27d0-438e-bb68-4cd34a3da3e1	0	3	\N	\N	0edbf5a9-59a8-4e08-90c5-cf845d1ab23a	\N
b5adb79d-7f78-40db-9bca-54e25ac1c6fb	0	3	\N	\N	379d949e-95c6-4551-8163-dddebd8f04e8	\N
b8d75a55-b714-48c7-b256-b565c9e8097f	0	1	\N	\N	82029b47-de83-47a6-98a2-e2b30734ad16	\N
b90144db-3377-4c6a-a28a-6c3301249670	0	3	\N	\N	e7ec392e-121f-4a48-af2a-a1efa7098fb8	\N
b9b2a65c-b95b-49c8-8df3-f5d2528b74c8	0	3	\N	\N	4eb3b140-0d49-44d2-9228-836c8a5f122d	\N
b9ee3b0b-0b12-40f6-9113-0b606cad5bfe	0	2	\N	\N	82029b47-de83-47a6-98a2-e2b30734ad16	\N
bb414603-c8bc-4ab1-b068-dd6739fcb958	0	2	\N	\N	a0f41b1a-f669-404f-8f24-fe8b5981ffcf	\N
bb7137dd-a295-41ce-98a6-cbd1d972e2d3	0	1	\N	\N	7c4f803b-19de-41c0-941e-abd54242ed6f	\N
c23cc69b-aca7-41ba-b7f1-8d4b9f1c6578	0	2	\N	\N	a0165617-e8b0-4e39-9f0b-abb2b4f1f1ec	\N
c25c7efd-0f8d-4274-b906-951bfc631cfa	0	3	\N	\N	841a7b91-8925-42d4-bf93-5a5d7f1fcaf6	\N
c2f2681e-88fb-4296-80d4-bd04cd065792	0	2	\N	\N	db37171c-0f17-4c47-ab54-88bf067dd8dd	\N
c7d65e5c-19f7-4a21-b6de-f086127cbddd	0	2	\N	\N	e67dd0f1-1311-449d-b8e9-9e0ff2900ac5	\N
ce700eba-6469-41e6-9251-7fc8e06e94c7	0	2	\N	\N	9e2bbae3-5b12-40be-b08f-baf061c41551	\N
ce760ac6-93c1-4621-a74f-da948f7a3205	0	1	\N	\N	e57eff6e-4500-4be2-bfb6-d3cf83a34f6e	\N
cf228e59-2ff5-4fa1-a2d9-683cf7476749	0	2	\N	\N	0edbf5a9-59a8-4e08-90c5-cf845d1ab23a	\N
d3c5cbb9-214f-4a0a-8cea-65a3ec09cbcf	0	3	\N	\N	e3ed1a62-bf6f-4f43-bb41-1e63ee1bada4	\N
d8db94b5-587e-45f0-9f1e-0e1bb834c64a	0	1	\N	\N	3f27f9fd-b50c-48bf-8c7b-20b6d19987ec	\N
d99ec891-d981-4754-9f0c-a310956c56cf	0	2	\N	\N	e1c7d92d-7f34-45e6-9948-16981a080828	\N
dad3de2c-6667-410f-9bc0-251fc058578a	0	3	\N	\N	ed4c27ad-9129-4d93-a33a-34e9d93bae63	\N
dc66733c-aaad-4e53-9a18-59cab4fc1e37	0	2	\N	\N	eeefe0d5-39ac-42c2-826d-f59583fe89be	\N
dc70251b-faa5-4584-8292-a89f93b944d6	0	2	\N	\N	64628116-3ea0-4945-98a5-436dbf13899e	\N
dd51912e-b0b9-44a8-b93c-0ce19e283614	0	1	\N	\N	fa17fae4-c230-4f29-a2fd-5c19852fb4a1	\N
dd766764-9a6d-4a39-90c2-40814f54899e	0	3	\N	\N	a0f41b1a-f669-404f-8f24-fe8b5981ffcf	\N
de002848-0e88-44d3-88f6-b899d2e65cb4	0	3	\N	\N	a48baab5-2344-4b8a-a26e-fa7eab0d13d1	\N
df3d29ce-65ad-4503-bec2-69f6ab1bc9e5	0	2	\N	\N	15045b02-914f-4a6e-bc74-11788e787eff	\N
dfc4af9a-a5fe-4d26-ab9f-3084d1580a49	0	3	\N	\N	790a05ac-691f-4fc8-9bfd-8800abbe1d71	\N
dfd8ad53-602b-4a8a-8c3e-5df513250f1f	0	2	\N	\N	1e8b6174-1b53-4c13-87e2-7577c1a34d29	\N
e0369e1b-d605-43d9-8e06-4ae1f44cdf53	0	3	\N	\N	9f97733c-40cd-49bc-bb42-75271df13c05	\N
e1c9a5e0-07f9-46b4-8a95-43c58a9031a0	0	2	\N	\N	841a7b91-8925-42d4-bf93-5a5d7f1fcaf6	\N
e2a11380-f6ce-4b8b-956a-fc19a39de338	0	1	\N	\N	c8c053bf-2d40-4277-b502-ddabb0df39f1	\N
e4c6e873-2088-4f96-ac0f-73a5fac0f59d	0	3	\N	\N	b9da3146-05cf-4776-8d52-b343a954f259	\N
e53e15df-d363-4ed6-832a-3573c16b2254	0	3	\N	\N	69569f68-c058-4cf3-a6dd-f97472bf9510	\N
e906f8d5-f0b3-4ac7-97bf-e1def615926d	0	1	\N	\N	c3ae0f9e-5715-41d2-946a-2e26ac6a7701	\N
eaf9a6a5-71ff-40e0-8194-c4e9bcb757b1	0	1	\N	\N	a48baab5-2344-4b8a-a26e-fa7eab0d13d1	\N
eb8d02fa-6948-4073-acea-ffe0bd00e771	0	1	\N	\N	0345f39e-c8f9-4453-89a5-8de035040723	\N
ebc9a3cd-4679-456f-abcc-e86821e5698c	0	1	\N	\N	e67dd0f1-1311-449d-b8e9-9e0ff2900ac5	\N
ed6e01d3-85ed-4172-aeec-fcca3fb5315f	0	1	\N	\N	ed4c27ad-9129-4d93-a33a-34e9d93bae63	\N
ed93266c-7a92-451b-a346-b0f82d41e8b7	0	3	\N	\N	de1027a3-00c3-4f63-a2d0-e14a019fb7c6	\N
efb07f30-2c7a-4449-b923-6cb12af645d1	0	2	\N	\N	7c4f803b-19de-41c0-941e-abd54242ed6f	\N
f33afc64-d3dc-4c3b-9bb2-6adefd90e8a9	0	1	\N	\N	1a7f8418-2d00-464d-876e-0cf128ef7fcf	\N
f69817f6-7129-4ec5-b80f-7fbbe4147e43	0	2	\N	\N	3f27f9fd-b50c-48bf-8c7b-20b6d19987ec	\N
f715c257-29f2-4cc9-9854-f2afe36d3bca	0	2	\N	\N	e3ed1a62-bf6f-4f43-bb41-1e63ee1bada4	\N
fa6f5794-a2b7-4254-812e-d86b3e5fc9b2	0	1	\N	\N	b8fdfa03-6378-4580-93ad-226bcfa8716f	\N
fcafc06b-d6c8-4567-85db-bdd6160110a0	0	1	\N	\N	9f97733c-40cd-49bc-bb42-75271df13c05	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
009dcd93-2193-48f7-aabe-b6c94e307ebc	52	1200	t	f	8e83baa7-9384-4e75-aa07-6ac92443d9b6	b3da68b3-8dc1-4853-ba04-adee09d09988	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
0ab1ce4a-8d3d-4501-9a68-5ed25835e8cb	18	4000	t	f	cc4b6cd9-ca98-476b-9fd0-f80e2dcbd3c6	23516e53-9742-4b78-99ab-9082aedabe1c	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
11bfa8cb-00dc-492d-99bd-64bc31904436	48	1900	t	f	88368623-eadc-4407-802c-835af463f7e0	eb7a3367-aa8c-42b4-a82c-a10ee1d3641d	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
169a0310-5c6a-4e3c-b187-658d38a31b1b	39	280	t	f	e81ac89c-654c-4cf0-a72d-5388ef6a1da7	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
16af0499-db38-49e1-a773-7b64a4c57fcb	58	900	t	f	ffb60a95-ae70-46b9-8cc1-a53e1eff0a44	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
1811dfec-25f0-4615-9380-edbf9153e913	39	280	t	f	b8fe1c84-6b7e-4ec0-bedd-e8c8e371ebb5	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
182678e4-f9a7-4f54-b705-7ea24ef60a14	57	400	t	f	6d45f3c2-1678-4d7a-aeda-eaae46faac0d	e1ead9fa-fafb-4107-b2d4-969e50d20d59	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
19b182a6-d012-4f34-8d98-461426abe1ad	52	1200	t	f	acd4c3c6-98b8-4336-ae39-04c6babd9392	b3da68b3-8dc1-4853-ba04-adee09d09988	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
1df3fb16-8112-40a1-ade7-15b73d2d05ba	18	4000	t	f	43492e7c-8107-4b63-b092-1bd6434c14ad	23516e53-9742-4b78-99ab-9082aedabe1c	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
1e26b1bc-ba10-4404-8d1f-fd35667d720a	55	400	t	f	8b6d81d5-001c-4ea9-99b8-35a68695fe5f	6acea5b8-748c-40e6-bde8-78ed14b57f38	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
2a602d9f-b415-4554-8144-22b9e7f0fc01	54	400	t	f	21f26c7c-9f52-4678-badb-c14e474f369c	f5313f2d-36e4-4d3c-be5f-cbffb880dc14	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
33739b02-a2c6-4277-bafe-e3a1ae12ebdb	1	1900	t	f	5b543510-63c5-4824-88e5-6964359c8f6d	a853bfd5-961b-4809-9e06-e93ea4c75170	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
35e99659-46c7-4be5-a78b-3d51db446d69	52	1200	t	f	6fa7d9b8-16cb-4232-8db7-97ab3a8543b3	b3da68b3-8dc1-4853-ba04-adee09d09988	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
37bd6842-bc88-416b-81ca-3f79f02087cb	56	400	t	f	ffb60a95-ae70-46b9-8cc1-a53e1eff0a44	f42461f6-f454-42b9-b442-92065348c173	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
383f5208-4b74-46d6-af4e-aa49ca1388f2	58	900	t	f	9916b50a-221b-4ef7-bb97-c59f2633a223	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
3fc0d2b3-78c4-4dbf-a874-1f26a34221a1	52	1200	t	f	eca960be-8efb-4c38-9242-934f2443ddc6	b3da68b3-8dc1-4853-ba04-adee09d09988	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
416e4104-8ca1-4798-a026-273700f9d2fa	39	280	t	f	ac61a8ab-9f80-4368-a708-8cb91bed9a95	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
443e6c5e-43cc-4462-84a7-0c99d8cd14bd	58	900	t	f	4ef5ec55-c3f2-430b-a3e6-2ab56efdc140	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
49980473-65f5-4ee6-b129-271ab37e38e6	58	900	t	f	8b6d81d5-001c-4ea9-99b8-35a68695fe5f	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
49ec298f-03ef-44d7-8e71-bbfa6a8cb0d7	52	1200	t	f	440f2cc9-3021-4114-98d4-bdfcda5f479f	b3da68b3-8dc1-4853-ba04-adee09d09988	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
4aaa5377-cfe5-4d10-af7b-858159e5cedd	54	400	t	f	4ef5ec55-c3f2-430b-a3e6-2ab56efdc140	f5313f2d-36e4-4d3c-be5f-cbffb880dc14	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
4c8aafc7-2af4-4fa4-93d9-9557132470d8	2	1880	t	f	4b5c62d8-faed-4ef3-86a3-8698b475360b	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
50d9e659-2e83-48a7-90cc-0498d402487e	39	280	t	f	292717be-22b1-4810-84a0-34fda42af482	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
584f0f51-1818-4eea-89da-27ec92dae982	57	400	t	f	b4675632-cf14-4980-9ffc-4b112a702fa6	e1ead9fa-fafb-4107-b2d4-969e50d20d59	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
718d91d6-a896-47f9-a012-97a8aab412c1	2	1880	t	f	27091fd3-26d3-42df-8944-748438266635	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
737f5b66-6827-4561-aba4-878f82b927ff	55	400	t	f	9916b50a-221b-4ef7-bb97-c59f2633a223	6acea5b8-748c-40e6-bde8-78ed14b57f38	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
819f71a2-b9ca-40b2-adb7-eecaa2bd70fc	56	400	t	f	8095b238-e1b1-41b9-a113-7d0f13b15c8c	f42461f6-f454-42b9-b442-92065348c173	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
89f9dc39-8dea-4162-b4fd-f07a6e67268a	2	1880	t	f	da0a24d1-bb7f-4f4e-8fca-60a14afe45cf	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
8d548e09-fd59-4c24-a454-da73eed65a9c	58	900	t	f	6d45f3c2-1678-4d7a-aeda-eaae46faac0d	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
90714116-1f41-4555-b690-09e866d09c61	39	280	t	f	43492e7c-8107-4b63-b092-1bd6434c14ad	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
97a49164-a4e2-4d24-870a-676fa755c83d	18	4000	t	f	37fdcc82-dce9-4c0f-bc6a-10ab7cd167ab	23516e53-9742-4b78-99ab-9082aedabe1c	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
97c118f0-1063-4ade-85b6-03812a4eda24	39	280	t	f	d3576af5-b86d-49dc-a882-21a2827027b6	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
9e8743e1-a8cd-45b8-b59a-7ea56f1a5e40	52	1200	t	f	08644e1c-ce50-4eaa-bc66-e5ae763baf69	b3da68b3-8dc1-4853-ba04-adee09d09988	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
9ea2634a-d6ae-4216-a242-4d49d9160712	48	1900	t	f	066bff1a-5d23-4c81-a08a-02eb7e3a0172	eb7a3367-aa8c-42b4-a82c-a10ee1d3641d	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
a5f2469e-cd3b-4c0a-8569-2bb5009187fd	18	4000	t	f	292717be-22b1-4810-84a0-34fda42af482	23516e53-9742-4b78-99ab-9082aedabe1c	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
b74a5425-6259-4e2d-8199-05c97c798fc1	58	900	t	f	21f26c7c-9f52-4678-badb-c14e474f369c	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
b8fbed73-7365-4e42-aef5-851e1e63c921	2	1880	t	f	ec787539-f9cf-4b8f-84ab-117fd0bd1553	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
bbf74166-ce7c-4d4a-b51f-e36f5e2a662e	2	1880	t	f	5b543510-63c5-4824-88e5-6964359c8f6d	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
c04d4e55-8769-4f97-8abc-42f6328ff72a	2	1880	t	f	44f31441-a5f8-4a64-aedb-ac46c74d792a	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
c1f81f13-8020-4b08-b0ab-919efd398b7d	39	280	t	f	cc4b6cd9-ca98-476b-9fd0-f80e2dcbd3c6	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
c907bdaf-28c6-4a73-9d90-849a106d34c4	1	1900	t	f	4b5c62d8-faed-4ef3-86a3-8698b475360b	a853bfd5-961b-4809-9e06-e93ea4c75170	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
ca74edd5-e568-4a32-b934-085effdc6f8b	18	4000	t	f	ac61a8ab-9f80-4368-a708-8cb91bed9a95	23516e53-9742-4b78-99ab-9082aedabe1c	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
d166f035-030c-40f8-a2a1-57e9ecfeabff	1	1900	t	f	da0a24d1-bb7f-4f4e-8fca-60a14afe45cf	a853bfd5-961b-4809-9e06-e93ea4c75170	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
d96ab46c-9f3c-4179-8173-335245e29999	18	4000	t	f	b6eb0c91-f030-4f46-8ae8-d7d78dbb159f	23516e53-9742-4b78-99ab-9082aedabe1c	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
dc278cd4-38e9-4870-8a6a-39b2141bf54e	2	1880	t	f	07b3980e-3a2e-459d-8314-211e8bf5a3b4	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
e0cb6f62-bf64-40d6-ae9a-e6905ed69f54	58	900	t	f	8095b238-e1b1-41b9-a113-7d0f13b15c8c	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
e0f1a070-df45-4597-bfa7-91ddc83aa56a	39	280	t	f	fbcfb5d7-1f24-4ee8-b612-63d00ae7d222	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
e6935f0f-7975-42a9-a8b3-4724b8b2d8eb	39	280	t	f	a80f7277-8553-4188-8a52-aa885c2a84d4	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
e754c28b-3f8a-47f5-86e6-aa4f02f1cf93	39	280	t	f	3d18ef1f-b576-4a35-b79b-bc0ecb44b70b	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
f1e380db-9cb8-42b0-ae3a-a281898af961	1	1900	t	f	ec787539-f9cf-4b8f-84ab-117fd0bd1553	a853bfd5-961b-4809-9e06-e93ea4c75170	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
f2a610db-35ed-4829-813f-9ad66f1ea440	58	900	t	f	b4675632-cf14-4980-9ffc-4b112a702fa6	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
f3ebffa3-e047-4db5-9fa6-8e9d842d332d	2	1880	t	f	594c1c1d-867d-4e61-b581-cf07da2b1e44	c558151b-5c58-4faa-9a2a-739210591a88	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
23516e53-9742-4b78-99ab-9082aedabe1c	18	Инструкция 18	18
4875b3b1-6e80-4af4-9321-b7a760a8f885	58	Инструкция 58	58
6acea5b8-748c-40e6-bde8-78ed14b57f38	55	Инструкция 55	55
a853bfd5-961b-4809-9e06-e93ea4c75170	1	Инструкция 1	1
b3da68b3-8dc1-4853-ba04-adee09d09988	52	Инструкция 52	52
c558151b-5c58-4faa-9a2a-739210591a88	2	Инструкция 2	2
d342bb34-af98-4d6b-a08d-af5fe92109dd	39	Инструкция 39	39
e1ead9fa-fafb-4107-b2d4-969e50d20d59	57	Инструкция 57	57
eb7a3367-aa8c-42b4-a82c-a10ee1d3641d	48	Инструкция 48	48
f42461f6-f454-42b9-b442-92065348c173	56	Инструкция 56	56
f5313f2d-36e4-4d3c-be5f-cbffb880dc14	54	Инструкция 54	54
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
07995cf6-68ae-4d6f-a2ea-2fce11239525	7513D-2800010-20	Рама	\N	3330041
11327d5d-f858-4e5d-a4a9-7cb2eb6718c5	75131-2800010-70	Рама	\N	3291137
9654a0dc-a68d-41e8-87e5-93df46858b91	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
21d82e4d-3c95-40e1-8f1a-75ebcb528c9b	36c0fcdf-d451-4d8f-a88f-7d23a66f46e0
8133ae28-8262-417f-ae6a-721146eba017	36c0fcdf-d451-4d8f-a88f-7d23a66f46e0
94869770-73b4-4bcc-a475-7f8e0b4b6b21	997ccc78-28c1-4829-949d-0c62fc562bba
9824ad8d-0f0c-4c6a-89db-9fd6a1835e20	997ccc78-28c1-4829-949d-0c62fc562bba
e4402047-eb55-4e55-bec3-f94f7eb83dc0	997ccc78-28c1-4829-949d-0c62fc562bba
7ed466b4-7ba7-4a8f-82bb-e4045c27962d	df6c5bd7-1299-48ea-838c-5756ea1b27a1
a03948dc-7de9-4e52-9653-1c8cd1e33619	df6c5bd7-1299-48ea-838c-5756ea1b27a1
be181e9e-bac2-41eb-9d75-1369e6d1ac86	df6c5bd7-1299-48ea-838c-5756ea1b27a1
c75069fc-5535-4655-b360-01a8479218d4	df6c5bd7-1299-48ea-838c-5756ea1b27a1
c77c23ae-8d69-4761-b6e4-f94ea61f4097	df6c5bd7-1299-48ea-838c-5756ea1b27a1
dc542e0d-2cfd-4bb5-a873-1920114f381e	df6c5bd7-1299-48ea-838c-5756ea1b27a1
ed9de08a-6a2d-4b8b-85e9-d6a6c5b61bcb	df6c5bd7-1299-48ea-838c-5756ea1b27a1
fd96fcfd-94ce-45d7-8cbd-710b00fd79bf	df6c5bd7-1299-48ea-838c-5756ea1b27a1
a0ab11a3-4844-471e-b015-14287d6cbf30	57ffd7e3-f280-42f3-9f3d-6271e3c3b762
28482a55-cd92-4bdf-994e-2464f7b1c8bc	5560bf02-e8a7-4caf-ae9f-c0f5fcc46047
cdb059a0-7527-439a-a228-56bced9f048c	df6c5bd7-1299-48ea-838c-5756ea1b27a1
93c343ea-0c33-409c-af56-835a86e5bbb9	36c0fcdf-d451-4d8f-a88f-7d23a66f46e0
f990a65e-aae9-4712-892d-d6f4adae21c4	57ffd7e3-f280-42f3-9f3d-6271e3c3b762
43dbd5da-eea9-4fef-9bae-d7d3e13bd918	997ccc78-28c1-4829-949d-0c62fc562bba
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
21d82e4d-3c95-40e1-8f1a-75ebcb528c9b	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
8133ae28-8262-417f-ae6a-721146eba017	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
94869770-73b4-4bcc-a475-7f8e0b4b6b21	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
9824ad8d-0f0c-4c6a-89db-9fd6a1835e20	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
e4402047-eb55-4e55-bec3-f94f7eb83dc0	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
7ed466b4-7ba7-4a8f-82bb-e4045c27962d	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:F1:7D:5A	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
a03948dc-7de9-4e52-9653-1c8cd1e33619	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
be181e9e-bac2-41eb-9d75-1369e6d1ac86	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
c75069fc-5535-4655-b360-01a8479218d4	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
c77c23ae-8d69-4761-b6e4-f94ea61f4097	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
dc542e0d-2cfd-4bb5-a873-1920114f381e	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	B7:5A:79:B5	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
ed9de08a-6a2d-4b8b-85e9-d6a6c5b61bcb	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
fd96fcfd-94ce-45d7-8cbd-710b00fd79bf	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
a0ab11a3-4844-471e-b015-14287d6cbf30	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
28482a55-cd92-4bdf-994e-2464f7b1c8bc	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$Ayy2eINlCc+Bzfruog+yzBzj/m4+zDrYq2iellRuxknAeeC/	\N	\N	\N	\N	\N	\N
cdb059a0-7527-439a-a228-56bced9f048c	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$q0D1EIkV1gf4twmqNJNm620id52WoUDTAPunLLsFp7gkvTc3	\N	\N	\N	\N	\N	\N
93c343ea-0c33-409c-af56-835a86e5bbb9	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$Ew+ZmRlQyLY8tZh06PvXYzT2LznZmRPjPvOg5npAMX6snXw6	\N	\N	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
f990a65e-aae9-4712-892d-d6f4adae21c4	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$ZoMOKloE4sIPCyE2Vqo8KUGo2klNxTFFlt7A/Iyt4USSHimn	\N	\N	\N	\N	\N	\N
43dbd5da-eea9-4fef-9bae-d7d3e13bd918	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$pKIZqrbfd5cf8VFjP5+JiL7L6pl5szDJCbyRvoLnA+K1ZYS2	\N	\N	\N	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
1c55cb9f-0dfd-48cb-b33c-887b47ffdee0	1	Заполняющий	230	270	23	26	\N	\N	e1ead9fa-fafb-4107-b2d4-969e50d20d59	\N
3c3eba58-380e-4647-8265-f8874e26028e	1	Заполняющий	230	270	23	26	\N	\N	c558151b-5c58-4faa-9a2a-739210591a88	\N
49cdd87f-ed71-4dee-815a-c012b0978c1d	1	Заполняющий	230	270	23	26	\N	\N	6acea5b8-748c-40e6-bde8-78ed14b57f38	\N
524839d1-b326-4fc5-92c2-9cc316d1b36e	1	Заполняющий	230	270	23	26	\N	\N	a853bfd5-961b-4809-9e06-e93ea4c75170	\N
77510529-47b0-4882-9900-7090b95b2c8b	1	Заполняющий	230	270	23	26	\N	\N	4875b3b1-6e80-4af4-9321-b7a760a8f885	\N
77bc86f5-d477-4155-a5a4-245bd217faf6	1	Заполняющий	230	270	23	26	\N	\N	b3da68b3-8dc1-4853-ba04-adee09d09988	\N
b6102284-59d3-4a22-8ed5-ec73415d62f6	1	Заполняющий	230	270	23	26	\N	\N	23516e53-9742-4b78-99ab-9082aedabe1c	\N
b72e64a4-8ddb-402c-82c6-c93e7f87634c	1	Заполняющий	230	270	23	26	\N	\N	eb7a3367-aa8c-42b4-a82c-a10ee1d3641d	\N
cafa07b5-bf97-49c5-a992-2d024368447a	1	Заполняющий	230	270	23	26	\N	\N	d342bb34-af98-4d6b-a08d-af5fe92109dd	\N
d3129f60-23ca-4128-b00c-e26afe84d8a0	1	Заполняющий	230	270	23	26	\N	\N	f5313f2d-36e4-4d3c-be5f-cbffb880dc14	\N
eed858e1-f220-4201-b67d-e1e316e5afad	1	Заполняющий	230	270	23	26	\N	\N	f42461f6-f454-42b9-b442-92065348c173	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
07e1036e-1623-4377-9ddf-afcd0e810783	2	Заполняющий	100	0.22	0.44	\N	\N	\N	4e7fb471-08de-454d-90ba-c6bbfcbe210b	b31026ca-00d6-4bfb-97cb-3ff252f50b2f	\N
bba554f2-9f1f-4ad5-806d-fc9dd60fb17c	2	Заполняющий	100	0.22	0.44	\N	\N	\N	ab3cac84-2fae-4dad-8bd6-55a37611c622	715ffd5c-16da-46d2-9961-e5026fd87cf2	\N
d1b1625c-2df9-4213-9420-67638c09a111	1	Корневой	82	0.11	0.68	\N	\N	\N	dde6a7d6-e999-40a7-b143-6f7de73c9570	b31026ca-00d6-4bfb-97cb-3ff252f50b2f	\N
d3900549-7eca-41ea-ae05-b18550a6e8cb	1	Корневой	82	0.11	0.68	\N	\N	\N	6aa8e0be-b79b-49cf-b3cc-a60c34eb1bca	715ffd5c-16da-46d2-9961-e5026fd87cf2	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
4422fa71-9a00-4990-aa62-807c2bb6807a	185ed7ae-129c-4772-be46-be4303d02de2
4422fa71-9a00-4990-aa62-807c2bb6807a	929adc11-cfa9-44bf-a294-95b8ce419d8a
4a1af821-24cc-4c82-a035-9ab98c2d3014	185ed7ae-129c-4772-be46-be4303d02de2
4a1af821-24cc-4c82-a035-9ab98c2d3014	929adc11-cfa9-44bf-a294-95b8ce419d8a
72bc229c-b215-4852-994c-f2967484e737	67af5692-e924-4f64-80fd-d21c5e18f0c0
72f03ada-60a9-4281-8a7a-ff713ad48aba	67af5692-e924-4f64-80fd-d21c5e18f0c0
9200b919-301f-4dca-a3e1-b1f8b3fd0fa7	6c496869-cbc5-4126-97cc-89751b0945dd
95420a2f-75aa-4777-a82e-ba802733d066	6c496869-cbc5-4126-97cc-89751b0945dd
be442e63-7474-42f2-9ffa-a368dc6283ed	185ed7ae-129c-4772-be46-be4303d02de2
be442e63-7474-42f2-9ffa-a368dc6283ed	929adc11-cfa9-44bf-a294-95b8ce419d8a
e3b1d61a-c6de-4a41-9e6a-df4042e1b4c0	185ed7ae-129c-4772-be46-be4303d02de2
e3b1d61a-c6de-4a41-9e6a-df4042e1b4c0	929adc11-cfa9-44bf-a294-95b8ce419d8a
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
4422fa71-9a00-4990-aa62-807c2bb6807a	ed9de08a-6a2d-4b8b-85e9-d6a6c5b61bcb	\N	146164
4a1af821-24cc-4c82-a035-9ab98c2d3014	a03948dc-7de9-4e52-9653-1c8cd1e33619	\N	150838
72bc229c-b215-4852-994c-f2967484e737	fd96fcfd-94ce-45d7-8cbd-710b00fd79bf	\N	132695
72f03ada-60a9-4281-8a7a-ff713ad48aba	c77c23ae-8d69-4761-b6e4-f94ea61f4097	\N	122575
9200b919-301f-4dca-a3e1-b1f8b3fd0fa7	c75069fc-5535-4655-b360-01a8479218d4	\N	117390
95420a2f-75aa-4777-a82e-ba802733d066	7ed466b4-7ba7-4a8f-82bb-e4045c27962d	\N	121267
be442e63-7474-42f2-9ffa-a368dc6283ed	dc542e0d-2cfd-4bb5-a873-1920114f381e	\N	114729
e3b1d61a-c6de-4a41-9e6a-df4042e1b4c0	be181e9e-bac2-41eb-9d75-1369e6d1ac86	\N	150882
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingEquipmentWorkplace; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkplace" ("WeldingEquipmentsId", "WorkplacesId") FROM stdin;
185ed7ae-129c-4772-be46-be4303d02de2	4ee3d3e9-f506-4955-b2e8-8095d372b5b2
185ed7ae-129c-4772-be46-be4303d02de2	5e84844b-a4be-4cfe-90e8-d5e4d751f984
185ed7ae-129c-4772-be46-be4303d02de2	6759ced7-073f-4be6-9645-3c248a8868e0
185ed7ae-129c-4772-be46-be4303d02de2	d9724c65-5aa6-4f63-a44a-365f48edd791
67af5692-e924-4f64-80fd-d21c5e18f0c0	6759ced7-073f-4be6-9645-3c248a8868e0
67af5692-e924-4f64-80fd-d21c5e18f0c0	bdde40df-d2cf-4e93-9f9d-06b4237b36bf
6c496869-cbc5-4126-97cc-89751b0945dd	5e84844b-a4be-4cfe-90e8-d5e4d751f984
6c496869-cbc5-4126-97cc-89751b0945dd	f1f57f74-37f1-4a15-9e77-45b62bf3c133
929adc11-cfa9-44bf-a294-95b8ce419d8a	4ee3d3e9-f506-4955-b2e8-8095d372b5b2
929adc11-cfa9-44bf-a294-95b8ce419d8a	5e84844b-a4be-4cfe-90e8-d5e4d751f984
929adc11-cfa9-44bf-a294-95b8ce419d8a	6759ced7-073f-4be6-9645-3c248a8868e0
929adc11-cfa9-44bf-a294-95b8ce419d8a	d9724c65-5aa6-4f63-a44a-365f48edd791
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
185ed7ae-129c-4772-be46-be4303d02de2	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dfabd7ef-58b8-428f-8e46-846726d3e4a9	49141
67af5692-e924-4f64-80fd-d21c5e18f0c0	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dfabd7ef-58b8-428f-8e46-846726d3e4a9	49286
6c496869-cbc5-4126-97cc-89751b0945dd	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dfabd7ef-58b8-428f-8e46-846726d3e4a9	49232
929adc11-cfa9-44bf-a294-95b8ce419d8a	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	dfabd7ef-58b8-428f-8e46-846726d3e4a9	49283
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
4e7fb471-08de-454d-90ba-c6bbfcbe210b	2023-03-04 20:25:15.024501	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	929adc11-cfa9-44bf-a294-95b8ce419d8a	95420a2f-75aa-4777-a82e-ba802733d066	dfabd7ef-58b8-428f-8e46-846726d3e4a9	\N
6aa8e0be-b79b-49cf-b3cc-a60c34eb1bca	2023-03-04 20:25:15.024409	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	929adc11-cfa9-44bf-a294-95b8ce419d8a	95420a2f-75aa-4777-a82e-ba802733d066	dfabd7ef-58b8-428f-8e46-846726d3e4a9	\N
ab3cac84-2fae-4dad-8bd6-55a37611c622	2023-03-04 20:25:15.024459	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	929adc11-cfa9-44bf-a294-95b8ce419d8a	95420a2f-75aa-4777-a82e-ba802733d066	dfabd7ef-58b8-428f-8e46-846726d3e4a9	\N
dde6a7d6-e999-40a7-b143-6f7de73c9570	2023-03-04 20:25:15.0245	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	929adc11-cfa9-44bf-a294-95b8ce419d8a	95420a2f-75aa-4777-a82e-ba802733d066	dfabd7ef-58b8-428f-8e46-846726d3e4a9	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
715ffd5c-16da-46d2-9961-e5026fd87cf2	1	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	11bfa8cb-00dc-492d-99bd-64bc31904436	95420a2f-75aa-4777-a82e-ba802733d066	dfabd7ef-58b8-428f-8e46-846726d3e4a9	1f8f1b30-d0b6-4128-ad3d-f5e6f78007ac	\N
b31026ca-00d6-4bfb-97cb-3ff252f50b2f	2	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	0ab1ce4a-8d3d-4501-9a68-5ed25835e8cb	95420a2f-75aa-4777-a82e-ba802733d066	dfabd7ef-58b8-428f-8e46-846726d3e4a9	1f8f1b30-d0b6-4128-ad3d-f5e6f78007ac	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
5aef7a02-ef23-4afa-8a97-d3bcf4007a13	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	a93c68c9-8be2-433b-bdd2-f04a5251147f	\N
7e3cd736-541b-41bd-8716-f9c3156d6910	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	a93c68c9-8be2-433b-bdd2-f04a5251147f	\N
a7c47cee-f3da-4bf7-ae13-7089e604738e	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	a93c68c9-8be2-433b-bdd2-f04a5251147f	\N
50b7ecf7-8119-4d93-99f8-050615d29806	1	12:10:00	13:10:00	13:20:00	13:50:00	8f422f13-1d1c-4f6c-a80b-34d87e15c903	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
4ee3d3e9-f506-4955-b2e8-8095d372b5b2	3690	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	3690
5e84844b-a4be-4cfe-90e8-d5e4d751f984	3610	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	3610
6759ced7-073f-4be6-9645-3c248a8868e0	3500	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	3500
bdde40df-d2cf-4e93-9f9d-06b4237b36bf	3510	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	3510
d9724c65-5aa6-4f63-a44a-365f48edd791	3550	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	3550
f1f57f74-37f1-4a15-9e77-45b62bf3c133	3600	\N	89ec6329-f1cc-4ffb-9ad3-296caf876c34	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
62cc38c7-198a-4625-b65d-b3437aa45e4b	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 2, true);


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
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


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
    ADD CONSTRAINT "FK_WeldingTasks_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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

