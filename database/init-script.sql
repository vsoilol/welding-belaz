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
    "Time" double precision NOT NULL,
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
03ada29e-7fbd-4208-9c89-134af764500d	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
8ddeaa84-25e6-4a43-8ecc-78c8369f0e4d	d7288135-8d15-4842-8d58-16f01750c6bc	457aec14-9cee-435c-90cb-51e6d5ea5638	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
c0a71ff7-9853-428e-b104-9323469b6edb	1	10	t	03ada29e-7fbd-4208-9c89-134af764500d	\N
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
0ecec78f-6180-48b2-a972-31763c9f71ba	Праздники и выходные	\N
1b1098b4-0071-4720-a8bc-ea5974ded8b2	Отсутствие заданий	\N
20b6dc64-337f-49d9-82bc-7d7ba2e6d317	Неявка оператора (б/лист, отпуск, и пр.)	\N
3366efa8-d3bd-47f2-a7e6-d3cd08bc42c9	Нерабочее время по графику согласно сменности	\N
33f776ce-07c2-4bff-88a9-64f551feca3b	Сборочные операции	\N
387fc1b8-70fa-4b1e-9e8f-9377f4934484	Установка, выверка, снятие детали	\N
38f41f00-98f7-4446-b9af-f00c4f3f3303	Контроль на рабочем месте	\N
3d0ea75e-e596-443e-a5a4-74fef4853505	Ознакомление с работой, документацией, инструктаж	\N
529d58ad-2f67-476f-9c4a-ab1e0335706a	Отсутствие энергоносителей	\N
7e42b7fe-3f98-42ae-9f3f-aa01a65655b5	Отсутствие оператора в связи с необеспеченностью	\N
81bd1b12-3bdc-489b-88dc-eaf9aed3cdee	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
8f16fc3c-5ad9-419d-bc13-824730750f8f	Изменение режимов, смена инструмента, приспособления	\N
90ad04c2-67b3-46c6-8363-7d729cbf803e	Отсутствие сотрудника ОТК	\N
9e7e787d-682f-4a3b-8c47-a10fd94c3c7d	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
a372d104-9464-4cba-9e3e-f14186ba4fe4	Обед	\N
aebf4979-464e-43b9-974b-6f124960c9ea	Установка, выверка, снятие детали	\N
b080b4d1-2216-4cbd-a594-2e7f177ce934	Отсутствие конструктора, технолога или ожидание его решения	\N
b58a4beb-8f37-4a62-92fd-835f2594626d	Отсутствие крана, транспорта	\N
b73e8069-6c8a-4ab9-9cce-86251252baaa	Естественные надобности	\N
c0e55e1a-bcc4-4471-bf4b-419b315fb17f	Аварийный ремонт централизованными службами	\N
c359a14d-259c-4a0f-b875-abe42fbb14ca	Работа с управляющей программой	\N
cf1002aa-36ef-4fa6-8782-40dc486e826c	Плановый ремонт централизованными службами	\N
f68a8310-d89e-425a-a665-cdd0b654b819	Отсутствие материала, заготовок, деталей	\N
fc765e3f-4b85-4227-85e5-22fc9d568385	Работа по карте несоответствий	\N
feae5315-acb9-42cd-a0a0-51b63cdf560c	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
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
3352ffbb-7ef2-4e72-98e5-e7c9f226fcfd	db8d9062-81b4-4a83-8861-cb64a3538cc7	219379
ffb0bec5-ae88-46fc-807a-80137f4a4ab0	2044aa99-15c1-4195-a14f-3160bf5313ee	249550
45d89e3e-fc93-4566-8817-d5d15aea326d	61b20b01-5a51-409c-bddd-bd6f494215e8	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
c9728578-c336-4a48-9756-58f8bd342426	9a3b9737-de67-452b-a82a-c23553bd54a7	614962
dfbdedbb-cac7-4316-b996-a30315e8010b	894566f9-0f5f-43be-b624-f61a948996c7	610422
a63af46d-2a03-47a0-adac-0560e25629f9	c07b88af-28ce-49ba-a3b8-ae22ec566923	\N
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
7c31939a-d62a-4699-ad82-f0702d68e4f2	c43d0841-8d74-47a2-9e53-f38ea56b6165
ab7af647-e9de-47d6-88e1-7d14e66add57	c43d0841-8d74-47a2-9e53-f38ea56b6165
e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	c43d0841-8d74-47a2-9e53-f38ea56b6165
eee86449-dc87-4565-84f2-c1c1fb6dd97d	c43d0841-8d74-47a2-9e53-f38ea56b6165
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
7c31939a-d62a-4699-ad82-f0702d68e4f2	3	2	2023-03-12 00:00:00	67903414-c1ad-4da4-884c-40e9e6893173	\N
ab7af647-e9de-47d6-88e1-7d14e66add57	2	2	2023-03-12 00:00:00	66739290-cc11-4179-96be-0ae67d762440	\N
e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	1	2	2023-03-12 00:00:00	62f87bcf-3367-47d7-a30b-f3a1bc22803d	\N
eee86449-dc87-4565-84f2-c1c1fb6dd97d	4	2	2023-03-12 00:00:00	c8f247ff-2e7c-4190-b027-45773821a5e9	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
c8f247ff-2e7c-4190-b027-45773821a5e9	62f87bcf-3367-47d7-a30b-f3a1bc22803d
66739290-cc11-4179-96be-0ae67d762440	67903414-c1ad-4da4-884c-40e9e6893173
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
2311731c-d4dd-4dd6-907c-8addd2a38020	0	2	\N	\N	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
5281f5bb-edce-4732-9dfa-c14d7b725a4f	0	3	\N	\N	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
6ed7f69f-8035-43d2-936b-6ebd71afd77e	0	1	\N	\N	e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	\N
7e60e287-3568-48a6-9ac5-2b1d4213e528	0	1	\N	\N	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
a040362f-8e00-4cea-ad7f-824968ad176f	0	2	\N	\N	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
c28dcf58-0548-450d-8fef-77a0f96159dc	0	1	\N	\N	7c31939a-d62a-4699-ad82-f0702d68e4f2	\N
ce538926-0942-4980-92c3-d022afde1703	0	2	\N	\N	7c31939a-d62a-4699-ad82-f0702d68e4f2	\N
ceffcfe5-bbda-478f-aba7-b7d4e45d8208	0	1	\N	\N	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
e01309ec-7fa5-4d69-a00d-1e969b358aa7	0	3	\N	\N	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
e727e60a-6a1f-4e64-ad69-9702aa9c4749	0	2	\N	\N	e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	\N
e835b9fa-00e4-494a-bc5a-430cd46c6adc	0	3	\N	\N	e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	\N
f9108f1e-baf3-4d60-be08-fbf2c2361eb8	0	3	\N	\N	7c31939a-d62a-4699-ad82-f0702d68e4f2	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
d035d4df-9d78-4cf4-8ec8-844a1dbfc731	Сборка, сварка рам к/с г/п 120-130 т.	6	457aec14-9cee-435c-90cb-51e6d5ea5638	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
62f87bcf-3367-47d7-a30b-f3a1bc22803d	Поперечина рамы задняя	75131-2801300-20	t	2	8b7bed18-576e-452e-b14b-bd69f7379b38	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N	\N	\N
66739290-cc11-4179-96be-0ae67d762440	Рама	75131-2800010-70	t	1	7764d83b-f11e-4212-9bb7-ffefc8e2b427	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N	\N	4536479362
67903414-c1ad-4da4-884c-40e9e6893173	Поперечина рамы задняя	75131-2801300-20	t	2	7764d83b-f11e-4212-9bb7-ffefc8e2b427	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N	\N	\N
c8f247ff-2e7c-4190-b027-45773821a5e9	Рама	7513D-2800010-20	t	1	8b7bed18-576e-452e-b14b-bd69f7379b38	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N	\N	4536492774
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
fbb9c3ec-ab1d-4a3e-ba42-df34ec04f8b1	Admin	\N
bf7ee6f6-d429-4731-90c3-16b26a737bde	Master	\N
1c15eeb3-33de-46e0-95bb-e0bdf0e489b6	Welder	\N
f89a4869-0da0-4e79-a58a-7e12c4d298a4	Inspector	\N
c1d80632-7786-480b-9710-80e9cbfba556	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
025148a8-a527-42d1-8705-18c5409a795e	2023-03-12 00:00:00	3f5e8b4d-938b-4a65-afc8-a704de0733c3	7c31939a-d62a-4699-ad82-f0702d68e4f2	\N
198840f5-30cc-4ef8-82f0-cc5f6bb864dd	2023-03-12 00:00:00	6a02441d-9253-49b8-b010-8a72b8d7a643	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
1dc32b43-a6a6-4a76-9ca5-1e413affee45	2023-03-12 00:00:00	fcf971b6-bd85-46e4-8589-0e2538f7aae8	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
1ee1adb6-a154-43d1-8511-af77ca543e51	2023-03-12 00:00:00	497866ea-37aa-47fd-bb06-1089af724433	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
2b92618f-78dd-4bfd-ace1-81a818e84038	2023-03-12 00:00:00	5a67282b-db2d-4c83-83a0-e22d42aa571e	7c31939a-d62a-4699-ad82-f0702d68e4f2	\N
35f31148-32a6-4bce-95a2-5d0f54c464e6	2023-03-12 00:00:00	90c5b3a4-9817-468f-9145-84a1203c815a	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
37bfafd9-15f0-4393-99d7-21eadf2aee9d	2023-03-12 00:00:00	74c5bee1-1c14-4e80-b3e2-ef505b2efb11	e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	\N
80ce6f39-5776-4bf3-a0cf-1021f9051a40	2023-03-12 00:00:00	470700e7-7f09-43ff-a1ea-370b54b089a7	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
88bd5ec5-6cb9-4f03-a3f4-47cbf46ada32	2023-03-12 00:00:00	7b5fe77a-7182-4bfa-95f3-6aa9a7dc97b3	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
893755b1-6b3d-4a2d-b234-801f61cd0dd6	2023-03-12 00:00:00	dfdff6b6-c2df-4935-b27e-19f82389c89e	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
8ebbf174-e3f3-425b-9229-7d4c9624b0e1	2023-03-12 00:00:00	c531b6c1-9f90-4543-8b85-736674439424	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
969a7a18-a3b4-41b1-a104-824f1a1ff26a	2023-03-12 00:00:00	cc6a7b18-55cf-496a-babb-b949dc7cd995	7c31939a-d62a-4699-ad82-f0702d68e4f2	\N
b310f6dd-3c04-47da-9050-96a6812637af	2023-03-12 00:00:00	e5129ab0-b68d-47d8-a2a2-ad6726b7aaf4	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
b793ace8-455a-405e-88de-3a992260cfdc	2023-03-12 00:00:00	398f90f1-8a2b-4eb1-b5be-5d2e3bb55415	eee86449-dc87-4565-84f2-c1c1fb6dd97d	\N
d156510f-3334-426f-b9a1-ced25a173a66	2023-03-12 00:00:00	40e4af74-51ac-4201-8c09-44665e1f8cfb	e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	\N
d8972d21-0e86-4cc7-a2dd-769069a0d194	2023-03-12 00:00:00	68438273-e613-4a26-85ed-b15b8e11d9de	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
d97edbcf-acff-4557-a85c-6b8ae5901698	2023-03-12 00:00:00	40831bb7-8e09-4d03-99e7-ea14239086c7	ab7af647-e9de-47d6-88e1-7d14e66add57	\N
db397fcf-d4f6-4a99-9e8b-9c0119788c4e	2023-03-12 00:00:00	740f5659-c9ea-4eeb-9f85-62b9912a2594	e8b0d83a-6f4c-4a98-a512-8ca4e1c4dd4e	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
00cb8ca6-1110-4868-8f54-a511cb166135	0	1	\N	\N	1ee1adb6-a154-43d1-8511-af77ca543e51	\N
04228260-8eca-4144-8d83-dfd5f352dd32	0	3	\N	\N	d156510f-3334-426f-b9a1-ced25a173a66	\N
08c1575e-57ec-4506-b187-bb23f7fc331b	0	2	\N	\N	80ce6f39-5776-4bf3-a0cf-1021f9051a40	\N
0be06ec4-777d-45ad-922b-f99de421eb97	0	2	\N	\N	2b92618f-78dd-4bfd-ace1-81a818e84038	\N
0d2093aa-77b4-45ab-a3c4-1b9f11613571	0	3	\N	\N	198840f5-30cc-4ef8-82f0-cc5f6bb864dd	\N
0e044237-ffe0-4775-9460-ae50a2855d81	0	1	\N	\N	969a7a18-a3b4-41b1-a104-824f1a1ff26a	\N
185d0887-8f82-4898-b339-6cb1bac4ba31	0	2	\N	\N	35f31148-32a6-4bce-95a2-5d0f54c464e6	\N
1a2d60b9-7b0b-4088-b44d-0a56100186d0	0	1	\N	\N	d8972d21-0e86-4cc7-a2dd-769069a0d194	\N
1b9085ac-3c78-40e5-adba-fe7208e4cf2e	0	3	\N	\N	1dc32b43-a6a6-4a76-9ca5-1e413affee45	\N
228944b7-078a-4e3d-a692-11bb670a9fd7	0	2	\N	\N	d156510f-3334-426f-b9a1-ced25a173a66	\N
25aca0c2-b7ed-4f50-951f-e45da6c0af1b	0	3	\N	\N	b793ace8-455a-405e-88de-3a992260cfdc	\N
32b0fc34-d788-483a-ba37-cc90a5c86768	0	3	\N	\N	35f31148-32a6-4bce-95a2-5d0f54c464e6	\N
3314574f-4e1c-4c28-bd59-4d347f2b234f	0	2	\N	\N	893755b1-6b3d-4a2d-b234-801f61cd0dd6	\N
388835e2-0b66-4c91-a1a8-1e68ae583571	0	1	\N	\N	db397fcf-d4f6-4a99-9e8b-9c0119788c4e	\N
38f955eb-4f16-4fec-8d96-5b279c443fac	0	3	\N	\N	db397fcf-d4f6-4a99-9e8b-9c0119788c4e	\N
3dff8407-03ec-40a8-9d51-cdce86351d64	0	1	\N	\N	d156510f-3334-426f-b9a1-ced25a173a66	\N
480ecb85-860e-458f-90c5-9eaa96ee6aa2	0	2	\N	\N	d97edbcf-acff-4557-a85c-6b8ae5901698	\N
4abc39e4-9688-493c-8b39-efd174b2ebb9	0	1	\N	\N	8ebbf174-e3f3-425b-9229-7d4c9624b0e1	\N
4dd30f8e-5e2d-4a9c-9ab2-ac9931dd5c32	0	3	\N	\N	80ce6f39-5776-4bf3-a0cf-1021f9051a40	\N
51648eb2-c358-4e88-b3c2-3cc15bb5a772	0	1	\N	\N	37bfafd9-15f0-4393-99d7-21eadf2aee9d	\N
52ca107d-492d-4a25-980a-d4985a96d959	0	2	\N	\N	8ebbf174-e3f3-425b-9229-7d4c9624b0e1	\N
6537a5f1-b612-4b79-b60b-cb069a5c2732	0	1	\N	\N	198840f5-30cc-4ef8-82f0-cc5f6bb864dd	\N
66dad76d-d249-4d2e-96a3-79fab2e96ca3	0	1	\N	\N	025148a8-a527-42d1-8705-18c5409a795e	\N
66f61e52-9b3e-4f0d-9bb1-9e6d3ee1454c	0	2	\N	\N	1ee1adb6-a154-43d1-8511-af77ca543e51	\N
6a519632-e5cf-465d-aad0-120fca315d14	0	1	\N	\N	2b92618f-78dd-4bfd-ace1-81a818e84038	\N
738dd059-9196-4944-9b7b-e1fec9c6da93	0	3	\N	\N	969a7a18-a3b4-41b1-a104-824f1a1ff26a	\N
75c992b0-d19f-4cb8-9c32-18f254cde54d	0	3	\N	\N	893755b1-6b3d-4a2d-b234-801f61cd0dd6	\N
78e77537-ca14-4892-a339-d2579abaa6ea	0	1	\N	\N	80ce6f39-5776-4bf3-a0cf-1021f9051a40	\N
80c38f69-0b68-4942-beb7-ce9284036c61	0	1	\N	\N	b310f6dd-3c04-47da-9050-96a6812637af	\N
8dc7bce2-38c5-4f03-9230-10373d0850dd	0	2	\N	\N	969a7a18-a3b4-41b1-a104-824f1a1ff26a	\N
8f18bf21-87d1-481f-ba72-d475ee56fbd0	0	3	\N	\N	b310f6dd-3c04-47da-9050-96a6812637af	\N
92935a88-665f-4cf3-b0a9-84c57bae3a0d	0	3	\N	\N	1ee1adb6-a154-43d1-8511-af77ca543e51	\N
9a181809-0738-4a6c-9b42-cdb274229b0b	0	2	\N	\N	b310f6dd-3c04-47da-9050-96a6812637af	\N
9c7107e8-650a-4ce5-933a-f48034688f34	0	1	\N	\N	88bd5ec5-6cb9-4f03-a3f4-47cbf46ada32	\N
9d8e8082-1c2e-4216-ac44-f59013580d6d	0	3	\N	\N	d8972d21-0e86-4cc7-a2dd-769069a0d194	\N
a3e05854-152f-436e-8004-c6f9bc041d9f	0	3	\N	\N	2b92618f-78dd-4bfd-ace1-81a818e84038	\N
a88a21c5-3db2-4133-a6e4-11f223b36991	0	2	\N	\N	d8972d21-0e86-4cc7-a2dd-769069a0d194	\N
a8a2e0ce-8785-43ea-827c-696cbf80f782	0	2	\N	\N	b793ace8-455a-405e-88de-3a992260cfdc	\N
ac9f188a-5a20-45e0-862e-c2827bd5e61a	0	3	\N	\N	d97edbcf-acff-4557-a85c-6b8ae5901698	\N
ae07e342-4f03-4701-bcbd-1ccb4dea1c73	0	1	\N	\N	b793ace8-455a-405e-88de-3a992260cfdc	\N
b1b8533e-4676-40b5-b35e-eeaee8b2b29a	0	2	\N	\N	198840f5-30cc-4ef8-82f0-cc5f6bb864dd	\N
b286d62b-6152-4f0c-ad7b-edddf0fdf268	0	1	\N	\N	893755b1-6b3d-4a2d-b234-801f61cd0dd6	\N
b574f826-5be5-4c11-9efc-b816d708aada	0	2	\N	\N	37bfafd9-15f0-4393-99d7-21eadf2aee9d	\N
b6031634-e297-4abf-a9d6-4bfd201d89a3	0	1	\N	\N	35f31148-32a6-4bce-95a2-5d0f54c464e6	\N
bb3dd669-d7a3-4f09-903d-a5917760bf9e	0	1	\N	\N	1dc32b43-a6a6-4a76-9ca5-1e413affee45	\N
c0749e7c-4b95-41d4-8cd8-0f62eee743a4	0	1	\N	\N	d97edbcf-acff-4557-a85c-6b8ae5901698	\N
cac7f7e9-dd44-43f2-94ee-b1f0c5e68533	0	3	\N	\N	37bfafd9-15f0-4393-99d7-21eadf2aee9d	\N
d08e60ab-cca5-4f19-8493-12e6e15e725e	0	2	\N	\N	db397fcf-d4f6-4a99-9e8b-9c0119788c4e	\N
d53abaf7-7f0f-420f-a2a0-1082aa753deb	0	3	\N	\N	88bd5ec5-6cb9-4f03-a3f4-47cbf46ada32	\N
d6f6ec41-8076-40b8-a5c0-56d27225ba20	0	2	\N	\N	025148a8-a527-42d1-8705-18c5409a795e	\N
dcb9803e-a764-4114-964b-ad67e48c904b	0	2	\N	\N	88bd5ec5-6cb9-4f03-a3f4-47cbf46ada32	\N
e13847e3-50bb-40ba-8fac-e24c54899f7a	0	3	\N	\N	8ebbf174-e3f3-425b-9229-7d4c9624b0e1	\N
ed5117f3-fc26-4eca-be9a-ee2ec9cf24bf	0	2	\N	\N	1dc32b43-a6a6-4a76-9ca5-1e413affee45	\N
f24c4fa9-c1a1-4ff4-985b-099bfbb9534b	0	3	\N	\N	025148a8-a527-42d1-8705-18c5409a795e	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
398f90f1-8a2b-4eb1-b5be-5d2e3bb55415	55	400	t	f	c8f247ff-2e7c-4190-b027-45773821a5e9	60842b12-4293-4ebb-9075-b79ad42e3075	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
3f5e8b4d-938b-4a65-afc8-a704de0733c3	1	1900	t	f	67903414-c1ad-4da4-884c-40e9e6893173	2fba05ed-b4ac-4af5-bcec-51e47341d8b2	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
40831bb7-8e09-4d03-99e7-ea14239086c7	39	280	t	f	66739290-cc11-4179-96be-0ae67d762440	51afef5b-e69c-4d6c-9993-355db9e6e2cd	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
40e4af74-51ac-4201-8c09-44665e1f8cfb	1	1900	t	f	62f87bcf-3367-47d7-a30b-f3a1bc22803d	2fba05ed-b4ac-4af5-bcec-51e47341d8b2	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
470700e7-7f09-43ff-a1ea-370b54b089a7	18	4000	t	f	c8f247ff-2e7c-4190-b027-45773821a5e9	c0c0d4f0-7752-402d-aa32-9a052e79c0cf	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
497866ea-37aa-47fd-bb06-1089af724433	18	4000	t	f	66739290-cc11-4179-96be-0ae67d762440	c0c0d4f0-7752-402d-aa32-9a052e79c0cf	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
5a67282b-db2d-4c83-83a0-e22d42aa571e	2	1880	t	f	67903414-c1ad-4da4-884c-40e9e6893173	72f8051b-7b3d-4a55-a57d-5249da157e84	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
68438273-e613-4a26-85ed-b15b8e11d9de	55	400	t	f	66739290-cc11-4179-96be-0ae67d762440	60842b12-4293-4ebb-9075-b79ad42e3075	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
6a02441d-9253-49b8-b010-8a72b8d7a643	39	280	t	f	c8f247ff-2e7c-4190-b027-45773821a5e9	51afef5b-e69c-4d6c-9993-355db9e6e2cd	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
740f5659-c9ea-4eeb-9f85-62b9912a2594	52	1200	t	f	62f87bcf-3367-47d7-a30b-f3a1bc22803d	7a645973-4f28-4d4b-aef1-5fcdd7bc0b5e	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
74c5bee1-1c14-4e80-b3e2-ef505b2efb11	2	1880	t	f	62f87bcf-3367-47d7-a30b-f3a1bc22803d	72f8051b-7b3d-4a55-a57d-5249da157e84	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
7b5fe77a-7182-4bfa-95f3-6aa9a7dc97b3	57	400	t	f	66739290-cc11-4179-96be-0ae67d762440	745b2f8a-f3df-4006-bfbb-d57d2199be82	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
90c5b3a4-9817-468f-9145-84a1203c815a	54	400	t	f	66739290-cc11-4179-96be-0ae67d762440	943bfa1e-ea07-41e6-a156-be106ce1a156	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
c531b6c1-9f90-4543-8b85-736674439424	58	900	t	f	66739290-cc11-4179-96be-0ae67d762440	3aab216d-22c5-4703-b830-16273eee38f5	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
cc6a7b18-55cf-496a-babb-b949dc7cd995	52	1200	t	f	67903414-c1ad-4da4-884c-40e9e6893173	7a645973-4f28-4d4b-aef1-5fcdd7bc0b5e	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
dfdff6b6-c2df-4935-b27e-19f82389c89e	58	900	t	f	c8f247ff-2e7c-4190-b027-45773821a5e9	3aab216d-22c5-4703-b830-16273eee38f5	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
e5129ab0-b68d-47d8-a2a2-ad6726b7aaf4	54	400	t	f	c8f247ff-2e7c-4190-b027-45773821a5e9	943bfa1e-ea07-41e6-a156-be106ce1a156	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
fcf971b6-bd85-46e4-8589-0e2538f7aae8	57	400	t	f	c8f247ff-2e7c-4190-b027-45773821a5e9	745b2f8a-f3df-4006-bfbb-d57d2199be82	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
2fba05ed-b4ac-4af5-bcec-51e47341d8b2	1	Инструкция 1	1
3aab216d-22c5-4703-b830-16273eee38f5	58	Инструкция 58	58
51afef5b-e69c-4d6c-9993-355db9e6e2cd	39	Инструкция 39	39
60842b12-4293-4ebb-9075-b79ad42e3075	55	Инструкция 55	55
72f8051b-7b3d-4a55-a57d-5249da157e84	2	Инструкция 2	2
745b2f8a-f3df-4006-bfbb-d57d2199be82	57	Инструкция 57	57
7a645973-4f28-4d4b-aef1-5fcdd7bc0b5e	52	Инструкция 52	52
943bfa1e-ea07-41e6-a156-be106ce1a156	54	Инструкция 54	54
b6a5261c-7645-4cfd-ae54-2f241f3dd105	56	Инструкция 56	56
b7a2d254-ed25-48cd-9af1-a6b8c0ec5594	48	Инструкция 48	48
c0c0d4f0-7752-402d-aa32-9a052e79c0cf	18	Инструкция 18	18
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
7764d83b-f11e-4212-9bb7-ffefc8e2b427	75131-2800010-70	Рама	\N	3291137
8b7bed18-576e-452e-b14b-bd69f7379b38	7513D-2800010-20	Рама	\N	3330041
ff0b1fab-a242-4c55-a0a3-c79a335fd7bd	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
2044aa99-15c1-4195-a14f-3160bf5313ee	f89a4869-0da0-4e79-a58a-7e12c4d298a4
db8d9062-81b4-4a83-8861-cb64a3538cc7	f89a4869-0da0-4e79-a58a-7e12c4d298a4
894566f9-0f5f-43be-b624-f61a948996c7	bf7ee6f6-d429-4731-90c3-16b26a737bde
9a3b9737-de67-452b-a82a-c23553bd54a7	bf7ee6f6-d429-4731-90c3-16b26a737bde
5846aa8c-4c70-4b78-b350-813e59fe277d	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
5a8020a5-9261-43fa-a803-042f337b7ffe	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
5b3ecd4f-e5ca-48a0-b0b7-692662fa3e54	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
99fe2e6f-2f27-4528-898d-b44fea6d5f6d	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
d30aa94d-ee1c-4ab9-b678-5b411f865408	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
e392b1c5-cd8f-41b8-99ab-64faf4801e06	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
eeb8d9a6-d898-4854-a097-f81955dfad09	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
f0b89951-7cb8-44d4-aa96-65d8f824ac02	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
d7288135-8d15-4842-8d58-16f01750c6bc	c1d80632-7786-480b-9710-80e9cbfba556
011dca81-7540-409b-9c1b-2b0a6c1a66c9	fbb9c3ec-ab1d-4a3e-ba42-df34ec04f8b1
3d01cf01-0a5e-4840-8e96-abf587b47fe4	1c15eeb3-33de-46e0-95bb-e0bdf0e489b6
61b20b01-5a51-409c-bddd-bd6f494215e8	f89a4869-0da0-4e79-a58a-7e12c4d298a4
445646db-6b5a-49d1-8399-609d451d4046	c1d80632-7786-480b-9710-80e9cbfba556
c07b88af-28ce-49ba-a3b8-ae22ec566923	bf7ee6f6-d429-4731-90c3-16b26a737bde
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
2044aa99-15c1-4195-a14f-3160bf5313ee	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
db8d9062-81b4-4a83-8861-cb64a3538cc7	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
894566f9-0f5f-43be-b624-f61a948996c7	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
9a3b9737-de67-452b-a82a-c23553bd54a7	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
5846aa8c-4c70-4b78-b350-813e59fe277d	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	D7:F1:7D:5A
5a8020a5-9261-43fa-a803-042f337b7ffe	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	27:45:7E:B4
5b3ecd4f-e5ca-48a0-b0b7-692662fa3e54	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	97:17:60:B4
99fe2e6f-2f27-4528-898d-b44fea6d5f6d	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	B7:5A:79:B5
d30aa94d-ee1c-4ab9-b678-5b411f865408	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	D7:95:55:B4
e392b1c5-cd8f-41b8-99ab-64faf4801e06	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	67:CD:7E:5A
eeb8d9a6-d898-4854-a097-f81955dfad09	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	67:5A:70:B4
f0b89951-7cb8-44d4-aa96-65d8f824ac02	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	17:CD:7F:5A
d7288135-8d15-4842-8d58-16f01750c6bc	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
011dca81-7540-409b-9c1b-2b0a6c1a66c9	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$KUC6rwPnQiMdz74g3ZS9LzVvHCP2G/7mvUdupPfyhh4hhgF9	\N	\N	\N	\N	\N	\N
3d01cf01-0a5e-4840-8e96-abf587b47fe4	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$C//LJRq2CAmm0X3sidoqjdXHuqmd2dGd2RgFM5M0dkpndRz4	\N	\N	\N	\N	\N	\N
61b20b01-5a51-409c-bddd-bd6f494215e8	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$fIDu7sfCtlIrGmQyISl1535C2Z+W77N1wCk4G1gBjsgsH3o9	\N	\N	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
445646db-6b5a-49d1-8399-609d451d4046	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$v/MT/kz3ely/RICSszW9kgMZlF++WKNtUL5WKsVOZWyUGbhN	\N	\N	\N	\N	\N	\N
c07b88af-28ce-49ba-a3b8-ae22ec566923	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$J9W7eiyoDEYyrumzRG9xIUarVJmoM3LvVjfwFxq7PU9ws3C4	\N	\N	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
11c3bae4-7fc2-48f5-b6ff-d50807825d9b	1	Корневой	200	270	23	26	\N	\N	7a645973-4f28-4d4b-aef1-5fcdd7bc0b5e	\N
1204742c-2821-4dcc-83bc-bc9571ce4d7b	2	Заполняющий	270	310	23	26	\N	\N	943bfa1e-ea07-41e6-a156-be106ce1a156	\N
152b8631-3592-4397-9745-112e091af6ec	2	Заполняющий	270	310	23	26	\N	\N	3aab216d-22c5-4703-b830-16273eee38f5	\N
310b8d18-aac2-42e9-82c8-ba47c6aa2a1e	2	Заполняющий	270	310	23	26	\N	\N	7a645973-4f28-4d4b-aef1-5fcdd7bc0b5e	\N
3b2e1f91-7b26-48de-8e9e-98456738b9da	2	Заполняющий	270	310	23	26	\N	\N	745b2f8a-f3df-4006-bfbb-d57d2199be82	\N
4154ba2b-0a5e-401d-ab8a-29c9006b771a	1	Корневой	200	270	23	26	\N	\N	745b2f8a-f3df-4006-bfbb-d57d2199be82	\N
51a73991-9ed0-4bf1-9e1d-9e4fd27f9751	2	Заполняющий	270	310	23	26	\N	\N	72f8051b-7b3d-4a55-a57d-5249da157e84	\N
51aac6ad-b80d-4b8f-92c5-03152115dbb2	1	Корневой	200	270	23	26	\N	\N	b7a2d254-ed25-48cd-9af1-a6b8c0ec5594	\N
583172a8-c3a6-4f22-a757-c6272396ed09	2	Заполняющий	270	310	23	26	\N	\N	b6a5261c-7645-4cfd-ae54-2f241f3dd105	\N
58d91a65-0e8f-4f15-bc0e-49b8e11d1442	1	Корневой	200	270	23	26	\N	\N	60842b12-4293-4ebb-9075-b79ad42e3075	\N
65971edb-e5fa-4ef9-b18b-b9190eb2de52	2	Заполняющий	270	310	23	26	\N	\N	60842b12-4293-4ebb-9075-b79ad42e3075	\N
6caf360f-a4a8-4026-9009-f0ee62bf0f4d	2	Заполняющий	270	310	23	26	\N	\N	2fba05ed-b4ac-4af5-bcec-51e47341d8b2	\N
70449e02-4476-404f-8ff6-6b60c6beb182	1	Корневой	200	270	23	26	\N	\N	b6a5261c-7645-4cfd-ae54-2f241f3dd105	\N
77988057-96ce-4ca0-a072-a480cdac9ad0	1	Корневой	200	270	23	26	\N	\N	51afef5b-e69c-4d6c-9993-355db9e6e2cd	\N
aa0caa37-e1f9-43b9-9924-e912c847c986	1	Корневой	200	270	23	26	\N	\N	c0c0d4f0-7752-402d-aa32-9a052e79c0cf	\N
aa3b3ea3-e26d-452b-9ad2-ecd41d9ac730	1	Корневой	200	270	23	26	\N	\N	3aab216d-22c5-4703-b830-16273eee38f5	\N
af42da38-0155-4dfb-ae32-352d308e28fd	1	Корневой	200	270	23	26	\N	\N	943bfa1e-ea07-41e6-a156-be106ce1a156	\N
bbbee431-0833-467f-80fb-c016c420fa7d	1	Корневой	200	270	23	26	\N	\N	2fba05ed-b4ac-4af5-bcec-51e47341d8b2	\N
bd49e58f-a199-46d4-9cd0-dfe9a82ed295	2	Заполняющий	270	310	23	26	\N	\N	b7a2d254-ed25-48cd-9af1-a6b8c0ec5594	\N
bed2a9c8-f2e5-4a6c-8643-730de5fdc2c3	1	Корневой	200	270	23	26	\N	\N	72f8051b-7b3d-4a55-a57d-5249da157e84	\N
c5e62293-aae9-4ca6-9249-c83a6c412c78	2	Заполняющий	270	310	23	26	\N	\N	c0c0d4f0-7752-402d-aa32-9a052e79c0cf	\N
c9fa08ea-a892-47a1-8ea7-fe4400f78bbc	2	Заполняющий	270	310	23	26	\N	\N	51afef5b-e69c-4d6c-9993-355db9e6e2cd	\N
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
349b9995-4f58-431e-b228-63065df63c6b	10a1e7ac-2036-4783-9cc5-d2ca5b735930
349b9995-4f58-431e-b228-63065df63c6b	4829b22c-9421-4856-a40e-944dc8fcef4d
4a0ca46f-e193-4a9b-8a6c-42a65414cc6c	8dbe00f5-ecf9-44a9-aaa0-90643893e8a4
59c65ae3-6c0e-4ba4-b4b6-8e4c0bf15f8e	10a1e7ac-2036-4783-9cc5-d2ca5b735930
59c65ae3-6c0e-4ba4-b4b6-8e4c0bf15f8e	4829b22c-9421-4856-a40e-944dc8fcef4d
6a30e509-7ad3-46bf-b93b-0347bf36db7c	10a1e7ac-2036-4783-9cc5-d2ca5b735930
6a30e509-7ad3-46bf-b93b-0347bf36db7c	4829b22c-9421-4856-a40e-944dc8fcef4d
9ae2cf5f-6f21-473e-8d6a-cb9aa3fb237f	8dbe00f5-ecf9-44a9-aaa0-90643893e8a4
9ea28037-8d66-46ac-9c70-08eaaf74bba5	10a1e7ac-2036-4783-9cc5-d2ca5b735930
9ea28037-8d66-46ac-9c70-08eaaf74bba5	4829b22c-9421-4856-a40e-944dc8fcef4d
a1867658-784f-4293-83a1-e827f441ed81	c43d0841-8d74-47a2-9e53-f38ea56b6165
d5ca89eb-f0cb-459d-8f79-dbfce33a2a86	c43d0841-8d74-47a2-9e53-f38ea56b6165
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
349b9995-4f58-431e-b228-63065df63c6b	f0b89951-7cb8-44d4-aa96-65d8f824ac02	\N	150882
4a0ca46f-e193-4a9b-8a6c-42a65414cc6c	e392b1c5-cd8f-41b8-99ab-64faf4801e06	\N	122575
59c65ae3-6c0e-4ba4-b4b6-8e4c0bf15f8e	5b3ecd4f-e5ca-48a0-b0b7-692662fa3e54	\N	150838
6a30e509-7ad3-46bf-b93b-0347bf36db7c	5846aa8c-4c70-4b78-b350-813e59fe277d	\N	114729
9ae2cf5f-6f21-473e-8d6a-cb9aa3fb237f	d30aa94d-ee1c-4ab9-b678-5b411f865408	\N	132695
9ea28037-8d66-46ac-9c70-08eaaf74bba5	5a8020a5-9261-43fa-a803-042f337b7ffe	\N	146164
a1867658-784f-4293-83a1-e827f441ed81	eeb8d9a6-d898-4854-a097-f81955dfad09	\N	117390
d5ca89eb-f0cb-459d-8f79-dbfce33a2a86	99fe2e6f-2f27-4528-898d-b44fea6d5f6d	\N	121267
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
10a1e7ac-2036-4783-9cc5-d2ca5b735930	75d30a74-23f8-4197-8d9d-014cef9ff5c6
10a1e7ac-2036-4783-9cc5-d2ca5b735930	8b794eae-487b-4129-b405-b394fdc0c90b
10a1e7ac-2036-4783-9cc5-d2ca5b735930	a4f513cf-c538-46a0-acb5-0c4ce8f465a5
10a1e7ac-2036-4783-9cc5-d2ca5b735930	fe59e41f-1f49-45fc-a345-03fd953bf9ff
4829b22c-9421-4856-a40e-944dc8fcef4d	75d30a74-23f8-4197-8d9d-014cef9ff5c6
4829b22c-9421-4856-a40e-944dc8fcef4d	8b794eae-487b-4129-b405-b394fdc0c90b
4829b22c-9421-4856-a40e-944dc8fcef4d	a4f513cf-c538-46a0-acb5-0c4ce8f465a5
4829b22c-9421-4856-a40e-944dc8fcef4d	fe59e41f-1f49-45fc-a345-03fd953bf9ff
8dbe00f5-ecf9-44a9-aaa0-90643893e8a4	68a45cee-eb4e-407e-b8d5-d54a7bb06ee6
8dbe00f5-ecf9-44a9-aaa0-90643893e8a4	a4f513cf-c538-46a0-acb5-0c4ce8f465a5
c43d0841-8d74-47a2-9e53-f38ea56b6165	3a9bca2c-ad7a-4ed6-839d-d6935a2d6e5b
c43d0841-8d74-47a2-9e53-f38ea56b6165	75d30a74-23f8-4197-8d9d-014cef9ff5c6
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
10a1e7ac-2036-4783-9cc5-d2ca5b735930	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	49283	A6:F1:CF:48
4829b22c-9421-4856-a40e-944dc8fcef4d	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	49141	93:57:D8:0B
8dbe00f5-ecf9-44a9-aaa0-90643893e8a4	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	49286	35:4E:AC:A5
c43d0841-8d74-47a2-9e53-f38ea56b6165	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	49232	03:3D:93:0D
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
0878170f-3760-425f-8d99-15b217707baf	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	35f31148-32a6-4bce-95a2-5d0f54c464e6	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
1ea35c35-d734-4db9-8a46-8a22dd43afa7	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	025148a8-a527-42d1-8705-18c5409a795e	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
3cec1c6d-274b-4bc3-bafa-b9e30f872415	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	37bfafd9-15f0-4393-99d7-21eadf2aee9d	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
4b687c40-e8aa-41c9-b6dc-673ce53aef05	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8ebbf174-e3f3-425b-9229-7d4c9624b0e1	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
50caeb26-3c9b-44f2-b897-69f8705205dc	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	893755b1-6b3d-4a2d-b234-801f61cd0dd6	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
570f92cb-8285-4cf7-8495-83a0219c361b	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	969a7a18-a3b4-41b1-a104-824f1a1ff26a	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
6c062365-e010-4c52-9423-16617133dc68	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1ee1adb6-a154-43d1-8511-af77ca543e51	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
70cb555e-dad5-42c0-a60f-73e44741d787	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	198840f5-30cc-4ef8-82f0-cc5f6bb864dd	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
7894afee-00b2-46b7-9787-98aa86353f66	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	db397fcf-d4f6-4a99-9e8b-9c0119788c4e	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
92288348-1de3-47bf-bd70-a89959932dc5	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b793ace8-455a-405e-88de-3a992260cfdc	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
a106ebd1-9cdc-416c-9d09-46484c859a22	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d8972d21-0e86-4cc7-a2dd-769069a0d194	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
a15eb20b-b872-4233-821d-c5e60bff89f2	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1dc32b43-a6a6-4a76-9ca5-1e413affee45	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
a6da45bf-8a4b-4a0e-b673-dafdeb14f65a	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b310f6dd-3c04-47da-9050-96a6812637af	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
a87962d1-6571-4a3f-95f8-73054b626099	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d156510f-3334-426f-b9a1-ced25a173a66	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
ae48324e-1f7d-4438-a7c8-bd63daf1c705	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	80ce6f39-5776-4bf3-a0cf-1021f9051a40	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
db19665c-31ff-4b2e-8dee-06012140b7cf	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	88bd5ec5-6cb9-4f03-a3f4-47cbf46ada32	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
db8ad582-5883-412e-ba62-a8850d9b2d94	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2b92618f-78dd-4bfd-ace1-81a818e84038	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
f6dad24e-325a-483f-b264-161c17023a92	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d97edbcf-acff-4557-a85c-6b8ae5901698	\N	dfbdedbb-cac7-4316-b996-a30315e8010b	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
3428e146-fe3b-4921-8ab8-3664f44816c5	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	03ada29e-7fbd-4208-9c89-134af764500d	\N
386ad2e5-fe6f-4bec-94ae-d4c763c3cc6e	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	03ada29e-7fbd-4208-9c89-134af764500d	\N
a0eff566-0288-4372-89db-8817c1f709d9	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	03ada29e-7fbd-4208-9c89-134af764500d	\N
303b9af8-ef53-4be4-b077-cc770230a457	1	12:10:00	13:10:00	13:20:00	13:50:00	c0a71ff7-9853-428e-b104-9323469b6edb	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
3a9bca2c-ad7a-4ed6-839d-d6935a2d6e5b	3600	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	3600
68a45cee-eb4e-407e-b8d5-d54a7bb06ee6	3510	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	3510
75d30a74-23f8-4197-8d9d-014cef9ff5c6	3610	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	3610
8b794eae-487b-4129-b405-b394fdc0c90b	3550	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	3550
a4f513cf-c538-46a0-acb5-0c4ce8f465a5	3500	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	3500
fe59e41f-1f49-45fc-a345-03fd953bf9ff	3690	\N	d035d4df-9d78-4cf4-8ec8-844a1dbfc731	3690
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
457aec14-9cee-435c-90cb-51e6d5ea5638	Сварочный цех	50	050
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

