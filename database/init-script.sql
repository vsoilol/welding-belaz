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
505e54d9-1279-4f5a-96da-9c2bde3a7543	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
953c8dca-6a58-4424-9c6a-207efbbbc900	20c679e0-43ce-4ce5-9d98-e90a51e3fa4d	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
69554a8b-c8b6-441b-b40e-442d44f92247	1	10	t	505e54d9-1279-4f5a-96da-9c2bde3a7543	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
1386ba90-3899-4154-842e-2d44d9da15a5	Отсутствие сотрудника ОТК	\N
18ff8ef7-e7c5-4742-b19a-7ded053ec80c	Плановый ремонт централизованными службами	\N
1c93a631-69f1-4648-a5bf-134ee089a2dd	Работа по карте несоответствий	\N
1cecc913-42c9-461a-ad1e-4fdc4027d169	Нерабочее время по графику согласно сменности	\N
26abeb9e-74f4-4f65-b8cb-8192e0123209	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
27cee002-70b0-4085-b6cc-a16f148de37c	Отсутствие оператора в связи с необеспеченностью	\N
2e2db7ed-3e95-4cbd-8de8-3a0f99554369	Праздники и выходные	\N
38b28b97-5c1c-4e83-ba1f-b74e2bad3c82	Отсутствие заданий	\N
4c4b65ce-dec1-47ee-9d32-ca2cd9716ec9	Изменение режимов, смена инструмента, приспособления	\N
4f218330-5a2d-443e-9809-0bc639290dc9	Ознакомление с работой, документацией, инструктаж	\N
507ce83d-9c3b-4c18-8344-62fb4d2aaa21	Неявка оператора (б/лист, отпуск, и пр.)	\N
778b0dd7-9530-450e-8c4c-67aac4eea9cf	Отсутствие энергоносителей	\N
7ba575a3-93c8-4a44-b427-ff9db76756b1	Контроль на рабочем месте	\N
89d0f0e8-580b-4b4c-9edf-33bdf06f8a28	Сборочные операции	\N
8cecf7cc-53d4-4b03-93c3-4ef8a882a73b	Отсутствие материала, заготовок, деталей	\N
9ad6a561-f4df-4b65-ad33-4d72fda53c79	Отсутствие крана, транспорта	\N
a6041bcd-a002-4938-8ede-d0a7e689e7b7	Отсутствие конструктора, технолога или ожидание его решения	\N
b09fa4f5-0691-414c-80b7-c484053c290d	Установка, выверка, снятие детали	\N
bc271a92-c63e-4927-9584-6d8c1b75712c	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
c1ff4c63-7e20-41a3-99cf-d15fbb2c6996	Установка, выверка, снятие детали	\N
ca5782f6-3e19-4717-b7eb-08fefe923819	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
d36acf1a-1612-453a-b376-d8061a2b793b	Работа с управляющей программой	\N
e67e50d9-2531-433c-910f-d0c67ef6a235	Аварийный ремонт централизованными службами	\N
f0619478-5651-4511-8d1a-fd5d51ae741f	Естественные надобности	\N
f3bb5af2-8a26-45fb-aaad-e6a4d1430f33	Обед	\N
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
91502325-679d-42c9-ae8a-c447013a1456	8409ed5a-6496-49e1-a5d3-ac9b8f617080	249550
ecd2b0a7-0703-40b1-ab06-7a9aa576eb57	d575374a-72d0-4e4f-b815-782cda5e797a	251534
fdddb4b5-e1ec-4560-9d55-4278d19ae268	ad779be6-b93e-4bc6-8ba8-ff8add290c90	256467
e3596383-0a72-4cfa-9dae-3f9650c85060	c07f83dd-a603-4962-84af-8f75a4a1adc0	235565
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
1996dc25-47b1-4141-89f9-ed84daa9ee37	d9374a6c-e4f4-4341-ad46-3aba04804aa8	\N	613668
8a985ea0-155a-43cd-a0c4-5123f4f10d02	b1505795-810a-4f6f-94a3-f4fdd9123387	\N	612000
8ded6f69-4a6a-47eb-a13a-8459a7ac8a39	aaf06076-bb50-4795-96a4-a13050079862	\N	614208
939123eb-5208-47e0-bf92-cfd6d07a3a62	8b7dac00-5838-4e6b-ab14-75904953e670	\N	643759
959db9db-df7f-4b79-a08b-e5251eef582d	99c8a96b-a60f-4e5e-bc06-a9e39f41e51e	\N	614962
acb19f98-b2e8-488b-b2cc-76b429b3db63	43e28eee-23d7-4a89-951a-e12896ea6ca8	\N	617215
e8f24dcb-14fe-459c-a573-d695bb0c54d4	d71dcfc3-d957-40de-953c-fe45615de875	\N	610422
7e1aa3a6-5332-4161-acee-fb7aae61252d	9171cb18-af89-41da-b1de-79eb8bd1fef1	\N	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
a991f782-f3cc-4275-b692-9b8728d862c5	2	Пост 2	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
d72791ce-b4b7-49ed-967b-80f629424b29	1	Пост 1	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	0ef1e757-d85d-4927-b1f7-9597f5f0f5f5
0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	1536949e-a30f-489b-9058-77326afee2f5
0ef1e757-d85d-4927-b1f7-9597f5f0f5f5	1ae618eb-b9c3-431e-9431-dfa9027e64eb
5a4b95a5-0e0e-4366-8c5d-a255c8238089	3ef55158-7f16-4c80-bcad-90ca7f3c7759
fa358263-8295-43e1-92bd-316d67221328	46a9ff4a-9606-4f86-81f4-aa9e7c61f6c2
a6e04912-bbc9-4049-94b3-7a8da5a49110	4d48727e-8372-4e1f-a8ae-f98069c677a6
5a4b95a5-0e0e-4366-8c5d-a255c8238089	599f6daa-55fc-480d-900e-f62950fe4e5d
0447fef1-3a00-48ab-bf17-b127f0ac20be	5a4b95a5-0e0e-4366-8c5d-a255c8238089
fa358263-8295-43e1-92bd-316d67221328	5f4a3835-cbeb-4b32-ae62-dd38cc81ec82
0ef1e757-d85d-4927-b1f7-9597f5f0f5f5	660e1bc3-61b9-49aa-b5c4-02e6c1c66270
1536949e-a30f-489b-9058-77326afee2f5	68a43c52-cc14-4dbb-ab72-9b008cd01243
a6e04912-bbc9-4049-94b3-7a8da5a49110	8a3da159-a527-48f1-a0bd-601f21b3688c
0447fef1-3a00-48ab-bf17-b127f0ac20be	8acf914d-5bbb-4545-8e1a-9630f37a36f1
cd30ecb7-3f05-49a8-a082-9f7d0bcba55e	93367abb-0468-4056-aee2-b2358b774cb9
cc38f1f4-c9ac-49c0-8ef5-7b9f1b797c4d	a496089a-fcc9-4852-86fd-909a3d6f1451
0447fef1-3a00-48ab-bf17-b127f0ac20be	a6e04912-bbc9-4049-94b3-7a8da5a49110
cc38f1f4-c9ac-49c0-8ef5-7b9f1b797c4d	afcc9202-b2b6-4373-af31-4989d4967c53
0447fef1-3a00-48ab-bf17-b127f0ac20be	bd2192e8-cf46-4f0f-8df8-2886cb2f16bb
fa358263-8295-43e1-92bd-316d67221328	cc38f1f4-c9ac-49c0-8ef5-7b9f1b797c4d
fa358263-8295-43e1-92bd-316d67221328	cd30ecb7-3f05-49a8-a082-9f7d0bcba55e
cd30ecb7-3f05-49a8-a082-9f7d0bcba55e	db90bbaf-9284-485d-b214-cb63dd1be030
0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	fb2d75b3-27b4-4171-a98c-059edc5cea87
0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	fe4e9798-483b-4f1a-ab70-417ebdde87a8
1536949e-a30f-489b-9058-77326afee2f5	ff53650d-c679-42a5-bce9-cad19e2aa171
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	Сборка, сварка рам к/с г/п 120-130 т.	6	1f4abe1a-54db-44fa-9cee-cd2117e9763d	06
c573a9eb-7749-4ec1-9163-f1d59bec8300	Производственный участок 5	5	6886dbc5-1aeb-49e6-9a68-ce6bfb4638df	05
cda62bf7-0ece-4d36-a09f-80fa4642c05e	Сборка, сварка мостов	1	1f4abe1a-54db-44fa-9cee-cd2117e9763d	01
f0161f40-d393-4fe9-be9a-1f9428b230a7	Сборка, сварка узл. и рам к/с г/п 120-220т	4	1f4abe1a-54db-44fa-9cee-cd2117e9763d	04
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
0447fef1-3a00-48ab-bf17-b127f0ac20be	Картер заднего моста	75132-2401006-50	1	f	f	1	7abfce58-0f51-4650-a888-da055f30bfee	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536467567
0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	Рама	75313-2800010-20	1	f	f	1	522d8e57-5f70-4eb7-82d3-70553db95e5e	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536287819
0ef1e757-d85d-4927-b1f7-9597f5f0f5f5	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	0da011f3-73a4-4f7a-a911-454394fbfde5	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536248707
1536949e-a30f-489b-9058-77326afee2f5	Кронштейн	75310-1183100	1	f	f	2	edd14f56-5c30-4c9b-ab47-732f81a8bd8e	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536267493
1ae618eb-b9c3-431e-9431-dfa9027e64eb	Кронштейн	75303-1001293	1	f	f	3	a5dbb4c4-1edf-46bb-812e-b4a54bc046ea	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536247228
3ef55158-7f16-4c80-bcad-90ca7f3c7759	Распорка	7521-3932688	1	f	f	3	c3091a4c-05f5-4282-b125-c09fab9ffacf	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536273606
599f6daa-55fc-480d-900e-f62950fe4e5d	Проушина	7521-2401224	1	f	f	3	fbde6225-2aef-4f37-af76-2d01e2e5611d	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536274170
5a4b95a5-0e0e-4366-8c5d-a255c8238089	Кронштейн	7521-2401220	1	f	f	2	b86ac7f5-8b55-42b3-8dd4-daf510adf25b	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536273956
5f4a3835-cbeb-4b32-ae62-dd38cc81ec82	Кронштейн	75580-2113192	1	f	f	3	16ef5936-ca6d-4c62-a559-483b00eca078	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536384314
660e1bc3-61b9-49aa-b5c4-02e6c1c66270	Кронштейн	75304-1001253	1	f	f	3	c8ad7a4f-cbd0-4e0c-aa65-d5975d3e44c7	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536248708
68a43c52-cc14-4dbb-ab72-9b008cd01243	Кронштейн	75310-1183106	1	f	f	3	72b23cfd-646d-4845-bbcd-df9b7adf530d	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536267485
8a3da159-a527-48f1-a0bd-601f21b3688c	Пластина	75132-2401106	1	f	f	3	42eb5e40-7b74-41e3-910d-105fd5992cbc	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536444153
8acf914d-5bbb-4545-8e1a-9630f37a36f1	Кронштейн	75131-2113296-10	1	f	f	3	e32ee2d4-c2b6-43f5-b544-88262f73efd7	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536461620
93367abb-0468-4056-aee2-b2358b774cb9	Труба картера	75580-2401132-10	1	f	f	3	56ec377a-923d-4097-ac42-ae1b378b5f70	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536386250
a496089a-fcc9-4852-86fd-909a3d6f1451	Кольцо	75580-2401227	1	f	f	3	0f78d1cd-7c14-49e5-8aec-1a4128b7e593	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536384312
a6e04912-bbc9-4049-94b3-7a8da5a49110	Картер заднего моста	75132-2401008-50	1	f	f	2	a968b523-328d-4d22-bbaa-3758fdf66157	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536467565
afcc9202-b2b6-4373-af31-4989d4967c53	Втулка	75303-2128438	1	f	f	3	906c0dc4-0b79-4162-af43-f194dbed1614	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536248270
bd2192e8-cf46-4f0f-8df8-2886cb2f16bb	Панель	75132-2105522	1	f	f	3	97d4e197-2e48-45e0-bbe3-5b23d0169d94	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536417730
cc38f1f4-c9ac-49c0-8ef5-7b9f1b797c4d	Картер заднего моста	75580-2401008	1	f	f	2	dd2cd2c4-dbe6-4a90-9e4d-9c7310a81c70	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536384295
cd30ecb7-3f05-49a8-a082-9f7d0bcba55e	Труба картера заднего моста	75580-2401010-01	1	f	f	2	82a1bd0c-e472-426e-bff0-20e72a7ec1fb	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536386240
db90bbaf-9284-485d-b214-cb63dd1be030	Фланец картера	75580-2401114-11	1	f	f	3	1f46ff45-52fd-4c13-9a62-346b0cd342b5	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536386265
fa358263-8295-43e1-92bd-316d67221328	Картер заднего моста	75580-2401006	1	f	f	1	e68df260-46d1-49a7-ae49-9e03e62e4e59	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N	4536384294
fb2d75b3-27b4-4171-a98c-059edc5cea87	Кронштейн	75211-1018162	1	f	f	3	b4b8ebbb-dd81-4574-b43e-2dc45909ef85	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536270344
fe4e9798-483b-4f1a-ab70-417ebdde87a8	Накладка	549Б-1015842	1	f	f	3	84bce365-007b-4b0f-ad17-6293ce073aa3	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536196288
ff53650d-c679-42a5-bce9-cad19e2aa171	Кронштейн	75310-1183102	1	f	f	3	b08a277a-17cc-4d15-84d6-864217ec9159	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	\N	\N	4536267484
46a9ff4a-9606-4f86-81f4-aa9e7c61f6c2	Панель	75580-2105522	1	f	f	3	58bb5412-7a63-4d8d-9e14-51c209997540	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	7e1aa3a6-5332-4161-acee-fb7aae61252d	\N	4536384399
4d48727e-8372-4e1f-a8ae-f98069c677a6	Опора	75211-2401122	1	f	f	3	a4ae1cf8-585f-4d79-88d9-50efecee1015	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	7e1aa3a6-5332-4161-acee-fb7aae61252d	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
a150040c-0559-4057-a9b5-38f2ea746f5d	Admin	\N
3afe8a24-3307-4253-a403-7733d1df0968	Master	\N
758ee748-9053-49b9-9fd5-1c8846e3b8c9	Welder	\N
ef58f2b0-1b23-406d-acf0-80b49cd868cc	Inspector	\N
59b4f1a3-7ade-4dff-9f98-301fc1d92a3e	Chief	\N
\.


--
-- Data for Name: SeamWelder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamWelder" ("SeamsId", "WeldersId") FROM stdin;
8283ff3a-e96e-4355-8f1f-72346967ab16	43567725-7033-4d7a-a731-f6e0107154d5
fcfd6bac-ba48-4526-b2ad-8deab8ff43ed	43567725-7033-4d7a-a731-f6e0107154d5
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "Status", "IsControlSubject", "IsAddManually", "ProductId", "TechnologicalInstructionId", "ProductionAreaId", "WorkplaceId", "InspectorId", "IdFromSystem") FROM stdin;
0ba50071-c827-4b78-8a42-0358814b14f7	3	333	1	t	f	0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N
6834997e-d95e-4b38-84e8-816fc76d6c4e	2	222	1	t	f	0447fef1-3a00-48ab-bf17-b127f0ac20be	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N
68e34a53-5b05-43ce-acec-caf4c7d2c6b3	1	111	1	t	f	0447fef1-3a00-48ab-bf17-b127f0ac20be	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N
9205c58b-3f60-46dd-84c7-82291a5f9744	4	222	1	t	f	0e549495-dc3e-46b7-a9cf-8ce86b6b2f42	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N	\N	\N
8283ff3a-e96e-4355-8f1f-72346967ab16	2	200	3	t	f	46a9ff4a-9606-4f86-81f4-aa9e7c61f6c2	56ef0d58-b8ad-4347-827e-a62f7b05c1ba	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	e3596383-0a72-4cfa-9dae-3f9650c85060	\N
fcfd6bac-ba48-4526-b2ad-8deab8ff43ed	1	100	3	t	f	4d48727e-8372-4e1f-a8ae-f98069c677a6	5c4e9c7f-f235-445c-8ad8-9b6a8359ca93	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N	e3596383-0a72-4cfa-9dae-3f9650c85060	\N
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
56ef0d58-b8ad-4347-827e-a62f7b05c1ba	1	ИТП	\N
5c4e9c7f-f235-445c-8ad8-9b6a8359ca93	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
0da011f3-73a4-4f7a-a911-454394fbfde5	1334123	Технологический процесс	Ссылка	1334123
0f78d1cd-7c14-49e5-8aec-1a4128b7e593	1402616	Технологический процесс	Ссылка	1402616
16ef5936-ca6d-4c62-a559-483b00eca078	1405914	Технологический процесс	Ссылка	1405914
1f46ff45-52fd-4c13-9a62-346b0cd342b5	3338649	Технологический процесс	Ссылка	3338649
42eb5e40-7b74-41e3-910d-105fd5992cbc	1003048	Технологический процесс	Ссылка	1003048
522d8e57-5f70-4eb7-82d3-70553db95e5e	3239598	Технологический процесс	Ссылка	3239598
56ec377a-923d-4097-ac42-ae1b378b5f70	2822569	Технологический процесс	Ссылка	2822569
58bb5412-7a63-4d8d-9e14-51c209997540	1405307	Технологический процесс	Ссылка	1405307
72b23cfd-646d-4845-bbcd-df9b7adf530d	1119363	Технологический процесс	Ссылка	1119363
7abfce58-0f51-4650-a888-da055f30bfee	3090319	Технологический процесс	Ссылка	3090319
82a1bd0c-e472-426e-bff0-20e72a7ec1fb	2915477	Технологический процесс	Ссылка	2915477
84bce365-007b-4b0f-ad17-6293ce073aa3	1426226	Технологический процесс	Ссылка	1426226
906c0dc4-0b79-4162-af43-f194dbed1614	3011514	Технологический процесс	Ссылка	3011514
97d4e197-2e48-45e0-bbe3-5b23d0169d94	1053809	Технологический процесс	Ссылка	1053809
a4ae1cf8-585f-4d79-88d9-50efecee1015	3211246	Технологический процесс	Ссылка	3211246
a5dbb4c4-1edf-46bb-812e-b4a54bc046ea	3049271	Технологический процесс	Ссылка	3049271
a968b523-328d-4d22-bbaa-3758fdf66157	3232836	Технологический процесс	Ссылка	3232836
b08a277a-17cc-4d15-84d6-864217ec9159	1104641	Технологический процесс	Ссылка	1104641
b4b8ebbb-dd81-4574-b43e-2dc45909ef85	2841119	Технологический процесс	Ссылка	2841119
b86ac7f5-8b55-42b3-8dd4-daf510adf25b	1362989	Технологический процесс	Ссылка	1362989
c3091a4c-05f5-4282-b125-c09fab9ffacf	908693	Технологический процесс	Ссылка	908693
c8ad7a4f-cbd0-4e0c-aa65-d5975d3e44c7	1492964	Технологический процесс	Ссылка	1492964
dd2cd2c4-dbe6-4a90-9e4d-9c7310a81c70	3232938	Технологический процесс	Ссылка	3232938
e32ee2d4-c2b6-43f5-b544-88262f73efd7	526870	Технологический процесс	Ссылка	526870
e68df260-46d1-49a7-ae49-9e03e62e4e59	2433634	Технологический процесс	Ссылка	2433634
edd14f56-5c30-4c9b-ab47-732f81a8bd8e	1823031	Технологический процесс	Ссылка	1823031
fbde6225-2aef-4f37-af76-2d01e2e5611d	1124147	Технологический процесс	Ссылка	1124147
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
8409ed5a-6496-49e1-a5d3-ac9b8f617080	ef58f2b0-1b23-406d-acf0-80b49cd868cc
ad779be6-b93e-4bc6-8ba8-ff8add290c90	ef58f2b0-1b23-406d-acf0-80b49cd868cc
d575374a-72d0-4e4f-b815-782cda5e797a	ef58f2b0-1b23-406d-acf0-80b49cd868cc
43e28eee-23d7-4a89-951a-e12896ea6ca8	3afe8a24-3307-4253-a403-7733d1df0968
8b7dac00-5838-4e6b-ab14-75904953e670	3afe8a24-3307-4253-a403-7733d1df0968
99c8a96b-a60f-4e5e-bc06-a9e39f41e51e	3afe8a24-3307-4253-a403-7733d1df0968
aaf06076-bb50-4795-96a4-a13050079862	3afe8a24-3307-4253-a403-7733d1df0968
b1505795-810a-4f6f-94a3-f4fdd9123387	3afe8a24-3307-4253-a403-7733d1df0968
d71dcfc3-d957-40de-953c-fe45615de875	3afe8a24-3307-4253-a403-7733d1df0968
d9374a6c-e4f4-4341-ad46-3aba04804aa8	3afe8a24-3307-4253-a403-7733d1df0968
1739e297-91a3-4dd5-bb8f-ec1079120a14	758ee748-9053-49b9-9fd5-1c8846e3b8c9
2a954dc5-cef9-4a42-9b1c-07720e1b86f5	758ee748-9053-49b9-9fd5-1c8846e3b8c9
31dd69a1-21d0-46e9-93ad-d268283f529c	758ee748-9053-49b9-9fd5-1c8846e3b8c9
35556b51-bb23-4f51-842a-24e82d54dc6b	758ee748-9053-49b9-9fd5-1c8846e3b8c9
384e27e9-2348-4c6e-aa6b-0676e047da3b	758ee748-9053-49b9-9fd5-1c8846e3b8c9
38cfdbde-0b68-467d-ac2f-1ff4c6093c84	758ee748-9053-49b9-9fd5-1c8846e3b8c9
411c57ed-8081-4548-9097-1e242c66745e	758ee748-9053-49b9-9fd5-1c8846e3b8c9
68abade5-c860-470a-a6c5-b8e17fb778e4	758ee748-9053-49b9-9fd5-1c8846e3b8c9
6c543076-85c6-488f-a51e-f1c65c2b871c	758ee748-9053-49b9-9fd5-1c8846e3b8c9
6cf26063-e256-44eb-8c94-89a7c37b2e7b	758ee748-9053-49b9-9fd5-1c8846e3b8c9
7b35bce8-e1b0-4b21-b3c2-321226389941	758ee748-9053-49b9-9fd5-1c8846e3b8c9
8598cb0b-636e-44d3-a7c6-200b7271b2e9	758ee748-9053-49b9-9fd5-1c8846e3b8c9
9301b7fe-6eb3-4796-b5e2-e95be1cc399d	758ee748-9053-49b9-9fd5-1c8846e3b8c9
96a0add2-299e-43cb-856b-25e1b1d73637	758ee748-9053-49b9-9fd5-1c8846e3b8c9
97f1f37b-3741-4a4e-91f7-b3e47a452663	758ee748-9053-49b9-9fd5-1c8846e3b8c9
9b8b8826-dd65-4e53-91cb-7705a875f445	758ee748-9053-49b9-9fd5-1c8846e3b8c9
add0bc53-aa0d-402d-bae6-4495e3b16d95	758ee748-9053-49b9-9fd5-1c8846e3b8c9
ae56923f-8bff-4cdf-9c8e-bb243d26866a	758ee748-9053-49b9-9fd5-1c8846e3b8c9
b6128bce-4814-4c5d-9797-bda0f1e8dc16	758ee748-9053-49b9-9fd5-1c8846e3b8c9
c08f7274-d95b-4311-a3bb-cff30c8d9e61	758ee748-9053-49b9-9fd5-1c8846e3b8c9
c69c0cf1-5b8a-4ca0-9c12-a57b8d8291ef	758ee748-9053-49b9-9fd5-1c8846e3b8c9
d7aa0997-d2e3-4041-b688-966cb5d4e0c6	758ee748-9053-49b9-9fd5-1c8846e3b8c9
20c679e0-43ce-4ce5-9d98-e90a51e3fa4d	59b4f1a3-7ade-4dff-9f98-301fc1d92a3e
9171cb18-af89-41da-b1de-79eb8bd1fef1	3afe8a24-3307-4253-a403-7733d1df0968
08c5598e-d6a1-4be9-9139-7530da0f6409	758ee748-9053-49b9-9fd5-1c8846e3b8c9
c07f83dd-a603-4962-84af-8f75a4a1adc0	ef58f2b0-1b23-406d-acf0-80b49cd868cc
b8bb0876-02cd-4976-bf5b-0be4d7d5b315	a150040c-0559-4057-a9b5-38f2ea746f5d
9f18bd68-c0e3-402a-b99c-63fb9916c6b8	758ee748-9053-49b9-9fd5-1c8846e3b8c9
7aca73ea-25f8-4832-ba2c-ad8d5a7c24cb	ef58f2b0-1b23-406d-acf0-80b49cd868cc
8c6fc210-d160-4bb5-9aea-9951ff5c0c60	59b4f1a3-7ade-4dff-9f98-301fc1d92a3e
9e99f426-40ff-4e08-9e4b-59d3e27a3e7a	3afe8a24-3307-4253-a403-7733d1df0968
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
8409ed5a-6496-49e1-a5d3-ac9b8f617080	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
ad779be6-b93e-4bc6-8ba8-ff8add290c90	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	c573a9eb-7749-4ec1-9163-f1d59bec8300	\N
d575374a-72d0-4e4f-b815-782cda5e797a	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	c573a9eb-7749-4ec1-9163-f1d59bec8300	\N
43e28eee-23d7-4a89-951a-e12896ea6ca8	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N
8b7dac00-5838-4e6b-ab14-75904953e670	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
99c8a96b-a60f-4e5e-bc06-a9e39f41e51e	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
aaf06076-bb50-4795-96a4-a13050079862	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N
b1505795-810a-4f6f-94a3-f4fdd9123387	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
d71dcfc3-d957-40de-953c-fe45615de875	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
d9374a6c-e4f4-4341-ad46-3aba04804aa8	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
1739e297-91a3-4dd5-bb8f-ec1079120a14	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
2a954dc5-cef9-4a42-9b1c-07720e1b86f5	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
31dd69a1-21d0-46e9-93ad-d268283f529c	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
35556b51-bb23-4f51-842a-24e82d54dc6b	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
384e27e9-2348-4c6e-aa6b-0676e047da3b	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
38cfdbde-0b68-467d-ac2f-1ff4c6093c84	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N
411c57ed-8081-4548-9097-1e242c66745e	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N
68abade5-c860-470a-a6c5-b8e17fb778e4	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
6c543076-85c6-488f-a51e-f1c65c2b871c	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	\N
6cf26063-e256-44eb-8c94-89a7c37b2e7b	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
7b35bce8-e1b0-4b21-b3c2-321226389941	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
8598cb0b-636e-44d3-a7c6-200b7271b2e9	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
9301b7fe-6eb3-4796-b5e2-e95be1cc399d	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
96a0add2-299e-43cb-856b-25e1b1d73637	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
97f1f37b-3741-4a4e-91f7-b3e47a452663	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
9b8b8826-dd65-4e53-91cb-7705a875f445	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
add0bc53-aa0d-402d-bae6-4495e3b16d95	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
ae56923f-8bff-4cdf-9c8e-bb243d26866a	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
b6128bce-4814-4c5d-9797-bda0f1e8dc16	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
c08f7274-d95b-4311-a3bb-cff30c8d9e61	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
c69c0cf1-5b8a-4ca0-9c12-a57b8d8291ef	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
d7aa0997-d2e3-4041-b688-966cb5d4e0c6	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
20c679e0-43ce-4ce5-9d98-e90a51e3fa4d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	\N
9171cb18-af89-41da-b1de-79eb8bd1fef1	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
08c5598e-d6a1-4be9-9139-7530da0f6409	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
c07f83dd-a603-4962-84af-8f75a4a1adc0	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	\N
b8bb0876-02cd-4976-bf5b-0be4d7d5b315	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$/Vc0NOZs1pM4rCcWB5Ws6rv4pBSdHD19bbyb8wZvKF04HcuY	\N	\N	\N	\N	\N	\N
9f18bd68-c0e3-402a-b99c-63fb9916c6b8	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$Y5uq2na+/3TDJIRvzIoDipevUXiMD0vyc65V4neRVgy2UP7u	\N	\N	\N	\N	\N	\N
7aca73ea-25f8-4832-ba2c-ad8d5a7c24cb	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$Mslx0+9v2vZ2WpJOfoxAmRzXMFvHCjjACrfZrSPsZFObtVc8	\N	\N	\N	\N	\N	\N
8c6fc210-d160-4bb5-9aea-9951ff5c0c60	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$8ptvElY9HlTjlrP/oXFVBFQ19dXy1pR5lAGwmHLIy8y5B6FX	\N	\N	\N	\N	\N	\N
9e99f426-40ff-4e08-9e4b-59d3e27a3e7a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$lqB02dBNqYBlxEv/fY7jFBHQwDIbQdmoCDpoZ0l4DYGXKnaa	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
18c4cff2-992b-4b97-8b65-4653e0a502ff	1	Корневой	80	120	22	24	50	250	5c4e9c7f-f235-445c-8ad8-9b6a8359ca93	\N
27886109-74eb-426b-8130-833e57bd9667	2	Заполняющий	80	120	21	25	50	250	56ef0d58-b8ad-4347-827e-a62f7b05c1ba	\N
909082ec-abdd-4a40-989e-864aa01bee1e	1	Корневой	80	120	\N	\N	50	250	56ef0d58-b8ad-4347-827e-a62f7b05c1ba	\N
e3343bd5-9aa1-493b-9cfb-15ce5f2d3fd9	2	Заполняющий	80	120	21	25	50	250	5c4e9c7f-f235-445c-8ad8-9b6a8359ca93	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IsDone", "SeamId", "IdFromSystem") FROM stdin;
14d84987-7e3f-40f2-ba6f-241b68648af7	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	fcfd6bac-ba48-4526-b2ad-8deab8ff43ed	\N
48f84659-efc4-497d-bc25-86a0abca12e4	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	fcfd6bac-ba48-4526-b2ad-8deab8ff43ed	\N
496deb1b-8336-499c-8810-46ba9fb8e124	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	8283ff3a-e96e-4355-8f1f-72346967ab16	\N
e4771900-e589-4f82-9360-6ad4fa1477f6	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	8283ff3a-e96e-4355-8f1f-72346967ab16	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
07b96f39-2a2f-4518-9ca1-e87326541be7	e271e91c-5e65-4e21-8d7a-f65606552d5d
07fea380-ad2a-4625-a6bc-a058e933e63d	a8bfe4b2-ef9c-447a-99a7-b790488ac484
08ad453d-93b3-4e91-a5ae-23ec81a40346	f5b43cfb-f7c5-4137-a5a4-f63566ef2d36
1cec3822-f95c-4b38-8bda-444ed9b32430	b30e66d1-9628-4194-9d29-1feb50900f3e
22151443-1c65-42ec-bad2-988d7895b780	b30e66d1-9628-4194-9d29-1feb50900f3e
259ad860-c46e-4757-b27d-4aebc91aa0e8	d01aa934-4e3f-4556-b8b8-26cdd29c9a0d
2fc0d6e8-1131-4315-98c6-db6bac0461d0	b30e66d1-9628-4194-9d29-1feb50900f3e
40dcc58a-e00e-4f7e-8196-600cf1007bfc	f5b43cfb-f7c5-4137-a5a4-f63566ef2d36
57717bda-f1c6-4544-b1cf-40ac37765e2b	0bf314fa-3ff0-4f45-95c1-092dfd944b63
5ba3dbad-e43b-48e4-a70f-3cf30203df06	bf85add4-ce6a-4fbd-ba56-fc4174342a5a
6dd5ee82-dad5-4a1b-a164-921baf8516a4	0bf314fa-3ff0-4f45-95c1-092dfd944b63
854987dc-caaf-4184-8da2-213f4df58de3	e271e91c-5e65-4e21-8d7a-f65606552d5d
9dc68282-f465-4507-ba0d-c151a552db52	f5b43cfb-f7c5-4137-a5a4-f63566ef2d36
a560e930-4311-4058-86ae-3780c4a29f88	a8bfe4b2-ef9c-447a-99a7-b790488ac484
abeb1991-4630-47bf-a38b-52dce2ba3c91	f5b43cfb-f7c5-4137-a5a4-f63566ef2d36
b15bfa2d-2616-47ad-ac83-ca5f8b3a2384	e271e91c-5e65-4e21-8d7a-f65606552d5d
b24aa2e0-9c8c-4820-b618-df04d24c182b	8feb14b2-86fe-4595-9b22-66d9c5c3ed9a
ca308960-073c-43af-ab81-776f09e3f5d9	8feb14b2-86fe-4595-9b22-66d9c5c3ed9a
cd2c1254-9ef4-46d7-9bb8-832fad4ac214	bf85add4-ce6a-4fbd-ba56-fc4174342a5a
d03d1abd-05b2-4c7a-bf0a-4ed2c092d59d	d01aa934-4e3f-4556-b8b8-26cdd29c9a0d
dbc33600-eef2-445d-8b31-f60b5070b2a1	f5b43cfb-f7c5-4137-a5a4-f63566ef2d36
f53b7429-e8c6-4d06-b73b-2db4c6f2fe5f	b30e66d1-9628-4194-9d29-1feb50900f3e
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
07b96f39-2a2f-4518-9ca1-e87326541be7	6c543076-85c6-488f-a51e-f1c65c2b871c	\N	152444
07fea380-ad2a-4625-a6bc-a058e933e63d	97f1f37b-3741-4a4e-91f7-b3e47a452663	af9935f6-9f84-4806-98ba-4d3735953f87	146325
08ad453d-93b3-4e91-a5ae-23ec81a40346	9301b7fe-6eb3-4796-b5e2-e95be1cc399d	\N	152365
1cec3822-f95c-4b38-8bda-444ed9b32430	ae56923f-8bff-4cdf-9c8e-bb243d26866a	\N	152441
22151443-1c65-42ec-bad2-988d7895b780	96a0add2-299e-43cb-856b-25e1b1d73637	\N	153274
259ad860-c46e-4757-b27d-4aebc91aa0e8	d7aa0997-d2e3-4041-b688-966cb5d4e0c6	eb789d5e-a65f-44c6-b8f6-c2448e5eb406	145092
2fc0d6e8-1131-4315-98c6-db6bac0461d0	6cf26063-e256-44eb-8c94-89a7c37b2e7b	\N	151861
40dcc58a-e00e-4f7e-8196-600cf1007bfc	1739e297-91a3-4dd5-bb8f-ec1079120a14	\N	121537
57717bda-f1c6-4544-b1cf-40ac37765e2b	2a954dc5-cef9-4a42-9b1c-07720e1b86f5	93de40ed-adcd-43b2-b564-e9d7745c5144	150882
5ba3dbad-e43b-48e4-a70f-3cf30203df06	c08f7274-d95b-4311-a3bb-cff30c8d9e61	af9935f6-9f84-4806-98ba-4d3735953f87	117390
6dd5ee82-dad5-4a1b-a164-921baf8516a4	add0bc53-aa0d-402d-bae6-4495e3b16d95	8477b125-142c-45d0-9e50-788a13cdad20	151299
854987dc-caaf-4184-8da2-213f4df58de3	38cfdbde-0b68-467d-ac2f-1ff4c6093c84	\N	156278
9dc68282-f465-4507-ba0d-c151a552db52	31dd69a1-21d0-46e9-93ad-d268283f529c	\N	147329
a560e930-4311-4058-86ae-3780c4a29f88	c69c0cf1-5b8a-4ca0-9c12-a57b8d8291ef	88943172-3536-4240-9939-9e33d6578bfd	120756
abeb1991-4630-47bf-a38b-52dce2ba3c91	7b35bce8-e1b0-4b21-b3c2-321226389941	\N	121538
b15bfa2d-2616-47ad-ac83-ca5f8b3a2384	411c57ed-8081-4548-9097-1e242c66745e	\N	152207
b24aa2e0-9c8c-4820-b618-df04d24c182b	9b8b8826-dd65-4e53-91cb-7705a875f445	\N	149921
ca308960-073c-43af-ab81-776f09e3f5d9	8598cb0b-636e-44d3-a7c6-200b7271b2e9	\N	150402
cd2c1254-9ef4-46d7-9bb8-832fad4ac214	68abade5-c860-470a-a6c5-b8e17fb778e4	8a7b1aff-f48d-4d83-a4ea-eb7ae7246886	121267
d03d1abd-05b2-4c7a-bf0a-4ed2c092d59d	b6128bce-4814-4c5d-9797-bda0f1e8dc16	4833e760-3d59-481b-8b58-76c026f36ea0	132695
dbc33600-eef2-445d-8b31-f60b5070b2a1	384e27e9-2348-4c6e-aa6b-0676e047da3b	\N	156298
f53b7429-e8c6-4d06-b73b-2db4c6f2fe5f	35556b51-bb23-4f51-842a-24e82d54dc6b	\N	155288
43567725-7033-4d7a-a731-f6e0107154d5	08c5598e-d6a1-4be9-9139-7530da0f6409	\N	\N
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
0bf314fa-3ff0-4f45-95c1-092dfd944b63	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
8feb14b2-86fe-4595-9b22-66d9c5c3ed9a	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
a8bfe4b2-ef9c-447a-99a7-b790488ac484	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
b30e66d1-9628-4194-9d29-1feb50900f3e	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
bf85add4-ce6a-4fbd-ba56-fc4174342a5a	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
d01aa934-4e3f-4556-b8b8-26cdd29c9a0d	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
e271e91c-5e65-4e21-8d7a-f65606552d5d	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
f5b43cfb-f7c5-4137-a5a4-f63566ef2d36	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
12f261da-a8c9-4efa-b089-9ce708f06b2a	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
4ddf9551-d6a1-4089-b0b6-5f78df0475e8	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WhenTaskIsDoneDate", "WeldingDate", "WeldingPlanDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "WelderId", "IdFromSystem") FROM stdin;
12d7d186-ee4d-4714-930c-78b029d32cf1	1	\N	2023-02-14 19:28:43.038875	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	fcfd6bac-ba48-4526-b2ad-8deab8ff43ed	12f261da-a8c9-4efa-b089-9ce708f06b2a	\N	\N
dd3526c6-34b0-4700-ac28-fa66a6e33cff	2	\N	2023-02-14 19:28:43.041378	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8283ff3a-e96e-4355-8f1f-72346967ab16	4ddf9551-d6a1-4089-b0b6-5f78df0475e8	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
31d6cf7a-d0ef-41d5-b93e-5957dd7e2e8e	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	505e54d9-1279-4f5a-96da-9c2bde3a7543	\N
b16103ff-f156-4267-9dc0-9d0b4d155c32	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	505e54d9-1279-4f5a-96da-9c2bde3a7543	\N
ce224d0d-e068-4afe-9d02-56171214e73f	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	505e54d9-1279-4f5a-96da-9c2bde3a7543	\N
580956de-e7ec-43f0-91fd-ddbbd21bd2f9	1	12:10:00	13:10:00	13:20:00	13:50:00	69554a8b-c8b6-441b-b40e-442d44f92247	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
07660685-e4f1-4f2d-9a6b-8520dbb65940	2150	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	2150
1bbbac5a-009b-4a70-854e-2a794248e5c8	2050	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	2050
3644c3fc-b2ee-48a3-84b7-aa6671564223	1280	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1280
4833e760-3d59-481b-8b58-76c026f36ea0	3500	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3500
51cc6998-4db1-4293-ae6f-0f36ded971f3	1260	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1260
5c87a668-519a-4d21-af89-e1ac26f118e3	2130	\N	cda62bf7-0ece-4d36-a09f-80fa4642c05e	2130
8477b125-142c-45d0-9e50-788a13cdad20	3650	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3650
88203684-1a32-47d0-ac4b-2f8b8a67e76c	1360	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1360
88943172-3536-4240-9939-9e33d6578bfd	3520	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3520
8a7b1aff-f48d-4d83-a4ea-eb7ae7246886	3600	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3600
9065f60c-2d01-4cee-ad1a-d299a04cb438	1270	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1270
93de40ed-adcd-43b2-b564-e9d7745c5144	3690	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3690
95634e7b-b532-425e-9991-b19fd6170043	1390	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1390
a8aa3003-2b2c-4cc9-94bf-86bdc8ea1859	1550	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1550
af9935f6-9f84-4806-98ba-4d3735953f87	3610	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3610
de976f97-4076-4908-a487-c6caea04321d	1380	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1380
eb789d5e-a65f-44c6-b8f6-c2448e5eb406	3590	\N	2fd1d3dc-0d84-4cfa-b8bd-f04d2cd4c80b	3590
fc11f67e-10e8-4e60-9104-ada4e8b586fb	1400	\N	f0161f40-d393-4fe9-be9a-1f9428b230a7	1400
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
1f4abe1a-54db-44fa-9cee-cd2117e9763d	Цех 50	50	050
6886dbc5-1aeb-49e6-9a68-ce6bfb4638df	Цех 480	480	480
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

