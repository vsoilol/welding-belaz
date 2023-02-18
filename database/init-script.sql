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
a3bfca45-e492-44da-99c1-cc51410aadea	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
ebd67aba-2b7e-4c68-9287-e762e78c0922	fbc88eb4-fc1d-4049-8505-89b51b5946ec	023229b4-2a1f-4dc7-b95f-3794c8e2a7af	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
88d20731-a1dc-4f37-b0b8-8ce53e5810f9	1	10	t	a3bfca45-e492-44da-99c1-cc51410aadea	\N
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
1ced3546-f5c1-4ace-8ce4-5000ad9263e0	Контроль на рабочем месте	\N
1fbff0a9-6fe9-4a4d-b6ea-62b845320022	Установка, выверка, снятие детали	\N
2441b36a-db36-45a4-97b5-72950f3e5062	Отсутствие заданий	\N
2a24e930-5607-4986-8641-dcd36a7f2968	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
34a2cdb3-bcbf-4e64-b184-29615686a6ba	Изменение режимов, смена инструмента, приспособления	\N
5a124d65-d04f-4b54-b276-2bd5ed1c639e	Праздники и выходные	\N
6882b8d5-0d38-4562-9cd5-e705b1da6ad9	Естественные надобности	\N
6dd9da3a-a509-4a5b-85e6-515dca172ec0	Плановый ремонт централизованными службами	\N
7164844d-6665-46e3-b7d3-e39571fa03db	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
74b3d176-1e33-46a6-8291-4e1832caf795	Отсутствие крана, транспорта	\N
95cc968f-298d-4ced-bdb3-4fce0aed19a5	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
b246eae1-eb0a-4c20-9dc3-6d961cbeb938	Ознакомление с работой, документацией, инструктаж	\N
b2877d06-b6af-46d3-b8c8-6f8ddb5b82ac	Неявка оператора (б/лист, отпуск, и пр.)	\N
b660efdf-8c74-4a87-b088-d708babceeb8	Установка, выверка, снятие детали	\N
cade6689-0578-4a75-9d7c-d33274bf7ef2	Отсутствие сотрудника ОТК	\N
cb3386b3-9427-42b7-ae22-a78333f6e7be	Работа с управляющей программой	\N
cbab72c6-08a9-46de-b4d7-d754795eaf1e	Отсутствие материала, заготовок, деталей	\N
cf86aa8f-f9c2-4540-9759-957c398fa9bb	Отсутствие оператора в связи с необеспеченностью	\N
d15d8b80-e2cc-4aa2-b3fc-c7aeef3a75f0	Отсутствие конструктора, технолога или ожидание его решения	\N
d72534a4-1ffd-40dd-903c-548575ae416e	Аварийный ремонт централизованными службами	\N
d7297b34-ce66-43ae-833c-33d8852733b7	Работа по карте несоответствий	\N
de484723-6b15-4f08-92aa-958d6a4834ca	Сборочные операции	\N
e1d07e35-a94a-4e9f-92e3-4db33cd708fe	Обед	\N
ef39ad81-943e-4e77-9c66-0e925b10c502	Нерабочее время по графику согласно сменности	\N
f1dd7d00-6f36-4706-9bfb-c1fd879643ba	Отсутствие энергоносителей	\N
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
03680c59-7c45-4aa0-befe-a937eab12047	857e541d-3220-4643-876a-58c59cf121dd	251534
a47ec2ae-928c-44e6-9d66-01f99717a0ba	d96fcbe3-7df7-452d-b74f-fe72141af599	256467
e5a2d1ec-5bd6-4d7b-a97e-1f205aed7f7e	933f5d98-9b38-4c5f-bb76-7217499abb7c	249550
1a6c3e00-ea53-4a84-9575-0fa2a5b620a5	cff6133f-96c7-4acb-9f57-07717c58ff15	235565
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
01093deb-7072-4471-ad74-4cd78ba11b27	4ed8d97b-05a1-46bc-96bd-43894a51f799	614962
087854fc-1f04-4681-8e00-d437ae4e731c	57540ea7-b8b7-45bf-8afc-a0afea201391	613668
226b95ef-6fc3-4d21-9c0c-d86ea5de5da4	71a8f212-2146-4b03-b6a8-c3b50edae1a2	617215
293c5f56-5297-4cb1-9e85-65175268277e	9caa5852-9c2a-48d7-a857-0318b2f063c9	614208
45b262d4-6a87-49aa-878a-439495b406c1	9e61e93f-b6b9-41fa-bdfd-5b657adc8ee2	612000
8d908b19-9060-457e-acb5-4dbfc84e169e	31dc0342-773e-4350-8ce1-435dcf903b82	643759
c0b39a81-5915-4aa0-825a-86799d93563b	13211a24-8c2c-449c-b48e-1eb4f20a62cb	610422
04102404-12ea-457b-bc5d-3465a2c47f82	1e687d9a-63b2-41b8-b7b4-30d511ca42a7	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
36ef4ebf-f3a0-4997-a716-55992c18ab9d	1	Пост 1	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N
a72eb437-0f1b-4ad3-86b4-6094bd7e3c4f	2	Пост 2	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
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
7b61e597-bd86-44ac-a29d-7839e6b38df1	09d804be-45d3-475d-8bcd-3f351a887601
e6d62cf6-7bf7-4371-ad2c-e297ee5c6982	0ed592e3-8faa-43ee-b003-1f097803ea8a
2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	1059431d-5e2f-42b5-9149-a5543999d441
686e15fc-8da8-4b63-8cf4-a53f70b6ab76	2a3ed798-b687-4956-9f86-9ed9166c438f
66746265-1f26-4a7b-a9a9-a35eaf16ed99	321ef7aa-9652-42ba-bd59-471f1a1195f1
2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	32bfa383-b963-4c09-8a76-58324472c9f0
2a3ed798-b687-4956-9f86-9ed9166c438f	3b8f1faf-494d-46c4-8bbd-72f525e813f7
7b61e597-bd86-44ac-a29d-7839e6b38df1	54a9b3f2-afec-49a6-aa8d-3f8b84df9c81
2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	66746265-1f26-4a7b-a9a9-a35eaf16ed99
66746265-1f26-4a7b-a9a9-a35eaf16ed99	6b84d906-6c3a-46e4-987c-a434208310ba
76e6b36f-5298-4114-810c-993108958c98	700ea1d4-b745-47d5-a45d-e2cd78e15332
76e6b36f-5298-4114-810c-993108958c98	7b61e597-bd86-44ac-a29d-7839e6b38df1
686e15fc-8da8-4b63-8cf4-a53f70b6ab76	80d100c9-1de9-40bd-8b59-d9f40c4871b0
c1494405-cf6c-4ed1-be3e-3a83b3979dc8	83a45634-1f0c-47ad-a860-bd57e61ae221
700ea1d4-b745-47d5-a45d-e2cd78e15332	9ba432c8-5c82-4e75-a55a-e9f171d951cb
c1494405-cf6c-4ed1-be3e-3a83b3979dc8	9bbc89b2-e7f2-48b5-a385-42df3d1b3aaf
686e15fc-8da8-4b63-8cf4-a53f70b6ab76	9d5f9f1d-d801-4e09-85f3-a66250d61d4a
2a3ed798-b687-4956-9f86-9ed9166c438f	ae0a01cb-a7a7-4a88-822c-4f7c971090d5
2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	c1494405-cf6c-4ed1-be3e-3a83b3979dc8
e6d62cf6-7bf7-4371-ad2c-e297ee5c6982	c3ab0059-7ff1-4f53-80ba-32fe73265898
76e6b36f-5298-4114-810c-993108958c98	c5f50164-d502-4d1c-bedf-dcd2b48d7536
700ea1d4-b745-47d5-a45d-e2cd78e15332	d8bdc9e5-c49d-400c-9344-8227334e567e
686e15fc-8da8-4b63-8cf4-a53f70b6ab76	e6d62cf6-7bf7-4371-ad2c-e297ee5c6982
76e6b36f-5298-4114-810c-993108958c98	f1f4c45d-aeac-4d8c-be9c-e4eefec7e08c
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
410685f9-794b-4b5f-9f2d-12ad222d5fd3	Сборка, сварка мостов	1	023229b4-2a1f-4dc7-b95f-3794c8e2a7af	01
8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	Сборка, сварка узл. и рам к/с г/п 120-220т	4	023229b4-2a1f-4dc7-b95f-3794c8e2a7af	04
a0e56f50-3a99-4a34-81f5-08c452fb0c5c	Производственный участок 5	5	2ffb8ade-c1a4-4b49-a173-a44d5247c0af	05
ef35fd74-412e-4850-8b4e-7a7d2678ec45	Сборка, сварка рам к/с г/п 120-130 т.	6	023229b4-2a1f-4dc7-b95f-3794c8e2a7af	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
09d804be-45d3-475d-8bcd-3f351a887601	Кронштейн	75310-1183106	t	3	e3e81b5b-4378-4cbb-8e93-90055e5853f8	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536267485
0ed592e3-8faa-43ee-b003-1f097803ea8a	Труба картера	75580-2401132-10	t	3	35172dc5-0619-49d2-9b0f-ab444a6792dc	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536386250
1059431d-5e2f-42b5-9149-a5543999d441	Панель	75132-2105522	t	3	bc2ce0a1-3e07-48e7-a872-92123a10dee7	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536417730
2a3ed798-b687-4956-9f86-9ed9166c438f	Картер заднего моста	75580-2401008	t	2	2d424886-ff8a-486b-93ae-a61ea3f5b7ae	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536384295
2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	Картер заднего моста	75132-2401006-50	t	1	28d4a5fd-4244-4598-aa2f-50eb6e1738c4	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536467567
321ef7aa-9652-42ba-bd59-471f1a1195f1	Проушина	7521-2401224	t	3	7e85b544-02ff-4614-b06f-eb52f597f621	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536274170
32bfa383-b963-4c09-8a76-58324472c9f0	Кронштейн	75131-2113296-10	t	3	c25b10d0-0a3f-4d16-b3ac-03b6a35be199	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536461620
3b8f1faf-494d-46c4-8bbd-72f525e813f7	Втулка	75303-2128438	t	3	13d9f808-3d3d-4754-acec-08a65a89ab91	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536248270
54a9b3f2-afec-49a6-aa8d-3f8b84df9c81	Кронштейн	75310-1183102	t	3	3b9fdedf-838d-4051-9c2b-e21f4b6bc85c	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536267484
66746265-1f26-4a7b-a9a9-a35eaf16ed99	Кронштейн	7521-2401220	t	2	6a7911dd-b52a-439a-92d8-6f5de4eb3fa3	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536273956
686e15fc-8da8-4b63-8cf4-a53f70b6ab76	Картер заднего моста	75580-2401006	t	1	a0fabcd3-1ff1-4492-92d9-96b163091099	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536384294
6b84d906-6c3a-46e4-987c-a434208310ba	Распорка	7521-3932688	t	3	66f79493-75df-4cb8-9ad9-59c95d5309f1	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536273606
700ea1d4-b745-47d5-a45d-e2cd78e15332	Кронштейн амортизатора левый	75304-1001251	t	2	61032a67-82f1-4514-b73a-660e2f4953c5	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536248707
76e6b36f-5298-4114-810c-993108958c98	Рама	75313-2800010-20	t	1	c2841522-7676-4acb-93ad-79b0c3fa856b	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536287819
7b61e597-bd86-44ac-a29d-7839e6b38df1	Кронштейн	75310-1183100	t	2	25365b8b-4add-40a9-a5d8-1451640c10d2	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536267493
9ba432c8-5c82-4e75-a55a-e9f171d951cb	Кронштейн	75304-1001253	t	3	0a22af4e-0add-45d6-9ce3-e111a5b1e02c	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536248708
9bbc89b2-e7f2-48b5-a385-42df3d1b3aaf	Пластина	75132-2401106	t	3	170bc7c1-a077-48ae-870e-d714c3320a28	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536444153
9d5f9f1d-d801-4e09-85f3-a66250d61d4a	Кронштейн	75580-2113192	t	3	26647301-41c5-45ec-9920-103c27f6364d	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536384314
ae0a01cb-a7a7-4a88-822c-4f7c971090d5	Кольцо	75580-2401227	t	3	3c9f5b71-4d09-4886-a0d7-e929df86f040	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536384312
c1494405-cf6c-4ed1-be3e-3a83b3979dc8	Картер заднего моста	75132-2401008-50	t	2	2656f603-f9cf-402a-ac6b-fb0294c38e32	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536467565
c3ab0059-7ff1-4f53-80ba-32fe73265898	Фланец картера	75580-2401114-11	t	3	f74e2dfb-efa0-4170-b648-dce435dd1e5b	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536386265
c5f50164-d502-4d1c-bedf-dcd2b48d7536	Кронштейн	75211-1018162	t	3	3fc7b7dc-6324-49c4-80fe-89db62265e08	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536270344
d8bdc9e5-c49d-400c-9344-8227334e567e	Кронштейн	75303-1001293	t	3	b4bfde3e-c8ce-4c1f-bc7a-cabaa0a159e5	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536247228
e6d62cf6-7bf7-4371-ad2c-e297ee5c6982	Труба картера заднего моста	75580-2401010-01	t	2	79b1a13d-b15d-4250-8415-baeaf6bb8a40	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N	\N	4536386240
f1f4c45d-aeac-4d8c-be9c-e4eefec7e08c	Накладка	549Б-1015842	t	3	06436f08-83dd-4242-8c06-fbcd395ccbc1	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N	\N	4536196288
80d100c9-1de9-40bd-8b59-d9f40c4871b0	Панель	75580-2105522	t	3	b0492577-b6d4-4f1a-ba58-d5788432047a	410685f9-794b-4b5f-9f2d-12ad222d5fd3	04102404-12ea-457b-bc5d-3465a2c47f82	\N	\N	4536384399
83a45634-1f0c-47ad-a860-bd57e61ae221	Опора	75211-2401122	t	3	2bf71690-8a0e-49f6-90eb-9acd593b8b7e	410685f9-794b-4b5f-9f2d-12ad222d5fd3	04102404-12ea-457b-bc5d-3465a2c47f82	\N	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
44049794-f401-4a50-b924-b3e176bfbdcb	Admin	\N
76478596-8862-47eb-a4a0-aba363ffc6f1	Master	\N
ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9	Welder	\N
d51037b7-ece1-444e-ae7a-59e5eef689d5	Inspector	\N
93044c15-e8c0-4306-b90f-d2530e6a8a63	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
209a0a94-5a9f-4a04-9fb2-bc128a3bed64	3	333	t	f	76e6b36f-5298-4114-810c-993108958c98	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N
2d4bf7a6-73c6-4717-b795-2f407e8447fe	4	222	t	f	76e6b36f-5298-4114-810c-993108958c98	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N
94cbac28-3574-4327-82a0-de8ef559e3d3	1	111	t	f	2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N
c9783790-7253-4604-8f3f-199b8fd8fbea	2	222	t	f	2fa4e306-e6bd-4b33-bc4d-67a7fd3a3ef0	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N	\N
8c0b3048-057b-44af-a527-ece1583efed2	1	100	t	f	83a45634-1f0c-47ad-a860-bd57e61ae221	f5b72cb4-5514-4f47-b351-5877abb1fd10	1a6c3e00-ea53-4a84-9575-0fa2a5b620a5	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N
8e1b9256-1d5f-40e6-be9f-365fee8e7432	2	200	t	f	80d100c9-1de9-40bd-8b59-d9f40c4871b0	ccb8b310-0e3e-42c6-a265-4124b41835a7	1a6c3e00-ea53-4a84-9575-0fa2a5b620a5	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
ccb8b310-0e3e-42c6-a265-4124b41835a7	1	ИТП	\N
f5b72cb4-5514-4f47-b351-5877abb1fd10	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
06436f08-83dd-4242-8c06-fbcd395ccbc1	1426226	Технологический процесс	Ссылка	1426226
0a22af4e-0add-45d6-9ce3-e111a5b1e02c	1492964	Технологический процесс	Ссылка	1492964
13d9f808-3d3d-4754-acec-08a65a89ab91	3011514	Технологический процесс	Ссылка	3011514
170bc7c1-a077-48ae-870e-d714c3320a28	1003048	Технологический процесс	Ссылка	1003048
25365b8b-4add-40a9-a5d8-1451640c10d2	1823031	Технологический процесс	Ссылка	1823031
2656f603-f9cf-402a-ac6b-fb0294c38e32	3232836	Технологический процесс	Ссылка	3232836
26647301-41c5-45ec-9920-103c27f6364d	1405914	Технологический процесс	Ссылка	1405914
28d4a5fd-4244-4598-aa2f-50eb6e1738c4	3090319	Технологический процесс	Ссылка	3090319
2bf71690-8a0e-49f6-90eb-9acd593b8b7e	3211246	Технологический процесс	Ссылка	3211246
2d424886-ff8a-486b-93ae-a61ea3f5b7ae	3232938	Технологический процесс	Ссылка	3232938
35172dc5-0619-49d2-9b0f-ab444a6792dc	2822569	Технологический процесс	Ссылка	2822569
3b9fdedf-838d-4051-9c2b-e21f4b6bc85c	1104641	Технологический процесс	Ссылка	1104641
3c9f5b71-4d09-4886-a0d7-e929df86f040	1402616	Технологический процесс	Ссылка	1402616
3fc7b7dc-6324-49c4-80fe-89db62265e08	2841119	Технологический процесс	Ссылка	2841119
61032a67-82f1-4514-b73a-660e2f4953c5	1334123	Технологический процесс	Ссылка	1334123
66f79493-75df-4cb8-9ad9-59c95d5309f1	908693	Технологический процесс	Ссылка	908693
6a7911dd-b52a-439a-92d8-6f5de4eb3fa3	1362989	Технологический процесс	Ссылка	1362989
79b1a13d-b15d-4250-8415-baeaf6bb8a40	2915477	Технологический процесс	Ссылка	2915477
7e85b544-02ff-4614-b06f-eb52f597f621	1124147	Технологический процесс	Ссылка	1124147
a0fabcd3-1ff1-4492-92d9-96b163091099	2433634	Технологический процесс	Ссылка	2433634
b0492577-b6d4-4f1a-ba58-d5788432047a	1405307	Технологический процесс	Ссылка	1405307
b4bfde3e-c8ce-4c1f-bc7a-cabaa0a159e5	3049271	Технологический процесс	Ссылка	3049271
bc2ce0a1-3e07-48e7-a872-92123a10dee7	1053809	Технологический процесс	Ссылка	1053809
c25b10d0-0a3f-4d16-b3ac-03b6a35be199	526870	Технологический процесс	Ссылка	526870
c2841522-7676-4acb-93ad-79b0c3fa856b	3239598	Технологический процесс	Ссылка	3239598
e3e81b5b-4378-4cbb-8e93-90055e5853f8	1119363	Технологический процесс	Ссылка	1119363
f74e2dfb-efa0-4170-b648-dce435dd1e5b	3338649	Технологический процесс	Ссылка	3338649
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
857e541d-3220-4643-876a-58c59cf121dd	d51037b7-ece1-444e-ae7a-59e5eef689d5
933f5d98-9b38-4c5f-bb76-7217499abb7c	d51037b7-ece1-444e-ae7a-59e5eef689d5
d96fcbe3-7df7-452d-b74f-fe72141af599	d51037b7-ece1-444e-ae7a-59e5eef689d5
13211a24-8c2c-449c-b48e-1eb4f20a62cb	76478596-8862-47eb-a4a0-aba363ffc6f1
31dc0342-773e-4350-8ce1-435dcf903b82	76478596-8862-47eb-a4a0-aba363ffc6f1
4ed8d97b-05a1-46bc-96bd-43894a51f799	76478596-8862-47eb-a4a0-aba363ffc6f1
57540ea7-b8b7-45bf-8afc-a0afea201391	76478596-8862-47eb-a4a0-aba363ffc6f1
71a8f212-2146-4b03-b6a8-c3b50edae1a2	76478596-8862-47eb-a4a0-aba363ffc6f1
9caa5852-9c2a-48d7-a857-0318b2f063c9	76478596-8862-47eb-a4a0-aba363ffc6f1
9e61e93f-b6b9-41fa-bdfd-5b657adc8ee2	76478596-8862-47eb-a4a0-aba363ffc6f1
189853f8-ab60-4773-8762-b3a579f6a7ce	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
193d1923-981b-4784-adfc-f84906981040	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
21e1cb5c-1b7d-4891-a42c-ef69fe2a5f17	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
22c0479f-41dc-4ad1-9bec-9eb73c1d8167	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
2301f851-6156-49bb-a71d-32e096073dd7	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
27a032ab-1ca8-40fd-aa60-62a8107c5203	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
30aaa043-f68f-4a1c-a6ae-1febad6f6fe2	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
443423a7-c8d2-4935-acdb-a6354445400b	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
5d1556f1-3b06-4190-8f38-a4ed5376a52c	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
6ece1e84-c9ab-4ee6-b08b-63b0cd34ccf9	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
9286847d-9e67-4c9f-b005-1c8ef1f25da0	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
98fac340-cbaa-4690-ac31-aeac44f4fe87	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
9fc51692-7293-4ed6-b190-3b818cb09413	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
a181be61-0146-4fba-9a04-e143d66e5665	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
a68d1790-392f-47be-930f-abfe36362e18	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
c6d004a6-7603-4863-86fa-6d3d158929b9	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
cd4ae923-55e1-4e8f-93e2-01338d248792	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
cd6a380a-5f1d-471f-9633-43c3a056e958	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
e7a69585-c178-48bc-9001-e41c7cf88615	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
ecd4e827-f68b-4d69-aedc-63337fb200c2	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
f7819f99-401a-4429-bd6f-e4a6e90705e8	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
fbc5b9c1-1a25-46c2-bd30-22866cbda029	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
fbc88eb4-fc1d-4049-8505-89b51b5946ec	93044c15-e8c0-4306-b90f-d2530e6a8a63
1e687d9a-63b2-41b8-b7b4-30d511ca42a7	76478596-8862-47eb-a4a0-aba363ffc6f1
f485618e-3d50-49ae-80b3-633d897d0bdf	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
cff6133f-96c7-4acb-9f57-07717c58ff15	d51037b7-ece1-444e-ae7a-59e5eef689d5
f058b65b-33a2-4bb8-8e13-2f883c733910	44049794-f401-4a50-b924-b3e176bfbdcb
a22cd2f7-b61f-488d-b11b-6fc49baab549	ce7d32ab-94a6-4066-bcf9-9fee53c8d5e9
ecb3137e-1ce2-47db-87c3-3aa878a16959	d51037b7-ece1-444e-ae7a-59e5eef689d5
e18b9827-258c-4ed1-80b2-60008ddf098f	93044c15-e8c0-4306-b90f-d2530e6a8a63
368003f6-dc61-4f47-b46b-861886c47374	76478596-8862-47eb-a4a0-aba363ffc6f1
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
857e541d-3220-4643-876a-58c59cf121dd	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	a0e56f50-3a99-4a34-81f5-08c452fb0c5c	\N
933f5d98-9b38-4c5f-bb76-7217499abb7c	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
d96fcbe3-7df7-452d-b74f-fe72141af599	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	a0e56f50-3a99-4a34-81f5-08c452fb0c5c	\N
13211a24-8c2c-449c-b48e-1eb4f20a62cb	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
31dc0342-773e-4350-8ce1-435dcf903b82	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
4ed8d97b-05a1-46bc-96bd-43894a51f799	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
57540ea7-b8b7-45bf-8afc-a0afea201391	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
71a8f212-2146-4b03-b6a8-c3b50edae1a2	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N
9caa5852-9c2a-48d7-a857-0318b2f063c9	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N
9e61e93f-b6b9-41fa-bdfd-5b657adc8ee2	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
189853f8-ab60-4773-8762-b3a579f6a7ce	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N
193d1923-981b-4784-adfc-f84906981040	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
21e1cb5c-1b7d-4891-a42c-ef69fe2a5f17	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
22c0479f-41dc-4ad1-9bec-9eb73c1d8167	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
2301f851-6156-49bb-a71d-32e096073dd7	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
27a032ab-1ca8-40fd-aa60-62a8107c5203	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
30aaa043-f68f-4a1c-a6ae-1febad6f6fe2	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N
443423a7-c8d2-4935-acdb-a6354445400b	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
5d1556f1-3b06-4190-8f38-a4ed5376a52c	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
6ece1e84-c9ab-4ee6-b08b-63b0cd34ccf9	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
9286847d-9e67-4c9f-b005-1c8ef1f25da0	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
98fac340-cbaa-4690-ac31-aeac44f4fe87	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
9fc51692-7293-4ed6-b190-3b818cb09413	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
a181be61-0146-4fba-9a04-e143d66e5665	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
a68d1790-392f-47be-930f-abfe36362e18	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
c6d004a6-7603-4863-86fa-6d3d158929b9	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
cd4ae923-55e1-4e8f-93e2-01338d248792	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	\N
cd6a380a-5f1d-471f-9633-43c3a056e958	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
e7a69585-c178-48bc-9001-e41c7cf88615	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
ecd4e827-f68b-4d69-aedc-63337fb200c2	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
f7819f99-401a-4429-bd6f-e4a6e90705e8	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
fbc5b9c1-1a25-46c2-bd30-22866cbda029	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	\N
fbc88eb4-fc1d-4049-8505-89b51b5946ec	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
1e687d9a-63b2-41b8-b7b4-30d511ca42a7	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
cff6133f-96c7-4acb-9f57-07717c58ff15	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
f485618e-3d50-49ae-80b3-633d897d0bdf	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	\N
f058b65b-33a2-4bb8-8e13-2f883c733910	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$sI9UFOQ7e2zWuQ8lpDt3pyHlIsZNhRwQobnIExzeaxxG7AFD	\N	\N	\N	\N	\N	\N
a22cd2f7-b61f-488d-b11b-6fc49baab549	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$oJoFWpJ45+5FrlAbiP6WJhkt6x6U6qO2ed/I2N30nC6TP4cI	\N	\N	\N	\N	\N	\N
ecb3137e-1ce2-47db-87c3-3aa878a16959	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$nbIhJ9vIn5DN8n8+WQPtWe2iSEXnG6Pdt/sUAmJHWRU+lahJ	\N	\N	\N	\N	\N	\N
e18b9827-258c-4ed1-80b2-60008ddf098f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$eZqQxxFlC3Flztg4GqwOwbOdy+PltMGitUMME36r9D/hVzGK	\N	\N	\N	\N	\N	\N
368003f6-dc61-4f47-b46b-861886c47374	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$vUIDfEHcNLNueGDjsm6txApUPgxOScFa5AKuntJ3D5gYmHfQ	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
5345de88-d77c-41e5-aa84-9200f1b1d6b7	1	Корневой	80	120	\N	\N	50	250	ccb8b310-0e3e-42c6-a265-4124b41835a7	\N
58799501-761f-4e50-9fd9-ea4c41393b15	2	Заполняющий	80	120	21	25	50	250	f5b72cb4-5514-4f47-b351-5877abb1fd10	\N
baa0b3c3-92bd-4206-981c-ef792719bb0f	2	Заполняющий	80	120	21	25	50	250	ccb8b310-0e3e-42c6-a265-4124b41835a7	\N
e4673546-7452-49f4-aca0-b87196958bb1	1	Корневой	80	120	22	24	50	250	f5b72cb4-5514-4f47-b351-5877abb1fd10	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
06868138-2173-47a1-a41a-8e42fcf14a62	1	Корневой	0.11	0.68	\N	\N	\N	609fd76e-d808-47d0-b2e4-cb65b39f3058	36fa5998-2fc8-4543-a13f-dc034caba8c1	\N
3adb42fd-22ec-4b65-8618-714d0d230263	2	Заполняющий	0.22	0.44	\N	\N	\N	887cf29c-1d0a-4c4a-ae51-23bd98495d89	36fa5998-2fc8-4543-a13f-dc034caba8c1	\N
d02f692e-3788-4712-aa8b-381822fee4df	1	Корневой	0.11	0.68	\N	\N	\N	68f9a5a3-9f37-4890-a403-db1bdc7763d6	60a386cb-0d83-4189-9d4a-aef26c733701	\N
fd87af85-f8b8-43a7-9b22-25a10da2f1d1	2	Заполняющий	0.22	0.44	\N	\N	\N	52475071-05a1-47d1-a47e-51addefab2d5	60a386cb-0d83-4189-9d4a-aef26c733701	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
01d93970-d325-40f8-a573-0785da8aac65	7a537a63-1f4a-483c-b3ee-4316ff77f8f1
06dee2f7-c98d-4e4f-9651-676af6c62f47	5390bdbe-c860-4c5d-9a50-5ab4597eacae
096acabc-b25b-4d0b-90c4-968d5ad8eca1	ad13619c-e170-4b28-bfaf-f2718e671b80
0cdfc3c5-25fe-4a5f-a8e6-5a7c6e44c75c	9908dd20-f9e7-445d-854e-4de4e5b982e3
153eb25f-1a47-4a10-84c8-772452a23568	59f76c46-3465-4062-9aff-b6b0f913b817
20fbb592-1aa7-4bfc-9ca6-436fd8552aa9	9908dd20-f9e7-445d-854e-4de4e5b982e3
2a83c889-e8a4-4a1c-bead-b5fcaf466ee6	ad13619c-e170-4b28-bfaf-f2718e671b80
3144f416-515c-464b-833e-0897b3f52e81	7a537a63-1f4a-483c-b3ee-4316ff77f8f1
318103c0-48ac-4ceb-b5aa-7d8effd1aefb	5390bdbe-c860-4c5d-9a50-5ab4597eacae
530c9a28-a2b2-40cf-beb7-9dd138b00a6b	59f76c46-3465-4062-9aff-b6b0f913b817
56a3fb38-e745-4341-ab6f-9a576e97e38b	7a537a63-1f4a-483c-b3ee-4316ff77f8f1
6bf0fbf2-7816-4687-9e3f-b1b063fee2ff	9908dd20-f9e7-445d-854e-4de4e5b982e3
8d13ca51-6e73-4160-9f29-6f7c73a9851b	9d884e59-32ff-47e2-bb03-cfd7599162e6
9c818063-dfdb-45c5-aa31-fc83706b932f	9d884e59-32ff-47e2-bb03-cfd7599162e6
9f2e7073-42a8-4ea7-b41a-34b6cf73078c	1a5839b6-be3e-42d0-88e9-d855401f3755
a2f1443d-566f-4b35-ae79-c4eb9a3d49ba	ad13619c-e170-4b28-bfaf-f2718e671b80
b2afcb95-00f7-4ac3-bf7b-4b943679ff80	d4e3326a-f5f9-4e7f-a102-48cc10f93176
b684bc92-9ae8-4073-851a-f77bdce6edee	ad13619c-e170-4b28-bfaf-f2718e671b80
be279bd9-6c9c-47b0-a1e6-59cf80bd288c	7a537a63-1f4a-483c-b3ee-4316ff77f8f1
d37eca8d-db17-497f-b3ef-0f75c371e99a	1a5839b6-be3e-42d0-88e9-d855401f3755
f5879720-aede-425c-8c5d-a406443bbbf7	d4e3326a-f5f9-4e7f-a102-48cc10f93176
f907ebad-9d19-4221-943d-34ce291ef51d	ad13619c-e170-4b28-bfaf-f2718e671b80
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
01d93970-d325-40f8-a573-0785da8aac65	a68d1790-392f-47be-930f-abfe36362e18	\N	151861
06dee2f7-c98d-4e4f-9651-676af6c62f47	f7819f99-401a-4429-bd6f-e4a6e90705e8	20ce109e-961c-4d5e-998d-5dd738745222	150882
096acabc-b25b-4d0b-90c4-968d5ad8eca1	6ece1e84-c9ab-4ee6-b08b-63b0cd34ccf9	\N	156298
0cdfc3c5-25fe-4a5f-a8e6-5a7c6e44c75c	30aaa043-f68f-4a1c-a6ae-1febad6f6fe2	\N	152444
153eb25f-1a47-4a10-84c8-772452a23568	9fc51692-7293-4ed6-b190-3b818cb09413	1e58d6f2-919b-46d5-ad27-97eab337af5b	146325
20fbb592-1aa7-4bfc-9ca6-436fd8552aa9	189853f8-ab60-4773-8762-b3a579f6a7ce	\N	152207
2a83c889-e8a4-4a1c-bead-b5fcaf466ee6	e7a69585-c178-48bc-9001-e41c7cf88615	\N	152365
3144f416-515c-464b-833e-0897b3f52e81	9286847d-9e67-4c9f-b005-1c8ef1f25da0	\N	155288
318103c0-48ac-4ceb-b5aa-7d8effd1aefb	cd6a380a-5f1d-471f-9633-43c3a056e958	c9ccdfdd-a9e1-42c2-8045-540f0eacbf73	151299
530c9a28-a2b2-40cf-beb7-9dd138b00a6b	98fac340-cbaa-4690-ac31-aeac44f4fe87	4fa7a492-4a5e-4320-9b83-c33a2fe249a4	120756
56a3fb38-e745-4341-ab6f-9a576e97e38b	c6d004a6-7603-4863-86fa-6d3d158929b9	\N	152441
6bf0fbf2-7816-4687-9e3f-b1b063fee2ff	cd4ae923-55e1-4e8f-93e2-01338d248792	\N	156278
8d13ca51-6e73-4160-9f29-6f7c73a9851b	fbc5b9c1-1a25-46c2-bd30-22866cbda029	ae763d63-26a0-4fd1-8477-5b0e236920ed	132695
9c818063-dfdb-45c5-aa31-fc83706b932f	193d1923-981b-4784-adfc-f84906981040	7fc641dd-cdf8-4b2c-b3fb-3c3723cc8e5c	145092
9f2e7073-42a8-4ea7-b41a-34b6cf73078c	a181be61-0146-4fba-9a04-e143d66e5665	\N	150402
a2f1443d-566f-4b35-ae79-c4eb9a3d49ba	5d1556f1-3b06-4190-8f38-a4ed5376a52c	\N	121538
b2afcb95-00f7-4ac3-bf7b-4b943679ff80	ecd4e827-f68b-4d69-aedc-63337fb200c2	8e53add0-df27-42dc-be2a-cb2da58043f5	121267
b684bc92-9ae8-4073-851a-f77bdce6edee	443423a7-c8d2-4935-acdb-a6354445400b	\N	121537
be279bd9-6c9c-47b0-a1e6-59cf80bd288c	21e1cb5c-1b7d-4891-a42c-ef69fe2a5f17	\N	153274
d37eca8d-db17-497f-b3ef-0f75c371e99a	22c0479f-41dc-4ad1-9bec-9eb73c1d8167	\N	149921
f5879720-aede-425c-8c5d-a406443bbbf7	2301f851-6156-49bb-a71d-32e096073dd7	1e58d6f2-919b-46d5-ad27-97eab337af5b	117390
f907ebad-9d19-4221-943d-34ce291ef51d	27a032ab-1ca8-40fd-aa60-62a8107c5203	\N	147329
3aaea681-521c-4141-b640-86792fa362dc	f485618e-3d50-49ae-80b3-633d897d0bdf	\N	\N
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
1a5839b6-be3e-42d0-88e9-d855401f3755	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
5390bdbe-c860-4c5d-9a50-5ab4597eacae	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
59f76c46-3465-4062-9aff-b6b0f913b817	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
7a537a63-1f4a-483c-b3ee-4316ff77f8f1	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
9908dd20-f9e7-445d-854e-4de4e5b982e3	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
9d884e59-32ff-47e2-bb03-cfd7599162e6	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
ad13619c-e170-4b28-bfaf-f2718e671b80	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
d4e3326a-f5f9-4e7f-a102-48cc10f93176	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
9d2c9c64-c386-4b23-921b-ec09de5b172c	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
bd505a79-ab69-4a24-8836-e6de8a3815c0	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "WeldingCurrentValues", "ArcVoltageValues", "IdFromSystem") FROM stdin;
52475071-05a1-47d1-a47e-51addefab2d5	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	\N
609fd76e-d808-47d0-b2e4-cb65b39f3058	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	\N
68f9a5a3-9f37-4890-a403-db1bdc7763d6	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	\N
887cf29c-1d0a-4c4a-ae51-23bd98495d89	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
36fa5998-2fc8-4543-a13f-dc034caba8c1	1	1	f	2023-02-18 21:11:48.534225	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8e1b9256-1d5f-40e6-be9f-365fee8e7432	9d2c9c64-c386-4b23-921b-ec09de5b172c	3aaea681-521c-4141-b640-86792fa362dc	04102404-12ea-457b-bc5d-3465a2c47f82	1a6c3e00-ea53-4a84-9575-0fa2a5b620a5	\N
60a386cb-0d83-4189-9d4a-aef26c733701	2	1	f	2023-02-18 21:11:48.53063	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8c0b3048-057b-44af-a527-ece1583efed2	bd505a79-ab69-4a24-8836-e6de8a3815c0	3aaea681-521c-4141-b640-86792fa362dc	04102404-12ea-457b-bc5d-3465a2c47f82	1a6c3e00-ea53-4a84-9575-0fa2a5b620a5	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
50d86ca4-2a66-4c8d-a2ea-18c2cbcf0beb	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	a3bfca45-e492-44da-99c1-cc51410aadea	\N
97735862-307e-4ad1-9dc8-51a02abe95d4	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	a3bfca45-e492-44da-99c1-cc51410aadea	\N
cebe7f16-13f7-478e-b45b-9a17f98252d0	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	a3bfca45-e492-44da-99c1-cc51410aadea	\N
871643f4-bfd3-4856-a14d-0ec7f647738a	1	12:10:00	13:10:00	13:20:00	13:50:00	88d20731-a1dc-4f37-b0b8-8ce53e5810f9	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0d9fab5e-351e-4c94-9baf-cd95b1aaa23f	1280	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1280
1e58d6f2-919b-46d5-ad27-97eab337af5b	3610	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3610
1e8eb483-e603-49eb-8b00-b5d3c8a1a5a0	1380	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1380
20ce109e-961c-4d5e-998d-5dd738745222	3690	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3690
3d2f8078-5978-4ba2-bc39-05bce9de6ade	1260	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1260
4fa7a492-4a5e-4320-9b83-c33a2fe249a4	3520	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3520
60a025f4-5bfa-4d0c-8373-34b5a2a8542c	1360	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1360
612deb47-2102-4598-ae91-9dd182b5b0d2	1270	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1270
7fc641dd-cdf8-4b2c-b3fb-3c3723cc8e5c	3590	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3590
8e53add0-df27-42dc-be2a-cb2da58043f5	3600	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3600
90b8f2f9-0554-45d9-b94f-7281237f9779	1550	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1550
9168c420-7531-4bf6-8106-f84c390c9a59	2150	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	2150
a5c8c6e6-52b0-47bb-9b13-33234ac5efb5	2130	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	2130
ae763d63-26a0-4fd1-8477-5b0e236920ed	3500	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3500
c9ccdfdd-a9e1-42c2-8045-540f0eacbf73	3650	\N	ef35fd74-412e-4850-8b4e-7a7d2678ec45	3650
d2c7f401-ef88-46f7-982a-dbd2d841ad65	1400	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1400
eb8e58cf-c159-40b9-9b4b-48dc48b39db5	1390	\N	8e4c15b2-96b8-4cd1-a61f-3bdfa2b737eb	1390
f5595250-2205-427a-a668-cdc5549deb75	2050	\N	410685f9-794b-4b5f-9f2d-12ad222d5fd3	2050
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
023229b4-2a1f-4dc7-b95f-3794c8e2a7af	Цех 50	50	050
2ffb8ade-c1a4-4b49-a173-a44d5247c0af	Цех 480	480	480
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

