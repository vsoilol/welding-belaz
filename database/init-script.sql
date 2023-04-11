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
f0180ea6-899a-4dd4-aec8-dfcb14c3a38b	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
2c9d4c40-9ccf-40bb-814c-3266228c4029	f60f268d-c917-44a4-8d4a-e585e59f05cb	e945fbfc-2874-4008-a578-f2f1ef1a3cc5	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
14a1b601-d29a-451a-8cec-95adbb31e267	1	10	t	f0180ea6-899a-4dd4-aec8-dfcb14c3a38b	\N
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
08ba5cbf-a481-4e87-8891-3f24bf181481	Плановый ремонт централизованными службами	\N
2013059c-d210-4dc8-b168-89d92e9564d6	Отсутствие конструктора, технолога или ожидание его решения	\N
250a2691-c597-4eaf-97eb-23c7af21e9ad	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
31ffe9fd-367d-41d1-a2ef-5141bc955058	Работа по карте несоответствий	\N
382a2e11-cd07-415f-931b-b91008858a5f	Аварийный ремонт централизованными службами	\N
3964f976-11f3-4bee-93d2-fdaf48014c23	Работа с управляющей программой	\N
43fa5c11-aa80-482c-85d7-afcd0b7acc01	Отсутствие сотрудника ОТК	\N
5b56e953-dc54-404b-bb19-a6040485f5f1	Сборочные операции	\N
7ae85673-b309-4bac-8a4f-25b5d95aa326	Нерабочее время по графику согласно сменности	\N
8a806945-d63e-4686-b857-a29cea55d7f2	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
8e72e7fa-e99e-42f7-94a2-abb1a176466d	Обед	\N
90730f7b-ec06-4a5c-a784-a5c18187c774	Отсутствие крана, транспорта	\N
ac359047-be09-4e52-a221-5e2d4b333959	Праздники и выходные	\N
b11d0aba-f2a7-47c2-99f5-a44fd93566e1	Естественные надобности	\N
b1dc612a-f4af-4065-abf0-9ce648dc2633	Отсутствие заданий	\N
b6cb43d4-f0c3-4050-8473-01aaee26a3d9	Отсутствие материала, заготовок, деталей	\N
c1c977ba-3a92-4ab6-ba6f-5f14d31464b3	Ознакомление с работой, документацией, инструктаж	\N
cf5e608a-b8e1-4eb3-983e-5863a82ff403	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
dc36c379-cd60-4044-803d-16c5e133b09b	Отсутствие энергоносителей	\N
de16653f-837f-4e9d-9811-88ea9fc6796e	Установка, выверка, снятие детали	\N
e3ced408-e4e1-49d0-9b52-574749dfe531	Контроль на рабочем месте	\N
ed830505-fba9-4da8-8a47-a5436b0f6972	Отсутствие оператора в связи с необеспеченностью	\N
fabd382c-819b-42ba-a8b3-403c39083e3c	Изменение режимов, смена инструмента, приспособления	\N
ff66a412-e146-44a8-85f1-d5ad72a4cfed	Установка, выверка, снятие детали	\N
ffce4a68-2713-48a2-9ad5-20b10d439fb2	Неявка оператора (б/лист, отпуск, и пр.)	\N
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
26fa0abf-39f2-4ea9-b40d-817db2d4d42a	22c4b882-f996-4b4d-aaca-2d6b7781ce58	249550
5bc99e05-835c-438d-94cf-ea69ad9e6439	b061005c-36ab-4a18-a1f5-7e5b7de788c2	219379
d2a54935-bd87-4fad-953c-4da4c521a1dc	a80c9e4f-9fc9-4632-acbc-1a81137b9062	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
18386e78-595b-4fbc-b671-8e2b0225b075	27889d6b-9a75-4e54-8b67-4e264a38d54d	610422
1f27133c-b9c4-44ee-b873-10ed64f6738c	34fa2bec-1d20-48fa-a8b7-893e4fc1e0dc	614962
5d649dd5-20ff-4264-93c1-fdacdb057532	448e1838-69f9-4603-a7da-3baf02cc8398	\N
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
6014b3ab-d48b-4175-96fe-638c4dbd9f1c	ada418c3-ce85-4175-be17-0ed554bd4bb5
72d887f1-c77f-408f-8c00-8f1646a79278	ada418c3-ce85-4175-be17-0ed554bd4bb5
73c3d57c-2cca-4bd3-80a7-964256f0d555	ada418c3-ce85-4175-be17-0ed554bd4bb5
c43c1f5b-057b-496c-88ab-21e0a1f63b19	ada418c3-ce85-4175-be17-0ed554bd4bb5
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
6014b3ab-d48b-4175-96fe-638c4dbd9f1c	4	2	2023-03-12 00:00:00	c18cd7ad-6d6f-4958-82c3-902078b19022	\N
72d887f1-c77f-408f-8c00-8f1646a79278	2	2	2023-03-12 00:00:00	8e026fed-3063-4194-bac9-83be7254bc99	\N
73c3d57c-2cca-4bd3-80a7-964256f0d555	3	2	2023-03-12 00:00:00	8e568092-5029-4d40-a9e6-a48acbc91539	\N
c43c1f5b-057b-496c-88ab-21e0a1f63b19	1	2	2023-03-12 00:00:00	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
c18cd7ad-6d6f-4958-82c3-902078b19022	8e026fed-3063-4194-bac9-83be7254bc99
08f92a4d-c687-4ae4-aa48-51e68d0de4e5	8e568092-5029-4d40-a9e6-a48acbc91539
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
106a035b-9c4a-4401-9362-ef079c94bff6	0	2	\N	\N	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
10ee2b9e-b4cd-47f2-ab33-70ca8f5aa6d6	0	2	\N	\N	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
145fc1d5-0d5c-4597-8f94-b7ce1f2a1501	0	2	\N	\N	73c3d57c-2cca-4bd3-80a7-964256f0d555	\N
39506194-1113-4d95-82ff-5407fb63f82f	0	1	\N	\N	73c3d57c-2cca-4bd3-80a7-964256f0d555	\N
4802d4b0-c699-496a-b5ad-71815b5bb88c	0	3	\N	\N	73c3d57c-2cca-4bd3-80a7-964256f0d555	\N
61b045c4-de2f-4af1-8309-ae01cefcff77	0	1	\N	\N	72d887f1-c77f-408f-8c00-8f1646a79278	\N
6e8edd62-b087-4b19-b66b-d5ca9f68562a	0	2	\N	\N	72d887f1-c77f-408f-8c00-8f1646a79278	\N
838a8418-fc13-4919-9087-44e03c906a8b	0	1	\N	\N	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
adb3e257-2d43-4404-be5f-cd0fa1ac069f	0	3	\N	\N	72d887f1-c77f-408f-8c00-8f1646a79278	\N
b5f46ccc-b54a-46b7-ba51-aca913c49770	0	1	\N	\N	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
c3ffff9b-c8f9-4c73-a10f-9f8ed853043a	0	3	\N	\N	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
d0ca3eaf-545a-4736-8bd6-b898df87c87b	0	3	\N	\N	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
ac9b06e4-af94-49a5-b43d-8218de27628c	Сборка, сварка рам к/с г/п 120-130 т.	6	e945fbfc-2874-4008-a578-f2f1ef1a3cc5	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
08f92a4d-c687-4ae4-aa48-51e68d0de4e5	Рама	7513D-2800010-20	t	1	178942cc-cba1-441d-9098-2e7f3fcbe507	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N	\N	4536492774
8e026fed-3063-4194-bac9-83be7254bc99	Поперечина рамы задняя	75131-2801300-20	t	2	6c6d31bf-e3f8-463c-b151-6db8d39189ce	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N	\N	\N
8e568092-5029-4d40-a9e6-a48acbc91539	Поперечина рамы задняя	75131-2801300-20	t	2	178942cc-cba1-441d-9098-2e7f3fcbe507	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N	\N	\N
c18cd7ad-6d6f-4958-82c3-902078b19022	Рама	75131-2800010-70	t	1	6c6d31bf-e3f8-463c-b151-6db8d39189ce	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N	\N	4536479362
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
58e71816-1d92-40f4-a885-bf9fd6fd7bd2	Admin	\N
841f6c92-e4d5-4c3a-81ad-5be83668df6e	Master	\N
dec830bc-5eba-447b-a53a-810fad05b18b	Welder	\N
7ce39426-866a-43fc-972d-cb1b16fdc643	Inspector	\N
c3bd25d3-8683-471d-9db6-6b52671ca057	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
00ed4766-b6dc-4fc3-9d54-b34594cf8f3e	2023-03-12 00:00:00	8917e9d8-6784-45c0-a0a9-6357d480cfcc	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
01476733-76c6-4a84-958e-37a20fb4ac13	2023-03-12 00:00:00	dd5558b1-bedf-4e2c-9d8b-1017d78f4a26	72d887f1-c77f-408f-8c00-8f1646a79278	\N
0d4a2cfb-1b01-4274-96a0-499fd84c9ed2	2023-03-12 00:00:00	8516b381-2a2b-40fb-8a6c-d23b37529723	73c3d57c-2cca-4bd3-80a7-964256f0d555	\N
22e3d25d-af62-4c27-a8e9-6b7e87469d09	2023-03-12 00:00:00	0d222dd7-73eb-4273-8d7d-693eedd1f81f	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
24b89601-8e40-4272-9e3f-1929fc4d6df2	2023-03-12 00:00:00	ba197782-e062-45c6-85a1-f73d74de0191	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
51d756dc-b026-447e-9260-eb6007c28c6f	2023-03-12 00:00:00	8993ab51-d364-4980-9137-4f8bd464a1d7	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
642c5420-302f-4e2f-b1ad-5e87d021c1ce	2023-03-12 00:00:00	a77dbaef-a970-4a10-bedd-f996e7834631	72d887f1-c77f-408f-8c00-8f1646a79278	\N
6893cfa6-56f6-4058-b454-983d6c332619	2023-03-12 00:00:00	7c3dd9c5-eed3-470e-a16e-90ed790bd5e4	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
6a7ff593-8ec5-443a-9ce3-cb7fe317b481	2023-03-12 00:00:00	c745b77e-87c5-4e6d-8fea-a07998cead2d	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
75d5bb4d-f56d-48aa-a847-56ac769f22ab	2023-03-12 00:00:00	7da08e3b-c6b1-4e2b-828b-3c0f8fc813bb	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
89399ce1-364b-432b-b85d-5cac752f4d7f	2023-03-12 00:00:00	470df409-019f-4c4b-9b75-6e5e7ba6ee1d	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
997d1a91-d8c1-4a57-9e02-7d714f3ab55f	2023-03-12 00:00:00	d37003fe-fc78-4b83-81de-0ac48afcb30a	73c3d57c-2cca-4bd3-80a7-964256f0d555	\N
9ebeb1ff-c7f6-4e73-968f-aeedb2e044dd	2023-03-12 00:00:00	3d133d31-1917-4892-81ce-a33459d5cfd1	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
bf45643b-da55-4542-b657-65af662975b6	2023-03-12 00:00:00	11d209cf-0f7a-421b-ae66-c3940ab6c047	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
cb88a66d-9e46-4444-b5e5-865c70ab1e80	2023-03-12 00:00:00	699f7589-51a6-48c9-8f51-1a0b0da04d53	6014b3ab-d48b-4175-96fe-638c4dbd9f1c	\N
db2ac8a9-d3b1-4979-b49c-23f41df6b3e8	2023-03-12 00:00:00	1e122d93-6809-40c5-8b14-145327415263	72d887f1-c77f-408f-8c00-8f1646a79278	\N
ee67825a-5804-4d06-a600-a2d61667f6ff	2023-03-12 00:00:00	85dab1c8-a530-415e-bfa1-6e2a2c07d968	73c3d57c-2cca-4bd3-80a7-964256f0d555	\N
f939525e-2fb3-405a-ba50-d30f8a10e9a7	2023-03-12 00:00:00	86d2ef01-2c8f-4be7-9b65-a83f10f3e65e	c43c1f5b-057b-496c-88ab-21e0a1f63b19	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
032fc841-c1c6-400a-941f-f170eaff9619	0	2	\N	\N	75d5bb4d-f56d-48aa-a847-56ac769f22ab	\N
0a1f2a71-c11b-4795-bc7e-309a2de83b1c	0	3	\N	\N	6893cfa6-56f6-4058-b454-983d6c332619	\N
16f964e3-2888-4b53-b1c8-68d16974ace1	0	3	\N	\N	642c5420-302f-4e2f-b1ad-5e87d021c1ce	\N
17168d50-fee5-4a4e-9954-4b0a124cea52	0	2	\N	\N	6893cfa6-56f6-4058-b454-983d6c332619	\N
19a84bb8-1125-4e49-95bf-4cbadf9cb64b	0	2	\N	\N	f939525e-2fb3-405a-ba50-d30f8a10e9a7	\N
1f30f49f-561d-481f-bdad-b6bf7eeb96be	0	3	\N	\N	22e3d25d-af62-4c27-a8e9-6b7e87469d09	\N
2011c6f6-2f12-44de-a4e4-cde508c23f32	0	3	\N	\N	bf45643b-da55-4542-b657-65af662975b6	\N
28904d28-74d4-426a-8e01-abe234ea050e	0	2	\N	\N	51d756dc-b026-447e-9260-eb6007c28c6f	\N
4b6c58bc-6994-45f4-85a5-696252fefb18	0	3	\N	\N	00ed4766-b6dc-4fc3-9d54-b34594cf8f3e	\N
527acb47-2ed9-48db-bc35-e6b53b09c154	0	2	\N	\N	01476733-76c6-4a84-958e-37a20fb4ac13	\N
5a950802-6682-4093-ae4c-ab47bb9bc45e	0	2	\N	\N	cb88a66d-9e46-4444-b5e5-865c70ab1e80	\N
6020cc21-c459-4b5f-abf5-ac054d1a6e34	0	3	\N	\N	75d5bb4d-f56d-48aa-a847-56ac769f22ab	\N
6193394c-b741-4f38-b974-df75279e6576	0	3	\N	\N	db2ac8a9-d3b1-4979-b49c-23f41df6b3e8	\N
6561480d-6aa8-42c2-a973-26d381da4cc4	0	3	\N	\N	f939525e-2fb3-405a-ba50-d30f8a10e9a7	\N
6ec45032-7409-493d-9d01-d3f4a9b2b8d1	0	3	\N	\N	0d4a2cfb-1b01-4274-96a0-499fd84c9ed2	\N
711c296d-e647-430a-83e4-465fbca87fb2	0	2	\N	\N	ee67825a-5804-4d06-a600-a2d61667f6ff	\N
730d4b6b-8450-4edb-a995-e9e986993c1f	0	3	\N	\N	24b89601-8e40-4272-9e3f-1929fc4d6df2	\N
73cb3435-3e49-42cf-a42b-53fe9e835db9	0	2	\N	\N	0d4a2cfb-1b01-4274-96a0-499fd84c9ed2	\N
790225b1-e80e-476d-a19b-81b5eac7df82	0	2	\N	\N	bf45643b-da55-4542-b657-65af662975b6	\N
7cd1d221-5ac8-41d0-b7a2-04da2cc05972	0	3	\N	\N	01476733-76c6-4a84-958e-37a20fb4ac13	\N
7dbdbd13-2352-489e-82a7-689c1c45c121	0	3	\N	\N	6a7ff593-8ec5-443a-9ce3-cb7fe317b481	\N
80356795-ce3e-4d79-afe7-afda59a49f7f	0	3	\N	\N	cb88a66d-9e46-4444-b5e5-865c70ab1e80	\N
8eba7c29-457c-430a-9e6a-40a2d4cf0025	0	3	\N	\N	9ebeb1ff-c7f6-4e73-968f-aeedb2e044dd	\N
90215d98-0e48-4c17-8621-9e829eeac614	0	2	\N	\N	997d1a91-d8c1-4a57-9e02-7d714f3ab55f	\N
97f08438-684e-4f7b-999d-3bf7c2f18d07	0	3	\N	\N	ee67825a-5804-4d06-a600-a2d61667f6ff	\N
ab6a36ab-6f57-41ae-85b9-71c196c49528	0	2	\N	\N	9ebeb1ff-c7f6-4e73-968f-aeedb2e044dd	\N
af5000a5-c479-4e16-b0cd-dbf4c22ba706	0	2	\N	\N	89399ce1-364b-432b-b85d-5cac752f4d7f	\N
bbb09b8a-47a4-432f-aef3-778c8a1f3d95	0	3	\N	\N	51d756dc-b026-447e-9260-eb6007c28c6f	\N
bf54ffae-e4ee-474e-87b3-07610099a59c	0	2	\N	\N	00ed4766-b6dc-4fc3-9d54-b34594cf8f3e	\N
c198424d-957a-4aea-ad45-f00b6d188bc4	0	2	\N	\N	6a7ff593-8ec5-443a-9ce3-cb7fe317b481	\N
caba7f5e-39de-4ddf-94c7-32116187891f	0	2	\N	\N	22e3d25d-af62-4c27-a8e9-6b7e87469d09	\N
d7a9d498-be29-4303-907f-e356248c28cb	0	2	\N	\N	642c5420-302f-4e2f-b1ad-5e87d021c1ce	\N
e526e61e-5083-4bb9-aac6-53972f125b73	0	2	\N	\N	db2ac8a9-d3b1-4979-b49c-23f41df6b3e8	\N
ebaf86d7-96af-4097-b683-28b3572c5268	0	3	\N	\N	997d1a91-d8c1-4a57-9e02-7d714f3ab55f	\N
edfa3dc8-c903-4bc1-9813-9475a7018c13	0	2	\N	\N	24b89601-8e40-4272-9e3f-1929fc4d6df2	\N
f2a19418-021b-4477-98da-e61fad4c2c49	0	3	\N	\N	89399ce1-364b-432b-b85d-5cac752f4d7f	\N
0cc5f524-9809-498b-8b0a-3f87693a086a	2	1	\N	\N	75d5bb4d-f56d-48aa-a847-56ac769f22ab	\N
16533e18-f735-4f4a-8338-c5e6b0e5c931	2	1	\N	\N	db2ac8a9-d3b1-4979-b49c-23f41df6b3e8	\N
1faea658-2f07-4f35-8c17-8ce56e519de5	2	1	\N	\N	6893cfa6-56f6-4058-b454-983d6c332619	\N
381e6f93-c877-4f7e-9f11-d6374b7d2b86	2	1	\N	\N	bf45643b-da55-4542-b657-65af662975b6	\N
4313745b-b48a-468d-8ebe-b09c3811282a	2	1	\N	\N	01476733-76c6-4a84-958e-37a20fb4ac13	\N
69c71aad-fbac-4612-9808-692f2278e107	2	1	\N	\N	f939525e-2fb3-405a-ba50-d30f8a10e9a7	\N
70a8373f-50b8-4357-9704-49bfe1eeaf27	2	1	\N	\N	22e3d25d-af62-4c27-a8e9-6b7e87469d09	\N
70eea29d-cebc-4d1c-9b0b-b60ffe83b404	2	1	\N	\N	0d4a2cfb-1b01-4274-96a0-499fd84c9ed2	\N
7ffb0261-2d24-4fae-95d5-5f5e1189a756	2	1	\N	\N	6a7ff593-8ec5-443a-9ce3-cb7fe317b481	\N
8762c2bf-7ccc-443a-a1ae-30a1e1e1d44f	2	1	\N	\N	51d756dc-b026-447e-9260-eb6007c28c6f	\N
89d6fd80-eaa4-4071-8012-ef4b6fa1d41a	2	1	\N	\N	24b89601-8e40-4272-9e3f-1929fc4d6df2	\N
9b32ff1d-795a-4007-9222-af1dd71830d4	2	1	\N	\N	cb88a66d-9e46-4444-b5e5-865c70ab1e80	\N
9e3f7cf6-d784-49eb-8b23-1c53395a86de	2	1	\N	\N	00ed4766-b6dc-4fc3-9d54-b34594cf8f3e	\N
a0afd5ed-ce82-4bb1-926e-3795f969d90f	2	1	\N	\N	ee67825a-5804-4d06-a600-a2d61667f6ff	\N
ce1e29fb-6574-4678-b714-7530ed056b53	2	1	\N	\N	997d1a91-d8c1-4a57-9e02-7d714f3ab55f	\N
dea01c6f-6c7e-4824-a2ef-58831c35ecfe	2	1	\N	\N	9ebeb1ff-c7f6-4e73-968f-aeedb2e044dd	\N
edda2452-7b9d-4a7e-9438-06ca7c1ee14a	2	1	\N	\N	89399ce1-364b-432b-b85d-5cac752f4d7f	\N
f57fd3d0-f284-43d1-aedb-93fb2f96c87d	2	1	\N	\N	642c5420-302f-4e2f-b1ad-5e87d021c1ce	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0d222dd7-73eb-4273-8d7d-693eedd1f81f	55	400	t	f	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	6b44e237-7540-47ae-97ef-f147e0194b8a	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
11d209cf-0f7a-421b-ae66-c3940ab6c047	39	280	t	f	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	0d51c94e-b28d-4ca8-ae2a-ed75770d23c3	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
1e122d93-6809-40c5-8b14-145327415263	52	1200	t	f	8e026fed-3063-4194-bac9-83be7254bc99	d6c7d2fc-962c-4bf7-89b1-2c8c82bff36f	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
3d133d31-1917-4892-81ce-a33459d5cfd1	57	400	t	f	c18cd7ad-6d6f-4958-82c3-902078b19022	d1eaa598-26de-4e03-8bb4-fc7bb37d6378	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
470df409-019f-4c4b-9b75-6e5e7ba6ee1d	58	900	t	f	c18cd7ad-6d6f-4958-82c3-902078b19022	ca27d990-f35b-47ad-9e5e-987430aea368	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
699f7589-51a6-48c9-8f51-1a0b0da04d53	18	4000	t	f	c18cd7ad-6d6f-4958-82c3-902078b19022	62c7d970-4b01-4136-aa53-4d9d297ec6de	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
7c3dd9c5-eed3-470e-a16e-90ed790bd5e4	55	400	t	f	c18cd7ad-6d6f-4958-82c3-902078b19022	6b44e237-7540-47ae-97ef-f147e0194b8a	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
7da08e3b-c6b1-4e2b-828b-3c0f8fc813bb	18	4000	t	f	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	62c7d970-4b01-4136-aa53-4d9d297ec6de	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
8516b381-2a2b-40fb-8a6c-d23b37529723	52	1200	t	f	8e568092-5029-4d40-a9e6-a48acbc91539	d6c7d2fc-962c-4bf7-89b1-2c8c82bff36f	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
85dab1c8-a530-415e-bfa1-6e2a2c07d968	1	1900	t	f	8e568092-5029-4d40-a9e6-a48acbc91539	94dc631b-eab2-4496-b2eb-572f102698e6	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
86d2ef01-2c8f-4be7-9b65-a83f10f3e65e	57	400	t	f	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	d1eaa598-26de-4e03-8bb4-fc7bb37d6378	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
8917e9d8-6784-45c0-a0a9-6357d480cfcc	39	280	t	f	c18cd7ad-6d6f-4958-82c3-902078b19022	0d51c94e-b28d-4ca8-ae2a-ed75770d23c3	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
8993ab51-d364-4980-9137-4f8bd464a1d7	58	900	t	f	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	ca27d990-f35b-47ad-9e5e-987430aea368	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
a77dbaef-a970-4a10-bedd-f996e7834631	1	1900	t	f	8e026fed-3063-4194-bac9-83be7254bc99	94dc631b-eab2-4496-b2eb-572f102698e6	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
ba197782-e062-45c6-85a1-f73d74de0191	54	400	t	f	c18cd7ad-6d6f-4958-82c3-902078b19022	68000898-98bf-4ade-962b-9563f36dc894	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
c745b77e-87c5-4e6d-8fea-a07998cead2d	54	400	t	f	08f92a4d-c687-4ae4-aa48-51e68d0de4e5	68000898-98bf-4ade-962b-9563f36dc894	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
d37003fe-fc78-4b83-81de-0ac48afcb30a	2	1880	t	f	8e568092-5029-4d40-a9e6-a48acbc91539	c972cf35-f0be-49d1-956b-d3107a4ea91f	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
dd5558b1-bedf-4e2c-9d8b-1017d78f4a26	2	1880	t	f	8e026fed-3063-4194-bac9-83be7254bc99	c972cf35-f0be-49d1-956b-d3107a4ea91f	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
0d51c94e-b28d-4ca8-ae2a-ed75770d23c3	39	Инструкция 39	39
5e59a1f7-5357-4811-9d59-c463787a1ae1	48	Инструкция 48	48
62c7d970-4b01-4136-aa53-4d9d297ec6de	18	Инструкция 18	18
68000898-98bf-4ade-962b-9563f36dc894	54	Инструкция 54	54
6b44e237-7540-47ae-97ef-f147e0194b8a	55	Инструкция 55	55
736cf075-ee17-4fac-81f3-04aad0f185b5	56	Инструкция 56	56
94dc631b-eab2-4496-b2eb-572f102698e6	1	Инструкция 1	1
c972cf35-f0be-49d1-956b-d3107a4ea91f	2	Инструкция 2	2
ca27d990-f35b-47ad-9e5e-987430aea368	58	Инструкция 58	58
d1eaa598-26de-4e03-8bb4-fc7bb37d6378	57	Инструкция 57	57
d6c7d2fc-962c-4bf7-89b1-2c8c82bff36f	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
178942cc-cba1-441d-9098-2e7f3fcbe507	7513D-2800010-20	Рама	\N	3330041
6c6d31bf-e3f8-463c-b151-6db8d39189ce	75131-2800010-70	Рама	\N	3291137
ef97d2cc-8762-4088-a3d8-9cf53cf0588a	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
22c4b882-f996-4b4d-aaca-2d6b7781ce58	7ce39426-866a-43fc-972d-cb1b16fdc643
b061005c-36ab-4a18-a1f5-7e5b7de788c2	7ce39426-866a-43fc-972d-cb1b16fdc643
27889d6b-9a75-4e54-8b67-4e264a38d54d	841f6c92-e4d5-4c3a-81ad-5be83668df6e
34fa2bec-1d20-48fa-a8b7-893e4fc1e0dc	841f6c92-e4d5-4c3a-81ad-5be83668df6e
12ad7df4-f27d-44af-80c4-854adaada0f6	dec830bc-5eba-447b-a53a-810fad05b18b
298e9a98-2361-461e-a518-91a5df0bc396	dec830bc-5eba-447b-a53a-810fad05b18b
58c7320e-bbef-44be-b240-8a776d9ae576	dec830bc-5eba-447b-a53a-810fad05b18b
6917b4a8-03d9-4092-a7dc-cfda84892be8	dec830bc-5eba-447b-a53a-810fad05b18b
759b78ef-b259-4f0d-b1ac-35157d4aa51e	dec830bc-5eba-447b-a53a-810fad05b18b
a668ba05-eaa2-49a5-9c4a-f289cb8869b9	dec830bc-5eba-447b-a53a-810fad05b18b
c0553e3e-47a3-4642-a2d2-006fe785931d	dec830bc-5eba-447b-a53a-810fad05b18b
e769a3d3-3105-4855-b7bb-b56ebe137c7d	dec830bc-5eba-447b-a53a-810fad05b18b
f60f268d-c917-44a4-8d4a-e585e59f05cb	c3bd25d3-8683-471d-9db6-6b52671ca057
078a440c-b177-4a95-bcde-59014f89d697	58e71816-1d92-40f4-a885-bf9fd6fd7bd2
765d9435-688e-4acb-9db4-11ea61c47b13	dec830bc-5eba-447b-a53a-810fad05b18b
a80c9e4f-9fc9-4632-acbc-1a81137b9062	7ce39426-866a-43fc-972d-cb1b16fdc643
25a5eb50-35ad-46b4-aa37-b5ef9b759b58	c3bd25d3-8683-471d-9db6-6b52671ca057
448e1838-69f9-4603-a7da-3baf02cc8398	841f6c92-e4d5-4c3a-81ad-5be83668df6e
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
22c4b882-f996-4b4d-aaca-2d6b7781ce58	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
b061005c-36ab-4a18-a1f5-7e5b7de788c2	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
27889d6b-9a75-4e54-8b67-4e264a38d54d	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
34fa2bec-1d20-48fa-a8b7-893e4fc1e0dc	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
12ad7df4-f27d-44af-80c4-854adaada0f6	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	97:17:60:B4
298e9a98-2361-461e-a518-91a5df0bc396	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	67:CD:7E:5A
58c7320e-bbef-44be-b240-8a776d9ae576	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	D7:95:55:B4
6917b4a8-03d9-4092-a7dc-cfda84892be8	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	17:CD:7F:5A
759b78ef-b259-4f0d-b1ac-35157d4aa51e	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	27:45:7E:B4
a668ba05-eaa2-49a5-9c4a-f289cb8869b9	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	B7:5A:79:B5
c0553e3e-47a3-4642-a2d2-006fe785931d	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	D7:F1:7D:5A
e769a3d3-3105-4855-b7bb-b56ebe137c7d	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	67:5A:70:B4
f60f268d-c917-44a4-8d4a-e585e59f05cb	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
078a440c-b177-4a95-bcde-59014f89d697	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$C7eloNxeWE+YgP4vg268v7Yvl7NuY3WWv4AzVpGqKPmNy5AQ	\N	\N	\N	\N	\N	\N
765d9435-688e-4acb-9db4-11ea61c47b13	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$NlTk7EvsYxAzVQUjl6nyI1Z3WXUp1MFznt2/8iuyIPQG6Qpd	\N	\N	\N	\N	\N	\N
a80c9e4f-9fc9-4632-acbc-1a81137b9062	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$RKlf3bG192Js41BE322sPdjxmERq0x/vPfk2uAR25aEpC5Um	\N	\N	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
25a5eb50-35ad-46b4-aa37-b5ef9b759b58	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$VtuSA5CqtfuDJdkCzI3YioUP08urMEiIEQ+3biZDOQFQSc10	\N	\N	\N	\N	\N	\N
448e1838-69f9-4603-a7da-3baf02cc8398	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$x76VUvf4eC4U8CCSqNaKjpLRK9G4lb8T/pOYI120+94jC4WG	\N	\N	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
06e71093-010f-4368-baf0-d91282a870e1	1	Заполняющий	230	310	23	26	\N	\N	0d51c94e-b28d-4ca8-ae2a-ed75770d23c3	\N
0821694a-407a-44ed-b139-5190ef62e85a	1	Заполняющий	230	310	23	26	\N	\N	62c7d970-4b01-4136-aa53-4d9d297ec6de	\N
38d0ba20-c9ec-4121-820a-3b65877ae3fc	1	Заполняющий	230	310	23	26	\N	\N	94dc631b-eab2-4496-b2eb-572f102698e6	\N
53839c75-28e3-420d-8db7-b3c85aedf417	1	Заполняющий	230	310	23	26	\N	\N	d6c7d2fc-962c-4bf7-89b1-2c8c82bff36f	\N
66d8d3db-2f3a-4981-8b84-41a606dcd133	1	Заполняющий	230	310	23	26	\N	\N	5e59a1f7-5357-4811-9d59-c463787a1ae1	\N
6be36b8d-18ed-417a-b758-791c1b7a68db	1	Заполняющий	230	310	23	26	\N	\N	d1eaa598-26de-4e03-8bb4-fc7bb37d6378	\N
cb1d8580-f935-4db5-98bf-1ad8495ab379	1	Заполняющий	230	310	23	26	\N	\N	736cf075-ee17-4fac-81f3-04aad0f185b5	\N
d0236234-5b0b-4a6f-a4bd-123cadb41839	1	Заполняющий	230	310	23	26	\N	\N	ca27d990-f35b-47ad-9e5e-987430aea368	\N
e1ca8097-1a96-4320-957a-3120cc47195b	1	Заполняющий	230	310	23	26	\N	\N	68000898-98bf-4ade-962b-9563f36dc894	\N
e635bedf-d3c1-4f72-b4c4-33086c682c5c	1	Заполняющий	230	310	23	26	\N	\N	c972cf35-f0be-49d1-956b-d3107a4ea91f	\N
f3aa4615-d4b8-4a20-b587-ddc0e73f89bf	1	Заполняющий	230	310	23	26	\N	\N	6b44e237-7540-47ae-97ef-f147e0194b8a	\N
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
0afbfacb-b858-4c1b-87ad-6a62697b18ed	2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e
0afbfacb-b858-4c1b-87ad-6a62697b18ed	972fe750-baa0-429b-8cbc-7443b47aed2f
19bd2fc8-8d19-483c-a521-0f92539d42ce	bd332403-8710-4d84-8cde-14c0035d3401
5076bd94-99e2-46ef-9855-2e260bb2bbf7	ada418c3-ce85-4175-be17-0ed554bd4bb5
5b27407f-628b-4d61-9000-a74d876a45f3	ada418c3-ce85-4175-be17-0ed554bd4bb5
b6d8da3f-8a3d-4247-bf23-c0958ef5fb9f	2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e
b6d8da3f-8a3d-4247-bf23-c0958ef5fb9f	972fe750-baa0-429b-8cbc-7443b47aed2f
ba9ab367-95a6-40c8-ae11-28aaa659ae0f	2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e
ba9ab367-95a6-40c8-ae11-28aaa659ae0f	972fe750-baa0-429b-8cbc-7443b47aed2f
ce2b2222-44ca-43ab-a269-bdb7ca218b10	bd332403-8710-4d84-8cde-14c0035d3401
f06b3ed6-6d66-4800-9038-fde0ae04f608	2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e
f06b3ed6-6d66-4800-9038-fde0ae04f608	972fe750-baa0-429b-8cbc-7443b47aed2f
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0afbfacb-b858-4c1b-87ad-6a62697b18ed	c0553e3e-47a3-4642-a2d2-006fe785931d	\N	114729
19bd2fc8-8d19-483c-a521-0f92539d42ce	58c7320e-bbef-44be-b240-8a776d9ae576	\N	132695
5076bd94-99e2-46ef-9855-2e260bb2bbf7	a668ba05-eaa2-49a5-9c4a-f289cb8869b9	\N	121267
5b27407f-628b-4d61-9000-a74d876a45f3	e769a3d3-3105-4855-b7bb-b56ebe137c7d	\N	117390
b6d8da3f-8a3d-4247-bf23-c0958ef5fb9f	6917b4a8-03d9-4092-a7dc-cfda84892be8	\N	150882
ba9ab367-95a6-40c8-ae11-28aaa659ae0f	12ad7df4-f27d-44af-80c4-854adaada0f6	\N	150838
ce2b2222-44ca-43ab-a269-bdb7ca218b10	298e9a98-2361-461e-a518-91a5df0bc396	\N	122575
f06b3ed6-6d66-4800-9038-fde0ae04f608	759b78ef-b259-4f0d-b1ac-35157d4aa51e	\N	146164
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
2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e	5c8d500a-0f4a-43c9-b0cf-33968408df37
2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e	6d0654d2-0f03-4227-a1f6-2f11b060ff81
2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e	b9db6efb-cb61-452f-b798-bcfd6c9f7ebc
2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e	cd8c862c-ce41-4c06-acbf-6169be998c1d
972fe750-baa0-429b-8cbc-7443b47aed2f	5c8d500a-0f4a-43c9-b0cf-33968408df37
972fe750-baa0-429b-8cbc-7443b47aed2f	6d0654d2-0f03-4227-a1f6-2f11b060ff81
972fe750-baa0-429b-8cbc-7443b47aed2f	b9db6efb-cb61-452f-b798-bcfd6c9f7ebc
972fe750-baa0-429b-8cbc-7443b47aed2f	cd8c862c-ce41-4c06-acbf-6169be998c1d
ada418c3-ce85-4175-be17-0ed554bd4bb5	32941fa5-1494-4c6b-a794-ee2618fb4d71
ada418c3-ce85-4175-be17-0ed554bd4bb5	5c8d500a-0f4a-43c9-b0cf-33968408df37
bd332403-8710-4d84-8cde-14c0035d3401	5a7fce8b-37c8-4462-9a73-5d8330feae19
bd332403-8710-4d84-8cde-14c0035d3401	b9db6efb-cb61-452f-b798-bcfd6c9f7ebc
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
2b0adb12-d5a6-46e6-a97c-0dc9770ddd9e	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	18386e78-595b-4fbc-b671-8e2b0225b075	49141	93:57:D8:0B
972fe750-baa0-429b-8cbc-7443b47aed2f	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	18386e78-595b-4fbc-b671-8e2b0225b075	49283	A6:F1:CF:48
ada418c3-ce85-4175-be17-0ed554bd4bb5	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	18386e78-595b-4fbc-b671-8e2b0225b075	49232	03:3D:93:0D
bd332403-8710-4d84-8cde-14c0035d3401	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	18386e78-595b-4fbc-b671-8e2b0225b075	49286	35:4E:AC:A5
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
10072f61-30c2-4701-806b-881f7db42224	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cb88a66d-9e46-4444-b5e5-865c70ab1e80	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
1508186a-86e8-4d52-bd8c-8ca7cebfbb59	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	51d756dc-b026-447e-9260-eb6007c28c6f	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
1f618ec8-7a14-4701-8f8e-bf2d61e68ba5	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	642c5420-302f-4e2f-b1ad-5e87d021c1ce	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
2c9d826b-b966-4b89-afe0-a150515518c1	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ee67825a-5804-4d06-a600-a2d61667f6ff	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
345ca569-72f4-4fcf-9f56-22b1383089e9	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0d4a2cfb-1b01-4274-96a0-499fd84c9ed2	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
3763b8d9-ffb0-4df5-9a1f-f00f620f2d90	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9ebeb1ff-c7f6-4e73-968f-aeedb2e044dd	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
3b86f717-5819-460f-8b35-07bfb7df8a94	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f939525e-2fb3-405a-ba50-d30f8a10e9a7	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
51a4d2d8-8a2b-42bd-ba66-e141744accc4	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6893cfa6-56f6-4058-b454-983d6c332619	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
5a97c08e-35e0-4ea9-8449-891eff3b9228	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	db2ac8a9-d3b1-4979-b49c-23f41df6b3e8	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
605db6c1-5433-48b6-8f3c-8853d028c3fc	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	75d5bb4d-f56d-48aa-a847-56ac769f22ab	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
65a90b7c-1923-4372-91b8-267c5db2f678	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	22e3d25d-af62-4c27-a8e9-6b7e87469d09	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
7edf8a7c-8675-4b87-b163-aaef795059f1	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6a7ff593-8ec5-443a-9ce3-cb7fe317b481	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
7ef90ae2-4bdc-44c1-a20d-daf4dc135f66	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	89399ce1-364b-432b-b85d-5cac752f4d7f	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
80318030-596e-43dd-8a18-1eafa5488787	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	01476733-76c6-4a84-958e-37a20fb4ac13	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
8e2ec69b-dc14-4cb6-81bf-e753ae3bb291	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bf45643b-da55-4542-b657-65af662975b6	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
bd6fad63-9ec9-4ee7-9b38-ce194594ced3	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	00ed4766-b6dc-4fc3-9d54-b34594cf8f3e	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
e7208f85-bb4a-4557-9995-768074beea70	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	997d1a91-d8c1-4a57-9e02-7d714f3ab55f	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
f743b275-ac4c-4635-b297-fc72a96c32a6	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	24b89601-8e40-4272-9e3f-1929fc4d6df2	\N	18386e78-595b-4fbc-b671-8e2b0225b075	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
86b7241e-eaf0-4fb3-a4b6-d2fb7ef74261	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	f0180ea6-899a-4dd4-aec8-dfcb14c3a38b	\N
a466aa21-1141-454e-bd2e-7ad8e2c41636	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	f0180ea6-899a-4dd4-aec8-dfcb14c3a38b	\N
fcb432c7-ff34-41e3-9185-999239df7435	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	f0180ea6-899a-4dd4-aec8-dfcb14c3a38b	\N
aa189c60-2d26-4cc4-b007-fbfce7fa894e	1	12:10:00	13:10:00	13:20:00	13:50:00	14a1b601-d29a-451a-8cec-95adbb31e267	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
32941fa5-1494-4c6b-a794-ee2618fb4d71	3600	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	3600
5a7fce8b-37c8-4462-9a73-5d8330feae19	3510	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	3510
5c8d500a-0f4a-43c9-b0cf-33968408df37	3610	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	3610
6d0654d2-0f03-4227-a1f6-2f11b060ff81	3690	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	3690
b9db6efb-cb61-452f-b798-bcfd6c9f7ebc	3500	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	3500
cd8c862c-ce41-4c06-acbf-6169be998c1d	3550	\N	ac9b06e4-af94-49a5-b43d-8218de27628c	3550
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
e945fbfc-2874-4008-a578-f2f1ef1a3cc5	Сварочный цех	50	050
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

