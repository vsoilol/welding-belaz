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
    "PreheatingTemperatureMin" double precision,
    "PreheatingTemperatureMax" double precision,
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
    "PreheatingTemperature" double precision,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "IsEnsuringCurrentAllowance" boolean,
    "IsEnsuringVoltageAllowance" boolean,
    "IsEnsuringTemperatureAllowance" boolean,
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
    "TaskStatus" integer NOT NULL,
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
bbce5750-78ef-4019-9657-79df051a0f32	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
8b179631-6291-43c4-8bf8-b2f0111c7eb5	1f9fb4bb-eec6-4949-8938-f55783ee9b74	1d993690-011b-469a-baf5-ae6c3441d91e	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
3d9a6f47-e73f-4995-9e0e-30a90fd30e0f	1	10	t	bbce5750-78ef-4019-9657-79df051a0f32	\N
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
09f29f3d-ad7f-4107-b80f-0c91efc65d86	Отсутствие оператора в связи с необеспеченностью	\N
0af1bc0f-831f-4bbc-bd96-da65a401206d	Отсутствие материала, заготовок, деталей	\N
11eda3ef-4eba-41cb-bc9e-cf1915940db0	Обед	\N
174fc474-2665-4be4-bc4f-4e251782551b	Изменение режимов, смена инструмента, приспособления	\N
220c5ce7-cc6b-4d51-b4f6-2616e85a2ce8	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
25a4ca4a-a559-4b34-be79-7aa0c759a110	Отсутствие заданий	\N
32f39f50-3a62-48b2-97b9-22350fc49cfc	Ознакомление с работой, документацией, инструктаж	\N
3ca71f81-e3d6-4ab4-9b7b-1436a244237b	Неявка оператора (б/лист, отпуск, и пр.)	\N
4f9fd0b4-2a83-4ef0-9795-35d145924ceb	Установка, выверка, снятие детали	\N
533adabf-1e93-4dd2-b532-00162f24c55b	Работа с управляющей программой	\N
5a2d0584-9307-4655-bc7f-3775a5b0846e	Отсутствие крана, транспорта	\N
6462a2b0-9af8-41c6-a6a6-af06a852c4a6	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
6d23315d-1374-4bc9-a651-53fb3d5ddb84	Плановый ремонт централизованными службами	\N
7637f3a0-3ba2-4a49-b72f-fda2d1c429f0	Установка, выверка, снятие детали	\N
87edf5c2-7559-4eeb-9362-91703b330de6	Контроль на рабочем месте	\N
8b1c021a-b34e-47d3-acb7-367d16148ad9	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
95128140-cfd0-4743-964a-8927771147f4	Нерабочее время по графику согласно сменности	\N
9d82e3a9-709b-425f-a8f8-4cf83d72cb8c	Сборочные операции	\N
b5642d8d-da6c-4885-8672-10ab60a85338	Отсутствие конструктора, технолога или ожидание его решения	\N
c517ad5e-6437-44e0-ab98-54b313af9ded	Аварийный ремонт централизованными службами	\N
c68dd559-dedf-4ac4-9bbd-8d33ee5c47e4	Отсутствие энергоносителей	\N
d878ddbb-2c6a-4d5f-b2f9-10ed3be80108	Работа по карте несоответствий	\N
e05e7ec5-e853-41ef-915b-08d02a3be9ea	Естественные надобности	\N
f136b4e3-1954-4ae9-9247-04dcf2bda28a	Праздники и выходные	\N
fb2a527d-f8d4-49ac-93b8-b6cc86573863	Отсутствие сотрудника ОТК	\N
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
37294b9b-0d86-40e2-af34-c714a1e62d89	de9b0df2-0fc6-4aad-9527-50a7f36f4420	219379
d2ab6228-e0b9-4add-83dc-d97825393b4a	15c066af-c0f0-4d18-97db-530a9cd7acb5	249550
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
142c99bf-7fb8-44f5-935d-0074dbf3d7b4	a9b40c9f-66ac-44a2-bcef-93ec4d88c88c	\N
28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	fa3471a8-0272-438f-ac91-8d6f0d16ac41	610422
fce70b3b-0f08-4279-8534-8cb94e2a5140	4d0ad7eb-a01b-4bf7-bf1b-e0c6c60959a4	614962
7bdc62d9-2e14-463c-bdb1-4cf6e5c7abd9	1120d079-e249-4d8e-9225-ea550a6b0fb4	\N
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
00dac54a-d82b-456b-8e6a-859400f1fcb5	18	2	2023-03-04 16:26:43.567725	86f87524-83e8-497d-9639-8831f88b55c5	\N
05c0e68e-86cf-4eec-8c81-b9a8bc82b5b9	27	2	2023-03-04 16:26:43.568093	a3442535-eda6-49b6-a8fe-1f87662e0013	\N
0977f1d5-283a-4746-8b8b-9c9221d648cf	35	2	2023-03-04 16:26:43.568418	e41bfa9c-9518-42ec-897d-4306d5d1bad0	\N
18fae2e9-ea55-404c-8924-79e8e1724a73	1	2	2023-03-04 16:26:43.541044	011e2071-2316-4fd0-bd6a-585a02409bfe	\N
251b10b9-7058-4b7a-83d1-4fcedb18831f	20	2	2023-03-04 16:26:43.567816	9593c4a0-0f31-4355-b047-e8959829245a	\N
299cba24-e016-4336-a942-35fd35b2a07e	40	2	2023-03-04 16:26:43.568645	fb5a16af-094b-4dcb-a281-b561b687dfbc	\N
2ebd9919-fad9-4c19-90cd-5b7cd8a88ac3	24	2	2023-03-04 16:26:43.567977	9f10c53a-2ae7-45cd-b968-00ff95ffe980	\N
30136e01-5b2b-40c7-9916-7d0a6960d3ba	17	2	2023-03-04 16:26:43.567682	86bfc97c-d705-4fa6-b745-267b542a1bc4	\N
320aba8a-3ecd-488c-895d-703f2d1a8a5f	22	2	2023-03-04 16:26:43.5679	9892ab2b-80bd-4306-af73-d700f39afb55	\N
3496792b-33da-4910-87d5-665f4d8341d0	11	2	2023-03-04 16:26:43.567442	5d730e9a-4a7e-4760-8fe1-4a56c371f5ba	\N
35d4ba86-08a4-474d-928e-82dc361567d3	29	2	2023-03-04 16:26:43.568169	b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	\N
387b79fe-a073-40d0-8914-0ed684b571b9	39	2	2023-03-04 16:26:43.568603	fa63cb86-0231-4bca-a300-cd8ee1ac48ae	\N
40553009-25b3-451a-af4e-10a7fb87897d	16	2	2023-03-04 16:26:43.567635	83f01f2e-822b-4f63-a3d0-52ad81d03101	\N
4430c715-d604-4574-9be9-b0358a5ca1cd	19	2	2023-03-04 16:26:43.567766	90eda818-c2ec-400e-9e20-38f68559a4b5	\N
45ed3e74-7e69-48a9-8fb7-cd99a56acef6	36	2	2023-03-04 16:26:43.568461	efbae53b-a808-4a4d-9366-6476fb4adf07	\N
4715dce9-0732-42d6-983b-1f0b374f7fbb	26	2	2023-03-04 16:26:43.568054	a1c23645-bb82-4346-856f-01abe581f4c6	\N
48b40898-8a19-4fa7-b4f4-95a2ffa3cab3	8	2	2023-03-04 16:26:43.567324	520f7a93-e44d-4dc2-a8c1-adec0a06a054	\N
49fe4bfc-2813-4daf-9801-efe6ad053b6c	14	2	2023-03-04 16:26:43.567557	6d7e3b37-27a7-467f-a2fb-08ce9dd8753e	\N
4cb6f12f-9680-4954-b2c9-c2c98dbd08d5	15	2	2023-03-04 16:26:43.567595	72887892-8857-4406-8b63-bdd573f417b9	\N
50f7ec0e-e0c7-4655-aab1-389d587a2e92	42	2	2023-03-04 16:26:43.568747	f995bd23-cd41-4f8e-8432-35756299fbd2	\N
5f4daea6-0172-4f3e-992e-098b5e4d621c	13	2	2023-03-04 16:26:43.567519	6b25bb8e-d4c7-46b1-9eec-0983c71585b2	\N
66970337-7cc3-46fe-938b-a0ea57e4dd0e	9	2	2023-03-04 16:26:43.567364	548e411b-a4bf-47ea-bf0a-1734ea576952	\N
749045fe-1070-43fd-8038-7ea3b04e5195	33	2	2023-03-04 16:26:43.568331	e2a44782-785c-4e70-a623-9d2a5427b7fa	\N
7a9029f2-eb4d-4272-833f-5a5fa1dd2c2c	21	2	2023-03-04 16:26:43.567861	95a4e482-3412-4023-8ea3-ce8c9f0420d3	\N
7ccd628d-606b-4093-8999-8ec4f3cc015e	7	2	2023-03-04 16:26:43.567285	4ae47eb0-6428-4b24-a07f-68045232c802	\N
7d62e00d-c5c2-4556-b125-5e7dec4dc03c	30	2	2023-03-04 16:26:43.568207	b70a9cc0-89c0-43ed-b4b2-98fa60b76a51	\N
81e828f3-7262-4221-8192-1c003b5a68fe	2	2	2023-03-04 16:26:43.56702	03268e80-b294-4d89-a073-de116825826d	\N
88e4dd51-3dc9-42ca-90d0-d675e6c31a6f	10	2	2023-03-04 16:26:43.567404	58020f89-a294-45e6-9c50-f7108fcd1068	\N
8a652b2f-e8cd-4668-9b5a-103bbc8db292	5	2	2023-03-04 16:26:43.567202	18c1073f-bb52-47de-93d9-de17ca62f32e	\N
8db5ddc7-51d0-4da9-b016-cab2a443ef0d	4	2	2023-03-04 16:26:43.56716	0e594ed4-e36b-422b-a5ce-3a7e99564750	\N
92db2b88-71f7-4beb-ad94-ed858d0851dd	3	2	2023-03-04 16:26:43.567115	047e3a65-ccac-470d-99ee-1fe28654b33f	\N
98e16792-8fbd-4a54-ab1e-86a54d153e09	31	2	2023-03-04 16:26:43.568246	be0a5dd1-3742-4a06-ae64-b3a8cb02c810	\N
9bd3f4b4-cc8d-4bbb-90b9-78c53d4c9afa	25	2	2023-03-04 16:26:43.568015	a0d781ea-bf9f-4304-96d7-665b19645fec	\N
a35af804-1f49-41ca-a96f-cdf3244eb0cf	12	2	2023-03-04 16:26:43.56748	650b85f4-4898-45ba-b928-226dd2b2db3c	\N
a5a94056-4791-4156-a84e-5d408ec35bfb	34	2	2023-03-04 16:26:43.568374	e2b763e9-2d29-4eec-8e1b-bfa157622759	\N
b7ce2054-9491-4e7b-8d27-ae95d0335f65	32	2	2023-03-04 16:26:43.568287	cfc7db40-caf1-4c82-94dc-81cad26ce24e	\N
c03a0413-cf2d-4e37-806a-423bfca1046b	23	2	2023-03-04 16:26:43.567939	9d9727c5-e7a4-4821-accc-f1461dd0329c	\N
cbd81d45-c310-4772-9ee3-0bac5da25b60	28	2	2023-03-04 16:26:43.568131	a40d75bc-c15e-40c0-9468-919983fdccb3	\N
dafa4e0c-0b8f-4287-892c-50c45ed1443b	37	2	2023-03-04 16:26:43.568504	f64a2e5d-aaf6-46c7-be06-21437561f53d	\N
f90e5d2c-c415-413b-bfed-b3a43a35ea77	38	2	2023-03-04 16:26:43.568546	f8e60ca0-8913-477f-b293-abe1e51ec9fc	\N
fd07d3d4-0d0f-4a96-8f1f-496914d831f2	6	2	2023-03-04 16:26:43.567244	21034bf3-faac-4bcd-8011-8ae2e0bdf098	\N
ffa07014-3707-48d8-b0b0-d0394da00ad0	41	2	2023-03-04 16:26:43.568698	71dd2936-27c7-45b9-82b9-c79f666dcdca	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	011e2071-2316-4fd0-bd6a-585a02409bfe
a1c23645-bb82-4346-856f-01abe581f4c6	03268e80-b294-4d89-a073-de116825826d
a1c23645-bb82-4346-856f-01abe581f4c6	047e3a65-ccac-470d-99ee-1fe28654b33f
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	0e594ed4-e36b-422b-a5ce-3a7e99564750
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	18c1073f-bb52-47de-93d9-de17ca62f32e
83f01f2e-822b-4f63-a3d0-52ad81d03101	21034bf3-faac-4bcd-8011-8ae2e0bdf098
cfc7db40-caf1-4c82-94dc-81cad26ce24e	4ae47eb0-6428-4b24-a07f-68045232c802
a1c23645-bb82-4346-856f-01abe581f4c6	520f7a93-e44d-4dc2-a8c1-adec0a06a054
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	548e411b-a4bf-47ea-bf0a-1734ea576952
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	58020f89-a294-45e6-9c50-f7108fcd1068
83f01f2e-822b-4f63-a3d0-52ad81d03101	5d730e9a-4a7e-4760-8fe1-4a56c371f5ba
95a4e482-3412-4023-8ea3-ce8c9f0420d3	650b85f4-4898-45ba-b928-226dd2b2db3c
011e2071-2316-4fd0-bd6a-585a02409bfe	6b25bb8e-d4c7-46b1-9eec-0983c71585b2
18c1073f-bb52-47de-93d9-de17ca62f32e	6d7e3b37-27a7-467f-a2fb-08ce9dd8753e
95a4e482-3412-4023-8ea3-ce8c9f0420d3	71dd2936-27c7-45b9-82b9-c79f666dcdca
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	72887892-8857-4406-8b63-bdd573f417b9
a1c23645-bb82-4346-856f-01abe581f4c6	83f01f2e-822b-4f63-a3d0-52ad81d03101
011e2071-2316-4fd0-bd6a-585a02409bfe	86bfc97c-d705-4fa6-b745-267b542a1bc4
58020f89-a294-45e6-9c50-f7108fcd1068	86f87524-83e8-497d-9639-8831f88b55c5
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	90eda818-c2ec-400e-9e20-38f68559a4b5
f995bd23-cd41-4f8e-8432-35756299fbd2	9593c4a0-0f31-4355-b047-e8959829245a
a1c23645-bb82-4346-856f-01abe581f4c6	95a4e482-3412-4023-8ea3-ce8c9f0420d3
011e2071-2316-4fd0-bd6a-585a02409bfe	9892ab2b-80bd-4306-af73-d700f39afb55
548e411b-a4bf-47ea-bf0a-1734ea576952	9d9727c5-e7a4-4821-accc-f1461dd0329c
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	9f10c53a-2ae7-45cd-b968-00ff95ffe980
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	a0d781ea-bf9f-4304-96d7-665b19645fec
a1c23645-bb82-4346-856f-01abe581f4c6	a3442535-eda6-49b6-a8fe-1f87662e0013
011e2071-2316-4fd0-bd6a-585a02409bfe	a40d75bc-c15e-40c0-9468-919983fdccb3
95a4e482-3412-4023-8ea3-ce8c9f0420d3	b70a9cc0-89c0-43ed-b4b2-98fa60b76a51
95a4e482-3412-4023-8ea3-ce8c9f0420d3	be0a5dd1-3742-4a06-ae64-b3a8cb02c810
a1c23645-bb82-4346-856f-01abe581f4c6	cfc7db40-caf1-4c82-94dc-81cad26ce24e
58020f89-a294-45e6-9c50-f7108fcd1068	e2a44782-785c-4e70-a623-9d2a5427b7fa
95a4e482-3412-4023-8ea3-ce8c9f0420d3	e2b763e9-2d29-4eec-8e1b-bfa157622759
cfc7db40-caf1-4c82-94dc-81cad26ce24e	e41bfa9c-9518-42ec-897d-4306d5d1bad0
90eda818-c2ec-400e-9e20-38f68559a4b5	efbae53b-a808-4a4d-9366-6476fb4adf07
520f7a93-e44d-4dc2-a8c1-adec0a06a054	f64a2e5d-aaf6-46c7-be06-21437561f53d
a1c23645-bb82-4346-856f-01abe581f4c6	f8e60ca0-8913-477f-b293-abe1e51ec9fc
a1c23645-bb82-4346-856f-01abe581f4c6	f995bd23-cd41-4f8e-8432-35756299fbd2
011e2071-2316-4fd0-bd6a-585a02409bfe	fa63cb86-0231-4bca-a300-cd8ee1ac48ae
18c1073f-bb52-47de-93d9-de17ca62f32e	fb5a16af-094b-4dcb-a281-b561b687dfbc
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
05e2f646-3e7f-40ae-9d97-bec31cb2eb54	0	1	\N	\N	9bd3f4b4-cc8d-4bbb-90b9-78c53d4c9afa	\N
06e1bb9a-d3c3-41ef-a321-86466f8f1272	0	1	\N	\N	c03a0413-cf2d-4e37-806a-423bfca1046b	\N
0b51396b-af48-469f-b11e-8b981f410433	0	1	\N	\N	7a9029f2-eb4d-4272-833f-5a5fa1dd2c2c	\N
19e217c6-0866-42f4-8d23-664919c2c15e	0	1	\N	\N	dafa4e0c-0b8f-4287-892c-50c45ed1443b	\N
219a76b8-a212-4a3f-8de5-91bb931aaeab	0	1	\N	\N	fd07d3d4-0d0f-4a96-8f1f-496914d831f2	\N
32521783-9c68-4b3f-bb26-2a18d0fca36f	0	1	\N	\N	48b40898-8a19-4fa7-b4f4-95a2ffa3cab3	\N
34af474a-1e99-48b0-a930-3063e7b9f058	0	1	\N	\N	00dac54a-d82b-456b-8e6a-859400f1fcb5	\N
359dc84b-a09a-4c4b-93cc-1b78ea0a2c16	0	1	\N	\N	66970337-7cc3-46fe-938b-a0ea57e4dd0e	\N
3c81f68c-1c6a-482d-910b-16e03182c46b	0	1	\N	\N	251b10b9-7058-4b7a-83d1-4fcedb18831f	\N
4aa3443d-8c15-4b2b-8c5d-be1a486e4116	0	1	\N	\N	35d4ba86-08a4-474d-928e-82dc361567d3	\N
539be62d-7b7e-4098-a48c-200483a69391	0	1	\N	\N	a35af804-1f49-41ca-a96f-cdf3244eb0cf	\N
5db74a9f-40ac-46b1-a4d9-a2516e1ea9a0	0	1	\N	\N	ffa07014-3707-48d8-b0b0-d0394da00ad0	\N
64b44089-9ba1-4ffe-ab08-319f46dbbb2f	0	1	\N	\N	2ebd9919-fad9-4c19-90cd-5b7cd8a88ac3	\N
6cd4b87b-272b-4b41-b35c-1f7995e7f276	0	1	\N	\N	749045fe-1070-43fd-8038-7ea3b04e5195	\N
6d864e7f-9896-4304-bb3f-da8c63fc9f7b	0	1	\N	\N	92db2b88-71f7-4beb-ad94-ed858d0851dd	\N
7041525d-a35b-48fc-ade3-b02261ab6db0	0	1	\N	\N	8db5ddc7-51d0-4da9-b016-cab2a443ef0d	\N
744cf3cb-0da6-4973-b8ea-020a3033af9c	0	1	\N	\N	3496792b-33da-4910-87d5-665f4d8341d0	\N
81f87ffb-aaf0-4510-b002-04a0b7947ac8	0	1	\N	\N	299cba24-e016-4336-a942-35fd35b2a07e	\N
82b613cf-0ac6-421a-8f08-5b17cae4ce98	0	1	\N	\N	7d62e00d-c5c2-4556-b125-5e7dec4dc03c	\N
87ecec2f-d95c-45a6-8612-a504913b7ac5	0	1	\N	\N	f90e5d2c-c415-413b-bfed-b3a43a35ea77	\N
9133d97f-5ace-4180-bb0b-ac55467aa986	0	1	\N	\N	88e4dd51-3dc9-42ca-90d0-d675e6c31a6f	\N
968eeb7b-5252-4fd9-a60f-5a954cefac11	0	1	\N	\N	cbd81d45-c310-4772-9ee3-0bac5da25b60	\N
999a4899-a223-4a0c-b96a-b06668b885a9	0	1	\N	\N	a5a94056-4791-4156-a84e-5d408ec35bfb	\N
9b3f9504-91f2-4827-839e-f67308749de8	0	1	\N	\N	40553009-25b3-451a-af4e-10a7fb87897d	\N
a61c078a-e21d-442d-a46e-a8eaba0b9d34	0	1	\N	\N	50f7ec0e-e0c7-4655-aab1-389d587a2e92	\N
a67bcae1-ff67-40b1-844f-165f5ef5aa04	0	1	\N	\N	98e16792-8fbd-4a54-ab1e-86a54d153e09	\N
abe04f94-dac4-474a-8df7-fa6ed17af914	0	1	\N	\N	18fae2e9-ea55-404c-8924-79e8e1724a73	\N
abebb677-0893-41f8-bbba-fb6739a85510	0	1	\N	\N	8a652b2f-e8cd-4668-9b5a-103bbc8db292	\N
b2ec5f2a-0b02-4b35-a85e-b198b3d34695	0	1	\N	\N	81e828f3-7262-4221-8192-1c003b5a68fe	\N
b454011a-6e85-4097-9262-074583abef02	0	1	\N	\N	4cb6f12f-9680-4954-b2c9-c2c98dbd08d5	\N
b55c58e3-7716-4527-bab6-d917fc1b5f61	0	1	\N	\N	7ccd628d-606b-4093-8999-8ec4f3cc015e	\N
b8ab75cb-6440-41c4-b8f2-b9fb78c3a593	0	1	\N	\N	0977f1d5-283a-4746-8b8b-9c9221d648cf	\N
c3ebf108-5a65-4b2c-9c31-31d2c95efaee	0	1	\N	\N	320aba8a-3ecd-488c-895d-703f2d1a8a5f	\N
d0ddcc80-53fc-4f7d-84b8-c9f06867325a	0	1	\N	\N	387b79fe-a073-40d0-8914-0ed684b571b9	\N
d4045349-8690-4921-90c0-7ccc02ade042	0	1	\N	\N	4715dce9-0732-42d6-983b-1f0b374f7fbb	\N
db23f4e6-587e-435e-944f-d7af74e80f3a	0	1	\N	\N	49fe4bfc-2813-4daf-9801-efe6ad053b6c	\N
dd4929cc-2da6-448d-ab41-55daf422620b	0	1	\N	\N	30136e01-5b2b-40c7-9916-7d0a6960d3ba	\N
dfd0fcfb-f95e-4bdc-8bab-a7086836ef2c	0	1	\N	\N	5f4daea6-0172-4f3e-992e-098b5e4d621c	\N
e2e466de-c1c5-4eaa-8884-9f545a17acf3	0	1	\N	\N	4430c715-d604-4574-9be9-b0358a5ca1cd	\N
ee99626a-4b1a-42bc-82e6-ccbeee79d5c9	0	1	\N	\N	b7ce2054-9491-4e7b-8d27-ae95d0335f65	\N
f3537fbe-8161-485a-84cb-a60087c87b9f	0	1	\N	\N	45ed3e74-7e69-48a9-8fb7-cd99a56acef6	\N
f37fbda9-9949-4f5c-a2f8-96191405f2bb	0	1	\N	\N	05c0e68e-86cf-4eec-8c81-b9a8bc82b5b9	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
7eea3d26-7efe-453f-ba20-9b2bc3d16081	Сборка, сварка рам к/с г/п 120-130 т.	6	1d993690-011b-469a-baf5-ae6c3441d91e	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
011e2071-2316-4fd0-bd6a-585a02409bfe	Поперечина рамы задняя	75131-2801300-20	t	2	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
03268e80-b294-4d89-a073-de116825826d	Поперечина	75131-2801103-10	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
047e3a65-ccac-470d-99ee-1fe28654b33f	Поперечина №3 рамы с опорами	75132-2801152	t	2	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
0e594ed4-e36b-422b-a5ce-3a7e99564750	Поперечина	75131-2801103-10	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
18c1073f-bb52-47de-93d9-de17ca62f32e	Лонжерон рамы правый	75131-2801016-70	t	2	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
21034bf3-faac-4bcd-8011-8ae2e0bdf098	Опора	75131-2801188	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
4ae47eb0-6428-4b24-a07f-68045232c802	Опора	75131-2801188	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
520f7a93-e44d-4dc2-a8c1-adec0a06a054	Лонжерон рамы правый	75131-2801014-41	t	2	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
548e411b-a4bf-47ea-bf0a-1734ea576952	Лонжерон рамы правый	75131-2801014-41	t	2	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
58020f89-a294-45e6-9c50-f7108fcd1068	Лонжерон рамы левый	75131-2801017-70	t	2	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
5d730e9a-4a7e-4760-8fe1-4a56c371f5ba	Накладка рамы поперечная передняя	75131-2801088-70	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
650b85f4-4898-45ba-b928-226dd2b2db3c	Лист верхний	75131-2801357-10	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
6b25bb8e-d4c7-46b1-9eec-0983c71585b2	Лист верхний	75131-2801357-10	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
6d7e3b37-27a7-467f-a2fb-08ce9dd8753e	Накладка рамы поперечная передняя	75131-2801088-70	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
72887892-8857-4406-8b63-bdd573f417b9	Усилитель	75131-2801115-01	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
83f01f2e-822b-4f63-a3d0-52ad81d03101	Лонжерон рамы левый	75131-2801017-70	t	2	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
86bfc97c-d705-4fa6-b745-267b542a1bc4	Лист нижний	75131-2801358-10	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
86f87524-83e8-497d-9639-8831f88b55c5	Накладка рамы поперечная передняя	75131-2801088-70	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
90eda818-c2ec-400e-9e20-38f68559a4b5	Лонжерон рамы левый	75131-2801015-41	t	2	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
9593c4a0-0f31-4355-b047-e8959829245a	Опора	75131-2801188	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
95a4e482-3412-4023-8ea3-ce8c9f0420d3	Поперечина рамы задняя	75131-2801300-20	t	2	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
9892ab2b-80bd-4306-af73-d700f39afb55	Кронштейн задней опоры	75131-8521183-20	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
9d9727c5-e7a4-4821-accc-f1461dd0329c	Опора	75131-2801188	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
9f10c53a-2ae7-45cd-b968-00ff95ffe980	Усилитель	75131-2801114-01	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
a0d781ea-bf9f-4304-96d7-665b19645fec	Поперечина №3 рамы с опорами	75132-2801152	t	2	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
a1c23645-bb82-4346-856f-01abe581f4c6	Рама	7513D-2800010-20	t	1	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	4536492774
a3442535-eda6-49b6-a8fe-1f87662e0013	Усилитель	75131-2801114-01	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
a40d75bc-c15e-40c0-9468-919983fdccb3	Поперечина	75131-2801325	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
b304c5b4-24d4-4eb0-b84a-8ebccfc5879a	Рама	75131-2800010-70	t	1	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	4536479362
b70a9cc0-89c0-43ed-b4b2-98fa60b76a51	Кронштейн задней опоры	75131-8521182-20	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
be0a5dd1-3742-4a06-ae64-b3a8cb02c810	Поперечина	75131-2801325	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
cfc7db40-caf1-4c82-94dc-81cad26ce24e	Лонжерон рамы правый	75131-2801016-70	t	2	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
e2a44782-785c-4e70-a623-9d2a5427b7fa	Опора	75131-2801188	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
e2b763e9-2d29-4eec-8e1b-bfa157622759	Кронштейн задней опоры	75131-8521183-20	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
e41bfa9c-9518-42ec-897d-4306d5d1bad0	Накладка рамы поперечная передняя	75131-2801088-70	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
efbae53b-a808-4a4d-9366-6476fb4adf07	Опора	75131-2801188	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
f64a2e5d-aaf6-46c7-be06-21437561f53d	Опора	75131-2801188	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
f8e60ca0-8913-477f-b293-abe1e51ec9fc	Усилитель	75131-2801115-01	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
fa63cb86-0231-4bca-a300-cd8ee1ac48ae	Кронштейн задней опоры	75131-8521182-20	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
fb5a16af-094b-4dcb-a281-b561b687dfbc	Опора	75131-2801188	t	3	921940ec-ff35-4467-945f-f0b60b3f06db	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N	\N	\N
71dd2936-27c7-45b9-82b9-c79f666dcdca	Лист нижний	75131-2801358-10	t	3	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	\N	\N	\N
f995bd23-cd41-4f8e-8432-35756299fbd2	Лонжерон рамы левый	75131-2801015-41	t	2	165e3f7a-191e-48ad-8659-84c626c254c7	7eea3d26-7efe-453f-ba20-9b2bc3d16081	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
4b915b25-2bc8-4e02-a21d-53836a433d42	Admin	\N
a3ebd827-6ad5-4f6a-a88a-8959bbf58fe3	Master	\N
b9b051bc-d3d6-4e9d-a27e-83b4c2140015	Welder	\N
ff03c5e2-3adb-46ec-bca2-e0a64f2aa1ad	Inspector	\N
7edcbfc2-7149-4935-95f7-5bf63a96bcab	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0580b944-171e-40cf-9aeb-017107eb16aa	39	280	t	f	520f7a93-e44d-4dc2-a8c1-adec0a06a054	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
0ce5c24e-1391-40d2-b751-7f71c735997c	55	400	t	f	fb5a16af-094b-4dcb-a281-b561b687dfbc	e40362be-d587-4b90-8240-b8152b36b70f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
14e2c872-07af-4e6c-882d-58166452e71e	52	1200	t	f	0e594ed4-e36b-422b-a5ce-3a7e99564750	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
18eef489-ac4e-42d4-bf29-c40105ec17d2	18	4000	t	f	f995bd23-cd41-4f8e-8432-35756299fbd2	9a887ae9-525f-477f-86fd-6d3197157511	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
19825b9e-a2ad-4ef0-bc26-52f9be77c39f	56	400	t	f	9593c4a0-0f31-4355-b047-e8959829245a	0b174596-8737-4dad-b76f-17bba65bb25e	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
22d9ede2-9dc8-40a8-ab12-d55ec4ebb037	58	900	t	f	efbae53b-a808-4a4d-9366-6476fb4adf07	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
2361f0c6-2d43-4099-954c-f0a3e5ce2310	18	4000	t	f	90eda818-c2ec-400e-9e20-38f68559a4b5	9a887ae9-525f-477f-86fd-6d3197157511	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
26e1dc80-6d9f-4669-9139-fbf1732b9937	39	280	t	f	5d730e9a-4a7e-4760-8fe1-4a56c371f5ba	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
2b1d46c3-6dbf-4065-b79f-08bc8693f6f1	2	1880	t	f	9892ab2b-80bd-4306-af73-d700f39afb55	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
2b4bedff-0110-4bae-bfcb-fd58285a5d8d	2	1880	t	f	6b25bb8e-d4c7-46b1-9eec-0983c71585b2	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
2c706bab-2180-4478-bb5c-7b37eb71e233	54	400	t	f	f64a2e5d-aaf6-46c7-be06-21437561f53d	1eb7f120-3dd6-4aa5-a26b-b710eeffa14d	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
2dc6be61-6b87-4dbf-a5d1-c2428c6862e2	39	280	t	f	548e411b-a4bf-47ea-bf0a-1734ea576952	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
2e62899c-3dd5-428b-80e9-3d728a8bca31	18	4000	t	f	047e3a65-ccac-470d-99ee-1fe28654b33f	9a887ae9-525f-477f-86fd-6d3197157511	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
36ed47e7-ec96-41fe-987d-2306bf79a883	52	1200	t	f	9f10c53a-2ae7-45cd-b968-00ff95ffe980	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
3cd1c17d-a2aa-424f-8d2a-f96ab9ec0e84	39	280	t	f	e41bfa9c-9518-42ec-897d-4306d5d1bad0	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
4973013a-e748-4295-95a3-f863e507a5e1	58	900	t	f	9593c4a0-0f31-4355-b047-e8959829245a	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
4a4b7c19-5daa-4585-afc2-8aa75dfe9525	1	1900	t	f	6b25bb8e-d4c7-46b1-9eec-0983c71585b2	619c09fa-abf2-4413-a1b1-93fc9491e201	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
51936b28-9346-4eb6-b191-c52fca9ebacb	2	1880	t	f	a40d75bc-c15e-40c0-9468-919983fdccb3	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
5703a415-6a2d-469c-818c-3997b096a87f	52	1200	t	f	72887892-8857-4406-8b63-bdd573f417b9	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
5bd8a3c7-dae7-4896-be53-ed1101e2cdf1	2	1880	t	f	be0a5dd1-3742-4a06-ae64-b3a8cb02c810	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
602bf558-5a8e-4a26-bc79-da729ef36c16	48	1900	t	f	71dd2936-27c7-45b9-82b9-c79f666dcdca	04a3ed9b-9e00-4c8f-8d6e-ff0c7e2576e9	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
689ac88b-a5c6-4d5e-80b8-182b24683a2a	1	1900	t	f	be0a5dd1-3742-4a06-ae64-b3a8cb02c810	619c09fa-abf2-4413-a1b1-93fc9491e201	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
71c9eafc-7626-49a4-b3bb-fd3bf35cd17c	18	4000	t	f	548e411b-a4bf-47ea-bf0a-1734ea576952	9a887ae9-525f-477f-86fd-6d3197157511	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
77a95f5a-e5a4-483d-9cda-f401ce9ac877	52	1200	t	f	f8e60ca0-8913-477f-b293-abe1e51ec9fc	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
77e348c6-693f-497a-8cc4-ad63e1707007	58	900	t	f	9d9727c5-e7a4-4821-accc-f1461dd0329c	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
79a74c7d-df0c-4feb-b878-f25c8651216c	39	280	t	f	6d7e3b37-27a7-467f-a2fb-08ce9dd8753e	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
7c45f570-2790-48a5-b12c-9d3abf632903	18	4000	t	f	520f7a93-e44d-4dc2-a8c1-adec0a06a054	9a887ae9-525f-477f-86fd-6d3197157511	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
7d12caa0-2ea6-4b18-8e68-1afb125f2bc9	1	1900	t	f	650b85f4-4898-45ba-b928-226dd2b2db3c	619c09fa-abf2-4413-a1b1-93fc9491e201	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
804a0465-6365-4aa4-8293-1a44b9c82705	57	400	t	f	e2a44782-785c-4e70-a623-9d2a5427b7fa	bb2d891c-e3e7-4aee-8b9a-399ab5941044	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
80b128aa-851b-44da-923e-49431fba233d	1	1900	t	f	a40d75bc-c15e-40c0-9468-919983fdccb3	619c09fa-abf2-4413-a1b1-93fc9491e201	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
87d254a6-dbe3-4702-9a9d-57dba40da923	39	280	t	f	90eda818-c2ec-400e-9e20-38f68559a4b5	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
88aee336-3bd2-4bd8-b20a-c8d399914106	39	280	t	f	011e2071-2316-4fd0-bd6a-585a02409bfe	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
92c60abd-0820-449a-b186-ae9e963be257	2	1880	t	f	650b85f4-4898-45ba-b928-226dd2b2db3c	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
932adfef-2a69-4cc4-8c26-b27e228cdc01	58	900	t	f	f64a2e5d-aaf6-46c7-be06-21437561f53d	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
9422b5a6-64da-4d5c-9a06-9297288c98df	52	1200	t	f	a3442535-eda6-49b6-a8fe-1f87662e0013	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
96d83647-d7ba-4b27-b510-bf4dde101da8	2	1880	t	f	b70a9cc0-89c0-43ed-b4b2-98fa60b76a51	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
97c9b75e-63b4-49b8-ab65-a6939865f904	58	900	t	f	fb5a16af-094b-4dcb-a281-b561b687dfbc	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
98978f77-55fc-4586-b1f8-433f7f195adb	2	1880	t	f	fa63cb86-0231-4bca-a300-cd8ee1ac48ae	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
a28cd18b-2c09-4ef3-8e74-af7c6c8e2d75	2	1880	t	f	e2b763e9-2d29-4eec-8e1b-bfa157622759	b5cc2870-2a88-455b-83c7-643d0354f3da	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
ac8cddb4-ca05-4ed8-a040-1d03b12394d8	39	280	t	f	86f87524-83e8-497d-9639-8831f88b55c5	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
beea086e-dc42-403a-831e-68e4f8edc7ef	58	900	t	f	4ae47eb0-6428-4b24-a07f-68045232c802	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
c460f736-6245-4e5a-90e0-c838a567e625	58	900	t	f	21034bf3-faac-4bcd-8011-8ae2e0bdf098	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
c7e856cd-9551-43c1-85b8-58a55329c9c6	56	400	t	f	efbae53b-a808-4a4d-9366-6476fb4adf07	0b174596-8737-4dad-b76f-17bba65bb25e	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
cc0cc86b-aa5e-41d5-b204-fdde255695f2	52	1200	t	f	03268e80-b294-4d89-a073-de116825826d	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
ce31053a-1709-42cd-8c5e-cbc0a374ded5	58	900	t	f	e2a44782-785c-4e70-a623-9d2a5427b7fa	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
d71d89df-4ec6-40ca-9905-7ff870f85f4e	57	400	t	f	21034bf3-faac-4bcd-8011-8ae2e0bdf098	bb2d891c-e3e7-4aee-8b9a-399ab5941044	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
d83cfb4f-2a60-4d1c-a594-b4f8570d2b6a	18	4000	t	f	a0d781ea-bf9f-4304-96d7-665b19645fec	9a887ae9-525f-477f-86fd-6d3197157511	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
e1db6430-8d9c-4737-a8fc-00153aa4769c	55	400	t	f	4ae47eb0-6428-4b24-a07f-68045232c802	e40362be-d587-4b90-8240-b8152b36b70f	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
e39eee10-1aae-43d2-a967-a249d3570e71	54	400	t	f	9d9727c5-e7a4-4821-accc-f1461dd0329c	1eb7f120-3dd6-4aa5-a26b-b710eeffa14d	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
e9943622-1c39-43be-97f9-d94f714576c2	39	280	t	f	f995bd23-cd41-4f8e-8432-35756299fbd2	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
ea561f56-cd7b-4e54-9f19-c5826f1d1e25	48	1900	t	f	86bfc97c-d705-4fa6-b745-267b542a1bc4	04a3ed9b-9e00-4c8f-8d6e-ff0c7e2576e9	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
febe84ff-02b6-4474-8178-b29b6b2773a4	39	280	t	f	95a4e482-3412-4023-8ea3-ce8c9f0420d3	22410265-5170-4eb0-a12c-9266c42742a4	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
04a3ed9b-9e00-4c8f-8d6e-ff0c7e2576e9	48	Инструкция 48	48
0b174596-8737-4dad-b76f-17bba65bb25e	56	Инструкция 56	56
1eb7f120-3dd6-4aa5-a26b-b710eeffa14d	54	Инструкция 54	54
22410265-5170-4eb0-a12c-9266c42742a4	39	Инструкция 39	39
619c09fa-abf2-4413-a1b1-93fc9491e201	1	Инструкция 1	1
7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	52	Инструкция 52	52
9a887ae9-525f-477f-86fd-6d3197157511	18	Инструкция 18	18
b5cc2870-2a88-455b-83c7-643d0354f3da	2	Инструкция 2	2
bb2d891c-e3e7-4aee-8b9a-399ab5941044	57	Инструкция 57	57
d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	58	Инструкция 58	58
e40362be-d587-4b90-8240-b8152b36b70f	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
165e3f7a-191e-48ad-8659-84c626c254c7	7513D-2800010-20	Рама	\N	3330041
921940ec-ff35-4467-945f-f0b60b3f06db	75131-2800010-70	Рама	\N	3291137
dadf1930-daba-4eee-aaf9-7f410a11daed	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
15c066af-c0f0-4d18-97db-530a9cd7acb5	ff03c5e2-3adb-46ec-bca2-e0a64f2aa1ad
de9b0df2-0fc6-4aad-9527-50a7f36f4420	ff03c5e2-3adb-46ec-bca2-e0a64f2aa1ad
4d0ad7eb-a01b-4bf7-bf1b-e0c6c60959a4	a3ebd827-6ad5-4f6a-a88a-8959bbf58fe3
a9b40c9f-66ac-44a2-bcef-93ec4d88c88c	a3ebd827-6ad5-4f6a-a88a-8959bbf58fe3
fa3471a8-0272-438f-ac91-8d6f0d16ac41	a3ebd827-6ad5-4f6a-a88a-8959bbf58fe3
100776ad-447b-4fff-99c3-708c74cdd13f	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
22f0b0cb-0673-4aeb-89f8-ccab456ea04b	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
5e23d1d4-117b-48fb-9fa3-c6ed1862ddeb	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
906ccea7-4529-4a03-b022-cd1324301283	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
a6f71775-f596-4512-8963-6f670f733636	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
c0e134a3-becc-4127-ab38-f09811d1c2a3	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
cb4d5d14-8edb-4cbe-a112-f1e024da815b	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
ff9f146c-aa28-4591-81cb-d24dc541cbc4	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
1f9fb4bb-eec6-4949-8938-f55783ee9b74	7edcbfc2-7149-4935-95f7-5bf63a96bcab
febc5318-4c5b-4e96-b4bf-b7ff0490d25b	4b915b25-2bc8-4e02-a21d-53836a433d42
f9b651ae-735e-4e62-82e6-796250277afc	b9b051bc-d3d6-4e9d-a27e-83b4c2140015
0ead94b1-6265-4387-87de-acb474e2ae66	ff03c5e2-3adb-46ec-bca2-e0a64f2aa1ad
bcc71eaf-8c7d-459c-b647-09685e430b6c	7edcbfc2-7149-4935-95f7-5bf63a96bcab
1120d079-e249-4d8e-9225-ea550a6b0fb4	a3ebd827-6ad5-4f6a-a88a-8959bbf58fe3
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
15c066af-c0f0-4d18-97db-530a9cd7acb5	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
de9b0df2-0fc6-4aad-9527-50a7f36f4420	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
4d0ad7eb-a01b-4bf7-bf1b-e0c6c60959a4	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
a9b40c9f-66ac-44a2-bcef-93ec4d88c88c	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
fa3471a8-0272-438f-ac91-8d6f0d16ac41	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
100776ad-447b-4fff-99c3-708c74cdd13f	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
22f0b0cb-0673-4aeb-89f8-ccab456ea04b	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
5e23d1d4-117b-48fb-9fa3-c6ed1862ddeb	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
906ccea7-4529-4a03-b022-cd1324301283	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
a6f71775-f596-4512-8963-6f670f733636	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
c0e134a3-becc-4127-ab38-f09811d1c2a3	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	B7:5A:79:B5	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
cb4d5d14-8edb-4cbe-a112-f1e024da815b	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:F1:7D:5A	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
ff9f146c-aa28-4591-81cb-d24dc541cbc4	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
1f9fb4bb-eec6-4949-8938-f55783ee9b74	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
febc5318-4c5b-4e96-b4bf-b7ff0490d25b	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$QNqz8zw+qaBrckiJc4fV8sz5SAzBk93sm7mTsicEQqnTBkNc	\N	\N	\N	\N	\N	\N
f9b651ae-735e-4e62-82e6-796250277afc	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$5W4F3G9IgtYzSaMNkgHRNLijvm1s4S+S5tPQF9yihhPD+gL8	\N	\N	\N	\N	\N	\N
0ead94b1-6265-4387-87de-acb474e2ae66	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$RXa6FdI6byrHn7dh/OEmQFKL+WqWd5pIYnNlrKJBaR11D16z	\N	\N	\N	\N	\N	\N
bcc71eaf-8c7d-459c-b647-09685e430b6c	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$S9xlVkciGPpKWJx+tgcExpA2XrJM61zh/UOx8AtcGAKSOyWa	\N	\N	\N	\N	\N	\N
1120d079-e249-4d8e-9225-ea550a6b0fb4	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$q8dehHNOdye3GfBuc8uuPLnvQPI3+00j0txiaZ0GyFSz3VvQ	\N	\N	\N	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0c4f5ce2-23d5-4084-81ce-14f3293d6d86	1	Заполняющий	230	270	23	26	\N	\N	619c09fa-abf2-4413-a1b1-93fc9491e201	\N
11a350c0-faad-468c-a895-5ce15a792ef0	1	Заполняющий	230	270	23	26	\N	\N	9a887ae9-525f-477f-86fd-6d3197157511	\N
18f695d8-1083-47de-91ff-5e27722ce5b2	1	Заполняющий	230	270	23	26	\N	\N	0b174596-8737-4dad-b76f-17bba65bb25e	\N
76725438-38cb-4179-9737-68b6e6c0191f	1	Заполняющий	230	270	23	26	\N	\N	d6ecbaac-dbda-4bfb-9e1c-994ce1716c12	\N
9892b200-d5b4-4d88-bebf-1e8125f20ef2	1	Заполняющий	230	270	23	26	\N	\N	bb2d891c-e3e7-4aee-8b9a-399ab5941044	\N
a3c334bb-5344-48ae-80f2-1ee7dfd31424	1	Заполняющий	230	270	23	26	\N	\N	7ec6cf27-5b27-4c8a-8221-75e8752fbe4f	\N
cc06125c-315a-43c0-baec-5f008af76e9e	1	Заполняющий	230	270	23	26	\N	\N	e40362be-d587-4b90-8240-b8152b36b70f	\N
dfbcd5d1-00a1-42ea-bea6-f9072d50bb41	1	Заполняющий	230	270	23	26	\N	\N	22410265-5170-4eb0-a12c-9266c42742a4	\N
e138bd7b-30ee-492d-a851-75e691aa347b	1	Заполняющий	230	270	23	26	\N	\N	b5cc2870-2a88-455b-83c7-643d0354f3da	\N
f0fd8c4a-21ba-4092-8a7d-e99408c5e4cc	1	Заполняющий	230	270	23	26	\N	\N	04a3ed9b-9e00-4c8f-8d6e-ff0c7e2576e9	\N
f22bb0df-8cfc-49db-a8a6-07c2f134a2a8	1	Заполняющий	230	270	23	26	\N	\N	1eb7f120-3dd6-4aa5-a26b-b710eeffa14d	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
745d7394-6a40-4992-b606-fa80a429e652	1	Корневой	82	0.11	0.68	\N	\N	\N	e6d55f0d-ae5e-44dc-808a-0b66be50e12b	cb68c5fe-f7ae-44c9-a3fa-2e98f9a6a9de	\N
9f692f6c-e03c-4e1a-bae2-20f03b6e6b03	2	Заполняющий	100	0.22	0.44	\N	\N	\N	5a508ae6-9638-4369-abb5-f505df2ee0a9	cb68c5fe-f7ae-44c9-a3fa-2e98f9a6a9de	\N
d220e8e1-bc24-47ed-8897-fb18d4d77550	1	Корневой	82	0.11	0.68	\N	\N	\N	decf54c0-15e3-450e-8c1f-3ae93042bcfd	62433ed8-f1cd-488c-a875-a2e92d9dd097	\N
d3b5dfce-ebec-4abb-afb3-db03dcfc3d2c	2	Заполняющий	100	0.22	0.44	\N	\N	\N	45df46ac-75d0-4e17-8768-492127b33534	62433ed8-f1cd-488c-a875-a2e92d9dd097	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
00d3372f-22d2-4a3e-b097-f3ef18121afb	00948fb2-f2b2-40fe-9356-08964cc28365
28a27718-d3d6-4dc5-97d7-09505d02dc66	c981324e-11ef-43c8-bd01-2a4f8cf45c81
28a27718-d3d6-4dc5-97d7-09505d02dc66	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1
2b4e3477-8b17-46aa-b7c0-af4fdddfb388	d5cd7e40-0329-45ec-aa7f-e4b51b1da72e
32cda3d7-47c0-4b58-a111-e0ffb52b14cc	c981324e-11ef-43c8-bd01-2a4f8cf45c81
32cda3d7-47c0-4b58-a111-e0ffb52b14cc	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1
4f68e6f4-2620-4d3c-b726-f5f6309f621a	c981324e-11ef-43c8-bd01-2a4f8cf45c81
4f68e6f4-2620-4d3c-b726-f5f6309f621a	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1
5c11b772-b5cc-43aa-a86f-987a2000bd48	c981324e-11ef-43c8-bd01-2a4f8cf45c81
5c11b772-b5cc-43aa-a86f-987a2000bd48	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1
5c9edc75-7c52-474a-a4d1-75a7f1ac8f71	00948fb2-f2b2-40fe-9356-08964cc28365
c4524be8-e1b1-4638-a3d4-943a4be17ff2	d5cd7e40-0329-45ec-aa7f-e4b51b1da72e
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
00d3372f-22d2-4a3e-b097-f3ef18121afb	cb4d5d14-8edb-4cbe-a112-f1e024da815b	\N	121267
28a27718-d3d6-4dc5-97d7-09505d02dc66	5e23d1d4-117b-48fb-9fa3-c6ed1862ddeb	\N	150882
2b4e3477-8b17-46aa-b7c0-af4fdddfb388	22f0b0cb-0673-4aeb-89f8-ccab456ea04b	\N	132695
32cda3d7-47c0-4b58-a111-e0ffb52b14cc	906ccea7-4529-4a03-b022-cd1324301283	\N	150838
4f68e6f4-2620-4d3c-b726-f5f6309f621a	c0e134a3-becc-4127-ab38-f09811d1c2a3	\N	114729
5c11b772-b5cc-43aa-a86f-987a2000bd48	a6f71775-f596-4512-8963-6f670f733636	\N	146164
5c9edc75-7c52-474a-a4d1-75a7f1ac8f71	ff9f146c-aa28-4591-81cb-d24dc541cbc4	\N	117390
c4524be8-e1b1-4638-a3d4-943a4be17ff2	100776ad-447b-4fff-99c3-708c74cdd13f	\N	122575
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
00948fb2-f2b2-40fe-9356-08964cc28365	576614e5-752c-45e3-936c-cf3966ad158b
00948fb2-f2b2-40fe-9356-08964cc28365	e9ae35dc-77f7-4c84-b7bc-f1ba448c13de
c981324e-11ef-43c8-bd01-2a4f8cf45c81	3edcc9e6-0874-4ef8-a375-56983d180124
c981324e-11ef-43c8-bd01-2a4f8cf45c81	576614e5-752c-45e3-936c-cf3966ad158b
c981324e-11ef-43c8-bd01-2a4f8cf45c81	aa34b618-018b-4b2f-abe7-e26bd73d350a
c981324e-11ef-43c8-bd01-2a4f8cf45c81	c08df303-19c1-45dc-adc2-fc5bf3ae09a6
d5cd7e40-0329-45ec-aa7f-e4b51b1da72e	042b1049-18e1-406b-90bb-e615a87d8d75
d5cd7e40-0329-45ec-aa7f-e4b51b1da72e	3edcc9e6-0874-4ef8-a375-56983d180124
fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	3edcc9e6-0874-4ef8-a375-56983d180124
fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	576614e5-752c-45e3-936c-cf3966ad158b
fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	aa34b618-018b-4b2f-abe7-e26bd73d350a
fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	c08df303-19c1-45dc-adc2-fc5bf3ae09a6
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
00948fb2-f2b2-40fe-9356-08964cc28365	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	49232
c981324e-11ef-43c8-bd01-2a4f8cf45c81	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	49141
d5cd7e40-0329-45ec-aa7f-e4b51b1da72e	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	49286
fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	49283
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
45df46ac-75d0-4e17-8768-492127b33534	2023-03-04 16:26:43.404385	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	00d3372f-22d2-4a3e-b097-f3ef18121afb	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	\N
5a508ae6-9638-4369-abb5-f505df2ee0a9	2023-03-04 16:26:43.404521	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	00d3372f-22d2-4a3e-b097-f3ef18121afb	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	\N
decf54c0-15e3-450e-8c1f-3ae93042bcfd	2023-03-04 16:26:43.40425	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	00d3372f-22d2-4a3e-b097-f3ef18121afb	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	\N
e6d55f0d-ae5e-44dc-808a-0b66be50e12b	2023-03-04 16:26:43.404521	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	fb0e05c4-cb0f-4c4b-832b-30f1360b0ad1	00d3372f-22d2-4a3e-b097-f3ef18121afb	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
62433ed8-f1cd-488c-a875-a2e92d9dd097	1	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	602bf558-5a8e-4a26-bc79-da729ef36c16	00d3372f-22d2-4a3e-b097-f3ef18121afb	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	d2ab6228-e0b9-4add-83dc-d97825393b4a	\N
cb68c5fe-f7ae-44c9-a3fa-2e98f9a6a9de	2	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	18eef489-ac4e-42d4-bf29-c40105ec17d2	00d3372f-22d2-4a3e-b097-f3ef18121afb	28d8acdb-33f5-4b02-b2b5-00c5eb4e83d6	d2ab6228-e0b9-4add-83dc-d97825393b4a	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
26428a69-8a2a-44d8-8f23-524d91f9c2b3	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	bbce5750-78ef-4019-9657-79df051a0f32	\N
a85dc8d0-c420-48aa-85f0-84654e9386c9	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	bbce5750-78ef-4019-9657-79df051a0f32	\N
c9744365-58d7-45f3-b2d6-03058b07e95d	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	bbce5750-78ef-4019-9657-79df051a0f32	\N
0fe52363-466c-4fc5-865d-e64efdce4df0	1	12:10:00	13:10:00	13:20:00	13:50:00	3d9a6f47-e73f-4995-9e0e-30a90fd30e0f	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
042b1049-18e1-406b-90bb-e615a87d8d75	3510	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	3510
3edcc9e6-0874-4ef8-a375-56983d180124	3500	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	3500
576614e5-752c-45e3-936c-cf3966ad158b	3610	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	3610
aa34b618-018b-4b2f-abe7-e26bd73d350a	3690	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	3690
c08df303-19c1-45dc-adc2-fc5bf3ae09a6	3550	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	3550
e9ae35dc-77f7-4c84-b7bc-f1ba448c13de	3600	\N	7eea3d26-7efe-453f-ba20-9b2bc3d16081	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
1d993690-011b-469a-baf5-ae6c3441d91e	Сварочный цех	50	050
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

