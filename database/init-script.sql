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
515792a8-1dbe-4e05-973a-e79e2030f525	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
39d012ca-c0c1-4272-8cd8-403bafe4423f	94d9d0b2-2fe8-403e-ac1e-feb021e9979d	3cd4dd6d-8ba8-4c9c-a33b-7fea73974200	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
9def2ff6-1af9-402f-96f1-9d19ce800720	1	10	t	515792a8-1dbe-4e05-973a-e79e2030f525	\N
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
04f38e13-f874-4a14-9684-452b783fc745	Неявка оператора (б/лист, отпуск, и пр.)	\N
070959ee-7778-45be-94ce-0dbba824d81f	Отсутствие конструктора, технолога или ожидание его решения	\N
0ad06621-0fc3-45b7-90c8-ea369aec8b2b	Контроль на рабочем месте	\N
0d560688-d457-4f68-819f-bcb729c5f15a	Аварийный ремонт централизованными службами	\N
178bd5ed-9221-459e-9ea5-e7b7b2c03187	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
1b0a098a-9258-4368-b37a-5c892ae64cd4	Нерабочее время по графику согласно сменности	\N
3617cf3c-f6ca-4a64-a3e2-10f2dd0d704c	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
38c94421-77e8-427b-8ec0-a7bd3eab9a1f	Отсутствие заданий	\N
3e17280b-4b59-4c24-b1c6-4e27ab4bbcfe	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
40b3ffc6-b3bb-456f-a6f3-2f79a8bb0e17	Работа по карте несоответствий	\N
459726b7-853a-40f1-91ad-6e888243e764	Обед	\N
4cf7a184-c2b0-4d50-8934-8f441c2f14be	Ознакомление с работой, документацией, инструктаж	\N
52904b62-a6cf-4ebf-93fb-8e8134372dcb	Работа с управляющей программой	\N
6b986ec7-e2a6-439c-89e7-325328fe8512	Отсутствие оператора в связи с необеспеченностью	\N
93daa62d-2226-4592-af76-7fd1eda9bc88	Отсутствие энергоносителей	\N
a1fed0a6-55ef-4b9b-905a-e95662e63340	Отсутствие крана, транспорта	\N
a2a6b67b-4c7e-46ae-aefb-95fdd3debdb8	Установка, выверка, снятие детали	\N
bea9e199-cdac-4fc4-aa11-21d53eab7b0d	Плановый ремонт централизованными службами	\N
c0402d93-d526-46a8-bc79-239aa027faa8	Праздники и выходные	\N
c085fd61-804f-4117-96d2-d9546a592b61	Отсутствие материала, заготовок, деталей	\N
c237818d-9468-4e53-8aa6-ed22a4e69f6b	Сборочные операции	\N
c26f3452-a6a4-4bde-b1c5-94e565184a67	Естественные надобности	\N
c78767b9-c292-4226-9934-e2f5a9a465f4	Установка, выверка, снятие детали	\N
d6b6ce78-f2cb-4d8c-99d6-316bca168be2	Отсутствие сотрудника ОТК	\N
e3429573-4400-4d19-b6d0-6813124b3965	Изменение режимов, смена инструмента, приспособления	\N
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
1e24faed-baac-4a6c-ac66-ae33215af826	9e59d029-fafe-4177-9792-c8864abb8508	249550
a1383e1f-22e1-4ee3-aa7e-6e67b1195e49	9f536d24-5e51-4c30-9cd0-7cd38b7bb59c	219379
89639b31-2291-4fa8-9a44-e33cce6baa92	02347ca8-b603-4769-a3ba-a1189b329a25	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
baaaa7c5-1a69-48e6-a787-971f684b43d7	39ea47dd-754b-43c5-8334-95988afb7977	614962
f80239f9-71ab-4bf2-9335-14995d758277	e9f6e3f0-642a-40f4-99d9-5a01785f039a	610422
b5fefde6-debc-4bc7-82f3-8f5c63f7b34f	bd5cd4b8-8b98-4de2-912b-c83d906e397f	\N
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
21a6adb9-7288-41a0-acdc-b12a00c1b12c	caf19a33-282b-46c4-bb2a-6ad24f27a6c7
7cc4ed12-4496-4f42-9dd9-fce745d8ac51	caf19a33-282b-46c4-bb2a-6ad24f27a6c7
8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	caf19a33-282b-46c4-bb2a-6ad24f27a6c7
995831ca-bcf3-41aa-84c6-f71513016d6e	caf19a33-282b-46c4-bb2a-6ad24f27a6c7
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
21a6adb9-7288-41a0-acdc-b12a00c1b12c	3	2	2023-03-12 00:00:00	82b0be01-f58c-4a86-a0fa-bfdd0268a622	\N
7cc4ed12-4496-4f42-9dd9-fce745d8ac51	4	2	2023-03-12 00:00:00	f1dac063-002b-4380-b564-9f7be9d633ba	\N
8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	2	2	2023-03-12 00:00:00	7f489c32-3658-426c-acbb-da2a1856f2b0	\N
995831ca-bcf3-41aa-84c6-f71513016d6e	1	2	2023-03-12 00:00:00	4feb7eff-0ae3-4417-91e2-89c70008e394	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
f1dac063-002b-4380-b564-9f7be9d633ba	4feb7eff-0ae3-4417-91e2-89c70008e394
7f489c32-3658-426c-acbb-da2a1856f2b0	82b0be01-f58c-4a86-a0fa-bfdd0268a622
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
04211618-a8ac-40ff-a6e6-359c8604c441	0	2	\N	\N	995831ca-bcf3-41aa-84c6-f71513016d6e	\N
1c69f88e-8b23-4ab9-a88e-5d748a75a721	0	1	\N	\N	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
3c19751c-0388-43c9-b1ae-890d80773f5e	0	2	\N	\N	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
3e7ab604-520d-4e0d-9f34-d2412430a02e	0	3	\N	\N	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
3f31be4a-ece5-4d31-ba5b-e6657cc754b8	0	1	\N	\N	995831ca-bcf3-41aa-84c6-f71513016d6e	\N
4076c2da-f444-4b71-9def-f9cb8ab3d0f0	0	2	\N	\N	21a6adb9-7288-41a0-acdc-b12a00c1b12c	\N
4208bb46-b91b-4eb9-9d8c-e19da21f69ec	0	1	\N	\N	21a6adb9-7288-41a0-acdc-b12a00c1b12c	\N
51606958-65b5-40af-b52e-72f606cab301	0	3	\N	\N	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
61c660b2-7b8f-48aa-87fc-9cd9670f7a5a	0	3	\N	\N	21a6adb9-7288-41a0-acdc-b12a00c1b12c	\N
647b74db-0715-4e66-ab1c-1d56b87ae5a6	0	2	\N	\N	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
89e9080d-a410-4659-97d7-3fb869504925	0	1	\N	\N	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
d9dd67e2-b2fe-4280-9d3a-e9bf191c9e1e	0	3	\N	\N	995831ca-bcf3-41aa-84c6-f71513016d6e	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
ea5bb580-2a09-4ed8-ad21-cd8467a33793	Сборка, сварка рам к/с г/п 120-130 т.	6	3cd4dd6d-8ba8-4c9c-a33b-7fea73974200	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
4feb7eff-0ae3-4417-91e2-89c70008e394	Поперечина рамы задняя	75131-2801300-20	t	2	19d02238-6533-4cb9-bfe2-161ef29f3e0a	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N	\N	\N
7f489c32-3658-426c-acbb-da2a1856f2b0	Рама	7513D-2800010-20	t	1	1aff035d-d28b-46dc-a7b4-45d28103a151	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N	\N	4536492774
82b0be01-f58c-4a86-a0fa-bfdd0268a622	Поперечина рамы задняя	75131-2801300-20	t	2	1aff035d-d28b-46dc-a7b4-45d28103a151	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N	\N	\N
f1dac063-002b-4380-b564-9f7be9d633ba	Рама	75131-2800010-70	t	1	19d02238-6533-4cb9-bfe2-161ef29f3e0a	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N	\N	4536479362
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
e79241ab-1401-4d68-9db5-2665c809a4b1	Admin	\N
05f82a93-c5f0-4132-beb1-dee471f33de5	Master	\N
83c43076-c76a-4eb5-8c66-87c4b4d7d541	Welder	\N
c13ed1c5-3e5d-4255-a498-1db93e7efa28	Inspector	\N
52731334-66fe-4c96-9f0d-0c8ba4e5981b	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
11e3ff61-ed16-4b48-90bf-5a494d776733	2023-03-12 00:00:00	72f8d6f7-249b-4488-91a9-b3bcecf9e8e2	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
166affbd-34f8-4364-9c1f-48385678f48b	2023-03-12 00:00:00	82a93ac0-e792-417f-9766-cec7415af722	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
1996a71a-fbfb-48d4-be89-4139bcce13b8	2023-03-12 00:00:00	3696b8e2-0aa0-4142-9583-84368f22ee7e	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
1aa0f05f-d4e1-4041-888d-fe901a2ebdf2	2023-03-12 00:00:00	e7370847-081b-430a-9655-6bae2d13af00	21a6adb9-7288-41a0-acdc-b12a00c1b12c	\N
25ae4ebe-70db-4fea-8753-767ffaad9539	2023-03-12 00:00:00	3b2fe012-b4f3-459a-89a6-924b10bbef39	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
266b058c-9bb1-48d4-bf1e-10e3d5d06816	2023-03-12 00:00:00	b6c4bedd-37c4-42cc-aa4c-c9920b6b8df7	21a6adb9-7288-41a0-acdc-b12a00c1b12c	\N
30e15321-b199-4d8d-9507-a3cf966e6441	2023-03-12 00:00:00	75f7a4e6-d145-4628-8af1-a58b99f94272	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
369b83db-4f46-456c-b4b7-862b8d613667	2023-03-12 00:00:00	1d3089ba-9198-4372-968d-dda289421722	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
46e89286-6285-47b5-8a32-f81200898ba3	2023-03-12 00:00:00	34aa541b-0214-4c38-a5ee-1640f9f74132	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
4fdffb69-be3e-43a1-bc44-59a985fd4ac1	2023-03-12 00:00:00	7851462d-703b-41d2-98e9-47b3a3c667c0	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
5f5ec49d-7faf-40ef-b93b-af8bbadbcbed	2023-03-12 00:00:00	02801820-982e-4b6c-a262-9039c9efa7a6	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
71fcc9f2-3f87-46df-85bc-82f9c2cd3592	2023-03-12 00:00:00	327dd9ba-2bd8-4f63-8ed8-c13fa911cf2e	8a01ac0a-3f82-45bf-9f9c-b9069a96ebf0	\N
7f930add-6ddb-4491-b767-d52889df05ca	2023-03-12 00:00:00	108d832a-d24d-45bc-bc72-c5f69fea7403	995831ca-bcf3-41aa-84c6-f71513016d6e	\N
b145dd09-057f-41fc-b9f8-f380d8c30d98	2023-03-12 00:00:00	ec3e01fa-42c6-4b8c-aca6-ce7ed8a1b95a	995831ca-bcf3-41aa-84c6-f71513016d6e	\N
c259c2fb-ad4b-460b-9462-cc40f0ec23ae	2023-03-12 00:00:00	e9272f2a-0ef0-4b71-8368-f9336d4a85ae	995831ca-bcf3-41aa-84c6-f71513016d6e	\N
c9171831-5863-4ddf-b705-98499d767735	2023-03-12 00:00:00	18167215-21f6-4cb3-83fb-310bff65eccf	21a6adb9-7288-41a0-acdc-b12a00c1b12c	\N
cbb63aed-6a91-4936-a55c-1fb907b0a933	2023-03-12 00:00:00	cd7ace9c-b3cf-4d92-99c4-7b0fbc2b99d3	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
e2b88a42-6918-4a08-af57-cc11c0b0baa8	2023-03-12 00:00:00	02d2a355-2518-4bfb-9ecb-5ccabf13bad8	7cc4ed12-4496-4f42-9dd9-fce745d8ac51	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0012a249-7575-4b57-a83b-fe59f45c089c	0	3	\N	\N	71fcc9f2-3f87-46df-85bc-82f9c2cd3592	\N
05a7a5c6-9ba3-41f5-8c37-9ec08dafd1ff	0	3	\N	\N	5f5ec49d-7faf-40ef-b93b-af8bbadbcbed	\N
12ca8b74-4da9-4713-898d-7f6ddf6de297	0	2	\N	\N	5f5ec49d-7faf-40ef-b93b-af8bbadbcbed	\N
13589595-0d9f-496b-8dcc-a805ac36321c	0	3	\N	\N	c9171831-5863-4ddf-b705-98499d767735	\N
17045518-8e71-43c2-b9b0-2192b9394f52	0	3	\N	\N	1aa0f05f-d4e1-4041-888d-fe901a2ebdf2	\N
274dc1c3-45ba-4bfd-9b3b-4f76acf8a2dc	0	2	\N	\N	b145dd09-057f-41fc-b9f8-f380d8c30d98	\N
33dca252-1b2f-474a-b5e8-16d5342a0b37	0	2	\N	\N	25ae4ebe-70db-4fea-8753-767ffaad9539	\N
3eb7080c-d325-4c7a-87ae-19f3cdaea8d9	0	3	\N	\N	1996a71a-fbfb-48d4-be89-4139bcce13b8	\N
428b8069-addc-4503-80fa-afebd448ac90	0	3	\N	\N	30e15321-b199-4d8d-9507-a3cf966e6441	\N
430eefac-d29a-4fe5-af90-2d4d090c1644	0	2	\N	\N	c9171831-5863-4ddf-b705-98499d767735	\N
44a0d46f-5d39-4c02-a916-3387d284182a	0	2	\N	\N	cbb63aed-6a91-4936-a55c-1fb907b0a933	\N
4996b570-cbb1-4b65-b6e6-522bec89a824	0	3	\N	\N	7f930add-6ddb-4491-b767-d52889df05ca	\N
4b0346c6-afdd-463c-b2f3-fc67b411663a	0	2	\N	\N	71fcc9f2-3f87-46df-85bc-82f9c2cd3592	\N
51860c0e-2c6c-49b2-8a17-7f5089d272be	0	2	\N	\N	c259c2fb-ad4b-460b-9462-cc40f0ec23ae	\N
68055abd-69cf-4582-8c2e-dcdcbfbb0400	0	3	\N	\N	166affbd-34f8-4364-9c1f-48385678f48b	\N
68409e46-7f36-4e1f-8176-b1eb3f801cab	0	3	\N	\N	e2b88a42-6918-4a08-af57-cc11c0b0baa8	\N
6d567c4b-2311-4248-ba5c-a49ff027c400	0	2	\N	\N	46e89286-6285-47b5-8a32-f81200898ba3	\N
8135365f-9712-4d33-aed2-9c815a1b7bef	0	2	\N	\N	30e15321-b199-4d8d-9507-a3cf966e6441	\N
89bb6763-b9bf-49b0-afeb-8cc7a927a0b3	0	3	\N	\N	25ae4ebe-70db-4fea-8753-767ffaad9539	\N
8bf32f40-3d2e-410d-b8ab-ed91f8bd75e6	0	3	\N	\N	4fdffb69-be3e-43a1-bc44-59a985fd4ac1	\N
8db06770-abbd-4091-9d48-0a599573329f	0	3	\N	\N	cbb63aed-6a91-4936-a55c-1fb907b0a933	\N
927a744e-b75b-4d41-b948-f11ad05e41dd	0	2	\N	\N	11e3ff61-ed16-4b48-90bf-5a494d776733	\N
93ecfbe0-7cf8-430d-988f-a2333f5658c0	0	2	\N	\N	1996a71a-fbfb-48d4-be89-4139bcce13b8	\N
a6ece656-1fbe-4b73-8027-f74ae87c2bb0	0	2	\N	\N	266b058c-9bb1-48d4-bf1e-10e3d5d06816	\N
b19e535b-1d45-4ee9-b480-346d44f95b04	0	3	\N	\N	46e89286-6285-47b5-8a32-f81200898ba3	\N
ba47c947-e15b-4876-af8c-ffd7d204b464	0	2	\N	\N	e2b88a42-6918-4a08-af57-cc11c0b0baa8	\N
d0e4f980-eb60-46d2-a2bb-e1cfc360e8be	0	3	\N	\N	c259c2fb-ad4b-460b-9462-cc40f0ec23ae	\N
d6b00714-2089-48f0-b331-7332abec202c	0	3	\N	\N	11e3ff61-ed16-4b48-90bf-5a494d776733	\N
d72237b4-8f8d-41c3-8d21-07fbe4546fe0	0	2	\N	\N	369b83db-4f46-456c-b4b7-862b8d613667	\N
d75f6d7a-498d-4f73-bf6b-184b8e342314	0	3	\N	\N	b145dd09-057f-41fc-b9f8-f380d8c30d98	\N
de3354d0-d406-4430-9b5c-b569ea0d11a1	0	2	\N	\N	1aa0f05f-d4e1-4041-888d-fe901a2ebdf2	\N
e49c3870-9ce7-4a0b-ab0e-8e5e832c390d	0	2	\N	\N	166affbd-34f8-4364-9c1f-48385678f48b	\N
f4d479c9-7f13-4884-ba59-575aaaf1925c	0	2	\N	\N	4fdffb69-be3e-43a1-bc44-59a985fd4ac1	\N
f69b7d19-c6da-4d0a-93d7-820870f2da8b	0	2	\N	\N	7f930add-6ddb-4491-b767-d52889df05ca	\N
f88229d1-1e55-4782-9afc-dc6b2c70b644	0	3	\N	\N	266b058c-9bb1-48d4-bf1e-10e3d5d06816	\N
f95fe106-6bba-42a7-a5a9-382efea7ad87	0	3	\N	\N	369b83db-4f46-456c-b4b7-862b8d613667	\N
041f903c-46c7-48ca-a1ee-d32b6d8a83fc	2	1	\N	\N	1996a71a-fbfb-48d4-be89-4139bcce13b8	\N
08cf1b61-f507-4d84-8ee2-73c16e88f2a8	2	1	\N	\N	266b058c-9bb1-48d4-bf1e-10e3d5d06816	\N
14f011d3-9d6c-4362-8445-76434d938a20	2	1	\N	\N	cbb63aed-6a91-4936-a55c-1fb907b0a933	\N
151426a0-55e9-4c3b-857d-aa7b8307e150	2	1	\N	\N	4fdffb69-be3e-43a1-bc44-59a985fd4ac1	\N
2709d9a2-6349-4758-a8eb-d7616482e262	2	1	\N	\N	30e15321-b199-4d8d-9507-a3cf966e6441	\N
496dbcdb-a375-437f-b833-8afde4f06094	2	1	\N	\N	7f930add-6ddb-4491-b767-d52889df05ca	\N
64cda00c-94d8-47e2-9761-4f81fbc1d1ba	2	1	\N	\N	11e3ff61-ed16-4b48-90bf-5a494d776733	\N
6cba1b40-23f9-4b36-b482-b3ea3cd89758	2	1	\N	\N	e2b88a42-6918-4a08-af57-cc11c0b0baa8	\N
8cc8653d-edf8-4c2d-b25e-062504ecd77d	2	1	\N	\N	c259c2fb-ad4b-460b-9462-cc40f0ec23ae	\N
8f98ce7c-c724-4c06-a290-434e7c15747a	2	1	\N	\N	1aa0f05f-d4e1-4041-888d-fe901a2ebdf2	\N
a4b137ec-788a-4db2-b20e-c31487d1d338	2	1	\N	\N	c9171831-5863-4ddf-b705-98499d767735	\N
a99555f1-94fb-4d19-a660-fa3b48e18405	2	1	\N	\N	46e89286-6285-47b5-8a32-f81200898ba3	\N
c70a121d-f914-4adf-9529-6edfcba87908	2	1	\N	\N	166affbd-34f8-4364-9c1f-48385678f48b	\N
c73ab7b2-d011-4621-a633-d7707d975b95	2	1	\N	\N	25ae4ebe-70db-4fea-8753-767ffaad9539	\N
d0911349-510a-42a5-9eac-fcd0cfea92d6	2	1	\N	\N	71fcc9f2-3f87-46df-85bc-82f9c2cd3592	\N
d5b31b89-d270-4f78-9d08-54d47c17cfc5	2	1	\N	\N	369b83db-4f46-456c-b4b7-862b8d613667	\N
d8659d4e-fb2c-4506-b9e4-640f8571841d	2	1	\N	\N	b145dd09-057f-41fc-b9f8-f380d8c30d98	\N
dcc31713-873c-4835-bb36-3a9a4525368b	2	1	\N	\N	5f5ec49d-7faf-40ef-b93b-af8bbadbcbed	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
02801820-982e-4b6c-a262-9039c9efa7a6	39	280	t	f	7f489c32-3658-426c-acbb-da2a1856f2b0	e66e7c95-95d2-4bd2-b350-92707597011d	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
02d2a355-2518-4bfb-9ecb-5ccabf13bad8	58	900	t	f	f1dac063-002b-4380-b564-9f7be9d633ba	e1ea3175-90ad-43bd-a705-0b51f2f20241	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
108d832a-d24d-45bc-bc72-c5f69fea7403	2	1880	t	f	4feb7eff-0ae3-4417-91e2-89c70008e394	b26c8a0e-ab2c-4336-b596-329078c3b958	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
18167215-21f6-4cb3-83fb-310bff65eccf	2	1880	t	f	82b0be01-f58c-4a86-a0fa-bfdd0268a622	b26c8a0e-ab2c-4336-b596-329078c3b958	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
1d3089ba-9198-4372-968d-dda289421722	18	4000	t	f	f1dac063-002b-4380-b564-9f7be9d633ba	d5adfa05-fbd8-42f9-80b3-708b97522408	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
327dd9ba-2bd8-4f63-8ed8-c13fa911cf2e	58	900	t	f	7f489c32-3658-426c-acbb-da2a1856f2b0	e1ea3175-90ad-43bd-a705-0b51f2f20241	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
34aa541b-0214-4c38-a5ee-1640f9f74132	57	400	t	f	7f489c32-3658-426c-acbb-da2a1856f2b0	34ab70cc-9438-4874-84df-7c63cbce45ee	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
3696b8e2-0aa0-4142-9583-84368f22ee7e	57	400	t	f	f1dac063-002b-4380-b564-9f7be9d633ba	34ab70cc-9438-4874-84df-7c63cbce45ee	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
3b2fe012-b4f3-459a-89a6-924b10bbef39	55	400	t	f	7f489c32-3658-426c-acbb-da2a1856f2b0	c3df8fd5-4798-491c-9e9d-11b471012828	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
72f8d6f7-249b-4488-91a9-b3bcecf9e8e2	54	400	t	f	7f489c32-3658-426c-acbb-da2a1856f2b0	de5f317a-7602-41fd-ace0-2ea5456dbeb3	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
75f7a4e6-d145-4628-8af1-a58b99f94272	54	400	t	f	f1dac063-002b-4380-b564-9f7be9d633ba	de5f317a-7602-41fd-ace0-2ea5456dbeb3	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
7851462d-703b-41d2-98e9-47b3a3c667c0	39	280	t	f	f1dac063-002b-4380-b564-9f7be9d633ba	e66e7c95-95d2-4bd2-b350-92707597011d	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
82a93ac0-e792-417f-9766-cec7415af722	18	4000	t	f	7f489c32-3658-426c-acbb-da2a1856f2b0	d5adfa05-fbd8-42f9-80b3-708b97522408	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
b6c4bedd-37c4-42cc-aa4c-c9920b6b8df7	52	1200	t	f	82b0be01-f58c-4a86-a0fa-bfdd0268a622	f3b72ac1-7cf1-46f8-b1a5-7c0c9b718e26	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
cd7ace9c-b3cf-4d92-99c4-7b0fbc2b99d3	55	400	t	f	f1dac063-002b-4380-b564-9f7be9d633ba	c3df8fd5-4798-491c-9e9d-11b471012828	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
e7370847-081b-430a-9655-6bae2d13af00	1	1900	t	f	82b0be01-f58c-4a86-a0fa-bfdd0268a622	79fa9ace-5919-4d9f-8d11-44799cddd053	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
e9272f2a-0ef0-4b71-8368-f9336d4a85ae	52	1200	t	f	4feb7eff-0ae3-4417-91e2-89c70008e394	f3b72ac1-7cf1-46f8-b1a5-7c0c9b718e26	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
ec3e01fa-42c6-4b8c-aca6-ce7ed8a1b95a	1	1900	t	f	4feb7eff-0ae3-4417-91e2-89c70008e394	79fa9ace-5919-4d9f-8d11-44799cddd053	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
34ab70cc-9438-4874-84df-7c63cbce45ee	57	Инструкция 57	57
79fa9ace-5919-4d9f-8d11-44799cddd053	1	Инструкция 1	1
7e4b4cf9-0ecf-466f-a577-bd74961fb495	56	Инструкция 56	56
b26c8a0e-ab2c-4336-b596-329078c3b958	2	Инструкция 2	2
c3df8fd5-4798-491c-9e9d-11b471012828	55	Инструкция 55	55
cf24f5a9-0831-4eea-aa65-34fddd533174	48	Инструкция 48	48
d5adfa05-fbd8-42f9-80b3-708b97522408	18	Инструкция 18	18
de5f317a-7602-41fd-ace0-2ea5456dbeb3	54	Инструкция 54	54
e1ea3175-90ad-43bd-a705-0b51f2f20241	58	Инструкция 58	58
e66e7c95-95d2-4bd2-b350-92707597011d	39	Инструкция 39	39
f3b72ac1-7cf1-46f8-b1a5-7c0c9b718e26	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
19d02238-6533-4cb9-bfe2-161ef29f3e0a	75131-2800010-70	Рама	\N	3291137
1aff035d-d28b-46dc-a7b4-45d28103a151	7513D-2800010-20	Рама	\N	3330041
723e9250-d171-488d-8682-22ff977a5661	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
9e59d029-fafe-4177-9792-c8864abb8508	c13ed1c5-3e5d-4255-a498-1db93e7efa28
9f536d24-5e51-4c30-9cd0-7cd38b7bb59c	c13ed1c5-3e5d-4255-a498-1db93e7efa28
39ea47dd-754b-43c5-8334-95988afb7977	05f82a93-c5f0-4132-beb1-dee471f33de5
e9f6e3f0-642a-40f4-99d9-5a01785f039a	05f82a93-c5f0-4132-beb1-dee471f33de5
04bb5450-9c62-4524-b530-acd351bec399	83c43076-c76a-4eb5-8c66-87c4b4d7d541
4c3cf28a-e7e4-4f97-a48b-0a3c803794ef	83c43076-c76a-4eb5-8c66-87c4b4d7d541
77ab320e-b84c-4537-a389-1e77895b697c	83c43076-c76a-4eb5-8c66-87c4b4d7d541
9205e9fd-569f-444a-846e-e4b14946da83	83c43076-c76a-4eb5-8c66-87c4b4d7d541
cfa8a70e-8fe8-459b-a8c0-d8fb2437151b	83c43076-c76a-4eb5-8c66-87c4b4d7d541
d5e588b5-3508-43fa-8b16-fd2808ec6e15	83c43076-c76a-4eb5-8c66-87c4b4d7d541
d6f40f3c-6cc5-4f9d-b877-f0d890a01bf9	83c43076-c76a-4eb5-8c66-87c4b4d7d541
ef538ed1-2c15-42e5-9a56-569bba7cd5f6	83c43076-c76a-4eb5-8c66-87c4b4d7d541
94d9d0b2-2fe8-403e-ac1e-feb021e9979d	52731334-66fe-4c96-9f0d-0c8ba4e5981b
e62371b4-c0b8-4820-b037-1f0f79b5fc45	e79241ab-1401-4d68-9db5-2665c809a4b1
5c93c83b-1fe1-453b-83d4-4a3f3024a064	83c43076-c76a-4eb5-8c66-87c4b4d7d541
02347ca8-b603-4769-a3ba-a1189b329a25	c13ed1c5-3e5d-4255-a498-1db93e7efa28
ef9ffbb7-eb0f-449b-9a22-5a408e396a1a	52731334-66fe-4c96-9f0d-0c8ba4e5981b
bd5cd4b8-8b98-4de2-912b-c83d906e397f	05f82a93-c5f0-4132-beb1-dee471f33de5
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
9e59d029-fafe-4177-9792-c8864abb8508	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
9f536d24-5e51-4c30-9cd0-7cd38b7bb59c	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
39ea47dd-754b-43c5-8334-95988afb7977	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
e9f6e3f0-642a-40f4-99d9-5a01785f039a	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
04bb5450-9c62-4524-b530-acd351bec399	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	B7:5A:79:B5
4c3cf28a-e7e4-4f97-a48b-0a3c803794ef	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	27:45:7E:B4
77ab320e-b84c-4537-a389-1e77895b697c	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	D7:F1:7D:5A
9205e9fd-569f-444a-846e-e4b14946da83	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	D7:95:55:B4
cfa8a70e-8fe8-459b-a8c0-d8fb2437151b	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	17:CD:7F:5A
d5e588b5-3508-43fa-8b16-fd2808ec6e15	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	67:CD:7E:5A
d6f40f3c-6cc5-4f9d-b877-f0d890a01bf9	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	67:5A:70:B4
ef538ed1-2c15-42e5-9a56-569bba7cd5f6	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	97:17:60:B4
94d9d0b2-2fe8-403e-ac1e-feb021e9979d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
e62371b4-c0b8-4820-b037-1f0f79b5fc45	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$Q1XSkICOhlMq9M9Ulc68jL2pKDqEn73idaiFoZK5bEYZ0p2t	\N	\N	\N	\N	\N	\N
5c93c83b-1fe1-453b-83d4-4a3f3024a064	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$bWq4+ryotARHiyPIfJb65CCiOXoUpFoWwtd/7fjjumDfBYwQ	\N	\N	\N	\N	\N	\N
02347ca8-b603-4769-a3ba-a1189b329a25	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$H5yjDR0BYuTxVVnnBRQvqXemtxrZ3OCEtFaSU2ul4E90Yrnw	\N	\N	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
ef9ffbb7-eb0f-449b-9a22-5a408e396a1a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$loIHSYXXukAh9hUSIgbHjjfgHwptyILaVI/QagcTbJUsCYHb	\N	\N	\N	\N	\N	\N
bd5cd4b8-8b98-4de2-912b-c83d906e397f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$kaagQZa87EfQJ8ryJk6lyMGB8epv3708IuNYiLHBvPWbyx+T	\N	\N	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
03558783-8bf7-430e-8004-5b8a009c83cb	2	Заполняющий	270	310	23	26	\N	\N	e66e7c95-95d2-4bd2-b350-92707597011d	\N
09623d9c-ff60-4437-8f6f-455aa7b4936a	1	Корневой	200	270	23	26	\N	\N	34ab70cc-9438-4874-84df-7c63cbce45ee	\N
243a5082-1892-4082-a66c-1ab49ef52e3f	1	Корневой	200	270	23	26	\N	\N	7e4b4cf9-0ecf-466f-a577-bd74961fb495	\N
268854e5-adcf-403d-a250-9ec1e3c4f219	1	Корневой	200	270	23	26	\N	\N	de5f317a-7602-41fd-ace0-2ea5456dbeb3	\N
2b7b1053-781c-4b98-8547-75b0c14228b0	2	Заполняющий	270	310	23	26	\N	\N	b26c8a0e-ab2c-4336-b596-329078c3b958	\N
2f0feff2-c7a9-42e9-9df8-007b83eff8d8	1	Корневой	200	270	23	26	\N	\N	cf24f5a9-0831-4eea-aa65-34fddd533174	\N
42c50e4d-2ef1-4681-9d48-7cdd94d044a4	2	Заполняющий	270	310	23	26	\N	\N	de5f317a-7602-41fd-ace0-2ea5456dbeb3	\N
4ecb15c7-f00a-4ec4-b92c-3f89f84abdb1	2	Заполняющий	270	310	23	26	\N	\N	f3b72ac1-7cf1-46f8-b1a5-7c0c9b718e26	\N
522343a7-b1a2-44a3-9039-2b3f4e8db050	2	Заполняющий	270	310	23	26	\N	\N	cf24f5a9-0831-4eea-aa65-34fddd533174	\N
5f7f977c-596d-4ec0-9f77-254b2928d200	2	Заполняющий	270	310	23	26	\N	\N	79fa9ace-5919-4d9f-8d11-44799cddd053	\N
63cfbf5d-1e9d-4565-a479-cc8c0e586532	1	Корневой	200	270	23	26	\N	\N	b26c8a0e-ab2c-4336-b596-329078c3b958	\N
75f55a56-bba9-4953-a03c-ca6f2801a910	1	Корневой	200	270	23	26	\N	\N	c3df8fd5-4798-491c-9e9d-11b471012828	\N
940d431a-f21a-48cc-bf7a-e533e53adaa1	2	Заполняющий	270	310	23	26	\N	\N	34ab70cc-9438-4874-84df-7c63cbce45ee	\N
95cfca5c-727b-45cd-b137-3bd7c6f1fa02	2	Заполняющий	270	310	23	26	\N	\N	e1ea3175-90ad-43bd-a705-0b51f2f20241	\N
99a12e60-8e5f-4d80-bcac-cb47d95f6ca8	2	Заполняющий	270	310	23	26	\N	\N	d5adfa05-fbd8-42f9-80b3-708b97522408	\N
a2f537c1-8b60-4ed4-a4f3-d4f101c805ec	1	Корневой	200	270	23	26	\N	\N	f3b72ac1-7cf1-46f8-b1a5-7c0c9b718e26	\N
a305dea1-f5b2-4123-897c-d70138858d06	2	Заполняющий	270	310	23	26	\N	\N	7e4b4cf9-0ecf-466f-a577-bd74961fb495	\N
b0250230-05de-4d59-b2c7-013763bf9797	1	Корневой	200	270	23	26	\N	\N	e1ea3175-90ad-43bd-a705-0b51f2f20241	\N
bfbed711-09b1-4ce8-82d6-bc5db873d0ef	1	Корневой	200	270	23	26	\N	\N	d5adfa05-fbd8-42f9-80b3-708b97522408	\N
e104aadb-7aab-44dc-9484-80279da6f08c	1	Корневой	200	270	23	26	\N	\N	e66e7c95-95d2-4bd2-b350-92707597011d	\N
e3e0738c-b1b0-4191-bfc9-b9c3c3bc1c9c	2	Заполняющий	270	310	23	26	\N	\N	c3df8fd5-4798-491c-9e9d-11b471012828	\N
ea6fbb87-9403-412a-b8a5-80da5ef420de	1	Корневой	200	270	23	26	\N	\N	79fa9ace-5919-4d9f-8d11-44799cddd053	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
059b10a1-6554-4e10-9f70-619ab45db06b	39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4
059b10a1-6554-4e10-9f70-619ab45db06b	f1b3fc5f-1142-4a92-9923-8c7d5443ba0a
10137c53-aff6-465d-9338-189004116802	69fa5d33-1dee-4850-878d-e8faa6503c1e
2a2c6a73-09ff-471a-bb24-23693e7c4d39	69fa5d33-1dee-4850-878d-e8faa6503c1e
46e7819a-71bf-4b5b-a8e4-e0fc4062b15c	39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4
46e7819a-71bf-4b5b-a8e4-e0fc4062b15c	f1b3fc5f-1142-4a92-9923-8c7d5443ba0a
48f7ea35-2ed0-4109-98c1-beb5e1ed74cc	39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4
48f7ea35-2ed0-4109-98c1-beb5e1ed74cc	f1b3fc5f-1142-4a92-9923-8c7d5443ba0a
4f08af42-23de-4864-bc74-adf8ecd947bd	39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4
4f08af42-23de-4864-bc74-adf8ecd947bd	f1b3fc5f-1142-4a92-9923-8c7d5443ba0a
a067dd4f-83e8-4598-82d0-2dfb0a0ad72b	caf19a33-282b-46c4-bb2a-6ad24f27a6c7
f5146e6d-9693-4b59-89d6-e3f13d15ae17	caf19a33-282b-46c4-bb2a-6ad24f27a6c7
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
059b10a1-6554-4e10-9f70-619ab45db06b	ef538ed1-2c15-42e5-9a56-569bba7cd5f6	\N	150838
10137c53-aff6-465d-9338-189004116802	d5e588b5-3508-43fa-8b16-fd2808ec6e15	\N	122575
2a2c6a73-09ff-471a-bb24-23693e7c4d39	9205e9fd-569f-444a-846e-e4b14946da83	\N	132695
46e7819a-71bf-4b5b-a8e4-e0fc4062b15c	77ab320e-b84c-4537-a389-1e77895b697c	\N	114729
48f7ea35-2ed0-4109-98c1-beb5e1ed74cc	4c3cf28a-e7e4-4f97-a48b-0a3c803794ef	\N	146164
4f08af42-23de-4864-bc74-adf8ecd947bd	cfa8a70e-8fe8-459b-a8c0-d8fb2437151b	\N	150882
a067dd4f-83e8-4598-82d0-2dfb0a0ad72b	d6f40f3c-6cc5-4f9d-b877-f0d890a01bf9	\N	117390
f5146e6d-9693-4b59-89d6-e3f13d15ae17	04bb5450-9c62-4524-b530-acd351bec399	\N	121267
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
39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4	4d9f6ce8-c532-4164-af7d-b28037ca3657
39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4	8c88ca13-aa19-4901-99b3-9ec8e12e2c5a
39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4	e61e7369-4c35-46e5-b573-3dd96a7f8be2
39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4	f669b3f2-914e-43f6-8abd-8800c2069367
69fa5d33-1dee-4850-878d-e8faa6503c1e	4d9f6ce8-c532-4164-af7d-b28037ca3657
69fa5d33-1dee-4850-878d-e8faa6503c1e	d0f10509-b2ed-4266-917a-dc93c5c727f4
caf19a33-282b-46c4-bb2a-6ad24f27a6c7	8c88ca13-aa19-4901-99b3-9ec8e12e2c5a
caf19a33-282b-46c4-bb2a-6ad24f27a6c7	c32faa8b-485c-414d-bdef-b0d3a16ed4c8
f1b3fc5f-1142-4a92-9923-8c7d5443ba0a	4d9f6ce8-c532-4164-af7d-b28037ca3657
f1b3fc5f-1142-4a92-9923-8c7d5443ba0a	8c88ca13-aa19-4901-99b3-9ec8e12e2c5a
f1b3fc5f-1142-4a92-9923-8c7d5443ba0a	e61e7369-4c35-46e5-b573-3dd96a7f8be2
f1b3fc5f-1142-4a92-9923-8c7d5443ba0a	f669b3f2-914e-43f6-8abd-8800c2069367
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
39ffdc5b-eaf5-47f6-b6ee-774cbf9a21a4	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	f80239f9-71ab-4bf2-9335-14995d758277	49141	93:57:D8:0B
69fa5d33-1dee-4850-878d-e8faa6503c1e	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	f80239f9-71ab-4bf2-9335-14995d758277	49286	35:4E:AC:A5
caf19a33-282b-46c4-bb2a-6ad24f27a6c7	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	f80239f9-71ab-4bf2-9335-14995d758277	49232	03:3D:93:0D
f1b3fc5f-1142-4a92-9923-8c7d5443ba0a	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	f80239f9-71ab-4bf2-9335-14995d758277	49283	A6:F1:CF:48
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
0441073c-34d8-4d92-b3c1-0956097b9640	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1aa0f05f-d4e1-4041-888d-fe901a2ebdf2	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
069fc0a6-169e-41f4-8f10-9b9c86f98b2d	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c9171831-5863-4ddf-b705-98499d767735	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
086c04ec-2fc8-4fc8-9b74-2c0e65534b3f	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7f930add-6ddb-4491-b767-d52889df05ca	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
11d5e149-46fd-4c9d-ac83-78eb1338f046	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	369b83db-4f46-456c-b4b7-862b8d613667	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
14221fb7-4b1b-4ed5-9053-6bef46b75fe4	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	266b058c-9bb1-48d4-bf1e-10e3d5d06816	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
1f954043-0d12-462a-a7a7-78293dbbf0fa	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5f5ec49d-7faf-40ef-b93b-af8bbadbcbed	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
29343cdd-4e0d-41b2-8239-796c7111edd7	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	25ae4ebe-70db-4fea-8753-767ffaad9539	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
3895560f-dc44-4e74-99e1-f9cd53c9030a	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	30e15321-b199-4d8d-9507-a3cf966e6441	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
3e6f0e88-ca5b-4eaa-88d4-9285bd85985c	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1996a71a-fbfb-48d4-be89-4139bcce13b8	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
6576299e-b15c-40ec-9204-ef2cb0fb6185	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c259c2fb-ad4b-460b-9462-cc40f0ec23ae	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
68db427b-aacf-4d7e-90d6-da6c44859e1b	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b145dd09-057f-41fc-b9f8-f380d8c30d98	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
743fe9f1-2571-45b8-9a46-e34c98ad57d7	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4fdffb69-be3e-43a1-bc44-59a985fd4ac1	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
a0d2c706-1358-4e0d-8218-cb292b5ace7f	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	11e3ff61-ed16-4b48-90bf-5a494d776733	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
a9df389b-f917-437d-b3ab-0745e55c6f48	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e2b88a42-6918-4a08-af57-cc11c0b0baa8	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
ae53ab8d-ea9e-4f3e-b616-047ee420b98d	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cbb63aed-6a91-4936-a55c-1fb907b0a933	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
ba012108-eb00-402e-ab98-0f7501cf3bd3	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	46e89286-6285-47b5-8a32-f81200898ba3	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
c65124fe-594c-45d7-805b-7ddbf9706258	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	166affbd-34f8-4364-9c1f-48385678f48b	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
e25b7b25-b557-4ba7-9ada-d860e655e623	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	71fcc9f2-3f87-46df-85bc-82f9c2cd3592	\N	f80239f9-71ab-4bf2-9335-14995d758277	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
239f2454-c785-4931-9498-b0547e10eff4	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	515792a8-1dbe-4e05-973a-e79e2030f525	\N
84d19c21-5dc4-49e8-88af-8911f0817e14	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	515792a8-1dbe-4e05-973a-e79e2030f525	\N
bf8269e7-0269-4686-872f-4461a5663733	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	515792a8-1dbe-4e05-973a-e79e2030f525	\N
c1b447d2-d00c-4419-88ef-061afd49a753	1	12:10:00	13:10:00	13:20:00	13:50:00	9def2ff6-1af9-402f-96f1-9d19ce800720	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
4d9f6ce8-c532-4164-af7d-b28037ca3657	3500	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	3500
8c88ca13-aa19-4901-99b3-9ec8e12e2c5a	3610	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	3610
c32faa8b-485c-414d-bdef-b0d3a16ed4c8	3600	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	3600
d0f10509-b2ed-4266-917a-dc93c5c727f4	3510	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	3510
e61e7369-4c35-46e5-b573-3dd96a7f8be2	3690	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	3690
f669b3f2-914e-43f6-8abd-8800c2069367	3550	\N	ea5bb580-2a09-4ed8-ad21-cd8467a33793	3550
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
3cd4dd6d-8ba8-4c9c-a33b-7fea73974200	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 18, true);


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

