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
fb1b31ad-83ed-4fbe-9daa-7f62d88ecfca	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
e08e4abe-19ed-42ad-89f2-223457ca95ac	75b27381-5a65-48f3-875f-bcfc2dc07e87	831e1cfe-976a-4273-aa27-9de94b7ef490	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
6aee66c1-d41c-4315-97a5-4b71258f58d8	1	10	t	fb1b31ad-83ed-4fbe-9daa-7f62d88ecfca	\N
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
0544f337-b284-4171-84bc-65fec808d97b	Сборочные операции	\N
13b35639-b1f4-4ef2-8016-09242d61afa9	Отсутствие конструктора, технолога или ожидание его решения	\N
175d028d-e615-4208-8e78-e04e789c731a	Контроль на рабочем месте	\N
19048b18-968b-4c0e-8e74-792c69d80f17	Ознакомление с работой, документацией, инструктаж	\N
263cdcd6-db65-4591-8876-65c2ba734faa	Отсутствие крана, транспорта	\N
3a0d8938-d12f-47f1-b50f-196729a6d5ca	Аварийный ремонт централизованными службами	\N
49f7e86a-a3af-420d-944b-aaeb62f3e14a	Отсутствие заданий	\N
4da8d3d7-6155-4738-96f8-bb4ea0bd1bbc	Работа с управляющей программой	\N
4dbe9deb-3628-4069-9aea-686776d82b95	Обед	\N
8b393342-05ce-4c78-819b-c5362b4f8a77	Отсутствие оператора в связи с необеспеченностью	\N
94eb4072-7832-43ea-abed-2b48f76936ab	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
9ced06d0-0ff5-4628-979c-dbd2847ddd2e	Отсутствие материала, заготовок, деталей	\N
ab30f852-2a55-4921-a717-16953c9a5bcf	Неявка оператора (б/лист, отпуск, и пр.)	\N
b793ade7-0768-4c06-ab48-cd3b07c672fc	Естественные надобности	\N
bc3f37be-2215-4dc3-930c-88404504e5e1	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
c516f3c4-83cd-43e8-b1f0-74df2e4d37e8	Работа по карте несоответствий	\N
c82818e7-b7e0-4196-874c-81da5ec60b91	Отсутствие энергоносителей	\N
d5e96d3a-b92d-46aa-9df9-f57142ed34e8	Праздники и выходные	\N
d971ce2d-913b-48be-8f49-d21e3c98a83f	Установка, выверка, снятие детали	\N
dd941e5c-e6df-4913-ad3f-0dabe79d05aa	Отсутствие сотрудника ОТК	\N
e276614a-d9cb-4902-9cd7-9ce207d6ae81	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
edd63f71-5037-40f4-bc02-fb1108a79406	Изменение режимов, смена инструмента, приспособления	\N
edf60168-1c47-4b88-a442-70f80df975cb	Нерабочее время по графику согласно сменности	\N
f02fe79e-3787-4554-8c5c-cf99b36f6798	Плановый ремонт централизованными службами	\N
f5f74495-4a30-401e-b36e-7a3c02feabed	Установка, выверка, снятие детали	\N
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
3bce6916-b72b-4178-97e4-52e082a8f774	27f7beca-a05d-4080-a8c4-804c6a241146	219379
542a16ac-d971-4bb9-8862-477141960085	2f5a77b1-6d62-498a-b473-f02b0852012e	249550
5c6d88ec-8a52-4ac2-842e-9a53be0eedc5	b61f8917-a629-487c-99d7-b805470ae13a	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
4fdbfb91-89f8-4096-be6e-05b6c199ef2c	f2792a8d-4642-47a5-a29c-7a4db14a578c	614962
867b2619-444a-4405-8dc7-74693678b818	b14ecf4d-a1a4-4230-97c8-7b0bd322cf8b	610422
25b56b7b-a550-410d-9cfb-6f1cf364a149	c388c798-3daf-4cd8-859a-f94c0cce4d8f	\N
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
04703654-3f4a-4a2f-88df-ebaff1bf3ea4	4	2	2023-03-10 23:14:56.528041	10646111-cb78-4952-9cf4-8db04452360b	\N
05db06fe-43f4-4241-98f0-1ff40912b713	36	2	2023-03-10 23:14:56.52808	eb475e6a-b43a-423c-80ad-fe6bf3045f60	\N
08a16178-6ef7-4c6c-9352-bd9040de4a60	25	2	2023-03-10 23:14:56.528065	b110afa5-67e6-4c0c-9e28-7469ffeabda8	\N
0c2572ce-7b48-4724-a7fe-4e3fbc60847a	7	2	2023-03-10 23:14:56.528042	21907246-4ea8-4c14-a2ba-31f23e3e6c86	\N
0c87bf10-1fdd-47a7-b7fd-ad2e4b20d146	16	2	2023-03-10 23:14:56.528057	82eaa3fe-4d2d-46f8-a998-040dc2387853	\N
0e357927-4fc4-41f7-88db-e0afd669b90d	31	2	2023-03-10 23:14:56.528071	da0bc3e7-053d-486c-b9c3-2cb4062e8d05	\N
1514edf2-53ef-461a-8356-025f879eedc6	37	2	2023-03-10 23:14:56.52808	ec1f3142-dcc0-4e26-b37b-5b9044ede4da	\N
17caaaf4-326d-4cbd-aab1-b0156afbef23	42	2	2023-03-10 23:14:56.528082	fe3e5438-f142-493e-be70-cb6082d35b3f	\N
1cfdc5e8-ab82-4caa-bde7-9410902b1e53	41	2	2023-03-10 23:14:56.528081	fbccbbed-b1ca-47a7-8c79-eb5f4b56e10b	\N
1e16937c-ca54-44fe-8a71-971599b957dd	8	2	2023-03-10 23:14:56.52805	2488b278-fb9b-446f-8dfc-d7a6f95728c1	\N
222bd148-1d64-48b4-8ae8-74c41b0c76f9	14	2	2023-03-10 23:14:56.528056	5c155db4-a768-4388-8a52-c55879f73dc1	\N
226db789-1030-4a85-86fd-d53c3c873a78	5	2	2023-03-10 23:14:56.528041	15c61c86-89bd-46e5-8ccd-43323e9a49c0	\N
26c0283d-30f9-4dbc-ba4b-eb24aa36d648	6	2	2023-03-10 23:14:56.528042	1b4be289-7b84-4e6c-9eec-7a51c017e208	\N
3b54dbe3-9bbc-450a-ad96-a613cd4822a8	32	2	2023-03-10 23:14:56.528072	dd2e80be-f1be-4655-bc90-f4b217d5dc7c	\N
453864a5-2ad0-4a46-8a81-12cf4670bdde	21	2	2023-03-10 23:14:56.528058	8b3f96be-5bb4-4301-abbb-ab4ffd9e604b	\N
4c0b686e-051e-4d6a-a58e-bcc7ae518a7b	20	2	2023-03-10 23:14:56.528058	873d0bd1-58c9-4f57-a33c-76625ea6abbb	\N
55301179-8013-49d9-98c4-e8f593b2227f	27	2	2023-03-10 23:14:56.528065	c5347b33-c8b5-4eb4-afd7-91557efd3933	\N
59c8e185-7003-4f8f-b810-f5ce39412078	34	2	2023-03-10 23:14:56.528073	e11582c1-81a8-4a7d-a66a-6fe1aafc9672	\N
6664ff3f-cdf4-44ce-84ed-e36e77fdde80	2	2	2023-03-10 23:14:56.52804	03eb442f-e104-4158-bc8b-ec56e3ec3043	\N
71086885-4340-4d4c-b170-db1ab5229d96	17	2	2023-03-10 23:14:56.528057	83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	\N
7300a0ac-65c7-40e9-90ef-091b62c221c0	33	2	2023-03-10 23:14:56.528072	df00b57e-0155-463e-b722-4d0f10e4faf6	\N
745ec398-6d89-4895-8095-44a09a3a2c97	11	2	2023-03-10 23:14:56.528051	46b76c9d-422c-4179-a92e-7fc921444321	\N
81645bb3-bea2-4cc8-aae9-8f1f77546314	30	2	2023-03-10 23:14:56.528071	d7489780-9a63-4e66-a823-dad82fd9f0f4	\N
848344ff-c5cb-4fff-97bd-8a9f057c1783	3	2	2023-03-10 23:14:56.528041	071d7212-aab4-4ec4-8ee7-3349f55d8b60	\N
898e6f96-587c-409a-81f8-87560e065b09	19	2	2023-03-10 23:14:56.528058	85b0ffa1-1615-498f-9f74-d4e14c0d31a8	\N
8fce6bab-9045-40d4-b2cf-00b3958400ad	39	2	2023-03-10 23:14:56.528081	f2b295f5-d48a-47d8-90de-6ba93394938d	\N
953d8973-3bb1-4e2d-8024-24f4eebdd3ab	23	2	2023-03-10 23:14:56.528064	a7a94cfe-e77d-4f43-a5b8-359b66f84375	\N
a62867e4-674e-44da-817c-f07269005011	38	2	2023-03-10 23:14:56.52808	ee0decb6-616e-4f9d-a6a6-f1465ab3459a	\N
a8a74e46-c6f1-4fce-89b9-5816d4e492da	10	2	2023-03-10 23:14:56.528051	460f1465-b655-40e9-b185-2ffe8e5e4603	\N
aa238ccc-58c5-45be-84bb-223d53c46811	40	2	2023-03-10 23:14:56.528081	fa868b8c-b83f-4af1-8054-87ba24ef57bc	\N
af9b7439-6f3b-4413-bf17-f0659a638c6f	28	2	2023-03-10 23:14:56.528066	c9153e52-8141-46af-bb32-5f3f7a2f83d5	\N
bc12d1f4-1852-4a5d-a8d6-8e7fdb8ebc6c	15	2	2023-03-10 23:14:56.528056	7384c89a-3c53-433c-b22f-0ee77267fc03	\N
cb576abe-386b-4230-ab18-28a9c2c42620	13	2	2023-03-10 23:14:56.528052	56140d8d-0c5c-4f3f-bbab-998bcdfe9ec0	\N
d21df084-d019-4407-a0ee-ce2f22d94df7	35	2	2023-03-10 23:14:56.528079	eb176e0e-2050-4745-b4f1-4ca9039a8e57	\N
d4fd9db3-9184-4a24-93d3-0a6074bb1399	12	2	2023-03-10 23:14:56.528052	4b6c5bb0-bb72-4149-a3dd-f16874277f36	\N
d7cf1fb7-d791-43ef-ba1f-236a2a61027c	18	2	2023-03-10 23:14:56.528058	84482cdb-dfac-40fb-9588-290671a272b5	\N
d9c6f47e-abb7-4e80-a0e1-688636283564	22	2	2023-03-10 23:14:56.528063	8c901281-df98-401f-82a8-b6a7b252b2f8	\N
de4958a4-e618-4ba0-a699-b020af02bdd0	24	2	2023-03-10 23:14:56.528064	a92708c6-0e93-4a02-bc96-7a841779b22e	\N
eaf9478c-4dec-4557-b805-db4cfe520a8a	9	2	2023-03-10 23:14:56.52805	38b89d50-ac0d-4f82-b10b-ed0d8e9679ef	\N
eedf1b57-41ef-40e0-af39-5ebadcac8c4b	1	2	2023-03-10 23:14:56.527954	009d4f87-398c-4ef4-8c63-a61531de8a93	\N
f61078d2-0e7b-4206-bfe0-21d52e48922f	26	2	2023-03-10 23:14:56.528065	be7931fb-8f2e-47f4-ac3b-1c6b3a7c7856	\N
fdde5014-c4c7-42c3-b0dd-cf95512b5eec	29	2	2023-03-10 23:14:56.52807	d483b0d1-3b2d-4c3a-8128-dae8c2ea9a7c	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
10646111-cb78-4952-9cf4-8db04452360b	009d4f87-398c-4ef4-8c63-a61531de8a93
1b4be289-7b84-4e6c-9eec-7a51c017e208	03eb442f-e104-4158-bc8b-ec56e3ec3043
10646111-cb78-4952-9cf4-8db04452360b	071d7212-aab4-4ec4-8ee7-3349f55d8b60
83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	15c61c86-89bd-46e5-8ccd-43323e9a49c0
fa868b8c-b83f-4af1-8054-87ba24ef57bc	1b4be289-7b84-4e6c-9eec-7a51c017e208
85b0ffa1-1615-498f-9f74-d4e14c0d31a8	21907246-4ea8-4c14-a2ba-31f23e3e6c86
83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	2488b278-fb9b-446f-8dfc-d7a6f95728c1
10646111-cb78-4952-9cf4-8db04452360b	38b89d50-ac0d-4f82-b10b-ed0d8e9679ef
c5347b33-c8b5-4eb4-afd7-91557efd3933	460f1465-b655-40e9-b185-2ffe8e5e4603
10646111-cb78-4952-9cf4-8db04452360b	46b76c9d-422c-4179-a92e-7fc921444321
c5347b33-c8b5-4eb4-afd7-91557efd3933	4b6c5bb0-bb72-4149-a3dd-f16874277f36
fa868b8c-b83f-4af1-8054-87ba24ef57bc	56140d8d-0c5c-4f3f-bbab-998bcdfe9ec0
10646111-cb78-4952-9cf4-8db04452360b	5c155db4-a768-4388-8a52-c55879f73dc1
83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	7384c89a-3c53-433c-b22f-0ee77267fc03
5c155db4-a768-4388-8a52-c55879f73dc1	82eaa3fe-4d2d-46f8-a998-040dc2387853
10646111-cb78-4952-9cf4-8db04452360b	83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7
c5347b33-c8b5-4eb4-afd7-91557efd3933	84482cdb-dfac-40fb-9588-290671a272b5
10646111-cb78-4952-9cf4-8db04452360b	85b0ffa1-1615-498f-9f74-d4e14c0d31a8
fa868b8c-b83f-4af1-8054-87ba24ef57bc	873d0bd1-58c9-4f57-a33c-76625ea6abbb
fa868b8c-b83f-4af1-8054-87ba24ef57bc	8b3f96be-5bb4-4301-abbb-ab4ffd9e604b
8b3f96be-5bb4-4301-abbb-ab4ffd9e604b	8c901281-df98-401f-82a8-b6a7b252b2f8
071d7212-aab4-4ec4-8ee7-3349f55d8b60	a7a94cfe-e77d-4f43-a5b8-359b66f84375
873d0bd1-58c9-4f57-a33c-76625ea6abbb	a92708c6-0e93-4a02-bc96-7a841779b22e
10646111-cb78-4952-9cf4-8db04452360b	b110afa5-67e6-4c0c-9e28-7469ffeabda8
071d7212-aab4-4ec4-8ee7-3349f55d8b60	be7931fb-8f2e-47f4-ac3b-1c6b3a7c7856
fa868b8c-b83f-4af1-8054-87ba24ef57bc	c5347b33-c8b5-4eb4-afd7-91557efd3933
8b3f96be-5bb4-4301-abbb-ab4ffd9e604b	c9153e52-8141-46af-bb32-5f3f7a2f83d5
83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	d483b0d1-3b2d-4c3a-8128-dae8c2ea9a7c
56140d8d-0c5c-4f3f-bbab-998bcdfe9ec0	d7489780-9a63-4e66-a823-dad82fd9f0f4
c5347b33-c8b5-4eb4-afd7-91557efd3933	da0bc3e7-053d-486c-b9c3-2cb4062e8d05
85b0ffa1-1615-498f-9f74-d4e14c0d31a8	dd2e80be-f1be-4655-bc90-f4b217d5dc7c
c5347b33-c8b5-4eb4-afd7-91557efd3933	df00b57e-0155-463e-b722-4d0f10e4faf6
83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	e11582c1-81a8-4a7d-a66a-6fe1aafc9672
873d0bd1-58c9-4f57-a33c-76625ea6abbb	eb176e0e-2050-4745-b4f1-4ca9039a8e57
fa868b8c-b83f-4af1-8054-87ba24ef57bc	eb475e6a-b43a-423c-80ad-fe6bf3045f60
fa868b8c-b83f-4af1-8054-87ba24ef57bc	ec1f3142-dcc0-4e26-b37b-5b9044ede4da
fa868b8c-b83f-4af1-8054-87ba24ef57bc	ee0decb6-616e-4f9d-a6a6-f1465ab3459a
10646111-cb78-4952-9cf4-8db04452360b	f2b295f5-d48a-47d8-90de-6ba93394938d
fa868b8c-b83f-4af1-8054-87ba24ef57bc	fbccbbed-b1ca-47a7-8c79-eb5f4b56e10b
38b89d50-ac0d-4f82-b10b-ed0d8e9679ef	fe3e5438-f142-493e-be70-cb6082d35b3f
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
01548674-9510-48ae-bd59-e321c373a623	0	2	\N	\N	0e357927-4fc4-41f7-88db-e0afd669b90d	\N
01e5584f-d738-4b82-ad33-74716ff64242	0	1	\N	\N	26c0283d-30f9-4dbc-ba4b-eb24aa36d648	\N
032b0713-42a0-4c8e-aaf5-bcf50216ddf8	0	2	\N	\N	08a16178-6ef7-4c6c-9352-bd9040de4a60	\N
043af911-4258-4963-b4d0-5d9a7ad85372	0	2	\N	\N	05db06fe-43f4-4241-98f0-1ff40912b713	\N
07a5608f-f1cf-43ea-b63e-495c42966593	0	3	\N	\N	a8a74e46-c6f1-4fce-89b9-5816d4e492da	\N
08fe0032-ee19-44e5-9b3a-b05c067555e3	0	3	\N	\N	81645bb3-bea2-4cc8-aae9-8f1f77546314	\N
0aa79c3e-357d-42b8-b86a-0d851921787f	0	2	\N	\N	71086885-4340-4d4c-b170-db1ab5229d96	\N
0cf09174-335e-4f67-b4b5-fa5eb4090b14	0	2	\N	\N	898e6f96-587c-409a-81f8-87560e065b09	\N
0e9d74dd-468a-47a8-9df4-4a0b28186b95	0	1	\N	\N	bc12d1f4-1852-4a5d-a8d6-8e7fdb8ebc6c	\N
0f782bf2-9b19-4ada-8621-b403b9708b68	0	1	\N	\N	0c87bf10-1fdd-47a7-b7fd-ad2e4b20d146	\N
0fff316d-3afc-4a70-acb7-f0fae6f3f025	0	3	\N	\N	0c87bf10-1fdd-47a7-b7fd-ad2e4b20d146	\N
11324a9c-8c56-4a8c-92a9-0f5c35890036	0	2	\N	\N	0c2572ce-7b48-4724-a7fe-4e3fbc60847a	\N
13eb0625-3c27-4293-99fa-45f7eb1a0fe3	0	2	\N	\N	d4fd9db3-9184-4a24-93d3-0a6074bb1399	\N
1583fde5-e956-4f80-955a-eb28181e36f3	0	1	\N	\N	4c0b686e-051e-4d6a-a58e-bcc7ae518a7b	\N
168f515e-c890-4eb7-be99-ee870279100b	0	2	\N	\N	de4958a4-e618-4ba0-a699-b020af02bdd0	\N
197d6eb4-958d-4437-bbb5-1bcc4e5daed7	0	1	\N	\N	55301179-8013-49d9-98c4-e8f593b2227f	\N
1dae0c43-0282-4034-aa5b-70f9d7d429da	0	3	\N	\N	05db06fe-43f4-4241-98f0-1ff40912b713	\N
1e370d75-2f51-4a12-bedb-0c14985a48a9	0	2	\N	\N	f61078d2-0e7b-4206-bfe0-21d52e48922f	\N
20d86405-579a-4cb4-8528-2e14d5488765	0	1	\N	\N	0c2572ce-7b48-4724-a7fe-4e3fbc60847a	\N
214729e2-1683-48aa-bb6a-f0d432609c91	0	3	\N	\N	f61078d2-0e7b-4206-bfe0-21d52e48922f	\N
221217d0-99a6-40ba-971d-21dcb783c1a5	0	1	\N	\N	745ec398-6d89-4895-8095-44a09a3a2c97	\N
229bb93d-3633-4f09-840d-3e4b5bf7a683	0	1	\N	\N	08a16178-6ef7-4c6c-9352-bd9040de4a60	\N
23030c97-52df-4cfc-87b0-33669bc83ed7	0	1	\N	\N	d7cf1fb7-d791-43ef-ba1f-236a2a61027c	\N
24f281c7-742c-4e18-985e-172c40f453ed	0	3	\N	\N	71086885-4340-4d4c-b170-db1ab5229d96	\N
27ed29ae-dc4b-4c90-b412-9b74f35a111d	0	1	\N	\N	a62867e4-674e-44da-817c-f07269005011	\N
2942a191-124d-4465-87ad-c6eed92d9468	0	3	\N	\N	bc12d1f4-1852-4a5d-a8d6-8e7fdb8ebc6c	\N
2a31e1da-54dd-48ae-adc4-9b92d3abf801	0	3	\N	\N	d21df084-d019-4407-a0ee-ce2f22d94df7	\N
2c7794ab-9397-486a-bf7a-35d5069d0ce1	0	2	\N	\N	eedf1b57-41ef-40e0-af39-5ebadcac8c4b	\N
2f2e17af-c01f-431d-a28e-2bb6027c966f	0	3	\N	\N	aa238ccc-58c5-45be-84bb-223d53c46811	\N
2fb14bf9-1a12-4dea-8466-584b420fc873	0	2	\N	\N	7300a0ac-65c7-40e9-90ef-091b62c221c0	\N
34699c58-1610-493f-a850-9ddb0eae86cd	0	3	\N	\N	6664ff3f-cdf4-44ce-84ed-e36e77fdde80	\N
35a1c3c0-be82-4880-a553-19adf5af95c8	0	1	\N	\N	898e6f96-587c-409a-81f8-87560e065b09	\N
35d0dc38-ceed-43e5-b181-36774d9a6e94	0	1	\N	\N	0e357927-4fc4-41f7-88db-e0afd669b90d	\N
35f616eb-b4b2-46bd-a966-027ae709423e	0	2	\N	\N	0c87bf10-1fdd-47a7-b7fd-ad2e4b20d146	\N
382b40f3-d6bf-41cb-a30e-f0534b1304ee	0	2	\N	\N	cb576abe-386b-4230-ab18-28a9c2c42620	\N
38f1864f-f9aa-4f79-85d5-a0e71392eac4	0	1	\N	\N	fdde5014-c4c7-42c3-b0dd-cf95512b5eec	\N
38f186b2-3496-4b93-9281-ad96fafd566c	0	2	\N	\N	848344ff-c5cb-4fff-97bd-8a9f057c1783	\N
3b68544b-0dcc-44c7-91b3-350d3b393e19	0	2	\N	\N	d21df084-d019-4407-a0ee-ce2f22d94df7	\N
3ca282ed-5b6c-4510-b863-81f51b3df2a5	0	3	\N	\N	1e16937c-ca54-44fe-8a71-971599b957dd	\N
3e7c7d46-9a3a-477c-9bfc-b83204522466	0	3	\N	\N	226db789-1030-4a85-86fd-d53c3c873a78	\N
45e0b60b-7784-4087-b3bc-a579e39efa4e	0	3	\N	\N	898e6f96-587c-409a-81f8-87560e065b09	\N
4780fc4b-81f4-4094-b5c5-fbeb7b799931	0	3	\N	\N	1cfdc5e8-ab82-4caa-bde7-9410902b1e53	\N
48db6057-aa17-4e99-8b27-d96c82170946	0	3	\N	\N	eaf9478c-4dec-4557-b805-db4cfe520a8a	\N
4d51e739-0b93-4054-b211-967ca0b8eda7	0	2	\N	\N	1e16937c-ca54-44fe-8a71-971599b957dd	\N
4dba17f2-f71f-4ba0-8675-a1bdb4d50bd3	0	1	\N	\N	d21df084-d019-4407-a0ee-ce2f22d94df7	\N
5096f047-3c1f-4dce-9369-67efec203e72	0	1	\N	\N	953d8973-3bb1-4e2d-8024-24f4eebdd3ab	\N
5512db48-8acb-480b-bac5-cb51c7cfddfc	0	1	\N	\N	04703654-3f4a-4a2f-88df-ebaff1bf3ea4	\N
55f5ea8d-7ea2-4d66-b943-72470a0ff234	0	1	\N	\N	222bd148-1d64-48b4-8ae8-74c41b0c76f9	\N
57c2eda7-e00f-4525-981c-cb632690d2a5	0	3	\N	\N	7300a0ac-65c7-40e9-90ef-091b62c221c0	\N
59c1028c-4b4b-4af9-b02d-fae95e31637f	0	1	\N	\N	de4958a4-e618-4ba0-a699-b020af02bdd0	\N
59e8b331-a23f-455f-82d9-0a7604ca9790	0	2	\N	\N	55301179-8013-49d9-98c4-e8f593b2227f	\N
5c83c14b-ff7a-4597-905a-9286ec9ff5eb	0	1	\N	\N	d4fd9db3-9184-4a24-93d3-0a6074bb1399	\N
5fbb73c6-9260-40ca-8d75-d2999afcbc99	0	2	\N	\N	8fce6bab-9045-40d4-b2cf-00b3958400ad	\N
606acb82-d1b1-4ca5-b9dd-fef01548fca1	0	1	\N	\N	848344ff-c5cb-4fff-97bd-8a9f057c1783	\N
60aac5d5-8a46-4edb-af15-c39b7f33b22b	0	1	\N	\N	eedf1b57-41ef-40e0-af39-5ebadcac8c4b	\N
63170d60-dac4-44a4-aedd-b7cf9595d66c	0	2	\N	\N	59c8e185-7003-4f8f-b810-f5ce39412078	\N
631f9ad0-e12d-4870-a5ae-aefe3349a263	0	2	\N	\N	4c0b686e-051e-4d6a-a58e-bcc7ae518a7b	\N
64603388-2cf7-48fd-942c-5dd9cf3a2512	0	2	\N	\N	a8a74e46-c6f1-4fce-89b9-5816d4e492da	\N
681fbb06-eaed-4956-87b9-c98508adf500	0	2	\N	\N	fdde5014-c4c7-42c3-b0dd-cf95512b5eec	\N
6a2d6638-7ac4-4624-b5e7-ee282ffeddb2	0	1	\N	\N	f61078d2-0e7b-4206-bfe0-21d52e48922f	\N
6b016003-d548-42cd-84c4-c3a12be0e514	0	3	\N	\N	d7cf1fb7-d791-43ef-ba1f-236a2a61027c	\N
6c51a7e3-7428-45bd-ba76-3f22f38ab5e1	0	2	\N	\N	81645bb3-bea2-4cc8-aae9-8f1f77546314	\N
6cdff7c4-9952-4ecd-aca8-f4cba84d6a17	0	1	\N	\N	6664ff3f-cdf4-44ce-84ed-e36e77fdde80	\N
703ee88c-c134-43f7-b471-4fba7c3f9e59	0	3	\N	\N	af9b7439-6f3b-4413-bf17-f0659a638c6f	\N
711cad67-312b-42f2-a714-bfaa7bf35166	0	3	\N	\N	cb576abe-386b-4230-ab18-28a9c2c42620	\N
723c4d67-da26-42e2-a72e-0ad75fbd8ff8	0	3	\N	\N	453864a5-2ad0-4a46-8a81-12cf4670bdde	\N
7257c891-63e5-48c5-95fc-ebfaae116f78	0	2	\N	\N	af9b7439-6f3b-4413-bf17-f0659a638c6f	\N
72d27d1f-cf67-4255-b86b-e3fa99faad9d	0	3	\N	\N	a62867e4-674e-44da-817c-f07269005011	\N
73503cef-557c-4418-ab4d-17577312cda4	0	1	\N	\N	59c8e185-7003-4f8f-b810-f5ce39412078	\N
77f16690-2d30-4731-a351-77349dd5a757	0	2	\N	\N	26c0283d-30f9-4dbc-ba4b-eb24aa36d648	\N
77fe28cc-bf96-45e4-893f-115414d577e7	0	2	\N	\N	bc12d1f4-1852-4a5d-a8d6-8e7fdb8ebc6c	\N
7b8fe45a-0673-4261-b15b-3275e30fa72f	0	3	\N	\N	953d8973-3bb1-4e2d-8024-24f4eebdd3ab	\N
7faaf67d-ced4-4d56-963e-9626816d69b8	0	3	\N	\N	08a16178-6ef7-4c6c-9352-bd9040de4a60	\N
813b81e2-2429-4f87-a61b-066c54bc0935	0	2	\N	\N	eaf9478c-4dec-4557-b805-db4cfe520a8a	\N
81486e9d-1b8f-4069-a2be-5150f1aebf24	0	3	\N	\N	1514edf2-53ef-461a-8356-025f879eedc6	\N
84b18c68-0534-4653-8fef-5bb8dbd96364	0	2	\N	\N	226db789-1030-4a85-86fd-d53c3c873a78	\N
8ec86c22-5fbd-4d11-9ea2-ca567d294889	0	2	\N	\N	a62867e4-674e-44da-817c-f07269005011	\N
956d0bdd-c5d0-48b1-8b9e-a5794e203521	0	3	\N	\N	fdde5014-c4c7-42c3-b0dd-cf95512b5eec	\N
9c32a629-da8b-4f7e-9926-f4072af9037f	0	1	\N	\N	3b54dbe3-9bbc-450a-ad96-a613cd4822a8	\N
9ef293f9-4a24-434a-8b0b-dd21de20198d	0	2	\N	\N	453864a5-2ad0-4a46-8a81-12cf4670bdde	\N
a1ffa140-4a12-404c-bea4-156ec69d888c	0	2	\N	\N	3b54dbe3-9bbc-450a-ad96-a613cd4822a8	\N
ab36d709-ae4d-4eed-864f-663973afad34	0	1	\N	\N	d9c6f47e-abb7-4e80-a0e1-688636283564	\N
ab7430a6-49a3-40e5-9cec-16c68df49307	0	3	\N	\N	0e357927-4fc4-41f7-88db-e0afd669b90d	\N
aceab258-66fe-4498-be45-17cfe8dc98c4	0	1	\N	\N	7300a0ac-65c7-40e9-90ef-091b62c221c0	\N
b0e7979e-198a-4b05-b451-7f44a3784e30	0	3	\N	\N	0c2572ce-7b48-4724-a7fe-4e3fbc60847a	\N
b1ac16d5-1c94-4c29-baec-e0cd4aa698c3	0	3	\N	\N	26c0283d-30f9-4dbc-ba4b-eb24aa36d648	\N
b1cc38e6-5a59-4dbe-b856-8a4083e398d7	0	2	\N	\N	17caaaf4-326d-4cbd-aab1-b0156afbef23	\N
b39d336d-ce4d-4087-846a-0e06cd0b07d2	0	2	\N	\N	953d8973-3bb1-4e2d-8024-24f4eebdd3ab	\N
b3f14f81-790e-4ad5-a53b-f147a3557986	0	1	\N	\N	71086885-4340-4d4c-b170-db1ab5229d96	\N
b7899a43-6aa5-4352-8950-f3f40c61d34d	0	3	\N	\N	17caaaf4-326d-4cbd-aab1-b0156afbef23	\N
b912d8b0-e1e5-4cdf-abf1-cfb22b305145	0	2	\N	\N	222bd148-1d64-48b4-8ae8-74c41b0c76f9	\N
bb301f5d-5406-4af7-9e8a-6b3b62668d78	0	3	\N	\N	848344ff-c5cb-4fff-97bd-8a9f057c1783	\N
bcdb489f-68c8-417b-876e-f95a74ff17b8	0	3	\N	\N	59c8e185-7003-4f8f-b810-f5ce39412078	\N
c1e6a3dc-a42d-4df2-b187-88c96dd15797	0	3	\N	\N	222bd148-1d64-48b4-8ae8-74c41b0c76f9	\N
c2cb2797-2f35-48a5-982d-9d328f279d06	0	1	\N	\N	eaf9478c-4dec-4557-b805-db4cfe520a8a	\N
c3d73122-5e46-495d-813e-1ac82964b59b	0	3	\N	\N	de4958a4-e618-4ba0-a699-b020af02bdd0	\N
c6087bfc-7b51-4c5c-a5ee-5073102401da	0	1	\N	\N	cb576abe-386b-4230-ab18-28a9c2c42620	\N
c6b85415-d5de-4802-8992-da833aa59cf8	0	1	\N	\N	81645bb3-bea2-4cc8-aae9-8f1f77546314	\N
c8834139-7dd3-4e52-b405-349b9ce06009	0	3	\N	\N	8fce6bab-9045-40d4-b2cf-00b3958400ad	\N
c8ad9137-943b-4913-996a-9e71ce4edf6d	0	3	\N	\N	3b54dbe3-9bbc-450a-ad96-a613cd4822a8	\N
c970fb79-b4ef-4d95-bbd9-5ddb942fb9bb	0	2	\N	\N	aa238ccc-58c5-45be-84bb-223d53c46811	\N
c9c6e1bb-bde9-46a7-b9ad-586831928469	0	1	\N	\N	05db06fe-43f4-4241-98f0-1ff40912b713	\N
caee75ab-67c4-42c8-87a1-fc786d07db7d	0	2	\N	\N	1514edf2-53ef-461a-8356-025f879eedc6	\N
cb3f9486-673e-4bc9-9ac0-36973ceecd48	0	3	\N	\N	4c0b686e-051e-4d6a-a58e-bcc7ae518a7b	\N
cb948b3d-fa47-4e4b-b8a0-3396625bf1e7	0	3	\N	\N	745ec398-6d89-4895-8095-44a09a3a2c97	\N
d586080e-6499-415f-a325-0d12d8bfac9b	0	1	\N	\N	8fce6bab-9045-40d4-b2cf-00b3958400ad	\N
d598c3c3-4262-48e8-acb3-0ef50f0afd3d	0	2	\N	\N	6664ff3f-cdf4-44ce-84ed-e36e77fdde80	\N
d78178d9-3496-4335-9102-086579f49f34	0	2	\N	\N	745ec398-6d89-4895-8095-44a09a3a2c97	\N
d7cbf952-7bd3-4efe-9e3c-059e8c7ac61b	0	1	\N	\N	17caaaf4-326d-4cbd-aab1-b0156afbef23	\N
dd64c8bd-7e52-4862-866c-20b9bf0d7d6f	0	3	\N	\N	55301179-8013-49d9-98c4-e8f593b2227f	\N
de80a042-3113-43b4-9b3c-21d05b52a2ce	0	3	\N	\N	eedf1b57-41ef-40e0-af39-5ebadcac8c4b	\N
dea15aba-0abf-49e2-be49-c844f23df3f5	0	1	\N	\N	af9b7439-6f3b-4413-bf17-f0659a638c6f	\N
def51d24-9e50-47e3-9ffe-308d642bc40f	0	1	\N	\N	1514edf2-53ef-461a-8356-025f879eedc6	\N
e01a0318-27f7-424b-ba0e-a6b532a91362	0	2	\N	\N	d9c6f47e-abb7-4e80-a0e1-688636283564	\N
e4788184-77b2-4794-a4b9-66c6b23288a3	0	1	\N	\N	226db789-1030-4a85-86fd-d53c3c873a78	\N
e5d16f8b-2b46-4c1e-9d19-edc5567c0c24	0	3	\N	\N	d4fd9db3-9184-4a24-93d3-0a6074bb1399	\N
efff47c5-afc3-461d-89cf-0e774f57118e	0	1	\N	\N	1e16937c-ca54-44fe-8a71-971599b957dd	\N
f06660fa-0163-4995-93cf-5e0c53e6467f	0	1	\N	\N	aa238ccc-58c5-45be-84bb-223d53c46811	\N
f10b28a0-d45e-44ea-8427-3cb949e16151	0	1	\N	\N	453864a5-2ad0-4a46-8a81-12cf4670bdde	\N
f1b8e1cf-b3ea-451b-88c1-089d13452990	0	2	\N	\N	d7cf1fb7-d791-43ef-ba1f-236a2a61027c	\N
f1ba7dfb-069a-405f-8cdb-4bc10702ae18	0	3	\N	\N	d9c6f47e-abb7-4e80-a0e1-688636283564	\N
f3fa3dec-b229-4436-ac92-a0bdff36964b	0	2	\N	\N	1cfdc5e8-ab82-4caa-bde7-9410902b1e53	\N
f491773d-acec-446e-bc32-95423f3b2100	0	1	\N	\N	1cfdc5e8-ab82-4caa-bde7-9410902b1e53	\N
f55f8fb9-3026-4ed3-86b1-a023c7c47696	0	1	\N	\N	a8a74e46-c6f1-4fce-89b9-5816d4e492da	\N
fcb8adb3-2760-46fe-85c0-f1faa6b825d5	0	2	\N	\N	04703654-3f4a-4a2f-88df-ebaff1bf3ea4	\N
ff57d868-792d-481f-abf3-1e423d48e3f5	0	3	\N	\N	04703654-3f4a-4a2f-88df-ebaff1bf3ea4	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
713c7350-c94f-4015-9ee4-7158b316a50d	Сборка, сварка рам к/с г/п 120-130 т.	6	831e1cfe-976a-4273-aa27-9de94b7ef490	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
009d4f87-398c-4ef4-8c63-a61531de8a93	Усилитель	75131-2801115-01	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
03eb442f-e104-4158-bc8b-ec56e3ec3043	Опора	75131-2801188	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
071d7212-aab4-4ec4-8ee7-3349f55d8b60	Лонжерон рамы правый	75131-2801016-70	t	2	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
10646111-cb78-4952-9cf4-8db04452360b	Рама	7513D-2800010-20	t	1	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	4536492774
15c61c86-89bd-46e5-8ccd-43323e9a49c0	Кронштейн задней опоры	75131-8521182-20	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
1b4be289-7b84-4e6c-9eec-7a51c017e208	Лонжерон рамы правый	75131-2801014-41	t	2	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
21907246-4ea8-4c14-a2ba-31f23e3e6c86	Накладка рамы поперечная передняя	75131-2801088-70	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
2488b278-fb9b-446f-8dfc-d7a6f95728c1	Поперечина	75131-2801325	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
460f1465-b655-40e9-b185-2ffe8e5e4603	Поперечина	75131-2801325	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
46b76c9d-422c-4179-a92e-7fc921444321	Поперечина	75131-2801103-10	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
56140d8d-0c5c-4f3f-bbab-998bcdfe9ec0	Лонжерон рамы левый	75131-2801015-41	t	2	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
5c155db4-a768-4388-8a52-c55879f73dc1	Лонжерон рамы правый	75131-2801014-41	t	2	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
7384c89a-3c53-433c-b22f-0ee77267fc03	Кронштейн задней опоры	75131-8521183-20	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
82eaa3fe-4d2d-46f8-a998-040dc2387853	Опора	75131-2801188	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	Поперечина рамы задняя	75131-2801300-20	t	2	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
84482cdb-dfac-40fb-9588-290671a272b5	Кронштейн задней опоры	75131-8521183-20	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
85b0ffa1-1615-498f-9f74-d4e14c0d31a8	Лонжерон рамы левый	75131-2801017-70	t	2	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
873d0bd1-58c9-4f57-a33c-76625ea6abbb	Лонжерон рамы левый	75131-2801017-70	t	2	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
8b3f96be-5bb4-4301-abbb-ab4ffd9e604b	Лонжерон рамы правый	75131-2801016-70	t	2	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
8c901281-df98-401f-82a8-b6a7b252b2f8	Накладка рамы поперечная передняя	75131-2801088-70	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
a7a94cfe-e77d-4f43-a5b8-359b66f84375	Опора	75131-2801188	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
a92708c6-0e93-4a02-bc96-7a841779b22e	Накладка рамы поперечная передняя	75131-2801088-70	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
b110afa5-67e6-4c0c-9e28-7469ffeabda8	Усилитель	75131-2801114-01	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
be7931fb-8f2e-47f4-ac3b-1c6b3a7c7856	Накладка рамы поперечная передняя	75131-2801088-70	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
c5347b33-c8b5-4eb4-afd7-91557efd3933	Поперечина рамы задняя	75131-2801300-20	t	2	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
c9153e52-8141-46af-bb32-5f3f7a2f83d5	Опора	75131-2801188	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
d483b0d1-3b2d-4c3a-8128-dae8c2ea9a7c	Лист верхний	75131-2801357-10	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
d7489780-9a63-4e66-a823-dad82fd9f0f4	Опора	75131-2801188	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
da0bc3e7-053d-486c-b9c3-2cb4062e8d05	Лист верхний	75131-2801357-10	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
dd2e80be-f1be-4655-bc90-f4b217d5dc7c	Опора	75131-2801188	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
df00b57e-0155-463e-b722-4d0f10e4faf6	Кронштейн задней опоры	75131-8521182-20	t	3	58309db6-6844-4e29-bfe0-23465c0bfc8b	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
e11582c1-81a8-4a7d-a66a-6fe1aafc9672	Лист нижний	75131-2801358-10	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
eb176e0e-2050-4745-b4f1-4ca9039a8e57	Опора	75131-2801188	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
eb475e6a-b43a-423c-80ad-fe6bf3045f60	Усилитель	75131-2801115-01	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
ec1f3142-dcc0-4e26-b37b-5b9044ede4da	Усилитель	75131-2801114-01	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
ee0decb6-616e-4f9d-a6a6-f1465ab3459a	Поперечина	75131-2801103-10	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
f2b295f5-d48a-47d8-90de-6ba93394938d	Поперечина №3 рамы с опорами	75132-2801152	t	2	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
fa868b8c-b83f-4af1-8054-87ba24ef57bc	Рама	75131-2800010-70	t	1	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	4536479362
fbccbbed-b1ca-47a7-8c79-eb5f4b56e10b	Поперечина №3 рамы с опорами	75132-2801152	t	2	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
fe3e5438-f142-493e-be70-cb6082d35b3f	Опора	75131-2801188	t	3	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N	\N	\N
38b89d50-ac0d-4f82-b10b-ed0d8e9679ef	Лонжерон рамы левый	75131-2801015-41	t	2	9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	713c7350-c94f-4015-9ee4-7158b316a50d	867b2619-444a-4405-8dc7-74693678b818	\N	\N	\N
4b6c5bb0-bb72-4149-a3dd-f16874277f36	Лист нижний	75131-2801358-10	t	3	cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	713c7350-c94f-4015-9ee4-7158b316a50d	867b2619-444a-4405-8dc7-74693678b818	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
55564890-3af8-4b1d-9d6d-b0866f4ebed0	Admin	\N
68680f1f-ea6f-432a-9dc8-25b14fdc89df	Master	\N
fa47b46c-3dea-490e-b1e6-d605b4905ab7	Welder	\N
cd99cb8c-e1c8-4f3f-9a26-ac8f101126ec	Inspector	\N
0b67cab7-1872-4b13-af0e-3a247b3473ae	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
0c306628-563a-4714-ad3c-5432c8f29bae	2023-03-10 23:14:56.527801	1364fc88-e36e-4dae-8670-7efa859cd6a8	eedf1b57-41ef-40e0-af39-5ebadcac8c4b	\N
1c0c418c-df23-4326-bd28-4980e57f8fc6	2023-03-10 23:14:56.528051	41e2260c-b836-4805-8532-bd54b0e09d46	a8a74e46-c6f1-4fce-89b9-5816d4e492da	\N
2f37f7f7-dd21-4bb9-a23e-49f50917b037	2023-03-10 23:14:56.528064	161b0297-2279-4d84-ab15-90e70b2464f5	953d8973-3bb1-4e2d-8024-24f4eebdd3ab	\N
31544248-f61f-4428-9e36-fcdcf4505efa	2023-03-10 23:14:56.528057	f3e225da-9a61-4d7e-929f-2e2b23e09a0d	71086885-4340-4d4c-b170-db1ab5229d96	\N
38898852-760c-4238-a722-c45632722078	2023-03-10 23:14:56.528042	9d6a6f6d-a100-4720-85cf-e6357bc15971	0c2572ce-7b48-4724-a7fe-4e3fbc60847a	\N
3f67a24f-2c66-4764-9dfc-e8aae7ca6453	2023-03-10 23:14:56.528065	3d0530a5-56b5-4f77-bf95-c629b35d9868	55301179-8013-49d9-98c4-e8f593b2227f	\N
42ff8a96-b056-410c-8904-61183065c300	2023-03-10 23:14:56.528065	4fdfcd3e-c638-45cf-b90f-913de8319432	f61078d2-0e7b-4206-bfe0-21d52e48922f	\N
4359ce93-f89b-4385-abbe-2fae5c1f1be5	2023-03-10 23:14:56.528056	839f0455-e920-493d-8972-eff9657c9dfd	0c87bf10-1fdd-47a7-b7fd-ad2e4b20d146	\N
476a5e51-4384-423d-beba-b0fbf5594c35	2023-03-10 23:14:56.528081	9a95383d-9d79-498c-a7f7-62f84546d05b	1cfdc5e8-ab82-4caa-bde7-9410902b1e53	\N
4b3cfae7-99cf-4456-8994-b5a6c9039f9d	2023-03-10 23:14:56.528058	c270f162-9c7f-4e2a-a5de-5c31e399b1e3	d7cf1fb7-d791-43ef-ba1f-236a2a61027c	\N
4efb0b7b-3174-4f7f-ace5-acffe21f5dc2	2023-03-10 23:14:56.528052	6d6aec7b-514f-40ab-9b32-3fd35d83701a	cb576abe-386b-4230-ab18-28a9c2c42620	\N
51ba5d32-35d8-406d-b74f-9e6267885f0b	2023-03-10 23:14:56.528065	1a26f097-2b33-48ca-b3be-167d76f3037f	08a16178-6ef7-4c6c-9352-bd9040de4a60	\N
548704eb-dbbd-4baa-a7d7-d853cb5ae464	2023-03-10 23:14:56.528066	b8997bb1-ed32-4ba9-a20d-165429581486	af9b7439-6f3b-4413-bf17-f0659a638c6f	\N
55fc1d96-9ed8-4b4e-beaa-4f7ba87262ad	2023-03-10 23:14:56.528042	2a2faf9d-1762-4130-a9e4-758859aa5573	26c0283d-30f9-4dbc-ba4b-eb24aa36d648	\N
59c8923d-7b2d-4e17-b9cf-a2424b938369	2023-03-10 23:14:56.528041	9df4a707-5488-4ecd-8c3e-34784b249f16	226db789-1030-4a85-86fd-d53c3c873a78	\N
5aa0274e-f2b3-41f1-be51-d7db4f2d3442	2023-03-10 23:14:56.52805	145bb4fa-6f95-4e7d-bc54-fe3056173b21	eaf9478c-4dec-4557-b805-db4cfe520a8a	\N
605c4e22-c232-4a39-8765-69334f2e0843	2023-03-10 23:14:56.528052	63670e89-3516-47fd-bcda-bf9fa88df0f0	cb576abe-386b-4230-ab18-28a9c2c42620	\N
67169680-7096-4919-808a-c874b81e7525	2023-03-10 23:14:56.528049	03151827-aa7e-4d76-9cc1-3dbb70c16872	1e16937c-ca54-44fe-8a71-971599b957dd	\N
6d924ffa-3081-4c7e-aebf-cc02fce69bfc	2023-03-10 23:14:56.52808	2e67e7ac-6d79-48f8-b971-ac70a5235292	1514edf2-53ef-461a-8356-025f879eedc6	\N
70f8a708-c0a2-486d-a618-5f7a750ea4bf	2023-03-10 23:14:56.528071	3f73ab7d-efa0-4b3f-9161-9d395e0a03a3	0e357927-4fc4-41f7-88db-e0afd669b90d	\N
772d20b8-0d4c-4dd6-88ee-7e4a0f15d8cf	2023-03-10 23:14:56.528064	39e75b6a-1254-4b1c-82a4-ab1b7540ba83	953d8973-3bb1-4e2d-8024-24f4eebdd3ab	\N
778afdeb-27e0-4d72-8281-f1c7c66f72c7	2023-03-10 23:14:56.528051	7bee4553-ceca-48bb-8a65-5a5ee41efcdd	745ec398-6d89-4895-8095-44a09a3a2c97	\N
81a9fb06-8afc-43a1-ad78-4cd5cd8a73f1	2023-03-10 23:14:56.528056	f53a8cc3-098a-4e1e-8836-d2cbfd3ab429	222bd148-1d64-48b4-8ae8-74c41b0c76f9	\N
8240c67a-bb9d-4a5c-9707-d8183c21a408	2023-03-10 23:14:56.528081	a4229a5d-9165-49aa-90b0-8c02a9d095c8	8fce6bab-9045-40d4-b2cf-00b3958400ad	\N
85bfdb80-9dae-4b91-8194-71b374c33e0f	2023-03-10 23:14:56.528057	20b85095-2806-4ab1-a41f-fc7cc5cab52d	0c87bf10-1fdd-47a7-b7fd-ad2e4b20d146	\N
8b77121e-8b04-4e6d-a4d1-4ddf160d33cb	2023-03-10 23:14:56.528082	1408a448-0e11-42ad-8f99-e5f273985ebe	17caaaf4-326d-4cbd-aab1-b0156afbef23	\N
97f6b714-46bb-4b43-b725-dbde6285a368	2023-03-10 23:14:56.528079	293ce2db-c5c3-4365-8c8c-c90a5106e870	d21df084-d019-4407-a0ee-ce2f22d94df7	\N
980a99e1-c737-4c00-857f-474f45188f35	2023-03-10 23:14:56.528082	d77c0df0-52c3-43ad-ae5a-386420330b21	17caaaf4-326d-4cbd-aab1-b0156afbef23	\N
9c967729-7d14-40f0-815c-17f963113bd7	2023-03-10 23:14:56.52804	3bd45ad9-6b0a-40af-8d8e-0c001f774042	6664ff3f-cdf4-44ce-84ed-e36e77fdde80	\N
9f0727b6-d144-4e4c-8af9-1404ede854a7	2023-03-10 23:14:56.528071	d57cacb5-1e75-412e-8735-0b57c5efab64	0e357927-4fc4-41f7-88db-e0afd669b90d	\N
a1ed895b-4ec6-427b-84f7-7cb310caeb39	2023-03-10 23:14:56.528052	33d9f1fa-f480-44d5-bb8b-d0c8f312c4bd	d4fd9db3-9184-4a24-93d3-0a6074bb1399	\N
a33ba824-16bf-4816-b302-9e56ac1f5a46	2023-03-10 23:14:56.528072	0cc3eea1-3b0e-4092-ba79-e0e7c2cbb7ee	7300a0ac-65c7-40e9-90ef-091b62c221c0	\N
b2ecc9f1-2bf6-49b4-91e4-cd1b5a58fde2	2023-03-10 23:14:56.52807	6dd18897-b6da-45eb-8f44-c7cb7e7a5e57	81645bb3-bea2-4cc8-aae9-8f1f77546314	\N
b6852692-5ff6-4cf3-badb-f235503f4942	2023-03-10 23:14:56.52804	f5dd4d75-0040-4854-8799-3ba79ae0f730	6664ff3f-cdf4-44ce-84ed-e36e77fdde80	\N
c84d4521-3d7c-452d-b6fd-be11b4138c95	2023-03-10 23:14:56.528073	4e2af740-8cc1-40f7-9623-a870c68ea15f	59c8e185-7003-4f8f-b810-f5ce39412078	\N
c9ac6916-eb8f-4a89-a0f3-91af31d76fea	2023-03-10 23:14:56.52808	d35fc706-2f04-4f32-b972-796a868b0c89	a62867e4-674e-44da-817c-f07269005011	\N
ca0db55b-ee1a-4abb-9fc5-96b0400c76f0	2023-03-10 23:14:56.528072	f20516a6-ea63-4e02-8dfc-4954356f4070	3b54dbe3-9bbc-450a-ad96-a613cd4822a8	\N
cbd715a1-c8f2-44de-a690-7168623199b7	2023-03-10 23:14:56.52807	f979888f-a55a-4c27-b7f9-88e4c228a746	fdde5014-c4c7-42c3-b0dd-cf95512b5eec	\N
d3d9c20f-91ce-4952-bb7b-14e6ab651e35	2023-03-10 23:14:56.528042	f66bacfa-f734-49da-8869-b245a0a837fb	26c0283d-30f9-4dbc-ba4b-eb24aa36d648	\N
d966a3ac-9b63-43c5-805b-138750698c8d	2023-03-10 23:14:56.52808	91162205-48d1-4c91-a882-db1f43371dbe	05db06fe-43f4-4241-98f0-1ff40912b713	\N
daddfba8-4ef1-478d-b5e0-0e4235e2081d	2023-03-10 23:14:56.528056	1146bfbe-375c-495f-8f27-d04a69f45150	222bd148-1d64-48b4-8ae8-74c41b0c76f9	\N
dc0eed32-ecd9-4e70-9260-165fc4fd5601	2023-03-10 23:14:56.528079	06bf2444-0477-4452-a3ff-9364b2c96fd4	d21df084-d019-4407-a0ee-ce2f22d94df7	\N
e493fb21-c0bf-445d-9550-633d69e69526	2023-03-10 23:14:56.528064	c465d425-d72f-43cb-b7b6-a085d424a0a5	de4958a4-e618-4ba0-a699-b020af02bdd0	\N
e7282b16-3005-4218-a23a-bc145a8a3e77	2023-03-10 23:14:56.528056	445b1a15-6b7e-4077-b403-e5932f779029	bc12d1f4-1852-4a5d-a8d6-8e7fdb8ebc6c	\N
ec25e9f5-78d1-4ee9-8a80-ad1a49711389	2023-03-10 23:14:56.52807	2f3206e3-c44c-4165-b039-070a02279c6e	81645bb3-bea2-4cc8-aae9-8f1f77546314	\N
efc9938f-2926-4d64-b8d5-03adc1927a39	2023-03-10 23:14:56.528063	1e6b8b38-2a93-43c7-bc2a-8a55593c617d	d9c6f47e-abb7-4e80-a0e1-688636283564	\N
f14fc293-f888-4e21-9ce6-a7e83250b519	2023-03-10 23:14:56.528066	5fc80bb4-5397-45a9-b378-5f908fafb8b4	fdde5014-c4c7-42c3-b0dd-cf95512b5eec	\N
f233740b-8be1-4af7-8cd3-750ca62b971f	2023-03-10 23:14:56.528066	a55b6309-ff1a-436b-8aca-96f4f49f7ad9	af9b7439-6f3b-4413-bf17-f0659a638c6f	\N
f444f05d-65d0-4cad-8764-e5fdeefa910a	2023-03-10 23:14:56.528051	6555c670-bbf3-4764-a3c5-4e00d5a60187	a8a74e46-c6f1-4fce-89b9-5816d4e492da	\N
f8e4027a-90b1-4813-a8f3-0161af407b87	2023-03-10 23:14:56.52805	bb6f2bc4-d229-4fb9-8530-bfc739278524	1e16937c-ca54-44fe-8a71-971599b957dd	\N
f905bf81-32fd-4550-865b-0eca21642758	2023-03-10 23:14:56.528072	cd12e2c6-f03f-4961-a938-9cb025f43a67	3b54dbe3-9bbc-450a-ad96-a613cd4822a8	\N
fc467e5c-b461-4f2a-bc14-b405d1c0a4a7	2023-03-10 23:14:56.52805	080889dc-3bd2-492c-9ed7-71bd807c553e	eaf9478c-4dec-4557-b805-db4cfe520a8a	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
00e0b599-b975-49c8-874c-e2b2040fee4c	0	2	\N	\N	778afdeb-27e0-4d72-8281-f1c7c66f72c7	\N
01b74614-47cf-40aa-bf01-375b43367868	0	1	\N	\N	55fc1d96-9ed8-4b4e-beaa-4f7ba87262ad	\N
0604748f-7980-4fc0-bbf5-0e92affc243f	0	3	\N	\N	4359ce93-f89b-4385-abbe-2fae5c1f1be5	\N
07ea5e93-b552-4a1a-bfa9-23a40d1109d2	0	2	\N	\N	d966a3ac-9b63-43c5-805b-138750698c8d	\N
0a62c72f-61fa-487d-869f-1346e140c47f	0	1	\N	\N	8b77121e-8b04-4e6d-a4d1-4ddf160d33cb	\N
0af475a0-8127-44f2-ace5-7b04ec8d671a	0	2	\N	\N	59c8923d-7b2d-4e17-b9cf-a2424b938369	\N
0b9ee411-ec36-45d2-8c6f-cb36788f0d89	0	1	\N	\N	1c0c418c-df23-4326-bd28-4980e57f8fc6	\N
0dbaa5ef-8419-4927-8886-f98c59018b06	0	2	\N	\N	6d924ffa-3081-4c7e-aebf-cc02fce69bfc	\N
10b5aa05-6e86-4eb2-87b6-f3bd164d3b8b	0	3	\N	\N	4b3cfae7-99cf-4456-8994-b5a6c9039f9d	\N
113ea6ba-ed14-4341-a7c2-21bdad3e5e2b	0	1	\N	\N	4359ce93-f89b-4385-abbe-2fae5c1f1be5	\N
13b08ecd-c95d-4677-9a3f-91acf10184a7	0	2	\N	\N	605c4e22-c232-4a39-8765-69334f2e0843	\N
14f20109-730f-4176-83ac-cd4ab3bc77e5	0	3	\N	\N	59c8923d-7b2d-4e17-b9cf-a2424b938369	\N
1584b100-30fa-4490-a056-405984b70d7d	0	1	\N	\N	70f8a708-c0a2-486d-a618-5f7a750ea4bf	\N
178446b3-1b50-4be8-b58d-58258a5120c8	0	2	\N	\N	70f8a708-c0a2-486d-a618-5f7a750ea4bf	\N
195e4cfa-4e57-4096-8b7b-c247655b5b09	0	1	\N	\N	42ff8a96-b056-410c-8904-61183065c300	\N
1a2f319a-aa3d-48b5-b56b-4670dd626b0d	0	3	\N	\N	a33ba824-16bf-4816-b302-9e56ac1f5a46	\N
1b2f095a-c5c4-4ae0-be10-436556cffb5e	0	2	\N	\N	67169680-7096-4919-808a-c874b81e7525	\N
1b54d92a-c6ba-459c-8359-50ceca11dfd3	0	3	\N	\N	9f0727b6-d144-4e4c-8af9-1404ede854a7	\N
1e8e2b4f-6d60-40ad-a1af-04b1dd98adbb	0	3	\N	\N	9c967729-7d14-40f0-815c-17f963113bd7	\N
1fdaf5ec-b621-40a2-bad4-3dffd6f0e090	0	3	\N	\N	dc0eed32-ecd9-4e70-9260-165fc4fd5601	\N
215b24d0-c194-4de0-96d2-2697f3cc5945	0	1	\N	\N	dc0eed32-ecd9-4e70-9260-165fc4fd5601	\N
221ad8a8-6e18-4853-a6c7-d9bc074318aa	0	1	\N	\N	6d924ffa-3081-4c7e-aebf-cc02fce69bfc	\N
23dc44cb-663f-4a30-8d35-9ea02000abe8	0	2	\N	\N	daddfba8-4ef1-478d-b5e0-0e4235e2081d	\N
24e1a0a5-214d-45f5-aae3-42ef53fd378b	0	3	\N	\N	81a9fb06-8afc-43a1-ad78-4cd5cd8a73f1	\N
250b6dde-c4ef-4988-91b5-6d086e685568	0	3	\N	\N	1c0c418c-df23-4326-bd28-4980e57f8fc6	\N
28942aac-bfcf-4e5b-a8a0-1cd7ab1f7d91	0	1	\N	\N	4efb0b7b-3174-4f7f-ace5-acffe21f5dc2	\N
28e163e0-64a7-480a-a913-77ddc47f0d58	0	1	\N	\N	476a5e51-4384-423d-beba-b0fbf5594c35	\N
29e10303-98b5-4459-87a9-9f05d1084614	0	1	\N	\N	81a9fb06-8afc-43a1-ad78-4cd5cd8a73f1	\N
2de65e56-6577-4f67-a9c6-0cdcd744e19d	0	2	\N	\N	b2ecc9f1-2bf6-49b4-91e4-cd1b5a58fde2	\N
30a157db-5d0e-412c-bc1e-acc3dd44d7ee	0	3	\N	\N	605c4e22-c232-4a39-8765-69334f2e0843	\N
320f751d-bc4b-49bd-8a45-ef58a7bf1baa	0	3	\N	\N	b2ecc9f1-2bf6-49b4-91e4-cd1b5a58fde2	\N
33f2113f-54bd-4fab-91d2-d1fed0fb203d	0	1	\N	\N	2f37f7f7-dd21-4bb9-a23e-49f50917b037	\N
3488769c-41be-4524-95f2-ab5de4d5251c	0	1	\N	\N	85bfdb80-9dae-4b91-8194-71b374c33e0f	\N
34fae354-c32e-4b33-8078-02a48e4d59ea	0	3	\N	\N	daddfba8-4ef1-478d-b5e0-0e4235e2081d	\N
35fb6c2b-7d6a-4e6e-99d6-a07e9e5702c9	0	2	\N	\N	476a5e51-4384-423d-beba-b0fbf5594c35	\N
362b70ef-7c66-4875-9ad5-e92712203a6b	0	1	\N	\N	0c306628-563a-4714-ad3c-5432c8f29bae	\N
37289cff-03c9-4957-acfe-65f8ab23f33e	0	2	\N	\N	ec25e9f5-78d1-4ee9-8a80-ad1a49711389	\N
37860d9e-52c0-4e92-8fa6-0526b883f574	0	2	\N	\N	c84d4521-3d7c-452d-b6fd-be11b4138c95	\N
3794c7c1-bacb-4c67-bb64-fb844d3ffa31	0	3	\N	\N	c9ac6916-eb8f-4a89-a0f3-91af31d76fea	\N
383838dd-b953-49fb-bf12-2fd99f6f985a	0	3	\N	\N	a1ed895b-4ec6-427b-84f7-7cb310caeb39	\N
38512697-a7a5-45d1-838f-5d20d294fa80	0	2	\N	\N	f8e4027a-90b1-4813-a8f3-0161af407b87	\N
3976061e-324c-4a2e-a1be-e4d69d18abd5	0	2	\N	\N	8b77121e-8b04-4e6d-a4d1-4ddf160d33cb	\N
3b92726d-27ec-4031-b75d-d15cce598d00	0	3	\N	\N	42ff8a96-b056-410c-8904-61183065c300	\N
3c5a8ebf-da4a-4d53-8726-839798abeee2	0	2	\N	\N	81a9fb06-8afc-43a1-ad78-4cd5cd8a73f1	\N
3d09b310-4f03-4658-834a-5d964e09bba1	0	1	\N	\N	f14fc293-f888-4e21-9ce6-a7e83250b519	\N
3d8e048b-75a1-4257-834d-d14cbf9ee205	0	3	\N	\N	70f8a708-c0a2-486d-a618-5f7a750ea4bf	\N
41c18364-3743-4a0a-be89-420fcf3629cf	0	2	\N	\N	31544248-f61f-4428-9e36-fcdcf4505efa	\N
43986cfc-4898-4a77-8d53-8a7963030ed2	0	1	\N	\N	59c8923d-7b2d-4e17-b9cf-a2424b938369	\N
4485d041-610f-48e9-9fcb-7547f586770f	0	1	\N	\N	97f6b714-46bb-4b43-b725-dbde6285a368	\N
485c8b41-6e74-4334-8c2f-944b6748dac8	0	2	\N	\N	ca0db55b-ee1a-4abb-9fc5-96b0400c76f0	\N
4fd63ad3-d8b6-4c3f-b438-ddf87313e691	0	1	\N	\N	5aa0274e-f2b3-41f1-be51-d7db4f2d3442	\N
51742f50-9ed5-4aa4-8eec-d579ad040e09	0	2	\N	\N	0c306628-563a-4714-ad3c-5432c8f29bae	\N
527785bb-d234-4d15-9367-8b98fcf6a0ab	0	1	\N	\N	efc9938f-2926-4d64-b8d5-03adc1927a39	\N
52b81709-beda-4997-b018-8f4eca813dc1	0	2	\N	\N	55fc1d96-9ed8-4b4e-beaa-4f7ba87262ad	\N
52cb7ce6-3b2f-4c1c-92e3-9b7bcecf999a	0	2	\N	\N	548704eb-dbbd-4baa-a7d7-d853cb5ae464	\N
53b92c0e-b615-450b-91d1-f27ee8d85418	0	1	\N	\N	4b3cfae7-99cf-4456-8994-b5a6c9039f9d	\N
54592110-bcd6-47ce-8d44-6687c987082e	0	3	\N	\N	f233740b-8be1-4af7-8cd3-750ca62b971f	\N
59193ad7-e0c0-4dc6-bf8b-e50d3de166f7	0	3	\N	\N	cbd715a1-c8f2-44de-a690-7168623199b7	\N
5a426775-3884-45e4-a3ef-e9ef2c6d669c	0	3	\N	\N	d966a3ac-9b63-43c5-805b-138750698c8d	\N
5bf1721a-32db-416a-bf49-ab34cc13e683	0	2	\N	\N	a33ba824-16bf-4816-b302-9e56ac1f5a46	\N
5d3b5a35-b409-4e2c-9678-17af58af9730	0	1	\N	\N	980a99e1-c737-4c00-857f-474f45188f35	\N
5fcd9bc1-c4e8-46ed-9a67-90039ea4739a	0	1	\N	\N	daddfba8-4ef1-478d-b5e0-0e4235e2081d	\N
63c7340e-5fb6-4f30-b592-51e572b9aacc	0	2	\N	\N	97f6b714-46bb-4b43-b725-dbde6285a368	\N
64fc3515-4cfe-4ce3-9346-d2e7710ac684	0	2	\N	\N	51ba5d32-35d8-406d-b74f-9e6267885f0b	\N
68c8c1be-135a-40ff-bf16-1aaa3e42e80a	0	3	\N	\N	e7282b16-3005-4218-a23a-bc145a8a3e77	\N
68ca7102-7871-471e-8646-753b9c98dd71	0	1	\N	\N	38898852-760c-4238-a722-c45632722078	\N
72c517bd-bff2-4393-91c3-7a629c54f196	0	1	\N	\N	51ba5d32-35d8-406d-b74f-9e6267885f0b	\N
735473fd-3e48-4384-815c-85eba393463c	0	1	\N	\N	3f67a24f-2c66-4764-9dfc-e8aae7ca6453	\N
75c2b2e9-5d48-4aaf-ba43-52f7ca559e95	0	2	\N	\N	b6852692-5ff6-4cf3-badb-f235503f4942	\N
764f0953-44a7-46d9-b719-4307dcd7e6e1	0	3	\N	\N	8b77121e-8b04-4e6d-a4d1-4ddf160d33cb	\N
770c1128-01b4-40f7-aa93-41dc91b5889f	0	2	\N	\N	1c0c418c-df23-4326-bd28-4980e57f8fc6	\N
78f3becb-466e-4e52-9883-770354a513b5	0	1	\N	\N	b2ecc9f1-2bf6-49b4-91e4-cd1b5a58fde2	\N
7a39b18e-e2d8-49f1-80c7-1e235522aece	0	2	\N	\N	4efb0b7b-3174-4f7f-ace5-acffe21f5dc2	\N
7a82ce36-fd03-4cf1-bb20-6284d3d8a704	0	3	\N	\N	f905bf81-32fd-4550-865b-0eca21642758	\N
7b64a0af-8edd-4b51-9b81-1c190057633d	0	2	\N	\N	d3d9c20f-91ce-4952-bb7b-14e6ab651e35	\N
81461eb5-7e6c-4062-bb6b-3a30b9c0b55b	0	3	\N	\N	38898852-760c-4238-a722-c45632722078	\N
843b6623-dada-45fe-b966-3af7a260c450	0	2	\N	\N	42ff8a96-b056-410c-8904-61183065c300	\N
84f0e1ef-6db1-498b-92ca-526624706a70	0	3	\N	\N	ca0db55b-ee1a-4abb-9fc5-96b0400c76f0	\N
85015056-4199-4121-a4bd-504ec6c3b0c6	0	3	\N	\N	fc467e5c-b461-4f2a-bc14-b405d1c0a4a7	\N
85b481f5-973d-45c3-9ab7-7caf6e2121f5	0	2	\N	\N	9c967729-7d14-40f0-815c-17f963113bd7	\N
86afe099-cda3-4202-bab2-8c5f3a5856e9	0	2	\N	\N	dc0eed32-ecd9-4e70-9260-165fc4fd5601	\N
86bd1ba1-4724-42a1-8aff-73c6d61973dc	0	1	\N	\N	8240c67a-bb9d-4a5c-9707-d8183c21a408	\N
87bf7053-8f03-40a7-bd6f-768b4569aebe	0	1	\N	\N	f905bf81-32fd-4550-865b-0eca21642758	\N
8992aa8c-5c3c-49e0-9d19-2f7079fef6ff	0	2	\N	\N	e493fb21-c0bf-445d-9550-633d69e69526	\N
8c25863f-d830-43f3-97dc-d96783ea5abc	0	2	\N	\N	f14fc293-f888-4e21-9ce6-a7e83250b519	\N
8c3e9fd5-945e-4343-ac42-b8b512820b0a	0	3	\N	\N	51ba5d32-35d8-406d-b74f-9e6267885f0b	\N
8f2e5eb4-f4a9-4c19-af9e-cd9a154d38e6	0	3	\N	\N	efc9938f-2926-4d64-b8d5-03adc1927a39	\N
90425504-f5f1-4b99-afc4-a5eec1bcd06e	0	3	\N	\N	f444f05d-65d0-4cad-8764-e5fdeefa910a	\N
92ed83e2-633d-4400-9b8f-48efefef9ed9	0	2	\N	\N	efc9938f-2926-4d64-b8d5-03adc1927a39	\N
957eb4f9-94f1-43ad-a439-2266ab9ad2d3	0	1	\N	\N	b6852692-5ff6-4cf3-badb-f235503f4942	\N
95bec093-75a5-4615-8374-8e6b73b94ef2	0	1	\N	\N	9c967729-7d14-40f0-815c-17f963113bd7	\N
96549540-fe66-4fe9-8fbc-c2e84670d8dd	0	2	\N	\N	85bfdb80-9dae-4b91-8194-71b374c33e0f	\N
983616f5-6ec2-4525-bd30-0c2a3db8c28d	0	1	\N	\N	f8e4027a-90b1-4813-a8f3-0161af407b87	\N
98b2df92-0105-4cc9-a8da-3e9568944f14	0	3	\N	\N	b6852692-5ff6-4cf3-badb-f235503f4942	\N
9abb59f3-67ef-4e62-906f-8a58eeeb0e71	0	1	\N	\N	31544248-f61f-4428-9e36-fcdcf4505efa	\N
9caa3934-c709-48e5-acd9-107d7643ce6a	0	3	\N	\N	778afdeb-27e0-4d72-8281-f1c7c66f72c7	\N
9d5be501-3f03-4b9d-9664-03e319a39d3d	0	3	\N	\N	55fc1d96-9ed8-4b4e-beaa-4f7ba87262ad	\N
a0dcf06d-d7c5-4e36-b745-df530f34fbcf	0	1	\N	\N	d966a3ac-9b63-43c5-805b-138750698c8d	\N
a1ffc391-7f83-4404-ab84-74eebb80dbfa	0	1	\N	\N	c9ac6916-eb8f-4a89-a0f3-91af31d76fea	\N
a2cfcade-3c2c-4b48-bcd9-c8c1fc457996	0	2	\N	\N	a1ed895b-4ec6-427b-84f7-7cb310caeb39	\N
a4f5e0ca-e668-4d29-a3d0-06166bd250ee	0	2	\N	\N	38898852-760c-4238-a722-c45632722078	\N
a6aab491-6bb3-4654-8f9a-1786b13a477b	0	3	\N	\N	980a99e1-c737-4c00-857f-474f45188f35	\N
a7f76e7a-b1a0-4701-a23a-ea8944d1b09f	0	2	\N	\N	cbd715a1-c8f2-44de-a690-7168623199b7	\N
ab744fd4-efe7-4415-8037-5ef8fa56dc10	0	1	\N	\N	f444f05d-65d0-4cad-8764-e5fdeefa910a	\N
abdd713d-87bc-46a2-8320-b9734001b371	0	3	\N	\N	4efb0b7b-3174-4f7f-ace5-acffe21f5dc2	\N
ae758b7b-037b-4ffa-b39b-5003a811721f	0	2	\N	\N	980a99e1-c737-4c00-857f-474f45188f35	\N
b164c09d-8ce6-4ef6-8ba5-d08b6e98bf57	0	1	\N	\N	67169680-7096-4919-808a-c874b81e7525	\N
b1894154-2d7c-482b-ab58-45002cfa740e	0	2	\N	\N	4359ce93-f89b-4385-abbe-2fae5c1f1be5	\N
b199839d-356a-4f7a-bd77-72ab2b26dea9	0	3	\N	\N	2f37f7f7-dd21-4bb9-a23e-49f50917b037	\N
b26b9f74-8781-401a-93ef-20dadd2e83cf	0	3	\N	\N	5aa0274e-f2b3-41f1-be51-d7db4f2d3442	\N
b26ba75e-5d2b-4975-b1dd-1f08f48053d2	0	1	\N	\N	c84d4521-3d7c-452d-b6fd-be11b4138c95	\N
b28a9951-f71c-4bc8-95d6-5784f0709a8a	0	2	\N	\N	772d20b8-0d4c-4dd6-88ee-7e4a0f15d8cf	\N
b3957df5-c493-4022-82cb-f8277481a318	0	1	\N	\N	9f0727b6-d144-4e4c-8af9-1404ede854a7	\N
b6c37bef-df0a-48b4-9555-5d635b4a91f0	0	2	\N	\N	c9ac6916-eb8f-4a89-a0f3-91af31d76fea	\N
b74537ed-b844-41e0-bb24-cc71dafdd9b9	0	1	\N	\N	d3d9c20f-91ce-4952-bb7b-14e6ab651e35	\N
ba432daf-3d90-48e8-8698-a11acbae2c0f	0	1	\N	\N	548704eb-dbbd-4baa-a7d7-d853cb5ae464	\N
bab19031-23f9-4651-8674-bee0b1a1a4de	0	1	\N	\N	a33ba824-16bf-4816-b302-9e56ac1f5a46	\N
bbb31fc9-1960-4151-bd93-907f21d8cb0f	0	1	\N	\N	e7282b16-3005-4218-a23a-bc145a8a3e77	\N
bbe56638-4ebe-4c9c-9004-b442898750a1	0	3	\N	\N	e493fb21-c0bf-445d-9550-633d69e69526	\N
c133bec8-57a6-4b5e-9d18-eb652a3ac4da	0	2	\N	\N	fc467e5c-b461-4f2a-bc14-b405d1c0a4a7	\N
c2149081-5102-4023-b1a2-b765beb0c279	0	2	\N	\N	f233740b-8be1-4af7-8cd3-750ca62b971f	\N
c3099ff3-01f4-44e2-9965-0fa98c4be4cc	0	3	\N	\N	d3d9c20f-91ce-4952-bb7b-14e6ab651e35	\N
c35efdf6-91b3-4c73-ace9-a36bea824c70	0	2	\N	\N	f905bf81-32fd-4550-865b-0eca21642758	\N
c8be823d-67f5-4d7a-907e-67600eb58e4e	0	1	\N	\N	772d20b8-0d4c-4dd6-88ee-7e4a0f15d8cf	\N
cd555f08-1f3d-4a3a-9793-8694472ef414	0	3	\N	\N	f14fc293-f888-4e21-9ce6-a7e83250b519	\N
cf1e41d8-08f8-46c1-905c-e39f6a232e26	0	1	\N	\N	ec25e9f5-78d1-4ee9-8a80-ad1a49711389	\N
cfd6e4cd-0069-4fa4-9028-bfee4a3d6f2a	0	1	\N	\N	cbd715a1-c8f2-44de-a690-7168623199b7	\N
cfd7e969-f04f-4e86-aaf7-efaee0ca76b5	0	3	\N	\N	3f67a24f-2c66-4764-9dfc-e8aae7ca6453	\N
d03453a7-c657-47aa-a32c-3b4c89a188e0	0	3	\N	\N	85bfdb80-9dae-4b91-8194-71b374c33e0f	\N
d227917d-cf18-48b2-9ef4-999164656031	0	3	\N	\N	8240c67a-bb9d-4a5c-9707-d8183c21a408	\N
d431f058-dc13-48b1-9894-33d89a612e56	0	2	\N	\N	2f37f7f7-dd21-4bb9-a23e-49f50917b037	\N
d88ea3b4-29ee-4e1c-973f-b02effec9992	0	3	\N	\N	67169680-7096-4919-808a-c874b81e7525	\N
da7ed67c-c204-4307-a1fa-a7c7ad546a60	0	3	\N	\N	0c306628-563a-4714-ad3c-5432c8f29bae	\N
dc0f1cf3-0e06-4ecf-8d1d-f41e7c92973c	0	2	\N	\N	e7282b16-3005-4218-a23a-bc145a8a3e77	\N
de35ecd9-6690-49a0-9016-9a96caba08a3	0	2	\N	\N	5aa0274e-f2b3-41f1-be51-d7db4f2d3442	\N
de5584b6-b186-44b7-9ef7-412518111539	0	1	\N	\N	e493fb21-c0bf-445d-9550-633d69e69526	\N
deae49f8-de07-4e07-94a6-36212ea68653	0	2	\N	\N	4b3cfae7-99cf-4456-8994-b5a6c9039f9d	\N
deaff99c-af9d-4163-9d7f-8e64741e1319	0	2	\N	\N	8240c67a-bb9d-4a5c-9707-d8183c21a408	\N
e1678ad7-4d22-4ffc-9829-e91aad31fc72	0	3	\N	\N	31544248-f61f-4428-9e36-fcdcf4505efa	\N
e2448908-8789-4a22-a04e-99b203ec99b5	0	1	\N	\N	fc467e5c-b461-4f2a-bc14-b405d1c0a4a7	\N
e3894aa5-8ac2-4c01-9280-68c6fd61686d	0	3	\N	\N	97f6b714-46bb-4b43-b725-dbde6285a368	\N
e690595f-f1f3-45e4-95ea-d328150c801d	0	3	\N	\N	548704eb-dbbd-4baa-a7d7-d853cb5ae464	\N
e77a87cd-de0c-4ac1-8fc4-d9b0560498f6	0	1	\N	\N	605c4e22-c232-4a39-8765-69334f2e0843	\N
e908d949-49eb-4270-8624-550d30e63ef3	0	2	\N	\N	f444f05d-65d0-4cad-8764-e5fdeefa910a	\N
eb5526f1-f933-4256-b5c6-a03ede6a8f6d	0	3	\N	\N	ec25e9f5-78d1-4ee9-8a80-ad1a49711389	\N
eb78b614-c0a0-411d-90c3-92ea0b18621c	0	1	\N	\N	a1ed895b-4ec6-427b-84f7-7cb310caeb39	\N
ed1fc603-65f6-42c5-8504-7b6e344aa069	0	2	\N	\N	9f0727b6-d144-4e4c-8af9-1404ede854a7	\N
ee31c6fe-0312-45ad-ac91-f1db4ad54dfa	0	3	\N	\N	6d924ffa-3081-4c7e-aebf-cc02fce69bfc	\N
f0189dc2-2158-4853-b577-aa37aa9d0a0d	0	2	\N	\N	3f67a24f-2c66-4764-9dfc-e8aae7ca6453	\N
f09c78e3-586d-481c-a664-f289b17ee6d7	0	3	\N	\N	f8e4027a-90b1-4813-a8f3-0161af407b87	\N
f43332c8-6c6f-4b41-acf5-5fac3f2ef681	0	1	\N	\N	778afdeb-27e0-4d72-8281-f1c7c66f72c7	\N
f86b648b-51bc-494e-ae0a-5f73405686ff	0	1	\N	\N	ca0db55b-ee1a-4abb-9fc5-96b0400c76f0	\N
f9eaed1f-f25d-4ad8-87ff-402745b52525	0	3	\N	\N	c84d4521-3d7c-452d-b6fd-be11b4138c95	\N
fa458711-1e04-44a3-83a1-0d7b84353697	0	1	\N	\N	f233740b-8be1-4af7-8cd3-750ca62b971f	\N
fdd5d70b-f6b1-4fc6-891a-9c2927ffec5a	0	3	\N	\N	772d20b8-0d4c-4dd6-88ee-7e4a0f15d8cf	\N
fe703c6f-e095-40e8-98e5-b6f5beeee3fc	0	3	\N	\N	476a5e51-4384-423d-beba-b0fbf5594c35	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
03151827-aa7e-4d76-9cc1-3dbb70c16872	1	1900	t	f	2488b278-fb9b-446f-8dfc-d7a6f95728c1	ee078121-bff0-431f-a69c-8f192bcc6675	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
06bf2444-0477-4452-a3ff-9364b2c96fd4	58	900	t	f	eb176e0e-2050-4745-b4f1-4ca9039a8e57	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
080889dc-3bd2-492c-9ed7-71bd807c553e	39	280	t	f	38b89d50-ac0d-4f82-b10b-ed0d8e9679ef	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
0cc3eea1-3b0e-4092-ba79-e0e7c2cbb7ee	2	1880	t	f	df00b57e-0155-463e-b722-4d0f10e4faf6	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
1146bfbe-375c-495f-8f27-d04a69f45150	39	280	t	f	5c155db4-a768-4388-8a52-c55879f73dc1	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
1364fc88-e36e-4dae-8670-7efa859cd6a8	52	1200	t	f	009d4f87-398c-4ef4-8c63-a61531de8a93	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
1408a448-0e11-42ad-8f99-e5f273985ebe	58	900	t	f	fe3e5438-f142-493e-be70-cb6082d35b3f	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
145bb4fa-6f95-4e7d-bc54-fe3056173b21	18	4000	t	f	38b89d50-ac0d-4f82-b10b-ed0d8e9679ef	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
161b0297-2279-4d84-ab15-90e70b2464f5	55	400	t	f	a7a94cfe-e77d-4f43-a5b8-359b66f84375	a0fd7ba0-1c97-496f-9c0d-348927193c52	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
1a26f097-2b33-48ca-b3be-167d76f3037f	52	1200	t	f	b110afa5-67e6-4c0c-9e28-7469ffeabda8	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
1e6b8b38-2a93-43c7-bc2a-8a55593c617d	39	280	t	f	8c901281-df98-401f-82a8-b6a7b252b2f8	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
20b85095-2806-4ab1-a41f-fc7cc5cab52d	58	900	t	f	82eaa3fe-4d2d-46f8-a998-040dc2387853	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
293ce2db-c5c3-4365-8c8c-c90a5106e870	57	400	t	f	eb176e0e-2050-4745-b4f1-4ca9039a8e57	e3e8b77c-4e9b-4fdb-b1bd-335cffe6eee9	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
2a2faf9d-1762-4130-a9e4-758859aa5573	18	4000	t	f	1b4be289-7b84-4e6c-9eec-7a51c017e208	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
2e67e7ac-6d79-48f8-b971-ac70a5235292	52	1200	t	f	ec1f3142-dcc0-4e26-b37b-5b9044ede4da	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
2f3206e3-c44c-4165-b039-070a02279c6e	58	900	t	f	d7489780-9a63-4e66-a823-dad82fd9f0f4	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
33d9f1fa-f480-44d5-bb8b-d0c8f312c4bd	48	1900	t	f	4b6c5bb0-bb72-4149-a3dd-f16874277f36	0a23d10a-5c92-45b4-a5ef-f172829a8cb7	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
39e75b6a-1254-4b1c-82a4-ab1b7540ba83	58	900	t	f	a7a94cfe-e77d-4f43-a5b8-359b66f84375	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
3bd45ad9-6b0a-40af-8d8e-0c001f774042	58	900	t	f	03eb442f-e104-4158-bc8b-ec56e3ec3043	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
3d0530a5-56b5-4f77-bf95-c629b35d9868	39	280	t	f	c5347b33-c8b5-4eb4-afd7-91557efd3933	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
3f73ab7d-efa0-4b3f-9161-9d395e0a03a3	1	1900	t	f	da0bc3e7-053d-486c-b9c3-2cb4062e8d05	ee078121-bff0-431f-a69c-8f192bcc6675	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
41e2260c-b836-4805-8532-bd54b0e09d46	2	1880	t	f	460f1465-b655-40e9-b185-2ffe8e5e4603	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
445b1a15-6b7e-4077-b403-e5932f779029	2	1880	t	f	7384c89a-3c53-433c-b22f-0ee77267fc03	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
4e2af740-8cc1-40f7-9623-a870c68ea15f	48	1900	t	f	e11582c1-81a8-4a7d-a66a-6fe1aafc9672	0a23d10a-5c92-45b4-a5ef-f172829a8cb7	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
4fdfcd3e-c638-45cf-b90f-913de8319432	39	280	t	f	be7931fb-8f2e-47f4-ac3b-1c6b3a7c7856	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
5fc80bb4-5397-45a9-b378-5f908fafb8b4	1	1900	t	f	d483b0d1-3b2d-4c3a-8128-dae8c2ea9a7c	ee078121-bff0-431f-a69c-8f192bcc6675	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
63670e89-3516-47fd-bcda-bf9fa88df0f0	18	4000	t	f	56140d8d-0c5c-4f3f-bbab-998bcdfe9ec0	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
6555c670-bbf3-4764-a3c5-4e00d5a60187	1	1900	t	f	460f1465-b655-40e9-b185-2ffe8e5e4603	ee078121-bff0-431f-a69c-8f192bcc6675	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
6d6aec7b-514f-40ab-9b32-3fd35d83701a	39	280	t	f	56140d8d-0c5c-4f3f-bbab-998bcdfe9ec0	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
6dd18897-b6da-45eb-8f44-c7cb7e7a5e57	56	400	t	f	d7489780-9a63-4e66-a823-dad82fd9f0f4	e595df02-1049-479b-b6ad-aa2272d959f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
7bee4553-ceca-48bb-8a65-5a5ee41efcdd	52	1200	t	f	46b76c9d-422c-4179-a92e-7fc921444321	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
839f0455-e920-493d-8972-eff9657c9dfd	54	400	t	f	82eaa3fe-4d2d-46f8-a998-040dc2387853	07f714a7-4253-4126-aa02-bb5a503a989e	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
91162205-48d1-4c91-a882-db1f43371dbe	52	1200	t	f	eb475e6a-b43a-423c-80ad-fe6bf3045f60	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
9a95383d-9d79-498c-a7f7-62f84546d05b	18	4000	t	f	fbccbbed-b1ca-47a7-8c79-eb5f4b56e10b	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
9d6a6f6d-a100-4720-85cf-e6357bc15971	39	280	t	f	21907246-4ea8-4c14-a2ba-31f23e3e6c86	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
9df4a707-5488-4ecd-8c3e-34784b249f16	2	1880	t	f	15c61c86-89bd-46e5-8ccd-43323e9a49c0	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
a4229a5d-9165-49aa-90b0-8c02a9d095c8	18	4000	t	f	f2b295f5-d48a-47d8-90de-6ba93394938d	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
a55b6309-ff1a-436b-8aca-96f4f49f7ad9	58	900	t	f	c9153e52-8141-46af-bb32-5f3f7a2f83d5	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
b8997bb1-ed32-4ba9-a20d-165429581486	55	400	t	f	c9153e52-8141-46af-bb32-5f3f7a2f83d5	a0fd7ba0-1c97-496f-9c0d-348927193c52	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
bb6f2bc4-d229-4fb9-8530-bfc739278524	2	1880	t	f	2488b278-fb9b-446f-8dfc-d7a6f95728c1	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
c270f162-9c7f-4e2a-a5de-5c31e399b1e3	2	1880	t	f	84482cdb-dfac-40fb-9588-290671a272b5	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
c465d425-d72f-43cb-b7b6-a085d424a0a5	39	280	t	f	a92708c6-0e93-4a02-bc96-7a841779b22e	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
cd12e2c6-f03f-4961-a938-9cb025f43a67	58	900	t	f	dd2e80be-f1be-4655-bc90-f4b217d5dc7c	de31df3a-74a8-4343-af75-62dbb20e9d60	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
d35fc706-2f04-4f32-b972-796a868b0c89	52	1200	t	f	ee0decb6-616e-4f9d-a6a6-f1465ab3459a	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
d57cacb5-1e75-412e-8735-0b57c5efab64	2	1880	t	f	da0bc3e7-053d-486c-b9c3-2cb4062e8d05	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
d77c0df0-52c3-43ad-ae5a-386420330b21	56	400	t	f	fe3e5438-f142-493e-be70-cb6082d35b3f	e595df02-1049-479b-b6ad-aa2272d959f0	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
f20516a6-ea63-4e02-8dfc-4954356f4070	57	400	t	f	dd2e80be-f1be-4655-bc90-f4b217d5dc7c	e3e8b77c-4e9b-4fdb-b1bd-335cffe6eee9	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
f3e225da-9a61-4d7e-929f-2e2b23e09a0d	39	280	t	f	83d3dbb3-6bb0-4dfc-9645-1ce82daed7a7	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
f53a8cc3-098a-4e1e-8836-d2cbfd3ab429	18	4000	t	f	5c155db4-a768-4388-8a52-c55879f73dc1	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
f5dd4d75-0040-4854-8799-3ba79ae0f730	54	400	t	f	03eb442f-e104-4158-bc8b-ec56e3ec3043	07f714a7-4253-4126-aa02-bb5a503a989e	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
f66bacfa-f734-49da-8869-b245a0a837fb	39	280	t	f	1b4be289-7b84-4e6c-9eec-7a51c017e208	b8deb78c-01f8-42b5-a358-f84a1139df53	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
f979888f-a55a-4c27-b7f9-88e4c228a746	2	1880	t	f	d483b0d1-3b2d-4c3a-8128-dae8c2ea9a7c	d3c7d170-8c05-490c-8906-15bc89559bc5	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
07f714a7-4253-4126-aa02-bb5a503a989e	54	Инструкция 54	54
0a23d10a-5c92-45b4-a5ef-f172829a8cb7	48	Инструкция 48	48
3f337b43-47a4-466a-a13d-8cc959c87ce3	18	Инструкция 18	18
a0fd7ba0-1c97-496f-9c0d-348927193c52	55	Инструкция 55	55
b8deb78c-01f8-42b5-a358-f84a1139df53	39	Инструкция 39	39
d3c7d170-8c05-490c-8906-15bc89559bc5	2	Инструкция 2	2
de31df3a-74a8-4343-af75-62dbb20e9d60	58	Инструкция 58	58
e3e8b77c-4e9b-4fdb-b1bd-335cffe6eee9	57	Инструкция 57	57
e595df02-1049-479b-b6ad-aa2272d959f0	56	Инструкция 56	56
ee078121-bff0-431f-a69c-8f192bcc6675	1	Инструкция 1	1
f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
58309db6-6844-4e29-bfe0-23465c0bfc8b	75131-2801300-20	Поперечина рамы задняя	\N	2868425
9a361d35-5b8c-4bcf-a8a7-d17b2bd6d9c0	7513D-2800010-20	Рама	\N	3330041
cd80ca48-9f31-45b2-a029-3d45ce3aa2a1	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
27f7beca-a05d-4080-a8c4-804c6a241146	cd99cb8c-e1c8-4f3f-9a26-ac8f101126ec
2f5a77b1-6d62-498a-b473-f02b0852012e	cd99cb8c-e1c8-4f3f-9a26-ac8f101126ec
b14ecf4d-a1a4-4230-97c8-7b0bd322cf8b	68680f1f-ea6f-432a-9dc8-25b14fdc89df
f2792a8d-4642-47a5-a29c-7a4db14a578c	68680f1f-ea6f-432a-9dc8-25b14fdc89df
1205cbbe-54b5-4f59-833e-82c7d50fd980	fa47b46c-3dea-490e-b1e6-d605b4905ab7
18d518ec-bffc-438a-9044-147bbb646b0b	fa47b46c-3dea-490e-b1e6-d605b4905ab7
232175b6-7a3c-4268-b1f5-51760a6e8f0d	fa47b46c-3dea-490e-b1e6-d605b4905ab7
5313942c-5820-4f35-8673-1280042fef14	fa47b46c-3dea-490e-b1e6-d605b4905ab7
74f846dd-7876-4059-9fe5-6975ada42312	fa47b46c-3dea-490e-b1e6-d605b4905ab7
b8dfd46d-f682-49eb-96fa-7ee013431e98	fa47b46c-3dea-490e-b1e6-d605b4905ab7
bd70ebf8-546b-47b2-b7cc-46f28a8756fe	fa47b46c-3dea-490e-b1e6-d605b4905ab7
c408a8d5-0615-4069-8235-f365731025db	fa47b46c-3dea-490e-b1e6-d605b4905ab7
75b27381-5a65-48f3-875f-bcfc2dc07e87	0b67cab7-1872-4b13-af0e-3a247b3473ae
a44a513d-1b93-4ccf-a5e3-ec80b96f674b	55564890-3af8-4b1d-9d6d-b0866f4ebed0
2340e1ad-08ec-4f26-86f1-0ea08a52ba20	fa47b46c-3dea-490e-b1e6-d605b4905ab7
b61f8917-a629-487c-99d7-b805470ae13a	cd99cb8c-e1c8-4f3f-9a26-ac8f101126ec
fd882f4e-0b95-478c-bd85-12570428e6b3	0b67cab7-1872-4b13-af0e-3a247b3473ae
c388c798-3daf-4cd8-859a-f94c0cce4d8f	68680f1f-ea6f-432a-9dc8-25b14fdc89df
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
27f7beca-a05d-4080-a8c4-804c6a241146	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N
2f5a77b1-6d62-498a-b473-f02b0852012e	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N
b14ecf4d-a1a4-4230-97c8-7b0bd322cf8b	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N
f2792a8d-4642-47a5-a29c-7a4db14a578c	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N
1205cbbe-54b5-4f59-833e-82c7d50fd980	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	713c7350-c94f-4015-9ee4-7158b316a50d	\N
18d518ec-bffc-438a-9044-147bbb646b0b	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	713c7350-c94f-4015-9ee4-7158b316a50d	\N
232175b6-7a3c-4268-b1f5-51760a6e8f0d	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	713c7350-c94f-4015-9ee4-7158b316a50d	\N
5313942c-5820-4f35-8673-1280042fef14	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	713c7350-c94f-4015-9ee4-7158b316a50d	\N
74f846dd-7876-4059-9fe5-6975ada42312	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	713c7350-c94f-4015-9ee4-7158b316a50d	\N
b8dfd46d-f682-49eb-96fa-7ee013431e98	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	713c7350-c94f-4015-9ee4-7158b316a50d	\N
bd70ebf8-546b-47b2-b7cc-46f28a8756fe	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	713c7350-c94f-4015-9ee4-7158b316a50d	\N
c408a8d5-0615-4069-8235-f365731025db	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	713c7350-c94f-4015-9ee4-7158b316a50d	\N
75b27381-5a65-48f3-875f-bcfc2dc07e87	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
a44a513d-1b93-4ccf-a5e3-ec80b96f674b	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$cZuI5+QLHe58aQsMOkI1bvmJuBwkge8AXnJdGA0crTuxVQjq	\N	\N	\N	\N	\N	\N
2340e1ad-08ec-4f26-86f1-0ea08a52ba20	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$62tBqr4O+y0bf9Ne4FfewBoEbBxvHRK+gAy9IJnXCL4InFbZ	\N	\N	\N	\N	\N	\N
b61f8917-a629-487c-99d7-b805470ae13a	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$qIXqMOOcxZ3sVAIw0Qr6RblFb7VbLNbcty6OkSokH/M4fUO8	\N	\N	\N	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N
fd882f4e-0b95-478c-bd85-12570428e6b3	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$2v+Ny0vDn09n7WM2RXcXM3CaMJwKeSUEoXS8XJmXoJlhlp0J	\N	\N	\N	\N	\N	\N
c388c798-3daf-4cd8-859a-f94c0cce4d8f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$tq889gldJzgwIByUBv/xM8ucf5qvCbA4COnao8HZoNMCG3Li	\N	\N	\N	\N	713c7350-c94f-4015-9ee4-7158b316a50d	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0ac43467-6a74-4edd-a55c-7bf90d7e75a0	1	Заполняющий	230	270	23	26	\N	\N	e595df02-1049-479b-b6ad-aa2272d959f0	\N
27c090de-72f5-438f-9d08-a6cb9868cd35	1	Заполняющий	230	270	23	26	\N	\N	0a23d10a-5c92-45b4-a5ef-f172829a8cb7	\N
43b4bcea-5ea3-4435-a1b9-0dedd0bf828b	1	Заполняющий	230	270	23	26	\N	\N	07f714a7-4253-4126-aa02-bb5a503a989e	\N
4957895c-c928-488c-86a4-83bfb8d1aa0b	1	Заполняющий	230	270	23	26	\N	\N	b8deb78c-01f8-42b5-a358-f84a1139df53	\N
4ffb462e-7dbf-4415-b1b5-7f9bc1a708bc	1	Заполняющий	230	270	23	26	\N	\N	3f337b43-47a4-466a-a13d-8cc959c87ce3	\N
6a378147-1df6-40cf-b22a-6a933ceaa8a6	1	Заполняющий	230	270	23	26	\N	\N	e3e8b77c-4e9b-4fdb-b1bd-335cffe6eee9	\N
849b0a84-4a7e-4725-b18e-bca57cdc535a	1	Заполняющий	230	270	23	26	\N	\N	a0fd7ba0-1c97-496f-9c0d-348927193c52	\N
beddb87a-7ccb-4b63-b31c-b348ca1bf2bc	1	Заполняющий	230	270	23	26	\N	\N	f02f1eb0-1b8e-48a0-94ca-c5d58ec3e2f0	\N
c7ec4b1f-7e93-4342-ba60-a8a5226ca43e	1	Заполняющий	230	270	23	26	\N	\N	de31df3a-74a8-4343-af75-62dbb20e9d60	\N
cbc518dc-e67c-4610-901e-fda803dd8b4e	1	Заполняющий	230	270	23	26	\N	\N	ee078121-bff0-431f-a69c-8f192bcc6675	\N
e7beccbf-9181-4344-a024-d4008a61911b	1	Заполняющий	230	270	23	26	\N	\N	d3c7d170-8c05-490c-8906-15bc89559bc5	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
3cf4f281-d7fe-46cd-a18c-29ff6ff9c1fe	1	Корневой	82	0.11	0.68	f	f	t	f832d3d3-ceab-42ff-be6b-8d96edaf69e5	d4ffbe46-0bf4-4d4c-ac99-bb6f1e1f9455	\N
53311b75-be00-41ab-bd6c-be40fcb097f1	1	Корневой	82	0.11	0.68	f	f	t	412defee-719f-4086-a5da-7ac2c200f756	dd5fe9cd-0bbe-4a16-ae14-5deaa0148b20	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0ce685fc-1b8e-480c-8b71-8d971b87798a	222299ca-0344-4c7f-b6d7-497cb54e8edb
5d7dfb78-2ac0-4eea-87e2-587c37789f96	48088df8-9e17-47bd-baf9-a6267422e315
5d7dfb78-2ac0-4eea-87e2-587c37789f96	d8d200ca-9ba8-4a18-9f44-666dc7fb6716
62ee5e9a-ae01-4875-8de9-f24f4601d043	c4ac4268-8b30-448c-a8ec-2cbabac9f565
6bfd7c0d-10d1-4238-ae10-776d169f57b8	222299ca-0344-4c7f-b6d7-497cb54e8edb
6d307c80-539f-4cb7-9bd8-14ece0d5a833	48088df8-9e17-47bd-baf9-a6267422e315
6d307c80-539f-4cb7-9bd8-14ece0d5a833	d8d200ca-9ba8-4a18-9f44-666dc7fb6716
76315267-9a35-4650-a02d-abf9eb2dc198	48088df8-9e17-47bd-baf9-a6267422e315
76315267-9a35-4650-a02d-abf9eb2dc198	d8d200ca-9ba8-4a18-9f44-666dc7fb6716
89cefb03-4cf7-4765-aeb3-58c6849679b5	c4ac4268-8b30-448c-a8ec-2cbabac9f565
995b9a93-5152-4131-a1f3-788bae294197	48088df8-9e17-47bd-baf9-a6267422e315
995b9a93-5152-4131-a1f3-788bae294197	d8d200ca-9ba8-4a18-9f44-666dc7fb6716
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0ce685fc-1b8e-480c-8b71-8d971b87798a	bd70ebf8-546b-47b2-b7cc-46f28a8756fe	\N	122575
5d7dfb78-2ac0-4eea-87e2-587c37789f96	232175b6-7a3c-4268-b1f5-51760a6e8f0d	\N	114729
62ee5e9a-ae01-4875-8de9-f24f4601d043	5313942c-5820-4f35-8673-1280042fef14	\N	121267
6bfd7c0d-10d1-4238-ae10-776d169f57b8	b8dfd46d-f682-49eb-96fa-7ee013431e98	\N	132695
6d307c80-539f-4cb7-9bd8-14ece0d5a833	74f846dd-7876-4059-9fe5-6975ada42312	\N	146164
76315267-9a35-4650-a02d-abf9eb2dc198	c408a8d5-0615-4069-8235-f365731025db	\N	150882
89cefb03-4cf7-4765-aeb3-58c6849679b5	18d518ec-bffc-438a-9044-147bbb646b0b	\N	117390
995b9a93-5152-4131-a1f3-788bae294197	1205cbbe-54b5-4f59-833e-82c7d50fd980	\N	150838
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
222299ca-0344-4c7f-b6d7-497cb54e8edb	a89dd6bf-9202-433a-b3ac-24d90fc73d44
222299ca-0344-4c7f-b6d7-497cb54e8edb	bc6d7d4b-a5bd-4175-aa98-252d12ec096f
48088df8-9e17-47bd-baf9-a6267422e315	0072b0b9-491e-4366-8b3c-465bd753ce7d
48088df8-9e17-47bd-baf9-a6267422e315	6dc1d9fc-4e50-4a04-822e-7f74e1fbd3e8
48088df8-9e17-47bd-baf9-a6267422e315	bc6d7d4b-a5bd-4175-aa98-252d12ec096f
48088df8-9e17-47bd-baf9-a6267422e315	ed7c65d4-7108-4548-8baf-e8e945f30da1
c4ac4268-8b30-448c-a8ec-2cbabac9f565	ed7c65d4-7108-4548-8baf-e8e945f30da1
c4ac4268-8b30-448c-a8ec-2cbabac9f565	ee37b195-94e8-4f19-a2fe-bc40c8396398
d8d200ca-9ba8-4a18-9f44-666dc7fb6716	0072b0b9-491e-4366-8b3c-465bd753ce7d
d8d200ca-9ba8-4a18-9f44-666dc7fb6716	6dc1d9fc-4e50-4a04-822e-7f74e1fbd3e8
d8d200ca-9ba8-4a18-9f44-666dc7fb6716	bc6d7d4b-a5bd-4175-aa98-252d12ec096f
d8d200ca-9ba8-4a18-9f44-666dc7fb6716	ed7c65d4-7108-4548-8baf-e8e945f30da1
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
222299ca-0344-4c7f-b6d7-497cb54e8edb	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	867b2619-444a-4405-8dc7-74693678b818	49286
48088df8-9e17-47bd-baf9-a6267422e315	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	867b2619-444a-4405-8dc7-74693678b818	49283
c4ac4268-8b30-448c-a8ec-2cbabac9f565	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	867b2619-444a-4405-8dc7-74693678b818	49232
d8d200ca-9ba8-4a18-9f44-666dc7fb6716	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	867b2619-444a-4405-8dc7-74693678b818	49141
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
412defee-719f-4086-a5da-7ac2c200f756	2023-03-10 23:14:56.996728	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	48088df8-9e17-47bd-baf9-a6267422e315	62ee5e9a-ae01-4875-8de9-f24f4601d043	867b2619-444a-4405-8dc7-74693678b818	\N
f832d3d3-ceab-42ff-be6b-8d96edaf69e5	2023-03-10 23:14:56.996565	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	48088df8-9e17-47bd-baf9-a6267422e315	62ee5e9a-ae01-4875-8de9-f24f4601d043	867b2619-444a-4405-8dc7-74693678b818	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
d4ffbe46-0bf4-4d4c-ac99-bb6f1e1f9455	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	a1ed895b-4ec6-427b-84f7-7cb310caeb39	62ee5e9a-ae01-4875-8de9-f24f4601d043	867b2619-444a-4405-8dc7-74693678b818	542a16ac-d971-4bb9-8862-477141960085	\N
dd5fe9cd-0bbe-4a16-ae14-5deaa0148b20	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	5aa0274e-f2b3-41f1-be51-d7db4f2d3442	62ee5e9a-ae01-4875-8de9-f24f4601d043	867b2619-444a-4405-8dc7-74693678b818	542a16ac-d971-4bb9-8862-477141960085	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
53fca57a-f234-4350-85a3-5929946c1361	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	fb1b31ad-83ed-4fbe-9daa-7f62d88ecfca	\N
75030206-e9c9-4e8f-9c3b-4a9c437a6ff6	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	fb1b31ad-83ed-4fbe-9daa-7f62d88ecfca	\N
98f23b2d-8fbe-47b3-869d-a881dd8905a9	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	fb1b31ad-83ed-4fbe-9daa-7f62d88ecfca	\N
d89d5b94-35dc-4d0a-95c0-af49b04dbcbc	1	12:10:00	13:10:00	13:20:00	13:50:00	6aee66c1-d41c-4315-97a5-4b71258f58d8	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0072b0b9-491e-4366-8b3c-465bd753ce7d	3550	\N	713c7350-c94f-4015-9ee4-7158b316a50d	3550
6dc1d9fc-4e50-4a04-822e-7f74e1fbd3e8	3690	\N	713c7350-c94f-4015-9ee4-7158b316a50d	3690
a89dd6bf-9202-433a-b3ac-24d90fc73d44	3510	\N	713c7350-c94f-4015-9ee4-7158b316a50d	3510
bc6d7d4b-a5bd-4175-aa98-252d12ec096f	3500	\N	713c7350-c94f-4015-9ee4-7158b316a50d	3500
ed7c65d4-7108-4548-8baf-e8e945f30da1	3610	\N	713c7350-c94f-4015-9ee4-7158b316a50d	3610
ee37b195-94e8-4f19-a2fe-bc40c8396398	3600	\N	713c7350-c94f-4015-9ee4-7158b316a50d	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
831e1cfe-976a-4273-aa27-9de94b7ef490	Сварочный цех	50	050
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

