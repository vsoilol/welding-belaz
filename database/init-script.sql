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
-- Name: SeamAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SeamAccounts" (
    "Id" uuid NOT NULL,
    "DateFromPlan" timestamp without time zone NOT NULL,
    "SeamId" uuid NOT NULL,
    "ProductAccountId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: SeamResults; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SeamResults" (
    "Id" uuid NOT NULL,
    "Amount" integer NOT NULL,
    "Status" integer NOT NULL,
    "Reason" text,
    "DetectedDefects" text,
    "SeamAccountId" uuid NOT NULL,
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
    "ProductionAreaId" uuid,
    "IdFromSystem" text,
    "RfidTag" text
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
    "IdFromSystem" text,
    "RfidTag" text
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
    "SeamAccountId" uuid NOT NULL,
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
f98093d6-fe53-4f5f-b665-86905c3523a6	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
dcac1a56-6676-4692-a716-60ff0bef9a4b	36323ec9-ce2b-46d0-9c9c-f262c3b2fc75	a21b731d-618f-4f59-8f56-8bdbd7b87a9b	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
ff34a366-f6e2-4804-9f67-f7c1f4c5d416	1	10	t	f98093d6-fe53-4f5f-b665-86905c3523a6	\N
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
08bd3afe-b98c-4142-a018-fce5dce85428	Работа по карте несоответствий	\N
0f70b30b-29df-46ba-9a62-70d26a9b9100	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
154dc848-948a-4bb7-b8ee-0b1e348c6e8d	Плановый ремонт централизованными службами	\N
15786168-177b-42c7-ac72-64556f3716e6	Отсутствие конструктора, технолога или ожидание его решения	\N
1a10297f-2d40-4ddb-94a5-91193ce13fbb	Работа с управляющей программой	\N
225270f8-6c17-4e96-adcc-871dc0577508	Естественные надобности	\N
33b95365-d1f8-4b93-8c8a-fb20722b166b	Ознакомление с работой, документацией, инструктаж	\N
3a52b8b8-db2f-4abd-a2ba-3be7302e7ce3	Отсутствие оператора в связи с необеспеченностью	\N
4dd155d7-1370-4b89-bcc8-5b11e73dd200	Отсутствие заданий	\N
4f426c0c-1eb2-451a-a5f9-4048770bfba5	Отсутствие материала, заготовок, деталей	\N
50f61c82-4d89-4b26-8237-ad359a87cffe	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
797cba9e-32ed-4186-b086-c8c3f7d5404f	Отсутствие сотрудника ОТК	\N
7bd21d61-6479-451c-bccb-21ee387d55cd	Нерабочее время по графику согласно сменности	\N
870a6d72-f9d0-4c32-a3e9-19d63f0dbe6b	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
91de9450-3399-42fb-841f-45dabad2116d	Праздники и выходные	\N
a4547d89-6f76-47c6-95d0-d6ff0844946a	Установка, выверка, снятие детали	\N
b423fc56-32f0-402a-9a2d-5a81431685ce	Отсутствие крана, транспорта	\N
b6114bfe-356a-4367-8efb-820ad623adfb	Обед	\N
bb007154-111c-453e-913b-e3c9a6610007	Контроль на рабочем месте	\N
bc6e0921-4193-4ae7-a25a-a33f938d50c1	Изменение режимов, смена инструмента, приспособления	\N
e5b737cd-c1db-49d9-8b65-1248d1a7912f	Неявка оператора (б/лист, отпуск, и пр.)	\N
e83a95a6-67b6-44a1-b7c9-e6906f62f9ee	Сборочные операции	\N
f036203f-2160-4cf8-b094-9c929b9aa5d9	Аварийный ремонт централизованными службами	\N
f9494c6d-d859-4ec9-beb3-b73fefc7f419	Отсутствие энергоносителей	\N
fd8883f2-ed9b-40e2-8cde-7a084c205ceb	Установка, выверка, снятие детали	\N
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
53fe8f45-af40-4cc4-ad64-01eb2c156bfc	d488774d-9339-4fba-94d1-f578bdec9474	219379
e35831fc-0508-4ff6-bd63-4a2b039a93a3	5da2a132-4611-49d8-8a1e-cae3b69d3426	249550
807b0482-b810-4002-abb1-ac4905b6254c	d224494c-895c-4ecf-a7d3-e28acb83cfaa	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
27f0fd70-b8ca-47ae-b5a1-df7531912f0c	42796440-8528-4881-b35f-365dcd1c23f7	610422
e428d168-f360-4245-ab70-bc4575dc8d27	12c71f4c-181c-4a4f-9fe8-23cb5d1edb88	614962
f40d08b0-babe-40bf-b915-c23c649be8cf	dcb62328-cd4c-496f-b9b7-85ad0adce9c0	\N
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
053a7b78-8b79-4113-b2a9-c65961eeec71	62958e50-7948-4ad6-8c6c-1c4961c57837
06526327-6434-455e-8190-a0527b521b04	62958e50-7948-4ad6-8c6c-1c4961c57837
079b2051-b907-4444-a18c-833953bc4645	62958e50-7948-4ad6-8c6c-1c4961c57837
144c1c85-a029-4589-bba3-4768c54298f6	62958e50-7948-4ad6-8c6c-1c4961c57837
1a6d2eba-d5dc-4ce5-aa48-75464a8dbd50	62958e50-7948-4ad6-8c6c-1c4961c57837
1b92e127-c80f-4bb4-b642-1dbe821c3ddb	62958e50-7948-4ad6-8c6c-1c4961c57837
1f915b3d-a4f2-4c4e-93b4-92b9239ad16d	62958e50-7948-4ad6-8c6c-1c4961c57837
37a333fb-e07a-4d3c-92f8-97bf9e3e5011	62958e50-7948-4ad6-8c6c-1c4961c57837
43a29e4b-ebcf-43ea-b591-5ecbf537092f	62958e50-7948-4ad6-8c6c-1c4961c57837
4be2e5a5-e4c9-4e7c-ba73-5f873d4eb8b1	62958e50-7948-4ad6-8c6c-1c4961c57837
5ac7f380-b417-4dd8-99ba-d820efbb917c	62958e50-7948-4ad6-8c6c-1c4961c57837
5d191db8-16e5-4c90-a442-d1c85e79fef5	62958e50-7948-4ad6-8c6c-1c4961c57837
6a8e09a2-c308-4380-88f1-76c6b6d64186	62958e50-7948-4ad6-8c6c-1c4961c57837
6b04fc4e-f762-4650-a33d-92b8459da10b	62958e50-7948-4ad6-8c6c-1c4961c57837
6e51b88b-380e-4a65-8131-8667d0653df5	62958e50-7948-4ad6-8c6c-1c4961c57837
6f5d86e1-1856-48e4-85de-a3e8761c26c5	62958e50-7948-4ad6-8c6c-1c4961c57837
7773caf6-719f-4b79-9c41-a2671bc9c815	62958e50-7948-4ad6-8c6c-1c4961c57837
87f4d829-cb14-412d-b2f8-75bc7f124696	62958e50-7948-4ad6-8c6c-1c4961c57837
8cb7608d-6f19-4102-beaf-8bac19ced633	62958e50-7948-4ad6-8c6c-1c4961c57837
a11c08a9-9e0f-4654-8d06-9c0da58bd36e	62958e50-7948-4ad6-8c6c-1c4961c57837
a5cb9bfe-6933-4a61-a2af-76015cae947d	62958e50-7948-4ad6-8c6c-1c4961c57837
abfefd1f-1e29-4d34-aa41-f72a700a1fa8	62958e50-7948-4ad6-8c6c-1c4961c57837
bcf01bf2-d649-4dfc-99d1-173d9b5cfd18	62958e50-7948-4ad6-8c6c-1c4961c57837
bd52c757-8940-4db8-a345-83fad4786940	62958e50-7948-4ad6-8c6c-1c4961c57837
c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	62958e50-7948-4ad6-8c6c-1c4961c57837
c4213a52-ca61-4694-9dfe-15b32652d6d6	62958e50-7948-4ad6-8c6c-1c4961c57837
c5926742-562c-4ef0-a685-319e351c889e	62958e50-7948-4ad6-8c6c-1c4961c57837
c6bec8de-99b7-4049-9060-191dfa309933	62958e50-7948-4ad6-8c6c-1c4961c57837
c795c6aa-5cd7-49b9-bc85-9a59a4dcb9f2	62958e50-7948-4ad6-8c6c-1c4961c57837
d94bb1cd-c304-400f-96e7-3f6b7c1a8775	62958e50-7948-4ad6-8c6c-1c4961c57837
dc84d6aa-2c31-4062-9816-6b3595dc50ff	62958e50-7948-4ad6-8c6c-1c4961c57837
dd67f9be-8b79-4010-b0d2-da014d496920	62958e50-7948-4ad6-8c6c-1c4961c57837
de3e8a77-225e-4a3f-be39-6daa088804eb	62958e50-7948-4ad6-8c6c-1c4961c57837
de57efb8-4be1-4010-9016-c00398a1596c	62958e50-7948-4ad6-8c6c-1c4961c57837
e20b4f82-d86b-40c5-9cef-bd205bd590c9	62958e50-7948-4ad6-8c6c-1c4961c57837
e29ffe9a-f785-4185-b5df-0731138839da	62958e50-7948-4ad6-8c6c-1c4961c57837
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
053a7b78-8b79-4113-b2a9-c65961eeec71	23	2	2023-03-12 00:00:00	adbd218a-8c43-4f7a-8e70-16c86fece0f6	\N
06526327-6434-455e-8190-a0527b521b04	34	2	2023-03-12 00:00:00	eff22e46-6142-4da8-9e24-116e9f796222	\N
079b2051-b907-4444-a18c-833953bc4645	30	2	2023-03-12 00:00:00	daa01712-b779-484f-b929-39226e073a4c	\N
144c1c85-a029-4589-bba3-4768c54298f6	26	2	2023-03-12 00:00:00	bd40f0d7-1976-48a4-b9af-a2d4d2827cee	\N
1a6d2eba-d5dc-4ce5-aa48-75464a8dbd50	20	2	2023-03-12 00:00:00	8e75eb05-e8f7-4d68-8dbc-a392f6da2eff	\N
1b92e127-c80f-4bb4-b642-1dbe821c3ddb	5	2	2023-03-12 00:00:00	32c3f868-f63a-417a-8ece-7559a41a81db	\N
1f915b3d-a4f2-4c4e-93b4-92b9239ad16d	21	2	2023-03-12 00:00:00	97535796-93ae-40f9-849e-89b1aad40196	\N
37a333fb-e07a-4d3c-92f8-97bf9e3e5011	32	2	2023-03-12 00:00:00	e31e76cf-d374-40c4-b346-3e307ebe7123	\N
43a29e4b-ebcf-43ea-b591-5ecbf537092f	22	2	2023-03-12 00:00:00	a08c2b07-5f5a-440f-b1bb-5c678d00254f	\N
4be2e5a5-e4c9-4e7c-ba73-5f873d4eb8b1	29	2	2023-03-12 00:00:00	d7b3ac41-8c27-4ae1-956a-8ee0c0880bfd	\N
5ac7f380-b417-4dd8-99ba-d820efbb917c	9	2	2023-03-12 00:00:00	5287bffc-0e2c-4a2b-a153-dd0b4b746458	\N
5d191db8-16e5-4c90-a442-d1c85e79fef5	31	2	2023-03-12 00:00:00	dcea09ae-012e-4c4c-a60d-ffa366f34be6	\N
6a8e09a2-c308-4380-88f1-76c6b6d64186	25	2	2023-03-12 00:00:00	b142db7d-d981-4bfb-b646-c96eb69f2678	\N
6b04fc4e-f762-4650-a33d-92b8459da10b	18	2	2023-03-12 00:00:00	85ff6ff2-8503-4ef0-a5f6-56e4185e655a	\N
6e51b88b-380e-4a65-8131-8667d0653df5	28	2	2023-03-12 00:00:00	cfe84601-760f-44a0-87bd-3bc62ef4f4f5	\N
6f5d86e1-1856-48e4-85de-a3e8761c26c5	7	2	2023-03-12 00:00:00	410b8842-7e97-4a4f-b900-cec938970de8	\N
7773caf6-719f-4b79-9c41-a2671bc9c815	6	2	2023-03-12 00:00:00	368ecd35-5443-4ba0-bc23-71f273ba2bd1	\N
87f4d829-cb14-412d-b2f8-75bc7f124696	11	2	2023-03-12 00:00:00	65abe84f-2916-4fd7-a876-e70493de46b7	\N
8cb7608d-6f19-4102-beaf-8bac19ced633	14	2	2023-03-12 00:00:00	714b89a9-18a2-4238-bbaa-abd5bf414a12	\N
a11c08a9-9e0f-4654-8d06-9c0da58bd36e	36	2	2023-03-12 00:00:00	f9fb54a3-489b-49d7-95e7-f01f2520ffb0	\N
a5cb9bfe-6933-4a61-a2af-76015cae947d	4	2	2023-03-12 00:00:00	2e1930e3-98e4-4ace-ae7e-7f07e13d24c8	\N
abfefd1f-1e29-4d34-aa41-f72a700a1fa8	8	2	2023-03-12 00:00:00	4ad27eca-fc4a-45cb-b446-10b032608705	\N
bcf01bf2-d649-4dfc-99d1-173d9b5cfd18	15	2	2023-03-12 00:00:00	768272f7-a6d1-4492-8d6c-b53d5d29a531	\N
bd52c757-8940-4db8-a345-83fad4786940	33	2	2023-03-12 00:00:00	e739f3f1-9e94-49df-92cb-6bbb70b695a0	\N
c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	16	2	2023-03-12 00:00:00	788dd14e-77ce-411f-88c5-898828cb7ae7	\N
c4213a52-ca61-4694-9dfe-15b32652d6d6	10	2	2023-03-12 00:00:00	64db5cc6-5428-4d24-bcc1-b28b4276ab73	\N
c5926742-562c-4ef0-a685-319e351c889e	3	2	2023-03-12 00:00:00	238d7c97-dc04-4992-b1a6-0b7549cf6c0a	\N
c6bec8de-99b7-4049-9060-191dfa309933	2	2	2023-03-12 00:00:00	0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b	\N
c795c6aa-5cd7-49b9-bc85-9a59a4dcb9f2	24	2	2023-03-12 00:00:00	ae326e6c-e7fb-4f43-ac63-b31944c0547c	\N
d94bb1cd-c304-400f-96e7-3f6b7c1a8775	17	2	2023-03-12 00:00:00	81bed7d9-a7e3-4a6e-b250-12eb3c922966	\N
dc84d6aa-2c31-4062-9816-6b3595dc50ff	19	2	2023-03-12 00:00:00	86d6ab8c-1aed-4111-b639-f9cb5a1d45e8	\N
dd67f9be-8b79-4010-b0d2-da014d496920	27	2	2023-03-12 00:00:00	c4517ec1-dc89-499e-8aa6-263e7cc2bac0	\N
de3e8a77-225e-4a3f-be39-6daa088804eb	35	2	2023-03-12 00:00:00	f6c8ab35-4faf-4a34-942c-f2d300d4ef4d	\N
de57efb8-4be1-4010-9016-c00398a1596c	1	2	2023-03-12 00:00:00	06ea703c-2aa6-492d-b137-fc871e22f835	\N
e20b4f82-d86b-40c5-9cef-bd205bd590c9	12	2	2023-03-12 00:00:00	6acd0674-cdda-4685-8d9b-dd4629c7d3dc	\N
e29ffe9a-f785-4185-b5df-0731138839da	13	2	2023-03-12 00:00:00	6ef23a31-c62b-47c4-b8b0-bf639eae9172	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
a08c2b07-5f5a-440f-b1bb-5c678d00254f	06ea703c-2aa6-492d-b137-fc871e22f835
5287bffc-0e2c-4a2b-a153-dd0b4b746458	0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b
a08c2b07-5f5a-440f-b1bb-5c678d00254f	238d7c97-dc04-4992-b1a6-0b7549cf6c0a
5287bffc-0e2c-4a2b-a153-dd0b4b746458	2e1930e3-98e4-4ace-ae7e-7f07e13d24c8
a08c2b07-5f5a-440f-b1bb-5c678d00254f	32c3f868-f63a-417a-8ece-7559a41a81db
a08c2b07-5f5a-440f-b1bb-5c678d00254f	368ecd35-5443-4ba0-bc23-71f273ba2bd1
85ff6ff2-8503-4ef0-a5f6-56e4185e655a	410b8842-7e97-4a4f-b900-cec938970de8
a08c2b07-5f5a-440f-b1bb-5c678d00254f	4ad27eca-fc4a-45cb-b446-10b032608705
daa01712-b779-484f-b929-39226e073a4c	64db5cc6-5428-4d24-bcc1-b28b4276ab73
85ff6ff2-8503-4ef0-a5f6-56e4185e655a	65abe84f-2916-4fd7-a876-e70493de46b7
5287bffc-0e2c-4a2b-a153-dd0b4b746458	6acd0674-cdda-4685-8d9b-dd4629c7d3dc
daa01712-b779-484f-b929-39226e073a4c	6ef23a31-c62b-47c4-b8b0-bf639eae9172
a08c2b07-5f5a-440f-b1bb-5c678d00254f	714b89a9-18a2-4238-bbaa-abd5bf414a12
5287bffc-0e2c-4a2b-a153-dd0b4b746458	768272f7-a6d1-4492-8d6c-b53d5d29a531
5287bffc-0e2c-4a2b-a153-dd0b4b746458	788dd14e-77ce-411f-88c5-898828cb7ae7
5287bffc-0e2c-4a2b-a153-dd0b4b746458	81bed7d9-a7e3-4a6e-b250-12eb3c922966
5287bffc-0e2c-4a2b-a153-dd0b4b746458	85ff6ff2-8503-4ef0-a5f6-56e4185e655a
5287bffc-0e2c-4a2b-a153-dd0b4b746458	86d6ab8c-1aed-4111-b639-f9cb5a1d45e8
5287bffc-0e2c-4a2b-a153-dd0b4b746458	8e75eb05-e8f7-4d68-8dbc-a392f6da2eff
5287bffc-0e2c-4a2b-a153-dd0b4b746458	97535796-93ae-40f9-849e-89b1aad40196
85ff6ff2-8503-4ef0-a5f6-56e4185e655a	adbd218a-8c43-4f7a-8e70-16c86fece0f6
a08c2b07-5f5a-440f-b1bb-5c678d00254f	ae326e6c-e7fb-4f43-ac63-b31944c0547c
5287bffc-0e2c-4a2b-a153-dd0b4b746458	b142db7d-d981-4bfb-b646-c96eb69f2678
5287bffc-0e2c-4a2b-a153-dd0b4b746458	bd40f0d7-1976-48a4-b9af-a2d4d2827cee
a08c2b07-5f5a-440f-b1bb-5c678d00254f	c4517ec1-dc89-499e-8aa6-263e7cc2bac0
a08c2b07-5f5a-440f-b1bb-5c678d00254f	cfe84601-760f-44a0-87bd-3bc62ef4f4f5
a08c2b07-5f5a-440f-b1bb-5c678d00254f	d7b3ac41-8c27-4ae1-956a-8ee0c0880bfd
a08c2b07-5f5a-440f-b1bb-5c678d00254f	daa01712-b779-484f-b929-39226e073a4c
daa01712-b779-484f-b929-39226e073a4c	dcea09ae-012e-4c4c-a60d-ffa366f34be6
daa01712-b779-484f-b929-39226e073a4c	e31e76cf-d374-40c4-b346-3e307ebe7123
a08c2b07-5f5a-440f-b1bb-5c678d00254f	e739f3f1-9e94-49df-92cb-6bbb70b695a0
a08c2b07-5f5a-440f-b1bb-5c678d00254f	eff22e46-6142-4da8-9e24-116e9f796222
5287bffc-0e2c-4a2b-a153-dd0b4b746458	f6c8ab35-4faf-4a34-942c-f2d300d4ef4d
85ff6ff2-8503-4ef0-a5f6-56e4185e655a	f9fb54a3-489b-49d7-95e7-f01f2520ffb0
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
005675b2-c981-4034-af1b-e1ca0917cfd2	0	2	\N	\N	5ac7f380-b417-4dd8-99ba-d820efbb917c	\N
01722f17-3feb-4beb-9c06-e39636a26685	0	3	\N	\N	dd67f9be-8b79-4010-b0d2-da014d496920	\N
024f968e-8deb-4927-a701-7496adedf66d	0	2	\N	\N	e29ffe9a-f785-4185-b5df-0731138839da	\N
06eb8425-af25-4213-a739-65f127ac7d66	0	1	\N	\N	c5926742-562c-4ef0-a685-319e351c889e	\N
0750a693-ce65-4de8-91ad-7af9d822fcce	0	3	\N	\N	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
0db46807-2ac0-444e-b2cd-43ac477503fd	0	2	\N	\N	de57efb8-4be1-4010-9016-c00398a1596c	\N
0e9775a1-2e9a-486d-9f56-fd1d35667520	0	3	\N	\N	c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	\N
0f7221c1-c621-4e93-9a58-f083b3a6651e	0	1	\N	\N	1f915b3d-a4f2-4c4e-93b4-92b9239ad16d	\N
10e1d573-6d78-4dfe-af7a-2fe24c81cb6b	0	3	\N	\N	6e51b88b-380e-4a65-8131-8667d0653df5	\N
10efe15a-d710-41fb-8747-078f5e96757e	0	1	\N	\N	abfefd1f-1e29-4d34-aa41-f72a700a1fa8	\N
123ff61c-ed2a-46d9-9645-52abfc95949f	0	3	\N	\N	87f4d829-cb14-412d-b2f8-75bc7f124696	\N
166ac532-be37-4268-84c2-12cad64b0198	0	3	\N	\N	c6bec8de-99b7-4049-9060-191dfa309933	\N
17c865b9-6502-47a8-9d6e-499347b76161	0	3	\N	\N	1f915b3d-a4f2-4c4e-93b4-92b9239ad16d	\N
1895041f-0dab-4cdb-a9f7-6943ddda59d8	0	2	\N	\N	bd52c757-8940-4db8-a345-83fad4786940	\N
18cca24f-776e-4484-ba5c-f8e113d16999	0	3	\N	\N	6b04fc4e-f762-4650-a33d-92b8459da10b	\N
1a6121a5-6d66-4151-9148-b58f8255ae52	0	1	\N	\N	de57efb8-4be1-4010-9016-c00398a1596c	\N
1ba1efd8-74cc-4cf3-b01f-d341bbbe960f	0	3	\N	\N	06526327-6434-455e-8190-a0527b521b04	\N
1e79e815-617c-4a5a-a9c9-7ca4fc220cb4	0	1	\N	\N	d94bb1cd-c304-400f-96e7-3f6b7c1a8775	\N
2484cd55-173f-4da2-85ef-af8457bc4467	0	1	\N	\N	c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	\N
29b5e22d-5b5d-444e-bc8d-f595a4d5bcde	0	2	\N	\N	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
2c60f89a-a730-407f-a965-ab40b7c3dbdd	0	2	\N	\N	053a7b78-8b79-4113-b2a9-c65961eeec71	\N
2d306024-3d99-45b3-ada7-fda592f4e29e	0	1	\N	\N	e29ffe9a-f785-4185-b5df-0731138839da	\N
30cc4fa5-6d8a-414d-823f-1a848938c889	0	3	\N	\N	d94bb1cd-c304-400f-96e7-3f6b7c1a8775	\N
314f90e4-620f-47b3-83c3-c5ae58092531	0	3	\N	\N	079b2051-b907-4444-a18c-833953bc4645	\N
33249662-25f8-4393-84f4-b3199b9c5cad	0	1	\N	\N	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
34cbc59e-2dde-42e2-a896-45de013c4b3c	0	3	\N	\N	abfefd1f-1e29-4d34-aa41-f72a700a1fa8	\N
3a02b1fd-02b1-410d-b26b-e52e83282d2e	0	3	\N	\N	bcf01bf2-d649-4dfc-99d1-173d9b5cfd18	\N
3a9b037d-6455-467d-87b2-8b021adec981	0	3	\N	\N	de57efb8-4be1-4010-9016-c00398a1596c	\N
45ae3cbd-38e4-462a-af38-89ef976c3166	0	2	\N	\N	c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	\N
4649b798-b292-42cc-b93b-ea515cba19c5	0	1	\N	\N	dc84d6aa-2c31-4062-9816-6b3595dc50ff	\N
50b530e0-032e-426f-9aa4-1eb4e7b0e143	0	1	\N	\N	6f5d86e1-1856-48e4-85de-a3e8761c26c5	\N
523b9ea5-ebf1-4d0e-9051-40e2a1479ef8	0	3	\N	\N	c4213a52-ca61-4694-9dfe-15b32652d6d6	\N
5745029d-d42f-4cbd-8d5f-b83f13922e45	0	1	\N	\N	144c1c85-a029-4589-bba3-4768c54298f6	\N
5ea4373e-c5e6-4812-8830-159ee4329afe	0	1	\N	\N	7773caf6-719f-4b79-9c41-a2671bc9c815	\N
60a3eab6-1f85-4f1d-8580-500ee54764c8	0	2	\N	\N	c4213a52-ca61-4694-9dfe-15b32652d6d6	\N
60aa169f-126d-409a-8784-1f5982beec23	0	3	\N	\N	e20b4f82-d86b-40c5-9cef-bd205bd590c9	\N
6365eae7-b0c4-4c99-a3fb-5fcd9221d596	0	1	\N	\N	dd67f9be-8b79-4010-b0d2-da014d496920	\N
647defce-0a28-431f-848f-ae75f844424b	0	3	\N	\N	c795c6aa-5cd7-49b9-bc85-9a59a4dcb9f2	\N
649515b1-1d78-4ad6-911b-f60e6b7f5f5c	0	1	\N	\N	5d191db8-16e5-4c90-a442-d1c85e79fef5	\N
649b22cb-964d-4396-8555-d8159d6c3079	0	2	\N	\N	6a8e09a2-c308-4380-88f1-76c6b6d64186	\N
68858af0-4c35-42d5-8c37-2b1db0b3acac	0	2	\N	\N	6e51b88b-380e-4a65-8131-8667d0653df5	\N
68d002d4-58b7-42b6-b642-50d1587fd510	0	2	\N	\N	c795c6aa-5cd7-49b9-bc85-9a59a4dcb9f2	\N
7032c761-0ddb-4257-ad33-cb98694fdc43	0	3	\N	\N	a5cb9bfe-6933-4a61-a2af-76015cae947d	\N
70b48a1d-6cd9-4311-8075-d77870274fe2	0	3	\N	\N	dc84d6aa-2c31-4062-9816-6b3595dc50ff	\N
7175fa78-3cdd-4000-b895-6a49dd2fa22a	0	3	\N	\N	e29ffe9a-f785-4185-b5df-0731138839da	\N
722dd60b-a0f4-4a7e-8c31-7bd9dbcd3d65	0	1	\N	\N	a5cb9bfe-6933-4a61-a2af-76015cae947d	\N
725af612-eda4-4453-b9f4-7f94f8a9a2f7	0	1	\N	\N	079b2051-b907-4444-a18c-833953bc4645	\N
7413cf4a-708b-46d4-9f78-1b019aa50d36	0	1	\N	\N	053a7b78-8b79-4113-b2a9-c65961eeec71	\N
785d07ba-68c6-4c3c-a6f1-d1aed037df39	0	1	\N	\N	6a8e09a2-c308-4380-88f1-76c6b6d64186	\N
78b0542a-0c64-4587-8db1-50eef1087749	0	3	\N	\N	053a7b78-8b79-4113-b2a9-c65961eeec71	\N
7c233ab6-5939-489b-a99c-58b36db1c43a	0	2	\N	\N	a5cb9bfe-6933-4a61-a2af-76015cae947d	\N
7fd10cee-6c81-41e7-968b-d11df33d82a6	0	3	\N	\N	1a6d2eba-d5dc-4ce5-aa48-75464a8dbd50	\N
8332ba84-591f-4803-808c-8be10b342ee4	0	2	\N	\N	43a29e4b-ebcf-43ea-b591-5ecbf537092f	\N
83853c27-7211-4271-8868-57cf9242a0ab	0	3	\N	\N	43a29e4b-ebcf-43ea-b591-5ecbf537092f	\N
8739e21e-bcd8-434b-8b40-3ad0e613f46e	0	3	\N	\N	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
88f401e9-8901-409d-bfb6-303ea8e0754f	0	1	\N	\N	6e51b88b-380e-4a65-8131-8667d0653df5	\N
8b8bf7cd-61e2-4e42-adfb-776fda823b66	0	2	\N	\N	06526327-6434-455e-8190-a0527b521b04	\N
8c9e95cf-80e0-43d8-b99c-2762b9d6c99b	0	3	\N	\N	37a333fb-e07a-4d3c-92f8-97bf9e3e5011	\N
8ddba1f3-7160-43d9-9532-f4ea03688a49	0	1	\N	\N	4be2e5a5-e4c9-4e7c-ba73-5f873d4eb8b1	\N
8f9b7cd4-7779-4eb5-863f-a85881c123a8	0	1	\N	\N	87f4d829-cb14-412d-b2f8-75bc7f124696	\N
93ad7a77-6338-4739-b6d5-94ed542dcd8e	0	3	\N	\N	a11c08a9-9e0f-4654-8d06-9c0da58bd36e	\N
95294871-fad0-440e-8973-405934c203ac	0	1	\N	\N	bcf01bf2-d649-4dfc-99d1-173d9b5cfd18	\N
95d145a9-056a-4ab7-b12f-9124cbd4084b	0	1	\N	\N	43a29e4b-ebcf-43ea-b591-5ecbf537092f	\N
99ecdc94-9978-4e6c-acc6-2566a36ec39d	0	2	\N	\N	079b2051-b907-4444-a18c-833953bc4645	\N
9c7a74f2-3a42-4cae-9450-3efd0812e3db	0	3	\N	\N	144c1c85-a029-4589-bba3-4768c54298f6	\N
a07a5bc5-4900-43fd-a0a7-014438ffd3e1	0	2	\N	\N	abfefd1f-1e29-4d34-aa41-f72a700a1fa8	\N
a0a8ff55-7425-4134-841e-1fc13620625b	0	2	\N	\N	37a333fb-e07a-4d3c-92f8-97bf9e3e5011	\N
a0e14453-04d7-4f43-bafc-143bf3b7e5fc	0	1	\N	\N	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
a14b91d5-3ede-419f-a23f-61a31ff3d30f	0	2	\N	\N	e20b4f82-d86b-40c5-9cef-bd205bd590c9	\N
a1c6ea99-d166-4f07-bfbe-27a79cd7e5bd	0	3	\N	\N	5d191db8-16e5-4c90-a442-d1c85e79fef5	\N
a230c195-afbd-4c29-8c46-cc4209fcccc9	0	1	\N	\N	c4213a52-ca61-4694-9dfe-15b32652d6d6	\N
a4252769-1b94-423e-b661-4daee8b5a577	0	2	\N	\N	1f915b3d-a4f2-4c4e-93b4-92b9239ad16d	\N
a742f5a8-7d73-4a52-8dd8-627f665470dd	0	3	\N	\N	7773caf6-719f-4b79-9c41-a2671bc9c815	\N
a7bba46c-e82a-4095-afac-d7991552731f	0	2	\N	\N	d94bb1cd-c304-400f-96e7-3f6b7c1a8775	\N
a83177f2-4c96-4338-8aa0-8a617a8c994a	0	2	\N	\N	7773caf6-719f-4b79-9c41-a2671bc9c815	\N
a8d6092b-48a9-4347-973b-70000f40d6fa	0	2	\N	\N	bcf01bf2-d649-4dfc-99d1-173d9b5cfd18	\N
acf6d58c-9e93-49e2-a1f3-c5c1de749beb	0	1	\N	\N	e20b4f82-d86b-40c5-9cef-bd205bd590c9	\N
b2968c31-fc09-4816-a782-c04c3e6ef85c	0	1	\N	\N	c795c6aa-5cd7-49b9-bc85-9a59a4dcb9f2	\N
b528a034-1d4e-416d-a934-a2b72767bb8d	0	2	\N	\N	dd67f9be-8b79-4010-b0d2-da014d496920	\N
b6ae85b7-77a6-4635-9eab-10cac1aae79e	0	2	\N	\N	dc84d6aa-2c31-4062-9816-6b3595dc50ff	\N
bb438c00-7088-4ab2-8bf8-0462a159c9c8	0	1	\N	\N	c6bec8de-99b7-4049-9060-191dfa309933	\N
c0eaeabf-9b72-4762-8ea8-67bf76afadfa	0	3	\N	\N	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
c802bd36-f82f-4695-8c9b-6f748faaf54b	0	2	\N	\N	5d191db8-16e5-4c90-a442-d1c85e79fef5	\N
c89bcf1e-4222-49fe-94f8-dc3335337767	0	2	\N	\N	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
c8e134fc-b815-4a42-ac28-968b398e3d1b	0	3	\N	\N	bd52c757-8940-4db8-a345-83fad4786940	\N
cd4d765b-af2b-4c78-9705-057a3b04006c	0	2	\N	\N	6b04fc4e-f762-4650-a33d-92b8459da10b	\N
cd93fe43-600d-46ac-8b36-13b35b049eb4	0	3	\N	\N	4be2e5a5-e4c9-4e7c-ba73-5f873d4eb8b1	\N
d0af0c32-3aed-470d-89d5-c8041aa14214	0	2	\N	\N	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
d2918826-86d3-4312-884c-c9060e270362	0	2	\N	\N	144c1c85-a029-4589-bba3-4768c54298f6	\N
d3cdc27f-e950-44f2-8c0d-217021c9b24b	0	3	\N	\N	6f5d86e1-1856-48e4-85de-a3e8761c26c5	\N
d425dbef-259a-46ff-9a28-55f8cd19d650	0	3	\N	\N	c5926742-562c-4ef0-a685-319e351c889e	\N
d54c645f-3f5c-44c3-94de-66a3acad3237	0	2	\N	\N	c6bec8de-99b7-4049-9060-191dfa309933	\N
d9b80052-f3ef-4137-bdce-6577b65946fb	0	1	\N	\N	6b04fc4e-f762-4650-a33d-92b8459da10b	\N
da4d4c08-3687-4c7f-a46b-e02ffc9fe0ee	0	1	\N	\N	1a6d2eba-d5dc-4ce5-aa48-75464a8dbd50	\N
db496d9d-f5e2-43d3-9450-ec437588047e	0	3	\N	\N	5ac7f380-b417-4dd8-99ba-d820efbb917c	\N
dcd8780c-2f84-44c6-9215-75445a056142	0	2	\N	\N	6f5d86e1-1856-48e4-85de-a3e8761c26c5	\N
dcddd5be-b106-4f14-bb32-178464f5dcb3	0	1	\N	\N	a11c08a9-9e0f-4654-8d06-9c0da58bd36e	\N
e653c208-a6ff-4c97-b900-2d1f13c34fd4	0	2	\N	\N	a11c08a9-9e0f-4654-8d06-9c0da58bd36e	\N
e9844bcf-9497-4d1c-862e-d22a621a29cf	0	2	\N	\N	87f4d829-cb14-412d-b2f8-75bc7f124696	\N
e9e6e2bc-f537-4c56-875f-2fb4249d71ff	0	1	\N	\N	5ac7f380-b417-4dd8-99ba-d820efbb917c	\N
eb49b43f-1270-4f6d-8223-a8350336365a	0	2	\N	\N	4be2e5a5-e4c9-4e7c-ba73-5f873d4eb8b1	\N
eba8233d-790e-4b70-9217-fe0afd0544aa	0	1	\N	\N	37a333fb-e07a-4d3c-92f8-97bf9e3e5011	\N
f0e4c875-66e1-4cc9-8ba9-959b5a69eebd	0	1	\N	\N	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
f4646bf0-6f03-4fd9-901c-a69976a062a6	0	2	\N	\N	1a6d2eba-d5dc-4ce5-aa48-75464a8dbd50	\N
f8cafe77-55cb-4766-91eb-9ac29f88d2d8	0	1	\N	\N	06526327-6434-455e-8190-a0527b521b04	\N
f9802b81-f64a-42dd-9f55-f1fcddd45ab6	0	3	\N	\N	6a8e09a2-c308-4380-88f1-76c6b6d64186	\N
fac05024-7e42-4080-a8cd-734978f40dc9	0	2	\N	\N	c5926742-562c-4ef0-a685-319e351c889e	\N
fe63b1e0-b052-44ab-a827-c2d1c45d7d0a	0	1	\N	\N	bd52c757-8940-4db8-a345-83fad4786940	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
32b7d961-7630-40c2-84ad-40962f3a32cd	Сборка, сварка рам к/с г/п 120-130 т.	6	a21b731d-618f-4f59-8f56-8bdbd7b87a9b	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
06ea703c-2aa6-492d-b137-fc871e22f835	Поперечина №3 рамы с опорами	75132-2801152	t	2	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b	Лонжерон рамы левый	75131-2801015-41	t	2	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
238d7c97-dc04-4992-b1a6-0b7549cf6c0a	Лонжерон рамы левый	75131-2801017-70	t	2	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
2e1930e3-98e4-4ace-ae7e-7f07e13d24c8	Лонжерон рамы правый	75131-2801016-70	t	2	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
32c3f868-f63a-417a-8ece-7559a41a81db	Лонжерон рамы правый	75131-2801014-41	t	2	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
368ecd35-5443-4ba0-bc23-71f273ba2bd1	Лист нижний	75131-2801358-10	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
410b8842-7e97-4a4f-b900-cec938970de8	Поперечина	75131-2801325	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
4ad27eca-fc4a-45cb-b446-10b032608705	Опора	75131-2801188	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
5287bffc-0e2c-4a2b-a153-dd0b4b746458	Рама	75131-2800010-70	t	1	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	4536479362
64db5cc6-5428-4d24-bcc1-b28b4276ab73	Кронштейн задней опоры	75131-8521183-20	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
65abe84f-2916-4fd7-a876-e70493de46b7	Лист верхний	75131-2801357-10	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
6acd0674-cdda-4685-8d9b-dd4629c7d3dc	Накладка рамы поперечная передняя	75131-2801088-70	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
6ef23a31-c62b-47c4-b8b0-bf639eae9172	Лист верхний	75131-2801357-10	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
714b89a9-18a2-4238-bbaa-abd5bf414a12	Лонжерон рамы левый	75131-2801015-41	t	2	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
768272f7-a6d1-4492-8d6c-b53d5d29a531	Усилитель	75131-2801115-01	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
788dd14e-77ce-411f-88c5-898828cb7ae7	Лонжерон рамы левый	75131-2801017-70	t	2	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
81bed7d9-a7e3-4a6e-b250-12eb3c922966	Опора	75131-2801189	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
85ff6ff2-8503-4ef0-a5f6-56e4185e655a	Поперечина рамы задняя	75131-2801300-20	t	2	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
86d6ab8c-1aed-4111-b639-f9cb5a1d45e8	Опора	75131-2801188	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
8e75eb05-e8f7-4d68-8dbc-a392f6da2eff	Поперечина	75131-2801103-10	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
97535796-93ae-40f9-849e-89b1aad40196	Лист нижний	75131-2801358-10	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
a08c2b07-5f5a-440f-b1bb-5c678d00254f	Рама	7513D-2800010-20	t	1	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	4536492774
adbd218a-8c43-4f7a-8e70-16c86fece0f6	Кронштейн задней опоры	75131-8521182-20	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
ae326e6c-e7fb-4f43-ac63-b31944c0547c	Накладка рамы поперечная передняя	75131-2801088-70	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
b142db7d-d981-4bfb-b646-c96eb69f2678	Поперечина №3 рамы с опорами	75132-2801152	t	2	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
bd40f0d7-1976-48a4-b9af-a2d4d2827cee	Усилитель	75131-2801114-01	t	3	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
c4517ec1-dc89-499e-8aa6-263e7cc2bac0	Усилитель	75131-2801114-01	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
cfe84601-760f-44a0-87bd-3bc62ef4f4f5	Лонжерон рамы правый	75131-2801016-70	t	2	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
d7b3ac41-8c27-4ae1-956a-8ee0c0880bfd	Усилитель	75131-2801115-01	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
daa01712-b779-484f-b929-39226e073a4c	Поперечина рамы задняя	75131-2801300-20	t	2	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
dcea09ae-012e-4c4c-a60d-ffa366f34be6	Кронштейн задней опоры	75131-8521182-20	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
e31e76cf-d374-40c4-b346-3e307ebe7123	Поперечина	75131-2801325	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
e739f3f1-9e94-49df-92cb-6bbb70b695a0	Опора	75131-2801189	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
eff22e46-6142-4da8-9e24-116e9f796222	Поперечина	75131-2801103-10	t	3	e379cda9-8825-4221-b3e5-98b607bcc7a2	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
f6c8ab35-4faf-4a34-942c-f2d300d4ef4d	Лонжерон рамы правый	75131-2801014-41	t	2	64e4350b-2c07-45d0-aebd-57cfda5c28ed	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
f9fb54a3-489b-49d7-95e7-f01f2520ffb0	Кронштейн задней опоры	75131-8521183-20	t	3	0f7a3510-f174-48fd-a514-85ea5c0c2c87	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
4f185fbb-ddb9-4bc4-a5db-feedeed48367	Admin	\N
94f12384-c1b6-4d40-bcd0-a313deac8240	Master	\N
eae8caf8-06d6-44ef-bd63-9eadfa886779	Welder	\N
78ad465f-d4ca-442f-9249-99b5e8c90e5f	Inspector	\N
4070a9f4-a2d7-4a9b-9ee1-d157458cc436	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
02d4b999-939f-4217-ac71-f9276b73847d	2023-03-12 00:00:00	605a2909-ae94-4161-a231-fd72d8344045	dc84d6aa-2c31-4062-9816-6b3595dc50ff	\N
0be8b880-8cea-4aef-ad4a-0c6ee09dc35a	2023-03-12 00:00:00	a1a0f7ea-e5b9-44a4-b673-648a308361cf	dc84d6aa-2c31-4062-9816-6b3595dc50ff	\N
0cab6489-9c61-4ee7-8fff-4e587d2e3732	2023-03-12 00:00:00	fb422436-2342-46b7-b1b7-8b44b21d0707	079b2051-b907-4444-a18c-833953bc4645	\N
0d4e41b7-cd84-4fca-a9ca-f03a1fb7e1a1	2023-03-12 00:00:00	1aa7d09c-d018-442c-9d35-f09f881359f9	6b04fc4e-f762-4650-a33d-92b8459da10b	\N
0dcae114-84e4-4682-915f-f478a68bfc65	2023-03-12 00:00:00	21a4f8c3-2d0c-42a2-be78-f2bc347389c3	abfefd1f-1e29-4d34-aa41-f72a700a1fa8	\N
112d8d66-ffd0-48bc-aec1-11c6e10792bf	2023-03-12 00:00:00	4cefbf2c-2a2a-44df-8f6a-fe016f4c57a1	c5926742-562c-4ef0-a685-319e351c889e	\N
116d6146-95e3-4db1-9c89-0d06491a8798	2023-03-12 00:00:00	a3e86b6b-0371-4ce1-bf6f-6a563c3c47c3	e29ffe9a-f785-4185-b5df-0731138839da	\N
1229a1e4-091e-4eb6-8925-81e0bba4116a	2023-03-12 00:00:00	e618f383-377d-43da-9be6-3756342bc53a	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
1bd54185-cbb3-4e62-85bd-6436eca7f1d1	2023-03-12 00:00:00	1de7eede-2129-4273-a956-b79cd10ad1cf	6f5d86e1-1856-48e4-85de-a3e8761c26c5	\N
1bf3a9ac-6ff7-4e41-9f2c-1dda41c9dd33	2023-03-12 00:00:00	fbbb3427-38e5-446e-a58f-caac5e1fdb1d	dd67f9be-8b79-4010-b0d2-da014d496920	\N
207c706b-50a4-405c-94c2-560767823184	2023-03-12 00:00:00	3926e647-7d7d-4138-819a-613b939ad6e5	d94bb1cd-c304-400f-96e7-3f6b7c1a8775	\N
2643de7a-cfaa-4220-808e-a27c43bd7114	2023-03-12 00:00:00	c2b1ee0e-999f-49bb-9324-629fa2a9d67a	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
282ca3d4-ed14-41c5-a76f-df039087e81d	2023-03-12 00:00:00	251bc701-7858-4f21-9adc-e6ebf301cef9	c5926742-562c-4ef0-a685-319e351c889e	\N
2908091f-1958-4dd0-b788-81a3f453af61	2023-03-12 00:00:00	0abd0f52-b7a3-4e31-97d2-d613fde76399	37a333fb-e07a-4d3c-92f8-97bf9e3e5011	\N
2dce2a81-235e-4d03-80e9-0f4b4476c7cb	2023-03-12 00:00:00	1b90b303-2bf8-4dca-b2f5-03056c203090	c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	\N
30ece52e-7e36-4899-a882-8b38b51f3544	2023-03-12 00:00:00	05bba586-a4da-4795-8b0c-dc5779c77e1c	bcf01bf2-d649-4dfc-99d1-173d9b5cfd18	\N
31959968-0454-4e16-8df5-e3a11de8d86a	2023-03-12 00:00:00	84797e23-cdee-4d68-b8b1-dc95429cf0d2	bd52c757-8940-4db8-a345-83fad4786940	\N
32cd5cdb-2bd7-4320-b641-d1a7f7eff7e0	2023-03-12 00:00:00	81a92651-ccb8-4236-826f-dfc312531d8e	abfefd1f-1e29-4d34-aa41-f72a700a1fa8	\N
3cec94f8-d5fd-4493-90f3-f2e57fa1f024	2023-03-12 00:00:00	27dde355-ecef-4bf7-9760-61d6e2d94015	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
3d494334-4161-4d19-a1fe-e6652869bf7c	2023-03-12 00:00:00	1aed1310-f9b9-42ac-9c66-f2dc6ae2c303	bd52c757-8940-4db8-a345-83fad4786940	\N
3e847de5-1181-4b65-97a2-996cededac17	2023-03-12 00:00:00	e56422ef-d145-4260-a8fb-27bb0ce78a6f	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
4249d2bf-c5c9-4a6a-8db7-b3405b3746e6	2023-03-12 00:00:00	0ed343c9-dd90-4a90-be7f-8d46ffba853e	d94bb1cd-c304-400f-96e7-3f6b7c1a8775	\N
427afdb0-809f-4b96-9653-720a6caa1ec2	2023-03-12 00:00:00	9b228f53-41d5-4dd2-9519-da5476d22e50	c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	\N
478cd2f7-796d-4cd9-b98f-5876dc588971	2023-03-12 00:00:00	0eae33f4-72ba-45ee-8a5f-37220abf811a	abfefd1f-1e29-4d34-aa41-f72a700a1fa8	\N
4d57603c-cdce-450c-99b3-45f4df1111d5	2023-03-12 00:00:00	1ea0767d-8709-4269-8b8e-0f341bc3026f	37a333fb-e07a-4d3c-92f8-97bf9e3e5011	\N
4d7d8dce-4a7e-4276-b4a1-9f9baa7ca0ef	2023-03-12 00:00:00	81200d2e-2d4c-433d-9ec7-759938d79030	e20b4f82-d86b-40c5-9cef-bd205bd590c9	\N
4e6e7039-66ac-40e0-a4a5-d8e6ebc7e145	2023-03-12 00:00:00	e8450f9f-c18a-4964-a786-fb5c384aae0f	6a8e09a2-c308-4380-88f1-76c6b6d64186	\N
5077880e-8e0c-4ce6-a7d3-e20f1f926f56	2023-03-12 00:00:00	90b303d7-92b3-452d-9785-2979314d89b4	5d191db8-16e5-4c90-a442-d1c85e79fef5	\N
61b80d26-d0b3-402a-ba6e-ccf282e3651a	2023-03-12 00:00:00	ee21bca3-3a1f-491a-b834-64ac94b56acc	6e51b88b-380e-4a65-8131-8667d0653df5	\N
63f19462-0c5c-4b59-b6dd-7d12e66133f2	2023-03-12 00:00:00	1f482ad1-6e24-4334-ac8c-c97c62551e1b	c6bec8de-99b7-4049-9060-191dfa309933	\N
6c77803d-0b86-45b9-be00-9504785079cf	2023-03-12 00:00:00	c10b457b-dc82-45ea-927d-a9df633bb643	a5cb9bfe-6933-4a61-a2af-76015cae947d	\N
7046ca15-f080-49cc-a82c-528bcc0c7d66	2023-03-12 00:00:00	b55003cd-ecdd-4522-8a6f-988d04fc189f	dc84d6aa-2c31-4062-9816-6b3595dc50ff	\N
72554bdd-1c7c-41d1-b439-bd6c6f76b62a	2023-03-12 00:00:00	b2c4ea70-96f7-4006-a147-528fca9374fa	c3d68aeb-5679-4bd7-b56b-9a6ed9ac56d1	\N
7287df89-3785-47f7-8259-2230eec31fa5	2023-03-12 00:00:00	be9ec819-9fbf-46d2-beff-57ecaf14b119	6e51b88b-380e-4a65-8131-8667d0653df5	\N
754e3b01-99c2-4394-bcd7-cf20db69a0b4	2023-03-12 00:00:00	b3e357d6-6220-494b-845b-1452bb13a225	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
7a12f5b9-65b3-4010-9db0-f14883aaf900	2023-03-12 00:00:00	92278c86-1b42-4476-8ce5-9db029e9853d	c6bec8de-99b7-4049-9060-191dfa309933	\N
7ff6d2bd-d895-403e-a8b5-26ef075e1edb	2023-03-12 00:00:00	a322194e-a950-4ae3-98b2-eaa209905a08	de3e8a77-225e-4a3f-be39-6daa088804eb	\N
853b69ce-a022-40f0-b18b-172bbcaeec6c	2023-03-12 00:00:00	92b04541-3257-4c1f-a665-52812e3f0aaa	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
86d728a6-978d-46ca-bdf6-d786e9b309a7	2023-03-12 00:00:00	0c54b076-066f-4fa9-876f-971beac267ac	6f5d86e1-1856-48e4-85de-a3e8761c26c5	\N
89194163-b21d-46af-97bd-b5caa1f4106e	2023-03-12 00:00:00	6527ab45-7bf1-44a2-b8dd-4ef12783606e	a5cb9bfe-6933-4a61-a2af-76015cae947d	\N
8938a87b-97b4-4ea6-8b81-8783079f9e1c	2023-03-12 00:00:00	27f6de22-cec9-4758-848f-7ec4ad6b6fb3	a5cb9bfe-6933-4a61-a2af-76015cae947d	\N
8a048074-33b6-4d6f-9614-bba9b01d5b0f	2023-03-12 00:00:00	39e19dcd-a966-470a-833b-e73d5101b648	e29ffe9a-f785-4185-b5df-0731138839da	\N
95b019ca-72a6-47b4-a967-1a008d108286	2023-03-12 00:00:00	1c76cb04-1a4e-4588-b0ae-c11685ecadc2	c6bec8de-99b7-4049-9060-191dfa309933	\N
9997a22e-cd73-422c-9534-ac0c32137111	2023-03-12 00:00:00	04928491-b2bd-4b8d-adcd-ffc985177454	87f4d829-cb14-412d-b2f8-75bc7f124696	\N
9abf1f20-e19a-4f86-9736-833e6261b03a	2023-03-12 00:00:00	c3980324-0f8e-4fb2-8737-f48df1483b79	c6bec8de-99b7-4049-9060-191dfa309933	\N
9c04e6d7-c747-4b65-858c-7d8c84ff6f69	2023-03-12 00:00:00	f7e61366-e8e7-45d0-b81e-ba15732f8f76	6e51b88b-380e-4a65-8131-8667d0653df5	\N
9f1fda0d-ed1f-4957-8a8a-390963a3a198	2023-03-12 00:00:00	3791f2a6-3303-4a57-8657-35231875f48a	079b2051-b907-4444-a18c-833953bc4645	\N
a256187f-b61d-4f1b-8c44-6e775391fa34	2023-03-12 00:00:00	5322d394-4c25-4ffc-a985-e11615b473e3	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
af176eda-5e40-4517-80b1-db5032bfe7bf	2023-03-12 00:00:00	c3a70ba6-0119-41db-b713-cabb3ea41040	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
b68ae819-1179-4e89-876e-4d9a5a8e083c	2023-03-12 00:00:00	4b318086-d376-4f22-bf62-404ee99daedc	a11c08a9-9e0f-4654-8d06-9c0da58bd36e	\N
b6959a93-4a16-4bda-ba9e-2a1d72b56b2a	2023-03-12 00:00:00	223b577f-8078-4962-97f1-92ade30dd3ab	7773caf6-719f-4b79-9c41-a2671bc9c815	\N
b71a97b1-d4ac-4fa5-8cd5-0dfce739f02c	2023-03-12 00:00:00	9d5c9bee-726d-46f6-ac15-3e51bcf90084	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
b727466c-c9f6-47fb-b204-1d377fb438db	2023-03-12 00:00:00	0646bf2b-164a-4084-bfb3-b86d31914ba6	6b04fc4e-f762-4650-a33d-92b8459da10b	\N
b77a566e-5528-4c61-b833-d8d141e75812	2023-03-12 00:00:00	4d67cab7-2940-431c-8fd9-836a969dcc46	de57efb8-4be1-4010-9016-c00398a1596c	\N
bb40ad14-b1d8-47b2-b9c5-be2736dc1f11	2023-03-12 00:00:00	bd0eb670-aa1f-4b9d-8320-838105073263	053a7b78-8b79-4113-b2a9-c65961eeec71	\N
c1f82c80-e7c0-4594-8a88-20e2c9de0e62	2023-03-12 00:00:00	11f122bb-736e-49a2-a6df-175fc646ac88	1b92e127-c80f-4bb4-b642-1dbe821c3ddb	\N
c45a1c54-9062-434b-9e73-cf3288d48a83	2023-03-12 00:00:00	4abfe0a6-ffc5-40c8-b6b3-908bcbd94e6b	06526327-6434-455e-8190-a0527b521b04	\N
c5479bd1-2278-45ac-a7f4-85136c50d9d3	2023-03-12 00:00:00	dc5638f4-5c6b-477f-b20c-55c04c566896	c4213a52-ca61-4694-9dfe-15b32652d6d6	\N
c55eb3d0-eaca-42f8-8371-07f59e7c68fc	2023-03-12 00:00:00	8cb8c7c0-e3ff-4c07-aa14-bf4e19073331	c5926742-562c-4ef0-a685-319e351c889e	\N
c6453476-88e1-4ee7-9772-572fc3723589	2023-03-12 00:00:00	34feaca5-d53b-4f77-be70-94526017ed52	4be2e5a5-e4c9-4e7c-ba73-5f873d4eb8b1	\N
cc0adf47-6a58-4bf6-aacc-3ca48f03021c	2023-03-12 00:00:00	799bdb93-416c-4d6a-af14-8219adc91da7	1a6d2eba-d5dc-4ce5-aa48-75464a8dbd50	\N
cca62e4b-d6d0-4ec6-b29c-65f8117ee224	2023-03-12 00:00:00	b446b425-3495-4649-99d8-22f6c7a05857	1f915b3d-a4f2-4c4e-93b4-92b9239ad16d	\N
d2048cf7-4217-468d-95af-e061bde20b78	2023-03-12 00:00:00	8e10d2d5-a3cb-4b6e-b01a-2ae571927972	87f4d829-cb14-412d-b2f8-75bc7f124696	\N
de9d3e53-0013-4177-ad86-37b847053402	2023-03-12 00:00:00	e4e03b43-f929-4d96-9d9e-2af30b24fc0c	bd52c757-8940-4db8-a345-83fad4786940	\N
df4ec6ed-4e53-48a6-a304-fafdd113d37f	2023-03-12 00:00:00	4b99890c-f264-45dc-987f-865a6d7b5314	d94bb1cd-c304-400f-96e7-3f6b7c1a8775	\N
e1e1195a-1f86-46c5-ba1c-4089b7b9a929	2023-03-12 00:00:00	abda918f-163e-44da-847a-a4a5e742c3b2	8cb7608d-6f19-4102-beaf-8bac19ced633	\N
f54115ed-4e93-4f19-a54e-9d2b84408ad7	2023-03-12 00:00:00	01d4b2ea-b079-4457-a9b9-fe9ffac162cb	144c1c85-a029-4589-bba3-4768c54298f6	\N
ffcfb821-eddf-465b-821c-b2e256170069	2023-03-12 00:00:00	77055e3d-fa1b-46a8-9e9e-7c8b96bba8ef	c795c6aa-5cd7-49b9-bc85-9a59a4dcb9f2	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
02833756-c819-4d27-887d-dcbe433754bb	0	3	\N	\N	af176eda-5e40-4517-80b1-db5032bfe7bf	\N
05c1973d-fe9c-42c1-bcd8-f72a64825dac	0	3	\N	\N	5077880e-8e0c-4ce6-a7d3-e20f1f926f56	\N
08282d62-dbb2-45fd-a314-b33ddb3f8c03	0	3	\N	\N	478cd2f7-796d-4cd9-b98f-5876dc588971	\N
0ad9e509-81f1-4fba-8fbd-d886f7cf762e	0	2	\N	\N	478cd2f7-796d-4cd9-b98f-5876dc588971	\N
0e45e6e7-c5c4-4ed7-a4c8-755b49e2a1d4	0	3	\N	\N	4e6e7039-66ac-40e0-a4a5-d8e6ebc7e145	\N
0ff85fd9-73f9-442d-a811-82394afbf2cb	0	3	\N	\N	b68ae819-1179-4e89-876e-4d9a5a8e083c	\N
11041c33-0997-4d96-85be-0ed56262e176	0	3	\N	\N	282ca3d4-ed14-41c5-a76f-df039087e81d	\N
116f7ba7-035b-4855-8e17-e588d44f9d82	0	3	\N	\N	0d4e41b7-cd84-4fca-a9ca-f03a1fb7e1a1	\N
135d0997-3926-49e1-ab5e-d9be5b71298b	0	2	\N	\N	4e6e7039-66ac-40e0-a4a5-d8e6ebc7e145	\N
145026f3-16ad-4c4a-8691-8de4cc8c89d8	0	3	\N	\N	bb40ad14-b1d8-47b2-b9c5-be2736dc1f11	\N
14aa2fa4-1e37-4070-aba3-7e1642dfa71b	0	3	\N	\N	ffcfb821-eddf-465b-821c-b2e256170069	\N
167c03b2-6f7e-4275-a2b5-1f4e3fbfa6e5	0	2	\N	\N	c45a1c54-9062-434b-9e73-cf3288d48a83	\N
173fa276-0b00-44b7-8089-11cc71ba322d	0	3	\N	\N	63f19462-0c5c-4b59-b6dd-7d12e66133f2	\N
17db54b6-ebe3-410d-9ff1-c77d21a66613	0	2	\N	\N	8a048074-33b6-4d6f-9614-bba9b01d5b0f	\N
190c6fe4-17de-4eed-8e8d-0b457e729344	0	3	\N	\N	2643de7a-cfaa-4220-808e-a27c43bd7114	\N
1a1f79d8-d580-45c1-886e-eac31c4ba25e	0	3	\N	\N	754e3b01-99c2-4394-bcd7-cf20db69a0b4	\N
1c0ad612-b28e-4298-9d4b-77c4bc1cef5c	0	2	\N	\N	30ece52e-7e36-4899-a882-8b38b51f3544	\N
1c55a54d-d5e5-44c0-b64f-bdb6b6563cf9	0	2	\N	\N	de9d3e53-0013-4177-ad86-37b847053402	\N
1c63419c-553e-4284-82c3-f921c4f6eb7a	0	3	\N	\N	c6453476-88e1-4ee7-9772-572fc3723589	\N
1eb633e0-ff56-4887-b199-a6c4047b151a	0	3	\N	\N	de9d3e53-0013-4177-ad86-37b847053402	\N
22e65736-f496-410c-9fa2-776d0647c7a5	0	2	\N	\N	5077880e-8e0c-4ce6-a7d3-e20f1f926f56	\N
2398d2d5-8059-4c37-b0b8-ffd8f02f4790	0	3	\N	\N	427afdb0-809f-4b96-9653-720a6caa1ec2	\N
2470688e-2601-497a-8f58-2454a3f8975d	0	2	\N	\N	b6959a93-4a16-4bda-ba9e-2a1d72b56b2a	\N
260266af-589f-4bc8-9821-cd6e6fb68c6c	0	3	\N	\N	d2048cf7-4217-468d-95af-e061bde20b78	\N
275d99ff-fa34-45d8-8c30-b3e312657d0a	0	3	\N	\N	3cec94f8-d5fd-4493-90f3-f2e57fa1f024	\N
297270f1-9110-4266-be96-8a27fccd7539	0	3	\N	\N	a256187f-b61d-4f1b-8c44-6e775391fa34	\N
2d065014-3ee3-4d44-896d-eae481008a9b	0	3	\N	\N	95b019ca-72a6-47b4-a967-1a008d108286	\N
3003523d-fda0-4526-879c-64d0a463ee95	0	3	\N	\N	c45a1c54-9062-434b-9e73-cf3288d48a83	\N
31435beb-d2ec-4c23-a681-421672ae235c	0	3	\N	\N	116d6146-95e3-4db1-9c89-0d06491a8798	\N
33a91210-fc14-45ad-a400-fe35f5afec09	0	2	\N	\N	207c706b-50a4-405c-94c2-560767823184	\N
34a74872-3c47-468c-9bbc-77afa63bf124	0	2	\N	\N	ffcfb821-eddf-465b-821c-b2e256170069	\N
35aa91d6-3944-464c-a113-ef3daae8c70a	0	2	\N	\N	7ff6d2bd-d895-403e-a8b5-26ef075e1edb	\N
35d36502-0478-4790-af32-32c70a671fbe	0	2	\N	\N	32cd5cdb-2bd7-4320-b641-d1a7f7eff7e0	\N
370346ad-98f2-41d9-b8ca-bc0396707ad4	0	2	\N	\N	b727466c-c9f6-47fb-b204-1d377fb438db	\N
373ef337-231c-4bf2-a4a2-cc0c478d7809	0	3	\N	\N	4d57603c-cdce-450c-99b3-45f4df1111d5	\N
38650679-ea83-416b-8532-198d8baf2a4a	0	3	\N	\N	0dcae114-84e4-4682-915f-f478a68bfc65	\N
3a460659-bcae-45e5-a24e-809be0a96e3b	0	3	\N	\N	1229a1e4-091e-4eb6-8925-81e0bba4116a	\N
3ce00627-80dc-47e1-a421-25032883a105	0	3	\N	\N	b71a97b1-d4ac-4fa5-8cd5-0dfce739f02c	\N
3d869418-d69d-4ae0-80db-8c6e4e1bb7eb	0	2	\N	\N	7046ca15-f080-49cc-a82c-528bcc0c7d66	\N
3f16081b-2824-4fea-9252-1059551324bd	0	2	\N	\N	89194163-b21d-46af-97bd-b5caa1f4106e	\N
3f880ed1-d093-412d-af4f-c435db04e95a	0	2	\N	\N	3cec94f8-d5fd-4493-90f3-f2e57fa1f024	\N
4268292e-3ee7-46ed-829e-50814805ce37	0	3	\N	\N	32cd5cdb-2bd7-4320-b641-d1a7f7eff7e0	\N
45a306d1-b4fc-4bb0-ad0e-68af85e7dc3d	0	3	\N	\N	7287df89-3785-47f7-8259-2230eec31fa5	\N
45db5c4a-16fe-4ed8-8be8-e46df0bf93c7	0	3	\N	\N	9abf1f20-e19a-4f86-9736-833e6261b03a	\N
46a6ebc0-dac5-4633-b83b-47afc929e32b	0	2	\N	\N	a256187f-b61d-4f1b-8c44-6e775391fa34	\N
49e19f11-27de-43dd-8110-44126c92facc	0	2	\N	\N	c55eb3d0-eaca-42f8-8371-07f59e7c68fc	\N
4ab30830-d19c-4c58-aa41-4236d0ca7b9e	0	3	\N	\N	6c77803d-0b86-45b9-be00-9504785079cf	\N
4af4f7f5-e0a6-4d14-8957-c1d0305d6f6c	0	2	\N	\N	0cab6489-9c61-4ee7-8fff-4e587d2e3732	\N
4b19019a-6a03-48b8-a7fd-fbad6982c4c8	0	2	\N	\N	9997a22e-cd73-422c-9534-ac0c32137111	\N
4d9e0ded-cb6c-43dd-9e9c-f75862b3ae14	0	2	\N	\N	b77a566e-5528-4c61-b833-d8d141e75812	\N
503ca849-9de2-4679-80be-85578841b0d4	0	2	\N	\N	d2048cf7-4217-468d-95af-e061bde20b78	\N
53851788-bb58-4d9a-8d1c-5284fa9cf116	0	3	\N	\N	e1e1195a-1f86-46c5-ba1c-4089b7b9a929	\N
54020ee5-db9a-4c1b-a3c2-4a77c4cc33e2	0	3	\N	\N	cc0adf47-6a58-4bf6-aacc-3ca48f03021c	\N
590867f3-5a86-4a28-b342-35f82f465403	0	2	\N	\N	0dcae114-84e4-4682-915f-f478a68bfc65	\N
597d77b3-6aa4-4c67-9dfa-3c2c5a3377b8	0	3	\N	\N	c5479bd1-2278-45ac-a7f4-85136c50d9d3	\N
5a9f9845-2876-4d72-9a0b-626627937705	0	2	\N	\N	c1f82c80-e7c0-4594-8a88-20e2c9de0e62	\N
5c5c2965-7ea2-4b07-9e5e-39cd89df4970	0	2	\N	\N	1229a1e4-091e-4eb6-8925-81e0bba4116a	\N
5c6ad611-3643-4a05-bcd5-0bb3312089dc	0	2	\N	\N	116d6146-95e3-4db1-9c89-0d06491a8798	\N
5ed43172-964e-4389-b4e8-b49e10b69b37	0	3	\N	\N	c1f82c80-e7c0-4594-8a88-20e2c9de0e62	\N
61a07d95-a22b-4c84-940a-f223d79ad459	0	2	\N	\N	af176eda-5e40-4517-80b1-db5032bfe7bf	\N
63bb8fdc-5627-4114-998b-29da542f000d	0	2	\N	\N	b68ae819-1179-4e89-876e-4d9a5a8e083c	\N
64047f8f-2160-4093-b5b5-25772a361a8f	0	3	\N	\N	30ece52e-7e36-4899-a882-8b38b51f3544	\N
66791859-2a44-493b-931a-6514a55b28db	0	2	\N	\N	4249d2bf-c5c9-4a6a-8db7-b3405b3746e6	\N
66dc6407-59a6-4ab6-a816-fae948fe2da3	0	3	\N	\N	8938a87b-97b4-4ea6-8b81-8783079f9e1c	\N
68653b60-056e-4e16-a053-408e48a5bf8e	0	3	\N	\N	9f1fda0d-ed1f-4957-8a8a-390963a3a198	\N
68a57208-7058-4088-897c-ceb965729f8c	0	2	\N	\N	3d494334-4161-4d19-a1fe-e6652869bf7c	\N
6baa63bc-870a-4dab-9706-f1edae6eaf89	0	3	\N	\N	3e847de5-1181-4b65-97a2-996cededac17	\N
6bd0990a-afe4-416c-ac37-9900eb13585f	0	2	\N	\N	1bf3a9ac-6ff7-4e41-9f2c-1dda41c9dd33	\N
6cec40a6-1eab-4b51-a265-fac8ec98341b	0	3	\N	\N	02d4b999-939f-4217-ac71-f9276b73847d	\N
703997b7-6724-49a9-b784-6ccc7932a534	0	3	\N	\N	0be8b880-8cea-4aef-ad4a-0c6ee09dc35a	\N
737c6123-32b4-4781-8082-5594a6a6e73e	0	3	\N	\N	7046ca15-f080-49cc-a82c-528bcc0c7d66	\N
7c80f4da-919e-4419-a017-00164e4ae9b8	0	3	\N	\N	c55eb3d0-eaca-42f8-8371-07f59e7c68fc	\N
7d4ac74a-00ad-4074-89be-26d18a551003	0	2	\N	\N	e1e1195a-1f86-46c5-ba1c-4089b7b9a929	\N
7e042dbc-2623-45b5-b739-8172c31e7dc5	0	3	\N	\N	7ff6d2bd-d895-403e-a8b5-26ef075e1edb	\N
7f8835a4-04d6-4481-a11e-29f39b494ca0	0	2	\N	\N	bb40ad14-b1d8-47b2-b9c5-be2736dc1f11	\N
7ffb709a-6060-45f7-9f7c-41c41378593b	0	3	\N	\N	853b69ce-a022-40f0-b18b-172bbcaeec6c	\N
84dc27a8-de09-4c98-ae4b-7348409211e4	0	2	\N	\N	c6453476-88e1-4ee7-9772-572fc3723589	\N
8541bde0-87d2-496a-a0ee-39df8cffdff6	0	2	\N	\N	f54115ed-4e93-4f19-a54e-9d2b84408ad7	\N
8649a47e-e5a9-4749-bfb4-c523b9ebfade	0	3	\N	\N	72554bdd-1c7c-41d1-b439-bd6c6f76b62a	\N
86beb31a-3956-4a44-b4f6-8abfe277f71b	0	2	\N	\N	8938a87b-97b4-4ea6-8b81-8783079f9e1c	\N
8874ff94-828f-4d7d-9217-c56976d6804c	0	2	\N	\N	7a12f5b9-65b3-4010-9db0-f14883aaf900	\N
8bee2a9d-4689-4303-9140-a4601432835d	0	2	\N	\N	7287df89-3785-47f7-8259-2230eec31fa5	\N
8c0cef07-6a45-421d-80a4-1fd754ae6108	0	2	\N	\N	2643de7a-cfaa-4220-808e-a27c43bd7114	\N
8cccfde3-af8a-4acb-96f7-b53cf406f99e	0	3	\N	\N	3d494334-4161-4d19-a1fe-e6652869bf7c	\N
90341bb1-4d50-4d27-a4e6-9c8310a57c5c	0	2	\N	\N	02d4b999-939f-4217-ac71-f9276b73847d	\N
90459085-58fb-48a9-9e45-f1e4db9867cf	0	2	\N	\N	0be8b880-8cea-4aef-ad4a-0c6ee09dc35a	\N
93518abf-e311-4322-baea-a337204051d2	0	2	\N	\N	86d728a6-978d-46ca-bdf6-d786e9b309a7	\N
94055351-7bb9-402c-b85f-3154c3ba47fa	0	3	\N	\N	61b80d26-d0b3-402a-ba6e-ccf282e3651a	\N
96b3949c-a403-477b-87a5-ce120180771a	0	3	\N	\N	1bd54185-cbb3-4e62-85bd-6436eca7f1d1	\N
9a4a2c64-6c2e-403d-8a83-50724b96e840	0	3	\N	\N	7a12f5b9-65b3-4010-9db0-f14883aaf900	\N
9b2930e7-18d2-4845-aa10-4fad4ef5ab5f	0	3	\N	\N	f54115ed-4e93-4f19-a54e-9d2b84408ad7	\N
9c29af35-eca0-4dc7-84c5-86d290afa224	0	2	\N	\N	31959968-0454-4e16-8df5-e3a11de8d86a	\N
9cb97e6f-d775-4b52-98db-63e06d4756e6	0	2	\N	\N	4d7d8dce-4a7e-4276-b4a1-9f9baa7ca0ef	\N
9e46da0a-a6f4-49e8-8190-1eae7a8e065d	0	3	\N	\N	4d7d8dce-4a7e-4276-b4a1-9f9baa7ca0ef	\N
9e84d841-2768-471a-bae1-82f039b9ea7d	0	3	\N	\N	9997a22e-cd73-422c-9534-ac0c32137111	\N
a1159c6e-19ad-4132-a9f2-10e5e4da22eb	0	3	\N	\N	207c706b-50a4-405c-94c2-560767823184	\N
a3621740-6d79-468c-bced-35f2c2b77e05	0	2	\N	\N	282ca3d4-ed14-41c5-a76f-df039087e81d	\N
a4684346-2a45-4d36-920f-47f18f506479	0	2	\N	\N	112d8d66-ffd0-48bc-aec1-11c6e10792bf	\N
a8286119-ddcf-4270-a33d-80f6061fa1f3	0	3	\N	\N	4249d2bf-c5c9-4a6a-8db7-b3405b3746e6	\N
aa89118d-f04f-41fa-8d94-d680115ab277	0	2	\N	\N	3e847de5-1181-4b65-97a2-996cededac17	\N
ad92fc77-dd90-445a-a48b-94c8562a7b1a	0	3	\N	\N	89194163-b21d-46af-97bd-b5caa1f4106e	\N
ae8b3428-7cf2-4e84-8304-5cd8d7904f0a	0	2	\N	\N	754e3b01-99c2-4394-bcd7-cf20db69a0b4	\N
b761f722-94d2-4760-90fc-dda6677911a0	0	2	\N	\N	72554bdd-1c7c-41d1-b439-bd6c6f76b62a	\N
b77c8396-3c3a-4c5e-8f2f-0472361ace9c	0	2	\N	\N	427afdb0-809f-4b96-9653-720a6caa1ec2	\N
b953f0f2-e14c-4b9b-98a3-c7439feaef00	0	3	\N	\N	9c04e6d7-c747-4b65-858c-7d8c84ff6f69	\N
ba6b09c0-492f-407a-b00e-6d419eeaa35d	0	3	\N	\N	df4ec6ed-4e53-48a6-a304-fafdd113d37f	\N
bac11834-ebff-4722-a73d-b75a3446ed43	0	2	\N	\N	cc0adf47-6a58-4bf6-aacc-3ca48f03021c	\N
bc980914-bed5-45cb-a77d-376cce6e248a	0	3	\N	\N	2dce2a81-235e-4d03-80e9-0f4b4476c7cb	\N
bd20019d-ec56-4d57-9463-f8704600a97d	0	3	\N	\N	0cab6489-9c61-4ee7-8fff-4e587d2e3732	\N
bfedc698-1a3d-4adf-9460-1233e0bc6a8e	0	2	\N	\N	1bd54185-cbb3-4e62-85bd-6436eca7f1d1	\N
c009a602-edfa-419d-8254-31ea7066f833	0	3	\N	\N	cca62e4b-d6d0-4ec6-b29c-65f8117ee224	\N
c11b64ab-b077-4958-8464-6221fd38c6b3	0	2	\N	\N	63f19462-0c5c-4b59-b6dd-7d12e66133f2	\N
cb4f14b1-ae3b-472d-9e94-afa1d7dad089	0	3	\N	\N	b727466c-c9f6-47fb-b204-1d377fb438db	\N
cd850f05-4a65-4f46-ac18-4da2891828c4	0	3	\N	\N	8a048074-33b6-4d6f-9614-bba9b01d5b0f	\N
cdc611c1-e46c-45a3-b177-83a6e94427b0	0	3	\N	\N	2908091f-1958-4dd0-b788-81a3f453af61	\N
d169c594-40ee-4a11-8956-5de5c0b36b7b	0	2	\N	\N	61b80d26-d0b3-402a-ba6e-ccf282e3651a	\N
d3ac7701-9bdf-4b1e-ad78-ddc736b73f6a	0	2	\N	\N	2908091f-1958-4dd0-b788-81a3f453af61	\N
d4a7f13a-83ac-45b6-8e7a-b82128558622	0	3	\N	\N	31959968-0454-4e16-8df5-e3a11de8d86a	\N
d6a3db79-7f4b-4148-9995-f5d895b333b9	0	2	\N	\N	9c04e6d7-c747-4b65-858c-7d8c84ff6f69	\N
d6ce926c-25bc-4553-a9e2-9859324a6435	0	3	\N	\N	b77a566e-5528-4c61-b833-d8d141e75812	\N
d7ff3d05-0f2f-41e8-a270-d7ffad778916	0	3	\N	\N	112d8d66-ffd0-48bc-aec1-11c6e10792bf	\N
da9f6e1a-7e3c-488c-840e-ed579c62a5ca	0	2	\N	\N	c5479bd1-2278-45ac-a7f4-85136c50d9d3	\N
dcaedd9f-c5c1-4dda-a7dd-5c8761ed5aa6	0	2	\N	\N	853b69ce-a022-40f0-b18b-172bbcaeec6c	\N
dd1994d0-6113-4d5f-924f-d381b99df331	0	3	\N	\N	1bf3a9ac-6ff7-4e41-9f2c-1dda41c9dd33	\N
e38e0ea7-592f-48bd-bf78-fbc7857f64d6	0	2	\N	\N	df4ec6ed-4e53-48a6-a304-fafdd113d37f	\N
e3bbab6f-0884-43e9-aac6-cb97ef03d328	0	2	\N	\N	6c77803d-0b86-45b9-be00-9504785079cf	\N
e4a647dc-2e73-4287-8919-9ac3bd330e5b	0	2	\N	\N	b71a97b1-d4ac-4fa5-8cd5-0dfce739f02c	\N
eda85ee2-d59f-4d60-8e75-e766aacb0dbf	0	2	\N	\N	9f1fda0d-ed1f-4957-8a8a-390963a3a198	\N
f19fe4ca-ef6b-49de-875b-26efb34be97b	0	2	\N	\N	0d4e41b7-cd84-4fca-a9ca-f03a1fb7e1a1	\N
f3428309-9ea9-4664-a4c9-9d032ed81b81	0	2	\N	\N	9abf1f20-e19a-4f86-9736-833e6261b03a	\N
f3ea2fd0-a899-4d5b-a719-0dae47a78fb8	0	2	\N	\N	cca62e4b-d6d0-4ec6-b29c-65f8117ee224	\N
f7fd6bbd-c0c6-4782-9aa5-927b44166491	0	2	\N	\N	95b019ca-72a6-47b4-a967-1a008d108286	\N
f81f1ef4-86c1-4cc5-b265-e63df8a23bd1	0	3	\N	\N	b6959a93-4a16-4bda-ba9e-2a1d72b56b2a	\N
f8283e2f-71f0-4520-bf4c-d0c012c59db8	0	2	\N	\N	4d57603c-cdce-450c-99b3-45f4df1111d5	\N
f9c1989e-fc50-4d43-9667-fc7e56a0e4c6	0	3	\N	\N	86d728a6-978d-46ca-bdf6-d786e9b309a7	\N
fc019736-5164-4800-8937-b0773daffb4b	0	2	\N	\N	2dce2a81-235e-4d03-80e9-0f4b4476c7cb	\N
01398bb0-2e83-4cd7-bb6d-7a7622f3cffc	2	1	\N	\N	112d8d66-ffd0-48bc-aec1-11c6e10792bf	\N
0208586a-99f8-4454-81c8-e7855c171a5f	2	1	\N	\N	bb40ad14-b1d8-47b2-b9c5-be2736dc1f11	\N
12811325-1359-4810-ba60-189b588a1771	2	1	\N	\N	6c77803d-0b86-45b9-be00-9504785079cf	\N
2009fd93-28a1-455f-acd3-f35c09a96999	2	1	\N	\N	de9d3e53-0013-4177-ad86-37b847053402	\N
20111239-395f-4cab-960d-301ad83c9f2b	2	1	\N	\N	7ff6d2bd-d895-403e-a8b5-26ef075e1edb	\N
218b2af5-e7c3-4131-a7cc-b0295f3628ff	2	1	\N	\N	cc0adf47-6a58-4bf6-aacc-3ca48f03021c	\N
26c9dea3-d2b3-4462-830d-dd3205dc4b79	2	1	\N	\N	31959968-0454-4e16-8df5-e3a11de8d86a	\N
2d2d9151-71dd-453a-bc95-b5a42e953aea	2	1	\N	\N	9abf1f20-e19a-4f86-9736-833e6261b03a	\N
2d63ce76-26ab-4685-a2b5-329a2adaba5e	2	1	\N	\N	2908091f-1958-4dd0-b788-81a3f453af61	\N
2e216acf-1581-4764-a7cf-c52bf8db1155	2	1	\N	\N	a256187f-b61d-4f1b-8c44-6e775391fa34	\N
3880141c-0bed-4aac-8586-89d9fe626e35	2	1	\N	\N	4d7d8dce-4a7e-4276-b4a1-9f9baa7ca0ef	\N
39c33182-ab2e-484e-85d8-5cb4edc120e9	2	1	\N	\N	c45a1c54-9062-434b-9e73-cf3288d48a83	\N
4107d4ac-41c5-4051-ad35-93c797894ce2	2	1	\N	\N	ffcfb821-eddf-465b-821c-b2e256170069	\N
42e0ec7e-c4b7-4c6f-ac96-f53eeeffbdb5	2	1	\N	\N	9f1fda0d-ed1f-4957-8a8a-390963a3a198	\N
46d372bd-e722-47d4-b8be-a51fd6b2e1b4	2	1	\N	\N	e1e1195a-1f86-46c5-ba1c-4089b7b9a929	\N
49781fa5-e8c7-402f-8bad-83da2e9628fa	2	1	\N	\N	b68ae819-1179-4e89-876e-4d9a5a8e083c	\N
4e97972a-63ea-4919-9796-f2d1566244c7	2	1	\N	\N	0be8b880-8cea-4aef-ad4a-0c6ee09dc35a	\N
4fafbbb1-fb93-4920-9e84-b2158f158ef2	2	1	\N	\N	5077880e-8e0c-4ce6-a7d3-e20f1f926f56	\N
4fc298aa-9613-4178-a221-cfeb50748703	2	1	\N	\N	32cd5cdb-2bd7-4320-b641-d1a7f7eff7e0	\N
509ff9e0-2758-4c8b-a633-32e8d7868938	2	1	\N	\N	0d4e41b7-cd84-4fca-a9ca-f03a1fb7e1a1	\N
5b624e29-5315-48c7-a895-c79024e838ea	2	1	\N	\N	427afdb0-809f-4b96-9653-720a6caa1ec2	\N
5bb695ca-8ef5-4294-bf12-a456789a4e19	2	1	\N	\N	7287df89-3785-47f7-8259-2230eec31fa5	\N
5d5c6924-f8b6-46b9-98c9-4e97472932a7	2	1	\N	\N	282ca3d4-ed14-41c5-a76f-df039087e81d	\N
5e011b81-cae4-4e89-8fcb-8dfc40229dff	2	1	\N	\N	df4ec6ed-4e53-48a6-a304-fafdd113d37f	\N
602b6e40-a402-4c87-8308-4b63c01cf2ca	2	1	\N	\N	02d4b999-939f-4217-ac71-f9276b73847d	\N
65481286-40e5-4393-9b56-32400be8e6e4	2	1	\N	\N	853b69ce-a022-40f0-b18b-172bbcaeec6c	\N
6556581d-60ec-4426-bfe4-2340f40a9e2c	2	1	\N	\N	c55eb3d0-eaca-42f8-8371-07f59e7c68fc	\N
67f72e61-2331-45a2-93e6-dfe740b56eed	2	1	\N	\N	86d728a6-978d-46ca-bdf6-d786e9b309a7	\N
6db65fb2-4d07-4b73-b6f0-25f3dedbae0e	2	1	\N	\N	b727466c-c9f6-47fb-b204-1d377fb438db	\N
742c3606-ca53-4bab-85d2-3cdabfb0a862	2	1	\N	\N	c6453476-88e1-4ee7-9772-572fc3723589	\N
751dc078-add9-48ac-bb89-47266de1b21d	2	1	\N	\N	b71a97b1-d4ac-4fa5-8cd5-0dfce739f02c	\N
77e6fea8-f091-43dd-82ff-f4a670a03642	2	1	\N	\N	0dcae114-84e4-4682-915f-f478a68bfc65	\N
7a270959-91de-4ac9-948a-50fa079e1643	2	1	\N	\N	7a12f5b9-65b3-4010-9db0-f14883aaf900	\N
7b441484-7155-445f-8d6a-2aea75244edd	2	1	\N	\N	63f19462-0c5c-4b59-b6dd-7d12e66133f2	\N
80bfe5d0-7cbc-4ff2-b915-6dc2e21d5b96	2	1	\N	\N	4249d2bf-c5c9-4a6a-8db7-b3405b3746e6	\N
859ed504-7eff-4d19-be5c-79af6db744cc	2	1	\N	\N	8938a87b-97b4-4ea6-8b81-8783079f9e1c	\N
88053e74-7251-4934-905a-e9fe438fee94	2	1	\N	\N	1bf3a9ac-6ff7-4e41-9f2c-1dda41c9dd33	\N
90b5ae3a-ead9-43a3-803c-1025bda3c05b	2	1	\N	\N	9997a22e-cd73-422c-9534-ac0c32137111	\N
9385ad4a-e219-4710-9f0d-1930499668a6	2	1	\N	\N	95b019ca-72a6-47b4-a967-1a008d108286	\N
9e19a54c-ce7d-494b-a6e7-979b41830996	2	1	\N	\N	cca62e4b-d6d0-4ec6-b29c-65f8117ee224	\N
a0de4212-79d0-4a7b-b856-3e682bbd17a5	2	1	\N	\N	3cec94f8-d5fd-4493-90f3-f2e57fa1f024	\N
a2b7d361-eef6-44de-a8fb-fcdacdd8b752	2	1	\N	\N	7046ca15-f080-49cc-a82c-528bcc0c7d66	\N
a3037352-b83d-4bed-bf0f-57c0d543c719	2	1	\N	\N	f54115ed-4e93-4f19-a54e-9d2b84408ad7	\N
a6ecbf60-c6a5-4af7-8f64-4e30f9f7b092	2	1	\N	\N	72554bdd-1c7c-41d1-b439-bd6c6f76b62a	\N
a8d56643-1920-4f07-9b97-d2f055ffa3fd	2	1	\N	\N	c5479bd1-2278-45ac-a7f4-85136c50d9d3	\N
b26c7366-d559-414b-ba32-de23d09141a2	2	1	\N	\N	3e847de5-1181-4b65-97a2-996cededac17	\N
b411354d-c3c3-4a3d-8419-5b7c9b8c5904	2	1	\N	\N	4d57603c-cdce-450c-99b3-45f4df1111d5	\N
b4d22b9f-aa23-493f-8392-cf9dc9d27e07	2	1	\N	\N	3d494334-4161-4d19-a1fe-e6652869bf7c	\N
b6789b1b-7dee-4164-8817-d4a72e996ae4	2	1	\N	\N	b6959a93-4a16-4bda-ba9e-2a1d72b56b2a	\N
b70d39cb-f22f-4632-ac5b-ff1ec984e056	2	1	\N	\N	0cab6489-9c61-4ee7-8fff-4e587d2e3732	\N
b888658a-d91f-41da-adc0-12e653b63e24	2	1	\N	\N	d2048cf7-4217-468d-95af-e061bde20b78	\N
c3e6a76b-1a1e-4b97-a7d1-ff6092b517a5	2	1	\N	\N	1229a1e4-091e-4eb6-8925-81e0bba4116a	\N
c561a731-c942-4ee1-97c1-eac4d2152df6	2	1	\N	\N	61b80d26-d0b3-402a-ba6e-ccf282e3651a	\N
c728e356-570c-42ac-bf55-8b9454beb148	2	1	\N	\N	c1f82c80-e7c0-4594-8a88-20e2c9de0e62	\N
d51f0e7c-7691-4954-bba4-51c7f47ea728	2	1	\N	\N	2dce2a81-235e-4d03-80e9-0f4b4476c7cb	\N
d5705ccc-47ae-440c-a94b-bc444223d42a	2	1	\N	\N	1bd54185-cbb3-4e62-85bd-6436eca7f1d1	\N
d5c4a9b9-8a42-4029-b3ae-a6d70e411ad5	2	1	\N	\N	af176eda-5e40-4517-80b1-db5032bfe7bf	\N
da7c1af7-73cc-426d-a81b-a85e18e955c5	2	1	\N	\N	116d6146-95e3-4db1-9c89-0d06491a8798	\N
db447b7f-f82d-4790-bf0a-3946d9584d21	2	1	\N	\N	207c706b-50a4-405c-94c2-560767823184	\N
e0157ade-5967-4ef0-a8eb-b0e008795dcf	2	1	\N	\N	4e6e7039-66ac-40e0-a4a5-d8e6ebc7e145	\N
e03f6ba7-6e6a-4982-8cec-f5dcec3647ad	2	1	\N	\N	30ece52e-7e36-4899-a882-8b38b51f3544	\N
e15bb88b-b6dd-4784-b05c-902a62fc0231	2	1	\N	\N	8a048074-33b6-4d6f-9614-bba9b01d5b0f	\N
e695f615-9d0d-4988-a3f2-66a3f9595ee5	2	1	\N	\N	754e3b01-99c2-4394-bcd7-cf20db69a0b4	\N
e8b6c69d-514b-4cc7-ad57-c6548f1dde11	2	1	\N	\N	478cd2f7-796d-4cd9-b98f-5876dc588971	\N
ec3105b4-112f-4762-96b7-7fc2d18d649e	2	1	\N	\N	b77a566e-5528-4c61-b833-d8d141e75812	\N
f7aefc10-0049-4314-9189-59165202b327	2	1	\N	\N	2643de7a-cfaa-4220-808e-a27c43bd7114	\N
f7dc00b1-abc3-4f2d-b260-509b10b9165e	2	1	\N	\N	89194163-b21d-46af-97bd-b5caa1f4106e	\N
fac197c1-9b87-47c1-b722-1784b5f989df	2	1	\N	\N	9c04e6d7-c747-4b65-858c-7d8c84ff6f69	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
01d4b2ea-b079-4457-a9b9-fe9ffac162cb	52	1200	t	f	bd40f0d7-1976-48a4-b9af-a2d4d2827cee	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
04928491-b2bd-4b8d-adcd-ffc985177454	2	1880	t	f	65abe84f-2916-4fd7-a876-e70493de46b7	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
05bba586-a4da-4795-8b0c-dc5779c77e1c	52	1200	t	f	768272f7-a6d1-4492-8d6c-b53d5d29a531	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
0646bf2b-164a-4084-bfb3-b86d31914ba6	48	1900	t	f	85ff6ff2-8503-4ef0-a5f6-56e4185e655a	0e73c149-ab1a-4c1d-9944-908279893d7c	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
0abd0f52-b7a3-4e31-97d2-d613fde76399	2	1880	t	f	e31e76cf-d374-40c4-b346-3e307ebe7123	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
0c54b076-066f-4fa9-876f-971beac267ac	1	1900	t	f	410b8842-7e97-4a4f-b900-cec938970de8	14494cfc-950a-4fb8-9e6e-567b20255a03	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
0eae33f4-72ba-45ee-8a5f-37220abf811a	58	900	t	f	4ad27eca-fc4a-45cb-b446-10b032608705	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
0ed343c9-dd90-4a90-be7f-8d46ffba853e	56	400	t	f	81bed7d9-a7e3-4a6e-b250-12eb3c922966	7dda4efc-abb9-4d97-bb94-354f52581e3f	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
11f122bb-736e-49a2-a6df-175fc646ac88	39	280	t	f	32c3f868-f63a-417a-8ece-7559a41a81db	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1aa7d09c-d018-442c-9d35-f09f881359f9	39	280	t	f	85ff6ff2-8503-4ef0-a5f6-56e4185e655a	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1aed1310-f9b9-42ac-9c66-f2dc6ae2c303	58	900	t	f	e739f3f1-9e94-49df-92cb-6bbb70b695a0	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1b90b303-2bf8-4dca-b2f5-03056c203090	57	400	t	f	788dd14e-77ce-411f-88c5-898828cb7ae7	d86ac9cd-2f74-428d-ac4a-47bff3769fab	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1c76cb04-1a4e-4588-b0ae-c11685ecadc2	18	4000	t	f	0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1de7eede-2129-4273-a956-b79cd10ad1cf	2	1880	t	f	410b8842-7e97-4a4f-b900-cec938970de8	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1ea0767d-8709-4269-8b8e-0f341bc3026f	1	1900	t	f	e31e76cf-d374-40c4-b346-3e307ebe7123	14494cfc-950a-4fb8-9e6e-567b20255a03	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
1f482ad1-6e24-4334-ac8c-c97c62551e1b	39	280	t	f	0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
21a4f8c3-2d0c-42a2-be78-f2bc347389c3	55	400	t	f	4ad27eca-fc4a-45cb-b446-10b032608705	4351c1a2-3e2a-4e4e-ac38-e4c152cff3fa	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
223b577f-8078-4962-97f1-92ade30dd3ab	48	1900	t	f	368ecd35-5443-4ba0-bc23-71f273ba2bd1	0e73c149-ab1a-4c1d-9944-908279893d7c	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
251bc701-7858-4f21-9adc-e6ebf301cef9	57	400	t	f	238d7c97-dc04-4992-b1a6-0b7549cf6c0a	d86ac9cd-2f74-428d-ac4a-47bff3769fab	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
27dde355-ecef-4bf7-9760-61d6e2d94015	39	280	t	f	f6c8ab35-4faf-4a34-942c-f2d300d4ef4d	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
27f6de22-cec9-4758-848f-7ec4ad6b6fb3	39	280	t	f	2e1930e3-98e4-4ace-ae7e-7f07e13d24c8	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
34feaca5-d53b-4f77-be70-94526017ed52	52	1200	t	f	d7b3ac41-8c27-4ae1-956a-8ee0c0880bfd	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
3791f2a6-3303-4a57-8657-35231875f48a	48	1900	t	f	daa01712-b779-484f-b929-39226e073a4c	0e73c149-ab1a-4c1d-9944-908279893d7c	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
3926e647-7d7d-4138-819a-613b939ad6e5	58	900	t	f	81bed7d9-a7e3-4a6e-b250-12eb3c922966	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
39e19dcd-a966-470a-833b-e73d5101b648	2	1880	t	f	6ef23a31-c62b-47c4-b8b0-bf639eae9172	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
4abfe0a6-ffc5-40c8-b6b3-908bcbd94e6b	52	1200	t	f	eff22e46-6142-4da8-9e24-116e9f796222	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
4b318086-d376-4f22-bf62-404ee99daedc	2	1880	t	f	f9fb54a3-489b-49d7-95e7-f01f2520ffb0	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
4b99890c-f264-45dc-987f-865a6d7b5314	57	400	t	f	81bed7d9-a7e3-4a6e-b250-12eb3c922966	d86ac9cd-2f74-428d-ac4a-47bff3769fab	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
4cefbf2c-2a2a-44df-8f6a-fe016f4c57a1	39	280	t	f	238d7c97-dc04-4992-b1a6-0b7549cf6c0a	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
4d67cab7-2940-431c-8fd9-836a969dcc46	18	4000	t	f	06ea703c-2aa6-492d-b137-fc871e22f835	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
5322d394-4c25-4ffc-a985-e11615b473e3	58	900	t	f	32c3f868-f63a-417a-8ece-7559a41a81db	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
605a2909-ae94-4161-a231-fd72d8344045	54	400	t	f	86d6ab8c-1aed-4111-b639-f9cb5a1d45e8	64908ad1-5d95-4667-ba76-ce0bebb945e3	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
6527ab45-7bf1-44a2-b8dd-4ef12783606e	58	900	t	f	2e1930e3-98e4-4ace-ae7e-7f07e13d24c8	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
77055e3d-fa1b-46a8-9e9e-7c8b96bba8ef	39	280	t	f	ae326e6c-e7fb-4f43-ac63-b31944c0547c	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
799bdb93-416c-4d6a-af14-8219adc91da7	52	1200	t	f	8e75eb05-e8f7-4d68-8dbc-a392f6da2eff	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
81200d2e-2d4c-433d-9ec7-759938d79030	39	280	t	f	6acd0674-cdda-4685-8d9b-dd4629c7d3dc	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
81a92651-ccb8-4236-826f-dfc312531d8e	54	400	t	f	4ad27eca-fc4a-45cb-b446-10b032608705	64908ad1-5d95-4667-ba76-ce0bebb945e3	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
84797e23-cdee-4d68-b8b1-dc95429cf0d2	57	400	t	f	e739f3f1-9e94-49df-92cb-6bbb70b695a0	d86ac9cd-2f74-428d-ac4a-47bff3769fab	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
8cb8c7c0-e3ff-4c07-aa14-bf4e19073331	58	900	t	f	238d7c97-dc04-4992-b1a6-0b7549cf6c0a	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
8e10d2d5-a3cb-4b6e-b01a-2ae571927972	1	1900	t	f	65abe84f-2916-4fd7-a876-e70493de46b7	14494cfc-950a-4fb8-9e6e-567b20255a03	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
90b303d7-92b3-452d-9785-2979314d89b4	2	1880	t	f	dcea09ae-012e-4c4c-a60d-ffa366f34be6	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
92278c86-1b42-4476-8ce5-9db029e9853d	56	400	t	f	0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b	7dda4efc-abb9-4d97-bb94-354f52581e3f	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
92b04541-3257-4c1f-a665-52812e3f0aaa	56	400	t	f	714b89a9-18a2-4238-bbaa-abd5bf414a12	7dda4efc-abb9-4d97-bb94-354f52581e3f	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
9b228f53-41d5-4dd2-9519-da5476d22e50	39	280	t	f	788dd14e-77ce-411f-88c5-898828cb7ae7	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
9d5c9bee-726d-46f6-ac15-3e51bcf90084	39	280	t	f	714b89a9-18a2-4238-bbaa-abd5bf414a12	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
a1a0f7ea-e5b9-44a4-b673-648a308361cf	55	400	t	f	86d6ab8c-1aed-4111-b639-f9cb5a1d45e8	4351c1a2-3e2a-4e4e-ac38-e4c152cff3fa	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
a322194e-a950-4ae3-98b2-eaa209905a08	18	4000	t	f	f6c8ab35-4faf-4a34-942c-f2d300d4ef4d	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
a3e86b6b-0371-4ce1-bf6f-6a563c3c47c3	1	1900	t	f	6ef23a31-c62b-47c4-b8b0-bf639eae9172	14494cfc-950a-4fb8-9e6e-567b20255a03	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
abda918f-163e-44da-847a-a4a5e742c3b2	18	4000	t	f	714b89a9-18a2-4238-bbaa-abd5bf414a12	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
b2c4ea70-96f7-4006-a147-528fca9374fa	58	900	t	f	788dd14e-77ce-411f-88c5-898828cb7ae7	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
b3e357d6-6220-494b-845b-1452bb13a225	18	4000	t	f	32c3f868-f63a-417a-8ece-7559a41a81db	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
b446b425-3495-4649-99d8-22f6c7a05857	48	1900	t	f	97535796-93ae-40f9-849e-89b1aad40196	0e73c149-ab1a-4c1d-9944-908279893d7c	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
b55003cd-ecdd-4522-8a6f-988d04fc189f	58	900	t	f	86d6ab8c-1aed-4111-b639-f9cb5a1d45e8	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
bd0eb670-aa1f-4b9d-8320-838105073263	2	1880	t	f	adbd218a-8c43-4f7a-8e70-16c86fece0f6	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
be9ec819-9fbf-46d2-beff-57ecaf14b119	58	900	t	f	cfe84601-760f-44a0-87bd-3bc62ef4f4f5	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
c10b457b-dc82-45ea-927d-a9df633bb643	55	400	t	f	2e1930e3-98e4-4ace-ae7e-7f07e13d24c8	4351c1a2-3e2a-4e4e-ac38-e4c152cff3fa	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
c2b1ee0e-999f-49bb-9324-629fa2a9d67a	54	400	t	f	32c3f868-f63a-417a-8ece-7559a41a81db	64908ad1-5d95-4667-ba76-ce0bebb945e3	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
c3980324-0f8e-4fb2-8737-f48df1483b79	58	900	t	f	0e1d3ea4-0de2-4d8f-bd1f-63a0d88d8e7b	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
c3a70ba6-0119-41db-b713-cabb3ea41040	58	900	t	f	714b89a9-18a2-4238-bbaa-abd5bf414a12	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
dc5638f4-5c6b-477f-b20c-55c04c566896	2	1880	t	f	64db5cc6-5428-4d24-bcc1-b28b4276ab73	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
e4e03b43-f929-4d96-9d9e-2af30b24fc0c	56	400	t	f	e739f3f1-9e94-49df-92cb-6bbb70b695a0	7dda4efc-abb9-4d97-bb94-354f52581e3f	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
e56422ef-d145-4260-a8fb-27bb0ce78a6f	54	400	t	f	f6c8ab35-4faf-4a34-942c-f2d300d4ef4d	64908ad1-5d95-4667-ba76-ce0bebb945e3	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
e618f383-377d-43da-9be6-3756342bc53a	58	900	t	f	f6c8ab35-4faf-4a34-942c-f2d300d4ef4d	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
e8450f9f-c18a-4964-a786-fb5c384aae0f	18	4000	t	f	b142db7d-d981-4bfb-b646-c96eb69f2678	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
ee21bca3-3a1f-491a-b834-64ac94b56acc	55	400	t	f	cfe84601-760f-44a0-87bd-3bc62ef4f4f5	4351c1a2-3e2a-4e4e-ac38-e4c152cff3fa	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
f7e61366-e8e7-45d0-b81e-ba15732f8f76	39	280	t	f	cfe84601-760f-44a0-87bd-3bc62ef4f4f5	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
fb422436-2342-46b7-b1b7-8b44b21d0707	39	280	t	f	daa01712-b779-484f-b929-39226e073a4c	cab103c0-5064-4f06-a26a-4783caf08b40	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
fbbb3427-38e5-446e-a58f-caac5e1fdb1d	52	1200	t	f	c4517ec1-dc89-499e-8aa6-263e7cc2bac0	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
0e73c149-ab1a-4c1d-9944-908279893d7c	48	Инструкция 48	48
14494cfc-950a-4fb8-9e6e-567b20255a03	1	Инструкция 1	1
4351c1a2-3e2a-4e4e-ac38-e4c152cff3fa	55	Инструкция 55	55
64908ad1-5d95-4667-ba76-ce0bebb945e3	54	Инструкция 54	54
64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	52	Инструкция 52	52
7dda4efc-abb9-4d97-bb94-354f52581e3f	56	Инструкция 56	56
b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	2	Инструкция 2	2
cab103c0-5064-4f06-a26a-4783caf08b40	39	Инструкция 39	39
ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	18	Инструкция 18	18
d51d3f2a-f4fb-4693-b840-d0b82b278f42	58	Инструкция 58	58
d86ac9cd-2f74-428d-ac4a-47bff3769fab	57	Инструкция 57	57
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
0f7a3510-f174-48fd-a514-85ea5c0c2c87	75131-2801300-20	Поперечина рамы задняя	\N	2868425
64e4350b-2c07-45d0-aebd-57cfda5c28ed	75131-2800010-70	Рама	\N	3291137
e379cda9-8825-4221-b3e5-98b607bcc7a2	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
5da2a132-4611-49d8-8a1e-cae3b69d3426	78ad465f-d4ca-442f-9249-99b5e8c90e5f
d488774d-9339-4fba-94d1-f578bdec9474	78ad465f-d4ca-442f-9249-99b5e8c90e5f
12c71f4c-181c-4a4f-9fe8-23cb5d1edb88	94f12384-c1b6-4d40-bcd0-a313deac8240
42796440-8528-4881-b35f-365dcd1c23f7	94f12384-c1b6-4d40-bcd0-a313deac8240
0d9bc8d5-5b52-47a0-855a-3e726bc10991	eae8caf8-06d6-44ef-bd63-9eadfa886779
1774996f-d3fd-4d7a-b0ce-9c89bfb15a4e	eae8caf8-06d6-44ef-bd63-9eadfa886779
338e8170-2700-408a-a03f-fa2c3d2998e9	eae8caf8-06d6-44ef-bd63-9eadfa886779
35bb36e7-fd06-4d46-918a-ef82ac0b69ef	eae8caf8-06d6-44ef-bd63-9eadfa886779
44fa197c-ff90-482a-a7c9-b5aeeb9cc712	eae8caf8-06d6-44ef-bd63-9eadfa886779
a291fc2c-a934-4063-a38b-51fa9a7dc234	eae8caf8-06d6-44ef-bd63-9eadfa886779
d89326f2-35a0-4f80-9b53-7f569e75cb7a	eae8caf8-06d6-44ef-bd63-9eadfa886779
e52e8d58-4ee6-4ab3-85ea-130d71079dc5	eae8caf8-06d6-44ef-bd63-9eadfa886779
36323ec9-ce2b-46d0-9c9c-f262c3b2fc75	4070a9f4-a2d7-4a9b-9ee1-d157458cc436
15d7378c-a9ec-4bf3-9400-ff0678a87b1e	4f185fbb-ddb9-4bc4-a5db-feedeed48367
293d220e-632f-4a9e-973a-f850d36f8658	eae8caf8-06d6-44ef-bd63-9eadfa886779
d224494c-895c-4ecf-a7d3-e28acb83cfaa	78ad465f-d4ca-442f-9249-99b5e8c90e5f
cd7e5488-ea70-403d-a45b-9d94b1adf751	4070a9f4-a2d7-4a9b-9ee1-d157458cc436
dcb62328-cd4c-496f-b9b7-85ad0adce9c0	94f12384-c1b6-4d40-bcd0-a313deac8240
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
5da2a132-4611-49d8-8a1e-cae3b69d3426	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
d488774d-9339-4fba-94d1-f578bdec9474	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
12c71f4c-181c-4a4f-9fe8-23cb5d1edb88	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
42796440-8528-4881-b35f-365dcd1c23f7	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
0d9bc8d5-5b52-47a0-855a-3e726bc10991	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	B7:5A:79:B5
1774996f-d3fd-4d7a-b0ce-9c89bfb15a4e	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	D7:95:55:B4
338e8170-2700-408a-a03f-fa2c3d2998e9	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	17:CD:7F:5A
35bb36e7-fd06-4d46-918a-ef82ac0b69ef	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	D7:F1:7D:5A
44fa197c-ff90-482a-a7c9-b5aeeb9cc712	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	97:17:60:B4
a291fc2c-a934-4063-a38b-51fa9a7dc234	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	27:45:7E:B4
d89326f2-35a0-4f80-9b53-7f569e75cb7a	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	67:5A:70:B4
e52e8d58-4ee6-4ab3-85ea-130d71079dc5	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	67:CD:7E:5A
36323ec9-ce2b-46d0-9c9c-f262c3b2fc75	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
15d7378c-a9ec-4bf3-9400-ff0678a87b1e	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$KJTT2YBoCMX+uuzn+Uiig5p0yh37rzjQOaCDlKzH8PsuNidl	\N	\N	\N	\N	\N	\N
293d220e-632f-4a9e-973a-f850d36f8658	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$17n9ODM8nFX9LYsbW1jgpaiM8IP9+HjHV3yoyLrsy6g0+w+o	\N	\N	\N	\N	\N	\N
d224494c-895c-4ecf-a7d3-e28acb83cfaa	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$1lO4iMgyTVCYPcIMSHxClVTg3MM7zEQx68YQT+AsetvCwqV1	\N	\N	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
cd7e5488-ea70-403d-a45b-9d94b1adf751	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$TV43IoxdTddsasryBDdoxZl7N98wN7a/uOiDMtUNJp9AS66u	\N	\N	\N	\N	\N	\N
dcb62328-cd4c-496f-b9b7-85ad0adce9c0	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$D6f6C21Huh7MuBUMpcTg3/wdognqWJ521eBDWnKH723c1KwV	\N	\N	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
029cd2f6-fd90-4f76-b9e6-1d6bc956c968	1	Заполняющий	230	270	23	26	\N	\N	14494cfc-950a-4fb8-9e6e-567b20255a03	\N
0b2391f2-ba96-4194-b2ee-c1148b3e3e8e	1	Заполняющий	230	270	23	26	\N	\N	d86ac9cd-2f74-428d-ac4a-47bff3769fab	\N
2c621fa7-9958-4c14-916f-64322fa4b0ac	1	Заполняющий	230	270	23	26	\N	\N	64aa6132-9b2c-4bdd-b465-a2b9a93dcb6e	\N
46c2e9c3-e0c3-4828-b299-1ae07a335230	1	Заполняющий	230	270	23	26	\N	\N	7dda4efc-abb9-4d97-bb94-354f52581e3f	\N
4d875ca8-c738-4888-a132-fb2b731d4476	1	Заполняющий	230	270	23	26	\N	\N	cab103c0-5064-4f06-a26a-4783caf08b40	\N
63372761-f755-4887-8f62-a0ca37c636c3	1	Заполняющий	230	270	23	26	\N	\N	4351c1a2-3e2a-4e4e-ac38-e4c152cff3fa	\N
74fe39cd-19be-4399-9e65-a100f1ecdaa2	1	Заполняющий	230	270	23	26	\N	\N	d51d3f2a-f4fb-4693-b840-d0b82b278f42	\N
7bd62fe2-102b-4112-8d62-3b6fcca9a9e0	1	Заполняющий	230	270	23	26	\N	\N	64908ad1-5d95-4667-ba76-ce0bebb945e3	\N
9c4df2a3-0e25-4f6c-b4aa-18458b31b723	1	Заполняющий	230	270	23	26	\N	\N	ccdc0bcb-5c8d-4f57-82ab-7efafbb7313d	\N
d8133b28-9c2d-4bff-a553-c159a038b05c	1	Заполняющий	230	270	23	26	\N	\N	0e73c149-ab1a-4c1d-9944-908279893d7c	\N
db9b91d9-962b-4392-ae3b-b2a7ad441b33	1	Заполняющий	230	270	23	26	\N	\N	b1b98ada-be4b-4ec4-a631-c8e6c25adf0e	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0b51db24-4983-46d8-91fc-dc9dd1872a6e	71f99699-d142-40ae-af44-53b02c470586
0b51db24-4983-46d8-91fc-dc9dd1872a6e	a72857c2-56a5-41c5-8f9a-6d31788e4275
27df5e01-065c-40e7-bef2-268ede669024	71f99699-d142-40ae-af44-53b02c470586
27df5e01-065c-40e7-bef2-268ede669024	a72857c2-56a5-41c5-8f9a-6d31788e4275
306faf80-9fb5-4d28-bf3e-b47399027362	59ee0ba8-bc1f-4688-a1d5-c8721bc5dac4
6176a4ad-43e2-4462-bfea-cd4e51c7c510	62958e50-7948-4ad6-8c6c-1c4961c57837
a5af0486-23cd-47f2-9690-a15c6e87429f	59ee0ba8-bc1f-4688-a1d5-c8721bc5dac4
bdf5a828-7ad7-4c17-9120-7dbda17d6abb	71f99699-d142-40ae-af44-53b02c470586
bdf5a828-7ad7-4c17-9120-7dbda17d6abb	a72857c2-56a5-41c5-8f9a-6d31788e4275
c3bd8f63-d73a-404e-a7e9-f12cbde37468	71f99699-d142-40ae-af44-53b02c470586
c3bd8f63-d73a-404e-a7e9-f12cbde37468	a72857c2-56a5-41c5-8f9a-6d31788e4275
e12c58c4-7c11-4196-b2cf-bc458fe4719e	62958e50-7948-4ad6-8c6c-1c4961c57837
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0b51db24-4983-46d8-91fc-dc9dd1872a6e	44fa197c-ff90-482a-a7c9-b5aeeb9cc712	\N	150838
27df5e01-065c-40e7-bef2-268ede669024	35bb36e7-fd06-4d46-918a-ef82ac0b69ef	\N	114729
306faf80-9fb5-4d28-bf3e-b47399027362	1774996f-d3fd-4d7a-b0ce-9c89bfb15a4e	\N	132695
6176a4ad-43e2-4462-bfea-cd4e51c7c510	0d9bc8d5-5b52-47a0-855a-3e726bc10991	\N	121267
a5af0486-23cd-47f2-9690-a15c6e87429f	e52e8d58-4ee6-4ab3-85ea-130d71079dc5	\N	122575
bdf5a828-7ad7-4c17-9120-7dbda17d6abb	338e8170-2700-408a-a03f-fa2c3d2998e9	\N	150882
c3bd8f63-d73a-404e-a7e9-f12cbde37468	a291fc2c-a934-4063-a38b-51fa9a7dc234	\N	146164
e12c58c4-7c11-4196-b2cf-bc458fe4719e	d89326f2-35a0-4f80-9b53-7f569e75cb7a	\N	117390
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
59ee0ba8-bc1f-4688-a1d5-c8721bc5dac4	2a943448-f501-490e-b5d7-7a22e0665a04
59ee0ba8-bc1f-4688-a1d5-c8721bc5dac4	c659b6e2-6f00-47c6-b8ff-81471ab91267
62958e50-7948-4ad6-8c6c-1c4961c57837	d42cb243-22cd-4788-b12f-692b5fa6da97
62958e50-7948-4ad6-8c6c-1c4961c57837	ef8fc182-a6d9-454b-a9ca-d5f09ce17490
71f99699-d142-40ae-af44-53b02c470586	09f7373c-6784-41eb-a4b4-5fbe62f8781d
71f99699-d142-40ae-af44-53b02c470586	16155b60-6776-4195-b8a3-12ec74314ad8
71f99699-d142-40ae-af44-53b02c470586	2a943448-f501-490e-b5d7-7a22e0665a04
71f99699-d142-40ae-af44-53b02c470586	d42cb243-22cd-4788-b12f-692b5fa6da97
a72857c2-56a5-41c5-8f9a-6d31788e4275	09f7373c-6784-41eb-a4b4-5fbe62f8781d
a72857c2-56a5-41c5-8f9a-6d31788e4275	16155b60-6776-4195-b8a3-12ec74314ad8
a72857c2-56a5-41c5-8f9a-6d31788e4275	2a943448-f501-490e-b5d7-7a22e0665a04
a72857c2-56a5-41c5-8f9a-6d31788e4275	d42cb243-22cd-4788-b12f-692b5fa6da97
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
59ee0ba8-bc1f-4688-a1d5-c8721bc5dac4	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	49286	35:4E:AC:A5
62958e50-7948-4ad6-8c6c-1c4961c57837	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	49232	03:3D:93:0D
71f99699-d142-40ae-af44-53b02c470586	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	49283	A6:F1:CF:48
a72857c2-56a5-41c5-8f9a-6d31788e4275	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	49141	93:57:D8:0B
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
04c47f64-2536-47ef-9727-a2ba0f1b24d5	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3d494334-4161-4d19-a1fe-e6652869bf7c	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
05a80fb8-d5c7-4c5e-a724-5a60535f39f6	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0be8b880-8cea-4aef-ad4a-0c6ee09dc35a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
065a5b15-1f5b-4329-89c4-1869d114e26d	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8938a87b-97b4-4ea6-8b81-8783079f9e1c	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
099eb66b-36f8-46e9-9e1b-af30bb364b25	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	86d728a6-978d-46ca-bdf6-d786e9b309a7	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
09c204bf-2caa-4611-9fb8-1df4a1547551	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7287df89-3785-47f7-8259-2230eec31fa5	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
0c3f2b00-28a6-4cba-aac2-eb41f81de1c5	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	af176eda-5e40-4517-80b1-db5032bfe7bf	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
0eee8a6c-7c92-446f-8996-0523a48ef9fd	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f54115ed-4e93-4f19-a54e-9d2b84408ad7	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
0fc27212-7b0a-4d28-a2ae-ec5d05cf5e26	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b6959a93-4a16-4bda-ba9e-2a1d72b56b2a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
1079ec12-53db-4fa8-8eca-a5f3a27170dd	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	63f19462-0c5c-4b59-b6dd-7d12e66133f2	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
117048d9-50d7-4a83-9ee3-869495264705	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	427afdb0-809f-4b96-9653-720a6caa1ec2	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
12b217c8-4752-468d-966a-67701de90fc7	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b727466c-c9f6-47fb-b204-1d377fb438db	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
13d6c4f9-aa25-48c2-b40f-b112a98a7abd	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9abf1f20-e19a-4f86-9736-833e6261b03a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
1bd8dcea-d18e-4af4-87f7-27476477bd1d	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cca62e4b-d6d0-4ec6-b29c-65f8117ee224	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
2077a896-a832-4aa5-b4a1-eaaf8a5b6208	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	de9d3e53-0013-4177-ad86-37b847053402	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
24d848ac-015c-46dc-bcaf-1a998e1764fb	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	207c706b-50a4-405c-94c2-560767823184	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
2c358a78-086a-441c-a174-8d5ea14f1d87	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c5479bd1-2278-45ac-a7f4-85136c50d9d3	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
38e37166-81b4-4bce-bbf5-a4f30de61cc6	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bb40ad14-b1d8-47b2-b9c5-be2736dc1f11	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
3a9ede87-b972-4eac-b641-49e96aeacf08	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0cab6489-9c61-4ee7-8fff-4e587d2e3732	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
3c905229-9f0a-4a97-ab8a-ee0750e5cd30	19	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2643de7a-cfaa-4220-808e-a27c43bd7114	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
49ee0e08-35c6-473a-83f4-faeb68fe53af	20	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c1f82c80-e7c0-4594-8a88-20e2c9de0e62	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
4c8b2ec7-cd93-41f0-93a9-1ff9192805ac	21	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	478cd2f7-796d-4cd9-b98f-5876dc588971	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
4e65af47-7ff3-4b08-aa94-34ab0348ab6c	22	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2dce2a81-235e-4d03-80e9-0f4b4476c7cb	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
5355445a-9b1b-4b14-a421-effeed050927	23	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	31959968-0454-4e16-8df5-e3a11de8d86a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
5af7e15a-15ed-413b-a690-458d2d6f3e48	24	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0dcae114-84e4-4682-915f-f478a68bfc65	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
5e85e842-72ef-48b1-a95c-ed416e8687dc	25	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	116d6146-95e3-4db1-9c89-0d06491a8798	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
6006756a-1e3b-4b8d-955e-6619c3207328	26	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5077880e-8e0c-4ce6-a7d3-e20f1f926f56	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
638d2e00-c8be-4c82-9157-4a473ef7fa25	27	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4249d2bf-c5c9-4a6a-8db7-b3405b3746e6	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
63d29079-e4e6-4b3c-8166-437af06a4777	28	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9c04e6d7-c747-4b65-858c-7d8c84ff6f69	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
63de6ad2-789a-4006-ae96-a0700cf89f99	29	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c6453476-88e1-4ee7-9772-572fc3723589	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
6b6a792c-5caa-4330-b25b-ce07d74c5ea0	30	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4d7d8dce-4a7e-4276-b4a1-9f9baa7ca0ef	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
6f4ebcf0-db7f-486d-bd14-577c89f1779e	31	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c45a1c54-9062-434b-9e73-cf3288d48a83	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
7413aa77-16f6-4861-b90e-3a74285f13f7	32	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e1e1195a-1f86-46c5-ba1c-4089b7b9a929	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
7685da97-c023-4101-92ac-965bf3d9ac58	33	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4e6e7039-66ac-40e0-a4a5-d8e6ebc7e145	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
7b513052-229f-4948-a880-d8e7787d9c82	34	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	02d4b999-939f-4217-ac71-f9276b73847d	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
7b96577e-4e29-4933-876b-bc55172b5665	35	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d2048cf7-4217-468d-95af-e061bde20b78	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
8878cabf-2dee-4bb2-978e-234bd104d9b4	36	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1bf3a9ac-6ff7-4e41-9f2c-1dda41c9dd33	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
8a33ceaa-6a7f-4744-b6fe-e5d8d7ed04a1	37	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0d4e41b7-cd84-4fca-a9ca-f03a1fb7e1a1	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
8c2a48be-8aae-4335-b6d3-ce3c729f629f	38	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	61b80d26-d0b3-402a-ba6e-ccf282e3651a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
9b98c0ae-ba64-470e-bd6f-c2c198a6941c	39	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	30ece52e-7e36-4899-a882-8b38b51f3544	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
9f56c040-7df4-4fef-bf1a-9b1e24928537	40	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b71a97b1-d4ac-4fa5-8cd5-0dfce739f02c	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
a2f596de-c650-4516-a065-ba506652327b	41	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	32cd5cdb-2bd7-4320-b641-d1a7f7eff7e0	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
a3cb1069-69e4-409c-8ac9-a43bc792116c	42	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1bd54185-cbb3-4e62-85bd-6436eca7f1d1	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
a970bf42-eda5-4229-a1da-11fb66a2159e	43	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	282ca3d4-ed14-41c5-a76f-df039087e81d	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
ad45e37d-eb9d-46b3-a7da-3ccfe183bf08	44	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4d57603c-cdce-450c-99b3-45f4df1111d5	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
ad591c75-b8b3-4bb6-bb3a-2fe3dc950a55	45	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	112d8d66-ffd0-48bc-aec1-11c6e10792bf	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
b6f34213-916a-4db3-b47f-e3072b80c329	46	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7ff6d2bd-d895-403e-a8b5-26ef075e1edb	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
b75c1744-ddcf-490b-a637-5ab83f8f9916	47	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9997a22e-cd73-422c-9534-ac0c32137111	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
b837ab4c-cd0b-4d00-bd30-5a5574b2255f	48	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a256187f-b61d-4f1b-8c44-6e775391fa34	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
bf12edc9-0493-4fc9-a9bb-1214a0101c4c	49	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7046ca15-f080-49cc-a82c-528bcc0c7d66	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
c01aadbf-31ea-4aa0-98ba-0e4173fd41ba	50	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	95b019ca-72a6-47b4-a967-1a008d108286	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
c85434e8-933f-468a-914d-406abdd357e6	51	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7a12f5b9-65b3-4010-9db0-f14883aaf900	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
c9d17406-8ec2-47b5-8a21-58145cd7ff9c	52	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c55eb3d0-eaca-42f8-8371-07f59e7c68fc	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
cb6b34c8-8de4-4de0-ad8c-ee32149b9cb8	53	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b68ae819-1179-4e89-876e-4d9a5a8e083c	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
cd1b73b5-004a-4cc5-b6a5-f035e41215b2	54	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	754e3b01-99c2-4394-bcd7-cf20db69a0b4	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
cfeaa625-5379-42b9-99f5-12b377d060f1	55	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8a048074-33b6-4d6f-9614-bba9b01d5b0f	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
d2c74878-1339-412a-afba-4e6fefae5153	56	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2908091f-1958-4dd0-b788-81a3f453af61	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
d4e5d8a8-7d10-402b-b4ce-92a3e485f20d	57	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	df4ec6ed-4e53-48a6-a304-fafdd113d37f	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
d57a630d-30cd-478d-983b-9752ffc5a00a	58	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	72554bdd-1c7c-41d1-b439-bd6c6f76b62a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
d74cf19d-32f7-4585-8105-1fa6ba644148	59	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6c77803d-0b86-45b9-be00-9504785079cf	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
df4cc4ea-4ed1-4c8e-b103-9c5bedd0b779	60	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3e847de5-1181-4b65-97a2-996cededac17	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
e27c88ef-4ac0-4006-a4ce-b2f8be55ac64	61	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cc0adf47-6a58-4bf6-aacc-3ca48f03021c	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
e3058342-d159-4aec-bcb9-ab6060fa671b	62	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9f1fda0d-ed1f-4957-8a8a-390963a3a198	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
eb9977d8-87b7-4fe9-9c23-5fc4b45888a3	63	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b77a566e-5528-4c61-b833-d8d141e75812	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
f1d6fb48-ad55-4ba5-b043-82704d521f27	64	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1229a1e4-091e-4eb6-8925-81e0bba4116a	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
f46ca34e-5f02-4e04-9ef7-483cbc016f1c	65	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ffcfb821-eddf-465b-821c-b2e256170069	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
f6590766-f20c-4d95-a534-7f95aa9e1a44	66	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3cec94f8-d5fd-4493-90f3-f2e57fa1f024	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
f8993426-2be3-412f-bb0c-567ca27765c5	67	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	89194163-b21d-46af-97bd-b5caa1f4106e	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
fdc02404-d074-443e-9c07-65a6bddd6899	68	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	853b69ce-a022-40f0-b18b-172bbcaeec6c	\N	27f0fd70-b8ca-47ae-b5a1-df7531912f0c	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
3f7824d9-54cb-4f38-8105-4e1d354307e3	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	f98093d6-fe53-4f5f-b665-86905c3523a6	\N
6c970011-5f65-426b-9ac9-e6183dc9da33	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	f98093d6-fe53-4f5f-b665-86905c3523a6	\N
702517f6-2cd6-440a-9ebe-569b1e79d3fe	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	f98093d6-fe53-4f5f-b665-86905c3523a6	\N
41feac75-3294-4472-8e52-c73ed7c7ffb5	1	12:10:00	13:10:00	13:20:00	13:50:00	ff34a366-f6e2-4804-9f67-f7c1f4c5d416	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
09f7373c-6784-41eb-a4b4-5fbe62f8781d	3690	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	3690
16155b60-6776-4195-b8a3-12ec74314ad8	3550	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	3550
2a943448-f501-490e-b5d7-7a22e0665a04	3500	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	3500
c659b6e2-6f00-47c6-b8ff-81471ab91267	3510	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	3510
d42cb243-22cd-4788-b12f-692b5fa6da97	3610	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	3610
ef8fc182-a6d9-454b-a9ca-d5f09ce17490	3600	\N	32b7d961-7630-40c2-84ad-40962f3a32cd	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
a21b731d-618f-4f59-8f56-8bdbd7b87a9b	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 68, true);


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
-- Name: SeamAccounts PK_SeamAccounts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamAccounts"
    ADD CONSTRAINT "PK_SeamAccounts" PRIMARY KEY ("Id");


--
-- Name: SeamResults PK_SeamResults; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamResults"
    ADD CONSTRAINT "PK_SeamResults" PRIMARY KEY ("Id");


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
-- Name: IX_SeamAccounts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_SeamAccounts_IdFromSystem" ON public."SeamAccounts" USING btree ("IdFromSystem");


--
-- Name: IX_SeamAccounts_ProductAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamAccounts_ProductAccountId" ON public."SeamAccounts" USING btree ("ProductAccountId");


--
-- Name: IX_SeamAccounts_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamAccounts_SeamId" ON public."SeamAccounts" USING btree ("SeamId");


--
-- Name: IX_SeamResults_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_SeamResults_IdFromSystem" ON public."SeamResults" USING btree ("IdFromSystem");


--
-- Name: IX_SeamResults_SeamAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamResults_SeamAccountId" ON public."SeamResults" USING btree ("SeamAccountId");


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
-- Name: IX_WeldingTasks_SeamAccountId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_SeamAccountId" ON public."WeldingTasks" USING btree ("SeamAccountId");


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
-- Name: SeamAccounts FK_SeamAccounts_ProductAccounts_ProductAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamAccounts"
    ADD CONSTRAINT "FK_SeamAccounts_ProductAccounts_ProductAccountId" FOREIGN KEY ("ProductAccountId") REFERENCES public."ProductAccounts"("Id") ON DELETE CASCADE;


--
-- Name: SeamAccounts FK_SeamAccounts_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamAccounts"
    ADD CONSTRAINT "FK_SeamAccounts_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: SeamResults FK_SeamResults_SeamAccounts_SeamAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamResults"
    ADD CONSTRAINT "FK_SeamResults_SeamAccounts_SeamAccountId" FOREIGN KEY ("SeamAccountId") REFERENCES public."SeamAccounts"("Id") ON DELETE CASCADE;


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
-- Name: WeldingTasks FK_WeldingTasks_SeamAccounts_SeamAccountId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_SeamAccounts_SeamAccountId" FOREIGN KEY ("SeamAccountId") REFERENCES public."SeamAccounts"("Id") ON DELETE CASCADE;


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

