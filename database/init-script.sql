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
-- Name: SeamWelder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SeamWelder" (
    "SeamsId" uuid NOT NULL,
    "WeldersId" uuid NOT NULL
);


--
-- Name: Seams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seams" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Length" integer NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductId" uuid,
    "TechnologicalInstructionId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
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
    "Reason" text,
    "DetectedDefects" text,
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
    "WhenTaskIsDoneDate" timestamp without time zone,
    "WeldingDate" timestamp without time zone,
    "WeldingPlanDate" timestamp without time zone,
    "BasicMaterial" text,
    "MainMaterialBatchNumber" text,
    "WeldingMaterial" text,
    "WeldingMaterialBatchNumber" text,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "WelderId" uuid,
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
6be53b39-6bff-44aa-82e3-2d6b139b73d7	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
fd93d815-b408-4ba0-bae9-4484344f755a	379def41-b1f0-4e4c-b3b1-419e49340778	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
959fc2f5-6fc7-425f-bafb-75597b9005ae	1	10	t	6be53b39-6bff-44aa-82e3-2d6b139b73d7	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
11e2200b-e7c0-4c45-903b-2e16a478482e	Отсутствие оператора в связи с необеспеченностью	\N
398c3a1c-a026-4b4d-aee9-34868a5aa90b	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
3c8a1a4c-f2a0-487b-8b4f-6f3bc1484cf2	Работа с управляющей программой	\N
415be2b2-ab06-4f70-af93-1003a1fa8386	Контроль на рабочем месте	\N
417a0e22-26ea-443a-962f-a516409e6bdd	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
4963227b-a9a6-41e0-b9df-c34c06219b6c	Отсутствие крана, транспорта	\N
496ffaea-6aa3-4ec5-8300-04ec85310409	Установка, выверка, снятие детали	\N
56db0280-02cd-4fcb-abee-42c21900a87d	Отсутствие заданий	\N
594d9a45-5f3a-4b01-9b05-99cd5d2b0bc1	Аварийный ремонт централизованными службами	\N
62c4622c-6c65-49c1-9ccf-02519f799e7a	Нерабочее время по графику согласно сменности	\N
6d4a575d-9aed-4c74-ab11-a972ca68f62a	Плановый ремонт централизованными службами	\N
6f1e69af-807a-43be-ba93-304bc7d9113d	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
7951ecbd-7eb6-4fcc-9c14-415fd886e902	Отсутствие сотрудника ОТК	\N
8e15a5f3-38a1-4f07-b1e7-4d3a3ef8563b	Ознакомление с работой, документацией, инструктаж	\N
903886fb-5bdb-4f34-ad32-46ba5989035a	Изменение режимов, смена инструмента, приспособления	\N
9bac5a59-ee70-4c76-b8a0-f1f7198bd9e7	Отсутствие энергоносителей	\N
9d94759d-7bdc-46f9-ba0f-8dae2be5c9ee	Отсутствие материала, заготовок, деталей	\N
9de562ba-fcb0-44d2-9a6d-44d376aa1b09	Установка, выверка, снятие детали	\N
a32664b8-498f-49bb-a437-948675fb4bd8	Естественные надобности	\N
a5ad40c1-9e6b-4f09-b3a5-b738d2e35291	Сборочные операции	\N
ae98e3db-db42-4456-9e96-328796116410	Неявка оператора (б/лист, отпуск, и пр.)	\N
b80f246d-4506-427f-9d1d-b7e934871e54	Праздники и выходные	\N
e19f2ac0-c268-440b-9e01-1f891face35d	Отсутствие конструктора, технолога или ожидание его решения	\N
e3f64a4a-7423-47ef-94b3-ea91f070ad7a	Работа по карте несоответствий	\N
f3ea765d-4266-4ec6-8315-3278d6962c67	Обед	\N
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
1b774ae6-7d61-497f-b208-3b78d8ffb1f4	1e70876e-89fe-4ffe-83f2-02916804637d	256467
3014ee5b-24c8-4d5c-9cb4-283feddaf601	163a080d-abb0-4c20-b968-c9390cdb05ca	249550
80b94b1a-dc3f-4eb8-8484-9d2e48f2b9b8	a9d863e0-126f-40f2-8ea8-97d585537e02	251534
e84baa09-4419-4c57-a134-46a307d7163f	cc0dd9c4-a951-4a13-9298-32198470a7e7	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
43bebcaa-8f5d-45ee-b0d5-2c653367c168	d6d2052c-5d56-40c7-980c-87166a1be91d	\N	610422
52a7617f-145f-4bcf-8dc2-da6e0d0e2ce3	0ff37f66-d78d-421e-9970-dfbcb0e362e7	\N	612000
80b22fb7-109b-494d-afe7-a2e20cf7e325	17018877-be06-415b-875a-db183869d871	\N	614208
94aaf27b-fc29-4e33-8df4-6958f88886db	e7d7fb13-391e-46b4-add7-404b92d0f7d5	\N	643759
d4aefb56-55a8-4223-936d-1cf094128e41	3ac906d0-d90a-49fa-815a-1077a32017f6	\N	614962
e9294f79-dd78-4c85-98a2-f9890baf59ba	83204d2a-dc5d-4a4b-9792-ec12e1f0e483	\N	613668
f24430e2-2844-4fe4-9fad-f7ba853f1bb1	e9a607f0-e6b6-4d0a-9b3b-4603ad0e2a7d	\N	617215
705ab609-fe93-4bb9-9997-843cae4b55f6	1bf0e093-b2c5-4f1b-a4c9-a4279ee0f182	\N	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
01f0ad39-8a7a-4828-aa52-101700f6b386	2	Пост 2	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
e738c6b7-05a2-4b93-82d8-6be63631484c	1	Пост 1	bf7942a9-cd05-431b-b63b-a2de3063d100	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
86f23345-e9c2-4e2a-b0d0-44b46204d1ee	00a7f604-9480-4561-987f-48a5bc25dd43
00a7f604-9480-4561-987f-48a5bc25dd43	10768249-45d6-49b0-a528-30a270d80bf9
a0e1475f-2aa6-4425-9572-5cc78c770318	14b35993-e2a0-4d6c-987a-d777795149a6
6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	1e763a78-67f3-4b41-8f61-f7a23facf448
7b24aa0e-35be-417b-ac16-49c31e7d82c6	31932d20-fc48-4167-a82d-e5a35bc3015f
8ee29ce7-2f70-41a7-8bac-c23b7fdca5ec	3705de7f-6775-4c7f-959b-03cf97ddca9e
f3b8e7fa-2741-4646-8476-01c53d485710	4bf93e13-a1be-4c7d-b6dc-d7e28d4bed92
86f23345-e9c2-4e2a-b0d0-44b46204d1ee	7b24aa0e-35be-417b-ac16-49c31e7d82c6
86f23345-e9c2-4e2a-b0d0-44b46204d1ee	7bbb5cd2-3d28-4883-9afd-26479f2819c5
a0e1475f-2aa6-4425-9572-5cc78c770318	8ee29ce7-2f70-41a7-8bac-c23b7fdca5ec
6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	92bb23fc-eb0d-45a7-adda-48a4c7c620ae
14b35993-e2a0-4d6c-987a-d777795149a6	a05de7f8-01da-4eb1-9ab3-6a22d45cd8b5
a0e1475f-2aa6-4425-9572-5cc78c770318	ae1cafd8-06f8-4edd-ab3d-391517dda92d
f3b8e7fa-2741-4646-8476-01c53d485710	ae94ba8a-4235-4bf4-8654-d7eb92bb2c84
86f23345-e9c2-4e2a-b0d0-44b46204d1ee	b844501e-cf57-4419-b3b5-7fc2c06f9474
92bb23fc-eb0d-45a7-adda-48a4c7c620ae	bc3ed6f8-e93c-43c0-9de3-b32277e47d6d
6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	c4785cf4-845e-4a29-8493-4060fd167805
14b35993-e2a0-4d6c-987a-d777795149a6	c6df68dd-5e98-430a-b7d1-d42b72c15a94
7b24aa0e-35be-417b-ac16-49c31e7d82c6	cfeb1459-5c36-4391-8c57-b0558135dfc4
00a7f604-9480-4561-987f-48a5bc25dd43	d08503d5-c6e2-4c46-9139-0f26c0959fec
6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	f3b8e7fa-2741-4646-8476-01c53d485710
a0e1475f-2aa6-4425-9572-5cc78c770318	f5cafee6-481a-4b25-8a97-c7e4ace00060
8ee29ce7-2f70-41a7-8bac-c23b7fdca5ec	fcdcf458-7114-4d8f-99dc-f85aa41adf0e
92bb23fc-eb0d-45a7-adda-48a4c7c620ae	ffc81dc1-0c31-4eae-8e10-ee4dbe8979e7
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
4a029671-4c90-4495-9d36-d7ae1f8755ca	Производственный участок 5	5	561accd2-dbd0-4b1f-b23b-5a67337243a9	05
92a46c9a-12d0-4ca6-8461-60fd24f4690a	Сборка, сварка рам к/с г/п 120-130 т.	6	cc03b931-a1e8-498b-8e0f-4ddad9907154	06
b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	Сборка, сварка узл. и рам к/с г/п 120-220т	4	cc03b931-a1e8-498b-8e0f-4ddad9907154	04
bf7942a9-cd05-431b-b63b-a2de3063d100	Сборка, сварка мостов	1	cc03b931-a1e8-498b-8e0f-4ddad9907154	01
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
00a7f604-9480-4561-987f-48a5bc25dd43	Кронштейн	7521-2401220	1	f	f	2	862063e6-0028-4009-b7b2-39e5185a1a73	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536273956
10768249-45d6-49b0-a528-30a270d80bf9	Проушина	7521-2401224	1	f	f	3	4897dc18-e9ee-436d-b974-7e40d55b5d5f	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536274170
14b35993-e2a0-4d6c-987a-d777795149a6	Картер заднего моста	75580-2401008	1	f	f	2	6dca11b0-a891-4c8b-8922-64a75631900c	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536384295
1e763a78-67f3-4b41-8f61-f7a23facf448	Накладка	549Б-1015842	1	f	f	3	7aa04139-0616-4f86-a5dc-0ff5255eaf1c	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536196288
3705de7f-6775-4c7f-959b-03cf97ddca9e	Труба картера	75580-2401132-10	1	f	f	3	03b6b5f6-8527-4eb3-bcd8-8e26058718cd	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536386250
4bf93e13-a1be-4c7d-b6dc-d7e28d4bed92	Кронштейн	75310-1183102	1	f	f	3	7b7211a5-7a10-4c0c-8bde-d2d1fd81be36	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536267484
6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	Рама	75313-2800010-20	1	f	f	1	16c6d65a-14a8-4010-9323-bfab106b3d6d	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536287819
7b24aa0e-35be-417b-ac16-49c31e7d82c6	Картер заднего моста	75132-2401008-50	1	f	f	2	b44ba51f-c550-4803-801f-90cfd8e93b48	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536467565
7bbb5cd2-3d28-4883-9afd-26479f2819c5	Кронштейн	75131-2113296-10	1	f	f	3	40b65efa-fd2a-4067-9d3f-11f22d9a1de9	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536461620
86f23345-e9c2-4e2a-b0d0-44b46204d1ee	Картер заднего моста	75132-2401006-50	1	f	f	1	e89da19a-556d-4bfc-a05a-4ffd1e103783	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536467567
8ee29ce7-2f70-41a7-8bac-c23b7fdca5ec	Труба картера заднего моста	75580-2401010-01	1	f	f	2	690de822-8348-49be-96f1-cfc01efa967f	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536386240
92bb23fc-eb0d-45a7-adda-48a4c7c620ae	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	1233f413-7a99-49a8-b477-62fb7c33a10f	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536248707
a05de7f8-01da-4eb1-9ab3-6a22d45cd8b5	Кольцо	75580-2401227	1	f	f	3	bb92729b-ab94-427f-ba51-859151e1d446	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536384312
a0e1475f-2aa6-4425-9572-5cc78c770318	Картер заднего моста	75580-2401006	1	f	f	1	b3f094b2-ab8f-4423-8357-c61fb5739bb4	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536384294
ae1cafd8-06f8-4edd-ab3d-391517dda92d	Кронштейн	75580-2113192	1	f	f	3	5457db46-89c8-40a0-bab2-170d0a661cad	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536384314
ae94ba8a-4235-4bf4-8654-d7eb92bb2c84	Кронштейн	75310-1183106	1	f	f	3	b5bb876b-fcfb-475d-9105-71ca66cbeeff	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536267485
b844501e-cf57-4419-b3b5-7fc2c06f9474	Панель	75132-2105522	1	f	f	3	fe88ef2b-2c1c-48e2-a24a-5e57dc3f70a5	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536417730
bc3ed6f8-e93c-43c0-9de3-b32277e47d6d	Кронштейн	75304-1001253	1	f	f	3	daf6ea82-367e-45ec-a73b-9f2c90313fec	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536248708
c4785cf4-845e-4a29-8493-4060fd167805	Кронштейн	75211-1018162	1	f	f	3	b221835f-5227-40f9-b905-cb6a1f2865a7	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536270344
c6df68dd-5e98-430a-b7d1-d42b72c15a94	Втулка	75303-2128438	1	f	f	3	ff29c6b8-57c0-42f7-8857-4e464c0f93fa	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536248270
cfeb1459-5c36-4391-8c57-b0558135dfc4	Пластина	75132-2401106	1	f	f	3	68df6712-21e2-4669-9449-743dfd138ee3	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536444153
d08503d5-c6e2-4c46-9139-0f26c0959fec	Распорка	7521-3932688	1	f	f	3	aa7414a3-1b5e-43c4-84d3-c8c09095c26d	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536273606
f3b8e7fa-2741-4646-8476-01c53d485710	Кронштейн	75310-1183100	1	f	f	2	af9488bc-0781-481a-ae34-b963be2ccbb2	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536267493
fcdcf458-7114-4d8f-99dc-f85aa41adf0e	Фланец картера	75580-2401114-11	1	f	f	3	af130fa0-a7e7-44a0-bf0b-095bd2ac2f26	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N	4536386265
ffc81dc1-0c31-4eae-8e10-ee4dbe8979e7	Кронштейн	75303-1001293	1	f	f	3	6dc796e8-5d08-4bda-82dc-ad2fedefa277	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	\N	\N	4536247228
31932d20-fc48-4167-a82d-e5a35bc3015f	Опора	75211-2401122	1	f	f	3	9ed8bdc6-b33b-4569-ac0e-2af8d5c62a9a	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	705ab609-fe93-4bb9-9997-843cae4b55f6	\N	4536276803
f5cafee6-481a-4b25-8a97-c7e4ace00060	Панель	75580-2105522	1	f	f	3	b71dd60c-c385-4d63-9c81-57f0faef1620	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	705ab609-fe93-4bb9-9997-843cae4b55f6	\N	4536384399
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
61d13406-903a-4d25-95a8-b54215873135	Admin	\N
5e18336e-4690-4660-971d-01bfb0a3b4c1	Master	\N
4c556e6c-036f-4493-95f9-b568b093ff32	Welder	\N
9982fffd-b004-456d-a31f-aa0d960dc328	Inspector	\N
4de93c3a-9b7b-435a-ab14-2b442be0d5fb	Chief	\N
\.


--
-- Data for Name: SeamWelder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamWelder" ("SeamsId", "WeldersId") FROM stdin;
35ef2d69-7645-4da9-8cea-3fc021f25d83	e0c41b3d-f593-428b-a7da-989d7e72b04a
9e0af5a9-4a14-43d1-9749-715abbc09085	e0c41b3d-f593-428b-a7da-989d7e72b04a
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "Status", "IsControlSubject", "IsAddManually", "ProductId", "TechnologicalInstructionId", "ProductionAreaId", "WorkplaceId", "InspectorId", "IdFromSystem") FROM stdin;
02473c66-0c4e-448f-9102-3f69310d4f59	4	222	1	t	f	6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N
165bbcac-8ea9-44c2-9fbe-05052b4f7914	1	111	1	t	f	86f23345-e9c2-4e2a-b0d0-44b46204d1ee	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N
7a834c09-d54d-4f5f-b1de-b7531a522231	2	222	1	t	f	86f23345-e9c2-4e2a-b0d0-44b46204d1ee	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N
e2beaa3b-ec79-45fc-8134-50db3e05af85	3	333	1	t	f	6be9d31a-fa15-4ca8-aa1e-1bee6e39a450	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N	\N	\N
35ef2d69-7645-4da9-8cea-3fc021f25d83	2	200	3	t	f	f5cafee6-481a-4b25-8a97-c7e4ace00060	820fcd0d-95cf-4105-8242-5a1ab393ca33	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	e84baa09-4419-4c57-a134-46a307d7163f	\N
9e0af5a9-4a14-43d1-9749-715abbc09085	2	100	3	t	f	31932d20-fc48-4167-a82d-e5a35bc3015f	bae55531-158e-434d-9b4c-81f54c3de1bc	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N	e84baa09-4419-4c57-a134-46a307d7163f	\N
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "DetectedDefects", "ProductId", "SeamId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
820fcd0d-95cf-4105-8242-5a1ab393ca33	1	ИТП	\N
bae55531-158e-434d-9b4c-81f54c3de1bc	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
03b6b5f6-8527-4eb3-bcd8-8e26058718cd	2822569	Технологический процесс	Ссылка	2822569
1233f413-7a99-49a8-b477-62fb7c33a10f	1334123	Технологический процесс	Ссылка	1334123
16c6d65a-14a8-4010-9323-bfab106b3d6d	3239598	Технологический процесс	Ссылка	3239598
40b65efa-fd2a-4067-9d3f-11f22d9a1de9	526870	Технологический процесс	Ссылка	526870
4897dc18-e9ee-436d-b974-7e40d55b5d5f	1124147	Технологический процесс	Ссылка	1124147
5457db46-89c8-40a0-bab2-170d0a661cad	1405914	Технологический процесс	Ссылка	1405914
68df6712-21e2-4669-9449-743dfd138ee3	1003048	Технологический процесс	Ссылка	1003048
690de822-8348-49be-96f1-cfc01efa967f	2915477	Технологический процесс	Ссылка	2915477
6dc796e8-5d08-4bda-82dc-ad2fedefa277	3049271	Технологический процесс	Ссылка	3049271
6dca11b0-a891-4c8b-8922-64a75631900c	3232938	Технологический процесс	Ссылка	3232938
7aa04139-0616-4f86-a5dc-0ff5255eaf1c	1426226	Технологический процесс	Ссылка	1426226
7b7211a5-7a10-4c0c-8bde-d2d1fd81be36	1104641	Технологический процесс	Ссылка	1104641
862063e6-0028-4009-b7b2-39e5185a1a73	1362989	Технологический процесс	Ссылка	1362989
9ed8bdc6-b33b-4569-ac0e-2af8d5c62a9a	3211246	Технологический процесс	Ссылка	3211246
aa7414a3-1b5e-43c4-84d3-c8c09095c26d	908693	Технологический процесс	Ссылка	908693
af130fa0-a7e7-44a0-bf0b-095bd2ac2f26	3338649	Технологический процесс	Ссылка	3338649
af9488bc-0781-481a-ae34-b963be2ccbb2	1823031	Технологический процесс	Ссылка	1823031
b221835f-5227-40f9-b905-cb6a1f2865a7	2841119	Технологический процесс	Ссылка	2841119
b3f094b2-ab8f-4423-8357-c61fb5739bb4	2433634	Технологический процесс	Ссылка	2433634
b44ba51f-c550-4803-801f-90cfd8e93b48	3232836	Технологический процесс	Ссылка	3232836
b5bb876b-fcfb-475d-9105-71ca66cbeeff	1119363	Технологический процесс	Ссылка	1119363
b71dd60c-c385-4d63-9c81-57f0faef1620	1405307	Технологический процесс	Ссылка	1405307
bb92729b-ab94-427f-ba51-859151e1d446	1402616	Технологический процесс	Ссылка	1402616
daf6ea82-367e-45ec-a73b-9f2c90313fec	1492964	Технологический процесс	Ссылка	1492964
e89da19a-556d-4bfc-a05a-4ffd1e103783	3090319	Технологический процесс	Ссылка	3090319
fe88ef2b-2c1c-48e2-a24a-5e57dc3f70a5	1053809	Технологический процесс	Ссылка	1053809
ff29c6b8-57c0-42f7-8857-4e464c0f93fa	3011514	Технологический процесс	Ссылка	3011514
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
163a080d-abb0-4c20-b968-c9390cdb05ca	9982fffd-b004-456d-a31f-aa0d960dc328
1e70876e-89fe-4ffe-83f2-02916804637d	9982fffd-b004-456d-a31f-aa0d960dc328
a9d863e0-126f-40f2-8ea8-97d585537e02	9982fffd-b004-456d-a31f-aa0d960dc328
0ff37f66-d78d-421e-9970-dfbcb0e362e7	5e18336e-4690-4660-971d-01bfb0a3b4c1
17018877-be06-415b-875a-db183869d871	5e18336e-4690-4660-971d-01bfb0a3b4c1
3ac906d0-d90a-49fa-815a-1077a32017f6	5e18336e-4690-4660-971d-01bfb0a3b4c1
83204d2a-dc5d-4a4b-9792-ec12e1f0e483	5e18336e-4690-4660-971d-01bfb0a3b4c1
d6d2052c-5d56-40c7-980c-87166a1be91d	5e18336e-4690-4660-971d-01bfb0a3b4c1
e7d7fb13-391e-46b4-add7-404b92d0f7d5	5e18336e-4690-4660-971d-01bfb0a3b4c1
e9a607f0-e6b6-4d0a-9b3b-4603ad0e2a7d	5e18336e-4690-4660-971d-01bfb0a3b4c1
019671e8-cc79-4ec0-88ef-5b3760a27838	4c556e6c-036f-4493-95f9-b568b093ff32
0b832488-0b45-494c-9476-3f9fe788eef2	4c556e6c-036f-4493-95f9-b568b093ff32
146a56b7-8e3e-4631-9fe9-f62aa88e4300	4c556e6c-036f-4493-95f9-b568b093ff32
165807ca-5a64-4910-b69e-1daa324f18d5	4c556e6c-036f-4493-95f9-b568b093ff32
24b8a9c2-8853-404c-b53a-a0e33e7b1531	4c556e6c-036f-4493-95f9-b568b093ff32
2ce635de-405a-4755-9f98-ac0eb065b0eb	4c556e6c-036f-4493-95f9-b568b093ff32
65c1ab02-1077-4e01-8463-8294b61c288a	4c556e6c-036f-4493-95f9-b568b093ff32
7609f208-49ba-42ef-b782-b52af9c71c87	4c556e6c-036f-4493-95f9-b568b093ff32
866daf58-20c6-42e9-a265-5b05aac7f55a	4c556e6c-036f-4493-95f9-b568b093ff32
8bc9c2bc-f249-46b4-a32a-30661abcb68f	4c556e6c-036f-4493-95f9-b568b093ff32
94324093-afce-4a8a-a0e8-d1b3100ab14a	4c556e6c-036f-4493-95f9-b568b093ff32
a8fde0c8-bda1-4601-851b-1a3db0a32360	4c556e6c-036f-4493-95f9-b568b093ff32
a95fa346-e076-47ca-a54f-04b32f346ddc	4c556e6c-036f-4493-95f9-b568b093ff32
ada3df31-47fb-4648-b559-9a183d15218b	4c556e6c-036f-4493-95f9-b568b093ff32
b5ecb87a-5901-4bc8-aa46-7432a67d4501	4c556e6c-036f-4493-95f9-b568b093ff32
b93a4223-1f31-42a4-b2d2-2577d543f0cc	4c556e6c-036f-4493-95f9-b568b093ff32
b9c28845-fd31-4883-a686-7e88cccffce5	4c556e6c-036f-4493-95f9-b568b093ff32
d302c43a-6a8f-46b1-ae86-e39f1031fd1c	4c556e6c-036f-4493-95f9-b568b093ff32
e6af5c19-b0f5-4fed-9d95-61883fc4b6aa	4c556e6c-036f-4493-95f9-b568b093ff32
e831febd-7b00-402d-a9eb-a9874f4b0b70	4c556e6c-036f-4493-95f9-b568b093ff32
ea0dbaeb-577f-483f-bf9c-fcd249b7aaab	4c556e6c-036f-4493-95f9-b568b093ff32
fb7c73fa-18b1-4e49-b880-fb868c85f465	4c556e6c-036f-4493-95f9-b568b093ff32
379def41-b1f0-4e4c-b3b1-419e49340778	4de93c3a-9b7b-435a-ab14-2b442be0d5fb
1bf0e093-b2c5-4f1b-a4c9-a4279ee0f182	5e18336e-4690-4660-971d-01bfb0a3b4c1
d46e47e6-2778-4d83-8e7e-db6d495c8d3f	4c556e6c-036f-4493-95f9-b568b093ff32
cc0dd9c4-a951-4a13-9298-32198470a7e7	9982fffd-b004-456d-a31f-aa0d960dc328
fd978036-01d3-4f42-97f0-a06815f3464f	61d13406-903a-4d25-95a8-b54215873135
df05ec46-84d6-49a9-9a9a-de8932ff99c1	4c556e6c-036f-4493-95f9-b568b093ff32
54655dfa-c6b8-4f54-ad7e-29abd45eee2a	9982fffd-b004-456d-a31f-aa0d960dc328
70ce4575-6421-4694-89a8-ee7b648519ee	4de93c3a-9b7b-435a-ab14-2b442be0d5fb
fd60b09b-319c-4ce5-8ef3-07d0727e7039	5e18336e-4690-4660-971d-01bfb0a3b4c1
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
163a080d-abb0-4c20-b968-c9390cdb05ca	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
1e70876e-89fe-4ffe-83f2-02916804637d	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	4a029671-4c90-4495-9d36-d7ae1f8755ca	\N
a9d863e0-126f-40f2-8ea8-97d585537e02	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	4a029671-4c90-4495-9d36-d7ae1f8755ca	\N
0ff37f66-d78d-421e-9970-dfbcb0e362e7	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
17018877-be06-415b-875a-db183869d871	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N
3ac906d0-d90a-49fa-815a-1077a32017f6	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
83204d2a-dc5d-4a4b-9792-ec12e1f0e483	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
d6d2052c-5d56-40c7-980c-87166a1be91d	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
e7d7fb13-391e-46b4-add7-404b92d0f7d5	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
e9a607f0-e6b6-4d0a-9b3b-4603ad0e2a7d	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N
019671e8-cc79-4ec0-88ef-5b3760a27838	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N
0b832488-0b45-494c-9476-3f9fe788eef2	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
146a56b7-8e3e-4631-9fe9-f62aa88e4300	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
165807ca-5a64-4910-b69e-1daa324f18d5	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N
24b8a9c2-8853-404c-b53a-a0e33e7b1531	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
2ce635de-405a-4755-9f98-ac0eb065b0eb	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
65c1ab02-1077-4e01-8463-8294b61c288a	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
7609f208-49ba-42ef-b782-b52af9c71c87	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
866daf58-20c6-42e9-a265-5b05aac7f55a	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
8bc9c2bc-f249-46b4-a32a-30661abcb68f	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
94324093-afce-4a8a-a0e8-d1b3100ab14a	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
a8fde0c8-bda1-4601-851b-1a3db0a32360	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
a95fa346-e076-47ca-a54f-04b32f346ddc	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
ada3df31-47fb-4648-b559-9a183d15218b	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
b5ecb87a-5901-4bc8-aa46-7432a67d4501	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
b93a4223-1f31-42a4-b2d2-2577d543f0cc	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
b9c28845-fd31-4883-a686-7e88cccffce5	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
d302c43a-6a8f-46b1-ae86-e39f1031fd1c	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
e6af5c19-b0f5-4fed-9d95-61883fc4b6aa	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
e831febd-7b00-402d-a9eb-a9874f4b0b70	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	\N
ea0dbaeb-577f-483f-bf9c-fcd249b7aaab	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	\N
fb7c73fa-18b1-4e49-b880-fb868c85f465	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
379def41-b1f0-4e4c-b3b1-419e49340778	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	4a029671-4c90-4495-9d36-d7ae1f8755ca	\N
1bf0e093-b2c5-4f1b-a4c9-a4279ee0f182	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
cc0dd9c4-a951-4a13-9298-32198470a7e7	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
d46e47e6-2778-4d83-8e7e-db6d495c8d3f	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	\N
fd978036-01d3-4f42-97f0-a06815f3464f	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$cGVT/29/huxNR08qJbK1u3svE4b8ICAhweJ8LLAzxu2bDNZz	\N	\N	\N	\N	\N	\N
df05ec46-84d6-49a9-9a9a-de8932ff99c1	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$ngr+oZYCW9yFW1eMakas49m27xGEnhEv8r7mR/ySiXxvzLNt	\N	\N	\N	\N	\N	\N
54655dfa-c6b8-4f54-ad7e-29abd45eee2a	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$jX6A+9/eQ4EqysDwESzwasqHu1LnMNpcOQlL0txpBgFDH9PX	\N	\N	\N	\N	\N	\N
70ce4575-6421-4694-89a8-ee7b648519ee	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$PATgZ86r6UAeQO2GrrFcISP3Sl3auqXO67gFYjSDUB9/HFM4	\N	\N	\N	\N	\N	\N
fd60b09b-319c-4ce5-8ef3-07d0727e7039	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$REnm5u9BtXStlRacENFtOOduuxIptr2E2SxDA3NKHIis+PKb	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
27f94124-d30a-4d5d-8155-78603dbdc883	1	Корневой	80	120	\N	\N	50	250	820fcd0d-95cf-4105-8242-5a1ab393ca33	\N
447098fe-c2fa-4c1b-aa85-504eba7bfd70	2	Заполняющий	80	120	21	25	50	250	bae55531-158e-434d-9b4c-81f54c3de1bc	\N
950f2dd2-2226-42dd-bee6-4760078b00c9	1	Корневой	80	120	22	24	50	250	bae55531-158e-434d-9b4c-81f54c3de1bc	\N
b3c4fad4-755e-4654-8f18-cb0ba5cb61ae	2	Заполняющий	80	120	21	25	50	250	820fcd0d-95cf-4105-8242-5a1ab393ca33	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IsDone", "SeamId", "IdFromSystem") FROM stdin;
230b844f-1503-460a-9c01-d9b077cf7969	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	35ef2d69-7645-4da9-8cea-3fc021f25d83	\N
ab75a7a3-dde1-4baa-924e-dd620f2e2080	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	35ef2d69-7645-4da9-8cea-3fc021f25d83	\N
d2a57da1-b18f-4ce2-9aa5-0e65f91c6097	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	9e0af5a9-4a14-43d1-9749-715abbc09085	\N
f1ad60d3-a44c-4f39-a1a5-5720ca795480	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	9e0af5a9-4a14-43d1-9749-715abbc09085	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
05f236a2-e9f8-4f98-99bf-d1a9abbc11a0	76e9d476-ae72-4edc-8efd-0b160e72cb89
0c46c486-05dd-41b2-8a5d-632d17a7dd51	7e4061a8-1e05-42c6-a799-a971793c5bde
14dff362-d1b1-4411-9b2c-730c64255443	2ede8a11-3685-4d37-a1d2-631a0a2c112c
190c751c-cc04-447a-9788-e7d52de96294	1a0bca19-96d1-4f70-8a30-d113a02edc31
309c4795-026b-4963-9325-0e15016a1bdd	efe7e633-3355-4879-bcd3-2b80eab612e1
51ff5d49-f7e2-4043-acd9-0556988f262d	efe7e633-3355-4879-bcd3-2b80eab612e1
5692eb57-59f0-4f93-8b62-b0661c8b1203	efe7e633-3355-4879-bcd3-2b80eab612e1
57cf3739-f749-4851-9db3-2a4f7a3ad8d2	76e9d476-ae72-4edc-8efd-0b160e72cb89
6e8807f2-af56-4061-b687-d8bec85ce4d9	dbbdc9eb-6901-47b5-bc6c-04ab8a0ec4c9
8bbc688d-c062-460f-bb00-20c24ea142ef	1a0bca19-96d1-4f70-8a30-d113a02edc31
8dba0db8-8982-4371-826b-c2a860b2ddc0	dbbdc9eb-6901-47b5-bc6c-04ab8a0ec4c9
9203f092-103b-4d34-ad2b-07676598eac1	7e4061a8-1e05-42c6-a799-a971793c5bde
9ac1142d-1b6e-4cc0-8e01-f46c1bb71002	c4c17930-57e3-4c59-9f23-226ca94e0d73
9bcc8709-6630-4724-94e7-9dde295cbf1e	5ec0c77b-8784-4a1e-84b2-fd2c0868887e
a0efd3ea-fb86-4b14-b48a-dcabf17672fb	dbbdc9eb-6901-47b5-bc6c-04ab8a0ec4c9
b2a09cd1-cec9-4070-8b19-f16688cac550	5ec0c77b-8784-4a1e-84b2-fd2c0868887e
cd1487fa-b9c0-4a1a-b8db-553ad6baef52	c4c17930-57e3-4c59-9f23-226ca94e0d73
d2299986-4cef-42c6-8fd5-980fae558c52	dbbdc9eb-6901-47b5-bc6c-04ab8a0ec4c9
dd736706-1970-4084-a3aa-3e326e55664f	efe7e633-3355-4879-bcd3-2b80eab612e1
f95d3443-5c5a-43cc-85e9-c585098e29d6	2ede8a11-3685-4d37-a1d2-631a0a2c112c
fd5611a0-36ab-414e-a328-4c774040ba2f	1a0bca19-96d1-4f70-8a30-d113a02edc31
ffcc3a6b-4faf-45c9-938a-ceba481d7568	efe7e633-3355-4879-bcd3-2b80eab612e1
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
05f236a2-e9f8-4f98-99bf-d1a9abbc11a0	2ce635de-405a-4755-9f98-ac0eb065b0eb	84b4605e-816d-4e85-b841-2a7ac7b3d6ca	120756
0c46c486-05dd-41b2-8a5d-632d17a7dd51	94324093-afce-4a8a-a0e8-d1b3100ab14a	\N	150402
14dff362-d1b1-4411-9b2c-730c64255443	b9c28845-fd31-4883-a686-7e88cccffce5	945559a4-60a5-4851-b047-b92b79e52e92	150882
190c751c-cc04-447a-9788-e7d52de96294	e831febd-7b00-402d-a9eb-a9874f4b0b70	\N	152207
309c4795-026b-4963-9325-0e15016a1bdd	0b832488-0b45-494c-9476-3f9fe788eef2	\N	147329
51ff5d49-f7e2-4043-acd9-0556988f262d	24b8a9c2-8853-404c-b53a-a0e33e7b1531	\N	156298
5692eb57-59f0-4f93-8b62-b0661c8b1203	a8fde0c8-bda1-4601-851b-1a3db0a32360	\N	152365
57cf3739-f749-4851-9db3-2a4f7a3ad8d2	7609f208-49ba-42ef-b782-b52af9c71c87	dd1377ed-39a4-4a22-bc1f-3c25a27d9603	146325
6e8807f2-af56-4061-b687-d8bec85ce4d9	b93a4223-1f31-42a4-b2d2-2577d543f0cc	\N	153274
8bbc688d-c062-460f-bb00-20c24ea142ef	165807ca-5a64-4910-b69e-1daa324f18d5	\N	156278
8dba0db8-8982-4371-826b-c2a860b2ddc0	8bc9c2bc-f249-46b4-a32a-30661abcb68f	\N	152441
9203f092-103b-4d34-ad2b-07676598eac1	a95fa346-e076-47ca-a54f-04b32f346ddc	\N	149921
9ac1142d-1b6e-4cc0-8e01-f46c1bb71002	ea0dbaeb-577f-483f-bf9c-fcd249b7aaab	351d0c69-76eb-4585-8d90-ac877df662f7	132695
9bcc8709-6630-4724-94e7-9dde295cbf1e	65c1ab02-1077-4e01-8463-8294b61c288a	432611b6-a3cb-42b0-9c5d-ef9962b52738	121267
a0efd3ea-fb86-4b14-b48a-dcabf17672fb	866daf58-20c6-42e9-a265-5b05aac7f55a	\N	155288
b2a09cd1-cec9-4070-8b19-f16688cac550	d302c43a-6a8f-46b1-ae86-e39f1031fd1c	dd1377ed-39a4-4a22-bc1f-3c25a27d9603	117390
cd1487fa-b9c0-4a1a-b8db-553ad6baef52	146a56b7-8e3e-4631-9fe9-f62aa88e4300	d460a689-d54a-4bca-8b84-d664eda17bbf	145092
d2299986-4cef-42c6-8fd5-980fae558c52	e6af5c19-b0f5-4fed-9d95-61883fc4b6aa	\N	151861
dd736706-1970-4084-a3aa-3e326e55664f	fb7c73fa-18b1-4e49-b880-fb868c85f465	\N	121538
f95d3443-5c5a-43cc-85e9-c585098e29d6	b5ecb87a-5901-4bc8-aa46-7432a67d4501	24710b57-0733-49dd-844b-8c7f51d1919b	151299
fd5611a0-36ab-414e-a328-4c774040ba2f	019671e8-cc79-4ec0-88ef-5b3760a27838	\N	152444
ffcc3a6b-4faf-45c9-938a-ceba481d7568	ada3df31-47fb-4648-b559-9a183d15218b	\N	121537
e0c41b3d-f593-428b-a7da-989d7e72b04a	d46e47e6-2778-4d83-8e7e-db6d495c8d3f	\N	\N
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
1a0bca19-96d1-4f70-8a30-d113a02edc31	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
2ede8a11-3685-4d37-a1d2-631a0a2c112c	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
5ec0c77b-8784-4a1e-84b2-fd2c0868887e	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
76e9d476-ae72-4edc-8efd-0b160e72cb89	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
7e4061a8-1e05-42c6-a799-a971793c5bde	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
c4c17930-57e3-4c59-9f23-226ca94e0d73	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
dbbdc9eb-6901-47b5-bc6c-04ab8a0ec4c9	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
efe7e633-3355-4879-bcd3-2b80eab612e1	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
191d5eeb-bef0-471b-ba58-4519fe81479f	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
3cf45b6e-1a02-4d6a-93d3-a7affad26f77	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WhenTaskIsDoneDate", "WeldingDate", "WeldingPlanDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "WelderId", "IdFromSystem") FROM stdin;
175efd60-afa6-4771-bba5-83faf0a0fb13	1	\N	2023-02-10 13:16:15.352558	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	9e0af5a9-4a14-43d1-9749-715abbc09085	191d5eeb-bef0-471b-ba58-4519fe81479f	\N	\N
84397467-5014-4f9a-aafa-fc4f8d13713c	2	\N	2023-02-10 13:16:15.354724	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	35ef2d69-7645-4da9-8cea-3fc021f25d83	3cf45b6e-1a02-4d6a-93d3-a7affad26f77	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
28bfb1b2-d412-48c2-ab04-e357772eb17b	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	6be53b39-6bff-44aa-82e3-2d6b139b73d7	\N
5618902b-98e8-411a-8e9d-ef7bf8738c04	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	6be53b39-6bff-44aa-82e3-2d6b139b73d7	\N
e31eaf8a-4c86-4bca-9406-1736d93594e7	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	6be53b39-6bff-44aa-82e3-2d6b139b73d7	\N
9ea571fc-af11-4e1d-b2db-9e0c2cfba8e3	1	12:10:00	13:10:00	13:20:00	13:50:00	959fc2f5-6fc7-425f-bafb-75597b9005ae	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0bd56b3f-6cb0-4b4c-aa1f-ec5ae1639a17	2150	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	2150
126f6889-2d4d-484e-a682-5a64e8a3f15e	1280	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1280
18caed9c-742a-401c-b1c6-c01e878e0d83	1360	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1360
24710b57-0733-49dd-844b-8c7f51d1919b	3650	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3650
351d0c69-76eb-4585-8d90-ac877df662f7	3500	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3500
432611b6-a3cb-42b0-9c5d-ef9962b52738	3600	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3600
46b9aa40-c53b-4e62-832e-c4584dd773ed	1400	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1400
4d5118e7-d7bb-4df2-938e-e5703f961ffa	2130	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	2130
84b4605e-816d-4e85-b841-2a7ac7b3d6ca	3520	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3520
8a12be87-71f0-4b10-a7f4-9c9a38764090	2050	\N	bf7942a9-cd05-431b-b63b-a2de3063d100	2050
945559a4-60a5-4851-b047-b92b79e52e92	3690	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3690
a20e0c96-767c-4337-bd16-499d45dca0c8	1380	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1380
bee5f12a-d4de-455a-9689-e05e9682865a	1390	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1390
d460a689-d54a-4bca-8b84-d664eda17bbf	3590	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3590
dbc154d1-8638-4f15-9800-a4dafe5e0b53	1550	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1550
dd1377ed-39a4-4a22-bc1f-3c25a27d9603	3610	\N	92a46c9a-12d0-4ca6-8461-60fd24f4690a	3610
eedcdb9e-d7b1-46b8-b95b-a4208b275c1d	1260	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1260
f81146b2-f803-4cb7-b49b-75dce562f616	1270	\N	b4bf02ed-4ca9-421e-9c47-a62f27fbb7d1	1270
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
561accd2-dbd0-4b1f-b23b-5a67337243a9	Цех 480	480	480
cc03b931-a1e8-498b-8e0f-4ddad9907154	Цех 50	50	050
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
-- Name: SeamWelder PK_SeamWelder; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamWelder"
    ADD CONSTRAINT "PK_SeamWelder" PRIMARY KEY ("SeamsId", "WeldersId");


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
-- Name: IX_Products_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_WorkplaceId" ON public."Products" USING btree ("WorkplaceId");


--
-- Name: IX_Roles_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Roles_IdFromSystem" ON public."Roles" USING btree ("IdFromSystem");


--
-- Name: IX_SeamWelder_WeldersId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamWelder_WeldersId" ON public."SeamWelder" USING btree ("WeldersId");


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
-- Name: Products FK_Products_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: SeamWelder FK_SeamWelder_Seams_SeamsId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamWelder"
    ADD CONSTRAINT "FK_SeamWelder_Seams_SeamsId" FOREIGN KEY ("SeamsId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: SeamWelder FK_SeamWelder_Welders_WeldersId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamWelder"
    ADD CONSTRAINT "FK_SeamWelder_Welders_WeldersId" FOREIGN KEY ("WeldersId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


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
-- Name: WeldingTasks FK_WeldingTasks_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


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

