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
    "WeldingEquipmentId" uuid
);


--
-- Name: Chiefs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Chiefs" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WeldingEquipmentId" uuid
);


--
-- Name: Days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Days" (
    "Id" uuid NOT NULL,
    "MonthNumber" integer NOT NULL,
    "Number" integer NOT NULL,
    "IsWorkingDay" boolean NOT NULL,
    "CalendarId" uuid NOT NULL
);


--
-- Name: DowntimeReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DowntimeReasons" (
    "Id" uuid NOT NULL,
    "Reason" text NOT NULL
);


--
-- Name: EventLogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."EventLogs" (
    "Id" uuid NOT NULL,
    "Information" character varying(200) NOT NULL,
    "DateTime" timestamp without time zone NOT NULL,
    "UserId" uuid
);


--
-- Name: Inspectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Inspectors" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL
);


--
-- Name: LayerInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."LayerInstructions" (
    "Id" uuid NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
    "WeldPassageId" uuid
);


--
-- Name: Masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Masters" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WeldingEquipmentId" uuid
);


--
-- Name: Posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Posts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "ProductionAreaId" uuid NOT NULL
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
    "WorkshopId" uuid NOT NULL
);


--
-- Name: Products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Products" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Number" integer NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductType" integer NOT NULL,
    "WeldingTaskId" uuid,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "MasterId" uuid,
    "InspectorId" uuid
);


--
-- Name: Roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Roles" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
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
    "InspectorId" uuid
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
    "SeamId" uuid
);


--
-- Name: TechnologicalInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalInstructions" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "SeamId" uuid NOT NULL,
    "TechnologicalProcessId" uuid
);


--
-- Name: TechnologicalProcesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalProcesses" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "PdmSystemFileLink" text NOT NULL
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
    "ProductionAreaId" uuid
);


--
-- Name: WeldPassages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldPassages" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
    "IsDone" boolean NOT NULL,
    "SeamId" uuid NOT NULL,
    "TechnologicalInstructionId" uuid NOT NULL
);


--
-- Name: Welders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Welders" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WorkplaceId" uuid
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
    "DowntimeReasonId" uuid
);


--
-- Name: WeldingEquipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipments" (
    "Id" uuid NOT NULL,
    "RfidTag" text NOT NULL,
    "Name" text NOT NULL,
    "Marking" text NOT NULL,
    "FactoryNumber" text NOT NULL,
    "CommissioningDate" timestamp without time zone NOT NULL,
    "CurrentCondition" integer NOT NULL,
    "Height" integer NOT NULL,
    "Width" integer NOT NULL,
    "Lenght" integer NOT NULL,
    "GroupNumber" integer NOT NULL,
    "ManufacturerName" text NOT NULL,
    "NextAttestationDate" timestamp without time zone NOT NULL,
    "WeldingProcess" text NOT NULL,
    "IdleVoltage" double precision NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision NOT NULL,
    "ArcVoltageMax" double precision NOT NULL,
    "PostId" uuid,
    "WelderId" uuid
);


--
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "WeldingDate" timestamp without time zone NOT NULL,
    "WeldingStartTime" timestamp without time zone,
    "WeldingEndTime" timestamp without time zone,
    "AmbientTemperature" integer NOT NULL,
    "AirHumidity" integer NOT NULL,
    "InterlayerTemperature" integer NOT NULL,
    "CurrentLayerNumber" integer NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "DefectReasons" text,
    "DefectsDetected" text,
    "WeldingCurrentValues" double precision[],
    "ArcVoltageValues" double precision[],
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "BasicMaterial" text NOT NULL,
    "MainMaterialBatchNumber" text NOT NULL,
    "WeldingMaterial" text NOT NULL,
    "WeldingMaterialBatchNumber" text NOT NULL,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL
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
    "CalendarId" uuid
);


--
-- Name: Workplaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workplaces" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "PostId" uuid,
    "ProductionAreaId" uuid
);


--
-- Name: Workshops; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workshops" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Number" integer NOT NULL
);


--
-- Data for Name: Calendars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Calendars" ("Id", "Year", "IsMain", "WelderId", "WeldingEquipmentId") FROM stdin;
8cc82be4-e7a9-43a3-a0cb-915a23724f1a	2023	t	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId") FROM stdin;
ce1e9ace-7df7-4366-b8af-788038dc7c41	dd16aed8-a7ea-45f6-9cd3-b1b09538f037	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId") FROM stdin;
a1943a16-5548-4d29-82bc-aef12143be62	1	10	t	8cc82be4-e7a9-43a3-a0cb-915a23724f1a
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason") FROM stdin;
081d3f41-4c56-4d2c-82ca-73ae2d3391f3	Неявка оператора (б/лист, отпуск, и пр.)
0fcde55f-499e-4c42-8139-4a1af6577243	Отсутствие инструмента, оснастки вспомогательного оборудования
12dea3c9-a4f5-4ab5-9aca-9e186dba5aea	Контроль на рабочем месте
17e2af1c-4461-48a6-8086-3465a6ab6168	Сборочные операции
30211fd8-b133-4698-a63e-0c7711cf80cd	Отсутствие заданий
3a065088-807c-4eb9-8d8c-cf64f9ebdc8e	Отсутствие конструктора, технолога или ожидание его решения
44d9cedb-8dae-468d-8526-d5b680f4ecde	Нерабочее время по графику согласно сменности
46f4fffc-d9ed-4ccb-ba63-10f79260b499	Отсутствие материала, заготовок, деталей
5dfd8d3a-32a3-483c-a9cf-bc6cf9a52c1f	Плановый ремонт централизованными службами
60be379b-a01b-43fe-9486-f310a1b2be12	Обед
7690b011-ce8e-4e92-b98b-b00117b4e168	Отсутствие сотрудника ОТК
a41f92cb-758a-4a19-8d9f-44b502f9ace7	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы
a5c22a90-3c0d-4485-8082-d902cc5bba15	Ознакомление с работой, документацией, инструктаж
aca77bf4-1870-4b9d-9d9a-dc74c9d792bf	Отсутствие оператора в связи с необеспеченностью
b1a8e6a9-a2a5-4d9f-9b8e-1c3cf7dcc070	Уборка, осмотр оборудования, чистка/смазка оборудования
b8a59996-0ff9-436d-a57e-b6c8bce292f3	Праздники и выходные
bcc05966-1f40-4759-8dc3-7333b4fe3a56	Установка, выверка, снятие детали
bd733737-527c-47f6-8f35-cfee17444207	Работа по карте несоответствий
c30914a8-6cf3-43fa-a23f-bc6e63601495	Изменение режимов, смена инструмента, приспособления
d0a0336a-b46a-4605-a557-cbfce468a1f8	Установка, выверка, снятие детали
d2b830e2-059f-4448-9c8d-52df6d364575	Работа с управляющей программой
d6b6f8aa-5884-49ef-ad34-c5fca62b757a	Отсутствие энергоносителей
e1a40754-ae96-4a71-81e9-82c089410be9	Аварийный ремонт централизованными службами
e840cb34-452c-4fd1-81e1-edddcda5ecdb	Естественные надобности
f9e28809-437a-450b-a9f8-63ea21b73f98	Отсутствие крана, транспорта
\.


--
-- Data for Name: EventLogs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."EventLogs" ("Id", "Information", "DateTime", "UserId") FROM stdin;
\.


--
-- Data for Name: Inspectors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Inspectors" ("Id", "UserId") FROM stdin;
dbf6ab02-1713-430c-a9bd-b3a3e25b990b	708db384-5cb2-4870-b21a-523dfcc39459
\.


--
-- Data for Name: LayerInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."LayerInstructions" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "WeldPassageId") FROM stdin;
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId") FROM stdin;
ef499084-dc0d-410e-9b5a-1888dde8bcec	6cca1823-e745-4e12-b7ce-2a47ac6df76d	132ae6f6-05cc-4b8e-bba0-14d548d16057
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId") FROM stdin;
08419e0d-cf5b-4691-b7c0-1686fb67929e	3	Пост 3	52fee6e1-8326-4a94-87bb-0230a9114c42
cafc50ae-de5d-4a63-ab7f-eb5e9df39f0c	2	Пост 2	3145934a-5986-49ee-88e9-48e29db2e269
fcd42162-ab8e-4872-bbda-4a7b4fa88cca	1	Пост 1	c7dac131-5a63-4ae8-a73f-16def7e99001
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b9cf312f-bac4-4494-b7ba-fba840b95c3c	64a562c7-4978-4f6c-835c-888d83ab37e3
94ffd57e-1723-43e2-9438-314e1084a369	f4f725f8-b2f3-48a4-addc-cc1e7508460b
94ffd57e-1723-43e2-9438-314e1084a369	fb61ad0c-92f8-4ffe-acf5-cacfa41169bb
b9cf312f-bac4-4494-b7ba-fba840b95c3c	ff2e5a3d-a36c-4fe0-b70f-6b1bdc656e2c
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId") FROM stdin;
3145934a-5986-49ee-88e9-48e29db2e269	Производственный участок 2	2	8d2e6057-4031-42ed-b161-733667dcb80c
52fee6e1-8326-4a94-87bb-0230a9114c42	Производственный участок 3	3	8d2e6057-4031-42ed-b161-733667dcb80c
c7dac131-5a63-4ae8-a73f-16def7e99001	Производственный участок 1	1	8d2e6057-4031-42ed-b161-733667dcb80c
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "WeldingTaskId", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId") FROM stdin;
64a562c7-4978-4f6c-835c-888d83ab37e3	Узел 2	2	3	f	f	2	\N	\N	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	ef499084-dc0d-410e-9b5a-1888dde8bcec	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
f4f725f8-b2f3-48a4-addc-cc1e7508460b	Узел 1	1	2	t	f	2	\N	\N	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	ef499084-dc0d-410e-9b5a-1888dde8bcec	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
fb61ad0c-92f8-4ffe-acf5-cacfa41169bb	Деталь 1	1	3	f	f	3	\N	\N	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	ef499084-dc0d-410e-9b5a-1888dde8bcec	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
ff2e5a3d-a36c-4fe0-b70f-6b1bdc656e2c	Деталь 2	2	2	t	f	3	\N	\N	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	ef499084-dc0d-410e-9b5a-1888dde8bcec	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
94ffd57e-1723-43e2-9438-314e1084a369	Изделие 1	1	4	f	f	1	\N	8087b7c1-12a5-4830-b46c-3185c5e4ee61	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	ef499084-dc0d-410e-9b5a-1888dde8bcec	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
b9cf312f-bac4-4494-b7ba-fba840b95c3c	Изделие 2	2	1	f	f	1	\N	a8010996-98d7-40db-9881-dcbf86a15628	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	ef499084-dc0d-410e-9b5a-1888dde8bcec	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
d7467e35-c3d7-41ca-af6c-bfd345a72b37	Admin
e669f6cc-8cf7-44f5-b53e-ab0b76d94c31	Master
d1818376-e235-4cb4-b054-7760fa83ae57	Executor
e81d43ff-d52a-4fc9-9bad-085e524a8033	TechUser
96fdee34-5da8-40c3-bf66-6ad06f4a46ad	Chief
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductId", "ProductionAreaId", "WorkplaceId", "WelderId", "InspectorId") FROM stdin;
5569773a-f566-42b7-8560-c69914e383ed	2	2	t	f	b9cf312f-bac4-4494-b7ba-fba840b95c3c	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	4838cd72-c5a0-47b6-bf20-224918cc330b	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
be7e5749-2b65-4725-8581-c55cf6c4fb53	1	4	f	f	94ffd57e-1723-43e2-9438-314e1084a369	3145934a-5986-49ee-88e9-48e29db2e269	49f2bc63-f3ef-4b7d-9110-7a179de0d737	4838cd72-c5a0-47b6-bf20-224918cc330b	dbf6ab02-1713-430c-a9bd-b3a3e25b990b
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "ProductId", "SeamId") FROM stdin;
639c2cf2-9ec1-48ba-8d8e-ea56a09d7997	2023-01-31 14:01:37.104016	4	Какая-то причина брака	94ffd57e-1723-43e2-9438-314e1084a369	\N
829184c5-d504-482d-8e1c-7fad609a1e9f	2023-01-31 14:01:37.10463	4	Какая-то причина брака	\N	be7e5749-2b65-4725-8581-c55cf6c4fb53
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId") FROM stdin;
4bca5b28-1f58-4b8b-8625-593fe71c9361	2	Инструкция 2	5569773a-f566-42b7-8560-c69914e383ed	a8010996-98d7-40db-9881-dcbf86a15628
755f5261-c217-47b4-8aaa-43feb14d3111	1	Инструкция 1	be7e5749-2b65-4725-8581-c55cf6c4fb53	8087b7c1-12a5-4830-b46c-3185c5e4ee61
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink") FROM stdin;
8087b7c1-12a5-4830-b46c-3185c5e4ee61	1	Технологический процесс 1	Ссылка
a8010996-98d7-40db-9881-dcbf86a15628	2	Технологический процесс 2	Ссылка
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
dd16aed8-a7ea-45f6-9cd3-b1b09538f037	96fdee34-5da8-40c3-bf66-6ad06f4a46ad
0b24bcc3-d679-48f5-841a-f101567ba259	d1818376-e235-4cb4-b054-7760fa83ae57
a5029321-49ca-40ab-a4fd-a85ccaa649fb	d1818376-e235-4cb4-b054-7760fa83ae57
d7356120-357a-4662-a3cd-61472d39348a	d1818376-e235-4cb4-b054-7760fa83ae57
6cca1823-e745-4e12-b7ce-2a47ac6df76d	e669f6cc-8cf7-44f5-b53e-ab0b76d94c31
708db384-5cb2-4870-b21a-523dfcc39459	e81d43ff-d52a-4fc9-9bad-085e524a8033
cd6341eb-3ca2-4d83-a67e-ff6b70d20d88	d7467e35-c3d7-41ca-af6c-bfd345a72b37
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
dd16aed8-a7ea-45f6-9cd3-b1b09538f037	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	3145934a-5986-49ee-88e9-48e29db2e269
0b24bcc3-d679-48f5-841a-f101567ba259	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	3145934a-5986-49ee-88e9-48e29db2e269
a5029321-49ca-40ab-a4fd-a85ccaa649fb	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	52fee6e1-8326-4a94-87bb-0230a9114c42
d7356120-357a-4662-a3cd-61472d39348a	Имя 3	Отчество 3	Фамилия 3	UserName	Email	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	c7dac131-5a63-4ae8-a73f-16def7e99001
6cca1823-e745-4e12-b7ce-2a47ac6df76d	Имя мастера	Отчество мастера	Фамилия мастера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	3145934a-5986-49ee-88e9-48e29db2e269
708db384-5cb2-4870-b21a-523dfcc39459	Имя Контролера	Имя Контролера	Имя Контролера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	3145934a-5986-49ee-88e9-48e29db2e269
cd6341eb-3ca2-4d83-a67e-ff6b70d20d88	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$nSPcq0jCNqeVCxxB8yiMbSUuTsuupV18aOVwXQRI0wtWdPte	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "IsDone", "SeamId", "TechnologicalInstructionId") FROM stdin;
42d033be-e12b-4d19-ba53-0d92d165a8f8	2	Заполняющий	1	100	5	50	10	60	f	5569773a-f566-42b7-8560-c69914e383ed	4bca5b28-1f58-4b8b-8625-593fe71c9361
4c10c679-d355-4dbe-bc27-ffe81f4314db	1	Корневой	1	100	5	50	10	60	f	be7e5749-2b65-4725-8581-c55cf6c4fb53	755f5261-c217-47b4-8aaa-43feb14d3111
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId") FROM stdin;
4838cd72-c5a0-47b6-bf20-224918cc330b	d7356120-357a-4662-a3cd-61472d39348a	9259bafd-f23a-4c1d-ad6f-5f427cddae27
5222d0e7-935e-4e53-807f-5a52c876c0ca	0b24bcc3-d679-48f5-841a-f101567ba259	\N
54e7e9bd-9a7f-4d0a-8468-6a2ebca39e0c	a5029321-49ca-40ab-a4fd-a85ccaa649fb	6d4d7cc5-b089-4beb-a7aa-1cc041a7e531
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId") FROM stdin;
0acb31e5-1a55-4f0f-9789-3070e5ad12c1	3	2023-01-31 00:00:00	00:00:00	30	150d88df-87a5-4a5f-b271-8f868dce1294	\N
13373257-b995-443c-8f6e-25987dc07005	4	2023-01-31 00:00:00	12:50:00	60	132ae6f6-05cc-4b8e-bba0-14d548d16057	12dea3c9-a4f5-4ab5-9aca-9e186dba5aea
31269546-fe7a-4027-8400-81aa4054fc1d	3	2023-01-31 00:00:00	00:00:00	60	132ae6f6-05cc-4b8e-bba0-14d548d16057	\N
45b7e23c-6267-4e67-addc-bb4be4ccba25	4	2023-01-31 00:00:00	09:30:00	30	150d88df-87a5-4a5f-b271-8f868dce1294	081d3f41-4c56-4d2c-82ca-73ae2d3391f3
5ccac3c1-f548-41b5-a2f4-ced2602d378b	3	2023-01-31 00:00:00	00:00:00	60	150d88df-87a5-4a5f-b271-8f868dce1294	\N
9b49d5e8-a586-4e98-93f8-229e36ca3572	3	2023-01-31 00:00:00	00:00:00	60	201696a2-50af-4be1-ad5a-c6be9dc17f7d	\N
e97e1f45-c80b-4257-b853-4c6741bf71b9	4	2023-01-31 00:00:00	19:30:00	10	150d88df-87a5-4a5f-b271-8f868dce1294	0fcde55f-499e-4c42-8139-4a1af6577243
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "WelderId") FROM stdin;
132ae6f6-05cc-4b8e-bba0-14d548d16057	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	54e7e9bd-9a7f-4d0a-8468-6a2ebca39e0c
150d88df-87a5-4a5f-b271-8f868dce1294	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	fcd42162-ab8e-4872-bbda-4a7b4fa88cca	4838cd72-c5a0-47b6-bf20-224918cc330b
201696a2-50af-4be1-ad5a-c6be9dc17f7d	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	fcd42162-ab8e-4872-bbda-4a7b4fa88cca	5222d0e7-935e-4e53-807f-5a52c876c0ca
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId") FROM stdin;
63165122-682a-4304-889a-707125d08be3	1	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	300	1	200	81	150	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	5569773a-f566-42b7-8560-c69914e383ed
94b2b84c-ce44-4804-aa58-4f653d2d2008	2	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	320	1	220	12	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	be7e5749-2b65-4725-8581-c55cf6c4fb53
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId") FROM stdin;
1493cd59-a60a-4fe1-b89c-ad5282b45e76	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	8cc82be4-e7a9-43a3-a0cb-915a23724f1a
5d0af678-305b-44d6-8c29-9e150737011a	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	8cc82be4-e7a9-43a3-a0cb-915a23724f1a
669cc584-e14f-4e3a-be30-37874ea4d5dd	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	8cc82be4-e7a9-43a3-a0cb-915a23724f1a
8d925545-bf6b-42eb-b737-be391a07ed49	1	12:10:00	13:10:00	13:20:00	13:50:00	a1943a16-5548-4d29-82bc-aef12143be62	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
49f2bc63-f3ef-4b7d-9110-7a179de0d737	3	\N	52fee6e1-8326-4a94-87bb-0230a9114c42
6d4d7cc5-b089-4beb-a7aa-1cc041a7e531	2	\N	3145934a-5986-49ee-88e9-48e29db2e269
9259bafd-f23a-4c1d-ad6f-5f427cddae27	1	\N	c7dac131-5a63-4ae8-a73f-16def7e99001
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number") FROM stdin;
8d2e6057-4031-42ed-b161-733667dcb80c	Цех	1
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
-- Name: LayerInstructions PK_LayerInstructions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LayerInstructions"
    ADD CONSTRAINT "PK_LayerInstructions" PRIMARY KEY ("Id");


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
-- Name: WeldPassages PK_WeldPassages; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "PK_WeldPassages" PRIMARY KEY ("Id");


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
-- Name: IX_Calendars_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Calendars_WelderId" ON public."Calendars" USING btree ("WelderId");


--
-- Name: IX_Calendars_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Calendars_WeldingEquipmentId" ON public."Calendars" USING btree ("WeldingEquipmentId");


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
-- Name: IX_EventLogs_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_EventLogs_UserId" ON public."EventLogs" USING btree ("UserId");


--
-- Name: IX_Inspectors_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Inspectors_UserId" ON public."Inspectors" USING btree ("UserId");


--
-- Name: IX_LayerInstructions_WeldPassageId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_LayerInstructions_WeldPassageId" ON public."LayerInstructions" USING btree ("WeldPassageId");


--
-- Name: IX_Masters_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Masters_UserId" ON public."Masters" USING btree ("UserId");


--
-- Name: IX_Masters_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Masters_WeldingEquipmentId" ON public."Masters" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_ProductInsides_MainProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductInsides_MainProductId" ON public."ProductInsides" USING btree ("MainProductId");


--
-- Name: IX_ProductionAreas_WorkshopId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductionAreas_WorkshopId" ON public."ProductionAreas" USING btree ("WorkshopId");


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
-- Name: IX_StatusReasons_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_ProductId" ON public."StatusReasons" USING btree ("ProductId");


--
-- Name: IX_StatusReasons_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_SeamId" ON public."StatusReasons" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstructions_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstructions_SeamId" ON public."TechnologicalInstructions" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstructions_TechnologicalProcessId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_TechnologicalInstructions_TechnologicalProcessId" ON public."TechnologicalInstructions" USING btree ("TechnologicalProcessId");


--
-- Name: IX_UserRoles_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_UserRoles_UserId" ON public."UserRoles" USING btree ("UserId");


--
-- Name: IX_Users_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Users_ProductionAreaId" ON public."Users" USING btree ("ProductionAreaId");


--
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


--
-- Name: IX_WeldPassages_TechnologicalInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_TechnologicalInstructionId" ON public."WeldPassages" USING btree ("TechnologicalInstructionId");


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
-- Name: IX_WeldingEquipmentConditionTimes_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentConditionTimes_WeldingEquipmentId" ON public."WeldingEquipmentConditionTimes" USING btree ("WeldingEquipmentId");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingEquipments_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_WelderId" ON public."WeldingEquipments" USING btree ("WelderId");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


--
-- Name: IX_WorkingShifts_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WorkingShifts_CalendarId" ON public."WorkingShifts" USING btree ("CalendarId");


--
-- Name: IX_WorkingShifts_DayId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WorkingShifts_DayId" ON public."WorkingShifts" USING btree ("DayId");


--
-- Name: IX_Workplaces_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Workplaces_PostId" ON public."Workplaces" USING btree ("PostId");


--
-- Name: IX_Workplaces_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Workplaces_ProductionAreaId" ON public."Workplaces" USING btree ("ProductionAreaId");


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
-- Name: LayerInstructions FK_LayerInstructions_WeldPassages_WeldPassageId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LayerInstructions"
    ADD CONSTRAINT "FK_LayerInstructions_WeldPassages_WeldPassageId" FOREIGN KEY ("WeldPassageId") REFERENCES public."WeldPassages"("Id");


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
-- Name: WeldPassages FK_WeldPassages_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: WeldPassages FK_WeldPassages_TechnologicalInstructions_TechnologicalInstruc~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_TechnologicalInstructions_TechnologicalInstruc~" FOREIGN KEY ("TechnologicalInstructionId") REFERENCES public."TechnologicalInstructions"("Id") ON DELETE CASCADE;


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
-- Name: WeldingEquipments FK_WeldingEquipments_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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

