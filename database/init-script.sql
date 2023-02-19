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
e3042e59-53c5-494a-bb65-760f186344b4	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
f617d042-d804-495e-b596-959defed1033	62e41038-d951-48a6-943e-ee5ee1b5c089	5241d14c-c712-4db3-bb03-fac34803c534	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
a781a6fd-ebe4-4ee2-a763-52528f48766e	1	10	t	e3042e59-53c5-494a-bb65-760f186344b4	\N
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
0b106e3c-ef1f-475e-954c-8f0dd812b870	Работа по карте несоответствий	\N
131cd4b9-3d88-4923-9117-a422afff3d0f	Отсутствие энергоносителей	\N
30ae9dfd-ef4f-4d8e-8277-8531969dde6f	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
39336647-60e0-478c-88da-319af13d982d	Аварийный ремонт централизованными службами	\N
4616c3a7-1551-49d5-992f-2256d7e4d769	Сборочные операции	\N
46926cf4-08c2-40ce-b25a-280fcd48ead6	Обед	\N
4e1f3071-f0df-43c8-a814-e8dafff4d282	Отсутствие материала, заготовок, деталей	\N
50bbe897-8985-4374-bc5c-b13362cb1c88	Отсутствие крана, транспорта	\N
56a8473d-33e3-4ffa-b2d8-74a65d386642	Установка, выверка, снятие детали	\N
5d3e224b-8a7b-4da1-be37-b2f857fe2039	Неявка оператора (б/лист, отпуск, и пр.)	\N
5fcb8c0d-20ae-4600-95cb-3d6f735e3b45	Отсутствие оператора в связи с необеспеченностью	\N
74421330-faaa-423a-9b20-2093f9238add	Работа с управляющей программой	\N
7af66c65-8866-4ffc-b7b9-d1e2e7cbd93d	Отсутствие заданий	\N
7b73fa32-c03a-4fd0-9fce-5b152bdac970	Нерабочее время по графику согласно сменности	\N
7fb6028e-3138-4665-abf0-9a66104b5537	Праздники и выходные	\N
91271666-3128-4e44-a96d-0950b821cd31	Отсутствие конструктора, технолога или ожидание его решения	\N
92b6ac74-aa25-4d35-b609-68e20a5ba1ab	Установка, выверка, снятие детали	\N
9331883f-54d3-4cd6-ac87-391871078554	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
9e4c3b18-51f3-48c9-9d6f-afd8f6b7e967	Отсутствие сотрудника ОТК	\N
a08f7961-0a82-40ae-a91e-6577d0e81a7b	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
a735a701-734d-4d70-9609-c99766cee8ac	Ознакомление с работой, документацией, инструктаж	\N
b047ad2b-283a-4027-a336-e3dc5b32d9fa	Плановый ремонт централизованными службами	\N
c72321ca-a863-4011-a84f-0573d57e4d3d	Изменение режимов, смена инструмента, приспособления	\N
eaa5376c-5db4-453a-aa32-81828d0b8a27	Естественные надобности	\N
fd52dacd-2e4a-4d31-9ecf-33dc1c8e58bd	Контроль на рабочем месте	\N
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
12243d03-e22a-4e42-bbbf-3ac64d9c960e	27b9ccb3-02fe-493b-b9c2-5d938027cb7a	251534
bb623db9-c306-4aeb-994e-4877cc348bed	c98aab78-dc78-4a0b-86b2-8e1d10e81ed0	249550
cc5a055b-9e1d-4285-b438-2fdfeb95d18a	d4440718-128c-4bea-b0ec-18bad7990bf9	256467
61413189-f21f-4295-ab49-d74e7bc248ba	c5e03284-0e8d-4927-9acd-38a2146d01b1	235565
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
2867b482-5f62-4bee-91bb-27b1836901c2	3bad563a-da36-4c76-a832-4d1b9cf8df45	643759
2ca8f4c5-1fd0-47e5-9e6d-f634421aeb91	4aedc02c-b99e-442b-978f-582c63229686	612000
49d8374d-0902-45c5-a418-b0720f63be8a	e2bf7715-f5c8-461d-a0a0-941b0c3941a7	617215
8ad49ba8-a4ff-4c62-a33e-ae71715d2e9b	4f60278b-9d0f-407d-843f-ca7aa5c92042	614208
950feefe-8a9d-4fc6-ac2c-5e3efb1a48e4	26636d23-4e1f-410c-98b4-6216841d549b	614962
9d8fe902-9226-4a4c-9045-a7885999874b	a8a57262-dddb-461f-a083-67740d34fdd4	613668
dbb90e91-abb4-450b-89c2-4db9b2c8f84c	2eafa735-fbf4-4253-adaf-33e11b8437f6	610422
b89661a5-e641-45d5-bad5-1fb40254898b	8ce009b9-b110-4a9c-b99f-93e982d41cd3	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
33082275-3fe4-4016-b2d1-1bb2f77aa4a6	1	Пост 1	de305632-9bd4-4408-b797-f0efb62fe12c	\N
e47c0f64-2483-47d2-9b31-5e4e96253ab8	2	Пост 2	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
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
cc177019-e104-4a09-adfa-00f536c31b70	054a0196-19fe-4b23-916d-d0849028d4de
cc177019-e104-4a09-adfa-00f536c31b70	08a3c624-c15e-429b-b397-a0a5ba3d344c
27f1bbd3-8948-45a5-9030-38d64dc35b4e	1e58ba4c-f0b1-4da5-9df3-de76a7b483a5
5662be05-bfea-4d7e-92c2-d5c004451ccb	27f1bbd3-8948-45a5-9030-38d64dc35b4e
e2be188d-a029-4320-b30f-e56435824bf5	33ca1c80-96fc-4640-824c-c1b193c67190
3ca5ebdb-475c-4ce9-ab44-ee1e347521d2	3adf67f2-7298-4302-8945-5249dba36f15
556a8a68-b16f-473b-b028-b68225abdd2f	3c274554-7ae8-43b7-b765-ba33c3a2f7a3
5662be05-bfea-4d7e-92c2-d5c004451ccb	3ca5ebdb-475c-4ce9-ab44-ee1e347521d2
6b3ca911-155a-4790-9368-ad361beb8287	4dd3cf60-3526-44cd-8ba7-9958e8913641
6b3ca911-155a-4790-9368-ad361beb8287	556a8a68-b16f-473b-b028-b68225abdd2f
e2be188d-a029-4320-b30f-e56435824bf5	63519ce2-201f-4b28-8412-aa92b94f1dd2
3ca5ebdb-475c-4ce9-ab44-ee1e347521d2	80f8f440-38ef-421c-9f20-094921a7ad02
6b3ca911-155a-4790-9368-ad361beb8287	8519b9f9-31bf-4b0a-b85a-ce87cc42236d
55c5c390-d199-4bfb-9fcc-239645e81860	8bbf54aa-1bf2-4598-903e-d77c368c87be
556a8a68-b16f-473b-b028-b68225abdd2f	8d7546ca-232c-4ea0-b768-584d09fb07f5
8519b9f9-31bf-4b0a-b85a-ce87cc42236d	9592a42f-9b69-4c47-82c6-70e9d50c75fe
27f1bbd3-8948-45a5-9030-38d64dc35b4e	a7337339-71fd-4f74-9fa8-86fa7b5058e3
5662be05-bfea-4d7e-92c2-d5c004451ccb	bc0d6530-6b0a-4096-9850-bf8b44e2798e
55c5c390-d199-4bfb-9fcc-239645e81860	cc177019-e104-4a09-adfa-00f536c31b70
8519b9f9-31bf-4b0a-b85a-ce87cc42236d	d8643503-f2d7-49ee-9169-198cce2d2ebe
55c5c390-d199-4bfb-9fcc-239645e81860	e2be188d-a029-4320-b30f-e56435824bf5
55c5c390-d199-4bfb-9fcc-239645e81860	e7ca458b-134c-4072-a279-e03e95e4ceae
6b3ca911-155a-4790-9368-ad361beb8287	f4367bef-84fa-4b6b-855c-07d0f0fb41c2
5662be05-bfea-4d7e-92c2-d5c004451ccb	f5bac5a2-bed4-421e-9f00-0443e9c4bd78
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
453134d6-fa9b-4d31-b283-8356b72fa0a1	Сборка, сварка рам к/с г/п 120-130 т.	6	5241d14c-c712-4db3-bb03-fac34803c534	06
da9b74ba-921e-4f64-8b74-30eaaa809b41	Сборка, сварка узл. и рам к/с г/п 120-220т	4	5241d14c-c712-4db3-bb03-fac34803c534	04
de305632-9bd4-4408-b797-f0efb62fe12c	Сборка, сварка мостов	1	5241d14c-c712-4db3-bb03-fac34803c534	01
e65837ca-c887-4569-9fdf-c6cbf3576cb1	Производственный участок 5	5	8b49e804-2906-40d5-8a4f-98e3f9e28518	05
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
054a0196-19fe-4b23-916d-d0849028d4de	Втулка	75303-2128438	t	3	f0bcfb30-9eac-4776-8fff-5353d92534e4	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536248270
08a3c624-c15e-429b-b397-a0a5ba3d344c	Кольцо	75580-2401227	t	3	f2314aad-4a3d-4c9c-a3b4-fda47d5ea68a	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536384312
1e58ba4c-f0b1-4da5-9df3-de76a7b483a5	Проушина	7521-2401224	t	3	632e74ef-03aa-446a-b8d3-4c45d6fab386	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536274170
27f1bbd3-8948-45a5-9030-38d64dc35b4e	Кронштейн	7521-2401220	t	2	122a1965-a7a0-458a-90d0-9f9294e54580	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536273956
33ca1c80-96fc-4640-824c-c1b193c67190	Труба картера	75580-2401132-10	t	3	ac03bb98-1518-4106-8538-d8cd06530286	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536386250
3adf67f2-7298-4302-8945-5249dba36f15	Пластина	75132-2401106	t	3	f1027215-73b4-42de-a7f2-6ee736a0ddca	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536444153
3c274554-7ae8-43b7-b765-ba33c3a2f7a3	Кронштейн	75310-1183106	t	3	ae3a1f51-dd89-48c0-80bd-31050599b863	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536267485
3ca5ebdb-475c-4ce9-ab44-ee1e347521d2	Картер заднего моста	75132-2401008-50	t	2	fe71ef57-4dbd-446b-91be-e938d5bee826	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536467565
4dd3cf60-3526-44cd-8ba7-9958e8913641	Кронштейн	75211-1018162	t	3	cfe54332-6831-40c7-84ae-69c134efc2a6	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536270344
556a8a68-b16f-473b-b028-b68225abdd2f	Кронштейн	75310-1183100	t	2	5bf78a6a-c03b-4966-adc5-ac0edf145872	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536267493
55c5c390-d199-4bfb-9fcc-239645e81860	Картер заднего моста	75580-2401006	t	1	012cbbee-7dac-4b84-b41c-4be232d65820	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536384294
5662be05-bfea-4d7e-92c2-d5c004451ccb	Картер заднего моста	75132-2401006-50	t	1	2a8f8df1-f780-4b12-b8d1-f0388710cd66	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536467567
63519ce2-201f-4b28-8412-aa92b94f1dd2	Фланец картера	75580-2401114-11	t	3	09e51f5b-1a13-4b8c-bdfa-c0185607b4c3	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536386265
6b3ca911-155a-4790-9368-ad361beb8287	Рама	75313-2800010-20	t	1	649756a6-4fe8-4ee5-8355-555d863d1ab8	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536287819
8519b9f9-31bf-4b0a-b85a-ce87cc42236d	Кронштейн амортизатора левый	75304-1001251	t	2	9786c86c-d450-4eef-a307-2ad75682a3e9	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536248707
8d7546ca-232c-4ea0-b768-584d09fb07f5	Кронштейн	75310-1183102	t	3	d6c51c81-794d-4370-a5f5-f929ed0f1998	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536267484
9592a42f-9b69-4c47-82c6-70e9d50c75fe	Кронштейн	75304-1001253	t	3	5fff21ca-b62e-4a36-b27e-2734ceec2895	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536248708
a7337339-71fd-4f74-9fa8-86fa7b5058e3	Распорка	7521-3932688	t	3	2b5b3610-a7bd-4452-8639-f60eedd86f21	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536273606
bc0d6530-6b0a-4096-9850-bf8b44e2798e	Панель	75132-2105522	t	3	e6d4a172-ae6c-49f3-b41b-40afd630dfb0	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536417730
cc177019-e104-4a09-adfa-00f536c31b70	Картер заднего моста	75580-2401008	t	2	7e4c4753-39f1-434c-8c1f-213c848b2630	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536384295
d8643503-f2d7-49ee-9169-198cce2d2ebe	Кронштейн	75303-1001293	t	3	30baded8-94fc-44d3-93ce-8bedf1f5cd00	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536247228
e2be188d-a029-4320-b30f-e56435824bf5	Труба картера заднего моста	75580-2401010-01	t	2	7eb2a488-605e-4f17-b56f-a5c3d882e8ac	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536386240
e7ca458b-134c-4072-a279-e03e95e4ceae	Кронштейн	75580-2113192	t	3	f67c8cee-a4b3-4ea8-bfdf-b85696c3c3ca	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536384314
f4367bef-84fa-4b6b-855c-07d0f0fb41c2	Накладка	549Б-1015842	t	3	a1667917-6309-4674-a397-6d626a2a45d0	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N	\N	4536196288
f5bac5a2-bed4-421e-9f00-0443e9c4bd78	Кронштейн	75131-2113296-10	t	3	fdee157a-9460-41ee-8fdf-e78be18a7a9d	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N	\N	4536461620
80f8f440-38ef-421c-9f20-094921a7ad02	Опора	75211-2401122	t	3	98056c26-9d46-4970-bcdf-eb35d3bb4c30	de305632-9bd4-4408-b797-f0efb62fe12c	b89661a5-e641-45d5-bad5-1fb40254898b	\N	\N	4536276803
8bbf54aa-1bf2-4598-903e-d77c368c87be	Панель	75580-2105522	t	3	7c212b3b-d06f-4076-85e3-d004bdab0894	de305632-9bd4-4408-b797-f0efb62fe12c	b89661a5-e641-45d5-bad5-1fb40254898b	\N	\N	4536384399
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
983d2474-b496-4d14-a7b9-f148350f5c3a	Admin	\N
27eecef5-dfad-455e-9623-7adea7b5488a	Master	\N
1b03f454-c81f-45d7-ab88-931dab31ef18	Welder	\N
59ff0df9-d47b-47a6-9a9c-ceb6a7f2b20c	Inspector	\N
8a91f803-857d-42a5-8923-aa2a820fcce7	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
2bf02673-3b00-4900-abd1-c556feb33f45	2	222	t	f	5662be05-bfea-4d7e-92c2-d5c004451ccb	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N
2ec8b27b-8221-4aac-a781-aa0093c9ad42	4	222	t	f	6b3ca911-155a-4790-9368-ad361beb8287	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N
74517ee4-0669-4594-9b92-5d7ed2ba802e	1	111	t	f	5662be05-bfea-4d7e-92c2-d5c004451ccb	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N
7f04b194-92c0-46f0-ac1b-a298ba514f5b	3	333	t	f	6b3ca911-155a-4790-9368-ad361beb8287	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N	\N
230fd9b9-de8d-4211-a37d-d0448247617c	2	200	t	f	8bbf54aa-1bf2-4598-903e-d77c368c87be	349c10c2-c00e-44a7-9554-2063d6108a90	61413189-f21f-4295-ab49-d74e7bc248ba	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N
b9e5a086-4b89-4957-ac40-6ade87b93a7d	1	100	t	f	80f8f440-38ef-421c-9f20-094921a7ad02	15946471-cac8-4740-8f4e-e95a58778e42	61413189-f21f-4295-ab49-d74e7bc248ba	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
15946471-cac8-4740-8f4e-e95a58778e42	1	ИТП	\N
349c10c2-c00e-44a7-9554-2063d6108a90	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
012cbbee-7dac-4b84-b41c-4be232d65820	2433634	Технологический процесс	Ссылка	2433634
09e51f5b-1a13-4b8c-bdfa-c0185607b4c3	3338649	Технологический процесс	Ссылка	3338649
122a1965-a7a0-458a-90d0-9f9294e54580	1362989	Технологический процесс	Ссылка	1362989
2a8f8df1-f780-4b12-b8d1-f0388710cd66	3090319	Технологический процесс	Ссылка	3090319
2b5b3610-a7bd-4452-8639-f60eedd86f21	908693	Технологический процесс	Ссылка	908693
30baded8-94fc-44d3-93ce-8bedf1f5cd00	3049271	Технологический процесс	Ссылка	3049271
5bf78a6a-c03b-4966-adc5-ac0edf145872	1823031	Технологический процесс	Ссылка	1823031
5fff21ca-b62e-4a36-b27e-2734ceec2895	1492964	Технологический процесс	Ссылка	1492964
632e74ef-03aa-446a-b8d3-4c45d6fab386	1124147	Технологический процесс	Ссылка	1124147
649756a6-4fe8-4ee5-8355-555d863d1ab8	3239598	Технологический процесс	Ссылка	3239598
7c212b3b-d06f-4076-85e3-d004bdab0894	1405307	Технологический процесс	Ссылка	1405307
7e4c4753-39f1-434c-8c1f-213c848b2630	3232938	Технологический процесс	Ссылка	3232938
7eb2a488-605e-4f17-b56f-a5c3d882e8ac	2915477	Технологический процесс	Ссылка	2915477
9786c86c-d450-4eef-a307-2ad75682a3e9	1334123	Технологический процесс	Ссылка	1334123
98056c26-9d46-4970-bcdf-eb35d3bb4c30	3211246	Технологический процесс	Ссылка	3211246
a1667917-6309-4674-a397-6d626a2a45d0	1426226	Технологический процесс	Ссылка	1426226
ac03bb98-1518-4106-8538-d8cd06530286	2822569	Технологический процесс	Ссылка	2822569
ae3a1f51-dd89-48c0-80bd-31050599b863	1119363	Технологический процесс	Ссылка	1119363
cfe54332-6831-40c7-84ae-69c134efc2a6	2841119	Технологический процесс	Ссылка	2841119
d6c51c81-794d-4370-a5f5-f929ed0f1998	1104641	Технологический процесс	Ссылка	1104641
e6d4a172-ae6c-49f3-b41b-40afd630dfb0	1053809	Технологический процесс	Ссылка	1053809
f0bcfb30-9eac-4776-8fff-5353d92534e4	3011514	Технологический процесс	Ссылка	3011514
f1027215-73b4-42de-a7f2-6ee736a0ddca	1003048	Технологический процесс	Ссылка	1003048
f2314aad-4a3d-4c9c-a3b4-fda47d5ea68a	1402616	Технологический процесс	Ссылка	1402616
f67c8cee-a4b3-4ea8-bfdf-b85696c3c3ca	1405914	Технологический процесс	Ссылка	1405914
fdee157a-9460-41ee-8fdf-e78be18a7a9d	526870	Технологический процесс	Ссылка	526870
fe71ef57-4dbd-446b-91be-e938d5bee826	3232836	Технологический процесс	Ссылка	3232836
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
27b9ccb3-02fe-493b-b9c2-5d938027cb7a	59ff0df9-d47b-47a6-9a9c-ceb6a7f2b20c
c98aab78-dc78-4a0b-86b2-8e1d10e81ed0	59ff0df9-d47b-47a6-9a9c-ceb6a7f2b20c
d4440718-128c-4bea-b0ec-18bad7990bf9	59ff0df9-d47b-47a6-9a9c-ceb6a7f2b20c
26636d23-4e1f-410c-98b4-6216841d549b	27eecef5-dfad-455e-9623-7adea7b5488a
2eafa735-fbf4-4253-adaf-33e11b8437f6	27eecef5-dfad-455e-9623-7adea7b5488a
3bad563a-da36-4c76-a832-4d1b9cf8df45	27eecef5-dfad-455e-9623-7adea7b5488a
4aedc02c-b99e-442b-978f-582c63229686	27eecef5-dfad-455e-9623-7adea7b5488a
4f60278b-9d0f-407d-843f-ca7aa5c92042	27eecef5-dfad-455e-9623-7adea7b5488a
a8a57262-dddb-461f-a083-67740d34fdd4	27eecef5-dfad-455e-9623-7adea7b5488a
e2bf7715-f5c8-461d-a0a0-941b0c3941a7	27eecef5-dfad-455e-9623-7adea7b5488a
0d11e197-6741-45fa-8f88-8ba0bdc71170	1b03f454-c81f-45d7-ab88-931dab31ef18
1633b2e9-d303-4161-93cb-90e763ddc983	1b03f454-c81f-45d7-ab88-931dab31ef18
1cd4478d-f5cc-4609-915d-9fe58fb443e3	1b03f454-c81f-45d7-ab88-931dab31ef18
28e85ab7-ea02-4362-9b57-fcc3d62a6db0	1b03f454-c81f-45d7-ab88-931dab31ef18
2971a57c-224f-405c-a6cd-d9f6addca8fe	1b03f454-c81f-45d7-ab88-931dab31ef18
2f440216-23c6-4b95-aa6c-77eefd7a1a7c	1b03f454-c81f-45d7-ab88-931dab31ef18
549c6ebd-5d17-41ee-9f76-7c6543812cc9	1b03f454-c81f-45d7-ab88-931dab31ef18
78194fe3-ad12-4424-86dc-15942b38b10f	1b03f454-c81f-45d7-ab88-931dab31ef18
7c68db55-1438-47ab-974a-0aa58673fa63	1b03f454-c81f-45d7-ab88-931dab31ef18
8029ac4b-cfd7-4a89-bfe2-f4a82a27839b	1b03f454-c81f-45d7-ab88-931dab31ef18
89782ac8-181e-47c1-9ce2-531712e06536	1b03f454-c81f-45d7-ab88-931dab31ef18
9089d4f1-ec3e-4677-8a2d-bc25d0c1de9d	1b03f454-c81f-45d7-ab88-931dab31ef18
940181b0-f565-4c2c-ad1a-74854e50f03e	1b03f454-c81f-45d7-ab88-931dab31ef18
9bafcc16-b8b9-4578-8a3b-48e5a5e70e08	1b03f454-c81f-45d7-ab88-931dab31ef18
9dacca20-1c2b-4b6e-878f-6e443a3a15fb	1b03f454-c81f-45d7-ab88-931dab31ef18
b1810598-b491-4a18-b707-5852ea4f9e6c	1b03f454-c81f-45d7-ab88-931dab31ef18
b4e86667-fae0-48b5-9e89-85ffbc528826	1b03f454-c81f-45d7-ab88-931dab31ef18
b7f0d697-cc0a-49b2-bb94-987556bf1853	1b03f454-c81f-45d7-ab88-931dab31ef18
d4db88dd-be66-4b1e-98df-1c46a58a9767	1b03f454-c81f-45d7-ab88-931dab31ef18
d62238d9-90b4-4b6e-961d-443f4279fd4d	1b03f454-c81f-45d7-ab88-931dab31ef18
ec2e47bd-8af8-4da2-a653-50aaa1b615a2	1b03f454-c81f-45d7-ab88-931dab31ef18
ecb9b6a6-b87d-4b5d-871d-035610229f98	1b03f454-c81f-45d7-ab88-931dab31ef18
62e41038-d951-48a6-943e-ee5ee1b5c089	8a91f803-857d-42a5-8923-aa2a820fcce7
8ce009b9-b110-4a9c-b99f-93e982d41cd3	27eecef5-dfad-455e-9623-7adea7b5488a
d4575be3-b18d-4039-8ce7-7f18f8bda6ed	1b03f454-c81f-45d7-ab88-931dab31ef18
c5e03284-0e8d-4927-9acd-38a2146d01b1	59ff0df9-d47b-47a6-9a9c-ceb6a7f2b20c
9eca8c46-73d6-414c-88db-e91ab399143e	983d2474-b496-4d14-a7b9-f148350f5c3a
dce63528-a361-4bec-83b6-1999c4892c89	1b03f454-c81f-45d7-ab88-931dab31ef18
402e29cd-aafc-4a88-913a-910dbe146742	59ff0df9-d47b-47a6-9a9c-ceb6a7f2b20c
4531a720-5bd9-48b3-843f-11ef383b16b0	8a91f803-857d-42a5-8923-aa2a820fcce7
7add89fa-a0d6-405d-bee1-b6676c51933b	27eecef5-dfad-455e-9623-7adea7b5488a
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
27b9ccb3-02fe-493b-b9c2-5d938027cb7a	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	e65837ca-c887-4569-9fdf-c6cbf3576cb1	\N
c98aab78-dc78-4a0b-86b2-8e1d10e81ed0	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
d4440718-128c-4bea-b0ec-18bad7990bf9	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	e65837ca-c887-4569-9fdf-c6cbf3576cb1	\N
26636d23-4e1f-410c-98b4-6216841d549b	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
2eafa735-fbf4-4253-adaf-33e11b8437f6	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
3bad563a-da36-4c76-a832-4d1b9cf8df45	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
4aedc02c-b99e-442b-978f-582c63229686	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
4f60278b-9d0f-407d-843f-ca7aa5c92042	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N
a8a57262-dddb-461f-a083-67740d34fdd4	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
e2bf7715-f5c8-461d-a0a0-941b0c3941a7	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N
0d11e197-6741-45fa-8f88-8ba0bdc71170	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
1633b2e9-d303-4161-93cb-90e763ddc983	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	B7:5A:79:B5	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
1cd4478d-f5cc-4609-915d-9fe58fb443e3	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
28e85ab7-ea02-4362-9b57-fcc3d62a6db0	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	D7:F1:7D:5A	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
2971a57c-224f-405c-a6cd-d9f6addca8fe	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
2f440216-23c6-4b95-aa6c-77eefd7a1a7c	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
549c6ebd-5d17-41ee-9f76-7c6543812cc9	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
78194fe3-ad12-4424-86dc-15942b38b10f	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
7c68db55-1438-47ab-974a-0aa58673fa63	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	67:5A:70:B4	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
8029ac4b-cfd7-4a89-bfe2-f4a82a27839b	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:95:55:B4	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
89782ac8-181e-47c1-9ce2-531712e06536	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	17:CD:7F:5A	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
9089d4f1-ec3e-4677-8a2d-bc25d0c1de9d	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N
940181b0-f565-4c2c-ad1a-74854e50f03e	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:CD:7E:5A	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
9bafcc16-b8b9-4578-8a3b-48e5a5e70e08	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
9dacca20-1c2b-4b6e-878f-6e443a3a15fb	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
b1810598-b491-4a18-b707-5852ea4f9e6c	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	97:17:60:B4	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
b4e86667-fae0-48b5-9e89-85ffbc528826	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
b7f0d697-cc0a-49b2-bb94-987556bf1853	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
d4db88dd-be66-4b1e-98df-1c46a58a9767	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
d62238d9-90b4-4b6e-961d-443f4279fd4d	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N
ec2e47bd-8af8-4da2-a653-50aaa1b615a2	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	de305632-9bd4-4408-b797-f0efb62fe12c	\N
ecb9b6a6-b87d-4b5d-871d-035610229f98	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	27:45:7E:B4	453134d6-fa9b-4d31-b283-8356b72fa0a1	\N
62e41038-d951-48a6-943e-ee5ee1b5c089	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
8ce009b9-b110-4a9c-b99f-93e982d41cd3	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
c5e03284-0e8d-4927-9acd-38a2146d01b1	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
d4575be3-b18d-4039-8ce7-7f18f8bda6ed	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	\N
9eca8c46-73d6-414c-88db-e91ab399143e	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$rsCRu5V9+9ZDVlGFfR8GjcVHGhZjhI2i2CVKeweizUVMbMHx	\N	\N	\N	\N	\N	\N
dce63528-a361-4bec-83b6-1999c4892c89	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$15InCPVqOK2ZcvaTzTca8s31M0vtUjb19zNNbbz+lt3qYQV6	\N	\N	\N	\N	\N	\N
402e29cd-aafc-4a88-913a-910dbe146742	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$D6zMd4y1ZeO3g8UZwhjzC/GtCdrWb0o0aLflDPS8LZ4otnpv	\N	\N	\N	\N	\N	\N
4531a720-5bd9-48b3-843f-11ef383b16b0	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$dKd53rN4TI5MD6TCl85OlJCxi8C5FIjzeDP6lgCjhv64ERK6	\N	\N	\N	\N	\N	\N
7add89fa-a0d6-405d-bee1-b6676c51933b	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$2NpOmSlQDdXjeeTVsKgifOxge52N5z14G6O00UIJHD2gr4pv	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
57b6c550-a562-48ff-986d-7dc69fb9db1f	1	Корневой	80	120	22	24	50	250	15946471-cac8-4740-8f4e-e95a58778e42	\N
95d0a54a-c287-46ab-91a8-48e9eb3a2f2f	1	Корневой	80	120	\N	\N	50	250	349c10c2-c00e-44a7-9554-2063d6108a90	\N
adeaed9f-b908-426b-bbf3-7bbdeeb2a36c	2	Заполняющий	80	120	21	25	50	250	349c10c2-c00e-44a7-9554-2063d6108a90	\N
ba050d46-7a80-4f8d-baa3-4b06ce0da677	2	Заполняющий	80	120	21	25	50	250	15946471-cac8-4740-8f4e-e95a58778e42	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
6d625080-e232-49ed-a329-0a7128262a55	2	Заполняющий	100	0.22	0.44	\N	\N	\N	29a2d5b2-bc0d-4947-b75b-e5d14f5ba599	1d7cafd3-375f-4a20-9bd7-323732f17256	\N
7c4de107-f7cb-4d39-bdf1-ff22c711c9c9	2	Заполняющий	100	0.22	0.44	\N	\N	\N	03d98fd3-d644-4e83-9f27-44fdfac121da	f7a24f7a-a850-4e2b-86a6-b3712d637aca	\N
e95ae55f-4ed0-4a94-92b6-167ffbec2b6d	1	Корневой	82	0.11	0.68	\N	\N	\N	949b57e4-c55a-43cc-ab49-bcfd728121e6	f7a24f7a-a850-4e2b-86a6-b3712d637aca	\N
eb487aee-7ee9-4f13-b8e5-5437af4a5b29	1	Корневой	82	0.11	0.68	\N	\N	\N	26078f6d-048e-461d-ba27-d3d11fd15900	1d7cafd3-375f-4a20-9bd7-323732f17256	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
15dedb91-f65d-457e-afc2-c813b295af3d	249a8d80-096a-4b90-9632-af8971cc92f2
1c8f851b-82a9-41b1-b232-a471ffb5d19c	be2c8870-e97e-489d-a6b9-aba92eb05c0f
34c9a011-2726-4376-b04e-3af5a6918afb	be2c8870-e97e-489d-a6b9-aba92eb05c0f
4405afd6-10ee-474b-8a0e-e780334905bf	018ea615-2445-41a0-babb-2ce9abe63fd9
48fb6cc2-295b-4607-94fc-474ac1420751	76ace1e4-c81d-417a-9526-0f8608d97979
4af7485e-e592-4150-8720-62ad900ce0fa	249a8d80-096a-4b90-9632-af8971cc92f2
4d0177d5-d804-451f-9463-bc562fe63bfe	8a2f4b14-9f9a-464b-8b87-d4c6a89c1e18
4ec5ad98-639b-4650-87c8-7dd951ce246d	ccfda31b-2752-4b8e-a629-1b21b4cf70c0
50c5dcc3-46a6-4414-9645-2c9ac9cba982	7fddba06-a0a2-4c23-a93f-932375b62ed9
5aaec6d2-f354-4a30-b418-8ec7cc1e7328	76ace1e4-c81d-417a-9526-0f8608d97979
5fd2c37a-df89-4fdd-a4ba-53dbb904c3ac	8a2f4b14-9f9a-464b-8b87-d4c6a89c1e18
6801c695-63d8-4d36-86f4-5e02dff72654	ccfda31b-2752-4b8e-a629-1b21b4cf70c0
69ddc14c-8309-4bd2-82a8-85fc54c2c22f	018ea615-2445-41a0-babb-2ce9abe63fd9
798325cc-c614-401c-9482-ed65042151f7	5b8e8c07-6ece-404a-b84e-0ca4f5356cf0
7d52e3a5-66cf-4108-ae7a-e17bb3444715	ccfda31b-2752-4b8e-a629-1b21b4cf70c0
8135e4fa-3322-404b-a5f5-84bf52cce49a	be2c8870-e97e-489d-a6b9-aba92eb05c0f
a5bb4f35-41ae-45b8-ba7f-421eb67f27fd	7fddba06-a0a2-4c23-a93f-932375b62ed9
bfa81b2e-6738-427a-9736-e8dae0aaef74	5b8e8c07-6ece-404a-b84e-0ca4f5356cf0
d229a605-83b9-4769-afc9-d7ce77eed83c	5b8e8c07-6ece-404a-b84e-0ca4f5356cf0
d9896f2d-d8b7-4c6b-9ba0-d0e6948f3892	be2c8870-e97e-489d-a6b9-aba92eb05c0f
dc066cfe-045c-4105-bc91-0fb8f6236859	5b8e8c07-6ece-404a-b84e-0ca4f5356cf0
f9f567e3-8fbd-4805-b1b0-6d8aa6861dfb	be2c8870-e97e-489d-a6b9-aba92eb05c0f
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
15dedb91-f65d-457e-afc2-c813b295af3d	2971a57c-224f-405c-a6cd-d9f6addca8fe	\N	149921
1c8f851b-82a9-41b1-b232-a471ffb5d19c	b4e86667-fae0-48b5-9e89-85ffbc528826	\N	152365
34c9a011-2726-4376-b04e-3af5a6918afb	9bafcc16-b8b9-4578-8a3b-48e5a5e70e08	\N	121538
4405afd6-10ee-474b-8a0e-e780334905bf	b1810598-b491-4a18-b707-5852ea4f9e6c	8209c1aa-23bf-4edb-8e62-fa9a8a1f11d7	151299
48fb6cc2-295b-4607-94fc-474ac1420751	28e85ab7-ea02-4362-9b57-fcc3d62a6db0	4468ca8c-a36d-409d-9261-f09b99244a39	120756
4af7485e-e592-4150-8720-62ad900ce0fa	9dacca20-1c2b-4b6e-878f-6e443a3a15fb	\N	150402
4d0177d5-d804-451f-9463-bc562fe63bfe	ecb9b6a6-b87d-4b5d-871d-035610229f98	10a137c3-775a-4268-9637-9501983c55fd	145092
4ec5ad98-639b-4650-87c8-7dd951ce246d	ec2e47bd-8af8-4da2-a653-50aaa1b615a2	\N	152207
50c5dcc3-46a6-4414-9645-2c9ac9cba982	8029ac4b-cfd7-4a89-bfe2-f4a82a27839b	7604afc3-9962-42b7-9c83-1fa3eb301356	121267
5aaec6d2-f354-4a30-b418-8ec7cc1e7328	7c68db55-1438-47ab-974a-0aa58673fa63	d708c173-a30e-4ea3-bc94-5224ac895425	146325
5fd2c37a-df89-4fdd-a4ba-53dbb904c3ac	89782ac8-181e-47c1-9ce2-531712e06536	f6d0157e-9dd7-4e73-97ea-bdba74e0fb73	132695
6801c695-63d8-4d36-86f4-5e02dff72654	9089d4f1-ec3e-4677-8a2d-bc25d0c1de9d	\N	152444
69ddc14c-8309-4bd2-82a8-85fc54c2c22f	1633b2e9-d303-4161-93cb-90e763ddc983	70a824a6-c203-4abe-b4d2-63576719347e	150882
798325cc-c614-401c-9482-ed65042151f7	b7f0d697-cc0a-49b2-bb94-987556bf1853	\N	155288
7d52e3a5-66cf-4108-ae7a-e17bb3444715	d62238d9-90b4-4b6e-961d-443f4279fd4d	\N	156278
8135e4fa-3322-404b-a5f5-84bf52cce49a	1cd4478d-f5cc-4609-915d-9fe58fb443e3	\N	121537
a5bb4f35-41ae-45b8-ba7f-421eb67f27fd	940181b0-f565-4c2c-ad1a-74854e50f03e	d708c173-a30e-4ea3-bc94-5224ac895425	117390
bfa81b2e-6738-427a-9736-e8dae0aaef74	d4db88dd-be66-4b1e-98df-1c46a58a9767	\N	151861
d229a605-83b9-4769-afc9-d7ce77eed83c	2f440216-23c6-4b95-aa6c-77eefd7a1a7c	\N	153274
d9896f2d-d8b7-4c6b-9ba0-d0e6948f3892	549c6ebd-5d17-41ee-9f76-7c6543812cc9	\N	147329
dc066cfe-045c-4105-bc91-0fb8f6236859	78194fe3-ad12-4424-86dc-15942b38b10f	\N	152441
f9f567e3-8fbd-4805-b1b0-6d8aa6861dfb	0d11e197-6741-45fa-8f88-8ba0bdc71170	\N	156298
35df7810-fae5-4194-9edf-701aee36c04e	d4575be3-b18d-4039-8ce7-7f18f8bda6ed	\N	\N
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
018ea615-2445-41a0-babb-2ce9abe63fd9	70a824a6-c203-4abe-b4d2-63576719347e
018ea615-2445-41a0-babb-2ce9abe63fd9	8209c1aa-23bf-4edb-8e62-fa9a8a1f11d7
76ace1e4-c81d-417a-9526-0f8608d97979	4468ca8c-a36d-409d-9261-f09b99244a39
76ace1e4-c81d-417a-9526-0f8608d97979	d708c173-a30e-4ea3-bc94-5224ac895425
7fddba06-a0a2-4c23-a93f-932375b62ed9	7604afc3-9962-42b7-9c83-1fa3eb301356
7fddba06-a0a2-4c23-a93f-932375b62ed9	d708c173-a30e-4ea3-bc94-5224ac895425
8a2f4b14-9f9a-464b-8b87-d4c6a89c1e18	10a137c3-775a-4268-9637-9501983c55fd
8a2f4b14-9f9a-464b-8b87-d4c6a89c1e18	f6d0157e-9dd7-4e73-97ea-bdba74e0fb73
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
249a8d80-096a-4b90-9632-af8971cc92f2	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	146
5b8e8c07-6ece-404a-b84e-0ca4f5356cf0	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	162
be2c8870-e97e-489d-a6b9-aba92eb05c0f	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	\N	8008336102-130
ccfda31b-2752-4b8e-a629-1b21b4cf70c0	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	114
018ea615-2445-41a0-babb-2ce9abe63fd9	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dbb90e91-abb4-450b-89c2-4db9b2c8f84c	499
76ace1e4-c81d-417a-9526-0f8608d97979	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dbb90e91-abb4-450b-89c2-4db9b2c8f84c	508
7fddba06-a0a2-4c23-a93f-932375b62ed9	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dbb90e91-abb4-450b-89c2-4db9b2c8f84c	511
8a2f4b14-9f9a-464b-8b87-d4c6a89c1e18	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	dbb90e91-abb4-450b-89c2-4db9b2c8f84c	535
e285e41c-6d91-4be4-a272-bc40406663df	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
03d98fd3-d644-4e83-9f27-44fdfac121da	2023-02-19 15:30:19.771402	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	e285e41c-6d91-4be4-a272-bc40406663df	35df7810-fae5-4194-9edf-701aee36c04e	b89661a5-e641-45d5-bad5-1fb40254898b	\N
26078f6d-048e-461d-ba27-d3d11fd15900	2023-02-19 15:30:19.770331	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	e285e41c-6d91-4be4-a272-bc40406663df	35df7810-fae5-4194-9edf-701aee36c04e	b89661a5-e641-45d5-bad5-1fb40254898b	\N
29a2d5b2-bc0d-4947-b75b-e5d14f5ba599	2023-02-19 15:30:19.770437	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	e285e41c-6d91-4be4-a272-bc40406663df	35df7810-fae5-4194-9edf-701aee36c04e	b89661a5-e641-45d5-bad5-1fb40254898b	\N
949b57e4-c55a-43cc-ab49-bcfd728121e6	2023-02-19 15:30:19.771401	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	e285e41c-6d91-4be4-a272-bc40406663df	35df7810-fae5-4194-9edf-701aee36c04e	b89661a5-e641-45d5-bad5-1fb40254898b	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
1d7cafd3-375f-4a20-9bd7-323732f17256	1	1	f	2023-02-19 15:30:19.768604	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	b9e5a086-4b89-4957-ac40-6ade87b93a7d	35df7810-fae5-4194-9edf-701aee36c04e	b89661a5-e641-45d5-bad5-1fb40254898b	61413189-f21f-4295-ab49-d74e7bc248ba	\N
f7a24f7a-a850-4e2b-86a6-b3712d637aca	2	1	f	2023-02-19 15:30:19.771399	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	230fd9b9-de8d-4211-a37d-d0448247617c	35df7810-fae5-4194-9edf-701aee36c04e	b89661a5-e641-45d5-bad5-1fb40254898b	61413189-f21f-4295-ab49-d74e7bc248ba	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
74d5ac80-f96c-4926-8d97-7b6887bca074	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	e3042e59-53c5-494a-bb65-760f186344b4	\N
e3b7d6d2-693f-43b0-a71a-fca7c356e62e	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	e3042e59-53c5-494a-bb65-760f186344b4	\N
ef40b3ba-af9e-4855-ba45-5495e8f2c967	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	e3042e59-53c5-494a-bb65-760f186344b4	\N
ebcc81ac-13bd-405d-bb4d-7a53ac39ccb1	1	12:10:00	13:10:00	13:20:00	13:50:00	a781a6fd-ebe4-4ee2-a763-52528f48766e	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
10a137c3-775a-4268-9637-9501983c55fd	3590	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3590
25a16d97-3eee-4fac-b5d6-835e6b51e149	1270	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1270
4468ca8c-a36d-409d-9261-f09b99244a39	3520	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3520
53b77110-29e9-4d80-bfdc-1e0f635d5000	1390	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1390
70a824a6-c203-4abe-b4d2-63576719347e	3690	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3690
7604afc3-9962-42b7-9c83-1fa3eb301356	3600	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3600
78594764-0445-4636-aa44-d2648eda7808	1360	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1360
79a2b214-fc79-4f99-a13e-674c68c2c544	1280	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1280
8209c1aa-23bf-4edb-8e62-fa9a8a1f11d7	3650	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3650
89297574-8952-4582-a59a-25b3a8949806	2130	\N	de305632-9bd4-4408-b797-f0efb62fe12c	2130
8d0a7dd9-d3d8-475f-ad94-bafdef666cde	2050	\N	de305632-9bd4-4408-b797-f0efb62fe12c	2050
c286250e-d9ed-4a6e-a5e3-56bb70f7b398	1380	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1380
d708c173-a30e-4ea3-bc94-5224ac895425	3610	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3610
e6335bd3-3067-46af-a05c-9d49386989b0	1550	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1550
ec0d910e-5a15-4413-8e1e-41571a30cbfd	1260	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1260
f15f1c98-82bc-4207-ab90-5b3d54020ac7	1400	\N	da9b74ba-921e-4f64-8b74-30eaaa809b41	1400
f3925a1a-f4b1-4aaa-bf5d-635456567ddf	2150	\N	de305632-9bd4-4408-b797-f0efb62fe12c	2150
f6d0157e-9dd7-4e73-97ea-bdba74e0fb73	3500	\N	453134d6-fa9b-4d31-b283-8356b72fa0a1	3500
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
5241d14c-c712-4db3-bb03-fac34803c534	Сварочный цех	50	050
8b49e804-2906-40d5-8a4f-98e3f9e28518	Цех 480	480	480
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

