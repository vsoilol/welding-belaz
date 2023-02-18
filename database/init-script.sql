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
    "WelderId" uuid NOT NULL,
    "MasterId" uuid NOT NULL,
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
9a2e63bc-b660-452a-ba5b-c20d9d8c8185	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
a7bc7aac-918e-407d-b2be-1b6dfc6f791d	828daaad-5dff-470d-b132-71439d6f7243	1585b2cd-cb61-4ae4-8015-62221d766e6e	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
09921abe-9d70-4c4e-aa6c-f12aafc6cc23	1	10	t	9a2e63bc-b660-452a-ba5b-c20d9d8c8185	\N
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
10d509d2-334d-4005-bcfb-67be6a3553f4	Работа с управляющей программой	\N
17a05eef-dea4-4e60-9e44-a2089633ac37	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
38b19f94-6005-40b3-8e64-fbb422eed22c	Установка, выверка, снятие детали	\N
3f4349f2-dc6f-4c9c-b2cc-d4809150d33f	Неявка оператора (б/лист, отпуск, и пр.)	\N
4e4a1466-0fb0-4f07-be4e-fd671fdf3abf	Отсутствие энергоносителей	\N
591394b8-7089-44c2-a5c2-3b2d5ddf0ba9	Отсутствие материала, заготовок, деталей	\N
64fde87f-4f05-461b-89b6-e65834097c1d	Контроль на рабочем месте	\N
6b111ced-590a-4778-bf20-6863d4f00385	Плановый ремонт централизованными службами	\N
6f12ceb6-41be-4bc8-a22b-cff783afca81	Отсутствие сотрудника ОТК	\N
7273a5a6-c027-4164-ac87-124d1e1907c1	Обед	\N
798c7f15-eff5-49fa-b4ad-89df03056c1a	Сборочные операции	\N
7ab47749-734f-4789-b615-63dbb33183bf	Ознакомление с работой, документацией, инструктаж	\N
7bb1aebb-1364-4a53-869d-2ccfb3763931	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
8e683222-077c-4506-a9db-5495f1c20172	Отсутствие крана, транспорта	\N
964ab699-75d2-4c8c-8050-eefc8e649605	Работа по карте несоответствий	\N
9c32d115-e995-4061-a13c-f354861873a0	Отсутствие конструктора, технолога или ожидание его решения	\N
9d124503-1b77-4350-b7e0-36a79a06dead	Нерабочее время по графику согласно сменности	\N
ab231318-5a4d-4a7f-95d7-1556786183ef	Праздники и выходные	\N
af34fe97-4932-4ebe-85b6-0a3f5c9c48a7	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
b3141510-7126-4404-a87d-3d634c17c729	Установка, выверка, снятие детали	\N
c442aea9-0310-4a5a-9d6a-f1b6f1bc563a	Естественные надобности	\N
e17e42e6-dffa-4c18-a46e-857c118a01b5	Отсутствие заданий	\N
e39f65eb-a0ee-43b9-9b93-27021208cbf7	Изменение режимов, смена инструмента, приспособления	\N
ee70fb36-cf05-4129-8e47-06317e9cc425	Отсутствие оператора в связи с необеспеченностью	\N
f4274a8d-d103-46dc-bfc7-6926e16e834c	Аварийный ремонт централизованными службами	\N
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
64fdb006-4480-4aa2-b589-9ce134c7ef9c	0dc9aa28-ba83-411d-85be-0a9fac09bcd6	256467
700163e5-39e5-433e-a4ef-b8e5b98f54e9	61005dde-76d2-401e-beac-92458b0068f1	249550
7958134d-a224-4239-96e5-a32d87f47aca	b86d358a-96b8-4982-a1b0-583a77dbb651	251534
c0970762-d135-488b-85f5-c8555be017e1	f2314696-7e46-47c9-b77c-c83f6711cf70	235565
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
134f8bcf-ee85-4291-8206-3abf97f7cd13	49c5332a-e86b-46a6-9e9d-8387d719e4a5	614962
2dcae58b-e587-4b7a-b73b-b33ee8a3b1d4	daa97c77-2fe3-435e-9ff9-c2786baf67c2	617215
4db75bf4-4034-458e-be53-0bd8aaeb1274	9b12ede4-e780-474e-912c-720f6d8256d4	643759
87517e26-4348-464d-89a8-adc36bcbb497	a76f6394-b9b4-4de4-9e2a-b87395672ced	612000
ad553dfa-11b8-4e32-8a77-1bf11cb75756	f25f3165-9d60-45a2-a0d0-a498205b6e74	613668
ecdbcb55-682c-4c8a-b65f-c3669e253911	22d526ff-73a1-401f-a3ed-2554f7cbdde7	610422
f4ac189e-a7af-4150-80a7-c074b0f55040	c3fc1d3a-248b-41a3-bcc8-b4bf347164e6	614208
380297be-2628-41f1-8c1c-4621df86e49d	40441185-5dd1-4938-949b-3c3f10831f53	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
51bb9b0c-c0b4-468e-989b-a4efab9588b2	1	Пост 1	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N
832580bc-4539-476d-9021-b0ca2548e459	2	Пост 2	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
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
a0935017-8960-4b4c-9299-3f288669be05	0b91fe52-6f57-4708-ac55-746fa84495d6
8a0b1eea-3be9-45bd-bfe1-c2de57c3a83c	160ccc52-66d0-4f1e-b2eb-9322e71ca446
7dae6dfa-5daa-4cf7-b009-42a26c06ba76	29f9e434-d315-4977-8aef-d48b90bce19e
c4446a65-d0ba-4959-8887-721231c1f7f1	37ee5726-9fae-411c-863a-a91fb3a64433
bc700684-36fb-4257-a9db-309050c7213d	55795796-c31f-46de-a3d9-9095fc336d2f
bc700684-36fb-4257-a9db-309050c7213d	64f3109c-3238-4dd2-8d1b-37cfaf9380b1
6f15934e-0a2f-4e2b-8e7a-d4e56ce0dc52	6797e211-bc42-4a76-a28c-c3b923609888
c4446a65-d0ba-4959-8887-721231c1f7f1	6f15934e-0a2f-4e2b-8e7a-d4e56ce0dc52
ea85841b-a02c-46c2-9432-80546620d853	702a1195-d9d7-4930-a61c-7920f56c6458
7dae6dfa-5daa-4cf7-b009-42a26c06ba76	78f3cd36-64d7-4d66-ba55-6b660702ad96
c4446a65-d0ba-4959-8887-721231c1f7f1	7ada9d98-8584-4467-83b1-5c3a072fa60b
c4446a65-d0ba-4959-8887-721231c1f7f1	7dae6dfa-5daa-4cf7-b009-42a26c06ba76
8a0b1eea-3be9-45bd-bfe1-c2de57c3a83c	819a2b8a-e75d-4b5c-ad9d-854c97dafa3e
e9d13d42-88a6-4037-bef3-564fadcec4f6	8a0b1eea-3be9-45bd-bfe1-c2de57c3a83c
e9d13d42-88a6-4037-bef3-564fadcec4f6	ad0b5da2-81cd-4eed-865c-7fa69925917e
a0935017-8960-4b4c-9299-3f288669be05	bc700684-36fb-4257-a9db-309050c7213d
0b91fe52-6f57-4708-ac55-746fa84495d6	cd9f159c-9f86-4117-a8dd-2e15d01ddc91
a0935017-8960-4b4c-9299-3f288669be05	d7784895-b9ed-47fd-8bd4-4b2460636b63
ea85841b-a02c-46c2-9432-80546620d853	e34b53ed-b04f-48e7-acb7-a75b77368c35
6f15934e-0a2f-4e2b-8e7a-d4e56ce0dc52	e67c670a-de63-4060-8857-296dc76b1ccf
e9d13d42-88a6-4037-bef3-564fadcec4f6	ea85841b-a02c-46c2-9432-80546620d853
0b91fe52-6f57-4708-ac55-746fa84495d6	ede8f210-8479-4f73-bc71-ac0eb1222f03
a0935017-8960-4b4c-9299-3f288669be05	fed6634d-da62-465e-be04-46314686e83c
e9d13d42-88a6-4037-bef3-564fadcec4f6	fef4a0bb-b7b4-427d-8793-5d38382ebeb4
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
284b1e36-e5ce-472b-9790-33235bcd54fd	Сборка, сварка рам к/с г/п 120-130 т.	6	1585b2cd-cb61-4ae4-8015-62221d766e6e	06
ba38eca4-9101-4d09-87b5-b10d7a856834	Сборка, сварка узл. и рам к/с г/п 120-220т	4	1585b2cd-cb61-4ae4-8015-62221d766e6e	04
da65bbc1-c233-43ed-bfc2-10c965a04364	Производственный участок 5	5	7f03af8a-57f4-4e26-a840-f3f71c3e1239	05
f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	Сборка, сварка мостов	1	1585b2cd-cb61-4ae4-8015-62221d766e6e	01
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0b91fe52-6f57-4708-ac55-746fa84495d6	Труба картера заднего моста	75580-2401010-01	t	2	c05335ff-878f-48c1-bb83-a9a531499996	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536386240
160ccc52-66d0-4f1e-b2eb-9322e71ca446	Распорка	7521-3932688	t	3	fd52d87b-a3f1-413b-a344-b7799fab2792	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536273606
29f9e434-d315-4977-8aef-d48b90bce19e	Кронштейн	75304-1001253	t	3	a783ba2c-7bd2-40b7-89bd-23c2161bc55b	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536248708
37ee5726-9fae-411c-863a-a91fb3a64433	Кронштейн	75211-1018162	t	3	d41c5f58-d4bb-4fc9-bf49-6835d4437a9e	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536270344
55795796-c31f-46de-a3d9-9095fc336d2f	Кольцо	75580-2401227	t	3	ee79a0ee-76de-4863-afa9-45ee997345d1	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536384312
64f3109c-3238-4dd2-8d1b-37cfaf9380b1	Втулка	75303-2128438	t	3	9ba6344a-2810-428c-8ef7-7e00e21f81b0	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536248270
6797e211-bc42-4a76-a28c-c3b923609888	Кронштейн	75310-1183102	t	3	88dd2c77-583d-4684-8423-56dc09071304	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536267484
6f15934e-0a2f-4e2b-8e7a-d4e56ce0dc52	Кронштейн	75310-1183100	t	2	171746b0-fd9d-492c-becf-91d2da8f023e	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536267493
702a1195-d9d7-4930-a61c-7920f56c6458	Пластина	75132-2401106	t	3	c3d1b731-6fd3-4bdb-a679-a979546fccd3	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536444153
78f3cd36-64d7-4d66-ba55-6b660702ad96	Кронштейн	75303-1001293	t	3	3a080765-86fa-400d-934a-2e72e70a3410	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536247228
7ada9d98-8584-4467-83b1-5c3a072fa60b	Накладка	549Б-1015842	t	3	57de4f00-64e2-4247-be91-42d604b1206c	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536196288
7dae6dfa-5daa-4cf7-b009-42a26c06ba76	Кронштейн амортизатора левый	75304-1001251	t	2	1c969ff2-1d78-4e6f-866c-574310032241	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536248707
819a2b8a-e75d-4b5c-ad9d-854c97dafa3e	Проушина	7521-2401224	t	3	3a103080-665c-4b63-abb4-09929657643e	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536274170
8a0b1eea-3be9-45bd-bfe1-c2de57c3a83c	Кронштейн	7521-2401220	t	2	5e8e29bf-5901-4001-bdd5-87901ebcac98	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536273956
a0935017-8960-4b4c-9299-3f288669be05	Картер заднего моста	75580-2401006	t	1	22cc4fee-76e3-45f2-8c94-d453326995a8	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536384294
ad0b5da2-81cd-4eed-865c-7fa69925917e	Панель	75132-2105522	t	3	d9da3775-eaf6-4346-9b06-03096ba0bb49	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536417730
bc700684-36fb-4257-a9db-309050c7213d	Картер заднего моста	75580-2401008	t	2	5c11efd8-ec16-4d9a-888f-e9448c99e2a0	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536384295
c4446a65-d0ba-4959-8887-721231c1f7f1	Рама	75313-2800010-20	t	1	67bd053e-f9f3-4393-b170-622386ea705a	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536287819
cd9f159c-9f86-4117-a8dd-2e15d01ddc91	Фланец картера	75580-2401114-11	t	3	9e112261-2db0-49f2-a6b7-9044fec62724	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536386265
e67c670a-de63-4060-8857-296dc76b1ccf	Кронштейн	75310-1183106	t	3	7402877f-273a-42b3-a2c7-9f2ec3fed902	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N	\N	4536267485
e9d13d42-88a6-4037-bef3-564fadcec4f6	Картер заднего моста	75132-2401006-50	t	1	70c0348a-8001-4527-bb20-1bf7807cfd2f	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536467567
ea85841b-a02c-46c2-9432-80546620d853	Картер заднего моста	75132-2401008-50	t	2	93cdec38-a622-4577-828b-968d63e69b68	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536467565
ede8f210-8479-4f73-bc71-ac0eb1222f03	Труба картера	75580-2401132-10	t	3	ca175fd8-9598-4a4f-8822-fcd099aa9c3e	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536386250
fed6634d-da62-465e-be04-46314686e83c	Кронштейн	75580-2113192	t	3	9b8c1107-4f85-4e56-aebb-335141c0a77b	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536384314
fef4a0bb-b7b4-427d-8793-5d38382ebeb4	Кронштейн	75131-2113296-10	t	3	d467512b-ead6-486d-885b-38659a3b50d5	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N	\N	4536461620
d7784895-b9ed-47fd-8bd4-4b2460636b63	Панель	75580-2105522	t	3	a93d39a6-bc2d-472c-a4a0-ef05a9268330	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	380297be-2628-41f1-8c1c-4621df86e49d	\N	\N	4536384399
e34b53ed-b04f-48e7-acb7-a75b77368c35	Опора	75211-2401122	t	3	0d4bd411-2360-4743-a959-962a278772ec	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	380297be-2628-41f1-8c1c-4621df86e49d	\N	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
373bf586-8791-4754-b5bd-94a59c0325bf	Admin	\N
2c661c15-145e-414f-a8f9-cd12af0c8652	Master	\N
62174d94-8eb2-45dd-8c4d-940a8048d626	Welder	\N
a2547065-1222-495a-8945-1006246abb3e	Inspector	\N
6d1abca8-ada2-44a6-89bd-71620ac22fa7	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
1578dd8f-ba69-438c-a17a-16d4300654eb	2	222	t	f	e9d13d42-88a6-4037-bef3-564fadcec4f6	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N
6470b4eb-0f4d-4620-95e4-a4004f78610e	1	111	t	f	e9d13d42-88a6-4037-bef3-564fadcec4f6	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N
749f7acc-d2b2-40e6-8622-9903fc351fad	3	333	t	f	c4446a65-d0ba-4959-8887-721231c1f7f1	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N
b492e287-5567-4a5a-8bb7-96a2492ab953	4	222	t	f	c4446a65-d0ba-4959-8887-721231c1f7f1	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N	\N
b4667a81-2c11-4ece-8267-e21173ddd6f9	1	100	t	f	e34b53ed-b04f-48e7-acb7-a75b77368c35	ff75e2bd-ea2c-41bd-ab79-894160be061a	c0970762-d135-488b-85f5-c8555be017e1	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N
dbffbe62-a695-4582-863c-bdde9105764b	2	200	t	f	d7784895-b9ed-47fd-8bd4-4b2460636b63	e2093830-4c73-4885-8fec-bdeadd4ae94b	c0970762-d135-488b-85f5-c8555be017e1	ba38eca4-9101-4d09-87b5-b10d7a856834	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
e2093830-4c73-4885-8fec-bdeadd4ae94b	1	ИТП	\N
ff75e2bd-ea2c-41bd-ab79-894160be061a	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
0d4bd411-2360-4743-a959-962a278772ec	3211246	Технологический процесс	Ссылка	3211246
171746b0-fd9d-492c-becf-91d2da8f023e	1823031	Технологический процесс	Ссылка	1823031
1c969ff2-1d78-4e6f-866c-574310032241	1334123	Технологический процесс	Ссылка	1334123
22cc4fee-76e3-45f2-8c94-d453326995a8	2433634	Технологический процесс	Ссылка	2433634
3a080765-86fa-400d-934a-2e72e70a3410	3049271	Технологический процесс	Ссылка	3049271
3a103080-665c-4b63-abb4-09929657643e	1124147	Технологический процесс	Ссылка	1124147
57de4f00-64e2-4247-be91-42d604b1206c	1426226	Технологический процесс	Ссылка	1426226
5c11efd8-ec16-4d9a-888f-e9448c99e2a0	3232938	Технологический процесс	Ссылка	3232938
5e8e29bf-5901-4001-bdd5-87901ebcac98	1362989	Технологический процесс	Ссылка	1362989
67bd053e-f9f3-4393-b170-622386ea705a	3239598	Технологический процесс	Ссылка	3239598
70c0348a-8001-4527-bb20-1bf7807cfd2f	3090319	Технологический процесс	Ссылка	3090319
7402877f-273a-42b3-a2c7-9f2ec3fed902	1119363	Технологический процесс	Ссылка	1119363
88dd2c77-583d-4684-8423-56dc09071304	1104641	Технологический процесс	Ссылка	1104641
93cdec38-a622-4577-828b-968d63e69b68	3232836	Технологический процесс	Ссылка	3232836
9b8c1107-4f85-4e56-aebb-335141c0a77b	1405914	Технологический процесс	Ссылка	1405914
9ba6344a-2810-428c-8ef7-7e00e21f81b0	3011514	Технологический процесс	Ссылка	3011514
9e112261-2db0-49f2-a6b7-9044fec62724	3338649	Технологический процесс	Ссылка	3338649
a783ba2c-7bd2-40b7-89bd-23c2161bc55b	1492964	Технологический процесс	Ссылка	1492964
a93d39a6-bc2d-472c-a4a0-ef05a9268330	1405307	Технологический процесс	Ссылка	1405307
c05335ff-878f-48c1-bb83-a9a531499996	2915477	Технологический процесс	Ссылка	2915477
c3d1b731-6fd3-4bdb-a679-a979546fccd3	1003048	Технологический процесс	Ссылка	1003048
ca175fd8-9598-4a4f-8822-fcd099aa9c3e	2822569	Технологический процесс	Ссылка	2822569
d41c5f58-d4bb-4fc9-bf49-6835d4437a9e	2841119	Технологический процесс	Ссылка	2841119
d467512b-ead6-486d-885b-38659a3b50d5	526870	Технологический процесс	Ссылка	526870
d9da3775-eaf6-4346-9b06-03096ba0bb49	1053809	Технологический процесс	Ссылка	1053809
ee79a0ee-76de-4863-afa9-45ee997345d1	1402616	Технологический процесс	Ссылка	1402616
fd52d87b-a3f1-413b-a344-b7799fab2792	908693	Технологический процесс	Ссылка	908693
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
0dc9aa28-ba83-411d-85be-0a9fac09bcd6	a2547065-1222-495a-8945-1006246abb3e
61005dde-76d2-401e-beac-92458b0068f1	a2547065-1222-495a-8945-1006246abb3e
b86d358a-96b8-4982-a1b0-583a77dbb651	a2547065-1222-495a-8945-1006246abb3e
22d526ff-73a1-401f-a3ed-2554f7cbdde7	2c661c15-145e-414f-a8f9-cd12af0c8652
49c5332a-e86b-46a6-9e9d-8387d719e4a5	2c661c15-145e-414f-a8f9-cd12af0c8652
9b12ede4-e780-474e-912c-720f6d8256d4	2c661c15-145e-414f-a8f9-cd12af0c8652
a76f6394-b9b4-4de4-9e2a-b87395672ced	2c661c15-145e-414f-a8f9-cd12af0c8652
c3fc1d3a-248b-41a3-bcc8-b4bf347164e6	2c661c15-145e-414f-a8f9-cd12af0c8652
daa97c77-2fe3-435e-9ff9-c2786baf67c2	2c661c15-145e-414f-a8f9-cd12af0c8652
f25f3165-9d60-45a2-a0d0-a498205b6e74	2c661c15-145e-414f-a8f9-cd12af0c8652
21dc23c9-7e0d-4503-a588-ee1471652af4	62174d94-8eb2-45dd-8c4d-940a8048d626
265ab7f1-1af7-48bc-9675-e66501e2c6a3	62174d94-8eb2-45dd-8c4d-940a8048d626
30baabda-af42-4b8b-8e3b-1075c6e205db	62174d94-8eb2-45dd-8c4d-940a8048d626
3f03e580-0b4e-43e7-a51b-bf336d2e54bd	62174d94-8eb2-45dd-8c4d-940a8048d626
46821ef2-86d9-4364-8b25-c92c74db76f2	62174d94-8eb2-45dd-8c4d-940a8048d626
4a6569ae-a993-40c5-bd34-906e0857bcaa	62174d94-8eb2-45dd-8c4d-940a8048d626
5db09588-5d18-40b8-84b6-c762de10ffa2	62174d94-8eb2-45dd-8c4d-940a8048d626
6e965ec7-6a24-4c9f-8b55-8a8c8052b1bb	62174d94-8eb2-45dd-8c4d-940a8048d626
6f0998a9-aa96-4519-8bee-c23db08678b0	62174d94-8eb2-45dd-8c4d-940a8048d626
7274791b-4209-46c8-9974-ced091f08165	62174d94-8eb2-45dd-8c4d-940a8048d626
7468086a-ebc2-47ba-b6e6-390e4c8ef91a	62174d94-8eb2-45dd-8c4d-940a8048d626
75139b22-2e47-4ca4-bd7d-a3bb7dc04a3a	62174d94-8eb2-45dd-8c4d-940a8048d626
783b45e5-52a7-486d-adfd-a6f54c42839d	62174d94-8eb2-45dd-8c4d-940a8048d626
7c522bb5-ca7a-4f19-a5d1-982253f5126b	62174d94-8eb2-45dd-8c4d-940a8048d626
8f3184b3-5231-44ef-9a08-d6f4af6e252c	62174d94-8eb2-45dd-8c4d-940a8048d626
9d1976ea-0597-4b6d-be95-b42fd5458f49	62174d94-8eb2-45dd-8c4d-940a8048d626
a4134d4f-d0b2-45b1-bd37-7ab9217eebcd	62174d94-8eb2-45dd-8c4d-940a8048d626
b4011034-798e-4189-a6fe-aaf94859ca49	62174d94-8eb2-45dd-8c4d-940a8048d626
b8b8128d-a5e4-4e32-909d-de5641d5cb70	62174d94-8eb2-45dd-8c4d-940a8048d626
bad5f54c-850d-4929-8185-a39e3fc130d6	62174d94-8eb2-45dd-8c4d-940a8048d626
bfa4e8a7-8689-423b-a185-eee3acc4eb34	62174d94-8eb2-45dd-8c4d-940a8048d626
d4c725c3-c2bb-4f13-b508-bbe0a18c3b95	62174d94-8eb2-45dd-8c4d-940a8048d626
e27aba41-d6e4-4d14-95ff-839aa4de77f1	62174d94-8eb2-45dd-8c4d-940a8048d626
828daaad-5dff-470d-b132-71439d6f7243	6d1abca8-ada2-44a6-89bd-71620ac22fa7
40441185-5dd1-4938-949b-3c3f10831f53	2c661c15-145e-414f-a8f9-cd12af0c8652
7a943836-bf2f-43a8-9f8e-034bd3f4780d	62174d94-8eb2-45dd-8c4d-940a8048d626
f2314696-7e46-47c9-b77c-c83f6711cf70	a2547065-1222-495a-8945-1006246abb3e
4b70ba58-1300-4245-a0ca-3495ad614484	373bf586-8791-4754-b5bd-94a59c0325bf
137ab459-020a-4e5e-bf73-b4202194f678	62174d94-8eb2-45dd-8c4d-940a8048d626
aa2d2f6c-415e-4d24-8c70-d0078dd7bfa1	a2547065-1222-495a-8945-1006246abb3e
11c763eb-d825-424c-a7c2-0faf4bf147a5	6d1abca8-ada2-44a6-89bd-71620ac22fa7
8f3d3c3c-3779-4034-adb2-99b8e315e4d4	2c661c15-145e-414f-a8f9-cd12af0c8652
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
0dc9aa28-ba83-411d-85be-0a9fac09bcd6	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	da65bbc1-c233-43ed-bfc2-10c965a04364	\N
61005dde-76d2-401e-beac-92458b0068f1	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
b86d358a-96b8-4982-a1b0-583a77dbb651	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	da65bbc1-c233-43ed-bfc2-10c965a04364	\N
22d526ff-73a1-401f-a3ed-2554f7cbdde7	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
49c5332a-e86b-46a6-9e9d-8387d719e4a5	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
9b12ede4-e780-474e-912c-720f6d8256d4	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
a76f6394-b9b4-4de4-9e2a-b87395672ced	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
c3fc1d3a-248b-41a3-bcc8-b4bf347164e6	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N
daa97c77-2fe3-435e-9ff9-c2786baf67c2	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N
f25f3165-9d60-45a2-a0d0-a498205b6e74	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
21dc23c9-7e0d-4503-a588-ee1471652af4	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
265ab7f1-1af7-48bc-9675-e66501e2c6a3	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
30baabda-af42-4b8b-8e3b-1075c6e205db	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
3f03e580-0b4e-43e7-a51b-bf336d2e54bd	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
46821ef2-86d9-4364-8b25-c92c74db76f2	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
4a6569ae-a993-40c5-bd34-906e0857bcaa	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
5db09588-5d18-40b8-84b6-c762de10ffa2	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
6e965ec7-6a24-4c9f-8b55-8a8c8052b1bb	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	22222	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
6f0998a9-aa96-4519-8bee-c23db08678b0	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
7274791b-4209-46c8-9974-ced091f08165	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
7468086a-ebc2-47ba-b6e6-390e4c8ef91a	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N
75139b22-2e47-4ca4-bd7d-a3bb7dc04a3a	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
783b45e5-52a7-486d-adfd-a6f54c42839d	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
7c522bb5-ca7a-4f19-a5d1-982253f5126b	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
8f3184b3-5231-44ef-9a08-d6f4af6e252c	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N
9d1976ea-0597-4b6d-be95-b42fd5458f49	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
a4134d4f-d0b2-45b1-bd37-7ab9217eebcd	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	\N
b4011034-798e-4189-a6fe-aaf94859ca49	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
b8b8128d-a5e4-4e32-909d-de5641d5cb70	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
bad5f54c-850d-4929-8185-a39e3fc130d6	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	\N
bfa4e8a7-8689-423b-a185-eee3acc4eb34	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
d4c725c3-c2bb-4f13-b508-bbe0a18c3b95	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
e27aba41-d6e4-4d14-95ff-839aa4de77f1	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
828daaad-5dff-470d-b132-71439d6f7243	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
40441185-5dd1-4938-949b-3c3f10831f53	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
7a943836-bf2f-43a8-9f8e-034bd3f4780d	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
f2314696-7e46-47c9-b77c-c83f6711cf70	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	\N
4b70ba58-1300-4245-a0ca-3495ad614484	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$UT2plE75HOejIPgooj7thIX8Ijf55pkda2tW4fBFidLmOF7S	\N	\N	\N	\N	\N	\N
137ab459-020a-4e5e-bf73-b4202194f678	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$OFtX1bhpcq8gK/tEznbqluY8dFnUdH2wegAuZ8RQEHmyFfZP	\N	\N	\N	\N	\N	\N
aa2d2f6c-415e-4d24-8c70-d0078dd7bfa1	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$Ukg7vP08D+Y+7eqZjoO87U6uUpeFHcdArjN0FFEzu4RfFwTY	\N	\N	\N	\N	\N	\N
11c763eb-d825-424c-a7c2-0faf4bf147a5	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$8HTkka7K7zMmJb/PGDbwdKE4VIOwsRB2SlhAN1243tv4e/TD	\N	\N	\N	\N	\N	\N
8f3d3c3c-3779-4034-adb2-99b8e315e4d4	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$So46jkrAJCuY+1jr4DwMU8Mp8VAeol9xxdIKNCpCJnevmpju	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
5344f2df-9ac2-4510-9568-5a63f42fe84e	2	Заполняющий	80	120	21	25	50	250	e2093830-4c73-4885-8fec-bdeadd4ae94b	\N
7c2bd182-fe88-4a28-9fb3-af69cb624d87	2	Заполняющий	80	120	21	25	50	250	ff75e2bd-ea2c-41bd-ab79-894160be061a	\N
af6a4f74-fe11-4fac-a19b-9f8439238ab2	1	Корневой	80	120	\N	\N	50	250	e2093830-4c73-4885-8fec-bdeadd4ae94b	\N
f0fe03f6-592c-4f0d-ba8d-2cc60ff8cf56	1	Корневой	80	120	22	24	50	250	ff75e2bd-ea2c-41bd-ab79-894160be061a	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
314e875d-701c-433e-ae8f-b4b45f05cebc	2	Заполняющий	0.22	0.44	\N	\N	\N	30ee3644-c093-42a6-a604-af606d38823c	fdd2195f-fe7c-4e08-bd86-ddb8dacc2aad	\N
5b43008d-33c3-41e9-8cef-0e44e4c1f6f3	2	Заполняющий	0.22	0.44	\N	\N	\N	b7803f1f-1c08-4b2c-b5c4-a772248626dc	f1e3e6a8-a17c-4573-91b0-7fef80d86d0a	\N
9164bf2b-d22a-45ff-952a-a4f4b238fddd	1	Корневой	0.11	0.68	\N	\N	\N	4e70742b-7524-4baf-9ae8-29d2a744c749	fdd2195f-fe7c-4e08-bd86-ddb8dacc2aad	\N
cb82fd35-f1de-4402-97cb-5684913d5885	1	Корневой	0.11	0.68	\N	\N	\N	fdc0204a-fed2-494c-8d48-24053a041ca9	f1e3e6a8-a17c-4573-91b0-7fef80d86d0a	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
04202277-028d-40e7-a351-86d9ff4ccbb2	4c5980e7-803d-4bb0-a3de-2766fe4c250f
131dcdca-661f-47fc-8b34-e7c5948fbd7d	ef68b44c-6f76-4a93-928b-7c177de55cdf
1ebfe6c0-3ff8-4df3-8501-1de88dfc1456	8244df85-1a46-43fa-b431-90f00671c32e
2f55bd25-d6be-4bd2-80a6-27f9397bb90b	f24cffb4-6105-4700-8e51-0d1dd6739ba4
4fcc43d6-8f81-47fa-81d7-de1ca3a687f6	e60c80c7-7522-4a40-94ea-50479ef51057
5fe8b870-8157-41c3-ba89-73a1e9ec35cd	e60c80c7-7522-4a40-94ea-50479ef51057
61b1f03f-a4f0-4b88-829b-ad1090d14b18	f5d5ad40-0572-4d3c-854c-248869360d6f
629a09b5-36f6-428c-bae6-a47ab8b83059	f5d5ad40-0572-4d3c-854c-248869360d6f
6c51875d-cba8-413d-8559-240d68e42cb5	f5d5ad40-0572-4d3c-854c-248869360d6f
6d59b1bf-c678-4a85-ac07-6436d43ce26d	ef68b44c-6f76-4a93-928b-7c177de55cdf
7e07e653-e89c-459b-a335-21130df6a415	f24cffb4-6105-4700-8e51-0d1dd6739ba4
9def1f95-f8fe-4298-a11c-f4e6941e8aaf	f5d5ad40-0572-4d3c-854c-248869360d6f
ad072a03-4c85-4487-8804-28e4b9f03016	4c5980e7-803d-4bb0-a3de-2766fe4c250f
af0e7dc9-414f-4927-9c91-bd06c3dba3e7	f5d5ad40-0572-4d3c-854c-248869360d6f
b6f37615-cd42-4426-9d15-1b338e599185	8b609621-882e-4f6e-8964-25cf885ecfe5
c4ffab2b-76de-40bc-9b53-a25a9bcec108	d64cc2de-377d-4225-bcd0-4d4bd0122f6f
c6d34f76-8f9c-4cc2-960a-2cca848b8960	4c5980e7-803d-4bb0-a3de-2766fe4c250f
ca2a4240-240b-498d-9dc2-ea7e6eb5e9dc	8244df85-1a46-43fa-b431-90f00671c32e
cc8aeb12-3ef9-472f-a599-8c85e79f3533	8b609621-882e-4f6e-8964-25cf885ecfe5
d99c3a13-fe76-4700-b8f4-b21b40cb1ac8	f24cffb4-6105-4700-8e51-0d1dd6739ba4
dfd249c9-8c8b-4df5-9d06-6059f78497be	f5746421-39b1-4362-bc51-015cc9f4403a
e5efcd98-7076-4e58-8d7f-20a0df43c002	d64cc2de-377d-4225-bcd0-4d4bd0122f6f
efda0e03-a46c-45f8-bd5f-baca2e43a111	4c5980e7-803d-4bb0-a3de-2766fe4c250f
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
04202277-028d-40e7-a351-86d9ff4ccbb2	30baabda-af42-4b8b-8e3b-1075c6e205db	\N	151861
131dcdca-661f-47fc-8b34-e7c5948fbd7d	b4011034-798e-4189-a6fe-aaf94859ca49	5515efbe-6be4-4264-b0dc-0791d650997d	121267
1ebfe6c0-3ff8-4df3-8501-1de88dfc1456	4a6569ae-a993-40c5-bd34-906e0857bcaa	\N	149921
2f55bd25-d6be-4bd2-80a6-27f9397bb90b	a4134d4f-d0b2-45b1-bd37-7ab9217eebcd	\N	152444
4fcc43d6-8f81-47fa-81d7-de1ca3a687f6	3f03e580-0b4e-43e7-a51b-bf336d2e54bd	2187a585-ec95-45d4-ad2d-255e904fbfa6	120756
5fe8b870-8157-41c3-ba89-73a1e9ec35cd	7c522bb5-ca7a-4f19-a5d1-982253f5126b	31e2d05e-e76b-4171-b81f-da02699a7a92	146325
61b1f03f-a4f0-4b88-829b-ad1090d14b18	6f0998a9-aa96-4519-8bee-c23db08678b0	\N	121537
629a09b5-36f6-428c-bae6-a47ab8b83059	75139b22-2e47-4ca4-bd7d-a3bb7dc04a3a	\N	147329
6c51875d-cba8-413d-8559-240d68e42cb5	7274791b-4209-46c8-9974-ced091f08165	\N	152365
6d59b1bf-c678-4a85-ac07-6436d43ce26d	b8b8128d-a5e4-4e32-909d-de5641d5cb70	31e2d05e-e76b-4171-b81f-da02699a7a92	117390
7e07e653-e89c-459b-a335-21130df6a415	7468086a-ebc2-47ba-b6e6-390e4c8ef91a	\N	156278
9def1f95-f8fe-4298-a11c-f4e6941e8aaf	265ab7f1-1af7-48bc-9675-e66501e2c6a3	\N	156298
ad072a03-4c85-4487-8804-28e4b9f03016	783b45e5-52a7-486d-adfd-a6f54c42839d	\N	155288
af0e7dc9-414f-4927-9c91-bd06c3dba3e7	bfa4e8a7-8689-423b-a185-eee3acc4eb34	\N	121538
b6f37615-cd42-4426-9d15-1b338e599185	bad5f54c-850d-4929-8185-a39e3fc130d6	d2ae0f74-8cc4-439a-8374-a1e580460338	145092
c4ffab2b-76de-40bc-9b53-a25a9bcec108	9d1976ea-0597-4b6d-be95-b42fd5458f49	133af556-ed29-4734-bf2f-79ffe202d7d8	151299
c6d34f76-8f9c-4cc2-960a-2cca848b8960	d4c725c3-c2bb-4f13-b508-bbe0a18c3b95	\N	152441
ca2a4240-240b-498d-9dc2-ea7e6eb5e9dc	e27aba41-d6e4-4d14-95ff-839aa4de77f1	\N	150402
cc8aeb12-3ef9-472f-a599-8c85e79f3533	5db09588-5d18-40b8-84b6-c762de10ffa2	ec88eb2f-5ec8-4c77-9af6-baca2ce0c56d	132695
d99c3a13-fe76-4700-b8f4-b21b40cb1ac8	8f3184b3-5231-44ef-9a08-d6f4af6e252c	\N	152207
dfd249c9-8c8b-4df5-9d06-6059f78497be	6e965ec7-6a24-4c9f-8b55-8a8c8052b1bb	d2ae0f74-8cc4-439a-8374-a1e580460338	\N
e5efcd98-7076-4e58-8d7f-20a0df43c002	21dc23c9-7e0d-4503-a588-ee1471652af4	997547e2-0c6f-4353-bcbb-0e406cf1e6a4	150882
efda0e03-a46c-45f8-bd5f-baca2e43a111	46821ef2-86d9-4364-8b25-c92c74db76f2	\N	153274
48cff113-04a3-4683-aaa1-43638a2ade0f	7a943836-bf2f-43a8-9f8e-034bd3f4780d	\N	\N
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
4c5980e7-803d-4bb0-a3de-2766fe4c250f	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
8244df85-1a46-43fa-b431-90f00671c32e	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
8b609621-882e-4f6e-8964-25cf885ecfe5	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
d64cc2de-377d-4225-bcd0-4d4bd0122f6f	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
e60c80c7-7522-4a40-94ea-50479ef51057	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
ef68b44c-6f76-4a93-928b-7c177de55cdf	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
f24cffb4-6105-4700-8e51-0d1dd6739ba4	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
f5746421-39b1-4362-bc51-015cc9f4403a	11111	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
f5d5ad40-0572-4d3c-854c-248869360d6f	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
e0102867-48a8-4358-b447-b70a500d1066	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
30ee3644-c093-42a6-a604-af606d38823c	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	e0102867-48a8-4358-b447-b70a500d1066	48cff113-04a3-4683-aaa1-43638a2ade0f	380297be-2628-41f1-8c1c-4621df86e49d	\N
4e70742b-7524-4baf-9ae8-29d2a744c749	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	e0102867-48a8-4358-b447-b70a500d1066	48cff113-04a3-4683-aaa1-43638a2ade0f	380297be-2628-41f1-8c1c-4621df86e49d	\N
b7803f1f-1c08-4b2c-b5c4-a772248626dc	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	e0102867-48a8-4358-b447-b70a500d1066	48cff113-04a3-4683-aaa1-43638a2ade0f	380297be-2628-41f1-8c1c-4621df86e49d	\N
fdc0204a-fed2-494c-8d48-24053a041ca9	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	e0102867-48a8-4358-b447-b70a500d1066	48cff113-04a3-4683-aaa1-43638a2ade0f	380297be-2628-41f1-8c1c-4621df86e49d	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
f1e3e6a8-a17c-4573-91b0-7fef80d86d0a	1	1	f	2023-02-19 02:07:40.480504	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	b4667a81-2c11-4ece-8267-e21173ddd6f9	48cff113-04a3-4683-aaa1-43638a2ade0f	380297be-2628-41f1-8c1c-4621df86e49d	c0970762-d135-488b-85f5-c8555be017e1	\N
fdd2195f-fe7c-4e08-bd86-ddb8dacc2aad	2	1	f	2023-02-19 02:07:40.483507	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	dbffbe62-a695-4582-863c-bdde9105764b	48cff113-04a3-4683-aaa1-43638a2ade0f	380297be-2628-41f1-8c1c-4621df86e49d	c0970762-d135-488b-85f5-c8555be017e1	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
03987d97-aa4f-41b8-bdb9-cfb3ff79f93e	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	9a2e63bc-b660-452a-ba5b-c20d9d8c8185	\N
5f7c3b91-c440-4356-b41c-2ef78773edb9	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	9a2e63bc-b660-452a-ba5b-c20d9d8c8185	\N
e53926ef-ce51-4540-a100-96e331deb44b	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	9a2e63bc-b660-452a-ba5b-c20d9d8c8185	\N
a5668714-8e60-43a2-8146-34c89e1689d3	1	12:10:00	13:10:00	13:20:00	13:50:00	09921abe-9d70-4c4e-aa6c-f12aafc6cc23	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
05559020-a7cb-4e84-8d7c-36634a504ad2	1550	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1550
133af556-ed29-4734-bf2f-79ffe202d7d8	3650	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3650
16aae3a0-97aa-4345-a32f-17f7fdb95ba5	1400	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1400
17053fbe-de5d-4ac9-afb4-00897ef06661	2050	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	2050
2187a585-ec95-45d4-ad2d-255e904fbfa6	3520	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3520
31e2d05e-e76b-4171-b81f-da02699a7a92	3610	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3610
4164a47a-add9-4875-9c08-c57056641847	2150	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	2150
5515efbe-6be4-4264-b0dc-0791d650997d	3600	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3600
552004c7-51fb-4aed-ba28-93c9c5d015b3	1280	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1280
7563f084-740c-4064-bd91-5036a1bdf880	1270	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1270
851c1adf-3ea2-4c56-adee-a9884c0743c7	1390	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1390
997547e2-0c6f-4353-bcbb-0e406cf1e6a4	3690	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3690
bfe0a5d9-3207-49ac-a865-0b189114a516	1380	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1380
d2ae0f74-8cc4-439a-8374-a1e580460338	3590	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3590
df1849ec-7105-4baa-95bc-fc11823ae27c	1360	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1360
ec88eb2f-5ec8-4c77-9af6-baca2ce0c56d	3500	\N	284b1e36-e5ce-472b-9790-33235bcd54fd	3500
f6dc3fa7-1f23-430b-9866-04b638a51993	2130	\N	f582f221-f1d1-4f7a-84d1-c4df72b0c4d7	2130
f8d844f0-df77-41eb-99ec-04147abc6516	1260	\N	ba38eca4-9101-4d09-87b5-b10d7a856834	1260
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
1585b2cd-cb61-4ae4-8015-62221d766e6e	Цех 50	50	050
7f03af8a-57f4-4e26-a840-f3f71c3e1239	Цех 480	480	480
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
-- Name: WeldingRecords FK_WeldingRecords_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "FK_WeldingRecords_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


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

