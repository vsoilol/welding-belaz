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
    "PreheatingTemperature" integer,
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
    "MasterId" uuid,
    "IdFromSystem" text
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
b56ba7ae-01f3-438e-ac83-6186a1d0a6a8	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
93cd9897-9ec0-4803-bf74-3f7d3d5b2805	b4c55a0b-49c5-4d4f-98b8-bc4c9f9774ac	02561377-ee6d-478e-bf99-b3c80122a07c	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
aca6d734-ba0a-4b08-af55-20ab1ef753b6	1	10	t	b56ba7ae-01f3-438e-ac83-6186a1d0a6a8	\N
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
006c0954-02cd-4c87-aac7-8b5ea2f28eb8	Отсутствие материала, заготовок, деталей	\N
0da23e59-94c9-4b06-bb4e-74710ad92463	Изменение режимов, смена инструмента, приспособления	\N
11f1c303-0d08-4b6c-ba71-92fbc05dc2ef	Работа по карте несоответствий	\N
1d261b98-2da4-4cab-9507-38a886e4417d	Отсутствие заданий	\N
1f81667c-5c4b-46a2-8018-f061f3b60665	Обед	\N
28f7d660-0a7d-42f4-bcd8-0a3fa81aa471	Неявка оператора (б/лист, отпуск, и пр.)	\N
3766f448-c425-43d2-8337-ffd26010fbf2	Отсутствие оператора в связи с необеспеченностью	\N
3cac0edf-ca9e-412e-952c-02a8de7d2808	Плановый ремонт централизованными службами	\N
3efc7252-bc97-4395-b564-9a5281dd46e1	Работа с управляющей программой	\N
611ad168-9eb9-4d8b-aaef-0bc256f4914f	Отсутствие энергоносителей	\N
675cad1f-dfc8-48df-a4f6-61cfcffd3dcf	Праздники и выходные	\N
70c73115-6af8-47de-ba29-802f5fdf4aa2	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
710f6471-2741-41a6-afc5-436861a33ce0	Отсутствие конструктора, технолога или ожидание его решения	\N
79727ce6-0786-4d9a-a5fe-55135b7a0c87	Ознакомление с работой, документацией, инструктаж	\N
7a275ac8-fb7e-44c5-8273-020d44470aa4	Естественные надобности	\N
910c12a0-ee3d-4692-b3c5-55a19af151bb	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
977ee927-ba59-417f-b152-1ac7e17e8d6c	Нерабочее время по графику согласно сменности	\N
a5965d41-040a-4ed9-bf9d-e641c2121a1e	Установка, выверка, снятие детали	\N
a8fb0b22-7ca6-4872-baea-b9cdc88fc151	Отсутствие сотрудника ОТК	\N
ada8dc81-8ff7-48f1-b478-b92ce9ffcc3b	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
b05a1c6f-d479-409e-a163-fe682e33e75f	Отсутствие крана, транспорта	\N
bc220d86-6bb5-4ee8-8fc0-9e18ae77699e	Аварийный ремонт централизованными службами	\N
c449f462-f3ce-42a1-b9de-a08c2eab0844	Установка, выверка, снятие детали	\N
c9ace26d-8190-4157-8d5f-5b69a2dd0851	Сборочные операции	\N
de4eec70-6a2e-4a1d-bfea-43b8d84002ba	Контроль на рабочем месте	\N
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
1a25790b-27ef-4555-aa8d-de74fdbd4cec	3aa7ac97-e72c-49d7-8103-4dfea4fe780f	256467
4167ec28-0702-44ea-a4dd-59a32cdf5204	2c1f1186-511b-41ad-a09d-6d0ff3e98b00	251534
b7c252d9-98d6-44ef-a17c-79a46038c63e	651d7834-8e2a-4dc1-8103-aea523c02ac1	249550
3fe1ac0d-b19d-4fce-8ae0-499d26046223	78534247-9e34-41b3-b7a7-6ee77f9ac610	235565
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
134856f3-a863-48d9-a46f-f7ca7a88a8b7	f1628bbd-2da4-4d90-ad74-f8d4fe3e9153	617215
40cb02f3-7918-439f-8b04-82af6839d875	08150b2b-17b6-46ab-ad94-a2952dcdf616	614962
4d324d38-3336-4404-bebe-3328f8cac9be	6846fc85-4711-4ba3-9891-fc44a120254c	610422
4fc6452c-8d0f-4e0f-9bb3-9022832a6969	38e58057-504a-4218-b73e-a45730cee186	612000
543191d8-d63a-483a-b3b6-e5f30d9a4fb2	e92568d4-e260-4291-9974-bc2a464ebcab	\N
9616f76b-0bcf-4f72-acda-fa7775badc6a	75a5430b-04e8-45a3-bd58-34f4a1a488e0	614208
9735a6cb-2f8f-48d1-9965-0be3d569d72e	df67eae7-52dd-430d-8ab6-533ba9661b23	613668
ad2ca222-6e7e-42b7-9637-3cb7e130d4ff	de8f6cc6-3292-49d1-84ed-d9eaad9576a4	643759
ce474846-a609-4125-b742-5acaae90909f	22319a78-a53c-49b8-b6f7-e3b769bde501	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
19e7fc87-da49-4ba5-b899-a9a3dc5414e7	1	Пост 1	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N
bd5f859e-eb71-4475-b14d-d4e2027e780c	2	Пост 2	b1104b89-9719-4a67-8597-f39ef90962df	\N
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
f7108651-9c7d-4713-ba55-afc811def494	01986884-2d55-4ffa-8ba1-78693d3f2701
f5b75bc7-a56b-4e8d-a7c4-45cda635e198	28d6fc51-f6cd-4525-a501-6d7571f6a311
6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	3f4604cc-587b-4c61-acf7-11a2cb8f7921
f7108651-9c7d-4713-ba55-afc811def494	4293d0ac-85ab-42e6-a5a6-ec4adaba6154
9dd3266a-6709-416d-9f8a-06c1850de11b	475ca8e5-9dde-4b8c-9dd6-4140f6746acc
bace5764-e3d0-427c-bba1-993010408cee	6a10fe30-31da-4463-b9b4-c15e9c3c8049
475ca8e5-9dde-4b8c-9dd6-4140f6746acc	775214b8-6ea3-4494-9e72-b7678f4d1947
bace5764-e3d0-427c-bba1-993010408cee	78db130a-155a-4805-b428-0a2b6c7fd72e
9563d527-2199-41de-b48f-e3047b2f5c5a	8dd99b6d-f71e-4b4b-8f79-2f2a6aa14ec7
4293d0ac-85ab-42e6-a5a6-ec4adaba6154	8e9cec83-95e5-4b37-9192-e8c189fdd665
f7108651-9c7d-4713-ba55-afc811def494	9563d527-2199-41de-b48f-e3047b2f5c5a
6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	97b6ab42-6142-4dff-b98c-d0032d113123
4293d0ac-85ab-42e6-a5a6-ec4adaba6154	99ee086e-a33c-4dbe-af08-d45fc496f833
9dd3266a-6709-416d-9f8a-06c1850de11b	9f1475a3-d5f9-44d4-a631-be4a334b3b9b
be152dd1-16eb-40d3-b281-96972bc7f4f3	a6395d4a-1e87-4683-9b8b-5f11869aaa5a
9563d527-2199-41de-b48f-e3047b2f5c5a	b2a36e0e-8e59-4ce0-b7e5-394bc88048f0
6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	bace5764-e3d0-427c-bba1-993010408cee
9dd3266a-6709-416d-9f8a-06c1850de11b	be152dd1-16eb-40d3-b281-96972bc7f4f3
be152dd1-16eb-40d3-b281-96972bc7f4f3	c67566f0-bbed-4e7e-b081-07b7cb26961a
f5b75bc7-a56b-4e8d-a7c4-45cda635e198	d43759cc-841a-4e19-b4aa-c3982660b73e
9dd3266a-6709-416d-9f8a-06c1850de11b	d6d15ed7-f1d2-4396-8a9d-1d6c1b180cf1
f7108651-9c7d-4713-ba55-afc811def494	e9d4397a-7236-4dda-92ad-36b919af3312
6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	f5b75bc7-a56b-4e8d-a7c4-45cda635e198
475ca8e5-9dde-4b8c-9dd6-4140f6746acc	fb81e1bb-de2b-4a77-93cd-070175f2efe4
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
2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	Сборка, сварка мостов	1	02561377-ee6d-478e-bf99-b3c80122a07c	01
b1104b89-9719-4a67-8597-f39ef90962df	Сборка, сварка узл. и рам к/с г/п 120-220т	4	02561377-ee6d-478e-bf99-b3c80122a07c	04
c23cdab2-da82-4305-bf9f-61986f140a96	Производственный участок 5	5	c32fbe73-86c0-4dae-9ef1-8cc7a4aca749	05
f56489e1-c01e-48af-9653-33e1805cf04d	Сборка, сварка рам к/с г/п 120-130 т.	6	02561377-ee6d-478e-bf99-b3c80122a07c	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
28d6fc51-f6cd-4525-a501-6d7571f6a311	Кронштейн	75310-1183102	t	3	c650a10e-d401-488a-a548-dfd09d44513e	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536267484
3f4604cc-587b-4c61-acf7-11a2cb8f7921	Кронштейн	75211-1018162	t	3	30574670-1410-41a9-b264-0d9dd84800b4	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536270344
4293d0ac-85ab-42e6-a5a6-ec4adaba6154	Труба картера заднего моста	75580-2401010-01	t	2	d253f288-ba7f-404f-883f-dc74118c2a36	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536386240
475ca8e5-9dde-4b8c-9dd6-4140f6746acc	Кронштейн	7521-2401220	t	2	279afca5-da2f-4e76-9774-ac6f1f4ce147	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536273956
6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	Рама	75313-2800010-20	t	1	be11f930-c963-453b-8317-50231ef49a57	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536287819
6a10fe30-31da-4463-b9b4-c15e9c3c8049	Кронштейн	75304-1001253	t	3	ab1604ed-f5a0-47c6-ab1a-b5bd91521dcf	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536248708
775214b8-6ea3-4494-9e72-b7678f4d1947	Проушина	7521-2401224	t	3	556b5448-336d-43c6-a9fd-2361fe5f2e05	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536274170
78db130a-155a-4805-b428-0a2b6c7fd72e	Кронштейн	75303-1001293	t	3	53b26c5f-ff7c-4826-ab3c-c0c8d1355aff	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536247228
8dd99b6d-f71e-4b4b-8f79-2f2a6aa14ec7	Втулка	75303-2128438	t	3	c8ab47a5-992a-4b9d-91ac-2aeb81d0ccef	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536248270
8e9cec83-95e5-4b37-9192-e8c189fdd665	Труба картера	75580-2401132-10	t	3	ec8bf9ea-774a-44a4-9056-2a697448fb3c	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536386250
9563d527-2199-41de-b48f-e3047b2f5c5a	Картер заднего моста	75580-2401008	t	2	e6257f28-84de-4c02-91e5-a400686aa30a	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536384295
97b6ab42-6142-4dff-b98c-d0032d113123	Накладка	549Б-1015842	t	3	4a469f05-9b1a-4102-9fd1-802e6c5d238c	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536196288
99ee086e-a33c-4dbe-af08-d45fc496f833	Фланец картера	75580-2401114-11	t	3	989687ae-d225-413e-a018-3812bd4cb71a	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536386265
9dd3266a-6709-416d-9f8a-06c1850de11b	Картер заднего моста	75132-2401006-50	t	1	55b1e72f-d202-416d-b965-dd71b02dc7ff	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536467567
9f1475a3-d5f9-44d4-a631-be4a334b3b9b	Панель	75132-2105522	t	3	7198f434-91ff-48f7-8306-b30aced639dd	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536417730
a6395d4a-1e87-4683-9b8b-5f11869aaa5a	Пластина	75132-2401106	t	3	3f215592-3336-437f-aecb-aa8d4c8c0d6f	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536444153
b2a36e0e-8e59-4ce0-b7e5-394bc88048f0	Кольцо	75580-2401227	t	3	96da534f-b08c-4bff-bbff-ac8bcc7c87c8	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536384312
bace5764-e3d0-427c-bba1-993010408cee	Кронштейн амортизатора левый	75304-1001251	t	2	a081d4bb-40db-468b-8e62-f7ded918f4b1	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536248707
be152dd1-16eb-40d3-b281-96972bc7f4f3	Картер заднего моста	75132-2401008-50	t	2	d7e7cb3c-0ba9-4a34-82e4-b4cba075b491	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536467565
d43759cc-841a-4e19-b4aa-c3982660b73e	Кронштейн	75310-1183106	t	3	f2ae0e46-d233-40bb-8bc9-2fda4b799c3f	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536267485
d6d15ed7-f1d2-4396-8a9d-1d6c1b180cf1	Кронштейн	75131-2113296-10	t	3	f0b7b6ec-f3a2-43fa-bc6b-4925845585cf	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536461620
e9d4397a-7236-4dda-92ad-36b919af3312	Кронштейн	75580-2113192	t	3	d85af484-6e3a-4997-8d05-b0265a6ded3f	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536384314
f5b75bc7-a56b-4e8d-a7c4-45cda635e198	Кронштейн	75310-1183100	t	2	139d68d7-bd53-49dd-b5ff-c00902c38d31	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N	\N	4536267493
f7108651-9c7d-4713-ba55-afc811def494	Картер заднего моста	75580-2401006	t	1	5375cc83-c9d1-43ee-9903-ec40ed22abeb	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536384294
fb81e1bb-de2b-4a77-93cd-070175f2efe4	Распорка	7521-3932688	t	3	8c33aed3-bc4e-45f0-8ad1-00d475bc7988	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N	\N	4536273606
01986884-2d55-4ffa-8ba1-78693d3f2701	Панель	75580-2105522	t	3	c0f3de1b-55c3-4c08-a2e6-f9f7db79821b	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	ce474846-a609-4125-b742-5acaae90909f	\N	\N	4536384399
c67566f0-bbed-4e7e-b081-07b7cb26961a	Опора	75211-2401122	t	3	3ddfe2bf-42e7-46ec-b056-429510a75fe1	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	ce474846-a609-4125-b742-5acaae90909f	\N	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
5289ad32-ad37-4453-ad9c-01c887875f37	Admin	\N
cb96c0b2-b603-4f68-9821-5490d6defc80	Master	\N
06cd8d8c-42b2-49b6-b1a7-785aadf847f3	Welder	\N
9cb562b0-1573-462b-8e98-72c4f5857658	Inspector	\N
a4258f99-1b84-4163-b492-af021c2f1020	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
27f3fde1-cc3e-4d81-bebf-d9ad018fa018	1	111	t	f	9dd3266a-6709-416d-9f8a-06c1850de11b	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N
3eb4829e-4bdd-414b-a4fc-ab18a52ffafd	2	222	t	f	9dd3266a-6709-416d-9f8a-06c1850de11b	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N
43b7b812-4c24-47be-98aa-b914f510dec3	3	333	t	f	6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N
f12f8386-4986-4db1-96f4-bcb487dd159c	4	222	t	f	6830ed46-e1d4-4fe5-b6fa-1b75e2954bfc	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N	\N
6c7c8440-c1cb-4806-b497-e266081d5b36	2	200	t	f	01986884-2d55-4ffa-8ba1-78693d3f2701	d6946e26-f2bb-4ac3-9548-604c54afc215	3fe1ac0d-b19d-4fce-8ae0-499d26046223	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N
850a4518-44db-4ac6-84ae-cf73327510ce	1	100	t	f	c67566f0-bbed-4e7e-b081-07b7cb26961a	f1c0d189-2cb1-4ce8-b295-217f428cc731	3fe1ac0d-b19d-4fce-8ae0-499d26046223	b1104b89-9719-4a67-8597-f39ef90962df	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
d6946e26-f2bb-4ac3-9548-604c54afc215	1	ИТП	\N
f1c0d189-2cb1-4ce8-b295-217f428cc731	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
139d68d7-bd53-49dd-b5ff-c00902c38d31	1823031	Технологический процесс	Ссылка	1823031
279afca5-da2f-4e76-9774-ac6f1f4ce147	1362989	Технологический процесс	Ссылка	1362989
30574670-1410-41a9-b264-0d9dd84800b4	2841119	Технологический процесс	Ссылка	2841119
3ddfe2bf-42e7-46ec-b056-429510a75fe1	3211246	Технологический процесс	Ссылка	3211246
3f215592-3336-437f-aecb-aa8d4c8c0d6f	1003048	Технологический процесс	Ссылка	1003048
4a469f05-9b1a-4102-9fd1-802e6c5d238c	1426226	Технологический процесс	Ссылка	1426226
5375cc83-c9d1-43ee-9903-ec40ed22abeb	2433634	Технологический процесс	Ссылка	2433634
53b26c5f-ff7c-4826-ab3c-c0c8d1355aff	3049271	Технологический процесс	Ссылка	3049271
556b5448-336d-43c6-a9fd-2361fe5f2e05	1124147	Технологический процесс	Ссылка	1124147
55b1e72f-d202-416d-b965-dd71b02dc7ff	3090319	Технологический процесс	Ссылка	3090319
7198f434-91ff-48f7-8306-b30aced639dd	1053809	Технологический процесс	Ссылка	1053809
8c33aed3-bc4e-45f0-8ad1-00d475bc7988	908693	Технологический процесс	Ссылка	908693
96da534f-b08c-4bff-bbff-ac8bcc7c87c8	1402616	Технологический процесс	Ссылка	1402616
989687ae-d225-413e-a018-3812bd4cb71a	3338649	Технологический процесс	Ссылка	3338649
a081d4bb-40db-468b-8e62-f7ded918f4b1	1334123	Технологический процесс	Ссылка	1334123
ab1604ed-f5a0-47c6-ab1a-b5bd91521dcf	1492964	Технологический процесс	Ссылка	1492964
be11f930-c963-453b-8317-50231ef49a57	3239598	Технологический процесс	Ссылка	3239598
c0f3de1b-55c3-4c08-a2e6-f9f7db79821b	1405307	Технологический процесс	Ссылка	1405307
c650a10e-d401-488a-a548-dfd09d44513e	1104641	Технологический процесс	Ссылка	1104641
c8ab47a5-992a-4b9d-91ac-2aeb81d0ccef	3011514	Технологический процесс	Ссылка	3011514
d253f288-ba7f-404f-883f-dc74118c2a36	2915477	Технологический процесс	Ссылка	2915477
d7e7cb3c-0ba9-4a34-82e4-b4cba075b491	3232836	Технологический процесс	Ссылка	3232836
d85af484-6e3a-4997-8d05-b0265a6ded3f	1405914	Технологический процесс	Ссылка	1405914
e6257f28-84de-4c02-91e5-a400686aa30a	3232938	Технологический процесс	Ссылка	3232938
ec8bf9ea-774a-44a4-9056-2a697448fb3c	2822569	Технологический процесс	Ссылка	2822569
f0b7b6ec-f3a2-43fa-bc6b-4925845585cf	526870	Технологический процесс	Ссылка	526870
f2ae0e46-d233-40bb-8bc9-2fda4b799c3f	1119363	Технологический процесс	Ссылка	1119363
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
2c1f1186-511b-41ad-a09d-6d0ff3e98b00	9cb562b0-1573-462b-8e98-72c4f5857658
3aa7ac97-e72c-49d7-8103-4dfea4fe780f	9cb562b0-1573-462b-8e98-72c4f5857658
651d7834-8e2a-4dc1-8103-aea523c02ac1	9cb562b0-1573-462b-8e98-72c4f5857658
08150b2b-17b6-46ab-ad94-a2952dcdf616	cb96c0b2-b603-4f68-9821-5490d6defc80
38e58057-504a-4218-b73e-a45730cee186	cb96c0b2-b603-4f68-9821-5490d6defc80
6846fc85-4711-4ba3-9891-fc44a120254c	cb96c0b2-b603-4f68-9821-5490d6defc80
75a5430b-04e8-45a3-bd58-34f4a1a488e0	cb96c0b2-b603-4f68-9821-5490d6defc80
de8f6cc6-3292-49d1-84ed-d9eaad9576a4	cb96c0b2-b603-4f68-9821-5490d6defc80
df67eae7-52dd-430d-8ab6-533ba9661b23	cb96c0b2-b603-4f68-9821-5490d6defc80
e92568d4-e260-4291-9974-bc2a464ebcab	cb96c0b2-b603-4f68-9821-5490d6defc80
f1628bbd-2da4-4d90-ad74-f8d4fe3e9153	cb96c0b2-b603-4f68-9821-5490d6defc80
02d1855b-011f-428c-8261-c575482a00fa	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
065db55d-69ea-4348-a5e3-a5bfd6183b36	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
3a932b43-0df1-4983-ad7a-7c2790d43942	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
3c6c787a-51ce-465c-8dfb-d865acd29386	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
3f870fc2-e1cb-4032-bc02-da59d68436d4	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
67579464-16bf-4ce9-b1fd-7c174fa76497	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
6d8acd60-d8a6-4b10-87ba-af65ba10efd7	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
72bcbb2c-d241-4af9-9733-7b7e0a4ee724	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
7bc374e2-e9ad-40af-96a4-9f26426623c9	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
7fa4e874-a311-460b-91ad-25186941c316	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
81520891-b539-45d2-bcb8-dbfb9fee4275	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
851fe4b6-2c7f-452b-a67e-290aa107fbcc	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
8619f549-c761-41c4-bd39-a55557ab5041	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
d2305e2e-6cf4-425a-a9b5-d20d5ff8c925	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
d64283be-36d3-4e15-a86d-cd74a5e5ebfb	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
d84b81e7-ab4f-40cf-82a0-8fef9d8e73cb	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
ddc0bb84-fd40-42ac-be41-6f3a4217c54e	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
df404987-f804-4721-ba12-b3281fb0c4d5	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
e09e073b-8087-4289-b802-fb432c8778c5	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
e81d41b7-343d-41da-97b7-b8e7a5585245	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
e877870b-773c-40be-b1b0-4af73333ad42	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
e89c703c-4ba2-4414-9d56-46ca10a1ce3b	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
e905c693-d2d4-4ff9-9c3e-b682960bc07a	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
b4c55a0b-49c5-4d4f-98b8-bc4c9f9774ac	a4258f99-1b84-4163-b492-af021c2f1020
22319a78-a53c-49b8-b6f7-e3b769bde501	cb96c0b2-b603-4f68-9821-5490d6defc80
c45fbaae-5bd4-4dfa-aee9-421222e1759c	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
78534247-9e34-41b3-b7a7-6ee77f9ac610	9cb562b0-1573-462b-8e98-72c4f5857658
d5521fa4-51c0-4cf7-874a-65207ac3ecf0	5289ad32-ad37-4453-ad9c-01c887875f37
b3e40dd5-7dd9-4397-9bea-1470d6d493c7	06cd8d8c-42b2-49b6-b1a7-785aadf847f3
87a3853d-acf5-4bee-b80c-99bcd718c11a	9cb562b0-1573-462b-8e98-72c4f5857658
a12b4339-a96e-4fb0-b91c-66fe90834b32	a4258f99-1b84-4163-b492-af021c2f1020
8dccf184-74ac-4b34-8c63-a7e7c7bc66a2	cb96c0b2-b603-4f68-9821-5490d6defc80
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
2c1f1186-511b-41ad-a09d-6d0ff3e98b00	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	c23cdab2-da82-4305-bf9f-61986f140a96	\N
3aa7ac97-e72c-49d7-8103-4dfea4fe780f	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	c23cdab2-da82-4305-bf9f-61986f140a96	\N
651d7834-8e2a-4dc1-8103-aea523c02ac1	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
08150b2b-17b6-46ab-ad94-a2952dcdf616	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
38e58057-504a-4218-b73e-a45730cee186	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
6846fc85-4711-4ba3-9891-fc44a120254c	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
75a5430b-04e8-45a3-bd58-34f4a1a488e0	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N
de8f6cc6-3292-49d1-84ed-d9eaad9576a4	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
df67eae7-52dd-430d-8ab6-533ba9661b23	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
e92568d4-e260-4291-9974-bc2a464ebcab	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
f1628bbd-2da4-4d90-ad74-f8d4fe3e9153	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N
02d1855b-011f-428c-8261-c575482a00fa	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	22222	f56489e1-c01e-48af-9653-33e1805cf04d	\N
065db55d-69ea-4348-a5e3-a5bfd6183b36	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
3a932b43-0df1-4983-ad7a-7c2790d43942	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
3c6c787a-51ce-465c-8dfb-d865acd29386	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
3f870fc2-e1cb-4032-bc02-da59d68436d4	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N
67579464-16bf-4ce9-b1fd-7c174fa76497	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
6d8acd60-d8a6-4b10-87ba-af65ba10efd7	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
72bcbb2c-d241-4af9-9733-7b7e0a4ee724	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
7bc374e2-e9ad-40af-96a4-9f26426623c9	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
7fa4e874-a311-460b-91ad-25186941c316	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
81520891-b539-45d2-bcb8-dbfb9fee4275	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
851fe4b6-2c7f-452b-a67e-290aa107fbcc	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
8619f549-c761-41c4-bd39-a55557ab5041	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
d2305e2e-6cf4-425a-a9b5-d20d5ff8c925	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	f56489e1-c01e-48af-9653-33e1805cf04d	\N
d64283be-36d3-4e15-a86d-cd74a5e5ebfb	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
d84b81e7-ab4f-40cf-82a0-8fef9d8e73cb	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
ddc0bb84-fd40-42ac-be41-6f3a4217c54e	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
df404987-f804-4721-ba12-b3281fb0c4d5	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
e09e073b-8087-4289-b802-fb432c8778c5	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N
e81d41b7-343d-41da-97b7-b8e7a5585245	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
e877870b-773c-40be-b1b0-4af73333ad42	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	\N
e89c703c-4ba2-4414-9d56-46ca10a1ce3b	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
e905c693-d2d4-4ff9-9c3e-b682960bc07a	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
b4c55a0b-49c5-4d4f-98b8-bc4c9f9774ac	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
22319a78-a53c-49b8-b6f7-e3b769bde501	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
78534247-9e34-41b3-b7a7-6ee77f9ac610	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
c45fbaae-5bd4-4dfa-aee9-421222e1759c	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	b1104b89-9719-4a67-8597-f39ef90962df	\N
d5521fa4-51c0-4cf7-874a-65207ac3ecf0	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$X25+5d05V56bQdzZJJJW5zoqHbTBXevFhaXNQB2gxxMcNupX	\N	\N	\N	\N	\N	\N
b3e40dd5-7dd9-4397-9bea-1470d6d493c7	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$8BkYp3h8xQfdoRFO+rvfrFTpuW8GCwILCKqh6PlAsQjbPPyu	\N	\N	\N	\N	\N	\N
87a3853d-acf5-4bee-b80c-99bcd718c11a	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$ghcTQTI7pmtxo1PTW/ecVVaDdAqzelIy/hopU7++N/LDNjNc	\N	\N	\N	\N	\N	\N
a12b4339-a96e-4fb0-b91c-66fe90834b32	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$Ml09BEZYQfu4hIuJnpVY/zHAgtyzqWBa1YqCl72i9ca9Ah1d	\N	\N	\N	\N	\N	\N
8dccf184-74ac-4b34-8c63-a7e7c7bc66a2	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$S+9HjWBhQLCLK9oILU426imOb1OvPe3BZWqegieWE95IHLvs	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
42cae20d-1e0f-4082-abcf-5b45ecd43a40	2	Заполняющий	80	120	21	25	50	250	d6946e26-f2bb-4ac3-9548-604c54afc215	\N
882c6885-fe42-48e6-9a13-815491c8893d	2	Заполняющий	80	120	21	25	50	250	f1c0d189-2cb1-4ce8-b295-217f428cc731	\N
b7a8d632-f1e2-43f5-8ae7-93169eb0dc5d	1	Корневой	80	120	\N	\N	50	250	d6946e26-f2bb-4ac3-9548-604c54afc215	\N
f7d404c8-8ca1-494e-9592-f033e6f82102	1	Корневой	80	120	22	24	50	250	f1c0d189-2cb1-4ce8-b295-217f428cc731	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
85cc6332-2e02-4363-916b-e2a4b67cd202	2	Заполняющий	100	0.22	0.44	\N	\N	\N	191aafa3-e236-4c16-a394-20ebb8e70cfb	477699ad-279d-440d-83b3-749eaf6867a1	\N
90cbfdb6-04f5-4736-a6aa-207139d23904	1	Корневой	82	0.11	0.68	\N	\N	\N	9dc20000-7f1e-4a08-9abb-186b3cab6146	2ca29b94-ec2d-4e18-9de9-fa5eb4e664db	\N
ceee6b00-aea3-47fb-b56c-1550c5ac8465	1	Корневой	82	0.11	0.68	\N	\N	\N	91cb6f76-3ffa-4df2-bb6c-58642422b5a4	477699ad-279d-440d-83b3-749eaf6867a1	\N
d49d475e-2e3b-4842-b2a1-137e92c1cc55	2	Заполняющий	100	0.22	0.44	\N	\N	\N	bcb36378-8949-41e3-abba-d1c44a90c592	2ca29b94-ec2d-4e18-9de9-fa5eb4e664db	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
04677324-e483-4839-81aa-e110acf001b6	46af55b5-571c-46cd-82b7-19fc8ba5bbaa
1d5249e2-1ab4-43ac-bd3d-4aafcbdf009d	6f57ea37-08b8-48cb-b47f-d72fcbfd06c6
27afaef8-9f0e-4935-8deb-3b759689ebb3	b76bcc9a-9b54-464a-9bd7-629ba87f116a
2a3addc1-c567-4727-80f3-73efc9e23c09	46af55b5-571c-46cd-82b7-19fc8ba5bbaa
4312ae59-5c52-4ca0-8cfb-d6ea4f1892cc	8e605ce0-584e-4840-bacc-f6d7ae414bb3
5b67571a-e7f7-4e35-8f16-d02df86491d3	8e605ce0-584e-4840-bacc-f6d7ae414bb3
634263e5-34ae-4df1-87bb-d8f827a9b4ee	6f57ea37-08b8-48cb-b47f-d72fcbfd06c6
63463a96-1205-4353-89f2-b814f8cdfe9f	46af55b5-571c-46cd-82b7-19fc8ba5bbaa
6d9b9b6f-dc16-47b7-af6b-b99510c40436	46af55b5-571c-46cd-82b7-19fc8ba5bbaa
6db3da0e-ec06-49bc-900d-46f1d935a007	7379920f-9048-4a38-9abc-71e35d340bc3
76ef22e5-5c9e-4260-aab4-5cc7dc159a3c	7379920f-9048-4a38-9abc-71e35d340bc3
92d93cb3-a07c-4299-b7da-4c59db7bc44c	6f905315-a6f8-4061-9e37-4f47c073013f
98d7c801-8066-482c-8e58-a6dcf7fab429	e4484b7d-3d10-4dc5-9a40-392ac42ff698
9fc31859-ee40-412d-b072-2615152bd2a2	947ea4d4-793d-45be-9289-8e09b077dcbd
a00ec66a-0f33-4c53-9335-8770d0ede132	c1f1f5a2-6d55-474e-bd82-1fdbfef89a0d
b399ab37-0037-455d-bcb4-e74afbc2bc47	b76bcc9a-9b54-464a-9bd7-629ba87f116a
bb2ed95c-8cc0-49b7-aa76-386135fbebc3	c1f1f5a2-6d55-474e-bd82-1fdbfef89a0d
c0ab60fa-3a8f-4899-b0b4-7aebec40f6f4	b76bcc9a-9b54-464a-9bd7-629ba87f116a
c496eaa3-3592-4239-8865-0020d4544e8f	c1f1f5a2-6d55-474e-bd82-1fdbfef89a0d
d8793548-2dad-427d-88a1-4b59669044a0	b76bcc9a-9b54-464a-9bd7-629ba87f116a
e95e56be-8134-4b46-bd65-2f5ef231a9de	947ea4d4-793d-45be-9289-8e09b077dcbd
f7dc034d-b434-4145-b48b-233274bc26ec	b76bcc9a-9b54-464a-9bd7-629ba87f116a
ffab9b4d-ea67-4b9d-a189-67161bcf75be	6f905315-a6f8-4061-9e37-4f47c073013f
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
04677324-e483-4839-81aa-e110acf001b6	7fa4e874-a311-460b-91ad-25186941c316	\N	151861
1d5249e2-1ab4-43ac-bd3d-4aafcbdf009d	ddc0bb84-fd40-42ac-be41-6f3a4217c54e	\N	149921
27afaef8-9f0e-4935-8deb-3b759689ebb3	67579464-16bf-4ce9-b1fd-7c174fa76497	\N	156298
2a3addc1-c567-4727-80f3-73efc9e23c09	065db55d-69ea-4348-a5e3-a5bfd6183b36	\N	152441
4312ae59-5c52-4ca0-8cfb-d6ea4f1892cc	3c6c787a-51ce-465c-8dfb-d865acd29386	4b1064e5-b20c-4cf9-b9dc-77c9ff55a47b	120756
5b67571a-e7f7-4e35-8f16-d02df86491d3	6d8acd60-d8a6-4b10-87ba-af65ba10efd7	ee5e3ad9-3c06-4d6e-9ddb-a359d6deed6f	146325
634263e5-34ae-4df1-87bb-d8f827a9b4ee	e89c703c-4ba2-4414-9d56-46ca10a1ce3b	\N	150402
63463a96-1205-4353-89f2-b814f8cdfe9f	df404987-f804-4721-ba12-b3281fb0c4d5	\N	153274
6d9b9b6f-dc16-47b7-af6b-b99510c40436	d64283be-36d3-4e15-a86d-cd74a5e5ebfb	\N	155288
6db3da0e-ec06-49bc-900d-46f1d935a007	d2305e2e-6cf4-425a-a9b5-d20d5ff8c925	3001f30c-dbc0-4ec9-925d-7cff266ecaf2	121267
76ef22e5-5c9e-4260-aab4-5cc7dc159a3c	72bcbb2c-d241-4af9-9733-7b7e0a4ee724	ee5e3ad9-3c06-4d6e-9ddb-a359d6deed6f	117390
92d93cb3-a07c-4299-b7da-4c59db7bc44c	81520891-b539-45d2-bcb8-dbfb9fee4275	5b21d052-1fbb-4e17-b605-b57dddbd36bc	132695
98d7c801-8066-482c-8e58-a6dcf7fab429	02d1855b-011f-428c-8261-c575482a00fa	d41d2165-169a-4e9f-a34e-73cbd99d62b7	\N
9fc31859-ee40-412d-b072-2615152bd2a2	3a932b43-0df1-4983-ad7a-7c2790d43942	38b026a9-5775-4ae6-8192-7c59ba6b884f	150882
a00ec66a-0f33-4c53-9335-8770d0ede132	3f870fc2-e1cb-4032-bc02-da59d68436d4	\N	152444
b399ab37-0037-455d-bcb4-e74afbc2bc47	e81d41b7-343d-41da-97b7-b8e7a5585245	\N	121537
bb2ed95c-8cc0-49b7-aa76-386135fbebc3	e09e073b-8087-4289-b802-fb432c8778c5	\N	156278
c0ab60fa-3a8f-4899-b0b4-7aebec40f6f4	e905c693-d2d4-4ff9-9c3e-b682960bc07a	\N	147329
c496eaa3-3592-4239-8865-0020d4544e8f	e877870b-773c-40be-b1b0-4af73333ad42	\N	152207
d8793548-2dad-427d-88a1-4b59669044a0	7bc374e2-e9ad-40af-96a4-9f26426623c9	\N	152365
e95e56be-8134-4b46-bd65-2f5ef231a9de	8619f549-c761-41c4-bd39-a55557ab5041	f28b5e0a-4066-4813-afd1-03d67de1bef8	151299
f7dc034d-b434-4145-b48b-233274bc26ec	d84b81e7-ab4f-40cf-82a0-8fef9d8e73cb	\N	121538
ffab9b4d-ea67-4b9d-a189-67161bcf75be	851fe4b6-2c7f-452b-a67e-290aa107fbcc	d41d2165-169a-4e9f-a34e-73cbd99d62b7	145092
0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	c45fbaae-5bd4-4dfa-aee9-421222e1759c	\N	\N
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

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
46af55b5-571c-46cd-82b7-19fc8ba5bbaa	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	162
6f57ea37-08b8-48cb-b47f-d72fcbfd06c6	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	146
6f905315-a6f8-4061-9e37-4f47c073013f	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	535
7379920f-9048-4a38-9abc-71e35d340bc3	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	511
8e605ce0-584e-4840-bacc-f6d7ae414bb3	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	508
947ea4d4-793d-45be-9289-8e09b077dcbd	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	499
b76bcc9a-9b54-464a-9bd7-629ba87f116a	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	\N	8008336102-130
c1f1f5a2-6d55-474e-bd82-1fdbfef89a0d	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	114
e4484b7d-3d10-4dc5-9a40-392ac42ff698	11111	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	543191d8-d63a-483a-b3b6-e5f30d9a4fb2	\N
d6f3979e-f2bf-4e28-913f-434772f18a63	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
191aafa3-e236-4c16-a394-20ebb8e70cfb	2023-02-19 14:54:42.755402	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	d6f3979e-f2bf-4e28-913f-434772f18a63	0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	ce474846-a609-4125-b742-5acaae90909f	\N
91cb6f76-3ffa-4df2-bb6c-58642422b5a4	2023-02-19 14:54:42.755295	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	d6f3979e-f2bf-4e28-913f-434772f18a63	0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	ce474846-a609-4125-b742-5acaae90909f	\N
9dc20000-7f1e-4a08-9abb-186b3cab6146	2023-02-19 14:54:42.756366	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	d6f3979e-f2bf-4e28-913f-434772f18a63	0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	ce474846-a609-4125-b742-5acaae90909f	\N
bcb36378-8949-41e3-abba-d1c44a90c592	2023-02-19 14:54:42.756366	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	d6f3979e-f2bf-4e28-913f-434772f18a63	0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	ce474846-a609-4125-b742-5acaae90909f	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
2ca29b94-ec2d-4e18-9de9-fa5eb4e664db	1	1	f	2023-02-19 14:54:42.756365	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	6c7c8440-c1cb-4806-b497-e266081d5b36	0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	ce474846-a609-4125-b742-5acaae90909f	3fe1ac0d-b19d-4fce-8ae0-499d26046223	\N
477699ad-279d-440d-83b3-749eaf6867a1	2	1	f	2023-02-19 14:54:42.753833	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	850a4518-44db-4ac6-84ae-cf73327510ce	0cc7f155-f1d2-46ba-99a1-0cd6865e6d19	ce474846-a609-4125-b742-5acaae90909f	3fe1ac0d-b19d-4fce-8ae0-499d26046223	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
2f0b6eb5-8f0f-4a31-bf50-6f2dfb258168	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	b56ba7ae-01f3-438e-ac83-6186a1d0a6a8	\N
6191af55-7f66-4645-9720-7399a8764b26	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	b56ba7ae-01f3-438e-ac83-6186a1d0a6a8	\N
6400dca9-191e-48c9-8fed-3de757239577	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	b56ba7ae-01f3-438e-ac83-6186a1d0a6a8	\N
4132b397-33c4-4835-bae5-6a41ab2d0f0c	1	12:10:00	13:10:00	13:20:00	13:50:00	aca6d734-ba0a-4b08-af55-20ab1ef753b6	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
20156550-2029-48b7-9acc-d6432de9c5ba	2130	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	2130
23f920ce-c3b7-4b68-986e-cd0e5ddc4910	1400	\N	b1104b89-9719-4a67-8597-f39ef90962df	1400
2f793cfd-b6f6-40aa-96a1-216e417331b7	2050	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	2050
3001f30c-dbc0-4ec9-925d-7cff266ecaf2	3600	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3600
33023f51-8fb0-4890-84a4-47facfe6d7e6	1390	\N	b1104b89-9719-4a67-8597-f39ef90962df	1390
38b026a9-5775-4ae6-8192-7c59ba6b884f	3690	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3690
4b1064e5-b20c-4cf9-b9dc-77c9ff55a47b	3520	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3520
5b21d052-1fbb-4e17-b605-b57dddbd36bc	3500	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3500
6532980f-a0b8-45b5-9b90-c9c4534bdae6	1550	\N	b1104b89-9719-4a67-8597-f39ef90962df	1550
88717335-3653-4018-9e2e-4a87c3725a27	1360	\N	b1104b89-9719-4a67-8597-f39ef90962df	1360
9cf09b6e-b284-499f-a19b-957031f25849	1270	\N	b1104b89-9719-4a67-8597-f39ef90962df	1270
ac22cc64-6e03-4cbd-85f3-1a78d9f6d9bf	2150	\N	2e7fd37e-4bfe-4cb8-866c-b0d3ecc31cc0	2150
c51bc8e3-9c81-4220-af9f-031ee53321df	1260	\N	b1104b89-9719-4a67-8597-f39ef90962df	1260
d1661cd2-b0da-44ea-a475-53ceac0c9377	1280	\N	b1104b89-9719-4a67-8597-f39ef90962df	1280
d41d2165-169a-4e9f-a34e-73cbd99d62b7	3590	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3590
ee5e3ad9-3c06-4d6e-9ddb-a359d6deed6f	3610	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3610
f0ac007e-72b0-46dc-8251-d12b746f4b7f	1380	\N	b1104b89-9719-4a67-8597-f39ef90962df	1380
f28b5e0a-4066-4813-afd1-03d67de1bef8	3650	\N	f56489e1-c01e-48af-9653-33e1805cf04d	3650
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
02561377-ee6d-478e-bf99-b3c80122a07c	Цех 50	50	050
c32fbe73-86c0-4dae-9ef1-8cc7a4aca749	Цех 480	480	480
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

