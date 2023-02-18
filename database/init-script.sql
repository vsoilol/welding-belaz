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
-- Name: MasterWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."MasterWeldingEquipment" (
    "MastersId" uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
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
-- Name: ProductAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductAccounts" (
    "Id" uuid NOT NULL,
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
-- Name: ProductWelder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductWelder" (
    "ProductsId" uuid NOT NULL,
    "WeldersId" uuid NOT NULL
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
-- Name: Seams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seams" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Length" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsPerformed" boolean NOT NULL,
    "ProductId" uuid,
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
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "PdmSystemFileLink" text NOT NULL,
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
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
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
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "IsEnsuringCurrentTolerance" boolean,
    "IsEnsuringVoltageTolerance" boolean,
    "IsEnsuringTemperatureTolerance" boolean,
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
    "IdFromSystem" text
);


--
-- Name: WeldingRecords; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingRecords" (
    "Id" uuid NOT NULL,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "IdFromSystem" text
);


--
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Status" integer NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "WeldingDate" timestamp without time zone,
    "BasicMaterial" text,
    "MainMaterialBatchNumber" text,
    "WeldingMaterial" text,
    "WeldingMaterialBatchNumber" text,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "WelderId" uuid NOT NULL,
    "MasterId" uuid NOT NULL,
    "InspectorId" uuid NOT NULL,
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
275c578d-65b8-4cfa-a0f0-9a6a68c93647	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
c82e28f0-1fa3-41e6-b737-6407514522f6	e076aebe-dcba-4893-83cf-b5299e490ee5	3430590d-86d9-44f6-8b16-7bf61ad54cf8	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
5d50d16f-f9b4-4ac4-ad2a-3f3d6627192a	1	10	t	275c578d-65b8-4cfa-a0f0-9a6a68c93647	\N
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
001b178b-da41-4e4e-b7cc-30b7c2b2ab4a	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
03355a13-254a-4647-bc82-ab8cf7e40134	Сборочные операции	\N
03782cc8-a7d0-4430-af2b-00fdf9286b7b	Отсутствие конструктора, технолога или ожидание его решения	\N
35fb214e-03ce-4358-95eb-e4f5148a482a	Изменение режимов, смена инструмента, приспособления	\N
38a62cce-57b9-49df-99e6-2b7937992dac	Отсутствие заданий	\N
3ab2b1d3-86a3-4321-a9b7-3c8264af56c5	Установка, выверка, снятие детали	\N
4f3b2f2c-c0ad-4c58-9bd5-88b33d82324b	Установка, выверка, снятие детали	\N
52004d9d-2942-40fd-be0e-f3e17513b490	Отсутствие сотрудника ОТК	\N
52cbdda1-f593-4f0f-93d8-219a8eedd454	Праздники и выходные	\N
54c7a6da-e2b8-40b6-89e9-13a8e29fdeb5	Контроль на рабочем месте	\N
5bf9077b-d9d6-49b7-8140-9ee74bca277c	Плановый ремонт централизованными службами	\N
659a1134-b0ed-43e1-986f-c35f47da3b4f	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
70298497-ee3c-45fa-a3f1-f58a5ec1d859	Аварийный ремонт централизованными службами	\N
a0b36aef-e24f-4ce5-86c5-d2548bc8df36	Неявка оператора (б/лист, отпуск, и пр.)	\N
a35e4205-46f0-4194-89fe-05910c9eeae3	Отсутствие крана, транспорта	\N
ad3b0687-ae1c-4d43-95b1-1599d827f21e	Работа по карте несоответствий	\N
b026c340-014f-4ede-8711-cf19b1af6916	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
b62bd675-e371-42d2-8cbc-5aa2986e924c	Работа с управляющей программой	\N
b7efcfa6-f7ac-4d79-98b4-571d6ee1a384	Ознакомление с работой, документацией, инструктаж	\N
d1bde68e-7fee-4ec4-88aa-1d9c497b24d9	Отсутствие материала, заготовок, деталей	\N
ddd373b2-af54-4e89-a2a4-a2c939d7d6eb	Отсутствие энергоносителей	\N
e2664e9a-7f96-41e1-86d3-3448c1cb043e	Естественные надобности	\N
e86fa86e-086c-47f8-a4a4-ce9be22b1e8d	Нерабочее время по графику согласно сменности	\N
f0994d87-733b-4e68-a1a3-1f74fe96c451	Обед	\N
fcf712d1-bfec-41bb-a75b-784be1da5961	Отсутствие оператора в связи с необеспеченностью	\N
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
94405b84-bbea-4bb9-82f7-fe2a1beeff07	cc4d9e49-8555-45fd-a2ac-db6bdfc3ae77	256467
c21c6a5e-75fd-4508-8db3-2380bc4a174e	2f6c32a5-699c-409c-a4a6-047fd001f57d	249550
f79ab90c-1d98-4b86-a831-e973d7440ed6	384a0a30-5b38-4188-a716-bdebcf322d0a	251534
287b94ca-3b8f-48fa-baa4-5ab5ab2589ae	e838089b-d9d6-453f-af79-270d1f8281c1	235565
\.


--
-- Data for Name: MasterWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."MasterWeldingEquipment" ("MastersId", "WeldingEquipmentsId") FROM stdin;
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
327ef2f8-e40d-4e20-ae96-fe75b7dadacc	ab3a46da-bfa7-4c24-abde-09872c4cab73	610422
33af7038-0882-457f-9fa9-757cad3776e1	4c7c9db0-0b18-4721-a4c8-9c282498936c	612000
3fe3021d-5225-40bd-a590-7d8d0703fc79	168cdbaa-bd17-4aee-b002-bf156b306d1a	614962
9a3dbe00-6f39-41c9-b9f6-9661f0a1be06	6216bb10-613e-417b-91c6-a7b4b9b16002	617215
a4c647ca-3503-496f-9ebf-d2e3caef35ed	445ed5af-d0f6-4d05-a813-e59b3beec4fe	614208
aaf8a2f4-ed5d-4dbf-8599-96edb89c97a9	b1ca9dd4-948f-484a-8a79-4c3c8da4ab78	643759
c92dc00e-6b48-404e-9a19-65e3ae7212c4	fb9844a9-c4fc-48c6-9d37-6f741ff30799	613668
b9810266-90ce-4637-8ebe-302abf9d5c29	5d7e376f-7750-44f6-80e8-01cf9ad588ef	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
10c16db5-353b-4bd3-bb12-3470c7a3f7d0	1	Пост 1	218108dc-f1df-499f-8505-32990b78808a	\N
456bee44-a8a9-4357-8c68-105c32085de0	2	Пост 2	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
252ab225-fbb2-42d7-be31-918e7d66c526	0601209b-6fd1-44e6-a725-3125f573c69e
d140961b-c58b-440f-b7b5-d2788cbf5fc2	0a2e0472-f090-4c05-9fe3-f30c53985e3f
bdc34cea-2311-439f-9471-891a81cee359	1b25b75a-fe1d-44e9-8cdf-5eeafb10bbe3
3b093b55-2f5a-4125-aab3-2eda30fb9513	2ef41d30-dbd7-43b2-a89c-f7205cba76d5
e1929879-70a6-4fb6-83d2-178bdb3b063a	3678c345-9b3a-4699-857d-777de3bd53c1
252ab225-fbb2-42d7-be31-918e7d66c526	3b093b55-2f5a-4125-aab3-2eda30fb9513
3b093b55-2f5a-4125-aab3-2eda30fb9513	4bcfaa0d-a944-4779-9159-b4d1b82502e6
73328f77-dd4b-47fa-b151-cccaa506f891	619e4666-f4de-4f96-9e32-dfe50f8d5e01
bdc34cea-2311-439f-9471-891a81cee359	73328f77-dd4b-47fa-b151-cccaa506f891
73328f77-dd4b-47fa-b151-cccaa506f891	757ad482-b2ce-4976-a404-fe5caff3c2d6
b5612c07-396d-4a85-9329-30f10e8cf59a	75a1fc0a-8997-41af-94b2-81e037bee387
b5612c07-396d-4a85-9329-30f10e8cf59a	816667d9-a2af-4595-99bd-e073a4dc2369
1b25b75a-fe1d-44e9-8cdf-5eeafb10bbe3	8bcd3b77-06f7-4467-8fd9-198767ba7d0e
816667d9-a2af-4595-99bd-e073a4dc2369	9028014e-fb8e-4170-a178-f330eb62e9de
1b25b75a-fe1d-44e9-8cdf-5eeafb10bbe3	91c18f17-cb0d-43d2-a5ea-1de2382b60f9
816667d9-a2af-4595-99bd-e073a4dc2369	bab83b84-3271-4015-8a85-1706571b9548
b5612c07-396d-4a85-9329-30f10e8cf59a	c2bf4cfc-f497-4040-b6ea-8810564ba8bc
bdc34cea-2311-439f-9471-891a81cee359	cee68fee-2e06-4731-81a3-3c32ec36a5e0
b5612c07-396d-4a85-9329-30f10e8cf59a	d140961b-c58b-440f-b7b5-d2788cbf5fc2
252ab225-fbb2-42d7-be31-918e7d66c526	d576e1dd-6f64-4617-81c7-4d6b135af1d5
bdc34cea-2311-439f-9471-891a81cee359	d8e089a7-9cd2-466b-b9f9-61d24e2fcc23
252ab225-fbb2-42d7-be31-918e7d66c526	e1929879-70a6-4fb6-83d2-178bdb3b063a
d140961b-c58b-440f-b7b5-d2788cbf5fc2	f2b2e47d-d421-49bf-acb1-b4c5fbc4b6c3
e1929879-70a6-4fb6-83d2-178bdb3b063a	f56e7e65-1f28-4243-921a-31dc86066cc7
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductWelder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductWelder" ("ProductsId", "WeldersId") FROM stdin;
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
218108dc-f1df-499f-8505-32990b78808a	Сборка, сварка мостов	1	92745821-8f18-4c4b-993e-bebbe7e0b409	01
82984a09-e6e1-4d39-9714-08ec4fc93086	Сборка, сварка рам к/с г/п 120-130 т.	6	92745821-8f18-4c4b-993e-bebbe7e0b409	06
8542d6c5-9b88-41c3-9672-b7f1c6893ded	Сборка, сварка узл. и рам к/с г/п 120-220т	4	92745821-8f18-4c4b-993e-bebbe7e0b409	04
9cce8fc5-f80b-42b9-9586-7dfa46e0769c	Производственный участок 5	5	3430590d-86d9-44f6-8b16-7bf61ad54cf8	05
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0601209b-6fd1-44e6-a725-3125f573c69e	Кронштейн	75131-2113296-10	t	3	91e36fdb-ff3d-43a6-a544-9068824e3649	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536461620
0a2e0472-f090-4c05-9fe3-f30c53985e3f	Кронштейн	75304-1001253	t	3	49324283-db20-4c87-b961-ccf2f59d0699	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536248708
1b25b75a-fe1d-44e9-8cdf-5eeafb10bbe3	Труба картера заднего моста	75580-2401010-01	t	2	d201847d-e603-4b5a-8c09-3307ec478e1a	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536386240
252ab225-fbb2-42d7-be31-918e7d66c526	Картер заднего моста	75132-2401006-50	t	1	e517e6e3-b5d9-4cb9-87c8-bd7032ccb57b	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536467567
2ef41d30-dbd7-43b2-a89c-f7205cba76d5	Распорка	7521-3932688	t	3	a6289b6a-9fe1-4979-9ada-03cc37c9e027	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536273606
3b093b55-2f5a-4125-aab3-2eda30fb9513	Кронштейн	7521-2401220	t	2	32bb8499-74a5-4893-9417-6be616c03a68	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536273956
4bcfaa0d-a944-4779-9159-b4d1b82502e6	Проушина	7521-2401224	t	3	56858134-796e-4b30-95b2-18a357d88e2e	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536274170
619e4666-f4de-4f96-9e32-dfe50f8d5e01	Втулка	75303-2128438	t	3	c01e8c36-a2a9-4b1f-8216-5161547a5be0	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536248270
73328f77-dd4b-47fa-b151-cccaa506f891	Картер заднего моста	75580-2401008	t	2	72008d82-1109-4d54-8054-e631c7f72f72	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536384295
757ad482-b2ce-4976-a404-fe5caff3c2d6	Кольцо	75580-2401227	t	3	2264c3b1-4f0a-4b5e-bde7-588d463167fa	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536384312
75a1fc0a-8997-41af-94b2-81e037bee387	Кронштейн	75211-1018162	t	3	83699f26-6e35-44ea-bdaa-7a27e13a51c5	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536270344
816667d9-a2af-4595-99bd-e073a4dc2369	Кронштейн	75310-1183100	t	2	0440d60f-975c-4f71-ad9b-00a0e2b641b9	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536267493
8bcd3b77-06f7-4467-8fd9-198767ba7d0e	Труба картера	75580-2401132-10	t	3	468e3370-0d5c-4a8b-bf9b-a0db86cd8086	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536386250
9028014e-fb8e-4170-a178-f330eb62e9de	Кронштейн	75310-1183102	t	3	d2311528-4063-44f5-a50c-171f2d148747	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536267484
91c18f17-cb0d-43d2-a5ea-1de2382b60f9	Фланец картера	75580-2401114-11	t	3	cc100e02-3f49-49e0-b984-a5c2aef1ee3d	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536386265
b5612c07-396d-4a85-9329-30f10e8cf59a	Рама	75313-2800010-20	t	1	33ca7551-e1b6-46e0-8119-da1da88e2891	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536287819
bab83b84-3271-4015-8a85-1706571b9548	Кронштейн	75310-1183106	t	3	efdf4ca7-bdda-419d-9575-76466ec7b95d	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536267485
bdc34cea-2311-439f-9471-891a81cee359	Картер заднего моста	75580-2401006	t	1	20478b65-ffd5-422c-872d-753a84c62f4e	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536384294
c2bf4cfc-f497-4040-b6ea-8810564ba8bc	Накладка	549Б-1015842	t	3	d21a73f6-1105-48f6-b632-2c032ea97e07	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536196288
cee68fee-2e06-4731-81a3-3c32ec36a5e0	Кронштейн	75580-2113192	t	3	fe0c06ab-bdef-4819-ba78-dea1f10befbe	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536384314
d140961b-c58b-440f-b7b5-d2788cbf5fc2	Кронштейн амортизатора левый	75304-1001251	t	2	be79429a-286a-4652-a927-bb4d4b57831f	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536248707
d576e1dd-6f64-4617-81c7-4d6b135af1d5	Панель	75132-2105522	t	3	529b08f4-f71d-4a91-be9b-ec10ef83f9e4	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536417730
e1929879-70a6-4fb6-83d2-178bdb3b063a	Картер заднего моста	75132-2401008-50	t	2	d8ef9f33-5ad5-4221-af36-373f00588673	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536467565
f2b2e47d-d421-49bf-acb1-b4c5fbc4b6c3	Кронштейн	75303-1001293	t	3	022d34ef-9120-4c25-933a-270cdfdf085b	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N	\N	4536247228
f56e7e65-1f28-4243-921a-31dc86066cc7	Пластина	75132-2401106	t	3	848f3b15-a844-4986-a0df-29cc9df2cbe2	218108dc-f1df-499f-8505-32990b78808a	\N	\N	\N	4536444153
3678c345-9b3a-4699-857d-777de3bd53c1	Опора	75211-2401122	t	3	ff73a529-5daa-401f-83f1-725529cff27e	218108dc-f1df-499f-8505-32990b78808a	b9810266-90ce-4637-8ebe-302abf9d5c29	\N	\N	4536276803
d8e089a7-9cd2-466b-b9f9-61d24e2fcc23	Панель	75580-2105522	t	3	ae246257-59c5-4d5b-a191-9e85a29a5131	218108dc-f1df-499f-8505-32990b78808a	b9810266-90ce-4637-8ebe-302abf9d5c29	\N	\N	4536384399
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
c5343519-ed0e-46ae-b8df-2b6a8bb46ae3	Admin	\N
bede039e-28de-41b3-b479-5b6fe24b316c	Master	\N
e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77	Welder	\N
6b947412-be9b-4a92-9905-5c6f5dbf543a	Inspector	\N
ae900e3d-9273-4218-9210-434c59e53a14	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
27563c49-2939-4e03-a437-b4ac74d7dd25	1	111	t	f	252ab225-fbb2-42d7-be31-918e7d66c526	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N	\N
58c2b06e-4b5f-4484-b60c-5231a21ac094	2	222	t	f	252ab225-fbb2-42d7-be31-918e7d66c526	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N	\N
9d8643d9-b806-4b6e-b5e7-7aecc19b85d9	4	222	t	f	b5612c07-396d-4a85-9329-30f10e8cf59a	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N	\N
e323de10-291d-47fa-b645-fbc4ff927af2	3	333	t	f	b5612c07-396d-4a85-9329-30f10e8cf59a	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N	\N
910f4cec-0079-4caf-a2ae-ca32df6c6218	2	200	t	f	d8e089a7-9cd2-466b-b9f9-61d24e2fcc23	4e315aa4-66e9-49a8-8c88-c3f2dcd3539a	287b94ca-3b8f-48fa-baa4-5ab5ab2589ae	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N
c90510e3-551b-4542-a093-767d26303031	1	100	t	f	3678c345-9b3a-4699-857d-777de3bd53c1	9a0e793e-d013-4f90-9938-1c8619e2a0a8	287b94ca-3b8f-48fa-baa4-5ab5ab2589ae	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
4e315aa4-66e9-49a8-8c88-c3f2dcd3539a	1	ИТП	\N
9a0e793e-d013-4f90-9938-1c8619e2a0a8	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
022d34ef-9120-4c25-933a-270cdfdf085b	3049271	Технологический процесс	Ссылка	3049271
0440d60f-975c-4f71-ad9b-00a0e2b641b9	1823031	Технологический процесс	Ссылка	1823031
20478b65-ffd5-422c-872d-753a84c62f4e	2433634	Технологический процесс	Ссылка	2433634
2264c3b1-4f0a-4b5e-bde7-588d463167fa	1402616	Технологический процесс	Ссылка	1402616
32bb8499-74a5-4893-9417-6be616c03a68	1362989	Технологический процесс	Ссылка	1362989
33ca7551-e1b6-46e0-8119-da1da88e2891	3239598	Технологический процесс	Ссылка	3239598
468e3370-0d5c-4a8b-bf9b-a0db86cd8086	2822569	Технологический процесс	Ссылка	2822569
49324283-db20-4c87-b961-ccf2f59d0699	1492964	Технологический процесс	Ссылка	1492964
529b08f4-f71d-4a91-be9b-ec10ef83f9e4	1053809	Технологический процесс	Ссылка	1053809
56858134-796e-4b30-95b2-18a357d88e2e	1124147	Технологический процесс	Ссылка	1124147
72008d82-1109-4d54-8054-e631c7f72f72	3232938	Технологический процесс	Ссылка	3232938
83699f26-6e35-44ea-bdaa-7a27e13a51c5	2841119	Технологический процесс	Ссылка	2841119
848f3b15-a844-4986-a0df-29cc9df2cbe2	1003048	Технологический процесс	Ссылка	1003048
91e36fdb-ff3d-43a6-a544-9068824e3649	526870	Технологический процесс	Ссылка	526870
a6289b6a-9fe1-4979-9ada-03cc37c9e027	908693	Технологический процесс	Ссылка	908693
ae246257-59c5-4d5b-a191-9e85a29a5131	1405307	Технологический процесс	Ссылка	1405307
be79429a-286a-4652-a927-bb4d4b57831f	1334123	Технологический процесс	Ссылка	1334123
c01e8c36-a2a9-4b1f-8216-5161547a5be0	3011514	Технологический процесс	Ссылка	3011514
cc100e02-3f49-49e0-b984-a5c2aef1ee3d	3338649	Технологический процесс	Ссылка	3338649
d201847d-e603-4b5a-8c09-3307ec478e1a	2915477	Технологический процесс	Ссылка	2915477
d21a73f6-1105-48f6-b632-2c032ea97e07	1426226	Технологический процесс	Ссылка	1426226
d2311528-4063-44f5-a50c-171f2d148747	1104641	Технологический процесс	Ссылка	1104641
d8ef9f33-5ad5-4221-af36-373f00588673	3232836	Технологический процесс	Ссылка	3232836
e517e6e3-b5d9-4cb9-87c8-bd7032ccb57b	3090319	Технологический процесс	Ссылка	3090319
efdf4ca7-bdda-419d-9575-76466ec7b95d	1119363	Технологический процесс	Ссылка	1119363
fe0c06ab-bdef-4819-ba78-dea1f10befbe	1405914	Технологический процесс	Ссылка	1405914
ff73a529-5daa-401f-83f1-725529cff27e	3211246	Технологический процесс	Ссылка	3211246
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
2f6c32a5-699c-409c-a4a6-047fd001f57d	6b947412-be9b-4a92-9905-5c6f5dbf543a
384a0a30-5b38-4188-a716-bdebcf322d0a	6b947412-be9b-4a92-9905-5c6f5dbf543a
cc4d9e49-8555-45fd-a2ac-db6bdfc3ae77	6b947412-be9b-4a92-9905-5c6f5dbf543a
168cdbaa-bd17-4aee-b002-bf156b306d1a	bede039e-28de-41b3-b479-5b6fe24b316c
445ed5af-d0f6-4d05-a813-e59b3beec4fe	bede039e-28de-41b3-b479-5b6fe24b316c
4c7c9db0-0b18-4721-a4c8-9c282498936c	bede039e-28de-41b3-b479-5b6fe24b316c
6216bb10-613e-417b-91c6-a7b4b9b16002	bede039e-28de-41b3-b479-5b6fe24b316c
ab3a46da-bfa7-4c24-abde-09872c4cab73	bede039e-28de-41b3-b479-5b6fe24b316c
b1ca9dd4-948f-484a-8a79-4c3c8da4ab78	bede039e-28de-41b3-b479-5b6fe24b316c
fb9844a9-c4fc-48c6-9d37-6f741ff30799	bede039e-28de-41b3-b479-5b6fe24b316c
028d3a53-ec61-4e2e-b69c-b89c9935f500	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
1d76bade-1f28-4359-967c-c27c4ba4f736	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
2281e54a-a49f-430f-b153-845339fb90e9	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
2af5907a-674d-4697-a0ec-490e36a4a77e	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
32fca6f0-3d5d-4fa3-9d66-599951243a27	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
3d28e3ff-ff3a-449c-9363-943a1b731074	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
48ed83ad-4035-4d84-8e64-32212f362913	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
4d4fcdfa-56ef-418b-9dc0-c4e735ebda0e	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
53860059-3cb3-4fb2-ae0d-5b0cbceb734b	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
58dc910b-883a-4166-b447-9df99328688e	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
7158cb38-ad85-4eaa-8a03-4c33bf9422c2	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
79f58a8d-dd79-4d31-af57-e3cba5732021	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
7ca33b04-aa78-48b1-af8e-7867cb1c75ab	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
861d1408-d5df-4eb8-83f1-8f15980d4bfc	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
a1f21759-98da-4b13-8b61-6ededfeaf996	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
c1f354dc-c55c-44d0-aeaa-80286d510bb1	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
d762cfda-5239-4591-b0db-c7138c55d612	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
dbce5537-c0db-44ee-a328-b1995f2c33fd	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
dd5eb043-36b4-4980-a490-45f86352ca9e	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
eab52ff0-a0b3-4ec5-a2eb-ecdac16770b3	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
f927a4d3-bd5f-4e47-9977-b91c90b318e4	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
f985329d-2d47-4a17-a84e-b2c097d94e06	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
e076aebe-dcba-4893-83cf-b5299e490ee5	ae900e3d-9273-4218-9210-434c59e53a14
5d7e376f-7750-44f6-80e8-01cf9ad588ef	bede039e-28de-41b3-b479-5b6fe24b316c
e838089b-d9d6-453f-af79-270d1f8281c1	6b947412-be9b-4a92-9905-5c6f5dbf543a
0d4956eb-e8ac-42e7-801c-46079429ed18	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
67e9944d-c7d0-4668-9316-bcd127a3c704	c5343519-ed0e-46ae-b8df-2b6a8bb46ae3
41dd9538-a8b4-49bf-a0f7-222faf7540a7	e319d1b4-1fa6-493f-b0e5-ad4b7ae59f77
b26ca4b7-2100-4f12-92f3-2f07df949694	6b947412-be9b-4a92-9905-5c6f5dbf543a
84480042-860e-45af-b6aa-fad111a6a160	ae900e3d-9273-4218-9210-434c59e53a14
0194e542-42d3-430d-9706-80f271fbee62	bede039e-28de-41b3-b479-5b6fe24b316c
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
2f6c32a5-699c-409c-a4a6-047fd001f57d	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
384a0a30-5b38-4188-a716-bdebcf322d0a	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	9cce8fc5-f80b-42b9-9586-7dfa46e0769c	\N
cc4d9e49-8555-45fd-a2ac-db6bdfc3ae77	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	9cce8fc5-f80b-42b9-9586-7dfa46e0769c	\N
168cdbaa-bd17-4aee-b002-bf156b306d1a	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
445ed5af-d0f6-4d05-a813-e59b3beec4fe	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N
4c7c9db0-0b18-4721-a4c8-9c282498936c	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
6216bb10-613e-417b-91c6-a7b4b9b16002	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N
ab3a46da-bfa7-4c24-abde-09872c4cab73	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
b1ca9dd4-948f-484a-8a79-4c3c8da4ab78	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
fb9844a9-c4fc-48c6-9d37-6f741ff30799	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
028d3a53-ec61-4e2e-b69c-b89c9935f500	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
1d76bade-1f28-4359-967c-c27c4ba4f736	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
2281e54a-a49f-430f-b153-845339fb90e9	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
2af5907a-674d-4697-a0ec-490e36a4a77e	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N
32fca6f0-3d5d-4fa3-9d66-599951243a27	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
3d28e3ff-ff3a-449c-9363-943a1b731074	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
48ed83ad-4035-4d84-8e64-32212f362913	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
4d4fcdfa-56ef-418b-9dc0-c4e735ebda0e	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
53860059-3cb3-4fb2-ae0d-5b0cbceb734b	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
58dc910b-883a-4166-b447-9df99328688e	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
7158cb38-ad85-4eaa-8a03-4c33bf9422c2	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N
79f58a8d-dd79-4d31-af57-e3cba5732021	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
7ca33b04-aa78-48b1-af8e-7867cb1c75ab	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
861d1408-d5df-4eb8-83f1-8f15980d4bfc	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
a1f21759-98da-4b13-8b61-6ededfeaf996	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
c1f354dc-c55c-44d0-aeaa-80286d510bb1	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
d762cfda-5239-4591-b0db-c7138c55d612	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
dbce5537-c0db-44ee-a328-b1995f2c33fd	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	\N
dd5eb043-36b4-4980-a490-45f86352ca9e	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
eab52ff0-a0b3-4ec5-a2eb-ecdac16770b3	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	218108dc-f1df-499f-8505-32990b78808a	\N
f927a4d3-bd5f-4e47-9977-b91c90b318e4	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
f985329d-2d47-4a17-a84e-b2c097d94e06	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
e076aebe-dcba-4893-83cf-b5299e490ee5	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
5d7e376f-7750-44f6-80e8-01cf9ad588ef	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
0d4956eb-e8ac-42e7-801c-46079429ed18	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
e838089b-d9d6-453f-af79-270d1f8281c1	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	\N
67e9944d-c7d0-4668-9316-bcd127a3c704	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$mozFkBCBs6jAN85Kc/UNyy/pdv+D6A/KO25aM2U01pBIiKZ7	\N	\N	\N	\N	\N	\N
41dd9538-a8b4-49bf-a0f7-222faf7540a7	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$JkzrVgyyCjUmt73T87my+yn1f66bDQgEACvxlEGW8WTfCmC1	\N	\N	\N	\N	\N	\N
b26ca4b7-2100-4f12-92f3-2f07df949694	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$e5rPuCHm6ZvM8PvkAYQzbX/7Ebv3guEVgyio0dHFyLx52QYt	\N	\N	\N	\N	\N	\N
84480042-860e-45af-b6aa-fad111a6a160	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$82kX0t82mGIwRctbRbOMeXL5bZE+LspgehH4qze31dmx94w9	\N	\N	\N	\N	\N	\N
0194e542-42d3-430d-9706-80f271fbee62	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$GrouoHahIHYSyyuP3pMBkciTZpsGgZRiROq9V8JjTyVX8BA1	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
13984931-0216-4a17-82c4-377d0efc205c	1	Корневой	80	120	22	24	50	250	9a0e793e-d013-4f90-9938-1c8619e2a0a8	\N
b1d81d7e-2109-4596-8aae-b16f5d04ff85	2	Заполняющий	80	120	21	25	50	250	9a0e793e-d013-4f90-9938-1c8619e2a0a8	\N
bf70218e-ab05-4a72-8f59-19057bb8b542	2	Заполняющий	80	120	21	25	50	250	4e315aa4-66e9-49a8-8c88-c3f2dcd3539a	\N
e32b7529-17f5-45bf-ab7e-5a97b7d2c957	1	Корневой	80	120	\N	\N	50	250	4e315aa4-66e9-49a8-8c88-c3f2dcd3539a	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
16b49b35-0b4d-4db9-b0ae-0c5814adcc90	2	Заполняющий	0.22	0.44	\N	\N	\N	63b25446-5dc1-4911-bc1d-4dca88a6fd9b	3a9982d7-d413-481f-85e4-14edd4f679b8	\N
9614c4d6-d62e-4e69-ac87-eab6a9a4981d	1	Корневой	0.11	0.68	\N	\N	\N	e32b1176-83f1-467c-84b2-180e7f87a81b	15dcb4b5-7353-4bf4-8a4f-faa14b770f7b	\N
98270b45-b4b2-47eb-a873-c421c16aabc1	1	Корневой	0.11	0.68	\N	\N	\N	dac164d1-d6b1-42b9-aaca-1fa13eacd260	3a9982d7-d413-481f-85e4-14edd4f679b8	\N
c83d6132-0556-4bf6-853f-477d45e1701d	2	Заполняющий	0.22	0.44	\N	\N	\N	d9c62a4b-73b3-4655-aea2-95d43c4ab7f5	15dcb4b5-7353-4bf4-8a4f-faa14b770f7b	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
04c3df8e-6ebe-4761-ba85-1e24f126248c	8eceae38-45c9-48f8-846f-4aa3a4f7de26
091eb298-7e33-4586-b00b-2104d1d59170	a775fede-4532-4688-aad1-f0afe336f228
26078b29-4ce0-450a-8ef7-a1d4f1f79299	8eceae38-45c9-48f8-846f-4aa3a4f7de26
30fd00b3-03ed-41f7-a577-c1f4d2a3b6e0	36278336-92c3-416d-b4a1-50e852bd443f
32acabe5-4dda-4481-8481-0f334c2be12e	a775fede-4532-4688-aad1-f0afe336f228
3f878045-d6dc-4408-acfc-01fb1d41f3c1	7d709452-ada8-4bb6-bfc4-105bd7483b64
410fba97-f138-4b2c-8fb7-26011e2afb85	36278336-92c3-416d-b4a1-50e852bd443f
48516452-4c09-47d3-8912-7e023ce88260	8eceae38-45c9-48f8-846f-4aa3a4f7de26
4b4cf28c-1e01-4ba5-aeb6-690353b9eae3	7d709452-ada8-4bb6-bfc4-105bd7483b64
54842645-068b-421d-94c0-1e6882ea5203	f26239c3-fdd3-4bf6-98b7-ef94217e78cf
5aeaecd3-21ef-402b-a9de-33482a538661	0f75e474-6203-42ab-a6aa-a7522d8ab3d1
6200d7a1-b577-437b-b663-ed9bd1120ef3	54918d85-6ec9-497d-96d9-60ae79573283
65068a57-43c2-42a9-8eda-ed2380dff416	8eceae38-45c9-48f8-846f-4aa3a4f7de26
86695e83-1da5-4001-ac65-0740814d9ae5	f26239c3-fdd3-4bf6-98b7-ef94217e78cf
907c8093-5508-4d45-b4b2-fd993c0cfe82	9e741f06-4e2b-4520-b566-2817fbf036b8
b5dea8c7-bb81-4e44-9028-cd59f66e1f3a	a775fede-4532-4688-aad1-f0afe336f228
c06c756c-dd63-4be0-99fd-cf33edb9426c	0f75e474-6203-42ab-a6aa-a7522d8ab3d1
c73a1a4d-f4ef-431b-837c-ab1179c01ccd	8eceae38-45c9-48f8-846f-4aa3a4f7de26
e5c026ba-06e5-4484-8362-aa8f925a83b9	9e741f06-4e2b-4520-b566-2817fbf036b8
e979a203-d5d5-4ebc-a34d-772f3a8ea4b2	a775fede-4532-4688-aad1-f0afe336f228
fcc30e03-7e61-45c3-a4ff-3b45c6980179	54918d85-6ec9-497d-96d9-60ae79573283
ff5b8de7-56a5-4433-b637-1796ba4e3657	f26239c3-fdd3-4bf6-98b7-ef94217e78cf
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
04c3df8e-6ebe-4761-ba85-1e24f126248c	2281e54a-a49f-430f-b153-845339fb90e9	\N	121538
091eb298-7e33-4586-b00b-2104d1d59170	48ed83ad-4035-4d84-8e64-32212f362913	\N	152441
26078b29-4ce0-450a-8ef7-a1d4f1f79299	3d28e3ff-ff3a-449c-9363-943a1b731074	\N	156298
30fd00b3-03ed-41f7-a577-c1f4d2a3b6e0	dbce5537-c0db-44ee-a328-b1995f2c33fd	fdd0f18a-396e-4763-b4af-02b0b729ae1c	132695
32acabe5-4dda-4481-8481-0f334c2be12e	f927a4d3-bd5f-4e47-9977-b91c90b318e4	\N	153274
3f878045-d6dc-4408-acfc-01fb1d41f3c1	028d3a53-ec61-4e2e-b69c-b89c9935f500	813f514a-16a9-46b7-8197-5d9e9bd4ce42	117390
410fba97-f138-4b2c-8fb7-26011e2afb85	c1f354dc-c55c-44d0-aeaa-80286d510bb1	df1be53e-c23f-4115-aaec-118408a70ef3	145092
48516452-4c09-47d3-8912-7e023ce88260	dd5eb043-36b4-4980-a490-45f86352ca9e	\N	147329
4b4cf28c-1e01-4ba5-aeb6-690353b9eae3	32fca6f0-3d5d-4fa3-9d66-599951243a27	3f07741e-13bd-4327-a3ba-132817b4e5d0	121267
54842645-068b-421d-94c0-1e6882ea5203	2af5907a-674d-4697-a0ec-490e36a4a77e	\N	152444
5aeaecd3-21ef-402b-a9de-33482a538661	d762cfda-5239-4591-b0db-c7138c55d612	c6c574d4-cb4f-4542-be6f-f0a496d0e90c	120756
6200d7a1-b577-437b-b663-ed9bd1120ef3	58dc910b-883a-4166-b447-9df99328688e	\N	150402
65068a57-43c2-42a9-8eda-ed2380dff416	53860059-3cb3-4fb2-ae0d-5b0cbceb734b	\N	121537
86695e83-1da5-4001-ac65-0740814d9ae5	eab52ff0-a0b3-4ec5-a2eb-ecdac16770b3	\N	152207
907c8093-5508-4d45-b4b2-fd993c0cfe82	7ca33b04-aa78-48b1-af8e-7867cb1c75ab	823ba3f6-67c4-4f7e-a5cb-b4b502ac9a7b	150882
b5dea8c7-bb81-4e44-9028-cd59f66e1f3a	861d1408-d5df-4eb8-83f1-8f15980d4bfc	\N	155288
c06c756c-dd63-4be0-99fd-cf33edb9426c	a1f21759-98da-4b13-8b61-6ededfeaf996	813f514a-16a9-46b7-8197-5d9e9bd4ce42	146325
c73a1a4d-f4ef-431b-837c-ab1179c01ccd	f985329d-2d47-4a17-a84e-b2c097d94e06	\N	152365
e5c026ba-06e5-4484-8362-aa8f925a83b9	4d4fcdfa-56ef-418b-9dc0-c4e735ebda0e	dc24ac6b-c914-4d7d-9cea-d4cbc2c617db	151299
e979a203-d5d5-4ebc-a34d-772f3a8ea4b2	1d76bade-1f28-4359-967c-c27c4ba4f736	\N	151861
fcc30e03-7e61-45c3-a4ff-3b45c6980179	79f58a8d-dd79-4d31-af57-e3cba5732021	\N	149921
ff5b8de7-56a5-4433-b637-1796ba4e3657	7158cb38-ad85-4eaa-8a03-4c33bf9422c2	\N	156278
ba177e16-0ce7-45d2-b55a-8889c498e559	0d4956eb-e8ac-42e7-801c-46079429ed18	\N	\N
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
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "IdFromSystem") FROM stdin;
0f75e474-6203-42ab-a6aa-a7522d8ab3d1	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
36278336-92c3-416d-b4a1-50e852bd443f	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
54918d85-6ec9-497d-96d9-60ae79573283	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
7d709452-ada8-4bb6-bfc4-105bd7483b64	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
8eceae38-45c9-48f8-846f-4aa3a4f7de26	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
9e741f06-4e2b-4520-b566-2817fbf036b8	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
a775fede-4532-4688-aad1-f0afe336f228	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
f26239c3-fdd3-4bf6-98b7-ef94217e78cf	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
d7b964d7-4661-4d7e-91be-3d9e1f3650b7	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
f9341aa1-e4fb-4e7d-8e37-2316a478dacc	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "WeldingCurrentValues", "ArcVoltageValues", "IdFromSystem") FROM stdin;
63b25446-5dc1-4911-bc1d-4dca88a6fd9b	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	\N
d9c62a4b-73b3-4655-aea2-95d43c4ab7f5	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	\N
dac164d1-d6b1-42b9-aaca-1fa13eacd260	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	\N
e32b1176-83f1-467c-84b2-180e7f87a81b	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
15dcb4b5-7353-4bf4-8a4f-faa14b770f7b	1	1	f	2023-02-19 00:37:34.2529	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	c90510e3-551b-4542-a093-767d26303031	d7b964d7-4661-4d7e-91be-3d9e1f3650b7	ba177e16-0ce7-45d2-b55a-8889c498e559	b9810266-90ce-4637-8ebe-302abf9d5c29	287b94ca-3b8f-48fa-baa4-5ab5ab2589ae	\N
3a9982d7-d413-481f-85e4-14edd4f679b8	2	1	f	2023-02-19 00:37:34.255197	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	910f4cec-0079-4caf-a2ae-ca32df6c6218	f9341aa1-e4fb-4e7d-8e37-2316a478dacc	ba177e16-0ce7-45d2-b55a-8889c498e559	b9810266-90ce-4637-8ebe-302abf9d5c29	287b94ca-3b8f-48fa-baa4-5ab5ab2589ae	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
276e9b85-5afe-405c-90ad-ab874f6e71fc	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	275c578d-65b8-4cfa-a0f0-9a6a68c93647	\N
7ef8cc7a-1a58-4a26-b700-05ec67917ba4	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	275c578d-65b8-4cfa-a0f0-9a6a68c93647	\N
c95e6a8d-2d4b-4e33-9561-66b79e233b51	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	275c578d-65b8-4cfa-a0f0-9a6a68c93647	\N
d279dda4-0d5c-4e66-b119-8c0ec2837827	1	12:10:00	13:10:00	13:20:00	13:50:00	5d50d16f-f9b4-4ac4-ad2a-3f3d6627192a	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
05333f5a-1f81-4253-bb21-3ea6c54acc34	1260	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1260
1259acd1-a333-4c81-af6b-346031d20219	1270	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1270
293c424d-ddc0-4204-b172-0b27e9868b85	1280	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1280
2bb4e017-8999-4e0b-b4fb-f4f0648687cc	1390	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1390
34fe96c4-7954-4f9b-bcb6-436d7354bf5d	2150	\N	218108dc-f1df-499f-8505-32990b78808a	2150
35e83cb5-172f-45ea-aa5c-a321899980e0	2130	\N	218108dc-f1df-499f-8505-32990b78808a	2130
3f07741e-13bd-4327-a3ba-132817b4e5d0	3600	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3600
60c6edd5-ef94-4492-987d-186736388af3	1400	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1400
687f5339-44dc-4360-8050-7be436216656	1550	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1550
6e440e6d-c5ae-44df-9396-757f5356cd5b	2050	\N	218108dc-f1df-499f-8505-32990b78808a	2050
813f514a-16a9-46b7-8197-5d9e9bd4ce42	3610	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3610
823ba3f6-67c4-4f7e-a5cb-b4b502ac9a7b	3690	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3690
c6c574d4-cb4f-4542-be6f-f0a496d0e90c	3520	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3520
dc24ac6b-c914-4d7d-9cea-d4cbc2c617db	3650	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3650
df1be53e-c23f-4115-aaec-118408a70ef3	3590	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3590
f480494f-059c-45dc-be51-4b9ef8c2edb9	1360	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1360
f50f4e8d-bfa8-4c7f-bbfd-36827c6b5ea6	1380	\N	8542d6c5-9b88-41c3-9672-b7f1c6893ded	1380
fdd0f18a-396e-4763-b4af-02b0b729ae1c	3500	\N	82984a09-e6e1-4d39-9714-08ec4fc93086	3500
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
3430590d-86d9-44f6-8b16-7bf61ad54cf8	Цех 480	480	480
92745821-8f18-4c4b-993e-bebbe7e0b409	Цех 50	50	050
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
-- Name: MasterWeldingEquipment PK_MasterWeldingEquipment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MasterWeldingEquipment"
    ADD CONSTRAINT "PK_MasterWeldingEquipment" PRIMARY KEY ("MastersId", "WeldingEquipmentsId");


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
-- Name: ProductWelder PK_ProductWelder; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductWelder"
    ADD CONSTRAINT "PK_ProductWelder" PRIMARY KEY ("ProductsId", "WeldersId");


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
-- Name: IX_MasterWeldingEquipment_WeldingEquipmentsId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_MasterWeldingEquipment_WeldingEquipmentsId" ON public."MasterWeldingEquipment" USING btree ("WeldingEquipmentsId");


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
-- Name: IX_ProductWelder_WeldersId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductWelder_WeldersId" ON public."ProductWelder" USING btree ("WeldersId");


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
-- Name: IX_WeldingTasks_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_WeldingEquipmentId" ON public."WeldingTasks" USING btree ("WeldingEquipmentId");


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
-- Name: MasterWeldingEquipment FK_MasterWeldingEquipment_Masters_MastersId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MasterWeldingEquipment"
    ADD CONSTRAINT "FK_MasterWeldingEquipment_Masters_MastersId" FOREIGN KEY ("MastersId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


--
-- Name: MasterWeldingEquipment FK_MasterWeldingEquipment_WeldingEquipments_WeldingEquipmentsId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MasterWeldingEquipment"
    ADD CONSTRAINT "FK_MasterWeldingEquipment_WeldingEquipments_WeldingEquipmentsId" FOREIGN KEY ("WeldingEquipmentsId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


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
-- Name: ProductWelder FK_ProductWelder_Products_ProductsId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductWelder"
    ADD CONSTRAINT "FK_ProductWelder_Products_ProductsId" FOREIGN KEY ("ProductsId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- Name: ProductWelder FK_ProductWelder_Welders_WeldersId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductWelder"
    ADD CONSTRAINT "FK_ProductWelder_Welders_WeldersId" FOREIGN KEY ("WeldersId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_Seams_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id");


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
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Inspectors_InspectorId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Inspectors_InspectorId" FOREIGN KEY ("InspectorId") REFERENCES public."Inspectors"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_WeldingTasks_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


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

