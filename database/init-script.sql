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
51a74ad5-2198-4ced-adea-8d94a0df1dcc	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
970874ef-f8de-4725-af77-d72294389e2a	022a4e3e-6648-495b-9124-eed7b0839444	3fab5ee3-7ed7-4901-8404-8161ab0da664	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
32ee3596-3874-4ac1-b3ef-edf410b49791	1	10	t	51a74ad5-2198-4ced-adea-8d94a0df1dcc	\N
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
10da0d6a-4d97-42c3-927f-b0df16c65e29	Ознакомление с работой, документацией, инструктаж	\N
22ab170f-3501-4aea-8bb8-647b992c51a0	Отсутствие материала, заготовок, деталей	\N
240eb7a2-11e6-4d98-af62-dc1001525b41	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
31236d5c-443d-4d4c-b229-42b39f62dd56	Неявка оператора (б/лист, отпуск, и пр.)	\N
3778d04f-a430-4881-be9a-fe64f1af1429	Отсутствие крана, транспорта	\N
3818b636-3e71-4ec6-8637-0a14cb5a9ff7	Отсутствие сотрудника ОТК	\N
38b43d24-032c-4ec2-9f8d-4b4be91a0460	Изменение режимов, смена инструмента, приспособления	\N
3c509c08-f7b4-45ed-8390-099021a6bba4	Отсутствие энергоносителей	\N
5b8bc752-a823-453c-8a8a-cdf6b77ca9a1	Установка, выверка, снятие детали	\N
5f3344e8-08bd-48ac-b987-fffae6e551e4	Отсутствие заданий	\N
7e1bf9a6-7a1e-47b5-ae12-84efd8042840	Отсутствие конструктора, технолога или ожидание его решения	\N
81339888-be34-4fe2-8a36-dc967a7df079	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
87ff4c3e-b6c8-4c16-a5bd-92a3b2d02d04	Обед	\N
8be1be09-40e5-4984-9252-06901ca3ed8a	Сборочные операции	\N
95025674-568a-413b-aa08-cc8c8241a725	Праздники и выходные	\N
9615c1b5-1dd1-4bf6-9a6f-f32045d468f0	Установка, выверка, снятие детали	\N
b3e1989a-0cac-477b-80c7-87ed4dc1b204	Нерабочее время по графику согласно сменности	\N
b4087fd4-9e08-4c80-a065-8caa095b7f86	Работа с управляющей программой	\N
c1a8d5df-423a-4e6d-aeca-bf109136d1a7	Плановый ремонт централизованными службами	\N
ca038b2d-8758-46f2-903f-81a843fbfe8a	Работа по карте несоответствий	\N
dc1e22a7-18de-47f9-a0bd-d1cae4082411	Отсутствие оператора в связи с необеспеченностью	\N
dc5a5584-20f7-4db9-9eae-3a78a2a13d3a	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
e6b88a1f-171b-4f48-8682-48ef05ed24c4	Аварийный ремонт централизованными службами	\N
efe09aa2-8940-45bc-b2f5-9dee1d5a81af	Контроль на рабочем месте	\N
fc82f6af-7b1d-4561-831d-3d65b17450b3	Естественные надобности	\N
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
aa83c099-4290-4215-8495-e39ed72d7c49	475c25cf-5612-4290-a9da-02ff02224751	249550
eaa172f9-210b-4d45-8467-440c596603ff	ea3ed825-c41a-459a-8a0f-08d0dfa1a91b	219379
bf178de5-6b03-483c-abf6-93a80e4b3887	ac76f48b-137b-4d65-92d3-21580f69fdf2	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
a52acb56-7580-4ecf-8422-5c49fbd2da6f	5ae05d1e-8d4a-4f62-a887-60253130df77	614962
a9566f12-a3d8-4cc0-8425-1c5381aa2805	9c60094f-4763-4151-bea4-f3ee41adff48	610422
1db4c675-b92c-4b03-88f1-06c67a25ded2	04e61cd6-f65f-4241-ae24-627d718711bf	\N
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
04286e6b-d3cd-4f56-981c-39d7108b6912	17	2	2023-03-06 19:05:12.611371	7512ae8c-da00-43a5-9b7c-42715df217b9	\N
0998387e-7bb9-4e8e-87a0-57eb5be86691	37	2	2023-03-06 19:05:12.613638	dfcb8c1d-7054-42bd-9d0b-dba2238b0f96	\N
0bc3a55f-103c-4e4d-aab5-9021bf627299	35	2	2023-03-06 19:05:12.613411	d57aaf71-ab1c-499d-a220-392cff06349a	\N
1887d89c-18a6-4a43-9720-3062bfbe3bae	22	2	2023-03-06 19:05:12.611947	8f98833c-90e4-4f2b-91b5-760ffbaedc04	\N
1c641fb9-84ef-4ba6-a57f-ddfc9ba40385	2	2	2023-03-06 19:05:12.60956	148ed4e0-d99c-4139-9a6e-2b3506c100e6	\N
23304a6c-0eb1-41a7-b59c-1399db39cf30	36	2	2023-03-06 19:05:12.61353	da8c7772-552c-442e-ae9c-ff90140a9381	\N
32a8e6f6-a936-490a-ac8b-e987ead6b89e	5	2	2023-03-06 19:05:12.609975	3a13686e-5148-4099-9e8f-cfcfd8d62717	\N
3487a88f-e228-41a8-8126-0a738b6e47d9	10	2	2023-03-06 19:05:12.610587	541a1f12-ddba-4792-9d3e-c5f77a787d41	\N
37f4201c-995f-48da-ab0f-f5ca1d2a6849	25	2	2023-03-06 19:05:12.612282	9d8c29d9-e2a2-4c09-b765-29453344fdfe	\N
4f9f7aa7-8ef4-407d-98a1-62c30b0cab1b	1	2	2023-03-06 19:05:12.576157	0d14caf6-be14-4af2-8570-4e834400ce46	\N
5215235d-3378-4f21-85ec-c417acd71f8d	28	2	2023-03-06 19:05:12.612618	c5f00d1b-6dd6-43f2-a431-a119bd864e28	\N
54551b97-8e86-4f05-9394-e61caabd7363	42	2	2023-03-06 19:05:12.614203	ffca4334-3804-4aa6-b559-65f7c2d07e15	\N
57ce8f84-e8c1-4390-8316-4f65fae589b8	24	2	2023-03-06 19:05:12.612172	97754f2e-bccd-4b9e-8cb7-081a131c68bc	\N
5af825aa-db53-4b0a-a563-2e9441ee21f3	20	2	2023-03-06 19:05:12.611722	8256aee9-be75-444b-9a5b-26eef147f357	\N
5f5a96cb-6a6b-461f-8bd0-c61b8a08dbcd	33	2	2023-03-06 19:05:12.613179	c98a05a7-7426-4d46-bb7d-4d0f291c1721	\N
632acb33-f614-414a-b6f2-d1a4cf2a84e7	7	2	2023-03-06 19:05:12.610232	45ec4417-38f7-435c-b31b-ca9c968166a1	\N
64f0529d-ea19-4894-9383-a8f463619dee	12	2	2023-03-06 19:05:12.610814	60d698e5-81cc-4bae-8a1b-2d98c2337566	\N
7439db13-cd9a-417e-b9ff-16aa61789bf5	14	2	2023-03-06 19:05:12.611037	6de79a20-727b-40f1-b9a4-aa57ed896969	\N
7dad4247-adf4-4cda-9df0-0a6ec8504deb	13	2	2023-03-06 19:05:12.610925	62de2570-242d-4ab1-aa19-056d9bee6a0c	\N
7eda6e64-da73-4dd2-8f73-760f348b39e9	4	2	2023-03-06 19:05:12.609848	2902c72f-b342-4200-b358-9a60c492d8fd	\N
831f7a08-75c8-44f7-a2c9-fee8e59f2bd0	18	2	2023-03-06 19:05:12.611483	75fe6f21-e256-44ef-92a4-3b7ab0016672	\N
897ff882-1f5c-4b10-b463-41f43d8554d3	19	2	2023-03-06 19:05:12.6116	7f2c8c70-07ad-4552-b7b9-2b0f30910218	\N
8d071b53-1922-4d16-b86e-4597f481f6ff	34	2	2023-03-06 19:05:12.613295	cfe54fa0-f479-4226-a058-0ab674891c3b	\N
997c2e52-33c7-4526-be55-e33592eede32	6	2	2023-03-06 19:05:12.610091	3b198342-2a4f-4bc9-89e8-60c0e8f8085b	\N
a34e7e4b-9dff-4c48-8f08-fc5bc33db50d	8	2	2023-03-06 19:05:12.610353	45f7d46f-1667-4bfb-974e-e8ee17ab828c	\N
a50de688-81a3-4bfe-9d98-c9b1e7b3ded3	26	2	2023-03-06 19:05:12.612392	a01c9eac-6e81-4f7d-b41d-1483cdb6bde4	\N
b0d43a53-69e2-46ba-8024-692d77928160	23	2	2023-03-06 19:05:12.612057	968420b6-7154-4232-843d-c37ab352599b	\N
b3b13761-048f-48e9-9cf3-eb4105351dd4	15	2	2023-03-06 19:05:12.611149	70233208-87bc-417d-9a3d-5d94257a19fe	\N
b51e38d0-23d0-408b-9988-ce1fc95cca59	40	2	2023-03-06 19:05:12.613978	f6685936-3ba7-4ccb-993a-e27853923758	\N
c6143604-6474-46b6-96fe-dcf077d12bea	29	2	2023-03-06 19:05:12.612733	c6944b48-ac72-4975-9069-984fa276f90b	\N
c6ca6585-450e-469d-9708-e1aba9a10458	9	2	2023-03-06 19:05:12.61047	4d8515e0-c8db-4cd5-8bad-9eee5c6d60b0	\N
ce2f5178-4549-436c-8824-1ccec064eb39	11	2	2023-03-06 19:05:12.6107	55b99254-5eeb-4eb6-b75c-7279bb0b6bd1	\N
d31e4d77-9dd6-421b-8101-fb0de286b3cc	39	2	2023-03-06 19:05:12.613861	e977b865-aadb-455a-a1c8-acf8a00f7b8a	\N
e4e73332-f121-469d-b2ad-20b2c5d2e4da	38	2	2023-03-06 19:05:12.613748	e5d68b2f-ff4f-4abd-a770-72ea3e7c9c62	\N
e54e2113-ef66-40cb-857e-209381ac16dc	31	2	2023-03-06 19:05:12.61296	c81487b2-a2b8-4ce0-80c6-1ef63dade9c2	\N
e81c9670-6329-4005-888f-b5c1383ad874	16	2	2023-03-06 19:05:12.611262	73c45eb6-514e-445a-9875-8bd4601c6dcd	\N
eee40086-91a7-43c9-8e1f-22ec48aef5b7	30	2	2023-03-06 19:05:12.612845	c7b0b461-7526-4345-a28b-bb0cc7220eb3	\N
f756921a-c8cb-4628-93d6-6bb81932ec60	21	2	2023-03-06 19:05:12.611837	82b212c3-d6ae-4fb9-9b1a-762ee820c6d2	\N
f78089d7-bd1f-4827-ae97-3756c991a92c	41	2	2023-03-06 19:05:12.614094	f7b04426-81f6-4e0b-ab6c-fb6a1ee27caf	\N
f78c5130-f343-4d70-8b17-82df1b84c79b	3	2	2023-03-06 19:05:12.609719	16a29960-8ace-45b9-ace0-1b355bb7ed7f	\N
f8f27fed-3f33-4261-acec-b6f8b0fe2858	27	2	2023-03-06 19:05:12.612505	b78d8de6-c7af-4c98-b32e-48c8bb8052fb	\N
fa6e52f2-faa5-4de3-a679-e1ee131dff03	32	2	2023-03-06 19:05:12.613071	c9051d90-7a47-4d94-91ce-84ec09385ba1	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
c7b0b461-7526-4345-a28b-bb0cc7220eb3	0d14caf6-be14-4af2-8570-4e834400ce46
9d8c29d9-e2a2-4c09-b765-29453344fdfe	148ed4e0-d99c-4139-9a6e-2b3506c100e6
c7b0b461-7526-4345-a28b-bb0cc7220eb3	16a29960-8ace-45b9-ace0-1b355bb7ed7f
e977b865-aadb-455a-a1c8-acf8a00f7b8a	2902c72f-b342-4200-b358-9a60c492d8fd
c7b0b461-7526-4345-a28b-bb0cc7220eb3	3a13686e-5148-4099-9e8f-cfcfd8d62717
c7b0b461-7526-4345-a28b-bb0cc7220eb3	3b198342-2a4f-4bc9-89e8-60c0e8f8085b
73c45eb6-514e-445a-9875-8bd4601c6dcd	45ec4417-38f7-435c-b31b-ca9c968166a1
3a13686e-5148-4099-9e8f-cfcfd8d62717	45f7d46f-1667-4bfb-974e-e8ee17ab828c
9d8c29d9-e2a2-4c09-b765-29453344fdfe	4d8515e0-c8db-4cd5-8bad-9eee5c6d60b0
7512ae8c-da00-43a5-9b7c-42715df217b9	541a1f12-ddba-4792-9d3e-c5f77a787d41
4d8515e0-c8db-4cd5-8bad-9eee5c6d60b0	55b99254-5eeb-4eb6-b75c-7279bb0b6bd1
16a29960-8ace-45b9-ace0-1b355bb7ed7f	60d698e5-81cc-4bae-8a1b-2d98c2337566
c7b0b461-7526-4345-a28b-bb0cc7220eb3	62de2570-242d-4ab1-aa19-056d9bee6a0c
82b212c3-d6ae-4fb9-9b1a-762ee820c6d2	6de79a20-727b-40f1-b9a4-aa57ed896969
73c45eb6-514e-445a-9875-8bd4601c6dcd	70233208-87bc-417d-9a3d-5d94257a19fe
9d8c29d9-e2a2-4c09-b765-29453344fdfe	73c45eb6-514e-445a-9875-8bd4601c6dcd
9d8c29d9-e2a2-4c09-b765-29453344fdfe	7512ae8c-da00-43a5-9b7c-42715df217b9
148ed4e0-d99c-4139-9a6e-2b3506c100e6	75fe6f21-e256-44ef-92a4-3b7ab0016672
73c45eb6-514e-445a-9875-8bd4601c6dcd	7f2c8c70-07ad-4552-b7b9-2b0f30910218
73c45eb6-514e-445a-9875-8bd4601c6dcd	8256aee9-be75-444b-9a5b-26eef147f357
c7b0b461-7526-4345-a28b-bb0cc7220eb3	82b212c3-d6ae-4fb9-9b1a-762ee820c6d2
73c45eb6-514e-445a-9875-8bd4601c6dcd	8f98833c-90e4-4f2b-91b5-760ffbaedc04
4d8515e0-c8db-4cd5-8bad-9eee5c6d60b0	968420b6-7154-4232-843d-c37ab352599b
16a29960-8ace-45b9-ace0-1b355bb7ed7f	97754f2e-bccd-4b9e-8cb7-081a131c68bc
7512ae8c-da00-43a5-9b7c-42715df217b9	a01c9eac-6e81-4f7d-b41d-1483cdb6bde4
82b212c3-d6ae-4fb9-9b1a-762ee820c6d2	b78d8de6-c7af-4c98-b32e-48c8bb8052fb
9d8c29d9-e2a2-4c09-b765-29453344fdfe	c5f00d1b-6dd6-43f2-a431-a119bd864e28
c7b0b461-7526-4345-a28b-bb0cc7220eb3	c6944b48-ac72-4975-9069-984fa276f90b
3a13686e-5148-4099-9e8f-cfcfd8d62717	c81487b2-a2b8-4ce0-80c6-1ef63dade9c2
c7b0b461-7526-4345-a28b-bb0cc7220eb3	c9051d90-7a47-4d94-91ce-84ec09385ba1
16a29960-8ace-45b9-ace0-1b355bb7ed7f	c98a05a7-7426-4d46-bb7d-4d0f291c1721
c7b0b461-7526-4345-a28b-bb0cc7220eb3	cfe54fa0-f479-4226-a058-0ab674891c3b
c9051d90-7a47-4d94-91ce-84ec09385ba1	d57aaf71-ab1c-499d-a220-392cff06349a
3b198342-2a4f-4bc9-89e8-60c0e8f8085b	da8c7772-552c-442e-ae9c-ff90140a9381
9d8c29d9-e2a2-4c09-b765-29453344fdfe	dfcb8c1d-7054-42bd-9d0b-dba2238b0f96
16a29960-8ace-45b9-ace0-1b355bb7ed7f	e5d68b2f-ff4f-4abd-a770-72ea3e7c9c62
9d8c29d9-e2a2-4c09-b765-29453344fdfe	e977b865-aadb-455a-a1c8-acf8a00f7b8a
9d8c29d9-e2a2-4c09-b765-29453344fdfe	f6685936-3ba7-4ccb-993a-e27853923758
16a29960-8ace-45b9-ace0-1b355bb7ed7f	f7b04426-81f6-4e0b-ab6c-fb6a1ee27caf
9d8c29d9-e2a2-4c09-b765-29453344fdfe	ffca4334-3804-4aa6-b559-65f7c2d07e15
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
000700fc-f8ff-446b-9232-823ca7ae8bcc	0	2	\N	\N	7eda6e64-da73-4dd2-8f73-760f348b39e9	\N
030c4b95-3b60-43ad-98ff-aba5baade352	0	2	\N	\N	32a8e6f6-a936-490a-ac8b-e987ead6b89e	\N
0923e932-9e00-4b4b-8e75-f8a479fecd76	0	3	\N	\N	f78c5130-f343-4d70-8b17-82df1b84c79b	\N
0ad249f6-c033-459d-bd31-af77391737c7	0	2	\N	\N	64f0529d-ea19-4894-9383-a8f463619dee	\N
0cff937d-0d2b-43b6-aab3-147846f1223c	0	1	\N	\N	c6143604-6474-46b6-96fe-dcf077d12bea	\N
100dde27-468a-40dd-8700-4ccb04010549	0	2	\N	\N	4f9f7aa7-8ef4-407d-98a1-62c30b0cab1b	\N
12582dc9-5dd9-43cb-bd96-d6b38966d4e2	0	1	\N	\N	d31e4d77-9dd6-421b-8101-fb0de286b3cc	\N
1295702e-84a3-496b-9ff8-49516b9d2e41	0	1	\N	\N	c6ca6585-450e-469d-9708-e1aba9a10458	\N
18662d20-0230-4ddf-b44d-c0e9f5168d4f	0	3	\N	\N	1887d89c-18a6-4a43-9720-3062bfbe3bae	\N
18e8276c-82f7-42ef-9c7c-f5aaf5e639e8	0	2	\N	\N	04286e6b-d3cd-4f56-981c-39d7108b6912	\N
1900e225-fad5-4cc0-aabd-9d66d7b6e0a0	0	3	\N	\N	b3b13761-048f-48e9-9cf3-eb4105351dd4	\N
1a2f8e27-54e1-481b-9f56-7cf1c68ed83e	0	2	\N	\N	8d071b53-1922-4d16-b86e-4597f481f6ff	\N
1bf07e26-2da6-4b73-b23b-5fb1a34bcd4f	0	3	\N	\N	4f9f7aa7-8ef4-407d-98a1-62c30b0cab1b	\N
1bf39fc4-2780-4950-8886-babb7f670aab	0	3	\N	\N	e81c9670-6329-4005-888f-b5c1383ad874	\N
1e600643-8919-4cae-9839-4fdfb27e855e	0	1	\N	\N	7eda6e64-da73-4dd2-8f73-760f348b39e9	\N
21fe1577-3b12-407e-99a4-129dd764dda6	0	2	\N	\N	b3b13761-048f-48e9-9cf3-eb4105351dd4	\N
238e5619-061d-4e13-81fd-4c8e5cafb52e	0	1	\N	\N	23304a6c-0eb1-41a7-b59c-1399db39cf30	\N
2489c5d8-1659-4b44-b070-428bb725dac1	0	1	\N	\N	a34e7e4b-9dff-4c48-8f08-fc5bc33db50d	\N
25dc9af8-12c5-4739-8576-6a65a34ad1da	0	1	\N	\N	54551b97-8e86-4f05-9394-e61caabd7363	\N
2829bd29-e3aa-4dd3-99e7-fbfd745b30c2	0	3	\N	\N	d31e4d77-9dd6-421b-8101-fb0de286b3cc	\N
28921328-7dd0-4647-a706-c3a47d26fd87	0	1	\N	\N	32a8e6f6-a936-490a-ac8b-e987ead6b89e	\N
29027cad-f0fc-435c-a097-3453b68585db	0	1	\N	\N	0998387e-7bb9-4e8e-87a0-57eb5be86691	\N
2a452e5d-50f5-4c69-a515-7c15f15f772a	0	2	\N	\N	eee40086-91a7-43c9-8e1f-22ec48aef5b7	\N
2e1ea0d0-449f-47cf-930f-1d5eb73d6472	0	1	\N	\N	7439db13-cd9a-417e-b9ff-16aa61789bf5	\N
2f31ea1e-8a8a-49ae-b4d3-5cdb78e22753	0	2	\N	\N	997c2e52-33c7-4526-be55-e33592eede32	\N
30801951-e9d2-4f7a-b427-59f18f7a7174	0	3	\N	\N	32a8e6f6-a936-490a-ac8b-e987ead6b89e	\N
32ac5b75-3f78-4e08-861c-90759dfa2c65	0	1	\N	\N	897ff882-1f5c-4b10-b463-41f43d8554d3	\N
33a55b57-eef6-4503-b360-d3a2c0250192	0	2	\N	\N	e4e73332-f121-469d-b2ad-20b2c5d2e4da	\N
34a18273-3905-4c63-b245-515f906977b4	0	2	\N	\N	831f7a08-75c8-44f7-a2c9-fee8e59f2bd0	\N
3623e804-81d1-4dbb-9cd6-3e4b3752ce76	0	3	\N	\N	3487a88f-e228-41a8-8126-0a738b6e47d9	\N
36e177cf-2157-4fc6-bfbc-5c94105d453f	0	1	\N	\N	f8f27fed-3f33-4261-acec-b6f8b0fe2858	\N
385c9b87-909e-4fa6-a002-5f4c0d3cb715	0	1	\N	\N	8d071b53-1922-4d16-b86e-4597f481f6ff	\N
392b9b95-dda8-41e3-944a-3daaeca15842	0	3	\N	\N	5af825aa-db53-4b0a-a563-2e9441ee21f3	\N
399e3650-ea84-4f77-9b89-5688ded54a9c	0	1	\N	\N	04286e6b-d3cd-4f56-981c-39d7108b6912	\N
3a6e70c9-052a-4015-b34d-f4877a483363	0	1	\N	\N	f78089d7-bd1f-4827-ae97-3756c991a92c	\N
3b8b58e8-8e57-44a0-9b69-bfedb66c02e5	0	1	\N	\N	fa6e52f2-faa5-4de3-a679-e1ee131dff03	\N
3bc8fcea-43f2-402f-bc5a-2f8fd3c5324c	0	2	\N	\N	c6143604-6474-46b6-96fe-dcf077d12bea	\N
3c29799b-c104-4a00-a5c1-6e2569e63f0c	0	3	\N	\N	997c2e52-33c7-4526-be55-e33592eede32	\N
3d4ed373-9435-4e72-bea7-837c44ee4532	0	1	\N	\N	b3b13761-048f-48e9-9cf3-eb4105351dd4	\N
3e03ff38-3a9a-4632-b320-a28e468ee26d	0	1	\N	\N	b0d43a53-69e2-46ba-8024-692d77928160	\N
4aac06ad-f436-4c1a-b13f-286357e4c1f8	0	1	\N	\N	997c2e52-33c7-4526-be55-e33592eede32	\N
4b43fcf1-4f1e-4bbc-94eb-db05eab870d2	0	2	\N	\N	0998387e-7bb9-4e8e-87a0-57eb5be86691	\N
4dde552e-1f64-4d81-a76e-ebd01c229a21	0	2	\N	\N	897ff882-1f5c-4b10-b463-41f43d8554d3	\N
504b42db-a746-457a-b865-0952b207a7e6	0	1	\N	\N	5f5a96cb-6a6b-461f-8bd0-c61b8a08dbcd	\N
52399045-82e6-4bc6-964c-1435c16f3608	0	1	\N	\N	e54e2113-ef66-40cb-857e-209381ac16dc	\N
543d2ff4-a514-4e37-ab4a-b1637b621fc8	0	1	\N	\N	5af825aa-db53-4b0a-a563-2e9441ee21f3	\N
59d16f37-0d3e-48cb-a243-e4cd54d5b785	0	1	\N	\N	632acb33-f614-414a-b6f2-d1a4cf2a84e7	\N
59f8eacb-61a6-4773-8447-c9a2bfc2a272	0	3	\N	\N	e54e2113-ef66-40cb-857e-209381ac16dc	\N
5aa3d9df-918d-4573-a2bf-e1ac195d8b66	0	1	\N	\N	f756921a-c8cb-4628-93d6-6bb81932ec60	\N
6051cd47-1956-42a6-86ae-26dc16bfa24a	0	3	\N	\N	5f5a96cb-6a6b-461f-8bd0-c61b8a08dbcd	\N
60820809-0a32-47ac-bbc4-613c9d28348e	0	1	\N	\N	b51e38d0-23d0-408b-9988-ce1fc95cca59	\N
60a9f02e-e457-477d-a675-1f8c35fe17b3	0	3	\N	\N	831f7a08-75c8-44f7-a2c9-fee8e59f2bd0	\N
60d4ba63-cdaa-4e83-a811-bf8929deca74	0	2	\N	\N	5f5a96cb-6a6b-461f-8bd0-c61b8a08dbcd	\N
633ed432-7544-41f8-8d86-ceafe043770e	0	1	\N	\N	1c641fb9-84ef-4ba6-a57f-ddfc9ba40385	\N
65270c2c-f935-4d15-9f32-7cfda365acbd	0	3	\N	\N	1c641fb9-84ef-4ba6-a57f-ddfc9ba40385	\N
68ef2533-e9ec-4763-b823-0486376a545f	0	1	\N	\N	ce2f5178-4549-436c-8824-1ccec064eb39	\N
6a062838-1e2a-4546-aea0-a2853bcacff7	0	2	\N	\N	5215235d-3378-4f21-85ec-c417acd71f8d	\N
6a95a77e-3694-4bb6-9dd2-98b8e50eb79f	0	1	\N	\N	0bc3a55f-103c-4e4d-aab5-9021bf627299	\N
6b43ae08-da7f-4a58-8195-eea4833aa2a2	0	1	\N	\N	831f7a08-75c8-44f7-a2c9-fee8e59f2bd0	\N
6eb6efed-f758-4c1b-9611-c8ccaa8dacfe	0	3	\N	\N	54551b97-8e86-4f05-9394-e61caabd7363	\N
7408b5e9-06e5-40c2-b77f-97fdbdbd82a7	0	2	\N	\N	a34e7e4b-9dff-4c48-8f08-fc5bc33db50d	\N
74ba4898-03c1-4c8b-b6bd-8bfbaa25a6c5	0	2	\N	\N	23304a6c-0eb1-41a7-b59c-1399db39cf30	\N
778bac34-3532-4463-b341-d879afb1ca4f	0	3	\N	\N	fa6e52f2-faa5-4de3-a679-e1ee131dff03	\N
77dffc5f-196f-49fc-8427-e038a0c8e1dd	0	2	\N	\N	37f4201c-995f-48da-ab0f-f5ca1d2a6849	\N
7a6e9300-0dac-4ca3-bd52-5bc718e7cf7d	0	3	\N	\N	5215235d-3378-4f21-85ec-c417acd71f8d	\N
82d792e0-9ea5-43cf-af8b-8a3a5273d7ef	0	2	\N	\N	b51e38d0-23d0-408b-9988-ce1fc95cca59	\N
84965757-1c7d-424a-8479-4b4a551c2601	0	1	\N	\N	a50de688-81a3-4bfe-9d98-c9b1e7b3ded3	\N
865cbc00-e32b-425f-acb6-d4041a17faea	0	1	\N	\N	eee40086-91a7-43c9-8e1f-22ec48aef5b7	\N
86dc5f55-b83c-4cd9-b173-9c6e33249dbf	0	3	\N	\N	f756921a-c8cb-4628-93d6-6bb81932ec60	\N
8afaec42-b1b7-4904-816e-2835df199c83	0	2	\N	\N	3487a88f-e228-41a8-8126-0a738b6e47d9	\N
8c7db9a7-39f7-4790-911b-8809b611a1ac	0	1	\N	\N	1887d89c-18a6-4a43-9720-3062bfbe3bae	\N
8e155d79-af9d-47f3-ab18-6bac5fe87ef0	0	3	\N	\N	37f4201c-995f-48da-ab0f-f5ca1d2a6849	\N
8ed8651a-6acd-4b90-a9fb-0bf6632cb298	0	3	\N	\N	a50de688-81a3-4bfe-9d98-c9b1e7b3ded3	\N
94e1c1eb-863d-4a9a-afd6-45ba4f280498	0	2	\N	\N	a50de688-81a3-4bfe-9d98-c9b1e7b3ded3	\N
95dd8c9c-f497-463a-8602-eb0e23e6569e	0	1	\N	\N	64f0529d-ea19-4894-9383-a8f463619dee	\N
9f99501a-b8c4-489f-bbdf-6fbd209235c5	0	2	\N	\N	f78c5130-f343-4d70-8b17-82df1b84c79b	\N
a0d5ebd7-99ed-478d-b48d-95b8f69f4ab6	0	2	\N	\N	7dad4247-adf4-4cda-9df0-0a6ec8504deb	\N
a277256a-eaa6-48f7-9848-750bbaa05344	0	3	\N	\N	0bc3a55f-103c-4e4d-aab5-9021bf627299	\N
a3dd09df-a198-4a39-97e5-420642965df7	0	3	\N	\N	0998387e-7bb9-4e8e-87a0-57eb5be86691	\N
a4f34143-48e9-48b4-92c1-8ffb1bb0c423	0	1	\N	\N	e81c9670-6329-4005-888f-b5c1383ad874	\N
a61e4b91-2736-4051-83d6-e0123fcb5e96	0	2	\N	\N	e81c9670-6329-4005-888f-b5c1383ad874	\N
a7e82f21-8111-48f4-a381-c218b141df98	0	2	\N	\N	632acb33-f614-414a-b6f2-d1a4cf2a84e7	\N
aa30c9c7-e695-4588-9c87-a2df8a52f321	0	3	\N	\N	c6143604-6474-46b6-96fe-dcf077d12bea	\N
ad064d9a-1073-4156-8965-eefb09ca9b6d	0	3	\N	\N	897ff882-1f5c-4b10-b463-41f43d8554d3	\N
afa6b332-cf57-45cb-82b8-8ce4827825b3	0	2	\N	\N	7439db13-cd9a-417e-b9ff-16aa61789bf5	\N
b2d8f010-8862-48e8-ab16-64bb2565835f	0	3	\N	\N	64f0529d-ea19-4894-9383-a8f463619dee	\N
b4333495-fd77-4755-b346-f76af2314116	0	3	\N	\N	c6ca6585-450e-469d-9708-e1aba9a10458	\N
b88d132d-99be-4283-9b6f-0329025a0f59	0	3	\N	\N	7eda6e64-da73-4dd2-8f73-760f348b39e9	\N
b95dad64-4962-4edb-a7e4-4a6d5ce6813e	0	2	\N	\N	fa6e52f2-faa5-4de3-a679-e1ee131dff03	\N
baddbffd-c553-4d45-8dcb-e025a33a9925	0	2	\N	\N	f756921a-c8cb-4628-93d6-6bb81932ec60	\N
bb469805-3dc7-487b-8327-551406d7b62a	0	2	\N	\N	ce2f5178-4549-436c-8824-1ccec064eb39	\N
bb6f4716-98cc-438d-b484-ed481c26b371	0	3	\N	\N	eee40086-91a7-43c9-8e1f-22ec48aef5b7	\N
bd69f77d-8f03-4fba-85a4-b3606db7b1e1	0	1	\N	\N	3487a88f-e228-41a8-8126-0a738b6e47d9	\N
bebe66b3-4469-4ab5-8601-f53bc96cb7b7	0	2	\N	\N	0bc3a55f-103c-4e4d-aab5-9021bf627299	\N
bf84bdf6-4e82-4607-828f-019d3a64087a	0	1	\N	\N	5215235d-3378-4f21-85ec-c417acd71f8d	\N
c0745b31-8303-4fda-a15e-95c455680832	0	1	\N	\N	f78c5130-f343-4d70-8b17-82df1b84c79b	\N
c1e95841-bf9f-4a2c-b8f7-d82c978a5e2b	0	2	\N	\N	57ce8f84-e8c1-4390-8316-4f65fae589b8	\N
c26b5456-aff0-4e6e-8302-89f794d4a761	0	1	\N	\N	7dad4247-adf4-4cda-9df0-0a6ec8504deb	\N
c2ce8eb6-41e1-4d8a-9d02-cf4d3954c93a	0	2	\N	\N	1887d89c-18a6-4a43-9720-3062bfbe3bae	\N
c4019425-8676-4ad3-936a-93c1ac0ea88a	0	1	\N	\N	37f4201c-995f-48da-ab0f-f5ca1d2a6849	\N
c6058fcc-e9a0-446c-8635-e0f3a464ee3f	0	1	\N	\N	4f9f7aa7-8ef4-407d-98a1-62c30b0cab1b	\N
c81632cb-333f-4244-92f3-7279c042a6d1	0	3	\N	\N	7439db13-cd9a-417e-b9ff-16aa61789bf5	\N
c8c1474c-ab92-4f60-bd61-468e7623351b	0	3	\N	\N	f78089d7-bd1f-4827-ae97-3756c991a92c	\N
c977782e-4614-4225-912f-036728f298c0	0	2	\N	\N	54551b97-8e86-4f05-9394-e61caabd7363	\N
cae06912-5807-404d-bcaa-c04951283e0f	0	2	\N	\N	e54e2113-ef66-40cb-857e-209381ac16dc	\N
cba0add4-8f31-484c-8fa9-eaaf84df2c97	0	3	\N	\N	a34e7e4b-9dff-4c48-8f08-fc5bc33db50d	\N
cdb654f6-f38e-4f56-890a-1bcae9bdba74	0	2	\N	\N	1c641fb9-84ef-4ba6-a57f-ddfc9ba40385	\N
d56df5b4-92b0-479a-819c-53a586254117	0	2	\N	\N	5af825aa-db53-4b0a-a563-2e9441ee21f3	\N
d607e21c-16a5-4441-9c44-32c5c6f7cd7f	0	3	\N	\N	b0d43a53-69e2-46ba-8024-692d77928160	\N
d7935e48-edd1-46bc-a3d4-02615236436c	0	2	\N	\N	b0d43a53-69e2-46ba-8024-692d77928160	\N
dafc5092-c1e1-4cf8-ab58-096e5683c18b	0	3	\N	\N	b51e38d0-23d0-408b-9988-ce1fc95cca59	\N
dc19a227-ea22-4e19-83b2-3ac585cd82ae	0	3	\N	\N	e4e73332-f121-469d-b2ad-20b2c5d2e4da	\N
de44f60f-c05c-4f19-911e-ab220eb6f57a	0	2	\N	\N	c6ca6585-450e-469d-9708-e1aba9a10458	\N
de93d333-5b50-4a10-9915-1a1d687d75a8	0	1	\N	\N	57ce8f84-e8c1-4390-8316-4f65fae589b8	\N
e11dd942-33fa-410c-8740-db0aa21903fc	0	3	\N	\N	632acb33-f614-414a-b6f2-d1a4cf2a84e7	\N
e1d24b6e-d9cf-46e2-aff5-6e75dafa79a8	0	3	\N	\N	04286e6b-d3cd-4f56-981c-39d7108b6912	\N
e29626d5-6b2e-4308-ab21-50d8e4a8be99	0	3	\N	\N	8d071b53-1922-4d16-b86e-4597f481f6ff	\N
e3a182fa-ed4d-41fa-9f9e-a54bcc83c73d	0	2	\N	\N	d31e4d77-9dd6-421b-8101-fb0de286b3cc	\N
eb5c6496-4ebb-4076-a765-345540895403	0	3	\N	\N	7dad4247-adf4-4cda-9df0-0a6ec8504deb	\N
eb6d279a-94d7-4bda-862c-88e6f3595a3b	0	3	\N	\N	f8f27fed-3f33-4261-acec-b6f8b0fe2858	\N
eb6fcdfe-9484-4a89-86a1-d5333aa9925b	0	3	\N	\N	ce2f5178-4549-436c-8824-1ccec064eb39	\N
ed36b13c-b425-4818-a6fe-7a1f7c4c22d3	0	2	\N	\N	f78089d7-bd1f-4827-ae97-3756c991a92c	\N
ee1ab6b0-2589-4c30-9340-c5ec883d1589	0	3	\N	\N	23304a6c-0eb1-41a7-b59c-1399db39cf30	\N
f01fa81d-d136-447a-839b-fd9059df310d	0	1	\N	\N	e4e73332-f121-469d-b2ad-20b2c5d2e4da	\N
f3425e39-be63-4c4a-bf0e-3693ccbbd00d	0	3	\N	\N	57ce8f84-e8c1-4390-8316-4f65fae589b8	\N
f9af9bed-c964-43b3-b30b-c555fe1f7e89	0	2	\N	\N	f8f27fed-3f33-4261-acec-b6f8b0fe2858	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
bd258c22-b3cb-401c-8319-2a1b5451de12	Сборка, сварка рам к/с г/п 120-130 т.	6	3fab5ee3-7ed7-4901-8404-8161ab0da664	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0d14caf6-be14-4af2-8570-4e834400ce46	Поперечина №3 рамы с опорами	75132-2801152	t	2	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
148ed4e0-d99c-4139-9a6e-2b3506c100e6	Лонжерон рамы правый	75131-2801014-41	t	2	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
16a29960-8ace-45b9-ace0-1b355bb7ed7f	Поперечина рамы задняя	75131-2801300-20	t	2	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
2902c72f-b342-4200-b358-9a60c492d8fd	Опора	75131-2801188	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
3a13686e-5148-4099-9e8f-cfcfd8d62717	Лонжерон рамы правый	75131-2801016-70	t	2	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
3b198342-2a4f-4bc9-89e8-60c0e8f8085b	Лонжерон рамы левый	75131-2801015-41	t	2	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
45ec4417-38f7-435c-b31b-ca9c968166a1	Поперечина	75131-2801325	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
45f7d46f-1667-4bfb-974e-e8ee17ab828c	Опора	75131-2801188	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
4d8515e0-c8db-4cd5-8bad-9eee5c6d60b0	Лонжерон рамы левый	75131-2801017-70	t	2	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
541a1f12-ddba-4792-9d3e-c5f77a787d41	Опора	75131-2801188	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
55b99254-5eeb-4eb6-b75c-7279bb0b6bd1	Накладка рамы поперечная передняя	75131-2801088-70	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
60d698e5-81cc-4bae-8a1b-2d98c2337566	Поперечина	75131-2801325	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
62de2570-242d-4ab1-aa19-056d9bee6a0c	Поперечина	75131-2801103-10	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
6de79a20-727b-40f1-b9a4-aa57ed896969	Накладка рамы поперечная передняя	75131-2801088-70	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
70233208-87bc-417d-9a3d-5d94257a19fe	Кронштейн задней опоры	75131-8521182-20	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
73c45eb6-514e-445a-9875-8bd4601c6dcd	Поперечина рамы задняя	75131-2801300-20	t	2	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
7512ae8c-da00-43a5-9b7c-42715df217b9	Лонжерон рамы правый	75131-2801016-70	t	2	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
75fe6f21-e256-44ef-92a4-3b7ab0016672	Опора	75131-2801188	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
7f2c8c70-07ad-4552-b7b9-2b0f30910218	Лист нижний	75131-2801358-10	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
8256aee9-be75-444b-9a5b-26eef147f357	Лист верхний	75131-2801357-10	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
82b212c3-d6ae-4fb9-9b1a-762ee820c6d2	Лонжерон рамы левый	75131-2801017-70	t	2	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
8f98833c-90e4-4f2b-91b5-760ffbaedc04	Кронштейн задней опоры	75131-8521183-20	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
968420b6-7154-4232-843d-c37ab352599b	Опора	75131-2801188	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
97754f2e-bccd-4b9e-8cb7-081a131c68bc	Кронштейн задней опоры	75131-8521182-20	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
9d8c29d9-e2a2-4c09-b765-29453344fdfe	Рама	7513D-2800010-20	t	1	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	4536492774
a01c9eac-6e81-4f7d-b41d-1483cdb6bde4	Накладка рамы поперечная передняя	75131-2801088-70	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
b78d8de6-c7af-4c98-b32e-48c8bb8052fb	Опора	75131-2801188	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
c5f00d1b-6dd6-43f2-a431-a119bd864e28	Поперечина №3 рамы с опорами	75132-2801152	t	2	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
c6944b48-ac72-4975-9069-984fa276f90b	Усилитель	75131-2801115-01	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
c7b0b461-7526-4345-a28b-bb0cc7220eb3	Рама	75131-2800010-70	t	1	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	4536479362
c81487b2-a2b8-4ce0-80c6-1ef63dade9c2	Накладка рамы поперечная передняя	75131-2801088-70	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
c9051d90-7a47-4d94-91ce-84ec09385ba1	Лонжерон рамы правый	75131-2801014-41	t	2	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
cfe54fa0-f479-4226-a058-0ab674891c3b	Усилитель	75131-2801114-01	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
d57aaf71-ab1c-499d-a220-392cff06349a	Опора	75131-2801188	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
da8c7772-552c-442e-ae9c-ff90140a9381	Опора	75131-2801188	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
dfcb8c1d-7054-42bd-9d0b-dba2238b0f96	Поперечина	75131-2801103-10	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
e5d68b2f-ff4f-4abd-a770-72ea3e7c9c62	Кронштейн задней опоры	75131-8521183-20	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
f6685936-3ba7-4ccb-993a-e27853923758	Усилитель	75131-2801115-01	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
f7b04426-81f6-4e0b-ab6c-fb6a1ee27caf	Лист верхний	75131-2801357-10	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
ffca4334-3804-4aa6-b559-65f7c2d07e15	Усилитель	75131-2801114-01	t	3	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N	\N	\N
c98a05a7-7426-4d46-bb7d-4d0f291c1721	Лист нижний	75131-2801358-10	t	3	f000a3cc-c7a2-41f1-851f-2c8342ced419	bd258c22-b3cb-401c-8319-2a1b5451de12	a9566f12-a3d8-4cc0-8425-1c5381aa2805	\N	\N	\N
e977b865-aadb-455a-a1c8-acf8a00f7b8a	Лонжерон рамы левый	75131-2801015-41	t	2	e39289d7-98b6-441a-a19f-5283413c42e3	bd258c22-b3cb-401c-8319-2a1b5451de12	a9566f12-a3d8-4cc0-8425-1c5381aa2805	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
ac45e50c-d0db-4d7f-8cbf-7c1a71ccb107	Admin	\N
071b33c8-e932-4c0e-b09b-d99304e459cd	Master	\N
6c3fe402-141a-4376-8f09-4b58965972e0	Welder	\N
2884c23f-23f7-476a-961c-bb7a45b59881	Inspector	\N
826f8044-78bb-4a60-bc9e-a8c689f7a732	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "IdFromSystem") FROM stdin;
0218a26f-13ba-4440-8186-3ce4a28d6926	2023-03-06 19:05:12.63403	6cad8461-70e9-4bf0-be5c-b8a7a5988b85	\N
04aaf4ad-8e1d-4e66-9134-c4cee1eb8420	2023-03-06 19:05:12.636712	e897337c-20d7-4c12-9410-c585707de17d	\N
0a65e58f-d6e2-4938-bc58-f91135146931	2023-03-06 19:05:12.635415	560ee5b0-d832-4dba-8523-e57f44b16552	\N
0a902f40-6b74-46eb-ba72-0c6d1ac0f774	2023-03-06 19:05:12.639165	d4c0532d-27aa-4d3e-9800-c24fa98cbe34	\N
0d7a8235-d38b-47d4-b4e6-3db6f3373586	2023-03-06 19:05:12.6147	3e33fa20-e4de-4a25-bdca-235806a47043	\N
0eb5ca74-98aa-46f3-96a5-f85de9237850	2023-03-06 19:05:12.633899	ce519af7-cace-493b-ae8d-20c44b157d64	\N
1072d9db-80cc-4792-9d59-30fec4f54858	2023-03-06 19:05:12.638956	bf983a29-f66a-491b-9eaa-d1b98ebcc6e1	\N
17ab1d63-c838-40b9-8357-10a695d29e2c	2023-03-06 19:05:12.638212	fafd97c3-a5d4-404e-a97c-72ad61262078	\N
1b9250c1-5048-4658-ac22-b488cb026f7c	2023-03-06 19:05:12.638645	e71b0150-8dc0-4a25-8445-57d52d72b94b	\N
1c93d495-e43d-4b00-a23d-152afe88c490	2023-03-06 19:05:12.634893	90c9cf3e-eaa5-4a48-87fb-d83e945ed11a	\N
1de2af96-f967-4b02-88ce-fb0f193470a3	2023-03-06 19:05:12.639486	57d70d78-fdee-43e6-be0f-29eae1a8cb69	\N
21074390-5baf-4e79-98bb-6fe0aaefed16	2023-03-06 19:05:12.635948	09d1d976-841a-46a0-a486-41c17a19c38b	\N
23b44200-ad61-404f-aed3-c0a554dc290e	2023-03-06 19:05:12.637575	a15b69fa-6e1b-4a8d-b99f-146e96baa9d3	\N
2483e64c-b7de-4509-b575-ced8dc58c350	2023-03-06 19:05:12.637135	717edae1-c28d-4964-a807-ace843365797	\N
2c22acf0-1e05-4634-86ab-d7a9bb9385a4	2023-03-06 19:05:12.639062	34e1078a-5540-47b6-928a-e46dad8f304a	\N
2e30960d-1a25-49ee-8a1e-03a7a814f6c4	2023-03-06 19:05:12.637032	97e3b425-36b3-412b-b8bc-6832bcec44ee	\N
2f1a202c-225f-4eb0-9b6a-20dbd877ab65	2023-03-06 19:05:12.63959	ac3165e0-e478-4347-bbb0-cd94e61c0713	\N
393f0d36-583d-45e9-a3f5-0586630cca57	2023-03-06 19:05:12.635838	b63f992e-cd01-4772-880a-934b579c0102	\N
3dd56b37-a0e8-4fcf-bef9-cb103c2c2ba8	2023-03-06 19:05:12.638852	13f076f6-92af-4258-baaf-11156620bd1d	\N
40dc4741-9ffa-4e8a-b05e-c7172fe67253	2023-03-06 19:05:12.638328	0238a767-08fe-49c6-87d8-255666f9e40f	\N
45c6a877-0eb4-4dea-b39e-f7120a1e24ad	2023-03-06 19:05:12.636602	898f17d0-fd66-4b6c-b372-7cc8b25808fc	\N
482968e5-69f1-47a2-8f6f-731443233f11	2023-03-06 19:05:12.635182	79729ea5-bb52-4164-b947-f51f0fea3f7e	\N
51b1c5de-4244-4c1d-85af-1bfe5a608968	2023-03-06 19:05:12.636161	b4b9a9e3-2a79-4759-91f2-cbc2e462b044	\N
5334080e-1783-49fe-a249-825237a9288d	2023-03-06 19:05:12.637682	e30cb32c-6c92-4642-a9e9-8c5b7f5b6cc9	\N
563a1d83-8bc7-41b3-8f2a-7d0b0f5f26d6	2023-03-06 19:05:12.634247	e02cc13f-3826-41ab-be39-da67be655231	\N
5bf74401-74f0-48af-b374-4417eb5ba41b	2023-03-06 19:05:12.637466	b6933863-f729-4fa2-a088-2a3861be9a99	\N
6a3e2ac0-3587-4e4f-97c4-7313e391f1a6	2023-03-06 19:05:12.636492	e347b391-8761-40a0-8b55-81e9fe24d53a	\N
6a542395-1b77-4fae-878e-1de74ecb1db6	2023-03-06 19:05:12.639376	4f04eef6-6b4b-4eba-be4b-5ca47de258d0	\N
6b6add9a-cf2d-4ca7-85f0-81df12a6004e	2023-03-06 19:05:12.635306	5cea1d5b-9f64-40dd-bacc-e2d4288f6ee7	\N
728db6be-860f-4924-878f-38005c80255c	2023-03-06 19:05:12.635521	5b3749bd-f558-47bd-be2c-15458ac749b9	\N
7a3b0c16-0d1e-4a09-bd89-555811038c51	2023-03-06 19:05:12.637349	7c43d741-f00c-4733-8c0a-6152a6588c75	\N
82901480-a040-4c5c-ac3a-f8a02f08ddc6	2023-03-06 19:05:12.638539	740d5dd2-3b23-427d-ba80-27d7244ffb31	\N
8dc7d8a7-141b-4ee5-9d28-85f8e4529cce	2023-03-06 19:05:12.636269	eaea1cc8-533c-4591-bb28-80ac7afe8bae	\N
8f496403-a861-4c78-80de-e5f2eae9088f	2023-03-06 19:05:12.636375	944e6d05-9aa0-4329-81aa-6aa5ca8d10b3	\N
915c4fba-d618-45fe-9adb-15bbd8b449a8	2023-03-06 19:05:12.634629	c5953057-10b1-418f-b82f-3735efe6b266	\N
9d6cbeca-aba2-4165-b986-f4f6425850db	2023-03-06 19:05:12.636054	34a7e57f-6d37-44bc-b683-4028beef785e	\N
9fb514f6-d523-4c91-b869-538e05c546fd	2023-03-06 19:05:12.638432	6717ed10-4e41-4798-8a1a-ef4c4b452cd9	\N
a6e6827e-2148-456a-a104-0815316cda74	2023-03-06 19:05:12.638107	8d047d07-6fc8-4f98-abca-e8bfcbdfb94a	\N
b12049c3-e984-4df7-ba8f-83c562586953	2023-03-06 19:05:12.63476	ed8aca9e-68b3-4dcf-8920-92b6a5f34f26	\N
bef6da6a-0080-4793-a1b5-558f522eeaa5	2023-03-06 19:05:12.637891	edf289db-b6d2-4904-b194-b81af4d03389	\N
c0d26591-abb6-4dce-9d0a-08b8c70e1a7a	2023-03-06 19:05:12.636819	227c5391-afa3-44e6-8261-d306ddd3219d	\N
c14a3475-f569-412a-8eaa-90759b589017	2023-03-06 19:05:12.637241	05f9320c-3edf-4be6-ab2c-0eaf0203b356	\N
c9ff3f16-7101-4fb5-bb25-c0652bb66bba	2023-03-06 19:05:12.639272	104d144e-4718-4e85-ad72-5763e7077c1b	\N
d20ab93f-3a0b-4775-bc8d-c1db421916c8	2023-03-06 19:05:12.635732	fc6690e9-4718-47e5-aa7a-bc91abffa31c	\N
d7498086-5d22-4097-b2b0-04a5431a9b42	2023-03-06 19:05:12.637788	ee152ed6-5f6f-4e11-bfba-5c169135f4a1	\N
d885adb0-a2f9-4e65-ba99-8aaaf08e1aa4	2023-03-06 19:05:12.634139	afc11dc1-f4fc-46f7-98c8-8d48016fd6bc	\N
e44a922b-387d-4be7-a935-32406d575684	2023-03-06 19:05:12.634356	ac0b52b2-b154-4155-8a96-540a0ba51723	\N
ee289c72-6344-4831-b2d6-f557d1fc9e67	2023-03-06 19:05:12.636928	e640445c-cbbb-4318-9bac-b4334ccdc3d1	\N
eee94235-9e4d-4621-a4f9-7abfad37eead	2023-03-06 19:05:12.637997	954e11cd-b74a-4e44-bbc0-fb17ca0bd31a	\N
f31971cc-7aeb-4b56-a86e-ee25c6814b91	2023-03-06 19:05:12.63875	15da4e9f-b77e-4fd8-bd00-4bf0838391f0	\N
f32536d6-97f9-438b-8018-7b44916b9ce3	2023-03-06 19:05:12.639693	1f4dd077-8a88-4794-b6f6-eba9ea308362	\N
f3b4089a-a2bc-4b28-a137-1f3ca250518b	2023-03-06 19:05:12.635629	eeafffd7-0731-4bee-b6c8-7f83d1e4c318	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0121c109-5332-4fa1-8e10-4a80662ffe78	0	3	\N	\N	7a3b0c16-0d1e-4a09-bd89-555811038c51	\N
071383aa-6776-45f4-8081-6e8f3565b2c8	0	1	\N	\N	1b9250c1-5048-4658-ac22-b488cb026f7c	\N
09889d23-4fba-4e13-855b-c2137919f561	0	1	\N	\N	0eb5ca74-98aa-46f3-96a5-f85de9237850	\N
09d07cb7-11b8-471f-8b74-b4e9b0c4df0e	0	1	\N	\N	51b1c5de-4244-4c1d-85af-1bfe5a608968	\N
0bba7bf2-4868-4c00-9c40-b0ebd8a73b90	0	3	\N	\N	b12049c3-e984-4df7-ba8f-83c562586953	\N
0be49403-28f5-49df-9c7f-00e87ee03191	0	1	\N	\N	d885adb0-a2f9-4e65-ba99-8aaaf08e1aa4	\N
103e4942-d0a1-4d5d-bdcb-2c766c0ec9b4	0	3	\N	\N	f32536d6-97f9-438b-8018-7b44916b9ce3	\N
1309d1a6-c1e5-4bad-835b-c7526c8b0369	0	1	\N	\N	0d7a8235-d38b-47d4-b4e6-3db6f3373586	\N
1316446c-24b8-4e5c-b001-3d90fbcd7a08	0	2	\N	\N	a6e6827e-2148-456a-a104-0815316cda74	\N
13a4fec4-123d-4803-89a7-b82734908b27	0	2	\N	\N	f3b4089a-a2bc-4b28-a137-1f3ca250518b	\N
157d26cb-c003-4cb3-84c4-c3366974e5b3	0	3	\N	\N	f31971cc-7aeb-4b56-a86e-ee25c6814b91	\N
16e6dd29-dcac-4d8f-b669-593d564f0f99	0	2	\N	\N	915c4fba-d618-45fe-9adb-15bbd8b449a8	\N
20617358-190b-410b-8ad4-2b1c06ad6bcf	0	1	\N	\N	1de2af96-f967-4b02-88ce-fb0f193470a3	\N
2259a15b-269a-45a1-9874-02d6ff0274c9	0	2	\N	\N	51b1c5de-4244-4c1d-85af-1bfe5a608968	\N
25adec48-091e-413c-b417-e32c49e14a81	0	1	\N	\N	c14a3475-f569-412a-8eaa-90759b589017	\N
2837ad40-5223-4098-84d5-b6dabd50084e	0	2	\N	\N	6a3e2ac0-3587-4e4f-97c4-7313e391f1a6	\N
292f11be-70d2-468c-832c-03031f0b9459	0	1	\N	\N	8dc7d8a7-141b-4ee5-9d28-85f8e4529cce	\N
2d26e87f-d92f-48ea-a41e-dee5e23a2c09	0	3	\N	\N	8f496403-a861-4c78-80de-e5f2eae9088f	\N
2e33f282-f9d1-408e-a27e-b1ef01be59d0	0	1	\N	\N	6b6add9a-cf2d-4ca7-85f0-81df12a6004e	\N
31e3ec09-579a-4827-9795-5fa6d60f22ed	0	3	\N	\N	6b6add9a-cf2d-4ca7-85f0-81df12a6004e	\N
3755af02-9950-4544-bc10-15ee2b1abf1b	0	3	\N	\N	c14a3475-f569-412a-8eaa-90759b589017	\N
39cc771d-7230-4c4b-ad56-21b75aa7047f	0	3	\N	\N	1b9250c1-5048-4658-ac22-b488cb026f7c	\N
3b99be90-8dae-4668-a6ff-0f7dacf1eeef	0	2	\N	\N	40dc4741-9ffa-4e8a-b05e-c7172fe67253	\N
3cc45950-b8d1-49e0-b2a6-670440cc69cf	0	3	\N	\N	04aaf4ad-8e1d-4e66-9134-c4cee1eb8420	\N
439c2a2a-e3e0-463b-afc2-64e726f5eb4e	0	1	\N	\N	17ab1d63-c838-40b9-8357-10a695d29e2c	\N
4766689a-0889-4098-9ec7-60175d0fe15a	0	2	\N	\N	bef6da6a-0080-4793-a1b5-558f522eeaa5	\N
47e2535a-7a78-41ef-bf62-c13eb0e06b20	0	2	\N	\N	d7498086-5d22-4097-b2b0-04a5431a9b42	\N
481558d1-5455-49b8-96b7-9a95dfd2959c	0	2	\N	\N	45c6a877-0eb4-4dea-b39e-f7120a1e24ad	\N
499c0ab5-b4a5-4d9f-b297-f79c78067b75	0	3	\N	\N	23b44200-ad61-404f-aed3-c0a554dc290e	\N
4a519173-8274-4545-b8c2-2b85045128aa	0	1	\N	\N	eee94235-9e4d-4621-a4f9-7abfad37eead	\N
4ae7eff8-a3b7-4af2-8a54-145a61a9b098	0	2	\N	\N	c9ff3f16-7101-4fb5-bb25-c0652bb66bba	\N
4e2860f8-ca92-40e7-8756-bac79d677b0a	0	2	\N	\N	2e30960d-1a25-49ee-8a1e-03a7a814f6c4	\N
4ef5c5ac-603b-4580-8e47-46c035fd9219	0	3	\N	\N	1072d9db-80cc-4792-9d59-30fec4f54858	\N
4fd37416-a6b0-46c6-a2b8-db1f76f67877	0	3	\N	\N	8dc7d8a7-141b-4ee5-9d28-85f8e4529cce	\N
50b04b6b-bb82-4ca7-ad5a-43454b47c9e3	0	1	\N	\N	0a65e58f-d6e2-4938-bc58-f91135146931	\N
5189a014-a46e-44c2-b533-7fd31794118b	0	2	\N	\N	f32536d6-97f9-438b-8018-7b44916b9ce3	\N
547e4afd-11e7-4393-a3fc-c7399ff48f75	0	1	\N	\N	8f496403-a861-4c78-80de-e5f2eae9088f	\N
55649468-b510-435c-97c7-2128d538fc64	0	1	\N	\N	d7498086-5d22-4097-b2b0-04a5431a9b42	\N
567cf665-1132-49cf-bb5e-255d55b6c899	0	2	\N	\N	f31971cc-7aeb-4b56-a86e-ee25c6814b91	\N
56be3cae-ad55-4d53-8f03-77b2cee54bb0	0	2	\N	\N	5334080e-1783-49fe-a249-825237a9288d	\N
5a0bedfc-9edf-440a-921b-c678c72bbef0	0	2	\N	\N	0a902f40-6b74-46eb-ba72-0c6d1ac0f774	\N
5b50eacd-1f9d-4bbb-ace7-c6c2fa69890f	0	3	\N	\N	9d6cbeca-aba2-4165-b986-f4f6425850db	\N
5c0fd6a9-ec7d-48c7-8419-4f2f49949b02	0	2	\N	\N	2c22acf0-1e05-4634-86ab-d7a9bb9385a4	\N
5d760c2c-b5e0-480c-a3fd-d82f2edd96de	0	2	\N	\N	482968e5-69f1-47a2-8f6f-731443233f11	\N
5d9f7c36-7ac4-4034-846a-fcc046b4af4a	0	2	\N	\N	0d7a8235-d38b-47d4-b4e6-3db6f3373586	\N
5e59b240-168e-4d3c-8aeb-cb9fff640183	0	3	\N	\N	d7498086-5d22-4097-b2b0-04a5431a9b42	\N
6020d506-0ed9-4bdc-bcfb-9a49a9c240e5	0	1	\N	\N	c0d26591-abb6-4dce-9d0a-08b8c70e1a7a	\N
6074a83e-3923-448b-b791-00a62c9d32ca	0	2	\N	\N	5bf74401-74f0-48af-b374-4417eb5ba41b	\N
6085d4c3-b250-4359-9e50-5810331dee66	0	2	\N	\N	728db6be-860f-4924-878f-38005c80255c	\N
63859d59-914b-47cf-9f5f-0dd4658835d2	0	3	\N	\N	c9ff3f16-7101-4fb5-bb25-c0652bb66bba	\N
6540e2c4-93f3-4fd9-8c09-8b0de57e064f	0	3	\N	\N	3dd56b37-a0e8-4fcf-bef9-cb103c2c2ba8	\N
677553bd-d38f-4d16-9278-1fe6fb4d94e2	0	3	\N	\N	f3b4089a-a2bc-4b28-a137-1f3ca250518b	\N
6c1b4c38-afe0-440d-ad5d-2b9fad6d24a9	0	2	\N	\N	c0d26591-abb6-4dce-9d0a-08b8c70e1a7a	\N
6d325440-8094-401b-918c-0d508a31b347	0	3	\N	\N	eee94235-9e4d-4621-a4f9-7abfad37eead	\N
6e7e4fc6-095b-48c4-9903-2ba5a65b1cf3	0	2	\N	\N	0218a26f-13ba-4440-8186-3ce4a28d6926	\N
6f22b2d2-a54c-49fc-bc6d-ddce1dd6de14	0	2	\N	\N	23b44200-ad61-404f-aed3-c0a554dc290e	\N
6fbc6f41-179a-4cb4-b67f-79433c6c7fd4	0	3	\N	\N	482968e5-69f1-47a2-8f6f-731443233f11	\N
7272263d-e0cf-49c1-84b0-149fa88ad77f	0	3	\N	\N	d885adb0-a2f9-4e65-ba99-8aaaf08e1aa4	\N
74ebe0d8-07ee-4e95-b361-67fb795ef42d	0	3	\N	\N	d20ab93f-3a0b-4775-bc8d-c1db421916c8	\N
757ba198-323b-42f4-b6ee-a1fe9f951e4e	0	3	\N	\N	5334080e-1783-49fe-a249-825237a9288d	\N
7652e27b-432e-4cf6-a7d7-a803e578933b	0	1	\N	\N	5334080e-1783-49fe-a249-825237a9288d	\N
7819bd2b-f85a-40b2-a744-a40db305485a	0	3	\N	\N	82901480-a040-4c5c-ac3a-f8a02f08ddc6	\N
788fe7de-5a8e-47e2-ab50-0f5ca04a22ef	0	1	\N	\N	0218a26f-13ba-4440-8186-3ce4a28d6926	\N
7a34660b-3fe7-4142-8b21-e2d1bf08d4bb	0	1	\N	\N	a6e6827e-2148-456a-a104-0815316cda74	\N
7d9646e3-9c6c-4fb7-9a54-4d6d2e04bd1b	0	2	\N	\N	9d6cbeca-aba2-4165-b986-f4f6425850db	\N
7dccb746-b8ea-4072-b688-7184b7d18806	0	1	\N	\N	21074390-5baf-4e79-98bb-6fe0aaefed16	\N
7fb40389-f7ed-4088-b9c7-d0247e367910	0	2	\N	\N	e44a922b-387d-4be7-a935-32406d575684	\N
80985746-15e9-47ba-a916-3cc591c2e13a	0	1	\N	\N	6a3e2ac0-3587-4e4f-97c4-7313e391f1a6	\N
81dff3c3-4729-4fad-b756-ad3203213893	0	3	\N	\N	6a542395-1b77-4fae-878e-1de74ecb1db6	\N
824e5023-957e-4b76-b454-c32fd0649124	0	3	\N	\N	9fb514f6-d523-4c91-b869-538e05c546fd	\N
82d256cd-76ee-4e3c-a8f2-ae237e18d199	0	2	\N	\N	7a3b0c16-0d1e-4a09-bd89-555811038c51	\N
833a7833-17eb-46ab-b438-edaaa00373d5	0	2	\N	\N	21074390-5baf-4e79-98bb-6fe0aaefed16	\N
83c18f75-374c-4fcd-8674-8ed6544bd889	0	3	\N	\N	a6e6827e-2148-456a-a104-0815316cda74	\N
843252d1-b542-4acf-bef0-e5e3466855f6	0	1	\N	\N	f32536d6-97f9-438b-8018-7b44916b9ce3	\N
8690baef-e441-4828-86c2-4cccf12b34cf	0	3	\N	\N	5bf74401-74f0-48af-b374-4417eb5ba41b	\N
8ab21433-74c7-4a3f-a6d1-c20bae1647c6	0	1	\N	\N	5bf74401-74f0-48af-b374-4417eb5ba41b	\N
8c3daab8-0f83-45b7-a6a1-9f955c53e381	0	2	\N	\N	6a542395-1b77-4fae-878e-1de74ecb1db6	\N
8d9ce6fd-765e-4e98-b5fa-0a2738214456	0	2	\N	\N	82901480-a040-4c5c-ac3a-f8a02f08ddc6	\N
8ed2eb47-7cbc-450d-a616-c9bb4cb52d84	0	1	\N	\N	bef6da6a-0080-4793-a1b5-558f522eeaa5	\N
8f7cc74b-db95-43c2-9bc5-ef0cdcd55010	0	2	\N	\N	c14a3475-f569-412a-8eaa-90759b589017	\N
911b86fb-177b-49e5-9214-1385bfc0a37b	0	1	\N	\N	c9ff3f16-7101-4fb5-bb25-c0652bb66bba	\N
9299a215-a3ae-4da7-9880-03dd47bbd740	0	2	\N	\N	1b9250c1-5048-4658-ac22-b488cb026f7c	\N
945c6f20-c60e-4667-bf10-d40a1f70cb78	0	2	\N	\N	04aaf4ad-8e1d-4e66-9134-c4cee1eb8420	\N
94e18d51-22e0-4a33-911a-a3fde5d74c50	0	3	\N	\N	40dc4741-9ffa-4e8a-b05e-c7172fe67253	\N
97f8de99-f6af-4670-b60a-ca95b41080e8	0	2	\N	\N	d885adb0-a2f9-4e65-ba99-8aaaf08e1aa4	\N
98e3783e-1481-4fba-92a3-f743d7d621fd	0	2	\N	\N	2483e64c-b7de-4509-b575-ced8dc58c350	\N
9b44f6ee-02d9-41e7-a322-7f0e54cd8e74	0	1	\N	\N	40dc4741-9ffa-4e8a-b05e-c7172fe67253	\N
9c518f7d-7e69-4450-a510-a3e73dfa2b30	0	1	\N	\N	2e30960d-1a25-49ee-8a1e-03a7a814f6c4	\N
9dba4b52-ec77-4a4a-992a-eb7a2fe1cff5	0	1	\N	\N	482968e5-69f1-47a2-8f6f-731443233f11	\N
9e38ac3e-b66e-40c3-ba0d-5b562ee634b6	0	1	\N	\N	7a3b0c16-0d1e-4a09-bd89-555811038c51	\N
9f83c918-bc40-40f8-a716-955fd509db4e	0	1	\N	\N	f3b4089a-a2bc-4b28-a137-1f3ca250518b	\N
9f97c7cf-0162-43f1-9dc0-e84d24fe782c	0	1	\N	\N	9fb514f6-d523-4c91-b869-538e05c546fd	\N
a1f25f6b-c055-4920-bd4c-194975a24f47	0	3	\N	\N	2e30960d-1a25-49ee-8a1e-03a7a814f6c4	\N
a22cc6af-0d88-414b-875a-05c559320d2a	0	2	\N	\N	eee94235-9e4d-4621-a4f9-7abfad37eead	\N
a29a0057-225a-47bb-bb5c-05b1e357cfd8	0	3	\N	\N	2483e64c-b7de-4509-b575-ced8dc58c350	\N
a444f877-d42b-474f-bfed-fe6ca17c08ee	0	1	\N	\N	04aaf4ad-8e1d-4e66-9134-c4cee1eb8420	\N
a4971114-a159-4157-96a1-c1728fb0e49b	0	1	\N	\N	728db6be-860f-4924-878f-38005c80255c	\N
a4b35a7c-15c1-4c2c-a151-b37b4bde3a92	0	1	\N	\N	45c6a877-0eb4-4dea-b39e-f7120a1e24ad	\N
a8022a22-d264-44f1-b00e-88f4103b8931	0	2	\N	\N	0a65e58f-d6e2-4938-bc58-f91135146931	\N
aaa8e25f-ee03-4458-a42e-1b0d78513298	0	3	\N	\N	1de2af96-f967-4b02-88ce-fb0f193470a3	\N
ad348c69-f383-4e84-9a68-503cc76e4132	0	3	\N	\N	6a3e2ac0-3587-4e4f-97c4-7313e391f1a6	\N
aefe7bc2-0f60-48e0-b51e-a611084fc788	0	2	\N	\N	1de2af96-f967-4b02-88ce-fb0f193470a3	\N
af68afc3-b4b1-46e3-bfa6-ef07b2e4d6bb	0	2	\N	\N	6b6add9a-cf2d-4ca7-85f0-81df12a6004e	\N
afd57a76-ac40-49e6-aeeb-f1dd5b720ff2	0	3	\N	\N	563a1d83-8bc7-41b3-8f2a-7d0b0f5f26d6	\N
b0352125-de20-40bc-a4fd-6efc4ae939e3	0	1	\N	\N	915c4fba-d618-45fe-9adb-15bbd8b449a8	\N
b039543d-e4df-4e3d-8f50-0adf7aec2c7c	0	3	\N	\N	45c6a877-0eb4-4dea-b39e-f7120a1e24ad	\N
b03b430d-0068-4b51-b165-fe4d90a5810f	0	3	\N	\N	393f0d36-583d-45e9-a3f5-0586630cca57	\N
b09970d9-7cd6-49ac-b156-8002f9a18115	0	1	\N	\N	1c93d495-e43d-4b00-a23d-152afe88c490	\N
b2b7d316-9104-4966-b107-db304bc83679	0	1	\N	\N	9d6cbeca-aba2-4165-b986-f4f6425850db	\N
b50e09ec-55bf-4f45-8b68-256c406dc73a	0	1	\N	\N	d20ab93f-3a0b-4775-bc8d-c1db421916c8	\N
b60785ad-88ec-4b8a-bd6d-0594a846b5fb	0	3	\N	\N	1c93d495-e43d-4b00-a23d-152afe88c490	\N
ba303a82-77e4-489f-aaae-984f52866f41	0	2	\N	\N	b12049c3-e984-4df7-ba8f-83c562586953	\N
bb8dc554-d01b-402e-b2e9-adc6cef70137	0	3	\N	\N	2f1a202c-225f-4eb0-9b6a-20dbd877ab65	\N
bc55c01d-6549-45b3-b8d2-6db5f435ab7b	0	3	\N	\N	0218a26f-13ba-4440-8186-3ce4a28d6926	\N
bf372975-3e0b-454c-ac32-ae5cd7eb0e8f	0	3	\N	\N	0d7a8235-d38b-47d4-b4e6-3db6f3373586	\N
c00fb2fa-610b-495c-86a3-c39bd78bb9c3	0	2	\N	\N	8f496403-a861-4c78-80de-e5f2eae9088f	\N
c0bc1976-c0c4-4b6f-afd6-3885d66980b8	0	3	\N	\N	e44a922b-387d-4be7-a935-32406d575684	\N
c158ebab-b6f7-44cb-88bc-89e7e474ce61	0	2	\N	\N	9fb514f6-d523-4c91-b869-538e05c546fd	\N
c5225c74-4304-4ee4-9608-69d931732ec0	0	3	\N	\N	2c22acf0-1e05-4634-86ab-d7a9bb9385a4	\N
c5294ba7-6a31-43bc-b3e1-58c703cb733a	0	2	\N	\N	2f1a202c-225f-4eb0-9b6a-20dbd877ab65	\N
c560c187-38b9-495d-93a9-559a24da4007	0	1	\N	\N	2f1a202c-225f-4eb0-9b6a-20dbd877ab65	\N
c6dd94bb-3a56-454c-99fb-2b08b6cde122	0	2	\N	\N	3dd56b37-a0e8-4fcf-bef9-cb103c2c2ba8	\N
c81559ef-f965-4974-ad51-3250f37670be	0	3	\N	\N	ee289c72-6344-4831-b2d6-f557d1fc9e67	\N
c9509947-a766-4e2e-86d6-eb449d28ed21	0	1	\N	\N	e44a922b-387d-4be7-a935-32406d575684	\N
cc29da71-a534-4fa2-9dc4-bead88656957	0	3	\N	\N	0a902f40-6b74-46eb-ba72-0c6d1ac0f774	\N
cd2667bd-17fa-4df7-85ac-58271b6e77f1	0	3	\N	\N	c0d26591-abb6-4dce-9d0a-08b8c70e1a7a	\N
d2c45d54-7358-44c4-a811-681a816153e4	0	3	\N	\N	21074390-5baf-4e79-98bb-6fe0aaefed16	\N
d47b8f74-e320-4d15-9b76-312ae14c958f	0	2	\N	\N	1c93d495-e43d-4b00-a23d-152afe88c490	\N
d7f6e7ad-4b18-4365-a7b1-26fc68c01bb4	0	1	\N	\N	563a1d83-8bc7-41b3-8f2a-7d0b0f5f26d6	\N
d915282e-d1a8-4a0b-bf08-0218852a3ef2	0	3	\N	\N	915c4fba-d618-45fe-9adb-15bbd8b449a8	\N
d9ae7deb-7a68-4b08-b688-a94727192eb7	0	1	\N	\N	6a542395-1b77-4fae-878e-1de74ecb1db6	\N
da175dc3-9560-4677-9e01-333ff67ee88f	0	3	\N	\N	0a65e58f-d6e2-4938-bc58-f91135146931	\N
dc8b5449-d8f3-4b35-b336-39065b9e3bfb	0	1	\N	\N	393f0d36-583d-45e9-a3f5-0586630cca57	\N
df51b20a-b26f-4cd6-b6d8-f9668508233a	0	2	\N	\N	0eb5ca74-98aa-46f3-96a5-f85de9237850	\N
dfa9d191-47d5-43a4-afda-7c03c9fd782b	0	1	\N	\N	f31971cc-7aeb-4b56-a86e-ee25c6814b91	\N
e269dbc3-f0dd-46bc-a0e8-57e5988599d5	0	1	\N	\N	1072d9db-80cc-4792-9d59-30fec4f54858	\N
e58424e7-8edb-4fbf-b01f-bf95aff59456	0	3	\N	\N	728db6be-860f-4924-878f-38005c80255c	\N
e7f2cf49-a535-4c1c-b91f-a8526587d8c0	0	2	\N	\N	563a1d83-8bc7-41b3-8f2a-7d0b0f5f26d6	\N
ed897add-07dc-4adb-9303-47e70a1c4fec	0	1	\N	\N	2483e64c-b7de-4509-b575-ced8dc58c350	\N
eda7a2c6-1a62-4ae6-add1-64d551fa073c	0	2	\N	\N	393f0d36-583d-45e9-a3f5-0586630cca57	\N
ee672078-e9e9-43ac-8c8c-f92461052129	0	3	\N	\N	51b1c5de-4244-4c1d-85af-1bfe5a608968	\N
ef90f2c3-346c-4659-b3c0-feeda8a8eca1	0	2	\N	\N	17ab1d63-c838-40b9-8357-10a695d29e2c	\N
efa1365b-bf21-492c-965b-06e8461c8f5f	0	1	\N	\N	2c22acf0-1e05-4634-86ab-d7a9bb9385a4	\N
f10abab5-ea01-43cc-bcd7-c38026efd537	0	3	\N	\N	0eb5ca74-98aa-46f3-96a5-f85de9237850	\N
f16c8d9b-3abf-4f57-bbb2-5e7760007065	0	2	\N	\N	ee289c72-6344-4831-b2d6-f557d1fc9e67	\N
f4f1d014-a23c-4c43-bd4f-5c475df52537	0	1	\N	\N	3dd56b37-a0e8-4fcf-bef9-cb103c2c2ba8	\N
f56de443-44b8-4e54-b530-2fbe440dbf33	0	1	\N	\N	0a902f40-6b74-46eb-ba72-0c6d1ac0f774	\N
f590daa3-a08e-44a8-8a42-82bd95ee2c72	0	2	\N	\N	d20ab93f-3a0b-4775-bc8d-c1db421916c8	\N
f65e615f-1512-4d4e-a2d5-7ff7c97a2771	0	3	\N	\N	17ab1d63-c838-40b9-8357-10a695d29e2c	\N
f6667f84-0b56-438a-9135-0528baab306d	0	1	\N	\N	82901480-a040-4c5c-ac3a-f8a02f08ddc6	\N
f6c7c3bc-8cec-4dde-ac89-fe664f5ad76b	0	2	\N	\N	8dc7d8a7-141b-4ee5-9d28-85f8e4529cce	\N
f7f0e592-d3d4-46ad-880b-e2c7c327cf45	0	3	\N	\N	bef6da6a-0080-4793-a1b5-558f522eeaa5	\N
f93d22b7-669c-4331-9eef-63a2b7eabf2a	0	2	\N	\N	1072d9db-80cc-4792-9d59-30fec4f54858	\N
fa147cd6-e67a-4016-bd90-e021bb970b94	0	1	\N	\N	b12049c3-e984-4df7-ba8f-83c562586953	\N
fbc180a6-f32e-42dd-8570-328c6b165ba2	0	1	\N	\N	23b44200-ad61-404f-aed3-c0a554dc290e	\N
fc287d48-2b2b-4422-8a67-b9ff5083e4bd	0	1	\N	\N	ee289c72-6344-4831-b2d6-f557d1fc9e67	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0238a767-08fe-49c6-87d8-255666f9e40f	48	1900	t	f	c98a05a7-7426-4d46-bb7d-4d0f291c1721	4868f377-7730-4380-8dd0-fc4026570eb6	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
05f9320c-3edf-4be6-ab2c-0eaf0203b356	58	900	t	f	968420b6-7154-4232-843d-c37ab352599b	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
09d1d976-841a-46a0-a486-41c17a19c38b	2	1880	t	f	60d698e5-81cc-4bae-8a1b-2d98c2337566	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
104d144e-4718-4e85-ad72-5763e7077c1b	18	4000	t	f	e977b865-aadb-455a-a1c8-acf8a00f7b8a	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
13f076f6-92af-4258-baaf-11156620bd1d	58	900	t	f	da8c7772-552c-442e-ae9c-ff90140a9381	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
15da4e9f-b77e-4fd8-bd00-4bf0838391f0	56	400	t	f	da8c7772-552c-442e-ae9c-ff90140a9381	517305ac-0599-4fcc-8369-e6cded254141	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
1f4dd077-8a88-4794-b6f6-eba9ea308362	52	1200	t	f	ffca4334-3804-4aa6-b559-65f7c2d07e15	281cabce-782a-4868-81d3-3db459ee3678	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
227c5391-afa3-44e6-8261-d306ddd3219d	1	1900	t	f	8256aee9-be75-444b-9a5b-26eef147f357	fd4bcad3-2146-420a-8104-bb740c91758c	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
34a7e57f-6d37-44bc-b683-4028beef785e	52	1200	t	f	62de2570-242d-4ab1-aa19-056d9bee6a0c	281cabce-782a-4868-81d3-3db459ee3678	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
34e1078a-5540-47b6-928a-e46dad8f304a	2	1880	t	f	e5d68b2f-ff4f-4abd-a770-72ea3e7c9c62	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
3e33fa20-e4de-4a25-bdca-235806a47043	18	4000	t	f	0d14caf6-be14-4af2-8570-4e834400ce46	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
4f04eef6-6b4b-4eba-be4b-5ca47de258d0	52	1200	t	f	f6685936-3ba7-4ccb-993a-e27853923758	281cabce-782a-4868-81d3-3db459ee3678	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
560ee5b0-d832-4dba-8523-e57f44b16552	58	900	t	f	45f7d46f-1667-4bfb-974e-e8ee17ab828c	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
57d70d78-fdee-43e6-be0f-29eae1a8cb69	1	1900	t	f	f7b04426-81f6-4e0b-ab6c-fb6a1ee27caf	fd4bcad3-2146-420a-8104-bb740c91758c	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
5b3749bd-f558-47bd-be2c-15458ac749b9	55	400	t	f	541a1f12-ddba-4792-9d3e-c5f77a787d41	592d9ce4-8419-4459-a15a-bfb8580f83f0	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
5cea1d5b-9f64-40dd-bacc-e2d4288f6ee7	55	400	t	f	45f7d46f-1667-4bfb-974e-e8ee17ab828c	592d9ce4-8419-4459-a15a-bfb8580f83f0	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
6717ed10-4e41-4798-8a1a-ef4c4b452cd9	52	1200	t	f	cfe54fa0-f479-4226-a058-0ab674891c3b	281cabce-782a-4868-81d3-3db459ee3678	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
6cad8461-70e9-4bf0-be5c-b8a7a5988b85	18	4000	t	f	148ed4e0-d99c-4139-9a6e-2b3506c100e6	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
717edae1-c28d-4964-a807-ace843365797	57	400	t	f	968420b6-7154-4232-843d-c37ab352599b	25f8f554-5359-4f27-9d81-c7dd8e68346e	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
740d5dd2-3b23-427d-ba80-27d7244ffb31	54	400	t	f	d57aaf71-ab1c-499d-a220-392cff06349a	656dbe5e-bed4-4f5f-bc12-d7ed00d813ea	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
79729ea5-bb52-4164-b947-f51f0fea3f7e	2	1880	t	f	45ec4417-38f7-435c-b31b-ca9c968166a1	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
7c43d741-f00c-4733-8c0a-6152a6588c75	2	1880	t	f	97754f2e-bccd-4b9e-8cb7-081a131c68bc	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
898f17d0-fd66-4b6c-b372-7cc8b25808fc	58	900	t	f	75fe6f21-e256-44ef-92a4-3b7ab0016672	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
8d047d07-6fc8-4f98-abca-e8bfcbdfb94a	39	280	t	f	c9051d90-7a47-4d94-91ce-84ec09385ba1	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
90c9cf3e-eaa5-4a48-87fb-d83e945ed11a	1	1900	t	f	45ec4417-38f7-435c-b31b-ca9c968166a1	fd4bcad3-2146-420a-8104-bb740c91758c	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
944e6d05-9aa0-4329-81aa-6aa5ca8d10b3	39	280	t	f	73c45eb6-514e-445a-9875-8bd4601c6dcd	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
954e11cd-b74a-4e44-bbc0-fb17ca0bd31a	39	280	t	f	c81487b2-a2b8-4ce0-80c6-1ef63dade9c2	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
97e3b425-36b3-412b-b8bc-6832bcec44ee	2	1880	t	f	8f98833c-90e4-4f2b-91b5-760ffbaedc04	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
a15b69fa-6e1b-4a8d-b99f-146e96baa9d3	57	400	t	f	b78d8de6-c7af-4c98-b32e-48c8bb8052fb	25f8f554-5359-4f27-9d81-c7dd8e68346e	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
ac0b52b2-b154-4155-8a96-540a0ba51723	58	900	t	f	2902c72f-b342-4200-b358-9a60c492d8fd	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
ac3165e0-e478-4347-bbb0-cd94e61c0713	2	1880	t	f	f7b04426-81f6-4e0b-ab6c-fb6a1ee27caf	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
afc11dc1-f4fc-46f7-98c8-8d48016fd6bc	39	280	t	f	16a29960-8ace-45b9-ace0-1b355bb7ed7f	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
b4b9a9e3-2a79-4759-91f2-cbc2e462b044	39	280	t	f	6de79a20-727b-40f1-b9a4-aa57ed896969	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
b63f992e-cd01-4772-880a-934b579c0102	1	1900	t	f	60d698e5-81cc-4bae-8a1b-2d98c2337566	fd4bcad3-2146-420a-8104-bb740c91758c	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
b6933863-f729-4fa2-a088-2a3861be9a99	39	280	t	f	a01c9eac-6e81-4f7d-b41d-1483cdb6bde4	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
bf983a29-f66a-491b-9eaa-d1b98ebcc6e1	52	1200	t	f	dfcb8c1d-7054-42bd-9d0b-dba2238b0f96	281cabce-782a-4868-81d3-3db459ee3678	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
c5953057-10b1-418f-b82f-3735efe6b266	39	280	t	f	3b198342-2a4f-4bc9-89e8-60c0e8f8085b	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
ce519af7-cace-493b-ae8d-20c44b157d64	39	280	t	f	148ed4e0-d99c-4139-9a6e-2b3506c100e6	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
d4c0532d-27aa-4d3e-9800-c24fa98cbe34	39	280	t	f	e977b865-aadb-455a-a1c8-acf8a00f7b8a	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
e02cc13f-3826-41ab-be39-da67be655231	56	400	t	f	2902c72f-b342-4200-b358-9a60c492d8fd	517305ac-0599-4fcc-8369-e6cded254141	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
e30cb32c-6c92-4642-a9e9-8c5b7f5b6cc9	58	900	t	f	b78d8de6-c7af-4c98-b32e-48c8bb8052fb	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
e347b391-8761-40a0-8b55-81e9fe24d53a	54	400	t	f	75fe6f21-e256-44ef-92a4-3b7ab0016672	656dbe5e-bed4-4f5f-bc12-d7ed00d813ea	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
e640445c-cbbb-4318-9bac-b4334ccdc3d1	2	1880	t	f	8256aee9-be75-444b-9a5b-26eef147f357	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
e71b0150-8dc0-4a25-8445-57d52d72b94b	58	900	t	f	d57aaf71-ab1c-499d-a220-392cff06349a	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
e897337c-20d7-4c12-9410-c585707de17d	48	1900	t	f	7f2c8c70-07ad-4552-b7b9-2b0f30910218	4868f377-7730-4380-8dd0-fc4026570eb6	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
eaea1cc8-533c-4591-bb28-80ac7afe8bae	2	1880	t	f	70233208-87bc-417d-9a3d-5d94257a19fe	a15507c1-64de-4788-986a-9136b72a663d	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
ed8aca9e-68b3-4dcf-8920-92b6a5f34f26	18	4000	t	f	3b198342-2a4f-4bc9-89e8-60c0e8f8085b	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
edf289db-b6d2-4904-b194-b81af4d03389	52	1200	t	f	c6944b48-ac72-4975-9069-984fa276f90b	281cabce-782a-4868-81d3-3db459ee3678	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
ee152ed6-5f6f-4e11-bfba-5c169135f4a1	18	4000	t	f	c5f00d1b-6dd6-43f2-a431-a119bd864e28	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
eeafffd7-0731-4bee-b6c8-7f83d1e4c318	58	900	t	f	541a1f12-ddba-4792-9d3e-c5f77a787d41	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
fafd97c3-a5d4-404e-a97c-72ad61262078	18	4000	t	f	c9051d90-7a47-4d94-91ce-84ec09385ba1	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
fc6690e9-4718-47e5-aa7a-bc91abffa31c	39	280	t	f	55b99254-5eeb-4eb6-b75c-7279bb0b6bd1	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
25f8f554-5359-4f27-9d81-c7dd8e68346e	57	Инструкция 57	57
281cabce-782a-4868-81d3-3db459ee3678	52	Инструкция 52	52
4868f377-7730-4380-8dd0-fc4026570eb6	48	Инструкция 48	48
517305ac-0599-4fcc-8369-e6cded254141	56	Инструкция 56	56
592d9ce4-8419-4459-a15a-bfb8580f83f0	55	Инструкция 55	55
5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	18	Инструкция 18	18
656dbe5e-bed4-4f5f-bc12-d7ed00d813ea	54	Инструкция 54	54
851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	58	Инструкция 58	58
a15507c1-64de-4788-986a-9136b72a663d	2	Инструкция 2	2
a3f22123-62ae-4d45-aed1-f92f79c7005f	39	Инструкция 39	39
fd4bcad3-2146-420a-8104-bb740c91758c	1	Инструкция 1	1
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
1cb47eaa-c7c3-4603-a6bb-6685b2ae28d8	75131-2801300-20	Поперечина рамы задняя	\N	2868425
e39289d7-98b6-441a-a19f-5283413c42e3	7513D-2800010-20	Рама	\N	3330041
f000a3cc-c7a2-41f1-851f-2c8342ced419	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
475c25cf-5612-4290-a9da-02ff02224751	2884c23f-23f7-476a-961c-bb7a45b59881
ea3ed825-c41a-459a-8a0f-08d0dfa1a91b	2884c23f-23f7-476a-961c-bb7a45b59881
5ae05d1e-8d4a-4f62-a887-60253130df77	071b33c8-e932-4c0e-b09b-d99304e459cd
9c60094f-4763-4151-bea4-f3ee41adff48	071b33c8-e932-4c0e-b09b-d99304e459cd
26af3961-bfed-4e0b-8796-324cbe9d264e	6c3fe402-141a-4376-8f09-4b58965972e0
3ddcb0a9-a62d-48ec-9cbf-883e9d13a1dd	6c3fe402-141a-4376-8f09-4b58965972e0
4d0d8917-e5c2-466e-a437-687e9d859b17	6c3fe402-141a-4376-8f09-4b58965972e0
50814dad-7097-4391-9eeb-9d3a0d75b48e	6c3fe402-141a-4376-8f09-4b58965972e0
5e9685c2-eca7-47e9-a23c-34c76a6a09c7	6c3fe402-141a-4376-8f09-4b58965972e0
8ab4b604-8946-4443-9c22-8836459b0e84	6c3fe402-141a-4376-8f09-4b58965972e0
a8276524-626c-493c-9b2f-c499295ad9cb	6c3fe402-141a-4376-8f09-4b58965972e0
b0eeb6a5-7da9-49c4-ab2c-7fb3d7eb950b	6c3fe402-141a-4376-8f09-4b58965972e0
022a4e3e-6648-495b-9124-eed7b0839444	826f8044-78bb-4a60-bc9e-a8c689f7a732
09f9db4f-5196-490c-9831-51cd13671c6f	ac45e50c-d0db-4d7f-8cbf-7c1a71ccb107
a846e803-6143-4804-b4f3-b359bb21945b	6c3fe402-141a-4376-8f09-4b58965972e0
ac76f48b-137b-4d65-92d3-21580f69fdf2	2884c23f-23f7-476a-961c-bb7a45b59881
1b937b65-0b12-42c7-8dd7-3103f68c8843	826f8044-78bb-4a60-bc9e-a8c689f7a732
04e61cd6-f65f-4241-ae24-627d718711bf	071b33c8-e932-4c0e-b09b-d99304e459cd
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
475c25cf-5612-4290-a9da-02ff02224751	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
ea3ed825-c41a-459a-8a0f-08d0dfa1a91b	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
5ae05d1e-8d4a-4f62-a887-60253130df77	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
9c60094f-4763-4151-bea4-f3ee41adff48	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
26af3961-bfed-4e0b-8796-324cbe9d264e	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
3ddcb0a9-a62d-48ec-9cbf-883e9d13a1dd	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
4d0d8917-e5c2-466e-a437-687e9d859b17	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
50814dad-7097-4391-9eeb-9d3a0d75b48e	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
5e9685c2-eca7-47e9-a23c-34c76a6a09c7	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
8ab4b604-8946-4443-9c22-8836459b0e84	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
a8276524-626c-493c-9b2f-c499295ad9cb	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
b0eeb6a5-7da9-49c4-ab2c-7fb3d7eb950b	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
022a4e3e-6648-495b-9124-eed7b0839444	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
09f9db4f-5196-490c-9831-51cd13671c6f	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$Fi+KzQn8xiqndMv0UCUA7L4t52nwnzQvuo2fvDh2P/O/ktE8	\N	\N	\N	\N	\N	\N
a846e803-6143-4804-b4f3-b359bb21945b	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$IoIZhP1FPdn19fYvFgApvnbkpkMlhByj0tZOokHKn44XlW7l	\N	\N	\N	\N	\N	\N
ac76f48b-137b-4d65-92d3-21580f69fdf2	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$oGp87p3SYeH1styJIi3m6dZj6ZYp8y/r6Qr+sX7+l53WWRAO	\N	\N	\N	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
1b937b65-0b12-42c7-8dd7-3103f68c8843	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$5ohMgIW4nDinSK6v81DIdwgEKbNBbs2Cj0n1DQPak9oZy2gR	\N	\N	\N	\N	\N	\N
04e61cd6-f65f-4241-ae24-627d718711bf	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$x2l4uLEEitDhltbAzSfux5EFO2bUMxLAOFxOpzGPqXT/lISD	\N	\N	\N	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
12c7b18b-78a6-43ee-b46d-d60404e11cee	1	Заполняющий	230	270	23	26	\N	\N	a15507c1-64de-4788-986a-9136b72a663d	\N
143dd6f2-17a7-46a4-9b98-4537cdde7d63	1	Заполняющий	230	270	23	26	\N	\N	517305ac-0599-4fcc-8369-e6cded254141	\N
54e0ee04-378c-48cb-91b8-0a6d9887a2d5	1	Заполняющий	230	270	23	26	\N	\N	851f9cfb-e7c4-42fa-9b26-8b16a80faf4b	\N
70e6d79c-b315-437b-b11e-3f08cd09ed47	1	Заполняющий	230	270	23	26	\N	\N	5bbda6c9-4ee3-4123-9269-5b0c38ac1d4b	\N
71fdce0f-42d1-47c6-bd00-5b6ed406d425	1	Заполняющий	230	270	23	26	\N	\N	fd4bcad3-2146-420a-8104-bb740c91758c	\N
7986ffe5-0acb-4181-873e-9cfc141a5a9b	1	Заполняющий	230	270	23	26	\N	\N	25f8f554-5359-4f27-9d81-c7dd8e68346e	\N
95b65cd2-3f52-485e-9e2e-bdbef792a14e	1	Заполняющий	230	270	23	26	\N	\N	592d9ce4-8419-4459-a15a-bfb8580f83f0	\N
afcc37f7-b365-483c-a5e4-f67631b31cd5	1	Заполняющий	230	270	23	26	\N	\N	656dbe5e-bed4-4f5f-bc12-d7ed00d813ea	\N
b336aad5-3351-422a-82ea-ee811b1517c8	1	Заполняющий	230	270	23	26	\N	\N	a3f22123-62ae-4d45-aed1-f92f79c7005f	\N
bbe25fd7-dd5d-49ff-ad68-4315120fda0b	1	Заполняющий	230	270	23	26	\N	\N	4868f377-7730-4380-8dd0-fc4026570eb6	\N
dcebefb7-303e-46ac-91d8-df053e2234d8	1	Заполняющий	230	270	23	26	\N	\N	281cabce-782a-4868-81d3-3db459ee3678	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
a9112abd-9ee6-40c8-a253-192882b2596c	1	Корневой	82	0.11	0.68	f	f	t	06261fe2-9a25-4d36-9edc-43dc33aed202	daa9d99f-3a26-459a-9892-0a2b9bda5aa0	\N
b97ec8e2-35ec-47e2-a368-8468adac6715	1	Корневой	82	0.11	0.68	f	f	t	b7f19c74-cc4b-4662-a91f-58adce0e4853	90171f75-2ee1-467d-a2af-598fdbcb6f23	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0231df9b-b7c5-4667-8315-8afc9d32cbc7	cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac
0231df9b-b7c5-4667-8315-8afc9d32cbc7	f392218a-cd03-4c40-812d-8bf76e19b27e
043cd8fa-5ab9-4826-8b68-9afd76681a59	cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac
043cd8fa-5ab9-4826-8b68-9afd76681a59	f392218a-cd03-4c40-812d-8bf76e19b27e
300a821d-eac4-413d-a839-b0cd99e0f511	cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac
300a821d-eac4-413d-a839-b0cd99e0f511	f392218a-cd03-4c40-812d-8bf76e19b27e
ab70e134-f511-4e2c-b6fe-69260606c297	278c3a6b-d304-492d-b8eb-4269f170921e
b4891869-61c9-435e-ba05-06f989d132cd	cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac
b4891869-61c9-435e-ba05-06f989d132cd	f392218a-cd03-4c40-812d-8bf76e19b27e
be24247b-ee4e-429a-8e8d-ce3581f42dd1	c474b1b6-c24f-4c4f-b58d-1d86dd6f9e8c
d09db5d9-2b1f-47ef-918d-895ab6f1c977	278c3a6b-d304-492d-b8eb-4269f170921e
fcbcd009-159f-4053-99dd-3adacece536a	c474b1b6-c24f-4c4f-b58d-1d86dd6f9e8c
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0231df9b-b7c5-4667-8315-8afc9d32cbc7	a8276524-626c-493c-9b2f-c499295ad9cb	\N	146164
043cd8fa-5ab9-4826-8b68-9afd76681a59	8ab4b604-8946-4443-9c22-8836459b0e84	\N	150882
300a821d-eac4-413d-a839-b0cd99e0f511	b0eeb6a5-7da9-49c4-ab2c-7fb3d7eb950b	\N	114729
ab70e134-f511-4e2c-b6fe-69260606c297	26af3961-bfed-4e0b-8796-324cbe9d264e	\N	122575
b4891869-61c9-435e-ba05-06f989d132cd	5e9685c2-eca7-47e9-a23c-34c76a6a09c7	\N	150838
be24247b-ee4e-429a-8e8d-ce3581f42dd1	50814dad-7097-4391-9eeb-9d3a0d75b48e	\N	121267
d09db5d9-2b1f-47ef-918d-895ab6f1c977	4d0d8917-e5c2-466e-a437-687e9d859b17	\N	132695
fcbcd009-159f-4053-99dd-3adacece536a	3ddcb0a9-a62d-48ec-9cbf-883e9d13a1dd	\N	117390
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
278c3a6b-d304-492d-b8eb-4269f170921e	224c40e2-c31e-47fd-8470-195654c07331
278c3a6b-d304-492d-b8eb-4269f170921e	e97f201b-aa91-49b0-a9f2-c331b5d01392
c474b1b6-c24f-4c4f-b58d-1d86dd6f9e8c	5adb9eea-d87e-4b80-b244-adc095543541
c474b1b6-c24f-4c4f-b58d-1d86dd6f9e8c	9535b4e9-49f9-4378-a679-66bb0e05e81d
cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	17354168-942a-41a7-bbc5-edb9d87c3f92
cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	9535b4e9-49f9-4378-a679-66bb0e05e81d
cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	9e028b08-3f14-4c40-9a31-ed7da4667f6a
cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	e97f201b-aa91-49b0-a9f2-c331b5d01392
f392218a-cd03-4c40-812d-8bf76e19b27e	17354168-942a-41a7-bbc5-edb9d87c3f92
f392218a-cd03-4c40-812d-8bf76e19b27e	9535b4e9-49f9-4378-a679-66bb0e05e81d
f392218a-cd03-4c40-812d-8bf76e19b27e	9e028b08-3f14-4c40-9a31-ed7da4667f6a
f392218a-cd03-4c40-812d-8bf76e19b27e	e97f201b-aa91-49b0-a9f2-c331b5d01392
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
278c3a6b-d304-492d-b8eb-4269f170921e	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	a9566f12-a3d8-4cc0-8425-1c5381aa2805	49286
c474b1b6-c24f-4c4f-b58d-1d86dd6f9e8c	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	a9566f12-a3d8-4cc0-8425-1c5381aa2805	49232
cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	a9566f12-a3d8-4cc0-8425-1c5381aa2805	49283
f392218a-cd03-4c40-812d-8bf76e19b27e	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	a9566f12-a3d8-4cc0-8425-1c5381aa2805	49141
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
06261fe2-9a25-4d36-9edc-43dc33aed202	2023-03-06 19:05:12.41048	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	be24247b-ee4e-429a-8e8d-ce3581f42dd1	a9566f12-a3d8-4cc0-8425-1c5381aa2805	\N
b7f19c74-cc4b-4662-a91f-58adce0e4853	2023-03-06 19:05:12.410571	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	cb2a08b8-cbaa-4bc7-a186-0e57c0d6c1ac	be24247b-ee4e-429a-8e8d-ce3581f42dd1	a9566f12-a3d8-4cc0-8425-1c5381aa2805	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
90171f75-2ee1-467d-a2af-598fdbcb6f23	1	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	104d144e-4718-4e85-ad72-5763e7077c1b	be24247b-ee4e-429a-8e8d-ce3581f42dd1	a9566f12-a3d8-4cc0-8425-1c5381aa2805	aa83c099-4290-4215-8495-e39ed72d7c49	\N
daa9d99f-3a26-459a-9892-0a2b9bda5aa0	2	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	0238a767-08fe-49c6-87d8-255666f9e40f	be24247b-ee4e-429a-8e8d-ce3581f42dd1	a9566f12-a3d8-4cc0-8425-1c5381aa2805	aa83c099-4290-4215-8495-e39ed72d7c49	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
5c259287-9c52-49af-aada-8fb16af6454a	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	51a74ad5-2198-4ced-adea-8d94a0df1dcc	\N
e8d8a28d-8da8-42bd-ac05-92658da41126	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	51a74ad5-2198-4ced-adea-8d94a0df1dcc	\N
f699414a-3226-479a-9ef0-ba49e7915883	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	51a74ad5-2198-4ced-adea-8d94a0df1dcc	\N
ab0fe745-34da-4e92-8b1d-deb888aa0023	1	12:10:00	13:10:00	13:20:00	13:50:00	32ee3596-3874-4ac1-b3ef-edf410b49791	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
17354168-942a-41a7-bbc5-edb9d87c3f92	3690	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	3690
224c40e2-c31e-47fd-8470-195654c07331	3510	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	3510
5adb9eea-d87e-4b80-b244-adc095543541	3600	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	3600
9535b4e9-49f9-4378-a679-66bb0e05e81d	3610	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	3610
9e028b08-3f14-4c40-9a31-ed7da4667f6a	3550	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	3550
e97f201b-aa91-49b0-a9f2-c331b5d01392	3500	\N	bd258c22-b3cb-401c-8319-2a1b5451de12	3500
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
3fab5ee3-7ed7-4901-8404-8161ab0da664	Сварочный цех	50	050
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

