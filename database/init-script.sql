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
a38eb65c-601a-404c-8730-018094c529b6	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
7cf4d39a-4b56-4c29-ac45-c65ec903cf77	25ffc20a-397b-45a1-96b1-1bc0c46a15d3	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
5d0a25ea-db80-4405-8b5b-5b9956036324	1	10	t	a38eb65c-601a-404c-8730-018094c529b6	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
060a1799-d76a-4d8f-b173-ebfecf87c286	Ознакомление с работой, документацией, инструктаж	\N
0dbb5cac-2faa-4d3e-8dff-98036a773825	Работа по карте несоответствий	\N
213adde2-ee3a-420e-8624-69a878271928	Контроль на рабочем месте	\N
28680dff-4d27-4fcd-84bf-937fb76d3b92	Установка, выверка, снятие детали	\N
30a73e53-a881-4da8-81f5-3af59a4dacd9	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
39d7b6bf-a311-45bc-92a3-de522b206221	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
40435103-e239-497b-89b2-0490aa624217	Неявка оператора (б/лист, отпуск, и пр.)	\N
442a980b-585c-4f5e-a150-631e0836279b	Отсутствие энергоносителей	\N
4b195dc7-3a89-46fd-b41e-25ea0f487f24	Установка, выверка, снятие детали	\N
4c49ad8e-6680-4da5-b820-36083c464474	Изменение режимов, смена инструмента, приспособления	\N
604257f2-0a7f-46fb-b937-3cff08d0e41b	Нерабочее время по графику согласно сменности	\N
666e965a-c414-4707-897d-e0c5c7611b3c	Плановый ремонт централизованными службами	\N
6e3753af-de3c-4151-9a05-4299c260f355	Отсутствие крана, транспорта	\N
73ecf751-0a4f-48ec-aa9c-6e51fc58db87	Отсутствие конструктора, технолога или ожидание его решения	\N
7627329c-3338-4ee4-8a1d-f70f8e0ce693	Аварийный ремонт централизованными службами	\N
8c676eca-8f12-4258-8e13-e86cff3bb829	Отсутствие сотрудника ОТК	\N
98d85f1e-1733-43f0-94b9-57a2337234e2	Отсутствие материала, заготовок, деталей	\N
a1477938-2b15-414c-937e-85013d64b438	Отсутствие оператора в связи с необеспеченностью	\N
cacd6a02-521c-41d9-94cb-5dbc878f79e3	Работа с управляющей программой	\N
d5ed5e8e-5268-462c-acda-0162d502e384	Естественные надобности	\N
d91bdce8-39f0-4eb4-b888-bc76095490ce	Праздники и выходные	\N
dbfe70ca-18c5-4f71-98f0-4b89ae9cc595	Отсутствие заданий	\N
ed18a65e-248b-4f22-9081-0ba92c6aed7e	Обед	\N
f3dbcf2b-c0b1-4827-ad0a-8f7990f48bb0	Сборочные операции	\N
fd5af969-f89f-4333-9357-02101938927f	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
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
252a74ef-e124-4e54-aaa1-6e34bc8b3449	731a0e95-8abb-46a6-a732-9aa8e512edc7	251534
87e4ab6c-14c4-4ecc-84c6-4a310cf1244e	7e49437d-c083-48c4-bd8c-fbe6280ec24b	235565
90c2350c-1a29-4808-b206-f24e96cc9d55	9184f78b-3772-41a5-b1be-50a2e322ee65	256467
55e93787-52fa-40e9-bc34-e3baa0103101	594f7b7d-df8d-4160-996a-8c34a08f702c	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
6a7d310e-46cf-4d3b-b82c-595f399e828a	26b87a46-4718-4e2a-ba41-1c00fdeb5360	\N	612000
804f1dfd-3eb9-4718-93a0-2a0867aa53cb	d59e7300-7b79-4edd-830f-c226b3165abc	\N	613668
9be190c8-48c8-411f-a913-0dea966e78d5	e3d7d4d4-6db2-4215-aaf3-09999ffbe25c	\N	617215
dc270d91-80c8-475b-9b30-9ac3d58e15ef	fb8a3dd1-7950-49a6-81c2-1acfe33e0a5a	\N	614208
f3ff691e-e077-45e3-9d0e-fd35f6956c85	322f9666-2c7b-4de2-a2f6-a0ab463735e1	\N	643759
584367f9-035e-4df8-8eeb-871efc7af471	bd79fe48-b0c9-422d-9816-c04f36ed71e0	\N	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
6be30c15-ba20-4729-a470-d5a05ee7a68b	2	Пост 2	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
ba5a1ad3-498b-4214-af53-80b6214d9477	1	Пост 1	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
13321f20-7bca-42c0-903d-dc70c7b76a8d	08dd33ce-b90d-4abd-b0ac-40b45dde3a50
b81fc72b-037f-46a1-93bf-dbb7d6444dd1	103fd128-a12f-43b2-a822-0a316bf5ec01
b6e3864d-5a26-48ee-bd7e-33b866459f5d	13321f20-7bca-42c0-903d-dc70c7b76a8d
5f463a05-e090-4957-9238-709db1b821ae	24570d37-45bd-4772-82c8-e66f0109ecf0
b81fc72b-037f-46a1-93bf-dbb7d6444dd1	29e88545-6cd3-4b15-8e62-d98c23f581f5
b6e3864d-5a26-48ee-bd7e-33b866459f5d	37c71c75-32ac-42d1-ba3a-096acd891812
b48105bb-faf8-4b4d-8509-45f4f9d9cf62	39b7aaef-8df9-40c3-a4f1-cd805e2f48e6
5f463a05-e090-4957-9238-709db1b821ae	458c9d65-e8a5-41c6-a2b5-c8c3495b43f9
458c9d65-e8a5-41c6-a2b5-c8c3495b43f9	4dcf4bb4-6895-4ed7-bfe3-846fa8f1d9f0
24570d37-45bd-4772-82c8-e66f0109ecf0	4f613376-b0d3-474f-80a9-91643016f0ec
afe44f10-ebb6-49c6-9e50-d9bbd1c14d50	5b3a1e24-51ad-4b58-b64e-1d213fa401b7
5f463a05-e090-4957-9238-709db1b821ae	6461d251-9fea-4e03-9778-954ae18f2664
b6e3864d-5a26-48ee-bd7e-33b866459f5d	6dffebae-7fa2-47af-8866-10ed8adea05d
458c9d65-e8a5-41c6-a2b5-c8c3495b43f9	866bdddc-3b70-4747-b5df-8ab93e900632
5f463a05-e090-4957-9238-709db1b821ae	94b01d1f-78e8-4939-9734-ccd662b4e07f
24570d37-45bd-4772-82c8-e66f0109ecf0	9a24f8bb-ae33-48d8-8079-c4f1398e480d
b6e3864d-5a26-48ee-bd7e-33b866459f5d	9c710d58-8ae2-4911-8847-53212440b801
afe44f10-ebb6-49c6-9e50-d9bbd1c14d50	b48105bb-faf8-4b4d-8509-45f4f9d9cf62
afe44f10-ebb6-49c6-9e50-d9bbd1c14d50	b81fc72b-037f-46a1-93bf-dbb7d6444dd1
b48105bb-faf8-4b4d-8509-45f4f9d9cf62	c6bc282a-1d2e-4557-b479-a5a071c1900a
13321f20-7bca-42c0-903d-dc70c7b76a8d	d71f4188-7c87-4c31-9e61-bf4a944e6a6c
afe44f10-ebb6-49c6-9e50-d9bbd1c14d50	d9bf309d-1aba-476f-bb79-624a3fdfc250
6dffebae-7fa2-47af-8866-10ed8adea05d	dc536473-3746-4fd3-94ac-ae0f199c49a2
6dffebae-7fa2-47af-8866-10ed8adea05d	ddff2e50-3107-4234-9029-4c9378cc9699
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
63c9a2b9-8967-4c7b-8df2-2857500328a2	Производственный участок 5	5	dd46043c-aa40-4811-b7ef-dc21e7feb490	05
78f819ff-ed6c-44be-b376-0078c5b85b8c	Сборка, сварка узл. и рам к/с г/п 120-220т	4	1020dda3-44c4-4667-88bc-0fb8ded2dcce	04
85c04905-64c9-4ea4-83c3-4187d9c0c557	Сборка, сварка мостов	1	1020dda3-44c4-4667-88bc-0fb8ded2dcce	01
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
08dd33ce-b90d-4abd-b0ac-40b45dde3a50	Проушина	7521-2401224	1	f	f	3	16367e0f-c74a-4bcb-ae1d-a5f75b6b7897	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536274170
103fd128-a12f-43b2-a822-0a316bf5ec01	Фланец картера	75580-2401114-11	1	f	f	3	cfa96be4-8a17-452f-8339-2c4bfa1d4fe9	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536386265
13321f20-7bca-42c0-903d-dc70c7b76a8d	Кронштейн	7521-2401220	1	f	f	2	6e4cf411-b940-4e4b-96a8-337c381ed280	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536273956
24570d37-45bd-4772-82c8-e66f0109ecf0	Кронштейн	75310-1183100	1	f	f	2	038f4cf6-89f0-4168-8907-bce99bcaef8f	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536267493
29e88545-6cd3-4b15-8e62-d98c23f581f5	Труба картера	75580-2401132-10	1	f	f	3	e04bdf13-98a6-4671-8a56-be462b0260f9	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536386250
37c71c75-32ac-42d1-ba3a-096acd891812	Кронштейн	75131-2113296-10	1	f	f	3	1631f980-d553-4bfc-be32-f6bfa7bee576	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536461620
39b7aaef-8df9-40c3-a4f1-cd805e2f48e6	Втулка	75303-2128438	1	f	f	3	3b35d158-2ea8-4058-96df-5912f930928d	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536248270
458c9d65-e8a5-41c6-a2b5-c8c3495b43f9	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	751d1909-1062-455d-9144-d9dd062a3d70	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536248707
4dcf4bb4-6895-4ed7-bfe3-846fa8f1d9f0	Кронштейн	75304-1001253	1	f	f	3	d30538a6-913c-41b5-98e3-e6d6c1a50d42	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536248708
4f613376-b0d3-474f-80a9-91643016f0ec	Кронштейн	75310-1183102	1	f	f	3	85f7ccfa-2c4f-42c3-84ec-f1c11ffdf8bb	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536267484
5b3a1e24-51ad-4b58-b64e-1d213fa401b7	Кронштейн	75580-2113192	1	f	f	3	27cb53c5-c2b3-4506-a5f4-92b9c84d8d51	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536384314
5f463a05-e090-4957-9238-709db1b821ae	Рама	75313-2800010-20	1	f	f	1	7d5eab4c-43bc-42de-b36c-529624a8de26	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536287819
6461d251-9fea-4e03-9778-954ae18f2664	Кронштейн	75211-1018162	1	f	f	3	978f4a02-0a03-491b-9a43-9ecf4d4e9e86	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536270344
6dffebae-7fa2-47af-8866-10ed8adea05d	Картер заднего моста	75132-2401008-50	1	f	f	2	b520e00a-ad5b-4e80-9fb3-a1951a5c8e8a	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536467565
866bdddc-3b70-4747-b5df-8ab93e900632	Кронштейн	75303-1001293	1	f	f	3	1fd9cacc-1970-45d9-adfc-83d22f9bc4d1	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536247228
94b01d1f-78e8-4939-9734-ccd662b4e07f	Накладка	549Б-1015842	1	f	f	3	f2fb13aa-b9ca-4951-8942-743f35790728	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536196288
9a24f8bb-ae33-48d8-8079-c4f1398e480d	Кронштейн	75310-1183106	1	f	f	3	fc413b73-f0a3-40c9-9add-bda4a853a454	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	\N	\N	4536267485
9c710d58-8ae2-4911-8847-53212440b801	Панель	75132-2105522	1	f	f	3	7567c693-2922-4988-bbd6-d08c6f19472e	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536417730
afe44f10-ebb6-49c6-9e50-d9bbd1c14d50	Картер заднего моста	75580-2401006	1	f	f	1	e6235a9f-47b3-4797-bc46-f1cdd4910d71	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536384294
b48105bb-faf8-4b4d-8509-45f4f9d9cf62	Картер заднего моста	75580-2401008	1	f	f	2	2b6c5a25-e890-45f5-a6ac-b7106e50f6b0	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536384295
b6e3864d-5a26-48ee-bd7e-33b866459f5d	Картер заднего моста	75132-2401006-50	1	f	f	1	0b2f3006-e78b-4697-b48e-9aa3c61b46a0	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536467567
b81fc72b-037f-46a1-93bf-dbb7d6444dd1	Труба картера заднего моста	75580-2401010-01	1	f	f	2	8c8cfd3d-8658-4842-ae89-07a70a983c3d	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536386240
c6bc282a-1d2e-4557-b479-a5a071c1900a	Кольцо	75580-2401227	1	f	f	3	2063f887-7da4-4323-a5a6-c35924149681	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536384312
d71f4188-7c87-4c31-9e61-bf4a944e6a6c	Распорка	7521-3932688	1	f	f	3	d975bb8f-22a4-480e-b199-7eca6f38f980	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536273606
ddff2e50-3107-4234-9029-4c9378cc9699	Пластина	75132-2401106	1	f	f	3	c769fdc2-645e-4b9b-87c6-a772d8e4c5a6	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N	4536444153
d9bf309d-1aba-476f-bb79-624a3fdfc250	Панель	75580-2105522	1	f	f	3	bf8b596e-53e5-47aa-a2f5-b287067780fd	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	584367f9-035e-4df8-8eeb-871efc7af471	\N	4536384399
dc536473-3746-4fd3-94ac-ae0f199c49a2	Опора	75211-2401122	1	f	f	3	53c02672-4e0d-4ed3-bf2b-be3f96489dfb	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	584367f9-035e-4df8-8eeb-871efc7af471	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
54b97b73-4639-4e2b-954f-766bd39407ea	Admin	\N
307c3aa2-59cc-4220-bca9-f3258f3e7f72	Master	\N
1a2d935f-0ca2-4cec-b9ef-530f6927d6a2	Welder	\N
b3551136-db0f-4b7c-9a99-e0d9337191e9	Inspector	\N
7b14c099-511c-4964-98bf-58edcd96745d	Chief	\N
\.


--
-- Data for Name: SeamWelder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamWelder" ("SeamsId", "WeldersId") FROM stdin;
cb65e696-3a06-4e20-8f66-98ffb09b94ba	49c4e1f9-2d36-4a9d-a05e-2083c1b1e8bd
d620138f-3df3-4f7a-be86-82230c58325c	49c4e1f9-2d36-4a9d-a05e-2083c1b1e8bd
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "Status", "IsControlSubject", "IsAddManually", "ProductId", "TechnologicalInstructionId", "ProductionAreaId", "WorkplaceId", "InspectorId", "IdFromSystem") FROM stdin;
020f00ec-e531-43d5-a29d-11ed1153e7c5	3	333	1	t	f	5f463a05-e090-4957-9238-709db1b821ae	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N
7c347e91-b723-4df6-b6ac-1f2ff28a8992	2	222	1	t	f	b6e3864d-5a26-48ee-bd7e-33b866459f5d	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N
8f2694fd-4ee7-48ec-8f9d-719e68b11298	4	222	1	t	f	5f463a05-e090-4957-9238-709db1b821ae	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N
e9891afa-85b5-44e1-b7de-9542cdfd776e	1	111	1	t	f	b6e3864d-5a26-48ee-bd7e-33b866459f5d	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N	\N	\N
cb65e696-3a06-4e20-8f66-98ffb09b94ba	2	100	3	t	f	dc536473-3746-4fd3-94ac-ae0f199c49a2	ece0ca25-25e8-453a-974e-3d3dcb929a4d	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	55e93787-52fa-40e9-bc34-e3baa0103101	\N
d620138f-3df3-4f7a-be86-82230c58325c	2	200	3	t	f	d9bf309d-1aba-476f-bb79-624a3fdfc250	3d7b4b50-f6e1-4d7b-b768-81a37c9f0007	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N	55e93787-52fa-40e9-bc34-e3baa0103101	\N
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
3d7b4b50-f6e1-4d7b-b768-81a37c9f0007	1	ИТП	\N
ece0ca25-25e8-453a-974e-3d3dcb929a4d	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
038f4cf6-89f0-4168-8907-bce99bcaef8f	1823031	Технологический процесс	Ссылка	1823031
0b2f3006-e78b-4697-b48e-9aa3c61b46a0	3090319	Технологический процесс	Ссылка	3090319
1631f980-d553-4bfc-be32-f6bfa7bee576	526870	Технологический процесс	Ссылка	526870
16367e0f-c74a-4bcb-ae1d-a5f75b6b7897	1124147	Технологический процесс	Ссылка	1124147
1fd9cacc-1970-45d9-adfc-83d22f9bc4d1	3049271	Технологический процесс	Ссылка	3049271
2063f887-7da4-4323-a5a6-c35924149681	1402616	Технологический процесс	Ссылка	1402616
27cb53c5-c2b3-4506-a5f4-92b9c84d8d51	1405914	Технологический процесс	Ссылка	1405914
2b6c5a25-e890-45f5-a6ac-b7106e50f6b0	3232938	Технологический процесс	Ссылка	3232938
3b35d158-2ea8-4058-96df-5912f930928d	3011514	Технологический процесс	Ссылка	3011514
53c02672-4e0d-4ed3-bf2b-be3f96489dfb	3211246	Технологический процесс	Ссылка	3211246
6e4cf411-b940-4e4b-96a8-337c381ed280	1362989	Технологический процесс	Ссылка	1362989
751d1909-1062-455d-9144-d9dd062a3d70	1334123	Технологический процесс	Ссылка	1334123
7567c693-2922-4988-bbd6-d08c6f19472e	1053809	Технологический процесс	Ссылка	1053809
7d5eab4c-43bc-42de-b36c-529624a8de26	3239598	Технологический процесс	Ссылка	3239598
85f7ccfa-2c4f-42c3-84ec-f1c11ffdf8bb	1104641	Технологический процесс	Ссылка	1104641
8c8cfd3d-8658-4842-ae89-07a70a983c3d	2915477	Технологический процесс	Ссылка	2915477
978f4a02-0a03-491b-9a43-9ecf4d4e9e86	2841119	Технологический процесс	Ссылка	2841119
b520e00a-ad5b-4e80-9fb3-a1951a5c8e8a	3232836	Технологический процесс	Ссылка	3232836
bf8b596e-53e5-47aa-a2f5-b287067780fd	1405307	Технологический процесс	Ссылка	1405307
c769fdc2-645e-4b9b-87c6-a772d8e4c5a6	1003048	Технологический процесс	Ссылка	1003048
cfa96be4-8a17-452f-8339-2c4bfa1d4fe9	3338649	Технологический процесс	Ссылка	3338649
d30538a6-913c-41b5-98e3-e6d6c1a50d42	1492964	Технологический процесс	Ссылка	1492964
d975bb8f-22a4-480e-b199-7eca6f38f980	908693	Технологический процесс	Ссылка	908693
e04bdf13-98a6-4671-8a56-be462b0260f9	2822569	Технологический процесс	Ссылка	2822569
e6235a9f-47b3-4797-bc46-f1cdd4910d71	2433634	Технологический процесс	Ссылка	2433634
f2fb13aa-b9ca-4951-8942-743f35790728	1426226	Технологический процесс	Ссылка	1426226
fc413b73-f0a3-40c9-9add-bda4a853a454	1119363	Технологический процесс	Ссылка	1119363
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
731a0e95-8abb-46a6-a732-9aa8e512edc7	b3551136-db0f-4b7c-9a99-e0d9337191e9
7e49437d-c083-48c4-bd8c-fbe6280ec24b	b3551136-db0f-4b7c-9a99-e0d9337191e9
9184f78b-3772-41a5-b1be-50a2e322ee65	b3551136-db0f-4b7c-9a99-e0d9337191e9
26b87a46-4718-4e2a-ba41-1c00fdeb5360	307c3aa2-59cc-4220-bca9-f3258f3e7f72
322f9666-2c7b-4de2-a2f6-a0ab463735e1	307c3aa2-59cc-4220-bca9-f3258f3e7f72
d59e7300-7b79-4edd-830f-c226b3165abc	307c3aa2-59cc-4220-bca9-f3258f3e7f72
e3d7d4d4-6db2-4215-aaf3-09999ffbe25c	307c3aa2-59cc-4220-bca9-f3258f3e7f72
fb8a3dd1-7950-49a6-81c2-1acfe33e0a5a	307c3aa2-59cc-4220-bca9-f3258f3e7f72
03e7171c-93eb-441b-931c-0e75715aec7c	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
0e19b186-0a52-4c49-a134-5e65cea583f4	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
367d5c46-e553-4a72-b3d7-bc12005a4356	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
50a9f057-2783-445a-9fdd-1f3bb80d66d2	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
6569497a-ecdf-4aaa-8f4a-50954e20d055	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
7e381de5-658b-40ac-93ae-199b796e93b9	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
81cc59a9-2c8f-4323-bf20-d1c4d6978745	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
864bd273-cb68-4c6a-9ff7-6ff9dc1ddbec	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
ac4a38eb-ef11-4fe7-88e0-5dd2e6ac68dc	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
b77cc4af-f503-4863-b466-33945f7d6403	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
ca187ce4-6344-4ad4-9834-3496951cccc5	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
d2d88ef5-43d2-47ed-b167-3f6678202c5e	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
d5da1a57-ead2-4f8e-ad46-68be41495188	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
efb595eb-cc92-41da-a477-fad889e361b4	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
25ffc20a-397b-45a1-96b1-1bc0c46a15d3	7b14c099-511c-4964-98bf-58edcd96745d
bd79fe48-b0c9-422d-9816-c04f36ed71e0	307c3aa2-59cc-4220-bca9-f3258f3e7f72
4760a24d-3c5f-486c-b6dc-40c3822f5651	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
594f7b7d-df8d-4160-996a-8c34a08f702c	b3551136-db0f-4b7c-9a99-e0d9337191e9
91cda1a2-4902-4102-ac8b-d0dca4d5e4c5	54b97b73-4639-4e2b-954f-766bd39407ea
d0590170-95f8-41ef-a048-f985dc6c59c0	1a2d935f-0ca2-4cec-b9ef-530f6927d6a2
0d7fbabb-5521-4ac0-9f85-fe6855eddb00	b3551136-db0f-4b7c-9a99-e0d9337191e9
ab01c72e-50f1-4b39-b198-7506331b5344	7b14c099-511c-4964-98bf-58edcd96745d
87967e61-adcb-4694-8e43-3ce965a5abce	307c3aa2-59cc-4220-bca9-f3258f3e7f72
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
731a0e95-8abb-46a6-a732-9aa8e512edc7	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	63c9a2b9-8967-4c7b-8df2-2857500328a2	\N
7e49437d-c083-48c4-bd8c-fbe6280ec24b	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	\N	\N	63c9a2b9-8967-4c7b-8df2-2857500328a2	\N
9184f78b-3772-41a5-b1be-50a2e322ee65	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	63c9a2b9-8967-4c7b-8df2-2857500328a2	\N
26b87a46-4718-4e2a-ba41-1c00fdeb5360	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
322f9666-2c7b-4de2-a2f6-a0ab463735e1	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
d59e7300-7b79-4edd-830f-c226b3165abc	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
e3d7d4d4-6db2-4215-aaf3-09999ffbe25c	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N
fb8a3dd1-7950-49a6-81c2-1acfe33e0a5a	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N
03e7171c-93eb-441b-931c-0e75715aec7c	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
0e19b186-0a52-4c49-a134-5e65cea583f4	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N
367d5c46-e553-4a72-b3d7-bc12005a4356	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
50a9f057-2783-445a-9fdd-1f3bb80d66d2	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N
6569497a-ecdf-4aaa-8f4a-50954e20d055	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
7e381de5-658b-40ac-93ae-199b796e93b9	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
81cc59a9-2c8f-4323-bf20-d1c4d6978745	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	\N
864bd273-cb68-4c6a-9ff7-6ff9dc1ddbec	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
ac4a38eb-ef11-4fe7-88e0-5dd2e6ac68dc	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
b77cc4af-f503-4863-b466-33945f7d6403	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
ca187ce4-6344-4ad4-9834-3496951cccc5	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
d2d88ef5-43d2-47ed-b167-3f6678202c5e	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
d5da1a57-ead2-4f8e-ad46-68be41495188	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
efb595eb-cc92-41da-a477-fad889e361b4	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
25ffc20a-397b-45a1-96b1-1bc0c46a15d3	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	63c9a2b9-8967-4c7b-8df2-2857500328a2	\N
bd79fe48-b0c9-422d-9816-c04f36ed71e0	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
4760a24d-3c5f-486c-b6dc-40c3822f5651	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
594f7b7d-df8d-4160-996a-8c34a08f702c	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	\N
91cda1a2-4902-4102-ac8b-d0dca4d5e4c5	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$p4KzbhSlBHaD2yp2aOf6oWQicOcheH9a7FucdWKrS1Vlpyvp	\N	\N	\N	\N	\N	\N
d0590170-95f8-41ef-a048-f985dc6c59c0	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$eOm55qKEbDxxG9KLUcPGn9hoDf1S9cd2VtvniYxzfjVuWqw8	\N	\N	\N	\N	\N	\N
0d7fbabb-5521-4ac0-9f85-fe6855eddb00	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$Njdy+FFZoMF8n2W67N7PiC52nOXSVTfyIzJUJXmUGpmZo82w	\N	\N	\N	\N	\N	\N
ab01c72e-50f1-4b39-b198-7506331b5344	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$N5RN768k/NZ1BvBbXLK8WQKvUmSZN3fXCsqYm1+sgCNT86PQ	\N	\N	\N	\N	\N	\N
87967e61-adcb-4694-8e43-3ce965a5abce	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$7mzenvItrQsJETTYOO4g+ueOHZAGAiPoXi4sfC1+SccAJ3J4	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
62df9d71-7528-49d1-80ec-ffd79b070fc4	1	Корневой	80	120	\N	\N	50	250	3d7b4b50-f6e1-4d7b-b768-81a37c9f0007	\N
8dc34eea-5acb-480c-876e-633812fe125f	1	Корневой	80	120	22	24	50	250	ece0ca25-25e8-453a-974e-3d3dcb929a4d	\N
a92ea6d5-5bc4-4e13-a7e4-520e3929d90c	2	Заполняющий	80	120	21	25	50	250	ece0ca25-25e8-453a-974e-3d3dcb929a4d	\N
d2b9eced-2d6a-486c-ad37-658bddd6e035	2	Заполняющий	80	120	21	25	50	250	3d7b4b50-f6e1-4d7b-b768-81a37c9f0007	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IsDone", "SeamId", "IdFromSystem") FROM stdin;
2757ee6b-87bc-4b74-a868-4569344fcd47	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	cb65e696-3a06-4e20-8f66-98ffb09b94ba	\N
27f6c163-e2df-4807-a06f-882f7865b7ae	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	d620138f-3df3-4f7a-be86-82230c58325c	\N
2dbe3514-afb9-47fe-b836-2a6da5a2dd19	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	d620138f-3df3-4f7a-be86-82230c58325c	\N
8db5a0c2-5c37-4b33-93ec-f5d68a8df0e4	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	cb65e696-3a06-4e20-8f66-98ffb09b94ba	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
096d3cbf-52a4-4854-a675-2a669adf09fc	0dc971a0-22bc-4fb7-a9f7-ddaadcfbe754
172ac419-ed45-497f-b759-f894b1ccb1c9	0dc971a0-22bc-4fb7-a9f7-ddaadcfbe754
211f93ec-d941-42b7-b036-2317eea982b0	3cc839c5-33d4-4907-bc69-084f532f2fb3
2346d9a0-7186-40c2-8a61-931c897526e8	3cc839c5-33d4-4907-bc69-084f532f2fb3
2e0c8fe8-c737-48c4-9225-8b2a3868059e	0dc971a0-22bc-4fb7-a9f7-ddaadcfbe754
8cf1753c-9472-4ec8-b2b9-8fed93ebd742	827b4270-94d8-4b0b-b585-0f6d36a60cb0
904dc752-d634-4d8a-b290-2ced277259dd	827b4270-94d8-4b0b-b585-0f6d36a60cb0
9caa7b7d-f884-406e-a04f-eefc060bc0f4	06395761-34f3-4d45-b3df-7ba96c92bb19
a3fcb78f-9030-49aa-a27e-1c2f31d3b398	3cc839c5-33d4-4907-bc69-084f532f2fb3
b505f18e-5ea6-4929-927d-ccf5fc9c5012	3cc839c5-33d4-4907-bc69-084f532f2fb3
beae4fa1-375e-47b6-aff1-ea3cd514fa27	06395761-34f3-4d45-b3df-7ba96c92bb19
c3a2fe38-91c8-4134-8e6d-a531b7aee138	827b4270-94d8-4b0b-b585-0f6d36a60cb0
c4315026-55a9-4c56-80dd-e5e5cfd19b67	0dc971a0-22bc-4fb7-a9f7-ddaadcfbe754
c5de7723-3063-45e6-8f3a-07446d8cf9c5	3cc839c5-33d4-4907-bc69-084f532f2fb3
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
096d3cbf-52a4-4854-a675-2a669adf09fc	d2d88ef5-43d2-47ed-b167-3f6678202c5e	\N	155288
172ac419-ed45-497f-b759-f894b1ccb1c9	ca187ce4-6344-4ad4-9834-3496951cccc5	\N	151861
211f93ec-d941-42b7-b036-2317eea982b0	d5da1a57-ead2-4f8e-ad46-68be41495188	\N	121537
2346d9a0-7186-40c2-8a61-931c897526e8	b77cc4af-f503-4863-b466-33945f7d6403	\N	121538
2e0c8fe8-c737-48c4-9225-8b2a3868059e	efb595eb-cc92-41da-a477-fad889e361b4	\N	152441
8cf1753c-9472-4ec8-b2b9-8fed93ebd742	0e19b186-0a52-4c49-a134-5e65cea583f4	\N	152207
904dc752-d634-4d8a-b290-2ced277259dd	50a9f057-2783-445a-9fdd-1f3bb80d66d2	\N	156278
9caa7b7d-f884-406e-a04f-eefc060bc0f4	6569497a-ecdf-4aaa-8f4a-50954e20d055	\N	149921
a3fcb78f-9030-49aa-a27e-1c2f31d3b398	ac4a38eb-ef11-4fe7-88e0-5dd2e6ac68dc	\N	152365
b505f18e-5ea6-4929-927d-ccf5fc9c5012	7e381de5-658b-40ac-93ae-199b796e93b9	\N	156298
beae4fa1-375e-47b6-aff1-ea3cd514fa27	864bd273-cb68-4c6a-9ff7-6ff9dc1ddbec	\N	150402
c3a2fe38-91c8-4134-8e6d-a531b7aee138	81cc59a9-2c8f-4323-bf20-d1c4d6978745	\N	152444
c4315026-55a9-4c56-80dd-e5e5cfd19b67	367d5c46-e553-4a72-b3d7-bc12005a4356	\N	153274
c5de7723-3063-45e6-8f3a-07446d8cf9c5	03e7171c-93eb-441b-931c-0e75715aec7c	\N	147329
49c4e1f9-2d36-4a9d-a05e-2083c1b1e8bd	4760a24d-3c5f-486c-b6dc-40c3822f5651	\N	\N
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
06395761-34f3-4d45-b3df-7ba96c92bb19	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
0dc971a0-22bc-4fb7-a9f7-ddaadcfbe754	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
3cc839c5-33d4-4907-bc69-084f532f2fb3	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
827b4270-94d8-4b0b-b585-0f6d36a60cb0	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
103ca2a2-80ae-40e8-a25f-4c2e55b586d3	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
737979b6-a0e7-41b0-9e89-6c88cb4757ba	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WhenTaskIsDoneDate", "WeldingDate", "WeldingPlanDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "WelderId", "IdFromSystem") FROM stdin;
24ed11ea-8ff4-489c-bfee-64cb54095c07	1	\N	2023-02-09 22:43:07.603585	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	cb65e696-3a06-4e20-8f66-98ffb09b94ba	737979b6-a0e7-41b0-9e89-6c88cb4757ba	\N	\N
2e98c9b5-0290-4490-ac4b-8ca671abfecb	2	\N	2023-02-09 22:43:07.606294	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	d620138f-3df3-4f7a-be86-82230c58325c	103ca2a2-80ae-40e8-a25f-4c2e55b586d3	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
6d181db2-1345-44cd-807b-a5ef1bcb6129	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	a38eb65c-601a-404c-8730-018094c529b6	\N
6e9ce6e6-bfc2-4012-87f1-ef68aeae994b	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	a38eb65c-601a-404c-8730-018094c529b6	\N
97ff16b2-da29-470e-be46-3f975fa8ef2e	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	a38eb65c-601a-404c-8730-018094c529b6	\N
e9c42dff-5cda-4aa0-b092-24bcdc1f86d4	1	12:10:00	13:10:00	13:20:00	13:50:00	5d0a25ea-db80-4405-8b5b-5b9956036324	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
135755c9-a912-48a0-8ef7-a5304108f937	1360	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1360
1abb7514-348f-4f3a-99c2-13ca9f7e4e5e	1400	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1400
3d5dc8c7-fe80-40ee-85a9-f8748d5a8cbb	1390	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1390
55572828-064d-4b8e-8d9a-99d4107e72ca	1550	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1550
71626e00-8741-44e6-88d7-a2d5f4306a03	2050	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	2050
73696e51-e2cf-41e4-ae4d-c1dc192ad71e	1380	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1380
b31e96ec-be9e-4897-a785-bcb53a3c7f6d	2130	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	2130
bcace608-0ccc-4d4c-a803-c75e25c877d3	1280	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1280
bdb2d215-72cd-459c-a72d-dbc83a90811a	1260	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1260
eb7f9702-7902-49ee-87d8-66ac948a98cc	2150	\N	85c04905-64c9-4ea4-83c3-4187d9c0c557	2150
ee8a7846-b5ab-44a5-b824-0ebe298a8ac8	1270	\N	78f819ff-ed6c-44be-b376-0078c5b85b8c	1270
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
1020dda3-44c4-4667-88bc-0fb8ded2dcce	Цех 50	50	050
dd46043c-aa40-4811-b7ef-dc21e7feb490	Цех 480	480	480
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

