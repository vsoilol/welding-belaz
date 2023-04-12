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
e5510e42-a02d-42e5-abdb-953a41ec15a1	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
f0128967-beba-4972-9fd1-8a8c8954d39a	3bed6d2d-b743-4470-8f1c-f118f229eef8	add8721e-dea9-4b01-82ec-112694ef30a0	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
fe39fbd3-0299-4724-8ec6-dec5cbb5ff0f	1	10	t	e5510e42-a02d-42e5-abdb-953a41ec15a1	\N
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
05cf797b-8b29-468a-b5f2-cfa92c5166c6	Изменение режимов, смена инструмента, приспособления	\N
0d4ef989-c851-4720-9e66-38d3d8e61a0b	Сборочные операции	\N
1032c0ec-f714-409c-a7bb-41c55e75af33	Установка, выверка, снятие детали	\N
111b643d-ef38-424d-a89d-0e144c28f996	Отсутствие конструктора, технолога или ожидание его решения	\N
1cd7a437-9bce-40d1-9c99-d83a8600169c	Отсутствие заданий	\N
20b40025-0b9a-4eea-915c-4eb496402e71	Контроль на рабочем месте	\N
226cec3e-6f7f-471d-96cc-ab4b09d6d126	Отсутствие крана, транспорта	\N
2ca79bc4-d78f-4b30-9cb6-e4bce38c9b37	Неявка оператора (б/лист, отпуск, и пр.)	\N
35690b9c-35c3-46fc-a2b3-770edf76dc71	Отсутствие оператора в связи с необеспеченностью	\N
46426d2f-72f7-4dd8-a784-bb00f02a2490	Ознакомление с работой, документацией, инструктаж	\N
5ee24f8b-56bd-4acf-b7a8-725644da0db5	Плановый ремонт централизованными службами	\N
610e9972-647d-43d1-b3b5-f091aef4a45d	Установка, выверка, снятие детали	\N
63cd9c74-ebd5-4fb4-96c3-e8872cc93593	Обед	\N
6edcfe5a-1a94-414b-b89b-4d3ef0cbdd3e	Работа с управляющей программой	\N
6f5f393f-ca91-4203-b264-9fe2a842ea56	Отсутствие материала, заготовок, деталей	\N
7307f114-fb8e-4917-8046-9b4f0be93877	Отсутствие сотрудника ОТК	\N
7c37e468-3f1f-486e-8c80-40ab2ee093a0	Работа по карте несоответствий	\N
8e4a94bb-6a90-42f2-9269-e8ddeecbac56	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
a6f93742-33c3-40f1-a8a2-794c7093571d	Отсутствие энергоносителей	\N
b7f781bb-5bf5-4976-ab3a-bfc50351c0b2	Праздники и выходные	\N
c002a0d9-443d-443f-adac-770041f1d74b	Естественные надобности	\N
cc7cd5e9-72af-4c30-8a78-325daeb4934d	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
ec023282-4fab-41cc-93dc-4ef3845847e8	Нерабочее время по графику согласно сменности	\N
ff8890e6-786c-44c5-a48c-1cec7e1b649e	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
fffaa8ec-ef0f-4fbf-8ebb-0d16ec8a02ad	Аварийный ремонт централизованными службами	\N
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
9de63f4d-b5ee-49c6-a945-acd47104619f	2cdd75e2-ad46-4d25-a246-4fcb0c614913	249550
af6246f4-a6dc-4816-9bb8-363e63c87eef	ca3ea6f3-17b3-42e3-a627-dc079afa3402	219379
28d5bc13-d290-49ee-9d8f-afee2e6142d7	71217069-904b-4302-8150-ef84bdf4c166	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	c0c2b719-25a7-4108-8aaf-63f841c748ee	610422
5462ef0c-4c51-44b2-9afd-54ecc1f40f42	29aa8239-b373-4425-b319-20383bbdc4a0	614962
74179ed3-a57f-439d-97ed-2e717bf13b75	ef4d01eb-69ee-4bc7-ba6f-6b95cfd12da3	\N
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
89d3d3a3-5342-4698-a0d9-f0d68d13ed22	1723f3cd-2747-4d02-9915-495424c357eb
d1b96a91-0b8b-4eb4-9f04-918847df15f5	1723f3cd-2747-4d02-9915-495424c357eb
ddf59d5c-dabd-48b0-b205-24267868291f	1723f3cd-2747-4d02-9915-495424c357eb
ea8034e9-9812-4456-b4d2-739d9ceddec8	1723f3cd-2747-4d02-9915-495424c357eb
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
89d3d3a3-5342-4698-a0d9-f0d68d13ed22	3	2	2023-03-12 00:00:00	9740590b-d594-4ab9-b84b-c09e246dca8e	\N
d1b96a91-0b8b-4eb4-9f04-918847df15f5	2	2	2023-03-12 00:00:00	846148cc-5b8c-4df5-aa7f-7dd7ad542f76	\N
ddf59d5c-dabd-48b0-b205-24267868291f	4	2	2023-03-12 00:00:00	b96c4fb0-114c-4a58-b3c8-259774652a7b	\N
ea8034e9-9812-4456-b4d2-739d9ceddec8	1	2	2023-03-12 00:00:00	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b96c4fb0-114c-4a58-b3c8-259774652a7b	846148cc-5b8c-4df5-aa7f-7dd7ad542f76
1250e363-2bce-4ae0-8cdf-9e50e7cfadea	9740590b-d594-4ab9-b84b-c09e246dca8e
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
14788414-d8ce-4bab-8857-a392bf82e7e2	0	3	\N	\N	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
1575fa84-7394-4344-9afb-c356b70e814c	0	2	\N	\N	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
279fe12e-292f-40e0-bea1-a3af5ba73b14	0	3	\N	\N	ddf59d5c-dabd-48b0-b205-24267868291f	\N
5c131a52-f57e-4a6b-8cf2-38bfbebc5c89	0	2	\N	\N	d1b96a91-0b8b-4eb4-9f04-918847df15f5	\N
64ed983d-beb5-4705-9e94-ae205d17dbea	0	3	\N	\N	d1b96a91-0b8b-4eb4-9f04-918847df15f5	\N
72aa068a-bf05-4e92-9d90-a4c53c5e4240	0	1	\N	\N	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
76c8bd49-e5e5-4773-b4c3-f437e4776275	0	1	\N	\N	89d3d3a3-5342-4698-a0d9-f0d68d13ed22	\N
9b0665de-4f97-47e7-b233-1735af84ee54	0	3	\N	\N	89d3d3a3-5342-4698-a0d9-f0d68d13ed22	\N
ac678927-65c5-44e8-8d85-f24e75fdf0e2	0	1	\N	\N	ddf59d5c-dabd-48b0-b205-24267868291f	\N
c7fce850-fbf9-4049-9378-5bea640f37df	0	2	\N	\N	ddf59d5c-dabd-48b0-b205-24267868291f	\N
e4e6d2be-c812-4d12-b781-e691de50c7fb	0	2	\N	\N	89d3d3a3-5342-4698-a0d9-f0d68d13ed22	\N
e6ae9b4d-a19a-4e03-95a5-a11666717bf2	0	1	\N	\N	d1b96a91-0b8b-4eb4-9f04-918847df15f5	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
4c416c37-b203-46dc-9516-3a4677c7c9d1	Сборка, сварка рам к/с г/п 120-130 т.	6	add8721e-dea9-4b01-82ec-112694ef30a0	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
1250e363-2bce-4ae0-8cdf-9e50e7cfadea	Рама	75131-2800010-70	t	1	ec0d8c14-f65a-43c6-82f6-94f2efa46c7a	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N	\N	4536479362
846148cc-5b8c-4df5-aa7f-7dd7ad542f76	Поперечина рамы задняя	75131-2801300-20	t	2	83931ee4-4f47-4ddc-b1c9-b712b564b452	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N	\N	\N
9740590b-d594-4ab9-b84b-c09e246dca8e	Поперечина рамы задняя	75131-2801300-20	t	2	ec0d8c14-f65a-43c6-82f6-94f2efa46c7a	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N	\N	\N
b96c4fb0-114c-4a58-b3c8-259774652a7b	Рама	7513D-2800010-20	t	1	83931ee4-4f47-4ddc-b1c9-b712b564b452	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N	\N	4536492774
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
9b130396-61d1-4a18-99c3-8fa21446d134	Admin	\N
98489df4-44c0-4b6d-8023-8311a0605ccd	Master	\N
6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4	Welder	\N
e26e32d9-c899-4237-be34-9019629bf0b4	Inspector	\N
1e5c7adb-c3b2-47bb-ae2f-1e582466ca88	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
13476012-72ea-4360-a32a-a5f67a3cd054	2023-03-12 00:00:00	76efa8b8-b642-4caa-b50c-10027d7008c9	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
23c6c82a-027a-4ab9-9477-8db256394797	2023-03-12 00:00:00	e54a9249-6a2c-4330-a249-1b23b943ae4c	d1b96a91-0b8b-4eb4-9f04-918847df15f5	\N
30b3ae9f-777e-43fe-846b-f499d0a00fa6	2023-03-12 00:00:00	c88a5200-7c8d-44ca-a2bc-7e2a80331eb3	d1b96a91-0b8b-4eb4-9f04-918847df15f5	\N
47b819fd-c135-4659-b1ad-451088e44e2e	2023-03-12 00:00:00	53d763ec-00b9-4d2b-983e-6ad951626211	d1b96a91-0b8b-4eb4-9f04-918847df15f5	\N
4c521290-30c9-4d15-9ad5-37dd45954c54	2023-03-12 00:00:00	4a7d179c-1e66-4187-9c22-eee0a25650fd	ddf59d5c-dabd-48b0-b205-24267868291f	\N
4fff04ef-807e-4b9e-809b-7c47559fb017	2023-03-12 00:00:00	fd2f8cf3-07c9-4f2d-a967-b3c4e25caee2	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
640055c7-9192-42dd-9872-f409e7243dd2	2023-03-12 00:00:00	c6abd5ac-78bc-4b46-a06b-2324b382819d	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
81ea0823-0943-463b-906d-6092dc93bef3	2023-03-12 00:00:00	b9c2bf21-6823-47cf-833e-00425ee438e2	89d3d3a3-5342-4698-a0d9-f0d68d13ed22	\N
92945d1f-5534-4e36-82a4-e745b00e375e	2023-03-12 00:00:00	993b2de1-91f9-4c48-9d28-5d4142f02a7a	89d3d3a3-5342-4698-a0d9-f0d68d13ed22	\N
964dcff1-2181-449d-b80e-868347d32ed2	2023-03-12 00:00:00	b4e148c7-7e38-4977-82af-f99f85629dd5	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
9dd7fa55-2a73-458a-a406-983f41a7097f	2023-03-12 00:00:00	ad7dbe2b-d3d0-4c76-841f-92053b6f77ef	ddf59d5c-dabd-48b0-b205-24267868291f	\N
aafbcc84-5d75-40b9-afc8-ba3bcedc8ddd	2023-03-12 00:00:00	72f21f3c-0911-41e9-bda1-60dd5d524129	ddf59d5c-dabd-48b0-b205-24267868291f	\N
bbfba36d-9f94-4922-b483-79fad0953559	2023-03-12 00:00:00	8850a5b1-27d5-4b7f-8ce5-cf52b0638d2f	ddf59d5c-dabd-48b0-b205-24267868291f	\N
e4899e1d-0a01-4d18-b265-6a7410cfa399	2023-03-12 00:00:00	2eb427ae-5096-4c66-a346-8457b58be7fc	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
eb2195c3-d553-422d-8345-5165c5cf949c	2023-03-12 00:00:00	379f589d-09f0-4c31-a187-b2a174d284e8	ea8034e9-9812-4456-b4d2-739d9ceddec8	\N
ef0d4a14-332b-442e-a45c-7651dbac8ca9	2023-03-12 00:00:00	81bf0141-cce0-4858-870c-4f68ee8edc53	ddf59d5c-dabd-48b0-b205-24267868291f	\N
f45d58c6-5b72-4e58-a776-a687465dee18	2023-03-12 00:00:00	a8b7ac7d-d9ea-439d-b54c-a68d4a5e07bb	89d3d3a3-5342-4698-a0d9-f0d68d13ed22	\N
f5ea7896-3da3-4027-960e-c727aeb8ed31	2023-03-12 00:00:00	ecf10add-5bcc-4e42-a555-4fb2109617a1	ddf59d5c-dabd-48b0-b205-24267868291f	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
11023b8b-338c-4b30-8490-fe6b51fc36bb	0	3	\N	\N	e4899e1d-0a01-4d18-b265-6a7410cfa399	\N
1b87bda2-cbfd-46a2-a619-0d3b94586aa6	0	3	\N	\N	640055c7-9192-42dd-9872-f409e7243dd2	\N
1cd703e2-ae43-4007-aa89-9ce2a10b3969	0	2	\N	\N	81ea0823-0943-463b-906d-6092dc93bef3	\N
1e8644b6-881b-460a-be27-964bac3a69ce	0	2	\N	\N	f5ea7896-3da3-4027-960e-c727aeb8ed31	\N
1e9b3797-610e-49c0-8220-f92f77e6eaf1	0	2	\N	\N	4fff04ef-807e-4b9e-809b-7c47559fb017	\N
21f1073f-227e-4dcb-a4c1-bbbc23f149fd	0	3	\N	\N	bbfba36d-9f94-4922-b483-79fad0953559	\N
2565412b-c446-456d-8433-d863ed476b7c	0	2	\N	\N	23c6c82a-027a-4ab9-9477-8db256394797	\N
294593b3-3ca8-4d82-9d3e-cbf2727b52c4	0	2	\N	\N	bbfba36d-9f94-4922-b483-79fad0953559	\N
33f44eb9-a6ca-497a-8752-331f4564ff3a	0	3	\N	\N	4c521290-30c9-4d15-9ad5-37dd45954c54	\N
34c0f7a6-617f-4303-b60d-961ff6ed2093	0	3	\N	\N	ef0d4a14-332b-442e-a45c-7651dbac8ca9	\N
3ea15021-4519-44de-8613-7bfbbdb7528b	0	2	\N	\N	e4899e1d-0a01-4d18-b265-6a7410cfa399	\N
4336d9d3-e833-4046-9312-d1b6f56cb36f	0	2	\N	\N	4c521290-30c9-4d15-9ad5-37dd45954c54	\N
43ddfcef-6b30-46fe-8c9f-2dcf96c83bed	0	3	\N	\N	4fff04ef-807e-4b9e-809b-7c47559fb017	\N
444b3e0d-cb1f-4e1f-886d-6f481121f688	0	3	\N	\N	964dcff1-2181-449d-b80e-868347d32ed2	\N
56e580b5-0c2a-472c-a5ad-20eb8731663e	0	2	\N	\N	ef0d4a14-332b-442e-a45c-7651dbac8ca9	\N
5ecd0c00-01e3-463c-9e0a-83e7112e8176	0	3	\N	\N	f5ea7896-3da3-4027-960e-c727aeb8ed31	\N
6311ee77-678d-4148-ac64-b0de01f954d9	0	2	\N	\N	eb2195c3-d553-422d-8345-5165c5cf949c	\N
66f7fc4d-5231-4f99-9ab9-a5a33f98c29c	0	3	\N	\N	9dd7fa55-2a73-458a-a406-983f41a7097f	\N
6d021820-2fff-4112-927c-f28090cc4bb9	0	2	\N	\N	f45d58c6-5b72-4e58-a776-a687465dee18	\N
79ae7472-baf9-439a-853e-3c4b1849695e	0	2	\N	\N	640055c7-9192-42dd-9872-f409e7243dd2	\N
8a63f7aa-5e77-4e3b-9abd-c7491b8aa484	0	3	\N	\N	13476012-72ea-4360-a32a-a5f67a3cd054	\N
8fe86270-17d2-4f5b-af1e-fb91850837f9	0	3	\N	\N	92945d1f-5534-4e36-82a4-e745b00e375e	\N
91cc9196-a790-423f-8ae8-e307660b4f93	0	3	\N	\N	81ea0823-0943-463b-906d-6092dc93bef3	\N
9515ee3a-618b-4252-a5e9-243ab50d7899	0	3	\N	\N	eb2195c3-d553-422d-8345-5165c5cf949c	\N
9bfed0a3-a726-4251-b51d-95a7c140a483	0	3	\N	\N	aafbcc84-5d75-40b9-afc8-ba3bcedc8ddd	\N
ad00808c-e293-48d8-add8-6a9f878c9c9d	0	2	\N	\N	47b819fd-c135-4659-b1ad-451088e44e2e	\N
b6ad8b0a-d9ea-4351-a1a7-67ad5f2d3230	0	2	\N	\N	92945d1f-5534-4e36-82a4-e745b00e375e	\N
bdacd180-47e2-4052-b3f4-fefae5828735	0	2	\N	\N	13476012-72ea-4360-a32a-a5f67a3cd054	\N
be07a85e-91d7-41b8-aa5e-34f8838206b1	0	3	\N	\N	47b819fd-c135-4659-b1ad-451088e44e2e	\N
c682e4a1-a464-404f-bf88-063ca078901a	0	3	\N	\N	30b3ae9f-777e-43fe-846b-f499d0a00fa6	\N
c9468912-a691-4a93-9001-9d2f18a4c214	0	2	\N	\N	964dcff1-2181-449d-b80e-868347d32ed2	\N
ca8098dd-8d38-448a-a355-bbd3e01cd313	0	2	\N	\N	aafbcc84-5d75-40b9-afc8-ba3bcedc8ddd	\N
cb15ee00-4322-469c-8a76-dc316bf7eb94	0	2	\N	\N	9dd7fa55-2a73-458a-a406-983f41a7097f	\N
edbfac8c-ec7a-4f50-a19a-839a12925b56	0	3	\N	\N	f45d58c6-5b72-4e58-a776-a687465dee18	\N
f4982b5e-ed84-440a-98af-844da6f03448	0	2	\N	\N	30b3ae9f-777e-43fe-846b-f499d0a00fa6	\N
fafe5de9-674d-4c10-91d5-ab960a0d88db	0	3	\N	\N	23c6c82a-027a-4ab9-9477-8db256394797	\N
0a434704-d630-4721-af59-33ca56879be2	2	1	\N	\N	4fff04ef-807e-4b9e-809b-7c47559fb017	\N
147a46e2-54c6-43df-910e-fc73a5f37596	2	1	\N	\N	92945d1f-5534-4e36-82a4-e745b00e375e	\N
19ce25f1-2f24-47e3-aba1-4a9244085f3d	2	1	\N	\N	eb2195c3-d553-422d-8345-5165c5cf949c	\N
2711ba4a-cbe3-47b7-bbf7-66e94abbfe03	2	1	\N	\N	9dd7fa55-2a73-458a-a406-983f41a7097f	\N
27386e94-a450-4422-8673-4077b91dfe1e	2	1	\N	\N	23c6c82a-027a-4ab9-9477-8db256394797	\N
27aa1032-fa63-40f5-ab46-3e3bcef0ebe0	2	1	\N	\N	47b819fd-c135-4659-b1ad-451088e44e2e	\N
3cc555b0-79e9-45ea-ba95-4e387d9ba802	2	1	\N	\N	640055c7-9192-42dd-9872-f409e7243dd2	\N
403147cb-8f12-43ca-a419-de38dd1b0a12	2	1	\N	\N	964dcff1-2181-449d-b80e-868347d32ed2	\N
53e84ba3-4e3b-4c7e-a500-ee7d9807410b	2	1	\N	\N	f45d58c6-5b72-4e58-a776-a687465dee18	\N
6006259a-8e8b-4865-92c7-f990fe7595fa	2	1	\N	\N	81ea0823-0943-463b-906d-6092dc93bef3	\N
73514829-6db0-41dc-b76e-384aadb299bf	2	1	\N	\N	aafbcc84-5d75-40b9-afc8-ba3bcedc8ddd	\N
7b40126a-ccb4-405f-a1f5-953a1bc2ed58	2	1	\N	\N	bbfba36d-9f94-4922-b483-79fad0953559	\N
9333c8e9-30ab-4f51-95fa-41d814f51716	2	1	\N	\N	4c521290-30c9-4d15-9ad5-37dd45954c54	\N
c251dd3b-7c04-41c0-b73c-075bd7d5cd0a	2	1	\N	\N	e4899e1d-0a01-4d18-b265-6a7410cfa399	\N
c82000df-5ef5-4235-878f-8c5d87a6060f	2	1	\N	\N	30b3ae9f-777e-43fe-846b-f499d0a00fa6	\N
f3d43b91-546a-4a79-bbe8-12ec2791710d	2	1	\N	\N	f5ea7896-3da3-4027-960e-c727aeb8ed31	\N
f467f478-2b55-433b-932d-4d78ed432db5	2	1	\N	\N	13476012-72ea-4360-a32a-a5f67a3cd054	\N
f6227213-32c5-49ed-97a7-f70fbf7a5d70	2	1	\N	\N	ef0d4a14-332b-442e-a45c-7651dbac8ca9	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
2eb427ae-5096-4c66-a346-8457b58be7fc	58	900	t	f	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	90e6af42-0c1c-47c2-9a85-672132137f3e	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
379f589d-09f0-4c31-a187-b2a174d284e8	39	280	t	f	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	5db00eb5-3795-453d-a8a7-ef84fdd399fd	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
4a7d179c-1e66-4187-9c22-eee0a25650fd	54	400	t	f	b96c4fb0-114c-4a58-b3c8-259774652a7b	de1233e0-6cf0-428d-9575-133b40269516	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
53d763ec-00b9-4d2b-983e-6ad951626211	1	1900	t	f	846148cc-5b8c-4df5-aa7f-7dd7ad542f76	b58e036a-9916-4b34-bf5e-cddc24f76f0b	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
72f21f3c-0911-41e9-bda1-60dd5d524129	58	900	t	f	b96c4fb0-114c-4a58-b3c8-259774652a7b	90e6af42-0c1c-47c2-9a85-672132137f3e	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
76efa8b8-b642-4caa-b50c-10027d7008c9	55	400	t	f	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	eb9950a0-7d81-4a2a-b73c-ab2e2f5f5c88	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
81bf0141-cce0-4858-870c-4f68ee8edc53	57	400	t	f	b96c4fb0-114c-4a58-b3c8-259774652a7b	40b82644-bd2a-4027-b9dd-bea8a7cee06a	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
8850a5b1-27d5-4b7f-8ce5-cf52b0638d2f	18	4000	t	f	b96c4fb0-114c-4a58-b3c8-259774652a7b	aa0051ce-d052-447d-a84c-db5b1294ea28	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
993b2de1-91f9-4c48-9d28-5d4142f02a7a	2	1880	t	f	9740590b-d594-4ab9-b84b-c09e246dca8e	69a0fc04-b0e0-42ad-ba43-06b6addde18e	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
a8b7ac7d-d9ea-439d-b54c-a68d4a5e07bb	1	1900	t	f	9740590b-d594-4ab9-b84b-c09e246dca8e	b58e036a-9916-4b34-bf5e-cddc24f76f0b	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
ad7dbe2b-d3d0-4c76-841f-92053b6f77ef	55	400	t	f	b96c4fb0-114c-4a58-b3c8-259774652a7b	eb9950a0-7d81-4a2a-b73c-ab2e2f5f5c88	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
b4e148c7-7e38-4977-82af-f99f85629dd5	18	4000	t	f	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	aa0051ce-d052-447d-a84c-db5b1294ea28	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
b9c2bf21-6823-47cf-833e-00425ee438e2	52	1200	t	f	9740590b-d594-4ab9-b84b-c09e246dca8e	3cfcae76-3ba3-4724-a9c1-300373bf7b11	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
c6abd5ac-78bc-4b46-a06b-2324b382819d	54	400	t	f	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	de1233e0-6cf0-428d-9575-133b40269516	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
c88a5200-7c8d-44ca-a2bc-7e2a80331eb3	2	1880	t	f	846148cc-5b8c-4df5-aa7f-7dd7ad542f76	69a0fc04-b0e0-42ad-ba43-06b6addde18e	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
e54a9249-6a2c-4330-a249-1b23b943ae4c	52	1200	t	f	846148cc-5b8c-4df5-aa7f-7dd7ad542f76	3cfcae76-3ba3-4724-a9c1-300373bf7b11	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
ecf10add-5bcc-4e42-a555-4fb2109617a1	39	280	t	f	b96c4fb0-114c-4a58-b3c8-259774652a7b	5db00eb5-3795-453d-a8a7-ef84fdd399fd	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
fd2f8cf3-07c9-4f2d-a967-b3c4e25caee2	57	400	t	f	1250e363-2bce-4ae0-8cdf-9e50e7cfadea	40b82644-bd2a-4027-b9dd-bea8a7cee06a	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
3cfcae76-3ba3-4724-a9c1-300373bf7b11	52	Инструкция 52	52
40b82644-bd2a-4027-b9dd-bea8a7cee06a	57	Инструкция 57	57
5db00eb5-3795-453d-a8a7-ef84fdd399fd	39	Инструкция 39	39
69a0fc04-b0e0-42ad-ba43-06b6addde18e	2	Инструкция 2	2
8c5d90f0-6b3d-4f98-9c38-bf53c771ab47	56	Инструкция 56	56
90e6af42-0c1c-47c2-9a85-672132137f3e	58	Инструкция 58	58
aa0051ce-d052-447d-a84c-db5b1294ea28	18	Инструкция 18	18
b58e036a-9916-4b34-bf5e-cddc24f76f0b	1	Инструкция 1	1
d6892e37-47a6-4eb3-9e96-d50b3a306449	48	Инструкция 48	48
de1233e0-6cf0-428d-9575-133b40269516	54	Инструкция 54	54
eb9950a0-7d81-4a2a-b73c-ab2e2f5f5c88	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
1148bcd4-f3e2-4bf7-851b-d28359d3ea39	75131-2801300-20	Поперечина рамы задняя	\N	2868425
83931ee4-4f47-4ddc-b1c9-b712b564b452	7513D-2800010-20	Рама	\N	3330041
ec0d8c14-f65a-43c6-82f6-94f2efa46c7a	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
2cdd75e2-ad46-4d25-a246-4fcb0c614913	e26e32d9-c899-4237-be34-9019629bf0b4
ca3ea6f3-17b3-42e3-a627-dc079afa3402	e26e32d9-c899-4237-be34-9019629bf0b4
29aa8239-b373-4425-b319-20383bbdc4a0	98489df4-44c0-4b6d-8023-8311a0605ccd
c0c2b719-25a7-4108-8aaf-63f841c748ee	98489df4-44c0-4b6d-8023-8311a0605ccd
291716d8-64e9-466d-b82a-d84f7a9946a9	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
459959eb-4280-40a3-a2f0-15f07e149be5	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
45dc7f6c-ea92-42af-a23b-577869479dd7	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
54a087fc-c6bd-4452-b49a-a094fd00690b	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
7a668df2-b8ab-42ad-877f-30396fa62e44	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
9b86b654-c885-4612-9a7a-7086701b9ff1	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
c7253e1b-8ba5-4a44-8bbf-bde36d05137c	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
ed985741-9e01-4e88-a5fc-598ff24f4e69	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
3bed6d2d-b743-4470-8f1c-f118f229eef8	1e5c7adb-c3b2-47bb-ae2f-1e582466ca88
cd8102c8-d6be-4b3a-92af-c9ca5206cac1	9b130396-61d1-4a18-99c3-8fa21446d134
bc5d7123-9cbe-447e-b322-bc2becb2d3ba	6dca8a8f-f27a-4c1f-bffd-5e4b64a643e4
71217069-904b-4302-8150-ef84bdf4c166	e26e32d9-c899-4237-be34-9019629bf0b4
84c83e22-bf8f-4dd2-b3da-1718a7b7f2cb	1e5c7adb-c3b2-47bb-ae2f-1e582466ca88
ef4d01eb-69ee-4bc7-ba6f-6b95cfd12da3	98489df4-44c0-4b6d-8023-8311a0605ccd
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
2cdd75e2-ad46-4d25-a246-4fcb0c614913	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
ca3ea6f3-17b3-42e3-a627-dc079afa3402	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
29aa8239-b373-4425-b319-20383bbdc4a0	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
c0c2b719-25a7-4108-8aaf-63f841c748ee	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
291716d8-64e9-466d-b82a-d84f7a9946a9	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	17:CD:7F:5A
459959eb-4280-40a3-a2f0-15f07e149be5	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	27:45:7E:B4
45dc7f6c-ea92-42af-a23b-577869479dd7	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	D7:F1:7D:5A
54a087fc-c6bd-4452-b49a-a094fd00690b	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	D7:95:55:B4
7a668df2-b8ab-42ad-877f-30396fa62e44	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	67:CD:7E:5A
9b86b654-c885-4612-9a7a-7086701b9ff1	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	67:5A:70:B4
c7253e1b-8ba5-4a44-8bbf-bde36d05137c	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	97:17:60:B4
ed985741-9e01-4e88-a5fc-598ff24f4e69	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	B7:5A:79:B5
3bed6d2d-b743-4470-8f1c-f118f229eef8	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
cd8102c8-d6be-4b3a-92af-c9ca5206cac1	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$DHkcjp1KbEMd2bub4tqHW22SlT+uwrjBMhksJNacBXq3zu79	\N	\N	\N	\N	\N	\N
bc5d7123-9cbe-447e-b322-bc2becb2d3ba	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$BdeP86lYmUbv4maeondswRhaaiw2sVKAhc+HszeOWn2D22lz	\N	\N	\N	\N	\N	\N
71217069-904b-4302-8150-ef84bdf4c166	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$7QGXp1DkdLSdah9DF2IxetOW0SfSVqlcUbf4yWe4bgVTTToe	\N	\N	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
84c83e22-bf8f-4dd2-b3da-1718a7b7f2cb	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$TwLOXw4ScMeoAFcdFX28rwAFJbpOCdH4gy3RF0s1y232AKIG	\N	\N	\N	\N	\N	\N
ef4d01eb-69ee-4bc7-ba6f-6b95cfd12da3	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$OXO8UY9KyA0d9AjSMgqR/yAAnKWO0hhhU0868LVP5XypZ+Cw	\N	\N	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
08ea1f66-dd5f-4d83-8c6e-84ee41da9e09	1	Корневой	200	270	23	26	\N	\N	69a0fc04-b0e0-42ad-ba43-06b6addde18e	\N
099860ac-d14d-44a7-a3e2-3649006d2336	2	Заполняющий	270	310	23	26	\N	\N	3cfcae76-3ba3-4724-a9c1-300373bf7b11	\N
179a68ad-39ea-4058-a2cd-94618f4e3299	1	Корневой	200	270	23	26	\N	\N	5db00eb5-3795-453d-a8a7-ef84fdd399fd	\N
213e9d88-191c-43a4-9def-8e53871aeef2	1	Корневой	200	270	23	26	\N	\N	d6892e37-47a6-4eb3-9e96-d50b3a306449	\N
37e8285a-d87e-4f0a-ab26-c1e15c0729f0	2	Заполняющий	270	310	23	26	\N	\N	69a0fc04-b0e0-42ad-ba43-06b6addde18e	\N
3821a04c-c4ba-4356-849a-e1ceff15ef08	2	Заполняющий	270	310	23	26	\N	\N	40b82644-bd2a-4027-b9dd-bea8a7cee06a	\N
4a7fcba1-dcb1-4b46-95f6-aa734a394308	2	Заполняющий	270	310	23	26	\N	\N	d6892e37-47a6-4eb3-9e96-d50b3a306449	\N
55d11d1c-30a7-48b0-87c1-7a522732781e	1	Корневой	200	270	23	26	\N	\N	90e6af42-0c1c-47c2-9a85-672132137f3e	\N
5948abb2-f77e-4c64-a327-1e3cd536ff59	1	Корневой	200	270	23	26	\N	\N	aa0051ce-d052-447d-a84c-db5b1294ea28	\N
62333f29-2da6-4ac9-9ab3-443ce73e3151	1	Корневой	200	270	23	26	\N	\N	eb9950a0-7d81-4a2a-b73c-ab2e2f5f5c88	\N
6505d00d-d969-4c41-b37d-5892aa5daa04	2	Заполняющий	270	310	23	26	\N	\N	5db00eb5-3795-453d-a8a7-ef84fdd399fd	\N
6daa519a-844b-4503-9a92-2836443af6ed	1	Корневой	200	270	23	26	\N	\N	de1233e0-6cf0-428d-9575-133b40269516	\N
728270e2-9b2a-48fc-9d56-f93df2215057	2	Заполняющий	270	310	23	26	\N	\N	de1233e0-6cf0-428d-9575-133b40269516	\N
90f4d4a5-6c60-44bc-99d9-4a538448f17e	1	Корневой	200	270	23	26	\N	\N	b58e036a-9916-4b34-bf5e-cddc24f76f0b	\N
99672003-ee98-49c4-8708-33a7f88c8e7b	2	Заполняющий	270	310	23	26	\N	\N	8c5d90f0-6b3d-4f98-9c38-bf53c771ab47	\N
9c61af45-e052-470b-bf74-42a73ce732df	2	Заполняющий	270	310	23	26	\N	\N	b58e036a-9916-4b34-bf5e-cddc24f76f0b	\N
a2aeceb6-3a63-4f25-b69a-c2f87155eda4	1	Корневой	200	270	23	26	\N	\N	3cfcae76-3ba3-4724-a9c1-300373bf7b11	\N
cf308952-f310-4223-9424-dcab9d300936	2	Заполняющий	270	310	23	26	\N	\N	aa0051ce-d052-447d-a84c-db5b1294ea28	\N
d6e83346-fcbb-47b4-aeda-553c6438cdf1	2	Заполняющий	270	310	23	26	\N	\N	90e6af42-0c1c-47c2-9a85-672132137f3e	\N
dd16ff99-7d9f-491c-8d91-32929719b0a3	1	Корневой	200	270	23	26	\N	\N	40b82644-bd2a-4027-b9dd-bea8a7cee06a	\N
e5dd8bb0-0cba-4795-88e8-f9fda05d394d	1	Корневой	200	270	23	26	\N	\N	8c5d90f0-6b3d-4f98-9c38-bf53c771ab47	\N
fd500bfd-357f-4325-865d-616080703db3	2	Заполняющий	270	310	23	26	\N	\N	eb9950a0-7d81-4a2a-b73c-ab2e2f5f5c88	\N
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
3764aec0-18ee-4ea5-9b96-408d0c0f97cc	1da90153-972a-49fa-9ed1-971d842f5573
3764aec0-18ee-4ea5-9b96-408d0c0f97cc	3f97fd16-9290-4107-802d-2f9e407d5879
4cfb2ab6-15ec-46b7-9940-e80c2996eb31	39e5dd64-48b0-47f9-85ee-592b98772d54
931cb066-6063-44f3-9cef-182bfb7955f4	1723f3cd-2747-4d02-9915-495424c357eb
adcd44f6-6b10-42b2-89af-cc3975e02850	1da90153-972a-49fa-9ed1-971d842f5573
adcd44f6-6b10-42b2-89af-cc3975e02850	3f97fd16-9290-4107-802d-2f9e407d5879
b6dee452-ee09-4f1a-a27c-2023d3d40ce3	39e5dd64-48b0-47f9-85ee-592b98772d54
b98a073f-4426-4681-9ea4-36e60010c26d	1da90153-972a-49fa-9ed1-971d842f5573
b98a073f-4426-4681-9ea4-36e60010c26d	3f97fd16-9290-4107-802d-2f9e407d5879
df3d1732-f8ea-4b95-be42-2f8aabf3e913	1723f3cd-2747-4d02-9915-495424c357eb
e47a3e6f-2692-4aed-91dc-85fc1e8b410b	1da90153-972a-49fa-9ed1-971d842f5573
e47a3e6f-2692-4aed-91dc-85fc1e8b410b	3f97fd16-9290-4107-802d-2f9e407d5879
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
3764aec0-18ee-4ea5-9b96-408d0c0f97cc	c7253e1b-8ba5-4a44-8bbf-bde36d05137c	\N	150838
4cfb2ab6-15ec-46b7-9940-e80c2996eb31	54a087fc-c6bd-4452-b49a-a094fd00690b	\N	132695
931cb066-6063-44f3-9cef-182bfb7955f4	9b86b654-c885-4612-9a7a-7086701b9ff1	\N	117390
adcd44f6-6b10-42b2-89af-cc3975e02850	45dc7f6c-ea92-42af-a23b-577869479dd7	\N	114729
b6dee452-ee09-4f1a-a27c-2023d3d40ce3	7a668df2-b8ab-42ad-877f-30396fa62e44	\N	122575
b98a073f-4426-4681-9ea4-36e60010c26d	459959eb-4280-40a3-a2f0-15f07e149be5	\N	146164
df3d1732-f8ea-4b95-be42-2f8aabf3e913	ed985741-9e01-4e88-a5fc-598ff24f4e69	\N	121267
e47a3e6f-2692-4aed-91dc-85fc1e8b410b	291716d8-64e9-466d-b82a-d84f7a9946a9	\N	150882
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
1723f3cd-2747-4d02-9915-495424c357eb	c62c37c0-f0c0-4f35-be48-abd1aaeafcde
1723f3cd-2747-4d02-9915-495424c357eb	d30d744f-904b-4f23-9281-d4d9daf64db8
1da90153-972a-49fa-9ed1-971d842f5573	1045783e-ba1a-4184-bc85-540078d39cae
1da90153-972a-49fa-9ed1-971d842f5573	9228a19f-194c-4dd9-ba32-639bb89dd85d
1da90153-972a-49fa-9ed1-971d842f5573	b049b585-4db1-4cf7-b763-7e90bc4c95f4
1da90153-972a-49fa-9ed1-971d842f5573	d30d744f-904b-4f23-9281-d4d9daf64db8
39e5dd64-48b0-47f9-85ee-592b98772d54	9228a19f-194c-4dd9-ba32-639bb89dd85d
39e5dd64-48b0-47f9-85ee-592b98772d54	fb3709ce-75f2-4f53-8cc0-19c086901e42
3f97fd16-9290-4107-802d-2f9e407d5879	1045783e-ba1a-4184-bc85-540078d39cae
3f97fd16-9290-4107-802d-2f9e407d5879	9228a19f-194c-4dd9-ba32-639bb89dd85d
3f97fd16-9290-4107-802d-2f9e407d5879	b049b585-4db1-4cf7-b763-7e90bc4c95f4
3f97fd16-9290-4107-802d-2f9e407d5879	d30d744f-904b-4f23-9281-d4d9daf64db8
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
1723f3cd-2747-4d02-9915-495424c357eb	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	49232	03:3D:93:0D
1da90153-972a-49fa-9ed1-971d842f5573	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	49283	A6:F1:CF:48
39e5dd64-48b0-47f9-85ee-592b98772d54	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	49286	35:4E:AC:A5
3f97fd16-9290-4107-802d-2f9e407d5879	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	49141	93:57:D8:0B
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
05327f4b-a58a-4c1e-8a02-41fc1c75555b	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f45d58c6-5b72-4e58-a776-a687465dee18	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
3f2ead27-6a2e-4f35-99b0-0b2862e6c41f	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	92945d1f-5534-4e36-82a4-e745b00e375e	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
44224506-1847-48c9-8922-057e6c3b11c9	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	30b3ae9f-777e-43fe-846b-f499d0a00fa6	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
58b1d977-fa0d-44fa-a141-82b3a7230b8e	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	aafbcc84-5d75-40b9-afc8-ba3bcedc8ddd	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
59260ddb-6aa2-4ace-ad61-6e13ecc444fd	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4c521290-30c9-4d15-9ad5-37dd45954c54	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
693b707f-729e-4b19-91ae-5674276731e4	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ef0d4a14-332b-442e-a45c-7651dbac8ca9	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
86144ab0-383f-4426-a9b9-15f432be6681	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e4899e1d-0a01-4d18-b265-6a7410cfa399	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
8c54c659-760b-4b50-a073-de93bd318aa1	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	eb2195c3-d553-422d-8345-5165c5cf949c	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
8f9927e3-1628-4332-a6cf-a86bac1b82a3	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	47b819fd-c135-4659-b1ad-451088e44e2e	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
a2c9a5a0-6dc6-420d-bdbd-cb6f48fcce1c	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	23c6c82a-027a-4ab9-9477-8db256394797	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
a6bd5249-bac9-460a-9d3b-fad684044526	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4fff04ef-807e-4b9e-809b-7c47559fb017	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
a79ab940-2702-453e-91f9-40ff2e268c7b	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	81ea0823-0943-463b-906d-6092dc93bef3	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
bba5c015-ce76-4627-8614-1d706a40841e	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	964dcff1-2181-449d-b80e-868347d32ed2	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
c82a750a-b9d6-4c07-8422-c4619f7c4f59	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9dd7fa55-2a73-458a-a406-983f41a7097f	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
d197fa75-21c7-40cb-beea-d1a232f4e628	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	13476012-72ea-4360-a32a-a5f67a3cd054	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
f00422c9-9cf6-45f4-b512-4c2246f5d85c	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f5ea7896-3da3-4027-960e-c727aeb8ed31	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
f1195e17-0628-42e5-884e-5a85ff246447	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bbfba36d-9f94-4922-b483-79fad0953559	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
f56a24d3-fb28-4e49-8f63-4e50a25350fe	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	640055c7-9192-42dd-9872-f409e7243dd2	\N	1c3a724b-c5e5-4c0a-92c3-383dd4540fe7	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
4d30a970-bbfb-4a27-8598-4fa4f76c4f9f	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	e5510e42-a02d-42e5-abdb-953a41ec15a1	\N
4da44053-02ae-4dbe-8198-4bca7e13c022	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	e5510e42-a02d-42e5-abdb-953a41ec15a1	\N
6331a65b-628d-4310-9c14-c37736a4ecb1	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	e5510e42-a02d-42e5-abdb-953a41ec15a1	\N
03f4a111-957e-48ca-8d5e-79e16daca860	1	12:10:00	13:10:00	13:20:00	13:50:00	fe39fbd3-0299-4724-8ec6-dec5cbb5ff0f	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
1045783e-ba1a-4184-bc85-540078d39cae	3550	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	3550
9228a19f-194c-4dd9-ba32-639bb89dd85d	3500	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	3500
b049b585-4db1-4cf7-b763-7e90bc4c95f4	3690	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	3690
c62c37c0-f0c0-4f35-be48-abd1aaeafcde	3600	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	3600
d30d744f-904b-4f23-9281-d4d9daf64db8	3610	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	3610
fb3709ce-75f2-4f53-8cc0-19c086901e42	3510	\N	4c416c37-b203-46dc-9516-3a4677c7c9d1	3510
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
add8721e-dea9-4b01-82ec-112694ef30a0	Сварочный цех	50	050
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

