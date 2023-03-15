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
5e769e7a-6536-41a5-a52b-15ec0f1f6d1b	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
041bf56a-6e18-41f6-a3e1-d3b2b5c95993	a388f312-1e67-45f2-936f-6f7274722cd9	89734b55-e1b6-4215-ae06-d713134709aa	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
c4a00040-0655-4054-b142-387c4e88f3e4	1	10	t	5e769e7a-6536-41a5-a52b-15ec0f1f6d1b	\N
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
03f018cd-cb23-40b8-ab0a-c8b6bc78fb21	Изменение режимов, смена инструмента, приспособления	\N
0aa879e6-c742-468e-90df-96d40fcbd776	Установка, выверка, снятие детали	\N
0bb1ed46-ded5-41df-95ba-342d80d680b2	Контроль на рабочем месте	\N
0fb4f7dc-7d64-4c4b-a856-59d74daa3ed0	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
2b7a62d9-eadd-45aa-a87d-fe2706ea1afc	Естественные надобности	\N
4836adea-a7da-425b-936f-8fe81fbf2236	Отсутствие энергоносителей	\N
4b2ced11-6f31-4658-95f7-c87f0e86151d	Плановый ремонт централизованными службами	\N
6b9d870d-c23e-4d88-bb62-05db1961393b	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
70c87879-3c63-46c8-809a-df88be0f5fb9	Работа с управляющей программой	\N
78a19608-c298-4c41-8fd6-7f857b067d6f	Отсутствие сотрудника ОТК	\N
80322646-4b8a-4633-93f5-3900b53ee58d	Отсутствие оператора в связи с необеспеченностью	\N
816049d9-5428-45eb-87b1-c81d8bc9d03a	Обед	\N
8a43f1b3-b3ca-4acd-b4bb-e486b4fcf1c4	Неявка оператора (б/лист, отпуск, и пр.)	\N
8c21d304-d579-4183-9401-51c0a1faf176	Ознакомление с работой, документацией, инструктаж	\N
8c365a65-6c2d-4e3f-9bde-de7211fdd7c5	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
8de49754-b61e-4dd7-a257-f5847c42b2ba	Сборочные операции	\N
9012ede5-9af8-41c6-b4a6-0ec51d08296a	Установка, выверка, снятие детали	\N
90fe255a-45d6-455c-9a39-c27c79f8d952	Отсутствие крана, транспорта	\N
9c9c1a48-cf81-4c8a-9cda-7a345f76a0a7	Работа по карте несоответствий	\N
aa46ef08-7fe7-4aef-b06c-384ba74c407a	Аварийный ремонт централизованными службами	\N
adbd40e2-e300-40ee-a42b-743fec23d9eb	Нерабочее время по графику согласно сменности	\N
affb6a3a-7053-4cd8-ada0-cef577c6dee8	Отсутствие заданий	\N
c14f3051-0b59-4bde-a650-2e5d83e1ad25	Отсутствие материала, заготовок, деталей	\N
f31185fd-7e62-4383-85d9-5d8e50f347ec	Праздники и выходные	\N
fb982f61-d8cb-4f35-91b5-9ecbd34a51b0	Отсутствие конструктора, технолога или ожидание его решения	\N
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
3299379f-f30e-4f44-9c69-44285a6dfa5b	9d9fb885-3507-4f8e-af84-f71f4f683b5c	219379
86c6cd43-f255-4fbc-a36a-5ea309a65179	a0dea52a-a3f9-4020-94c1-49f38d52c5c9	249550
b2557ef6-e55c-4ccb-addc-ce7b9785e43b	e442f571-ea08-4672-92ce-8927f936dc51	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
4cf78f58-6a49-49c0-8806-855fade91799	d361662d-daa2-4020-9757-95e625a69215	614962
8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	623d56b5-2609-43a8-9a55-b3c169063f44	610422
56e2909f-a94f-4402-86d6-8b0b8a7cc9b3	71fd685d-ee65-4805-944c-4cfab44c1b6f	\N
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
07dc6bc0-699a-466b-a691-da8659e66ea4	e20291a8-4cf6-433a-8e94-adb7c42fac87
0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	e20291a8-4cf6-433a-8e94-adb7c42fac87
13db5540-2b5e-4d97-aac2-3570606af12e	e20291a8-4cf6-433a-8e94-adb7c42fac87
14042895-280a-47fc-8695-2c7e43289924	e20291a8-4cf6-433a-8e94-adb7c42fac87
1dae6ff8-6a03-4668-8c35-4a0d772438e6	e20291a8-4cf6-433a-8e94-adb7c42fac87
1e2d7148-2a9b-47de-9611-456530db8b9b	e20291a8-4cf6-433a-8e94-adb7c42fac87
225f9b60-e624-4766-bb6a-629d8eae3241	e20291a8-4cf6-433a-8e94-adb7c42fac87
28bf829b-766b-4911-800f-184605b915d1	e20291a8-4cf6-433a-8e94-adb7c42fac87
319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	e20291a8-4cf6-433a-8e94-adb7c42fac87
33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	e20291a8-4cf6-433a-8e94-adb7c42fac87
3f45a148-a29b-4283-bfbd-f9f4ad9a2fe3	e20291a8-4cf6-433a-8e94-adb7c42fac87
3feb2cac-e3f3-41c5-b3c8-c0c45f12433b	e20291a8-4cf6-433a-8e94-adb7c42fac87
46fa4c91-57f1-4afb-acef-d893e7924fc5	e20291a8-4cf6-433a-8e94-adb7c42fac87
4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	e20291a8-4cf6-433a-8e94-adb7c42fac87
60aa6daa-99a6-46f6-810c-5fe60730b9f2	e20291a8-4cf6-433a-8e94-adb7c42fac87
67b10af1-5fbe-4788-ad67-a505102cdb30	e20291a8-4cf6-433a-8e94-adb7c42fac87
788649c9-6439-498b-9ab9-470ef8ef1b74	e20291a8-4cf6-433a-8e94-adb7c42fac87
790902fa-d584-4377-80d7-3aae7b60ca63	e20291a8-4cf6-433a-8e94-adb7c42fac87
7cd64288-a2da-4425-823a-c1bf68d84031	e20291a8-4cf6-433a-8e94-adb7c42fac87
9c87ccb7-461b-4d81-baad-21fdffc74bdb	e20291a8-4cf6-433a-8e94-adb7c42fac87
9c934c41-7dfe-4170-80ed-8cca61cd0de7	e20291a8-4cf6-433a-8e94-adb7c42fac87
9ef566f3-ea0a-45b4-bedd-da0d2012f695	e20291a8-4cf6-433a-8e94-adb7c42fac87
a24a89dc-5969-43d2-b1d2-5890c8c469b6	e20291a8-4cf6-433a-8e94-adb7c42fac87
a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	e20291a8-4cf6-433a-8e94-adb7c42fac87
b318067a-4308-4937-a581-22a708c1a265	e20291a8-4cf6-433a-8e94-adb7c42fac87
ba338e66-131b-48cb-8057-8ad002a2bfd0	e20291a8-4cf6-433a-8e94-adb7c42fac87
bc3c029b-dab2-46a0-99cf-4ae28de4e5cd	e20291a8-4cf6-433a-8e94-adb7c42fac87
c3ca6bcd-cfd9-4f22-b663-51503e280f73	e20291a8-4cf6-433a-8e94-adb7c42fac87
ce3e6cdf-09d4-4c40-9a6a-ecff94418c57	e20291a8-4cf6-433a-8e94-adb7c42fac87
e4d06600-6be1-48b5-abc3-1d4a0e55f062	e20291a8-4cf6-433a-8e94-adb7c42fac87
e610033c-426c-48b7-be73-f8b39bcdb9c4	e20291a8-4cf6-433a-8e94-adb7c42fac87
e95663a9-d978-47f2-aa8d-29e2b3b524ac	e20291a8-4cf6-433a-8e94-adb7c42fac87
ea0f75bd-223e-427a-bff4-1a39d885cf8b	e20291a8-4cf6-433a-8e94-adb7c42fac87
ea15586f-cb45-4c91-9071-7005e333ca68	e20291a8-4cf6-433a-8e94-adb7c42fac87
f18adea3-5512-4d2f-af84-811d5ad447eb	e20291a8-4cf6-433a-8e94-adb7c42fac87
ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	e20291a8-4cf6-433a-8e94-adb7c42fac87
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
07dc6bc0-699a-466b-a691-da8659e66ea4	7	2	2023-03-12 00:00:00	5187b57d-3c1c-4f90-886c-0075b20331aa	\N
0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	8	2	2023-03-12 00:00:00	5570a672-25fa-495b-ab2d-a64c33e846eb	\N
13db5540-2b5e-4d97-aac2-3570606af12e	1	2	2023-03-12 00:00:00	00760a15-182e-4128-a70f-be8d781d5cde	\N
14042895-280a-47fc-8695-2c7e43289924	10	2	2023-03-12 00:00:00	6a720e5c-e13c-4289-a7a1-b772ed6054f9	\N
1dae6ff8-6a03-4668-8c35-4a0d772438e6	5	2	2023-03-12 00:00:00	2f34493a-e00b-4d7e-8816-e8b698edb136	\N
1e2d7148-2a9b-47de-9611-456530db8b9b	16	2	2023-03-12 00:00:00	8bd2e5c7-eae4-4a8e-bc44-c9aecc5166dc	\N
225f9b60-e624-4766-bb6a-629d8eae3241	18	2	2023-03-12 00:00:00	9e7dc924-8cbf-4c19-a1ee-0cec5193efab	\N
28bf829b-766b-4911-800f-184605b915d1	35	2	2023-03-12 00:00:00	ec3206c3-0d87-465f-9d87-6bea1cf4e0dd	\N
319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	30	2	2023-03-12 00:00:00	c633d5e0-43a4-4298-a15a-f2cbafd15081	\N
33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	3	2	2023-03-12 00:00:00	0857d82c-9250-4ecb-8185-2391cf58d7e7	\N
3f45a148-a29b-4283-bfbd-f9f4ad9a2fe3	29	2	2023-03-12 00:00:00	c4651f32-8b63-449a-9ed2-f32b232b49f3	\N
3feb2cac-e3f3-41c5-b3c8-c0c45f12433b	20	2	2023-03-12 00:00:00	a43e9e84-152d-4f95-9d48-3e1a90d755d9	\N
46fa4c91-57f1-4afb-acef-d893e7924fc5	32	2	2023-03-12 00:00:00	d360d32e-40e0-4ec4-9ded-45504428801d	\N
4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	22	2	2023-03-12 00:00:00	a722b88d-51e9-4347-9337-ad992a0c0cc9	\N
60aa6daa-99a6-46f6-810c-5fe60730b9f2	24	2	2023-03-12 00:00:00	b1714609-26dd-453f-9421-1cbc17dc99c7	\N
67b10af1-5fbe-4788-ad67-a505102cdb30	25	2	2023-03-12 00:00:00	b8380205-b32f-4599-822c-cd5dc80eb2fe	\N
788649c9-6439-498b-9ab9-470ef8ef1b74	9	2	2023-03-12 00:00:00	602d5cbf-ba17-480f-9681-c0fb4f8c0ec7	\N
790902fa-d584-4377-80d7-3aae7b60ca63	12	2	2023-03-12 00:00:00	70da823a-76ad-4fd6-9b9c-425cced23951	\N
7cd64288-a2da-4425-823a-c1bf68d84031	27	2	2023-03-12 00:00:00	c1a885c5-4ae4-46eb-a2ab-771e14890a1c	\N
9c87ccb7-461b-4d81-baad-21fdffc74bdb	17	2	2023-03-12 00:00:00	92983fbf-e1d3-49fa-889d-4f34fe8f55d9	\N
9c934c41-7dfe-4170-80ed-8cca61cd0de7	26	2	2023-03-12 00:00:00	bc75b8c3-eadb-4c14-9870-d5996fe62df4	\N
9ef566f3-ea0a-45b4-bedd-da0d2012f695	11	2	2023-03-12 00:00:00	70a8de2b-bcb2-4ee2-b1ab-0101001face1	\N
a24a89dc-5969-43d2-b1d2-5890c8c469b6	2	2	2023-03-12 00:00:00	03344a7b-afbf-4e36-9c6d-2212ab3d70e9	\N
a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	34	2	2023-03-12 00:00:00	e3f25ba9-1733-4f47-84c1-964695c5f160	\N
b318067a-4308-4937-a581-22a708c1a265	21	2	2023-03-12 00:00:00	a5d61a80-f866-4e41-bfee-a2a0f5c5d9fa	\N
ba338e66-131b-48cb-8057-8ad002a2bfd0	33	2	2023-03-12 00:00:00	d6c63e3d-8771-41ca-a4ad-74e7f2c32b15	\N
bc3c029b-dab2-46a0-99cf-4ae28de4e5cd	13	2	2023-03-12 00:00:00	75564e86-be8d-4b1d-b608-c5c683497bce	\N
c3ca6bcd-cfd9-4f22-b663-51503e280f73	36	2	2023-03-12 00:00:00	f2e3cbb1-bae2-4605-a57a-8f6165f580e5	\N
ce3e6cdf-09d4-4c40-9a6a-ecff94418c57	28	2	2023-03-12 00:00:00	c3052880-6a90-4a9b-a92a-fbd534f035d6	\N
e4d06600-6be1-48b5-abc3-1d4a0e55f062	31	2	2023-03-12 00:00:00	c741d449-505f-4259-b7ad-75b2f022a1e8	\N
e610033c-426c-48b7-be73-f8b39bcdb9c4	6	2	2023-03-12 00:00:00	37d67915-e663-4e4f-821e-4e7100698ee2	\N
e95663a9-d978-47f2-aa8d-29e2b3b524ac	4	2	2023-03-12 00:00:00	0941e9a7-2046-4df1-a5b9-adf650c4dfd5	\N
ea0f75bd-223e-427a-bff4-1a39d885cf8b	15	2	2023-03-12 00:00:00	8af85f09-9bf6-42f9-9024-51f27799885d	\N
ea15586f-cb45-4c91-9071-7005e333ca68	23	2	2023-03-12 00:00:00	aab6a093-106a-4337-ac86-fe705dd80cc8	\N
f18adea3-5512-4d2f-af84-811d5ad447eb	19	2	2023-03-12 00:00:00	a04ca5b7-69d4-4b1d-976e-80cf30f391db	\N
ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	14	2	2023-03-12 00:00:00	8af51c82-df07-477c-bc1c-aa9d47dde3c3	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
8af85f09-9bf6-42f9-9024-51f27799885d	00760a15-182e-4128-a70f-be8d781d5cde
c4651f32-8b63-449a-9ed2-f32b232b49f3	03344a7b-afbf-4e36-9c6d-2212ab3d70e9
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	0857d82c-9250-4ecb-8185-2391cf58d7e7
c4651f32-8b63-449a-9ed2-f32b232b49f3	0941e9a7-2046-4df1-a5b9-adf650c4dfd5
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	2f34493a-e00b-4d7e-8816-e8b698edb136
c4651f32-8b63-449a-9ed2-f32b232b49f3	37d67915-e663-4e4f-821e-4e7100698ee2
c4651f32-8b63-449a-9ed2-f32b232b49f3	5187b57d-3c1c-4f90-886c-0075b20331aa
8af51c82-df07-477c-bc1c-aa9d47dde3c3	5570a672-25fa-495b-ab2d-a64c33e846eb
c4651f32-8b63-449a-9ed2-f32b232b49f3	602d5cbf-ba17-480f-9681-c0fb4f8c0ec7
c4651f32-8b63-449a-9ed2-f32b232b49f3	6a720e5c-e13c-4289-a7a1-b772ed6054f9
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	70a8de2b-bcb2-4ee2-b1ab-0101001face1
8af51c82-df07-477c-bc1c-aa9d47dde3c3	70da823a-76ad-4fd6-9b9c-425cced23951
8af51c82-df07-477c-bc1c-aa9d47dde3c3	75564e86-be8d-4b1d-b608-c5c683497bce
c4651f32-8b63-449a-9ed2-f32b232b49f3	8af51c82-df07-477c-bc1c-aa9d47dde3c3
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	8af85f09-9bf6-42f9-9024-51f27799885d
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	8bd2e5c7-eae4-4a8e-bc44-c9aecc5166dc
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	92983fbf-e1d3-49fa-889d-4f34fe8f55d9
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	9e7dc924-8cbf-4c19-a1ee-0cec5193efab
c4651f32-8b63-449a-9ed2-f32b232b49f3	a04ca5b7-69d4-4b1d-976e-80cf30f391db
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	a43e9e84-152d-4f95-9d48-3e1a90d755d9
c4651f32-8b63-449a-9ed2-f32b232b49f3	a5d61a80-f866-4e41-bfee-a2a0f5c5d9fa
c4651f32-8b63-449a-9ed2-f32b232b49f3	a722b88d-51e9-4347-9337-ad992a0c0cc9
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	aab6a093-106a-4337-ac86-fe705dd80cc8
8af85f09-9bf6-42f9-9024-51f27799885d	b1714609-26dd-453f-9421-1cbc17dc99c7
c4651f32-8b63-449a-9ed2-f32b232b49f3	b8380205-b32f-4599-822c-cd5dc80eb2fe
c4651f32-8b63-449a-9ed2-f32b232b49f3	bc75b8c3-eadb-4c14-9870-d5996fe62df4
c4651f32-8b63-449a-9ed2-f32b232b49f3	c3052880-6a90-4a9b-a92a-fbd534f035d6
8af51c82-df07-477c-bc1c-aa9d47dde3c3	c633d5e0-43a4-4298-a15a-f2cbafd15081
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	c741d449-505f-4259-b7ad-75b2f022a1e8
8af85f09-9bf6-42f9-9024-51f27799885d	d360d32e-40e0-4ec4-9ded-45504428801d
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	d6c63e3d-8771-41ca-a4ad-74e7f2c32b15
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	e3f25ba9-1733-4f47-84c1-964695c5f160
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	ec3206c3-0d87-465f-9d87-6bea1cf4e0dd
8af85f09-9bf6-42f9-9024-51f27799885d	f2e3cbb1-bae2-4605-a57a-8f6165f580e5
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
0d2e80a4-d8b9-40ce-9544-4b8fa473b9d9	0	3	\N	\N	c3ca6bcd-cfd9-4f22-b663-51503e280f73	\N
0f2201ec-493e-4f6f-8d9a-9936e68973b7	0	1	\N	\N	f18adea3-5512-4d2f-af84-811d5ad447eb	\N
12a9e88e-0eac-408c-8377-dc5a2e593ce1	0	1	\N	\N	14042895-280a-47fc-8695-2c7e43289924	\N
147b33f6-6552-4719-939b-5bb09b25ceba	0	2	\N	\N	28bf829b-766b-4911-800f-184605b915d1	\N
15cd381b-06aa-46b2-96a8-b83cbde70975	0	2	\N	\N	a24a89dc-5969-43d2-b1d2-5890c8c469b6	\N
1657c030-84b8-41fd-a199-0bfc7ad303ee	0	3	\N	\N	319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	\N
1cf639e9-ad21-40a8-8bbb-bb324b5c488c	0	3	\N	\N	b318067a-4308-4937-a581-22a708c1a265	\N
1debdb91-70d2-40e1-8ec6-b4bb222298d4	0	3	\N	\N	a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	\N
1e6f9e40-5b50-42f7-a573-79b8cd0e35ec	0	3	\N	\N	788649c9-6439-498b-9ab9-470ef8ef1b74	\N
233d9d7c-78a6-4fe5-b9eb-88bc1c272995	0	3	\N	\N	1e2d7148-2a9b-47de-9611-456530db8b9b	\N
27c0840d-938b-45c2-96a2-8ea420bfd091	0	1	\N	\N	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
2d46bad7-fa24-4509-a6b2-c92977ea2298	0	2	\N	\N	e4d06600-6be1-48b5-abc3-1d4a0e55f062	\N
2e19693b-1ca0-4142-af51-59f31f5d243b	0	3	\N	\N	ba338e66-131b-48cb-8057-8ad002a2bfd0	\N
3325434d-50dd-4308-a589-b11c84f778ee	0	1	\N	\N	46fa4c91-57f1-4afb-acef-d893e7924fc5	\N
350dc051-8cbe-4b15-aa78-c28bad5fd6c6	0	1	\N	\N	a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	\N
3625769a-4ffe-4075-abfb-1a5e0af3b649	0	1	\N	\N	a24a89dc-5969-43d2-b1d2-5890c8c469b6	\N
366ddaaf-11de-4634-b3f6-2bf6007e580e	0	3	\N	\N	9c87ccb7-461b-4d81-baad-21fdffc74bdb	\N
372c10a2-186b-4167-be31-91700164d7c8	0	3	\N	\N	1dae6ff8-6a03-4668-8c35-4a0d772438e6	\N
3f42a3ea-0a62-4c21-8b01-0dc4c6f1edde	0	1	\N	\N	319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	\N
3fd79819-889f-4d50-88bf-34855a977ed9	0	3	\N	\N	ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	\N
44be3332-ae94-40eb-b889-39ff7a11c11c	0	2	\N	\N	1dae6ff8-6a03-4668-8c35-4a0d772438e6	\N
4521a55b-03fb-4069-8dcc-2216a58b4c76	0	1	\N	\N	b318067a-4308-4937-a581-22a708c1a265	\N
4764e94b-8e74-492c-a13a-7d86ac75beb1	0	3	\N	\N	790902fa-d584-4377-80d7-3aae7b60ca63	\N
4861ebb8-d62c-4448-9314-2d975f127d51	0	1	\N	\N	e610033c-426c-48b7-be73-f8b39bcdb9c4	\N
4b7bed62-3298-4582-8c66-b6e5d0ccdef5	0	2	\N	\N	3f45a148-a29b-4283-bfbd-f9f4ad9a2fe3	\N
50cd7bd2-2484-4ebe-80da-04136ee319fd	0	1	\N	\N	0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	\N
56e00cc3-f8f2-40db-8a9e-aba977294e3c	0	2	\N	\N	67b10af1-5fbe-4788-ad67-a505102cdb30	\N
5826a88e-2b3e-426f-94e3-0325c12445da	0	1	\N	\N	ba338e66-131b-48cb-8057-8ad002a2bfd0	\N
58efb9eb-d9ea-4b39-8cf6-1e4ba32388cf	0	2	\N	\N	a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	\N
5ae66ea0-396d-4c8e-971c-20079120c186	0	3	\N	\N	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
5b4009b7-c6af-41d9-bc5e-140d1bf38dc7	0	2	\N	\N	ce3e6cdf-09d4-4c40-9a6a-ecff94418c57	\N
61713898-24a1-4194-a267-b2e1ab2c56ed	0	1	\N	\N	13db5540-2b5e-4d97-aac2-3570606af12e	\N
618ff19b-f3cc-4db7-8693-78af59c8065f	0	3	\N	\N	bc3c029b-dab2-46a0-99cf-4ae28de4e5cd	\N
698b5183-8b0f-4c21-951c-febaa78e44e5	0	1	\N	\N	67b10af1-5fbe-4788-ad67-a505102cdb30	\N
6a3e4dbf-8a18-4d25-836a-5e204f33b6ab	0	3	\N	\N	f18adea3-5512-4d2f-af84-811d5ad447eb	\N
6cfa4621-de21-4491-a60e-a49f97cc5f1b	0	1	\N	\N	9ef566f3-ea0a-45b4-bedd-da0d2012f695	\N
6eb0fe68-bdd5-4885-82cf-5e86281f2ea5	0	1	\N	\N	ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	\N
70079045-c431-435e-992e-a4079c0eb395	0	2	\N	\N	788649c9-6439-498b-9ab9-470ef8ef1b74	\N
7284b761-8d0e-4125-89c5-ecf3cb150122	0	1	\N	\N	bc3c029b-dab2-46a0-99cf-4ae28de4e5cd	\N
73337acd-ddd2-4db6-98e6-18ee3ada90c6	0	1	\N	\N	225f9b60-e624-4766-bb6a-629d8eae3241	\N
7339a8ac-51e5-4f76-af22-489d92451590	0	3	\N	\N	67b10af1-5fbe-4788-ad67-a505102cdb30	\N
78191cf5-32e6-4c21-bbfb-4f026054f57f	0	1	\N	\N	3feb2cac-e3f3-41c5-b3c8-c0c45f12433b	\N
7ad9fc1e-6e57-4ea3-9d94-04fca64da7cf	0	2	\N	\N	ea0f75bd-223e-427a-bff4-1a39d885cf8b	\N
7b28873f-b4b4-46a5-9566-51ddc5b64d10	0	1	\N	\N	60aa6daa-99a6-46f6-810c-5fe60730b9f2	\N
7b335e39-0cd8-44cd-9f87-9ced96a89dd8	0	2	\N	\N	9c87ccb7-461b-4d81-baad-21fdffc74bdb	\N
7b395c36-39e2-4f98-b612-3fff09a41c18	0	2	\N	\N	9ef566f3-ea0a-45b4-bedd-da0d2012f695	\N
7c73e167-53b9-4ce5-bfb1-a588d9ed8e1f	0	3	\N	\N	7cd64288-a2da-4425-823a-c1bf68d84031	\N
7c8028b0-865a-441f-afe6-7f5d55383cf9	0	3	\N	\N	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
7cd0403c-433d-4009-82bf-680b50210d0a	0	2	\N	\N	07dc6bc0-699a-466b-a691-da8659e66ea4	\N
7f02607c-9c7a-4408-819e-f863212882b8	0	3	\N	\N	60aa6daa-99a6-46f6-810c-5fe60730b9f2	\N
7ff302b2-3b93-4bee-b9de-54930e61527c	0	2	\N	\N	3feb2cac-e3f3-41c5-b3c8-c0c45f12433b	\N
801ac755-4b04-4140-9892-9cd7effe36d3	0	1	\N	\N	3f45a148-a29b-4283-bfbd-f9f4ad9a2fe3	\N
82f5df6f-0f91-4619-88ad-0c172b951838	0	1	\N	\N	9c934c41-7dfe-4170-80ed-8cca61cd0de7	\N
84e62d68-61f0-412c-8490-64d93065db2e	0	2	\N	\N	ba338e66-131b-48cb-8057-8ad002a2bfd0	\N
880ac605-d1d2-4b3c-8574-4df19974b973	0	1	\N	\N	1dae6ff8-6a03-4668-8c35-4a0d772438e6	\N
88581386-6aa0-4340-8a28-2a315bef2bd3	0	1	\N	\N	1e2d7148-2a9b-47de-9611-456530db8b9b	\N
898a94fa-0277-456d-b9f7-4a51a7fab08b	0	2	\N	\N	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
8a7ff41b-9113-433d-9832-bcf773cb7d0e	0	3	\N	\N	a24a89dc-5969-43d2-b1d2-5890c8c469b6	\N
8b8c28f6-524d-4b62-8a45-1d181e7e5c6c	0	2	\N	\N	c3ca6bcd-cfd9-4f22-b663-51503e280f73	\N
90f8b6b2-6ed0-423e-8db5-0df4f488ba22	0	2	\N	\N	ea15586f-cb45-4c91-9071-7005e333ca68	\N
918dfa92-d8db-4dd3-9c37-d2531c00a47e	0	1	\N	\N	07dc6bc0-699a-466b-a691-da8659e66ea4	\N
92da20d8-1c59-4288-8176-a1dd04e68925	0	1	\N	\N	ea15586f-cb45-4c91-9071-7005e333ca68	\N
95f7845c-10ba-4f15-bf07-92f5cf0486f8	0	1	\N	\N	788649c9-6439-498b-9ab9-470ef8ef1b74	\N
97a176b9-aa99-48f2-8384-d5d4e223a9f7	0	2	\N	\N	14042895-280a-47fc-8695-2c7e43289924	\N
9b012dc3-e82b-4fbf-bf2c-a25f80c12f21	0	2	\N	\N	ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	\N
9d2d7d41-2538-47a3-90ab-dec001064472	0	2	\N	\N	790902fa-d584-4377-80d7-3aae7b60ca63	\N
9eba229d-75ee-496c-bffa-0278679d4fc3	0	2	\N	\N	225f9b60-e624-4766-bb6a-629d8eae3241	\N
a2359991-478a-4e17-ad4d-5ec6b7cd6bd8	0	2	\N	\N	f18adea3-5512-4d2f-af84-811d5ad447eb	\N
a62b8723-60b5-41e5-90c6-7c06e532928f	0	2	\N	\N	9c934c41-7dfe-4170-80ed-8cca61cd0de7	\N
a6329d5b-ab6e-4ebd-a095-429de11ad170	0	2	\N	\N	0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	\N
a7da9199-e23d-4768-a335-841b546f4788	0	1	\N	\N	e4d06600-6be1-48b5-abc3-1d4a0e55f062	\N
aa9ebd16-86c3-4a8e-82bb-840004a33715	0	3	\N	\N	9ef566f3-ea0a-45b4-bedd-da0d2012f695	\N
ac6d13f5-254c-4bf1-82f1-b43265180451	0	1	\N	\N	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
ad6f0c29-8563-4aeb-afbd-2bbf2008151f	0	1	\N	\N	790902fa-d584-4377-80d7-3aae7b60ca63	\N
aff2d662-21d8-426e-b4b3-e0620a585bff	0	3	\N	\N	e4d06600-6be1-48b5-abc3-1d4a0e55f062	\N
b03168e7-79c0-4a6d-9d10-ee472e763d74	0	1	\N	\N	28bf829b-766b-4911-800f-184605b915d1	\N
b1470600-546e-4eb8-b335-d1dbd858826b	0	3	\N	\N	13db5540-2b5e-4d97-aac2-3570606af12e	\N
b9b56b49-fdc7-4c64-a45a-e7b859699694	0	3	\N	\N	0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	\N
ba23b0ba-6a80-4844-9746-ea0388410c5b	0	2	\N	\N	60aa6daa-99a6-46f6-810c-5fe60730b9f2	\N
ba388e42-4b97-4f37-a3a4-dfb5308a29f0	0	1	\N	\N	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
c480cb0f-beff-4f46-a772-d96b8dec8148	0	3	\N	\N	07dc6bc0-699a-466b-a691-da8659e66ea4	\N
c5377e91-cbb6-4f51-92a5-9649b30a2de9	0	1	\N	\N	c3ca6bcd-cfd9-4f22-b663-51503e280f73	\N
c83d508c-9edf-45b5-b9c6-1c0c021e3eba	0	3	\N	\N	e610033c-426c-48b7-be73-f8b39bcdb9c4	\N
c973459e-7d1d-4a0a-b441-a292bcd24942	0	3	\N	\N	225f9b60-e624-4766-bb6a-629d8eae3241	\N
ca13a87a-54f6-4782-858b-4e09a11e6e6d	0	1	\N	\N	ea0f75bd-223e-427a-bff4-1a39d885cf8b	\N
caa021fc-0f7b-4124-ad0c-9e3425d71f52	0	2	\N	\N	1e2d7148-2a9b-47de-9611-456530db8b9b	\N
cf3981cd-4a8a-449e-81d9-48541c106cce	0	2	\N	\N	bc3c029b-dab2-46a0-99cf-4ae28de4e5cd	\N
cf8a8342-3ff5-4155-b787-d0d79ff8cb7d	0	1	\N	\N	9c87ccb7-461b-4d81-baad-21fdffc74bdb	\N
cfc6fec5-8732-4ca8-a6f9-1bd026e131c2	0	2	\N	\N	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
d4a7c84f-d9d1-4ac7-9003-0a52d581de2e	0	3	\N	\N	ea0f75bd-223e-427a-bff4-1a39d885cf8b	\N
d60cfa6a-ae90-48d8-a143-990f4198df5e	0	3	\N	\N	ea15586f-cb45-4c91-9071-7005e333ca68	\N
d6704abd-8e90-439a-ad33-d82490a1312b	0	2	\N	\N	13db5540-2b5e-4d97-aac2-3570606af12e	\N
d72fd1ee-a6de-49d5-91f4-620a6cd97b7d	0	1	\N	\N	ce3e6cdf-09d4-4c40-9a6a-ecff94418c57	\N
da96d19f-b263-4931-9828-67f450fe4c5f	0	2	\N	\N	319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	\N
db363080-a599-4bf5-8d5d-d0baccbc2203	0	3	\N	\N	9c934c41-7dfe-4170-80ed-8cca61cd0de7	\N
dd902a61-b5b1-46e9-9676-1b22786ad332	0	3	\N	\N	28bf829b-766b-4911-800f-184605b915d1	\N
de1df9f5-5fef-4c17-bc89-cdaaae4d2a97	0	2	\N	\N	46fa4c91-57f1-4afb-acef-d893e7924fc5	\N
df7ff9c0-af95-4b59-bdf4-d2adf2fad4ee	0	2	\N	\N	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
e0a81185-26c6-4ac6-9305-bb762a50ac66	0	3	\N	\N	14042895-280a-47fc-8695-2c7e43289924	\N
e2ddbbaf-6f27-41f9-9b1e-ba6e159d194c	0	3	\N	\N	3f45a148-a29b-4283-bfbd-f9f4ad9a2fe3	\N
e55675b5-da2c-4775-a81d-71826f49aa3e	0	2	\N	\N	e610033c-426c-48b7-be73-f8b39bcdb9c4	\N
e5b9c79f-d140-4038-8594-dc925cccad6e	0	3	\N	\N	46fa4c91-57f1-4afb-acef-d893e7924fc5	\N
ec45de06-6804-44cd-bb71-d3f665ecd713	0	1	\N	\N	7cd64288-a2da-4425-823a-c1bf68d84031	\N
f00e7e61-fcc6-4522-af73-9ad1974f2083	0	2	\N	\N	b318067a-4308-4937-a581-22a708c1a265	\N
f2c2919f-870a-4ac8-921e-d734dc071d07	0	3	\N	\N	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
f371296c-35ea-4805-b153-a5a7900052cb	0	3	\N	\N	3feb2cac-e3f3-41c5-b3c8-c0c45f12433b	\N
f823b28d-e566-4b61-81bc-f852c26f0858	0	3	\N	\N	ce3e6cdf-09d4-4c40-9a6a-ecff94418c57	\N
fa2d7706-6c95-4935-8fd1-d37eff07176b	0	2	\N	\N	7cd64288-a2da-4425-823a-c1bf68d84031	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
8764f911-95b4-4260-af3f-2678281a686d	Сборка, сварка рам к/с г/п 120-130 т.	6	89734b55-e1b6-4215-ae06-d713134709aa	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
00760a15-182e-4128-a70f-be8d781d5cde	Кронштейн задней опоры	75131-8521183-20	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
03344a7b-afbf-4e36-9c6d-2212ab3d70e9	Поперечина	75131-2801103-10	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
0857d82c-9250-4ecb-8185-2391cf58d7e7	Лонжерон рамы левый	75131-2801015-41	t	2	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
0941e9a7-2046-4df1-a5b9-adf650c4dfd5	Лонжерон рамы левый	75131-2801015-41	t	2	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
2f34493a-e00b-4d7e-8816-e8b698edb136	Опора	75131-2801189	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
37d67915-e663-4e4f-821e-4e7100698ee2	Усилитель	75131-2801115-01	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
5187b57d-3c1c-4f90-886c-0075b20331aa	Поперечина №3 рамы с опорами	75132-2801152	t	2	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
5570a672-25fa-495b-ab2d-a64c33e846eb	Поперечина	75131-2801325	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
602d5cbf-ba17-480f-9681-c0fb4f8c0ec7	Опора	75131-2801188	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
6a720e5c-e13c-4289-a7a1-b772ed6054f9	Усилитель	75131-2801114-01	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
70a8de2b-bcb2-4ee2-b1ab-0101001face1	Лонжерон рамы правый	75131-2801016-70	t	2	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
70da823a-76ad-4fd6-9b9c-425cced23951	Кронштейн задней опоры	75131-8521182-20	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
75564e86-be8d-4b1d-b608-c5c683497bce	Кронштейн задней опоры	75131-8521183-20	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
8af51c82-df07-477c-bc1c-aa9d47dde3c3	Поперечина рамы задняя	75131-2801300-20	t	2	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
8af85f09-9bf6-42f9-9024-51f27799885d	Поперечина рамы задняя	75131-2801300-20	t	2	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
8bd2e5c7-eae4-4a8e-bc44-c9aecc5166dc	Усилитель	75131-2801114-01	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
92983fbf-e1d3-49fa-889d-4f34fe8f55d9	Усилитель	75131-2801115-01	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
9e7dc924-8cbf-4c19-a1ee-0cec5193efab	Поперечина	75131-2801103-10	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
a04ca5b7-69d4-4b1d-976e-80cf30f391db	Лист нижний	75131-2801358-10	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
a43e9e84-152d-4f95-9d48-3e1a90d755d9	Поперечина №3 рамы с опорами	75132-2801152	t	2	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
a5d61a80-f866-4e41-bfee-a2a0f5c5d9fa	Лонжерон рамы правый	75131-2801016-70	t	2	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
aab6a093-106a-4337-ac86-fe705dd80cc8	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
b1714609-26dd-453f-9421-1cbc17dc99c7	Кронштейн задней опоры	75131-8521182-20	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
b8380205-b32f-4599-822c-cd5dc80eb2fe	Лонжерон рамы левый	75131-2801017-70	t	2	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
bc75b8c3-eadb-4c14-9870-d5996fe62df4	Опора	75131-2801189	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
c1a885c5-4ae4-46eb-a2ab-771e14890a1c	Рама	75131-2800010-70	t	1	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	4536479362
c3052880-6a90-4a9b-a92a-fbd534f035d6	Накладка рамы поперечная передняя	75131-2801088-70	t	3	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
c4651f32-8b63-449a-9ed2-f32b232b49f3	Рама	7513D-2800010-20	t	1	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	4536492774
c633d5e0-43a4-4298-a15a-f2cbafd15081	Лист верхний	75131-2801357-10	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
d360d32e-40e0-4ec4-9ded-45504428801d	Лист верхний	75131-2801357-10	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
d6c63e3d-8771-41ca-a4ad-74e7f2c32b15	Опора	75131-2801188	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
e3f25ba9-1733-4f47-84c1-964695c5f160	Лонжерон рамы левый	75131-2801017-70	t	2	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
ec3206c3-0d87-465f-9d87-6bea1cf4e0dd	Лонжерон рамы правый	75131-2801014-41	t	2	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
f2e3cbb1-bae2-4605-a57a-8f6165f580e5	Поперечина	75131-2801325	t	3	c32db9c3-a2a1-4945-83f1-b7972eeaea5d	8764f911-95b4-4260-af3f-2678281a686d	\N	\N	\N	\N
a722b88d-51e9-4347-9337-ad992a0c0cc9	Лонжерон рамы правый	75131-2801014-41	t	2	d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	8764f911-95b4-4260-af3f-2678281a686d	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N	\N
c741d449-505f-4259-b7ad-75b2f022a1e8	Лист нижний	75131-2801358-10	t	3	b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	8764f911-95b4-4260-af3f-2678281a686d	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
7bed5ce2-28c8-4d3f-a897-994f6806e463	Admin	\N
2f6ff901-1474-4fce-b0f2-5a0ad9e2acb9	Master	\N
5cd3b65b-4abf-4a9c-886b-06d304dade23	Welder	\N
cd828e26-65f7-47b6-8943-b710a4448228	Inspector	\N
088eabaa-997c-4a8e-ba2f-4e3bef605350	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
04c1ccf3-4e6e-4279-bcd4-1ee274d006ae	2023-03-12 00:00:00	6812433a-89cf-437c-a307-c7bc5850380b	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
07f50ebe-1941-4aa8-b20b-9cdaaa0fb528	2023-03-12 00:00:00	7f8751fb-6d92-42c3-b9f5-e28813ec3bd9	b318067a-4308-4937-a581-22a708c1a265	\N
09e3a1c1-e3d2-44b3-a4da-cd1d2e500027	2023-03-12 00:00:00	8d08dd10-0cd1-4f77-83a8-3fdd9320a248	ba338e66-131b-48cb-8057-8ad002a2bfd0	\N
0ecf895f-a229-4cee-98a4-c756d59da0dc	2023-03-12 00:00:00	d1ceb1ae-28a0-4136-9f2b-de0485872230	b318067a-4308-4937-a581-22a708c1a265	\N
128f5742-5303-43ad-96dc-de2f8ac612c7	2023-03-12 00:00:00	49d94f70-2445-40ae-8e31-25e0f645dc50	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
156720b4-c74f-40ef-9268-a197547c8bf6	2023-03-12 00:00:00	0b5d1504-5b6e-45a8-ae33-ff6506d1c004	b318067a-4308-4937-a581-22a708c1a265	\N
178c7235-a9b5-472e-8281-6d6ec66f13aa	2023-03-12 00:00:00	b1c29c1b-010d-45ae-ae36-e39cf45f6d98	67b10af1-5fbe-4788-ad67-a505102cdb30	\N
17d04d11-a26f-42d9-a404-024751c8963f	2023-03-12 00:00:00	11513146-f7e4-4c7e-a59e-c0c1418f145c	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
22b53242-e26c-4c4e-84d9-e9c781f846d2	2023-03-12 00:00:00	983560c2-3207-4ec8-804c-c5c97a1b3d59	1dae6ff8-6a03-4668-8c35-4a0d772438e6	\N
281f1788-c132-48b1-9b8e-519712b7ed52	2023-03-12 00:00:00	211b2325-c742-4e58-9870-d7e945f4c77d	ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	\N
2da65e07-ff67-4900-8359-3f9a189c5da0	2023-03-12 00:00:00	0ef500a1-312a-4e9c-9c0f-4b6f2ade2117	ba338e66-131b-48cb-8057-8ad002a2bfd0	\N
3328e476-5aa5-4702-83ec-003040a9fa22	2023-03-12 00:00:00	6c82edfe-031f-4ae9-92ad-3a1c70e74cc5	bc3c029b-dab2-46a0-99cf-4ae28de4e5cd	\N
3464cb39-ec1e-435e-868c-de66d4c36833	2023-03-12 00:00:00	82988cd0-414a-479a-b194-36f1b7e491d9	13db5540-2b5e-4d97-aac2-3570606af12e	\N
3705f957-cc3e-41f8-88cf-506ec6815115	2023-03-12 00:00:00	a7b398b5-7244-49fb-849b-217217722925	790902fa-d584-4377-80d7-3aae7b60ca63	\N
3fa48cea-2d92-4d0b-bd7e-14eeb96b21c9	2023-03-12 00:00:00	dde3e40a-a093-41b3-986f-6e768ef51cba	46fa4c91-57f1-4afb-acef-d893e7924fc5	\N
4359bc90-4500-418a-a199-5f48cf7434ee	2023-03-12 00:00:00	8624bcdf-7e53-46b7-bc01-e10e850c9613	ffcdd2fb-44fa-4577-b32d-9f7177ea4d4c	\N
43a3f94d-3e7b-42bb-8bf7-f4e5cc51a51e	2023-03-12 00:00:00	52e96ed7-39ab-4576-ba76-296ff05e8f9a	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
4d4cf173-14d0-4c78-b86b-5c9feba7d691	2023-03-12 00:00:00	79926a4f-709c-4980-83c2-057e3245b94d	319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	\N
4eaafe21-83cd-41eb-8301-f98eda0c6f02	2023-03-12 00:00:00	b6baaa99-c25e-4551-ae7f-030fbaa870e7	f18adea3-5512-4d2f-af84-811d5ad447eb	\N
512f149b-3b1e-42c5-b62d-9606bcdb62d9	2023-03-12 00:00:00	90b5f196-78fc-4ded-b324-5f7ed1204775	28bf829b-766b-4911-800f-184605b915d1	\N
56947f39-7e02-4ade-9164-92033a0dd8e3	2023-03-12 00:00:00	6db3d9bd-e108-4dfb-935d-e9e46a9d69b2	a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	\N
56de5ec6-d275-4b4b-85f6-622e62cf5ebb	2023-03-12 00:00:00	ea6de8da-8d85-4007-b3ee-a84024d77054	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
58f03a1a-e59f-460c-8d33-dd782c4c8dbc	2023-03-12 00:00:00	231f83ca-a1aa-45cf-b41e-153078851ad3	9c934c41-7dfe-4170-80ed-8cca61cd0de7	\N
5b0e16f5-4094-429e-a9ba-2afd0dd41507	2023-03-12 00:00:00	aec263dc-4a28-4815-bf68-32ad121ce53b	14042895-280a-47fc-8695-2c7e43289924	\N
6237985c-86d4-4a57-9d13-8a48be251c7a	2023-03-12 00:00:00	759790bc-999b-4b8c-9b18-fbd1ca62ca9d	e4d06600-6be1-48b5-abc3-1d4a0e55f062	\N
6372c395-5c88-4fb4-ac06-65eda2c5554d	2023-03-12 00:00:00	43eece0e-d9f5-4223-8a21-d34f4270341b	a24a89dc-5969-43d2-b1d2-5890c8c469b6	\N
675b00ed-ed08-43d6-90b9-e2cd988f2b92	2023-03-12 00:00:00	f3c79286-33e0-4d3b-aa69-72deac2b1382	e610033c-426c-48b7-be73-f8b39bcdb9c4	\N
688a0152-5418-4d28-8107-429a4e199c38	2023-03-12 00:00:00	c5a23c94-0729-47af-9802-ed41a530efbd	ba338e66-131b-48cb-8057-8ad002a2bfd0	\N
6a80e9f5-4ce6-4862-8aa1-3cfbe4e4f35b	2023-03-12 00:00:00	ce44472b-8167-48c5-a42e-40872cc190e3	28bf829b-766b-4911-800f-184605b915d1	\N
6ad060b7-229f-4bb7-aea7-d7d84ebd2e9d	2023-03-12 00:00:00	64aa84e6-4493-4f74-98f7-27ca42c46829	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
6b283f50-5c7a-464d-9c04-069724e51e67	2023-03-12 00:00:00	3114b0b5-2978-4069-ba76-d252dbed7391	0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	\N
6ca6583b-34d8-4281-9d60-3a2810c42f40	2023-03-12 00:00:00	9651602b-523c-42f6-9b27-d14aaf60009e	46fa4c91-57f1-4afb-acef-d893e7924fc5	\N
75d98d80-b262-493f-bc8c-5b83dd32ef2b	2023-03-12 00:00:00	cedca0a9-a273-4e02-81a5-66ac4122d444	a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	\N
7a1b85d1-9ae6-4213-a445-9398a1368d5f	2023-03-12 00:00:00	b636bf02-7672-4515-b418-f444719c34d2	1dae6ff8-6a03-4668-8c35-4a0d772438e6	\N
891b13f9-4fd3-4081-ae20-4bc0151d1333	2023-03-12 00:00:00	b8507a7f-d606-4f4c-b4c1-9b476cf9c38d	788649c9-6439-498b-9ab9-470ef8ef1b74	\N
9267c68c-a869-46f6-9717-6d81a89adb52	2023-03-12 00:00:00	8e8bceb7-fb1a-4e9f-954a-e9afee177970	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
98a64f82-33d6-4a2c-8828-1168f6b96a62	2023-03-12 00:00:00	6a8506dd-d1e3-46d2-84a7-8ad3f76adc6e	9c934c41-7dfe-4170-80ed-8cca61cd0de7	\N
993e8f75-31ef-4170-a85e-343da3953de4	2023-03-12 00:00:00	7a827cbc-b53a-4308-b9b6-9155dd137359	ea15586f-cb45-4c91-9071-7005e333ca68	\N
9cb1d9b6-29f4-48dc-987a-6932f3d07899	2023-03-12 00:00:00	e6fe7ff1-e0c9-498a-a2fa-51b6016b84aa	9c87ccb7-461b-4d81-baad-21fdffc74bdb	\N
9eb1e4b0-cf2e-4409-83a4-75b4cb2c8889	2023-03-12 00:00:00	7f3ae17a-8cb6-43e4-b103-9a1a7f33d3d9	e95663a9-d978-47f2-aa8d-29e2b3b524ac	\N
a3e90e6a-9e33-44ad-b37e-3e7ea4468c86	2023-03-12 00:00:00	d12d4ce4-a9ca-4cce-b4e5-c6063df463e7	3feb2cac-e3f3-41c5-b3c8-c0c45f12433b	\N
a5349541-19e7-4f60-a227-cd410e5f865c	2023-03-12 00:00:00	29e654f3-ac1e-450b-a21d-fbb6ec7c75f8	9ef566f3-ea0a-45b4-bedd-da0d2012f695	\N
a6397be2-93aa-4e9f-96ba-6514579b7e22	2023-03-12 00:00:00	86d7e874-1ced-4a2e-8d5a-a51eb5aec302	60aa6daa-99a6-46f6-810c-5fe60730b9f2	\N
a7b96447-7bad-41e9-bdc3-0ed6d30be224	2023-03-12 00:00:00	743a58e3-f0b6-47f0-86ca-0e8f3102d6cb	c3ca6bcd-cfd9-4f22-b663-51503e280f73	\N
a9a6572d-37b7-4d91-ae06-600fa79e535b	2023-03-12 00:00:00	eec68f2c-7b3e-43bd-a3a9-801ceb9428ba	9ef566f3-ea0a-45b4-bedd-da0d2012f695	\N
ad55da85-b9a7-48c4-b4fd-9b8c38037f01	2023-03-12 00:00:00	4bd10c0d-78c9-43fb-aad1-7aa13b71a991	c3ca6bcd-cfd9-4f22-b663-51503e280f73	\N
aef89586-f630-4939-86b2-145712039f27	2023-03-12 00:00:00	289bb7a7-21e7-488b-9fe4-a0e021269608	67b10af1-5fbe-4788-ad67-a505102cdb30	\N
b283afb1-ec95-42be-905b-f8f1cd2d0ca4	2023-03-12 00:00:00	e4d1733d-b053-4f54-9fb8-16252effed6b	1dae6ff8-6a03-4668-8c35-4a0d772438e6	\N
b51d88cf-3fb1-4acf-8b70-a06d3f18acef	2023-03-12 00:00:00	b7b22d31-f938-48c8-944d-ba0879acaea0	9c934c41-7dfe-4170-80ed-8cca61cd0de7	\N
b7b41beb-e263-4d56-b0da-d618134756e1	2023-03-12 00:00:00	ffe12ffc-6618-473f-b2be-fb04a63b17b3	a2ed86af-0c26-491b-ab48-1bfcdb38d4bc	\N
bcd0fd52-596d-4300-9904-a23400abecb2	2023-03-12 00:00:00	b3c11ca2-7552-4a18-8911-f9eb6dd66f03	07dc6bc0-699a-466b-a691-da8659e66ea4	\N
c333ab97-0bc3-4989-8bc0-c93d1906e73e	2023-03-12 00:00:00	24bb71b5-dd0f-48f4-907b-bedd9deb6f9f	28bf829b-766b-4911-800f-184605b915d1	\N
c5dde1ed-ea30-419e-964a-3d4d63774d74	2023-03-12 00:00:00	2f37a281-5d2c-44b5-893d-1cd0cd5fbede	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
cbaea7d4-0461-4faf-8d66-4e408c991e7b	2023-03-12 00:00:00	65eb47ba-e7b9-4322-a2a4-bf7a4d59147b	ea0f75bd-223e-427a-bff4-1a39d885cf8b	\N
cbea4d68-c3ee-4948-a9ff-e87bb245f384	2023-03-12 00:00:00	c5b3ed8a-5639-439a-beec-ec86fe9d4d79	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
d11cf3f0-3cfa-4df2-8de8-c3c5c47bc011	2023-03-12 00:00:00	b668365d-45dc-4ffe-95f3-3029cdb18f2d	1e2d7148-2a9b-47de-9611-456530db8b9b	\N
d4ad3d67-4c96-47ac-a1d2-a16d8a89c730	2023-03-12 00:00:00	5ffb946f-3a42-4434-9def-e26f8c480e1f	ce3e6cdf-09d4-4c40-9a6a-ecff94418c57	\N
d4d64ba0-5f00-477c-bf33-6d8dc28642e3	2023-03-12 00:00:00	32e94cec-05d8-454b-b288-d8670cac4637	67b10af1-5fbe-4788-ad67-a505102cdb30	\N
d7d575ea-a2fe-42c1-93fc-5b3819d1a595	2023-03-12 00:00:00	569977e4-7333-42f1-bebd-be9fe680dd54	225f9b60-e624-4766-bb6a-629d8eae3241	\N
edcfc4fd-4189-41e1-b5be-c6e86e714de8	2023-03-12 00:00:00	92c4e9cc-5593-4753-b1b4-273f0835b69f	788649c9-6439-498b-9ab9-470ef8ef1b74	\N
eecc43c6-8299-4b2b-b5ce-c7c760067c96	2023-03-12 00:00:00	7a07eb4c-ab1a-46a1-8116-ae1cf4e6e90f	0f816bcd-3bb8-4f32-a25b-c3eff30c8bc4	\N
f57e55ee-296b-436a-baff-546d0b1d8ebf	2023-03-12 00:00:00	7fecb47e-dab1-4728-9225-39d03e1be405	788649c9-6439-498b-9ab9-470ef8ef1b74	\N
f6750765-0b1f-4264-9df6-f2286df1724b	2023-03-12 00:00:00	6f4c19a1-4600-4663-a94c-cf67d78b2552	33a3d1f3-d8b4-4c15-8c93-0f9d79fc5bde	\N
f687c1d0-b38f-4ae3-888c-41e7af28d23a	2023-03-12 00:00:00	81c84d7a-156c-45d4-aff1-139f0c7fe186	28bf829b-766b-4911-800f-184605b915d1	\N
faa6118f-3a58-4596-a822-c69ffe1390b1	2023-03-12 00:00:00	d9fe09c4-c6e4-4721-a657-9a586caf51a2	319f2c5e-4bd4-41d1-a2ce-681cd1ddbc2c	\N
fc860d89-0a6b-41f0-9ec4-99fbe4fffa49	2023-03-12 00:00:00	af80f9e4-c919-4d3d-9960-ed15698cc1e6	9ef566f3-ea0a-45b4-bedd-da0d2012f695	\N
fd78b075-67c3-4573-9e3f-41c8535b42d8	2023-03-12 00:00:00	e2d35608-6c81-4129-9c2d-4e0bec5770ba	4ae9bb60-1277-4ab8-9bbe-67efdbb1867e	\N
ffb8e221-f6e1-46cc-b1c4-35fc7df42eac	2023-03-12 00:00:00	bf9f3791-98a5-4a1b-bd45-e8ce6ee1467e	ea0f75bd-223e-427a-bff4-1a39d885cf8b	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
00f52ac6-030d-4877-b483-648e21dda3e8	0	1	\N	\N	17d04d11-a26f-42d9-a404-024751c8963f	\N
012c5e26-af85-4d40-ae2a-9cdcbb9b028f	0	1	\N	\N	b7b41beb-e263-4d56-b0da-d618134756e1	\N
02cf7751-da07-4a77-9171-0e5c8b2b5002	0	2	\N	\N	d4ad3d67-4c96-47ac-a1d2-a16d8a89c730	\N
05c1df15-7506-4fcd-85fc-adf8f05d9abf	0	2	\N	\N	3705f957-cc3e-41f8-88cf-506ec6815115	\N
0680ac0e-1da8-4c92-8568-fe425df4173a	0	1	\N	\N	128f5742-5303-43ad-96dc-de2f8ac612c7	\N
077d2c6b-06f9-4ebf-8430-841400a8e143	0	3	\N	\N	ffb8e221-f6e1-46cc-b1c4-35fc7df42eac	\N
07b365a6-280f-4886-a023-21befceaac98	0	1	\N	\N	d4ad3d67-4c96-47ac-a1d2-a16d8a89c730	\N
09074f37-c931-4fd0-97a5-922bead84884	0	1	\N	\N	f57e55ee-296b-436a-baff-546d0b1d8ebf	\N
09d3233a-5c5d-4169-9255-b3c5b67e22da	0	3	\N	\N	d4ad3d67-4c96-47ac-a1d2-a16d8a89c730	\N
0a70a141-8379-4fe6-835f-ee759bf2ad13	0	3	\N	\N	3705f957-cc3e-41f8-88cf-506ec6815115	\N
0a7d26fe-de34-4f3c-9dc9-bb2fa8dc93b3	0	3	\N	\N	6ad060b7-229f-4bb7-aea7-d7d84ebd2e9d	\N
0caca0ad-5bbb-4261-b695-bcce8bd82f90	0	1	\N	\N	0ecf895f-a229-4cee-98a4-c756d59da0dc	\N
0db69331-956d-4a6a-a468-81f949df4a84	0	2	\N	\N	6237985c-86d4-4a57-9d13-8a48be251c7a	\N
0e1f743e-0b28-4e8d-9ba4-56e7b9b305e6	0	2	\N	\N	4eaafe21-83cd-41eb-8301-f98eda0c6f02	\N
0e322852-178e-4797-bd75-8fa42645a91b	0	1	\N	\N	c5dde1ed-ea30-419e-964a-3d4d63774d74	\N
0e482189-66b7-434f-aab1-ae094e7561b3	0	3	\N	\N	cbea4d68-c3ee-4948-a9ff-e87bb245f384	\N
0ef3f730-1f21-4b1e-9396-895adc98e5a5	0	3	\N	\N	4d4cf173-14d0-4c78-b86b-5c9feba7d691	\N
0f858c19-af1d-42a4-9fb1-bd801f456e87	0	1	\N	\N	09e3a1c1-e3d2-44b3-a4da-cd1d2e500027	\N
0feed555-230e-4796-b7b0-417a4d1fbad6	0	1	\N	\N	eecc43c6-8299-4b2b-b5ce-c7c760067c96	\N
131882b4-1f4a-469d-b4d8-4b65c4ff7c2f	0	1	\N	\N	3fa48cea-2d92-4d0b-bd7e-14eeb96b21c9	\N
13752e24-0c0c-4263-a4c1-7f6783379cc6	0	3	\N	\N	128f5742-5303-43ad-96dc-de2f8ac612c7	\N
14ce2c3d-73d2-44e5-bc1b-1ae9b8a96d07	0	2	\N	\N	c5dde1ed-ea30-419e-964a-3d4d63774d74	\N
14fd485e-0e37-42f6-97e5-9c7166b2b2b1	0	2	\N	\N	3464cb39-ec1e-435e-868c-de66d4c36833	\N
15743212-3284-47b8-9c78-ed416fefdd12	0	3	\N	\N	f687c1d0-b38f-4ae3-888c-41e7af28d23a	\N
1583e662-3a2e-4b14-b1e5-552edcab6db0	0	1	\N	\N	43a3f94d-3e7b-42bb-8bf7-f4e5cc51a51e	\N
158ed9af-1b8f-4287-b692-13ca15b4246a	0	3	\N	\N	281f1788-c132-48b1-9b8e-519712b7ed52	\N
1690a9af-06b5-4c4c-89a3-db4650f37440	0	1	\N	\N	98a64f82-33d6-4a2c-8828-1168f6b96a62	\N
178cdaab-7f42-4776-8415-b08b16d625d0	0	3	\N	\N	a7b96447-7bad-41e9-bdc3-0ed6d30be224	\N
17c89008-7f35-4b06-99ef-c1fe66db4cbf	0	1	\N	\N	7a1b85d1-9ae6-4213-a445-9398a1368d5f	\N
18ca8d85-eb24-47b5-bc29-3fab3aef2d38	0	3	\N	\N	56de5ec6-d275-4b4b-85f6-622e62cf5ebb	\N
1a1383fe-1027-4a18-a78b-9dd0549e99b1	0	3	\N	\N	98a64f82-33d6-4a2c-8828-1168f6b96a62	\N
1cc16ae4-4c1c-4045-b77e-a446e7065e1f	0	1	\N	\N	512f149b-3b1e-42c5-b62d-9606bcdb62d9	\N
1fd6c4d1-a330-4715-8726-854542572926	0	1	\N	\N	9cb1d9b6-29f4-48dc-987a-6932f3d07899	\N
247f8f8f-b36a-4457-beaa-c81802bc3d1e	0	2	\N	\N	75d98d80-b262-493f-bc8c-5b83dd32ef2b	\N
248190ff-0a7d-4c30-9770-4c05e6af804c	0	3	\N	\N	ad55da85-b9a7-48c4-b4fd-9b8c38037f01	\N
257e5328-f62e-4b3c-8b07-12d86c4b258b	0	1	\N	\N	b283afb1-ec95-42be-905b-f8f1cd2d0ca4	\N
259c7745-8ea3-4679-896b-e0cf114f8e06	0	1	\N	\N	4eaafe21-83cd-41eb-8301-f98eda0c6f02	\N
25c29627-1a15-4a77-9d29-9f6ed10aa797	0	3	\N	\N	aef89586-f630-4939-86b2-145712039f27	\N
26c68734-c2e8-4b71-a087-3b94ab5447a5	0	1	\N	\N	cbea4d68-c3ee-4948-a9ff-e87bb245f384	\N
270b1f03-d209-4ead-a5e4-ded88d278278	0	1	\N	\N	4d4cf173-14d0-4c78-b86b-5c9feba7d691	\N
27c7f67c-87f6-4c30-8ef4-d4412f50a3a6	0	2	\N	\N	cbaea7d4-0461-4faf-8d66-4e408c991e7b	\N
27c8eb8c-9192-413c-a351-fa9a0b12a0c0	0	3	\N	\N	a3e90e6a-9e33-44ad-b37e-3e7ea4468c86	\N
27d7b2e6-f4c7-495a-be5c-77fedb6c39f9	0	1	\N	\N	156720b4-c74f-40ef-9268-a197547c8bf6	\N
2b631030-83d4-4d64-9ef8-ea2ef66d49ee	0	2	\N	\N	a3e90e6a-9e33-44ad-b37e-3e7ea4468c86	\N
2da54281-8303-4057-98e8-6f86f3b1399a	0	3	\N	\N	09e3a1c1-e3d2-44b3-a4da-cd1d2e500027	\N
2dff6ec9-27df-46b8-96f2-2fd1707d92f8	0	2	\N	\N	156720b4-c74f-40ef-9268-a197547c8bf6	\N
3218b267-f9ce-4379-83b2-7ba5de8f7e2a	0	3	\N	\N	3464cb39-ec1e-435e-868c-de66d4c36833	\N
32258921-9c5f-48a2-8392-2d98a2d65eb4	0	2	\N	\N	128f5742-5303-43ad-96dc-de2f8ac612c7	\N
332ae110-242e-4908-ac08-869a3f0db3f5	0	3	\N	\N	17d04d11-a26f-42d9-a404-024751c8963f	\N
3377de3c-bae3-4188-878b-c2b84a4f1214	0	3	\N	\N	edcfc4fd-4189-41e1-b5be-c6e86e714de8	\N
33f2f096-1dac-4db7-a4f2-d1c6e81b66ae	0	3	\N	\N	6372c395-5c88-4fb4-ac06-65eda2c5554d	\N
35dcc690-eb6d-4799-a94e-754530a421d0	0	3	\N	\N	6ca6583b-34d8-4281-9d60-3a2810c42f40	\N
37068ce8-3705-4326-b752-0eaa157d934d	0	1	\N	\N	675b00ed-ed08-43d6-90b9-e2cd988f2b92	\N
3ae2141d-e247-4710-8195-f4f4a958fafb	0	2	\N	\N	07f50ebe-1941-4aa8-b20b-9cdaaa0fb528	\N
3f9b586c-a284-43b5-90f4-77632c4d3df5	0	2	\N	\N	688a0152-5418-4d28-8107-429a4e199c38	\N
42ef85a8-4fe6-4338-9ae6-9386b20ffcb2	0	2	\N	\N	d7d575ea-a2fe-42c1-93fc-5b3819d1a595	\N
43d7853b-dfd7-4ea7-8264-deb57a0db5b1	0	3	\N	\N	6237985c-86d4-4a57-9d13-8a48be251c7a	\N
4414a819-b3b2-4052-bb98-5c2fe83842b8	0	1	\N	\N	3328e476-5aa5-4702-83ec-003040a9fa22	\N
483930b4-6380-4e8a-a8d4-cb1cfd322622	0	2	\N	\N	2da65e07-ff67-4900-8359-3f9a189c5da0	\N
48873bf4-d27c-4ad7-a7c4-c815d55409f4	0	3	\N	\N	d11cf3f0-3cfa-4df2-8de8-c3c5c47bc011	\N
48f44aba-1e6d-47ec-a466-f15c4ebc7446	0	2	\N	\N	6372c395-5c88-4fb4-ac06-65eda2c5554d	\N
4a8c3737-69a5-4853-a4e1-063143206fbd	0	2	\N	\N	04c1ccf3-4e6e-4279-bcd4-1ee274d006ae	\N
4b5d7825-ca06-4084-bc51-3c6cac94d4ec	0	2	\N	\N	d4d64ba0-5f00-477c-bf33-6d8dc28642e3	\N
4be29b6d-28d2-4f90-b334-5ec0921eb5e7	0	2	\N	\N	4359bc90-4500-418a-a199-5f48cf7434ee	\N
4e914f89-3134-4c89-99c7-8bf62083c779	0	3	\N	\N	a9a6572d-37b7-4d91-ae06-600fa79e535b	\N
5271c66a-9135-4f71-8d20-a035b6562d1e	0	3	\N	\N	7a1b85d1-9ae6-4213-a445-9398a1368d5f	\N
55f33d53-0462-4e16-ad85-4ec2f4c1066e	0	3	\N	\N	f6750765-0b1f-4264-9df6-f2286df1724b	\N
56971e8a-a214-4de5-a56a-46a050f8da37	0	1	\N	\N	6b283f50-5c7a-464d-9c04-069724e51e67	\N
5763de80-d618-439f-9139-2dbf1abae7df	0	1	\N	\N	a5349541-19e7-4f60-a227-cd410e5f865c	\N
5cfaeac8-d358-4c64-ae82-fe873ca4489c	0	3	\N	\N	891b13f9-4fd3-4081-ae20-4bc0151d1333	\N
5dce18d7-3c3d-4e50-80c5-2c8c5a398ba5	0	2	\N	\N	281f1788-c132-48b1-9b8e-519712b7ed52	\N
5e08b070-e00b-4cf4-8d20-46af93e1fc99	0	3	\N	\N	6b283f50-5c7a-464d-9c04-069724e51e67	\N
5e217c7f-66aa-4624-b5bf-4117cdc91b38	0	2	\N	\N	f57e55ee-296b-436a-baff-546d0b1d8ebf	\N
5f4a0de6-c688-44e4-93dc-1074a96814f4	0	1	\N	\N	f687c1d0-b38f-4ae3-888c-41e7af28d23a	\N
608192a2-ecfe-43ef-b30c-372811f9fb37	0	3	\N	\N	9eb1e4b0-cf2e-4409-83a4-75b4cb2c8889	\N
62765a73-b21e-4397-b994-50437d6ed9a7	0	1	\N	\N	281f1788-c132-48b1-9b8e-519712b7ed52	\N
627cd712-4bef-4144-a0ec-2cef27d583dc	0	2	\N	\N	56947f39-7e02-4ade-9164-92033a0dd8e3	\N
65976e75-f034-4b3e-bf4a-88cfa0ba677a	0	1	\N	\N	6372c395-5c88-4fb4-ac06-65eda2c5554d	\N
67db2c75-8e84-4983-bf39-4a089ca689a9	0	2	\N	\N	09e3a1c1-e3d2-44b3-a4da-cd1d2e500027	\N
686546bf-744d-4fad-802b-a739272765df	0	2	\N	\N	7a1b85d1-9ae6-4213-a445-9398a1368d5f	\N
68913d11-ae69-4a45-915b-72aa3042fcf2	0	1	\N	\N	6ca6583b-34d8-4281-9d60-3a2810c42f40	\N
6907d475-5088-4e63-8bfb-c80851ae9f73	0	2	\N	\N	d11cf3f0-3cfa-4df2-8de8-c3c5c47bc011	\N
6947bbad-447b-4dd7-a922-cc17fb6e77e0	0	2	\N	\N	ad55da85-b9a7-48c4-b4fd-9b8c38037f01	\N
69c0f49f-221d-420e-a021-f1d0ef6b22b9	0	3	\N	\N	4eaafe21-83cd-41eb-8301-f98eda0c6f02	\N
6beddb04-022e-4e26-8709-e3548e7adeb6	0	3	\N	\N	156720b4-c74f-40ef-9268-a197547c8bf6	\N
6efde6d2-fbc2-4713-bc70-4ac064899ee8	0	1	\N	\N	9267c68c-a869-46f6-9717-6d81a89adb52	\N
7031f3d4-eb11-430a-a1b6-f27542a8aecb	0	3	\N	\N	fd78b075-67c3-4573-9e3f-41c8535b42d8	\N
70a187ce-e63d-4f5e-8793-b2910df427e6	0	2	\N	\N	0ecf895f-a229-4cee-98a4-c756d59da0dc	\N
71f25c68-9ee7-434f-b691-36b737f0bd21	0	1	\N	\N	a9a6572d-37b7-4d91-ae06-600fa79e535b	\N
7468ea40-5b78-46f7-a6a6-24e220049a59	0	1	\N	\N	b51d88cf-3fb1-4acf-8b70-a06d3f18acef	\N
7692e92c-de1c-4638-8247-775ef6e2d6c0	0	2	\N	\N	fc860d89-0a6b-41f0-9ec4-99fbe4fffa49	\N
769fab7a-404a-49c6-a1ee-dfa32f7228ce	0	3	\N	\N	2da65e07-ff67-4900-8359-3f9a189c5da0	\N
77507758-d346-4b83-a316-4951115cec40	0	2	\N	\N	6ad060b7-229f-4bb7-aea7-d7d84ebd2e9d	\N
775bb502-f16f-4ca3-b9ba-37442ba84370	0	2	\N	\N	a5349541-19e7-4f60-a227-cd410e5f865c	\N
794a70b4-6d8f-465f-af5c-c63e9f9ba0f6	0	1	\N	\N	2da65e07-ff67-4900-8359-3f9a189c5da0	\N
79ff2f5a-e0c1-4c04-9a5a-062d110ebeda	0	2	\N	\N	22b53242-e26c-4c4e-84d9-e9c781f846d2	\N
7be0246b-88ac-49b7-bbf2-554a371db0c5	0	1	\N	\N	56de5ec6-d275-4b4b-85f6-622e62cf5ebb	\N
7c80c5b4-7c3a-43c8-853f-a39251d49ef7	0	3	\N	\N	4359bc90-4500-418a-a199-5f48cf7434ee	\N
7dc5d131-5112-42d9-854f-3a38fda1bce6	0	3	\N	\N	a5349541-19e7-4f60-a227-cd410e5f865c	\N
8054af2a-02fb-4e67-ba16-a4547ea81c2d	0	3	\N	\N	43a3f94d-3e7b-42bb-8bf7-f4e5cc51a51e	\N
80554902-5013-45fe-85e2-ae5d9645a96c	0	2	\N	\N	5b0e16f5-4094-429e-a9ba-2afd0dd41507	\N
84cbc0db-6fca-4d8d-8466-2294482ae56b	0	1	\N	\N	56947f39-7e02-4ade-9164-92033a0dd8e3	\N
87a3d2b3-a296-4da9-a1c6-2c225c5a0757	0	3	\N	\N	eecc43c6-8299-4b2b-b5ce-c7c760067c96	\N
87aef4ba-dfc8-46d2-9db2-25d75af9ae46	0	2	\N	\N	ffb8e221-f6e1-46cc-b1c4-35fc7df42eac	\N
8874d050-0f6a-4465-87da-17a7bad94772	0	2	\N	\N	675b00ed-ed08-43d6-90b9-e2cd988f2b92	\N
8d67160b-d29e-432f-9e7e-0eb6dac9728b	0	2	\N	\N	4d4cf173-14d0-4c78-b86b-5c9feba7d691	\N
9045da29-ade8-41e2-837e-7a6bcdf89bc2	0	3	\N	\N	512f149b-3b1e-42c5-b62d-9606bcdb62d9	\N
964a751d-1488-4dbe-9016-a081ee86563d	0	1	\N	\N	3464cb39-ec1e-435e-868c-de66d4c36833	\N
983a0578-5663-4a74-a142-4dffdf5b1e4e	0	1	\N	\N	993e8f75-31ef-4170-a85e-343da3953de4	\N
98df5d96-3280-485d-9eb4-b28e49527df1	0	2	\N	\N	cbea4d68-c3ee-4948-a9ff-e87bb245f384	\N
98efa364-19e4-4792-a460-a1f4bd44fdf0	0	1	\N	\N	04c1ccf3-4e6e-4279-bcd4-1ee274d006ae	\N
9a2938dc-8406-4865-9465-f1bc125553ce	0	1	\N	\N	aef89586-f630-4939-86b2-145712039f27	\N
9a5289d1-78e7-4814-9d59-64e5ae9988c3	0	1	\N	\N	a6397be2-93aa-4e9f-96ba-6514579b7e22	\N
9d55c067-6972-43ae-bc0b-45f44d743774	0	3	\N	\N	688a0152-5418-4d28-8107-429a4e199c38	\N
9e7d5bd1-d1a5-4d6e-906b-11de19267855	0	3	\N	\N	178c7235-a9b5-472e-8281-6d6ec66f13aa	\N
9f0f2cfc-1672-42a0-a1a3-8e3a5a43b874	0	3	\N	\N	b7b41beb-e263-4d56-b0da-d618134756e1	\N
9f1ab92b-acdf-451d-b69a-a879b885c2b5	0	3	\N	\N	faa6118f-3a58-4596-a822-c69ffe1390b1	\N
9f7751ed-9f15-43cf-a2b2-44862a07a1f4	0	1	\N	\N	07f50ebe-1941-4aa8-b20b-9cdaaa0fb528	\N
9fe5ad56-4ac7-4cb0-b9da-bbf9ae6b9732	0	2	\N	\N	43a3f94d-3e7b-42bb-8bf7-f4e5cc51a51e	\N
a65d3869-2a6f-4fab-afb8-6e3ea0d84787	0	1	\N	\N	6ad060b7-229f-4bb7-aea7-d7d84ebd2e9d	\N
a6776ee8-4754-4c2c-82c0-865f5c5567bd	0	1	\N	\N	9eb1e4b0-cf2e-4409-83a4-75b4cb2c8889	\N
a740e869-639e-4471-9f7b-0e63d060052c	0	3	\N	\N	993e8f75-31ef-4170-a85e-343da3953de4	\N
a77be680-5414-4e42-8acc-b80b4f455d69	0	1	\N	\N	fc860d89-0a6b-41f0-9ec4-99fbe4fffa49	\N
a88bbec5-7709-49d9-8da9-792dc2ec1e32	0	2	\N	\N	b7b41beb-e263-4d56-b0da-d618134756e1	\N
a89220b5-f01a-4db7-b9f2-37483ebbdfaa	0	3	\N	\N	675b00ed-ed08-43d6-90b9-e2cd988f2b92	\N
a9123b43-7915-431f-a8d1-e57ac97e7689	0	2	\N	\N	fd78b075-67c3-4573-9e3f-41c8535b42d8	\N
a99212b9-b207-4343-acbf-915d30edbd9b	0	1	\N	\N	891b13f9-4fd3-4081-ae20-4bc0151d1333	\N
ac990731-068a-4a7b-9db3-fab8d0a4794e	0	3	\N	\N	cbaea7d4-0461-4faf-8d66-4e408c991e7b	\N
acc5df67-abe0-4511-b5a9-5c07663a5f97	0	1	\N	\N	d4d64ba0-5f00-477c-bf33-6d8dc28642e3	\N
ad9d306c-9508-4bd6-9232-81d51c843278	0	3	\N	\N	d4d64ba0-5f00-477c-bf33-6d8dc28642e3	\N
afb4de8b-0313-459b-bb9c-57f2f5e4774f	0	3	\N	\N	6a80e9f5-4ce6-4862-8aa1-3cfbe4e4f35b	\N
b01aac59-9772-4039-90b5-c7088b93cedd	0	3	\N	\N	d7d575ea-a2fe-42c1-93fc-5b3819d1a595	\N
b0279798-ef0e-4cff-9bb5-77b709a817f3	0	1	\N	\N	178c7235-a9b5-472e-8281-6d6ec66f13aa	\N
b0d13948-877b-4abc-8524-8050bf7a368e	0	2	\N	\N	edcfc4fd-4189-41e1-b5be-c6e86e714de8	\N
b1a299cc-efb4-478c-a9af-4883d2d98959	0	2	\N	\N	58f03a1a-e59f-460c-8d33-dd782c4c8dbc	\N
b204d3a9-1634-466a-985e-7322c99895aa	0	2	\N	\N	56de5ec6-d275-4b4b-85f6-622e62cf5ebb	\N
b25dd263-51d9-41c6-acdd-40f03f452b10	0	2	\N	\N	a9a6572d-37b7-4d91-ae06-600fa79e535b	\N
b262c3a6-082d-4343-aebf-8b7cfa3aa225	0	3	\N	\N	bcd0fd52-596d-4300-9904-a23400abecb2	\N
b77a0c93-55d6-42c6-aa56-48a8a86213c9	0	1	\N	\N	d7d575ea-a2fe-42c1-93fc-5b3819d1a595	\N
b860e113-c913-4cff-897e-47d4d19fd43f	0	2	\N	\N	b283afb1-ec95-42be-905b-f8f1cd2d0ca4	\N
b8a7bfa4-5b0e-44b2-bbef-263cbd5fca25	0	3	\N	\N	f57e55ee-296b-436a-baff-546d0b1d8ebf	\N
b971a8b3-3a5d-4568-9e7b-17b0e16f9b41	0	2	\N	\N	6b283f50-5c7a-464d-9c04-069724e51e67	\N
bad144e6-d279-412f-8139-daf803471c32	0	1	\N	\N	edcfc4fd-4189-41e1-b5be-c6e86e714de8	\N
bc37b698-2205-4de3-8e34-60192c9507af	0	3	\N	\N	fc860d89-0a6b-41f0-9ec4-99fbe4fffa49	\N
bccfe3ef-fdb2-435d-896a-559bb2a3bdd0	0	1	\N	\N	4359bc90-4500-418a-a199-5f48cf7434ee	\N
be0d2a10-6d4a-4d4f-9396-547d274fa8c9	0	1	\N	\N	ad55da85-b9a7-48c4-b4fd-9b8c38037f01	\N
be82d1e8-414c-4cb7-95b3-ad838dbbca91	0	1	\N	\N	22b53242-e26c-4c4e-84d9-e9c781f846d2	\N
bfe20842-8563-49af-8a05-e6f5fd575232	0	2	\N	\N	98a64f82-33d6-4a2c-8828-1168f6b96a62	\N
bffb06ee-089a-4fda-a5c9-ad50b442ad02	0	2	\N	\N	3fa48cea-2d92-4d0b-bd7e-14eeb96b21c9	\N
c1648e58-dd5f-4399-9d9d-9d2cb273b559	0	1	\N	\N	cbaea7d4-0461-4faf-8d66-4e408c991e7b	\N
c1b0f9fb-51c8-4804-ad5c-b948e190a08e	0	2	\N	\N	993e8f75-31ef-4170-a85e-343da3953de4	\N
c224f055-c9c2-444f-b49f-f11c87c8cf5d	0	1	\N	\N	d11cf3f0-3cfa-4df2-8de8-c3c5c47bc011	\N
c2e0223e-039f-4400-adf2-55e243a7d7bb	0	3	\N	\N	58f03a1a-e59f-460c-8d33-dd782c4c8dbc	\N
c30845cd-d095-4613-a441-b03e2e77485c	0	1	\N	\N	c333ab97-0bc3-4989-8bc0-c93d1906e73e	\N
c3867363-79f5-4f90-ac0b-4ee5980354b0	0	2	\N	\N	b51d88cf-3fb1-4acf-8b70-a06d3f18acef	\N
c5ea6a37-01f1-4183-8edf-3b6496410e77	0	2	\N	\N	c333ab97-0bc3-4989-8bc0-c93d1906e73e	\N
c82605a0-7728-48ea-95d2-610c6858bb0f	0	1	\N	\N	a3e90e6a-9e33-44ad-b37e-3e7ea4468c86	\N
cc020909-82e1-41ac-b939-b9437e605563	0	1	\N	\N	bcd0fd52-596d-4300-9904-a23400abecb2	\N
cc80cfed-bec4-4c66-bb40-10a386d7fc4a	0	1	\N	\N	75d98d80-b262-493f-bc8c-5b83dd32ef2b	\N
cd6eaffc-fba7-4b85-98f4-29eb76974e33	0	1	\N	\N	688a0152-5418-4d28-8107-429a4e199c38	\N
ce122897-ff80-4498-9512-1d6b027c589a	0	3	\N	\N	75d98d80-b262-493f-bc8c-5b83dd32ef2b	\N
d3353b85-38bb-4244-8d74-415b6b808b2e	0	2	\N	\N	6a80e9f5-4ce6-4862-8aa1-3cfbe4e4f35b	\N
d33a1e31-018a-4038-b9e5-f2b153e89df0	0	2	\N	\N	891b13f9-4fd3-4081-ae20-4bc0151d1333	\N
d37e7935-2aa0-43da-9aae-16ce09c480f4	0	2	\N	\N	aef89586-f630-4939-86b2-145712039f27	\N
d4173bec-d850-4adf-b249-80f4b88fc04c	0	1	\N	\N	6237985c-86d4-4a57-9d13-8a48be251c7a	\N
d58cbd86-56ff-4ded-9132-28801e1c24ba	0	1	\N	\N	3705f957-cc3e-41f8-88cf-506ec6815115	\N
d648706f-e440-489a-9dd8-d07e115c694c	0	3	\N	\N	5b0e16f5-4094-429e-a9ba-2afd0dd41507	\N
d9d7f46d-b1a5-4505-a750-ea3a12be3a51	0	2	\N	\N	f687c1d0-b38f-4ae3-888c-41e7af28d23a	\N
da9c6f9f-fc82-4ad0-beb9-5851b272b681	0	1	\N	\N	faa6118f-3a58-4596-a822-c69ffe1390b1	\N
dabddd25-0e9c-4fd6-8714-b7171f12cd98	0	3	\N	\N	b51d88cf-3fb1-4acf-8b70-a06d3f18acef	\N
e2300679-78e3-478f-a09d-8f58b4bfddd4	0	1	\N	\N	fd78b075-67c3-4573-9e3f-41c8535b42d8	\N
e580ecf9-677e-4886-87e3-20500ff8769c	0	1	\N	\N	f6750765-0b1f-4264-9df6-f2286df1724b	\N
e6202f85-dde4-4b37-aaed-21a989c1f431	0	3	\N	\N	3fa48cea-2d92-4d0b-bd7e-14eeb96b21c9	\N
e7c698cf-c72f-4bc5-941a-583f0f3cbf5e	0	2	\N	\N	a6397be2-93aa-4e9f-96ba-6514579b7e22	\N
e90fba2c-3286-4057-8800-01813aff6f22	0	2	\N	\N	178c7235-a9b5-472e-8281-6d6ec66f13aa	\N
ea531da7-d299-41ba-a701-8fef4a422399	0	3	\N	\N	0ecf895f-a229-4cee-98a4-c756d59da0dc	\N
ea78d805-6586-41d0-8989-fab984d8b893	0	2	\N	\N	9267c68c-a869-46f6-9717-6d81a89adb52	\N
ea90cd36-83b9-4981-a5c6-840c5689bae3	0	2	\N	\N	bcd0fd52-596d-4300-9904-a23400abecb2	\N
eacc56b3-230d-4182-83c9-ce3a52369c5d	0	1	\N	\N	6a80e9f5-4ce6-4862-8aa1-3cfbe4e4f35b	\N
eba9715c-633e-4c63-9e54-fc590bce31ab	0	3	\N	\N	9cb1d9b6-29f4-48dc-987a-6932f3d07899	\N
ebb6a72d-3d6e-4533-92fe-dbaf242f8e1c	0	2	\N	\N	17d04d11-a26f-42d9-a404-024751c8963f	\N
ecfb19e7-7443-491a-967a-941d4548248a	0	1	\N	\N	a7b96447-7bad-41e9-bdc3-0ed6d30be224	\N
eda55d18-05cb-4a18-851e-be5b28ed2824	0	2	\N	\N	6ca6583b-34d8-4281-9d60-3a2810c42f40	\N
f24811b8-c730-489d-93e7-7c7c07ae6192	0	2	\N	\N	512f149b-3b1e-42c5-b62d-9606bcdb62d9	\N
f3d66134-07d3-4271-bee1-a9e122d781b0	0	2	\N	\N	f6750765-0b1f-4264-9df6-f2286df1724b	\N
f44c132b-95e5-484f-8ffd-6aa0a0341178	0	3	\N	\N	22b53242-e26c-4c4e-84d9-e9c781f846d2	\N
f4d459dc-c1d2-4735-9b28-ae8ecfe0bde6	0	2	\N	\N	faa6118f-3a58-4596-a822-c69ffe1390b1	\N
f592c87f-736b-41c5-ad6e-3e724a39e3fe	0	1	\N	\N	ffb8e221-f6e1-46cc-b1c4-35fc7df42eac	\N
f62aac78-0f54-438f-8716-fdf0334f8db3	0	3	\N	\N	c333ab97-0bc3-4989-8bc0-c93d1906e73e	\N
f66d558c-de05-4ce7-b105-b7c4c223a439	0	3	\N	\N	3328e476-5aa5-4702-83ec-003040a9fa22	\N
f6be7517-d169-459c-91ec-8aca96138dc5	0	3	\N	\N	9267c68c-a869-46f6-9717-6d81a89adb52	\N
f73f7fd7-a13d-403b-9964-833c22f40588	0	3	\N	\N	c5dde1ed-ea30-419e-964a-3d4d63774d74	\N
f7b5d4d2-1d72-4c47-99a9-915d64c6c41d	0	3	\N	\N	56947f39-7e02-4ade-9164-92033a0dd8e3	\N
f9f47a5c-fe52-43cf-b80a-e4a3e0d6f97f	0	3	\N	\N	07f50ebe-1941-4aa8-b20b-9cdaaa0fb528	\N
fb93dd77-5a0a-4d38-96e3-9c0d7bcc9570	0	2	\N	\N	a7b96447-7bad-41e9-bdc3-0ed6d30be224	\N
fb965008-2ed5-424b-904f-59c2c0ec1e6e	0	2	\N	\N	eecc43c6-8299-4b2b-b5ce-c7c760067c96	\N
fc0f2001-2d7e-4707-b7b4-e2d3bc4374ac	0	2	\N	\N	3328e476-5aa5-4702-83ec-003040a9fa22	\N
fd06185b-ddaf-4fdf-a210-91b65e0b2115	0	1	\N	\N	58f03a1a-e59f-460c-8d33-dd782c4c8dbc	\N
fd3428c2-4e72-4885-87dc-2e9c5dc2661a	0	2	\N	\N	9eb1e4b0-cf2e-4409-83a4-75b4cb2c8889	\N
fdaadb83-abd4-4009-9147-266148e42525	0	1	\N	\N	5b0e16f5-4094-429e-a9ba-2afd0dd41507	\N
fe357177-ab85-4e2e-8378-dc5717dfefc3	0	3	\N	\N	b283afb1-ec95-42be-905b-f8f1cd2d0ca4	\N
fe528afe-f403-4b04-a0f6-d3a1b34c832c	0	3	\N	\N	a6397be2-93aa-4e9f-96ba-6514579b7e22	\N
ff293b4e-6cdf-4000-afdf-e0eb064cbb7a	0	3	\N	\N	04c1ccf3-4e6e-4279-bcd4-1ee274d006ae	\N
ff3c65fe-f0a7-4214-bdf6-23c3b181bc3c	0	2	\N	\N	9cb1d9b6-29f4-48dc-987a-6932f3d07899	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0b5d1504-5b6e-45a8-ae33-ff6506d1c004	58	900	t	f	a5d61a80-f866-4e41-bfee-a2a0f5c5d9fa	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
0ef500a1-312a-4e9c-9c0f-4b6f2ade2117	55	400	t	f	d6c63e3d-8771-41ca-a4ad-74e7f2c32b15	66c4dcfd-913e-4000-9a04-3ed4e5fc64d8	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
11513146-f7e4-4c7e-a59e-c0c1418f145c	54	400	t	f	a722b88d-51e9-4347-9337-ad992a0c0cc9	0566b266-ad4b-4f90-a215-11081718a9be	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
211b2325-c742-4e58-9870-d7e945f4c77d	48	1900	t	f	8af51c82-df07-477c-bc1c-aa9d47dde3c3	15e384e7-e052-44f8-b1b1-e7d606770032	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
231f83ca-a1aa-45cf-b41e-153078851ad3	56	400	t	f	bc75b8c3-eadb-4c14-9870-d5996fe62df4	44b3824a-2384-4516-85e1-d75cf76164eb	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
24bb71b5-dd0f-48f4-907b-bedd9deb6f9f	54	400	t	f	ec3206c3-0d87-465f-9d87-6bea1cf4e0dd	0566b266-ad4b-4f90-a215-11081718a9be	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
289bb7a7-21e7-488b-9fe4-a0e021269608	58	900	t	f	b8380205-b32f-4599-822c-cd5dc80eb2fe	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
29e654f3-ac1e-450b-a21d-fbb6ec7c75f8	39	280	t	f	70a8de2b-bcb2-4ee2-b1ab-0101001face1	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
2f37a281-5d2c-44b5-893d-1cd0cd5fbede	39	280	t	f	0857d82c-9250-4ecb-8185-2391cf58d7e7	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
3114b0b5-2978-4069-ba76-d252dbed7391	2	1880	t	f	5570a672-25fa-495b-ab2d-a64c33e846eb	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
32e94cec-05d8-454b-b288-d8670cac4637	39	280	t	f	b8380205-b32f-4599-822c-cd5dc80eb2fe	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
43eece0e-d9f5-4223-8a21-d34f4270341b	52	1200	t	f	03344a7b-afbf-4e36-9c6d-2212ab3d70e9	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
49d94f70-2445-40ae-8e31-25e0f645dc50	39	280	t	f	a722b88d-51e9-4347-9337-ad992a0c0cc9	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
4bd10c0d-78c9-43fb-aad1-7aa13b71a991	1	1900	t	f	f2e3cbb1-bae2-4605-a57a-8f6165f580e5	1da68964-3cb7-46b0-80fc-fad05eb0e528	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
52e96ed7-39ab-4576-ba76-296ff05e8f9a	18	4000	t	f	a722b88d-51e9-4347-9337-ad992a0c0cc9	7628e6de-51dc-4c15-9cb1-cacec645f923	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
569977e4-7333-42f1-bebd-be9fe680dd54	52	1200	t	f	9e7dc924-8cbf-4c19-a1ee-0cec5193efab	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
5ffb946f-3a42-4434-9def-e26f8c480e1f	39	280	t	f	c3052880-6a90-4a9b-a92a-fbd534f035d6	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
64aa84e6-4493-4f74-98f7-27ca42c46829	39	280	t	f	0941e9a7-2046-4df1-a5b9-adf650c4dfd5	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
65eb47ba-e7b9-4322-a2a4-bf7a4d59147b	48	1900	t	f	8af85f09-9bf6-42f9-9024-51f27799885d	15e384e7-e052-44f8-b1b1-e7d606770032	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
6812433a-89cf-437c-a307-c7bc5850380b	56	400	t	f	0857d82c-9250-4ecb-8185-2391cf58d7e7	44b3824a-2384-4516-85e1-d75cf76164eb	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
6a8506dd-d1e3-46d2-84a7-8ad3f76adc6e	58	900	t	f	bc75b8c3-eadb-4c14-9870-d5996fe62df4	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
6c82edfe-031f-4ae9-92ad-3a1c70e74cc5	2	1880	t	f	75564e86-be8d-4b1d-b608-c5c683497bce	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
6db3d9bd-e108-4dfb-935d-e9e46a9d69b2	57	400	t	f	e3f25ba9-1733-4f47-84c1-964695c5f160	7abf0911-9da5-4a7c-a104-8616816a5f1f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
6f4c19a1-4600-4663-a94c-cf67d78b2552	18	4000	t	f	0857d82c-9250-4ecb-8185-2391cf58d7e7	7628e6de-51dc-4c15-9cb1-cacec645f923	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
743a58e3-f0b6-47f0-86ca-0e8f3102d6cb	2	1880	t	f	f2e3cbb1-bae2-4605-a57a-8f6165f580e5	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
759790bc-999b-4b8c-9b18-fbd1ca62ca9d	48	1900	t	f	c741d449-505f-4259-b7ad-75b2f022a1e8	15e384e7-e052-44f8-b1b1-e7d606770032	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
79926a4f-709c-4980-83c2-057e3245b94d	2	1880	t	f	c633d5e0-43a4-4298-a15a-f2cbafd15081	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
7a07eb4c-ab1a-46a1-8116-ae1cf4e6e90f	1	1900	t	f	5570a672-25fa-495b-ab2d-a64c33e846eb	1da68964-3cb7-46b0-80fc-fad05eb0e528	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
7a827cbc-b53a-4308-b9b6-9155dd137359	39	280	t	f	aab6a093-106a-4337-ac86-fe705dd80cc8	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
7f3ae17a-8cb6-43e4-b103-9a1a7f33d3d9	18	4000	t	f	0941e9a7-2046-4df1-a5b9-adf650c4dfd5	7628e6de-51dc-4c15-9cb1-cacec645f923	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
7f8751fb-6d92-42c3-b9f5-e28813ec3bd9	39	280	t	f	a5d61a80-f866-4e41-bfee-a2a0f5c5d9fa	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
7fecb47e-dab1-4728-9225-39d03e1be405	55	400	t	f	602d5cbf-ba17-480f-9681-c0fb4f8c0ec7	66c4dcfd-913e-4000-9a04-3ed4e5fc64d8	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
81c84d7a-156c-45d4-aff1-139f0c7fe186	39	280	t	f	ec3206c3-0d87-465f-9d87-6bea1cf4e0dd	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
82988cd0-414a-479a-b194-36f1b7e491d9	2	1880	t	f	00760a15-182e-4128-a70f-be8d781d5cde	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
8624bcdf-7e53-46b7-bc01-e10e850c9613	39	280	t	f	8af51c82-df07-477c-bc1c-aa9d47dde3c3	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
86d7e874-1ced-4a2e-8d5a-a51eb5aec302	2	1880	t	f	b1714609-26dd-453f-9421-1cbc17dc99c7	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
8d08dd10-0cd1-4f77-83a8-3fdd9320a248	58	900	t	f	d6c63e3d-8771-41ca-a4ad-74e7f2c32b15	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
8e8bceb7-fb1a-4e9f-954a-e9afee177970	56	400	t	f	0941e9a7-2046-4df1-a5b9-adf650c4dfd5	44b3824a-2384-4516-85e1-d75cf76164eb	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
90b5f196-78fc-4ded-b324-5f7ed1204775	18	4000	t	f	ec3206c3-0d87-465f-9d87-6bea1cf4e0dd	7628e6de-51dc-4c15-9cb1-cacec645f923	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
92c4e9cc-5593-4753-b1b4-273f0835b69f	58	900	t	f	602d5cbf-ba17-480f-9681-c0fb4f8c0ec7	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
9651602b-523c-42f6-9b27-d14aaf60009e	1	1900	t	f	d360d32e-40e0-4ec4-9ded-45504428801d	1da68964-3cb7-46b0-80fc-fad05eb0e528	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
983560c2-3207-4ec8-804c-c5c97a1b3d59	57	400	t	f	2f34493a-e00b-4d7e-8816-e8b698edb136	7abf0911-9da5-4a7c-a104-8616816a5f1f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
a7b398b5-7244-49fb-849b-217217722925	2	1880	t	f	70da823a-76ad-4fd6-9b9c-425cced23951	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
aec263dc-4a28-4815-bf68-32ad121ce53b	52	1200	t	f	6a720e5c-e13c-4289-a7a1-b772ed6054f9	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
af80f9e4-c919-4d3d-9960-ed15698cc1e6	58	900	t	f	70a8de2b-bcb2-4ee2-b1ab-0101001face1	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b1c29c1b-010d-45ae-ae36-e39cf45f6d98	57	400	t	f	b8380205-b32f-4599-822c-cd5dc80eb2fe	7abf0911-9da5-4a7c-a104-8616816a5f1f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b3c11ca2-7552-4a18-8911-f9eb6dd66f03	18	4000	t	f	5187b57d-3c1c-4f90-886c-0075b20331aa	7628e6de-51dc-4c15-9cb1-cacec645f923	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b636bf02-7672-4515-b418-f444719c34d2	58	900	t	f	2f34493a-e00b-4d7e-8816-e8b698edb136	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b668365d-45dc-4ffe-95f3-3029cdb18f2d	52	1200	t	f	8bd2e5c7-eae4-4a8e-bc44-c9aecc5166dc	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b6baaa99-c25e-4551-ae7f-030fbaa870e7	48	1900	t	f	a04ca5b7-69d4-4b1d-976e-80cf30f391db	15e384e7-e052-44f8-b1b1-e7d606770032	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b7b22d31-f938-48c8-944d-ba0879acaea0	57	400	t	f	bc75b8c3-eadb-4c14-9870-d5996fe62df4	7abf0911-9da5-4a7c-a104-8616816a5f1f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
b8507a7f-d606-4f4c-b4c1-9b476cf9c38d	54	400	t	f	602d5cbf-ba17-480f-9681-c0fb4f8c0ec7	0566b266-ad4b-4f90-a215-11081718a9be	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
bf9f3791-98a5-4a1b-bd45-e8ce6ee1467e	39	280	t	f	8af85f09-9bf6-42f9-9024-51f27799885d	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
c5a23c94-0729-47af-9802-ed41a530efbd	54	400	t	f	d6c63e3d-8771-41ca-a4ad-74e7f2c32b15	0566b266-ad4b-4f90-a215-11081718a9be	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
c5b3ed8a-5639-439a-beec-ec86fe9d4d79	58	900	t	f	0857d82c-9250-4ecb-8185-2391cf58d7e7	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
ce44472b-8167-48c5-a42e-40872cc190e3	58	900	t	f	ec3206c3-0d87-465f-9d87-6bea1cf4e0dd	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
cedca0a9-a273-4e02-81a5-66ac4122d444	39	280	t	f	e3f25ba9-1733-4f47-84c1-964695c5f160	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
d12d4ce4-a9ca-4cce-b4e5-c6063df463e7	18	4000	t	f	a43e9e84-152d-4f95-9d48-3e1a90d755d9	7628e6de-51dc-4c15-9cb1-cacec645f923	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
d1ceb1ae-28a0-4136-9f2b-de0485872230	55	400	t	f	a5d61a80-f866-4e41-bfee-a2a0f5c5d9fa	66c4dcfd-913e-4000-9a04-3ed4e5fc64d8	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
d9fe09c4-c6e4-4721-a657-9a586caf51a2	1	1900	t	f	c633d5e0-43a4-4298-a15a-f2cbafd15081	1da68964-3cb7-46b0-80fc-fad05eb0e528	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
dde3e40a-a093-41b3-986f-6e768ef51cba	2	1880	t	f	d360d32e-40e0-4ec4-9ded-45504428801d	4d5a9463-8521-4c42-82a5-37e83322888f	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
e2d35608-6c81-4129-9c2d-4e0bec5770ba	58	900	t	f	a722b88d-51e9-4347-9337-ad992a0c0cc9	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
e4d1733d-b053-4f54-9fb8-16252effed6b	56	400	t	f	2f34493a-e00b-4d7e-8816-e8b698edb136	44b3824a-2384-4516-85e1-d75cf76164eb	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
e6fe7ff1-e0c9-498a-a2fa-51b6016b84aa	52	1200	t	f	92983fbf-e1d3-49fa-889d-4f34fe8f55d9	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
ea6de8da-8d85-4007-b3ee-a84024d77054	58	900	t	f	0941e9a7-2046-4df1-a5b9-adf650c4dfd5	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
eec68f2c-7b3e-43bd-a3a9-801ceb9428ba	55	400	t	f	70a8de2b-bcb2-4ee2-b1ab-0101001face1	66c4dcfd-913e-4000-9a04-3ed4e5fc64d8	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
f3c79286-33e0-4d3b-aa69-72deac2b1382	52	1200	t	f	37d67915-e663-4e4f-821e-4e7100698ee2	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
ffe12ffc-6618-473f-b2be-fb04a63b17b3	58	900	t	f	e3f25ba9-1733-4f47-84c1-964695c5f160	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N	8764f911-95b4-4260-af3f-2678281a686d	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
03a3a410-1723-4067-9994-e5bc9bf0b3fc	58	Инструкция 58	58
0566b266-ad4b-4f90-a215-11081718a9be	54	Инструкция 54	54
15e384e7-e052-44f8-b1b1-e7d606770032	48	Инструкция 48	48
1da68964-3cb7-46b0-80fc-fad05eb0e528	1	Инструкция 1	1
44b3824a-2384-4516-85e1-d75cf76164eb	56	Инструкция 56	56
4d5a9463-8521-4c42-82a5-37e83322888f	2	Инструкция 2	2
66c4dcfd-913e-4000-9a04-3ed4e5fc64d8	55	Инструкция 55	55
7628e6de-51dc-4c15-9cb1-cacec645f923	18	Инструкция 18	18
783184c0-83de-46fa-8f45-695f1fc3c1ef	39	Инструкция 39	39
7abf0911-9da5-4a7c-a104-8616816a5f1f	57	Инструкция 57	57
87e29328-7dae-4835-9ae8-7c646ecb18bd	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
b5d5a4ca-b85f-4aa5-8ca3-10f4360c599d	75131-2800010-70	Рама	\N	3291137
c32db9c3-a2a1-4945-83f1-b7972eeaea5d	75131-2801300-20	Поперечина рамы задняя	\N	2868425
d70e8ef5-0e82-4012-bbb3-6c0380b7cac5	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
9d9fb885-3507-4f8e-af84-f71f4f683b5c	cd828e26-65f7-47b6-8943-b710a4448228
a0dea52a-a3f9-4020-94c1-49f38d52c5c9	cd828e26-65f7-47b6-8943-b710a4448228
623d56b5-2609-43a8-9a55-b3c169063f44	2f6ff901-1474-4fce-b0f2-5a0ad9e2acb9
d361662d-daa2-4020-9757-95e625a69215	2f6ff901-1474-4fce-b0f2-5a0ad9e2acb9
5f2e079f-0a9c-4457-ba82-a95fdedf169b	5cd3b65b-4abf-4a9c-886b-06d304dade23
6c8bb001-7139-4d04-bf32-2db04182a0c0	5cd3b65b-4abf-4a9c-886b-06d304dade23
92d6638b-51cc-41af-a6f5-17a9a4d1dce1	5cd3b65b-4abf-4a9c-886b-06d304dade23
a9b5c60f-5fb3-4844-99f8-311a8ba40913	5cd3b65b-4abf-4a9c-886b-06d304dade23
c8711262-609b-4b30-ac06-931f6d917740	5cd3b65b-4abf-4a9c-886b-06d304dade23
c94465bb-dcb3-413a-9e76-33dca843edb3	5cd3b65b-4abf-4a9c-886b-06d304dade23
d6cde7d4-8f87-40f3-905b-021f1c2d2825	5cd3b65b-4abf-4a9c-886b-06d304dade23
ed902eb4-6403-4e13-848a-ace97ac93f7e	5cd3b65b-4abf-4a9c-886b-06d304dade23
a388f312-1e67-45f2-936f-6f7274722cd9	088eabaa-997c-4a8e-ba2f-4e3bef605350
65aca6d5-f147-40f8-90ee-e14a23effd1b	7bed5ce2-28c8-4d3f-a897-994f6806e463
7939def5-6a20-45ce-bbf4-8d98e63de254	5cd3b65b-4abf-4a9c-886b-06d304dade23
e442f571-ea08-4672-92ce-8927f936dc51	cd828e26-65f7-47b6-8943-b710a4448228
7e2cb7cf-aeea-4982-8252-467d9672592f	088eabaa-997c-4a8e-ba2f-4e3bef605350
71fd685d-ee65-4805-944c-4cfab44c1b6f	2f6ff901-1474-4fce-b0f2-5a0ad9e2acb9
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
9d9fb885-3507-4f8e-af84-f71f4f683b5c	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	8764f911-95b4-4260-af3f-2678281a686d	\N
a0dea52a-a3f9-4020-94c1-49f38d52c5c9	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	8764f911-95b4-4260-af3f-2678281a686d	\N
623d56b5-2609-43a8-9a55-b3c169063f44	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	8764f911-95b4-4260-af3f-2678281a686d	\N
d361662d-daa2-4020-9757-95e625a69215	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	8764f911-95b4-4260-af3f-2678281a686d	\N
5f2e079f-0a9c-4457-ba82-a95fdedf169b	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	8764f911-95b4-4260-af3f-2678281a686d	\N
6c8bb001-7139-4d04-bf32-2db04182a0c0	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	8764f911-95b4-4260-af3f-2678281a686d	\N
92d6638b-51cc-41af-a6f5-17a9a4d1dce1	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	8764f911-95b4-4260-af3f-2678281a686d	\N
a9b5c60f-5fb3-4844-99f8-311a8ba40913	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	8764f911-95b4-4260-af3f-2678281a686d	\N
c8711262-609b-4b30-ac06-931f6d917740	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	8764f911-95b4-4260-af3f-2678281a686d	\N
c94465bb-dcb3-413a-9e76-33dca843edb3	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	8764f911-95b4-4260-af3f-2678281a686d	\N
d6cde7d4-8f87-40f3-905b-021f1c2d2825	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	8764f911-95b4-4260-af3f-2678281a686d	\N
ed902eb4-6403-4e13-848a-ace97ac93f7e	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	8764f911-95b4-4260-af3f-2678281a686d	\N
a388f312-1e67-45f2-936f-6f7274722cd9	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
65aca6d5-f147-40f8-90ee-e14a23effd1b	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$QFMwOy8Wkp8KkA0SRPCIctGEyVfdWdMPi/CiDY/1uS44WD57	\N	\N	\N	\N	\N	\N
7939def5-6a20-45ce-bbf4-8d98e63de254	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$r7Sf9/7lRYSSdffiWmF1pywmHKufBM7z10pUYSto1oCm3b6x	\N	\N	\N	\N	\N	\N
e442f571-ea08-4672-92ce-8927f936dc51	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$yD1vt0czhKYt4kh1Y2JeKd4IF+lsmU6PrY4z8+9xaleGC6vp	\N	\N	\N	\N	8764f911-95b4-4260-af3f-2678281a686d	\N
7e2cb7cf-aeea-4982-8252-467d9672592f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$YT2ves4Cfp64W+ufVd+VUCI/lCErpsQocCiJj9+XIkZrVy2V	\N	\N	\N	\N	\N	\N
71fd685d-ee65-4805-944c-4cfab44c1b6f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$w6MD2IQ0EGsbhFlxFmaEqT3Dy1jAAainIABKVpuDIgK5m1la	\N	\N	\N	\N	8764f911-95b4-4260-af3f-2678281a686d	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
1674832e-618f-48b1-b5da-dc72e38e52d3	1	Заполняющий	230	270	23	26	\N	\N	66c4dcfd-913e-4000-9a04-3ed4e5fc64d8	\N
2e0b644a-8b36-454d-b9ad-5a8d950626e8	1	Заполняющий	230	270	23	26	\N	\N	03a3a410-1723-4067-9994-e5bc9bf0b3fc	\N
4099352d-be3c-4b3b-afc8-b390214a55df	1	Заполняющий	230	270	23	26	\N	\N	4d5a9463-8521-4c42-82a5-37e83322888f	\N
949aee2c-9496-4aa7-8f09-b476f88bd5f0	1	Заполняющий	230	270	23	26	\N	\N	783184c0-83de-46fa-8f45-695f1fc3c1ef	\N
9897d1cc-6476-428b-b94a-0f25031c32cd	1	Заполняющий	230	270	23	26	\N	\N	87e29328-7dae-4835-9ae8-7c646ecb18bd	\N
9e784b4d-c91f-4536-8e87-fcd59068ba12	1	Заполняющий	230	270	23	26	\N	\N	7abf0911-9da5-4a7c-a104-8616816a5f1f	\N
a905cfaf-c725-4ab8-a524-f14b81e46970	1	Заполняющий	230	270	23	26	\N	\N	1da68964-3cb7-46b0-80fc-fad05eb0e528	\N
abb3f331-d24e-448e-b89a-3e015cb08c7e	1	Заполняющий	230	270	23	26	\N	\N	7628e6de-51dc-4c15-9cb1-cacec645f923	\N
d7db8181-b264-4c62-b250-bc6a4f4577a0	1	Заполняющий	230	270	23	26	\N	\N	0566b266-ad4b-4f90-a215-11081718a9be	\N
f7b4b5c1-98ea-4f54-ae83-e01f20f43596	1	Заполняющий	230	270	23	26	\N	\N	15e384e7-e052-44f8-b1b1-e7d606770032	\N
fb6fbdf7-3185-4d93-b06d-ca3d95539491	1	Заполняющий	230	270	23	26	\N	\N	44b3824a-2384-4516-85e1-d75cf76164eb	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
40dcee9d-4dc5-4f70-b767-65966fce064a	1	Корневой	82	0.11	0.68	f	f	t	7e3a64e6-2118-4c80-938e-aa5dcb66bdc3	ca2434b1-470c-4b36-945c-cdff989a6011	\N
721ec06a-f796-43be-81e6-f739391acaf5	1	Корневой	82	0.11	0.68	f	f	t	1e372a07-fda5-42d5-9c1d-35cd76543e50	016c91c5-4d2e-48cc-bc2b-12ee60f28d1f	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
3065981c-1d91-4b4f-bc71-989bdfbaa011	0a4425c8-cb6d-42aa-8e53-696946d6b28c
3065981c-1d91-4b4f-bc71-989bdfbaa011	b9446e29-4221-431c-af3e-fdf064601380
3b278e38-c7fd-44c9-aa8a-7e8890792cf3	0a4425c8-cb6d-42aa-8e53-696946d6b28c
3b278e38-c7fd-44c9-aa8a-7e8890792cf3	b9446e29-4221-431c-af3e-fdf064601380
6dce4e37-97f0-46cf-b180-dcbc496da3fc	57034c96-c165-4469-b712-55cf65f9aabe
9c7b5806-01d0-48d8-817d-c6b0f612e0d4	57034c96-c165-4469-b712-55cf65f9aabe
9c7f56a3-f8ab-4d81-b8e0-858184492eb6	e20291a8-4cf6-433a-8e94-adb7c42fac87
b11e609c-20ef-4685-8e16-8ae702038dd8	e20291a8-4cf6-433a-8e94-adb7c42fac87
f3d7c3d9-752d-49e8-9e4f-eacbd4a917ee	0a4425c8-cb6d-42aa-8e53-696946d6b28c
f3d7c3d9-752d-49e8-9e4f-eacbd4a917ee	b9446e29-4221-431c-af3e-fdf064601380
f894acfc-a2cb-499e-b033-d16e1afa7d28	0a4425c8-cb6d-42aa-8e53-696946d6b28c
f894acfc-a2cb-499e-b033-d16e1afa7d28	b9446e29-4221-431c-af3e-fdf064601380
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
3065981c-1d91-4b4f-bc71-989bdfbaa011	92d6638b-51cc-41af-a6f5-17a9a4d1dce1	\N	146164
3b278e38-c7fd-44c9-aa8a-7e8890792cf3	6c8bb001-7139-4d04-bf32-2db04182a0c0	\N	114729
6dce4e37-97f0-46cf-b180-dcbc496da3fc	c94465bb-dcb3-413a-9e76-33dca843edb3	\N	122575
9c7b5806-01d0-48d8-817d-c6b0f612e0d4	c8711262-609b-4b30-ac06-931f6d917740	\N	132695
9c7f56a3-f8ab-4d81-b8e0-858184492eb6	5f2e079f-0a9c-4457-ba82-a95fdedf169b	\N	117390
b11e609c-20ef-4685-8e16-8ae702038dd8	d6cde7d4-8f87-40f3-905b-021f1c2d2825	\N	121267
f3d7c3d9-752d-49e8-9e4f-eacbd4a917ee	a9b5c60f-5fb3-4844-99f8-311a8ba40913	\N	150882
f894acfc-a2cb-499e-b033-d16e1afa7d28	ed902eb4-6403-4e13-848a-ace97ac93f7e	\N	150838
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
0a4425c8-cb6d-42aa-8e53-696946d6b28c	6759c63b-dbae-4928-880a-f30e88691063
0a4425c8-cb6d-42aa-8e53-696946d6b28c	9566053b-13b9-4fcf-828f-8fca985455af
0a4425c8-cb6d-42aa-8e53-696946d6b28c	bd6385d5-59fd-4ed0-ba44-b49e14e14c2b
0a4425c8-cb6d-42aa-8e53-696946d6b28c	e699da50-67e1-47d0-a3da-a83daf485c52
57034c96-c165-4469-b712-55cf65f9aabe	6759c63b-dbae-4928-880a-f30e88691063
57034c96-c165-4469-b712-55cf65f9aabe	c4ab62cc-3c05-475b-8203-e6dd87e83b7f
b9446e29-4221-431c-af3e-fdf064601380	6759c63b-dbae-4928-880a-f30e88691063
b9446e29-4221-431c-af3e-fdf064601380	9566053b-13b9-4fcf-828f-8fca985455af
b9446e29-4221-431c-af3e-fdf064601380	bd6385d5-59fd-4ed0-ba44-b49e14e14c2b
b9446e29-4221-431c-af3e-fdf064601380	e699da50-67e1-47d0-a3da-a83daf485c52
e20291a8-4cf6-433a-8e94-adb7c42fac87	1530b1b9-18c0-4e89-b095-3edbdcbb2549
e20291a8-4cf6-433a-8e94-adb7c42fac87	e699da50-67e1-47d0-a3da-a83daf485c52
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
0a4425c8-cb6d-42aa-8e53-696946d6b28c	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	49141
57034c96-c165-4469-b712-55cf65f9aabe	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	49286
b9446e29-4221-431c-af3e-fdf064601380	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	49283
e20291a8-4cf6-433a-8e94-adb7c42fac87	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	49232
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
1e372a07-fda5-42d5-9c1d-35cd76543e50	2023-03-15 19:14:38.754683	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	b9446e29-4221-431c-af3e-fdf064601380	b11e609c-20ef-4685-8e16-8ae702038dd8	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N
7e3a64e6-2118-4c80-938e-aa5dcb66bdc3	2023-03-15 19:14:38.754877	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	b9446e29-4221-431c-af3e-fdf064601380	b11e609c-20ef-4685-8e16-8ae702038dd8	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
016c91c5-4d2e-48cc-bc2b-12ee60f28d1f	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	6237985c-86d4-4a57-9d13-8a48be251c7a	b11e609c-20ef-4685-8e16-8ae702038dd8	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	86c6cd43-f255-4fbc-a36a-5ea309a65179	\N
ca2434b1-470c-4b36-945c-cdff989a6011	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	43a3f94d-3e7b-42bb-8bf7-f4e5cc51a51e	b11e609c-20ef-4685-8e16-8ae702038dd8	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	86c6cd43-f255-4fbc-a36a-5ea309a65179	\N
05078b8c-f403-4cc3-a4c3-87b9cc43471c	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4359bc90-4500-418a-a199-5f48cf7434ee	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
067158d9-13a1-4acb-9d21-705be33dc61a	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cbaea7d4-0461-4faf-8d66-4e408c991e7b	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
0a259d6e-5408-443b-8e92-c34ca4b5a242	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	56947f39-7e02-4ade-9164-92033a0dd8e3	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
0afbb74a-39e0-4157-b81e-85b5fe479436	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fc860d89-0a6b-41f0-9ec4-99fbe4fffa49	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
0e244472-4ca4-4412-9db9-e8eaffe0d588	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c5dde1ed-ea30-419e-964a-3d4d63774d74	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
10dbf9c6-962c-45ae-ba54-70a4ef0823ba	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	22b53242-e26c-4c4e-84d9-e9c781f846d2	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
10de60d2-2756-4ef1-9fb8-45a87cf31176	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	07f50ebe-1941-4aa8-b20b-9cdaaa0fb528	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
1146115a-b01f-40ad-a106-ec826cb8160f	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6a80e9f5-4ce6-4862-8aa1-3cfbe4e4f35b	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
1d94391e-db9a-4e5e-91bb-43b92f95b201	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3705f957-cc3e-41f8-88cf-506ec6815115	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
1f19d220-6d7a-4ee8-9880-cab92970d805	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a5349541-19e7-4f60-a227-cd410e5f865c	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
295d5316-6038-4caf-9445-ba45f7ee4a47	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	58f03a1a-e59f-460c-8d33-dd782c4c8dbc	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
2b28cfec-34ab-4779-8e34-43fa92293638	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3fa48cea-2d92-4d0b-bd7e-14eeb96b21c9	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
2bab9114-e9b4-4330-b94a-8f39bf1397f1	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	281f1788-c132-48b1-9b8e-519712b7ed52	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
30e6ecdd-230d-4bd9-9ce9-fdb42ca4d2ec	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ad55da85-b9a7-48c4-b4fd-9b8c38037f01	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
33f648e0-337a-414c-829d-4318a5f73a33	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a9a6572d-37b7-4d91-ae06-600fa79e535b	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
3a40e336-8f0f-48fc-a50f-13e0c13ab29b	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	675b00ed-ed08-43d6-90b9-e2cd988f2b92	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
3acb25cd-244d-4bb3-a58b-a33bce52ff71	19	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fd78b075-67c3-4573-9e3f-41c8535b42d8	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
3eb540b5-d2ec-4ac1-9312-2312011e4128	20	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	17d04d11-a26f-42d9-a404-024751c8963f	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
4775f3d1-2c6f-41be-8449-57c21f420949	21	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4eaafe21-83cd-41eb-8301-f98eda0c6f02	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
51750dc7-4c26-402f-a834-a67d04269964	22	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6b283f50-5c7a-464d-9c04-069724e51e67	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
51c0f46d-3deb-43dd-a3c6-081d866f8619	23	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c333ab97-0bc3-4989-8bc0-c93d1906e73e	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
544cd3c4-af37-490b-b542-6baf53565f2e	24	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9cb1d9b6-29f4-48dc-987a-6932f3d07899	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
55d49b31-687b-4d4b-b0bd-f97e45025386	25	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	128f5742-5303-43ad-96dc-de2f8ac612c7	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
5ccf7f24-8a80-445d-9a0b-515472fb1cf7	26	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	98a64f82-33d6-4a2c-8828-1168f6b96a62	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
613ed7da-b8df-4807-a4e3-5f2ddb22a384	27	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	178c7235-a9b5-472e-8281-6d6ec66f13aa	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
6c1f3a64-5641-4ff1-8ef3-fe0008a5ad80	28	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7a1b85d1-9ae6-4213-a445-9398a1368d5f	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
7352dd1d-f93b-4057-b4b3-c44038d4eb80	29	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a7b96447-7bad-41e9-bdc3-0ed6d30be224	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
7432cadc-aea4-4464-8f28-cc0e422e14d1	30	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bcd0fd52-596d-4300-9904-a23400abecb2	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
77a893f8-4188-4bf9-8be0-23a9d9036ecb	31	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f6750765-0b1f-4264-9df6-f2286df1724b	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
8727acf5-38bc-41e0-a81f-12f8b15ea1aa	32	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d4ad3d67-4c96-47ac-a1d2-a16d8a89c730	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
888a8f84-09fa-422e-bfb3-c10daa576b3c	33	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3464cb39-ec1e-435e-868c-de66d4c36833	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
8a8c05c6-d2d9-43f8-8d83-0a260e18de72	34	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	04c1ccf3-4e6e-4279-bcd4-1ee274d006ae	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
8bfc4eab-6c51-49b2-8ed8-d92677bd10a2	35	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b7b41beb-e263-4d56-b0da-d618134756e1	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
91996727-8e33-4c56-b92c-b4790b1c12cf	36	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6372c395-5c88-4fb4-ac06-65eda2c5554d	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
9377238f-11b1-47a6-b6b1-70e1773a011a	37	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	aef89586-f630-4939-86b2-145712039f27	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
98377ecc-5f6a-4516-92cc-5cd3291b818c	38	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	eecc43c6-8299-4b2b-b5ce-c7c760067c96	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
9ae8d425-6748-4093-88c2-6798d8164564	39	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	09e3a1c1-e3d2-44b3-a4da-cd1d2e500027	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
9d12a0c0-a9a8-48b8-98db-12ac375ab3ed	40	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cbea4d68-c3ee-4948-a9ff-e87bb245f384	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
a79712b4-e70a-414e-9821-c514a459a837	41	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a6397be2-93aa-4e9f-96ba-6514579b7e22	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
aa3f333a-85f9-4b06-843f-68cb9dabec49	42	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6ad060b7-229f-4bb7-aea7-d7d84ebd2e9d	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
abb6f27b-cc88-4b08-b021-a85a0ac1bd75	43	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	156720b4-c74f-40ef-9268-a197547c8bf6	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
b1d3bdd0-9983-4aa8-91cc-9926bca51cc7	44	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f687c1d0-b38f-4ae3-888c-41e7af28d23a	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
b2c743ad-2065-4d7d-b951-b9f55ab71840	45	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	993e8f75-31ef-4170-a85e-343da3953de4	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
b6550555-ea3d-4085-a190-d6a6064659a8	46	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6ca6583b-34d8-4281-9d60-3a2810c42f40	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
b9cb167c-ab0e-4c21-85b4-cab6dea0ceef	47	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0ecf895f-a229-4cee-98a4-c756d59da0dc	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
ba93f2b3-30b7-4241-9b71-64a04344a2c3	48	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	891b13f9-4fd3-4081-ae20-4bc0151d1333	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
bb77863a-fd59-49df-900f-a21a5596f319	49	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d4d64ba0-5f00-477c-bf33-6d8dc28642e3	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
bc695904-0d3e-4c41-880d-ac3a8336e873	50	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3328e476-5aa5-4702-83ec-003040a9fa22	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
bfbd25a8-665c-47c6-aa1d-b1b0f616c23c	51	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a3e90e6a-9e33-44ad-b37e-3e7ea4468c86	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
bffa2cf5-fe14-4fec-9382-7ffe3520509c	52	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f57e55ee-296b-436a-baff-546d0b1d8ebf	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
c115371c-9716-4ed7-89f1-49c2e38e8e2f	53	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	faa6118f-3a58-4596-a822-c69ffe1390b1	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
c487f66c-c3cc-46ea-851c-3ed1b6d79671	54	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d7d575ea-a2fe-42c1-93fc-5b3819d1a595	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
c61f36e6-cbdd-43a3-84f6-d31b931c4702	55	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b51d88cf-3fb1-4acf-8b70-a06d3f18acef	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
c7f1f620-db9c-4d6f-914a-10cd6da51cde	56	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	512f149b-3b1e-42c5-b62d-9606bcdb62d9	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
ca7f3312-d515-4367-86bc-dea2ef3477f7	57	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	43a3f94d-3e7b-42bb-8bf7-f4e5cc51a51e	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d03a6467-2619-4d35-aeb9-8d284caca44e	58	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d11cf3f0-3cfa-4df2-8de8-c3c5c47bc011	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d2c17346-c76d-473a-a97a-e61d0d82c285	59	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b283afb1-ec95-42be-905b-f8f1cd2d0ca4	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d2e5a7ed-8199-466b-9135-435c6c7bc4eb	60	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ffb8e221-f6e1-46cc-b1c4-35fc7df42eac	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d4a5ce1c-648b-4b42-a0df-a8ff47349fe3	61	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6237985c-86d4-4a57-9d13-8a48be251c7a	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d5aa16a5-43c6-450f-bdb9-22e8263583fb	62	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2da65e07-ff67-4900-8359-3f9a189c5da0	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d80c5bf0-f855-4694-bf96-8051090b61f6	63	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4d4cf173-14d0-4c78-b86b-5c9feba7d691	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d898f4e8-fb52-4f34-8ba3-69f897916471	64	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9eb1e4b0-cf2e-4409-83a4-75b4cb2c8889	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
d9bc306d-b482-4a44-8e67-6e6896de80a5	65	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	56de5ec6-d275-4b4b-85f6-622e62cf5ebb	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
dcc1371b-e2c4-400b-b010-2c1ec94ec6a1	66	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	688a0152-5418-4d28-8107-429a4e199c38	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
e9f3a2a6-fe3e-4552-b2f6-018ace2e5728	67	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	75d98d80-b262-493f-bc8c-5b83dd32ef2b	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
eb081f7d-21b8-48d7-9667-caf7d11cec07	68	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5b0e16f5-4094-429e-a9ba-2afd0dd41507	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
f0826e69-60cd-4f63-91b9-3d8f94625bde	69	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9267c68c-a869-46f6-9717-6d81a89adb52	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
ff73be38-66fd-4cd6-8342-95bba8d8c61b	70	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	edcfc4fd-4189-41e1-b5be-c6e86e714de8	\N	8ae7ce7c-bdaf-43b5-8b5b-8d9ec5d2a588	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
12406156-c9db-47b6-92ee-c1bcc80367a3	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	5e769e7a-6536-41a5-a52b-15ec0f1f6d1b	\N
53826e65-196b-43f1-b81f-793446b672aa	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	5e769e7a-6536-41a5-a52b-15ec0f1f6d1b	\N
a99f76cf-76d1-4b41-984b-d52e05b964d0	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	5e769e7a-6536-41a5-a52b-15ec0f1f6d1b	\N
06e327f8-d5aa-4fa6-b53a-efb540a3bce1	1	12:10:00	13:10:00	13:20:00	13:50:00	c4a00040-0655-4054-b142-387c4e88f3e4	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
1530b1b9-18c0-4e89-b095-3edbdcbb2549	3600	\N	8764f911-95b4-4260-af3f-2678281a686d	3600
6759c63b-dbae-4928-880a-f30e88691063	3500	\N	8764f911-95b4-4260-af3f-2678281a686d	3500
9566053b-13b9-4fcf-828f-8fca985455af	3550	\N	8764f911-95b4-4260-af3f-2678281a686d	3550
bd6385d5-59fd-4ed0-ba44-b49e14e14c2b	3690	\N	8764f911-95b4-4260-af3f-2678281a686d	3690
c4ab62cc-3c05-475b-8203-e6dd87e83b7f	3510	\N	8764f911-95b4-4260-af3f-2678281a686d	3510
e699da50-67e1-47d0-a3da-a83daf485c52	3610	\N	8764f911-95b4-4260-af3f-2678281a686d	3610
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
89734b55-e1b6-4215-ae06-d713134709aa	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 70, true);


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

