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
    "WeldingEquipmentId" uuid NOT NULL,
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
93ca3f28-12d2-43c8-ab27-7d2091334111	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
a62ac04f-8642-44aa-b0c5-f05447588569	c028f0bf-1750-4df0-abfe-62128df0a176	4ed5c3af-1d3e-4eb4-8bdf-e5dcf1e8ed98	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
6a20cc88-0d62-43d9-b777-e7bb1f1ba6b3	1	10	t	93ca3f28-12d2-43c8-ab27-7d2091334111	\N
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
004ee03e-007c-4a59-98e3-e7b7a31a185e	Ознакомление с работой, документацией, инструктаж	\N
0be7b949-607b-43a5-9d9b-732733792e6c	Плановый ремонт централизованными службами	\N
0c668905-41b6-4427-9821-fa3dd69649f2	Отсутствие оператора в связи с необеспеченностью	\N
0d281977-2372-4244-9a6b-f32153635a24	Изменение режимов, смена инструмента, приспособления	\N
0e67c7e2-c1cc-4342-85a5-c410a415dec9	Аварийный ремонт централизованными службами	\N
2a1164b1-8d69-40ec-96f2-028aa2233623	Отсутствие крана, транспорта	\N
342e2c3d-e560-444c-93f8-34869af248c8	Работа по карте несоответствий	\N
4740e921-ad81-4a06-a9c6-2b4d6a124dcc	Обед	\N
48333403-f66f-4eb5-9cce-41c4be3b2761	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
5c2313ed-5f07-4da2-9e8f-fac190013b60	Отсутствие сотрудника ОТК	\N
6391f944-b9dd-4e89-b136-1d85916ce90a	Установка, выверка, снятие детали	\N
6650f4e5-9154-4c09-97ae-12870066f824	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
7202547d-11fa-4105-bf00-5540e9376b9e	Сборочные операции	\N
7b89ab8a-93c7-4925-9e73-048ab6ffb86e	Отсутствие конструктора, технолога или ожидание его решения	\N
8672ffb5-d9ee-408e-bd7f-56548c49119d	Нерабочее время по графику согласно сменности	\N
91eabfec-9c7e-412c-ad6a-272a1931b26a	Праздники и выходные	\N
9d84dd5f-a624-4c1d-b192-e1ef915bb83a	Отсутствие энергоносителей	\N
b8e1eb76-a0a1-46b7-9af5-389cb710ee82	Отсутствие заданий	\N
cf7ba87f-abec-40bf-b725-b293f433824c	Естественные надобности	\N
d1da046b-7c1b-48ca-8d51-e947a84d6741	Установка, выверка, снятие детали	\N
dba3f8d8-87f2-4f07-a965-71c70054761a	Отсутствие материала, заготовок, деталей	\N
dc918467-3c12-4331-a0ce-21c314622481	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
eadcc2b0-446d-44d0-8037-24c3e184bab6	Контроль на рабочем месте	\N
f323e72d-fcec-4479-b309-38ae71222a09	Неявка оператора (б/лист, отпуск, и пр.)	\N
f924ffee-5aba-4dfe-a282-c6e16d38bd20	Работа с управляющей программой	\N
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
13c603f7-5f34-430e-8b30-a1e6517dab55	95c2b10b-e75f-451f-8346-318de544e59b	251534
84fb2a77-e152-4f25-9507-44d8059d9578	0017ad9e-a02f-4a5c-b461-4e12c5b65b59	256467
e95460d0-e2fe-4148-8e5f-87ab279f12fd	837a4665-8e76-4ada-aa19-de9a125473de	249550
481c3748-fa8e-4fc1-ae4d-9794ab07b103	9251d3b4-02cb-4d7c-9652-eae91bd7c5b6	235565
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
0c8d08c2-ed0a-4551-bb1f-9d1b3eb8d73e	5b9324db-2ad8-4e37-bc64-9d24262c3c95	610422
181df4e8-b445-4068-b4ad-b86bd839494d	26d8cdfe-fe4c-47cf-b076-3e54fcf9fca6	614208
28438b9f-be9c-4ab2-8495-82c18f391d38	7428f777-ac30-4bf1-91e4-7562237f8e48	614962
2861a815-92c8-4d4f-8815-b9b4c89b20ab	9ebfdf51-622a-4011-ab67-fd088b0c03da	643759
371660b9-bbf0-4ed5-b46a-57e34e173e00	53a94964-8831-4363-8b2b-bbe174beb9e4	617215
5017fade-d95f-4afc-b681-bb1c9f2d3a65	d4e8ed89-9386-445e-ac20-0a20795e001c	613668
6ba1715a-15d7-4e1f-b32e-eb9a379b219c	464296f2-f8ce-495c-a034-e4fface38253	612000
8ef45191-a966-4cde-ae4a-25a983212032	9e922b41-abcc-4868-87a9-1f0e24f45bf7	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
1254fffd-b2e8-4ff4-bdc4-a51e0feb63b4	1	Пост 1	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N
cce0f492-87b2-4c06-935f-e6bb2f323f68	2	Пост 2	89fed334-4c87-4289-ae35-720c51d168e7	\N
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
08b8f648-572f-4dbd-b6df-734424a67c40	150b4701-2f5a-420a-b090-a88cfb730546
beea5ae6-2881-4bc6-bfac-f88fce8cd2c5	3b20ff54-3237-48fa-9859-71678f268080
fe673b08-08ac-4c79-92e8-d6c06871a1be	3bd1acb9-9e86-4c53-ba5a-e9c9c8d1e5ab
150b4701-2f5a-420a-b090-a88cfb730546	41dc920a-14d3-4578-89ae-426bc945606f
c71747f3-c974-4e4a-96b8-75aeace18044	6167bb08-0584-4f2e-947a-7a14c40cb714
08b8f648-572f-4dbd-b6df-734424a67c40	617edfe8-28af-43b9-999a-daefccb61bc2
617edfe8-28af-43b9-999a-daefccb61bc2	74eb3a84-d6b2-49ce-80a3-b2f88bb618e4
d4e37aed-b25c-4a97-9755-13372e868ac9	7ca0b6e5-7e4b-4f30-901b-463834b7e4a6
fe673b08-08ac-4c79-92e8-d6c06871a1be	7db6b54d-3a5a-4f04-8791-40d3ca5d6af7
c71747f3-c974-4e4a-96b8-75aeace18044	8b065351-9bf0-496c-b8b6-132b5a6bdc38
58339169-a751-4cdb-8f37-eb9f253d6d8f	a2bd04c9-868f-4a99-94a4-6c294946d0ad
3cf679f9-e5c9-4ff7-be4b-bb814df400d7	ba23e98a-3041-448a-8713-72b731794363
58339169-a751-4cdb-8f37-eb9f253d6d8f	bb029f9f-15e1-4163-bbad-e6614865bcbb
58339169-a751-4cdb-8f37-eb9f253d6d8f	beea5ae6-2881-4bc6-bfac-f88fce8cd2c5
150b4701-2f5a-420a-b090-a88cfb730546	c2598e2e-1cac-4ab4-8b16-99fce67eb1ea
d4e37aed-b25c-4a97-9755-13372e868ac9	c284954f-fe13-439f-81fd-f3bf5f20ff96
3cf679f9-e5c9-4ff7-be4b-bb814df400d7	c71747f3-c974-4e4a-96b8-75aeace18044
08b8f648-572f-4dbd-b6df-734424a67c40	d3e5e077-9e38-44ef-b35c-0d170b4cdfaa
3cf679f9-e5c9-4ff7-be4b-bb814df400d7	d4e37aed-b25c-4a97-9755-13372e868ac9
beea5ae6-2881-4bc6-bfac-f88fce8cd2c5	d853f9b0-50aa-4987-860d-7149849946df
3cf679f9-e5c9-4ff7-be4b-bb814df400d7	e0975f50-b40c-4c54-ba6d-38b9bcbb8e5d
617edfe8-28af-43b9-999a-daefccb61bc2	fb59f318-ddf7-4f49-8603-766a9856f73e
08b8f648-572f-4dbd-b6df-734424a67c40	fe4a5559-1c5f-4e38-9b2b-99be3a1ce944
58339169-a751-4cdb-8f37-eb9f253d6d8f	fe673b08-08ac-4c79-92e8-d6c06871a1be
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
0d6e0695-76d3-4a09-b57d-8eade5a27971	Сборка, сварка мостов	1	e0867318-7ffd-4bc0-8f2a-bf36f6f43613	01
6bdf41aa-bec9-4e4a-8b23-4bedcf158531	Сборка, сварка рам к/с г/п 120-130 т.	6	e0867318-7ffd-4bc0-8f2a-bf36f6f43613	06
89fed334-4c87-4289-ae35-720c51d168e7	Сборка, сварка узл. и рам к/с г/п 120-220т	4	e0867318-7ffd-4bc0-8f2a-bf36f6f43613	04
d8810cbd-e78c-4985-9937-dd84bd091427	Производственный участок 5	5	4ed5c3af-1d3e-4eb4-8bdf-e5dcf1e8ed98	05
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
08b8f648-572f-4dbd-b6df-734424a67c40	Картер заднего моста	75132-2401006-50	t	1	7da14540-9cfe-4621-a14c-13acb4ad9514	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536467567
150b4701-2f5a-420a-b090-a88cfb730546	Кронштейн	7521-2401220	t	2	8acbba7b-79c5-452f-8386-c825e5d741f3	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536273956
3b20ff54-3237-48fa-9859-71678f268080	Труба картера	75580-2401132-10	t	3	440d71ad-d389-4c4c-a906-9e9a03a24afd	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536386250
3bd1acb9-9e86-4c53-ba5a-e9c9c8d1e5ab	Кольцо	75580-2401227	t	3	ca8b5d4e-db62-4df6-ac7b-d7834425c6cb	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536384312
3cf679f9-e5c9-4ff7-be4b-bb814df400d7	Рама	75313-2800010-20	t	1	2235581a-a2f1-4694-b35a-9734a2beb5bf	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536287819
41dc920a-14d3-4578-89ae-426bc945606f	Распорка	7521-3932688	t	3	56683a4f-1fb7-4962-b5f8-3f818983cf5b	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536273606
58339169-a751-4cdb-8f37-eb9f253d6d8f	Картер заднего моста	75580-2401006	t	1	f8669904-6f42-4b1a-af66-9d344cf6fb0e	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536384294
6167bb08-0584-4f2e-947a-7a14c40cb714	Кронштейн	75310-1183102	t	3	fa36090f-b3f3-4ed0-9fde-7de1f6548a00	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536267484
617edfe8-28af-43b9-999a-daefccb61bc2	Картер заднего моста	75132-2401008-50	t	2	61259cab-16b1-4ec8-ac5b-787553653b1c	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536467565
7ca0b6e5-7e4b-4f30-901b-463834b7e4a6	Кронштейн	75304-1001253	t	3	565e3d54-0f94-42a3-9684-f9e75e04b95e	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536248708
7db6b54d-3a5a-4f04-8791-40d3ca5d6af7	Втулка	75303-2128438	t	3	1eac89e7-7867-4d16-afd6-104a7dd25727	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536248270
8b065351-9bf0-496c-b8b6-132b5a6bdc38	Кронштейн	75310-1183106	t	3	dc0c018a-6020-483c-95c3-8a7e6c4736ec	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536267485
a2bd04c9-868f-4a99-94a4-6c294946d0ad	Кронштейн	75580-2113192	t	3	e62da27b-fd4d-4a17-ab1a-018da10ad26b	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536384314
ba23e98a-3041-448a-8713-72b731794363	Кронштейн	75211-1018162	t	3	d9fee916-5b3a-4030-a759-07383ed3beb9	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536270344
beea5ae6-2881-4bc6-bfac-f88fce8cd2c5	Труба картера заднего моста	75580-2401010-01	t	2	63d98104-4e71-4745-abef-6007a0d62b27	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536386240
c2598e2e-1cac-4ab4-8b16-99fce67eb1ea	Проушина	7521-2401224	t	3	86004248-92bf-4bde-9d37-8ab61290d291	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536274170
c284954f-fe13-439f-81fd-f3bf5f20ff96	Кронштейн	75303-1001293	t	3	46a56843-7f0b-4a16-9a89-505e242cad70	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536247228
c71747f3-c974-4e4a-96b8-75aeace18044	Кронштейн	75310-1183100	t	2	fa7f1548-fd57-4d4b-97aa-c363a9767e9a	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536267493
d3e5e077-9e38-44ef-b35c-0d170b4cdfaa	Кронштейн	75131-2113296-10	t	3	7833d561-d597-4b40-abf4-d948301878fd	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536461620
d4e37aed-b25c-4a97-9755-13372e868ac9	Кронштейн амортизатора левый	75304-1001251	t	2	8868b4d3-5f49-42fa-b9a8-edc98acd792d	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536248707
d853f9b0-50aa-4987-860d-7149849946df	Фланец картера	75580-2401114-11	t	3	10eacec2-daa3-4384-ba41-d796438c0c74	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536386265
e0975f50-b40c-4c54-ba6d-38b9bcbb8e5d	Накладка	549Б-1015842	t	3	412be5ae-f7f7-468d-bfde-eabeb28059f8	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N	\N	4536196288
fb59f318-ddf7-4f49-8603-766a9856f73e	Пластина	75132-2401106	t	3	2ce26f3d-c5e4-47e9-b58a-b70d278d8ba0	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536444153
fe4a5559-1c5f-4e38-9b2b-99be3a1ce944	Панель	75132-2105522	t	3	6850a917-c800-471e-aed0-a78a9dbb2baf	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536417730
fe673b08-08ac-4c79-92e8-d6c06871a1be	Картер заднего моста	75580-2401008	t	2	e3247139-f809-4d58-9c2f-a15108dea1a1	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N	\N	4536384295
74eb3a84-d6b2-49ce-80a3-b2f88bb618e4	Опора	75211-2401122	t	3	23f9c4ff-1156-4953-99a9-8f99571f950a	0d6e0695-76d3-4a09-b57d-8eade5a27971	8ef45191-a966-4cde-ae4a-25a983212032	\N	\N	4536276803
bb029f9f-15e1-4163-bbad-e6614865bcbb	Панель	75580-2105522	t	3	42597caf-3ca3-4b7f-a87b-f2083f11728c	0d6e0695-76d3-4a09-b57d-8eade5a27971	8ef45191-a966-4cde-ae4a-25a983212032	\N	\N	4536384399
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
01bc58b0-dfe2-44a5-a823-f333ce58839b	Admin	\N
0b2a7306-59c8-49d3-bb05-6435d5efd16b	Master	\N
4e1621d7-9ddd-4c9d-b121-c5cf5141cd00	Welder	\N
6fc132ac-6606-4ee8-9b50-a2ec04714160	Inspector	\N
bef08035-40fd-46b5-b71f-3d13804ba972	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
7732faf0-64f2-4544-b6d1-96ea90f5522b	3	333	t	f	3cf679f9-e5c9-4ff7-be4b-bb814df400d7	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N
d874e105-f1be-4c4d-84a3-bca8a7eb02d5	2	222	t	f	08b8f648-572f-4dbd-b6df-734424a67c40	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N
e591b8b8-8d8e-4202-85cf-fafb8a07b63d	4	222	t	f	3cf679f9-e5c9-4ff7-be4b-bb814df400d7	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N
e6589b84-6e4b-4b6c-8e74-059e918b89b5	1	111	t	f	08b8f648-572f-4dbd-b6df-734424a67c40	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N	\N
bc91e38c-5352-4070-a10c-d0d12db3be76	2	200	t	f	bb029f9f-15e1-4163-bbad-e6614865bcbb	cec12d3c-f81c-4c04-a1f2-b3ddc32f1bd3	481c3748-fa8e-4fc1-ae4d-9794ab07b103	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N
ee4f1883-af07-4100-8a05-96f38c92f36a	1	100	t	f	74eb3a84-d6b2-49ce-80a3-b2f88bb618e4	36aacc91-7681-490e-9d1a-05f3c2cefa0e	481c3748-fa8e-4fc1-ae4d-9794ab07b103	89fed334-4c87-4289-ae35-720c51d168e7	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
36aacc91-7681-490e-9d1a-05f3c2cefa0e	1	ИТП	\N
cec12d3c-f81c-4c04-a1f2-b3ddc32f1bd3	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
10eacec2-daa3-4384-ba41-d796438c0c74	3338649	Технологический процесс	Ссылка	3338649
1eac89e7-7867-4d16-afd6-104a7dd25727	3011514	Технологический процесс	Ссылка	3011514
2235581a-a2f1-4694-b35a-9734a2beb5bf	3239598	Технологический процесс	Ссылка	3239598
23f9c4ff-1156-4953-99a9-8f99571f950a	3211246	Технологический процесс	Ссылка	3211246
2ce26f3d-c5e4-47e9-b58a-b70d278d8ba0	1003048	Технологический процесс	Ссылка	1003048
412be5ae-f7f7-468d-bfde-eabeb28059f8	1426226	Технологический процесс	Ссылка	1426226
42597caf-3ca3-4b7f-a87b-f2083f11728c	1405307	Технологический процесс	Ссылка	1405307
440d71ad-d389-4c4c-a906-9e9a03a24afd	2822569	Технологический процесс	Ссылка	2822569
46a56843-7f0b-4a16-9a89-505e242cad70	3049271	Технологический процесс	Ссылка	3049271
565e3d54-0f94-42a3-9684-f9e75e04b95e	1492964	Технологический процесс	Ссылка	1492964
56683a4f-1fb7-4962-b5f8-3f818983cf5b	908693	Технологический процесс	Ссылка	908693
61259cab-16b1-4ec8-ac5b-787553653b1c	3232836	Технологический процесс	Ссылка	3232836
63d98104-4e71-4745-abef-6007a0d62b27	2915477	Технологический процесс	Ссылка	2915477
6850a917-c800-471e-aed0-a78a9dbb2baf	1053809	Технологический процесс	Ссылка	1053809
7833d561-d597-4b40-abf4-d948301878fd	526870	Технологический процесс	Ссылка	526870
7da14540-9cfe-4621-a14c-13acb4ad9514	3090319	Технологический процесс	Ссылка	3090319
86004248-92bf-4bde-9d37-8ab61290d291	1124147	Технологический процесс	Ссылка	1124147
8868b4d3-5f49-42fa-b9a8-edc98acd792d	1334123	Технологический процесс	Ссылка	1334123
8acbba7b-79c5-452f-8386-c825e5d741f3	1362989	Технологический процесс	Ссылка	1362989
ca8b5d4e-db62-4df6-ac7b-d7834425c6cb	1402616	Технологический процесс	Ссылка	1402616
d9fee916-5b3a-4030-a759-07383ed3beb9	2841119	Технологический процесс	Ссылка	2841119
dc0c018a-6020-483c-95c3-8a7e6c4736ec	1119363	Технологический процесс	Ссылка	1119363
e3247139-f809-4d58-9c2f-a15108dea1a1	3232938	Технологический процесс	Ссылка	3232938
e62da27b-fd4d-4a17-ab1a-018da10ad26b	1405914	Технологический процесс	Ссылка	1405914
f8669904-6f42-4b1a-af66-9d344cf6fb0e	2433634	Технологический процесс	Ссылка	2433634
fa36090f-b3f3-4ed0-9fde-7de1f6548a00	1104641	Технологический процесс	Ссылка	1104641
fa7f1548-fd57-4d4b-97aa-c363a9767e9a	1823031	Технологический процесс	Ссылка	1823031
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
0017ad9e-a02f-4a5c-b461-4e12c5b65b59	6fc132ac-6606-4ee8-9b50-a2ec04714160
837a4665-8e76-4ada-aa19-de9a125473de	6fc132ac-6606-4ee8-9b50-a2ec04714160
95c2b10b-e75f-451f-8346-318de544e59b	6fc132ac-6606-4ee8-9b50-a2ec04714160
26d8cdfe-fe4c-47cf-b076-3e54fcf9fca6	0b2a7306-59c8-49d3-bb05-6435d5efd16b
464296f2-f8ce-495c-a034-e4fface38253	0b2a7306-59c8-49d3-bb05-6435d5efd16b
53a94964-8831-4363-8b2b-bbe174beb9e4	0b2a7306-59c8-49d3-bb05-6435d5efd16b
5b9324db-2ad8-4e37-bc64-9d24262c3c95	0b2a7306-59c8-49d3-bb05-6435d5efd16b
7428f777-ac30-4bf1-91e4-7562237f8e48	0b2a7306-59c8-49d3-bb05-6435d5efd16b
9ebfdf51-622a-4011-ab67-fd088b0c03da	0b2a7306-59c8-49d3-bb05-6435d5efd16b
d4e8ed89-9386-445e-ac20-0a20795e001c	0b2a7306-59c8-49d3-bb05-6435d5efd16b
0e203635-4fd3-4959-b197-b6e9f46830ec	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
22f424ec-d26e-4e07-bc1b-66f1a90bb919	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
36e87fa1-77b2-4d4f-907e-87d506135c65	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
3d58a977-e399-4097-b3f7-134dfba26c41	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
476019a5-a669-4210-b99b-91a53830045e	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
4bf77062-6909-4806-98b9-7536fa169ac3	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
5186144c-e201-4b3e-8c1a-7ea902465ffc	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
5277e516-135b-4f17-be48-b3fe547dd016	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
5ae44e2e-4934-46e5-a3d5-90e99ce38554	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
7349dd7c-b507-4e6c-ba37-520933f8e1db	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
76410963-63aa-4363-b5e5-11a2d2d94455	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
999c9e3a-b130-4c0e-ada4-7628f9d28725	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
a2fe3afb-69eb-4287-9c84-d9b0582014f5	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
a857486b-f760-4054-bfeb-1d901191da95	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
a862121c-0034-47a2-be0d-cc77dd002f0e	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
a8d58efb-c986-4f8a-96dd-bcc4453ab9b3	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
ce7825d3-e44e-4f04-82d4-4e5203350966	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
e0cf7fe6-e06a-4502-ab5b-f03e4dcace2e	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
ef8fc9e4-2a21-4033-9257-10f4e46e17b6	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
f93d218c-29b5-420d-a312-5c13d6f1b38f	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
f99af42a-c9d6-4908-b4a2-808fca976366	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
fcc26339-6391-45ec-b950-a4a0e3ee4785	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
fe0c6a0b-d831-4dc9-9a5d-c29e373590dc	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
c028f0bf-1750-4df0-abfe-62128df0a176	bef08035-40fd-46b5-b71f-3d13804ba972
9e922b41-abcc-4868-87a9-1f0e24f45bf7	0b2a7306-59c8-49d3-bb05-6435d5efd16b
672e437a-829e-4433-a4ef-c100b7a36ea4	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
9251d3b4-02cb-4d7c-9652-eae91bd7c5b6	6fc132ac-6606-4ee8-9b50-a2ec04714160
ba82ba95-c5fc-486b-ba38-0283736644ca	01bc58b0-dfe2-44a5-a823-f333ce58839b
40d9e7df-a4bf-4342-90df-5fe6bfd17cdd	4e1621d7-9ddd-4c9d-b121-c5cf5141cd00
7bddbd88-e9b3-4d98-bc18-2caf3b75ed25	6fc132ac-6606-4ee8-9b50-a2ec04714160
0e530882-35fd-4115-a0bf-a7ca33ea359c	bef08035-40fd-46b5-b71f-3d13804ba972
dd988db5-e51d-4afc-bb75-276f65d33079	0b2a7306-59c8-49d3-bb05-6435d5efd16b
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
0017ad9e-a02f-4a5c-b461-4e12c5b65b59	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	d8810cbd-e78c-4985-9937-dd84bd091427	\N
837a4665-8e76-4ada-aa19-de9a125473de	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
95c2b10b-e75f-451f-8346-318de544e59b	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	d8810cbd-e78c-4985-9937-dd84bd091427	\N
26d8cdfe-fe4c-47cf-b076-3e54fcf9fca6	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N
464296f2-f8ce-495c-a034-e4fface38253	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
53a94964-8831-4363-8b2b-bbe174beb9e4	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N
5b9324db-2ad8-4e37-bc64-9d24262c3c95	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
7428f777-ac30-4bf1-91e4-7562237f8e48	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
9ebfdf51-622a-4011-ab67-fd088b0c03da	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
d4e8ed89-9386-445e-ac20-0a20795e001c	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
0e203635-4fd3-4959-b197-b6e9f46830ec	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
22f424ec-d26e-4e07-bc1b-66f1a90bb919	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
36e87fa1-77b2-4d4f-907e-87d506135c65	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N
3d58a977-e399-4097-b3f7-134dfba26c41	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
476019a5-a669-4210-b99b-91a53830045e	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
4bf77062-6909-4806-98b9-7536fa169ac3	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
5186144c-e201-4b3e-8c1a-7ea902465ffc	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
5277e516-135b-4f17-be48-b3fe547dd016	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
5ae44e2e-4934-46e5-a3d5-90e99ce38554	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N
7349dd7c-b507-4e6c-ba37-520933f8e1db	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
76410963-63aa-4363-b5e5-11a2d2d94455	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
999c9e3a-b130-4c0e-ada4-7628f9d28725	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	\N
a2fe3afb-69eb-4287-9c84-d9b0582014f5	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
a857486b-f760-4054-bfeb-1d901191da95	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
a862121c-0034-47a2-be0d-cc77dd002f0e	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
a8d58efb-c986-4f8a-96dd-bcc4453ab9b3	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
ce7825d3-e44e-4f04-82d4-4e5203350966	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
e0cf7fe6-e06a-4502-ab5b-f03e4dcace2e	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
ef8fc9e4-2a21-4033-9257-10f4e46e17b6	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
f93d218c-29b5-420d-a312-5c13d6f1b38f	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
f99af42a-c9d6-4908-b4a2-808fca976366	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	22222	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	\N
fcc26339-6391-45ec-b950-a4a0e3ee4785	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
fe0c6a0b-d831-4dc9-9a5d-c29e373590dc	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
c028f0bf-1750-4df0-abfe-62128df0a176	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
9e922b41-abcc-4868-87a9-1f0e24f45bf7	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
672e437a-829e-4433-a4ef-c100b7a36ea4	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
9251d3b4-02cb-4d7c-9652-eae91bd7c5b6	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	89fed334-4c87-4289-ae35-720c51d168e7	\N
ba82ba95-c5fc-486b-ba38-0283736644ca	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$Ge26sxrtZ+G1R5OFoASxwlUR/iMxK/yjJ3NER1pk1SVE7Oay	\N	\N	\N	\N	\N	\N
40d9e7df-a4bf-4342-90df-5fe6bfd17cdd	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$Wo2NSpk7S2WfG7Tqj+L1UuP11EtmOUNwZIcR9ltQ+vYWNnJ4	\N	\N	\N	\N	\N	\N
7bddbd88-e9b3-4d98-bc18-2caf3b75ed25	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$xHmpb13mJh3uC210FjV8Ty8852KxaMHufRusdbwBK5D03Ny0	\N	\N	\N	\N	\N	\N
0e530882-35fd-4115-a0bf-a7ca33ea359c	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$GsxEfpLF6EAb1M5LC1VbsvjUAFk/v1BpNzEkZElhlUtiZBH7	\N	\N	\N	\N	\N	\N
dd988db5-e51d-4afc-bb75-276f65d33079	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$NwW4dng1eon1T4//swrJ+ry9L9GiV7NGKHLPsouRM5+tE0FQ	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
1b2894f3-ae22-48cf-b935-8b91f21fe5f0	2	Заполняющий	80	120	21	25	50	250	36aacc91-7681-490e-9d1a-05f3c2cefa0e	\N
51a20791-4a63-47aa-89a5-80eea92920d1	2	Заполняющий	80	120	21	25	50	250	cec12d3c-f81c-4c04-a1f2-b3ddc32f1bd3	\N
a93bbd6b-51c3-4a89-b58e-b178e4408d1c	1	Корневой	80	120	\N	\N	50	250	cec12d3c-f81c-4c04-a1f2-b3ddc32f1bd3	\N
f832dcf0-1590-4458-b09e-3f4b2d70cd29	1	Корневой	80	120	22	24	50	250	36aacc91-7681-490e-9d1a-05f3c2cefa0e	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
555be0f3-e1a4-4c64-b8f5-dafd545bd0b4	1	Корневой	0.11	0.68	\N	\N	\N	a3fc3051-1a0a-4288-9b2e-5d4d40b7dc00	0cfdee74-437d-4fdb-b80b-fca252df63dd	\N
5f390bab-3cc8-4b7a-9a7b-77c9cfa21a16	2	Заполняющий	0.22	0.44	\N	\N	\N	2466bf59-246d-46be-9b7e-ecff420a81f8	89a73fe2-f7d6-435d-b2fd-c39b8aebdb3b	\N
a69cb035-7ad1-4752-be88-6ff7515feb79	1	Корневой	0.11	0.68	\N	\N	\N	47b24432-d03c-445e-86b8-3ab9064a4104	89a73fe2-f7d6-435d-b2fd-c39b8aebdb3b	\N
c38762b8-ce64-4e1c-9c64-c7fbf2598836	2	Заполняющий	0.22	0.44	\N	\N	\N	c1760d0d-bf8a-4a2d-98e5-e2551b7d9dfc	0cfdee74-437d-4fdb-b80b-fca252df63dd	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0b757843-f0c9-438b-b7db-2bdf7c4d506b	5171d63a-5d0e-4450-9fb4-706a6ac546ed
0c3b849f-8666-4235-9208-2e2707a7fdcc	fd267f09-5f97-4201-b7b1-336d360f1757
152b4f88-42b4-4d36-ab05-c1ef4821f452	c4db5d87-9b0a-442d-b3f5-74575288c38c
2f6bc444-cf7b-4915-a7b3-7cfd4acc7be3	4d05a7c2-1511-4282-8adb-a1c338ea8ed2
36af3df6-49bd-4f68-b5e1-acfee800e993	08faf5ac-5410-481b-b20d-17bf0196064d
3ee71c11-88f6-4aaa-82cb-49f09d068404	08faf5ac-5410-481b-b20d-17bf0196064d
54a3b6b7-50c5-43a2-82d0-a1dd7baf51cc	c4db5d87-9b0a-442d-b3f5-74575288c38c
57e936ad-8ca2-4673-a390-a87372915bbd	55f95321-2fda-44bd-80a4-c9d18b45de6a
67807a47-c6c1-44d0-ba33-01d8c5436507	3a39a74d-f7d2-4472-91fb-7c625dc19f43
72ac66a3-c9f7-4f09-8d17-824fc7d97710	c4db5d87-9b0a-442d-b3f5-74575288c38c
7eb3dabe-aa87-418d-bdcd-e68872cf587a	3a39a74d-f7d2-4472-91fb-7c625dc19f43
8636356b-f1fb-45a7-905b-511dfd07f50c	45422e59-65b6-44e2-aa82-e38a013653ce
92a4df91-d0c2-4351-8c41-bc7218c1c65e	5171d63a-5d0e-4450-9fb4-706a6ac546ed
96141450-c07f-4563-b89b-86984789969c	c4db5d87-9b0a-442d-b3f5-74575288c38c
a3639e1b-cc81-4ca2-be9c-30b788b9d184	5171d63a-5d0e-4450-9fb4-706a6ac546ed
ad98d82a-7080-47c7-bb5e-1a953b5cb5b3	c4db5d87-9b0a-442d-b3f5-74575288c38c
af9f745e-e0d8-450b-a372-457038e31600	55f95321-2fda-44bd-80a4-c9d18b45de6a
b9de2dcf-616d-448d-bbe4-304779600b59	fd267f09-5f97-4201-b7b1-336d360f1757
c599ac70-9cc6-4fb2-b93b-1502ef997671	5171d63a-5d0e-4450-9fb4-706a6ac546ed
cc8cedb8-d815-47ca-9e17-7a7c8ba6c6a1	fd267f09-5f97-4201-b7b1-336d360f1757
d0514a6b-97e8-403a-8f55-8c545a58d5be	066e63a8-9cf1-459e-bce8-e295fe0007da
db5d5814-fd33-47e9-8871-775f9bbab148	066e63a8-9cf1-459e-bce8-e295fe0007da
f2d15c6e-f11e-4770-b690-f6c0e0363239	4d05a7c2-1511-4282-8adb-a1c338ea8ed2
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0b757843-f0c9-438b-b7db-2bdf7c4d506b	5186144c-e201-4b3e-8c1a-7ea902465ffc	\N	153274
0c3b849f-8666-4235-9208-2e2707a7fdcc	999c9e3a-b130-4c0e-ada4-7628f9d28725	\N	152444
152b4f88-42b4-4d36-ab05-c1ef4821f452	fcc26339-6391-45ec-b950-a4a0e3ee4785	\N	121538
2f6bc444-cf7b-4915-a7b3-7cfd4acc7be3	a2fe3afb-69eb-4287-9c84-d9b0582014f5	a8876441-8b3d-49ef-9b3b-497bb641ed57	145092
36af3df6-49bd-4f68-b5e1-acfee800e993	3d58a977-e399-4097-b3f7-134dfba26c41	93ff448a-9983-47b4-b7de-ff57d1a3039b	150882
3ee71c11-88f6-4aaa-82cb-49f09d068404	4bf77062-6909-4806-98b9-7536fa169ac3	e4241be2-f0a8-4d99-9c83-701e16a67aae	151299
54a3b6b7-50c5-43a2-82d0-a1dd7baf51cc	0e203635-4fd3-4959-b197-b6e9f46830ec	\N	156298
57e936ad-8ca2-4673-a390-a87372915bbd	5277e516-135b-4f17-be48-b3fe547dd016	fc3d8cb9-b295-4f06-bcca-6c0f69a3420b	146325
67807a47-c6c1-44d0-ba33-01d8c5436507	ef8fc9e4-2a21-4033-9257-10f4e46e17b6	\N	150402
72ac66a3-c9f7-4f09-8d17-824fc7d97710	ce7825d3-e44e-4f04-82d4-4e5203350966	\N	121537
7eb3dabe-aa87-418d-bdcd-e68872cf587a	f93d218c-29b5-420d-a312-5c13d6f1b38f	\N	149921
8636356b-f1fb-45a7-905b-511dfd07f50c	f99af42a-c9d6-4908-b4a2-808fca976366	a8876441-8b3d-49ef-9b3b-497bb641ed57	\N
92a4df91-d0c2-4351-8c41-bc7218c1c65e	a857486b-f760-4054-bfeb-1d901191da95	\N	155288
96141450-c07f-4563-b89b-86984789969c	e0cf7fe6-e06a-4502-ab5b-f03e4dcace2e	\N	152365
a3639e1b-cc81-4ca2-be9c-30b788b9d184	fe0c6a0b-d831-4dc9-9a5d-c29e373590dc	\N	151861
ad98d82a-7080-47c7-bb5e-1a953b5cb5b3	7349dd7c-b507-4e6c-ba37-520933f8e1db	\N	147329
af9f745e-e0d8-450b-a372-457038e31600	76410963-63aa-4363-b5e5-11a2d2d94455	7a05c5d5-d373-4921-ad2e-809df5169b0d	120756
b9de2dcf-616d-448d-bbe4-304779600b59	5ae44e2e-4934-46e5-a3d5-90e99ce38554	\N	156278
c599ac70-9cc6-4fb2-b93b-1502ef997671	22f424ec-d26e-4e07-bc1b-66f1a90bb919	\N	152441
cc8cedb8-d815-47ca-9e17-7a7c8ba6c6a1	36e87fa1-77b2-4d4f-907e-87d506135c65	\N	152207
d0514a6b-97e8-403a-8f55-8c545a58d5be	476019a5-a669-4210-b99b-91a53830045e	b20fd68c-f497-4677-a63e-db775ebb88a8	121267
db5d5814-fd33-47e9-8871-775f9bbab148	a862121c-0034-47a2-be0d-cc77dd002f0e	fc3d8cb9-b295-4f06-bcca-6c0f69a3420b	117390
f2d15c6e-f11e-4770-b690-f6c0e0363239	a8d58efb-c986-4f8a-96dd-bcc4453ab9b3	ca30d956-a4ef-4f40-9bb1-f87a520a6d73	132695
354f109a-344f-4e98-9bad-adf7d7d2231a	672e437a-829e-4433-a4ef-c100b7a36ea4	\N	\N
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
066e63a8-9cf1-459e-bce8-e295fe0007da	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
08faf5ac-5410-481b-b20d-17bf0196064d	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
3a39a74d-f7d2-4472-91fb-7c625dc19f43	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
45422e59-65b6-44e2-aa82-e38a013653ce	11111	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
4d05a7c2-1511-4282-8adb-a1c338ea8ed2	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
5171d63a-5d0e-4450-9fb4-706a6ac546ed	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
55f95321-2fda-44bd-80a4-c9d18b45de6a	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
c4db5d87-9b0a-442d-b3f5-74575288c38c	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
fd267f09-5f97-4201-b7b1-336d360f1757	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
b80addbc-3768-4b03-a2dc-cad42389d7fe	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
2466bf59-246d-46be-9b7e-ecff420a81f8	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	b80addbc-3768-4b03-a2dc-cad42389d7fe	\N
47b24432-d03c-445e-86b8-3ab9064a4104	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	b80addbc-3768-4b03-a2dc-cad42389d7fe	\N
a3fc3051-1a0a-4288-9b2e-5d4d40b7dc00	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	b80addbc-3768-4b03-a2dc-cad42389d7fe	\N
c1760d0d-bf8a-4a2d-98e5-e2551b7d9dfc	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	b80addbc-3768-4b03-a2dc-cad42389d7fe	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
0cfdee74-437d-4fdb-b80b-fca252df63dd	1	1	f	2023-02-19 02:00:34.438094	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	bc91e38c-5352-4070-a10c-d0d12db3be76	354f109a-344f-4e98-9bad-adf7d7d2231a	8ef45191-a966-4cde-ae4a-25a983212032	481c3748-fa8e-4fc1-ae4d-9794ab07b103	\N
89a73fe2-f7d6-435d-b2fd-c39b8aebdb3b	2	1	f	2023-02-19 02:00:34.435771	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	ee4f1883-af07-4100-8a05-96f38c92f36a	354f109a-344f-4e98-9bad-adf7d7d2231a	8ef45191-a966-4cde-ae4a-25a983212032	481c3748-fa8e-4fc1-ae4d-9794ab07b103	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
1c4f2ace-f0e1-4ceb-84f5-ee6a8b7eac8c	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	93ca3f28-12d2-43c8-ab27-7d2091334111	\N
896f6988-44f5-4308-b95a-19d6ffd48c7f	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	93ca3f28-12d2-43c8-ab27-7d2091334111	\N
e1ef979d-7d94-4ce0-acb4-af3b82191138	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	93ca3f28-12d2-43c8-ab27-7d2091334111	\N
7754a66a-9279-4f15-94a0-f3a048dfc8a3	1	12:10:00	13:10:00	13:20:00	13:50:00	6a20cc88-0d62-43d9-b777-e7bb1f1ba6b3	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0e8655d5-b52e-44ea-bd32-d213091d2111	2050	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	2050
3353c72c-86bd-478e-a8b5-ee08a8378015	1400	\N	89fed334-4c87-4289-ae35-720c51d168e7	1400
4f811c4f-498d-45b1-bf2c-32e419fe914b	1360	\N	89fed334-4c87-4289-ae35-720c51d168e7	1360
6bad72d1-c75f-44f1-b625-35d8210574e3	1390	\N	89fed334-4c87-4289-ae35-720c51d168e7	1390
6f009a21-d821-4041-9f92-bd41790f70ee	2150	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	2150
7a05c5d5-d373-4921-ad2e-809df5169b0d	3520	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3520
846ca5ca-9e0e-4c25-8af4-85546b084578	1280	\N	89fed334-4c87-4289-ae35-720c51d168e7	1280
905608d6-d96b-4703-9931-427ce7b6fffd	1270	\N	89fed334-4c87-4289-ae35-720c51d168e7	1270
93ff448a-9983-47b4-b7de-ff57d1a3039b	3690	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3690
a8876441-8b3d-49ef-9b3b-497bb641ed57	3590	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3590
a8b06f74-44dc-4086-aa59-db6935f30be1	1550	\N	89fed334-4c87-4289-ae35-720c51d168e7	1550
b20fd68c-f497-4677-a63e-db775ebb88a8	3600	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3600
bb85bcb1-97e1-4ba2-aa29-86da390a3994	2130	\N	0d6e0695-76d3-4a09-b57d-8eade5a27971	2130
c78b2df2-a41a-4754-bfe7-5363cb5dbd53	1380	\N	89fed334-4c87-4289-ae35-720c51d168e7	1380
ca30d956-a4ef-4f40-9bb1-f87a520a6d73	3500	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3500
cb6bcd3a-f1ac-4053-9320-174d3a7ed00c	1260	\N	89fed334-4c87-4289-ae35-720c51d168e7	1260
e4241be2-f0a8-4d99-9c83-701e16a67aae	3650	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3650
fc3d8cb9-b295-4f06-bcca-6c0f69a3420b	3610	\N	6bdf41aa-bec9-4e4a-8b23-4bedcf158531	3610
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
4ed5c3af-1d3e-4eb4-8bdf-e5dcf1e8ed98	Цех 480	480	480
e0867318-7ffd-4bc0-8f2a-bf36f6f43613	Цех 50	50	050
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
-- Name: WeldingRecords FK_WeldingRecords_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "FK_WeldingRecords_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


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

