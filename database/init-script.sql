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
-- Name: ProductAccountWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductAccountWeldingEquipment" (
    "ProductAccountsId" uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
);


--
-- Name: ProductAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductAccounts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
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
    "ProductId" uuid NOT NULL,
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
    "Number" text NOT NULL,
    "Name" text NOT NULL,
    "PdmSystemFileLink" text,
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
    "WeldingDate" timestamp without time zone NOT NULL,
    "BasicMaterial" text,
    "MainMaterialBatchNumber" text,
    "WeldingMaterial" text,
    "WeldingMaterialBatchNumber" text,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL,
    "WelderId" uuid,
    "MasterId" uuid NOT NULL,
    "InspectorId" uuid,
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
0206c8d8-0b6b-42fb-8f70-4361e246b3e0	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
facd1723-0a0b-4d2a-94e0-3d3d9ba59e55	c9dcd68c-7404-4809-837b-ca9bbd1385fb	65f172ef-ea04-486e-8201-c26ea8d60520	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
bb0cc243-c2bf-459c-b641-382b46536af3	1	10	t	0206c8d8-0b6b-42fb-8f70-4361e246b3e0	\N
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
03b2d797-7ca7-4acf-bcf5-3f6d0a51c690	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
03eb678b-8b71-4ca8-b459-21cacdd56467	Сборочные операции	\N
0906daf7-34e9-453e-9d84-c90db9524a78	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
0d3214c6-130b-4eb8-96b7-9157fb4e861f	Контроль на рабочем месте	\N
1495f78d-56be-4cdc-85cd-d93e00a286d3	Отсутствие заданий	\N
21bab2ca-b582-4971-9894-d6dcc4ea14fc	Отсутствие материала, заготовок, деталей	\N
23c12347-8585-42c4-9b24-f15a67d9d379	Изменение режимов, смена инструмента, приспособления	\N
26de3ede-6264-4882-ae06-2024b2c23d0e	Работа по карте несоответствий	\N
2d002a32-c472-434b-bfd7-1b53343f2c4e	Праздники и выходные	\N
3518ab8e-5a32-4cb5-952c-2dd800e072db	Ознакомление с работой, документацией, инструктаж	\N
3cc829a0-5880-4f05-afbb-b2f9864a1a90	Отсутствие крана, транспорта	\N
56e9d5cb-5aa6-4756-a0ff-f64bec791b0d	Обед	\N
5ef0eb8f-ebbe-4fd5-9413-1907d0954bce	Нерабочее время по графику согласно сменности	\N
65a12193-3784-4b98-a4c5-2462d56875ce	Неявка оператора (б/лист, отпуск, и пр.)	\N
675031cf-77f9-448c-86ff-623dc70f0ffb	Плановый ремонт централизованными службами	\N
7156c259-fad5-462a-9a4e-75ecbf50d6e1	Работа с управляющей программой	\N
7abf1ba7-6c74-4bc9-8749-9f95adf9c68d	Отсутствие сотрудника ОТК	\N
871af8e9-f9cb-4552-884e-4fab2196c25d	Аварийный ремонт централизованными службами	\N
97b1e841-71f8-49c9-baaf-b850f9bb696c	Установка, выверка, снятие детали	\N
9ca5e7bc-342e-4ca0-afd9-5322b888e517	Естественные надобности	\N
a7be50f7-8627-4200-8c63-adf10c76158b	Отсутствие энергоносителей	\N
a80366ed-8d3c-4d8c-962e-b83b0a95b998	Отсутствие конструктора, технолога или ожидание его решения	\N
c5a58ffb-ae46-48d3-bdff-fbef3dcf9913	Отсутствие оператора в связи с необеспеченностью	\N
c9c91fb6-74ca-4ebc-ab42-6d68cac484b9	Установка, выверка, снятие детали	\N
fe63075b-07df-4ac0-a1f0-60194e934724	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
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
109c7822-dd86-4d90-a03f-84d48eaa5229	46d382f5-448c-491c-83e0-baeb7d5e1be1	219379
9530f76c-e412-4da9-b34a-8279659614a2	41509633-fe4c-4c19-9d89-5f5b4536ce1b	249550
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
631bc6be-645b-4ec3-8184-ada8d8298982	fd9c2e64-aa18-4d7f-84ca-22dd22865c39	\N
63478fef-5161-48a6-8609-005c1dd94615	39044429-9504-4e8b-b30d-7b7a8b568c76	610422
e3be6732-d1ae-489a-9eac-f188aabb30bc	94ee885f-0285-420a-a7fe-9e6fee6af6aa	614962
add6fb2e-e62b-47df-a35f-1ce46b0e5f80	f57198cd-0e29-4ca9-97da-d17246740a7d	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductAccountWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccountWeldingEquipment" ("ProductAccountsId", "WeldingEquipmentsId") FROM stdin;
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
0159d893-be3a-4716-893a-2c9c05cebcd6	32	2	2023-03-03 21:52:30.901877	caaf3d25-ddb0-44a0-9917-4b65dd76ccd3	\N
02dce638-1c5a-4800-86e1-e36a8e811c94	6	2	2023-03-03 21:52:30.900802	18c270d6-09db-4fbf-a726-b2cf5f759000	\N
062bca9d-0510-402c-8a5a-d4cb033a6892	35	2	2023-03-03 21:52:30.901996	cf066232-50b6-4066-9a29-511d5ebd692d	\N
0666b7af-2faa-4a22-8682-90ce56874003	20	2	2023-03-03 21:52:30.901387	8a17b912-9366-4762-a723-5898562a9dc6	\N
0818b24a-9450-40bb-8ee6-47228d0a12f1	13	2	2023-03-03 21:52:30.901086	6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	\N
10ac4a35-7e39-40df-bdf1-b7238f93e259	1	2	2023-03-03 21:52:30.872289	093a333d-0371-4654-b2d9-b977555f8409	\N
12540740-0257-421c-a87e-2cef468a247b	19	2	2023-03-03 21:52:30.90134	7fe5f726-0cb6-4444-a1aa-77ec76e5016e	\N
166c2a4d-2ccc-4723-bedb-3f085133f117	17	2	2023-03-03 21:52:30.901256	72eef802-e85d-4860-bfb3-13b8e650e271	\N
2da406b0-dad0-4630-893c-70698c727fce	10	2	2023-03-03 21:52:30.900965	4326c33f-b817-4403-961e-21d414ca8cbd	\N
4687afc5-f334-4c96-a534-b741af0334a4	14	2	2023-03-03 21:52:30.901125	6cf6ccc8-8be6-4577-a7f0-66b2629923c8	\N
4dace15c-accb-440e-afa8-cdf14dff6d51	37	2	2023-03-03 21:52:30.902076	d8f7d82d-de92-4d0c-b5ff-6cb38286f2dd	\N
4e0c458e-626c-48f7-ad85-98ff9cae9dec	11	2	2023-03-03 21:52:30.901005	4440041a-7257-4134-b02d-8a90a1da7920	\N
51a86aee-f0b8-4311-bb06-bf0a449c4616	15	2	2023-03-03 21:52:30.901167	6df9657c-8202-4052-8c36-13c52c8f7408	\N
66d6e029-59ef-4aea-ae61-656590055206	22	2	2023-03-03 21:52:30.901475	94088057-5952-47a8-849a-8fd99977c290	\N
6ad7770f-a2e1-440f-bb5b-797f2ebcda58	18	2	2023-03-03 21:52:30.901298	75823424-9ade-4295-8f7b-820baeb2fa5c	\N
6cb02cf5-e056-4824-ab5a-187174e2f5e7	30	2	2023-03-03 21:52:30.901797	bf19c2d5-90d3-4d05-a88f-935bf87f975c	\N
70633444-10b3-4cc9-a69f-d39aeaa82a13	23	2	2023-03-03 21:52:30.901518	9830206e-92b7-4218-9a55-c3d3ca418921	\N
75dd5661-3a57-4c12-ae02-74db31cdf2db	24	2	2023-03-03 21:52:30.901558	a39ae61d-d6e7-4a9a-9007-16d5ae8ee0da	\N
7c970b39-4410-46ed-862a-e7d6f207cee0	40	2	2023-03-03 21:52:30.902197	f558415e-1102-459e-8b9e-31399b0ef6ac	\N
801c9dcc-bd8e-43a3-990b-496e737d80bc	29	2	2023-03-03 21:52:30.901757	ba13ed49-43bb-46a3-9314-a62f1de8acee	\N
80fa22d4-6954-41c5-bbdd-f4d47b8ba99d	21	2	2023-03-03 21:52:30.901433	8b835f3b-2223-4d3f-9b8d-bc0efb77ee55	\N
826e8328-a888-4429-97cc-ac6cbf3e7816	27	2	2023-03-03 21:52:30.901678	b41c9008-c06a-43f4-a780-bde893577425	\N
8307677e-25ab-4178-b2de-6862745e48df	2	2	2023-03-03 21:52:30.900564	0de2c20d-3332-46c8-9053-6707df965cdf	\N
87259ac4-bc2b-4e8c-9e0e-a4e71e8265cf	26	2	2023-03-03 21:52:30.901638	b39eb6a6-f815-43a9-a317-e5e440e5421c	\N
88ea47cc-8f63-4af7-8a40-c7b2ae20e015	5	2	2023-03-03 21:52:30.90076	165aa09c-47b0-4e67-9691-10f56a49a1ce	\N
8e38091f-9bdc-457d-aba1-b6fc1d2abc85	25	2	2023-03-03 21:52:30.901598	af10d2d4-ec8f-4b14-8c24-3fcb6bdf3e91	\N
90df106b-2040-4fd9-8e36-4784e36108d4	38	2	2023-03-03 21:52:30.902115	f37b12d5-99a8-45bd-b7cd-de3cf2059d4e	\N
990eb857-116d-4dc4-9eab-67c665e4c3b5	39	2	2023-03-03 21:52:30.902158	f40c1d1e-5b16-41e1-ac2e-195153a8b403	\N
9ea40f8e-0c47-401e-bee0-df9927dfa945	12	2	2023-03-03 21:52:30.901046	450a06a2-f700-41dc-b64d-0b030cd06794	\N
a862b01f-4987-4e56-a87b-c53c8f9991ab	16	2	2023-03-03 21:52:30.901213	6edfff80-df21-4ffd-9e0a-f791d6442bb6	\N
aa774cca-11da-47fb-8a30-d70fff38a6f3	41	2	2023-03-03 21:52:30.902242	b9a7d21a-7616-4ab4-b431-7177d27396b7	\N
ab062d97-3959-49fe-b576-3e16973397b4	34	2	2023-03-03 21:52:30.901956	ce3a0422-78a9-4270-91ee-ced8448f539e	\N
ad805f4f-f692-4675-b971-eb0f4d9562f4	31	2	2023-03-03 21:52:30.901837	c67c9160-1fd2-4f26-b400-bb7b9237af59	\N
afc65642-725c-4cb2-983b-3ba0e8a3d7ca	33	2	2023-03-03 21:52:30.901917	cb8e10af-6e00-4088-8589-8c6ce8ab8c3c	\N
b984d5d4-3a22-4c05-ae90-dac0835963e5	3	2	2023-03-03 21:52:30.90067	0e98584b-a119-403f-8d4d-755b66d06698	\N
ce24b05b-214e-45a1-86fc-c84562b84b33	36	2	2023-03-03 21:52:30.902036	d2124876-08cd-4b29-a5f9-8b9da39b3d6b	\N
d7a1f979-8d86-49bb-91f2-5407e262e547	8	2	2023-03-03 21:52:30.900883	2a83d443-adbd-4aa4-905b-1a88080b4543	\N
e9c79d77-ad82-4bc8-ade8-59bdfefae96a	28	2	2023-03-03 21:52:30.901717	b8bef175-e69b-43a9-9ce8-9d2414f23b7c	\N
f232880f-0463-4409-8186-dcfa903318ec	4	2	2023-03-03 21:52:30.900716	1047b563-605a-413e-927b-9f69459834b8	\N
f37a9aea-252f-4550-97a0-6a1d97a1e975	42	2	2023-03-03 21:52:30.902281	eff68b32-76ca-45a5-9fbd-ae212eca093f	\N
fd3b5ad8-45b9-46d7-867d-398f42ee84d5	7	2	2023-03-03 21:52:30.900843	21e70a95-9804-4ce6-977f-0db3753f978d	\N
fd7a3c45-3c15-476d-8014-ab260c8b063c	9	2	2023-03-03 21:52:30.900925	2ee6a8d3-d157-4dfc-8da8-a25f281756c3	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
cf066232-50b6-4066-9a29-511d5ebd692d	093a333d-0371-4654-b2d9-b977555f8409
bf19c2d5-90d3-4d05-a88f-935bf87f975c	0de2c20d-3332-46c8-9053-6707df965cdf
ba13ed49-43bb-46a3-9314-a62f1de8acee	0e98584b-a119-403f-8d4d-755b66d06698
caaf3d25-ddb0-44a0-9917-4b65dd76ccd3	1047b563-605a-413e-927b-9f69459834b8
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	165aa09c-47b0-4e67-9691-10f56a49a1ce
ba13ed49-43bb-46a3-9314-a62f1de8acee	18c270d6-09db-4fbf-a726-b2cf5f759000
b8bef175-e69b-43a9-9ce8-9d2414f23b7c	21e70a95-9804-4ce6-977f-0db3753f978d
d2124876-08cd-4b29-a5f9-8b9da39b3d6b	2a83d443-adbd-4aa4-905b-1a88080b4543
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	2ee6a8d3-d157-4dfc-8da8-a25f281756c3
cf066232-50b6-4066-9a29-511d5ebd692d	4326c33f-b817-4403-961e-21d414ca8cbd
d2124876-08cd-4b29-a5f9-8b9da39b3d6b	4440041a-7257-4134-b02d-8a90a1da7920
72eef802-e85d-4860-bfb3-13b8e650e271	450a06a2-f700-41dc-b64d-0b030cd06794
caaf3d25-ddb0-44a0-9917-4b65dd76ccd3	6cf6ccc8-8be6-4577-a7f0-66b2629923c8
ba13ed49-43bb-46a3-9314-a62f1de8acee	6df9657c-8202-4052-8c36-13c52c8f7408
4326c33f-b817-4403-961e-21d414ca8cbd	6edfff80-df21-4ffd-9e0a-f791d6442bb6
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	72eef802-e85d-4860-bfb3-13b8e650e271
cf066232-50b6-4066-9a29-511d5ebd692d	75823424-9ade-4295-8f7b-820baeb2fa5c
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	7fe5f726-0cb6-4444-a1aa-77ec76e5016e
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	8a17b912-9366-4762-a723-5898562a9dc6
d2124876-08cd-4b29-a5f9-8b9da39b3d6b	8b835f3b-2223-4d3f-9b8d-bc0efb77ee55
ba13ed49-43bb-46a3-9314-a62f1de8acee	94088057-5952-47a8-849a-8fd99977c290
b8bef175-e69b-43a9-9ce8-9d2414f23b7c	9830206e-92b7-4218-9a55-c3d3ca418921
8a17b912-9366-4762-a723-5898562a9dc6	a39ae61d-d6e7-4a9a-9007-16d5ae8ee0da
d2124876-08cd-4b29-a5f9-8b9da39b3d6b	af10d2d4-ec8f-4b14-8c24-3fcb6bdf3e91
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	b39eb6a6-f815-43a9-a317-e5e440e5421c
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	b41c9008-c06a-43f4-a780-bde893577425
cf066232-50b6-4066-9a29-511d5ebd692d	b8bef175-e69b-43a9-9ce8-9d2414f23b7c
cf066232-50b6-4066-9a29-511d5ebd692d	b9a7d21a-7616-4ab4-b431-7177d27396b7
cf066232-50b6-4066-9a29-511d5ebd692d	ba13ed49-43bb-46a3-9314-a62f1de8acee
cf066232-50b6-4066-9a29-511d5ebd692d	bf19c2d5-90d3-4d05-a88f-935bf87f975c
bf19c2d5-90d3-4d05-a88f-935bf87f975c	c67c9160-1fd2-4f26-b400-bb7b9237af59
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	caaf3d25-ddb0-44a0-9917-4b65dd76ccd3
cf066232-50b6-4066-9a29-511d5ebd692d	cb8e10af-6e00-4088-8589-8c6ce8ab8c3c
72eef802-e85d-4860-bfb3-13b8e650e271	ce3a0422-78a9-4270-91ee-ced8448f539e
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	d2124876-08cd-4b29-a5f9-8b9da39b3d6b
cf066232-50b6-4066-9a29-511d5ebd692d	d8f7d82d-de92-4d0c-b5ff-6cb38286f2dd
ba13ed49-43bb-46a3-9314-a62f1de8acee	eff68b32-76ca-45a5-9fbd-ae212eca093f
d2124876-08cd-4b29-a5f9-8b9da39b3d6b	f37b12d5-99a8-45bd-b7cd-de3cf2059d4e
b39eb6a6-f815-43a9-a317-e5e440e5421c	f40c1d1e-5b16-41e1-ac2e-195153a8b403
b9a7d21a-7616-4ab4-b431-7177d27396b7	f558415e-1102-459e-8b9e-31399b0ef6ac
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
0616a066-9f6d-4186-a279-f0841cf546b2	0	1	\N	\N	12540740-0257-421c-a87e-2cef468a247b	\N
0643903b-9ea6-422e-9e83-a8bc2067259b	0	1	\N	\N	afc65642-725c-4cb2-983b-3ba0e8a3d7ca	\N
07495b4d-6f17-49d1-aa1e-5273cc51aee7	0	1	\N	\N	f37a9aea-252f-4550-97a0-6a1d97a1e975	\N
1677c049-9e1c-4673-8139-f30fd78b7aa6	0	1	\N	\N	0666b7af-2faa-4a22-8682-90ce56874003	\N
30a4d516-d364-4c9e-8f9c-e97a71bd7072	0	1	\N	\N	66d6e029-59ef-4aea-ae61-656590055206	\N
34d9a29c-8b45-4c88-9633-5130fc227188	0	1	\N	\N	02dce638-1c5a-4800-86e1-e36a8e811c94	\N
467c6076-00d3-4881-a979-322576aa008e	0	1	\N	\N	166c2a4d-2ccc-4723-bedb-3f085133f117	\N
5f9472c3-e519-4843-93e3-2decd999ff53	0	1	\N	\N	6ad7770f-a2e1-440f-bb5b-797f2ebcda58	\N
697ce5c1-53c7-4098-9fe5-9eaab7b7057e	0	1	\N	\N	b984d5d4-3a22-4c05-ae90-dac0835963e5	\N
703a5d68-dae9-42dc-a7e8-bbf95a16411a	0	1	\N	\N	9ea40f8e-0c47-401e-bee0-df9927dfa945	\N
760486ab-d518-441a-8f57-1be4382b0558	0	1	\N	\N	801c9dcc-bd8e-43a3-990b-496e737d80bc	\N
7d13b227-a39d-4236-8a9b-98b17d2abc41	0	1	\N	\N	0818b24a-9450-40bb-8ee6-47228d0a12f1	\N
7ddd25f9-05b4-4b59-be4c-ff30731a6468	0	1	\N	\N	990eb857-116d-4dc4-9eab-67c665e4c3b5	\N
820f9351-23df-4fac-960d-08da82624378	0	1	\N	\N	826e8328-a888-4429-97cc-ac6cbf3e7816	\N
8b245ac7-c89c-42d7-be70-a101f1ebd9a0	0	1	\N	\N	8307677e-25ab-4178-b2de-6862745e48df	\N
8ba2d7b5-048d-458f-afe0-4975ded9e7a6	0	1	\N	\N	2da406b0-dad0-4630-893c-70698c727fce	\N
998ade76-79c0-46e3-93e4-5ec780bac763	0	1	\N	\N	8e38091f-9bdc-457d-aba1-b6fc1d2abc85	\N
9a385d1a-4214-44e6-a312-867300645bd6	0	1	\N	\N	d7a1f979-8d86-49bb-91f2-5407e262e547	\N
9b3d55ff-1810-4b6f-9de7-4574bb6ed641	0	1	\N	\N	7c970b39-4410-46ed-862a-e7d6f207cee0	\N
9f9a00e1-0083-4604-93dd-334d4c6d56b4	0	1	\N	\N	75dd5661-3a57-4c12-ae02-74db31cdf2db	\N
a30f2d31-6838-48cb-84a1-22e31aea38df	0	1	\N	\N	fd3b5ad8-45b9-46d7-867d-398f42ee84d5	\N
a5f37ac3-4933-40c1-8fef-c8afab3e5e95	0	1	\N	\N	ce24b05b-214e-45a1-86fc-c84562b84b33	\N
a67d7144-6897-45e8-91ee-b2a6093b4ab1	0	1	\N	\N	88ea47cc-8f63-4af7-8a40-c7b2ae20e015	\N
b34a499a-b175-4218-9a11-f017eb2b6d4b	0	1	\N	\N	ab062d97-3959-49fe-b576-3e16973397b4	\N
b9b5b773-7e72-4e3e-a490-54929d05e1c9	0	1	\N	\N	90df106b-2040-4fd9-8e36-4784e36108d4	\N
bd55f442-0fe0-4eee-a164-86553944f274	0	1	\N	\N	4dace15c-accb-440e-afa8-cdf14dff6d51	\N
bf84b7d6-7385-4545-b58d-19fc23afd261	0	1	\N	\N	fd7a3c45-3c15-476d-8014-ab260c8b063c	\N
c6494e78-50d8-48e5-970c-d1116355ae65	0	1	\N	\N	87259ac4-bc2b-4e8c-9e0e-a4e71e8265cf	\N
ccbacb19-e659-4172-845f-9c46ac745e11	0	1	\N	\N	aa774cca-11da-47fb-8a30-d70fff38a6f3	\N
ce6a3bb1-3701-49cf-950f-40e02ee27fea	0	1	\N	\N	51a86aee-f0b8-4311-bb06-bf0a449c4616	\N
d6d526de-cc13-448b-8414-34d977e201bb	0	1	\N	\N	70633444-10b3-4cc9-a69f-d39aeaa82a13	\N
da6623bd-4de3-48ab-a8af-d7a153831b51	0	1	\N	\N	a862b01f-4987-4e56-a87b-c53c8f9991ab	\N
daa6180a-43d4-4f28-8240-4541cddd679f	0	1	\N	\N	062bca9d-0510-402c-8a5a-d4cb033a6892	\N
e08ddbaa-b2a0-4105-9247-f7792e5d211c	0	1	\N	\N	6cb02cf5-e056-4824-ab5a-187174e2f5e7	\N
e582864b-aa82-4c3d-b63e-e8e19245b2ee	0	1	\N	\N	4687afc5-f334-4c96-a534-b741af0334a4	\N
ea37de15-5cbb-41b6-a34a-a714de314d10	0	1	\N	\N	e9c79d77-ad82-4bc8-ade8-59bdfefae96a	\N
eba5991d-cf76-47c4-8986-1d6da7b13189	0	1	\N	\N	10ac4a35-7e39-40df-bdf1-b7238f93e259	\N
eba9d0df-ab0e-46dd-8198-4647f30b407c	0	1	\N	\N	4e0c458e-626c-48f7-ad85-98ff9cae9dec	\N
ec0a3897-66d7-4d6f-bd12-f8ef1309c4cd	0	1	\N	\N	0159d893-be3a-4716-893a-2c9c05cebcd6	\N
f590b76c-c603-45e0-8c6a-440fc40b9da1	0	1	\N	\N	ad805f4f-f692-4675-b971-eb0f4d9562f4	\N
fa628e9f-f170-4db6-9a80-fd8f142e9e46	0	1	\N	\N	f232880f-0463-4409-8186-dcfa903318ec	\N
ff6372be-2cfa-4255-b975-906ff9c2751d	0	1	\N	\N	80fa22d4-6954-41c5-bbdd-f4d47b8ba99d	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
3152bf6d-b2ac-4d00-8140-5da186d57790	Сборка, сварка рам к/с г/п 120-130 т.	6	65f172ef-ea04-486e-8201-c26ea8d60520	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
093a333d-0371-4654-b2d9-b977555f8409	Поперечина	75131-2801103-10	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
0de2c20d-3332-46c8-9053-6707df965cdf	Опора	75131-2801188	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
0e98584b-a119-403f-8d4d-755b66d06698	Лист верхний	75131-2801357-10	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
1047b563-605a-413e-927b-9f69459834b8	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
165aa09c-47b0-4e67-9691-10f56a49a1ce	Усилитель	75131-2801115-01	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
18c270d6-09db-4fbf-a726-b2cf5f759000	Кронштейн задней опоры	75131-8521183-20	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
21e70a95-9804-4ce6-977f-0db3753f978d	Опора	75131-2801188	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
2a83d443-adbd-4aa4-905b-1a88080b4543	Кронштейн задней опоры	75131-8521183-20	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
2ee6a8d3-d157-4dfc-8da8-a25f281756c3	Усилитель	75131-2801114-01	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
4326c33f-b817-4403-961e-21d414ca8cbd	Лонжерон рамы правый	75131-2801014-41	t	2	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
4440041a-7257-4134-b02d-8a90a1da7920	Лист нижний	75131-2801358-10	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
450a06a2-f700-41dc-b64d-0b030cd06794	Опора	75131-2801188	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
6bc040bb-741b-4f4f-a362-12bcd8a9bb0d	Рама	75131-2800010-70	t	1	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	4536479362
6cf6ccc8-8be6-4577-a7f0-66b2629923c8	Опора	75131-2801188	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
6df9657c-8202-4052-8c36-13c52c8f7408	Поперечина	75131-2801325	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
6edfff80-df21-4ffd-9e0a-f791d6442bb6	Опора	75131-2801188	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
72eef802-e85d-4860-bfb3-13b8e650e271	Лонжерон рамы правый	75131-2801016-70	t	2	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
75823424-9ade-4295-8f7b-820baeb2fa5c	Поперечина №3 рамы с опорами	75132-2801152	t	2	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
7fe5f726-0cb6-4444-a1aa-77ec76e5016e	Поперечина	75131-2801103-10	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
8a17b912-9366-4762-a723-5898562a9dc6	Лонжерон рамы правый	75131-2801014-41	t	2	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
8b835f3b-2223-4d3f-9b8d-bc0efb77ee55	Лист верхний	75131-2801357-10	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
94088057-5952-47a8-849a-8fd99977c290	Кронштейн задней опоры	75131-8521182-20	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
9830206e-92b7-4218-9a55-c3d3ca418921	Накладка рамы поперечная передняя	75131-2801088-70	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
a39ae61d-d6e7-4a9a-9007-16d5ae8ee0da	Опора	75131-2801188	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
af10d2d4-ec8f-4b14-8c24-3fcb6bdf3e91	Поперечина	75131-2801325	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
b39eb6a6-f815-43a9-a317-e5e440e5421c	Лонжерон рамы левый	75131-2801015-41	t	2	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
b41c9008-c06a-43f4-a780-bde893577425	Поперечина №3 рамы с опорами	75132-2801152	t	2	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
b8bef175-e69b-43a9-9ce8-9d2414f23b7c	Лонжерон рамы левый	75131-2801017-70	t	2	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
ba13ed49-43bb-46a3-9314-a62f1de8acee	Поперечина рамы задняя	75131-2801300-20	t	2	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
bf19c2d5-90d3-4d05-a88f-935bf87f975c	Лонжерон рамы правый	75131-2801016-70	t	2	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
c67c9160-1fd2-4f26-b400-bb7b9237af59	Накладка рамы поперечная передняя	75131-2801088-70	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
caaf3d25-ddb0-44a0-9917-4b65dd76ccd3	Лонжерон рамы левый	75131-2801017-70	t	2	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
cb8e10af-6e00-4088-8589-8c6ce8ab8c3c	Усилитель	75131-2801114-01	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
ce3a0422-78a9-4270-91ee-ced8448f539e	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
cf066232-50b6-4066-9a29-511d5ebd692d	Рама	7513D-2800010-20	t	1	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	4536492774
d2124876-08cd-4b29-a5f9-8b9da39b3d6b	Поперечина рамы задняя	75131-2801300-20	t	2	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
d8f7d82d-de92-4d0c-b5ff-6cb38286f2dd	Усилитель	75131-2801115-01	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
f37b12d5-99a8-45bd-b7cd-de3cf2059d4e	Кронштейн задней опоры	75131-8521182-20	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
f40c1d1e-5b16-41e1-ac2e-195153a8b403	Опора	75131-2801188	t	3	b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
f558415e-1102-459e-8b9e-31399b0ef6ac	Опора	75131-2801188	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N	\N	\N
b9a7d21a-7616-4ab4-b431-7177d27396b7	Лонжерон рамы левый	75131-2801015-41	t	2	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	63478fef-5161-48a6-8609-005c1dd94615	\N	\N	\N
eff68b32-76ca-45a5-9fbd-ae212eca093f	Лист нижний	75131-2801358-10	t	3	8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	3152bf6d-b2ac-4d00-8140-5da186d57790	63478fef-5161-48a6-8609-005c1dd94615	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
ce7290b0-c3d0-4860-9789-42c31cf00e1b	Admin	\N
58179d99-4121-414d-9ec5-b84adec06035	Master	\N
0229a156-e0a3-4545-8a17-7f7192572977	Welder	\N
5478521e-5cde-4cd7-ab83-5f2622586f0e	Inspector	\N
5b319611-33f0-4554-84fa-2882f684534b	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
077e9865-ecd3-4932-a95a-f4dfb28497cc	58	900	t	f	f40c1d1e-5b16-41e1-ac2e-195153a8b403	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
09cbdf59-5865-4f63-99b9-8d16181f8241	39	280	t	f	ce3a0422-78a9-4270-91ee-ced8448f539e	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
0a847437-3e7a-49fc-a581-d2d3700f3f55	54	400	t	f	6edfff80-df21-4ffd-9e0a-f791d6442bb6	bc281ea6-17a4-4a5e-9e75-1b62039ec081	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
0ff417ff-c497-4565-b750-6e35dbf658bf	52	1200	t	f	d8f7d82d-de92-4d0c-b5ff-6cb38286f2dd	ab4a0a45-8183-459d-adde-69b5adb5512d	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
141d169f-0f16-4be0-87a9-f3fb17650e32	39	280	t	f	1047b563-605a-413e-927b-9f69459834b8	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
1566c15e-b632-422e-9f79-5fef479aaea3	2	1880	t	f	0e98584b-a119-403f-8d4d-755b66d06698	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
20a2b05b-9c38-44e2-a8ef-d4d12e26822e	39	280	t	f	ba13ed49-43bb-46a3-9314-a62f1de8acee	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
26122af8-cad4-46ce-8953-dc46e06804de	1	1900	t	f	af10d2d4-ec8f-4b14-8c24-3fcb6bdf3e91	4fdd621c-9d71-49dd-8c39-6c2572a1a220	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
290126bd-676d-4a29-9e27-a3aac0dc5ab1	39	280	t	f	c67c9160-1fd2-4f26-b400-bb7b9237af59	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
2a9a9c7b-5d01-4136-9a21-3eb1109c6393	2	1880	t	f	18c270d6-09db-4fbf-a726-b2cf5f759000	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
2d6a2b3f-5c06-4011-87ef-1c9b77f9c78e	18	4000	t	f	b9a7d21a-7616-4ab4-b431-7177d27396b7	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
30c30653-56ce-40c1-803c-23dbdac255cc	58	900	t	f	f558415e-1102-459e-8b9e-31399b0ef6ac	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
331801c5-c3ba-45fe-add0-3f3653d65926	52	1200	t	f	165aa09c-47b0-4e67-9691-10f56a49a1ce	ab4a0a45-8183-459d-adde-69b5adb5512d	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
34b223a5-52d3-4e2f-bbba-274326440be0	57	400	t	f	21e70a95-9804-4ce6-977f-0db3753f978d	0723b41d-c6a4-435a-8748-4f6c47b6eb8f	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
38470856-aff5-4e7d-bada-4d3825a74fef	18	4000	t	f	8a17b912-9366-4762-a723-5898562a9dc6	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
3bfdf6fb-ae42-4a66-b823-fdc226aa84e1	57	400	t	f	6cf6ccc8-8be6-4577-a7f0-66b2629923c8	0723b41d-c6a4-435a-8748-4f6c47b6eb8f	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
433ac9e9-ed0e-484b-b03a-2100d037a7d3	39	280	t	f	b39eb6a6-f815-43a9-a317-e5e440e5421c	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
447f6dba-d913-4e9f-95b0-dfa1bfc9c98f	58	900	t	f	21e70a95-9804-4ce6-977f-0db3753f978d	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
45123d71-c015-4948-922b-416a31822ec6	39	280	t	f	9830206e-92b7-4218-9a55-c3d3ca418921	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
45ed287f-00b8-4465-93bf-2cdb5579f897	58	900	t	f	450a06a2-f700-41dc-b64d-0b030cd06794	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
4fb5a6f5-0cc1-42ba-9afb-1d923f4ca313	1	1900	t	f	8b835f3b-2223-4d3f-9b8d-bc0efb77ee55	4fdd621c-9d71-49dd-8c39-6c2572a1a220	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
5a609941-3b5d-43b3-94ab-6208213b9b0a	2	1880	t	f	8b835f3b-2223-4d3f-9b8d-bc0efb77ee55	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
5a71d0c2-ce26-4403-93ec-670fdf818fde	54	400	t	f	a39ae61d-d6e7-4a9a-9007-16d5ae8ee0da	bc281ea6-17a4-4a5e-9e75-1b62039ec081	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
6b3be697-bcb4-4823-a22d-ac130ef83ac5	56	400	t	f	f40c1d1e-5b16-41e1-ac2e-195153a8b403	beecffbe-31cf-409f-ab02-ad287f8b52b2	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
6d1bac6d-ae74-44fe-bb24-efe78bd70325	18	4000	t	f	4326c33f-b817-4403-961e-21d414ca8cbd	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
6ea69b45-45a2-441e-b045-aea55828e292	52	1200	t	f	cb8e10af-6e00-4088-8589-8c6ce8ab8c3c	ab4a0a45-8183-459d-adde-69b5adb5512d	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
794a6936-137f-4151-8e1b-5260e6c32651	58	900	t	f	6cf6ccc8-8be6-4577-a7f0-66b2629923c8	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
865ee11e-bd03-48b5-8526-e772bebca9b4	39	280	t	f	4326c33f-b817-4403-961e-21d414ca8cbd	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
8c8c1724-5b24-4f85-84ba-48ea26a01c64	1	1900	t	f	6df9657c-8202-4052-8c36-13c52c8f7408	4fdd621c-9d71-49dd-8c39-6c2572a1a220	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
905c264a-9061-4564-abd3-24966f942cf6	52	1200	t	f	093a333d-0371-4654-b2d9-b977555f8409	ab4a0a45-8183-459d-adde-69b5adb5512d	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
909fc5e9-5276-41f4-a9e6-c533cacabc6e	39	280	t	f	8a17b912-9366-4762-a723-5898562a9dc6	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
939062f8-67cf-4036-b74e-fb55efed1e59	39	280	t	f	b9a7d21a-7616-4ab4-b431-7177d27396b7	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
954eff36-5d3b-44f9-a9eb-e9479d31c6ae	2	1880	t	f	af10d2d4-ec8f-4b14-8c24-3fcb6bdf3e91	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
95a25dcf-87b2-41c4-b405-2d32dca120b0	55	400	t	f	450a06a2-f700-41dc-b64d-0b030cd06794	33ee2423-b039-4283-8914-0073bac359f7	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
976eb0a9-5d76-455b-b552-fbbd734c8e4f	58	900	t	f	a39ae61d-d6e7-4a9a-9007-16d5ae8ee0da	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
a2691490-d144-4aca-8951-484eb7eff41f	39	280	t	f	d2124876-08cd-4b29-a5f9-8b9da39b3d6b	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
a2e85541-e976-4a13-be38-f6082ee5330f	2	1880	t	f	2a83d443-adbd-4aa4-905b-1a88080b4543	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
aa878237-c7c9-445f-94f5-702c4d1740c5	56	400	t	f	f558415e-1102-459e-8b9e-31399b0ef6ac	beecffbe-31cf-409f-ab02-ad287f8b52b2	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
abc2eebc-7662-4fc1-9c64-08ac8022ac2c	58	900	t	f	0de2c20d-3332-46c8-9053-6707df965cdf	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
af50c554-ef08-4b7f-a13b-14c20c796fbf	18	4000	t	f	b39eb6a6-f815-43a9-a317-e5e440e5421c	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
b34d0d82-d24a-4d30-83db-d5a39c59632a	55	400	t	f	0de2c20d-3332-46c8-9053-6707df965cdf	33ee2423-b039-4283-8914-0073bac359f7	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
ba817bef-7fe2-4415-bf82-37f313ced8af	2	1880	t	f	f37b12d5-99a8-45bd-b7cd-de3cf2059d4e	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
bc45d690-30e9-4ad8-9da0-59379f0faf32	1	1900	t	f	0e98584b-a119-403f-8d4d-755b66d06698	4fdd621c-9d71-49dd-8c39-6c2572a1a220	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
bf4876e9-2946-42d7-a31c-bcfc7686531c	2	1880	t	f	94088057-5952-47a8-849a-8fd99977c290	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
cb4f914e-a26b-4426-930b-29e3501cbf60	52	1200	t	f	7fe5f726-0cb6-4444-a1aa-77ec76e5016e	ab4a0a45-8183-459d-adde-69b5adb5512d	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
cbce830e-e5c6-4e72-bb37-360ec45e4849	18	4000	t	f	b41c9008-c06a-43f4-a780-bde893577425	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
d28db299-b9ec-470d-8772-c1908c2354fc	18	4000	t	f	75823424-9ade-4295-8f7b-820baeb2fa5c	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
d6280b94-08c3-48a1-ae47-5e28bb9f2208	2	1880	t	f	6df9657c-8202-4052-8c36-13c52c8f7408	63051022-07d0-47fe-947d-d8639442fe1b	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
dcf1766e-4d1c-42c1-b87c-4f8ba1df30d1	48	1900	t	f	eff68b32-76ca-45a5-9fbd-ae212eca093f	34a317e5-d624-4282-accd-fce5c7deaacc	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
f26fec38-5423-4d51-b0ce-a00c290b302f	48	1900	t	f	4440041a-7257-4134-b02d-8a90a1da7920	34a317e5-d624-4282-accd-fce5c7deaacc	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
f2c49d0e-a3a9-44d0-bc14-ee736aebcc62	58	900	t	f	6edfff80-df21-4ffd-9e0a-f791d6442bb6	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
fc3345cd-a1cc-48ef-b7d0-db91276f3e83	52	1200	t	f	2ee6a8d3-d157-4dfc-8da8-a25f281756c3	ab4a0a45-8183-459d-adde-69b5adb5512d	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
0723b41d-c6a4-435a-8748-4f6c47b6eb8f	57	Инструкция 57	57
33ee2423-b039-4283-8914-0073bac359f7	55	Инструкция 55	55
34a317e5-d624-4282-accd-fce5c7deaacc	48	Инструкция 48	48
4fdd621c-9d71-49dd-8c39-6c2572a1a220	1	Инструкция 1	1
63051022-07d0-47fe-947d-d8639442fe1b	2	Инструкция 2	2
9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	39	Инструкция 39	39
a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	58	Инструкция 58	58
ab4a0a45-8183-459d-adde-69b5adb5512d	52	Инструкция 52	52
bc281ea6-17a4-4a5e-9e75-1b62039ec081	54	Инструкция 54	54
beecffbe-31cf-409f-ab02-ad287f8b52b2	56	Инструкция 56	56
d96d8d8e-9be1-4b8a-8474-8504cb802f04	18	Инструкция 18	18
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
8a34b24e-f6e3-4bc8-8420-4eb3f11ecbe3	7513D-2800010-20	Рама	\N	3330041
b7ecb3c8-ff40-4591-92bf-7e1d6d6e5817	75131-2800010-70	Рама	\N	3291137
ba7894a7-12d5-407f-a6d1-8ba22c7cda5b	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
41509633-fe4c-4c19-9d89-5f5b4536ce1b	5478521e-5cde-4cd7-ab83-5f2622586f0e
46d382f5-448c-491c-83e0-baeb7d5e1be1	5478521e-5cde-4cd7-ab83-5f2622586f0e
39044429-9504-4e8b-b30d-7b7a8b568c76	58179d99-4121-414d-9ec5-b84adec06035
94ee885f-0285-420a-a7fe-9e6fee6af6aa	58179d99-4121-414d-9ec5-b84adec06035
fd9c2e64-aa18-4d7f-84ca-22dd22865c39	58179d99-4121-414d-9ec5-b84adec06035
15c76d7a-a156-4a58-9e17-47f93dfb0097	0229a156-e0a3-4545-8a17-7f7192572977
313b4492-b3e0-4769-a50f-0ea593b8160c	0229a156-e0a3-4545-8a17-7f7192572977
51700dd0-be8b-4b92-9859-4cbea3a63977	0229a156-e0a3-4545-8a17-7f7192572977
5d94c4ae-6095-43fa-96ef-bb2cfae84f07	0229a156-e0a3-4545-8a17-7f7192572977
6125cb86-613e-4fd2-ad3c-0bb031aed74a	0229a156-e0a3-4545-8a17-7f7192572977
ab07eb7b-e181-4a28-8180-97454f0800e7	0229a156-e0a3-4545-8a17-7f7192572977
b0e23b2f-2558-4c74-aa7e-0321863f1568	0229a156-e0a3-4545-8a17-7f7192572977
b593a4c0-4ddf-4b9e-bd85-eb656dbefd65	0229a156-e0a3-4545-8a17-7f7192572977
c9dcd68c-7404-4809-837b-ca9bbd1385fb	5b319611-33f0-4554-84fa-2882f684534b
ed31a491-45dd-43f4-a804-320dd720c962	ce7290b0-c3d0-4860-9789-42c31cf00e1b
34cc53e6-9f00-4ed0-bd61-9c9fddd5e9ac	0229a156-e0a3-4545-8a17-7f7192572977
cc3d7758-19cd-495a-bbe3-c5416ddc2912	5478521e-5cde-4cd7-ab83-5f2622586f0e
bd714e03-5ac7-47a3-a012-8fa4ea7ec722	5b319611-33f0-4554-84fa-2882f684534b
f57198cd-0e29-4ca9-97da-d17246740a7d	58179d99-4121-414d-9ec5-b84adec06035
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
41509633-fe4c-4c19-9d89-5f5b4536ce1b	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
46d382f5-448c-491c-83e0-baeb7d5e1be1	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
39044429-9504-4e8b-b30d-7b7a8b568c76	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
94ee885f-0285-420a-a7fe-9e6fee6af6aa	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
fd9c2e64-aa18-4d7f-84ca-22dd22865c39	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
15c76d7a-a156-4a58-9e17-47f93dfb0097	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:F1:7D:5A	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
313b4492-b3e0-4769-a50f-0ea593b8160c	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
51700dd0-be8b-4b92-9859-4cbea3a63977	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
5d94c4ae-6095-43fa-96ef-bb2cfae84f07	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
6125cb86-613e-4fd2-ad3c-0bb031aed74a	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
ab07eb7b-e181-4a28-8180-97454f0800e7	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	B7:5A:79:B5	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
b0e23b2f-2558-4c74-aa7e-0321863f1568	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
b593a4c0-4ddf-4b9e-bd85-eb656dbefd65	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
c9dcd68c-7404-4809-837b-ca9bbd1385fb	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
ed31a491-45dd-43f4-a804-320dd720c962	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$8nYaQAylnziKHeLXcWap8yo1pFnb0zqw9lJWFcW3r43dkRFi	\N	\N	\N	\N	\N	\N
34cc53e6-9f00-4ed0-bd61-9c9fddd5e9ac	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$B30Zuw2HkMrO5a4kXTGgVPs46uFdZXG5tANDEzHvxkZ1y81D	\N	\N	\N	\N	\N	\N
cc3d7758-19cd-495a-bbe3-c5416ddc2912	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$tAx1g6eDHAB5iahzoGHXWzfClUAAeGeV+yIGkxBkqEFkH3uG	\N	\N	\N	\N	\N	\N
bd714e03-5ac7-47a3-a012-8fa4ea7ec722	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$T1MnUviZypggtRb4buPsPD0+lp63QPZBX6qY5z9r1zD9FWI+	\N	\N	\N	\N	\N	\N
f57198cd-0e29-4ca9-97da-d17246740a7d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$KeFgCu3ARui6KFm9PnUI+kiQ9Q5+FzQEGnU+FQ7+4+8m1A8Q	\N	\N	\N	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
082eeb0e-c6ac-4343-8b4e-c52d7e173987	1	Заполняющий	230	270	23	26	0	0	a159aa4e-edcf-4087-a6e4-ae4c72c5e2da	\N
0dc47fce-f301-4f03-b6e6-b7476519c860	1	Заполняющий	230	270	23	26	0	0	beecffbe-31cf-409f-ab02-ad287f8b52b2	\N
0fa9abdb-9032-4a3b-b3f1-9b822f8e99da	1	Заполняющий	230	270	23	26	0	0	63051022-07d0-47fe-947d-d8639442fe1b	\N
631a4695-e1ec-4bdc-a805-ad508142907c	1	Заполняющий	230	270	23	26	0	0	34a317e5-d624-4282-accd-fce5c7deaacc	\N
6acc34ac-4218-433e-9061-0ae04139d4c1	1	Заполняющий	230	270	23	26	0	0	bc281ea6-17a4-4a5e-9e75-1b62039ec081	\N
8469aca3-ae7c-4782-aa1f-6dda272cd659	1	Заполняющий	230	270	23	26	0	0	0723b41d-c6a4-435a-8748-4f6c47b6eb8f	\N
98ecfd58-cc06-41f1-bacb-3858b5da4bc3	1	Заполняющий	230	270	23	26	0	0	d96d8d8e-9be1-4b8a-8474-8504cb802f04	\N
a63e2bda-08bb-4bf7-9eed-fab9c88e71a6	1	Заполняющий	230	270	23	26	0	0	4fdd621c-9d71-49dd-8c39-6c2572a1a220	\N
ba1145cf-c5b8-413e-ac02-798652a856ff	1	Заполняющий	230	270	23	26	0	0	ab4a0a45-8183-459d-adde-69b5adb5512d	\N
c5cd5890-f16e-4bdd-89f2-acaa3ffb9e90	1	Заполняющий	230	270	23	26	0	0	9cd00cd2-ec8e-4e5f-86c8-5733bb7a4aa4	\N
f709d8ce-d51a-45d3-83ea-271bd33e0307	1	Заполняющий	230	270	23	26	0	0	33ee2423-b039-4283-8914-0073bac359f7	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
3b10c7da-85e9-4aea-962f-451c6ea576e4	1	Корневой	82	0.11	0.68	\N	\N	\N	8141afc8-f524-44e4-8d9a-6d8282e84fdb	bf568fb5-cf45-4c3f-b307-d852c7f864a8	\N
5df91ba0-a1ad-4925-80e6-4ddbbd68b9da	1	Корневой	82	0.11	0.68	\N	\N	\N	20c09508-7e6a-49d1-ba59-f0552bd12d6b	ebced9cb-ed17-4b4c-a9d2-253366ae2297	\N
803fda30-3b01-46e0-ae7b-0083740169f1	2	Заполняющий	100	0.22	0.44	\N	\N	\N	de20d545-905c-4db2-a7a0-527718e34d07	ebced9cb-ed17-4b4c-a9d2-253366ae2297	\N
e055cda0-056e-4aac-875f-3ea0270fca99	2	Заполняющий	100	0.22	0.44	\N	\N	\N	6ec2d626-fc10-461e-819e-04046a892a0d	bf568fb5-cf45-4c3f-b307-d852c7f864a8	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
1ee06a44-f8ad-4d1a-9533-8457f5f27136	3e02530e-2f14-4c3a-a037-f5358fb39c0e
1ee06a44-f8ad-4d1a-9533-8457f5f27136	4e165e60-4417-4281-be74-6434a5d010ae
2c6c3745-5141-41de-a7e6-163425479b3d	a3ea49d5-2b1a-4155-8be4-b5d04c10c213
a3f2e8de-9175-4a9c-8129-d1ddd22d3ef4	3e02530e-2f14-4c3a-a037-f5358fb39c0e
a3f2e8de-9175-4a9c-8129-d1ddd22d3ef4	4e165e60-4417-4281-be74-6434a5d010ae
c30c1add-9804-49d9-ba7b-7794bc1e76b3	3e02530e-2f14-4c3a-a037-f5358fb39c0e
c30c1add-9804-49d9-ba7b-7794bc1e76b3	4e165e60-4417-4281-be74-6434a5d010ae
e04111a0-a6da-41c8-ae1a-edadc6eb9665	90724f82-8648-4ebc-83db-8166748f4e2b
e1904658-7bf7-452e-ac1e-9c18c44f26f3	3e02530e-2f14-4c3a-a037-f5358fb39c0e
e1904658-7bf7-452e-ac1e-9c18c44f26f3	4e165e60-4417-4281-be74-6434a5d010ae
f704e95d-5f70-4998-84eb-b18b4d3ca890	90724f82-8648-4ebc-83db-8166748f4e2b
fca4e7ae-4d98-4669-89de-9ec15278edc3	a3ea49d5-2b1a-4155-8be4-b5d04c10c213
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
1ee06a44-f8ad-4d1a-9533-8457f5f27136	313b4492-b3e0-4769-a50f-0ea593b8160c	\N	150882
2c6c3745-5141-41de-a7e6-163425479b3d	b593a4c0-4ddf-4b9e-bd85-eb656dbefd65	\N	122575
a3f2e8de-9175-4a9c-8129-d1ddd22d3ef4	ab07eb7b-e181-4a28-8180-97454f0800e7	\N	114729
c30c1add-9804-49d9-ba7b-7794bc1e76b3	5d94c4ae-6095-43fa-96ef-bb2cfae84f07	\N	146164
e04111a0-a6da-41c8-ae1a-edadc6eb9665	15c76d7a-a156-4a58-9e17-47f93dfb0097	\N	121267
e1904658-7bf7-452e-ac1e-9c18c44f26f3	51700dd0-be8b-4b92-9859-4cbea3a63977	\N	150838
f704e95d-5f70-4998-84eb-b18b4d3ca890	6125cb86-613e-4fd2-ad3c-0bb031aed74a	\N	117390
fca4e7ae-4d98-4669-89de-9ec15278edc3	b0e23b2f-2558-4c74-aa7e-0321863f1568	\N	132695
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
3e02530e-2f14-4c3a-a037-f5358fb39c0e	128dc54a-dbd3-4935-b481-e7c50a8cc559
3e02530e-2f14-4c3a-a037-f5358fb39c0e	183bcd07-258d-4586-84a0-df205621a62f
3e02530e-2f14-4c3a-a037-f5358fb39c0e	3b85112e-258b-4fab-bd8d-90c72515b55d
3e02530e-2f14-4c3a-a037-f5358fb39c0e	60278de0-15ee-48db-9afc-ebb551aca864
4e165e60-4417-4281-be74-6434a5d010ae	128dc54a-dbd3-4935-b481-e7c50a8cc559
4e165e60-4417-4281-be74-6434a5d010ae	183bcd07-258d-4586-84a0-df205621a62f
4e165e60-4417-4281-be74-6434a5d010ae	3b85112e-258b-4fab-bd8d-90c72515b55d
4e165e60-4417-4281-be74-6434a5d010ae	60278de0-15ee-48db-9afc-ebb551aca864
90724f82-8648-4ebc-83db-8166748f4e2b	39c57933-968d-4afe-82c6-82c2824d00e3
90724f82-8648-4ebc-83db-8166748f4e2b	60278de0-15ee-48db-9afc-ebb551aca864
a3ea49d5-2b1a-4155-8be4-b5d04c10c213	3b85112e-258b-4fab-bd8d-90c72515b55d
a3ea49d5-2b1a-4155-8be4-b5d04c10c213	da498be2-4a0f-418e-a31b-ebadd524db5d
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
3e02530e-2f14-4c3a-a037-f5358fb39c0e	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	63478fef-5161-48a6-8609-005c1dd94615	49283
4e165e60-4417-4281-be74-6434a5d010ae	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	63478fef-5161-48a6-8609-005c1dd94615	49141
90724f82-8648-4ebc-83db-8166748f4e2b	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	63478fef-5161-48a6-8609-005c1dd94615	49232
a3ea49d5-2b1a-4155-8be4-b5d04c10c213	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	63478fef-5161-48a6-8609-005c1dd94615	49286
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
20c09508-7e6a-49d1-ba59-f0552bd12d6b	2023-03-03 21:52:30.731693	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	3e02530e-2f14-4c3a-a037-f5358fb39c0e	e04111a0-a6da-41c8-ae1a-edadc6eb9665	63478fef-5161-48a6-8609-005c1dd94615	\N
6ec2d626-fc10-461e-819e-04046a892a0d	2023-03-03 21:52:30.731576	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	3e02530e-2f14-4c3a-a037-f5358fb39c0e	e04111a0-a6da-41c8-ae1a-edadc6eb9665	63478fef-5161-48a6-8609-005c1dd94615	\N
8141afc8-f524-44e4-8d9a-6d8282e84fdb	2023-03-03 21:52:30.731462	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	3e02530e-2f14-4c3a-a037-f5358fb39c0e	e04111a0-a6da-41c8-ae1a-edadc6eb9665	63478fef-5161-48a6-8609-005c1dd94615	\N
de20d545-905c-4db2-a7a0-527718e34d07	2023-03-03 21:52:30.731695	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	3e02530e-2f14-4c3a-a037-f5358fb39c0e	e04111a0-a6da-41c8-ae1a-edadc6eb9665	63478fef-5161-48a6-8609-005c1dd94615	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
bf568fb5-cf45-4c3f-b307-d852c7f864a8	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	dcf1766e-4d1c-42c1-b87c-4f8ba1df30d1	e04111a0-a6da-41c8-ae1a-edadc6eb9665	63478fef-5161-48a6-8609-005c1dd94615	9530f76c-e412-4da9-b34a-8279659614a2	\N
ebced9cb-ed17-4b4c-a9d2-253366ae2297	2	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	2d6a2b3f-5c06-4011-87ef-1c9b77f9c78e	e04111a0-a6da-41c8-ae1a-edadc6eb9665	63478fef-5161-48a6-8609-005c1dd94615	9530f76c-e412-4da9-b34a-8279659614a2	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
87574f93-ace6-4b8c-8a2c-288a6d1daacd	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	0206c8d8-0b6b-42fb-8f70-4361e246b3e0	\N
dadd434c-36bd-470a-ad43-0b749f7da614	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	0206c8d8-0b6b-42fb-8f70-4361e246b3e0	\N
fb61a388-f7d6-47fc-ae4f-9865260b4646	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	0206c8d8-0b6b-42fb-8f70-4361e246b3e0	\N
3ac7da37-1c6f-4547-bbf0-2c6bd8e8448d	1	12:10:00	13:10:00	13:20:00	13:50:00	bb0cc243-c2bf-459c-b641-382b46536af3	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
128dc54a-dbd3-4935-b481-e7c50a8cc559	3550	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	3550
183bcd07-258d-4586-84a0-df205621a62f	3690	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	3690
39c57933-968d-4afe-82c6-82c2824d00e3	3600	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	3600
3b85112e-258b-4fab-bd8d-90c72515b55d	3500	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	3500
60278de0-15ee-48db-9afc-ebb551aca864	3610	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	3610
da498be2-4a0f-418e-a31b-ebadd524db5d	3510	\N	3152bf6d-b2ac-4d00-8140-5da186d57790	3510
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
65f172ef-ea04-486e-8201-c26ea8d60520	Сварочный цех	50	050
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
-- Name: ProductAccountWeldingEquipment PK_ProductAccountWeldingEquipment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccountWeldingEquipment"
    ADD CONSTRAINT "PK_ProductAccountWeldingEquipment" PRIMARY KEY ("ProductAccountsId", "WeldingEquipmentsId");


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
-- Name: IX_ProductAccountWeldingEquipment_WeldingEquipmentsId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductAccountWeldingEquipment_WeldingEquipmentsId" ON public."ProductAccountWeldingEquipment" USING btree ("WeldingEquipmentsId");


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
-- Name: ProductAccountWeldingEquipment FK_ProductAccountWeldingEquipment_ProductAccounts_ProductAccou~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccountWeldingEquipment"
    ADD CONSTRAINT "FK_ProductAccountWeldingEquipment_ProductAccounts_ProductAccou~" FOREIGN KEY ("ProductAccountsId") REFERENCES public."ProductAccounts"("Id") ON DELETE CASCADE;


--
-- Name: ProductAccountWeldingEquipment FK_ProductAccountWeldingEquipment_WeldingEquipments_WeldingEqu~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccountWeldingEquipment"
    ADD CONSTRAINT "FK_ProductAccountWeldingEquipment_WeldingEquipments_WeldingEqu~" FOREIGN KEY ("WeldingEquipmentsId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_Seams_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_WeldingTasks_Inspectors_InspectorId" FOREIGN KEY ("InspectorId") REFERENCES public."Inspectors"("Id");


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
    ADD CONSTRAINT "FK_WeldingTasks_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


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

