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
    "WeldingEquipmentId" uuid,
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
-- Name: ProductInsides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductInsides" (
    "MainProductId" uuid NOT NULL,
    "InsideProductId" uuid NOT NULL
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
    "Name" text,
    "Number" text NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductType" integer NOT NULL,
    "WeldingTaskId" uuid,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "MasterId" uuid,
    "InspectorId" uuid,
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
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "WelderId" uuid,
    "InspectorId" uuid,
    "IdFromSystem" text
);


--
-- Name: StatusReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StatusReasons" (
    "Id" uuid NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Status" integer NOT NULL,
    "Reason" text NOT NULL,
    "ProductId" uuid,
    "SeamId" uuid,
    "IdFromSystem" text
);


--
-- Name: TechnologicalInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalInstructions" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "SeamId" uuid NOT NULL,
    "TechnologicalProcessId" uuid,
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
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
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
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "IsDone" boolean NOT NULL,
    "SeamId" uuid NOT NULL,
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
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "WeldingDate" timestamp without time zone,
    "BasicMaterial" text NOT NULL,
    "MainMaterialBatchNumber" text NOT NULL,
    "WeldingMaterial" text NOT NULL,
    "WeldingMaterialBatchNumber" text NOT NULL,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "IdFromSystem" text
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
54132500-0a46-48a9-8fd0-0d4651cd8c52	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
33416470-aba2-4906-918c-3b8575b4734b	1c4a85fb-0693-4e37-90b9-7aae24acf777	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
d7182742-194e-4dd8-b06f-3d7af4c48fb3	1	10	t	54132500-0a46-48a9-8fd0-0d4651cd8c52	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
1293ac5b-e171-4478-8f81-7faeb6eb82a8	Изменение режимов, смена инструмента, приспособления	\N
1ca9f86b-d814-4e7e-9993-daf3b54b5ee4	Отсутствие крана, транспорта	\N
32207fab-f264-46fe-a5e0-aceead157125	Аварийный ремонт централизованными службами	\N
3765b872-4fee-4060-8f36-b78b5fc91e33	Нерабочее время по графику согласно сменности	\N
3a40c4ca-a355-4fb3-a3fa-922e54b5dffd	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
4cd356e5-c454-452b-b4d9-bcd72ab4ee8e	Отсутствие оператора в связи с необеспеченностью	\N
546fa571-a0e8-4989-8ec6-119878b89586	Установка, выверка, снятие детали	\N
5a348d37-a9d1-4345-882c-187fb34635e6	Сборочные операции	\N
608c4118-b6e0-42dc-874e-9ddab48e051d	Установка, выверка, снятие детали	\N
628cd014-e6f7-453b-a97a-abbba235ec4c	Отсутствие материала, заготовок, деталей	\N
6358366a-64de-4c39-9d5f-386bf44b51a8	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
669a2a9e-d511-43ca-b306-f536e3149d1b	Отсутствие сотрудника ОТК	\N
74067d7e-a98f-4fc7-9c35-761febe9a6a3	Праздники и выходные	\N
90236e7c-acdc-4dd0-ac4f-7e4b9385a2fd	Неявка оператора (б/лист, отпуск, и пр.)	\N
96246ae7-7ffa-4d26-8d68-f3613229c1cf	Отсутствие конструктора, технолога или ожидание его решения	\N
9dd2633f-96db-4333-b243-afa51fda657a	Плановый ремонт централизованными службами	\N
a6110df9-c03c-4651-b001-b05145b72d9b	Работа по карте несоответствий	\N
be37b2ae-5581-4b77-957a-d03f020c5bfa	Ознакомление с работой, документацией, инструктаж	\N
c1d50bad-727c-4b03-8251-f509f278988c	Отсутствие энергоносителей	\N
c52350f9-fdbf-461b-83a7-c3426a631c7e	Отсутствие заданий	\N
ca08bb39-fa3f-493f-8729-b59e384569e7	Работа с управляющей программой	\N
f25ceac3-f5fc-4532-8fd2-1842303afb39	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
f67b3905-63a0-4f79-a013-7a802aec2bfd	Естественные надобности	\N
f92cb006-56bb-4b9b-8332-afd239075012	Обед	\N
fa4fcb73-149f-440a-bacf-7433be08e798	Контроль на рабочем месте	\N
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
09f9a092-24f2-450d-9c17-592b44553ea1	e4c64967-5955-4a74-aa86-c6fc1052e532	256467
79295d32-8aa4-4669-b22e-0650e644c4da	42629d2a-c0d2-4260-8ce6-0dc035794af8	235565
f683d779-1c2f-41be-b124-1361daf60611	3ae4d8d1-e969-47ee-ae48-fe1ddf24109f	251534
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
0ed50098-fd1a-4da9-98b1-cb01167f9534	a7ecb42b-4609-4041-92a3-30f7a1342f05	\N	614208
770fc4f8-1120-41f7-ae92-230b05c90c14	bd5ef2b6-e08f-44e9-8b52-1e6bce19a77e	\N	613668
8a4d5be6-fdda-4e69-b91d-bcdc0ed1c041	8557e574-2f5d-4794-bb16-18a6c4e34a8a	\N	617215
8f14c352-6de8-48d4-a644-60803c165fc9	785ddb95-9222-41b9-86d7-35a5a7e01f82	\N	643759
95d83640-753c-429b-b965-b617ed537fe4	5dfd69e4-cb3b-4700-bbbc-1a0a74742bc7	\N	612000
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
c7a8d212-e44f-4c84-977d-6f25f3987e19	2	Пост 2	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
cabe0d9d-0eb5-4f37-8d22-1987d0e513ef	1	Пост 1	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
69e7486d-dc8d-4b87-a3fb-bb0b3f542bbd	1789873e-c919-4d86-a80e-88e9ea4ed9e7
619cb04f-95d6-4712-8257-e6ea90705eda	1f4a7edd-8768-45d1-bc85-b1857ea5add6
d54ca02f-82f3-443f-a7fb-7e13ea225b03	20d22bd2-9ac4-4568-869e-2e19bfc053bd
d54ca02f-82f3-443f-a7fb-7e13ea225b03	22592a79-6760-47ed-a0ee-add1b7669973
e655dc44-b200-48eb-903d-a64869ba3bdc	2925df94-97ec-4607-90b1-34e3342efda0
d54ca02f-82f3-443f-a7fb-7e13ea225b03	319c03a9-aae8-47aa-ae9c-d2d6f23b3fec
bb6c4dfb-91b8-4add-b31e-32e4be9b6c9c	466f6ba7-3277-443a-b0b5-7e5e28c0a5aa
bb6c4dfb-91b8-4add-b31e-32e4be9b6c9c	4b02460d-19a0-42ef-a236-971d9c97d722
319c03a9-aae8-47aa-ae9c-d2d6f23b3fec	4c386bff-9e9e-4aa0-bd36-11c612699c9a
1789873e-c919-4d86-a80e-88e9ea4ed9e7	5c90346d-afaf-4b16-94f8-b67ffb841961
e655dc44-b200-48eb-903d-a64869ba3bdc	619cb04f-95d6-4712-8257-e6ea90705eda
619cb04f-95d6-4712-8257-e6ea90705eda	92368348-18ad-4312-a574-0bd8e58ca2c1
d54ca02f-82f3-443f-a7fb-7e13ea225b03	9b383657-4c45-4b70-96a1-82b5d7e43134
e655dc44-b200-48eb-903d-a64869ba3bdc	abe96b7b-1d76-49c4-a6f8-12b9fbfdc818
20d22bd2-9ac4-4568-869e-2e19bfc053bd	b372b8c2-d197-4b35-a25a-898a60393267
69e7486d-dc8d-4b87-a3fb-bb0b3f542bbd	b6478f7c-417c-41bf-bfd0-8a0f6329052d
e655dc44-b200-48eb-903d-a64869ba3bdc	bb6c4dfb-91b8-4add-b31e-32e4be9b6c9c
69e7486d-dc8d-4b87-a3fb-bb0b3f542bbd	bc0ef99e-97de-40f5-a521-6e09a7000a5b
319c03a9-aae8-47aa-ae9c-d2d6f23b3fec	cfacafdb-375d-4ae3-8569-a31c8db53c4d
bc0ef99e-97de-40f5-a521-6e09a7000a5b	d13c241f-766b-4baa-b4f0-34cea557458f
20d22bd2-9ac4-4568-869e-2e19bfc053bd	d3569fe9-70f0-4cdd-a2ea-aaa6efb9ab71
1789873e-c919-4d86-a80e-88e9ea4ed9e7	d634d3ab-2865-4bc6-838c-e9ed4fc7bd80
69e7486d-dc8d-4b87-a3fb-bb0b3f542bbd	e1914f5e-96d8-4ba8-ac39-2a093e4fabb6
bc0ef99e-97de-40f5-a521-6e09a7000a5b	fd17f7b0-aee7-47d7-8e24-967ee1bf2c67
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
0eae52c1-80bb-4025-89e7-173eed67e04d	Сборка, сварка мостов	1	4327bb30-9856-41e7-81a4-8c53a7772f2d	01
3bf0d970-306b-42c0-afb9-7ff0a7fa0b73	Производственный участок 5	5	8495bdc7-83c0-42c4-862e-1c8d7d5ef069	05
9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	Сборка, сварка узл. и рам к/с г/п 120-220т	4	4327bb30-9856-41e7-81a4-8c53a7772f2d	04
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "WeldingTaskId", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
1789873e-c919-4d86-a80e-88e9ea4ed9e7	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	\N	8de28928-75ea-4e0f-a916-c4fd386b25a2	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536248707
1f4a7edd-8768-45d1-bc85-b1857ea5add6	Кольцо	75580-2401227	1	f	f	3	\N	cc7fedb5-4d6c-40f8-bff5-09b2837dfa54	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536384312
20d22bd2-9ac4-4568-869e-2e19bfc053bd	Картер заднего моста	75132-2401008-50	1	f	f	2	\N	b43b9eb2-3986-4bee-9b5b-e7cc2114a3d0	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536467565
22592a79-6760-47ed-a0ee-add1b7669973	Панель	75132-2105522	1	f	f	3	\N	b9cf60ac-1dbf-45e7-ab73-e00900709ee5	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536417730
2925df94-97ec-4607-90b1-34e3342efda0	Кронштейн	75580-2113192	1	f	f	3	\N	b5bd36e5-ab26-42d2-b1bd-bb77e9aceaad	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536384314
319c03a9-aae8-47aa-ae9c-d2d6f23b3fec	Кронштейн	7521-2401220	1	f	f	2	\N	cfe68b5c-2c37-478c-8e14-2568c250e921	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536273956
466f6ba7-3277-443a-b0b5-7e5e28c0a5aa	Труба картера	75580-2401132-10	1	f	f	3	\N	712f6e77-b84b-43d0-836d-9b6356522cb6	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536386250
4b02460d-19a0-42ef-a236-971d9c97d722	Фланец картера	75580-2401114-11	1	f	f	3	\N	8d74921c-bd97-4f98-9cd6-02f67d2acfbe	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536386265
4c386bff-9e9e-4aa0-bd36-11c612699c9a	Распорка	7521-3932688	1	f	f	3	\N	b1dc59bf-4540-41f7-9bf4-39595dbe8b86	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536273606
5c90346d-afaf-4b16-94f8-b67ffb841961	Кронштейн	75304-1001253	1	f	f	3	\N	4d26a7a6-3642-44f3-b3e0-3c6d5635b976	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536248708
619cb04f-95d6-4712-8257-e6ea90705eda	Картер заднего моста	75580-2401008	1	f	f	2	\N	e8dfa0c0-a2fb-4370-b30f-57dc98cac2c7	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536384295
69e7486d-dc8d-4b87-a3fb-bb0b3f542bbd	Рама	75313-2800010-20	1	f	f	1	\N	a72f2134-b060-4b18-914d-744537899007	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536287819
92368348-18ad-4312-a574-0bd8e58ca2c1	Втулка	75303-2128438	1	f	f	3	\N	2adb4d1c-7059-401d-ab51-00ac95cf8a94	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536248270
9b383657-4c45-4b70-96a1-82b5d7e43134	Кронштейн	75131-2113296-10	1	f	f	3	\N	adbbabdc-66b3-4853-9f3c-904dd0ee7769	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536461620
abe96b7b-1d76-49c4-a6f8-12b9fbfdc818	Панель	75580-2105522	1	f	f	3	\N	9fe0f7ad-9c5f-4601-8bf5-98f9296bccf0	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536384399
b372b8c2-d197-4b35-a25a-898a60393267	Пластина	75132-2401106	1	f	f	3	\N	acf5cd39-94a7-423c-875a-3327e2f01037	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536444153
b6478f7c-417c-41bf-bfd0-8a0f6329052d	Накладка	549Б-1015842	1	f	f	3	\N	d67f40a2-51f6-46ad-a3da-2eb4d5cb2371	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536196288
bb6c4dfb-91b8-4add-b31e-32e4be9b6c9c	Труба картера заднего моста	75580-2401010-01	1	f	f	2	\N	9dcdbc8d-8ea6-4862-82f8-5c7e7362376d	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536386240
bc0ef99e-97de-40f5-a521-6e09a7000a5b	Кронштейн	75310-1183100	1	f	f	2	\N	50f2238b-73c3-487f-ac72-b8fee332ae78	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536267493
cfacafdb-375d-4ae3-8569-a31c8db53c4d	Проушина	7521-2401224	1	f	f	3	\N	822a3e9f-f1aa-4695-bbfd-15627b1186db	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536274170
d13c241f-766b-4baa-b4f0-34cea557458f	Кронштейн	75310-1183102	1	f	f	3	\N	9c723195-d12b-4cfb-b460-2cd55f7a0b69	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536267484
d3569fe9-70f0-4cdd-a2ea-aaa6efb9ab71	Опора	75211-2401122	1	f	f	3	\N	8506165e-3928-4e35-977b-8bff8b3f1fba	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536276803
d54ca02f-82f3-443f-a7fb-7e13ea225b03	Картер заднего моста	75132-2401006-50	1	f	f	1	\N	aab7480e-4d7c-472a-b762-c572c2819ed2	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536467567
d634d3ab-2865-4bc6-838c-e9ed4fc7bd80	Кронштейн	75303-1001293	1	f	f	3	\N	192a8da5-1d50-4fb6-8ea5-40a6cae81e8d	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536247228
e1914f5e-96d8-4ba8-ac39-2a093e4fabb6	Кронштейн	75211-1018162	1	f	f	3	\N	9ff15037-922e-4011-a13f-2f729c22454e	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536270344
e655dc44-b200-48eb-903d-a64869ba3bdc	Картер заднего моста	75580-2401006	1	f	f	1	\N	26ecc0f6-5c9d-412e-a5e0-145d9d66977b	0eae52c1-80bb-4025-89e7-173eed67e04d	\N	\N	\N	4536384294
fd17f7b0-aee7-47d7-8e24-967ee1bf2c67	Кронштейн	75310-1183106	1	f	f	3	\N	2439d9da-ebb1-45b0-8ece-8799369c17d8	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N	\N	\N	4536267485
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
e31bb69e-e515-4664-ae9d-f2429adacfda	Admin	\N
fcbe8db0-81e6-4108-8418-c4dc849dd5db	Master	\N
574d280e-9185-4091-9ef5-07e93817c3f8	Executor	\N
913db1d4-aaab-48ca-b4f9-ebfe3c3fa12e	TechUser	\N
5bf9ae5f-651b-4f17-a2c8-3713124f1783	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductId", "ProductionAreaId", "WorkplaceId", "WelderId", "InspectorId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "ProductId", "SeamId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
192a8da5-1d50-4fb6-8ea5-40a6cae81e8d	3049271	Технологический процесс	Ссылка	3049271
2439d9da-ebb1-45b0-8ece-8799369c17d8	1119363	Технологический процесс	Ссылка	1119363
26ecc0f6-5c9d-412e-a5e0-145d9d66977b	2433634	Технологический процесс	Ссылка	2433634
2adb4d1c-7059-401d-ab51-00ac95cf8a94	3011514	Технологический процесс	Ссылка	3011514
4d26a7a6-3642-44f3-b3e0-3c6d5635b976	1492964	Технологический процесс	Ссылка	1492964
50f2238b-73c3-487f-ac72-b8fee332ae78	1823031	Технологический процесс	Ссылка	1823031
712f6e77-b84b-43d0-836d-9b6356522cb6	2822569	Технологический процесс	Ссылка	2822569
822a3e9f-f1aa-4695-bbfd-15627b1186db	1124147	Технологический процесс	Ссылка	1124147
8506165e-3928-4e35-977b-8bff8b3f1fba	3211246	Технологический процесс	Ссылка	3211246
8d74921c-bd97-4f98-9cd6-02f67d2acfbe	3338649	Технологический процесс	Ссылка	3338649
8de28928-75ea-4e0f-a916-c4fd386b25a2	1334123	Технологический процесс	Ссылка	1334123
9c723195-d12b-4cfb-b460-2cd55f7a0b69	1104641	Технологический процесс	Ссылка	1104641
9dcdbc8d-8ea6-4862-82f8-5c7e7362376d	2915477	Технологический процесс	Ссылка	2915477
9fe0f7ad-9c5f-4601-8bf5-98f9296bccf0	1405307	Технологический процесс	Ссылка	1405307
9ff15037-922e-4011-a13f-2f729c22454e	2841119	Технологический процесс	Ссылка	2841119
a72f2134-b060-4b18-914d-744537899007	3239598	Технологический процесс	Ссылка	3239598
aab7480e-4d7c-472a-b762-c572c2819ed2	3090319	Технологический процесс	Ссылка	3090319
acf5cd39-94a7-423c-875a-3327e2f01037	1003048	Технологический процесс	Ссылка	1003048
adbbabdc-66b3-4853-9f3c-904dd0ee7769	526870	Технологический процесс	Ссылка	526870
b1dc59bf-4540-41f7-9bf4-39595dbe8b86	908693	Технологический процесс	Ссылка	908693
b43b9eb2-3986-4bee-9b5b-e7cc2114a3d0	3232836	Технологический процесс	Ссылка	3232836
b5bd36e5-ab26-42d2-b1bd-bb77e9aceaad	1405914	Технологический процесс	Ссылка	1405914
b9cf60ac-1dbf-45e7-ab73-e00900709ee5	1053809	Технологический процесс	Ссылка	1053809
cc7fedb5-4d6c-40f8-bff5-09b2837dfa54	1402616	Технологический процесс	Ссылка	1402616
cfe68b5c-2c37-478c-8e14-2568c250e921	1362989	Технологический процесс	Ссылка	1362989
d67f40a2-51f6-46ad-a3da-2eb4d5cb2371	1426226	Технологический процесс	Ссылка	1426226
e8dfa0c0-a2fb-4370-b30f-57dc98cac2c7	3232938	Технологический процесс	Ссылка	3232938
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
3ae4d8d1-e969-47ee-ae48-fe1ddf24109f	913db1d4-aaab-48ca-b4f9-ebfe3c3fa12e
42629d2a-c0d2-4260-8ce6-0dc035794af8	913db1d4-aaab-48ca-b4f9-ebfe3c3fa12e
e4c64967-5955-4a74-aa86-c6fc1052e532	913db1d4-aaab-48ca-b4f9-ebfe3c3fa12e
5dfd69e4-cb3b-4700-bbbc-1a0a74742bc7	fcbe8db0-81e6-4108-8418-c4dc849dd5db
785ddb95-9222-41b9-86d7-35a5a7e01f82	fcbe8db0-81e6-4108-8418-c4dc849dd5db
8557e574-2f5d-4794-bb16-18a6c4e34a8a	fcbe8db0-81e6-4108-8418-c4dc849dd5db
a7ecb42b-4609-4041-92a3-30f7a1342f05	fcbe8db0-81e6-4108-8418-c4dc849dd5db
bd5ef2b6-e08f-44e9-8b52-1e6bce19a77e	fcbe8db0-81e6-4108-8418-c4dc849dd5db
07a2be6c-3581-4878-98da-ec6c00ba4472	574d280e-9185-4091-9ef5-07e93817c3f8
24fadfaf-ba8a-47e9-b6e7-64bc6c30dec0	574d280e-9185-4091-9ef5-07e93817c3f8
30ff8586-7074-4ddb-b4db-0c7a6720797d	574d280e-9185-4091-9ef5-07e93817c3f8
3c6e7c1a-49da-4fb9-b064-85f434963232	574d280e-9185-4091-9ef5-07e93817c3f8
590d2bdb-bc09-4d2d-a490-8bc527d5fc0f	574d280e-9185-4091-9ef5-07e93817c3f8
60c3cbdd-f8d9-4d47-999e-f7dc80218195	574d280e-9185-4091-9ef5-07e93817c3f8
85c0b3ce-9f39-4cad-a197-7f88f8706fb1	574d280e-9185-4091-9ef5-07e93817c3f8
86b2344a-4a1f-4b55-935e-8bc5145f0cf8	574d280e-9185-4091-9ef5-07e93817c3f8
ac7be631-7d64-49c0-bc69-651d8c9ebb94	574d280e-9185-4091-9ef5-07e93817c3f8
b00043d7-5af1-49be-ad6e-955fec0876a9	574d280e-9185-4091-9ef5-07e93817c3f8
b1586316-7fd4-45be-a3d5-699f339a6bb3	574d280e-9185-4091-9ef5-07e93817c3f8
c6e062de-64a7-49f7-b2be-d4516f844cd9	574d280e-9185-4091-9ef5-07e93817c3f8
e3e60cac-df04-4aea-a09b-16478f8529da	574d280e-9185-4091-9ef5-07e93817c3f8
ecfa3bb8-e6f7-4255-8c7b-569af536674b	574d280e-9185-4091-9ef5-07e93817c3f8
1c4a85fb-0693-4e37-90b9-7aae24acf777	5bf9ae5f-651b-4f17-a2c8-3713124f1783
1a74760f-278a-47d4-97cf-363db169d5f0	e31bb69e-e515-4664-ae9d-f2429adacfda
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
3ae4d8d1-e969-47ee-ae48-fe1ddf24109f	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	3bf0d970-306b-42c0-afb9-7ff0a7fa0b73	\N
42629d2a-c0d2-4260-8ce6-0dc035794af8	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	\N	\N	3bf0d970-306b-42c0-afb9-7ff0a7fa0b73	\N
e4c64967-5955-4a74-aa86-c6fc1052e532	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	3bf0d970-306b-42c0-afb9-7ff0a7fa0b73	\N
5dfd69e4-cb3b-4700-bbbc-1a0a74742bc7	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
785ddb95-9222-41b9-86d7-35a5a7e01f82	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
8557e574-2f5d-4794-bb16-18a6c4e34a8a	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
a7ecb42b-4609-4041-92a3-30f7a1342f05	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
bd5ef2b6-e08f-44e9-8b52-1e6bce19a77e	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
07a2be6c-3581-4878-98da-ec6c00ba4472	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
24fadfaf-ba8a-47e9-b6e7-64bc6c30dec0	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
30ff8586-7074-4ddb-b4db-0c7a6720797d	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
3c6e7c1a-49da-4fb9-b064-85f434963232	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
590d2bdb-bc09-4d2d-a490-8bc527d5fc0f	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
60c3cbdd-f8d9-4d47-999e-f7dc80218195	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
85c0b3ce-9f39-4cad-a197-7f88f8706fb1	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
86b2344a-4a1f-4b55-935e-8bc5145f0cf8	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
ac7be631-7d64-49c0-bc69-651d8c9ebb94	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
b00043d7-5af1-49be-ad6e-955fec0876a9	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
b1586316-7fd4-45be-a3d5-699f339a6bb3	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
c6e062de-64a7-49f7-b2be-d4516f844cd9	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
e3e60cac-df04-4aea-a09b-16478f8529da	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
ecfa3bb8-e6f7-4255-8c7b-569af536674b	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	\N
1c4a85fb-0693-4e37-90b9-7aae24acf777	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	0eae52c1-80bb-4025-89e7-173eed67e04d	\N
1a74760f-278a-47d4-97cf-363db169d5f0	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$LYsc/GJ3+70qurmt5zfHWxViRflIOBVjGtYuS/jM21I2Dyl/	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IsDone", "SeamId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
2e04b005-5d97-4963-ac8f-cfa7aa092fbe	4c81e8ba-77f1-4234-a1e9-7693eef819aa
3a9b3759-59e1-4ede-8165-7cfda9143e96	60d58e89-43a6-42e1-9c1c-4638f60ff9b9
4ab7d8d4-6b1f-4c42-b88f-896f5bf6e833	45a93efe-82c7-4b8e-888f-5332bcbb769c
68a153df-f1b6-42e1-bc30-be51b294d203	8dbe1c9a-a6ec-4796-a1b4-9947c9dc3a5d
716705c0-506e-4111-8b5a-a44fd31b6035	8dbe1c9a-a6ec-4796-a1b4-9947c9dc3a5d
a0497864-22d4-4227-99c8-c35c20c8f6b9	45a93efe-82c7-4b8e-888f-5332bcbb769c
aa48cc41-8109-4a34-9dcb-f4681af9a51c	45a93efe-82c7-4b8e-888f-5332bcbb769c
c18c8f14-30e2-4a10-8a02-e74c1370031b	4c81e8ba-77f1-4234-a1e9-7693eef819aa
ce9f32a8-e8fd-4983-8f80-676de288bc5f	8dbe1c9a-a6ec-4796-a1b4-9947c9dc3a5d
d8fc8221-f517-415c-9eac-ff2f02d9623f	45a93efe-82c7-4b8e-888f-5332bcbb769c
df55b5d8-d617-43cc-b8b9-e4af25bbe8ed	60d58e89-43a6-42e1-9c1c-4638f60ff9b9
ecbb5e4e-2271-49ed-a1c5-9e23a7d07075	8dbe1c9a-a6ec-4796-a1b4-9947c9dc3a5d
ee3e8c31-b3ac-4718-a5d3-4a429b2cc5c7	8dbe1c9a-a6ec-4796-a1b4-9947c9dc3a5d
f57fdda7-7277-44f6-a22a-730ac5b64992	60d58e89-43a6-42e1-9c1c-4638f60ff9b9
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
2e04b005-5d97-4963-ac8f-cfa7aa092fbe	ecfa3bb8-e6f7-4255-8c7b-569af536674b	\N	149921
3a9b3759-59e1-4ede-8165-7cfda9143e96	60c3cbdd-f8d9-4d47-999e-f7dc80218195	\N	152444
4ab7d8d4-6b1f-4c42-b88f-896f5bf6e833	b00043d7-5af1-49be-ad6e-955fec0876a9	\N	155288
68a153df-f1b6-42e1-bc30-be51b294d203	e3e60cac-df04-4aea-a09b-16478f8529da	\N	147329
716705c0-506e-4111-8b5a-a44fd31b6035	b1586316-7fd4-45be-a3d5-699f339a6bb3	\N	121538
a0497864-22d4-4227-99c8-c35c20c8f6b9	3c6e7c1a-49da-4fb9-b064-85f434963232	\N	151861
aa48cc41-8109-4a34-9dcb-f4681af9a51c	590d2bdb-bc09-4d2d-a490-8bc527d5fc0f	\N	153274
c18c8f14-30e2-4a10-8a02-e74c1370031b	07a2be6c-3581-4878-98da-ec6c00ba4472	\N	150402
ce9f32a8-e8fd-4983-8f80-676de288bc5f	24fadfaf-ba8a-47e9-b6e7-64bc6c30dec0	\N	156298
d8fc8221-f517-415c-9eac-ff2f02d9623f	30ff8586-7074-4ddb-b4db-0c7a6720797d	\N	152441
df55b5d8-d617-43cc-b8b9-e4af25bbe8ed	c6e062de-64a7-49f7-b2be-d4516f844cd9	\N	152207
ecbb5e4e-2271-49ed-a1c5-9e23a7d07075	86b2344a-4a1f-4b55-935e-8bc5145f0cf8	\N	121537
ee3e8c31-b3ac-4718-a5d3-4a429b2cc5c7	ac7be631-7d64-49c0-bc69-651d8c9ebb94	\N	152365
f57fdda7-7277-44f6-a22a-730ac5b64992	85c0b3ce-9f39-4cad-a197-7f88f8706fb1	\N	156278
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "IdFromSystem") FROM stdin;
45a93efe-82c7-4b8e-888f-5332bcbb769c	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
4c81e8ba-77f1-4234-a1e9-7693eef819aa	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
60d58e89-43a6-42e1-9c1c-4638f60ff9b9	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
8dbe1c9a-a6ec-4796-a1b4-9947c9dc3a5d	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
52d2f882-3000-4932-8997-2c80a641bdf2	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	54132500-0a46-48a9-8fd0-0d4651cd8c52	\N
83b203e7-c5f6-485f-9481-5cd10d452589	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	54132500-0a46-48a9-8fd0-0d4651cd8c52	\N
91095eb5-101a-46d5-b95c-78839df63956	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	54132500-0a46-48a9-8fd0-0d4651cd8c52	\N
04f7f3a9-11a2-4488-b581-3e4164da2bb1	1	12:10:00	13:10:00	13:20:00	13:50:00	d7182742-194e-4dd8-b06f-3d7af4c48fb3	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0a1d0672-15e2-4920-84de-f57404d10b73	2150	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	2150
78eef16d-ca8b-4831-a27a-68f96750bb81	2050	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	2050
7a84a013-2f30-4315-b1a1-6f99e7f2a913	1390	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1390
800866a3-b9fe-4a31-b305-b2828589bf60	1260	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1260
945a557b-b59a-4d5e-9792-8ccef4c5af31	1270	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1270
bb2d7e7c-6250-4019-9495-9ed5d2b77a4e	1400	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1400
d10e223c-2acc-4c8f-a18e-db313d1eeea4	1550	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1550
d28c24cd-9779-48ef-8b27-e24763e4be08	1360	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1360
f6e93240-e975-4f9d-8fa3-53a0ebc2fa50	1280	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1280
f8928d5a-fcb5-4f13-8387-a2199083d1d3	2130	\N	0eae52c1-80bb-4025-89e7-173eed67e04d	2130
fd90ff6e-b54e-4918-8ce8-0b9f27908e87	1380	\N	9ce8cf6a-18e5-427c-9c47-6af8f7f1d388	1380
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
4327bb30-9856-41e7-81a4-8c53a7772f2d	Цех 50	50	050
8495bdc7-83c0-42c4-862e-1c8d7d5ef069	Цех 480	480	480
\.


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
-- Name: ProductInsides PK_ProductInsides; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductInsides"
    ADD CONSTRAINT "PK_ProductInsides" PRIMARY KEY ("InsideProductId", "MainProductId");


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
-- Name: StatusReasons PK_StatusReasons; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StatusReasons"
    ADD CONSTRAINT "PK_StatusReasons" PRIMARY KEY ("Id");


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
-- Name: WeldingEquipments PK_WeldingEquipments; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "PK_WeldingEquipments" PRIMARY KEY ("Id");


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

CREATE UNIQUE INDEX "IX_Chiefs_WeldingEquipmentId" ON public."Chiefs" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Days_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Days_CalendarId" ON public."Days" USING btree ("CalendarId");


--
-- Name: IX_Days_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Days_IdFromSystem" ON public."Days" USING btree ("IdFromSystem");


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
-- Name: IX_Masters_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Masters_WeldingEquipmentId" ON public."Masters" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Posts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Posts_IdFromSystem" ON public."Posts" USING btree ("IdFromSystem");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_ProductInsides_InsideProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductInsides_InsideProductId" ON public."ProductInsides" USING btree ("InsideProductId");


--
-- Name: IX_ProductInsides_MainProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductInsides_MainProductId" ON public."ProductInsides" USING btree ("MainProductId");


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
-- Name: IX_Products_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_WeldingTaskId" ON public."Products" USING btree ("WeldingTaskId");


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
-- Name: IX_Seams_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_WelderId" ON public."Seams" USING btree ("WelderId");


--
-- Name: IX_Seams_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_WorkplaceId" ON public."Seams" USING btree ("WorkplaceId");


--
-- Name: IX_StatusReasons_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_StatusReasons_IdFromSystem" ON public."StatusReasons" USING btree ("IdFromSystem");


--
-- Name: IX_StatusReasons_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_ProductId" ON public."StatusReasons" USING btree ("ProductId");


--
-- Name: IX_StatusReasons_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_SeamId" ON public."StatusReasons" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstructions_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstructions_IdFromSystem" ON public."TechnologicalInstructions" USING btree ("IdFromSystem");


--
-- Name: IX_TechnologicalInstructions_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstructions_SeamId" ON public."TechnologicalInstructions" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstructions_TechnologicalProcessId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_TechnologicalInstructions_TechnologicalProcessId" ON public."TechnologicalInstructions" USING btree ("TechnologicalProcessId");


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
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


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
-- Name: IX_WeldingEquipments_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_IdFromSystem" ON public."WeldingEquipments" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingTasks_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_IdFromSystem" ON public."WeldingTasks" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


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
-- Name: Days FK_Days_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Days"
    ADD CONSTRAINT "FK_Days_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id") ON DELETE CASCADE;


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
-- Name: Masters FK_Masters_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Masters"
    ADD CONSTRAINT "FK_Masters_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


--
-- Name: Posts FK_Posts_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "FK_Posts_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_Products_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id");


--
-- Name: Products FK_Products_TechnologicalProcesses_TechnologicalProcessId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_TechnologicalProcesses_TechnologicalProcessId" FOREIGN KEY ("TechnologicalProcessId") REFERENCES public."TechnologicalProcesses"("Id");


--
-- Name: Products FK_Products_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id");


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
-- Name: Seams FK_Seams_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: Seams FK_Seams_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: StatusReasons FK_StatusReasons_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StatusReasons"
    ADD CONSTRAINT "FK_StatusReasons_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id");


--
-- Name: StatusReasons FK_StatusReasons_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StatusReasons"
    ADD CONSTRAINT "FK_StatusReasons_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id");


--
-- Name: TechnologicalInstructions FK_TechnologicalInstructions_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstructions"
    ADD CONSTRAINT "FK_TechnologicalInstructions_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: TechnologicalInstructions FK_TechnologicalInstructions_TechnologicalProcesses_Technologi~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstructions"
    ADD CONSTRAINT "FK_TechnologicalInstructions_TechnologicalProcesses_Technologi~" FOREIGN KEY ("TechnologicalProcessId") REFERENCES public."TechnologicalProcesses"("Id");


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
-- Name: WeldPassages FK_WeldPassages_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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

