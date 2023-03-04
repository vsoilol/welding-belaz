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
85589dad-7102-4cce-8657-414089727ef4	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
d160e2aa-f4a4-4800-af39-60abfb39646e	05274e2b-987c-488a-8ad8-c78e15a9f545	8bf6291c-34f7-4371-857c-0e85efcbc1d3	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
50b9f814-83bb-4f0d-990e-1aeeffc982b5	1	10	t	85589dad-7102-4cce-8657-414089727ef4	\N
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
094ecca7-2802-4471-b947-48dfb4ff660d	Изменение режимов, смена инструмента, приспособления	\N
0b3f83ea-400e-4058-99ea-c40239b2900a	Праздники и выходные	\N
1d1e3ce9-d49c-4012-b3dc-429eced27ad7	Работа по карте несоответствий	\N
441efc2e-5891-42a0-9cf0-aede5c7a5a87	Контроль на рабочем месте	\N
509c59cd-ffc4-4222-bc34-2568b4c68a55	Нерабочее время по графику согласно сменности	\N
579a4af3-0a0a-40d1-beda-77015e568636	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
644a0a9a-234a-4521-950f-a51307d06d4a	Отсутствие конструктора, технолога или ожидание его решения	\N
7b69636a-b238-4158-8d0c-a0d8420f66fc	Обед	\N
7dba511f-6f56-4b3f-852e-ca22ac9e75d5	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
84d2ad9e-a73c-41e7-99f2-8e8c008cef5d	Отсутствие заданий	\N
901723e0-76d1-4259-b22e-8d4b54c0a37a	Аварийный ремонт централизованными службами	\N
9085086b-58b8-4eaa-a76f-abaef37dae85	Естественные надобности	\N
9b205ab5-75d7-436f-b3ab-0d4183e391ab	Установка, выверка, снятие детали	\N
a8544d0c-bdf5-46ce-a31a-22479a44c5ca	Ознакомление с работой, документацией, инструктаж	\N
a9169068-80fc-43eb-8b82-762d89feae5e	Сборочные операции	\N
ad67a453-006f-411f-a5ce-11aa13cc6406	Отсутствие сотрудника ОТК	\N
b373d335-7f88-437c-9022-0b1b92ef736f	Отсутствие оператора в связи с необеспеченностью	\N
be1695a2-8dbe-4ccf-907c-313c15770d43	Отсутствие материала, заготовок, деталей	\N
c1dfd652-f094-425c-abe6-ced2e154e236	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
c2f39974-ec2b-4ea0-b08d-b4c9ad4d1520	Установка, выверка, снятие детали	\N
c4c55956-4267-4a9f-a8b5-d5f7b80c7784	Отсутствие энергоносителей	\N
c5d086fd-df8f-4e11-bcbb-f205d77965f5	Отсутствие крана, транспорта	\N
e11eabe7-42a5-4dbe-83f9-1d539935d1f5	Неявка оператора (б/лист, отпуск, и пр.)	\N
e73f09d1-783e-4f2b-a634-12c6c2d88010	Работа с управляющей программой	\N
eae384b9-cbb1-4921-a8e4-55dfb5d0448d	Плановый ремонт централизованными службами	\N
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
cbe02a77-e7d5-4a8c-b0ee-9e25f70bbb4f	e3286fa9-5014-4539-b458-2ed37c2f498f	249550
e32ab057-81ee-442d-816a-109ce2f9b326	107a07f9-7c23-48e6-8ee3-ff8f0c1ad9e8	219379
12bd1fde-8175-4e3b-b64b-0e3280d9005f	e4f78764-f0fc-46c0-b7cf-3cda49ccfc9d	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	8469490a-6787-45b7-83ab-cb15b54cd7d4	610422
1a0a762d-ed84-4ff6-b078-4f0372595bda	f85d439c-4898-4ad4-9e5b-c09e11c1c5bc	\N
de39e0be-4824-4757-a7d0-f11190794fce	54962869-b87d-4a4f-bf4e-d96862010304	614962
5db792db-a052-48a9-b57d-ec57672ce929	65519721-3656-4802-8993-1abed0b43718	\N
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
05a20ea4-fe2a-4034-af9a-fd5564d1604c	5	2	2023-03-04 21:08:40.800176	213b4a8e-121c-4114-91fd-df5a42cb2fe9	\N
1bb0bf70-8cf4-4684-98ba-d7dfe8f481a6	37	2	2023-03-04 21:08:40.803129	e6ad8129-8888-4c6b-86aa-0a397330cc18	\N
20d53556-0523-430d-9893-11f22589f17a	28	2	2023-03-04 21:08:40.802292	ca7a1da1-1baa-4e6b-9c05-cb9fab3d06b8	\N
2284f42c-3e63-44ed-9713-353611e5663f	19	2	2023-03-04 21:08:40.801482	7216aa5c-654d-48ee-8345-d945a585e05c	\N
241cad83-bc15-41d1-88f9-24fd58906df8	30	2	2023-03-04 21:08:40.802475	d49c3064-99f1-4115-9b5d-2279dc76897e	\N
25f1f6bb-fac4-40af-9b83-8cc3b4650d9e	15	2	2023-03-04 21:08:40.801111	5d47bf41-20f1-49e0-93ac-cfaa10f70430	\N
2621910c-23ea-43d4-8dc3-98a005a2afa1	12	2	2023-03-04 21:08:40.800831	4ae60778-badb-4548-aa6e-41761cbbc9ba	\N
263b48fa-b8f6-437e-82cf-5dca42e92859	6	2	2023-03-04 21:08:40.800261	2c51789e-f53e-448e-a066-5e38ad1193d5	\N
292bcafc-f61e-46a5-9bd6-d82f8d94e1a7	32	2	2023-03-04 21:08:40.802666	db62e132-c1c8-48e2-be16-ffd45acaf97b	\N
348417c5-1c6d-4112-b84b-02c6c79b88c5	40	2	2023-03-04 21:08:40.803403	f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	\N
4d144af3-e127-467f-8a33-614929b29b1b	24	2	2023-03-04 21:08:40.801936	af026bdb-061d-41ea-9dc4-d18693c2e54b	\N
50c0b48e-e799-4061-98b4-27db94daf6cd	11	2	2023-03-04 21:08:40.800708	472697c3-31e7-4694-82a0-b8f6e74a0a84	\N
688e323b-6f4d-4606-856b-725c962f2937	25	2	2023-03-04 21:08:40.802029	af6da198-c42a-44ef-b793-5af305699a6b	\N
6b147041-52c9-4f9a-b571-e9f31b720091	27	2	2023-03-04 21:08:40.802204	c22b291f-2c4b-4928-9d5e-79b91308fae9	\N
737d16d7-81cc-484b-bba7-e42979d0f311	7	2	2023-03-04 21:08:40.800354	2dd47a80-acc3-4013-901b-1f304e1db8f4	\N
7b90662c-ee10-4e32-8110-2b88045181e8	34	2	2023-03-04 21:08:40.802848	e086d6f5-6825-4742-8d83-2674bf3dca5b	\N
7e24f84d-7d2e-4509-8bb0-a39fe55c2519	42	2	2023-03-04 21:08:40.803575	f58ea111-8f2a-472e-97f4-b75cc1da008d	\N
7ec9e5da-0562-4ba4-8170-59c12767c3aa	23	2	2023-03-04 21:08:40.801847	a56b4238-eeac-44c8-bc69-dbb77e5365dd	\N
80d43f4e-ba87-4ff7-a8e1-2402af44955c	16	2	2023-03-04 21:08:40.801205	61bd3331-7d8b-4497-b3ba-623f07ca8afa	\N
8d4368dd-3595-4b32-abb7-01f29c596baa	26	2	2023-03-04 21:08:40.802117	b128d143-1bee-4dc0-8be4-464ebf9eb600	\N
9518ce79-aa1e-4379-a953-564db0ec624f	1	2	2023-03-04 21:08:40.771695	116d234a-c731-4deb-895b-1ab6e840fed5	\N
98d27f8f-5e8b-41b0-a47b-4bfb10d5bb5e	31	2	2023-03-04 21:08:40.802578	d92b82ce-bdf6-4297-a3be-6f1b51b2bec3	\N
99576a6f-8d09-4588-9894-08a841f2c0ea	38	2	2023-03-04 21:08:40.803218	e7d3951d-0018-4462-9c8f-457071489b39	\N
9adc9ba3-f969-4cb4-806a-fa1f09dc7030	35	2	2023-03-04 21:08:40.802945	e1c623b6-7cae-40be-bc8e-45b98f52b62e	\N
a0b7c448-9599-4688-b79e-8d42ce85d1cb	20	2	2023-03-04 21:08:40.801577	7c5a8a2d-2234-4c7e-93f2-1a875c16a224	\N
a2138d63-7b81-4335-9e47-56063960f37c	29	2	2023-03-04 21:08:40.802385	d1702cd2-671d-408f-bbf2-779f37844d87	\N
a4d8a02a-6ce5-4210-aa27-ee49d66bd3e1	17	2	2023-03-04 21:08:40.801297	675f9fbb-acb3-4c0f-9664-fab447c2ae46	\N
ac8b4763-e69d-4f4b-9250-d78f055feaed	2	2	2023-03-04 21:08:40.799856	1865be50-9e1a-44a8-af97-1ef21571e048	\N
aec3f219-e8b2-4047-9f8a-cd14f5c6c843	8	2	2023-03-04 21:08:40.800442	2f886464-4fed-4078-88d8-983a8ba83c2a	\N
b29b0538-4bb3-413a-8464-c3850270810f	33	2	2023-03-04 21:08:40.802754	dc649dad-434d-4124-b049-2b97fc6ad45d	\N
b4698864-7fbe-4ac1-9e88-e48e19bd482a	14	2	2023-03-04 21:08:40.801011	5543d18d-6806-4653-83df-3442ede71d45	\N
b6f5904f-0ef6-4a22-9371-fd29d28a5dd9	18	2	2023-03-04 21:08:40.801385	69879bd4-4d47-457e-92fb-794cb765c6de	\N
ba88f87d-e81e-490a-892c-5ab6f30bcdae	9	2	2023-03-04 21:08:40.800533	30fb30a3-3010-4ec6-9234-8f312098bd52	\N
c473021b-5aee-4b0c-9d69-062744c441bd	4	2	2023-03-04 21:08:40.800084	1ebf0c71-3547-43ec-99b2-b2b0787c90e0	\N
c829559c-de04-48a2-bf58-b3bf61ea7858	41	2	2023-03-04 21:08:40.803491	f462830c-c5fe-4ff6-b5d6-10f217d2461b	\N
cd5a91a3-286a-456b-81ab-d7a16ed68cbc	36	2	2023-03-04 21:08:40.803037	e63cde5a-dc9b-4bed-adc9-5331b0a86471	\N
d23af168-e9b8-4d25-8869-397562ae51c8	13	2	2023-03-04 21:08:40.800923	524371fd-f395-467f-828d-70f4990d32ef	\N
f029910c-f498-4488-86cc-b5cf2e764bc2	39	2	2023-03-04 21:08:40.803312	eda2257c-9aae-4e7c-82b6-76b706ea25a8	\N
f27a4752-7ae6-4b16-a94c-04b542bafb61	21	2	2023-03-04 21:08:40.801669	7dd68d4c-bad1-407c-a232-1a94d8928f93	\N
f5ae6b7f-779a-483a-b910-cc170a81d9f0	22	2	2023-03-04 21:08:40.801757	7e765717-de5a-4541-a7ef-3ed2b2940bc0	\N
f68439a0-7674-4aee-b973-b425ab612120	10	2	2023-03-04 21:08:40.80062	3c469e7b-3a43-406c-b9ae-f3b63edaf499	\N
fb16c5ef-1c0c-48e2-a245-a5e8c93007f3	3	2	2023-03-04 21:08:40.799978	1c873e2e-5905-48ba-afcc-7d17ac5aa5b1	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
f58ea111-8f2a-472e-97f4-b75cc1da008d	116d234a-c731-4deb-895b-1ab6e840fed5
2dd47a80-acc3-4013-901b-1f304e1db8f4	1865be50-9e1a-44a8-af97-1ef21571e048
69879bd4-4d47-457e-92fb-794cb765c6de	1c873e2e-5905-48ba-afcc-7d17ac5aa5b1
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	1ebf0c71-3547-43ec-99b2-b2b0787c90e0
472697c3-31e7-4694-82a0-b8f6e74a0a84	213b4a8e-121c-4114-91fd-df5a42cb2fe9
5543d18d-6806-4653-83df-3442ede71d45	2c51789e-f53e-448e-a066-5e38ad1193d5
f58ea111-8f2a-472e-97f4-b75cc1da008d	2dd47a80-acc3-4013-901b-1f304e1db8f4
f58ea111-8f2a-472e-97f4-b75cc1da008d	2f886464-4fed-4078-88d8-983a8ba83c2a
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	30fb30a3-3010-4ec6-9234-8f312098bd52
af6da198-c42a-44ef-b793-5af305699a6b	3c469e7b-3a43-406c-b9ae-f3b63edaf499
f58ea111-8f2a-472e-97f4-b75cc1da008d	472697c3-31e7-4694-82a0-b8f6e74a0a84
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	4ae60778-badb-4548-aa6e-41761cbbc9ba
af6da198-c42a-44ef-b793-5af305699a6b	524371fd-f395-467f-828d-70f4990d32ef
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	5543d18d-6806-4653-83df-3442ede71d45
2dd47a80-acc3-4013-901b-1f304e1db8f4	5d47bf41-20f1-49e0-93ac-cfaa10f70430
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	61bd3331-7d8b-4497-b3ba-623f07ca8afa
61bd3331-7d8b-4497-b3ba-623f07ca8afa	675f9fbb-acb3-4c0f-9664-fab447c2ae46
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	69879bd4-4d47-457e-92fb-794cb765c6de
116d234a-c731-4deb-895b-1ab6e840fed5	7216aa5c-654d-48ee-8345-d945a585e05c
2dd47a80-acc3-4013-901b-1f304e1db8f4	7c5a8a2d-2234-4c7e-93f2-1a875c16a224
f58ea111-8f2a-472e-97f4-b75cc1da008d	7dd68d4c-bad1-407c-a232-1a94d8928f93
2dd47a80-acc3-4013-901b-1f304e1db8f4	7e765717-de5a-4541-a7ef-3ed2b2940bc0
f58ea111-8f2a-472e-97f4-b75cc1da008d	a56b4238-eeac-44c8-bc69-dbb77e5365dd
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	af026bdb-061d-41ea-9dc4-d18693c2e54b
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	af6da198-c42a-44ef-b793-5af305699a6b
f58ea111-8f2a-472e-97f4-b75cc1da008d	b128d143-1bee-4dc0-8be4-464ebf9eb600
61bd3331-7d8b-4497-b3ba-623f07ca8afa	c22b291f-2c4b-4928-9d5e-79b91308fae9
2dd47a80-acc3-4013-901b-1f304e1db8f4	ca7a1da1-1baa-4e6b-9c05-cb9fab3d06b8
116d234a-c731-4deb-895b-1ab6e840fed5	d1702cd2-671d-408f-bbf2-779f37844d87
7dd68d4c-bad1-407c-a232-1a94d8928f93	d49c3064-99f1-4115-9b5d-2279dc76897e
30fb30a3-3010-4ec6-9234-8f312098bd52	d92b82ce-bdf6-4297-a3be-6f1b51b2bec3
af6da198-c42a-44ef-b793-5af305699a6b	db62e132-c1c8-48e2-be16-ffd45acaf97b
69879bd4-4d47-457e-92fb-794cb765c6de	dc649dad-434d-4124-b049-2b97fc6ad45d
f58ea111-8f2a-472e-97f4-b75cc1da008d	e086d6f5-6825-4742-8d83-2674bf3dca5b
af6da198-c42a-44ef-b793-5af305699a6b	e1c623b6-7cae-40be-bc8e-45b98f52b62e
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	e63cde5a-dc9b-4bed-adc9-5331b0a86471
f58ea111-8f2a-472e-97f4-b75cc1da008d	e6ad8129-8888-4c6b-86aa-0a397330cc18
af6da198-c42a-44ef-b793-5af305699a6b	e7d3951d-0018-4462-9c8f-457071489b39
2f886464-4fed-4078-88d8-983a8ba83c2a	eda2257c-9aae-4e7c-82b6-76b706ea25a8
7dd68d4c-bad1-407c-a232-1a94d8928f93	f462830c-c5fe-4ff6-b5d6-10f217d2461b
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
0591e7ba-e5dd-4b72-b80b-5e0d00088c0b	0	2	\N	\N	f68439a0-7674-4aee-b973-b425ab612120	\N
05a743dc-c2cf-40b6-b0db-3b9b08a3ec3f	0	1	\N	\N	6b147041-52c9-4f9a-b571-e9f31b720091	\N
0644152d-69d2-4716-a685-5b91eb4e039a	0	3	\N	\N	241cad83-bc15-41d1-88f9-24fd58906df8	\N
0f9c45b9-2765-4e0c-9652-25c8742ffeb4	0	1	\N	\N	fb16c5ef-1c0c-48e2-a245-a5e8c93007f3	\N
109c24b2-f98e-4381-bc49-bcd2c7e55eeb	0	1	\N	\N	80d43f4e-ba87-4ff7-a8e1-2402af44955c	\N
11a72f80-eebd-4a03-bc43-d1af940e7247	0	1	\N	\N	7e24f84d-7d2e-4509-8bb0-a39fe55c2519	\N
15193bd3-2161-4483-b141-1b57f0914db5	0	3	\N	\N	80d43f4e-ba87-4ff7-a8e1-2402af44955c	\N
15ff58e8-ba2c-416c-8784-724d0df55842	0	1	\N	\N	f029910c-f498-4488-86cc-b5cf2e764bc2	\N
19aeafb8-1257-4bbd-80df-3c9c20628846	0	1	\N	\N	25f1f6bb-fac4-40af-9b83-8cc3b4650d9e	\N
1cdc51c6-f5e2-49de-974a-d8fcacf359bf	0	3	\N	\N	7ec9e5da-0562-4ba4-8170-59c12767c3aa	\N
1e971b92-2724-4feb-a50b-d7d8bb195f0a	0	3	\N	\N	292bcafc-f61e-46a5-9bd6-d82f8d94e1a7	\N
1ec7d810-4b0b-46f1-b78b-37851431f099	0	3	\N	\N	f68439a0-7674-4aee-b973-b425ab612120	\N
1fe19c41-f765-47c8-9053-0fd1bc3737de	0	3	\N	\N	99576a6f-8d09-4588-9894-08a841f2c0ea	\N
2261e439-10c2-4a8d-aa33-c97fa736adda	0	1	\N	\N	f5ae6b7f-779a-483a-b910-cc170a81d9f0	\N
258c14fe-e10e-45c6-8b92-9e7bb05fd664	0	1	\N	\N	ac8b4763-e69d-4f4b-9250-d78f055feaed	\N
2be8cae7-0bc8-42c8-a545-12fd932d0291	0	2	\N	\N	737d16d7-81cc-484b-bba7-e42979d0f311	\N
39a122bf-1fff-424c-be73-2b21bf1958ac	0	2	\N	\N	d23af168-e9b8-4d25-8869-397562ae51c8	\N
39d4afc2-1058-4dd9-b377-be17c0959c5b	0	1	\N	\N	a4d8a02a-6ce5-4210-aa27-ee49d66bd3e1	\N
3f6e6eb2-c28a-486e-b5ef-6fe935aee544	0	2	\N	\N	2284f42c-3e63-44ed-9713-353611e5663f	\N
3ff0e60a-1813-4961-b2f2-b8931d2c294a	0	1	\N	\N	292bcafc-f61e-46a5-9bd6-d82f8d94e1a7	\N
407c044c-6b87-463b-9d39-3f2b0a318916	0	1	\N	\N	f27a4752-7ae6-4b16-a94c-04b542bafb61	\N
415c20da-4647-4b3a-88df-0bd1eb7426f6	0	1	\N	\N	50c0b48e-e799-4061-98b4-27db94daf6cd	\N
422f79e3-55cc-4f7f-96dd-f4535ca37a24	0	1	\N	\N	2284f42c-3e63-44ed-9713-353611e5663f	\N
42ce610d-3e59-42bd-a80e-a7b8d418f556	0	2	\N	\N	b6f5904f-0ef6-4a22-9371-fd29d28a5dd9	\N
4715f4c6-9e07-452e-a81f-7bbb0d51605b	0	2	\N	\N	f029910c-f498-4488-86cc-b5cf2e764bc2	\N
4829b0a1-139b-4100-b00e-0ffa9da46bd5	0	1	\N	\N	7ec9e5da-0562-4ba4-8170-59c12767c3aa	\N
486c3919-1ab3-4042-8e0a-604fb317235b	0	2	\N	\N	ba88f87d-e81e-490a-892c-5ab6f30bcdae	\N
48f266d5-8a84-4d32-bffb-9ab9917f4d81	0	3	\N	\N	688e323b-6f4d-4606-856b-725c962f2937	\N
4c92ba1d-7f58-4c13-83d2-804b885b93b5	0	1	\N	\N	263b48fa-b8f6-437e-82cf-5dca42e92859	\N
4edfeaad-016f-4a9d-b977-6759c65c6a38	0	2	\N	\N	263b48fa-b8f6-437e-82cf-5dca42e92859	\N
4eed000e-9e6e-4225-a606-c8af8fd29d99	0	3	\N	\N	f27a4752-7ae6-4b16-a94c-04b542bafb61	\N
501121ef-7468-4148-afad-44c75e0eb6ec	0	1	\N	\N	99576a6f-8d09-4588-9894-08a841f2c0ea	\N
503756a7-bac0-4ca4-b332-6e319f740294	0	1	\N	\N	05a20ea4-fe2a-4034-af9a-fd5564d1604c	\N
53fcafb8-e991-433e-8793-2df4dbc1cb45	0	3	\N	\N	737d16d7-81cc-484b-bba7-e42979d0f311	\N
55b0f9e9-6f9d-4ee0-aab2-7a117e665edc	0	2	\N	\N	f5ae6b7f-779a-483a-b910-cc170a81d9f0	\N
571e9b47-74be-4469-bbb5-6ab19585f3d2	0	2	\N	\N	80d43f4e-ba87-4ff7-a8e1-2402af44955c	\N
575a6611-da4e-48b7-97dc-9283787da693	0	1	\N	\N	ba88f87d-e81e-490a-892c-5ab6f30bcdae	\N
58867ec5-242e-4790-b953-bff4fc4e0142	0	2	\N	\N	98d27f8f-5e8b-41b0-a47b-4bfb10d5bb5e	\N
5b22c4c1-b450-4303-ab06-bfffb92870c4	0	1	\N	\N	688e323b-6f4d-4606-856b-725c962f2937	\N
5f79b3cd-fac5-463c-a61d-87e7e61dae3d	0	2	\N	\N	241cad83-bc15-41d1-88f9-24fd58906df8	\N
60400f78-5fab-45f1-86c6-0b580f963e1f	0	2	\N	\N	ac8b4763-e69d-4f4b-9250-d78f055feaed	\N
64026e56-bebb-4610-900b-d3b81f969989	0	1	\N	\N	7b90662c-ee10-4e32-8110-2b88045181e8	\N
68eceac2-a064-4104-bf70-463c3f8a2b96	0	2	\N	\N	cd5a91a3-286a-456b-81ab-d7a16ed68cbc	\N
6bd2dda4-c8ae-4ec0-b89a-87e914063a85	0	3	\N	\N	9518ce79-aa1e-4379-a953-564db0ec624f	\N
6cbf208b-187d-46b0-ba05-668ac4bd50f8	0	3	\N	\N	a4d8a02a-6ce5-4210-aa27-ee49d66bd3e1	\N
7016c4f5-340b-4ffe-8a57-88c63cdb943d	0	3	\N	\N	2621910c-23ea-43d4-8dc3-98a005a2afa1	\N
70983dad-56c0-4b6b-9d47-5a41edf80648	0	1	\N	\N	a2138d63-7b81-4335-9e47-56063960f37c	\N
718c0552-ebaf-416b-93cc-e1b54b7ab712	0	3	\N	\N	b29b0538-4bb3-413a-8464-c3850270810f	\N
74468db6-de03-4e9f-9755-03e5be05aee0	0	3	\N	\N	ba88f87d-e81e-490a-892c-5ab6f30bcdae	\N
74802566-14ab-4a35-9cfd-33f0aecf9a42	0	1	\N	\N	b6f5904f-0ef6-4a22-9371-fd29d28a5dd9	\N
74b2f915-bb26-4238-b493-302717aa5fc1	0	2	\N	\N	9518ce79-aa1e-4379-a953-564db0ec624f	\N
7b37e1c5-cce1-4c80-802c-9246c3c1d624	0	2	\N	\N	20d53556-0523-430d-9893-11f22589f17a	\N
7bf17110-45fe-4825-9019-971f40e36ecc	0	3	\N	\N	a2138d63-7b81-4335-9e47-56063960f37c	\N
7c9590f8-f6fc-4349-8e14-e06a6197c399	0	1	\N	\N	b4698864-7fbe-4ac1-9e88-e48e19bd482a	\N
8480fd38-279f-439b-9abf-aea20e212e57	0	3	\N	\N	05a20ea4-fe2a-4034-af9a-fd5564d1604c	\N
8491c8bd-b928-4a8f-af58-7545f5ce731d	0	2	\N	\N	aec3f219-e8b2-4047-9f8a-cd14f5c6c843	\N
864bb5c4-a565-4df2-87dc-854a0a77c56d	0	2	\N	\N	25f1f6bb-fac4-40af-9b83-8cc3b4650d9e	\N
8e6e13bd-99b7-4978-b01e-be9442699d6e	0	2	\N	\N	1bb0bf70-8cf4-4684-98ba-d7dfe8f481a6	\N
8f9636a1-152a-4946-8f5f-1ac4615c77ff	0	1	\N	\N	d23af168-e9b8-4d25-8869-397562ae51c8	\N
9242e0eb-ae77-46b6-a545-dce665a0c8d5	0	2	\N	\N	b29b0538-4bb3-413a-8464-c3850270810f	\N
95d1d609-15af-476b-bba7-07272a566f3e	0	1	\N	\N	a0b7c448-9599-4688-b79e-8d42ce85d1cb	\N
96a06b2b-c03e-4e33-b0b3-e77035a5d240	0	2	\N	\N	99576a6f-8d09-4588-9894-08a841f2c0ea	\N
976a4719-b870-4369-ad1c-ff4d619551fd	0	1	\N	\N	f68439a0-7674-4aee-b973-b425ab612120	\N
99e8c544-616f-4a48-ade8-fd36e469f466	0	1	\N	\N	737d16d7-81cc-484b-bba7-e42979d0f311	\N
9a038f97-7e38-4489-b3d3-093911460afe	0	2	\N	\N	7b90662c-ee10-4e32-8110-2b88045181e8	\N
9a9b8a2f-8698-40e0-ad47-4f37aa9aa391	0	2	\N	\N	c473021b-5aee-4b0c-9d69-062744c441bd	\N
9aec9ef6-7cf8-42ae-8178-92a925ed35aa	0	3	\N	\N	7b90662c-ee10-4e32-8110-2b88045181e8	\N
9b2c016a-ce30-46dd-ad5b-85588d00a5cd	0	2	\N	\N	a0b7c448-9599-4688-b79e-8d42ce85d1cb	\N
9e2ab625-0271-401c-8375-be40e2ed55f1	0	3	\N	\N	b6f5904f-0ef6-4a22-9371-fd29d28a5dd9	\N
9ea66515-ff0f-4d2e-b089-ee2e845dae75	0	2	\N	\N	50c0b48e-e799-4061-98b4-27db94daf6cd	\N
a04c8f9d-e2cb-47c3-8528-a498bcb29edd	0	1	\N	\N	1bb0bf70-8cf4-4684-98ba-d7dfe8f481a6	\N
a0e32efe-7f3f-4185-9ecc-91db52f6d891	0	2	\N	\N	8d4368dd-3595-4b32-abb7-01f29c596baa	\N
a0ec9c73-02ea-453f-9538-e855b78dcf85	0	1	\N	\N	241cad83-bc15-41d1-88f9-24fd58906df8	\N
a386c2cf-50c4-4259-ac0e-81b6d45654e2	0	2	\N	\N	4d144af3-e127-467f-8a33-614929b29b1b	\N
a585d3c5-9697-4080-bf9d-ac7888001d92	0	3	\N	\N	20d53556-0523-430d-9893-11f22589f17a	\N
a5ea8645-9d0d-4aed-9eca-caa16951acbb	0	2	\N	\N	c829559c-de04-48a2-bf58-b3bf61ea7858	\N
a766a751-983f-450f-89b1-421d2602c930	0	1	\N	\N	8d4368dd-3595-4b32-abb7-01f29c596baa	\N
a876ff9f-ec18-4089-a3bc-1e07400d23f3	0	3	\N	\N	98d27f8f-5e8b-41b0-a47b-4bfb10d5bb5e	\N
aba464e9-9274-4ca5-be58-5c6ebb7b3d00	0	3	\N	\N	c829559c-de04-48a2-bf58-b3bf61ea7858	\N
ad8aa6d6-11dc-4103-98bf-69a7f65c2a84	0	3	\N	\N	6b147041-52c9-4f9a-b571-e9f31b720091	\N
af2e9330-4c59-45c9-9120-ef2a219fae78	0	2	\N	\N	fb16c5ef-1c0c-48e2-a245-a5e8c93007f3	\N
afb33abb-46d8-457e-921e-c14790e2c675	0	1	\N	\N	2621910c-23ea-43d4-8dc3-98a005a2afa1	\N
b5c3781e-2ea4-4740-af28-b0629fe23e16	0	3	\N	\N	50c0b48e-e799-4061-98b4-27db94daf6cd	\N
bacd068b-90df-4eaa-9f54-30fc41b8491a	0	3	\N	\N	f029910c-f498-4488-86cc-b5cf2e764bc2	\N
bde508bf-a6b1-4f72-8a53-6b87b7792219	0	1	\N	\N	c473021b-5aee-4b0c-9d69-062744c441bd	\N
bec9d76a-bbdc-43a9-b8db-cee3c6067b56	0	1	\N	\N	98d27f8f-5e8b-41b0-a47b-4bfb10d5bb5e	\N
bf889883-643f-4c51-b19c-7d7a4ca716cf	0	2	\N	\N	292bcafc-f61e-46a5-9bd6-d82f8d94e1a7	\N
c06f4f08-50fb-4618-a096-599df24625cb	0	3	\N	\N	b4698864-7fbe-4ac1-9e88-e48e19bd482a	\N
c07bab5e-50fc-42b9-b160-4506ac0fe32b	0	3	\N	\N	1bb0bf70-8cf4-4684-98ba-d7dfe8f481a6	\N
c238b0b5-174b-448d-8a1f-e3d4655422e2	0	3	\N	\N	263b48fa-b8f6-437e-82cf-5dca42e92859	\N
c254b8e0-ef36-4b59-a65e-b1dc9ac5891e	0	3	\N	\N	8d4368dd-3595-4b32-abb7-01f29c596baa	\N
c36d975b-4a50-4fe8-ae91-061c1b6ab101	0	2	\N	\N	348417c5-1c6d-4112-b84b-02c6c79b88c5	\N
c47ed2e4-8e0b-4f3a-b5f3-6cc7ec566d15	0	1	\N	\N	4d144af3-e127-467f-8a33-614929b29b1b	\N
c5363676-bbeb-4078-8b5d-b758f94a18ee	0	2	\N	\N	6b147041-52c9-4f9a-b571-e9f31b720091	\N
c5c36cbb-a208-4138-999c-172d43dcf404	0	2	\N	\N	05a20ea4-fe2a-4034-af9a-fd5564d1604c	\N
c7ff4d14-ff18-4b09-8541-84d08fd5e8d9	0	2	\N	\N	a4d8a02a-6ce5-4210-aa27-ee49d66bd3e1	\N
cc18a83d-a950-4d53-ab6a-d59634201498	0	3	\N	\N	cd5a91a3-286a-456b-81ab-d7a16ed68cbc	\N
cf424bdf-c01b-44a2-8aea-4252ea1c6ab2	0	1	\N	\N	aec3f219-e8b2-4047-9f8a-cd14f5c6c843	\N
d1b7d7a2-fa4b-40bf-9048-bfc943ac5a80	0	2	\N	\N	a2138d63-7b81-4335-9e47-56063960f37c	\N
d33db3fd-18c6-4fd1-a93b-b1df7107ffd6	0	1	\N	\N	b29b0538-4bb3-413a-8464-c3850270810f	\N
d4499410-1c7d-4778-9336-42f5a896fcc5	0	3	\N	\N	f5ae6b7f-779a-483a-b910-cc170a81d9f0	\N
d7a3d6e4-2b1e-46d8-8546-19015f0ba734	0	3	\N	\N	9adc9ba3-f969-4cb4-806a-fa1f09dc7030	\N
d7f6141f-5c79-4ad7-a1c6-32710d57018b	0	3	\N	\N	d23af168-e9b8-4d25-8869-397562ae51c8	\N
d825d833-dd92-4f75-8433-208a7898f908	0	1	\N	\N	cd5a91a3-286a-456b-81ab-d7a16ed68cbc	\N
da62b882-84a2-4eb3-a13c-40893ce838e0	0	2	\N	\N	b4698864-7fbe-4ac1-9e88-e48e19bd482a	\N
dbd6f989-f66c-4d53-9395-172a25e7f3c9	0	3	\N	\N	25f1f6bb-fac4-40af-9b83-8cc3b4650d9e	\N
de9ab534-ad3a-41cf-b328-b75aa7f636c8	0	2	\N	\N	f27a4752-7ae6-4b16-a94c-04b542bafb61	\N
e3d3c13e-6be7-4b2b-9704-1b0218336387	0	1	\N	\N	9adc9ba3-f969-4cb4-806a-fa1f09dc7030	\N
e426b2b6-f5fa-49f3-8031-0164bfb3fe72	0	1	\N	\N	9518ce79-aa1e-4379-a953-564db0ec624f	\N
e6cf0da7-7968-476e-9185-546da959a21b	0	3	\N	\N	2284f42c-3e63-44ed-9713-353611e5663f	\N
e90f61a3-c9a6-4783-a452-2cb36f1dfdca	0	3	\N	\N	7e24f84d-7d2e-4509-8bb0-a39fe55c2519	\N
eac0164b-15f4-4b24-b140-0bbd3b03b8ba	0	3	\N	\N	aec3f219-e8b2-4047-9f8a-cd14f5c6c843	\N
ebb381c6-e092-4798-bdbf-c2eb73c3af75	0	1	\N	\N	c829559c-de04-48a2-bf58-b3bf61ea7858	\N
ebef521c-c185-4ad5-8dbf-2d445e1337a7	0	1	\N	\N	20d53556-0523-430d-9893-11f22589f17a	\N
ec5244f9-a4cc-423f-a3bc-4d6fa7cc558e	0	3	\N	\N	a0b7c448-9599-4688-b79e-8d42ce85d1cb	\N
edba3aa6-735c-420c-8c31-c1d989f4e756	0	2	\N	\N	7ec9e5da-0562-4ba4-8170-59c12767c3aa	\N
edc98f99-5356-4118-bf42-fd65ef5376d1	0	3	\N	\N	348417c5-1c6d-4112-b84b-02c6c79b88c5	\N
eeff637e-c1e7-4048-b492-16f11fba26b5	0	3	\N	\N	c473021b-5aee-4b0c-9d69-062744c441bd	\N
f274fbe8-bc32-4d3f-b483-324ff4bd293e	0	3	\N	\N	ac8b4763-e69d-4f4b-9250-d78f055feaed	\N
f408df5f-4b54-4020-ba3d-3ef41caf6e16	0	2	\N	\N	688e323b-6f4d-4606-856b-725c962f2937	\N
f67027f3-cea4-4d62-86b9-5280bcf746a9	0	2	\N	\N	7e24f84d-7d2e-4509-8bb0-a39fe55c2519	\N
f755d2c9-a7ce-4014-9f6c-3bbf9c8a7f97	0	1	\N	\N	348417c5-1c6d-4112-b84b-02c6c79b88c5	\N
f819b69a-ca15-46ff-91b5-640b1888fdde	0	3	\N	\N	fb16c5ef-1c0c-48e2-a245-a5e8c93007f3	\N
f9ecdf45-025e-4461-82b1-97263c509bb7	0	2	\N	\N	2621910c-23ea-43d4-8dc3-98a005a2afa1	\N
fcd04b67-2eb5-4396-a233-9928ee859a15	0	3	\N	\N	4d144af3-e127-467f-8a33-614929b29b1b	\N
fefa8e16-30c4-4cf6-9fdf-18c17bd18c73	0	2	\N	\N	9adc9ba3-f969-4cb4-806a-fa1f09dc7030	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
67effd09-03c2-4d41-baf6-4d99ade6f274	Сборка, сварка рам к/с г/п 120-130 т.	6	8bf6291c-34f7-4371-857c-0e85efcbc1d3	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
116d234a-c731-4deb-895b-1ab6e840fed5	Лонжерон рамы правый	75131-2801016-70	t	2	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
1865be50-9e1a-44a8-af97-1ef21571e048	Кронштейн задней опоры	75131-8521182-20	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
1c873e2e-5905-48ba-afcc-7d17ac5aa5b1	Накладка рамы поперечная передняя	75131-2801088-70	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
1ebf0c71-3547-43ec-99b2-b2b0787c90e0	Усилитель	75131-2801114-01	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
213b4a8e-121c-4114-91fd-df5a42cb2fe9	Опора	75131-2801188	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
2c51789e-f53e-448e-a066-5e38ad1193d5	Опора	75131-2801188	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
2dd47a80-acc3-4013-901b-1f304e1db8f4	Поперечина рамы задняя	75131-2801300-20	t	2	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
2f886464-4fed-4078-88d8-983a8ba83c2a	Лонжерон рамы правый	75131-2801014-41	t	2	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
472697c3-31e7-4694-82a0-b8f6e74a0a84	Лонжерон рамы левый	75131-2801015-41	t	2	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
4ae60778-badb-4548-aa6e-41761cbbc9ba	Усилитель	75131-2801115-01	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
524371fd-f395-467f-828d-70f4990d32ef	Поперечина	75131-2801325	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
5543d18d-6806-4653-83df-3442ede71d45	Лонжерон рамы левый	75131-2801015-41	t	2	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
5d47bf41-20f1-49e0-93ac-cfaa10f70430	Лист нижний	75131-2801358-10	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
61bd3331-7d8b-4497-b3ba-623f07ca8afa	Лонжерон рамы правый	75131-2801016-70	t	2	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
675f9fbb-acb3-4c0f-9664-fab447c2ae46	Опора	75131-2801188	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
69879bd4-4d47-457e-92fb-794cb765c6de	Лонжерон рамы левый	75131-2801017-70	t	2	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
7216aa5c-654d-48ee-8345-d945a585e05c	Опора	75131-2801188	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
7c5a8a2d-2234-4c7e-93f2-1a875c16a224	Кронштейн задней опоры	75131-8521183-20	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
7dd68d4c-bad1-407c-a232-1a94d8928f93	Лонжерон рамы левый	75131-2801017-70	t	2	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
7e765717-de5a-4541-a7ef-3ed2b2940bc0	Поперечина	75131-2801325	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
a56b4238-eeac-44c8-bc69-dbb77e5365dd	Усилитель	75131-2801115-01	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
af026bdb-061d-41ea-9dc4-d18693c2e54b	Поперечина	75131-2801103-10	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
af6da198-c42a-44ef-b793-5af305699a6b	Поперечина рамы задняя	75131-2801300-20	t	2	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
b128d143-1bee-4dc0-8be4-464ebf9eb600	Поперечина №3 рамы с опорами	75132-2801152	t	2	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
c22b291f-2c4b-4928-9d5e-79b91308fae9	Накладка рамы поперечная передняя	75131-2801088-70	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
ca7a1da1-1baa-4e6b-9c05-cb9fab3d06b8	Лист верхний	75131-2801357-10	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
d1702cd2-671d-408f-bbf2-779f37844d87	Накладка рамы поперечная передняя	75131-2801088-70	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
d49c3064-99f1-4115-9b5d-2279dc76897e	Накладка рамы поперечная передняя	75131-2801088-70	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
d92b82ce-bdf6-4297-a3be-6f1b51b2bec3	Опора	75131-2801188	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
db62e132-c1c8-48e2-be16-ffd45acaf97b	Кронштейн задней опоры	75131-8521183-20	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
dc649dad-434d-4124-b049-2b97fc6ad45d	Опора	75131-2801188	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
e086d6f5-6825-4742-8d83-2674bf3dca5b	Поперечина	75131-2801103-10	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
e1c623b6-7cae-40be-bc8e-45b98f52b62e	Лист верхний	75131-2801357-10	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
e63cde5a-dc9b-4bed-adc9-5331b0a86471	Поперечина №3 рамы с опорами	75132-2801152	t	2	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
e6ad8129-8888-4c6b-86aa-0a397330cc18	Усилитель	75131-2801114-01	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
e7d3951d-0018-4462-9c8f-457071489b39	Кронштейн задней опоры	75131-8521182-20	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
eda2257c-9aae-4e7c-82b6-76b706ea25a8	Опора	75131-2801188	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
f3397ec9-1b5f-4d00-b608-4fcc61f6e2ec	Рама	7513D-2800010-20	t	1	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	4536492774
f462830c-c5fe-4ff6-b5d6-10f217d2461b	Опора	75131-2801188	t	3	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	\N
f58ea111-8f2a-472e-97f4-b75cc1da008d	Рама	75131-2800010-70	t	1	490cf5c8-b8c7-4afe-a921-934b0590dd01	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N	\N	4536479362
30fb30a3-3010-4ec6-9234-8f312098bd52	Лонжерон рамы правый	75131-2801014-41	t	2	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	\N	\N	\N
3c469e7b-3a43-406c-b9ae-f3b63edaf499	Лист нижний	75131-2801358-10	t	3	1d66e56f-c570-4cff-9019-e195f2ef18ca	67effd09-03c2-4d41-baf6-4d99ade6f274	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
6536b9eb-9612-40fe-a2ef-446bf326efb9	Admin	\N
7270d725-8658-4e0f-ac5c-6ee6f4b3edc6	Master	\N
677e0269-ff06-4289-9d84-74a5dcd217de	Welder	\N
14b5e814-0219-4613-973f-078b65601770	Inspector	\N
88efe4ab-82a1-4b4b-a735-48eb6e4f6540	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "IdFromSystem") FROM stdin;
00599154-fc05-4c36-9f79-3465633eb584	2023-03-04 21:08:40.824817	a1be54d7-b659-4a2d-8883-f4f35cb63d1e	\N
08433d18-3b0b-4c13-a623-0bd1df29ab12	2023-03-04 21:08:40.826836	759ab911-eefe-4ae3-a601-2e06e97062d9	\N
0fbcd54a-2c92-4f91-a0c1-43ebe3bb3eef	2023-03-04 21:08:40.82637	da00e9cc-87ef-4418-ae43-807f776b18d6	\N
180598f1-a4fa-4e32-8816-4960128d00e3	2023-03-04 21:08:40.824601	11b5b808-dffd-469f-bb58-0e4d5b5f566a	\N
202ba4bf-d714-429d-9a39-57d256255e99	2023-03-04 21:08:40.826761	f1e06314-d86d-48d1-ad54-2384d6694404	\N
2111726e-1ec1-4e09-bddf-336c2d3322e7	2023-03-04 21:08:40.825662	dc4604e0-8dd9-4cbf-ac77-1923ee05544b	\N
23f0efa9-ace1-467d-8606-1981d5006e5e	2023-03-04 21:08:40.825307	61b51767-1d16-448f-95da-444da1629f2e	\N
2633bebb-a8bf-4ba5-89e8-51256cfd1e8b	2023-03-04 21:08:40.823665	523bf8de-daa7-498e-8e65-44734ea0ba25	\N
2a154dcb-2c71-48a6-932d-27f7dcbf3744	2023-03-04 21:08:40.827183	efda56b2-e087-4f0a-9158-20d0420c81ae	\N
2efc05d1-e441-4225-b5be-06c6d4d004e4	2023-03-04 21:08:40.82467	534fa0ac-d318-4d3f-8a5d-d962fab3544d	\N
316688fc-da54-4e3a-808b-e4c7bb96210b	2023-03-04 21:08:40.824531	11e7eee1-fa3f-4f98-aaea-5eea075da1fb	\N
365b5745-792b-4e2b-8054-d0bfd903d9c2	2023-03-04 21:08:40.825732	d677f946-7251-45ad-a06a-c830b105fabe	\N
38a64919-7944-4797-a03a-11db157c9441	2023-03-04 21:08:40.825098	81127eef-3c99-40bc-9b57-ed5db3c76283	\N
38eea9ba-9aad-409c-bb5d-55562ae4f309	2023-03-04 21:08:40.824958	080b6e89-0aec-4a5e-814a-f14ed5aa10eb	\N
39ffc478-8762-44da-a7ff-9e998c0ae224	2023-03-04 21:08:40.826086	e7f56ad8-3279-48fa-8966-1e49313cde36	\N
3c17f307-4636-4e64-82b1-94baf1af858e	2023-03-04 21:08:40.82382	b06db3fd-c924-45ab-8a17-186b64498b3a	\N
45cac872-31e8-4328-9f2f-694d1765dadb	2023-03-04 21:08:40.804038	8ca1cd40-bf7d-4ed8-9ba1-7f9d0f364274	\N
47634f2c-3b79-474d-9a96-454def530216	2023-03-04 21:08:40.824038	e2859c97-26f7-4dc2-8c04-de980c58e0ff	\N
4d7485c9-5539-4b98-9f8d-8516040f0f8e	2023-03-04 21:08:40.82707	d5123aff-8fb9-44e0-9b0a-b8ac4269dd1d	\N
54054e6c-3569-4a8e-a832-5fd5c8960cd5	2023-03-04 21:08:40.825518	5a66b39b-6bd3-41be-a887-dac4d456f619	\N
5498aed2-346a-470c-af79-d89889c6c998	2023-03-04 21:08:40.826909	04392ed2-19cb-406e-96ef-59c1974082a1	\N
5e587cb2-849b-42de-b4fe-4bb078ca9ab8	2023-03-04 21:08:40.823589	0e139180-5529-49f2-8569-128a994bef9b	\N
7b7071bf-674a-45d9-9a9f-53ebf3302507	2023-03-04 21:08:40.826229	352514c9-026a-4de1-8b04-a06cd88424f8	\N
8050d78c-4929-485d-b7f2-bf0711a5d6c6	2023-03-04 21:08:40.825027	8cf6b5b9-5a6e-4692-afb4-19d359f62ee1	\N
82528c53-8c88-40ee-92a7-12a160cf1230	2023-03-04 21:08:40.823742	4ba115ec-5088-461a-b065-0e974c0099a0	\N
83435e87-436d-4fa1-b91a-57a4dc9d0cf4	2023-03-04 21:08:40.82559	4b5377ac-cfab-4df2-b314-eff2e4020051	\N
8a33b2d1-cef6-4981-b0f1-9a5bb3d5bef4	2023-03-04 21:08:40.824461	c65df798-29db-4a05-a89d-b4107b6a5d73	\N
8b5e8d40-0496-4523-b660-39343a0d7cd2	2023-03-04 21:08:40.823892	5f6d01ef-db24-4c32-b926-0d5217a8a6e0	\N
8b7ad790-cba9-4d1e-a1c6-687c9b5d3ce8	2023-03-04 21:08:40.825805	df07671f-db6d-4096-8a9a-91f1d7243bf5	\N
8fce6ff0-3727-44a0-acd5-026273d9edb2	2023-03-04 21:08:40.825238	82a26ef9-f888-4e78-8d2c-657aa666899d	\N
9329dcb5-4f03-4054-9ff5-296fd6cfcbe9	2023-03-04 21:08:40.826016	b768ee23-bdb5-455a-8a78-d01afcd49a62	\N
997e372c-39aa-45cc-b939-7e20aec4ef65	2023-03-04 21:08:40.826299	ab7fef31-bf0f-47b0-ac70-18486d79779d	\N
a57a57a8-88ea-4ea0-baaa-93ac64b62936	2023-03-04 21:08:40.824742	c9e5e6be-32b7-4cf2-aaeb-6328917e6153	\N
a5a94d45-a4e5-4eb9-9a3e-09b679fc564d	2023-03-04 21:08:40.825377	72afddaf-ee6a-4879-acd5-7bd9e26d534c	\N
ab3a4324-e134-48cd-941f-5f3c13c9618c	2023-03-04 21:08:40.82418	7ea06316-5fb0-4027-93e9-08a7cdf05936	\N
af29d7e9-c727-4b00-86a3-e6a52d347b6c	2023-03-04 21:08:40.824109	10e649dd-9f7b-4aa5-9274-f55786aaf97b	\N
b16b6f4f-4ab8-41e7-a54e-a6a607af648d	2023-03-04 21:08:40.825167	384e7662-c3b9-4dd5-90e4-12216236defe	\N
b551f9f0-824c-4bac-8b1d-09bcd777fa1c	2023-03-04 21:08:40.825946	d0d70b9d-dfa5-43d2-96f6-ec140dc7d68a	\N
b60bd980-90e4-4a6c-938c-3840f229f2b3	2023-03-04 21:08:40.824887	b838d7aa-0575-4385-828b-b4c1a6cd0d16	\N
b83ae98a-0e13-4434-a80b-27fc764297fe	2023-03-04 21:08:40.82432	a1f5ba5f-1bc0-4534-b3db-aa6b3eb0af37	\N
b97c80aa-3798-4914-a7b6-b582857be2ba	2023-03-04 21:08:40.825447	221c2031-9730-455d-903d-04c5a629bda6	\N
c4f9ebe7-2199-4beb-8e43-fd76dfebcef1	2023-03-04 21:08:40.826158	b030abbf-33fb-4cfc-bd96-d459f3d109b7	\N
c68af309-7ece-4c4e-b00c-6f56468ac0f5	2023-03-04 21:08:40.826679	e0ae11d5-4d34-4882-bed5-d5935b9a780b	\N
cd5b4166-f8a5-4dab-a974-e5274486e3b3	2023-03-04 21:08:40.826496	ad006b02-3de0-42a9-a193-5622e253be76	\N
d4e798bd-c9ac-446f-bc35-1a84e60419a0	2023-03-04 21:08:40.826571	905704ff-8a64-433b-ab05-3dcac0d451be	\N
d76dc9c1-d0e0-477d-a416-a32c10090854	2023-03-04 21:08:40.824391	ace7f11b-7624-422f-8725-8dbb06cc9044	\N
da644458-ab15-468e-863e-98c7f328efb1	2023-03-04 21:08:40.823964	b9634af6-f534-451f-9c86-ef4709c234f0	\N
e9210a96-430b-4f24-9fea-baca865c707a	2023-03-04 21:08:40.824251	0e3fb5dc-424f-43b7-b20f-42d2aaaa8857	\N
f01c23ab-c50e-46e3-8cc5-cd705b745698	2023-03-04 21:08:40.827366	93862793-e8f0-4058-8df5-5110581a522e	\N
f0b4a98e-1440-4d65-97c6-227ae3d83672	2023-03-04 21:08:40.825875	b6e03d15-cd18-4037-93ab-50862dbb10d3	\N
f19d7227-e24c-466b-a327-961e08041a59	2023-03-04 21:08:40.826981	a99679f7-fbc7-4f05-beb1-a352486b4165	\N
f615cf29-b05b-4af2-94b4-f63c5da75e50	2023-03-04 21:08:40.823494	62582c0b-ff6f-4dd5-b1d8-446ff320ddab	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0080a980-6513-46c8-af4e-133040855383	0	1	\N	\N	7b7071bf-674a-45d9-9a9f-53ebf3302507	\N
036931af-b546-4ffe-bbec-1ce8f27b3512	0	1	\N	\N	39ffc478-8762-44da-a7ff-9e998c0ae224	\N
06cfb4a3-310f-4d7a-b0f8-adc442719aa5	0	1	\N	\N	af29d7e9-c727-4b00-86a3-e6a52d347b6c	\N
089b7cd1-e2e3-4dc4-a494-a2c9c08c800c	0	3	\N	\N	83435e87-436d-4fa1-b91a-57a4dc9d0cf4	\N
0bb79b0d-d016-4c34-9625-8fba7a2d65e8	0	2	\N	\N	b60bd980-90e4-4a6c-938c-3840f229f2b3	\N
0e157bd8-9244-4f3e-ac31-9ea35ec02161	0	3	\N	\N	d4e798bd-c9ac-446f-bc35-1a84e60419a0	\N
14908535-876a-4d70-b514-684829d9bf39	0	1	\N	\N	f01c23ab-c50e-46e3-8cc5-cd705b745698	\N
14cf9952-9f8f-4d9f-b16d-511a26d069d8	0	2	\N	\N	9329dcb5-4f03-4054-9ff5-296fd6cfcbe9	\N
155c1d48-ab39-4c7b-83ef-6d19d6f24184	0	3	\N	\N	7b7071bf-674a-45d9-9a9f-53ebf3302507	\N
171cc1e9-6743-4099-97f0-af9625ebe28f	0	3	\N	\N	b60bd980-90e4-4a6c-938c-3840f229f2b3	\N
17a4c8de-d4f1-49ec-a479-b1f9927e623d	0	3	\N	\N	b83ae98a-0e13-4434-a80b-27fc764297fe	\N
1a2f60a0-3ca9-4fa9-a102-ae66d22545f5	0	1	\N	\N	180598f1-a4fa-4e32-8816-4960128d00e3	\N
1ad38821-e78e-486a-8e11-2399b280d645	0	2	\N	\N	2efc05d1-e441-4225-b5be-06c6d4d004e4	\N
1d04f11e-c7ce-4694-9cff-a681c3479cbc	0	3	\N	\N	da644458-ab15-468e-863e-98c7f328efb1	\N
1d09bcd2-4a90-4854-bf7d-2fa5f09a19d9	0	1	\N	\N	0fbcd54a-2c92-4f91-a0c1-43ebe3bb3eef	\N
1d8f34a4-f49a-4978-ac7e-9cfc5dda71e8	0	2	\N	\N	997e372c-39aa-45cc-b939-7e20aec4ef65	\N
1da3bff7-427b-4c0b-a198-4bcb36c17380	0	1	\N	\N	f615cf29-b05b-4af2-94b4-f63c5da75e50	\N
1f4debd4-caa1-453c-a047-f5530177bad1	0	3	\N	\N	f0b4a98e-1440-4d65-97c6-227ae3d83672	\N
1f7da19b-395d-4015-9241-eb3e9505c6f7	0	2	\N	\N	cd5b4166-f8a5-4dab-a974-e5274486e3b3	\N
22903a79-a7e4-439c-90f4-a641d3df7880	0	2	\N	\N	d76dc9c1-d0e0-477d-a416-a32c10090854	\N
245c8128-8c77-45b0-a905-91bf85d56b86	0	2	\N	\N	38eea9ba-9aad-409c-bb5d-55562ae4f309	\N
248c9eab-a422-471b-a3fa-d3015967f0f8	0	2	\N	\N	00599154-fc05-4c36-9f79-3465633eb584	\N
24cf6c65-99db-4dfa-9b6e-d4cfc85f2812	0	2	\N	\N	180598f1-a4fa-4e32-8816-4960128d00e3	\N
2508a45e-f095-42d9-9706-6bea496eede6	0	1	\N	\N	d4e798bd-c9ac-446f-bc35-1a84e60419a0	\N
264cf7b6-047f-458b-bafa-5eb6e093ce2f	0	2	\N	\N	2633bebb-a8bf-4ba5-89e8-51256cfd1e8b	\N
2690f598-c1d4-4ce9-b031-1ca9ceedc5b3	0	2	\N	\N	47634f2c-3b79-474d-9a96-454def530216	\N
26f1422d-b8d2-4756-9009-cbd9e81d01da	0	1	\N	\N	997e372c-39aa-45cc-b939-7e20aec4ef65	\N
26fa62d5-28a8-473b-8ac8-276f72d25eaa	0	3	\N	\N	82528c53-8c88-40ee-92a7-12a160cf1230	\N
2aba70c1-066b-41ee-b6e6-0fb8b0f82e87	0	3	\N	\N	f01c23ab-c50e-46e3-8cc5-cd705b745698	\N
2b9a25bb-c060-4ebd-a9a0-bb9e612808e3	0	1	\N	\N	2efc05d1-e441-4225-b5be-06c6d4d004e4	\N
2e950dcf-945d-4d0b-bf12-ff5bcc2e3054	0	1	\N	\N	23f0efa9-ace1-467d-8606-1981d5006e5e	\N
2e961f1f-8981-4b45-9b23-d772dae6de13	0	1	\N	\N	a57a57a8-88ea-4ea0-baaa-93ac64b62936	\N
2ed100d1-6ce0-4f50-b4a7-e4cd5cbb2827	0	2	\N	\N	af29d7e9-c727-4b00-86a3-e6a52d347b6c	\N
2eebfefc-e2f8-4d30-8640-7b369df1f4fc	0	1	\N	\N	c68af309-7ece-4c4e-b00c-6f56468ac0f5	\N
30bdf0e6-84d5-49d7-80d8-cb6b3ecb5497	0	3	\N	\N	316688fc-da54-4e3a-808b-e4c7bb96210b	\N
312d5ae2-440d-46ca-afa6-19f2770e0136	0	3	\N	\N	365b5745-792b-4e2b-8054-d0bfd903d9c2	\N
316bd07b-603a-41ab-9559-6eef34fcc0c3	0	2	\N	\N	7b7071bf-674a-45d9-9a9f-53ebf3302507	\N
327dae9a-8f6b-4291-86e9-c56e21080e1c	0	2	\N	\N	2111726e-1ec1-4e09-bddf-336c2d3322e7	\N
356f19ef-9087-4f99-b9ec-1606763a2983	0	2	\N	\N	39ffc478-8762-44da-a7ff-9e998c0ae224	\N
3757c7cb-9331-40c8-bc70-d8c5a2a81506	0	1	\N	\N	da644458-ab15-468e-863e-98c7f328efb1	\N
37740d7e-1637-4cfb-96a7-8883d768ab32	0	3	\N	\N	23f0efa9-ace1-467d-8606-1981d5006e5e	\N
386d6f14-7ded-4e8c-96f8-1da084b098ec	0	3	\N	\N	0fbcd54a-2c92-4f91-a0c1-43ebe3bb3eef	\N
39f99aa1-b25e-43ce-b7d5-b85c9f829730	0	1	\N	\N	82528c53-8c88-40ee-92a7-12a160cf1230	\N
3ab3ce57-bd6d-4b76-b15f-c4c34d7b9f2f	0	2	\N	\N	5498aed2-346a-470c-af79-d89889c6c998	\N
3cd2b33d-3708-4a91-b922-126321141036	0	2	\N	\N	23f0efa9-ace1-467d-8606-1981d5006e5e	\N
3cd6d319-ed2d-4a75-a375-f7caf829aa20	0	2	\N	\N	ab3a4324-e134-48cd-941f-5f3c13c9618c	\N
3d7e8520-e787-4a82-bd76-abad14df86df	0	2	\N	\N	e9210a96-430b-4f24-9fea-baca865c707a	\N
3dbedf4d-1cf8-4bc9-871e-e3dfd436b7b6	0	1	\N	\N	b551f9f0-824c-4bac-8b1d-09bcd777fa1c	\N
3f9f7883-adc8-48a5-b2ba-eb1d29b147e9	0	3	\N	\N	8b7ad790-cba9-4d1e-a1c6-687c9b5d3ce8	\N
414ed9b2-bc8b-4849-916e-cf5700b9005d	0	3	\N	\N	38a64919-7944-4797-a03a-11db157c9441	\N
41799bfd-53d6-4da4-a805-a2df1a523a50	0	1	\N	\N	38a64919-7944-4797-a03a-11db157c9441	\N
43181ae2-15fd-471f-9929-1b6ab86917ea	0	3	\N	\N	b16b6f4f-4ab8-41e7-a54e-a6a607af648d	\N
46ebd2b4-82bc-4a1e-bd34-3d92d9fa9b96	0	3	\N	\N	e9210a96-430b-4f24-9fea-baca865c707a	\N
48da5d55-85cd-449e-8255-147d5efac2c1	0	3	\N	\N	af29d7e9-c727-4b00-86a3-e6a52d347b6c	\N
4b4d2e9f-b8e7-4a95-8be2-26c31569ef12	0	2	\N	\N	08433d18-3b0b-4c13-a623-0bd1df29ab12	\N
4b590eb1-950a-40f1-8696-67ebc9f1cb0a	0	1	\N	\N	9329dcb5-4f03-4054-9ff5-296fd6cfcbe9	\N
4c5b5d54-4ad3-42c2-a59f-d7efe16fea2d	0	3	\N	\N	38eea9ba-9aad-409c-bb5d-55562ae4f309	\N
4e826c87-09fc-4b84-bc7b-f5ad4c1855ce	0	2	\N	\N	a5a94d45-a4e5-4eb9-9a3e-09b679fc564d	\N
565f62ed-3c3b-4204-bb01-bfaf45f1fb0e	0	2	\N	\N	365b5745-792b-4e2b-8054-d0bfd903d9c2	\N
59c4c0fb-29c1-443f-8f88-59ba03289cb6	0	3	\N	\N	00599154-fc05-4c36-9f79-3465633eb584	\N
5cebc8bd-e4fe-4722-a007-4ac2704b65fe	0	3	\N	\N	8a33b2d1-cef6-4981-b0f1-9a5bb3d5bef4	\N
5fad973f-b8e0-4d30-97fd-de88e72038b0	0	1	\N	\N	f19d7227-e24c-466b-a327-961e08041a59	\N
61a98ddc-cf46-42d5-895d-4be52dba04bf	0	2	\N	\N	8b5e8d40-0496-4523-b660-39343a0d7cd2	\N
621b35c5-96dd-43aa-8912-c46f2465c0cd	0	3	\N	\N	8b5e8d40-0496-4523-b660-39343a0d7cd2	\N
664379e2-b6d8-416a-ac88-d256bdfaa6d9	0	2	\N	\N	8fce6ff0-3727-44a0-acd5-026273d9edb2	\N
695b4185-4ddf-486d-83c7-61f6def8013f	0	3	\N	\N	8fce6ff0-3727-44a0-acd5-026273d9edb2	\N
6adaa06d-9bea-4808-ba9c-962420a0e3dd	0	2	\N	\N	3c17f307-4636-4e64-82b1-94baf1af858e	\N
6d671752-70ff-4ffb-83c0-e56b68fbffc1	0	3	\N	\N	a5a94d45-a4e5-4eb9-9a3e-09b679fc564d	\N
6fc5400b-99df-431c-8366-b369bff37aaf	0	3	\N	\N	2efc05d1-e441-4225-b5be-06c6d4d004e4	\N
70ca4cc4-da18-4cc2-b5a8-e24031b648f8	0	2	\N	\N	f0b4a98e-1440-4d65-97c6-227ae3d83672	\N
71b2af8f-19a6-4d4f-a586-65bedda9ee2b	0	3	\N	\N	2a154dcb-2c71-48a6-932d-27f7dcbf3744	\N
73b6dd38-a689-4a43-a4f2-9774cebc4543	0	1	\N	\N	b83ae98a-0e13-4434-a80b-27fc764297fe	\N
77bd0215-92c4-4b4d-895f-ff01f53e7651	0	1	\N	\N	ab3a4324-e134-48cd-941f-5f3c13c9618c	\N
789a2c60-9583-4ff1-a062-dd5af03288e1	0	1	\N	\N	08433d18-3b0b-4c13-a623-0bd1df29ab12	\N
7b3afa17-0673-400c-a121-e0abd5b811ce	0	1	\N	\N	d76dc9c1-d0e0-477d-a416-a32c10090854	\N
7cfb5480-e1f9-463f-876f-ff37a42c2cd8	0	2	\N	\N	8b7ad790-cba9-4d1e-a1c6-687c9b5d3ce8	\N
7f1f88c0-0953-4a71-9a2b-32656238399c	0	1	\N	\N	3c17f307-4636-4e64-82b1-94baf1af858e	\N
82f8dc4c-34df-440c-b185-7308741c6f29	0	1	\N	\N	365b5745-792b-4e2b-8054-d0bfd903d9c2	\N
83ebc92b-e61c-43b2-b33a-d69067de4ec0	0	1	\N	\N	cd5b4166-f8a5-4dab-a974-e5274486e3b3	\N
845a4fa0-bf21-4955-865a-5ad01ae9d7f7	0	1	\N	\N	5498aed2-346a-470c-af79-d89889c6c998	\N
84b2991b-2f23-4e52-b02e-09a70efc1fb5	0	3	\N	\N	39ffc478-8762-44da-a7ff-9e998c0ae224	\N
885b7aff-8b0c-4223-98f9-17d169bc3ae0	0	1	\N	\N	b97c80aa-3798-4914-a7b6-b582857be2ba	\N
89b2ee05-f355-44af-9615-17b676cecc74	0	3	\N	\N	d76dc9c1-d0e0-477d-a416-a32c10090854	\N
8d3475ab-a16d-409a-a0c6-964c6932134c	0	3	\N	\N	180598f1-a4fa-4e32-8816-4960128d00e3	\N
8dec13e7-0ccc-47b1-8f80-c011f830a88d	0	1	\N	\N	5e587cb2-849b-42de-b4fe-4bb078ca9ab8	\N
8e4a7ce9-f449-4289-bc24-cfeb6f0c9a8e	0	2	\N	\N	8050d78c-4929-485d-b7f2-bf0711a5d6c6	\N
8ef3b17f-f902-4f86-94a9-cd8915a096a0	0	1	\N	\N	202ba4bf-d714-429d-9a39-57d256255e99	\N
8f565e46-7bb1-48d7-926f-41c943d89570	0	3	\N	\N	3c17f307-4636-4e64-82b1-94baf1af858e	\N
902ac11b-b756-4e8f-b997-5ae3b4ba5026	0	1	\N	\N	8fce6ff0-3727-44a0-acd5-026273d9edb2	\N
906db014-dd09-4a0b-9d37-71438de2e207	0	1	\N	\N	00599154-fc05-4c36-9f79-3465633eb584	\N
91ef64fb-84d1-4861-828a-28b90c2a40a6	0	3	\N	\N	c68af309-7ece-4c4e-b00c-6f56468ac0f5	\N
92d242a1-6a9e-4c95-a520-8e4a93a021a9	0	3	\N	\N	2633bebb-a8bf-4ba5-89e8-51256cfd1e8b	\N
952919cf-d7a5-475e-9318-71bcba62382b	0	1	\N	\N	a5a94d45-a4e5-4eb9-9a3e-09b679fc564d	\N
97674f14-8a8f-4339-86a6-c60b4ae740af	0	2	\N	\N	f19d7227-e24c-466b-a327-961e08041a59	\N
9df67e78-dda3-4d5a-b232-410cb4f4d84e	0	1	\N	\N	b16b6f4f-4ab8-41e7-a54e-a6a607af648d	\N
9eeab05a-c18b-46e7-8584-f20add604aad	0	2	\N	\N	4d7485c9-5539-4b98-9f8d-8516040f0f8e	\N
9ef29b81-21c2-4ff1-99fd-85d006c5ef7f	0	3	\N	\N	f19d7227-e24c-466b-a327-961e08041a59	\N
a020ff7f-5073-4105-8385-25c63aa676fd	0	1	\N	\N	c4f9ebe7-2199-4beb-8e43-fd76dfebcef1	\N
a80425c1-be54-4440-9cb6-3745f7071abd	0	2	\N	\N	38a64919-7944-4797-a03a-11db157c9441	\N
a97e4d7e-9c9f-4513-a982-08f4fb3d07ed	0	1	\N	\N	47634f2c-3b79-474d-9a96-454def530216	\N
aa10e677-07e9-41a5-bd90-7b493fa3dbf3	0	3	\N	\N	54054e6c-3569-4a8e-a832-5fd5c8960cd5	\N
ad5560d0-58c1-471c-956c-74de582f807a	0	2	\N	\N	da644458-ab15-468e-863e-98c7f328efb1	\N
aee71da6-7429-4ed9-a450-b59aee4c4959	0	1	\N	\N	83435e87-436d-4fa1-b91a-57a4dc9d0cf4	\N
af13fa62-ea3a-454c-ace9-52f65fa2234f	0	3	\N	\N	8050d78c-4929-485d-b7f2-bf0711a5d6c6	\N
b03702fd-ec44-4875-ba78-f57d9836b391	0	2	\N	\N	b551f9f0-824c-4bac-8b1d-09bcd777fa1c	\N
b21788aa-9dcb-4c19-9991-32fd7a7c7dd0	0	2	\N	\N	d4e798bd-c9ac-446f-bc35-1a84e60419a0	\N
b21fe197-1159-4a58-965e-5f4f922dc569	0	3	\N	\N	cd5b4166-f8a5-4dab-a974-e5274486e3b3	\N
b234608a-e3e4-4125-8681-340602682ba2	0	1	\N	\N	e9210a96-430b-4f24-9fea-baca865c707a	\N
b71b7305-f6e9-4be2-96bf-ab9c5f022f3d	0	1	\N	\N	316688fc-da54-4e3a-808b-e4c7bb96210b	\N
b7735e98-9c7a-4336-bbf4-2524ce0fd228	0	2	\N	\N	f615cf29-b05b-4af2-94b4-f63c5da75e50	\N
b8fa365c-4df5-436d-82b3-325ed680a4f6	0	2	\N	\N	c68af309-7ece-4c4e-b00c-6f56468ac0f5	\N
baa8bfd3-37c1-470f-9cc5-a720daaf5d00	0	1	\N	\N	54054e6c-3569-4a8e-a832-5fd5c8960cd5	\N
be3972b9-23c8-4e07-ad76-9851a7573aca	0	1	\N	\N	38eea9ba-9aad-409c-bb5d-55562ae4f309	\N
c18a7525-0936-46be-a4c9-a0d15f928440	0	3	\N	\N	4d7485c9-5539-4b98-9f8d-8516040f0f8e	\N
c4cd9858-a5f2-4fea-9e96-ecb3c2765046	0	1	\N	\N	8b5e8d40-0496-4523-b660-39343a0d7cd2	\N
c64ff89a-d312-4a58-b5a0-912dd518859e	0	3	\N	\N	5498aed2-346a-470c-af79-d89889c6c998	\N
c9581b7d-bb2a-4ce6-a860-1bf3b3e695cc	0	3	\N	\N	47634f2c-3b79-474d-9a96-454def530216	\N
ca371eda-4013-49a8-a890-9a5e4128f1ce	0	2	\N	\N	45cac872-31e8-4328-9f2f-694d1765dadb	\N
cbcdaed9-1dc3-410a-b097-9bdb83d4cac1	0	1	\N	\N	2111726e-1ec1-4e09-bddf-336c2d3322e7	\N
cc41e7f4-c288-4e7a-b7e9-44c3bba5f96a	0	1	\N	\N	2a154dcb-2c71-48a6-932d-27f7dcbf3744	\N
cc6c82ed-821c-49b4-b60a-d54892f87f31	0	2	\N	\N	0fbcd54a-2c92-4f91-a0c1-43ebe3bb3eef	\N
cceb8851-1f09-4733-a6b8-9f9d1cc3af35	0	3	\N	\N	a57a57a8-88ea-4ea0-baaa-93ac64b62936	\N
cfebc72d-9b1a-4112-be08-f3eaa570b9ef	0	3	\N	\N	b551f9f0-824c-4bac-8b1d-09bcd777fa1c	\N
d02795dc-e658-44bb-b828-1219a13e32c3	0	2	\N	\N	2a154dcb-2c71-48a6-932d-27f7dcbf3744	\N
d0a772da-bcc1-4d8b-bdb9-b2e8ad0f6277	0	3	\N	\N	202ba4bf-d714-429d-9a39-57d256255e99	\N
d4b81a9e-0865-4dcb-896f-d8451000663c	0	1	\N	\N	8a33b2d1-cef6-4981-b0f1-9a5bb3d5bef4	\N
d5a53959-c8a6-42bc-9c70-36b7c075493e	0	3	\N	\N	c4f9ebe7-2199-4beb-8e43-fd76dfebcef1	\N
d7cd3149-6e8e-4a0b-858f-68b318e2f171	0	2	\N	\N	5e587cb2-849b-42de-b4fe-4bb078ca9ab8	\N
d7e4925c-8861-46a2-b934-f1b041a64ddf	0	2	\N	\N	316688fc-da54-4e3a-808b-e4c7bb96210b	\N
d899321f-d598-40bc-ae7f-a559a9870a08	0	3	\N	\N	b97c80aa-3798-4914-a7b6-b582857be2ba	\N
d91cadea-c511-4dc1-b003-39d97736f732	0	1	\N	\N	f0b4a98e-1440-4d65-97c6-227ae3d83672	\N
da874acd-42c3-4ca8-8407-83bdd7e0c63c	0	2	\N	\N	a57a57a8-88ea-4ea0-baaa-93ac64b62936	\N
db50fe78-fe31-4294-88ce-f8cb73a28093	0	1	\N	\N	4d7485c9-5539-4b98-9f8d-8516040f0f8e	\N
df9d5627-0e69-4add-bd75-014080fcdf99	0	2	\N	\N	f01c23ab-c50e-46e3-8cc5-cd705b745698	\N
dfe17d63-c085-432e-a22f-8a27f9933091	0	3	\N	\N	f615cf29-b05b-4af2-94b4-f63c5da75e50	\N
dfe70e34-2797-4ff7-af3f-67a0088c95f4	0	2	\N	\N	82528c53-8c88-40ee-92a7-12a160cf1230	\N
e0c89677-5179-4985-acf2-10994a0431eb	0	2	\N	\N	b83ae98a-0e13-4434-a80b-27fc764297fe	\N
e1d56f89-9527-4a01-af72-fe1320cee2e5	0	2	\N	\N	202ba4bf-d714-429d-9a39-57d256255e99	\N
e234ef83-d9f6-4b58-a297-b8d4e18ec8be	0	3	\N	\N	9329dcb5-4f03-4054-9ff5-296fd6cfcbe9	\N
e32e48cd-119a-409e-b4cf-8ae2d914db17	0	3	\N	\N	ab3a4324-e134-48cd-941f-5f3c13c9618c	\N
e389bc7c-6935-4563-8794-0f1abd3099c9	0	3	\N	\N	45cac872-31e8-4328-9f2f-694d1765dadb	\N
e412f1e4-0e69-4372-ba18-3162370b912a	0	2	\N	\N	83435e87-436d-4fa1-b91a-57a4dc9d0cf4	\N
e7bda2e0-03da-4cbd-a4ba-0b5352c34729	0	1	\N	\N	8b7ad790-cba9-4d1e-a1c6-687c9b5d3ce8	\N
ea7eb864-29c8-4d7a-87a5-4df1ecb12992	0	2	\N	\N	b16b6f4f-4ab8-41e7-a54e-a6a607af648d	\N
eb65afac-6c64-4c34-bd66-8151e96e2a66	0	3	\N	\N	997e372c-39aa-45cc-b939-7e20aec4ef65	\N
ed29491b-8779-4ab0-919f-2659abb941d5	0	3	\N	\N	08433d18-3b0b-4c13-a623-0bd1df29ab12	\N
efb424fa-f5eb-45b1-97f3-bd6e00c5b597	0	2	\N	\N	b97c80aa-3798-4914-a7b6-b582857be2ba	\N
f0f1ef2c-43b7-409c-8aed-6630a5b85087	0	3	\N	\N	5e587cb2-849b-42de-b4fe-4bb078ca9ab8	\N
f28b1af8-bff5-4bf5-9def-7993bbcdbd31	0	2	\N	\N	c4f9ebe7-2199-4beb-8e43-fd76dfebcef1	\N
f3ba2f9d-fd78-458b-900d-a7f537ac8efb	0	2	\N	\N	54054e6c-3569-4a8e-a832-5fd5c8960cd5	\N
f3fc2e56-a0b7-4115-9820-9c3864ed91de	0	1	\N	\N	b60bd980-90e4-4a6c-938c-3840f229f2b3	\N
f853a073-a157-493f-97ea-733c778698b0	0	1	\N	\N	45cac872-31e8-4328-9f2f-694d1765dadb	\N
f9393fb8-b0f0-4505-b223-8a05f0238930	0	2	\N	\N	8a33b2d1-cef6-4981-b0f1-9a5bb3d5bef4	\N
fba0b0cb-9b4d-491c-b039-7fec201e7941	0	1	\N	\N	8050d78c-4929-485d-b7f2-bf0711a5d6c6	\N
fcef41f7-a491-4f6e-9f94-c225f2822a1b	0	1	\N	\N	2633bebb-a8bf-4ba5-89e8-51256cfd1e8b	\N
fe7717f1-4a94-43f5-9a1c-844df838e297	0	3	\N	\N	2111726e-1ec1-4e09-bddf-336c2d3322e7	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
04392ed2-19cb-406e-96ef-59c1974082a1	2	1880	t	f	e7d3951d-0018-4462-9c8f-457071489b39	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
080b6e89-0aec-4a5e-814a-f14ed5aa10eb	55	400	t	f	675f9fbb-acb3-4c0f-9664-fab447c2ae46	c571776e-7a73-4c1e-83a3-f0c185436aed	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
0e139180-5529-49f2-8569-128a994bef9b	52	1200	t	f	1ebf0c71-3547-43ec-99b2-b2b0787c90e0	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
0e3fb5dc-424f-43b7-b20f-42d2aaaa8857	18	4000	t	f	30fb30a3-3010-4ec6-9234-8f312098bd52	632a4728-5ba5-476c-aa3d-01201de2f15e	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
10e649dd-9f7b-4aa5-9274-f55786aaf97b	18	4000	t	f	2f886464-4fed-4078-88d8-983a8ba83c2a	632a4728-5ba5-476c-aa3d-01201de2f15e	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
11b5b808-dffd-469f-bb58-0e4d5b5f566a	1	1900	t	f	524371fd-f395-467f-828d-70f4990d32ef	c0ef944f-ca90-4f14-8cf7-218de26145f0	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
11e7eee1-fa3f-4f98-aaea-5eea075da1fb	52	1200	t	f	4ae60778-badb-4548-aa6e-41761cbbc9ba	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
221c2031-9730-455d-903d-04c5a629bda6	52	1200	t	f	a56b4238-eeac-44c8-bc69-dbb77e5365dd	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
352514c9-026a-4de1-8b04-a06cd88424f8	2	1880	t	f	db62e132-c1c8-48e2-be16-ffd45acaf97b	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
384e7662-c3b9-4dd5-90e4-12216236defe	58	900	t	f	7216aa5c-654d-48ee-8345-d945a585e05c	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
4b5377ac-cfab-4df2-b314-eff2e4020051	39	280	t	f	af6da198-c42a-44ef-b793-5af305699a6b	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
4ba115ec-5088-461a-b065-0e974c0099a0	58	900	t	f	213b4a8e-121c-4114-91fd-df5a42cb2fe9	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
523bf8de-daa7-498e-8e65-44734ea0ba25	56	400	t	f	213b4a8e-121c-4114-91fd-df5a42cb2fe9	81036f48-407f-47ac-b622-e65eca1e35c8	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
534fa0ac-d318-4d3f-8a5d-d962fab3544d	2	1880	t	f	524371fd-f395-467f-828d-70f4990d32ef	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
5a66b39b-6bd3-41be-a887-dac4d456f619	52	1200	t	f	af026bdb-061d-41ea-9dc4-d18693c2e54b	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
5f6d01ef-db24-4c32-b926-0d5217a8a6e0	58	900	t	f	2c51789e-f53e-448e-a066-5e38ad1193d5	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
61b51767-1d16-448f-95da-444da1629f2e	1	1900	t	f	7e765717-de5a-4541-a7ef-3ed2b2940bc0	c0ef944f-ca90-4f14-8cf7-218de26145f0	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
62582c0b-ff6f-4dd5-b1d8-446ff320ddab	39	280	t	f	1c873e2e-5905-48ba-afcc-7d17ac5aa5b1	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
72afddaf-ee6a-4879-acd5-7bd9e26d534c	2	1880	t	f	7e765717-de5a-4541-a7ef-3ed2b2940bc0	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
759ab911-eefe-4ae3-a601-2e06e97062d9	52	1200	t	f	e6ad8129-8888-4c6b-86aa-0a397330cc18	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
7ea06316-5fb0-4027-93e9-08a7cdf05936	39	280	t	f	30fb30a3-3010-4ec6-9234-8f312098bd52	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
81127eef-3c99-40bc-9b57-ed5db3c76283	55	400	t	f	7216aa5c-654d-48ee-8345-d945a585e05c	c571776e-7a73-4c1e-83a3-f0c185436aed	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
82a26ef9-f888-4e78-8d2c-657aa666899d	2	1880	t	f	7c5a8a2d-2234-4c7e-93f2-1a875c16a224	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
8ca1cd40-bf7d-4ed8-9ba1-7f9d0f364274	2	1880	t	f	1865be50-9e1a-44a8-af97-1ef21571e048	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
8cf6b5b9-5a6e-4692-afb4-19d359f62ee1	58	900	t	f	675f9fbb-acb3-4c0f-9664-fab447c2ae46	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
905704ff-8a64-433b-ab05-3dcac0d451be	1	1900	t	f	e1c623b6-7cae-40be-bc8e-45b98f52b62e	c0ef944f-ca90-4f14-8cf7-218de26145f0	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
93862793-e8f0-4058-8df5-5110581a522e	58	900	t	f	f462830c-c5fe-4ff6-b5d6-10f217d2461b	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
a1be54d7-b659-4a2d-8883-f4f35cb63d1e	18	4000	t	f	5543d18d-6806-4653-83df-3442ede71d45	632a4728-5ba5-476c-aa3d-01201de2f15e	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
a1f5ba5f-1bc0-4534-b3db-aa6b3eb0af37	48	1900	t	f	3c469e7b-3a43-406c-b9ae-f3b63edaf499	0a6e554a-625c-4229-9fcd-e7ea63e168d6	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
a99679f7-fbc7-4f05-beb1-a352486b4165	54	400	t	f	eda2257c-9aae-4e7c-82b6-76b706ea25a8	6480972b-5c8e-4786-8557-80343b3d9cf6	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
ab7fef31-bf0f-47b0-ac70-18486d79779d	57	400	t	f	dc649dad-434d-4124-b049-2b97fc6ad45d	8b69aa00-2a5e-40f7-b4d8-c821c72fa208	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
ace7f11b-7624-422f-8725-8dbb06cc9044	39	280	t	f	472697c3-31e7-4694-82a0-b8f6e74a0a84	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
ad006b02-3de0-42a9-a193-5622e253be76	52	1200	t	f	e086d6f5-6825-4742-8d83-2674bf3dca5b	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
b030abbf-33fb-4cfc-bd96-d459f3d109b7	58	900	t	f	d92b82ce-bdf6-4297-a3be-6f1b51b2bec3	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
b06db3fd-c924-45ab-8a17-186b64498b3a	56	400	t	f	2c51789e-f53e-448e-a066-5e38ad1193d5	81036f48-407f-47ac-b622-e65eca1e35c8	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
b6e03d15-cd18-4037-93ab-50862dbb10d3	2	1880	t	f	ca7a1da1-1baa-4e6b-9c05-cb9fab3d06b8	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
b768ee23-bdb5-455a-8a78-d01afcd49a62	39	280	t	f	d49c3064-99f1-4115-9b5d-2279dc76897e	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
b838d7aa-0575-4385-828b-b4c1a6cd0d16	48	1900	t	f	5d47bf41-20f1-49e0-93ac-cfaa10f70430	0a6e554a-625c-4229-9fcd-e7ea63e168d6	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
b9634af6-f534-451f-9c86-ef4709c234f0	39	280	t	f	2dd47a80-acc3-4013-901b-1f304e1db8f4	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
c65df798-29db-4a05-a89d-b4107b6a5d73	18	4000	t	f	472697c3-31e7-4694-82a0-b8f6e74a0a84	632a4728-5ba5-476c-aa3d-01201de2f15e	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
c9e5e6be-32b7-4cf2-aaeb-6328917e6153	39	280	t	f	5543d18d-6806-4653-83df-3442ede71d45	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
d0d70b9d-dfa5-43d2-96f6-ec140dc7d68a	39	280	t	f	d1702cd2-671d-408f-bbf2-779f37844d87	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
d5123aff-8fb9-44e0-9b0a-b8ac4269dd1d	58	900	t	f	eda2257c-9aae-4e7c-82b6-76b706ea25a8	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
d677f946-7251-45ad-a06a-c830b105fabe	39	280	t	f	c22b291f-2c4b-4928-9d5e-79b91308fae9	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
da00e9cc-87ef-4418-ae43-807f776b18d6	58	900	t	f	dc649dad-434d-4124-b049-2b97fc6ad45d	5e361208-298f-4ed7-8960-0dda6087c85d	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
dc4604e0-8dd9-4cbf-ac77-1923ee05544b	18	4000	t	f	b128d143-1bee-4dc0-8be4-464ebf9eb600	632a4728-5ba5-476c-aa3d-01201de2f15e	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
df07671f-db6d-4096-8a9a-91f1d7243bf5	1	1900	t	f	ca7a1da1-1baa-4e6b-9c05-cb9fab3d06b8	c0ef944f-ca90-4f14-8cf7-218de26145f0	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
e0ae11d5-4d34-4882-bed5-d5935b9a780b	2	1880	t	f	e1c623b6-7cae-40be-bc8e-45b98f52b62e	0b101eb1-db58-4099-bc53-c98693eaf339	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
e2859c97-26f7-4dc2-8c04-de980c58e0ff	39	280	t	f	2f886464-4fed-4078-88d8-983a8ba83c2a	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
e7f56ad8-3279-48fa-8966-1e49313cde36	54	400	t	f	d92b82ce-bdf6-4297-a3be-6f1b51b2bec3	6480972b-5c8e-4786-8557-80343b3d9cf6	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
efda56b2-e087-4f0a-9158-20d0420c81ae	57	400	t	f	f462830c-c5fe-4ff6-b5d6-10f217d2461b	8b69aa00-2a5e-40f7-b4d8-c821c72fa208	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
f1e06314-d86d-48d1-ad54-2384d6694404	18	4000	t	f	e63cde5a-dc9b-4bed-adc9-5331b0a86471	632a4728-5ba5-476c-aa3d-01201de2f15e	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
0364cd07-db1f-439e-9ec9-fa9854ee175a	52	Инструкция 52	52
0a6e554a-625c-4229-9fcd-e7ea63e168d6	48	Инструкция 48	48
0b101eb1-db58-4099-bc53-c98693eaf339	2	Инструкция 2	2
5e361208-298f-4ed7-8960-0dda6087c85d	58	Инструкция 58	58
632a4728-5ba5-476c-aa3d-01201de2f15e	18	Инструкция 18	18
6480972b-5c8e-4786-8557-80343b3d9cf6	54	Инструкция 54	54
81036f48-407f-47ac-b622-e65eca1e35c8	56	Инструкция 56	56
8b69aa00-2a5e-40f7-b4d8-c821c72fa208	57	Инструкция 57	57
bc57bf57-045e-4493-8cfc-d60e3ca86f3b	39	Инструкция 39	39
c0ef944f-ca90-4f14-8cf7-218de26145f0	1	Инструкция 1	1
c571776e-7a73-4c1e-83a3-f0c185436aed	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
1d66e56f-c570-4cff-9019-e195f2ef18ca	7513D-2800010-20	Рама	\N	3330041
2efec15c-0718-4e71-9b7b-00da763b7291	75131-2801300-20	Поперечина рамы задняя	\N	2868425
490cf5c8-b8c7-4afe-a921-934b0590dd01	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
107a07f9-7c23-48e6-8ee3-ff8f0c1ad9e8	14b5e814-0219-4613-973f-078b65601770
e3286fa9-5014-4539-b458-2ed37c2f498f	14b5e814-0219-4613-973f-078b65601770
54962869-b87d-4a4f-bf4e-d96862010304	7270d725-8658-4e0f-ac5c-6ee6f4b3edc6
8469490a-6787-45b7-83ab-cb15b54cd7d4	7270d725-8658-4e0f-ac5c-6ee6f4b3edc6
f85d439c-4898-4ad4-9e5b-c09e11c1c5bc	7270d725-8658-4e0f-ac5c-6ee6f4b3edc6
32baa344-56e4-44e2-89ce-a35bc8256690	677e0269-ff06-4289-9d84-74a5dcd217de
4fb6a352-dd98-44c5-b250-790517f84898	677e0269-ff06-4289-9d84-74a5dcd217de
6549d247-c500-4ea9-84ea-519594fb18d4	677e0269-ff06-4289-9d84-74a5dcd217de
673bbfd8-3c71-4476-a11c-ffd2d1b4f604	677e0269-ff06-4289-9d84-74a5dcd217de
a3350abc-280d-40cd-8a25-e345920df4c2	677e0269-ff06-4289-9d84-74a5dcd217de
d400b11a-73fd-4bce-85b3-a0ab563cd05c	677e0269-ff06-4289-9d84-74a5dcd217de
e9de4059-e6ee-4d8b-a837-89412f545d94	677e0269-ff06-4289-9d84-74a5dcd217de
f51e16e3-933d-4e1c-90d3-b961a98f7bf1	677e0269-ff06-4289-9d84-74a5dcd217de
05274e2b-987c-488a-8ad8-c78e15a9f545	88efe4ab-82a1-4b4b-a735-48eb6e4f6540
b5d39717-ca41-439c-8cce-104025ae6380	6536b9eb-9612-40fe-a2ef-446bf326efb9
a4e021e0-19fa-401f-b7b8-8a564790d015	677e0269-ff06-4289-9d84-74a5dcd217de
e4f78764-f0fc-46c0-b7cf-3cda49ccfc9d	14b5e814-0219-4613-973f-078b65601770
af49b2ef-3f13-417b-a889-c2553412ab4d	88efe4ab-82a1-4b4b-a735-48eb6e4f6540
65519721-3656-4802-8993-1abed0b43718	7270d725-8658-4e0f-ac5c-6ee6f4b3edc6
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
107a07f9-7c23-48e6-8ee3-ff8f0c1ad9e8	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
e3286fa9-5014-4539-b458-2ed37c2f498f	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
54962869-b87d-4a4f-bf4e-d96862010304	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
8469490a-6787-45b7-83ab-cb15b54cd7d4	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
f85d439c-4898-4ad4-9e5b-c09e11c1c5bc	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
32baa344-56e4-44e2-89ce-a35bc8256690	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
4fb6a352-dd98-44c5-b250-790517f84898	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
6549d247-c500-4ea9-84ea-519594fb18d4	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
673bbfd8-3c71-4476-a11c-ffd2d1b4f604	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
a3350abc-280d-40cd-8a25-e345920df4c2	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:F1:7D:5A	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
d400b11a-73fd-4bce-85b3-a0ab563cd05c	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	B7:5A:79:B5	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
e9de4059-e6ee-4d8b-a837-89412f545d94	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
f51e16e3-933d-4e1c-90d3-b961a98f7bf1	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
05274e2b-987c-488a-8ad8-c78e15a9f545	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
b5d39717-ca41-439c-8cce-104025ae6380	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$iR+TRBTXXuFLUvReNBIWoFqiMcX+pHMJfGi181vKmP+mj0GX	\N	\N	\N	\N	\N	\N
a4e021e0-19fa-401f-b7b8-8a564790d015	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$eL0kOb9fkGAZw5uAZlNjHarfTl57aOBxormKUCr/ZlMGG6So	\N	\N	\N	\N	\N	\N
e4f78764-f0fc-46c0-b7cf-3cda49ccfc9d	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$4zkdxHBEVX4M1IUycTvkPEryicsI+zL6eQOqWrRSEop0A7oA	\N	\N	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
af49b2ef-3f13-417b-a889-c2553412ab4d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$yfcEN4ZvNwDQRqt3XfdTre7StmM06WPnf/diML7HOiGZu44W	\N	\N	\N	\N	\N	\N
65519721-3656-4802-8993-1abed0b43718	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$BoIjt1W4NyxRGlU+Ojz2A3zwLNEynsTHHD/4iVyIFjSJyAbX	\N	\N	\N	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
004eb6ff-82c7-401d-a8a7-e6c368a35046	1	Заполняющий	230	270	23	26	\N	\N	c0ef944f-ca90-4f14-8cf7-218de26145f0	\N
063ba976-4acb-400b-81df-0758b8353ca1	1	Заполняющий	230	270	23	26	\N	\N	6480972b-5c8e-4786-8557-80343b3d9cf6	\N
3903b243-ccf0-47b4-a609-674484d0fc1c	1	Заполняющий	230	270	23	26	\N	\N	0b101eb1-db58-4099-bc53-c98693eaf339	\N
612d6634-d885-48a1-8e10-4e4933ada6b8	1	Заполняющий	230	270	23	26	\N	\N	8b69aa00-2a5e-40f7-b4d8-c821c72fa208	\N
6fcfb9b2-119a-43ca-812c-6927d8debcf2	1	Заполняющий	230	270	23	26	\N	\N	0a6e554a-625c-4229-9fcd-e7ea63e168d6	\N
8cc9b89c-c6c1-4ccb-81d7-04306e2be945	1	Заполняющий	230	270	23	26	\N	\N	c571776e-7a73-4c1e-83a3-f0c185436aed	\N
93704e06-73dc-4649-9a60-bd1a76941513	1	Заполняющий	230	270	23	26	\N	\N	0364cd07-db1f-439e-9ec9-fa9854ee175a	\N
95b53b47-fa50-4d07-b94b-cbb850bb47ff	1	Заполняющий	230	270	23	26	\N	\N	bc57bf57-045e-4493-8cfc-d60e3ca86f3b	\N
9e8d805e-1ddf-49ef-a892-07919d4c6989	1	Заполняющий	230	270	23	26	\N	\N	632a4728-5ba5-476c-aa3d-01201de2f15e	\N
efde4cf1-362b-453d-9bee-3111d884c602	1	Заполняющий	230	270	23	26	\N	\N	5e361208-298f-4ed7-8960-0dda6087c85d	\N
f27da100-b946-496f-8901-47ed624259df	1	Заполняющий	230	270	23	26	\N	\N	81036f48-407f-47ac-b622-e65eca1e35c8	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
14b31f45-57a2-4d4c-8b39-268a01c9c976	1	Корневой	82	0.11	0.68	\N	\N	\N	f13c4d8f-8106-4131-bbb8-5062065d41e9	d88e0eac-5391-42c2-9fa6-78a08f7ec184	\N
3814935c-f4e5-4cbf-9c2f-24734b6c27cd	2	Заполняющий	100	0.22	0.44	\N	\N	\N	78f62d89-0c05-41ae-839e-e4be4cef7288	d88e0eac-5391-42c2-9fa6-78a08f7ec184	\N
db2a1f2b-3227-45de-8958-bdecd45d0f12	1	Корневой	82	0.11	0.68	\N	\N	\N	7f3cc4c6-190c-4dad-8478-7532549c1eb9	fe09a7b9-acc5-496d-acde-8a2bfd46877f	\N
e9ce50ab-f7e5-4e0b-a37c-1149f224e041	2	Заполняющий	100	0.22	0.44	\N	\N	\N	4152ea97-7daf-4b0d-bea4-4e5766c8357f	fe09a7b9-acc5-496d-acde-8a2bfd46877f	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0bef6510-3b92-44b3-90d3-877b68794b6b	09d2adef-cbcf-4a59-976c-6121aaeb33e4
0bef6510-3b92-44b3-90d3-877b68794b6b	696b81cf-e9a0-4936-ad30-dcf51ce6797a
6261766f-71aa-4be1-ad4b-813cf8cfe989	f6f002fc-54dd-45b1-95ef-3a5b07778776
713b9407-8f73-47b2-9e9b-4d570b6e45c5	f6f002fc-54dd-45b1-95ef-3a5b07778776
71767d64-dcbf-4c9f-a2ea-91bec8f1d7ce	09d2adef-cbcf-4a59-976c-6121aaeb33e4
71767d64-dcbf-4c9f-a2ea-91bec8f1d7ce	696b81cf-e9a0-4936-ad30-dcf51ce6797a
79d09f63-d81e-4fb1-8257-e836230cd454	2ab2e72f-066d-494b-b11e-64a160ff3ba3
8f9531b6-3611-4391-b3c9-601d326d5ae2	09d2adef-cbcf-4a59-976c-6121aaeb33e4
8f9531b6-3611-4391-b3c9-601d326d5ae2	696b81cf-e9a0-4936-ad30-dcf51ce6797a
abc429de-53c8-4a25-909b-35dfdc5ccffb	2ab2e72f-066d-494b-b11e-64a160ff3ba3
f1242fd2-4402-480c-9205-9b7696791694	09d2adef-cbcf-4a59-976c-6121aaeb33e4
f1242fd2-4402-480c-9205-9b7696791694	696b81cf-e9a0-4936-ad30-dcf51ce6797a
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0bef6510-3b92-44b3-90d3-877b68794b6b	4fb6a352-dd98-44c5-b250-790517f84898	\N	150882
6261766f-71aa-4be1-ad4b-813cf8cfe989	a3350abc-280d-40cd-8a25-e345920df4c2	\N	121267
713b9407-8f73-47b2-9e9b-4d570b6e45c5	673bbfd8-3c71-4476-a11c-ffd2d1b4f604	\N	117390
71767d64-dcbf-4c9f-a2ea-91bec8f1d7ce	e9de4059-e6ee-4d8b-a837-89412f545d94	\N	146164
79d09f63-d81e-4fb1-8257-e836230cd454	f51e16e3-933d-4e1c-90d3-b961a98f7bf1	\N	132695
8f9531b6-3611-4391-b3c9-601d326d5ae2	32baa344-56e4-44e2-89ce-a35bc8256690	\N	150838
abc429de-53c8-4a25-909b-35dfdc5ccffb	6549d247-c500-4ea9-84ea-519594fb18d4	\N	122575
f1242fd2-4402-480c-9205-9b7696791694	d400b11a-73fd-4bce-85b3-a0ab563cd05c	\N	114729
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
09d2adef-cbcf-4a59-976c-6121aaeb33e4	3b6098e9-dca1-405d-ada9-3ddf393a0414
09d2adef-cbcf-4a59-976c-6121aaeb33e4	49ea2a81-96d3-4148-950d-b78ec8d03fd0
09d2adef-cbcf-4a59-976c-6121aaeb33e4	b606cabe-9332-4945-80ad-4cbd301e16df
09d2adef-cbcf-4a59-976c-6121aaeb33e4	f3bdaed3-3623-4baa-95b6-5c282e65bb94
2ab2e72f-066d-494b-b11e-64a160ff3ba3	49ea2a81-96d3-4148-950d-b78ec8d03fd0
2ab2e72f-066d-494b-b11e-64a160ff3ba3	5e20f5f6-ff3d-4cec-b2cf-ebacfea397c6
696b81cf-e9a0-4936-ad30-dcf51ce6797a	3b6098e9-dca1-405d-ada9-3ddf393a0414
696b81cf-e9a0-4936-ad30-dcf51ce6797a	49ea2a81-96d3-4148-950d-b78ec8d03fd0
696b81cf-e9a0-4936-ad30-dcf51ce6797a	b606cabe-9332-4945-80ad-4cbd301e16df
696b81cf-e9a0-4936-ad30-dcf51ce6797a	f3bdaed3-3623-4baa-95b6-5c282e65bb94
f6f002fc-54dd-45b1-95ef-3a5b07778776	b606cabe-9332-4945-80ad-4cbd301e16df
f6f002fc-54dd-45b1-95ef-3a5b07778776	fd8c7627-a505-4117-92d3-58a72e33a33a
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
09d2adef-cbcf-4a59-976c-6121aaeb33e4	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	49141
2ab2e72f-066d-494b-b11e-64a160ff3ba3	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	49286
696b81cf-e9a0-4936-ad30-dcf51ce6797a	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	49283
f6f002fc-54dd-45b1-95ef-3a5b07778776	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	49232
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
4152ea97-7daf-4b0d-bea4-4e5766c8357f	2023-03-04 21:08:40.599378	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	696b81cf-e9a0-4936-ad30-dcf51ce6797a	6261766f-71aa-4be1-ad4b-813cf8cfe989	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	\N
78f62d89-0c05-41ae-839e-e4be4cef7288	2023-03-04 21:08:40.599436	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	696b81cf-e9a0-4936-ad30-dcf51ce6797a	6261766f-71aa-4be1-ad4b-813cf8cfe989	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	\N
7f3cc4c6-190c-4dad-8478-7532549c1eb9	2023-03-04 21:08:40.59932	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	696b81cf-e9a0-4936-ad30-dcf51ce6797a	6261766f-71aa-4be1-ad4b-813cf8cfe989	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	\N
f13c4d8f-8106-4131-bbb8-5062065d41e9	2023-03-04 21:08:40.599435	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	696b81cf-e9a0-4936-ad30-dcf51ce6797a	6261766f-71aa-4be1-ad4b-813cf8cfe989	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
d88e0eac-5391-42c2-9fa6-78a08f7ec184	1	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	0e3fb5dc-424f-43b7-b20f-42d2aaaa8857	6261766f-71aa-4be1-ad4b-813cf8cfe989	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	cbe02a77-e7d5-4a8c-b0ee-9e25f70bbb4f	\N
fe09a7b9-acc5-496d-acde-8a2bfd46877f	2	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	a1f5ba5f-1bc0-4534-b3db-aa6b3eb0af37	6261766f-71aa-4be1-ad4b-813cf8cfe989	04bd12ff-5e69-4263-8eb5-f0d52e5dcbc6	cbe02a77-e7d5-4a8c-b0ee-9e25f70bbb4f	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
2fe0c399-2021-43da-950e-6520452c3ea2	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	85589dad-7102-4cce-8657-414089727ef4	\N
43556006-3b21-43db-b51c-c45451ef57c1	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	85589dad-7102-4cce-8657-414089727ef4	\N
8b3a73cf-87b6-486b-8a96-a977ad729c9c	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	85589dad-7102-4cce-8657-414089727ef4	\N
1cbea6a9-09e5-4821-b84d-4b342e12a304	1	12:10:00	13:10:00	13:20:00	13:50:00	50b9f814-83bb-4f0d-990e-1aeeffc982b5	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
3b6098e9-dca1-405d-ada9-3ddf393a0414	3690	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	3690
49ea2a81-96d3-4148-950d-b78ec8d03fd0	3500	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	3500
5e20f5f6-ff3d-4cec-b2cf-ebacfea397c6	3510	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	3510
b606cabe-9332-4945-80ad-4cbd301e16df	3610	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	3610
f3bdaed3-3623-4baa-95b6-5c282e65bb94	3550	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	3550
fd8c7627-a505-4117-92d3-58a72e33a33a	3600	\N	67effd09-03c2-4d41-baf6-4d99ade6f274	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
8bf6291c-34f7-4371-857c-0e85efcbc1d3	Сварочный цех	50	050
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

