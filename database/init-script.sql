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
7d00b6a5-3d1d-463d-9b1c-136b6e1bfddb	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
5624ae95-58a8-4a98-8615-411f684ebdae	0fd201d5-c190-40c8-97d3-ffe0e524d415	cd6f6649-8be1-4f82-bf6c-15147b30f40a	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
a0ddb124-f704-4d3d-863e-c802804a8c1a	1	10	t	7d00b6a5-3d1d-463d-9b1c-136b6e1bfddb	\N
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
1b286776-1c52-4681-a8e9-07a4f32219cb	Отсутствие материала, заготовок, деталей	\N
2d3b9abb-c191-40ae-b6b5-ae9a11fb8b04	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
32983336-fbed-46aa-9bdf-baabc80da35c	Праздники и выходные	\N
36383d02-820c-4d29-a23e-29a15db0733f	Плановый ремонт централизованными службами	\N
3959d450-b244-4774-ac08-36a4f2a2ac10	Ознакомление с работой, документацией, инструктаж	\N
3b4e1995-e9af-433f-89d3-88be06ecf692	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
4cb6ecff-3081-4d92-a021-ce020a741105	Нерабочее время по графику согласно сменности	\N
571761e1-ceb3-49cb-bb0f-9ddd06994f34	Отсутствие энергоносителей	\N
6cd0e33c-8d86-457f-8ec2-4c7cc8f04655	Работа с управляющей программой	\N
78795b2e-03e4-4263-ae81-0307e49b4736	Обед	\N
8623de13-a140-4829-8c8d-c2609290323a	Неявка оператора (б/лист, отпуск, и пр.)	\N
9390cf16-3d23-4502-93f3-3abc3519623f	Установка, выверка, снятие детали	\N
9465dc0f-7bab-40b0-b4f5-228acf415bba	Естественные надобности	\N
96c13225-78d0-4715-b7b4-b94f0e601444	Отсутствие заданий	\N
a0334be8-c1cd-457b-86ca-ccd9c4bdce04	Отсутствие конструктора, технолога или ожидание его решения	\N
bb0bfbc4-b04b-4aa1-b3b3-5d57f6f0d105	Контроль на рабочем месте	\N
bff31b74-dc6a-48c1-959f-2fc83f83f335	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
c0857ef4-0e00-45d2-aea1-85f5e6f1b801	Изменение режимов, смена инструмента, приспособления	\N
c3f6bd49-60a5-46af-8b24-8372b8779845	Сборочные операции	\N
ccb3c063-01bc-4091-87e6-2e6954dfc5f5	Установка, выверка, снятие детали	\N
d97ea024-dc07-4ba1-818b-952f0065f647	Отсутствие сотрудника ОТК	\N
ecd8c324-d604-4f82-9fda-4bf3ae1f01b2	Работа по карте несоответствий	\N
f8fa537b-aeec-4557-9c4e-2198fb4018ef	Отсутствие крана, транспорта	\N
fb3d2195-fd3e-4141-af72-cdc080d88c53	Отсутствие оператора в связи с необеспеченностью	\N
fe1df5cc-9716-4acc-9ed8-f4b5367dd24a	Аварийный ремонт централизованными службами	\N
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
a487a15a-333c-4bb3-96bd-46c94c4647fa	55dbc97c-5b88-4c68-a925-5c206bd1346e	219379
eb91c03b-30a7-42bf-85fa-4617cb701cb4	57e2df38-d90a-426d-bb19-bcaab7ef93c5	249550
f1113aee-7031-479a-ab95-941ba5ddfb38	878afde6-e060-4b58-aff5-7f11b7613cb0	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
9819a77c-328e-4b72-b287-f527d76b7164	8a03bcbe-5288-4857-82ce-40f620c3251b	610422
ad3f3fff-3471-4f68-ac71-3b4b173095cf	25bf87e2-49c8-4f7d-8656-9b0ff48930d2	614962
0acbc938-e181-4efe-bd03-5540ca727ffc	0a09387b-f9a0-47a2-a109-31960ef425fc	\N
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
01b46d4f-eceb-48f0-912a-90ca38d810dd	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
023b70dc-8a0e-436e-adc2-2ad9f4a83e45	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
106a9b1f-55ac-4e52-8685-bdf316e36fb8	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
1665f8f1-5a11-4bd4-bf65-462159baf6d1	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
1acc35ad-d9d8-4cd8-a174-3cc24fb9ef09	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
28f40a96-3d8c-4e3b-9439-3869c8b2c81e	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
32f107e1-8642-4e58-839f-4a8267b7c9cb	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
37f58106-411f-4939-8111-b36efdfaf702	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
390a3611-379c-4368-aa30-7fc6a8c06bbc	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
3b37f81f-bb0d-4c2f-b398-0429bee52152	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
3b7fd264-71ac-472e-adcc-ef0075b22eb3	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
527b382d-1961-4135-8340-fca778e0fb84	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
553e228d-32ec-41f9-9dcf-d8f0df1a6992	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
575582a3-93fd-4399-b397-6bc315394e02	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
7106395b-1fd0-428e-b578-268cff8d82a8	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
7520332d-c895-4e80-9693-06a2840a4943	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
77f91d57-e29b-4167-920e-27d88bdbe698	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
7eae6fbd-e7f6-49cb-859d-6b39a7a72a53	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
8b9f86e0-c024-4791-8b59-34b80517db1b	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
8d482910-050d-485a-a922-58cc14e92eb9	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
8f1a605e-9999-4137-8c01-53f01adbea3b	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
8f909fff-c95a-4db0-a15f-23eba518b85f	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
97b61f17-81d0-4753-8477-9b1cbac30641	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
a2a30f65-b526-4281-a20d-af62a9212fef	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
a7add7e1-24a4-43ca-9890-27d9752c6cd6	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
ac23a091-50d5-46ed-8aaf-0ae203afa9bf	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
ad2711a5-f9cd-46f6-a63a-350de828772e	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
ad6e701a-1523-49ed-a090-585848ff6c5f	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
b2ef539a-b1ef-438e-8dde-2487837c6884	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
bc9c4d9b-0e67-488a-940f-5e7785f30cf1	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
e2d87549-f175-478c-af97-da6068ce80c2	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
e5ca88af-fd17-4f6d-88a9-51747b408d5d	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
f23d50af-1c73-40b3-b110-e1f1e18b1a3f	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
01b46d4f-eceb-48f0-912a-90ca38d810dd	34	2	2023-03-12 00:00:00	d5e45248-ab3b-4558-8a32-852e84de905a	\N
023b70dc-8a0e-436e-adc2-2ad9f4a83e45	33	2	2023-03-12 00:00:00	c7be0013-61e4-4717-8ee0-f3e7e6da0c23	\N
106a9b1f-55ac-4e52-8685-bdf316e36fb8	4	2	2023-03-12 00:00:00	127cab7d-ed10-41de-89da-a7cedd09989a	\N
1665f8f1-5a11-4bd4-bf65-462159baf6d1	26	2	2023-03-12 00:00:00	8b6434c5-eec6-475b-9aca-bc83e4dcd331	\N
1acc35ad-d9d8-4cd8-a174-3cc24fb9ef09	36	2	2023-03-12 00:00:00	fbd86e4e-6bc7-4274-8f52-663121847c28	\N
1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	29	2	2023-03-12 00:00:00	a8d92522-be79-4c88-8c16-4e0425453608	\N
28f40a96-3d8c-4e3b-9439-3869c8b2c81e	3	2	2023-03-12 00:00:00	0d79babe-bde5-45b7-b6f5-9c94b566c661	\N
32f107e1-8642-4e58-839f-4a8267b7c9cb	11	2	2023-03-12 00:00:00	45d68f6b-c41d-4987-b65f-9b871e8e1c9b	\N
37f58106-411f-4939-8111-b36efdfaf702	35	2	2023-03-12 00:00:00	f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	\N
390a3611-379c-4368-aa30-7fc6a8c06bbc	20	2	2023-03-12 00:00:00	713d1374-cebb-4ea5-8f11-9386e8c26ca3	\N
3b37f81f-bb0d-4c2f-b398-0429bee52152	19	2	2023-03-12 00:00:00	6b08c6f3-c1ef-4ce3-94f1-693de2bf3d6f	\N
3b7fd264-71ac-472e-adcc-ef0075b22eb3	6	2	2023-03-12 00:00:00	1a7aef0c-5af8-4fb7-aaeb-20b508f62777	\N
527b382d-1961-4135-8340-fca778e0fb84	9	2	2023-03-12 00:00:00	3d32f93e-7198-4c47-89fb-979248728eb8	\N
553e228d-32ec-41f9-9dcf-d8f0df1a6992	7	2	2023-03-12 00:00:00	2fe327b2-e6cc-4af6-ab39-7a1ac0ec3146	\N
575582a3-93fd-4399-b397-6bc315394e02	5	2	2023-03-12 00:00:00	14b8c3ff-3861-41cf-b07f-f09905e4c510	\N
6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	22	2	2023-03-12 00:00:00	7f8b819b-e31a-48e3-b8e1-1457f598f174	\N
7106395b-1fd0-428e-b578-268cff8d82a8	2	2	2023-03-12 00:00:00	0a30519c-2126-4276-a7c6-18bbb7560387	\N
7520332d-c895-4e80-9693-06a2840a4943	15	2	2023-03-12 00:00:00	5642153b-7112-48bc-bd8f-c4669b06c88e	\N
77f91d57-e29b-4167-920e-27d88bdbe698	14	2	2023-03-12 00:00:00	55475ac0-3d77-47f1-8a8b-2d8ddc786bb7	\N
7eae6fbd-e7f6-49cb-859d-6b39a7a72a53	27	2	2023-03-12 00:00:00	95a1064a-3079-466f-b8f1-03083368557e	\N
8b9f86e0-c024-4791-8b59-34b80517db1b	17	2	2023-03-12 00:00:00	5efe189f-2147-4eea-8638-c41e450abec7	\N
8d482910-050d-485a-a922-58cc14e92eb9	16	2	2023-03-12 00:00:00	5d1bb17c-c0f3-46e6-a517-38ae6c5f542a	\N
8f1a605e-9999-4137-8c01-53f01adbea3b	21	2	2023-03-12 00:00:00	74158b8b-0713-4902-9f6b-858fb3013428	\N
8f909fff-c95a-4db0-a15f-23eba518b85f	10	2	2023-03-12 00:00:00	3d8c1f2d-4416-4d3a-9229-538b711512c6	\N
97b61f17-81d0-4753-8477-9b1cbac30641	23	2	2023-03-12 00:00:00	8004b2ac-f7a8-45e9-a577-616800f8c716	\N
a2a30f65-b526-4281-a20d-af62a9212fef	13	2	2023-03-12 00:00:00	5353e0f5-32d5-41f3-9852-da45df64f74a	\N
a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	25	2	2023-03-12 00:00:00	899e6bba-cfce-44e9-8111-957872baaf5c	\N
a7add7e1-24a4-43ca-9890-27d9752c6cd6	1	2	2023-03-12 00:00:00	06b73653-429f-4195-a423-6afa6e7a5d71	\N
ac23a091-50d5-46ed-8aaf-0ae203afa9bf	28	2	2023-03-12 00:00:00	95d3ccd2-5c3e-4ef7-b368-8f93cf7c10fc	\N
ad2711a5-f9cd-46f6-a63a-350de828772e	30	2	2023-03-12 00:00:00	af42bef8-4c17-4336-a62e-cfcb72229541	\N
ad6e701a-1523-49ed-a090-585848ff6c5f	32	2	2023-03-12 00:00:00	bfee3f8e-cada-42ad-bb34-0dbfb336ffe4	\N
b2ef539a-b1ef-438e-8dde-2487837c6884	24	2	2023-03-12 00:00:00	86efac91-43be-48ef-aa20-c79183102130	\N
bc9c4d9b-0e67-488a-940f-5e7785f30cf1	31	2	2023-03-12 00:00:00	bc3aff41-4b1c-4809-b077-a078a44c8045	\N
e2d87549-f175-478c-af97-da6068ce80c2	12	2	2023-03-12 00:00:00	4d39b329-81f8-47fb-a650-d0ee29403445	\N
e5ca88af-fd17-4f6d-88a9-51747b408d5d	18	2	2023-03-12 00:00:00	66e24c06-959f-495e-a66f-4532c87f4208	\N
f23d50af-1c73-40b3-b110-e1f1e18b1a3f	8	2	2023-03-12 00:00:00	366ee092-0c55-460b-8eec-cb0b14b45fe9	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
95a1064a-3079-466f-b8f1-03083368557e	06b73653-429f-4195-a423-6afa6e7a5d71
95a1064a-3079-466f-b8f1-03083368557e	0a30519c-2126-4276-a7c6-18bbb7560387
4d39b329-81f8-47fb-a650-d0ee29403445	0d79babe-bde5-45b7-b6f5-9c94b566c661
0a30519c-2126-4276-a7c6-18bbb7560387	127cab7d-ed10-41de-89da-a7cedd09989a
95a1064a-3079-466f-b8f1-03083368557e	14b8c3ff-3861-41cf-b07f-f09905e4c510
95a1064a-3079-466f-b8f1-03083368557e	1a7aef0c-5af8-4fb7-aaeb-20b508f62777
f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	2fe327b2-e6cc-4af6-ab39-7a1ac0ec3146
4d39b329-81f8-47fb-a650-d0ee29403445	366ee092-0c55-460b-8eec-cb0b14b45fe9
0a30519c-2126-4276-a7c6-18bbb7560387	3d32f93e-7198-4c47-89fb-979248728eb8
95a1064a-3079-466f-b8f1-03083368557e	3d8c1f2d-4416-4d3a-9229-538b711512c6
95a1064a-3079-466f-b8f1-03083368557e	45d68f6b-c41d-4987-b65f-9b871e8e1c9b
f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	5353e0f5-32d5-41f3-9852-da45df64f74a
4d39b329-81f8-47fb-a650-d0ee29403445	55475ac0-3d77-47f1-8a8b-2d8ddc786bb7
95a1064a-3079-466f-b8f1-03083368557e	5642153b-7112-48bc-bd8f-c4669b06c88e
4d39b329-81f8-47fb-a650-d0ee29403445	5d1bb17c-c0f3-46e6-a517-38ae6c5f542a
95a1064a-3079-466f-b8f1-03083368557e	5efe189f-2147-4eea-8638-c41e450abec7
4d39b329-81f8-47fb-a650-d0ee29403445	66e24c06-959f-495e-a66f-4532c87f4208
4d39b329-81f8-47fb-a650-d0ee29403445	6b08c6f3-c1ef-4ce3-94f1-693de2bf3d6f
f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	713d1374-cebb-4ea5-8f11-9386e8c26ca3
f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	74158b8b-0713-4902-9f6b-858fb3013428
4d39b329-81f8-47fb-a650-d0ee29403445	7f8b819b-e31a-48e3-b8e1-1457f598f174
95a1064a-3079-466f-b8f1-03083368557e	8004b2ac-f7a8-45e9-a577-616800f8c716
4d39b329-81f8-47fb-a650-d0ee29403445	86efac91-43be-48ef-aa20-c79183102130
0a30519c-2126-4276-a7c6-18bbb7560387	899e6bba-cfce-44e9-8111-957872baaf5c
0a30519c-2126-4276-a7c6-18bbb7560387	8b6434c5-eec6-475b-9aca-bc83e4dcd331
95a1064a-3079-466f-b8f1-03083368557e	95d3ccd2-5c3e-4ef7-b368-8f93cf7c10fc
95a1064a-3079-466f-b8f1-03083368557e	a8d92522-be79-4c88-8c16-4e0425453608
95a1064a-3079-466f-b8f1-03083368557e	af42bef8-4c17-4336-a62e-cfcb72229541
4d39b329-81f8-47fb-a650-d0ee29403445	bc3aff41-4b1c-4809-b077-a078a44c8045
4d39b329-81f8-47fb-a650-d0ee29403445	bfee3f8e-cada-42ad-bb34-0dbfb336ffe4
4d39b329-81f8-47fb-a650-d0ee29403445	c7be0013-61e4-4717-8ee0-f3e7e6da0c23
95a1064a-3079-466f-b8f1-03083368557e	d5e45248-ab3b-4558-8a32-852e84de905a
4d39b329-81f8-47fb-a650-d0ee29403445	f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7
4d39b329-81f8-47fb-a650-d0ee29403445	fbd86e4e-6bc7-4274-8f52-663121847c28
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
01211e44-2ea0-463f-a657-33e83e2cca22	0	2	\N	\N	575582a3-93fd-4399-b397-6bc315394e02	\N
01ae5ee9-baf0-4734-9c8a-7190c7d6511e	0	2	\N	\N	3b7fd264-71ac-472e-adcc-ef0075b22eb3	\N
02aea39e-1706-4ab0-9398-da03673bd835	0	1	\N	\N	7106395b-1fd0-428e-b578-268cff8d82a8	\N
07683462-da0c-4c52-ad22-53b1ef8ce83a	0	2	\N	\N	527b382d-1961-4135-8340-fca778e0fb84	\N
080e22e3-9a70-49dc-ac37-f9fbf045b4d9	0	3	\N	\N	7106395b-1fd0-428e-b578-268cff8d82a8	\N
0acff5c4-ca24-4aa4-a189-fa9e76494693	0	1	\N	\N	f23d50af-1c73-40b3-b110-e1f1e18b1a3f	\N
0b257331-262a-427f-bc6f-77c4be831c9d	0	3	\N	\N	ac23a091-50d5-46ed-8aaf-0ae203afa9bf	\N
115daa4c-8f53-4801-b256-f93b442a6885	0	2	\N	\N	a2a30f65-b526-4281-a20d-af62a9212fef	\N
11dbe2e7-e5b3-4919-8770-510d77856b3b	0	3	\N	\N	7520332d-c895-4e80-9693-06a2840a4943	\N
1277dff6-b7de-4bb6-9e1a-7fcc2b256cb1	0	3	\N	\N	8b9f86e0-c024-4791-8b59-34b80517db1b	\N
13798096-c2fd-4110-9d84-2cb842ef3635	0	1	\N	\N	1acc35ad-d9d8-4cd8-a174-3cc24fb9ef09	\N
178944ac-ac08-41f0-971d-af93e3a68491	0	3	\N	\N	f23d50af-1c73-40b3-b110-e1f1e18b1a3f	\N
1bc770a4-514a-4ae9-a729-b75d6dfb8c02	0	1	\N	\N	106a9b1f-55ac-4e52-8685-bdf316e36fb8	\N
1bd80327-065f-4b38-b4a3-f27e05fa5cd7	0	3	\N	\N	77f91d57-e29b-4167-920e-27d88bdbe698	\N
20dfe0f6-3bd7-476d-a420-759e7187599d	0	1	\N	\N	a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	\N
21800a54-9f2f-403c-a7e2-7f1c5ae222ed	0	1	\N	\N	a2a30f65-b526-4281-a20d-af62a9212fef	\N
2293e50d-9528-465b-8343-02046b61c654	0	2	\N	\N	37f58106-411f-4939-8111-b36efdfaf702	\N
29de158d-1344-46c0-a5a2-ec06560f6308	0	2	\N	\N	8d482910-050d-485a-a922-58cc14e92eb9	\N
2a0d7af7-6520-4c60-9549-4685bd2db523	0	3	\N	\N	bc9c4d9b-0e67-488a-940f-5e7785f30cf1	\N
2a197411-1522-4224-981e-630667f17601	0	3	\N	\N	3b37f81f-bb0d-4c2f-b398-0429bee52152	\N
341b2c91-6745-4220-abb8-7a254ea9670d	0	2	\N	\N	a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	\N
3466e77b-13d5-4600-8bbb-fcece3fa87d8	0	2	\N	\N	7106395b-1fd0-428e-b578-268cff8d82a8	\N
3668641d-2a96-438f-a361-2c334e16176b	0	2	\N	\N	8f1a605e-9999-4137-8c01-53f01adbea3b	\N
3773b8e5-e8e1-464c-93b0-d76d08c94063	0	2	\N	\N	023b70dc-8a0e-436e-adc2-2ad9f4a83e45	\N
3895f567-03dc-479b-939e-15ba05704d13	0	1	\N	\N	8d482910-050d-485a-a922-58cc14e92eb9	\N
3e1e8b8c-1eea-4247-b399-812f00bd630c	0	1	\N	\N	e2d87549-f175-478c-af97-da6068ce80c2	\N
3e24a428-44f9-441d-ab25-81dc21f7aca2	0	3	\N	\N	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
3eacf672-0c56-41de-b788-a364c2a93ff7	0	3	\N	\N	023b70dc-8a0e-436e-adc2-2ad9f4a83e45	\N
3f4d4eb1-ffac-406c-8eff-99dcab05ab81	0	2	\N	\N	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
447d98d9-bf56-47cf-9af5-b86da390ab3e	0	1	\N	\N	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
44c9f885-05db-4be8-a328-5472e27a3a5c	0	1	\N	\N	7eae6fbd-e7f6-49cb-859d-6b39a7a72a53	\N
45486e07-3954-45b6-9d6a-1e66fb4ccb82	0	1	\N	\N	77f91d57-e29b-4167-920e-27d88bdbe698	\N
45fe6d7c-8947-494b-b37d-3d4db103353c	0	2	\N	\N	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
474c3385-6e19-4b82-ad03-725d2a43bea5	0	3	\N	\N	7eae6fbd-e7f6-49cb-859d-6b39a7a72a53	\N
475c469a-fc21-4bee-b6a5-7abcb52de9cf	0	2	\N	\N	28f40a96-3d8c-4e3b-9439-3869c8b2c81e	\N
4b85a3e6-8507-4ede-ad36-6d3c6a38f140	0	1	\N	\N	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
4bbb4a6d-ffb6-4313-9383-b67e19dd9465	0	1	\N	\N	390a3611-379c-4368-aa30-7fc6a8c06bbc	\N
4c52a5a0-4e9f-4c66-8bf8-942e3e6b3e74	0	2	\N	\N	7eae6fbd-e7f6-49cb-859d-6b39a7a72a53	\N
4cb37039-cdf8-4f64-9eb2-c789e86a71e6	0	2	\N	\N	e2d87549-f175-478c-af97-da6068ce80c2	\N
4fe66ce5-f0da-4a41-8075-84e33d8316cd	0	2	\N	\N	ac23a091-50d5-46ed-8aaf-0ae203afa9bf	\N
52494c27-67ba-4243-82ca-73f2be28daa6	0	1	\N	\N	97b61f17-81d0-4753-8477-9b1cbac30641	\N
55bfbc78-92fa-4fa3-b435-8bb6a9fd025c	0	1	\N	\N	3b7fd264-71ac-472e-adcc-ef0075b22eb3	\N
5dfdeb76-127f-419c-a80a-0699bc5d3c33	0	3	\N	\N	e2d87549-f175-478c-af97-da6068ce80c2	\N
5e47b743-f2ad-4ff3-b298-0c7778afb682	0	2	\N	\N	553e228d-32ec-41f9-9dcf-d8f0df1a6992	\N
642447bc-177a-4da9-9bf9-ed7c34d54ad2	0	3	\N	\N	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
65d49ca2-030e-469f-9b9b-0028d8183410	0	1	\N	\N	8f1a605e-9999-4137-8c01-53f01adbea3b	\N
6a870634-0e5b-493a-b26f-1e33ba83618e	0	3	\N	\N	3b7fd264-71ac-472e-adcc-ef0075b22eb3	\N
6ae9b627-1eab-4ece-8609-d6426dd78ce5	0	2	\N	\N	6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	\N
7235cb83-e19b-4a75-bc38-3e3fddfb518f	0	1	\N	\N	ad6e701a-1523-49ed-a090-585848ff6c5f	\N
73651c03-0c86-4dd5-bd2a-ea6aca4f6f59	0	1	\N	\N	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
73fc18f8-487e-4a20-ab2d-ea81999b7f7b	0	3	\N	\N	8f909fff-c95a-4db0-a15f-23eba518b85f	\N
76dd40fc-d738-43c1-b6fe-5d1dc31864a0	0	2	\N	\N	ad2711a5-f9cd-46f6-a63a-350de828772e	\N
7aa7c36b-3dea-436b-b659-28602640d0b8	0	3	\N	\N	575582a3-93fd-4399-b397-6bc315394e02	\N
7c3cea34-7026-40c0-a9a5-4f99e7e3ee6a	0	2	\N	\N	106a9b1f-55ac-4e52-8685-bdf316e36fb8	\N
7c41d4b3-2771-441e-a0d0-3b89cf292b5d	0	1	\N	\N	575582a3-93fd-4399-b397-6bc315394e02	\N
7f5cd61a-e168-4efe-8342-0b6adc7e7764	0	2	\N	\N	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
810a5545-a4cd-46f1-b165-1cfe872eb738	0	3	\N	\N	1665f8f1-5a11-4bd4-bf65-462159baf6d1	\N
863ca0b6-d391-4d3b-9b51-4cbba7bc7e83	0	1	\N	\N	32f107e1-8642-4e58-839f-4a8267b7c9cb	\N
871cc8a8-db35-40df-b000-3f5830dc3e55	0	2	\N	\N	8b9f86e0-c024-4791-8b59-34b80517db1b	\N
8a27e4d3-a430-46d1-abaa-7c006d8edf6d	0	2	\N	\N	a7add7e1-24a4-43ca-9890-27d9752c6cd6	\N
8deec379-836e-4a6e-9b0b-08c03ceabc05	0	1	\N	\N	3b37f81f-bb0d-4c2f-b398-0429bee52152	\N
8f641cac-72be-4d70-b4fe-9a11135e0e01	0	1	\N	\N	527b382d-1961-4135-8340-fca778e0fb84	\N
913f6513-f98a-498d-af83-6661958a3010	0	1	\N	\N	e5ca88af-fd17-4f6d-88a9-51747b408d5d	\N
915151eb-7f90-4741-8006-23fd279b51aa	0	1	\N	\N	37f58106-411f-4939-8111-b36efdfaf702	\N
917eea7e-f117-4b22-85d8-d2102ec48db9	0	2	\N	\N	f23d50af-1c73-40b3-b110-e1f1e18b1a3f	\N
918c607d-878e-44ae-9608-c0229eeec45b	0	3	\N	\N	ad6e701a-1523-49ed-a090-585848ff6c5f	\N
93624c7d-9624-4432-b932-b3ef6c027eac	0	1	\N	\N	28f40a96-3d8c-4e3b-9439-3869c8b2c81e	\N
95033a5c-b3e2-43ed-989c-88fc79461183	0	3	\N	\N	a2a30f65-b526-4281-a20d-af62a9212fef	\N
a2315a34-96f5-4aa3-a85a-0ae1e5d2ff54	0	2	\N	\N	bc9c4d9b-0e67-488a-940f-5e7785f30cf1	\N
a27119ab-eedb-4c7d-9015-1f1c41b6f2c9	0	3	\N	\N	ad2711a5-f9cd-46f6-a63a-350de828772e	\N
a28424fa-0f95-4393-8a75-40570404d069	0	2	\N	\N	97b61f17-81d0-4753-8477-9b1cbac30641	\N
a495a906-706d-4917-847a-4e03267054f9	0	1	\N	\N	ac23a091-50d5-46ed-8aaf-0ae203afa9bf	\N
a5602069-21ca-4411-a252-1f15a63c7c0d	0	3	\N	\N	e5ca88af-fd17-4f6d-88a9-51747b408d5d	\N
a96277c4-91d3-42cf-b5ee-3a2df264e3ab	0	3	\N	\N	28f40a96-3d8c-4e3b-9439-3869c8b2c81e	\N
aadd25d9-0060-4574-ad54-a23faa31e518	0	3	\N	\N	6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	\N
ac533f49-b54f-4cc2-8fba-8c04d622d21c	0	1	\N	\N	8f909fff-c95a-4db0-a15f-23eba518b85f	\N
af83e45b-b396-4774-b876-f3f70795facd	0	2	\N	\N	1665f8f1-5a11-4bd4-bf65-462159baf6d1	\N
b14d7dd5-d081-4c90-a492-9c75260e5b7f	0	3	\N	\N	37f58106-411f-4939-8111-b36efdfaf702	\N
b8bd9015-3ab0-4acb-a6a4-15f83c7c76d7	0	1	\N	\N	8b9f86e0-c024-4791-8b59-34b80517db1b	\N
bbf9db5c-1ac8-4ed4-bbc2-56ff3d5a5fe2	0	1	\N	\N	ad2711a5-f9cd-46f6-a63a-350de828772e	\N
c241bb03-f3f2-4779-9a9b-3db79f4d3e4a	0	1	\N	\N	bc9c4d9b-0e67-488a-940f-5e7785f30cf1	\N
c46f94f3-f1d2-4521-a06e-ae8c348f302e	0	1	\N	\N	1665f8f1-5a11-4bd4-bf65-462159baf6d1	\N
c48c2a4d-956d-41f1-97f2-c9ba07e3e263	0	3	\N	\N	527b382d-1961-4135-8340-fca778e0fb84	\N
c5b401d9-3642-47fb-956f-5d019b51ae31	0	3	\N	\N	1acc35ad-d9d8-4cd8-a174-3cc24fb9ef09	\N
c67514d2-601a-4141-b923-f4b9c859dbea	0	2	\N	\N	1acc35ad-d9d8-4cd8-a174-3cc24fb9ef09	\N
c6d1b585-e845-4830-972a-fa1f3c883d52	0	2	\N	\N	390a3611-379c-4368-aa30-7fc6a8c06bbc	\N
c8e81ab2-724e-4622-b699-ca807729d73e	0	1	\N	\N	553e228d-32ec-41f9-9dcf-d8f0df1a6992	\N
ca526af9-b28f-4b9b-b5e1-b00c1475d4b1	0	2	\N	\N	7520332d-c895-4e80-9693-06a2840a4943	\N
d5d4ac58-6cf3-4934-89ce-d0e875821194	0	3	\N	\N	8f1a605e-9999-4137-8c01-53f01adbea3b	\N
d9168c25-4541-4c48-ad2e-e9200d382aff	0	2	\N	\N	ad6e701a-1523-49ed-a090-585848ff6c5f	\N
dad70c20-7b9a-42c1-b5d3-36b8a2f24663	0	3	\N	\N	97b61f17-81d0-4753-8477-9b1cbac30641	\N
db15a416-1b9f-443e-9771-bf28f9b3ca82	0	1	\N	\N	a7add7e1-24a4-43ca-9890-27d9752c6cd6	\N
dceac5fb-a559-4fca-aba3-05bf208fa0a0	0	3	\N	\N	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
de49f02d-376e-465f-976f-240f30aa1809	0	2	\N	\N	8f909fff-c95a-4db0-a15f-23eba518b85f	\N
e08d237f-f947-44fb-a994-2e8ada776b7f	0	2	\N	\N	3b37f81f-bb0d-4c2f-b398-0429bee52152	\N
e352197a-b0fe-41cd-908b-f7e8d2f26425	0	1	\N	\N	023b70dc-8a0e-436e-adc2-2ad9f4a83e45	\N
e5ff38db-163b-4d68-b331-b46daff00646	0	3	\N	\N	32f107e1-8642-4e58-839f-4a8267b7c9cb	\N
e663562f-0bda-4181-ab21-b73fca358d70	0	3	\N	\N	8d482910-050d-485a-a922-58cc14e92eb9	\N
e7a571d1-5322-4394-ada9-df2c8cb9404e	0	3	\N	\N	390a3611-379c-4368-aa30-7fc6a8c06bbc	\N
eb693112-7d87-4357-a431-9db19e9c24f5	0	1	\N	\N	6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	\N
ec073cd4-4047-4442-8b3b-6d27341b2f1f	0	2	\N	\N	77f91d57-e29b-4167-920e-27d88bdbe698	\N
ecf4037b-62e9-4ea8-bf51-e51253be80c1	0	2	\N	\N	32f107e1-8642-4e58-839f-4a8267b7c9cb	\N
f27f0477-475b-4d0a-b7e0-01b9f2e38180	0	3	\N	\N	a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	\N
f5e5ff3d-0d65-4fea-a452-443980cbf2e6	0	2	\N	\N	e5ca88af-fd17-4f6d-88a9-51747b408d5d	\N
f6573302-7a34-450c-a86d-8dfb1264888b	0	3	\N	\N	a7add7e1-24a4-43ca-9890-27d9752c6cd6	\N
f8733dcf-d081-4919-b81a-498c2e8c48e7	0	1	\N	\N	7520332d-c895-4e80-9693-06a2840a4943	\N
fc85656b-eabc-4993-bc49-c2630004a5a4	0	3	\N	\N	106a9b1f-55ac-4e52-8685-bdf316e36fb8	\N
fe15a893-aa98-4921-b425-a353e7377816	0	3	\N	\N	553e228d-32ec-41f9-9dcf-d8f0df1a6992	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
5ddbc243-59b3-40f3-b4e7-1458e48de32e	Сборка, сварка рам к/с г/п 120-130 т.	6	cd6f6649-8be1-4f82-bf6c-15147b30f40a	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
06b73653-429f-4195-a423-6afa6e7a5d71	Лонжерон рамы правый	75131-2801016-70	t	2	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
0a30519c-2126-4276-a7c6-18bbb7560387	Поперечина рамы задняя	75131-2801300-20	t	2	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
0d79babe-bde5-45b7-b6f5-9c94b566c661	Опора	75131-2801189	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
127cab7d-ed10-41de-89da-a7cedd09989a	Кронштейн задней опоры	75131-8521182-20	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
14b8c3ff-3861-41cf-b07f-f09905e4c510	Накладка рамы поперечная передняя	75131-2801088-70	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
1a7aef0c-5af8-4fb7-aaeb-20b508f62777	Усилитель	75131-2801114-01	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
2fe327b2-e6cc-4af6-ab39-7a1ac0ec3146	Лист верхний	75131-2801357-10	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
366ee092-0c55-460b-8eec-cb0b14b45fe9	Лонжерон рамы левый	75131-2801017-70	t	2	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
3d32f93e-7198-4c47-89fb-979248728eb8	Лист верхний	75131-2801357-10	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
3d8c1f2d-4416-4d3a-9229-538b711512c6	Поперечина №3 рамы с опорами	75132-2801152	t	2	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
45d68f6b-c41d-4987-b65f-9b871e8e1c9b	Усилитель	75131-2801115-01	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
4d39b329-81f8-47fb-a650-d0ee29403445	Рама	7513D-2800010-20	t	1	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	4536492774
5353e0f5-32d5-41f3-9852-da45df64f74a	Кронштейн задней опоры	75131-8521182-20	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
55475ac0-3d77-47f1-8a8b-2d8ddc786bb7	Лонжерон рамы левый	75131-2801015-41	t	2	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
5642153b-7112-48bc-bd8f-c4669b06c88e	Опора	75131-2801188	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
5d1bb17c-c0f3-46e6-a517-38ae6c5f542a	Опора	75131-2801188	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
5efe189f-2147-4eea-8638-c41e450abec7	Лонжерон рамы левый	75131-2801017-70	t	2	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
6b08c6f3-c1ef-4ce3-94f1-693de2bf3d6f	Накладка рамы поперечная передняя	75131-2801088-70	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
713d1374-cebb-4ea5-8f11-9386e8c26ca3	Поперечина	75131-2801325	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
74158b8b-0713-4902-9f6b-858fb3013428	Кронштейн задней опоры	75131-8521183-20	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
7f8b819b-e31a-48e3-b8e1-1457f598f174	Лонжерон рамы правый	75131-2801016-70	t	2	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
8004b2ac-f7a8-45e9-a577-616800f8c716	Поперечина	75131-2801103-10	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
86efac91-43be-48ef-aa20-c79183102130	Лонжерон рамы правый	75131-2801014-41	t	2	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
899e6bba-cfce-44e9-8111-957872baaf5c	Поперечина	75131-2801325	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
8b6434c5-eec6-475b-9aca-bc83e4dcd331	Кронштейн задней опоры	75131-8521183-20	t	3	bf499495-6b0e-445d-a63c-d0f5291c14c7	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
95a1064a-3079-466f-b8f1-03083368557e	Рама	75131-2800010-70	t	1	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	4536479362
95d3ccd2-5c3e-4ef7-b368-8f93cf7c10fc	Опора	75131-2801189	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
a8d92522-be79-4c88-8c16-4e0425453608	Лонжерон рамы левый	75131-2801015-41	t	2	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
af42bef8-4c17-4336-a62e-cfcb72229541	Лист нижний	75131-2801358-10	t	3	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
bc3aff41-4b1c-4809-b077-a078a44c8045	Усилитель	75131-2801115-01	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
bfee3f8e-cada-42ad-bb34-0dbfb336ffe4	Усилитель	75131-2801114-01	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
c7be0013-61e4-4717-8ee0-f3e7e6da0c23	Поперечина	75131-2801103-10	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
d5e45248-ab3b-4558-8a32-852e84de905a	Лонжерон рамы правый	75131-2801014-41	t	2	04a87ec4-cbf6-4a1f-9539-f0b855f5905d	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	Поперечина рамы задняя	75131-2801300-20	t	2	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N	\N	\N
66e24c06-959f-495e-a66f-4532c87f4208	Поперечина №3 рамы с опорами	75132-2801152	t	2	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N	\N
fbd86e4e-6bc7-4274-8f52-663121847c28	Лист нижний	75131-2801358-10	t	3	38f96278-431c-4ad0-93d7-d696a92a6a0b	5ddbc243-59b3-40f3-b4e7-1458e48de32e	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
0751a683-d977-4703-869a-341926ff8453	Admin	\N
b83761e2-8683-4fc7-a526-265eec70a0c9	Master	\N
fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5	Welder	\N
0d20b002-eda0-4a72-af53-69ae5d7cea09	Inspector	\N
3d006e6d-9753-49ee-a448-88a016d138f8	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
05367cbf-2e6f-4617-9e6b-081c561593b0	2023-03-12 00:00:00	1bf0f87f-73c1-41ec-80ae-53a0458b105e	527b382d-1961-4135-8340-fca778e0fb84	\N
0884aa8a-bbb7-46fb-93be-dbaf53b6b1f6	2023-03-12 00:00:00	71e51848-9b05-41f0-a432-921058cfd3be	a7add7e1-24a4-43ca-9890-27d9752c6cd6	\N
097ab604-3e6e-4939-9eda-ae63da6f2537	2023-03-12 00:00:00	b2489bd2-e08d-441a-bb20-0706eda98dd2	7106395b-1fd0-428e-b578-268cff8d82a8	\N
0a2c39e6-d61b-4430-ba8b-7b28ec5d0737	2023-03-12 00:00:00	e64a41ae-b2ff-4582-a6fe-5b3a576539a1	8f909fff-c95a-4db0-a15f-23eba518b85f	\N
0c5c9960-354e-44a8-8c7a-ac46d1e8d1dc	2023-03-12 00:00:00	f7d1ec24-7d01-4921-896c-3431b0988829	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
111fd13a-e9aa-479a-9abb-43c57096d458	2023-03-12 00:00:00	9b239393-6b56-4d9f-bf6d-51831cf1254b	3b37f81f-bb0d-4c2f-b398-0429bee52152	\N
12d70402-3b2c-4789-8b78-6084e2ea0036	2023-03-12 00:00:00	4ffcb37f-8942-43cd-bd1e-210cff60e6ad	7520332d-c895-4e80-9693-06a2840a4943	\N
1341e88c-7025-4713-9d1b-48a77bf32174	2023-03-12 00:00:00	bd9fb2cd-1320-4d12-ac63-603738f41fd9	97b61f17-81d0-4753-8477-9b1cbac30641	\N
1519b77e-1db3-42a3-9474-5a72bd11b7aa	2023-03-12 00:00:00	11ad7305-db05-47d7-a041-0057d0022275	f23d50af-1c73-40b3-b110-e1f1e18b1a3f	\N
199a022a-47cf-4e53-805b-35f139cfd3d3	2023-03-12 00:00:00	438f9dcc-dfb6-4234-a729-5e5461221260	77f91d57-e29b-4167-920e-27d88bdbe698	\N
1a154ba2-4fa4-4273-9aa9-3d2112b7984a	2023-03-12 00:00:00	f0dcd488-16c7-410b-a6b8-744c6bff75bc	37f58106-411f-4939-8111-b36efdfaf702	\N
1b3d1534-f529-43d5-a0c3-58ca1107623b	2023-03-12 00:00:00	ebd7c836-af9b-40aa-ad4d-ff281ccd7fa7	1665f8f1-5a11-4bd4-bf65-462159baf6d1	\N
1df85685-6d54-42b2-a052-5fc228e8a401	2023-03-12 00:00:00	5c57bd77-6a2b-48ae-8fe2-426e9e61bdde	1acc35ad-d9d8-4cd8-a174-3cc24fb9ef09	\N
1f496059-c5a8-4c02-a516-af10c7be455b	2023-03-12 00:00:00	0ba1a7bc-75ea-4ff8-9658-f15ebcf60ce5	28f40a96-3d8c-4e3b-9439-3869c8b2c81e	\N
2387104b-7be1-431a-a8ea-9eeb02944b76	2023-03-12 00:00:00	28cc5857-0d9a-4d2b-8e62-c0f94496f021	a2a30f65-b526-4281-a20d-af62a9212fef	\N
24637308-002e-441f-af5a-94c35f180c0b	2023-03-12 00:00:00	bf0eed21-c5c0-4f94-999c-d4c319698fdb	ac23a091-50d5-46ed-8aaf-0ae203afa9bf	\N
2b7bb825-16c2-421f-b9fb-7471ff32f3b5	2023-03-12 00:00:00	051220a0-e768-417f-9204-70fc1c566275	7520332d-c895-4e80-9693-06a2840a4943	\N
2e2888b2-80c2-4677-9d21-e882a3400f9b	2023-03-12 00:00:00	7b6f0891-2bd1-46b0-9e23-5cbb82e76f3b	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
30292d1c-1370-416e-9bfa-4b55d8340c68	2023-03-12 00:00:00	c08df95e-0303-4e7e-9858-0528e9c4f0f6	7520332d-c895-4e80-9693-06a2840a4943	\N
336c5ff4-256e-4f5f-96f7-675a72a0eb4b	2023-03-12 00:00:00	034f3531-9c46-46ac-8f7a-925308bcf4fa	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
34af11e5-5942-4028-b1f1-5f1dd0c73507	2023-03-12 00:00:00	38ed259e-cec3-4114-b792-4c8e6d78363f	ad6e701a-1523-49ed-a090-585848ff6c5f	\N
35d42fef-f1bb-48a2-8331-9a555c6c3cdd	2023-03-12 00:00:00	fb1684a1-f952-48c1-89d6-34b278f0748b	390a3611-379c-4368-aa30-7fc6a8c06bbc	\N
38d72c6d-590c-4228-b25e-0b1f7647cf8b	2023-03-12 00:00:00	84a5f78e-20d8-403a-83aa-baf2a707d917	a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	\N
3f2d752d-0a24-42e2-a8cb-a5ba3d397f1e	2023-03-12 00:00:00	ca929033-533c-4930-8f1c-93b633a9e1bb	a7add7e1-24a4-43ca-9890-27d9752c6cd6	\N
497d3dc9-ba89-4016-8048-09f980840756	2023-03-12 00:00:00	307691e1-7578-425d-b76b-6e536d04c898	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
5052a901-296a-4375-aa94-b2145529e4b3	2023-03-12 00:00:00	dfd9d938-d8ec-43c0-a51e-21bdd7f4c0f9	f23d50af-1c73-40b3-b110-e1f1e18b1a3f	\N
55ddf0c3-328b-4c3d-8448-bef14a9d58fd	2023-03-12 00:00:00	47fa61f4-8de4-43b1-b0cb-951c3698a867	106a9b1f-55ac-4e52-8685-bdf316e36fb8	\N
585126d2-e6bd-43e3-bcf6-286af5536cd5	2023-03-12 00:00:00	10b29fdf-4360-4683-9570-010ed2c1044c	ac23a091-50d5-46ed-8aaf-0ae203afa9bf	\N
5ca932cb-7ac8-4917-a6b1-9ed7f2e8358b	2023-03-12 00:00:00	447d40d6-cbbc-4cdc-be20-6314df4a7da2	37f58106-411f-4939-8111-b36efdfaf702	\N
5cc571c7-ca51-4897-87c1-7ad7a2300d99	2023-03-12 00:00:00	d9f11a46-d038-43e7-997f-627b0a541e3d	b2ef539a-b1ef-438e-8dde-2487837c6884	\N
60bed039-7bb6-4286-a700-e2f7e467f890	2023-03-12 00:00:00	48658d34-844b-4ce0-be01-5f30eb8824e7	f23d50af-1c73-40b3-b110-e1f1e18b1a3f	\N
620e2b03-502f-4d02-8966-ddbbeb64e36b	2023-03-12 00:00:00	82189607-a33b-4460-9ac6-0028321a81e0	6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	\N
625d77ce-85ca-4f26-b8fc-7d193a5952c5	2023-03-12 00:00:00	65fe7b90-1706-49d0-85fb-e7c218d61ffc	8d482910-050d-485a-a922-58cc14e92eb9	\N
6cafad31-18c2-478a-b0c5-ac541aabfab1	2023-03-12 00:00:00	e2a95158-b24c-4b02-87c0-1e18a1087aee	32f107e1-8642-4e58-839f-4a8267b7c9cb	\N
6d5888ac-b2ba-4878-a41e-a922de2c49e8	2023-03-12 00:00:00	75c5b403-ee85-45ad-a7dd-8d9733430063	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
720d7ce6-2949-4c4b-b8a8-1463f970dceb	2023-03-12 00:00:00	311790ed-39a9-421a-82a2-06ef034d6c3d	553e228d-32ec-41f9-9dcf-d8f0df1a6992	\N
73592a2c-5b0f-49dc-803d-99d041b46627	2023-03-12 00:00:00	b400d122-7eb0-47b3-a211-1111c2483ec5	3b7fd264-71ac-472e-adcc-ef0075b22eb3	\N
75cf64af-4cb4-4761-8c02-666951f81a92	2023-03-12 00:00:00	ee4b9a2e-10a2-4070-9758-d4d4a160d141	28f40a96-3d8c-4e3b-9439-3869c8b2c81e	\N
78d86743-719f-483c-99f5-96df5b76cf26	2023-03-12 00:00:00	b8e15dc8-a58c-4417-b029-7ccb8bd05a75	a7add7e1-24a4-43ca-9890-27d9752c6cd6	\N
7b353537-47d0-4c21-b549-20e3c89c7830	2023-03-12 00:00:00	33b99274-384b-4224-bb11-067b5bc8dad3	77f91d57-e29b-4167-920e-27d88bdbe698	\N
850223f4-fc72-4c98-9375-8032a56414a4	2023-03-12 00:00:00	71363805-75ba-4b46-921d-80ec31639f69	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
859c4cd2-365f-4a49-9626-21e0f49e777c	2023-03-12 00:00:00	c1db1212-35d8-4842-96cf-cde18ef32e71	527b382d-1961-4135-8340-fca778e0fb84	\N
8b3d85fb-1736-467c-a95c-e953f9007b19	2023-03-12 00:00:00	5a5596d3-82f8-439a-8e3e-a9e29d7ea77c	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
90a323b9-ef1e-42e5-9d9c-ba12ba3916e1	2023-03-12 00:00:00	6a3c668f-2485-4b84-990e-55e332bd83f3	ac23a091-50d5-46ed-8aaf-0ae203afa9bf	\N
96fb27a1-2ac4-4de1-bd16-c65de97bc700	2023-03-12 00:00:00	5c819b52-b238-4249-adf9-1fece6f6fc3b	77f91d57-e29b-4167-920e-27d88bdbe698	\N
992fe7fe-c0e5-49b0-b50a-927675e213f1	2023-03-12 00:00:00	e1666ccc-2742-4539-bbf2-403abacc077d	8b9f86e0-c024-4791-8b59-34b80517db1b	\N
9c8fceca-8444-4691-a35d-c18fa833225a	2023-03-12 00:00:00	68a6b6b3-2f83-4a8c-8fb2-0d7b549794e6	023b70dc-8a0e-436e-adc2-2ad9f4a83e45	\N
9fd7b057-0096-43ea-9358-2ace60900d10	2023-03-12 00:00:00	951e6b12-3e11-4c22-a988-6f057a5de6e2	8d482910-050d-485a-a922-58cc14e92eb9	\N
a631f554-4d20-4e13-88f0-fda314980555	2023-03-12 00:00:00	0622d6e6-1134-4e12-92ed-b58c5bd9dcf5	390a3611-379c-4368-aa30-7fc6a8c06bbc	\N
a92b7ee6-da65-419f-9fd6-af00a6c569db	2023-03-12 00:00:00	f8f1952a-8a6c-4755-986a-2622ac8f481c	ad2711a5-f9cd-46f6-a63a-350de828772e	\N
ad5b581c-9472-4940-a1f8-e1193d734861	2023-03-12 00:00:00	5495a61e-5a23-4900-a9ae-942104bd4fd3	6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	\N
afc945e0-e0e0-4c18-9921-0b0df74f0f72	2023-03-12 00:00:00	c8e39e99-b8a2-45d9-aca1-f401ed91441b	553e228d-32ec-41f9-9dcf-d8f0df1a6992	\N
b034f779-a57d-4ad2-ba2c-847d62f28a97	2023-03-12 00:00:00	f199bb4e-520a-496a-b798-25c1e15ca2e1	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
b3498696-4715-4e74-95f3-2bedffb84e90	2023-03-12 00:00:00	af6e3d9a-85e7-457d-987a-d4197eb49b43	8b9f86e0-c024-4791-8b59-34b80517db1b	\N
b3918091-7372-4124-a3ae-7c03d9cce22e	2023-03-12 00:00:00	f09c71a7-5e11-438d-a09d-27d4886ccac2	8d482910-050d-485a-a922-58cc14e92eb9	\N
b40e812a-c92a-4baf-855c-60fd43abefe4	2023-03-12 00:00:00	3c0c6a9b-1551-4674-9193-c2c3f414fdf3	8f1a605e-9999-4137-8c01-53f01adbea3b	\N
b42d4619-4e26-43a4-ba87-c2bb0cc07537	2023-03-12 00:00:00	1839fff9-6cc3-46f2-8a79-da361ed25a0e	7106395b-1fd0-428e-b578-268cff8d82a8	\N
b48fd06c-3609-43a7-875c-6a51a8e506f3	2023-03-12 00:00:00	628c936a-dc1b-48fc-9517-c3092c6a46db	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
c0de5a20-a17c-4727-8427-e9ede58475ef	2023-03-12 00:00:00	c951ac57-9bdb-4c6b-8d90-a0400c2e5bbb	bc9c4d9b-0e67-488a-940f-5e7785f30cf1	\N
cc7ed0b3-0c39-473b-b27a-dc54027878a4	2023-03-12 00:00:00	b6ebbd41-c65d-40eb-8c65-b4df3e52d40e	77f91d57-e29b-4167-920e-27d88bdbe698	\N
ce323c7c-befa-4429-b6e9-fade68f31e89	2023-03-12 00:00:00	a07d4641-c8c6-4b83-8f55-92a8ce3b8238	575582a3-93fd-4399-b397-6bc315394e02	\N
d0e2d693-617d-4a29-902b-bb985492b2c6	2023-03-12 00:00:00	06aff7cc-4326-4571-999f-263f08f36d5c	e5ca88af-fd17-4f6d-88a9-51747b408d5d	\N
d91073d4-f47d-4ba1-b8ce-9c9bef8c286f	2023-03-12 00:00:00	e6552726-fc00-473e-9aa5-4a4eba499cd3	6c958fdd-a0ad-4c57-a87d-5a59bbc591ac	\N
de609cac-cb08-4482-b32a-97acea33b844	2023-03-12 00:00:00	b5bb6bd2-573a-4d84-8209-d01689601218	1ae0597a-3a12-4544-9a0d-1f84a9e7bec2	\N
e2bf2f7b-4b33-4848-a9a4-09b06d57be6d	2023-03-12 00:00:00	6d20eb01-0201-4f52-b393-4b1745df8098	8b9f86e0-c024-4791-8b59-34b80517db1b	\N
ecda83b8-c371-486f-9f15-312e8bd75dd0	2023-03-12 00:00:00	a116fd1f-aedb-49d2-875a-1bb1cf16b9a3	28f40a96-3d8c-4e3b-9439-3869c8b2c81e	\N
ee624239-f70f-43a6-a22c-af05aacd1a18	2023-03-12 00:00:00	1d5206bd-d9c7-4316-902e-3e93859bc5de	a4a5b0e0-435e-4029-8b43-82bd4dd6bad0	\N
fec6303d-d47c-412b-b213-c33abef206c7	2023-03-12 00:00:00	87633fb3-5a8f-4db5-86ee-33ff8a9b606c	01b46d4f-eceb-48f0-912a-90ca38d810dd	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
002d7ead-7310-4065-92ee-bd29bc3b5b2d	0	1	\N	\N	38d72c6d-590c-4228-b25e-0b1f7647cf8b	\N
00c8d007-f815-4661-a912-dec330f29562	0	1	\N	\N	afc945e0-e0e0-4c18-9921-0b0df74f0f72	\N
01f701cc-75ba-4eed-a62a-95c96a358b58	0	1	\N	\N	620e2b03-502f-4d02-8966-ddbbeb64e36b	\N
0228e12f-5de5-4e2f-9ac6-79462561b4d5	0	1	\N	\N	8b3d85fb-1736-467c-a95c-e953f9007b19	\N
02f995bc-cf67-4bac-a49b-224b581275f6	0	2	\N	\N	1a154ba2-4fa4-4273-9aa9-3d2112b7984a	\N
03252bdb-f234-475e-a6a1-82b706ed0f95	0	1	\N	\N	b034f779-a57d-4ad2-ba2c-847d62f28a97	\N
03de4779-9cac-475a-a859-421f4211a5f8	0	3	\N	\N	5cc571c7-ca51-4897-87c1-7ad7a2300d99	\N
0511be73-9f67-4a46-8e2d-04ddc2f2b86f	0	1	\N	\N	73592a2c-5b0f-49dc-803d-99d041b46627	\N
0571b4bb-6072-4633-b442-71be985d20ea	0	1	\N	\N	ce323c7c-befa-4429-b6e9-fade68f31e89	\N
084241d8-292c-433b-96d1-baf23692564a	0	3	\N	\N	1f496059-c5a8-4c02-a516-af10c7be455b	\N
0ab9dd34-9123-4117-9462-38772a688fd5	0	1	\N	\N	d91073d4-f47d-4ba1-b8ce-9c9bef8c286f	\N
0c2bbb81-f2e9-485e-8d2a-ec89b1ce2cda	0	1	\N	\N	b40e812a-c92a-4baf-855c-60fd43abefe4	\N
0daa6845-6220-4846-9509-0fc11f1fdcba	0	1	\N	\N	90a323b9-ef1e-42e5-9d9c-ba12ba3916e1	\N
0e0f4e3d-554c-4dbb-b375-1db9f55dcd4f	0	3	\N	\N	585126d2-e6bd-43e3-bcf6-286af5536cd5	\N
0ed5231a-fa58-4abf-b734-320e9b326a32	0	1	\N	\N	ecda83b8-c371-486f-9f15-312e8bd75dd0	\N
11cc8bb2-93a1-4329-a9a1-d09dc2796ed3	0	3	\N	\N	ee624239-f70f-43a6-a22c-af05aacd1a18	\N
132d864b-84d6-4450-88c3-99b3f98e76c6	0	2	\N	\N	a631f554-4d20-4e13-88f0-fda314980555	\N
15521eda-c6a2-4a25-ada6-0f708d49c1b8	0	2	\N	\N	d0e2d693-617d-4a29-902b-bb985492b2c6	\N
15a3da7e-1162-4eb4-968b-941123172cd8	0	1	\N	\N	992fe7fe-c0e5-49b0-b50a-927675e213f1	\N
16621ef1-1983-4c93-9da5-54812799f0a6	0	2	\N	\N	ce323c7c-befa-4429-b6e9-fade68f31e89	\N
167dd136-71a5-48b3-a26e-b5e2198eeb39	0	1	\N	\N	60bed039-7bb6-4286-a700-e2f7e467f890	\N
17f4a151-b264-4bc1-99a5-897ffceec890	0	3	\N	\N	afc945e0-e0e0-4c18-9921-0b0df74f0f72	\N
18556222-d245-4449-b383-2ad1e7988094	0	3	\N	\N	6cafad31-18c2-478a-b0c5-ac541aabfab1	\N
18ccb0ca-ace7-4499-9450-2353f7b0887c	0	3	\N	\N	b034f779-a57d-4ad2-ba2c-847d62f28a97	\N
1aaec14d-99fc-4abf-a470-1f0109f64a43	0	3	\N	\N	8b3d85fb-1736-467c-a95c-e953f9007b19	\N
1ab73f82-3602-4d28-af7e-e42272c8c7e7	0	3	\N	\N	625d77ce-85ca-4f26-b8fc-7d193a5952c5	\N
1b5dddee-5952-494b-90b9-783afdaceb90	0	1	\N	\N	0c5c9960-354e-44a8-8c7a-ac46d1e8d1dc	\N
1d8d8599-01d9-4a6d-b3b1-5b1b498f2f65	0	1	\N	\N	e2bf2f7b-4b33-4848-a9a4-09b06d57be6d	\N
20dd4a89-1933-412e-a02a-62507cbee40f	0	3	\N	\N	1341e88c-7025-4713-9d1b-48a77bf32174	\N
211b59fd-425e-474f-904e-48302361ba89	0	3	\N	\N	992fe7fe-c0e5-49b0-b50a-927675e213f1	\N
236f35f2-2bf3-4528-a140-82713d2cb04c	0	2	\N	\N	6d5888ac-b2ba-4878-a41e-a922de2c49e8	\N
23804cc7-34b0-45ae-9c22-09b26e8f8ea1	0	3	\N	\N	b48fd06c-3609-43a7-875c-6a51a8e506f3	\N
23bb17ef-2265-4c1f-a8e2-df32c43e6ca4	0	2	\N	\N	b3498696-4715-4e74-95f3-2bedffb84e90	\N
24830985-1d24-4983-80d8-b839dbe7b734	0	1	\N	\N	850223f4-fc72-4c98-9375-8032a56414a4	\N
2557e43c-b05e-4812-a86d-f7cc1f66f5ca	0	3	\N	\N	24637308-002e-441f-af5a-94c35f180c0b	\N
25ae97a7-fdc9-4d11-a2c2-f8f83a862d14	0	1	\N	\N	5cc571c7-ca51-4897-87c1-7ad7a2300d99	\N
26cf3319-e05a-4d32-9101-e37852ffe1c1	0	3	\N	\N	2e2888b2-80c2-4677-9d21-e882a3400f9b	\N
27878022-48f9-43c9-be9c-822fa85c55f5	0	1	\N	\N	b3498696-4715-4e74-95f3-2bedffb84e90	\N
27d85222-86c4-432d-b6b1-a2ec83bd7cc0	0	2	\N	\N	850223f4-fc72-4c98-9375-8032a56414a4	\N
2823e079-8a88-4f16-8b69-4db5f718b8be	0	2	\N	\N	35d42fef-f1bb-48a2-8331-9a555c6c3cdd	\N
2acb12b5-f8e1-45e6-964c-384b89b864cc	0	3	\N	\N	ad5b581c-9472-4940-a1f8-e1193d734861	\N
2b760df6-bac9-44f6-a68f-d6249d11a6a3	0	2	\N	\N	73592a2c-5b0f-49dc-803d-99d041b46627	\N
2d3039dd-eb44-4066-8379-c8f61ad3b669	0	1	\N	\N	0a2c39e6-d61b-4430-ba8b-7b28ec5d0737	\N
2e830730-c7cb-418d-9a5e-7c917596d166	0	3	\N	\N	35d42fef-f1bb-48a2-8331-9a555c6c3cdd	\N
2e970316-244e-4fbc-b86c-b147716fbdf0	0	2	\N	\N	6cafad31-18c2-478a-b0c5-ac541aabfab1	\N
2f30bbd3-80ae-42ab-a318-08a3bfbfdc88	0	1	\N	\N	ad5b581c-9472-4940-a1f8-e1193d734861	\N
2f902c63-a2da-4cdc-9ada-948cc7d9da66	0	2	\N	\N	55ddf0c3-328b-4c3d-8448-bef14a9d58fd	\N
30e37457-a22d-4d34-b18d-15b4efd9ee82	0	3	\N	\N	d0e2d693-617d-4a29-902b-bb985492b2c6	\N
32f8a38f-645f-4dfc-8b5c-eba512821677	0	1	\N	\N	cc7ed0b3-0c39-473b-b27a-dc54027878a4	\N
33050474-5bd5-468a-be3c-9a1ea2816001	0	1	\N	\N	24637308-002e-441f-af5a-94c35f180c0b	\N
3333942c-0dad-4310-82df-544e3e285332	0	2	\N	\N	c0de5a20-a17c-4727-8427-e9ede58475ef	\N
33360c0e-27e7-407f-ab03-3c0a062032fe	0	3	\N	\N	a92b7ee6-da65-419f-9fd6-af00a6c569db	\N
3647ad41-6098-4726-9bfa-4d05e6a4145a	0	3	\N	\N	859c4cd2-365f-4a49-9626-21e0f49e777c	\N
391123fb-60d3-425e-baf1-02f870d67f6a	0	3	\N	\N	620e2b03-502f-4d02-8966-ddbbeb64e36b	\N
397d40f6-7a26-4971-93c9-f577d991f54e	0	2	\N	\N	cc7ed0b3-0c39-473b-b27a-dc54027878a4	\N
3b09c94c-cd7b-49f2-8873-79c11390d93b	0	2	\N	\N	0884aa8a-bbb7-46fb-93be-dbaf53b6b1f6	\N
3b96f2fa-0dc5-42c6-8a0d-548bf3880ecf	0	3	\N	\N	de609cac-cb08-4482-b32a-97acea33b844	\N
3d87f87f-2aa6-48cb-80dd-b116c10fe70c	0	2	\N	\N	336c5ff4-256e-4f5f-96f7-675a72a0eb4b	\N
3f59d55b-1bf4-45ee-8794-9f2c392902ce	0	2	\N	\N	1519b77e-1db3-42a3-9474-5a72bd11b7aa	\N
410257c0-0e8c-43b2-96e3-df64b020188a	0	3	\N	\N	5052a901-296a-4375-aa94-b2145529e4b3	\N
443069ec-c6da-492e-914a-9f225b2abd68	0	2	\N	\N	9fd7b057-0096-43ea-9358-2ace60900d10	\N
44ab1681-e4c6-47cb-98cc-732fd073ba88	0	1	\N	\N	859c4cd2-365f-4a49-9626-21e0f49e777c	\N
4554353c-1d2f-43b7-a723-7686e03185be	0	1	\N	\N	fec6303d-d47c-412b-b213-c33abef206c7	\N
4616b20b-4a84-47a8-8866-4fddc86b5243	0	1	\N	\N	05367cbf-2e6f-4617-9e6b-081c561593b0	\N
48799b53-ad16-45f2-bc29-19d10dd6fd6d	0	2	\N	\N	b034f779-a57d-4ad2-ba2c-847d62f28a97	\N
4976d380-3eb2-4cc0-b2a0-69002f26f99c	0	3	\N	\N	55ddf0c3-328b-4c3d-8448-bef14a9d58fd	\N
49c9c2b6-17ca-4718-a6d8-cca8ef9195d4	0	2	\N	\N	ad5b581c-9472-4940-a1f8-e1193d734861	\N
4a3bd9cd-1c2e-4596-af66-b1cdc249ce28	0	3	\N	\N	c0de5a20-a17c-4727-8427-e9ede58475ef	\N
4e8634be-b4ef-4927-b951-0ef4c673c2de	0	1	\N	\N	2e2888b2-80c2-4677-9d21-e882a3400f9b	\N
4fdf4e00-f34e-4709-b9ae-0b9570ded386	0	3	\N	\N	30292d1c-1370-416e-9bfa-4b55d8340c68	\N
5213449f-eb2a-4740-8944-dbff4abb5146	0	1	\N	\N	9fd7b057-0096-43ea-9358-2ace60900d10	\N
554d111c-eea1-471f-94fe-be6e289fb3e0	0	3	\N	\N	0884aa8a-bbb7-46fb-93be-dbaf53b6b1f6	\N
5672acb4-65f4-48e0-b0a1-5116de4f8cce	0	2	\N	\N	24637308-002e-441f-af5a-94c35f180c0b	\N
5673be10-84d3-49b5-8813-2fd4158229d6	0	2	\N	\N	111fd13a-e9aa-479a-9abb-43c57096d458	\N
579e3106-b594-44b7-8d03-b86fbb15486a	0	1	\N	\N	b3918091-7372-4124-a3ae-7c03d9cce22e	\N
58990d42-8ae6-4422-8dfe-268f6b75c643	0	2	\N	\N	5ca932cb-7ac8-4917-a6b1-9ed7f2e8358b	\N
5a0b5045-9f14-4fec-b5dd-e0cbeeda5223	0	2	\N	\N	1b3d1534-f529-43d5-a0c3-58ca1107623b	\N
5b631ebe-264d-457f-a3a8-dc5298d762b0	0	3	\N	\N	1b3d1534-f529-43d5-a0c3-58ca1107623b	\N
5bea0c38-1f82-4bf8-8248-4d37137d7e2e	0	3	\N	\N	0a2c39e6-d61b-4430-ba8b-7b28ec5d0737	\N
5c55879b-e08f-4097-baea-31f3aefcc6c7	0	2	\N	\N	7b353537-47d0-4c21-b549-20e3c89c7830	\N
5e798995-1f34-44fa-b1c9-37c1820bba93	0	2	\N	\N	38d72c6d-590c-4228-b25e-0b1f7647cf8b	\N
5eeafeb2-4937-4136-a94a-6b31042c604d	0	3	\N	\N	fec6303d-d47c-412b-b213-c33abef206c7	\N
5ff8d7d7-bee8-4a3e-ba1a-6b75baadd759	0	1	\N	\N	585126d2-e6bd-43e3-bcf6-286af5536cd5	\N
6394be59-46cf-4adc-86c4-77d42a1f382d	0	1	\N	\N	34af11e5-5942-4028-b1f1-5f1dd0c73507	\N
63b409fb-e142-4a0e-b94d-7e938c50f973	0	3	\N	\N	b40e812a-c92a-4baf-855c-60fd43abefe4	\N
649badae-7641-4053-b036-0677cbccce5d	0	3	\N	\N	111fd13a-e9aa-479a-9abb-43c57096d458	\N
64fe711f-6df3-4ae3-a017-8558644d4bc4	0	2	\N	\N	2e2888b2-80c2-4677-9d21-e882a3400f9b	\N
65aadc5c-dad7-4962-b43e-29d1eadaf04f	0	3	\N	\N	60bed039-7bb6-4286-a700-e2f7e467f890	\N
669e438c-0897-47d9-bc40-12cb9d6a0361	0	1	\N	\N	a631f554-4d20-4e13-88f0-fda314980555	\N
68851854-8fea-4355-8b55-54c7dc49fcd6	0	1	\N	\N	75cf64af-4cb4-4761-8c02-666951f81a92	\N
68beda0e-5145-45cc-9eb9-31e881ac13b9	0	2	\N	\N	ee624239-f70f-43a6-a22c-af05aacd1a18	\N
69cca519-e4d9-414d-a997-40f726086613	0	3	\N	\N	b3918091-7372-4124-a3ae-7c03d9cce22e	\N
6a8502df-a585-430a-a873-3b4b7e4a01bb	0	1	\N	\N	1b3d1534-f529-43d5-a0c3-58ca1107623b	\N
6be167bd-1b9c-4a55-9904-b60a40a448d4	0	1	\N	\N	1341e88c-7025-4713-9d1b-48a77bf32174	\N
6cb126ff-c762-4e8d-b0a8-f07b9ae2331e	0	2	\N	\N	b42d4619-4e26-43a4-ba87-c2bb0cc07537	\N
6ecde1e1-5502-41d1-bd4d-8d4de7dea335	0	1	\N	\N	d0e2d693-617d-4a29-902b-bb985492b2c6	\N
7053978b-a887-4a92-ae01-5d65dca1d258	0	1	\N	\N	2b7bb825-16c2-421f-b9fb-7471ff32f3b5	\N
70777ae8-3741-4dc4-8010-60e5f28fd48e	0	1	\N	\N	097ab604-3e6e-4939-9eda-ae63da6f2537	\N
70d5d50c-68c7-4448-90e0-2850a3d9be5b	0	1	\N	\N	336c5ff4-256e-4f5f-96f7-675a72a0eb4b	\N
713c06d9-e7de-4bed-81b7-eb45a762ae7c	0	3	\N	\N	1519b77e-1db3-42a3-9474-5a72bd11b7aa	\N
71523731-5b6d-4e32-92d0-8b4cec26d292	0	3	\N	\N	d91073d4-f47d-4ba1-b8ce-9c9bef8c286f	\N
7176595c-2e95-444c-b193-b897d71abf3e	0	1	\N	\N	1519b77e-1db3-42a3-9474-5a72bd11b7aa	\N
737f2e53-cc79-4707-92f7-823c5c7e89e7	0	1	\N	\N	199a022a-47cf-4e53-805b-35f139cfd3d3	\N
75abcde3-043d-4f19-b3d2-df4bfd57b0e6	0	2	\N	\N	625d77ce-85ca-4f26-b8fc-7d193a5952c5	\N
763b9bb6-3019-4d97-b6ac-26b569053893	0	3	\N	\N	2387104b-7be1-431a-a8ea-9eeb02944b76	\N
76879616-0ec9-4702-8dc1-94d9aed264ee	0	3	\N	\N	73592a2c-5b0f-49dc-803d-99d041b46627	\N
76c07789-6f16-45a6-8565-616031c88195	0	2	\N	\N	34af11e5-5942-4028-b1f1-5f1dd0c73507	\N
7745c042-4a48-4286-9ca7-17de666ed825	0	2	\N	\N	78d86743-719f-483c-99f5-96df5b76cf26	\N
775e3e15-48e5-4aad-b2c2-56e055be00dd	0	3	\N	\N	199a022a-47cf-4e53-805b-35f139cfd3d3	\N
7782142a-3183-410e-9348-b9c8a8543f92	0	2	\N	\N	992fe7fe-c0e5-49b0-b50a-927675e213f1	\N
7ae391a8-9a44-4e47-83b9-76809dec845a	0	3	\N	\N	34af11e5-5942-4028-b1f1-5f1dd0c73507	\N
7dad000a-b827-46c5-8871-17dc7c3e3bd8	0	3	\N	\N	497d3dc9-ba89-4016-8048-09f980840756	\N
7de7c1f8-7502-4c50-b080-3a4cff15e924	0	3	\N	\N	3f2d752d-0a24-42e2-a8cb-a5ba3d397f1e	\N
7e071c45-bfec-4f87-b2d9-bebcfe07b43d	0	2	\N	\N	fec6303d-d47c-412b-b213-c33abef206c7	\N
7e1b96f7-8daf-4cb3-9c8b-7b99cc2f128c	0	1	\N	\N	1f496059-c5a8-4c02-a516-af10c7be455b	\N
7e4d8874-9e93-42e3-9988-106f44e5df72	0	1	\N	\N	5052a901-296a-4375-aa94-b2145529e4b3	\N
7ecc36c7-29b8-454d-93df-be53a68560c0	0	1	\N	\N	de609cac-cb08-4482-b32a-97acea33b844	\N
7ee73904-1986-4fed-bc16-425d6a496e7f	0	2	\N	\N	0a2c39e6-d61b-4430-ba8b-7b28ec5d0737	\N
7fe6f382-0328-466d-8706-30bf28b189c1	0	3	\N	\N	90a323b9-ef1e-42e5-9d9c-ba12ba3916e1	\N
8116245a-2f8b-4a23-addb-2d43766e1a01	0	1	\N	\N	111fd13a-e9aa-479a-9abb-43c57096d458	\N
8391ae6f-cba7-486a-826f-cf5568d430ec	0	3	\N	\N	e2bf2f7b-4b33-4848-a9a4-09b06d57be6d	\N
873c2907-7a3f-47c8-b15b-654ff524cc3f	0	3	\N	\N	2b7bb825-16c2-421f-b9fb-7471ff32f3b5	\N
8821cf36-6fb7-4e13-abd6-5a282dff6bb3	0	3	\N	\N	ce323c7c-befa-4429-b6e9-fade68f31e89	\N
887a6250-7252-487a-a8f6-642f326c2a14	0	1	\N	\N	78d86743-719f-483c-99f5-96df5b76cf26	\N
889a2f29-0a9e-47a8-a002-e4e41909861d	0	2	\N	\N	720d7ce6-2949-4c4b-b8a8-1463f970dceb	\N
89fba6d7-a44a-42b1-addf-4dc0a6833be0	0	1	\N	\N	12d70402-3b2c-4789-8b78-6084e2ea0036	\N
8d586cc6-5944-4cd2-ba1e-aa4ca7974e42	0	3	\N	\N	b42d4619-4e26-43a4-ba87-c2bb0cc07537	\N
8d5b23c5-fbee-4a0f-981c-44e2b4d0d131	0	1	\N	\N	7b353537-47d0-4c21-b549-20e3c89c7830	\N
8f69654c-e1ab-47ba-8f21-9676ef9a6b58	0	2	\N	\N	e2bf2f7b-4b33-4848-a9a4-09b06d57be6d	\N
8ffae217-dd8c-482a-994b-825b159d48e9	0	2	\N	\N	2387104b-7be1-431a-a8ea-9eeb02944b76	\N
93c88320-8fbd-4932-9a01-360b80069a52	0	3	\N	\N	12d70402-3b2c-4789-8b78-6084e2ea0036	\N
94345fa9-2b3e-4605-992d-572196f18fea	0	3	\N	\N	a631f554-4d20-4e13-88f0-fda314980555	\N
952e311c-ad08-4cfa-9565-ab78734fbf5e	0	2	\N	\N	2b7bb825-16c2-421f-b9fb-7471ff32f3b5	\N
98c97286-12b6-4450-b608-9b989dd9e015	0	3	\N	\N	097ab604-3e6e-4939-9eda-ae63da6f2537	\N
99a6b1b0-2275-4f1e-aeef-a8ec65836a0a	0	1	\N	\N	0884aa8a-bbb7-46fb-93be-dbaf53b6b1f6	\N
9eb59784-1551-447a-a435-5bf625d8dc42	0	3	\N	\N	1a154ba2-4fa4-4273-9aa9-3d2112b7984a	\N
9ed5585c-84de-4192-9461-f1b820c9ea6b	0	2	\N	\N	b3918091-7372-4124-a3ae-7c03d9cce22e	\N
a2b74a4e-1820-4e86-a456-8b52d5ebd2ce	0	3	\N	\N	38d72c6d-590c-4228-b25e-0b1f7647cf8b	\N
a3e520f7-cf84-4b1e-aa71-7563798e5c53	0	3	\N	\N	05367cbf-2e6f-4617-9e6b-081c561593b0	\N
a63c0dc6-2e94-477d-a6ef-37e980037773	0	2	\N	\N	12d70402-3b2c-4789-8b78-6084e2ea0036	\N
a822a219-797c-4ae4-8067-2eded02b475e	0	1	\N	\N	6d5888ac-b2ba-4878-a41e-a922de2c49e8	\N
aa4fb85a-d31c-4911-8a3e-7b5dbe7c998b	0	3	\N	\N	6d5888ac-b2ba-4878-a41e-a922de2c49e8	\N
b001c1e8-b6c2-4024-b899-ef338c90c4d2	0	1	\N	\N	6cafad31-18c2-478a-b0c5-ac541aabfab1	\N
b0274cce-9e5e-4f0b-bc8e-319b688611ca	0	1	\N	\N	625d77ce-85ca-4f26-b8fc-7d193a5952c5	\N
b1608db5-d5c7-4f93-a326-33275ac90e32	0	3	\N	\N	0c5c9960-354e-44a8-8c7a-ac46d1e8d1dc	\N
bbb76048-4383-43a3-8ef4-3ec06cec9ad5	0	3	\N	\N	96fb27a1-2ac4-4de1-bd16-c65de97bc700	\N
bcd36a8a-17bd-4af3-adfc-85de7ae250bc	0	2	\N	\N	1df85685-6d54-42b2-a052-5fc228e8a401	\N
bd2d0ccf-6172-4097-b977-a1254b66d852	0	2	\N	\N	5052a901-296a-4375-aa94-b2145529e4b3	\N
bdc2bf1a-c67f-4e0c-b5ef-9f5e03d2517c	0	2	\N	\N	097ab604-3e6e-4939-9eda-ae63da6f2537	\N
be0c9fd7-e511-4ce9-90c6-d9af818d97e6	0	1	\N	\N	5ca932cb-7ac8-4917-a6b1-9ed7f2e8358b	\N
bf859301-ed2f-4114-8a46-70854dda5d24	0	2	\N	\N	859c4cd2-365f-4a49-9626-21e0f49e777c	\N
bfca52b3-c426-4db4-9868-18370dcf187e	0	2	\N	\N	585126d2-e6bd-43e3-bcf6-286af5536cd5	\N
c0dc920e-5de2-480e-b07c-11b3e5008b6f	0	1	\N	\N	b48fd06c-3609-43a7-875c-6a51a8e506f3	\N
c208c376-66f0-4e66-98d5-15f1f1adaa27	0	2	\N	\N	96fb27a1-2ac4-4de1-bd16-c65de97bc700	\N
c24513af-34d7-4dc2-a0e3-6db42242919d	0	2	\N	\N	a92b7ee6-da65-419f-9fd6-af00a6c569db	\N
c4e49219-4bd3-45b1-ac37-9d0d382fa2fd	0	1	\N	\N	9c8fceca-8444-4691-a35d-c18fa833225a	\N
c5a621c4-0309-4772-9b8b-e1ba13061d6e	0	1	\N	\N	b42d4619-4e26-43a4-ba87-c2bb0cc07537	\N
c64f8ce0-650b-49b6-b514-6424bffa77bb	0	2	\N	\N	5cc571c7-ca51-4897-87c1-7ad7a2300d99	\N
c7bbfcd1-228f-4131-a595-bbffc9882403	0	2	\N	\N	b48fd06c-3609-43a7-875c-6a51a8e506f3	\N
c82871fa-ddcf-41bf-8799-ae03b1475388	0	3	\N	\N	1df85685-6d54-42b2-a052-5fc228e8a401	\N
c864414d-e28e-4ecb-82ed-b1207df4afac	0	3	\N	\N	75cf64af-4cb4-4761-8c02-666951f81a92	\N
c9c034a7-28d7-4c94-94a6-86786768fdee	0	1	\N	\N	720d7ce6-2949-4c4b-b8a8-1463f970dceb	\N
cb8e6442-5507-486d-93bc-89bc207bb9c4	0	2	\N	\N	b40e812a-c92a-4baf-855c-60fd43abefe4	\N
cd1437b6-d58b-4f1e-bbb0-12e9102ea11a	0	1	\N	\N	1a154ba2-4fa4-4273-9aa9-3d2112b7984a	\N
cd83111e-f87c-487f-9bb5-8fb500a52f5d	0	3	\N	\N	cc7ed0b3-0c39-473b-b27a-dc54027878a4	\N
cd914a1c-ffb5-4251-b0b7-00f48a57ce47	0	3	\N	\N	78d86743-719f-483c-99f5-96df5b76cf26	\N
cdc85585-aeba-44f6-a3b4-babc12a7f32c	0	2	\N	\N	1341e88c-7025-4713-9d1b-48a77bf32174	\N
cddbf878-7dda-41bf-84f1-9af0a14fc38b	0	3	\N	\N	336c5ff4-256e-4f5f-96f7-675a72a0eb4b	\N
cea67882-363d-4b28-a550-65b166b1dc3e	0	3	\N	\N	9c8fceca-8444-4691-a35d-c18fa833225a	\N
cfbff58c-98ce-40ec-a81a-9fe87d7f70c7	0	2	\N	\N	de609cac-cb08-4482-b32a-97acea33b844	\N
d255e662-3aa2-439b-a25a-b0232503a06b	0	2	\N	\N	620e2b03-502f-4d02-8966-ddbbeb64e36b	\N
d306a870-e7b2-40ee-960d-64b4c2a8d8fa	0	2	\N	\N	75cf64af-4cb4-4761-8c02-666951f81a92	\N
d4bb13e2-f876-4297-8d1e-55e4aa6a7998	0	1	\N	\N	c0de5a20-a17c-4727-8427-e9ede58475ef	\N
d5ce95dd-f2d1-4273-b7ac-5b257e4fbec3	0	3	\N	\N	850223f4-fc72-4c98-9375-8032a56414a4	\N
d6966962-5d65-4fc1-bc59-54a35fdbdc70	0	2	\N	\N	199a022a-47cf-4e53-805b-35f139cfd3d3	\N
d7d4fec5-99ee-4f28-9605-e386c3a30a66	0	1	\N	\N	3f2d752d-0a24-42e2-a8cb-a5ba3d397f1e	\N
d806b34c-eeef-4db6-97b7-019bbfa2ce7d	0	1	\N	\N	55ddf0c3-328b-4c3d-8448-bef14a9d58fd	\N
d8ba37b1-8fe4-4069-9fed-b8550b0401d2	0	3	\N	\N	b3498696-4715-4e74-95f3-2bedffb84e90	\N
dab9310a-f700-456a-9490-2ea717338d27	0	1	\N	\N	35d42fef-f1bb-48a2-8331-9a555c6c3cdd	\N
dacbffc4-56e7-4a85-b8b7-8275f1bc7a0d	0	3	\N	\N	720d7ce6-2949-4c4b-b8a8-1463f970dceb	\N
ddd03807-a203-440f-b5be-de9fb1b11e08	0	2	\N	\N	9c8fceca-8444-4691-a35d-c18fa833225a	\N
deb8f3da-7fc6-4263-b5d7-9dd664287142	0	1	\N	\N	30292d1c-1370-416e-9bfa-4b55d8340c68	\N
dfd8068b-34b7-4cc0-bfa6-a9be1bd9fc14	0	3	\N	\N	7b353537-47d0-4c21-b549-20e3c89c7830	\N
e379ae74-07a7-4c79-8966-948070d7ef77	0	2	\N	\N	1f496059-c5a8-4c02-a516-af10c7be455b	\N
e499928d-5a33-4bc7-9a78-d67639d1c843	0	1	\N	\N	ee624239-f70f-43a6-a22c-af05aacd1a18	\N
e61fb840-6b33-4e66-bb65-eb8619fd2107	0	3	\N	\N	ecda83b8-c371-486f-9f15-312e8bd75dd0	\N
e98a76ac-7dbe-498d-8054-d280f6eee3f0	0	2	\N	\N	05367cbf-2e6f-4617-9e6b-081c561593b0	\N
ea6cde5f-f02d-4fab-9522-517901931e19	0	1	\N	\N	96fb27a1-2ac4-4de1-bd16-c65de97bc700	\N
ecd2b495-bdab-4bdd-a15a-0911ce025d74	0	1	\N	\N	1df85685-6d54-42b2-a052-5fc228e8a401	\N
ee0381e3-8a4d-4e32-94a3-8bc6af33b747	0	2	\N	\N	497d3dc9-ba89-4016-8048-09f980840756	\N
f0a16fa2-a5d7-45b8-8ef2-ef6ea92e6299	0	2	\N	\N	60bed039-7bb6-4286-a700-e2f7e467f890	\N
f10e8f90-1c0a-4245-8a14-d2a9c9cabb75	0	2	\N	\N	afc945e0-e0e0-4c18-9921-0b0df74f0f72	\N
f4b36b76-1271-4f14-b265-7ea68e9d3946	0	2	\N	\N	d91073d4-f47d-4ba1-b8ce-9c9bef8c286f	\N
f6e14f7e-bb1b-42ad-b4ed-76acfb2e379c	0	2	\N	\N	30292d1c-1370-416e-9bfa-4b55d8340c68	\N
f85f4974-ea03-435e-b6d2-b9b0c70cdcfb	0	2	\N	\N	0c5c9960-354e-44a8-8c7a-ac46d1e8d1dc	\N
f86078f9-4060-4cf1-a4dd-285d44a7c546	0	2	\N	\N	8b3d85fb-1736-467c-a95c-e953f9007b19	\N
f9b1f1fd-fd0c-470b-b49f-86959e4a2d20	0	2	\N	\N	90a323b9-ef1e-42e5-9d9c-ba12ba3916e1	\N
fa0984e2-23e9-4fb7-9d09-d54c3ae8dd55	0	1	\N	\N	497d3dc9-ba89-4016-8048-09f980840756	\N
fce3a11d-fbac-4aed-96fa-66a1da263765	0	1	\N	\N	a92b7ee6-da65-419f-9fd6-af00a6c569db	\N
fd25d1cb-9f2e-4973-ad54-a52b91cc9260	0	3	\N	\N	5ca932cb-7ac8-4917-a6b1-9ed7f2e8358b	\N
fdaab862-6017-4240-b673-662a26b841b1	0	3	\N	\N	9fd7b057-0096-43ea-9358-2ace60900d10	\N
fe21cabd-d7d3-46b0-8722-ff814eab852e	0	2	\N	\N	ecda83b8-c371-486f-9f15-312e8bd75dd0	\N
fee80942-6183-4be7-8dba-0af558dbf271	0	2	\N	\N	3f2d752d-0a24-42e2-a8cb-a5ba3d397f1e	\N
ff0f99f4-8b2a-4b8c-b6a7-57b44dfd8c68	0	1	\N	\N	2387104b-7be1-431a-a8ea-9eeb02944b76	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
034f3531-9c46-46ac-8f7a-925308bcf4fa	54	400	t	f	86efac91-43be-48ef-aa20-c79183102130	de70de70-5f79-4b2c-983d-e3b7901cf707	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
051220a0-e768-417f-9204-70fc1c566275	54	400	t	f	5642153b-7112-48bc-bd8f-c4669b06c88e	de70de70-5f79-4b2c-983d-e3b7901cf707	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
0622d6e6-1134-4e12-92ed-b58c5bd9dcf5	2	1880	t	f	713d1374-cebb-4ea5-8f11-9386e8c26ca3	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
06aff7cc-4326-4571-999f-263f08f36d5c	18	4000	t	f	66e24c06-959f-495e-a66f-4532c87f4208	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
0ba1a7bc-75ea-4ff8-9658-f15ebcf60ce5	58	900	t	f	0d79babe-bde5-45b7-b6f5-9c94b566c661	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
10b29fdf-4360-4683-9570-010ed2c1044c	58	900	t	f	95d3ccd2-5c3e-4ef7-b368-8f93cf7c10fc	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
11ad7305-db05-47d7-a041-0057d0022275	58	900	t	f	366ee092-0c55-460b-8eec-cb0b14b45fe9	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
1839fff9-6cc3-46f2-8a79-da361ed25a0e	48	1900	t	f	0a30519c-2126-4276-a7c6-18bbb7560387	6310e091-6a4c-494b-a70f-81a1a97eb0b1	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
1bf0f87f-73c1-41ec-80ae-53a0458b105e	2	1880	t	f	3d32f93e-7198-4c47-89fb-979248728eb8	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
1d5206bd-d9c7-4316-902e-3e93859bc5de	2	1880	t	f	899e6bba-cfce-44e9-8111-957872baaf5c	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
28cc5857-0d9a-4d2b-8e62-c0f94496f021	2	1880	t	f	5353e0f5-32d5-41f3-9852-da45df64f74a	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
307691e1-7578-425d-b76b-6e536d04c898	39	280	t	f	86efac91-43be-48ef-aa20-c79183102130	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
311790ed-39a9-421a-82a2-06ef034d6c3d	1	1900	t	f	2fe327b2-e6cc-4af6-ab39-7a1ac0ec3146	ec27311a-a471-453e-a5c4-ebc6d1c9d129	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
33b99274-384b-4224-bb11-067b5bc8dad3	56	400	t	f	55475ac0-3d77-47f1-8a8b-2d8ddc786bb7	e08af075-e9f6-42d7-839d-addfcfe8f91a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
38ed259e-cec3-4114-b792-4c8e6d78363f	52	1200	t	f	bfee3f8e-cada-42ad-bb34-0dbfb336ffe4	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
3c0c6a9b-1551-4674-9193-c2c3f414fdf3	2	1880	t	f	74158b8b-0713-4902-9f6b-858fb3013428	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
438f9dcc-dfb6-4234-a729-5e5461221260	18	4000	t	f	55475ac0-3d77-47f1-8a8b-2d8ddc786bb7	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
447d40d6-cbbc-4cdc-be20-6314df4a7da2	39	280	t	f	f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
47fa61f4-8de4-43b1-b0cb-951c3698a867	2	1880	t	f	127cab7d-ed10-41de-89da-a7cedd09989a	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
48658d34-844b-4ce0-be01-5f30eb8824e7	39	280	t	f	366ee092-0c55-460b-8eec-cb0b14b45fe9	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
4ffcb37f-8942-43cd-bd1e-210cff60e6ad	55	400	t	f	5642153b-7112-48bc-bd8f-c4669b06c88e	cdc547b7-b988-4ff1-a68a-f9b44083a69a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
5495a61e-5a23-4900-a9ae-942104bd4fd3	58	900	t	f	7f8b819b-e31a-48e3-b8e1-1457f598f174	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
5a5596d3-82f8-439a-8e3e-a9e29d7ea77c	54	400	t	f	d5e45248-ab3b-4558-8a32-852e84de905a	de70de70-5f79-4b2c-983d-e3b7901cf707	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
5c57bd77-6a2b-48ae-8fe2-426e9e61bdde	48	1900	t	f	fbd86e4e-6bc7-4274-8f52-663121847c28	6310e091-6a4c-494b-a70f-81a1a97eb0b1	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
5c819b52-b238-4249-adf9-1fece6f6fc3b	39	280	t	f	55475ac0-3d77-47f1-8a8b-2d8ddc786bb7	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
628c936a-dc1b-48fc-9517-c3092c6a46db	58	900	t	f	a8d92522-be79-4c88-8c16-4e0425453608	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
65fe7b90-1706-49d0-85fb-e7c218d61ffc	54	400	t	f	5d1bb17c-c0f3-46e6-a517-38ae6c5f542a	de70de70-5f79-4b2c-983d-e3b7901cf707	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
68a6b6b3-2f83-4a8c-8fb2-0d7b549794e6	52	1200	t	f	c7be0013-61e4-4717-8ee0-f3e7e6da0c23	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
6a3c668f-2485-4b84-990e-55e332bd83f3	57	400	t	f	95d3ccd2-5c3e-4ef7-b368-8f93cf7c10fc	fbd0da75-db44-4e22-b2d3-55f11b61fa4a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
6d20eb01-0201-4f52-b393-4b1745df8098	39	280	t	f	5efe189f-2147-4eea-8638-c41e450abec7	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
71363805-75ba-4b46-921d-80ec31639f69	18	4000	t	f	a8d92522-be79-4c88-8c16-4e0425453608	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
71e51848-9b05-41f0-a432-921058cfd3be	39	280	t	f	06b73653-429f-4195-a423-6afa6e7a5d71	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
75c5b403-ee85-45ad-a7dd-8d9733430063	39	280	t	f	a8d92522-be79-4c88-8c16-4e0425453608	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
7b6f0891-2bd1-46b0-9e23-5cbb82e76f3b	58	900	t	f	86efac91-43be-48ef-aa20-c79183102130	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
82189607-a33b-4460-9ac6-0028321a81e0	39	280	t	f	7f8b819b-e31a-48e3-b8e1-1457f598f174	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
84a5f78e-20d8-403a-83aa-baf2a707d917	1	1900	t	f	899e6bba-cfce-44e9-8111-957872baaf5c	ec27311a-a471-453e-a5c4-ebc6d1c9d129	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
87633fb3-5a8f-4db5-86ee-33ff8a9b606c	58	900	t	f	d5e45248-ab3b-4558-8a32-852e84de905a	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
951e6b12-3e11-4c22-a988-6f057a5de6e2	55	400	t	f	5d1bb17c-c0f3-46e6-a517-38ae6c5f542a	cdc547b7-b988-4ff1-a68a-f9b44083a69a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
9b239393-6b56-4d9f-bf6d-51831cf1254b	39	280	t	f	6b08c6f3-c1ef-4ce3-94f1-693de2bf3d6f	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
a07d4641-c8c6-4b83-8f55-92a8ce3b8238	39	280	t	f	14b8c3ff-3861-41cf-b07f-f09905e4c510	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
a116fd1f-aedb-49d2-875a-1bb1cf16b9a3	56	400	t	f	0d79babe-bde5-45b7-b6f5-9c94b566c661	e08af075-e9f6-42d7-839d-addfcfe8f91a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
af6e3d9a-85e7-457d-987a-d4197eb49b43	58	900	t	f	5efe189f-2147-4eea-8638-c41e450abec7	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
b2489bd2-e08d-441a-bb20-0706eda98dd2	39	280	t	f	0a30519c-2126-4276-a7c6-18bbb7560387	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
b400d122-7eb0-47b3-a211-1111c2483ec5	52	1200	t	f	1a7aef0c-5af8-4fb7-aaeb-20b508f62777	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
b5bb6bd2-573a-4d84-8209-d01689601218	56	400	t	f	a8d92522-be79-4c88-8c16-4e0425453608	e08af075-e9f6-42d7-839d-addfcfe8f91a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
b6ebbd41-c65d-40eb-8c65-b4df3e52d40e	58	900	t	f	55475ac0-3d77-47f1-8a8b-2d8ddc786bb7	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
b8e15dc8-a58c-4417-b029-7ccb8bd05a75	55	400	t	f	06b73653-429f-4195-a423-6afa6e7a5d71	cdc547b7-b988-4ff1-a68a-f9b44083a69a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
bd9fb2cd-1320-4d12-ac63-603738f41fd9	52	1200	t	f	8004b2ac-f7a8-45e9-a577-616800f8c716	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
bf0eed21-c5c0-4f94-999c-d4c319698fdb	56	400	t	f	95d3ccd2-5c3e-4ef7-b368-8f93cf7c10fc	e08af075-e9f6-42d7-839d-addfcfe8f91a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
c08df95e-0303-4e7e-9858-0528e9c4f0f6	58	900	t	f	5642153b-7112-48bc-bd8f-c4669b06c88e	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
c1db1212-35d8-4842-96cf-cde18ef32e71	1	1900	t	f	3d32f93e-7198-4c47-89fb-979248728eb8	ec27311a-a471-453e-a5c4-ebc6d1c9d129	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
c8e39e99-b8a2-45d9-aca1-f401ed91441b	2	1880	t	f	2fe327b2-e6cc-4af6-ab39-7a1ac0ec3146	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
c951ac57-9bdb-4c6b-8d90-a0400c2e5bbb	52	1200	t	f	bc3aff41-4b1c-4809-b077-a078a44c8045	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
ca929033-533c-4930-8f1c-93b633a9e1bb	58	900	t	f	06b73653-429f-4195-a423-6afa6e7a5d71	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
d9f11a46-d038-43e7-997f-627b0a541e3d	18	4000	t	f	86efac91-43be-48ef-aa20-c79183102130	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
dfd9d938-d8ec-43c0-a51e-21bdd7f4c0f9	57	400	t	f	366ee092-0c55-460b-8eec-cb0b14b45fe9	fbd0da75-db44-4e22-b2d3-55f11b61fa4a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
e1666ccc-2742-4539-bbf2-403abacc077d	57	400	t	f	5efe189f-2147-4eea-8638-c41e450abec7	fbd0da75-db44-4e22-b2d3-55f11b61fa4a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
e2a95158-b24c-4b02-87c0-1e18a1087aee	52	1200	t	f	45d68f6b-c41d-4987-b65f-9b871e8e1c9b	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
e64a41ae-b2ff-4582-a6fe-5b3a576539a1	18	4000	t	f	3d8c1f2d-4416-4d3a-9229-538b711512c6	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
e6552726-fc00-473e-9aa5-4a4eba499cd3	55	400	t	f	7f8b819b-e31a-48e3-b8e1-1457f598f174	cdc547b7-b988-4ff1-a68a-f9b44083a69a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
ebd7c836-af9b-40aa-ad4d-ff281ccd7fa7	2	1880	t	f	8b6434c5-eec6-475b-9aca-bc83e4dcd331	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
ee4b9a2e-10a2-4070-9758-d4d4a160d141	57	400	t	f	0d79babe-bde5-45b7-b6f5-9c94b566c661	fbd0da75-db44-4e22-b2d3-55f11b61fa4a	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
f09c71a7-5e11-438d-a09d-27d4886ccac2	58	900	t	f	5d1bb17c-c0f3-46e6-a517-38ae6c5f542a	0b793922-36ac-49e9-a419-5f89cb701d05	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
f0dcd488-16c7-410b-a6b8-744c6bff75bc	48	1900	t	f	f16e41eb-6e24-49f8-8c57-4fc7e3fa71f7	6310e091-6a4c-494b-a70f-81a1a97eb0b1	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
f199bb4e-520a-496a-b798-25c1e15ca2e1	18	4000	t	f	d5e45248-ab3b-4558-8a32-852e84de905a	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
f7d1ec24-7d01-4921-896c-3431b0988829	39	280	t	f	d5e45248-ab3b-4558-8a32-852e84de905a	2a696102-45a2-4399-a3ba-cff382147d20	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
f8f1952a-8a6c-4755-986a-2622ac8f481c	48	1900	t	f	af42bef8-4c17-4336-a62e-cfcb72229541	6310e091-6a4c-494b-a70f-81a1a97eb0b1	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
fb1684a1-f952-48c1-89d6-34b278f0748b	1	1900	t	f	713d1374-cebb-4ea5-8f11-9386e8c26ca3	ec27311a-a471-453e-a5c4-ebc6d1c9d129	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
0b793922-36ac-49e9-a419-5f89cb701d05	58	Инструкция 58	58
19d0c1a8-41fa-4825-b6e4-44412b81c079	2	Инструкция 2	2
2a696102-45a2-4399-a3ba-cff382147d20	39	Инструкция 39	39
43cf22e6-cd1c-41ab-b88a-447453fb0697	52	Инструкция 52	52
6310e091-6a4c-494b-a70f-81a1a97eb0b1	48	Инструкция 48	48
cdc547b7-b988-4ff1-a68a-f9b44083a69a	55	Инструкция 55	55
de70de70-5f79-4b2c-983d-e3b7901cf707	54	Инструкция 54	54
e08af075-e9f6-42d7-839d-addfcfe8f91a	56	Инструкция 56	56
e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	18	Инструкция 18	18
ec27311a-a471-453e-a5c4-ebc6d1c9d129	1	Инструкция 1	1
fbd0da75-db44-4e22-b2d3-55f11b61fa4a	57	Инструкция 57	57
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
04a87ec4-cbf6-4a1f-9539-f0b855f5905d	75131-2800010-70	Рама	\N	3291137
38f96278-431c-4ad0-93d7-d696a92a6a0b	7513D-2800010-20	Рама	\N	3330041
bf499495-6b0e-445d-a63c-d0f5291c14c7	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
55dbc97c-5b88-4c68-a925-5c206bd1346e	0d20b002-eda0-4a72-af53-69ae5d7cea09
57e2df38-d90a-426d-bb19-bcaab7ef93c5	0d20b002-eda0-4a72-af53-69ae5d7cea09
25bf87e2-49c8-4f7d-8656-9b0ff48930d2	b83761e2-8683-4fc7-a526-265eec70a0c9
8a03bcbe-5288-4857-82ce-40f620c3251b	b83761e2-8683-4fc7-a526-265eec70a0c9
097f7e8d-5c15-4e03-8041-5fbdee1f2aba	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
49fbdc1b-5565-44b2-bf50-2ab21119f419	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
56245cfb-5388-4683-9bba-56221b3e459a	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
8334461c-504c-415d-bfc7-7e75605a2f43	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
9c12571d-87a3-4623-8a8d-bce5dd00eacd	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
c9f393b8-a703-4f50-ad5d-4a17e41b7a1c	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
d79857ac-21d8-4c2c-830c-18eb8fe27762	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
fa85f630-42bf-499d-a31d-31749034226d	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
0fd201d5-c190-40c8-97d3-ffe0e524d415	3d006e6d-9753-49ee-a448-88a016d138f8
ba36e717-8c13-4e02-8712-cac1e6e39cd3	0751a683-d977-4703-869a-341926ff8453
27592f4c-492e-41b9-9154-aafd80c89ab8	fb0b2721-1ab5-4c50-911f-d7e9d1bb8ed5
878afde6-e060-4b58-aff5-7f11b7613cb0	0d20b002-eda0-4a72-af53-69ae5d7cea09
aa7407ae-a91f-46af-85b5-7d10cd48f72a	3d006e6d-9753-49ee-a448-88a016d138f8
0a09387b-f9a0-47a2-a109-31960ef425fc	b83761e2-8683-4fc7-a526-265eec70a0c9
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
55dbc97c-5b88-4c68-a925-5c206bd1346e	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
57e2df38-d90a-426d-bb19-bcaab7ef93c5	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
25bf87e2-49c8-4f7d-8656-9b0ff48930d2	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
8a03bcbe-5288-4857-82ce-40f620c3251b	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
097f7e8d-5c15-4e03-8041-5fbdee1f2aba	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
49fbdc1b-5565-44b2-bf50-2ab21119f419	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
56245cfb-5388-4683-9bba-56221b3e459a	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
8334461c-504c-415d-bfc7-7e75605a2f43	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
9c12571d-87a3-4623-8a8d-bce5dd00eacd	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
c9f393b8-a703-4f50-ad5d-4a17e41b7a1c	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
d79857ac-21d8-4c2c-830c-18eb8fe27762	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
fa85f630-42bf-499d-a31d-31749034226d	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
0fd201d5-c190-40c8-97d3-ffe0e524d415	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
ba36e717-8c13-4e02-8712-cac1e6e39cd3	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$jQ+o/5VXdRkUBzsfEVnySHLl5EeNvR9HWprIOZhe6FMHJJb3	\N	\N	\N	\N	\N	\N
27592f4c-492e-41b9-9154-aafd80c89ab8	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$6IMRPltY5D3JEHly9MoD2+3ac6NF+1yQAcPmZ+Bs5AmqKhz/	\N	\N	\N	\N	\N	\N
878afde6-e060-4b58-aff5-7f11b7613cb0	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$U/RbB9F88LzyyZzv5kbdGH6hAQDJqsNmeZGWaUUBJlLg7eRy	\N	\N	\N	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
aa7407ae-a91f-46af-85b5-7d10cd48f72a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$83/h0/YZa1zNDg+dnqbgy0lDb0ZcMhPwS0il+VP8UJEgZ9um	\N	\N	\N	\N	\N	\N
0a09387b-f9a0-47a2-a109-31960ef425fc	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$v5l/MBSS3c9xansSkEecMeXF7alMZ0kQ2slh3rKMX3EQDwYz	\N	\N	\N	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
01ef024d-32ba-4299-9e11-a720c65ab27e	1	Заполняющий	230	270	23	26	\N	\N	ec27311a-a471-453e-a5c4-ebc6d1c9d129	\N
1e781cb4-1d80-49ac-a10a-b9b028e33800	1	Заполняющий	230	270	23	26	\N	\N	6310e091-6a4c-494b-a70f-81a1a97eb0b1	\N
3cbbe342-791a-4852-a0be-a8322ee8a2cb	1	Заполняющий	230	270	23	26	\N	\N	e08af075-e9f6-42d7-839d-addfcfe8f91a	\N
3dae786a-c8f5-4081-8506-318794f29739	1	Заполняющий	230	270	23	26	\N	\N	e6b7fbb3-6b4f-40fd-ad43-3941c94d7e2d	\N
4a5d3b2f-2fd4-432f-92e8-7aa2af76d818	1	Заполняющий	230	270	23	26	\N	\N	cdc547b7-b988-4ff1-a68a-f9b44083a69a	\N
4c539ffd-6190-4a59-a9f0-758e8ceeb4cf	1	Заполняющий	230	270	23	26	\N	\N	43cf22e6-cd1c-41ab-b88a-447453fb0697	\N
5ec138a0-5c56-4ffb-810f-ab412f846852	1	Заполняющий	230	270	23	26	\N	\N	de70de70-5f79-4b2c-983d-e3b7901cf707	\N
5ed7b85c-8598-4e02-b8da-3a4fc112e8f3	1	Заполняющий	230	270	23	26	\N	\N	fbd0da75-db44-4e22-b2d3-55f11b61fa4a	\N
a403dd55-7641-45b2-8309-1ceff07a435e	1	Заполняющий	230	270	23	26	\N	\N	0b793922-36ac-49e9-a419-5f89cb701d05	\N
dd5635cc-2216-4652-a1b0-fc3d2bcfce4a	1	Заполняющий	230	270	23	26	\N	\N	19d0c1a8-41fa-4825-b6e4-44412b81c079	\N
e9fdcc11-3946-48fb-beea-6229273dd62f	1	Заполняющий	230	270	23	26	\N	\N	2a696102-45a2-4399-a3ba-cff382147d20	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
7ff029fc-516a-4545-9aac-711fb5d9be63	1	Корневой	82	11	12	f	f	t	40eff855-019f-4b8c-961c-afb1952a6433	dc5eb095-a435-4ab7-ab09-6c835d93c296	\N
d1c3fc57-4924-4cef-91da-e4db5631416d	1	Корневой	82	11	12	f	f	t	ef8245ab-37da-49ca-aae7-9a29900598b4	4bb75576-9143-4fd5-8aac-33b6ce60a2c5	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0d01e55f-c980-43ba-9c6c-e02c7dbbc2b8	3eefb4d1-20c8-4205-9e4b-e252d83b4736
0d01e55f-c980-43ba-9c6c-e02c7dbbc2b8	6b3c8cbd-a89c-449d-98ca-92b252c7692f
2529b674-c7d0-4f85-b9c4-43df30781557	3eefb4d1-20c8-4205-9e4b-e252d83b4736
2529b674-c7d0-4f85-b9c4-43df30781557	6b3c8cbd-a89c-449d-98ca-92b252c7692f
6b8fa3f5-fcce-430c-8964-718a8a120426	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
88f5353d-f136-4e87-a5d1-d32b4e3a192c	3eefb4d1-20c8-4205-9e4b-e252d83b4736
88f5353d-f136-4e87-a5d1-d32b4e3a192c	6b3c8cbd-a89c-449d-98ca-92b252c7692f
a60c80a4-11e8-452f-9345-7d1b4af4ee89	3eefb4d1-20c8-4205-9e4b-e252d83b4736
a60c80a4-11e8-452f-9345-7d1b4af4ee89	6b3c8cbd-a89c-449d-98ca-92b252c7692f
c210a3b0-6ad6-4c26-bf90-27c6a8d65f8a	83c8a5c6-60b4-4f51-b4c7-39dc376a4f3a
dd97edc0-b06f-4b3d-8692-af407a6772f7	7c2b3bd4-dbee-42d9-878d-09b58d2a20da
fd338f39-9daf-4946-a8cd-ba7ae71f6e03	83c8a5c6-60b4-4f51-b4c7-39dc376a4f3a
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0d01e55f-c980-43ba-9c6c-e02c7dbbc2b8	d79857ac-21d8-4c2c-830c-18eb8fe27762	\N	150882
2529b674-c7d0-4f85-b9c4-43df30781557	fa85f630-42bf-499d-a31d-31749034226d	\N	146164
6b8fa3f5-fcce-430c-8964-718a8a120426	c9f393b8-a703-4f50-ad5d-4a17e41b7a1c	\N	121267
88f5353d-f136-4e87-a5d1-d32b4e3a192c	8334461c-504c-415d-bfc7-7e75605a2f43	\N	150838
a60c80a4-11e8-452f-9345-7d1b4af4ee89	49fbdc1b-5565-44b2-bf50-2ab21119f419	\N	114729
c210a3b0-6ad6-4c26-bf90-27c6a8d65f8a	9c12571d-87a3-4623-8a8d-bce5dd00eacd	\N	132695
dd97edc0-b06f-4b3d-8692-af407a6772f7	097f7e8d-5c15-4e03-8041-5fbdee1f2aba	\N	117390
fd338f39-9daf-4946-a8cd-ba7ae71f6e03	56245cfb-5388-4683-9bba-56221b3e459a	\N	122575
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
3eefb4d1-20c8-4205-9e4b-e252d83b4736	1920a188-2334-4443-8fa3-e186ff1ba7dc
3eefb4d1-20c8-4205-9e4b-e252d83b4736	9385597f-75a5-4430-b635-7539b2bdc491
3eefb4d1-20c8-4205-9e4b-e252d83b4736	c2e5f314-6d66-48b0-bcc3-14b72f215206
3eefb4d1-20c8-4205-9e4b-e252d83b4736	edc92043-8b41-4c4b-b66b-48a4f4c02611
6b3c8cbd-a89c-449d-98ca-92b252c7692f	1920a188-2334-4443-8fa3-e186ff1ba7dc
6b3c8cbd-a89c-449d-98ca-92b252c7692f	9385597f-75a5-4430-b635-7539b2bdc491
6b3c8cbd-a89c-449d-98ca-92b252c7692f	c2e5f314-6d66-48b0-bcc3-14b72f215206
6b3c8cbd-a89c-449d-98ca-92b252c7692f	edc92043-8b41-4c4b-b66b-48a4f4c02611
7c2b3bd4-dbee-42d9-878d-09b58d2a20da	1920a188-2334-4443-8fa3-e186ff1ba7dc
7c2b3bd4-dbee-42d9-878d-09b58d2a20da	f0ecfa5f-4aaa-460f-b91b-634abc7dadf4
83c8a5c6-60b4-4f51-b4c7-39dc376a4f3a	9385597f-75a5-4430-b635-7539b2bdc491
83c8a5c6-60b4-4f51-b4c7-39dc376a4f3a	af17ff01-7aaf-48e0-9047-2aa8c25ac6fd
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
3eefb4d1-20c8-4205-9e4b-e252d83b4736	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	9819a77c-328e-4b72-b287-f527d76b7164	49283
6b3c8cbd-a89c-449d-98ca-92b252c7692f	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	9819a77c-328e-4b72-b287-f527d76b7164	49141
7c2b3bd4-dbee-42d9-878d-09b58d2a20da	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	9819a77c-328e-4b72-b287-f527d76b7164	49232
83c8a5c6-60b4-4f51-b4c7-39dc376a4f3a	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	9819a77c-328e-4b72-b287-f527d76b7164	49286
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
40eff855-019f-4b8c-961c-afb1952a6433	2023-03-19 12:43:55.345863	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	3eefb4d1-20c8-4205-9e4b-e252d83b4736	6b8fa3f5-fcce-430c-8964-718a8a120426	9819a77c-328e-4b72-b287-f527d76b7164	\N
ef8245ab-37da-49ca-aae7-9a29900598b4	2023-03-19 12:43:55.345684	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	3eefb4d1-20c8-4205-9e4b-e252d83b4736	6b8fa3f5-fcce-430c-8964-718a8a120426	9819a77c-328e-4b72-b287-f527d76b7164	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
4bb75576-9143-4fd5-8aac-33b6ce60a2c5	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	1df85685-6d54-42b2-a052-5fc228e8a401	6b8fa3f5-fcce-430c-8964-718a8a120426	9819a77c-328e-4b72-b287-f527d76b7164	eb91c03b-30a7-42bf-85fa-4617cb701cb4	\N
dc5eb095-a435-4ab7-ab09-6c835d93c296	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	d0e2d693-617d-4a29-902b-bb985492b2c6	6b8fa3f5-fcce-430c-8964-718a8a120426	9819a77c-328e-4b72-b287-f527d76b7164	eb91c03b-30a7-42bf-85fa-4617cb701cb4	\N
0b667fc0-8193-49a0-a614-895fd7a55ddc	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a92b7ee6-da65-419f-9fd6-af00a6c569db	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
13bff6e7-c50d-43bf-bf9f-47017efb5192	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b48fd06c-3609-43a7-875c-6a51a8e506f3	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
151df330-af04-4a0e-aca9-9033311fabc7	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ad5b581c-9472-4940-a1f8-e1193d734861	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
1533666e-1aff-4d03-97e5-cd3f5dc60ef5	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	afc945e0-e0e0-4c18-9921-0b0df74f0f72	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
178be4d6-2991-41a2-bfea-a45a2e7093c7	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b40e812a-c92a-4baf-855c-60fd43abefe4	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
1c6de435-1ae0-499a-9086-4b63835b748c	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b3498696-4715-4e74-95f3-2bedffb84e90	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
1d995297-df8d-4d91-9cba-dc1e08af9964	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b034f779-a57d-4ad2-ba2c-847d62f28a97	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
22579b92-dec0-4642-a9ff-62e64766af51	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2e2888b2-80c2-4677-9d21-e882a3400f9b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
29f7cdd7-c700-460d-a8e6-0e82fb2bdb30	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ecda83b8-c371-486f-9f15-312e8bd75dd0	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
2d44de0a-308f-434d-b513-031fa831979f	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0a2c39e6-d61b-4430-ba8b-7b28ec5d0737	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
2df02970-c479-4cbd-bb5b-ea79d4f8804b	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ee624239-f70f-43a6-a22c-af05aacd1a18	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
2e32c08f-7983-4a69-b349-84eeb60c2221	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2b7bb825-16c2-421f-b9fb-7471ff32f3b5	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
30253bc1-9bab-4a0d-8a17-e622a9cfcc0b	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9c8fceca-8444-4691-a35d-c18fa833225a	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
3220520e-ccf5-474c-8d10-590c6781e1c4	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	24637308-002e-441f-af5a-94c35f180c0b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
3672b676-f895-4ecc-adba-b0fb59210fa6	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	097ab604-3e6e-4939-9eda-ae63da6f2537	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
3c893088-a12b-4688-be9a-41932d6d5b0c	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	111fd13a-e9aa-479a-9abb-43c57096d458	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
40109d9a-ea1c-49a6-af31-760ddb7eb48b	19	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	35d42fef-f1bb-48a2-8331-9a555c6c3cdd	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
418b577b-b823-468b-ac1a-0f395cecc22d	20	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2387104b-7be1-431a-a8ea-9eeb02944b76	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
41dcc9b4-e3a7-4152-a0e3-8c2622c0bc70	21	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d91073d4-f47d-4ba1-b8ce-9c9bef8c286f	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
4906a466-f161-420e-85bd-9ca9ebe14a55	22	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	199a022a-47cf-4e53-805b-35f139cfd3d3	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
494a5fc4-17c0-4835-8858-84f841e6585d	23	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e2bf2f7b-4b33-4848-a9a4-09b06d57be6d	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
4bc0fb95-4cd0-49e8-86ec-e7653757cb24	24	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	625d77ce-85ca-4f26-b8fc-7d193a5952c5	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
4e3bd1d2-7b5c-4dde-9ec7-e4125a573db8	25	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5cc571c7-ca51-4897-87c1-7ad7a2300d99	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
4e45518a-f2b1-42d0-b4ec-3fce1281e3a4	26	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	850223f4-fc72-4c98-9375-8032a56414a4	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
4f411c3b-df8c-4397-b1e6-22eb3586ad35	27	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	34af11e5-5942-4028-b1f1-5f1dd0c73507	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
57b0ab28-9769-4614-9d1f-27fea28df70c	28	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cc7ed0b3-0c39-473b-b27a-dc54027878a4	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
5e7807be-05e1-4fa2-9fed-cb94874a505a	29	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	336c5ff4-256e-4f5f-96f7-675a72a0eb4b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
5e9fbdae-be24-423c-a15c-a8c7003acc65	30	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	585126d2-e6bd-43e3-bcf6-286af5536cd5	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
6572038b-a6d8-41fd-bc3d-a4b7c82d7ada	31	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5052a901-296a-4375-aa94-b2145529e4b3	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
66372549-2003-4ece-97db-f9405d660bb1	32	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5ca932cb-7ac8-4917-a6b1-9ed7f2e8358b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
6a1dbce5-7b93-4866-8ee9-21275c3907c1	33	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	90a323b9-ef1e-42e5-9d9c-ba12ba3916e1	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
700a93b0-c0ad-4dae-bd69-eaa009691b51	34	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	859c4cd2-365f-4a49-9626-21e0f49e777c	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
7091bd36-ab72-4901-9ac3-dec37210f67b	35	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	992fe7fe-c0e5-49b0-b50a-927675e213f1	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
74a25f7c-a4a8-4179-95b5-812f597468af	36	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	30292d1c-1370-416e-9bfa-4b55d8340c68	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
76733fae-b77c-4dd0-a30e-3855a88a6852	37	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	73592a2c-5b0f-49dc-803d-99d041b46627	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
7d2bdf07-f937-4f7c-a6b4-21ebfb945c1b	38	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1a154ba2-4fa4-4273-9aa9-3d2112b7984a	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
7dca572b-5cbb-48d8-98f0-e5bf994e6910	39	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	de609cac-cb08-4482-b32a-97acea33b844	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
7fe470a4-4ed4-49c5-87a2-fa6c47801390	40	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6cafad31-18c2-478a-b0c5-ac541aabfab1	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
82801098-0cb9-42b0-93d6-63cecc2aa06c	41	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	75cf64af-4cb4-4761-8c02-666951f81a92	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
8421ba29-76a0-4d11-9148-57e7b986da74	42	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c0de5a20-a17c-4727-8427-e9ede58475ef	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
8592cbb8-b6c4-4446-903d-c6842184b5e4	43	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	60bed039-7bb6-4286-a700-e2f7e467f890	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
8e8c9e83-4da8-4545-86d6-720532c4f219	44	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3f2d752d-0a24-42e2-a8cb-a5ba3d397f1e	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
94651d57-466e-4e8e-a32c-9b3a46a3b70e	45	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fec6303d-d47c-412b-b213-c33abef206c7	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
96bc8065-f990-4506-90c3-23f585faf5c9	46	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	12d70402-3b2c-4789-8b78-6084e2ea0036	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
9d4a3789-4d3f-4f22-a4e0-c6ea97beebd9	47	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1519b77e-1db3-42a3-9474-5a72bd11b7aa	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
9e4da3d4-34c3-4545-a5f1-32acb2ad381d	48	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1f496059-c5a8-4c02-a516-af10c7be455b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
9f2b7bba-a34a-42e8-b61d-aedb4581275d	49	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b3918091-7372-4124-a3ae-7c03d9cce22e	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
a02e69bf-0f83-458a-80c2-3bc313b42cf1	50	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	720d7ce6-2949-4c4b-b8a8-1463f970dceb	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
b69aa50e-851e-4aff-bec4-1dd5a5440db0	51	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b42d4619-4e26-43a4-ba87-c2bb0cc07537	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
b848c371-3c7e-4154-a536-14bc995984ec	52	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	38d72c6d-590c-4228-b25e-0b1f7647cf8b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
bcbefb79-0e1b-4f03-b93a-1f9ea1a4b4c1	53	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	05367cbf-2e6f-4617-9e6b-081c561593b0	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
c07abec5-8d80-4165-823a-d4f3f5a1a3a3	54	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8b3d85fb-1736-467c-a95c-e953f9007b19	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
c2d2c21f-fa52-4eef-a372-027bba568111	55	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	620e2b03-502f-4d02-8966-ddbbeb64e36b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
c91404dc-9494-4995-a3ea-6355671fcecf	56	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0884aa8a-bbb7-46fb-93be-dbaf53b6b1f6	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
d0a41cc4-46f3-4c57-afc8-bc4dbd9fce43	57	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a631f554-4d20-4e13-88f0-fda314980555	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
d429d099-a9f7-43f2-a7aa-445e56628729	58	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1341e88c-7025-4713-9d1b-48a77bf32174	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
d6934713-9c7b-4280-8e4b-4f61cf570054	59	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0c5c9960-354e-44a8-8c7a-ac46d1e8d1dc	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
d7676ed3-3f10-492b-90c2-e057a802cef1	60	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1b3d1534-f529-43d5-a0c3-58ca1107623b	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
d9356040-2e85-478e-a3a5-bf14700e8bb3	61	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7b353537-47d0-4c21-b549-20e3c89c7830	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
da92e2c1-456f-4ca2-a882-a2c1d36df58b	62	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	55ddf0c3-328b-4c3d-8448-bef14a9d58fd	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
e8ca61a7-275f-4d89-95d4-d342f794641d	63	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ce323c7c-befa-4429-b6e9-fade68f31e89	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
e9cff2a4-ce45-43b8-b535-a1851e120f69	64	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d0e2d693-617d-4a29-902b-bb985492b2c6	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
ec5ba100-2a9e-47a5-b7d8-85266f0966f5	65	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	96fb27a1-2ac4-4de1-bd16-c65de97bc700	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
ec5ed2b7-394c-472d-b282-1667e3fcd3fb	66	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6d5888ac-b2ba-4878-a41e-a922de2c49e8	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
ecd6a638-c1c7-4825-a9eb-bc9891573a27	67	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	78d86743-719f-483c-99f5-96df5b76cf26	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
ee5d9918-53c5-4e89-a144-9ef45c33e0ec	68	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9fd7b057-0096-43ea-9358-2ace60900d10	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
f3b9a147-09f5-4f3b-9cc7-382c747503e4	69	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1df85685-6d54-42b2-a052-5fc228e8a401	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
fe1de3ee-387e-467d-b147-8c60ab4d061f	70	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	497d3dc9-ba89-4016-8048-09f980840756	\N	9819a77c-328e-4b72-b287-f527d76b7164	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
08fed809-afd3-43e4-bec5-4c8a5fdeb502	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	7d00b6a5-3d1d-463d-9b1c-136b6e1bfddb	\N
47170b76-12fb-43c1-8845-27bbb1d31c85	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	7d00b6a5-3d1d-463d-9b1c-136b6e1bfddb	\N
f03ba19a-c149-4ddb-98b8-0f4442ae3792	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	7d00b6a5-3d1d-463d-9b1c-136b6e1bfddb	\N
ee1de6f7-cf28-4d09-bbc0-580d106d3a04	1	12:10:00	13:10:00	13:20:00	13:50:00	a0ddb124-f704-4d3d-863e-c802804a8c1a	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
1920a188-2334-4443-8fa3-e186ff1ba7dc	3610	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	3610
9385597f-75a5-4430-b635-7539b2bdc491	3500	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	3500
af17ff01-7aaf-48e0-9047-2aa8c25ac6fd	3510	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	3510
c2e5f314-6d66-48b0-bcc3-14b72f215206	3550	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	3550
edc92043-8b41-4c4b-b66b-48a4f4c02611	3690	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	3690
f0ecfa5f-4aaa-460f-b91b-634abc7dadf4	3600	\N	5ddbc243-59b3-40f3-b4e7-1458e48de32e	3600
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
cd6f6649-8be1-4f82-bf6c-15147b30f40a	Сварочный цех	50	050
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

