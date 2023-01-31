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
-- Name: WeldPassageResult; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldPassageResult" (
    "Id" uuid NOT NULL,
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "IdFromSystem" text
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
    "WeldPassageResultId" uuid,
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
b14779d7-cda8-4c52-a22d-0c0354d4f0fb	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
e65dd03a-29f6-4e56-a5c3-edc2102c73e9	0eb81f02-0594-483b-a814-0983a0be1336	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
22c7c510-fc0a-4f8a-9808-d31d8ef0de4d	1	10	t	b14779d7-cda8-4c52-a22d-0c0354d4f0fb	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
11ab2046-1f24-4246-8379-3f17f1c97a11	Обед	\N
1f0a0211-507e-46a0-9d66-9f7272cc19b4	Плановый ремонт централизованными службами	\N
24ced5f8-4b8e-4d9b-9a3d-267c557ca7c5	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
28820ecb-6f69-469d-8fa7-8e1371a9fe7b	Контроль на рабочем месте	\N
2d5763dc-9372-47aa-9439-fca10a7d9d7f	Нерабочее время по графику согласно сменности	\N
55b225fb-09ca-4552-af36-eb826d2b5a46	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
5e9895eb-ffbe-4039-a48d-cdeae3d6c4a5	Установка, выверка, снятие детали	\N
78966edb-b97c-4f62-b8be-ff8d1a992c00	Естественные надобности	\N
7a7b0b95-5911-43df-9e0d-9bc8b36fbe1d	Работа с управляющей программой	\N
a3fa80b6-2182-4c39-aa93-9d56bd154b4c	Отсутствие энергоносителей	\N
a65a7882-3746-4a63-810d-9561ab8a06b5	Отсутствие крана, транспорта	\N
ab9a8b78-e794-4af9-aa7f-7631977ad4b7	Отсутствие заданий	\N
b19b9de0-530a-4571-b3fd-34c66872eaca	Отсутствие конструктора, технолога или ожидание его решения	\N
b5f3636a-b5d9-4ab3-b036-ec4745b424f5	Работа по карте несоответствий	\N
c2aad588-39b3-40ea-b3cf-00629351a082	Установка, выверка, снятие детали	\N
c9452a29-a11d-42d6-b31d-0f878de1a1e1	Аварийный ремонт централизованными службами	\N
ce2d2e0e-1612-4672-a826-a31e62c7b0cd	Сборочные операции	\N
cfc11314-6f91-4ce7-afee-b6ed6a2d0af1	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
d184654f-a030-408f-98ba-cc50215c8ad5	Изменение режимов, смена инструмента, приспособления	\N
d7a6509f-17d7-45db-8113-94915f23c006	Неявка оператора (б/лист, отпуск, и пр.)	\N
e346e662-6189-488e-b957-16058ae27188	Отсутствие материала, заготовок, деталей	\N
e350ee97-da61-4bb6-a539-2f093f7d2fe3	Ознакомление с работой, документацией, инструктаж	\N
e8f614e2-ebca-4308-af01-3a03d893bd05	Праздники и выходные	\N
ee935a60-6f68-4721-beb4-b58f2ce4c5bd	Отсутствие оператора в связи с необеспеченностью	\N
f9f63da9-3452-44db-8621-ebda37d5e6a7	Отсутствие сотрудника ОТК	\N
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
6a6188e2-ad4e-4243-8e1c-e0f4b604d808	3a950bbc-3d20-4b09-9453-72c06dc70a87	256467
8d0aa611-e0b0-43dd-8771-281f0d7f7a0a	f7d10f3f-9e8a-4d86-af8c-8befaa89cd60	251534
be81bafc-3cfb-4f03-bcf2-dbb5340877bc	ac136600-b67b-4006-8326-1e536d90fd4a	235565
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
342d5666-9abb-471d-ab62-d1d0ebf00471	bf9ed6ba-2015-45f8-b6ae-8a92df38651b	\N	617215
6abe7a4e-684d-451f-8d26-f954c09d9307	253982b9-27ef-4455-86b1-c7569f47f6f7	\N	643759
7bc1a8b8-6a5b-4761-a3f5-8a64b3a852aa	ff723667-314f-4d07-b37d-45bf0c5fa8b2	\N	614208
969cfb20-89cf-4463-8fd5-8c1f72266e94	fcab832d-1ef9-4840-a02f-150b50e2427a	\N	612000
bb716705-68d9-40c0-a255-88e0abefcec8	2c9a9d73-a11d-4440-9bd7-caf0e1c1574e	\N	613668
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
097c7c20-a779-4615-a057-98c2b1ea133a	1	Пост 1	b184ca2b-e670-440a-9a35-49e678d00d65	\N
3ab7553b-5fdd-4701-9f71-a38be9ef9651	2	Пост 2	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
0d72ff11-b5f4-4dd0-a9a2-736f7f00667b	0767f5d1-8051-4031-a66d-bc1f190abcf3
a45cef66-d2d3-4468-a72a-c93ad2b004f4	09c06245-a4bc-4b26-bffb-a8b078ea008b
e6ccc31c-e8bc-4283-baa0-21ee263cb39e	0cc1ec0e-ce72-4565-90f6-cba1f9e13dfa
a45cef66-d2d3-4468-a72a-c93ad2b004f4	13d8aa95-0399-4983-9084-1e7041ac04fc
85b63473-f835-45ad-a0f4-856abcb163c0	2000f5ed-44bd-43e2-a6ce-4b00a992bd12
85b63473-f835-45ad-a0f4-856abcb163c0	251e4c5a-f270-40b5-a901-76d577e10b59
33bd9362-0502-45b9-b189-5877569fecde	25e00bfe-8d7e-4a6e-959d-d9139173c745
5c598f99-9589-4324-895d-c8e0aead1525	2e5146bc-1851-49aa-af00-e8a5ac44e609
af249abb-806c-4b7c-8591-af19467ae40d	4caa11ec-4233-4218-9447-dd13d0932c03
5c598f99-9589-4324-895d-c8e0aead1525	4e40e3e0-0aad-4a5b-9a58-e8f93302d67b
e6ccc31c-e8bc-4283-baa0-21ee263cb39e	572789f3-62a9-45f5-9f5d-b307841f663a
0d72ff11-b5f4-4dd0-a9a2-736f7f00667b	5c598f99-9589-4324-895d-c8e0aead1525
33bd9362-0502-45b9-b189-5877569fecde	65012ee5-33ff-4e21-b8fc-9bdadb7a0266
aa461eae-57fa-4b10-a331-7c4178169cb7	a2de0f40-d733-4def-9d7e-b45df4d66fc5
33bd9362-0502-45b9-b189-5877569fecde	a45cef66-d2d3-4468-a72a-c93ad2b004f4
0d72ff11-b5f4-4dd0-a9a2-736f7f00667b	a493059e-91ed-4b1b-b2bd-a3ec94a05ccb
85b63473-f835-45ad-a0f4-856abcb163c0	aa461eae-57fa-4b10-a331-7c4178169cb7
85b63473-f835-45ad-a0f4-856abcb163c0	af249abb-806c-4b7c-8591-af19467ae40d
af249abb-806c-4b7c-8591-af19467ae40d	be686d63-ccf3-4d48-9f5c-2affd1c77a7a
25e00bfe-8d7e-4a6e-959d-d9139173c745	e16a2a04-10e2-4bf8-8483-1930d5b1e30a
33bd9362-0502-45b9-b189-5877569fecde	e56fdc70-be3e-4f58-808a-f373bf722b1b
0d72ff11-b5f4-4dd0-a9a2-736f7f00667b	e6ccc31c-e8bc-4283-baa0-21ee263cb39e
25e00bfe-8d7e-4a6e-959d-d9139173c745	f63ee722-f285-406d-8e61-db3b850c2ef5
aa461eae-57fa-4b10-a331-7c4178169cb7	fa524533-a783-48cd-8531-74ea4d5033c2
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
0c254f62-d047-47e1-a64d-bab6576911f1	Производственный участок 5	5	2b69447d-61f2-464b-bd4d-a384f201f11c	05
3543a59f-4852-4949-9929-f0b45b91dd6e	Сборка, сварка узл. и рам к/с г/п 120-220т	4	fcbafb2e-a483-4604-b636-51e4c5ad3db8	04
b184ca2b-e670-440a-9a35-49e678d00d65	Сборка, сварка мостов	1	fcbafb2e-a483-4604-b636-51e4c5ad3db8	01
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "WeldingTaskId", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
0767f5d1-8051-4031-a66d-bc1f190abcf3	Кронштейн	75580-2113192	1	f	f	3	\N	4d2e3cc7-b443-476c-8b28-6ec5a95884b3	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536384314
09c06245-a4bc-4b26-bffb-a8b078ea008b	Проушина	7521-2401224	1	f	f	3	\N	78c9fcd7-2dfa-4288-b07a-a0161e8d9b9d	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536274170
0cc1ec0e-ce72-4565-90f6-cba1f9e13dfa	Труба картера	75580-2401132-10	1	f	f	3	\N	ca86bd04-fbe2-4fa7-91a4-33e2b7e34d04	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536386250
0d72ff11-b5f4-4dd0-a9a2-736f7f00667b	Картер заднего моста	75580-2401006	1	f	f	1	\N	46625d5b-665d-431a-bad1-96aba8ef10cb	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536384294
13d8aa95-0399-4983-9084-1e7041ac04fc	Распорка	7521-3932688	1	f	f	3	\N	0e6c30cb-b087-42a9-83ea-eb72dd323f72	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536273606
2000f5ed-44bd-43e2-a6ce-4b00a992bd12	Кронштейн	75211-1018162	1	f	f	3	\N	4c932d7b-a47f-424e-8968-f3cec2f5dbc6	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536270344
251e4c5a-f270-40b5-a901-76d577e10b59	Накладка	549Б-1015842	1	f	f	3	\N	3a7f396c-b006-46b4-9e09-6c9c402e2e39	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536196288
25e00bfe-8d7e-4a6e-959d-d9139173c745	Картер заднего моста	75132-2401008-50	1	f	f	2	\N	2e0c9d61-3044-4878-afbe-93e63274ccd5	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536467565
2e5146bc-1851-49aa-af00-e8a5ac44e609	Втулка	75303-2128438	1	f	f	3	\N	28e42658-2c53-4658-8d83-40f16e853207	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536248270
33bd9362-0502-45b9-b189-5877569fecde	Картер заднего моста	75132-2401006-50	1	f	f	1	\N	c6bee12c-a02b-41d3-a76f-ab1e876ea4dd	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536467567
4caa11ec-4233-4218-9447-dd13d0932c03	Кронштейн	75304-1001253	1	f	f	3	\N	43908f40-5775-49a1-8626-39f01f6f7ed1	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536248708
4e40e3e0-0aad-4a5b-9a58-e8f93302d67b	Кольцо	75580-2401227	1	f	f	3	\N	6f9aec09-d6c7-4842-97a9-146ac2060f5e	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536384312
572789f3-62a9-45f5-9f5d-b307841f663a	Фланец картера	75580-2401114-11	1	f	f	3	\N	c969c4fd-3cf6-446c-b9a7-9a1bc0eac9bb	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536386265
5c598f99-9589-4324-895d-c8e0aead1525	Картер заднего моста	75580-2401008	1	f	f	2	\N	2aadd360-b0a2-4aab-9b38-f2b7e8d07428	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536384295
65012ee5-33ff-4e21-b8fc-9bdadb7a0266	Кронштейн	75131-2113296-10	1	f	f	3	\N	4ed1b604-919e-4844-82ab-839667750f8e	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536461620
85b63473-f835-45ad-a0f4-856abcb163c0	Рама	75313-2800010-20	1	f	f	1	\N	e4de7e50-a77a-444c-908e-b38f01bc7b7d	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536287819
a2de0f40-d733-4def-9d7e-b45df4d66fc5	Кронштейн	75310-1183102	1	f	f	3	\N	b4f1da10-1eb1-483a-a913-3f5402ae3f74	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536267484
a45cef66-d2d3-4468-a72a-c93ad2b004f4	Кронштейн	7521-2401220	1	f	f	2	\N	82a6a029-d904-4e91-a5ae-862521acbb12	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536273956
a493059e-91ed-4b1b-b2bd-a3ec94a05ccb	Панель	75580-2105522	1	f	f	3	\N	0bdb9ce2-66ca-4f62-b314-8a59691247ed	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536384399
aa461eae-57fa-4b10-a331-7c4178169cb7	Кронштейн	75310-1183100	1	f	f	2	\N	77b0704f-6366-430a-80f1-bb505bdb3e76	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536267493
af249abb-806c-4b7c-8591-af19467ae40d	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	\N	9d1f05b3-0f51-4479-9c68-87dc317c1b71	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536248707
be686d63-ccf3-4d48-9f5c-2affd1c77a7a	Кронштейн	75303-1001293	1	f	f	3	\N	2004b11e-9b04-4682-9bc7-e93bb4716d2f	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536247228
e16a2a04-10e2-4bf8-8483-1930d5b1e30a	Пластина	75132-2401106	1	f	f	3	\N	9d7cd890-9414-4b89-ae98-af5a4f27d07b	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536444153
e56fdc70-be3e-4f58-808a-f373bf722b1b	Панель	75132-2105522	1	f	f	3	\N	f1a8b160-7426-422a-85d5-b4050241fc6e	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536417730
e6ccc31c-e8bc-4283-baa0-21ee263cb39e	Труба картера заднего моста	75580-2401010-01	1	f	f	2	\N	20ade1b8-eb0b-42bb-900c-b76622d339ac	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536386240
f63ee722-f285-406d-8e61-db3b850c2ef5	Опора	75211-2401122	1	f	f	3	\N	dd4e40a8-d210-4671-ba78-361c5a599a08	b184ca2b-e670-440a-9a35-49e678d00d65	\N	\N	\N	4536276803
fa524533-a783-48cd-8531-74ea4d5033c2	Кронштейн	75310-1183106	1	f	f	3	\N	6eeda92e-bd45-455f-b8fb-4e0c281bfdc1	3543a59f-4852-4949-9929-f0b45b91dd6e	\N	\N	\N	4536267485
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
d7c9f0cb-5e75-4796-ba39-f8eafd6f3efb	Admin	\N
691489ad-f088-40b6-a68f-0a9d10b35326	Master	\N
440b9b48-ba0c-40fa-a001-557e89f8c2c9	Executor	\N
6536e877-f5d7-4555-b151-607c3ecb1309	TechUser	\N
461f45f3-e7e3-4d7b-aee1-dea1e35e9e53	Chief	\N
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
0bdb9ce2-66ca-4f62-b314-8a59691247ed	1405307	Технологический процесс	Ссылка	1405307
0e6c30cb-b087-42a9-83ea-eb72dd323f72	908693	Технологический процесс	Ссылка	908693
2004b11e-9b04-4682-9bc7-e93bb4716d2f	3049271	Технологический процесс	Ссылка	3049271
20ade1b8-eb0b-42bb-900c-b76622d339ac	2915477	Технологический процесс	Ссылка	2915477
28e42658-2c53-4658-8d83-40f16e853207	3011514	Технологический процесс	Ссылка	3011514
2aadd360-b0a2-4aab-9b38-f2b7e8d07428	3232938	Технологический процесс	Ссылка	3232938
2e0c9d61-3044-4878-afbe-93e63274ccd5	3232836	Технологический процесс	Ссылка	3232836
3a7f396c-b006-46b4-9e09-6c9c402e2e39	1426226	Технологический процесс	Ссылка	1426226
43908f40-5775-49a1-8626-39f01f6f7ed1	1492964	Технологический процесс	Ссылка	1492964
46625d5b-665d-431a-bad1-96aba8ef10cb	2433634	Технологический процесс	Ссылка	2433634
4c932d7b-a47f-424e-8968-f3cec2f5dbc6	2841119	Технологический процесс	Ссылка	2841119
4d2e3cc7-b443-476c-8b28-6ec5a95884b3	1405914	Технологический процесс	Ссылка	1405914
4ed1b604-919e-4844-82ab-839667750f8e	526870	Технологический процесс	Ссылка	526870
6eeda92e-bd45-455f-b8fb-4e0c281bfdc1	1119363	Технологический процесс	Ссылка	1119363
6f9aec09-d6c7-4842-97a9-146ac2060f5e	1402616	Технологический процесс	Ссылка	1402616
77b0704f-6366-430a-80f1-bb505bdb3e76	1823031	Технологический процесс	Ссылка	1823031
78c9fcd7-2dfa-4288-b07a-a0161e8d9b9d	1124147	Технологический процесс	Ссылка	1124147
82a6a029-d904-4e91-a5ae-862521acbb12	1362989	Технологический процесс	Ссылка	1362989
9d1f05b3-0f51-4479-9c68-87dc317c1b71	1334123	Технологический процесс	Ссылка	1334123
9d7cd890-9414-4b89-ae98-af5a4f27d07b	1003048	Технологический процесс	Ссылка	1003048
b4f1da10-1eb1-483a-a913-3f5402ae3f74	1104641	Технологический процесс	Ссылка	1104641
c6bee12c-a02b-41d3-a76f-ab1e876ea4dd	3090319	Технологический процесс	Ссылка	3090319
c969c4fd-3cf6-446c-b9a7-9a1bc0eac9bb	3338649	Технологический процесс	Ссылка	3338649
ca86bd04-fbe2-4fa7-91a4-33e2b7e34d04	2822569	Технологический процесс	Ссылка	2822569
dd4e40a8-d210-4671-ba78-361c5a599a08	3211246	Технологический процесс	Ссылка	3211246
e4de7e50-a77a-444c-908e-b38f01bc7b7d	3239598	Технологический процесс	Ссылка	3239598
f1a8b160-7426-422a-85d5-b4050241fc6e	1053809	Технологический процесс	Ссылка	1053809
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
3a950bbc-3d20-4b09-9453-72c06dc70a87	6536e877-f5d7-4555-b151-607c3ecb1309
ac136600-b67b-4006-8326-1e536d90fd4a	6536e877-f5d7-4555-b151-607c3ecb1309
f7d10f3f-9e8a-4d86-af8c-8befaa89cd60	6536e877-f5d7-4555-b151-607c3ecb1309
253982b9-27ef-4455-86b1-c7569f47f6f7	691489ad-f088-40b6-a68f-0a9d10b35326
2c9a9d73-a11d-4440-9bd7-caf0e1c1574e	691489ad-f088-40b6-a68f-0a9d10b35326
bf9ed6ba-2015-45f8-b6ae-8a92df38651b	691489ad-f088-40b6-a68f-0a9d10b35326
fcab832d-1ef9-4840-a02f-150b50e2427a	691489ad-f088-40b6-a68f-0a9d10b35326
ff723667-314f-4d07-b37d-45bf0c5fa8b2	691489ad-f088-40b6-a68f-0a9d10b35326
00a02f1c-0617-4879-9095-c60c55c21fd9	440b9b48-ba0c-40fa-a001-557e89f8c2c9
28089e66-0fd5-40a6-973c-9b33cc5bc465	440b9b48-ba0c-40fa-a001-557e89f8c2c9
2b1603f4-1b29-461b-b08a-e7b2f2950b70	440b9b48-ba0c-40fa-a001-557e89f8c2c9
3953f3c6-4c36-4a83-97b3-3526aee303e6	440b9b48-ba0c-40fa-a001-557e89f8c2c9
48e8f03c-14a4-4978-ac7b-707217b91faf	440b9b48-ba0c-40fa-a001-557e89f8c2c9
5181095d-d883-422f-89c5-4e735f93358e	440b9b48-ba0c-40fa-a001-557e89f8c2c9
756ee9cd-b4d4-4d7a-91a4-9a944d9e2d48	440b9b48-ba0c-40fa-a001-557e89f8c2c9
8299e1da-26f9-4bb2-922c-5f47b4555d39	440b9b48-ba0c-40fa-a001-557e89f8c2c9
87914489-40a7-4d97-be82-6db44c8c381a	440b9b48-ba0c-40fa-a001-557e89f8c2c9
90e23ef9-0edc-4d1c-a8a4-244cf32f8ebf	440b9b48-ba0c-40fa-a001-557e89f8c2c9
a21f07a3-b377-460c-8cc1-7eaae7e08712	440b9b48-ba0c-40fa-a001-557e89f8c2c9
c2469d18-fb7d-494f-807d-136e0669a1a7	440b9b48-ba0c-40fa-a001-557e89f8c2c9
c805420f-3951-42e4-a07c-e5729e9a0a0f	440b9b48-ba0c-40fa-a001-557e89f8c2c9
cf2f3dc0-f9df-4968-b5a7-6560b5ccec54	440b9b48-ba0c-40fa-a001-557e89f8c2c9
0eb81f02-0594-483b-a814-0983a0be1336	461f45f3-e7e3-4d7b-aee1-dea1e35e9e53
dc49c780-22ed-452c-8408-e59a2eb67262	d7c9f0cb-5e75-4796-ba39-f8eafd6f3efb
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
3a950bbc-3d20-4b09-9453-72c06dc70a87	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	0c254f62-d047-47e1-a64d-bab6576911f1	\N
ac136600-b67b-4006-8326-1e536d90fd4a	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	\N	\N	0c254f62-d047-47e1-a64d-bab6576911f1	\N
f7d10f3f-9e8a-4d86-af8c-8befaa89cd60	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	0c254f62-d047-47e1-a64d-bab6576911f1	\N
253982b9-27ef-4455-86b1-c7569f47f6f7	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
2c9a9d73-a11d-4440-9bd7-caf0e1c1574e	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
bf9ed6ba-2015-45f8-b6ae-8a92df38651b	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	b184ca2b-e670-440a-9a35-49e678d00d65	\N
fcab832d-1ef9-4840-a02f-150b50e2427a	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
ff723667-314f-4d07-b37d-45bf0c5fa8b2	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	b184ca2b-e670-440a-9a35-49e678d00d65	\N
00a02f1c-0617-4879-9095-c60c55c21fd9	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
28089e66-0fd5-40a6-973c-9b33cc5bc465	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
2b1603f4-1b29-461b-b08a-e7b2f2950b70	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	b184ca2b-e670-440a-9a35-49e678d00d65	\N
3953f3c6-4c36-4a83-97b3-3526aee303e6	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	b184ca2b-e670-440a-9a35-49e678d00d65	\N
48e8f03c-14a4-4978-ac7b-707217b91faf	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
5181095d-d883-422f-89c5-4e735f93358e	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
756ee9cd-b4d4-4d7a-91a4-9a944d9e2d48	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
8299e1da-26f9-4bb2-922c-5f47b4555d39	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
87914489-40a7-4d97-be82-6db44c8c381a	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
90e23ef9-0edc-4d1c-a8a4-244cf32f8ebf	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
a21f07a3-b377-460c-8cc1-7eaae7e08712	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	b184ca2b-e670-440a-9a35-49e678d00d65	\N
c2469d18-fb7d-494f-807d-136e0669a1a7	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
c805420f-3951-42e4-a07c-e5729e9a0a0f	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
cf2f3dc0-f9df-4968-b5a7-6560b5ccec54	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	\N
0eb81f02-0594-483b-a814-0983a0be1336	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	0c254f62-d047-47e1-a64d-bab6576911f1	\N
dc49c780-22ed-452c-8408-e59a2eb67262	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$FTTDlq11YrJ3BL0PZmq22hczLnhj2A36dcruOzPR1HyKfjdB	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageResult; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageResult" ("Id", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "IsDone", "SeamId", "WeldPassageResultId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
12cf08a2-004d-4946-bfd2-9568d2677389	1d27ac1e-c3a9-4358-a8ea-5a0cb0d5e07b
199b6eb4-ca35-4d00-ac89-d0cfd67f849b	1d27ac1e-c3a9-4358-a8ea-5a0cb0d5e07b
29ae244e-f7cf-4b88-837e-101bd96f9847	98ae8e5f-c2ed-40b5-be4c-b11e3bbf580f
37fc5a29-cf93-40a5-b9f9-64f3b4265169	98ae8e5f-c2ed-40b5-be4c-b11e3bbf580f
3f6df430-cbac-4268-96f0-4e2ac8b07600	98ae8e5f-c2ed-40b5-be4c-b11e3bbf580f
48641d32-9e09-4e71-9e92-b34c5bc7c647	1d27ac1e-c3a9-4358-a8ea-5a0cb0d5e07b
52a69689-517d-4a81-9672-11b7a55e3672	5b0696dd-beab-4dfb-8d7b-618450d680d4
554f74f4-df97-4679-a71a-fb1d251c0e1d	98ae8e5f-c2ed-40b5-be4c-b11e3bbf580f
56b3b4f1-54f5-4005-8d67-5ac9fe6bfa9e	98ae8e5f-c2ed-40b5-be4c-b11e3bbf580f
713942a7-9c8f-462b-be9f-54f72ec19664	1d27ac1e-c3a9-4358-a8ea-5a0cb0d5e07b
7b809d5c-c889-4cd8-9c02-8a9cec3cb483	70aeabf8-c99e-4134-97a2-2060bd37ee57
ac9cffff-0c28-4a8a-88ed-a97cfda1f35c	5b0696dd-beab-4dfb-8d7b-618450d680d4
d19a1b5c-588e-49b6-afca-6adc9e918995	5b0696dd-beab-4dfb-8d7b-618450d680d4
f55ba5bf-75c4-4e1c-a5b4-11dabfe679be	70aeabf8-c99e-4134-97a2-2060bd37ee57
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
12cf08a2-004d-4946-bfd2-9568d2677389	cf2f3dc0-f9df-4968-b5a7-6560b5ccec54	\N	155288
199b6eb4-ca35-4d00-ac89-d0cfd67f849b	00a02f1c-0617-4879-9095-c60c55c21fd9	\N	153274
29ae244e-f7cf-4b88-837e-101bd96f9847	5181095d-d883-422f-89c5-4e735f93358e	\N	152365
37fc5a29-cf93-40a5-b9f9-64f3b4265169	756ee9cd-b4d4-4d7a-91a4-9a944d9e2d48	\N	121538
3f6df430-cbac-4268-96f0-4e2ac8b07600	c2469d18-fb7d-494f-807d-136e0669a1a7	\N	121537
48641d32-9e09-4e71-9e92-b34c5bc7c647	c805420f-3951-42e4-a07c-e5729e9a0a0f	\N	151861
52a69689-517d-4a81-9672-11b7a55e3672	2b1603f4-1b29-461b-b08a-e7b2f2950b70	\N	152444
554f74f4-df97-4679-a71a-fb1d251c0e1d	90e23ef9-0edc-4d1c-a8a4-244cf32f8ebf	\N	156298
56b3b4f1-54f5-4005-8d67-5ac9fe6bfa9e	28089e66-0fd5-40a6-973c-9b33cc5bc465	\N	147329
713942a7-9c8f-462b-be9f-54f72ec19664	87914489-40a7-4d97-be82-6db44c8c381a	\N	152441
7b809d5c-c889-4cd8-9c02-8a9cec3cb483	8299e1da-26f9-4bb2-922c-5f47b4555d39	\N	149921
ac9cffff-0c28-4a8a-88ed-a97cfda1f35c	a21f07a3-b377-460c-8cc1-7eaae7e08712	\N	152207
d19a1b5c-588e-49b6-afca-6adc9e918995	3953f3c6-4c36-4a83-97b3-3526aee303e6	\N	156278
f55ba5bf-75c4-4e1c-a5b4-11dabfe679be	48e8f03c-14a4-4978-ac7b-707217b91faf	\N	150402
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
1d27ac1e-c3a9-4358-a8ea-5a0cb0d5e07b	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
5b0696dd-beab-4dfb-8d7b-618450d680d4	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
70aeabf8-c99e-4134-97a2-2060bd37ee57	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
98ae8e5f-c2ed-40b5-be4c-b11e3bbf580f	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
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
02c14c23-9460-4d1d-aba5-76a2b4ff9231	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	b14779d7-cda8-4c52-a22d-0c0354d4f0fb	\N
0d4c045a-4b3d-40fe-b7bf-46ab6bb4028e	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	b14779d7-cda8-4c52-a22d-0c0354d4f0fb	\N
1cb44e7a-240d-49ba-9a37-2a99b8c66d03	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	b14779d7-cda8-4c52-a22d-0c0354d4f0fb	\N
e4347f0f-b26c-4fa7-be3c-7b484f58ecbb	1	12:10:00	13:10:00	13:20:00	13:50:00	22c7c510-fc0a-4f8a-9808-d31d8ef0de4d	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0cfd68a2-6a37-4b8d-812a-4273da79d522	2050	\N	b184ca2b-e670-440a-9a35-49e678d00d65	2050
1ebc4d7b-ae7f-40b9-bebb-a202bee0573c	1400	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1400
21682e20-91ff-43f0-89e8-06d5a858af4d	1280	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1280
34964b1e-1054-4b85-8c59-0a8de64d233f	1550	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1550
3e8cc334-af5c-45c7-ac6e-9913b0acf679	1270	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1270
46da3df1-db43-47ee-80cf-2691b9dbefb2	1390	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1390
48c54f41-50a8-4b31-99d4-d7684dfbaf61	1380	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1380
9db902f9-a461-4f99-849d-cf810ac50751	2130	\N	b184ca2b-e670-440a-9a35-49e678d00d65	2130
c3ff52e9-ace7-4abc-bbd0-c77a0a565194	1360	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1360
d83e5cdf-d873-4dbb-90f0-e4be1d493811	1260	\N	3543a59f-4852-4949-9929-f0b45b91dd6e	1260
db902a61-f715-4ad9-b4ed-2acdf7eeddf5	2150	\N	b184ca2b-e670-440a-9a35-49e678d00d65	2150
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
2b69447d-61f2-464b-bd4d-a384f201f11c	Цех 480	480	480
fcbafb2e-a483-4604-b636-51e4c5ad3db8	Цех 50	50	050
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
-- Name: WeldPassageResult PK_WeldPassageResult; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassageResult"
    ADD CONSTRAINT "PK_WeldPassageResult" PRIMARY KEY ("Id");


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
-- Name: IX_WeldPassageResult_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassageResult_IdFromSystem" ON public."WeldPassageResult" USING btree ("IdFromSystem");


--
-- Name: IX_WeldPassages_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassages_IdFromSystem" ON public."WeldPassages" USING btree ("IdFromSystem");


--
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


--
-- Name: IX_WeldPassages_WeldPassageResultId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_WeldPassageResultId" ON public."WeldPassages" USING btree ("WeldPassageResultId");


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
-- Name: WeldPassages FK_WeldPassages_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: WeldPassages FK_WeldPassages_WeldPassageResult_WeldPassageResultId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_WeldPassageResult_WeldPassageResultId" FOREIGN KEY ("WeldPassageResultId") REFERENCES public."WeldPassageResult"("Id");


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

