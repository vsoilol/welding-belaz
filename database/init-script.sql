--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 15.2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


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
    "Time" double precision NOT NULL,
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
    "MasterId" uuid,
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
61541311-6d95-4b80-9547-cada3a1f0402	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
7120076a-3c48-4429-936a-97a8e4ce29a5	2a7e60eb-5e6c-4cf0-8c8c-80a3552f1b0d	a8337339-0302-4870-a210-dddea6bd4fa7	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
1de84305-f055-4afb-a2ad-fa3315422daf	1	10	t	61541311-6d95-4b80-9547-cada3a1f0402	\N
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
03e9729d-e333-44f1-9be1-37b6d8e36d0f	Ознакомление с работой, документацией, инструктаж	\N
0698a56b-ba7d-4060-89c3-9eee4bcdf1ff	Установка, выверка, снятие детали	\N
23739b78-9951-4431-a3de-1bc625af507b	Праздники и выходные	\N
314bb92b-e327-4bcc-9614-3977ca750c00	Отсутствие энергоносителей	\N
41c54a86-b7d5-444b-9e31-9378b9ad8de1	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
4cf4301f-bce7-40c8-ab5d-2f2e402a4769	Плановый ремонт централизованными службами	\N
52fc5b61-fb02-455a-8e2b-2a0d8ca7c83c	Работа с управляющей программой	\N
5e31b53c-3b5b-4ced-8236-f20bfdc747e8	Нерабочее время по графику согласно сменности	\N
7142d8fd-12a6-4e09-9e6e-e076ce02d2ee	Контроль на рабочем месте	\N
723076d5-25a8-468f-a48c-c9f076989342	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
8bc0b489-5db2-46e0-9aba-e3eabe834bef	Обед	\N
a3967ab9-dbd1-4d00-9cf1-93cda69b6942	Отсутствие крана, транспорта	\N
acabf489-e4a6-403d-b9e6-bd7d540c177e	Отсутствие заданий	\N
b57f2ce3-0a4d-488f-9584-b0a32d152f9b	Отсутствие оператора в связи с необеспеченностью	\N
c155ce50-8ebe-45ce-a8df-592f67d8b4e0	Отсутствие материала, заготовок, деталей	\N
c9169e31-c243-4d02-a6c6-9186398d02e5	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
c98846f7-89c8-4996-bee8-6824b0d41588	Установка, выверка, снятие детали	\N
ce29058d-de2e-4323-ab8b-f59daa096344	Изменение режимов, смена инструмента, приспособления	\N
d842bc9a-08f8-4592-b200-8c8c05ab4ae1	Работа по карте несоответствий	\N
e206a878-be8e-430b-98c8-ff888a7063ad	Аварийный ремонт централизованными службами	\N
e377e675-0865-4f8f-9243-b9076fbb6445	Естественные надобности	\N
e3e38e25-5b86-4843-843b-bd9e84986df9	Сборочные операции	\N
e45d879d-7904-4acd-9d66-f78b6b805ef2	Отсутствие конструктора, технолога или ожидание его решения	\N
fd266725-e1fb-4c88-8e94-9393d11cd4a6	Неявка оператора (б/лист, отпуск, и пр.)	\N
ff4086ff-0bff-40b6-a4b1-94415b6c13d3	Отсутствие сотрудника ОТК	\N
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
93beef2e-8e97-429b-b8d5-90e088541ef9	85e4fd00-ce99-4457-86e3-680ce7b2f84b	249550
9a4c3299-d369-4d64-8a8d-3381b8d3ff85	b5be7c2b-fb7d-428b-bafa-46f0d522f709	219379
1b3d3a4e-126b-4c2a-b7b6-9f06ce447cb3	b73b7749-a308-4253-9786-095d3e762461	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
a801c41b-9294-43b6-981a-1d393864d280	3c2f333f-d90d-416b-8c1a-9842fca86f05	610422
cadcb9b2-0680-4bc7-bddf-b0aa2e0442d4	220962aa-4dc8-47eb-983f-80041371545e	614962
68b8cae7-caaf-4dd6-8475-51bfcd4c1b86	1ac180ec-3281-4360-95a8-d825b28d18d4	\N
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
5de7f2e6-bbed-46d2-af60-cc110309e3a4	40aedf45-f13d-4206-986e-3ed5bb271ec3
6ef44571-bf66-4c09-8b20-d6c0b4172a76	40aedf45-f13d-4206-986e-3ed5bb271ec3
ae50864d-75fa-4668-9786-ee7d31ac2bda	40aedf45-f13d-4206-986e-3ed5bb271ec3
f5767f8d-f7db-4939-98dc-0440212b15b0	40aedf45-f13d-4206-986e-3ed5bb271ec3
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
5de7f2e6-bbed-46d2-af60-cc110309e3a4	4	2	2023-03-12 00:00:00	e0a25b65-0029-4c73-8765-1d4a95829b14	\N
6ef44571-bf66-4c09-8b20-d6c0b4172a76	1	2	2023-03-12 00:00:00	48d74d23-dca5-478d-b5d9-279bf951faf8	\N
ae50864d-75fa-4668-9786-ee7d31ac2bda	2	2	2023-03-12 00:00:00	66965610-cbfa-4e7d-9a3b-c4ccb5c88942	\N
f5767f8d-f7db-4939-98dc-0440212b15b0	3	2	2023-03-12 00:00:00	734ed71e-a1fb-4397-ab3d-746f0588523a	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
e0a25b65-0029-4c73-8765-1d4a95829b14	66965610-cbfa-4e7d-9a3b-c4ccb5c88942
48d74d23-dca5-478d-b5d9-279bf951faf8	734ed71e-a1fb-4397-ab3d-746f0588523a
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
25d45ed0-71d7-4e11-a97b-c322528b945d	0	2	\N	\N	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
3a702c7d-7eca-4420-80e2-b4070d3874e2	0	3	\N	\N	ae50864d-75fa-4668-9786-ee7d31ac2bda	\N
436a63f5-dedf-4479-8519-6b4ffb4eeb28	0	1	\N	\N	ae50864d-75fa-4668-9786-ee7d31ac2bda	\N
7ce069b1-8f42-4c1a-97fe-572c09e56899	0	3	\N	\N	f5767f8d-f7db-4939-98dc-0440212b15b0	\N
83336800-e31b-4eb4-8e4a-9e2120dc44d3	0	3	\N	\N	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
94229078-f187-4310-83cd-2a4a1bae28f6	0	3	\N	\N	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
b187b39b-3ba9-4fe3-93cf-6ae844dbdde4	0	2	\N	\N	f5767f8d-f7db-4939-98dc-0440212b15b0	\N
b61c7fd9-7a4d-42c5-8489-f9ff074ae499	0	1	\N	\N	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
bbc3a5db-fb3b-4ea6-8a44-5714d5431f0d	0	2	\N	\N	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
e466d271-17b8-45d5-8bae-ae43bfc77867	0	2	\N	\N	ae50864d-75fa-4668-9786-ee7d31ac2bda	\N
eddbd512-bed2-463a-b5fd-da3888196243	0	1	\N	\N	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
ff04b94f-e7a7-4815-8574-b19fc3fdfbaa	0	1	\N	\N	f5767f8d-f7db-4939-98dc-0440212b15b0	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
b379fc38-15a2-49af-af8a-11d0361fb4ae	Сборка, сварка рам к/с г/п 120-130 т.	6	a8337339-0302-4870-a210-dddea6bd4fa7	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
48d74d23-dca5-478d-b5d9-279bf951faf8	Рама	75131-2800010-70	t	1	e85aa70e-8830-4b78-8f9b-7ea8ae61781c	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N	\N	4536479362
66965610-cbfa-4e7d-9a3b-c4ccb5c88942	Поперечина рамы задняя	75131-2801300-20	t	2	57ddbc96-e5a0-4ae5-a866-67e355a41ee0	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N	\N	\N
734ed71e-a1fb-4397-ab3d-746f0588523a	Поперечина рамы задняя	75131-2801300-20	t	2	e85aa70e-8830-4b78-8f9b-7ea8ae61781c	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N	\N	\N
e0a25b65-0029-4c73-8765-1d4a95829b14	Рама	7513D-2800010-20	t	1	57ddbc96-e5a0-4ae5-a866-67e355a41ee0	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N	\N	4536492774
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
30bb4871-2e3a-4ef9-aaae-5ac586db85f3	Admin	\N
c5c95a06-8778-4eca-93b1-59382a622970	Master	\N
573d476a-6ba0-409f-894a-0d2ea25f1e80	Welder	\N
02ddc6c3-bcdc-48c9-8e68-8634f243fab8	Inspector	\N
a815b7cc-f2f5-400f-a015-bf934abb0eb4	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
19ede928-c2e8-458e-ad8a-f2c34ff12ef0	2023-03-12 00:00:00	634e0a8e-a5a5-4882-8ca4-3968b59401bf	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
1f704aba-b518-47b6-8632-0938ee500feb	2023-03-12 00:00:00	54aea665-2be6-4d46-a0a4-056f5c94b226	ae50864d-75fa-4668-9786-ee7d31ac2bda	\N
3b538723-bc4b-428d-bbc7-713f6c348c20	2023-03-12 00:00:00	d29bfa28-9d48-4043-9f83-ced48ddc173d	ae50864d-75fa-4668-9786-ee7d31ac2bda	\N
3ccbd1e6-81d7-4ba6-a011-88d9b7df6393	2023-03-12 00:00:00	11393c6b-cf60-4054-a4f3-a2733e7614e0	f5767f8d-f7db-4939-98dc-0440212b15b0	\N
4e4edace-1ee4-4106-8d3b-8ab9b5fa6d3a	2023-03-12 00:00:00	0e5700fb-f66d-4971-b3d3-28996550ff8c	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
6ca08943-3712-4126-aa90-9d704c479f4f	2023-03-12 00:00:00	32628e2e-ab9a-4723-9a8f-f4afa17cc4e5	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
797da7d9-4145-4149-bc1e-c84bd600c874	2023-03-12 00:00:00	d57b05b8-dd7e-42e7-b42b-03f089b91ccb	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
7cc32045-3b9c-4cdf-bbbc-202b41436bac	2023-03-12 00:00:00	b7913428-26d1-459b-baf6-b943a63b9712	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
89bc4dc2-2ba9-4baf-b601-8ee6b51a701e	2023-03-12 00:00:00	f0742a28-2993-439e-ae1b-d6b875eb9927	ae50864d-75fa-4668-9786-ee7d31ac2bda	\N
8e6e4fc7-949e-4130-8279-fea5f5b13e0c	2023-03-12 00:00:00	d6192e70-4502-4a93-8d64-92bdf3f8d6db	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
af5e20f5-2c4a-4769-8afe-a07103c1b35f	2023-03-12 00:00:00	ddbe0b8c-2128-40c9-a3ec-ac1fff8e7da7	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
b63ea717-d8c8-4be3-bfed-b835b1c3c4ff	2023-03-12 00:00:00	eb15a974-b2fd-4ebd-94cb-557fd8259969	f5767f8d-f7db-4939-98dc-0440212b15b0	\N
b8e2bc77-da88-4787-aea9-ee970598d3dd	2023-03-12 00:00:00	22ee5e08-eb22-4a3d-8c1c-b1a46f59c7b4	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
c3f58ca5-a8ba-45d1-8322-8f690cd293dd	2023-03-12 00:00:00	5fa9b3e2-0f89-46c8-b4d3-f7afdaa8b09e	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
cdac9d59-78e5-4336-ab33-95fd084c49cd	2023-03-12 00:00:00	8664bc29-e03d-4c14-9308-4611c3a80da4	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
d1164d43-f75b-437a-8eb1-f014a3038328	2023-03-12 00:00:00	0de30f4d-1c88-4c55-a226-3da26a0a2486	f5767f8d-f7db-4939-98dc-0440212b15b0	\N
ddddb1a7-d379-47f0-a7d2-f3bab10b4bd4	2023-03-12 00:00:00	0ab59db0-2330-42fb-a26e-6537784a2907	5de7f2e6-bbed-46d2-af60-cc110309e3a4	\N
f393be74-8408-428e-9186-e7416a0c6b83	2023-03-12 00:00:00	e0a4e9aa-b484-486a-b396-ac9f8ab0f0a7	6ef44571-bf66-4c09-8b20-d6c0b4172a76	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
00086238-02a4-46b7-be26-c6646b8d4695	0	3	\N	\N	d1164d43-f75b-437a-8eb1-f014a3038328	\N
0a4b1ad5-8879-488b-ad89-005fad90e4c9	0	1	\N	\N	6ca08943-3712-4126-aa90-9d704c479f4f	\N
140d4316-2c20-47f4-abd8-332bbd21f436	0	3	\N	\N	af5e20f5-2c4a-4769-8afe-a07103c1b35f	\N
1db73be4-2b24-4307-958c-49c967fb5119	0	2	\N	\N	797da7d9-4145-4149-bc1e-c84bd600c874	\N
1f6af998-fc4e-4867-9a38-d3810b2fc470	0	2	\N	\N	c3f58ca5-a8ba-45d1-8322-8f690cd293dd	\N
20077e44-4cad-4fbf-b87d-05cc08a4dc73	0	1	\N	\N	1f704aba-b518-47b6-8632-0938ee500feb	\N
21b20f3f-2c7d-43af-bc1d-09a90b0053fc	0	1	\N	\N	b63ea717-d8c8-4be3-bfed-b835b1c3c4ff	\N
2c753b03-f338-4b14-87ad-4e4ad20e2c2b	0	1	\N	\N	89bc4dc2-2ba9-4baf-b601-8ee6b51a701e	\N
2f685331-ff46-4f45-ad33-d5fd8d28d054	0	3	\N	\N	8e6e4fc7-949e-4130-8279-fea5f5b13e0c	\N
32e23139-3aca-43d2-8dfc-1fedf1790f61	0	2	\N	\N	b8e2bc77-da88-4787-aea9-ee970598d3dd	\N
36aa1443-6f68-4595-9fa4-a2cc1aa57817	0	1	\N	\N	3b538723-bc4b-428d-bbc7-713f6c348c20	\N
3c96f5a4-bb60-4939-8eb6-2775c7e6879c	0	3	\N	\N	cdac9d59-78e5-4336-ab33-95fd084c49cd	\N
40559fee-35c6-4fa6-841f-701c8589b97c	0	3	\N	\N	f393be74-8408-428e-9186-e7416a0c6b83	\N
47e81437-5172-44d7-b0c9-3466c6fce3dc	0	2	\N	\N	1f704aba-b518-47b6-8632-0938ee500feb	\N
4bd477d5-f95e-49b1-b5d1-b2ab28948577	0	2	\N	\N	6ca08943-3712-4126-aa90-9d704c479f4f	\N
5003326a-0f2d-423c-96f0-3fef02f359ad	0	1	\N	\N	7cc32045-3b9c-4cdf-bbbc-202b41436bac	\N
51284a8c-4215-44ed-9b0f-d881e7d32bfb	0	2	\N	\N	ddddb1a7-d379-47f0-a7d2-f3bab10b4bd4	\N
5bf622e4-25a8-4376-8dbe-3cbc0b509196	0	3	\N	\N	1f704aba-b518-47b6-8632-0938ee500feb	\N
6248c031-1723-4ca4-8994-c829dd516b07	0	2	\N	\N	4e4edace-1ee4-4106-8d3b-8ab9b5fa6d3a	\N
66ead7ea-a5f0-4d7b-95a6-4ddbdb6a43c9	0	2	\N	\N	89bc4dc2-2ba9-4baf-b601-8ee6b51a701e	\N
67bc6672-3034-4956-8a84-61bbcc286893	0	1	\N	\N	f393be74-8408-428e-9186-e7416a0c6b83	\N
696930ab-6265-4d4c-8980-0274e3578447	0	2	\N	\N	d1164d43-f75b-437a-8eb1-f014a3038328	\N
6ae328cc-a6e1-465d-b258-ab9a3863e07b	0	2	\N	\N	8e6e4fc7-949e-4130-8279-fea5f5b13e0c	\N
6f7a7477-8788-468f-9df1-e270a8a4a6c5	0	1	\N	\N	d1164d43-f75b-437a-8eb1-f014a3038328	\N
6f9a4c42-968e-4c87-880e-c3d40d4f8264	0	3	\N	\N	6ca08943-3712-4126-aa90-9d704c479f4f	\N
72baabf6-59ee-4528-a161-5beb1088f5b7	0	2	\N	\N	3b538723-bc4b-428d-bbc7-713f6c348c20	\N
73b255a2-1358-4eb8-9317-0a6257ff2331	0	1	\N	\N	ddddb1a7-d379-47f0-a7d2-f3bab10b4bd4	\N
768bedf8-38b5-4582-a56f-3a462f4a2591	0	1	\N	\N	19ede928-c2e8-458e-ad8a-f2c34ff12ef0	\N
868d40c0-8e91-41d1-a982-8385a8e8c59e	0	3	\N	\N	b63ea717-d8c8-4be3-bfed-b835b1c3c4ff	\N
89caf647-a45b-4f3f-8ebc-83439f2abaa1	0	3	\N	\N	b8e2bc77-da88-4787-aea9-ee970598d3dd	\N
8f33c8a5-3506-4175-a23a-141eb178ffb8	0	1	\N	\N	3ccbd1e6-81d7-4ba6-a011-88d9b7df6393	\N
96b3a0d5-3c23-4782-9ebb-b1ccd7725383	0	1	\N	\N	797da7d9-4145-4149-bc1e-c84bd600c874	\N
9c743f05-1ad9-47c3-b83d-fc7f4af4361c	0	1	\N	\N	c3f58ca5-a8ba-45d1-8322-8f690cd293dd	\N
9d6c242c-5aae-4868-b2d2-18c938dc68cf	0	1	\N	\N	b8e2bc77-da88-4787-aea9-ee970598d3dd	\N
a950e797-2cd1-45a9-b747-925ba651af67	0	1	\N	\N	af5e20f5-2c4a-4769-8afe-a07103c1b35f	\N
ae885e06-8fcd-46b1-ac4f-65211a09a036	0	3	\N	\N	ddddb1a7-d379-47f0-a7d2-f3bab10b4bd4	\N
afae2503-88ed-45ee-ab11-8be6a34e1011	0	2	\N	\N	3ccbd1e6-81d7-4ba6-a011-88d9b7df6393	\N
b0509460-9300-4903-9972-33446b461ba2	0	3	\N	\N	3b538723-bc4b-428d-bbc7-713f6c348c20	\N
b5edc8f4-f89d-416c-a01e-aa7f3382042e	0	3	\N	\N	7cc32045-3b9c-4cdf-bbbc-202b41436bac	\N
ba776ca0-4d95-48a6-b773-8b5581f24201	0	1	\N	\N	8e6e4fc7-949e-4130-8279-fea5f5b13e0c	\N
be3a988d-fd09-4a3d-928d-e938ae15fd14	0	2	\N	\N	cdac9d59-78e5-4336-ab33-95fd084c49cd	\N
cb5fa077-b560-4ccc-bc5e-3e07c810d7b5	0	2	\N	\N	19ede928-c2e8-458e-ad8a-f2c34ff12ef0	\N
cdf28226-939d-4cb6-a52f-dba3228ab02a	0	2	\N	\N	f393be74-8408-428e-9186-e7416a0c6b83	\N
cef477db-852c-4160-b0d7-7de9dfdf6dbd	0	3	\N	\N	3ccbd1e6-81d7-4ba6-a011-88d9b7df6393	\N
d01d5758-6f0c-4683-8aee-32663ed87131	0	1	\N	\N	cdac9d59-78e5-4336-ab33-95fd084c49cd	\N
d021de4d-f14a-4b8e-9314-38bd3df1cb92	0	3	\N	\N	19ede928-c2e8-458e-ad8a-f2c34ff12ef0	\N
d6682e2f-6385-4bb6-808d-f21c04acbb96	0	2	\N	\N	b63ea717-d8c8-4be3-bfed-b835b1c3c4ff	\N
db83113a-6b09-49d4-bfdb-9c5a377c7129	0	2	\N	\N	af5e20f5-2c4a-4769-8afe-a07103c1b35f	\N
dbb41768-71aa-4e5d-8887-de9a21252263	0	3	\N	\N	4e4edace-1ee4-4106-8d3b-8ab9b5fa6d3a	\N
e2e52a77-3553-4fce-9594-eea3a8e7bd1f	0	2	\N	\N	7cc32045-3b9c-4cdf-bbbc-202b41436bac	\N
e445b227-69b4-4e53-8ae9-619422a45388	0	3	\N	\N	c3f58ca5-a8ba-45d1-8322-8f690cd293dd	\N
e4b2e736-ebc6-441c-9f3c-0aabe593f047	0	1	\N	\N	4e4edace-1ee4-4106-8d3b-8ab9b5fa6d3a	\N
e9a3ebd4-ec33-4e35-837a-2fd3bb4a355c	0	3	\N	\N	797da7d9-4145-4149-bc1e-c84bd600c874	\N
f0c62cf2-3555-448e-addb-aae083c0f394	0	3	\N	\N	89bc4dc2-2ba9-4baf-b601-8ee6b51a701e	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0ab59db0-2330-42fb-a26e-6537784a2907	18	4000	t	f	e0a25b65-0029-4c73-8765-1d4a95829b14	d72cfaef-d948-4192-b85d-a72354f8f594	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
0de30f4d-1c88-4c55-a226-3da26a0a2486	52	1200	t	f	734ed71e-a1fb-4397-ab3d-746f0588523a	2917930a-e8f8-4407-8c7b-c964a0097724	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
0e5700fb-f66d-4971-b3d3-28996550ff8c	54	400	t	f	48d74d23-dca5-478d-b5d9-279bf951faf8	5220515b-120c-4852-bea8-5c9335666b1d	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
11393c6b-cf60-4054-a4f3-a2733e7614e0	2	1880	t	f	734ed71e-a1fb-4397-ab3d-746f0588523a	c15d7c47-74ab-4383-a49e-2174abb82c6e	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
22ee5e08-eb22-4a3d-8c1c-b1a46f59c7b4	58	900	t	f	e0a25b65-0029-4c73-8765-1d4a95829b14	14339fbf-0749-437d-9520-3482dc645d6e	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
32628e2e-ab9a-4723-9a8f-f4afa17cc4e5	18	4000	t	f	48d74d23-dca5-478d-b5d9-279bf951faf8	d72cfaef-d948-4192-b85d-a72354f8f594	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
54aea665-2be6-4d46-a0a4-056f5c94b226	52	1200	t	f	66965610-cbfa-4e7d-9a3b-c4ccb5c88942	2917930a-e8f8-4407-8c7b-c964a0097724	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
5fa9b3e2-0f89-46c8-b4d3-f7afdaa8b09e	39	280	t	f	48d74d23-dca5-478d-b5d9-279bf951faf8	ec7cf2b1-b512-4b9b-b61f-58e6c86d95ea	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
634e0a8e-a5a5-4882-8ca4-3968b59401bf	57	400	t	f	e0a25b65-0029-4c73-8765-1d4a95829b14	b036493f-6835-4bb2-b3ae-d0cb9a60d23d	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
8664bc29-e03d-4c14-9308-4611c3a80da4	58	900	t	f	48d74d23-dca5-478d-b5d9-279bf951faf8	14339fbf-0749-437d-9520-3482dc645d6e	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
b7913428-26d1-459b-baf6-b943a63b9712	55	400	t	f	e0a25b65-0029-4c73-8765-1d4a95829b14	f67dca26-179a-4858-935e-681cc7dc85ff	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
d29bfa28-9d48-4043-9f83-ced48ddc173d	1	1900	t	f	66965610-cbfa-4e7d-9a3b-c4ccb5c88942	f528dfc0-a648-4a03-93b9-2f7459570956	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
d57b05b8-dd7e-42e7-b42b-03f089b91ccb	55	400	t	f	48d74d23-dca5-478d-b5d9-279bf951faf8	f67dca26-179a-4858-935e-681cc7dc85ff	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
d6192e70-4502-4a93-8d64-92bdf3f8d6db	39	280	t	f	e0a25b65-0029-4c73-8765-1d4a95829b14	ec7cf2b1-b512-4b9b-b61f-58e6c86d95ea	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
ddbe0b8c-2128-40c9-a3ec-ac1fff8e7da7	54	400	t	f	e0a25b65-0029-4c73-8765-1d4a95829b14	5220515b-120c-4852-bea8-5c9335666b1d	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
e0a4e9aa-b484-486a-b396-ac9f8ab0f0a7	57	400	t	f	48d74d23-dca5-478d-b5d9-279bf951faf8	b036493f-6835-4bb2-b3ae-d0cb9a60d23d	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
eb15a974-b2fd-4ebd-94cb-557fd8259969	1	1900	t	f	734ed71e-a1fb-4397-ab3d-746f0588523a	f528dfc0-a648-4a03-93b9-2f7459570956	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
f0742a28-2993-439e-ae1b-d6b875eb9927	2	1880	t	f	66965610-cbfa-4e7d-9a3b-c4ccb5c88942	c15d7c47-74ab-4383-a49e-2174abb82c6e	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
14339fbf-0749-437d-9520-3482dc645d6e	58	Инструкция 58	58
2917930a-e8f8-4407-8c7b-c964a0097724	52	Инструкция 52	52
35ad0d7d-14e6-4f23-bec1-23f86c9d3d57	48	Инструкция 48	48
5220515b-120c-4852-bea8-5c9335666b1d	54	Инструкция 54	54
96561b2e-5da7-47f0-90d0-dab9e81b388a	56	Инструкция 56	56
b036493f-6835-4bb2-b3ae-d0cb9a60d23d	57	Инструкция 57	57
c15d7c47-74ab-4383-a49e-2174abb82c6e	2	Инструкция 2	2
d72cfaef-d948-4192-b85d-a72354f8f594	18	Инструкция 18	18
ec7cf2b1-b512-4b9b-b61f-58e6c86d95ea	39	Инструкция 39	39
f528dfc0-a648-4a03-93b9-2f7459570956	1	Инструкция 1	1
f67dca26-179a-4858-935e-681cc7dc85ff	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
57ddbc96-e5a0-4ae5-a866-67e355a41ee0	7513D-2800010-20	Рама	\N	3330041
db5d9ec4-3c2b-4b96-b7eb-71272d5fd304	75131-2801300-20	Поперечина рамы задняя	\N	2868425
e85aa70e-8830-4b78-8f9b-7ea8ae61781c	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
85e4fd00-ce99-4457-86e3-680ce7b2f84b	02ddc6c3-bcdc-48c9-8e68-8634f243fab8
b5be7c2b-fb7d-428b-bafa-46f0d522f709	02ddc6c3-bcdc-48c9-8e68-8634f243fab8
220962aa-4dc8-47eb-983f-80041371545e	c5c95a06-8778-4eca-93b1-59382a622970
3c2f333f-d90d-416b-8c1a-9842fca86f05	c5c95a06-8778-4eca-93b1-59382a622970
179025fa-099f-4b07-98e6-06df2be2f455	573d476a-6ba0-409f-894a-0d2ea25f1e80
215e0216-64a5-44f9-91d3-af806ff9b916	573d476a-6ba0-409f-894a-0d2ea25f1e80
6eb99e7d-9eb0-4ef2-a97e-5a60c1c3bee2	573d476a-6ba0-409f-894a-0d2ea25f1e80
75d4ac31-5588-4500-aba3-649e4d559a9c	573d476a-6ba0-409f-894a-0d2ea25f1e80
90c23351-95a3-452f-b2c4-1aaf98113f11	573d476a-6ba0-409f-894a-0d2ea25f1e80
99818914-39d3-40fd-b60b-935a2bb949ba	573d476a-6ba0-409f-894a-0d2ea25f1e80
bcc46b8b-66a7-4ee8-bfea-e087d34ccab2	573d476a-6ba0-409f-894a-0d2ea25f1e80
bd47634d-ee15-40aa-b6d0-8f90a259769a	573d476a-6ba0-409f-894a-0d2ea25f1e80
2a7e60eb-5e6c-4cf0-8c8c-80a3552f1b0d	a815b7cc-f2f5-400f-a015-bf934abb0eb4
86716ae4-725b-460d-aced-9161fe85e828	30bb4871-2e3a-4ef9-aaae-5ac586db85f3
b931a1bc-f7a8-4057-98af-7ad5bc581d7d	573d476a-6ba0-409f-894a-0d2ea25f1e80
b73b7749-a308-4253-9786-095d3e762461	02ddc6c3-bcdc-48c9-8e68-8634f243fab8
ce801943-f574-42f1-91f1-f1777da4c08e	a815b7cc-f2f5-400f-a015-bf934abb0eb4
1ac180ec-3281-4360-95a8-d825b28d18d4	c5c95a06-8778-4eca-93b1-59382a622970
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
85e4fd00-ce99-4457-86e3-680ce7b2f84b	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
b5be7c2b-fb7d-428b-bafa-46f0d522f709	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
220962aa-4dc8-47eb-983f-80041371545e	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
3c2f333f-d90d-416b-8c1a-9842fca86f05	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
179025fa-099f-4b07-98e6-06df2be2f455	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	27:45:7E:B4
215e0216-64a5-44f9-91d3-af806ff9b916	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	D7:95:55:B4
6eb99e7d-9eb0-4ef2-a97e-5a60c1c3bee2	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	67:5A:70:B4
75d4ac31-5588-4500-aba3-649e4d559a9c	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	17:CD:7F:5A
90c23351-95a3-452f-b2c4-1aaf98113f11	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	67:CD:7E:5A
99818914-39d3-40fd-b60b-935a2bb949ba	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	D7:F1:7D:5A
bcc46b8b-66a7-4ee8-bfea-e087d34ccab2	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	97:17:60:B4
bd47634d-ee15-40aa-b6d0-8f90a259769a	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	B7:5A:79:B5
2a7e60eb-5e6c-4cf0-8c8c-80a3552f1b0d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
86716ae4-725b-460d-aced-9161fe85e828	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$iL44gg+6/ikyYWh+/fZR4/gi6DViNZytUYE7Vc2a10Khxrj7	\N	\N	\N	\N	\N	\N
b931a1bc-f7a8-4057-98af-7ad5bc581d7d	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$oVyHfnJU/RvqWNkOHJSsLqQZHb3QLcBfp+VgGM5a3I1skl/+	\N	\N	\N	\N	\N	\N
b73b7749-a308-4253-9786-095d3e762461	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$cOxnzZdFU/ZzlHmHBj7enK+NfSkpW7SyKneoeGMSOocR7a0g	\N	\N	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
ce801943-f574-42f1-91f1-f1777da4c08e	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$nrRRudQUTMFt9a/bSvCwm5WuBMPtMTbT0OSGLeV8irItH503	\N	\N	\N	\N	\N	\N
1ac180ec-3281-4360-95a8-d825b28d18d4	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$7NKy2TmZrPpXrU/n+7SIPx3ZhqysaPrKnFF57o046fv1Fe3j	\N	\N	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0af01390-b0a7-40b9-8e3c-92805f6533a6	2	Заполняющий	270	310	23	26	\N	\N	c15d7c47-74ab-4383-a49e-2174abb82c6e	\N
12bfad3a-42d9-45f2-8bee-4ad3d121e66d	1	Корневой	200	270	23	26	\N	\N	ec7cf2b1-b512-4b9b-b61f-58e6c86d95ea	\N
141251e3-7958-4265-a06a-f434902529ba	2	Заполняющий	270	310	23	26	\N	\N	b036493f-6835-4bb2-b3ae-d0cb9a60d23d	\N
178f1d28-fa14-4084-9cfd-5fe6e2ab0328	2	Заполняющий	270	310	23	26	\N	\N	5220515b-120c-4852-bea8-5c9335666b1d	\N
19b2bc21-0ce8-480f-ac45-0ae320142f3f	2	Заполняющий	270	310	23	26	\N	\N	2917930a-e8f8-4407-8c7b-c964a0097724	\N
27be8e89-a3ba-4203-ad70-f1628a67abd5	2	Заполняющий	270	310	23	26	\N	\N	14339fbf-0749-437d-9520-3482dc645d6e	\N
374a5d41-8fdb-4543-baff-6c62bbcd8773	1	Корневой	200	270	23	26	\N	\N	14339fbf-0749-437d-9520-3482dc645d6e	\N
49d2e0d2-d8ce-4a51-8e79-a9fd32137848	1	Корневой	200	270	23	26	\N	\N	f67dca26-179a-4858-935e-681cc7dc85ff	\N
54ee579c-9790-4d9b-a6d4-2e4bf6b5c7d6	2	Заполняющий	270	310	23	26	\N	\N	35ad0d7d-14e6-4f23-bec1-23f86c9d3d57	\N
5c97c3ea-3996-47cd-bef6-0d8225348460	2	Заполняющий	270	310	23	26	\N	\N	d72cfaef-d948-4192-b85d-a72354f8f594	\N
655d2315-94a7-4265-b39c-50dd8dc8ff94	1	Корневой	200	270	23	26	\N	\N	c15d7c47-74ab-4383-a49e-2174abb82c6e	\N
6ae928cb-c1ae-4c30-b27f-aa2f4c7f1456	1	Корневой	200	270	23	26	\N	\N	5220515b-120c-4852-bea8-5c9335666b1d	\N
727360eb-218d-4163-b37e-49cb8dbdbb18	1	Корневой	200	270	23	26	\N	\N	96561b2e-5da7-47f0-90d0-dab9e81b388a	\N
80daff28-860a-4122-b822-01a4a3473600	1	Корневой	200	270	23	26	\N	\N	f528dfc0-a648-4a03-93b9-2f7459570956	\N
98dbca35-2a82-4920-a340-4aedda010db6	2	Заполняющий	270	310	23	26	\N	\N	f528dfc0-a648-4a03-93b9-2f7459570956	\N
ab3f97ef-9cbe-421b-b097-3477b53c0fec	1	Корневой	200	270	23	26	\N	\N	35ad0d7d-14e6-4f23-bec1-23f86c9d3d57	\N
b31b24f6-f4a6-41e9-97a4-2749dadae730	2	Заполняющий	270	310	23	26	\N	\N	96561b2e-5da7-47f0-90d0-dab9e81b388a	\N
ba1f79fb-df3e-4473-ba7a-c6af4dc6bdfb	1	Корневой	200	270	23	26	\N	\N	d72cfaef-d948-4192-b85d-a72354f8f594	\N
c1774042-d886-425a-a318-a49c018a2ce7	1	Корневой	200	270	23	26	\N	\N	2917930a-e8f8-4407-8c7b-c964a0097724	\N
c389aea7-98c2-4da8-b83e-a95c40c28e51	1	Корневой	200	270	23	26	\N	\N	b036493f-6835-4bb2-b3ae-d0cb9a60d23d	\N
d4124489-594e-4225-849b-93de5907074f	2	Заполняющий	270	310	23	26	\N	\N	ec7cf2b1-b512-4b9b-b61f-58e6c86d95ea	\N
e73a002a-2ec4-4b74-81a4-df73e3118416	2	Заполняющий	270	310	23	26	\N	\N	f67dca26-179a-4858-935e-681cc7dc85ff	\N
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
1dff370c-c16e-4db6-ad53-2eac4b075c4e	7def6c87-fc5d-4fdd-836b-4e147a119570
1dff370c-c16e-4db6-ad53-2eac4b075c4e	e4cf16be-a162-410a-8b4e-06c6e9935b33
34042bae-7dc5-4ef9-b6da-c60cdaa1f437	40aedf45-f13d-4206-986e-3ed5bb271ec3
42374ad7-594c-438a-adb4-39997007f4a9	40aedf45-f13d-4206-986e-3ed5bb271ec3
64279ec2-18c5-4ee7-b65e-038232465b02	f5144c02-8e54-4b82-a2da-6ec3577161c3
7ac1eb40-51ad-451c-86a4-20a752fb262c	7def6c87-fc5d-4fdd-836b-4e147a119570
7ac1eb40-51ad-451c-86a4-20a752fb262c	e4cf16be-a162-410a-8b4e-06c6e9935b33
94702871-2209-46b7-b77e-677c5544937b	f5144c02-8e54-4b82-a2da-6ec3577161c3
aa944c6f-631f-4578-a230-918aab9cc8b5	7def6c87-fc5d-4fdd-836b-4e147a119570
aa944c6f-631f-4578-a230-918aab9cc8b5	e4cf16be-a162-410a-8b4e-06c6e9935b33
b02327b7-adee-45c1-ab2a-d007c311c3a3	7def6c87-fc5d-4fdd-836b-4e147a119570
b02327b7-adee-45c1-ab2a-d007c311c3a3	e4cf16be-a162-410a-8b4e-06c6e9935b33
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
1dff370c-c16e-4db6-ad53-2eac4b075c4e	99818914-39d3-40fd-b60b-935a2bb949ba	\N	114729
34042bae-7dc5-4ef9-b6da-c60cdaa1f437	6eb99e7d-9eb0-4ef2-a97e-5a60c1c3bee2	\N	117390
42374ad7-594c-438a-adb4-39997007f4a9	bd47634d-ee15-40aa-b6d0-8f90a259769a	\N	121267
64279ec2-18c5-4ee7-b65e-038232465b02	215e0216-64a5-44f9-91d3-af806ff9b916	\N	132695
7ac1eb40-51ad-451c-86a4-20a752fb262c	bcc46b8b-66a7-4ee8-bfea-e087d34ccab2	\N	150838
94702871-2209-46b7-b77e-677c5544937b	90c23351-95a3-452f-b2c4-1aaf98113f11	\N	122575
aa944c6f-631f-4578-a230-918aab9cc8b5	75d4ac31-5588-4500-aba3-649e4d559a9c	\N	150882
b02327b7-adee-45c1-ab2a-d007c311c3a3	179025fa-099f-4b07-98e6-06df2be2f455	\N	146164
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
40aedf45-f13d-4206-986e-3ed5bb271ec3	2a4fa07a-f468-4212-81a5-b597cfe0e145
40aedf45-f13d-4206-986e-3ed5bb271ec3	9464400f-cf50-424e-81e7-39117c3947ce
7def6c87-fc5d-4fdd-836b-4e147a119570	14f189d6-c391-42bc-a57d-583636e5e803
7def6c87-fc5d-4fdd-836b-4e147a119570	7dbb6e5f-8e8a-41c3-b48b-50e5f0b296ef
7def6c87-fc5d-4fdd-836b-4e147a119570	9464400f-cf50-424e-81e7-39117c3947ce
7def6c87-fc5d-4fdd-836b-4e147a119570	c1b73bd4-d5aa-4004-8511-4ec8477c35ff
e4cf16be-a162-410a-8b4e-06c6e9935b33	14f189d6-c391-42bc-a57d-583636e5e803
e4cf16be-a162-410a-8b4e-06c6e9935b33	7dbb6e5f-8e8a-41c3-b48b-50e5f0b296ef
e4cf16be-a162-410a-8b4e-06c6e9935b33	9464400f-cf50-424e-81e7-39117c3947ce
e4cf16be-a162-410a-8b4e-06c6e9935b33	c1b73bd4-d5aa-4004-8511-4ec8477c35ff
f5144c02-8e54-4b82-a2da-6ec3577161c3	14f189d6-c391-42bc-a57d-583636e5e803
f5144c02-8e54-4b82-a2da-6ec3577161c3	34b58b1d-6bc8-489a-840d-99785f25ef00
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
40aedf45-f13d-4206-986e-3ed5bb271ec3	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	a801c41b-9294-43b6-981a-1d393864d280	49232	03:3D:93:0D
7def6c87-fc5d-4fdd-836b-4e147a119570	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	a801c41b-9294-43b6-981a-1d393864d280	49141	93:57:D8:0B
e4cf16be-a162-410a-8b4e-06c6e9935b33	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	a801c41b-9294-43b6-981a-1d393864d280	49283	A6:F1:CF:48
f5144c02-8e54-4b82-a2da-6ec3577161c3	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	a801c41b-9294-43b6-981a-1d393864d280	49286	35:4E:AC:A5
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
06862726-40c6-4b13-a051-6c90a5b9fdb0	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b63ea717-d8c8-4be3-bfed-b835b1c3c4ff	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
1f8aa35b-b288-4850-b840-f2df03db48da	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4e4edace-1ee4-4106-8d3b-8ab9b5fa6d3a	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
23f7e8ac-f705-4a74-a198-a0828fa89b2e	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	797da7d9-4145-4149-bc1e-c84bd600c874	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
29361226-925a-46da-99be-a2efc9a9a4c9	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ddddb1a7-d379-47f0-a7d2-f3bab10b4bd4	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
41c4ca9d-c422-47f9-85ad-b7fbf37fecdd	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3b538723-bc4b-428d-bbc7-713f6c348c20	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
67c2866f-ba33-45e9-8f77-cb10f563a353	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	89bc4dc2-2ba9-4baf-b601-8ee6b51a701e	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
693f4d6e-058f-4acc-b9c1-482eef5b5bc0	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3ccbd1e6-81d7-4ba6-a011-88d9b7df6393	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
6b48555a-174f-4be3-9ee3-6c48bdc46571	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7cc32045-3b9c-4cdf-bbbc-202b41436bac	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
9150e57c-d2ee-4110-915b-316c88013070	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	af5e20f5-2c4a-4769-8afe-a07103c1b35f	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
9730b5a5-34ed-4681-9bcd-117c3b0e801b	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1f704aba-b518-47b6-8632-0938ee500feb	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
99acb949-7007-48c9-8fa8-97d57121b712	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c3f58ca5-a8ba-45d1-8322-8f690cd293dd	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
a0476597-070a-48cb-b690-2f01e3a4a04d	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f393be74-8408-428e-9186-e7416a0c6b83	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
a8cbc6fa-3b35-454b-b8c7-027cc9b6c249	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d1164d43-f75b-437a-8eb1-f014a3038328	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
b7c4a106-9873-42f4-b661-53744a13bfb6	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6ca08943-3712-4126-aa90-9d704c479f4f	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
c2b1a502-916d-4102-9928-85bb3c8b74d7	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	19ede928-c2e8-458e-ad8a-f2c34ff12ef0	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
e2e13893-d242-4698-ac54-c61f669e0855	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b8e2bc77-da88-4787-aea9-ee970598d3dd	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
f464288e-7eab-4967-8dec-3d9cf0b2606c	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cdac9d59-78e5-4336-ab33-95fd084c49cd	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
f85bf4b3-8553-475c-846d-03cfea1b4e51	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8e6e4fc7-949e-4130-8279-fea5f5b13e0c	\N	a801c41b-9294-43b6-981a-1d393864d280	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
c9e6a638-7904-4670-87be-7e8604d61847	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	61541311-6d95-4b80-9547-cada3a1f0402	\N
dd921dfc-0247-4931-91cc-4bbca85622e4	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	61541311-6d95-4b80-9547-cada3a1f0402	\N
fe606654-5a9d-4cc9-ae21-1613c4ded022	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	61541311-6d95-4b80-9547-cada3a1f0402	\N
90012557-5087-4055-8400-d5bf344057f9	1	12:10:00	13:10:00	13:20:00	13:50:00	1de84305-f055-4afb-a2ad-fa3315422daf	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
14f189d6-c391-42bc-a57d-583636e5e803	3500	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	3500
2a4fa07a-f468-4212-81a5-b597cfe0e145	3600	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	3600
34b58b1d-6bc8-489a-840d-99785f25ef00	3510	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	3510
7dbb6e5f-8e8a-41c3-b48b-50e5f0b296ef	3690	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	3690
9464400f-cf50-424e-81e7-39117c3947ce	3610	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	3610
c1b73bd4-d5aa-4004-8511-4ec8477c35ff	3550	\N	b379fc38-15a2-49af-af8a-11d0361fb4ae	3550
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
a8337339-0302-4870-a210-dddea6bd4fa7	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 18, true);


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
    ADD CONSTRAINT "FK_WeldingTasks_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id");


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

