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
39edbff2-563d-4d02-9764-7b46b4ab0520	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
1d5efc6b-261c-4c29-8736-b62682d50d44	13f6107f-8431-484e-a2c6-4a420fe9ccb4	df7d773c-8040-4c9f-8933-4e5996b3970b	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
7c269b63-8724-4786-9268-ed3b86bf6dd3	1	10	t	39edbff2-563d-4d02-9764-7b46b4ab0520	\N
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
1190510c-3fb4-418a-bd50-6570fa8fcd20	Отсутствие материала, заготовок, деталей	\N
1375353f-69b2-46c2-bdd4-e88f35af99f3	Ознакомление с работой, документацией, инструктаж	\N
1b1f6785-63d0-4889-8ba3-3bd7a96d20bb	Отсутствие энергоносителей	\N
1e92cc4e-7faa-465c-9cab-361abe87cdf9	Плановый ремонт централизованными службами	\N
2f25ed49-45c9-448d-962d-3e455c6f3425	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
3de979f7-eed7-40d5-9d35-231874ea9729	Сборочные операции	\N
40878633-23f7-490d-b809-31d5d67fafff	Отсутствие крана, транспорта	\N
41b975e0-af29-4246-b42c-754f232f1e03	Контроль на рабочем месте	\N
4dfcda4e-c7b0-48e9-b500-6f4618798db6	Отсутствие конструктора, технолога или ожидание его решения	\N
50965c71-2551-4615-b89e-6f77e0367251	Изменение режимов, смена инструмента, приспособления	\N
5a6b54ef-dbcf-432a-99ba-cc53505d8e70	Естественные надобности	\N
6f956dc3-f324-4f2f-93ec-f49f9ad78355	Отсутствие сотрудника ОТК	\N
77b49db4-26ed-48ba-bb6a-2630280f2bcb	Нерабочее время по графику согласно сменности	\N
80c16fbb-513c-4bf9-8be7-a684d293651f	Отсутствие оператора в связи с необеспеченностью	\N
829da478-df59-4fc6-928c-3c28ff1cfb0c	Обед	\N
9116ce3c-eb65-4e4f-8179-2639ac821861	Работа с управляющей программой	\N
95fb79b7-90d5-486d-abdd-13a5c7e90fac	Праздники и выходные	\N
a42dfa61-4d3f-4539-935f-db411eeadd31	Отсутствие заданий	\N
c7924013-6561-41e3-8b5c-8c9c25bf8534	Установка, выверка, снятие детали	\N
d2adb20f-faa0-48f3-92c2-900e59eb5c80	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
dd2fb74a-60d9-45eb-a6bf-c60584340c42	Работа по карте несоответствий	\N
e93edcc7-fa4a-4758-8571-7bd3a1fcd637	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
eb27fef6-2b55-41fb-aee8-689dcf0ca676	Установка, выверка, снятие детали	\N
f6973f20-abad-4214-bcb1-bffc11096aa4	Аварийный ремонт централизованными службами	\N
f7d4fc8f-4f87-481b-9787-1f7163146a4e	Неявка оператора (б/лист, отпуск, и пр.)	\N
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
6ad9d8bd-838b-4745-834a-5f97863b41b5	17781e65-a3b4-4f98-a1f2-0cd5f1e7ab7d	219379
84759f0c-687f-4e83-8e89-54013d5aec1d	56d1bb50-d0de-49a7-a018-7fb72a2a89e6	249550
f22e0e99-2acc-45b3-8e19-4d36883c1a2a	d532824c-93b2-4c76-b6de-c083d19ad436	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
2e12f16a-1fa8-4870-8676-15e8b800bafb	8425bce3-3392-4922-8227-3ac4796f998d	614962
ff98887c-cda0-4e2d-b5e6-be5412a72793	418fed38-60f1-4c84-af47-d5a36c7b4693	610422
bc1f5022-f754-4cd4-8dee-71d473f91d62	71703e88-2d1d-4f4e-96a7-8fd2fbeb4cb5	\N
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
0e1e8141-fb78-4f91-b151-104efb4e5239	34	2	2023-03-08 18:47:22.117732	b65df13e-1b3e-4055-8eb4-26dcc837d89b	\N
0fdd6fb8-b019-417a-a469-42cc030e9eb1	13	2	2023-03-08 18:47:22.115839	3f368fbc-1d93-4ba3-94a9-b89a3d398bf3	\N
10041415-17cf-4d6a-b45d-d213ab7f7b07	27	2	2023-03-08 18:47:22.117101	7434edd9-95a1-4cb6-8dd1-423d7bc1ecd6	\N
1cd86f79-e4f4-4ca0-b917-b9f3aecc5ded	33	2	2023-03-08 18:47:22.117633	adc58f26-98e2-4417-84fe-c98579e08438	\N
22254378-6bb8-43f7-abb5-ad2c817bdc96	41	2	2023-03-08 18:47:22.118354	f8d1b3ea-feeb-42bf-8312-e98c9255848a	\N
23da0219-a63e-4c97-8f9c-04aad91daff3	25	2	2023-03-08 18:47:22.116922	72125b71-d001-4322-8f1f-485a6bfe004d	\N
2d640858-2c21-4204-bfde-551b0b703369	14	2	2023-03-08 18:47:22.115929	428701c1-052a-4d2d-8b48-eb54094761c3	\N
3387d9ab-4e22-480c-a7b4-14738844f774	22	2	2023-03-08 18:47:22.116653	69b806e2-546c-4787-b840-e5343d399b39	\N
360d5e47-9480-447a-bf08-77943d2db345	20	2	2023-03-08 18:47:22.116472	60efc74c-993a-4eb0-b19d-dc8597773385	\N
3a94f273-5af1-4e00-99b8-8d4cd9dd0510	40	2	2023-03-08 18:47:22.118267	e8023add-f6ee-4d7a-b036-642733b6ec72	\N
3c0e7323-c297-4170-b49c-d3506c9ef0fb	39	2	2023-03-08 18:47:22.11818	e1adb52e-1d61-4da3-be01-83687a812c20	\N
50d9726e-d5fa-4e9e-a443-2b89bfdf77b3	37	2	2023-03-08 18:47:22.118001	cb251d1d-af00-4a30-b540-aa5432b92f85	\N
56fd9f10-33bf-4f56-b7ce-080f4c6e1874	21	2	2023-03-08 18:47:22.116565	632d3a78-164d-47f1-8ba3-92e158ef9fd7	\N
58091ec8-fe51-4d56-b87a-4e1eab3347da	16	2	2023-03-08 18:47:22.116108	4c8347f2-7115-4bff-8997-f41264326c75	\N
5ebe1ac0-a1b9-4766-bfc4-5fe9319dc157	36	2	2023-03-08 18:47:22.117913	c3e90121-235b-49a8-94a2-3a787e3147b3	\N
5fa0b1da-bc7e-4970-9537-3b53353bb43f	15	2	2023-03-08 18:47:22.11602	47f4a950-a6df-4777-834a-562448c9d1c9	\N
62f536e9-3ded-45e3-a546-7f9b8ca15a10	3	2	2023-03-08 18:47:22.114926	166eb653-ec32-4ec7-9d54-342aa4677740	\N
6328720b-66cd-49e0-80fc-6ae2cc6bfa78	24	2	2023-03-08 18:47:22.116835	6e88d398-1875-4f7c-81bc-413978e43d37	\N
649a6ddc-253a-49c7-8e23-00cb1dfb441f	17	2	2023-03-08 18:47:22.116197	4ebb639a-ff42-47a2-b165-9bc282445dc2	\N
69e2e8a0-176f-42d1-8403-12265fdbf0cf	6	2	2023-03-08 18:47:22.115209	251772ad-1025-4f4d-9409-a28cc696166f	\N
7ea52ca8-9f7b-4434-8212-cd67c42eb39d	18	2	2023-03-08 18:47:22.116284	570ab312-03b7-4af9-8cb1-a7113baf0fe3	\N
819443b6-c223-4bc4-a88a-3964c6b5126e	29	2	2023-03-08 18:47:22.117276	843ecdff-309c-4b7b-9ebb-35bc5f6b4224	\N
8c25dd92-b051-45e2-95c3-c77b2a2d03d7	1	2	2023-03-08 18:47:22.086309	0c3eb013-3c01-4d52-b355-dbb4877c05ab	\N
9031fc50-c2f9-48a3-ab70-8f637de8cc22	19	2	2023-03-08 18:47:22.11638	5d4eb8e2-cb60-43f4-9354-e8938998d79f	\N
97d7ce2b-ab63-4d58-8a42-92766583b5a5	42	2	2023-03-08 18:47:22.118447	f93cfd0a-84da-4ec0-8906-bc4d74266ea3	\N
9e2805b9-fa6f-46f0-b055-c4407d267b1f	10	2	2023-03-08 18:47:22.115568	3b82074d-619b-4a61-85e2-318b84934244	\N
a4ff3dcd-373b-44a8-b07e-53b942eabac7	4	2	2023-03-08 18:47:22.115024	1abcea86-6952-4316-bd41-a91007acf235	\N
b3715c79-7022-4d75-b91d-e86c3e358543	11	2	2023-03-08 18:47:22.115659	3bc21e28-4e33-4f47-8076-cca55bf3f519	\N
b4083213-4173-4394-b899-98dab06a1370	31	2	2023-03-08 18:47:22.117458	93e19aa0-5307-4a98-a56d-f6ac54e2f50c	\N
bcfc378d-b28f-4e39-8b90-d3e936de08b5	12	2	2023-03-08 18:47:22.115747	3ca96ba6-0c0b-4fd7-8358-853359b0feb7	\N
c1092c85-7499-4f8b-b2b3-3c1b81585ec6	5	2	2023-03-08 18:47:22.11512	1ba712e7-a60c-4c18-9dae-18af3aa2b5e2	\N
c14172ae-a42b-44b1-9a19-36dd31d5569c	2	2	2023-03-08 18:47:22.114804	1404cb55-4882-4fa0-9548-3e6e97305684	\N
c66a3113-8da9-4c88-ba63-a52d8c991299	8	2	2023-03-08 18:47:22.115392	2b4ccec3-7fa9-485f-be72-5f32dfed9b0d	\N
c755e330-d5ff-426b-a636-9e8bda952343	9	2	2023-03-08 18:47:22.11548	2dba4230-cb0d-4461-8e44-87b933cdfabd	\N
e1575e9f-56f3-4281-a7a0-4ec6dd8f3a66	26	2	2023-03-08 18:47:22.117009	73a69d9c-adb9-46ac-8a79-a2734482cf1d	\N
e3c171f7-2a87-43f2-b037-7b758a449e91	23	2	2023-03-08 18:47:22.116744	6b877327-df67-4a20-b208-dde9f410a76b	\N
e5cfb444-d1d3-44ca-8e60-c0dfa9c48124	35	2	2023-03-08 18:47:22.117825	c04ebfd1-5e03-4866-b2ee-8811575d8bbf	\N
ebf40aca-200e-4694-813e-e7dba7d64453	32	2	2023-03-08 18:47:22.117545	9952c613-0d7b-4d50-a6f0-eaa92ee04874	\N
ec37bace-6bf6-4cfc-b41e-af82fcb60b89	30	2	2023-03-08 18:47:22.117363	86a29f8d-2ada-441c-aaa0-c2dd049debc2	\N
ee54e286-efc8-43c9-8f49-3586e9380e35	38	2	2023-03-08 18:47:22.11809	d75a28ab-510c-491b-b177-1c110556b3ba	\N
f75d3959-f65e-414a-9b8d-5d0063a60e2c	7	2	2023-03-08 18:47:22.115302	255ba618-f2b5-4cd7-8b44-259b7633a7b3	\N
f81b2c81-db88-4724-a24f-0fcd5c1d27ed	28	2	2023-03-08 18:47:22.117188	8122a34f-c326-4b52-a3a7-38e51c5121db	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
3b82074d-619b-4a61-85e2-318b84934244	0c3eb013-3c01-4d52-b355-dbb4877c05ab
f8d1b3ea-feeb-42bf-8312-e98c9255848a	1404cb55-4882-4fa0-9548-3e6e97305684
5d4eb8e2-cb60-43f4-9354-e8938998d79f	166eb653-ec32-4ec7-9d54-342aa4677740
f8d1b3ea-feeb-42bf-8312-e98c9255848a	1abcea86-6952-4316-bd41-a91007acf235
5d4eb8e2-cb60-43f4-9354-e8938998d79f	1ba712e7-a60c-4c18-9dae-18af3aa2b5e2
d75a28ab-510c-491b-b177-1c110556b3ba	251772ad-1025-4f4d-9409-a28cc696166f
3f368fbc-1d93-4ba3-94a9-b89a3d398bf3	255ba618-f2b5-4cd7-8b44-259b7633a7b3
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	2b4ccec3-7fa9-485f-be72-5f32dfed9b0d
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	2dba4230-cb0d-4461-8e44-87b933cdfabd
9952c613-0d7b-4d50-a6f0-eaa92ee04874	3bc21e28-4e33-4f47-8076-cca55bf3f519
d75a28ab-510c-491b-b177-1c110556b3ba	3ca96ba6-0c0b-4fd7-8358-853359b0feb7
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	3f368fbc-1d93-4ba3-94a9-b89a3d398bf3
d75a28ab-510c-491b-b177-1c110556b3ba	428701c1-052a-4d2d-8b48-eb54094761c3
3b82074d-619b-4a61-85e2-318b84934244	47f4a950-a6df-4777-834a-562448c9d1c9
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	4c8347f2-7115-4bff-8997-f41264326c75
3b82074d-619b-4a61-85e2-318b84934244	4ebb639a-ff42-47a2-b165-9bc282445dc2
d75a28ab-510c-491b-b177-1c110556b3ba	570ab312-03b7-4af9-8cb1-a7113baf0fe3
3b82074d-619b-4a61-85e2-318b84934244	5d4eb8e2-cb60-43f4-9354-e8938998d79f
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	60efc74c-993a-4eb0-b19d-dc8597773385
cb251d1d-af00-4a30-b540-aa5432b92f85	632d3a78-164d-47f1-8ba3-92e158ef9fd7
f8d1b3ea-feeb-42bf-8312-e98c9255848a	69b806e2-546c-4787-b840-e5343d399b39
3f368fbc-1d93-4ba3-94a9-b89a3d398bf3	6b877327-df67-4a20-b208-dde9f410a76b
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	6e88d398-1875-4f7c-81bc-413978e43d37
6e88d398-1875-4f7c-81bc-413978e43d37	72125b71-d001-4322-8f1f-485a6bfe004d
d75a28ab-510c-491b-b177-1c110556b3ba	73a69d9c-adb9-46ac-8a79-a2734482cf1d
4c8347f2-7115-4bff-8997-f41264326c75	7434edd9-95a1-4cb6-8dd1-423d7bc1ecd6
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	8122a34f-c326-4b52-a3a7-38e51c5121db
3b82074d-619b-4a61-85e2-318b84934244	86a29f8d-2ada-441c-aaa0-c2dd049debc2
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	93e19aa0-5307-4a98-a56d-f6ac54e2f50c
3b82074d-619b-4a61-85e2-318b84934244	9952c613-0d7b-4d50-a6f0-eaa92ee04874
f8d1b3ea-feeb-42bf-8312-e98c9255848a	adc58f26-98e2-4417-84fe-c98579e08438
4ebb639a-ff42-47a2-b165-9bc282445dc2	b65df13e-1b3e-4055-8eb4-26dcc837d89b
9952c613-0d7b-4d50-a6f0-eaa92ee04874	c04ebfd1-5e03-4866-b2ee-8811575d8bbf
60efc74c-993a-4eb0-b19d-dc8597773385	c3e90121-235b-49a8-94a2-3a787e3147b3
3b82074d-619b-4a61-85e2-318b84934244	cb251d1d-af00-4a30-b540-aa5432b92f85
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	d75a28ab-510c-491b-b177-1c110556b3ba
60efc74c-993a-4eb0-b19d-dc8597773385	e1adb52e-1d61-4da3-be01-83687a812c20
f8d1b3ea-feeb-42bf-8312-e98c9255848a	e8023add-f6ee-4d7a-b036-642733b6ec72
3b82074d-619b-4a61-85e2-318b84934244	f8d1b3ea-feeb-42bf-8312-e98c9255848a
3b82074d-619b-4a61-85e2-318b84934244	f93cfd0a-84da-4ec0-8906-bc4d74266ea3
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
091308fb-e29d-4db0-8147-da9e618e8f81	0	3	\N	\N	7ea52ca8-9f7b-4434-8212-cd67c42eb39d	\N
095b5869-680a-4f70-a8fd-bb70d1f42dea	0	1	\N	\N	22254378-6bb8-43f7-abb5-ad2c817bdc96	\N
0b15509e-496c-47a3-9fb1-56f7988593d9	0	1	\N	\N	3c0e7323-c297-4170-b49c-d3506c9ef0fb	\N
0cffe35d-8c29-46ce-b412-689ee9664dd0	0	2	\N	\N	56fd9f10-33bf-4f56-b7ce-080f4c6e1874	\N
0f5718a1-1224-4edf-9e5c-e3338f50d7ec	0	1	\N	\N	10041415-17cf-4d6a-b45d-d213ab7f7b07	\N
10493c2b-3f6b-473e-a482-4e73a2647e52	0	2	\N	\N	69e2e8a0-176f-42d1-8403-12265fdbf0cf	\N
11014803-e491-4163-91da-cabdb969e752	0	3	\N	\N	e5cfb444-d1d3-44ca-8e60-c0dfa9c48124	\N
13f44bac-b617-4520-8899-6889dde40401	0	2	\N	\N	bcfc378d-b28f-4e39-8b90-d3e936de08b5	\N
14315c2b-fd8b-4d32-b4e3-7e916a898e30	0	3	\N	\N	23da0219-a63e-4c97-8f9c-04aad91daff3	\N
15287935-7b5f-47b4-98be-e93e2cc15ab5	0	1	\N	\N	9031fc50-c2f9-48a3-ab70-8f637de8cc22	\N
176caa1b-95de-42e4-93a7-6b44c34b024c	0	2	\N	\N	c66a3113-8da9-4c88-ba63-a52d8c991299	\N
1d002cd0-482a-4112-9dad-3797bf223701	0	3	\N	\N	e1575e9f-56f3-4281-a7a0-4ec6dd8f3a66	\N
1dc42777-d327-4bec-82a7-ab7a11314990	0	3	\N	\N	c755e330-d5ff-426b-a636-9e8bda952343	\N
2195df67-3568-45b4-8aa8-c25083b50d52	0	1	\N	\N	e5cfb444-d1d3-44ca-8e60-c0dfa9c48124	\N
21d99618-2222-4b0f-9e67-3573c06d8b6f	0	2	\N	\N	e1575e9f-56f3-4281-a7a0-4ec6dd8f3a66	\N
2843dfec-47dc-4537-9b6d-1b7ebc9f6692	0	3	\N	\N	97d7ce2b-ab63-4d58-8a42-92766583b5a5	\N
287a4257-24ae-445d-80c6-ea89f02067e5	0	3	\N	\N	b3715c79-7022-4d75-b91d-e86c3e358543	\N
2c88eef3-8113-4071-a4d5-867213da2100	0	3	\N	\N	ebf40aca-200e-4694-813e-e7dba7d64453	\N
2f36486e-c3d0-4fe6-9e8d-ed616564749b	0	2	\N	\N	c1092c85-7499-4f8b-b2b3-3c1b81585ec6	\N
31488cf0-b38d-4db2-ba5c-4c998badb845	0	2	\N	\N	b4083213-4173-4394-b899-98dab06a1370	\N
336c45b0-fa93-4efa-b9c5-1d18ef44c9a6	0	2	\N	\N	ec37bace-6bf6-4cfc-b41e-af82fcb60b89	\N
33cf49d7-caa3-405c-a46b-a67dd7f8b1a5	0	3	\N	\N	0e1e8141-fb78-4f91-b151-104efb4e5239	\N
34b3d999-6456-454e-9f8f-9a75215f9e7a	0	2	\N	\N	8c25dd92-b051-45e2-95c3-c77b2a2d03d7	\N
34cd1ba6-b463-4ec1-9ce0-96f2994f1e8c	0	1	\N	\N	c14172ae-a42b-44b1-9a19-36dd31d5569c	\N
364384b1-5c24-4d70-ab5a-b6bb6808fe0f	0	2	\N	\N	5ebe1ac0-a1b9-4766-bfc4-5fe9319dc157	\N
36b27b62-cb99-43cd-90af-72fe3ed73509	0	1	\N	\N	f81b2c81-db88-4724-a24f-0fcd5c1d27ed	\N
3724fe0c-e4ce-4946-93b9-abed9d737297	0	2	\N	\N	b3715c79-7022-4d75-b91d-e86c3e358543	\N
3d6530ae-bfe7-4766-99a3-1ca9708ca883	0	1	\N	\N	5fa0b1da-bc7e-4970-9537-3b53353bb43f	\N
3f87eaac-54e2-4b1f-9670-8d867ac4c663	0	2	\N	\N	23da0219-a63e-4c97-8f9c-04aad91daff3	\N
3fc94ef6-a81b-4993-bf80-09757a1b4b32	0	1	\N	\N	bcfc378d-b28f-4e39-8b90-d3e936de08b5	\N
3fde5817-8b1d-40bc-9b34-1dab7726e8a5	0	1	\N	\N	649a6ddc-253a-49c7-8e23-00cb1dfb441f	\N
40601406-9a64-4f7b-bfdb-d67be8c956a3	0	3	\N	\N	ec37bace-6bf6-4cfc-b41e-af82fcb60b89	\N
4197f8b5-6372-49c7-a79e-751fa5269da4	0	2	\N	\N	62f536e9-3ded-45e3-a546-7f9b8ca15a10	\N
41ff92b0-51f4-4f76-bfb9-928f6c58d5cd	0	2	\N	\N	3387d9ab-4e22-480c-a7b4-14738844f774	\N
4702ea59-b16a-415a-a404-f42dd4c77268	0	2	\N	\N	819443b6-c223-4bc4-a88a-3964c6b5126e	\N
48c0f6ec-971d-4325-a119-453197a4dbd6	0	1	\N	\N	97d7ce2b-ab63-4d58-8a42-92766583b5a5	\N
4a23059b-8ec3-46e8-afd7-728abeec22a4	0	1	\N	\N	819443b6-c223-4bc4-a88a-3964c6b5126e	\N
4a5642f8-6b2a-49d7-b2f0-db54705aec90	0	2	\N	\N	360d5e47-9480-447a-bf08-77943d2db345	\N
4c94d3af-21f8-45b8-ae2f-ee31bef34f49	0	2	\N	\N	a4ff3dcd-373b-44a8-b07e-53b942eabac7	\N
4f679aa3-4ea2-465d-b79a-be522a2328ca	0	1	\N	\N	62f536e9-3ded-45e3-a546-7f9b8ca15a10	\N
5128071e-97b8-4929-8525-99ad1784de1d	0	3	\N	\N	58091ec8-fe51-4d56-b87a-4e1eab3347da	\N
52630709-2aef-413a-aed7-f081c4a86b14	0	1	\N	\N	e3c171f7-2a87-43f2-b037-7b758a449e91	\N
57027cb2-71ba-41cf-b98e-39b6f9ada689	0	3	\N	\N	50d9726e-d5fa-4e9e-a443-2b89bfdf77b3	\N
5b68c5d2-588b-48e3-b8cc-6140fc22883a	0	2	\N	\N	ebf40aca-200e-4694-813e-e7dba7d64453	\N
5b8ca809-5dda-48c0-9bcf-2efe5256caff	0	3	\N	\N	c1092c85-7499-4f8b-b2b3-3c1b81585ec6	\N
612a6714-3ab4-4c9d-abd5-25acdcfe2ca7	0	1	\N	\N	3a94f273-5af1-4e00-99b8-8d4cd9dd0510	\N
61aeba3a-0d06-439d-85f1-f333e4115398	0	1	\N	\N	69e2e8a0-176f-42d1-8403-12265fdbf0cf	\N
65582d75-7a7e-417a-9a8d-3b29f4208b7e	0	2	\N	\N	c755e330-d5ff-426b-a636-9e8bda952343	\N
666143d9-c7cb-4d41-bb22-b85c3a8461aa	0	1	\N	\N	3387d9ab-4e22-480c-a7b4-14738844f774	\N
66c2e1ae-5293-4f7c-b0e8-c2edccc8d471	0	3	\N	\N	bcfc378d-b28f-4e39-8b90-d3e936de08b5	\N
67db2950-90d6-48ae-b7d2-f3393009dbf3	0	2	\N	\N	9e2805b9-fa6f-46f0-b055-c4407d267b1f	\N
68a3b7fe-b114-4f3c-92f4-ad3ecfadc54b	0	3	\N	\N	c14172ae-a42b-44b1-9a19-36dd31d5569c	\N
69bb29b4-5e63-4f6a-841f-85f775f1cf60	0	3	\N	\N	1cd86f79-e4f4-4ca0-b917-b9f3aecc5ded	\N
69ecd830-9c29-4556-8608-9239ee664bfb	0	3	\N	\N	9e2805b9-fa6f-46f0-b055-c4407d267b1f	\N
6a87f160-d9cb-4ee1-a3a9-85f685c58a2f	0	2	\N	\N	c14172ae-a42b-44b1-9a19-36dd31d5569c	\N
6ebb9273-bf96-4d91-8cd7-3cf828607485	0	3	\N	\N	69e2e8a0-176f-42d1-8403-12265fdbf0cf	\N
70133490-191a-4839-9968-a674259fdabe	0	3	\N	\N	5ebe1ac0-a1b9-4766-bfc4-5fe9319dc157	\N
726e58f0-296e-4c2d-9daf-a6acd5857359	0	2	\N	\N	50d9726e-d5fa-4e9e-a443-2b89bfdf77b3	\N
72b3c7aa-4ff5-416e-a837-3f211a0f3583	0	3	\N	\N	22254378-6bb8-43f7-abb5-ad2c817bdc96	\N
75dfd89f-67da-445e-83da-b1219a2b7ccd	0	2	\N	\N	f81b2c81-db88-4724-a24f-0fcd5c1d27ed	\N
76fb75c4-95db-426d-b6ac-56e2aca5cf96	0	1	\N	\N	1cd86f79-e4f4-4ca0-b917-b9f3aecc5ded	\N
79c28a7d-def2-419f-b700-f26438aa3dd8	0	1	\N	\N	f75d3959-f65e-414a-9b8d-5d0063a60e2c	\N
7a2e6e30-1ead-4d7d-9da4-f6ba2adb42cf	0	1	\N	\N	56fd9f10-33bf-4f56-b7ce-080f4c6e1874	\N
7a50317d-bb12-4f57-a078-6dca41a0d071	0	2	\N	\N	ee54e286-efc8-43c9-8f49-3586e9380e35	\N
7a5b7b37-1524-4142-9fa4-732f218a7412	0	2	\N	\N	9031fc50-c2f9-48a3-ab70-8f637de8cc22	\N
7a5cba0f-3b9e-43af-887f-f47064da793a	0	2	\N	\N	f75d3959-f65e-414a-9b8d-5d0063a60e2c	\N
7ad8bc7f-1432-4a88-ace4-f105503cfbc1	0	1	\N	\N	58091ec8-fe51-4d56-b87a-4e1eab3347da	\N
7c184631-69e5-4482-bb4d-0691018da4ef	0	1	\N	\N	0e1e8141-fb78-4f91-b151-104efb4e5239	\N
805c40e1-42e0-4d59-ac15-f04ad5c3f80b	0	3	\N	\N	f81b2c81-db88-4724-a24f-0fcd5c1d27ed	\N
83dbea8c-4cfe-4282-9237-565dc21f7096	0	1	\N	\N	b4083213-4173-4394-b899-98dab06a1370	\N
83ecade9-6640-485d-be8f-1ab0378f37f5	0	1	\N	\N	8c25dd92-b051-45e2-95c3-c77b2a2d03d7	\N
860ca650-c8aa-4138-a87a-6b7257184f7f	0	1	\N	\N	c1092c85-7499-4f8b-b2b3-3c1b81585ec6	\N
87802ca1-c25e-4aae-94f7-581aa872391a	0	2	\N	\N	5fa0b1da-bc7e-4970-9537-3b53353bb43f	\N
8855540d-a664-4fa3-9e08-86e0746adaaf	0	2	\N	\N	2d640858-2c21-4204-bfde-551b0b703369	\N
8ac8803f-e84b-406e-9357-699b349ab4eb	0	2	\N	\N	58091ec8-fe51-4d56-b87a-4e1eab3347da	\N
8d696e81-7122-401d-aa78-0cf7e4c9e6ee	0	3	\N	\N	3c0e7323-c297-4170-b49c-d3506c9ef0fb	\N
8e1503a1-9761-46d0-a40c-585bd3c5970f	0	2	\N	\N	10041415-17cf-4d6a-b45d-d213ab7f7b07	\N
8e1f1e3a-70e2-4c6b-b09e-072546d1e4f1	0	3	\N	\N	a4ff3dcd-373b-44a8-b07e-53b942eabac7	\N
8f0fa922-8adb-4d56-8726-6d4f987d5776	0	3	\N	\N	10041415-17cf-4d6a-b45d-d213ab7f7b07	\N
94778135-eabe-413f-bf0e-86de381df1d2	0	2	\N	\N	e3c171f7-2a87-43f2-b037-7b758a449e91	\N
95e306f4-6d0d-44b9-9016-46a73a505cf5	0	1	\N	\N	5ebe1ac0-a1b9-4766-bfc4-5fe9319dc157	\N
97b53fa5-c233-4a37-a899-ecc60d97e431	0	3	\N	\N	ee54e286-efc8-43c9-8f49-3586e9380e35	\N
990a2956-101d-4a80-843a-9c630ea8dd72	0	1	\N	\N	6328720b-66cd-49e0-80fc-6ae2cc6bfa78	\N
9c0fa624-4127-43c9-8dbe-5e23e93ea90a	0	1	\N	\N	b3715c79-7022-4d75-b91d-e86c3e358543	\N
9ed579ab-7665-4297-8e29-db96fbfe059e	0	2	\N	\N	7ea52ca8-9f7b-4434-8212-cd67c42eb39d	\N
9faad39d-7255-43c6-9694-d7fa7993a316	0	1	\N	\N	ebf40aca-200e-4694-813e-e7dba7d64453	\N
aa86eed5-b904-4dbf-9f37-bcadc1e9a537	0	3	\N	\N	9031fc50-c2f9-48a3-ab70-8f637de8cc22	\N
ab11ca00-01fc-446d-b556-cafc68a02ff3	0	3	\N	\N	6328720b-66cd-49e0-80fc-6ae2cc6bfa78	\N
ac238cc7-b5b4-424f-b4ad-a2a99f641b84	0	2	\N	\N	6328720b-66cd-49e0-80fc-6ae2cc6bfa78	\N
af52c336-19f0-4865-9123-75fd6b2187be	0	1	\N	\N	2d640858-2c21-4204-bfde-551b0b703369	\N
b1478844-6fb2-405e-bfb5-f08e33774363	0	2	\N	\N	649a6ddc-253a-49c7-8e23-00cb1dfb441f	\N
b3a2ed5d-10c7-443d-b775-109768d77c09	0	2	\N	\N	3c0e7323-c297-4170-b49c-d3506c9ef0fb	\N
b44449b2-7cd6-4d2b-a227-9ae057e81f63	0	3	\N	\N	62f536e9-3ded-45e3-a546-7f9b8ca15a10	\N
b916076a-89c1-4da5-8eee-467599dc9bca	0	3	\N	\N	360d5e47-9480-447a-bf08-77943d2db345	\N
bceded76-96b9-4d28-a54c-37cfe5668ddf	0	1	\N	\N	ec37bace-6bf6-4cfc-b41e-af82fcb60b89	\N
be7d7d37-0de8-4ae5-a4d8-23d61b7e8633	0	2	\N	\N	3a94f273-5af1-4e00-99b8-8d4cd9dd0510	\N
bf319f93-3737-4871-8dec-66e38f701648	0	2	\N	\N	e5cfb444-d1d3-44ca-8e60-c0dfa9c48124	\N
c0e82934-2be3-4960-b281-01bf2ed19d3c	0	3	\N	\N	8c25dd92-b051-45e2-95c3-c77b2a2d03d7	\N
c29b991f-a42f-495d-a189-50c758023eee	0	3	\N	\N	3a94f273-5af1-4e00-99b8-8d4cd9dd0510	\N
c30a3cbd-d6d3-48ab-87d3-f2d0d5076f01	0	2	\N	\N	0e1e8141-fb78-4f91-b151-104efb4e5239	\N
c5bfb41b-0462-47d7-a52b-18a2f5f93ddf	0	3	\N	\N	0fdd6fb8-b019-417a-a469-42cc030e9eb1	\N
cb8c6b99-5710-43c2-a1c1-02484826f5c0	0	1	\N	\N	ee54e286-efc8-43c9-8f49-3586e9380e35	\N
cbadeac4-fd39-4da5-a50f-b8bba9510305	0	2	\N	\N	1cd86f79-e4f4-4ca0-b917-b9f3aecc5ded	\N
d13f21db-2c13-4707-a8ea-372eb6ec1749	0	3	\N	\N	649a6ddc-253a-49c7-8e23-00cb1dfb441f	\N
d25c8050-4747-4846-b1a2-ce3a3db48c6c	0	2	\N	\N	22254378-6bb8-43f7-abb5-ad2c817bdc96	\N
d3f1c41d-9ab3-4cda-9ead-bfe17f6a65ed	0	1	\N	\N	0fdd6fb8-b019-417a-a469-42cc030e9eb1	\N
d78bd4e3-40af-465d-b9db-6925d832dccc	0	2	\N	\N	0fdd6fb8-b019-417a-a469-42cc030e9eb1	\N
d7cb6704-d78c-4b34-b28f-80b79f12bf41	0	1	\N	\N	50d9726e-d5fa-4e9e-a443-2b89bfdf77b3	\N
d838a7b5-96fd-4c08-98ed-05aa19b5205b	0	1	\N	\N	23da0219-a63e-4c97-8f9c-04aad91daff3	\N
d93a3e42-8d31-463c-83b3-b0d4b986b6e0	0	3	\N	\N	b4083213-4173-4394-b899-98dab06a1370	\N
e651e3ec-013a-4169-b227-e966202ff30e	0	3	\N	\N	3387d9ab-4e22-480c-a7b4-14738844f774	\N
e802c499-11eb-4100-88ff-72a6d86bbf0e	0	3	\N	\N	c66a3113-8da9-4c88-ba63-a52d8c991299	\N
e81f5bf0-42ff-422a-96bf-a5d46b9ec927	0	1	\N	\N	e1575e9f-56f3-4281-a7a0-4ec6dd8f3a66	\N
e88cc16c-2fc5-43ec-8d84-7e16f8aaab88	0	1	\N	\N	9e2805b9-fa6f-46f0-b055-c4407d267b1f	\N
e8991e8d-ef39-4ea6-8761-eef29e01a3ac	0	1	\N	\N	7ea52ca8-9f7b-4434-8212-cd67c42eb39d	\N
e89e4c18-6c2a-4c64-a81e-1b70f09c6808	0	1	\N	\N	360d5e47-9480-447a-bf08-77943d2db345	\N
ea166204-d30f-439d-9846-ae7e3e459b38	0	3	\N	\N	e3c171f7-2a87-43f2-b037-7b758a449e91	\N
f047b9c2-7fbc-4aee-b008-699bbc09f4a7	0	3	\N	\N	f75d3959-f65e-414a-9b8d-5d0063a60e2c	\N
f838fb5a-ba02-42bc-bc2b-97194f047668	0	1	\N	\N	a4ff3dcd-373b-44a8-b07e-53b942eabac7	\N
f8ccbf28-9f79-49d6-b5a0-8e1410979177	0	3	\N	\N	5fa0b1da-bc7e-4970-9537-3b53353bb43f	\N
f913ef9a-849e-4cf0-9e82-c2eab8f650a3	0	1	\N	\N	c755e330-d5ff-426b-a636-9e8bda952343	\N
fa7118ba-6e39-44c3-a286-9340f5650070	0	3	\N	\N	819443b6-c223-4bc4-a88a-3964c6b5126e	\N
fb1f5886-fbb6-466c-ac0a-540aec9b37c3	0	3	\N	\N	56fd9f10-33bf-4f56-b7ce-080f4c6e1874	\N
fcb59552-9729-406c-90bc-03848f72485d	0	3	\N	\N	2d640858-2c21-4204-bfde-551b0b703369	\N
fd83a5e9-a752-4cd7-960b-74a5c8c89faa	0	1	\N	\N	c66a3113-8da9-4c88-ba63-a52d8c991299	\N
ff6d9fa1-d763-4378-b0b8-1be287b6604a	0	2	\N	\N	97d7ce2b-ab63-4d58-8a42-92766583b5a5	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
bfee629a-cb24-4947-8f39-dae8ada3ca38	Сборка, сварка рам к/с г/п 120-130 т.	6	df7d773c-8040-4c9f-8933-4e5996b3970b	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0c3eb013-3c01-4d52-b355-dbb4877c05ab	Усилитель	75131-2801114-01	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
1404cb55-4882-4fa0-9548-3e6e97305684	Поперечина	75131-2801325	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
166eb653-ec32-4ec7-9d54-342aa4677740	Опора	75131-2801188	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
1abcea86-6952-4316-bd41-a91007acf235	Лист верхний	75131-2801357-10	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
1ba712e7-a60c-4c18-9dae-18af3aa2b5e2	Накладка рамы поперечная передняя	75131-2801088-70	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
251772ad-1025-4f4d-9409-a28cc696166f	Лист верхний	75131-2801357-10	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
255ba618-f2b5-4cd7-8b44-259b7633a7b3	Накладка рамы поперечная передняя	75131-2801088-70	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
2b4ccec3-7fa9-485f-be72-5f32dfed9b0d	Усилитель	75131-2801114-01	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
2dba4230-cb0d-4461-8e44-87b933cdfabd	Поперечина	75131-2801103-10	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
3b82074d-619b-4a61-85e2-318b84934244	Рама	7513D-2800010-20	t	1	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	4536492774
3bc21e28-4e33-4f47-8076-cca55bf3f519	Накладка рамы поперечная передняя	75131-2801088-70	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
3ca96ba6-0c0b-4fd7-8358-853359b0feb7	Кронштейн задней опоры	75131-8521182-20	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
3f368fbc-1d93-4ba3-94a9-b89a3d398bf3	Лонжерон рамы левый	75131-2801017-70	t	2	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
428701c1-052a-4d2d-8b48-eb54094761c3	Поперечина	75131-2801325	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
47f4a950-a6df-4777-834a-562448c9d1c9	Поперечина №3 рамы с опорами	75132-2801152	t	2	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
4ebb639a-ff42-47a2-b165-9bc282445dc2	Лонжерон рамы левый	75131-2801015-41	t	2	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
570ab312-03b7-4af9-8cb1-a7113baf0fe3	Лист нижний	75131-2801358-10	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
5d4eb8e2-cb60-43f4-9354-e8938998d79f	Лонжерон рамы левый	75131-2801017-70	t	2	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
60efc74c-993a-4eb0-b19d-dc8597773385	Лонжерон рамы правый	75131-2801016-70	t	2	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
632d3a78-164d-47f1-8ba3-92e158ef9fd7	Опора	75131-2801188	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
69b806e2-546c-4787-b840-e5343d399b39	Кронштейн задней опоры	75131-8521183-20	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
6b877327-df67-4a20-b208-dde9f410a76b	Опора	75131-2801188	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
6e88d398-1875-4f7c-81bc-413978e43d37	Лонжерон рамы левый	75131-2801015-41	t	2	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
72125b71-d001-4322-8f1f-485a6bfe004d	Опора	75131-2801188	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
73a69d9c-adb9-46ac-8a79-a2734482cf1d	Кронштейн задней опоры	75131-8521183-20	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
7434edd9-95a1-4cb6-8dd1-423d7bc1ecd6	Опора	75131-2801188	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
8122a34f-c326-4b52-a3a7-38e51c5121db	Поперечина №3 рамы с опорами	75132-2801152	t	2	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
843ecdff-309c-4b7b-9ebb-35bc5f6b4224	Рама	75131-2800010-70	t	1	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	4536479362
86a29f8d-2ada-441c-aaa0-c2dd049debc2	Поперечина	75131-2801103-10	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
93e19aa0-5307-4a98-a56d-f6ac54e2f50c	Усилитель	75131-2801115-01	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
9952c613-0d7b-4d50-a6f0-eaa92ee04874	Лонжерон рамы правый	75131-2801016-70	t	2	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
b65df13e-1b3e-4055-8eb4-26dcc837d89b	Опора	75131-2801188	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
c04ebfd1-5e03-4866-b2ee-8811575d8bbf	Опора	75131-2801188	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
c3e90121-235b-49a8-94a2-3a787e3147b3	Накладка рамы поперечная передняя	75131-2801088-70	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
cb251d1d-af00-4a30-b540-aa5432b92f85	Лонжерон рамы правый	75131-2801014-41	t	2	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
d75a28ab-510c-491b-b177-1c110556b3ba	Поперечина рамы задняя	75131-2801300-20	t	2	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
e1adb52e-1d61-4da3-be01-83687a812c20	Опора	75131-2801188	t	3	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
e8023add-f6ee-4d7a-b036-642733b6ec72	Кронштейн задней опоры	75131-8521182-20	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
f8d1b3ea-feeb-42bf-8312-e98c9255848a	Поперечина рамы задняя	75131-2801300-20	t	2	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
f93cfd0a-84da-4ec0-8906-bc4d74266ea3	Усилитель	75131-2801115-01	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N	\N	\N
4c8347f2-7115-4bff-8997-f41264326c75	Лонжерон рамы правый	75131-2801014-41	t	2	7ac276ba-b23c-4f0f-8556-02af3ba0dc57	bfee629a-cb24-4947-8f39-dae8ada3ca38	ff98887c-cda0-4e2d-b5e6-be5412a72793	\N	\N	\N
adc58f26-98e2-4417-84fe-c98579e08438	Лист нижний	75131-2801358-10	t	3	e4d43c38-d4fc-464d-a931-04c96b91d8ef	bfee629a-cb24-4947-8f39-dae8ada3ca38	ff98887c-cda0-4e2d-b5e6-be5412a72793	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
38d9c059-158f-4859-b5da-e14714b97ee9	Admin	\N
e8ff5dc3-7e90-44e6-bc23-475b8a3e3b40	Master	\N
8d9647c1-6c8f-478b-ae45-e4f2ce404969	Welder	\N
9d2c1dfc-409a-413c-bd14-80fa331b11de	Inspector	\N
807251df-16a9-4d13-8730-1885f52ca3ff	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "IdFromSystem") FROM stdin;
0049b98e-b8c5-4c35-a413-726f12f7789d	2023-03-08 18:47:22.138364	b62a2f6a-89ba-4a89-91b2-ac93bf25d653	\N
033ed928-8326-4dc9-a084-71211317ddd8	2023-03-08 18:47:22.141568	bce9fb5b-1f1a-48ea-a8be-47a6f6140353	\N
0dd3b730-df25-43ea-8187-76d559e70b56	2023-03-08 18:47:22.139576	0c13c8e2-764d-4926-ac45-6085105c39b8	\N
0e387ac6-9b4d-4e78-8363-e001ab354b05	2023-03-08 18:47:22.142016	2ed4162f-5cd0-4f49-bd12-cbc82e899cca	\N
10eff463-4231-443b-9820-3ffa47ed6b03	2023-03-08 18:47:22.138984	0044033a-c3e3-4c76-8d79-b00feafff189	\N
142a614d-bb3c-4426-890d-57f502b75c61	2023-03-08 18:47:22.118912	220f0f86-32f6-47e8-ad1c-eff1d154d5e2	\N
1679d2f0-662f-422e-9808-356fb5088dfb	2023-03-08 18:47:22.139406	1876dff0-3446-4ce0-aeb3-6919bee799a5	\N
1e736be5-db3f-485b-834b-5c46f4549fb9	2023-03-08 18:47:22.141317	6fca95cb-ff76-4baa-a9a5-16011924746c	\N
22237528-31b8-4e19-a762-6967cdd6a06b	2023-03-08 18:47:22.138638	c698d8fb-d268-44fe-87cc-8c1b6803256e	\N
22bafc0e-9b09-480a-a092-694aa1b1f4e6	2023-03-08 18:47:22.14036	15e031cb-1c12-4556-be4c-87fee5077db3	\N
238df4e9-a8c4-4d1d-9f74-51301271242e	2023-03-08 18:47:22.141485	853bb210-0cf8-4947-a44a-211e05b613b5	\N
288584b9-7a98-4972-943f-ba4f0c53abc9	2023-03-08 18:47:22.142354	84ca8a1c-f792-4321-95c7-b0d55fb33727	\N
2f06c6bc-df3f-44ad-9b0b-13198dcece7f	2023-03-08 18:47:22.14227	483d14a2-5e92-4ef0-8b9c-e9f0f8144f50	\N
342081d5-1de8-47ec-85b6-a96cf2235f7b	2023-03-08 18:47:22.142607	01cc7559-d4ad-459c-ae30-2b21aad1bc1a	\N
3649e9bf-e02a-4759-a50d-02756ae42537	2023-03-08 18:47:22.141739	028f5d3c-3fe2-4d3d-9cee-2397235d0559	\N
367f7469-82aa-46e6-8ec7-73e7baa120a8	2023-03-08 18:47:22.138899	7e9a191d-8c24-48c1-b7fc-d9eb12250693	\N
4025215f-46e2-4ab4-94c2-5c89e95067af	2023-03-08 18:47:22.141651	78a5f8e5-65b8-4e31-beb1-c13d348012f9	\N
41f34f74-075e-41a9-a1a8-f2b2ea4373d6	2023-03-08 18:47:22.140675	47172852-6ac5-4d55-b272-02c4fd06a884	\N
44af7963-3385-45d8-b10e-db0c94b4ae4c	2023-03-08 18:47:22.138723	d2da4446-08d9-4623-851f-83e89f23a0b7	\N
46348e4e-825c-4d24-8a6d-a9b3b02fcd96	2023-03-08 18:47:22.139154	02b3b608-6f65-46c6-bbe3-1ae1bd2f087d	\N
4b5cff23-7546-4d41-857c-b730f970de59	2023-03-08 18:47:22.141402	94cc257a-fbee-430e-beb4-659ada32f33e	\N
5580899d-dc78-4bf7-ada4-db8c90784500	2023-03-08 18:47:22.140211	bd4bf786-4015-4d68-bbea-cd00858180ba	\N
57554ee5-f2c5-4fc2-a0e8-3fd73e55f60e	2023-03-08 18:47:22.13924	36c6d56e-efd2-4534-a4f4-e478c9387779	\N
5b8abf8b-bfad-44d7-87a0-fa5a3c598d0b	2023-03-08 18:47:22.138811	bb4e2919-bd71-4fca-b963-904b61cc4990	\N
5fa7749c-0244-4851-bab4-8a61f71c6ee2	2023-03-08 18:47:22.142186	217b0b4e-9de5-4d30-8456-534898a694e6	\N
696026ef-fa57-4bc2-bc74-ff093fc7b2ab	2023-03-08 18:47:22.141234	b03a4194-c29b-4717-83bd-6d8d144d5a45	\N
707cbc11-7d3e-49e9-a3c0-fc001a2ada81	2023-03-08 18:47:22.141151	9aa9b60a-516b-46e4-a890-9b54b6ec1164	\N
77e268c1-c9fd-407b-81d3-1a4b33770495	2023-03-08 18:47:22.141847	ce2ebcc3-6dff-4105-a18e-f7ac68599494	\N
788a33ec-4361-4a8a-a3c7-d91756d4bf44	2023-03-08 18:47:22.138276	5b9563a0-b543-4d99-a302-219365cb37a7	\N
7935c762-cfa7-46f5-86ba-d524e4f51116	2023-03-08 18:47:22.139491	5cd5a25e-925e-44a7-926f-a594153c2ad2	\N
80de9a43-32be-49c2-90fe-4c11a757f220	2023-03-08 18:47:22.139658	bcbb04d9-a516-44e7-8e75-77f9f3229942	\N
8166f458-8c20-4d97-b9db-d6515a36ac95	2023-03-08 18:47:22.142862	f0116d5c-6b30-4347-8b72-757cc9756170	\N
868ecaea-acb4-4579-8d35-2a196cdc327b	2023-03-08 18:47:22.14244	78c59aec-75f4-41c1-8bd0-dfd7cefb4737	\N
87dee4d2-1edc-425e-89dd-979b35498656	2023-03-08 18:47:22.138535	5583c8a9-83e7-478a-b05b-af6c9f027d23	\N
8cd31d92-3e99-4827-bad9-d8438fea1448	2023-03-08 18:47:22.142102	68bb7f1a-4251-449f-bf71-2c1059b99a75	\N
9078f988-7e84-46ac-b499-f7a897c5aa0b	2023-03-08 18:47:22.140515	c57b9bdf-bcd2-4f08-9aa5-097f60accae1	\N
96b3b92c-ebea-44b4-967c-950a23348529	2023-03-08 18:47:22.14269	1ea2e029-806d-4875-9b35-ca7392fc22f3	\N
97189037-ac2f-4ac2-a5a7-00248baa27da	2023-03-08 18:47:22.141067	a0b93ea2-0afc-484a-a77f-fe4d7d292815	\N
99732c9b-a0e8-404d-a910-3044447b2c18	2023-03-08 18:47:22.138184	abdbbb6c-5c3e-4963-8b42-a9165b84dbce	\N
acc30b36-87e4-4383-a084-b36c10de0f1d	2023-03-08 18:47:22.139069	da771aa6-f590-44ae-b76a-c1cbae497baf	\N
c50decbf-2379-40fd-a133-c9778b394b7c	2023-03-08 18:47:22.141933	280c18dd-78fa-493d-82ef-61fead4d299a	\N
c995cc60-3da0-44a8-bebd-2156e398b05c	2023-03-08 18:47:22.140772	3ba29e71-38fe-4a43-ae56-6fadaaf01247	\N
d0bd8c4c-1f36-41f9-bdcd-7a012fc079c3	2023-03-08 18:47:22.142524	79ef2576-a93f-476d-940f-5c3a675f161f	\N
d356973d-8677-492c-9d05-a13fc131b3da	2023-03-08 18:47:22.14003	3958e53c-7719-4faf-8b39-f7d530d913b5	\N
d8596972-1e91-4af2-8202-d46d72a78afe	2023-03-08 18:47:22.138451	a6f50d66-4e08-4deb-9cea-3f284d0fcb45	\N
e1545375-54cc-4163-9637-2a707c83e5ca	2023-03-08 18:47:22.139833	b6b660c3-76ca-47bb-8858-d2259c1a76e8	\N
e6170cd4-3616-499e-b536-f34cc1642507	2023-03-08 18:47:22.139742	51a1434c-d37b-45d9-a63a-c667f0913c5e	\N
ec7fbb01-e284-4802-b46b-a1f54f5607f9	2023-03-08 18:47:22.137986	b960eabc-b936-4852-8adc-41309c7d4028	\N
f257d1f2-948b-416c-bd43-9177c37ef797	2023-03-08 18:47:22.138096	4d32a103-ff49-445d-a929-c8ac0fa561d5	\N
f80f8362-4d0b-49b2-8497-4c0bff47ae79	2023-03-08 18:47:22.139323	751ee791-2bbe-4198-93cf-6845a30a3170	\N
f8cd7a66-835e-4077-b30d-023857ddf50d	2023-03-08 18:47:22.142779	8ed97572-7e5c-4f88-8321-3b1df359a27b	\N
fb69c366-2ef4-40ad-b20c-fdd6ab1ae2e1	2023-03-08 18:47:22.140906	3c81768a-8335-45ea-9210-491fb211840d	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0123a3eb-ec20-4d88-a049-b96c0e0a44f0	0	3	\N	\N	0e387ac6-9b4d-4e78-8363-e001ab354b05	\N
0229a50c-80fb-4989-8453-d7f6b830fba2	0	3	\N	\N	4b5cff23-7546-4d41-857c-b730f970de59	\N
03d094a1-142d-4124-9c9c-284c26f78f40	0	3	\N	\N	d0bd8c4c-1f36-41f9-bdcd-7a012fc079c3	\N
0572fa46-1436-492d-aa39-c3c0885a6a3c	0	3	\N	\N	80de9a43-32be-49c2-90fe-4c11a757f220	\N
061e1a6a-95b2-437d-a43b-0fe266a4428b	0	2	\N	\N	f80f8362-4d0b-49b2-8497-4c0bff47ae79	\N
0c50354c-f260-4309-b14d-7f7b5df86909	0	3	\N	\N	868ecaea-acb4-4579-8d35-2a196cdc327b	\N
0cbf3150-336e-4fce-a9a3-845e71da96cd	0	1	\N	\N	1679d2f0-662f-422e-9808-356fb5088dfb	\N
0f42326d-02a6-44b2-a138-6b090635e457	0	3	\N	\N	1e736be5-db3f-485b-834b-5c46f4549fb9	\N
102b6597-0894-42c2-bf71-9b5196f4ff5a	0	1	\N	\N	acc30b36-87e4-4383-a084-b36c10de0f1d	\N
10ba001f-327b-4d3e-b9f7-21adfdcf4e2b	0	2	\N	\N	44af7963-3385-45d8-b10e-db0c94b4ae4c	\N
13011124-b9c5-420c-a8bc-cb24ddcb5355	0	3	\N	\N	2f06c6bc-df3f-44ad-9b0b-13198dcece7f	\N
1436ebf9-9ed5-43af-9abc-9b8d221287e8	0	1	\N	\N	0e387ac6-9b4d-4e78-8363-e001ab354b05	\N
147c6369-c0ea-445c-9b27-e2d69dcea3b9	0	3	\N	\N	707cbc11-7d3e-49e9-a3c0-fc001a2ada81	\N
16178ae1-4475-4df8-b6af-a1981c23903a	0	1	\N	\N	ec7fbb01-e284-4802-b46b-a1f54f5607f9	\N
176ab867-fc01-49b2-b77e-36e3bc25cca7	0	1	\N	\N	e1545375-54cc-4163-9637-2a707c83e5ca	\N
184c4aba-7012-47c8-98ab-11e8fe8c810c	0	1	\N	\N	342081d5-1de8-47ec-85b6-a96cf2235f7b	\N
1a19b045-6ef4-4565-8c50-98eea7b6f81f	0	2	\N	\N	0dd3b730-df25-43ea-8187-76d559e70b56	\N
1ae4a2c2-436b-42c7-b29b-28a3fe5e5710	0	1	\N	\N	f257d1f2-948b-416c-bd43-9177c37ef797	\N
1b68052c-9ee9-41dd-9cac-8ee3fd738e6c	0	2	\N	\N	f8cd7a66-835e-4077-b30d-023857ddf50d	\N
1be7606d-408c-4851-b9f1-a5b5c5f0d3ba	0	2	\N	\N	41f34f74-075e-41a9-a1a8-f2b2ea4373d6	\N
1c0273b8-4351-4219-b16f-f02ca0a4941d	0	2	\N	\N	033ed928-8326-4dc9-a084-71211317ddd8	\N
1c30bee2-0021-42bf-a3f1-bd49d6d378e1	0	2	\N	\N	707cbc11-7d3e-49e9-a3c0-fc001a2ada81	\N
1c9edcb4-ea25-4d9a-84e1-8fde7b9981d3	0	2	\N	\N	2f06c6bc-df3f-44ad-9b0b-13198dcece7f	\N
1d66e688-d95d-4aba-a898-4e332042b7cb	0	3	\N	\N	f257d1f2-948b-416c-bd43-9177c37ef797	\N
1dad3161-f55d-403c-b318-3c8ce9f474c2	0	1	\N	\N	f8cd7a66-835e-4077-b30d-023857ddf50d	\N
25bc4f8e-6a7e-41f7-812d-f4bc9adf38c4	0	3	\N	\N	77e268c1-c9fd-407b-81d3-1a4b33770495	\N
27087a24-5d4e-4d96-9b69-3a31b97f5149	0	1	\N	\N	5b8abf8b-bfad-44d7-87a0-fa5a3c598d0b	\N
2769b661-a0ca-4129-bd75-8183489974e7	0	2	\N	\N	4025215f-46e2-4ab4-94c2-5c89e95067af	\N
2895173a-7037-4d81-95c2-b041df8caf08	0	2	\N	\N	0049b98e-b8c5-4c35-a413-726f12f7789d	\N
2a538b66-9458-489c-b70d-fdfa7e662a3c	0	1	\N	\N	788a33ec-4361-4a8a-a3c7-d91756d4bf44	\N
2b63094e-a76b-46c8-abb3-b55f7a1b4208	0	2	\N	\N	fb69c366-2ef4-40ad-b20c-fdd6ab1ae2e1	\N
2f14c2ba-5f4a-4e50-9a85-84d542601267	0	3	\N	\N	8cd31d92-3e99-4827-bad9-d8438fea1448	\N
2f59d6e4-bd5a-441a-a9d0-ee8975b1bcd6	0	3	\N	\N	5fa7749c-0244-4851-bab4-8a61f71c6ee2	\N
3307c5d5-d918-4e93-9c80-c4800c0883ae	0	1	\N	\N	41f34f74-075e-41a9-a1a8-f2b2ea4373d6	\N
34c282c0-dcc4-415c-8d0b-38c89c02a61f	0	2	\N	\N	46348e4e-825c-4d24-8a6d-a9b3b02fcd96	\N
383cd03a-68e1-4b58-a93b-b53b00bddf93	0	2	\N	\N	288584b9-7a98-4972-943f-ba4f0c53abc9	\N
38f99f24-e944-451e-bca3-cad5f528f20f	0	1	\N	\N	5580899d-dc78-4bf7-ada4-db8c90784500	\N
3a260910-d0c3-4eb6-93e2-8c1519c84177	0	1	\N	\N	868ecaea-acb4-4579-8d35-2a196cdc327b	\N
3ef752cd-7787-4b2b-b121-650912cbf076	0	1	\N	\N	4025215f-46e2-4ab4-94c2-5c89e95067af	\N
48ea8d93-d691-49bb-b600-270fcac05866	0	2	\N	\N	99732c9b-a0e8-404d-a910-3044447b2c18	\N
4ad68810-2006-4057-a13b-7ba32c65f33f	0	1	\N	\N	0049b98e-b8c5-4c35-a413-726f12f7789d	\N
4e0aaaf0-872b-4a3e-993f-5def5d4508be	0	3	\N	\N	10eff463-4231-443b-9820-3ffa47ed6b03	\N
4e917c85-1f1c-4160-9440-093ee8cb9129	0	3	\N	\N	142a614d-bb3c-4426-890d-57f502b75c61	\N
4f0cc415-7b6c-4f72-8529-1fd778807841	0	2	\N	\N	acc30b36-87e4-4383-a084-b36c10de0f1d	\N
4f9088c2-6f92-4cd3-84db-646852d8a48d	0	3	\N	\N	fb69c366-2ef4-40ad-b20c-fdd6ab1ae2e1	\N
51ae1dc2-6592-42cd-809e-1efa0b48da08	0	2	\N	\N	5fa7749c-0244-4851-bab4-8a61f71c6ee2	\N
52d6398a-ac44-4109-86e2-6decb4b79dea	0	1	\N	\N	4b5cff23-7546-4d41-857c-b730f970de59	\N
544b1f52-f3a5-4070-919f-8bfd09ab0a2d	0	2	\N	\N	97189037-ac2f-4ac2-a5a7-00248baa27da	\N
546e086a-b8dd-44d9-9db5-135f0230f2ce	0	2	\N	\N	367f7469-82aa-46e6-8ec7-73e7baa120a8	\N
54741718-1e43-4655-997e-bb58eaf05614	0	1	\N	\N	fb69c366-2ef4-40ad-b20c-fdd6ab1ae2e1	\N
55758eb0-1dff-46e5-b8c9-78dba5d37ac0	0	2	\N	\N	77e268c1-c9fd-407b-81d3-1a4b33770495	\N
557d51a0-bc60-4f9b-8bf4-95c2fbe50d5b	0	2	\N	\N	5b8abf8b-bfad-44d7-87a0-fa5a3c598d0b	\N
59629546-5acc-44ce-8a7e-5b2652111c38	0	2	\N	\N	1e736be5-db3f-485b-834b-5c46f4549fb9	\N
5b2db9e2-85d9-4ea9-ba26-0eb5c84171e1	0	1	\N	\N	e6170cd4-3616-499e-b536-f34cc1642507	\N
5d05be9b-6c30-4f5d-a29e-c662b369df9d	0	2	\N	\N	3649e9bf-e02a-4759-a50d-02756ae42537	\N
5ef0d5fd-60c4-4cc6-b256-4142eb41f948	0	1	\N	\N	10eff463-4231-443b-9820-3ffa47ed6b03	\N
613bb1d9-0655-4ccb-9f18-6bf5ff599ef2	0	3	\N	\N	87dee4d2-1edc-425e-89dd-979b35498656	\N
61d4f9c5-c4c0-4ace-b0dd-a29a2f753dab	0	1	\N	\N	8cd31d92-3e99-4827-bad9-d8438fea1448	\N
61f548ae-8ab5-4083-ba29-a7dd491aeab3	0	3	\N	\N	788a33ec-4361-4a8a-a3c7-d91756d4bf44	\N
62052ba9-6d7b-44d8-8b0b-2dee5bbc74e4	0	3	\N	\N	5b8abf8b-bfad-44d7-87a0-fa5a3c598d0b	\N
67ef889f-0f06-4f0a-a46f-5bbaebd15753	0	1	\N	\N	2f06c6bc-df3f-44ad-9b0b-13198dcece7f	\N
68a3af3a-a463-4efb-b1eb-b41b64f28269	0	1	\N	\N	97189037-ac2f-4ac2-a5a7-00248baa27da	\N
698df722-d085-4938-b326-00bbc183b4b9	0	3	\N	\N	c995cc60-3da0-44a8-bebd-2156e398b05c	\N
69bb431d-8a8e-417a-8bcf-6170751ab78e	0	1	\N	\N	d356973d-8677-492c-9d05-a13fc131b3da	\N
6d0fdff0-b9a6-4d69-9e45-1a98219b1c62	0	2	\N	\N	238df4e9-a8c4-4d1d-9f74-51301271242e	\N
6d886555-90c3-42a4-ad73-13019c9008d7	0	2	\N	\N	7935c762-cfa7-46f5-86ba-d524e4f51116	\N
6e126779-0abe-452a-a4fb-e25a4ad37f68	0	2	\N	\N	22237528-31b8-4e19-a762-6967cdd6a06b	\N
721543a7-1e22-4ddf-8d49-1a16a5f8c2be	0	3	\N	\N	367f7469-82aa-46e6-8ec7-73e7baa120a8	\N
76f0c760-3f9e-4216-8974-ca20eebf50da	0	1	\N	\N	9078f988-7e84-46ac-b499-f7a897c5aa0b	\N
77b9b542-5bf3-458d-9809-db5a3fbd0109	0	3	\N	\N	f80f8362-4d0b-49b2-8497-4c0bff47ae79	\N
79f6132a-4449-431b-8916-3cc33bf9a2ff	0	1	\N	\N	99732c9b-a0e8-404d-a910-3044447b2c18	\N
7c7021d5-c01e-4323-b7d0-d53c4c8af95b	0	3	\N	\N	4025215f-46e2-4ab4-94c2-5c89e95067af	\N
7ed78212-6f40-4a71-809c-765675f4bbe1	0	2	\N	\N	9078f988-7e84-46ac-b499-f7a897c5aa0b	\N
7fab13ee-e4d9-4fe1-ad5a-504292d93c82	0	1	\N	\N	288584b9-7a98-4972-943f-ba4f0c53abc9	\N
8148e7ac-9619-4ae8-90e8-26d7f11b90a5	0	3	\N	\N	3649e9bf-e02a-4759-a50d-02756ae42537	\N
82971604-79e6-4a51-a58d-56b3525a9682	0	3	\N	\N	44af7963-3385-45d8-b10e-db0c94b4ae4c	\N
8572a505-c864-4b44-b418-99918931a59a	0	1	\N	\N	142a614d-bb3c-4426-890d-57f502b75c61	\N
88136f90-0e76-4254-804b-33fed4b2038b	0	3	\N	\N	96b3b92c-ebea-44b4-967c-950a23348529	\N
892fa4e8-5980-4f5a-b7c9-526e8a5a2773	0	1	\N	\N	22bafc0e-9b09-480a-a092-694aa1b1f4e6	\N
89769dfc-00e5-4849-9b39-403568bd2c89	0	3	\N	\N	e1545375-54cc-4163-9637-2a707c83e5ca	\N
89e03d16-6cb5-44e3-bfc6-5825a26c40d6	0	1	\N	\N	c50decbf-2379-40fd-a133-c9778b394b7c	\N
8a293b16-d4f2-4d7c-8e69-3ef952a198a0	0	2	\N	\N	8cd31d92-3e99-4827-bad9-d8438fea1448	\N
8a6d1ee9-7378-4e27-b3ac-0eabe31a7864	0	3	\N	\N	97189037-ac2f-4ac2-a5a7-00248baa27da	\N
8c6f5485-e4cc-405b-8ca4-f9b9cdd77abe	0	1	\N	\N	7935c762-cfa7-46f5-86ba-d524e4f51116	\N
8e1d7794-02d4-43df-a451-62ac3dfe3991	0	3	\N	\N	d356973d-8677-492c-9d05-a13fc131b3da	\N
8f75ee7a-3971-48d5-8992-e42de33ac6e0	0	2	\N	\N	142a614d-bb3c-4426-890d-57f502b75c61	\N
90797b33-7b72-4aef-baca-f8ebaa7a2ca3	0	2	\N	\N	d8596972-1e91-4af2-8202-d46d72a78afe	\N
90e2b1b3-cdbd-4853-b6a1-9044c321fe45	0	1	\N	\N	367f7469-82aa-46e6-8ec7-73e7baa120a8	\N
94975b87-e89c-4145-b7cb-ae86c47e50a4	0	2	\N	\N	ec7fbb01-e284-4802-b46b-a1f54f5607f9	\N
975482bd-8641-469d-b7f4-75786cc727a7	0	2	\N	\N	5580899d-dc78-4bf7-ada4-db8c90784500	\N
986d4309-748f-4e34-9120-304e3dbb1ac0	0	3	\N	\N	22237528-31b8-4e19-a762-6967cdd6a06b	\N
99dd2ac7-7a1a-4050-8010-b0484467cc07	0	3	\N	\N	c50decbf-2379-40fd-a133-c9778b394b7c	\N
9ad71059-d50b-453a-9abf-6991a699135a	0	3	\N	\N	acc30b36-87e4-4383-a084-b36c10de0f1d	\N
9b7727e0-a844-4403-ac8b-6d89b902045e	0	3	\N	\N	46348e4e-825c-4d24-8a6d-a9b3b02fcd96	\N
9cb69a87-9d68-485f-a9d6-f483a9125e23	0	3	\N	\N	f8cd7a66-835e-4077-b30d-023857ddf50d	\N
9e55a885-7225-4636-b807-611cb3c632ce	0	2	\N	\N	788a33ec-4361-4a8a-a3c7-d91756d4bf44	\N
9eb1fd64-fcbc-4be3-92e1-c46e6424b83b	0	1	\N	\N	696026ef-fa57-4bc2-bc74-ff093fc7b2ab	\N
9ee52d5e-743d-4985-b040-5817c0322185	0	1	\N	\N	0dd3b730-df25-43ea-8187-76d559e70b56	\N
a0018ac0-9ced-4249-8e5b-348ffc3604a8	0	3	\N	\N	9078f988-7e84-46ac-b499-f7a897c5aa0b	\N
a0adbaaa-9583-4b5d-a074-5b5e06abef62	0	3	\N	\N	288584b9-7a98-4972-943f-ba4f0c53abc9	\N
a120cb67-3c5d-4172-9245-e48b887740a4	0	3	\N	\N	0049b98e-b8c5-4c35-a413-726f12f7789d	\N
a29e7022-6ebc-4bf5-92e9-2d97f3a0fed1	0	3	\N	\N	e6170cd4-3616-499e-b536-f34cc1642507	\N
a451bf10-a953-4097-8b79-79793e567367	0	1	\N	\N	44af7963-3385-45d8-b10e-db0c94b4ae4c	\N
a4e410a2-e386-460a-b77a-48824ac39e16	0	1	\N	\N	96b3b92c-ebea-44b4-967c-950a23348529	\N
a4eefadd-b3fc-497e-8248-b82803e08bed	0	1	\N	\N	46348e4e-825c-4d24-8a6d-a9b3b02fcd96	\N
a5524f95-5185-4f1a-a7e0-91e242374f5e	0	2	\N	\N	57554ee5-f2c5-4fc2-a0e8-3fd73e55f60e	\N
aa001669-b5a3-43c3-acea-641210576be2	0	1	\N	\N	238df4e9-a8c4-4d1d-9f74-51301271242e	\N
abd95d51-e203-4b30-8131-7183f810d028	0	1	\N	\N	8166f458-8c20-4d97-b9db-d6515a36ac95	\N
ad61d519-4cac-48e3-becc-0491d12b0e7c	0	2	\N	\N	e6170cd4-3616-499e-b536-f34cc1642507	\N
ade5e719-ef63-4002-9d6c-aec31fe2764f	0	3	\N	\N	238df4e9-a8c4-4d1d-9f74-51301271242e	\N
af694f52-8cbb-403b-a02b-83377f401b07	0	2	\N	\N	4b5cff23-7546-4d41-857c-b730f970de59	\N
b025f7fc-9494-4ab4-a48c-efbeffb5f9ca	0	3	\N	\N	57554ee5-f2c5-4fc2-a0e8-3fd73e55f60e	\N
b119696e-df7d-49bc-a705-93355e865c01	0	1	\N	\N	033ed928-8326-4dc9-a084-71211317ddd8	\N
b43aa002-13e3-4b1d-8a29-a399b8296273	0	3	\N	\N	22bafc0e-9b09-480a-a092-694aa1b1f4e6	\N
bb4fa530-bc50-4fde-aeea-4441d413e73d	0	1	\N	\N	5fa7749c-0244-4851-bab4-8a61f71c6ee2	\N
bfd304aa-db5a-40ce-8232-215d8ddf7120	0	1	\N	\N	3649e9bf-e02a-4759-a50d-02756ae42537	\N
c294dddb-2962-498a-af04-6e4f6c403293	0	3	\N	\N	8166f458-8c20-4d97-b9db-d6515a36ac95	\N
c492c0cd-af15-42e5-89b3-cf52049ffdea	0	2	\N	\N	d356973d-8677-492c-9d05-a13fc131b3da	\N
c536ba3f-304b-4e43-b150-d54efedd38c3	0	2	\N	\N	c995cc60-3da0-44a8-bebd-2156e398b05c	\N
c54e1257-b1d4-47dd-9da8-4fb90fb4ed7b	0	3	\N	\N	5580899d-dc78-4bf7-ada4-db8c90784500	\N
c6673898-8220-4e00-a67a-bf66152845a7	0	2	\N	\N	80de9a43-32be-49c2-90fe-4c11a757f220	\N
ca2f097d-0b34-44eb-8d3f-b304b3b6b55c	0	3	\N	\N	d8596972-1e91-4af2-8202-d46d72a78afe	\N
ca4ffcbd-0a93-4ae4-b234-dfb843c96568	0	2	\N	\N	10eff463-4231-443b-9820-3ffa47ed6b03	\N
cc141279-945b-4255-83bb-5ee1472c9b71	0	2	\N	\N	87dee4d2-1edc-425e-89dd-979b35498656	\N
ccbba1dd-addb-4728-9596-cfd85f48ec33	0	3	\N	\N	696026ef-fa57-4bc2-bc74-ff093fc7b2ab	\N
ceea1dd2-db2d-4a97-9b69-3b89d49f4917	0	2	\N	\N	22bafc0e-9b09-480a-a092-694aa1b1f4e6	\N
cf61b287-ac9a-4d25-bffc-c21651594813	0	1	\N	\N	d0bd8c4c-1f36-41f9-bdcd-7a012fc079c3	\N
d2bc8b4e-86e8-4613-8b1b-4ab9c239c27d	0	3	\N	\N	342081d5-1de8-47ec-85b6-a96cf2235f7b	\N
d7473471-1673-4def-bb66-bd744895a583	0	1	\N	\N	87dee4d2-1edc-425e-89dd-979b35498656	\N
d79876d3-47bf-462e-9083-534a6404a84b	0	3	\N	\N	ec7fbb01-e284-4802-b46b-a1f54f5607f9	\N
d7f00c9d-67bb-4b90-8407-2b7a179b4ffb	0	3	\N	\N	99732c9b-a0e8-404d-a910-3044447b2c18	\N
db2ee3b7-1559-48b6-84d2-7ccbc632a437	0	3	\N	\N	0dd3b730-df25-43ea-8187-76d559e70b56	\N
db7d1e09-6e7e-409e-94cd-4ebdf74de2fc	0	2	\N	\N	342081d5-1de8-47ec-85b6-a96cf2235f7b	\N
df8fa4ce-33ce-4cbc-90a1-830c176e8672	0	1	\N	\N	f80f8362-4d0b-49b2-8497-4c0bff47ae79	\N
e0adf05f-7c18-4d90-9b3d-7e96b8c4cc34	0	1	\N	\N	d8596972-1e91-4af2-8202-d46d72a78afe	\N
e118408c-273a-4081-bc2a-b9b8e10122cf	0	1	\N	\N	707cbc11-7d3e-49e9-a3c0-fc001a2ada81	\N
e22e5261-c8ac-4ef8-8a4e-7cb382add862	0	3	\N	\N	1679d2f0-662f-422e-9808-356fb5088dfb	\N
e40ba8ba-35be-4417-b934-a2bd8ce8a182	0	2	\N	\N	868ecaea-acb4-4579-8d35-2a196cdc327b	\N
e7ece210-7c82-4bea-8975-a46a9d602595	0	2	\N	\N	696026ef-fa57-4bc2-bc74-ff093fc7b2ab	\N
e9ec5057-e90e-4e41-bcfd-a201ce229a17	0	2	\N	\N	0e387ac6-9b4d-4e78-8363-e001ab354b05	\N
ea3dea76-655f-4531-955c-bd80a505cb7e	0	3	\N	\N	7935c762-cfa7-46f5-86ba-d524e4f51116	\N
ea66532c-f83f-45b3-9de7-8efcd97f5fd8	0	1	\N	\N	80de9a43-32be-49c2-90fe-4c11a757f220	\N
ec2a7844-c5ee-43f7-95cc-153678dbdaeb	0	2	\N	\N	c50decbf-2379-40fd-a133-c9778b394b7c	\N
ed52b86b-f8ce-4096-b800-3e27a1b3a0ab	0	1	\N	\N	57554ee5-f2c5-4fc2-a0e8-3fd73e55f60e	\N
ed84b872-b983-40c0-9387-f3a23213946f	0	1	\N	\N	1e736be5-db3f-485b-834b-5c46f4549fb9	\N
ee6822a8-3100-4130-8d56-f85fcf9f2bdc	0	2	\N	\N	f257d1f2-948b-416c-bd43-9177c37ef797	\N
ef403019-6bfb-4c2e-9b33-48bb2a18ed1a	0	2	\N	\N	e1545375-54cc-4163-9637-2a707c83e5ca	\N
f0840b68-8298-4b7f-91cf-b08f3d759fc9	0	1	\N	\N	77e268c1-c9fd-407b-81d3-1a4b33770495	\N
f17c44de-bb75-4e1c-aede-e11d0008b928	0	2	\N	\N	96b3b92c-ebea-44b4-967c-950a23348529	\N
f33b6605-40a6-4bc0-bde7-1bb3b5c3629e	0	2	\N	\N	1679d2f0-662f-422e-9808-356fb5088dfb	\N
f695566d-4fc5-44de-ac28-bdd825c882df	0	2	\N	\N	d0bd8c4c-1f36-41f9-bdcd-7a012fc079c3	\N
f96f88e8-5708-4529-b517-0e0576993aa4	0	1	\N	\N	22237528-31b8-4e19-a762-6967cdd6a06b	\N
f9dbb678-8f4c-4980-be60-4728e6c11242	0	1	\N	\N	c995cc60-3da0-44a8-bebd-2156e398b05c	\N
fad4e438-d3ce-4487-9878-ee4c26033fd9	0	3	\N	\N	033ed928-8326-4dc9-a084-71211317ddd8	\N
fc8c9fbf-bfb5-492f-b9ca-366cb1dc9678	0	2	\N	\N	8166f458-8c20-4d97-b9db-d6515a36ac95	\N
fe2ab746-53db-455d-bbe0-6006c20df90a	0	3	\N	\N	41f34f74-075e-41a9-a1a8-f2b2ea4373d6	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0044033a-c3e3-4c76-8d79-b00feafff189	52	1200	t	f	2dba4230-cb0d-4461-8e44-87b933cdfabd	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
01cc7559-d4ad-459c-ae30-2b21aad1bc1a	58	900	t	f	e1adb52e-1d61-4da3-be01-83687a812c20	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
028f5d3c-3fe2-4d3d-9cee-2397235d0559	48	1900	t	f	adc58f26-98e2-4417-84fe-c98579e08438	63a60da7-c974-4e88-80d5-673693e417e2	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
02b3b608-6f65-46c6-bbe3-1ae1bd2f087d	2	1880	t	f	3ca96ba6-0c0b-4fd7-8358-853359b0feb7	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
0c13c8e2-764d-4926-ac45-6085105c39b8	18	4000	t	f	4c8347f2-7115-4bff-8997-f41264326c75	4902bf20-5252-4acc-969b-049d3a220b82	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
15e031cb-1c12-4556-be4c-87fee5077db3	2	1880	t	f	69b806e2-546c-4787-b840-e5343d399b39	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
1876dff0-3446-4ce0-aeb3-6919bee799a5	18	4000	t	f	47f4a950-a6df-4777-834a-562448c9d1c9	4902bf20-5252-4acc-969b-049d3a220b82	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
1ea2e029-806d-4875-9b35-ca7392fc22f3	2	1880	t	f	e8023add-f6ee-4d7a-b036-642733b6ec72	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
217b0b4e-9de5-4d30-8456-534898a694e6	39	280	t	f	c3e90121-235b-49a8-94a2-3a787e3147b3	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
220f0f86-32f6-47e8-ad1c-eff1d154d5e2	52	1200	t	f	0c3eb013-3c01-4d52-b355-dbb4877c05ab	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
280c18dd-78fa-493d-82ef-61fead4d299a	58	900	t	f	b65df13e-1b3e-4055-8eb4-26dcc837d89b	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
2ed4162f-5cd0-4f49-bd12-cbc82e899cca	55	400	t	f	c04ebfd1-5e03-4866-b2ee-8811575d8bbf	11329e39-dd0b-430e-ad90-b11ecf7bc460	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
36c6d56e-efd2-4534-a4f4-e478c9387779	1	1900	t	f	428701c1-052a-4d2d-8b48-eb54094761c3	b82ba3d5-cf0c-4ddb-9cd0-8fb39ab74cc1	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
3958e53c-7719-4faf-8b39-f7d530d913b5	54	400	t	f	632d3a78-164d-47f1-8ba3-92e158ef9fd7	20a6bf99-1394-4a78-9134-832e34f531dd	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
3ba29e71-38fe-4a43-ae56-6fadaaf01247	39	280	t	f	6e88d398-1875-4f7c-81bc-413978e43d37	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
3c81768a-8335-45ea-9210-491fb211840d	18	4000	t	f	6e88d398-1875-4f7c-81bc-413978e43d37	4902bf20-5252-4acc-969b-049d3a220b82	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
47172852-6ac5-4d55-b272-02c4fd06a884	58	900	t	f	6b877327-df67-4a20-b208-dde9f410a76b	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
483d14a2-5e92-4ef0-8b9c-e9f0f8144f50	39	280	t	f	cb251d1d-af00-4a30-b540-aa5432b92f85	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
4d32a103-ff49-445d-a929-c8ac0fa561d5	2	1880	t	f	1404cb55-4882-4fa0-9548-3e6e97305684	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
51a1434c-d37b-45d9-a63a-c667f0913c5e	18	4000	t	f	4ebb639a-ff42-47a2-b165-9bc282445dc2	4902bf20-5252-4acc-969b-049d3a220b82	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
5583c8a9-83e7-478a-b05b-af6c9f027d23	39	280	t	f	1ba712e7-a60c-4c18-9dae-18af3aa2b5e2	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
5b9563a0-b543-4d99-a302-219365cb37a7	58	900	t	f	166eb653-ec32-4ec7-9d54-342aa4677740	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
5cd5a25e-925e-44a7-926f-a594153c2ad2	39	280	t	f	4c8347f2-7115-4bff-8997-f41264326c75	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
68bb7f1a-4251-449f-bf71-2c1059b99a75	58	900	t	f	c04ebfd1-5e03-4866-b2ee-8811575d8bbf	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
6fca95cb-ff76-4baa-a9a5-16011924746c	54	400	t	f	7434edd9-95a1-4cb6-8dd1-423d7bc1ecd6	20a6bf99-1394-4a78-9134-832e34f531dd	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
751ee791-2bbe-4198-93cf-6845a30a3170	2	1880	t	f	428701c1-052a-4d2d-8b48-eb54094761c3	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
78a5f8e5-65b8-4e31-beb1-c13d348012f9	52	1200	t	f	93e19aa0-5307-4a98-a56d-f6ac54e2f50c	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
78c59aec-75f4-41c1-8bd0-dfd7cefb4737	39	280	t	f	d75a28ab-510c-491b-b177-1c110556b3ba	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
79ef2576-a93f-476d-940f-5c3a675f161f	55	400	t	f	e1adb52e-1d61-4da3-be01-83687a812c20	11329e39-dd0b-430e-ad90-b11ecf7bc460	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
7e9a191d-8c24-48c1-b7fc-d9eb12250693	52	1200	t	f	2b4ccec3-7fa9-485f-be72-5f32dfed9b0d	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
84ca8a1c-f792-4321-95c7-b0d55fb33727	18	4000	t	f	cb251d1d-af00-4a30-b540-aa5432b92f85	4902bf20-5252-4acc-969b-049d3a220b82	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
853bb210-0cf8-4947-a44a-211e05b613b5	18	4000	t	f	8122a34f-c326-4b52-a3a7-38e51c5121db	4902bf20-5252-4acc-969b-049d3a220b82	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
8ed97572-7e5c-4f88-8321-3b1df359a27b	39	280	t	f	f8d1b3ea-feeb-42bf-8312-e98c9255848a	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
94cc257a-fbee-430e-beb4-659ada32f33e	58	900	t	f	7434edd9-95a1-4cb6-8dd1-423d7bc1ecd6	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
9aa9b60a-516b-46e4-a890-9b54b6ec1164	58	900	t	f	72125b71-d001-4322-8f1f-485a6bfe004d	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
a0b93ea2-0afc-484a-a77f-fe4d7d292815	56	400	t	f	72125b71-d001-4322-8f1f-485a6bfe004d	ff863d00-7798-4d49-bb06-60695ddff2d8	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
a6f50d66-4e08-4deb-9cea-3f284d0fcb45	2	1880	t	f	1abcea86-6952-4316-bd41-a91007acf235	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
abdbbb6c-5c3e-4963-8b42-a9165b84dbce	57	400	t	f	166eb653-ec32-4ec7-9d54-342aa4677740	c891b182-1a25-48d3-ac0d-4a9b0db00124	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
b03a4194-c29b-4717-83bd-6d8d144d5a45	2	1880	t	f	73a69d9c-adb9-46ac-8a79-a2734482cf1d	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
b62a2f6a-89ba-4a89-91b2-ac93bf25d653	1	1900	t	f	1abcea86-6952-4316-bd41-a91007acf235	b82ba3d5-cf0c-4ddb-9cd0-8fb39ab74cc1	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
b6b660c3-76ca-47bb-8858-d2259c1a76e8	48	1900	t	f	570ab312-03b7-4af9-8cb1-a7113baf0fe3	63a60da7-c974-4e88-80d5-673693e417e2	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
b960eabc-b936-4852-8adc-41309c7d4028	1	1900	t	f	1404cb55-4882-4fa0-9548-3e6e97305684	b82ba3d5-cf0c-4ddb-9cd0-8fb39ab74cc1	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
bb4e2919-bd71-4fca-b963-904b61cc4990	39	280	t	f	255ba618-f2b5-4cd7-8b44-259b7633a7b3	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
bcbb04d9-a516-44e7-8e75-77f9f3229942	39	280	t	f	4ebb639a-ff42-47a2-b165-9bc282445dc2	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
bce9fb5b-1f1a-48ea-a8be-47a6f6140353	52	1200	t	f	86a29f8d-2ada-441c-aaa0-c2dd049debc2	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
bd4bf786-4015-4d68-bbea-cd00858180ba	58	900	t	f	632d3a78-164d-47f1-8ba3-92e158ef9fd7	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
c57b9bdf-bcd2-4f08-9aa5-097f60accae1	57	400	t	f	6b877327-df67-4a20-b208-dde9f410a76b	c891b182-1a25-48d3-ac0d-4a9b0db00124	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
c698d8fb-d268-44fe-87cc-8c1b6803256e	1	1900	t	f	251772ad-1025-4f4d-9409-a28cc696166f	b82ba3d5-cf0c-4ddb-9cd0-8fb39ab74cc1	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
ce2ebcc3-6dff-4105-a18e-f7ac68599494	56	400	t	f	b65df13e-1b3e-4055-8eb4-26dcc837d89b	ff863d00-7798-4d49-bb06-60695ddff2d8	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
d2da4446-08d9-4623-851f-83e89f23a0b7	2	1880	t	f	251772ad-1025-4f4d-9409-a28cc696166f	c9581c8d-b459-4932-8600-67ee197bb1dc	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
da771aa6-f590-44ae-b76a-c1cbae497baf	39	280	t	f	3bc21e28-4e33-4f47-8076-cca55bf3f519	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
f0116d5c-6b30-4347-8b72-757cc9756170	52	1200	t	f	f93cfd0a-84da-4ec0-8906-bc4d74266ea3	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
11329e39-dd0b-430e-ad90-b11ecf7bc460	55	Инструкция 55	55
20a6bf99-1394-4a78-9134-832e34f531dd	54	Инструкция 54	54
3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	52	Инструкция 52	52
3b3c1ba5-18b3-499b-8f25-3ee95183b542	39	Инструкция 39	39
4902bf20-5252-4acc-969b-049d3a220b82	18	Инструкция 18	18
63a60da7-c974-4e88-80d5-673693e417e2	48	Инструкция 48	48
aeb99cad-f366-42c3-8759-a7a07306bbbb	58	Инструкция 58	58
b82ba3d5-cf0c-4ddb-9cd0-8fb39ab74cc1	1	Инструкция 1	1
c891b182-1a25-48d3-ac0d-4a9b0db00124	57	Инструкция 57	57
c9581c8d-b459-4932-8600-67ee197bb1dc	2	Инструкция 2	2
ff863d00-7798-4d49-bb06-60695ddff2d8	56	Инструкция 56	56
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
731a46b1-ed85-4777-9237-877e48defc26	75131-2801300-20	Поперечина рамы задняя	\N	2868425
7ac276ba-b23c-4f0f-8556-02af3ba0dc57	75131-2800010-70	Рама	\N	3291137
e4d43c38-d4fc-464d-a931-04c96b91d8ef	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
17781e65-a3b4-4f98-a1f2-0cd5f1e7ab7d	9d2c1dfc-409a-413c-bd14-80fa331b11de
56d1bb50-d0de-49a7-a018-7fb72a2a89e6	9d2c1dfc-409a-413c-bd14-80fa331b11de
418fed38-60f1-4c84-af47-d5a36c7b4693	e8ff5dc3-7e90-44e6-bc23-475b8a3e3b40
8425bce3-3392-4922-8227-3ac4796f998d	e8ff5dc3-7e90-44e6-bc23-475b8a3e3b40
102f21e4-e2ef-4705-8a04-5ed873e5addf	8d9647c1-6c8f-478b-ae45-e4f2ce404969
27909e46-6b23-4982-8903-caefcc4c3af5	8d9647c1-6c8f-478b-ae45-e4f2ce404969
402d2ac0-0944-425d-be32-e9b8fe406e30	8d9647c1-6c8f-478b-ae45-e4f2ce404969
7938ce0f-b127-4f76-a248-9b7845e20160	8d9647c1-6c8f-478b-ae45-e4f2ce404969
aa89d727-9270-46d4-a375-cbc07898f95d	8d9647c1-6c8f-478b-ae45-e4f2ce404969
bc519e72-9d50-454c-8ef4-860c7bd4ba41	8d9647c1-6c8f-478b-ae45-e4f2ce404969
c0c4bd52-6228-4b6f-899d-f3b38ac02124	8d9647c1-6c8f-478b-ae45-e4f2ce404969
dbbdeeea-8412-41d9-b96b-f490474e120a	8d9647c1-6c8f-478b-ae45-e4f2ce404969
13f6107f-8431-484e-a2c6-4a420fe9ccb4	807251df-16a9-4d13-8730-1885f52ca3ff
1e680b30-8ac7-4115-b739-d5cd4c4fcfe1	38d9c059-158f-4859-b5da-e14714b97ee9
84b43716-91ea-44d9-ad1b-89b5e024f4bf	8d9647c1-6c8f-478b-ae45-e4f2ce404969
d532824c-93b2-4c76-b6de-c083d19ad436	9d2c1dfc-409a-413c-bd14-80fa331b11de
cb778520-e6c9-4b64-9d03-0322863fda9a	807251df-16a9-4d13-8730-1885f52ca3ff
71703e88-2d1d-4f4e-96a7-8fd2fbeb4cb5	e8ff5dc3-7e90-44e6-bc23-475b8a3e3b40
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
17781e65-a3b4-4f98-a1f2-0cd5f1e7ab7d	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
56d1bb50-d0de-49a7-a018-7fb72a2a89e6	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
418fed38-60f1-4c84-af47-d5a36c7b4693	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
8425bce3-3392-4922-8227-3ac4796f998d	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
102f21e4-e2ef-4705-8a04-5ed873e5addf	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
27909e46-6b23-4982-8903-caefcc4c3af5	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
402d2ac0-0944-425d-be32-e9b8fe406e30	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
7938ce0f-b127-4f76-a248-9b7845e20160	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
aa89d727-9270-46d4-a375-cbc07898f95d	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
bc519e72-9d50-454c-8ef4-860c7bd4ba41	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
c0c4bd52-6228-4b6f-899d-f3b38ac02124	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
dbbdeeea-8412-41d9-b96b-f490474e120a	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
13f6107f-8431-484e-a2c6-4a420fe9ccb4	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
1e680b30-8ac7-4115-b739-d5cd4c4fcfe1	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$L5NTWfbRxI3DQR6szWc09YSAJ2ZC5LtA+6XLDXihwz8/Sx1h	\N	\N	\N	\N	\N	\N
84b43716-91ea-44d9-ad1b-89b5e024f4bf	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$93LxtEK5D6HSFqyh6Bg32+8ouwddgAeCvvV12DHA6c48rXwL	\N	\N	\N	\N	\N	\N
d532824c-93b2-4c76-b6de-c083d19ad436	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$BLXF50pUAtj+kaylFLLVuoITYq9qzV7CeSgJc7h9aYB8DM+V	\N	\N	\N	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
cb778520-e6c9-4b64-9d03-0322863fda9a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$NOL3kxA8h3EH88xTlReR5Qy4HBn4X6bviHw3HSItp7YuJ2IY	\N	\N	\N	\N	\N	\N
71703e88-2d1d-4f4e-96a7-8fd2fbeb4cb5	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$jML9y5Im/4Uylkmm42GY8wp+gJINvVtjNFhi4xjgRn60ZH7r	\N	\N	\N	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
053bd50b-53f5-4ad3-9c86-3267b7c65eb4	1	Заполняющий	230	270	23	26	\N	\N	4902bf20-5252-4acc-969b-049d3a220b82	\N
26727b4a-0326-44b5-aeb5-599afe988931	1	Заполняющий	230	270	23	26	\N	\N	63a60da7-c974-4e88-80d5-673693e417e2	\N
3c1d742c-e96b-43c1-be31-110ea725b665	1	Заполняющий	230	270	23	26	\N	\N	c9581c8d-b459-4932-8600-67ee197bb1dc	\N
4dafc5c7-4f33-4cbb-912d-429f6ce637d8	1	Заполняющий	230	270	23	26	\N	\N	11329e39-dd0b-430e-ad90-b11ecf7bc460	\N
71688458-42f8-4603-9fd3-4359ac427bfe	1	Заполняющий	230	270	23	26	\N	\N	c891b182-1a25-48d3-ac0d-4a9b0db00124	\N
7c057887-5fe9-4d58-8606-06592212e51b	1	Заполняющий	230	270	23	26	\N	\N	aeb99cad-f366-42c3-8759-a7a07306bbbb	\N
89cd6ec4-fc06-4d58-9817-6f6ef0e12311	1	Заполняющий	230	270	23	26	\N	\N	3a8bfb73-512f-47ce-88c9-7d9a39fa13e3	\N
8d4c8cc8-68ad-45ca-8eb8-b7cfc5c5a529	1	Заполняющий	230	270	23	26	\N	\N	ff863d00-7798-4d49-bb06-60695ddff2d8	\N
d5da4096-e166-4cde-9ac3-eaf224cbb9bd	1	Заполняющий	230	270	23	26	\N	\N	b82ba3d5-cf0c-4ddb-9cd0-8fb39ab74cc1	\N
dd6089e9-8111-4b28-8ad8-c2addf3aa058	1	Заполняющий	230	270	23	26	\N	\N	20a6bf99-1394-4a78-9134-832e34f531dd	\N
e8fbe5b2-d03c-4720-b56e-f96f2bb6384a	1	Заполняющий	230	270	23	26	\N	\N	3b3c1ba5-18b3-499b-8f25-3ee95183b542	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
81528b95-a494-4334-9088-a1ede0f5335c	1	Корневой	82	0.11	0.68	f	f	t	3772f507-ea0a-4e95-acb5-4e57905e5f71	92ddc9e1-3c9c-4480-9b07-f4fe7a6bab4c	\N
83a697d6-e8e1-42b0-8c3a-364c2936f570	1	Корневой	82	0.11	0.68	f	f	t	836f4520-b2e0-49da-ac54-caa78228a2f8	836f629f-48af-41bd-949d-96bb02e7f40a	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
01a1bf51-16ab-4861-ba29-e002962fed8c	1c288a55-cc2f-4752-9c6a-822c22dbe3b2
0afc98eb-bbee-446b-be6d-76daa3768302	587530e6-10e9-4c43-9524-5e15659e59ab
0afc98eb-bbee-446b-be6d-76daa3768302	9e2e6c1f-18c7-462a-bffc-0c0957359ff4
3cd4d8a0-19f8-4583-924e-ddc6c338d082	74fd86d1-b890-4bbb-a594-39151bb77abc
3fbcdab7-a4a6-4db6-af0c-aec7ffe18bc2	587530e6-10e9-4c43-9524-5e15659e59ab
3fbcdab7-a4a6-4db6-af0c-aec7ffe18bc2	9e2e6c1f-18c7-462a-bffc-0c0957359ff4
6200e777-0099-44f9-af12-6b3bb1b541f7	587530e6-10e9-4c43-9524-5e15659e59ab
6200e777-0099-44f9-af12-6b3bb1b541f7	9e2e6c1f-18c7-462a-bffc-0c0957359ff4
9a552a6f-d7c5-465f-b73a-12d114bc22ce	1c288a55-cc2f-4752-9c6a-822c22dbe3b2
d131a89c-84de-48fd-a43f-77a0fc40cff3	74fd86d1-b890-4bbb-a594-39151bb77abc
f1f9cf62-5f59-4cfb-b2b0-171bd7d6726e	587530e6-10e9-4c43-9524-5e15659e59ab
f1f9cf62-5f59-4cfb-b2b0-171bd7d6726e	9e2e6c1f-18c7-462a-bffc-0c0957359ff4
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
01a1bf51-16ab-4861-ba29-e002962fed8c	27909e46-6b23-4982-8903-caefcc4c3af5	\N	121267
0afc98eb-bbee-446b-be6d-76daa3768302	402d2ac0-0944-425d-be32-e9b8fe406e30	\N	150882
3cd4d8a0-19f8-4583-924e-ddc6c338d082	dbbdeeea-8412-41d9-b96b-f490474e120a	\N	122575
3fbcdab7-a4a6-4db6-af0c-aec7ffe18bc2	c0c4bd52-6228-4b6f-899d-f3b38ac02124	\N	150838
6200e777-0099-44f9-af12-6b3bb1b541f7	102f21e4-e2ef-4705-8a04-5ed873e5addf	\N	146164
9a552a6f-d7c5-465f-b73a-12d114bc22ce	7938ce0f-b127-4f76-a248-9b7845e20160	\N	117390
d131a89c-84de-48fd-a43f-77a0fc40cff3	bc519e72-9d50-454c-8ef4-860c7bd4ba41	\N	132695
f1f9cf62-5f59-4cfb-b2b0-171bd7d6726e	aa89d727-9270-46d4-a375-cbc07898f95d	\N	114729
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
1c288a55-cc2f-4752-9c6a-822c22dbe3b2	94450e30-61b8-4182-9e36-517097604d18
1c288a55-cc2f-4752-9c6a-822c22dbe3b2	da2a8684-fbdc-42c6-b5a6-933cb729daab
587530e6-10e9-4c43-9524-5e15659e59ab	2b8516c0-298b-40ff-9e2b-9713dd14c81c
587530e6-10e9-4c43-9524-5e15659e59ab	94450e30-61b8-4182-9e36-517097604d18
587530e6-10e9-4c43-9524-5e15659e59ab	ab1c5eba-ce2c-4e32-9572-d1c25ef4b15d
587530e6-10e9-4c43-9524-5e15659e59ab	b0c5bd1c-3500-49d9-8291-095d94eef3a7
74fd86d1-b890-4bbb-a594-39151bb77abc	3b7b934f-30c3-4b1d-a673-af0345aefb38
74fd86d1-b890-4bbb-a594-39151bb77abc	b0c5bd1c-3500-49d9-8291-095d94eef3a7
9e2e6c1f-18c7-462a-bffc-0c0957359ff4	2b8516c0-298b-40ff-9e2b-9713dd14c81c
9e2e6c1f-18c7-462a-bffc-0c0957359ff4	94450e30-61b8-4182-9e36-517097604d18
9e2e6c1f-18c7-462a-bffc-0c0957359ff4	ab1c5eba-ce2c-4e32-9572-d1c25ef4b15d
9e2e6c1f-18c7-462a-bffc-0c0957359ff4	b0c5bd1c-3500-49d9-8291-095d94eef3a7
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
1c288a55-cc2f-4752-9c6a-822c22dbe3b2	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	ff98887c-cda0-4e2d-b5e6-be5412a72793	49232
587530e6-10e9-4c43-9524-5e15659e59ab	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	ff98887c-cda0-4e2d-b5e6-be5412a72793	49141
74fd86d1-b890-4bbb-a594-39151bb77abc	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	ff98887c-cda0-4e2d-b5e6-be5412a72793	49286
9e2e6c1f-18c7-462a-bffc-0c0957359ff4	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	ff98887c-cda0-4e2d-b5e6-be5412a72793	49283
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
3772f507-ea0a-4e95-acb5-4e57905e5f71	2023-03-08 18:47:21.91946	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	9e2e6c1f-18c7-462a-bffc-0c0957359ff4	01a1bf51-16ab-4861-ba29-e002962fed8c	ff98887c-cda0-4e2d-b5e6-be5412a72793	\N
836f4520-b2e0-49da-ac54-caa78228a2f8	2023-03-08 18:47:21.919548	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	9e2e6c1f-18c7-462a-bffc-0c0957359ff4	01a1bf51-16ab-4861-ba29-e002962fed8c	ff98887c-cda0-4e2d-b5e6-be5412a72793	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
836f629f-48af-41bd-949d-96bb02e7f40a	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	0c13c8e2-764d-4926-ac45-6085105c39b8	01a1bf51-16ab-4861-ba29-e002962fed8c	ff98887c-cda0-4e2d-b5e6-be5412a72793	84759f0c-687f-4e83-8e89-54013d5aec1d	\N
92ddc9e1-3c9c-4480-9b07-f4fe7a6bab4c	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	028f5d3c-3fe2-4d3d-9cee-2397235d0559	01a1bf51-16ab-4861-ba29-e002962fed8c	ff98887c-cda0-4e2d-b5e6-be5412a72793	84759f0c-687f-4e83-8e89-54013d5aec1d	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
06a68f47-f35d-4eac-928f-0c9a423cec80	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	39edbff2-563d-4d02-9764-7b46b4ab0520	\N
4fbc8d0a-70e7-464a-9ea5-70e4f19c7752	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	39edbff2-563d-4d02-9764-7b46b4ab0520	\N
81bfded1-e253-4809-8ec7-c355c39ccde4	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	39edbff2-563d-4d02-9764-7b46b4ab0520	\N
b6553f79-6680-4d82-8d0d-4906adc20637	1	12:10:00	13:10:00	13:20:00	13:50:00	7c269b63-8724-4786-9268-ed3b86bf6dd3	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
2b8516c0-298b-40ff-9e2b-9713dd14c81c	3550	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	3550
3b7b934f-30c3-4b1d-a673-af0345aefb38	3510	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	3510
94450e30-61b8-4182-9e36-517097604d18	3610	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	3610
ab1c5eba-ce2c-4e32-9572-d1c25ef4b15d	3690	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	3690
b0c5bd1c-3500-49d9-8291-095d94eef3a7	3500	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	3500
da2a8684-fbdc-42c6-b5a6-933cb729daab	3600	\N	bfee629a-cb24-4947-8f39-dae8ada3ca38	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
df7d773c-8040-4c9f-8933-4e5996b3970b	Сварочный цех	50	050
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

