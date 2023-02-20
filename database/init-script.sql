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
e20a1d2d-d84b-48f1-8254-40c6eff12af6	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
0a0a1ceb-d8bf-44c4-987b-d9d8bcc7d9f8	c615610d-b8f9-4eb5-b3e3-380999d077a4	373cb779-dc12-4da3-a080-e6e3a9e97b24	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
90c7f3b4-a299-4f8e-ab76-f27fa985458e	1	10	t	e20a1d2d-d84b-48f1-8254-40c6eff12af6	\N
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
121a92a2-ee2a-4f8e-8865-3461b7931085	Неявка оператора (б/лист, отпуск, и пр.)	\N
34fd13e9-3e87-4cf3-a62e-2e3fda7bbd87	Установка, выверка, снятие детали	\N
393ce0ba-3c00-4831-8992-7c28d8efe8fc	Плановый ремонт централизованными службами	\N
4da233e1-6d7a-4f1f-b0e8-1bbc16c8701d	Работа по карте несоответствий	\N
5075bde5-73a9-41b9-969e-2aaace96272a	Отсутствие оператора в связи с необеспеченностью	\N
529c8ff7-ba4c-4ff6-b173-21364b77965b	Естественные надобности	\N
5a609341-e7c4-47f7-a3d3-bda39b5cd24c	Праздники и выходные	\N
6382301a-24d7-4b86-8c03-b2a0e85648d1	Отсутствие сотрудника ОТК	\N
644ec1ce-1d81-4452-8f99-85767c2529a6	Отсутствие крана, транспорта	\N
664c7b44-9762-4220-96f2-8811c2f9b759	Обед	\N
6e251772-a8db-41f6-a83e-40c8eed3a15a	Сборочные операции	\N
83e3b414-be32-4889-968c-76a4869e8593	Ознакомление с работой, документацией, инструктаж	\N
98092e70-7e4a-464c-b90c-306a3ede92dc	Установка, выверка, снятие детали	\N
9dda0e6d-b463-4686-ae96-ccfe9896112d	Отсутствие конструктора, технолога или ожидание его решения	\N
9f144e17-b1da-4f54-be20-ba308bafecb0	Работа с управляющей программой	\N
a8b62ace-386f-4bda-b953-eecbe2f4d169	Контроль на рабочем месте	\N
b0043b6b-066b-49bd-b3a6-535103d341e0	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
cd57c236-d272-4762-9fc0-ca522afd1e40	Аварийный ремонт централизованными службами	\N
d66b8da0-2117-4372-9b2a-9364b3c8d276	Отсутствие заданий	\N
d904bd8b-1b2a-4dd8-a0b6-4bc4d9ebd5bf	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
d95be74b-a511-4ec7-b5b5-de38a6f17e69	Отсутствие материала, заготовок, деталей	\N
dc41cbab-6e06-41db-a23b-20b2860d3021	Изменение режимов, смена инструмента, приспособления	\N
e5f6d3d3-6d5c-48f8-be46-d43c794227b3	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
efa2ed0f-fa66-4f7e-b426-10c936442c61	Отсутствие энергоносителей	\N
f55a5f92-b649-404d-83d3-ed5880d26705	Нерабочее время по графику согласно сменности	\N
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
091aa45d-35a9-4355-8aba-f10be948b10b	ffeee5e5-3200-479a-9aca-0e8bcb4cd21f	249550
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
300fef0b-5e55-4130-8dc5-b355f8c86444	be5c46f6-77d7-4a77-b88b-4089166abdbd	614962
85db4c0d-6420-4faf-a81d-d0c77cb42acf	84f6136e-2bf7-4a60-8ef6-34960d76fe14	610422
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
0e6954b4-a5b1-45ca-8f8b-bc682749fda7	2	Пост 2	c718a21d-61d2-4e09-8548-9768e8075d0f	\N
24100b3e-bc9e-4806-89f3-6b785055b945	1	Пост 1	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N
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
f8c74cb3-22b4-4a07-9654-8eb533e4acb0	0052f98d-3dca-4da8-8578-a505fb30d415
a55abad2-8791-4522-963f-d9b17d35c4f5	0f7a67f4-b28a-42b5-a9d8-076a9f5fdaa6
f2c2ba67-2a60-4de9-86ca-6868e50e0481	1fb60bf3-48d8-4aa6-beeb-c024ba6899da
c5733965-9c69-4247-907d-085bb48c7a11	28be55f7-2fe6-49f9-9588-76f1be1cf957
1fb60bf3-48d8-4aa6-beeb-c024ba6899da	2db059ce-df29-4857-b829-9b406493d9ef
5a23ca72-c75f-478a-acfd-34181d11476e	2f0d806c-604a-4501-a420-02850326cd6f
8365806b-8b5c-4a69-9177-bcda4ddc78bf	36a12d56-185f-4222-a680-884f1c47aa42
0f7a67f4-b28a-42b5-a9d8-076a9f5fdaa6	3b4f2ec5-3c65-477b-8356-82a299546397
f8c74cb3-22b4-4a07-9654-8eb533e4acb0	46e15983-79d9-40fd-a851-282317c49160
8365806b-8b5c-4a69-9177-bcda4ddc78bf	4dfca190-6dc4-4796-9832-66f11db419bb
c5733965-9c69-4247-907d-085bb48c7a11	51a5c6a9-2efd-4cc9-b72b-8590e894a3bd
a55abad2-8791-4522-963f-d9b17d35c4f5	5a23ca72-c75f-478a-acfd-34181d11476e
f2c2ba67-2a60-4de9-86ca-6868e50e0481	5dc1adba-ad65-4f09-963b-3d5903773f66
1fb60bf3-48d8-4aa6-beeb-c024ba6899da	60fe0124-1e97-4483-b34c-7d019bc725bb
f8c74cb3-22b4-4a07-9654-8eb533e4acb0	8365806b-8b5c-4a69-9177-bcda4ddc78bf
0f7a67f4-b28a-42b5-a9d8-076a9f5fdaa6	ab7d4809-0eac-4bf5-95f6-dc33f19bdde7
a55abad2-8791-4522-963f-d9b17d35c4f5	c175b365-234e-4f8e-a334-ee9fc4098526
f2c2ba67-2a60-4de9-86ca-6868e50e0481	c5733965-9c69-4247-907d-085bb48c7a11
f2c2ba67-2a60-4de9-86ca-6868e50e0481	c95db79d-0004-4b4a-baa4-07970d8853e3
a55abad2-8791-4522-963f-d9b17d35c4f5	cc1acca7-7e1b-4b53-95ac-c20912ad2be3
5a23ca72-c75f-478a-acfd-34181d11476e	ea6a173a-2955-4d79-ae4b-39a8e4de0ad8
46e15983-79d9-40fd-a851-282317c49160	f6fd6c33-73cf-4f05-b7a8-fe5f754946a8
f8c74cb3-22b4-4a07-9654-8eb533e4acb0	fe39b2db-2cc5-45a6-b50d-4e260280f9eb
46e15983-79d9-40fd-a851-282317c49160	ffaddb6c-576f-44dd-88fe-c7aa9304ab98
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
1097cc9a-3b08-490a-8cf6-d24389e5474f	Производственный участок 5	5	498a3eea-8500-45ed-9198-7ff5ba87a462	05
8cd9ad19-8fc5-4302-8530-862a4d22517e	Сборка, сварка мостов	1	373cb779-dc12-4da3-a080-e6e3a9e97b24	01
c718a21d-61d2-4e09-8548-9768e8075d0f	Сборка, сварка узл. и рам к/с г/п 120-220т	4	373cb779-dc12-4da3-a080-e6e3a9e97b24	04
cec5e778-2131-4efd-af58-f61a64fb4d32	Сборка, сварка рам к/с г/п 120-130 т.	6	373cb779-dc12-4da3-a080-e6e3a9e97b24	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0052f98d-3dca-4da8-8578-a505fb30d415	Кронштейн	75580-2113192	t	3	c7dc1594-56e6-4f49-b491-4b92e4846285	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536384314
0f7a67f4-b28a-42b5-a9d8-076a9f5fdaa6	Кронштейн	75310-1183100	t	2	4f2e30df-6344-4113-a752-7e5aebe269c9	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536267493
1fb60bf3-48d8-4aa6-beeb-c024ba6899da	Кронштейн	7521-2401220	t	2	e5ba9346-4d0b-4fd9-ba8b-c506e278f0ab	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536273956
2db059ce-df29-4857-b829-9b406493d9ef	Проушина	7521-2401224	t	3	7910056a-e920-47b1-8f55-50efc83ec43e	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536274170
2f0d806c-604a-4501-a420-02850326cd6f	Кронштейн	75303-1001293	t	3	3307c344-b834-4410-a6ef-49df99c62852	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536247228
36a12d56-185f-4222-a680-884f1c47aa42	Фланец картера	75580-2401114-11	t	3	3ff4bf81-8424-42f5-83ea-b5715860c228	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536386265
3b4f2ec5-3c65-477b-8356-82a299546397	Кронштейн	75310-1183102	t	3	80a3dcd6-28b1-41bf-950e-55f8aff01dab	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536267484
46e15983-79d9-40fd-a851-282317c49160	Картер заднего моста	75580-2401008	t	2	c7300553-9415-41c9-93fb-5fb83dc06b9d	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536384295
4dfca190-6dc4-4796-9832-66f11db419bb	Труба картера	75580-2401132-10	t	3	164d39bc-4b95-4f9c-9572-5604e7df403b	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536386250
51a5c6a9-2efd-4cc9-b72b-8590e894a3bd	Пластина	75132-2401106	t	3	2a97d5a2-0c00-4471-b6bc-9f287bf90229	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536444153
5a23ca72-c75f-478a-acfd-34181d11476e	Кронштейн амортизатора левый	75304-1001251	t	2	cbd437c6-cc99-486a-99bd-4989c2ab9bfc	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536248707
5dc1adba-ad65-4f09-963b-3d5903773f66	Кронштейн	75131-2113296-10	t	3	3aa049fe-5756-49b3-bd62-c0b55a16e3c0	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536461620
60fe0124-1e97-4483-b34c-7d019bc725bb	Распорка	7521-3932688	t	3	b56c1020-b4c9-49e4-a15d-01edb02d75bf	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536273606
8365806b-8b5c-4a69-9177-bcda4ddc78bf	Труба картера заднего моста	75580-2401010-01	t	2	acc29fd2-1edf-4f55-baaf-c52ac84fee77	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536386240
a55abad2-8791-4522-963f-d9b17d35c4f5	Рама	75313-2800010-20	t	1	9b685ff0-d22b-4e43-afba-03c020b64132	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536287819
ab7d4809-0eac-4bf5-95f6-dc33f19bdde7	Кронштейн	75310-1183106	t	3	cbfc93f0-a43e-469a-b0f5-466fcf94c9b5	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536267485
c175b365-234e-4f8e-a334-ee9fc4098526	Накладка	549Б-1015842	t	3	9cf288e2-eb69-4393-9eee-d4900eeb609a	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536196288
c5733965-9c69-4247-907d-085bb48c7a11	Картер заднего моста	75132-2401008-50	t	2	e1684485-1beb-4cec-9284-fcef01282b64	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536467565
c95db79d-0004-4b4a-baa4-07970d8853e3	Панель	75132-2105522	t	3	608db67f-6afb-4284-88ba-9c6847248c37	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536417730
cc1acca7-7e1b-4b53-95ac-c20912ad2be3	Кронштейн	75211-1018162	t	3	8eaa07ba-c08d-4766-8469-b6d988c9824a	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536270344
ea6a173a-2955-4d79-ae4b-39a8e4de0ad8	Кронштейн	75304-1001253	t	3	46e95113-ce8d-4937-81d6-2e4535b6058b	c718a21d-61d2-4e09-8548-9768e8075d0f	\N	\N	\N	4536248708
f2c2ba67-2a60-4de9-86ca-6868e50e0481	Картер заднего моста	75132-2401006-50	t	1	039f271f-ea87-4c5d-9d7e-a8c2dac3910f	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536467567
f6fd6c33-73cf-4f05-b7a8-fe5f754946a8	Втулка	75303-2128438	t	3	82e553fb-2557-44b8-a8d0-37ba21143888	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536248270
f8c74cb3-22b4-4a07-9654-8eb533e4acb0	Картер заднего моста	75580-2401006	t	1	485ebf3d-b97b-49a0-9ac3-895be344200c	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536384294
ffaddb6c-576f-44dd-88fe-c7aa9304ab98	Кольцо	75580-2401227	t	3	6699eec7-2b5f-49c2-a386-80481d130205	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N	\N	4536384312
28be55f7-2fe6-49f9-9588-76f1be1cf957	Опора	75211-2401122	t	3	776c1631-3371-4397-ac43-c29ed9baf761	8cd9ad19-8fc5-4302-8530-862a4d22517e	85db4c0d-6420-4faf-a81d-d0c77cb42acf	\N	\N	4536276803
fe39b2db-2cc5-45a6-b50d-4e260280f9eb	Панель	75580-2105522	t	3	9d4982c0-8a14-4fd2-ba0f-a81ffbf655e4	8cd9ad19-8fc5-4302-8530-862a4d22517e	85db4c0d-6420-4faf-a81d-d0c77cb42acf	\N	\N	4536384399
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
3ced7d88-4040-4e96-874c-65a618afe75e	Admin	\N
f9e5c35c-ebde-45b4-8d99-d193e27c55d9	Master	\N
b8d4b51a-32d3-4d2c-914e-826ea68ff24a	Welder	\N
6e251dc7-b13c-43d8-b3fd-ce8207104f5b	Inspector	\N
5630fe58-4f8b-4493-a473-aed4d0f39de3	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
2b113c64-a160-4e1a-add7-4c9a8f7ab20b	4	222	t	f	a55abad2-8791-4522-963f-d9b17d35c4f5	\N	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N
58794e36-8c85-4c6a-b960-a4c0b7901707	1	111	t	f	f2c2ba67-2a60-4de9-86ca-6868e50e0481	\N	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N
9c6c196c-31cb-4fa4-b15d-d310b594380a	2	222	t	f	f2c2ba67-2a60-4de9-86ca-6868e50e0481	\N	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N
cef2f98e-401c-43dc-85e5-37ea9ddb3ca4	3	333	t	f	a55abad2-8791-4522-963f-d9b17d35c4f5	\N	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	\N	\N
0cd90689-e02f-46d1-be4b-d5c38c0eddf8	2	200	t	f	fe39b2db-2cc5-45a6-b50d-4e260280f9eb	683735a8-e4e1-4867-8826-dfc414a79f05	091aa45d-35a9-4355-8aba-f10be948b10b	cec5e778-2131-4efd-af58-f61a64fb4d32	\N	\N
5d4dc7ac-54e2-4c44-bd9e-3e7fea566940	1	100	t	f	28be55f7-2fe6-49f9-9588-76f1be1cf957	33978de7-cb52-44d7-8568-2ed03a0c630b	091aa45d-35a9-4355-8aba-f10be948b10b	cec5e778-2131-4efd-af58-f61a64fb4d32	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
33978de7-cb52-44d7-8568-2ed03a0c630b	1	ИТП	\N
683735a8-e4e1-4867-8826-dfc414a79f05	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
039f271f-ea87-4c5d-9d7e-a8c2dac3910f	3090319	Технологический процесс	Ссылка	3090319
164d39bc-4b95-4f9c-9572-5604e7df403b	2822569	Технологический процесс	Ссылка	2822569
2a97d5a2-0c00-4471-b6bc-9f287bf90229	1003048	Технологический процесс	Ссылка	1003048
3307c344-b834-4410-a6ef-49df99c62852	3049271	Технологический процесс	Ссылка	3049271
3aa049fe-5756-49b3-bd62-c0b55a16e3c0	526870	Технологический процесс	Ссылка	526870
3ff4bf81-8424-42f5-83ea-b5715860c228	3338649	Технологический процесс	Ссылка	3338649
46e95113-ce8d-4937-81d6-2e4535b6058b	1492964	Технологический процесс	Ссылка	1492964
485ebf3d-b97b-49a0-9ac3-895be344200c	2433634	Технологический процесс	Ссылка	2433634
4f2e30df-6344-4113-a752-7e5aebe269c9	1823031	Технологический процесс	Ссылка	1823031
608db67f-6afb-4284-88ba-9c6847248c37	1053809	Технологический процесс	Ссылка	1053809
6699eec7-2b5f-49c2-a386-80481d130205	1402616	Технологический процесс	Ссылка	1402616
776c1631-3371-4397-ac43-c29ed9baf761	3211246	Технологический процесс	Ссылка	3211246
7910056a-e920-47b1-8f55-50efc83ec43e	1124147	Технологический процесс	Ссылка	1124147
80a3dcd6-28b1-41bf-950e-55f8aff01dab	1104641	Технологический процесс	Ссылка	1104641
82e553fb-2557-44b8-a8d0-37ba21143888	3011514	Технологический процесс	Ссылка	3011514
8eaa07ba-c08d-4766-8469-b6d988c9824a	2841119	Технологический процесс	Ссылка	2841119
9b685ff0-d22b-4e43-afba-03c020b64132	3239598	Технологический процесс	Ссылка	3239598
9cf288e2-eb69-4393-9eee-d4900eeb609a	1426226	Технологический процесс	Ссылка	1426226
9d4982c0-8a14-4fd2-ba0f-a81ffbf655e4	1405307	Технологический процесс	Ссылка	1405307
acc29fd2-1edf-4f55-baaf-c52ac84fee77	2915477	Технологический процесс	Ссылка	2915477
b56c1020-b4c9-49e4-a15d-01edb02d75bf	908693	Технологический процесс	Ссылка	908693
c7300553-9415-41c9-93fb-5fb83dc06b9d	3232938	Технологический процесс	Ссылка	3232938
c7dc1594-56e6-4f49-b491-4b92e4846285	1405914	Технологический процесс	Ссылка	1405914
cbd437c6-cc99-486a-99bd-4989c2ab9bfc	1334123	Технологический процесс	Ссылка	1334123
cbfc93f0-a43e-469a-b0f5-466fcf94c9b5	1119363	Технологический процесс	Ссылка	1119363
e1684485-1beb-4cec-9284-fcef01282b64	3232836	Технологический процесс	Ссылка	3232836
e5ba9346-4d0b-4fd9-ba8b-c506e278f0ab	1362989	Технологический процесс	Ссылка	1362989
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
ffeee5e5-3200-479a-9aca-0e8bcb4cd21f	6e251dc7-b13c-43d8-b3fd-ce8207104f5b
84f6136e-2bf7-4a60-8ef6-34960d76fe14	f9e5c35c-ebde-45b4-8d99-d193e27c55d9
be5c46f6-77d7-4a77-b88b-4089166abdbd	f9e5c35c-ebde-45b4-8d99-d193e27c55d9
3d45f465-d195-4562-9a59-2d8addd59463	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
788d44a3-30a4-458f-92ec-b263bc35560f	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
7d5ca4be-8ce4-417c-8d0e-a547ca1bf45d	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
a0f24505-1e23-4436-93d4-1b2c9c5ddda1	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
ad98e4ee-2598-4ad8-94ea-d2c3d368385c	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
b87d7877-dc14-4126-8dcd-3171192d6373	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
e7df9748-e0ea-48c5-922b-cc57c1804a22	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
f7d6c3e7-e7a9-4f7c-8348-9e0b0b035b82	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
c615610d-b8f9-4eb5-b3e3-380999d077a4	5630fe58-4f8b-4493-a473-aed4d0f39de3
4412651b-a548-4ee5-af63-952cfe536146	3ced7d88-4040-4e96-874c-65a618afe75e
81091c4f-56f9-472c-8698-2d9942580d6f	b8d4b51a-32d3-4d2c-914e-826ea68ff24a
3e2d3c97-982a-4c6c-acdb-203405a1140b	6e251dc7-b13c-43d8-b3fd-ce8207104f5b
5ed11646-af81-4240-a16b-885692683c2a	5630fe58-4f8b-4493-a473-aed4d0f39de3
025217bd-4c0c-4f43-9cac-0f8fd5de6444	f9e5c35c-ebde-45b4-8d99-d193e27c55d9
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
ffeee5e5-3200-479a-9aca-0e8bcb4cd21f	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
84f6136e-2bf7-4a60-8ef6-34960d76fe14	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
be5c46f6-77d7-4a77-b88b-4089166abdbd	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
3d45f465-d195-4562-9a59-2d8addd59463	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:CD:7E:5A	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
788d44a3-30a4-458f-92ec-b263bc35560f	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	B7:5A:79:B5	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
7d5ca4be-8ce4-417c-8d0e-a547ca1bf45d	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	97:17:60:B4	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
a0f24505-1e23-4436-93d4-1b2c9c5ddda1	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	17:CD:7F:5A	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
ad98e4ee-2598-4ad8-94ea-d2c3d368385c	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	67:5A:70:B4	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
b87d7877-dc14-4126-8dcd-3171192d6373	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	D7:F1:7D:5A	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
e7df9748-e0ea-48c5-922b-cc57c1804a22	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:95:55:B4	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
f7d6c3e7-e7a9-4f7c-8348-9e0b0b035b82	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	27:45:7E:B4	cec5e778-2131-4efd-af58-f61a64fb4d32	\N
c615610d-b8f9-4eb5-b3e3-380999d077a4	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
4412651b-a548-4ee5-af63-952cfe536146	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$IMqiJRYu96WW29GY05OcIUyjrXK7KES51bmHYmXsESG8ZU79	\N	\N	\N	\N	\N	\N
81091c4f-56f9-472c-8698-2d9942580d6f	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$DB2jz8pQIyF14OqCvzW19hKMohHwuNVWExYvWTOeGzfBG8ut	\N	\N	\N	\N	\N	\N
3e2d3c97-982a-4c6c-acdb-203405a1140b	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$zgdL11nv9Zmrbj3McKeiM2xxZwgMN+hnzPnW46Y5hKbVLrY4	\N	\N	\N	\N	\N	\N
5ed11646-af81-4240-a16b-885692683c2a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$V6CMpcjiZf39ufE1HxGbmZpdYVETxmdIIJxppTLE9ld3hBBn	\N	\N	\N	\N	\N	\N
025217bd-4c0c-4f43-9cac-0f8fd5de6444	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$2yb0l2PwHV2HGkGf5SzYPy8LyW9IJYtofayqDs4PDx9VihqD	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
6bdbb61d-cfa0-491a-9159-f7d16c91f39b	1	Корневой	80	120	22	24	50	250	33978de7-cb52-44d7-8568-2ed03a0c630b	\N
8682757c-17e7-40be-81d7-aa26a1371088	1	Корневой	80	120	\N	\N	50	250	683735a8-e4e1-4867-8826-dfc414a79f05	\N
a15bfd97-4f26-4a28-a063-98d7709c870e	2	Заполняющий	80	120	21	25	50	250	683735a8-e4e1-4867-8826-dfc414a79f05	\N
c77874f5-76f9-4b2d-93ac-34e0762a9cff	2	Заполняющий	80	120	21	25	50	250	33978de7-cb52-44d7-8568-2ed03a0c630b	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
004b74ae-02d7-4339-bf62-371068c2a77a	2	Заполняющий	100	0.22	0.44	\N	\N	\N	72b7cb75-ea8c-4d75-b82f-5daf98aa160b	14c0706e-f9ef-47b6-aaca-a696dc5209e2	\N
1f9a0321-8a20-49e4-8e57-9b85400443db	2	Заполняющий	100	0.22	0.44	\N	\N	\N	34e6caaa-0bda-4357-88ac-8dffff6d2215	1be69603-6154-4fae-90bb-e73ec0a10f83	\N
4826465c-9541-4086-8255-3b248bb7e58f	1	Корневой	82	0.11	0.68	\N	\N	\N	7626d7b3-c859-4fac-9e42-386bb53669bf	14c0706e-f9ef-47b6-aaca-a696dc5209e2	\N
e0869dac-0f23-46a0-8c6e-a8a9c8ff6bea	1	Корневой	82	0.11	0.68	\N	\N	\N	9bd8856d-fe5e-4b70-aa52-ab13cdfa5044	1be69603-6154-4fae-90bb-e73ec0a10f83	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0053cd58-ef71-48b6-bc62-2559a1eff6fc	a9186bed-d3c6-4e32-a9ec-0c980a234577
30cd4a68-21ad-45a5-914a-a4c938471620	7a7f20b5-be29-407c-8891-02dca948f697
31d86729-6d83-4a79-a59d-7cfb2a1edd19	102a0161-f9f1-49c6-a6bb-4195b5a4dfe9
42819175-4f37-4588-bf31-2d6791d524d0	4b00f940-0410-432f-9e87-50a725e1b65c
7873fe70-6b2d-46e9-b43d-de26694dddbe	7a7f20b5-be29-407c-8891-02dca948f697
a7df439f-c1df-4361-b79c-e1a81c23aa77	102a0161-f9f1-49c6-a6bb-4195b5a4dfe9
a97fa1d0-70dc-42a8-a58a-89401b5ac26b	4b00f940-0410-432f-9e87-50a725e1b65c
be212309-78be-4c52-a587-1502f0775b16	a9186bed-d3c6-4e32-a9ec-0c980a234577
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0053cd58-ef71-48b6-bc62-2559a1eff6fc	3d45f465-d195-4562-9a59-2d8addd59463	2b3173f5-e986-485b-a6c8-2f6aba278fc8	117390
30cd4a68-21ad-45a5-914a-a4c938471620	b87d7877-dc14-4126-8dcd-3171192d6373	3f529a58-40bc-4a86-834c-1fb701604f74	120756
31d86729-6d83-4a79-a59d-7cfb2a1edd19	f7d6c3e7-e7a9-4f7c-8348-9e0b0b035b82	0cc63f60-e812-4125-8923-7db1214e8dbe	145092
42819175-4f37-4588-bf31-2d6791d524d0	7d5ca4be-8ce4-417c-8d0e-a547ca1bf45d	879cd270-9535-4652-8645-f6ebe7436754	151299
7873fe70-6b2d-46e9-b43d-de26694dddbe	ad98e4ee-2598-4ad8-94ea-d2c3d368385c	2b3173f5-e986-485b-a6c8-2f6aba278fc8	146325
a7df439f-c1df-4361-b79c-e1a81c23aa77	a0f24505-1e23-4436-93d4-1b2c9c5ddda1	f4a02aa9-3952-4809-b28d-7c894fe4fc98	132695
a97fa1d0-70dc-42a8-a58a-89401b5ac26b	788d44a3-30a4-458f-92ec-b263bc35560f	4c1534cb-353f-4ca2-93fe-c91bf3a141a2	150882
be212309-78be-4c52-a587-1502f0775b16	e7df9748-e0ea-48c5-922b-cc57c1804a22	d20520a0-774d-4af4-b0d9-7415c413f840	121267
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
102a0161-f9f1-49c6-a6bb-4195b5a4dfe9	0cc63f60-e812-4125-8923-7db1214e8dbe
102a0161-f9f1-49c6-a6bb-4195b5a4dfe9	f4a02aa9-3952-4809-b28d-7c894fe4fc98
4b00f940-0410-432f-9e87-50a725e1b65c	4c1534cb-353f-4ca2-93fe-c91bf3a141a2
4b00f940-0410-432f-9e87-50a725e1b65c	879cd270-9535-4652-8645-f6ebe7436754
7a7f20b5-be29-407c-8891-02dca948f697	2b3173f5-e986-485b-a6c8-2f6aba278fc8
7a7f20b5-be29-407c-8891-02dca948f697	3f529a58-40bc-4a86-834c-1fb701604f74
a9186bed-d3c6-4e32-a9ec-0c980a234577	2b3173f5-e986-485b-a6c8-2f6aba278fc8
a9186bed-d3c6-4e32-a9ec-0c980a234577	d20520a0-774d-4af4-b0d9-7415c413f840
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
102a0161-f9f1-49c6-a6bb-4195b5a4dfe9	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	85db4c0d-6420-4faf-a81d-d0c77cb42acf	535
4b00f940-0410-432f-9e87-50a725e1b65c	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	85db4c0d-6420-4faf-a81d-d0c77cb42acf	499
7a7f20b5-be29-407c-8891-02dca948f697	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	85db4c0d-6420-4faf-a81d-d0c77cb42acf	508
a9186bed-d3c6-4e32-a9ec-0c980a234577	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	85db4c0d-6420-4faf-a81d-d0c77cb42acf	511
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
34e6caaa-0bda-4357-88ac-8dffff6d2215	2023-02-20 23:38:28.890563	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	7a7f20b5-be29-407c-8891-02dca948f697	30cd4a68-21ad-45a5-914a-a4c938471620	85db4c0d-6420-4faf-a81d-d0c77cb42acf	\N
72b7cb75-ea8c-4d75-b82f-5daf98aa160b	2023-02-20 23:38:28.8892	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	7a7f20b5-be29-407c-8891-02dca948f697	30cd4a68-21ad-45a5-914a-a4c938471620	85db4c0d-6420-4faf-a81d-d0c77cb42acf	\N
7626d7b3-c859-4fac-9e42-386bb53669bf	2023-02-20 23:38:28.888611	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	7a7f20b5-be29-407c-8891-02dca948f697	30cd4a68-21ad-45a5-914a-a4c938471620	85db4c0d-6420-4faf-a81d-d0c77cb42acf	\N
9bd8856d-fe5e-4b70-aa52-ab13cdfa5044	2023-02-20 23:38:28.89056	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	7a7f20b5-be29-407c-8891-02dca948f697	30cd4a68-21ad-45a5-914a-a4c938471620	85db4c0d-6420-4faf-a81d-d0c77cb42acf	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
14c0706e-f9ef-47b6-aaca-a696dc5209e2	1	1	f	2023-02-20 23:38:28.88652	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	5d4dc7ac-54e2-4c44-bd9e-3e7fea566940	30cd4a68-21ad-45a5-914a-a4c938471620	85db4c0d-6420-4faf-a81d-d0c77cb42acf	091aa45d-35a9-4355-8aba-f10be948b10b	\N
1be69603-6154-4fae-90bb-e73ec0a10f83	2	1	f	2023-02-20 23:38:28.890549	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	0cd90689-e02f-46d1-be4b-d5c38c0eddf8	30cd4a68-21ad-45a5-914a-a4c938471620	85db4c0d-6420-4faf-a81d-d0c77cb42acf	091aa45d-35a9-4355-8aba-f10be948b10b	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
1f200565-fcaf-40c8-816c-62710f795eb2	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	e20a1d2d-d84b-48f1-8254-40c6eff12af6	\N
31e2fa5e-7381-4a3f-be0f-2dcf098679e0	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	e20a1d2d-d84b-48f1-8254-40c6eff12af6	\N
b7777990-6911-4361-8e6a-dba57a363260	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	e20a1d2d-d84b-48f1-8254-40c6eff12af6	\N
7d9c737d-bcb7-4da3-b44f-ea266e4abedd	1	12:10:00	13:10:00	13:20:00	13:50:00	90c7f3b4-a299-4f8e-ab76-f27fa985458e	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0cc63f60-e812-4125-8923-7db1214e8dbe	3590	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3590
1c629a1f-6cbc-401e-8f8a-0d9492e6f42b	2150	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	2150
1d667e7f-02d9-4d10-8284-ada33455c289	1380	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1380
2b3173f5-e986-485b-a6c8-2f6aba278fc8	3610	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3610
3f529a58-40bc-4a86-834c-1fb701604f74	3520	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3520
4c1534cb-353f-4ca2-93fe-c91bf3a141a2	3690	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3690
6f2eea04-eda6-4876-a5a1-5d869b5e1e48	1390	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1390
879cd270-9535-4652-8645-f6ebe7436754	3650	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3650
8a67412c-6628-4238-b0d1-7b1ea2880362	1280	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1280
9203b3ce-d063-46de-872a-83a7c069273f	1550	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1550
b0b06c37-b90c-49ea-a7b2-58c5ace09958	1260	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1260
b1bd5ac6-3623-435c-add7-8585782ee7b2	1270	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1270
c9e85691-3d83-4841-a041-41a2b723ab1a	1360	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1360
d20520a0-774d-4af4-b0d9-7415c413f840	3600	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3600
dafd413b-d171-4687-9dd4-14572ab28e12	2050	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	2050
f32cd19c-2db0-44e7-8475-7616250e51a1	2130	\N	8cd9ad19-8fc5-4302-8530-862a4d22517e	2130
f4a02aa9-3952-4809-b28d-7c894fe4fc98	3500	\N	cec5e778-2131-4efd-af58-f61a64fb4d32	3500
f83f2996-1be7-4139-998c-a636152951a1	1400	\N	c718a21d-61d2-4e09-8548-9768e8075d0f	1400
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
373cb779-dc12-4da3-a080-e6e3a9e97b24	Сварочный цех	50	050
498a3eea-8500-45ed-9198-7ff5ba87a462	Цех 480	480	480
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

