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
6f54ba8a-ce97-49c3-8f4c-63b62c5cefd4	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
fed17e63-2a1f-4c19-849e-250abc0ff9ff	a373b1a1-7534-4cfd-b2c2-f6bd92671db7	30f98574-14f5-4cb6-92a8-db953ce3b822	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
4abd6ffa-3b0a-40b8-9f77-a80f7d6a507c	1	10	t	6f54ba8a-ce97-49c3-8f4c-63b62c5cefd4	\N
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
07fd5b20-e6f0-4d09-957f-b724f46003dc	Праздники и выходные	\N
0c17d728-2053-4ada-a35a-b945df0821d0	Сборочные операции	\N
0dfb330a-bc7b-4516-aebf-7141c7eebbae	Отсутствие сотрудника ОТК	\N
137bc805-046e-4032-a0e4-133a5844813d	Ознакомление с работой, документацией, инструктаж	\N
172641a3-60d9-42bd-a7e3-39acef5c9f8e	Отсутствие материала, заготовок, деталей	\N
22c81332-5e75-409d-8aac-4b76c4e8c3ea	Отсутствие заданий	\N
398d4ce5-de48-43fe-90bf-5376ca4bfed9	Отсутствие крана, транспорта	\N
44386711-7744-4cde-91ec-e9bbf57b4eee	Обед	\N
4a7347d5-b016-4121-92d0-a782888a291b	Изменение режимов, смена инструмента, приспособления	\N
6046b2e9-beb4-4fe4-9782-ef46965692b1	Установка, выверка, снятие детали	\N
785758d3-ce76-4f1e-9d66-62c0b3cdb37d	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
89d1cf12-0547-490a-ba74-bab173b1e5af	Аварийный ремонт централизованными службами	\N
8b18666f-8209-4085-b5a0-0cdc5ea4902a	Установка, выверка, снятие детали	\N
8ea5311a-be2b-4820-851d-e1acca840bc4	Отсутствие конструктора, технолога или ожидание его решения	\N
96154037-3856-4d56-805c-7cea481182d7	Естественные надобности	\N
a28b9229-9668-42f8-9b6a-336b5ff117c8	Работа с управляющей программой	\N
cbb20a85-8022-4858-b669-cfe2e5bffc38	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
d9f04f48-c2d6-4a63-a9be-71d17529099a	Неявка оператора (б/лист, отпуск, и пр.)	\N
dc9e9ed4-4489-443a-af75-0bdd3d1666c0	Плановый ремонт централизованными службами	\N
e298dbe9-b36a-4ac0-a8f1-3073eff7d41e	Отсутствие энергоносителей	\N
ed150283-4f4c-491b-a56e-2018c08c7d09	Нерабочее время по графику согласно сменности	\N
f1c7175b-a21c-496c-9550-b051e55e8cad	Контроль на рабочем месте	\N
f8157b10-035e-4bcf-9647-f084b03004bd	Отсутствие оператора в связи с необеспеченностью	\N
f8392111-6300-476f-9661-f6c4091a77a2	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
fdb1f781-d56e-4d9b-b010-44f9c977f92d	Работа по карте несоответствий	\N
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
12aa9182-a04f-4f33-bc07-4f176aa3e063	899dfb28-1e50-4855-920b-adf7ef1ba1e6	249550
5cdd8d2b-c49e-4777-99b6-77a7b1f7b3af	66617ba3-bbc5-4997-8dad-e0dd25163436	219379
1f6f61c6-5dc6-4fa6-8e8c-ea719dd829f7	094ee477-6fb7-404f-8340-6e5e0bfa540e	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
de5b97dc-4df9-4379-acc2-11478dd40564	deca126d-dfad-4658-a6fb-51e1120b736d	610422
e6f2dad0-6683-494e-a50d-35a79175f3fc	3769e418-9d3f-4d55-aed9-21259eb2541b	614962
191665ce-50f2-4128-99f1-8102dd851e45	c5a13037-f50c-4821-9260-558c65e20da0	\N
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
0087b828-2b1d-46e1-8baf-e283cc585221	12	2	2023-03-08 19:46:13.569309	550e220c-f0d1-451f-b0d0-164a4b409742	\N
0438795f-9a8b-4bff-b460-9f3c97dae650	2	2	2023-03-08 19:46:13.568264	107b0dbb-f5b7-448e-a528-cccd6c4013eb	\N
06cde1a8-8f15-407d-b445-218a49980edd	4	2	2023-03-08 19:46:13.568471	13e5c1bf-232c-4c00-b346-886ee2534c8b	\N
127a1aa0-338d-422d-a384-3c052368c39f	6	2	2023-03-08 19:46:13.568639	16b8e4cf-7639-470d-8767-c54c6de94209	\N
143a7c47-5217-4ee4-8a75-b2e2e59c8c27	1	2	2023-03-08 19:46:13.533635	0575128f-4557-4274-8c56-2808329227e6	\N
1a54c04c-8d58-43bc-a59a-f6e4ec4a6e74	34	2	2023-03-08 19:46:13.572204	c3b1fb6f-cb70-4656-a679-4f48da4a84d6	\N
1e2a49bf-f567-4d3a-a46f-fd2ca0b682cd	39	2	2023-03-08 19:46:13.572757	e33d1406-d5fd-4563-b6ed-eca4df76659d	\N
25298f5a-95d6-41fe-b0fc-81509f54b82a	25	2	2023-03-08 19:46:13.570923	8ea6debd-6bb0-4d40-a2d3-77a44b3168ae	\N
26935dd4-7c88-4e9f-a4d6-143a11b90d4a	26	2	2023-03-08 19:46:13.571102	928fe228-870e-437c-b511-17f7118e11cd	\N
35ae1051-83bb-494b-ad72-f393e9b8ecd6	27	2	2023-03-08 19:46:13.571279	95048ab0-bc59-40f1-9004-49054e206f4d	\N
363ad7bf-50ba-4e64-a5c9-a032303c7716	23	2	2023-03-08 19:46:13.570747	86876380-33de-45e6-a8f6-545eae054d9a	\N
3bab7751-ddbf-44ce-a311-f833c069bc4c	31	2	2023-03-08 19:46:13.571681	aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	\N
3f419922-6435-44ab-87cb-e5461ff7a878	36	2	2023-03-08 19:46:13.572429	d88faeeb-1c90-418b-aae4-584744a2e74b	\N
448d42a3-78a9-400b-bc49-e8f21b454624	18	2	2023-03-08 19:46:13.569856	6e2905ff-9aba-49f1-b532-3b412cc3784e	\N
4a0a6adf-c240-486b-b5dd-7e3fb872e2c2	8	2	2023-03-08 19:46:13.568838	1a918264-b12e-472a-ad9b-a26f539bab33	\N
4a8724b1-a893-415e-9b84-2f03dc25d8af	20	2	2023-03-08 19:46:13.570313	760b6c71-4af7-4129-a207-2904fc2674af	\N
4df1adf4-8890-41ad-bf0a-0a103a7405fe	11	2	2023-03-08 19:46:13.569225	4f69298e-a587-4d64-96b9-1beb5527a45d	\N
508dba52-da48-464d-8c03-654538d57aea	28	2	2023-03-08 19:46:13.571372	97754c62-4db9-4957-b913-cc3b2935b5b9	\N
522a7c72-f638-4b94-990a-ecc83ca78bb3	21	2	2023-03-08 19:46:13.570565	843219f2-352e-4cd1-8f61-c03090c5eec8	\N
5b3bf0e4-ffc7-4b75-ae8a-fd32ee6e1cf9	22	2	2023-03-08 19:46:13.570655	85ea85fa-e1a0-4dc1-8a1f-59423eeb488d	\N
6688cf18-280a-4775-bfff-a060b177418d	15	2	2023-03-08 19:46:13.569574	5a962f10-f4e2-4005-be93-568a0a5c31f4	\N
69287c09-2af1-477f-8566-ad8601cb6a6b	41	2	2023-03-08 19:46:13.572923	fd802e02-e6d1-4da0-ae4c-24140be3ea17	\N
693ba8ea-8d44-40cc-a741-4f7ec546473d	33	2	2023-03-08 19:46:13.571989	c336da9c-e607-44e4-bb30-3404b09b856f	\N
73dfbecc-3998-42db-ade0-4a1c14c1e77c	3	2	2023-03-08 19:46:13.568384	1342fc75-c419-451c-abb0-3e0ea50e23ce	\N
74b17d1b-070a-46c1-9d9e-ab961665aff4	16	2	2023-03-08 19:46:13.569663	5faca089-ced7-49e5-a71f-709b96c6fb4c	\N
7a77e071-d531-4567-8ddb-7469e0f993f5	42	2	2023-03-08 19:46:13.573009	fe6e1da4-acff-4b1c-a6e7-f6dcd231e474	\N
7c9f47eb-0b90-4c36-899b-f7c639790683	7	2	2023-03-08 19:46:13.568736	16cbe333-ce68-4a15-955b-8da378ae60a9	\N
7fd57eac-5496-440b-b509-ea7954072e6f	32	2	2023-03-08 19:46:13.571862	adbdbf2b-e786-478a-aec5-249bcb6f402a	\N
8b8b896b-e983-4c9b-8be3-4a49b1d03fd8	13	2	2023-03-08 19:46:13.569393	55609051-b26d-4e80-b14e-25f7a27f5ed7	\N
bc95d469-bb8d-4ed2-998b-93e2e7641407	14	2	2023-03-08 19:46:13.56948	59f12578-6b9e-4793-ab9c-8d9dfb6f3e2c	\N
bca6de4b-790a-433c-90b5-9f18054164f0	10	2	2023-03-08 19:46:13.569134	38269083-2f70-4f70-9853-141140aa537c	\N
cdfc2697-9dcc-48f3-b4b4-adecce95f7eb	35	2	2023-03-08 19:46:13.572319	ca3748ec-e22d-4aa9-be51-471bf8257a2d	\N
cf4218a2-bed3-40dc-b1a4-3d6b0c289cf8	29	2	2023-03-08 19:46:13.571474	98b22bd7-541d-4f83-bd0f-0de602c0dcc1	\N
d0067294-cbcd-44ae-8b67-1d699df6569e	5	2	2023-03-08 19:46:13.568556	169dc121-743b-4839-b679-b0010ed804fa	\N
d264dfae-f1f8-4533-a51c-a93bcf3f3729	38	2	2023-03-08 19:46:13.572667	dfdb6ca0-b363-4764-9fce-93918f20c753	\N
d4c0b747-cd9b-4136-b94d-0c598e97fa93	24	2	2023-03-08 19:46:13.570832	8989bd26-f2a8-4a10-999e-2625ab8b5058	\N
dc20d745-b475-4e08-bbb0-3728c30c14a6	37	2	2023-03-08 19:46:13.572577	dac07c52-4a30-41b7-bfc4-60c94b6ff9a5	\N
dc741837-5ef5-4fcd-bd08-b5362c135811	40	2	2023-03-08 19:46:13.57284	e90ec6cc-bb42-4e86-9132-7de4fcafddc6	\N
e058e349-357e-4a46-a469-d326a14d1757	30	2	2023-03-08 19:46:13.571563	9fd97670-50ec-4b60-9f6d-e1ec1c285a53	\N
e580d276-af8e-4af6-a31a-1dafd5151d03	19	2	2023-03-08 19:46:13.570044	71dcefd4-0e81-402a-821e-ca65adbd0bb9	\N
e792573e-0c8d-40ba-bcd9-c2c36652a492	17	2	2023-03-08 19:46:13.569749	662a1c82-d2f5-4a3b-be22-aaf40dc668d9	\N
fc255e37-e1ac-48bb-a287-4cfd541604df	9	2	2023-03-08 19:46:13.569031	37431242-8d8a-4cb6-8695-0238cc563081	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	0575128f-4557-4274-8c56-2808329227e6
e33d1406-d5fd-4563-b6ed-eca4df76659d	107b0dbb-f5b7-448e-a528-cccd6c4013eb
c336da9c-e607-44e4-bb30-3404b09b856f	1342fc75-c419-451c-abb0-3e0ea50e23ce
38269083-2f70-4f70-9853-141140aa537c	13e5c1bf-232c-4c00-b346-886ee2534c8b
98b22bd7-541d-4f83-bd0f-0de602c0dcc1	169dc121-743b-4839-b679-b0010ed804fa
662a1c82-d2f5-4a3b-be22-aaf40dc668d9	16b8e4cf-7639-470d-8767-c54c6de94209
95048ab0-bc59-40f1-9004-49054e206f4d	16cbe333-ce68-4a15-955b-8da378ae60a9
95048ab0-bc59-40f1-9004-49054e206f4d	1a918264-b12e-472a-ad9b-a26f539bab33
98b22bd7-541d-4f83-bd0f-0de602c0dcc1	37431242-8d8a-4cb6-8695-0238cc563081
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	38269083-2f70-4f70-9853-141140aa537c
e33d1406-d5fd-4563-b6ed-eca4df76659d	4f69298e-a587-4d64-96b9-1beb5527a45d
95048ab0-bc59-40f1-9004-49054e206f4d	550e220c-f0d1-451f-b0d0-164a4b409742
d88faeeb-1c90-418b-aae4-584744a2e74b	55609051-b26d-4e80-b14e-25f7a27f5ed7
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	59f12578-6b9e-4793-ab9c-8d9dfb6f3e2c
d88faeeb-1c90-418b-aae4-584744a2e74b	5a962f10-f4e2-4005-be93-568a0a5c31f4
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	5faca089-ced7-49e5-a71f-709b96c6fb4c
d88faeeb-1c90-418b-aae4-584744a2e74b	662a1c82-d2f5-4a3b-be22-aaf40dc668d9
71dcefd4-0e81-402a-821e-ca65adbd0bb9	6e2905ff-9aba-49f1-b532-3b412cc3784e
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	71dcefd4-0e81-402a-821e-ca65adbd0bb9
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	760b6c71-4af7-4129-a207-2904fc2674af
c336da9c-e607-44e4-bb30-3404b09b856f	843219f2-352e-4cd1-8f61-c03090c5eec8
c336da9c-e607-44e4-bb30-3404b09b856f	85ea85fa-e1a0-4dc1-8a1f-59423eeb488d
d88faeeb-1c90-418b-aae4-584744a2e74b	86876380-33de-45e6-a8f6-545eae054d9a
dac07c52-4a30-41b7-bfc4-60c94b6ff9a5	8989bd26-f2a8-4a10-999e-2625ab8b5058
d88faeeb-1c90-418b-aae4-584744a2e74b	8ea6debd-6bb0-4d40-a2d3-77a44b3168ae
d88faeeb-1c90-418b-aae4-584744a2e74b	928fe228-870e-437c-b511-17f7118e11cd
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	95048ab0-bc59-40f1-9004-49054e206f4d
95048ab0-bc59-40f1-9004-49054e206f4d	97754c62-4db9-4957-b913-cc3b2935b5b9
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	98b22bd7-541d-4f83-bd0f-0de602c0dcc1
55609051-b26d-4e80-b14e-25f7a27f5ed7	9fd97670-50ec-4b60-9f6d-e1ec1c285a53
d88faeeb-1c90-418b-aae4-584744a2e74b	adbdbf2b-e786-478a-aec5-249bcb6f402a
d88faeeb-1c90-418b-aae4-584744a2e74b	c336da9c-e607-44e4-bb30-3404b09b856f
86876380-33de-45e6-a8f6-545eae054d9a	c3b1fb6f-cb70-4656-a679-4f48da4a84d6
c336da9c-e607-44e4-bb30-3404b09b856f	ca3748ec-e22d-4aa9-be51-471bf8257a2d
d88faeeb-1c90-418b-aae4-584744a2e74b	dac07c52-4a30-41b7-bfc4-60c94b6ff9a5
dac07c52-4a30-41b7-bfc4-60c94b6ff9a5	dfdb6ca0-b363-4764-9fce-93918f20c753
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	e33d1406-d5fd-4563-b6ed-eca4df76659d
c336da9c-e607-44e4-bb30-3404b09b856f	e90ec6cc-bb42-4e86-9132-7de4fcafddc6
662a1c82-d2f5-4a3b-be22-aaf40dc668d9	fd802e02-e6d1-4da0-ae4c-24140be3ea17
95048ab0-bc59-40f1-9004-49054e206f4d	fe6e1da4-acff-4b1c-a6e7-f6dcd231e474
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
05c4699a-3142-4ac1-aacf-084722e91b20	0	3	\N	\N	0087b828-2b1d-46e1-8baf-e283cc585221	\N
06b8107e-9909-4fa0-bdf9-4b3f701fbc03	0	1	\N	\N	5b3bf0e4-ffc7-4b75-ae8a-fd32ee6e1cf9	\N
0a5f9e93-97d8-4415-88be-1e4d71910300	0	1	\N	\N	8b8b896b-e983-4c9b-8be3-4a49b1d03fd8	\N
0c5b7b57-ea47-490d-9c8d-3d6c88ce8d0c	0	2	\N	\N	0087b828-2b1d-46e1-8baf-e283cc585221	\N
11ee3ce2-298e-4826-9669-bf60d191e53b	0	2	\N	\N	5b3bf0e4-ffc7-4b75-ae8a-fd32ee6e1cf9	\N
11f1a8e6-5e73-491d-a65a-3cfe0c10cf07	0	2	\N	\N	127a1aa0-338d-422d-a384-3c052368c39f	\N
12e35995-1bbe-46d2-a2db-bdd7780a622e	0	2	\N	\N	4a8724b1-a893-415e-9b84-2f03dc25d8af	\N
1489e869-134f-4874-8e3b-d221a932f937	0	1	\N	\N	7fd57eac-5496-440b-b509-ea7954072e6f	\N
173b2498-908c-4973-b029-e733ff6df2a9	0	2	\N	\N	d264dfae-f1f8-4533-a51c-a93bcf3f3729	\N
17b9ee62-6225-4014-a1cb-1b77e3d05dc8	0	2	\N	\N	7c9f47eb-0b90-4c36-899b-f7c639790683	\N
18bf21c0-f9e5-4f89-8e22-6aab485ce914	0	2	\N	\N	fc255e37-e1ac-48bb-a287-4cfd541604df	\N
19b15866-4685-4ece-902e-16f358b02a3e	0	2	\N	\N	4a0a6adf-c240-486b-b5dd-7e3fb872e2c2	\N
1b2f9fc6-3ebd-474c-a37f-a19fc01177f2	0	2	\N	\N	35ae1051-83bb-494b-ad72-f393e9b8ecd6	\N
24d1e581-3172-41a9-b1eb-e22f4d5ce275	0	2	\N	\N	69287c09-2af1-477f-8566-ad8601cb6a6b	\N
25a597c7-11c0-46d5-9a57-d61c1e1cfe7f	0	3	\N	\N	74b17d1b-070a-46c1-9d9e-ab961665aff4	\N
26624802-3dc2-4db1-8730-ad2ff65f2187	0	1	\N	\N	1e2a49bf-f567-4d3a-a46f-fd2ca0b682cd	\N
2685c168-cae0-4551-862b-23df2d76516d	0	3	\N	\N	dc20d745-b475-4e08-bbb0-3728c30c14a6	\N
277b9401-9e2c-446d-8c34-ee4f53e02457	0	3	\N	\N	fc255e37-e1ac-48bb-a287-4cfd541604df	\N
27ecc2c7-416c-44d5-9659-fdd207a3b0a2	0	3	\N	\N	06cde1a8-8f15-407d-b445-218a49980edd	\N
2a114707-3da7-48f4-b060-54a6481692f3	0	1	\N	\N	bc95d469-bb8d-4ed2-998b-93e2e7641407	\N
2dce487d-603e-4351-a974-7e857aa063e3	0	3	\N	\N	127a1aa0-338d-422d-a384-3c052368c39f	\N
329f4577-57a4-4007-972c-f6971fa1c728	0	3	\N	\N	143a7c47-5217-4ee4-8a75-b2e2e59c8c27	\N
3390f8bc-fcd0-4ec0-afc4-dd3ae87486aa	0	2	\N	\N	6688cf18-280a-4775-bfff-a060b177418d	\N
348cddf6-7595-4b22-9daa-1e65b3def9ff	0	1	\N	\N	06cde1a8-8f15-407d-b445-218a49980edd	\N
3628266b-a71e-42e1-b97b-cd6d767354a2	0	2	\N	\N	d4c0b747-cd9b-4136-b94d-0c598e97fa93	\N
3670fc79-83b8-4deb-b360-8b2f2073bbf8	0	3	\N	\N	508dba52-da48-464d-8c03-654538d57aea	\N
37eb4e7f-02d8-4c6e-8d40-b7056c31b7c8	0	1	\N	\N	26935dd4-7c88-4e9f-a4d6-143a11b90d4a	\N
396ac443-a6d4-462b-b036-739b563475de	0	2	\N	\N	cf4218a2-bed3-40dc-b1a4-3d6b0c289cf8	\N
399dd228-eef2-41ce-8e5e-156ed4af343e	0	3	\N	\N	4a0a6adf-c240-486b-b5dd-7e3fb872e2c2	\N
3ae6a6bd-b9ef-4d4b-bdf0-ebe1d5af53ee	0	1	\N	\N	127a1aa0-338d-422d-a384-3c052368c39f	\N
3d3dcf07-884f-4c39-b620-6d0edd61d859	0	3	\N	\N	3f419922-6435-44ab-87cb-e5461ff7a878	\N
402c6c6c-917e-4d47-afb3-5385bb57d72e	0	1	\N	\N	dc20d745-b475-4e08-bbb0-3728c30c14a6	\N
43914c99-7ead-4c5c-bf74-ad2265fa17dd	0	2	\N	\N	3f419922-6435-44ab-87cb-e5461ff7a878	\N
457bfd41-dce1-4e1c-90d8-f1892763c7c5	0	2	\N	\N	dc741837-5ef5-4fcd-bd08-b5362c135811	\N
46d10f0d-07fa-474a-bb4f-971a5a12d763	0	3	\N	\N	4df1adf4-8890-41ad-bf0a-0a103a7405fe	\N
4d2da201-9557-4301-9d82-23d4c9b09255	0	2	\N	\N	8b8b896b-e983-4c9b-8be3-4a49b1d03fd8	\N
4f9d8f01-52c3-40ae-8a0d-bcb90138457f	0	3	\N	\N	cdfc2697-9dcc-48f3-b4b4-adecce95f7eb	\N
4ffbe7a9-934a-4538-b428-249ba34f3c21	0	2	\N	\N	d0067294-cbcd-44ae-8b67-1d699df6569e	\N
503ddb7a-0e10-404b-b151-82b601bc5e45	0	2	\N	\N	dc20d745-b475-4e08-bbb0-3728c30c14a6	\N
536f15d9-239f-4069-8484-c7d5ead76295	0	3	\N	\N	bca6de4b-790a-433c-90b5-9f18054164f0	\N
54cd1ed5-aff9-4e47-86f7-89de1f0a28c2	0	2	\N	\N	363ad7bf-50ba-4e64-a5c9-a032303c7716	\N
5840d892-b80f-413a-9fff-c841e382bd40	0	2	\N	\N	4df1adf4-8890-41ad-bf0a-0a103a7405fe	\N
5ad6dfe4-2187-4b3c-802c-3105cb68ed44	0	1	\N	\N	693ba8ea-8d44-40cc-a741-4f7ec546473d	\N
5d948468-bdf3-4b39-ad75-d953ef954b75	0	3	\N	\N	1a54c04c-8d58-43bc-a59a-f6e4ec4a6e74	\N
5ecad7dd-76be-4e20-b710-fd6395b9f1a7	0	1	\N	\N	4a8724b1-a893-415e-9b84-2f03dc25d8af	\N
60ced273-53c3-4688-9598-5507d57be401	0	2	\N	\N	74b17d1b-070a-46c1-9d9e-ab961665aff4	\N
6365dff0-be41-4f59-8e34-8d380f65ed3b	0	1	\N	\N	bca6de4b-790a-433c-90b5-9f18054164f0	\N
64a081ea-4344-47b5-915c-cbed26425153	0	3	\N	\N	d0067294-cbcd-44ae-8b67-1d699df6569e	\N
659cdec6-f6ef-43b2-9b24-d288aa5aaf5f	0	3	\N	\N	0438795f-9a8b-4bff-b460-9f3c97dae650	\N
73461965-da8b-4aee-b3d6-3050e68b9083	0	1	\N	\N	0438795f-9a8b-4bff-b460-9f3c97dae650	\N
782d27f4-d985-4bc6-a414-8c0a9c977ad7	0	1	\N	\N	3f419922-6435-44ab-87cb-e5461ff7a878	\N
78e5f53b-8a3e-42f5-8e76-bccf2f5fa2f1	0	2	\N	\N	448d42a3-78a9-400b-bc49-e8f21b454624	\N
78f5198a-cd80-41ed-91e0-c469981002fc	0	2	\N	\N	26935dd4-7c88-4e9f-a4d6-143a11b90d4a	\N
79e722fa-fd7f-46f6-9ad1-88cacbe80945	0	2	\N	\N	3bab7751-ddbf-44ce-a311-f833c069bc4c	\N
7a6dcfd9-d6a0-40c6-a479-518bd38740be	0	2	\N	\N	143a7c47-5217-4ee4-8a75-b2e2e59c8c27	\N
7c0c9c1e-d2d6-4495-864a-60ef071c29de	0	1	\N	\N	fc255e37-e1ac-48bb-a287-4cfd541604df	\N
7e6dfc9f-70d1-4406-91c3-76ee437d8b64	0	3	\N	\N	e580d276-af8e-4af6-a31a-1dafd5151d03	\N
813f6391-edfc-4e71-bb6d-59ccaab3adf7	0	1	\N	\N	25298f5a-95d6-41fe-b0fc-81509f54b82a	\N
829327ad-8696-4fac-beba-187031874062	0	3	\N	\N	d4c0b747-cd9b-4136-b94d-0c598e97fa93	\N
8393c3ff-5847-43f7-ad0c-d1d59dcfc052	0	3	\N	\N	bc95d469-bb8d-4ed2-998b-93e2e7641407	\N
852771cd-fe68-41c1-bbf2-65d6e5193087	0	3	\N	\N	dc741837-5ef5-4fcd-bd08-b5362c135811	\N
85bc68ba-3124-423d-a30d-225f6e12f7a0	0	1	\N	\N	d0067294-cbcd-44ae-8b67-1d699df6569e	\N
8771f825-e683-4552-94d3-efaa335a6bf8	0	3	\N	\N	5b3bf0e4-ffc7-4b75-ae8a-fd32ee6e1cf9	\N
8a1b47ed-f368-46d9-90ba-dfefebe730a4	0	3	\N	\N	363ad7bf-50ba-4e64-a5c9-a032303c7716	\N
8c08ab9a-95ff-4626-a591-544d69120923	0	2	\N	\N	e580d276-af8e-4af6-a31a-1dafd5151d03	\N
8caa205b-2bb2-4a9d-a88b-4dfc14f3f2a8	0	1	\N	\N	cdfc2697-9dcc-48f3-b4b4-adecce95f7eb	\N
91cb3338-6475-4aed-99fb-7092a05146be	0	1	\N	\N	7a77e071-d531-4567-8ddb-7469e0f993f5	\N
94676991-864a-4081-b75c-f1c6047a1741	0	1	\N	\N	508dba52-da48-464d-8c03-654538d57aea	\N
9a947bc9-a600-4923-aef6-849a42d5fd2a	0	3	\N	\N	7c9f47eb-0b90-4c36-899b-f7c639790683	\N
9dd40934-a0bc-489e-be73-bf4a32dc46aa	0	1	\N	\N	6688cf18-280a-4775-bfff-a060b177418d	\N
9e63267e-7ca3-47ca-a435-92264639b03d	0	1	\N	\N	35ae1051-83bb-494b-ad72-f393e9b8ecd6	\N
9ee84798-8df2-4b55-8c48-2839367afbd0	0	3	\N	\N	73dfbecc-3998-42db-ade0-4a1c14c1e77c	\N
a24f0db5-bec1-4d25-854a-7247a8fdeb0c	0	3	\N	\N	cf4218a2-bed3-40dc-b1a4-3d6b0c289cf8	\N
a5cf6c74-9910-4713-a4b1-68325616895d	0	3	\N	\N	7fd57eac-5496-440b-b509-ea7954072e6f	\N
a77f3077-fc24-4ad5-bb47-198a3a469c15	0	1	\N	\N	448d42a3-78a9-400b-bc49-e8f21b454624	\N
a7f13c36-2e79-4984-b975-42595a26ee3d	0	2	\N	\N	0438795f-9a8b-4bff-b460-9f3c97dae650	\N
aa26c24e-bf68-4b1f-902f-811455388038	0	2	\N	\N	1e2a49bf-f567-4d3a-a46f-fd2ca0b682cd	\N
aafb9762-1de0-4ffe-bc2c-2569c912cb74	0	2	\N	\N	bc95d469-bb8d-4ed2-998b-93e2e7641407	\N
ac20c22d-4bde-4c0c-9c49-cf08c27f77f6	0	2	\N	\N	06cde1a8-8f15-407d-b445-218a49980edd	\N
ae3f4ba3-5ead-4458-bbbd-a18a56152e27	0	3	\N	\N	6688cf18-280a-4775-bfff-a060b177418d	\N
b5c9b149-02ed-457f-a7a8-8149c63624a3	0	3	\N	\N	693ba8ea-8d44-40cc-a741-4f7ec546473d	\N
b64952fb-fe6a-453c-ad75-e8174e2f0424	0	1	\N	\N	d4c0b747-cd9b-4136-b94d-0c598e97fa93	\N
b6b63a1b-5c77-4162-b7c9-23ad7f593be2	0	1	\N	\N	e792573e-0c8d-40ba-bcd9-c2c36652a492	\N
b821bcc0-cef0-481e-96af-92964016773d	0	2	\N	\N	e058e349-357e-4a46-a469-d326a14d1757	\N
badc703a-161f-4c37-8c57-cc759cbeb5c1	0	1	\N	\N	3bab7751-ddbf-44ce-a311-f833c069bc4c	\N
bb218613-891f-43d9-91f2-7abb3a9448ff	0	2	\N	\N	e792573e-0c8d-40ba-bcd9-c2c36652a492	\N
bb2ae58c-5d24-427f-9885-3fc6eeb2ecce	0	3	\N	\N	3bab7751-ddbf-44ce-a311-f833c069bc4c	\N
bb67d595-e034-4f3c-9de2-5d5bb382cd76	0	1	\N	\N	363ad7bf-50ba-4e64-a5c9-a032303c7716	\N
bc150c89-d542-4b7e-9a0f-0f6aa99a2019	0	3	\N	\N	7a77e071-d531-4567-8ddb-7469e0f993f5	\N
be8786dd-d59b-4a0d-b03e-b440dfa35bb6	0	1	\N	\N	7c9f47eb-0b90-4c36-899b-f7c639790683	\N
beb696f1-e06f-457f-8aa2-bffba5dd8de3	0	3	\N	\N	8b8b896b-e983-4c9b-8be3-4a49b1d03fd8	\N
bed7030e-1af9-4bec-892f-331c0b61dfc7	0	1	\N	\N	74b17d1b-070a-46c1-9d9e-ab961665aff4	\N
c015a604-82ae-43e5-904f-0fe1c10ca652	0	1	\N	\N	d264dfae-f1f8-4533-a51c-a93bcf3f3729	\N
c0baffcd-6c2a-4cfe-969f-a76c40c492a4	0	2	\N	\N	7fd57eac-5496-440b-b509-ea7954072e6f	\N
c60a7073-b780-4943-805c-90f45cb031e9	0	3	\N	\N	4a8724b1-a893-415e-9b84-2f03dc25d8af	\N
c64cf5a3-4e26-49b5-8a8c-1fd90ca82bc8	0	3	\N	\N	35ae1051-83bb-494b-ad72-f393e9b8ecd6	\N
c7291c83-a604-4854-a98d-c6659b2f47ec	0	2	\N	\N	73dfbecc-3998-42db-ade0-4a1c14c1e77c	\N
c7adeb9b-1b53-4aa8-a865-629ab6ba9e03	0	1	\N	\N	522a7c72-f638-4b94-990a-ecc83ca78bb3	\N
c8c4db63-3ad4-4fda-88d1-3257ecd7b971	0	1	\N	\N	dc741837-5ef5-4fcd-bd08-b5362c135811	\N
cb996e86-bddb-49c8-bfb4-c01f050d853c	0	1	\N	\N	cf4218a2-bed3-40dc-b1a4-3d6b0c289cf8	\N
cc8a2721-f40e-4871-abef-2309fa806c0d	0	2	\N	\N	25298f5a-95d6-41fe-b0fc-81509f54b82a	\N
ce637ae8-1af7-4469-926a-f6289b9d17df	0	2	\N	\N	bca6de4b-790a-433c-90b5-9f18054164f0	\N
cf6281ec-bd94-444d-bd50-b83fb9eb3aad	0	3	\N	\N	1e2a49bf-f567-4d3a-a46f-fd2ca0b682cd	\N
d1ad9a8f-6ed8-4d7d-8585-3e2e051ef4c9	0	3	\N	\N	e058e349-357e-4a46-a469-d326a14d1757	\N
daa8bfef-99da-4720-8ad4-0f5bfab4e18c	0	1	\N	\N	0087b828-2b1d-46e1-8baf-e283cc585221	\N
dca078cf-8d14-4053-8677-5a6eb8694a7d	0	2	\N	\N	508dba52-da48-464d-8c03-654538d57aea	\N
dd9f433e-01d0-4627-9af9-bf11f7a9cd85	0	2	\N	\N	7a77e071-d531-4567-8ddb-7469e0f993f5	\N
de4ce535-834d-458a-be13-30be4dfcd3e8	0	2	\N	\N	1a54c04c-8d58-43bc-a59a-f6e4ec4a6e74	\N
df35fc71-2e73-486d-923f-4e8eb6e649c9	0	3	\N	\N	448d42a3-78a9-400b-bc49-e8f21b454624	\N
dfe5efcc-40d3-4502-ba8e-af79e99f4e87	0	1	\N	\N	e580d276-af8e-4af6-a31a-1dafd5151d03	\N
dff78aea-8aed-40c9-9af8-22b99a6d84be	0	3	\N	\N	e792573e-0c8d-40ba-bcd9-c2c36652a492	\N
e02aa79b-5abe-4faf-ac17-cea12edf49a8	0	3	\N	\N	69287c09-2af1-477f-8566-ad8601cb6a6b	\N
e2892674-0877-458f-ab1d-6b392677cddc	0	1	\N	\N	4a0a6adf-c240-486b-b5dd-7e3fb872e2c2	\N
e297a831-a7b4-49f1-989a-19b4ac29f02a	0	2	\N	\N	693ba8ea-8d44-40cc-a741-4f7ec546473d	\N
e8659504-4938-4e93-87d8-42dfaa859462	0	3	\N	\N	d264dfae-f1f8-4533-a51c-a93bcf3f3729	\N
eb44cb56-fd46-4888-905b-f46d075c22d3	0	1	\N	\N	73dfbecc-3998-42db-ade0-4a1c14c1e77c	\N
ecf3dd42-4a1b-41f2-b793-7689612276e8	0	1	\N	\N	69287c09-2af1-477f-8566-ad8601cb6a6b	\N
ecf8a220-a91e-4720-9a70-b2237256b11a	0	3	\N	\N	26935dd4-7c88-4e9f-a4d6-143a11b90d4a	\N
eee3ebd4-eeb0-489d-ac6d-62e57758233c	0	1	\N	\N	e058e349-357e-4a46-a469-d326a14d1757	\N
efec3399-18ea-48d3-abb1-cf924fa9f4b1	0	2	\N	\N	522a7c72-f638-4b94-990a-ecc83ca78bb3	\N
f319e3c8-b55c-4517-aee4-751b0cdfcc16	0	2	\N	\N	cdfc2697-9dcc-48f3-b4b4-adecce95f7eb	\N
f3f160f9-03e4-45f1-b911-98fb7750268b	0	3	\N	\N	25298f5a-95d6-41fe-b0fc-81509f54b82a	\N
f440180d-b2bf-4e72-83f2-7e8a61c360a3	0	1	\N	\N	143a7c47-5217-4ee4-8a75-b2e2e59c8c27	\N
f57f6361-1656-4c62-89d1-35f79b1521ab	0	1	\N	\N	1a54c04c-8d58-43bc-a59a-f6e4ec4a6e74	\N
f695e54a-3fa3-4567-a32b-a366dec178e1	0	1	\N	\N	4df1adf4-8890-41ad-bf0a-0a103a7405fe	\N
f7e32178-8afe-4db6-b755-43a45683b077	0	3	\N	\N	522a7c72-f638-4b94-990a-ecc83ca78bb3	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
b2b6771a-b9e3-4350-8523-f49f83d66a05	Сборка, сварка рам к/с г/п 120-130 т.	6	30f98574-14f5-4cb6-92a8-db953ce3b822	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0575128f-4557-4274-8c56-2808329227e6	Усилитель	75131-2801114-01	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
107b0dbb-f5b7-448e-a528-cccd6c4013eb	Накладка рамы поперечная передняя	75131-2801088-70	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
13e5c1bf-232c-4c00-b346-886ee2534c8b	Опора	75131-2801188	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
169dc121-743b-4839-b679-b0010ed804fa	Опора	75131-2801188	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
16b8e4cf-7639-470d-8767-c54c6de94209	Накладка рамы поперечная передняя	75131-2801088-70	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
16cbe333-ce68-4a15-955b-8da378ae60a9	Кронштейн задней опоры	75131-8521182-20	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
1a918264-b12e-472a-ad9b-a26f539bab33	Кронштейн задней опоры	75131-8521183-20	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
37431242-8d8a-4cb6-8695-0238cc563081	Накладка рамы поперечная передняя	75131-2801088-70	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
4f69298e-a587-4d64-96b9-1beb5527a45d	Опора	75131-2801188	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
550e220c-f0d1-451f-b0d0-164a4b409742	Лист нижний	75131-2801358-10	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
55609051-b26d-4e80-b14e-25f7a27f5ed7	Лонжерон рамы левый	75131-2801015-41	t	2	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
59f12578-6b9e-4793-ab9c-8d9dfb6f3e2c	Поперечина	75131-2801103-10	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
5a962f10-f4e2-4005-be93-568a0a5c31f4	Поперечина	75131-2801103-10	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
5faca089-ced7-49e5-a71f-709b96c6fb4c	Поперечина №3 рамы с опорами	75132-2801152	t	2	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
662a1c82-d2f5-4a3b-be22-aaf40dc668d9	Лонжерон рамы правый	75131-2801016-70	t	2	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
6e2905ff-9aba-49f1-b532-3b412cc3784e	Опора	75131-2801188	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
71dcefd4-0e81-402a-821e-ca65adbd0bb9	Лонжерон рамы левый	75131-2801015-41	t	2	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
760b6c71-4af7-4129-a207-2904fc2674af	Усилитель	75131-2801115-01	t	3	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
843219f2-352e-4cd1-8f61-c03090c5eec8	Лист верхний	75131-2801357-10	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
85ea85fa-e1a0-4dc1-8a1f-59423eeb488d	Кронштейн задней опоры	75131-8521182-20	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
86876380-33de-45e6-a8f6-545eae054d9a	Лонжерон рамы правый	75131-2801014-41	t	2	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
8989bd26-f2a8-4a10-999e-2625ab8b5058	Опора	75131-2801188	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
8ea6debd-6bb0-4d40-a2d3-77a44b3168ae	Усилитель	75131-2801114-01	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
928fe228-870e-437c-b511-17f7118e11cd	Поперечина №3 рамы с опорами	75132-2801152	t	2	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
95048ab0-bc59-40f1-9004-49054e206f4d	Поперечина рамы задняя	75131-2801300-20	t	2	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
97754c62-4db9-4957-b913-cc3b2935b5b9	Лист верхний	75131-2801357-10	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
98b22bd7-541d-4f83-bd0f-0de602c0dcc1	Лонжерон рамы левый	75131-2801017-70	t	2	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
9fd97670-50ec-4b60-9f6d-e1ec1c285a53	Опора	75131-2801188	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
aa793e87-edd8-4785-8cb1-b0ac0cbd63eb	Рама	75131-2800010-70	t	1	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	4536479362
adbdbf2b-e786-478a-aec5-249bcb6f402a	Усилитель	75131-2801115-01	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
c336da9c-e607-44e4-bb30-3404b09b856f	Поперечина рамы задняя	75131-2801300-20	t	2	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
c3b1fb6f-cb70-4656-a679-4f48da4a84d6	Опора	75131-2801188	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
ca3748ec-e22d-4aa9-be51-471bf8257a2d	Поперечина	75131-2801325	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
d88faeeb-1c90-418b-aae4-584744a2e74b	Рама	7513D-2800010-20	t	1	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	4536492774
dac07c52-4a30-41b7-bfc4-60c94b6ff9a5	Лонжерон рамы левый	75131-2801017-70	t	2	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
dfdb6ca0-b363-4764-9fce-93918f20c753	Накладка рамы поперечная передняя	75131-2801088-70	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
e33d1406-d5fd-4563-b6ed-eca4df76659d	Лонжерон рамы правый	75131-2801016-70	t	2	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
e90ec6cc-bb42-4e86-9132-7de4fcafddc6	Кронштейн задней опоры	75131-8521183-20	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
fd802e02-e6d1-4da0-ae4c-24140be3ea17	Опора	75131-2801188	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
fe6e1da4-acff-4b1c-a6e7-f6dcd231e474	Поперечина	75131-2801325	t	3	3d61705b-8201-4f88-b8f8-50695cd51267	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N	\N	\N
1342fc75-c419-451c-abb0-3e0ea50e23ce	Лист нижний	75131-2801358-10	t	3	7d784070-3fe0-4b1f-9c76-3d79698d20d7	b2b6771a-b9e3-4350-8523-f49f83d66a05	de5b97dc-4df9-4379-acc2-11478dd40564	\N	\N	\N
38269083-2f70-4f70-9853-141140aa537c	Лонжерон рамы правый	75131-2801014-41	t	2	91111c6f-af19-4adb-9038-2718dbbd9752	b2b6771a-b9e3-4350-8523-f49f83d66a05	de5b97dc-4df9-4379-acc2-11478dd40564	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
a88a47d8-9067-4fa4-ae57-42cc211c25a2	Admin	\N
2e316d54-7af4-4bc1-a5e3-95751dd033aa	Master	\N
a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0	Welder	\N
b611a568-88bf-4cf0-8595-33262e64cccc	Inspector	\N
4ad17f29-68d6-40a5-b51a-b86bb6dd1f59	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "IdFromSystem") FROM stdin;
00446547-1903-4551-8a64-0482234b7f6e	2023-03-08 19:46:13.596728	0cf9c0bf-cc8e-4b42-87b2-ad40a026d795	\N
0ca26f98-afe2-4741-a619-43ead8a24082	2023-03-08 19:46:13.596883	9bbdf1f5-dfaa-40a0-9291-4054939bdcbe	\N
1251b9c3-dec5-4089-a9b0-36288eade6fa	2023-03-08 19:46:13.594202	7a0dee7b-4af3-460d-9293-400e5fa2dba7	\N
178aba81-c48e-4daa-b3c7-0002b816c0a3	2023-03-08 19:46:13.596497	b0807a0f-df7a-4ada-a218-6f972fbd6c2b	\N
1b18eec9-23a7-4557-8335-635237b5700e	2023-03-08 19:46:13.593199	869eba1e-8db7-4884-ab46-c8f9e0027693	\N
1b561ac0-63d0-4002-9fa9-4039383045aa	2023-03-08 19:46:13.595628	14ab5dc4-3410-44f3-a288-7f244c180f03	\N
1f78214c-1fb3-430d-a60c-043f4cd8e68c	2023-03-08 19:46:13.573594	7451a0bc-d9ce-453b-bd8b-97671502e55d	\N
256ccac3-b183-400b-81f2-eac785f11e8e	2023-03-08 19:46:13.596655	dcb53eea-71a1-4c3d-a6cd-b9835640cc42	\N
25c7c63d-ce2c-49e5-961b-34afc75748b0	2023-03-08 19:46:13.596184	0556beba-3541-49e5-8f06-f82c58f6e62f	\N
2709335f-edbd-40c6-9234-6b990b489a4f	2023-03-08 19:46:13.593797	7ae3b29f-7f2f-48e8-b2cd-b5c7137ead2f	\N
28c79845-4fac-4a03-bb78-b1c65646f573	2023-03-08 19:46:13.595387	f85686f3-dbd3-4b46-a287-342c37017fd8	\N
34a8b0e5-b1fc-43f7-9873-dc6a2847a9fb	2023-03-08 19:46:13.594835	7d0c0a49-f8d7-4b2d-89c9-ae0aa4210665	\N
34b8419e-1e12-49d0-b7cf-1ecfbd2ceb34	2023-03-08 19:46:13.593878	52c440c6-e0e3-40d6-ab14-e75b8f056f70	\N
376b6a6c-1ed1-4811-a37a-cfaff7abbcb1	2023-03-08 19:46:13.596804	51c77cf5-af14-4fa7-851c-0e5333b158ce	\N
400315e3-8533-4834-8cc2-681f33dacb02	2023-03-08 19:46:13.59642	3c3100eb-a7a6-43ff-9fa1-c66cba8d8eca	\N
438a233f-ea9a-403e-b410-4701d52f9840	2023-03-08 19:46:13.594036	f18ca358-c188-4e77-ab40-b198592f9137	\N
4c601673-f370-47fd-93f3-6888d9b3576d	2023-03-08 19:46:13.594279	6c19a852-4d5e-43b9-86db-fe654d6b3868	\N
4e5dab32-7dba-4a53-9774-99947f157d0d	2023-03-08 19:46:13.595068	a47b4058-d5e8-47d2-883c-17aa61b53b35	\N
53b3fac1-e3d4-4239-b5e3-2b0e4c668e6e	2023-03-08 19:46:13.597202	dbf00fa8-8f1e-4221-8bdb-14674d1a9af6	\N
58ba81ca-84dd-47c3-ac1d-81f4f216a04e	2023-03-08 19:46:13.594757	3c58a8e4-91b7-4923-831b-c03eebe9ef3b	\N
5a2e337d-e27d-46cf-8489-3e980447a88d	2023-03-08 19:46:13.597042	948b0450-6b3d-41cf-bffb-a5e1a7d54552	\N
68d51968-0210-468e-b59c-bfd4dc1bab51	2023-03-08 19:46:13.592855	0966402c-824f-4ae3-8a7f-8b89bbd3efdf	\N
6aab81d6-3466-4962-abe4-a84821e69408	2023-03-08 19:46:13.594599	f4fc5dc2-c174-433c-bd97-0219614406d4	\N
6e6a687d-dc90-4938-ba6d-37e2bab751d5	2023-03-08 19:46:13.594986	35085877-d5b7-447d-8f1c-43294c92f9ba	\N
757818ff-276c-4891-b2df-f3835274affc	2023-03-08 19:46:13.596021	e86f2036-6c78-4584-91c2-19e01d06bf5b	\N
8569cfb9-3fb7-4dee-8d04-a87c6865c2a3	2023-03-08 19:46:13.594912	abafc8bc-4b52-4e8d-afff-fe8df24dc562	\N
8b3d92f6-12de-42ed-a99e-36ddb2b4d3a6	2023-03-08 19:46:13.596264	afcd6988-adb9-4ca5-82b5-569fb894bee4	\N
90ccbdb9-fec8-463a-a0f9-d46b819ac32e	2023-03-08 19:46:13.595786	05b82b6d-0d36-4d0e-915a-1a04b8622345	\N
9565f107-1cf7-4c78-a634-20fbe629ede3	2023-03-08 19:46:13.595708	e89cf688-0299-4c7c-873d-c4fe45e6ac07	\N
974f49b6-5b57-4bb3-84df-a334496a53be	2023-03-08 19:46:13.59594	a10d330e-cfe0-4d5e-860a-756a6c1b6124	\N
a1f2c048-5c9b-49fd-8a6d-57234fc65556	2023-03-08 19:46:13.595229	da47f819-084f-40ae-9ebb-7c214b5db418	\N
a7f50f62-cd0e-42f2-914c-19cc591bc293	2023-03-08 19:46:13.594516	8c527d3b-3038-4250-a5ec-c9f25c0a67f6	\N
aa6ba1a8-7ac5-4529-9c80-992f3163520c	2023-03-08 19:46:13.593493	9eebf270-0839-4b94-93c7-c747f0041cff	\N
b0265436-4b3c-493c-b156-73d4b63c9333	2023-03-08 19:46:13.594357	d40f20c8-6c14-41d2-963c-b9d27b42b571	\N
b6472118-ec1d-4c7c-9c60-6d190dc9669e	2023-03-08 19:46:13.595306	bfd3c915-be8c-4d66-a143-279c93e94297	\N
bf34f5c4-718e-4bbf-b2b5-c910a0fdbd96	2023-03-08 19:46:13.593037	b66ab847-3ed1-42bc-8b41-8d280cbc186f	\N
c023230c-7e8f-454b-bcc4-b9156210b8e3	2023-03-08 19:46:13.596098	9d734669-d855-4f32-a6a9-eb51972fe7dd	\N
c06a2ec9-d72d-4b24-845b-808f63c584fd	2023-03-08 19:46:13.595863	ab2bdbf5-044b-46c1-91d7-271b73bf8474	\N
c50b5060-76fd-4926-b9ae-d4101a141429	2023-03-08 19:46:13.593343	b1776e8a-d214-4f5e-b936-455e3a3a5969	\N
c5af84e8-6f04-4015-82a8-d62d168c42fa	2023-03-08 19:46:13.595466	d43077ee-6972-4881-abf0-5ebe0b4a1981	\N
c61ddc73-01d7-4e35-a7c0-cb394b174f9b	2023-03-08 19:46:13.594116	0b5eefad-1017-4ac5-8db5-359d260dca44	\N
c7e5a917-d559-4bc8-a5c0-285ada20e59f	2023-03-08 19:46:13.593957	ac208ecc-d5f1-4769-9f64-04bcc8191097	\N
cec2e3c4-a0c9-4a19-8247-6573f0d6907d	2023-03-08 19:46:13.597122	7b1febd4-5581-4cfe-9d62-61cc3a5a43f4	\N
d2e197a6-e355-4602-9d8b-8b8fba40affb	2023-03-08 19:46:13.593624	413e8aec-9108-4d8d-ae7f-cdc0d095c33c	\N
d7297b54-b255-4f4d-a087-7d4790433d3f	2023-03-08 19:46:13.596577	f7845498-6862-4d36-a4b1-0d10b3008fac	\N
db10a5c0-fd48-4746-959c-df7495839468	2023-03-08 19:46:13.596342	a49dbc5c-348e-4840-a0f1-29844286b9fc	\N
e8046ff9-dafb-4cac-81ec-123ff61c7a86	2023-03-08 19:46:13.593707	5f0d90ed-269b-49e7-ac29-25780ab1d198	\N
e8710f94-d29c-42fe-81a1-1e6c91f590ed	2023-03-08 19:46:13.59515	97644c1a-9b77-43f4-b0ca-648044433159	\N
ec2b0ef5-3fe9-48c3-b2ce-58215ba0b84f	2023-03-08 19:46:13.596964	8c47475e-f439-45fb-832f-9e70d84109b6	\N
ed63337d-8013-476f-bb98-16b2c751fd2b	2023-03-08 19:46:13.595549	e681a87f-c280-4e93-a227-6c85b3a20ccb	\N
f13278c7-4b88-40f3-8d2b-452b3e9db834	2023-03-08 19:46:13.594677	a8e5afa2-6b98-4549-b091-4c50e88342fb	\N
f14f8296-3a9e-4830-8f3f-0725714be8cd	2023-03-08 19:46:13.594437	cc72c277-d02a-44e1-b670-27e7bd0f5ede	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0031add8-5678-4df3-a8ee-ef8bbb9159b0	0	1	\N	\N	c023230c-7e8f-454b-bcc4-b9156210b8e3	\N
005f2ba9-c3e9-44aa-84a0-4ef028e2d9c0	0	3	\N	\N	68d51968-0210-468e-b59c-bfd4dc1bab51	\N
01d33d89-7ca6-451c-8ed5-e07f87dd43b3	0	1	\N	\N	53b3fac1-e3d4-4239-b5e3-2b0e4c668e6e	\N
04a6d9ea-3ba3-44cc-a6d3-457e754030ee	0	2	\N	\N	e8046ff9-dafb-4cac-81ec-123ff61c7a86	\N
07f31e34-d675-4f4f-92e4-7f9ca4cc981c	0	3	\N	\N	8569cfb9-3fb7-4dee-8d04-a87c6865c2a3	\N
08dc441c-8c8d-4f6f-94b0-5ae4c8a6ea86	0	1	\N	\N	4e5dab32-7dba-4a53-9774-99947f157d0d	\N
0bb804bd-183d-4337-8de3-eda72543c047	0	3	\N	\N	376b6a6c-1ed1-4811-a37a-cfaff7abbcb1	\N
111d5bee-f184-48f5-8f14-645c99a495c0	0	1	\N	\N	c06a2ec9-d72d-4b24-845b-808f63c584fd	\N
117fa7ad-6a31-4259-be7e-3507be1fbfcf	0	2	\N	\N	aa6ba1a8-7ac5-4529-9c80-992f3163520c	\N
161920cb-32ca-418c-a145-dae75a1cc6db	0	1	\N	\N	f13278c7-4b88-40f3-8d2b-452b3e9db834	\N
1698533b-b8d0-437c-9380-c7901d1e8602	0	3	\N	\N	1b561ac0-63d0-4002-9fa9-4039383045aa	\N
1a4ff47f-e421-4ece-811f-9d6870cf4b91	0	1	\N	\N	c7e5a917-d559-4bc8-a5c0-285ada20e59f	\N
1ad7b6d8-f9f6-4a8c-b918-7cc0f4133066	0	3	\N	\N	aa6ba1a8-7ac5-4529-9c80-992f3163520c	\N
1c11b97d-780c-482b-b463-58d7fe04b6fb	0	2	\N	\N	400315e3-8533-4834-8cc2-681f33dacb02	\N
1c29e6f0-ade4-4a1c-ae1a-076472af0d7a	0	3	\N	\N	d7297b54-b255-4f4d-a087-7d4790433d3f	\N
1ce0c1b1-589f-47a9-bc82-4f7083096901	0	1	\N	\N	974f49b6-5b57-4bb3-84df-a334496a53be	\N
1e9dce46-f5c1-41d6-a5cb-553fdf49d2dd	0	1	\N	\N	256ccac3-b183-400b-81f2-eac785f11e8e	\N
22eda84d-b24d-4609-b2da-88d51851b1db	0	2	\N	\N	178aba81-c48e-4daa-b3c7-0002b816c0a3	\N
27a274c8-dc42-4933-bd3e-7388afdcab4b	0	2	\N	\N	5a2e337d-e27d-46cf-8489-3e980447a88d	\N
27ba9df7-8b30-4c59-86ca-4117a2ad55f0	0	2	\N	\N	1b561ac0-63d0-4002-9fa9-4039383045aa	\N
283d66fe-d757-4ac6-847c-f7de83bbd152	0	1	\N	\N	ed63337d-8013-476f-bb98-16b2c751fd2b	\N
2b377dc5-b770-4342-9e1f-ce467f513695	0	3	\N	\N	ed63337d-8013-476f-bb98-16b2c751fd2b	\N
2b723ae7-f679-4d2b-a6c3-138ae19899e9	0	3	\N	\N	00446547-1903-4551-8a64-0482234b7f6e	\N
2d9e920b-84df-488c-af07-d870ad6434d6	0	2	\N	\N	4e5dab32-7dba-4a53-9774-99947f157d0d	\N
2df18dfe-1a2e-4ba8-8f4e-d5ca45ddd540	0	2	\N	\N	8569cfb9-3fb7-4dee-8d04-a87c6865c2a3	\N
2e9a0686-8743-44c0-821e-cc7f74b45f07	0	1	\N	\N	178aba81-c48e-4daa-b3c7-0002b816c0a3	\N
34e9af0b-8930-4d15-8057-5a84e226fec3	0	1	\N	\N	cec2e3c4-a0c9-4a19-8247-6573f0d6907d	\N
356f9258-9995-4efc-9369-223c43b47d40	0	1	\N	\N	34b8419e-1e12-49d0-b7cf-1ecfbd2ceb34	\N
35bb0173-a244-4d70-b283-581ab7c28586	0	3	\N	\N	1f78214c-1fb3-430d-a60c-043f4cd8e68c	\N
35e9eaf4-7902-432d-b08d-42e22d87fcdb	0	2	\N	\N	e8710f94-d29c-42fe-81a1-1e6c91f590ed	\N
378b5ed5-43bf-4247-9b9c-3ac4833439f2	0	1	\N	\N	9565f107-1cf7-4c78-a634-20fbe629ede3	\N
3953a465-3fca-4855-9c37-fc09e4c3306f	0	1	\N	\N	c5af84e8-6f04-4015-82a8-d62d168c42fa	\N
3b77dc98-1328-404d-8bb2-617f5ce0c51d	0	2	\N	\N	53b3fac1-e3d4-4239-b5e3-2b0e4c668e6e	\N
3dc75f06-5c92-4304-a44d-822c59c05415	0	3	\N	\N	cec2e3c4-a0c9-4a19-8247-6573f0d6907d	\N
3e437517-8b51-4278-9513-386cede1624e	0	3	\N	\N	25c7c63d-ce2c-49e5-961b-34afc75748b0	\N
3f6149e7-d6d8-46e2-90d7-5216f2a7f52f	0	2	\N	\N	c61ddc73-01d7-4e35-a7c0-cb394b174f9b	\N
4082c431-818c-4b97-95de-43bcf02124ec	0	2	\N	\N	0ca26f98-afe2-4741-a619-43ead8a24082	\N
445353ee-62f4-4de7-9d75-5d791b4c4392	0	2	\N	\N	1f78214c-1fb3-430d-a60c-043f4cd8e68c	\N
44788f05-8a3e-41b8-8820-fa609b644342	0	1	\N	\N	b0265436-4b3c-493c-b156-73d4b63c9333	\N
46476f93-86d4-4781-9c8f-d46ec0cefacf	0	1	\N	\N	6e6a687d-dc90-4938-ba6d-37e2bab751d5	\N
46bed9d0-d903-43ab-b893-3337c60690e0	0	1	\N	\N	90ccbdb9-fec8-463a-a0f9-d46b819ac32e	\N
4835563e-ff5e-4a1f-9527-956dc5f4801f	0	1	\N	\N	0ca26f98-afe2-4741-a619-43ead8a24082	\N
48485844-e339-4ed3-83af-006005e760c6	0	3	\N	\N	90ccbdb9-fec8-463a-a0f9-d46b819ac32e	\N
494e2bb8-7f24-4f97-b227-a6d3ed027a9a	0	3	\N	\N	db10a5c0-fd48-4746-959c-df7495839468	\N
49509bb0-3f5d-4862-b674-6e1629f036a9	0	2	\N	\N	34a8b0e5-b1fc-43f7-9873-dc6a2847a9fb	\N
49f9256e-5983-42e5-b46f-3e3fbe2fe1e9	0	2	\N	\N	db10a5c0-fd48-4746-959c-df7495839468	\N
4a21b398-ae23-4d80-9532-9861e5680923	0	1	\N	\N	757818ff-276c-4891-b2df-f3835274affc	\N
4b75a45a-b499-4fb3-974a-7f59d059d13a	0	1	\N	\N	25c7c63d-ce2c-49e5-961b-34afc75748b0	\N
4ef03a74-c26e-4d8c-aaf6-997238adad1b	0	3	\N	\N	e8046ff9-dafb-4cac-81ec-123ff61c7a86	\N
5160163d-450a-4c13-ac0b-cc0aed4a70be	0	3	\N	\N	34b8419e-1e12-49d0-b7cf-1ecfbd2ceb34	\N
57113105-bbaa-46d1-81f1-ce7e79218216	0	1	\N	\N	68d51968-0210-468e-b59c-bfd4dc1bab51	\N
57e97737-019b-49bc-9cce-a7bcd720a5df	0	2	\N	\N	ed63337d-8013-476f-bb98-16b2c751fd2b	\N
59526b40-9d49-4c34-a836-374dcb5f59a6	0	3	\N	\N	b6472118-ec1d-4c7c-9c60-6d190dc9669e	\N
596056a8-5a31-4d9e-95fe-b10c38459c0f	0	3	\N	\N	58ba81ca-84dd-47c3-ac1d-81f4f216a04e	\N
5a04e448-1383-4d78-83cc-57920384fc93	0	1	\N	\N	1b561ac0-63d0-4002-9fa9-4039383045aa	\N
5a406c4b-4e65-4cf5-a241-90c6edcef055	0	3	\N	\N	c7e5a917-d559-4bc8-a5c0-285ada20e59f	\N
5ae5dd9a-be33-4281-a5f9-f3ba75d704a6	0	1	\N	\N	e8710f94-d29c-42fe-81a1-1e6c91f590ed	\N
5d155c65-0f4a-4bba-9722-89b982955841	0	1	\N	\N	28c79845-4fac-4a03-bb78-b1c65646f573	\N
5d34bd68-5557-4026-891e-44e209b1161b	0	1	\N	\N	4c601673-f370-47fd-93f3-6888d9b3576d	\N
5d75c597-c747-47ef-adb4-de2dfd154751	0	2	\N	\N	376b6a6c-1ed1-4811-a37a-cfaff7abbcb1	\N
5df9af0a-d3af-4e25-9640-ab0dfa96cdfb	0	1	\N	\N	b6472118-ec1d-4c7c-9c60-6d190dc9669e	\N
60a43fa5-16bc-45e7-a8fb-c06e6b0a0b73	0	1	\N	\N	a1f2c048-5c9b-49fd-8a6d-57234fc65556	\N
6147f53a-6c6a-435c-b6c6-94e63db37b65	0	2	\N	\N	a7f50f62-cd0e-42f2-914c-19cc591bc293	\N
62bb7107-7781-45c8-91e9-5e09920d6615	0	2	\N	\N	bf34f5c4-718e-4bbf-b2b5-c910a0fdbd96	\N
676a7dc0-1d31-4d0e-9a52-56f2a4c08400	0	2	\N	\N	c50b5060-76fd-4926-b9ae-d4101a141429	\N
6b9da72e-874d-4b8f-a4ea-af2635d8a48c	0	3	\N	\N	a1f2c048-5c9b-49fd-8a6d-57234fc65556	\N
6c64b6b9-fec2-4a29-8432-6304d0d6dbd7	0	2	\N	\N	b0265436-4b3c-493c-b156-73d4b63c9333	\N
6d546477-44d3-47bf-9aba-9a903dd82984	0	3	\N	\N	1251b9c3-dec5-4089-a9b0-36288eade6fa	\N
713da6c7-81fc-486c-a644-f28789d494a7	0	2	\N	\N	6aab81d6-3466-4962-abe4-a84821e69408	\N
761a12dc-a931-4446-b1ad-b40426ce8998	0	2	\N	\N	4c601673-f370-47fd-93f3-6888d9b3576d	\N
775f9552-95e3-4f03-b7f3-b7facaae44a3	0	3	\N	\N	c06a2ec9-d72d-4b24-845b-808f63c584fd	\N
78c86197-042b-43dd-9260-ee0be0f5c111	0	1	\N	\N	58ba81ca-84dd-47c3-ac1d-81f4f216a04e	\N
78fc32b7-7a63-42bd-9232-765ae3ff7e3b	0	1	\N	\N	438a233f-ea9a-403e-b410-4701d52f9840	\N
7ab180e2-5070-4d10-9370-c9078c8ec812	0	3	\N	\N	e8710f94-d29c-42fe-81a1-1e6c91f590ed	\N
7b8e23fe-a15d-412b-bc2a-fabe6d886bca	0	1	\N	\N	c50b5060-76fd-4926-b9ae-d4101a141429	\N
7cd3f24b-1beb-43ab-ac9a-8f6f5bfe39ca	0	1	\N	\N	1b18eec9-23a7-4557-8335-635237b5700e	\N
7f195ffe-8c7f-4cea-95ac-edd14e648991	0	3	\N	\N	c50b5060-76fd-4926-b9ae-d4101a141429	\N
7f34d6f1-4c64-4253-96e9-f23da967433b	0	3	\N	\N	b0265436-4b3c-493c-b156-73d4b63c9333	\N
8073df59-258a-43d3-9837-1448e9a4a8cb	0	1	\N	\N	a7f50f62-cd0e-42f2-914c-19cc591bc293	\N
8166ad24-f41a-4654-911a-cb9e08034fbe	0	2	\N	\N	cec2e3c4-a0c9-4a19-8247-6573f0d6907d	\N
81a4fba5-8ca4-405b-8f64-8bdc25173c8b	0	2	\N	\N	00446547-1903-4551-8a64-0482234b7f6e	\N
84c9a67c-3162-401f-bb2f-fe627d50fe09	0	3	\N	\N	400315e3-8533-4834-8cc2-681f33dacb02	\N
85019c5d-8d78-4430-bb55-f5e117aaa0d3	0	3	\N	\N	178aba81-c48e-4daa-b3c7-0002b816c0a3	\N
86f3a522-8028-4abd-aeae-84392f647086	0	2	\N	\N	ec2b0ef5-3fe9-48c3-b2ce-58215ba0b84f	\N
8c2e5954-bb20-45a4-8aea-11415f135b1a	0	3	\N	\N	2709335f-edbd-40c6-9234-6b990b489a4f	\N
8d8a0643-633c-49bc-87fd-e8509c95249d	0	1	\N	\N	d2e197a6-e355-4602-9d8b-8b8fba40affb	\N
91892247-2a8d-45d6-a4fa-8dc895151128	0	3	\N	\N	9565f107-1cf7-4c78-a634-20fbe629ede3	\N
9229b6b4-7f71-4c95-a987-6054bf349e1b	0	1	\N	\N	d7297b54-b255-4f4d-a087-7d4790433d3f	\N
936b3602-6a30-48b7-890d-e326511d7e84	0	1	\N	\N	400315e3-8533-4834-8cc2-681f33dacb02	\N
93b5cd61-2941-4e60-b0e2-cd36242d3789	0	3	\N	\N	6e6a687d-dc90-4938-ba6d-37e2bab751d5	\N
95519411-3fd7-4a45-a5fd-5586a3a4d9a1	0	2	\N	\N	b6472118-ec1d-4c7c-9c60-6d190dc9669e	\N
99410027-355a-41c8-a2a8-dfefebd303f2	0	3	\N	\N	6aab81d6-3466-4962-abe4-a84821e69408	\N
9a3382fb-c364-4675-9386-cd70944aa4f0	0	3	\N	\N	1b18eec9-23a7-4557-8335-635237b5700e	\N
9c023b5a-5500-4975-8fb3-72e1c43dee40	0	3	\N	\N	4e5dab32-7dba-4a53-9774-99947f157d0d	\N
9d7414a6-f48f-4987-9ae0-b1fe19942fcd	0	2	\N	\N	757818ff-276c-4891-b2df-f3835274affc	\N
9fcc1e88-d24d-49cd-8677-af67ce6b32e2	0	2	\N	\N	2709335f-edbd-40c6-9234-6b990b489a4f	\N
a0a4de4c-ebf3-47e9-a4bd-47155cefd110	0	3	\N	\N	974f49b6-5b57-4bb3-84df-a334496a53be	\N
a1e8fd30-1da2-43d2-ae01-fee8d031d8e5	0	3	\N	\N	bf34f5c4-718e-4bbf-b2b5-c910a0fdbd96	\N
a37ba0d1-792a-4542-9b33-531b9229e7f7	0	3	\N	\N	f14f8296-3a9e-4830-8f3f-0725714be8cd	\N
a5a71b7a-279c-4330-9fdf-c012bfb732c3	0	1	\N	\N	00446547-1903-4551-8a64-0482234b7f6e	\N
a8d70a37-ff4c-4b3f-9344-d9d92f3f1a30	0	1	\N	\N	db10a5c0-fd48-4746-959c-df7495839468	\N
aa2e77cd-7531-4944-af77-253f20e381cd	0	3	\N	\N	53b3fac1-e3d4-4239-b5e3-2b0e4c668e6e	\N
ac7e7706-3789-4a9b-b34d-5fb26007ff02	0	1	\N	\N	aa6ba1a8-7ac5-4529-9c80-992f3163520c	\N
adeb47ba-a63f-4dfb-a4e7-4e3586b9e083	0	2	\N	\N	438a233f-ea9a-403e-b410-4701d52f9840	\N
adecb515-24ca-473f-99ae-88cfebbd6928	0	2	\N	\N	c7e5a917-d559-4bc8-a5c0-285ada20e59f	\N
af7734f2-bfd2-4d80-87b6-f496bd57cb0e	0	2	\N	\N	28c79845-4fac-4a03-bb78-b1c65646f573	\N
b2e79ff3-e6f3-4388-a62a-a82fb3e4ab63	0	1	\N	\N	bf34f5c4-718e-4bbf-b2b5-c910a0fdbd96	\N
b4959df8-a59f-41a1-b3b9-69dbf87a19ee	0	3	\N	\N	4c601673-f370-47fd-93f3-6888d9b3576d	\N
b5822a82-78df-4bd1-9754-23ee623b5513	0	2	\N	\N	25c7c63d-ce2c-49e5-961b-34afc75748b0	\N
b98a278c-2b86-4e15-b96d-531e510d42cb	0	1	\N	\N	8569cfb9-3fb7-4dee-8d04-a87c6865c2a3	\N
b9d727ca-d22f-47ea-8bf9-56aea31a3fcd	0	1	\N	\N	2709335f-edbd-40c6-9234-6b990b489a4f	\N
bc9a2bcb-02a9-4951-9ee0-870966dfa608	0	1	\N	\N	34a8b0e5-b1fc-43f7-9873-dc6a2847a9fb	\N
bcd69a56-6410-46fd-b626-9aacef15a3f1	0	1	\N	\N	376b6a6c-1ed1-4811-a37a-cfaff7abbcb1	\N
bcf652e4-b5a2-4735-b7fc-ab6051747ab9	0	3	\N	\N	d2e197a6-e355-4602-9d8b-8b8fba40affb	\N
bd7ff1f5-ef6e-4117-8d11-95ab227d971a	0	2	\N	\N	58ba81ca-84dd-47c3-ac1d-81f4f216a04e	\N
bde6f4a8-3310-41a0-866a-ddc4b93a7d6d	0	3	\N	\N	28c79845-4fac-4a03-bb78-b1c65646f573	\N
bec91856-e1a6-45d2-af50-493f2a56e34b	0	3	\N	\N	8b3d92f6-12de-42ed-a99e-36ddb2b4d3a6	\N
c2f2b95d-1e00-4ea5-9f72-c4317aed269e	0	2	\N	\N	c06a2ec9-d72d-4b24-845b-808f63c584fd	\N
c37d284d-802b-41dc-bd1c-ea3f15f0dcf3	0	3	\N	\N	f13278c7-4b88-40f3-8d2b-452b3e9db834	\N
c49f1b07-3df8-47e5-b7b3-37f819e488a2	0	3	\N	\N	c023230c-7e8f-454b-bcc4-b9156210b8e3	\N
c543755a-6ef2-4757-8354-4eae5b4dd65f	0	1	\N	\N	c61ddc73-01d7-4e35-a7c0-cb394b174f9b	\N
c6c0b1ff-e715-4788-bbb2-948bcf16bad9	0	1	\N	\N	1251b9c3-dec5-4089-a9b0-36288eade6fa	\N
cda21ec8-a48f-4e7c-a7c8-a0c55c8e5b2c	0	2	\N	\N	8b3d92f6-12de-42ed-a99e-36ddb2b4d3a6	\N
cf56166c-ad6c-4788-bdaa-40791d8b011b	0	3	\N	\N	a7f50f62-cd0e-42f2-914c-19cc591bc293	\N
d07ed0cd-c832-4bb7-b05e-3e1f94a0a524	0	2	\N	\N	9565f107-1cf7-4c78-a634-20fbe629ede3	\N
d0933dd0-7fb9-4fec-8e24-36f3dc4ae6a8	0	3	\N	\N	ec2b0ef5-3fe9-48c3-b2ce-58215ba0b84f	\N
d7ea4d02-9507-4f6f-80b5-f63854da3f7d	0	2	\N	\N	1b18eec9-23a7-4557-8335-635237b5700e	\N
d963944b-2af6-45f9-b934-dfe3aa0ab66c	0	2	\N	\N	d2e197a6-e355-4602-9d8b-8b8fba40affb	\N
db8d6c1b-0f84-44ef-8c9d-cd24790d2e31	0	3	\N	\N	757818ff-276c-4891-b2df-f3835274affc	\N
dc72abd7-075a-409c-a55e-8d65e4a6666a	0	2	\N	\N	974f49b6-5b57-4bb3-84df-a334496a53be	\N
dccfc156-1cfa-4c61-906f-cf3a366d801d	0	3	\N	\N	c61ddc73-01d7-4e35-a7c0-cb394b174f9b	\N
dd8bf7dd-e6e6-47fb-bffe-72cbcea1c432	0	3	\N	\N	c5af84e8-6f04-4015-82a8-d62d168c42fa	\N
dde52798-28b5-4ac6-8f31-352ac181eb85	0	2	\N	\N	c023230c-7e8f-454b-bcc4-b9156210b8e3	\N
de6d15da-29b4-4344-b397-5d9a8ade6733	0	1	\N	\N	e8046ff9-dafb-4cac-81ec-123ff61c7a86	\N
de8a3e4d-2063-46e4-a261-c5c8046a7ad3	0	3	\N	\N	34a8b0e5-b1fc-43f7-9873-dc6a2847a9fb	\N
dfef292e-5d02-4106-827b-136e9568d95e	0	1	\N	\N	6aab81d6-3466-4962-abe4-a84821e69408	\N
e14b5705-c7d3-4316-8a2f-aa2012cf6d2b	0	3	\N	\N	0ca26f98-afe2-4741-a619-43ead8a24082	\N
e1c316c4-9620-4974-91db-fbce81e3de41	0	2	\N	\N	c5af84e8-6f04-4015-82a8-d62d168c42fa	\N
e215d476-78cd-48d9-834d-7ff7ddf70a9b	0	2	\N	\N	d7297b54-b255-4f4d-a087-7d4790433d3f	\N
e3264be7-2cc2-4c74-b51e-9819ed9879a2	0	3	\N	\N	5a2e337d-e27d-46cf-8489-3e980447a88d	\N
eac7e9eb-826c-41ff-ba9b-c31dbb5bf39b	0	3	\N	\N	438a233f-ea9a-403e-b410-4701d52f9840	\N
eae95caa-37fe-49ba-b004-77a90a0c480a	0	1	\N	\N	ec2b0ef5-3fe9-48c3-b2ce-58215ba0b84f	\N
ef9707af-1599-4713-8618-035a933833c0	0	3	\N	\N	256ccac3-b183-400b-81f2-eac785f11e8e	\N
f17cf728-bd24-4f33-b9e1-0899b6f73f59	0	2	\N	\N	f13278c7-4b88-40f3-8d2b-452b3e9db834	\N
f2c0bd52-46b2-4b21-b706-80c1b5e47a43	0	2	\N	\N	68d51968-0210-468e-b59c-bfd4dc1bab51	\N
f41e0d0a-ec4c-4fcb-8eb6-c130c4ac1b79	0	1	\N	\N	1f78214c-1fb3-430d-a60c-043f4cd8e68c	\N
f7430d0a-3ff9-47f0-b18b-d99ace4debb8	0	2	\N	\N	1251b9c3-dec5-4089-a9b0-36288eade6fa	\N
f77c1660-3749-4202-9e69-0eb7994df6b6	0	2	\N	\N	256ccac3-b183-400b-81f2-eac785f11e8e	\N
f797fde2-4738-4377-86d1-8bff2f8d739e	0	2	\N	\N	a1f2c048-5c9b-49fd-8a6d-57234fc65556	\N
f9541c3c-f833-43e3-9300-c950b132e12d	0	1	\N	\N	8b3d92f6-12de-42ed-a99e-36ddb2b4d3a6	\N
f9821ecf-74b5-4967-8665-39df14d33a12	0	2	\N	\N	6e6a687d-dc90-4938-ba6d-37e2bab751d5	\N
f9c6a20f-7689-41fc-8aae-4e190ca70655	0	2	\N	\N	f14f8296-3a9e-4830-8f3f-0725714be8cd	\N
faddae48-3320-4ae7-ba52-519686f7721d	0	2	\N	\N	34b8419e-1e12-49d0-b7cf-1ecfbd2ceb34	\N
fb135126-8afb-43dd-947b-899ac81a8dfe	0	1	\N	\N	f14f8296-3a9e-4830-8f3f-0725714be8cd	\N
fbe44095-f7a2-4b04-88b0-c24117714cf1	0	2	\N	\N	90ccbdb9-fec8-463a-a0f9-d46b819ac32e	\N
fe76f4be-0efc-431a-a4de-0e2da802ee06	0	1	\N	\N	5a2e337d-e27d-46cf-8489-3e980447a88d	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0556beba-3541-49e5-8f06-f82c58f6e62f	56	400	t	f	9fd97670-50ec-4b60-9f6d-e1ec1c285a53	b05582b9-6554-49d1-915b-ada157318958	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
05b82b6d-0d36-4d0e-915a-1a04b8622345	52	1200	t	f	8ea6debd-6bb0-4d40-a2d3-77a44b3168ae	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
0966402c-824f-4ae3-8a7f-8b89bbd3efdf	39	280	t	f	107b0dbb-f5b7-448e-a528-cccd6c4013eb	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
0b5eefad-1017-4ac5-8db5-359d260dca44	18	4000	t	f	38269083-2f70-4f70-9853-141140aa537c	16eee35f-d343-460f-9a87-d719c86c0c66	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
0cf9c0bf-cc8e-4b42-87b2-ad40a026d795	2	1880	t	f	ca3748ec-e22d-4aa9-be51-471bf8257a2d	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
14ab5dc4-3410-44f3-a288-7f244c180f03	57	400	t	f	8989bd26-f2a8-4a10-999e-2625ab8b5058	3d399679-886e-4baf-a2cc-0cb2d2666ed4	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
35085877-d5b7-447d-8f1c-43294c92f9ba	39	280	t	f	71dcefd4-0e81-402a-821e-ca65adbd0bb9	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
3c3100eb-a7a6-43ff-9fa1-c66cba8d8eca	39	280	t	f	c336da9c-e607-44e4-bb30-3404b09b856f	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
3c58a8e4-91b7-4923-831b-c03eebe9ef3b	18	4000	t	f	5faca089-ced7-49e5-a71f-709b96c6fb4c	16eee35f-d343-460f-9a87-d719c86c0c66	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
413e8aec-9108-4d8d-ae7f-cdc0d095c33c	58	900	t	f	169dc121-743b-4839-b679-b0010ed804fa	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
51c77cf5-af14-4fa7-851c-0e5333b158ce	39	280	t	f	dfdb6ca0-b363-4764-9fce-93918f20c753	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
52c440c6-e0e3-40d6-ab14-e75b8f056f70	2	1880	t	f	1a918264-b12e-472a-ad9b-a26f539bab33	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
5f0d90ed-269b-49e7-ac29-25780ab1d198	39	280	t	f	16b8e4cf-7639-470d-8767-c54c6de94209	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
6c19a852-4d5e-43b9-86db-fe654d6b3868	58	900	t	f	4f69298e-a587-4d64-96b9-1beb5527a45d	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
7451a0bc-d9ce-453b-bd8b-97671502e55d	52	1200	t	f	0575128f-4557-4274-8c56-2808329227e6	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
7a0dee7b-4af3-460d-9293-400e5fa2dba7	55	400	t	f	4f69298e-a587-4d64-96b9-1beb5527a45d	b014ad48-db05-4ab6-befa-145a09d08570	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
7ae3b29f-7f2f-48e8-b2cd-b5c7137ead2f	2	1880	t	f	16cbe333-ce68-4a15-955b-8da378ae60a9	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
7b1febd4-5581-4cfe-9d62-61cc3a5a43f4	1	1900	t	f	fe6e1da4-acff-4b1c-a6e7-f6dcd231e474	d031b6b5-b334-476b-9fda-b3a1725a03cb	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
7d0c0a49-f8d7-4b2d-89c9-ae0aa4210665	56	400	t	f	6e2905ff-9aba-49f1-b532-3b412cc3784e	b05582b9-6554-49d1-915b-ada157318958	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
869eba1e-8db7-4884-ab46-c8f9e0027693	54	400	t	f	13e5c1bf-232c-4c00-b346-886ee2534c8b	5a77ac29-9a17-4b33-8ca0-21de40bf199e	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
8c47475e-f439-45fb-832f-9e70d84109b6	55	400	t	f	fd802e02-e6d1-4da0-ae4c-24140be3ea17	b014ad48-db05-4ab6-befa-145a09d08570	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
8c527d3b-3038-4250-a5ec-c9f25c0a67f6	18	4000	t	f	55609051-b26d-4e80-b14e-25f7a27f5ed7	16eee35f-d343-460f-9a87-d719c86c0c66	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
948b0450-6b3d-41cf-bffb-a5e1a7d54552	58	900	t	f	fd802e02-e6d1-4da0-ae4c-24140be3ea17	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
97644c1a-9b77-43f4-b0ca-648044433159	52	1200	t	f	760b6c71-4af7-4129-a207-2904fc2674af	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
9bbdf1f5-dfaa-40a0-9291-4054939bdcbe	2	1880	t	f	e90ec6cc-bb42-4e86-9132-7de4fcafddc6	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
9d734669-d855-4f32-a6a9-eb51972fe7dd	2	1880	t	f	97754c62-4db9-4957-b913-cc3b2935b5b9	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
9eebf270-0839-4b94-93c7-c747f0041cff	57	400	t	f	169dc121-743b-4839-b679-b0010ed804fa	3d399679-886e-4baf-a2cc-0cb2d2666ed4	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
a10d330e-cfe0-4d5e-860a-756a6c1b6124	39	280	t	f	95048ab0-bc59-40f1-9004-49054e206f4d	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
a47b4058-d5e8-47d2-883c-17aa61b53b35	18	4000	t	f	71dcefd4-0e81-402a-821e-ca65adbd0bb9	16eee35f-d343-460f-9a87-d719c86c0c66	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
a49dbc5c-348e-4840-a0f1-29844286b9fc	52	1200	t	f	adbdbf2b-e786-478a-aec5-249bcb6f402a	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
a8e5afa2-6b98-4549-b091-4c50e88342fb	52	1200	t	f	5a962f10-f4e2-4005-be93-568a0a5c31f4	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
ab2bdbf5-044b-46c1-91d7-271b73bf8474	18	4000	t	f	928fe228-870e-437c-b511-17f7118e11cd	16eee35f-d343-460f-9a87-d719c86c0c66	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
abafc8bc-4b52-4e8d-afff-fe8df24dc562	58	900	t	f	6e2905ff-9aba-49f1-b532-3b412cc3784e	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
ac208ecc-d5f1-4769-9f64-04bcc8191097	39	280	t	f	37431242-8d8a-4cb6-8695-0238cc563081	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
afcd6988-adb9-4ca5-82b5-569fb894bee4	58	900	t	f	9fd97670-50ec-4b60-9f6d-e1ec1c285a53	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
b0807a0f-df7a-4ada-a218-6f972fbd6c2b	54	400	t	f	c3b1fb6f-cb70-4656-a679-4f48da4a84d6	5a77ac29-9a17-4b33-8ca0-21de40bf199e	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
b1776e8a-d214-4f5e-b936-455e3a3a5969	58	900	t	f	13e5c1bf-232c-4c00-b346-886ee2534c8b	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
b66ab847-3ed1-42bc-8b41-8d280cbc186f	48	1900	t	f	1342fc75-c419-451c-abb0-3e0ea50e23ce	808e657c-9a43-4587-a203-819fae93b026	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
bfd3c915-be8c-4d66-a143-279c93e94297	2	1880	t	f	843219f2-352e-4cd1-8f61-c03090c5eec8	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
cc72c277-d02a-44e1-b670-27e7bd0f5ede	39	280	t	f	55609051-b26d-4e80-b14e-25f7a27f5ed7	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
d40f20c8-6c14-41d2-963c-b9d27b42b571	48	1900	t	f	550e220c-f0d1-451f-b0d0-164a4b409742	808e657c-9a43-4587-a203-819fae93b026	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
d43077ee-6972-4881-abf0-5ebe0b4a1981	39	280	t	f	86876380-33de-45e6-a8f6-545eae054d9a	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
da47f819-084f-40ae-9ebb-7c214b5db418	1	1900	t	f	843219f2-352e-4cd1-8f61-c03090c5eec8	d031b6b5-b334-476b-9fda-b3a1725a03cb	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
dbf00fa8-8f1e-4221-8bdb-14674d1a9af6	2	1880	t	f	fe6e1da4-acff-4b1c-a6e7-f6dcd231e474	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
dcb53eea-71a1-4c3d-a6cd-b9835640cc42	1	1900	t	f	ca3748ec-e22d-4aa9-be51-471bf8257a2d	d031b6b5-b334-476b-9fda-b3a1725a03cb	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
e681a87f-c280-4e93-a227-6c85b3a20ccb	18	4000	t	f	86876380-33de-45e6-a8f6-545eae054d9a	16eee35f-d343-460f-9a87-d719c86c0c66	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
e86f2036-6c78-4584-91c2-19e01d06bf5b	1	1900	t	f	97754c62-4db9-4957-b913-cc3b2935b5b9	d031b6b5-b334-476b-9fda-b3a1725a03cb	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
e89cf688-0299-4c7c-873d-c4fe45e6ac07	58	900	t	f	8989bd26-f2a8-4a10-999e-2625ab8b5058	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
f18ca358-c188-4e77-ab40-b198592f9137	39	280	t	f	38269083-2f70-4f70-9853-141140aa537c	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
f4fc5dc2-c174-433c-bd97-0219614406d4	52	1200	t	f	59f12578-6b9e-4793-ab9c-8d9dfb6f3e2c	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
f7845498-6862-4d36-a4b1-0d10b3008fac	58	900	t	f	c3b1fb6f-cb70-4656-a679-4f48da4a84d6	ad630fd1-2236-4203-a67a-e54ec8472847	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
f85686f3-dbd3-4b46-a287-342c37017fd8	2	1880	t	f	85ea85fa-e1a0-4dc1-8a1f-59423eeb488d	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
12ad090a-444a-4b94-9f14-a2480df9fc7d	2	Инструкция 2	2
16eee35f-d343-460f-9a87-d719c86c0c66	18	Инструкция 18	18
3d399679-886e-4baf-a2cc-0cb2d2666ed4	57	Инструкция 57	57
5a77ac29-9a17-4b33-8ca0-21de40bf199e	54	Инструкция 54	54
808e657c-9a43-4587-a203-819fae93b026	48	Инструкция 48	48
883c9bd1-ea94-4ec1-89fd-77f9b19c0666	39	Инструкция 39	39
ad630fd1-2236-4203-a67a-e54ec8472847	58	Инструкция 58	58
b014ad48-db05-4ab6-befa-145a09d08570	55	Инструкция 55	55
b05582b9-6554-49d1-915b-ada157318958	56	Инструкция 56	56
c53858f7-21ba-418e-a0cb-af0fbd0d9412	52	Инструкция 52	52
d031b6b5-b334-476b-9fda-b3a1725a03cb	1	Инструкция 1	1
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
3d61705b-8201-4f88-b8f8-50695cd51267	75131-2801300-20	Поперечина рамы задняя	\N	2868425
7d784070-3fe0-4b1f-9c76-3d79698d20d7	7513D-2800010-20	Рама	\N	3330041
91111c6f-af19-4adb-9038-2718dbbd9752	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
66617ba3-bbc5-4997-8dad-e0dd25163436	b611a568-88bf-4cf0-8595-33262e64cccc
899dfb28-1e50-4855-920b-adf7ef1ba1e6	b611a568-88bf-4cf0-8595-33262e64cccc
3769e418-9d3f-4d55-aed9-21259eb2541b	2e316d54-7af4-4bc1-a5e3-95751dd033aa
deca126d-dfad-4658-a6fb-51e1120b736d	2e316d54-7af4-4bc1-a5e3-95751dd033aa
7139b526-6f06-42e5-9a63-646d8990a70e	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
893b2175-ec0a-41ac-a179-9e8e092824a8	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
9bffd989-3dc3-48ac-b99a-b8b77107cd2e	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
ccd52749-4611-4c4b-bbfc-aa1ce7d82e1c	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
f5134ed3-a217-465e-8b6e-88e9f562fd03	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
fbe1886e-fba7-44ee-8cac-97198f822d10	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
fcf1b045-1f8c-4a2c-a288-633f35938c33	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
feeed157-6784-414f-bc66-fa603883d6aa	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
a373b1a1-7534-4cfd-b2c2-f6bd92671db7	4ad17f29-68d6-40a5-b51a-b86bb6dd1f59
4ae91333-fecb-4e83-8626-ef076521b874	a88a47d8-9067-4fa4-ae57-42cc211c25a2
cd84277b-66d9-4d00-b328-dc3a87161daa	a2c6e4cc-fcc9-46c9-93a1-72ba526c84f0
094ee477-6fb7-404f-8340-6e5e0bfa540e	b611a568-88bf-4cf0-8595-33262e64cccc
8c33973b-b3bb-4807-b82a-207b627749ac	4ad17f29-68d6-40a5-b51a-b86bb6dd1f59
c5a13037-f50c-4821-9260-558c65e20da0	2e316d54-7af4-4bc1-a5e3-95751dd033aa
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
66617ba3-bbc5-4997-8dad-e0dd25163436	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
899dfb28-1e50-4855-920b-adf7ef1ba1e6	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
3769e418-9d3f-4d55-aed9-21259eb2541b	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
deca126d-dfad-4658-a6fb-51e1120b736d	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
7139b526-6f06-42e5-9a63-646d8990a70e	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
893b2175-ec0a-41ac-a179-9e8e092824a8	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
9bffd989-3dc3-48ac-b99a-b8b77107cd2e	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
ccd52749-4611-4c4b-bbfc-aa1ce7d82e1c	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
f5134ed3-a217-465e-8b6e-88e9f562fd03	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
fbe1886e-fba7-44ee-8cac-97198f822d10	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
fcf1b045-1f8c-4a2c-a288-633f35938c33	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
feeed157-6784-414f-bc66-fa603883d6aa	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
a373b1a1-7534-4cfd-b2c2-f6bd92671db7	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
4ae91333-fecb-4e83-8626-ef076521b874	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$htSqIRiRZ5Weszm1WKxRV0hzL1bjXco6ob6SIFO5v0fotFUS	\N	\N	\N	\N	\N	\N
cd84277b-66d9-4d00-b328-dc3a87161daa	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$3a4TTrSxf3cxcrYFrOkVOo7rxYOtUuMfwyhBcCCbxR0QmCxH	\N	\N	\N	\N	\N	\N
094ee477-6fb7-404f-8340-6e5e0bfa540e	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$qeovoaxXtfxhfXyZnBvs8hNHAPocAOMO7uctzVGzWuVb32yb	\N	\N	\N	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
8c33973b-b3bb-4807-b82a-207b627749ac	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$0hMzwZD359C023/MUDEis5pdHjVg0/TRRuqW8E8I2oUR8sEz	\N	\N	\N	\N	\N	\N
c5a13037-f50c-4821-9260-558c65e20da0	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$Rj0aHnXWlVyPUWHURnbI0Ll2HZEGfc+ZW0YMgO7MTx5EFSvG	\N	\N	\N	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0d33a1f9-bec9-47d4-9bbb-bda3f22b7bfc	1	Заполняющий	230	270	23	26	\N	\N	3d399679-886e-4baf-a2cc-0cb2d2666ed4	\N
2a2786f5-b084-426c-b032-e30b2b0e8ba1	1	Заполняющий	230	270	23	26	\N	\N	b05582b9-6554-49d1-915b-ada157318958	\N
51ec0533-0102-4bcd-b63d-1a7cc579c896	1	Заполняющий	230	270	23	26	\N	\N	d031b6b5-b334-476b-9fda-b3a1725a03cb	\N
6580fa86-fa15-42dc-848f-af21a0246e88	1	Заполняющий	230	270	23	26	\N	\N	883c9bd1-ea94-4ec1-89fd-77f9b19c0666	\N
69be46e2-5ab4-4581-a1d8-87e549f006a1	1	Заполняющий	230	270	23	26	\N	\N	12ad090a-444a-4b94-9f14-a2480df9fc7d	\N
6be17827-b79f-449f-b6e1-9400b619e6e2	1	Заполняющий	230	270	23	26	\N	\N	b014ad48-db05-4ab6-befa-145a09d08570	\N
76f7d627-8a88-430b-b9ad-0dfd3bfd3804	1	Заполняющий	230	270	23	26	\N	\N	c53858f7-21ba-418e-a0cb-af0fbd0d9412	\N
97905574-fd6a-4a15-8432-e8b79e5c1a4b	1	Заполняющий	230	270	23	26	\N	\N	808e657c-9a43-4587-a203-819fae93b026	\N
9a7f950c-9982-4d4a-b9b1-805b737f3567	1	Заполняющий	230	270	23	26	\N	\N	5a77ac29-9a17-4b33-8ca0-21de40bf199e	\N
9cfba2ce-d1ee-41db-8713-9b66908e540b	1	Заполняющий	230	270	23	26	\N	\N	16eee35f-d343-460f-9a87-d719c86c0c66	\N
ee90e2df-927b-4e3c-93b6-5b111bed1d47	1	Заполняющий	230	270	23	26	\N	\N	ad630fd1-2236-4203-a67a-e54ec8472847	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
becaed8f-0133-4cc9-bab5-8e6195184bbd	1	Корневой	82	0.11	0.68	f	f	t	4d65888d-636c-4b55-8397-fbf6d663b658	14b9bf38-58a6-40a8-9c68-5ff6edbad82c	\N
ef262d14-564a-4398-afb1-c0a7078ff59b	1	Корневой	82	0.11	0.68	f	f	t	09a01721-4f65-4a40-9b1a-4fb6e80a2ba9	e8f974a1-c933-4ef9-b643-18c0d258824a	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
1ea3a283-9cf4-49ea-ba6f-0776941898b7	744ae95f-3e64-4c24-9a7e-8545466097f4
1ea3a283-9cf4-49ea-ba6f-0776941898b7	8b964514-a1d1-4e72-84a2-10d0eb2c692e
781279a0-6424-404a-81f4-ed4d3d4cbbdc	cacc8e06-c5cb-4d3c-8345-9a2ba9a96237
7a3c427d-fc05-4f1d-b7f7-d15b316d4766	744ae95f-3e64-4c24-9a7e-8545466097f4
7a3c427d-fc05-4f1d-b7f7-d15b316d4766	8b964514-a1d1-4e72-84a2-10d0eb2c692e
b6204aa8-dbf6-4c60-a306-cbca8948b5ea	744ae95f-3e64-4c24-9a7e-8545466097f4
b6204aa8-dbf6-4c60-a306-cbca8948b5ea	8b964514-a1d1-4e72-84a2-10d0eb2c692e
b929f47a-cfba-40a5-8533-4beb81445c7c	cacc8e06-c5cb-4d3c-8345-9a2ba9a96237
c937319c-f487-43f8-8ff0-ed061f709b94	ae24bbf2-a16c-418e-9d35-2cd48f97e54f
d19b3737-2f26-446d-9d52-c0f32e53d051	744ae95f-3e64-4c24-9a7e-8545466097f4
d19b3737-2f26-446d-9d52-c0f32e53d051	8b964514-a1d1-4e72-84a2-10d0eb2c692e
fe766f73-8219-429f-aee8-ab5456e78728	ae24bbf2-a16c-418e-9d35-2cd48f97e54f
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
1ea3a283-9cf4-49ea-ba6f-0776941898b7	fcf1b045-1f8c-4a2c-a288-633f35938c33	\N	146164
781279a0-6424-404a-81f4-ed4d3d4cbbdc	fbe1886e-fba7-44ee-8cac-97198f822d10	\N	117390
7a3c427d-fc05-4f1d-b7f7-d15b316d4766	9bffd989-3dc3-48ac-b99a-b8b77107cd2e	\N	150882
b6204aa8-dbf6-4c60-a306-cbca8948b5ea	7139b526-6f06-42e5-9a63-646d8990a70e	\N	114729
b929f47a-cfba-40a5-8533-4beb81445c7c	ccd52749-4611-4c4b-bbfc-aa1ce7d82e1c	\N	121267
c937319c-f487-43f8-8ff0-ed061f709b94	feeed157-6784-414f-bc66-fa603883d6aa	\N	122575
d19b3737-2f26-446d-9d52-c0f32e53d051	f5134ed3-a217-465e-8b6e-88e9f562fd03	\N	150838
fe766f73-8219-429f-aee8-ab5456e78728	893b2175-ec0a-41ac-a179-9e8e092824a8	\N	132695
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
744ae95f-3e64-4c24-9a7e-8545466097f4	0f7427f4-a2d7-435a-ad70-73ce608d7a51
744ae95f-3e64-4c24-9a7e-8545466097f4	6b330dff-c21c-4e5a-aa09-4b272d0050fc
744ae95f-3e64-4c24-9a7e-8545466097f4	d03ae7c5-25ef-458d-8c5e-ea0c5dd7590f
744ae95f-3e64-4c24-9a7e-8545466097f4	f4118bf8-1024-4c98-aab8-36a4d7ef08a1
8b964514-a1d1-4e72-84a2-10d0eb2c692e	0f7427f4-a2d7-435a-ad70-73ce608d7a51
8b964514-a1d1-4e72-84a2-10d0eb2c692e	6b330dff-c21c-4e5a-aa09-4b272d0050fc
8b964514-a1d1-4e72-84a2-10d0eb2c692e	d03ae7c5-25ef-458d-8c5e-ea0c5dd7590f
8b964514-a1d1-4e72-84a2-10d0eb2c692e	f4118bf8-1024-4c98-aab8-36a4d7ef08a1
ae24bbf2-a16c-418e-9d35-2cd48f97e54f	c5e6f537-23f0-46a9-badb-faa70992c755
ae24bbf2-a16c-418e-9d35-2cd48f97e54f	f4118bf8-1024-4c98-aab8-36a4d7ef08a1
cacc8e06-c5cb-4d3c-8345-9a2ba9a96237	8b8f740f-0095-464d-bcca-98f956b3630b
cacc8e06-c5cb-4d3c-8345-9a2ba9a96237	d03ae7c5-25ef-458d-8c5e-ea0c5dd7590f
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
744ae95f-3e64-4c24-9a7e-8545466097f4	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	de5b97dc-4df9-4379-acc2-11478dd40564	49283
8b964514-a1d1-4e72-84a2-10d0eb2c692e	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	de5b97dc-4df9-4379-acc2-11478dd40564	49141
ae24bbf2-a16c-418e-9d35-2cd48f97e54f	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	de5b97dc-4df9-4379-acc2-11478dd40564	49286
cacc8e06-c5cb-4d3c-8345-9a2ba9a96237	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	de5b97dc-4df9-4379-acc2-11478dd40564	49232
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
09a01721-4f65-4a40-9b1a-4fb6e80a2ba9	2023-03-08 19:46:13.365891	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	744ae95f-3e64-4c24-9a7e-8545466097f4	b929f47a-cfba-40a5-8533-4beb81445c7c	de5b97dc-4df9-4379-acc2-11478dd40564	\N
4d65888d-636c-4b55-8397-fbf6d663b658	2023-03-08 19:46:13.365807	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	744ae95f-3e64-4c24-9a7e-8545466097f4	b929f47a-cfba-40a5-8533-4beb81445c7c	de5b97dc-4df9-4379-acc2-11478dd40564	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
14b9bf38-58a6-40a8-9c68-5ff6edbad82c	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	b66ab847-3ed1-42bc-8b41-8d280cbc186f	b929f47a-cfba-40a5-8533-4beb81445c7c	de5b97dc-4df9-4379-acc2-11478dd40564	12aa9182-a04f-4f33-bc07-4f176aa3e063	\N
e8f974a1-c933-4ef9-b643-18c0d258824a	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	0b5eefad-1017-4ac5-8db5-359d260dca44	b929f47a-cfba-40a5-8533-4beb81445c7c	de5b97dc-4df9-4379-acc2-11478dd40564	12aa9182-a04f-4f33-bc07-4f176aa3e063	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
96c6b888-275b-49aa-ba66-fe4ff14a6452	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	6f54ba8a-ce97-49c3-8f4c-63b62c5cefd4	\N
e4e82405-1d4a-4e11-8b96-1d4e83496eb6	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	6f54ba8a-ce97-49c3-8f4c-63b62c5cefd4	\N
fbd24dca-10cd-4ccf-acb0-cc6759527810	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	6f54ba8a-ce97-49c3-8f4c-63b62c5cefd4	\N
3d5ae199-0c10-4dd2-8b3b-7f58bdfd2518	1	12:10:00	13:10:00	13:20:00	13:50:00	4abd6ffa-3b0a-40b8-9f77-a80f7d6a507c	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0f7427f4-a2d7-435a-ad70-73ce608d7a51	3690	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	3690
6b330dff-c21c-4e5a-aa09-4b272d0050fc	3550	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	3550
8b8f740f-0095-464d-bcca-98f956b3630b	3600	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	3600
c5e6f537-23f0-46a9-badb-faa70992c755	3510	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	3510
d03ae7c5-25ef-458d-8c5e-ea0c5dd7590f	3610	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	3610
f4118bf8-1024-4c98-aab8-36a4d7ef08a1	3500	\N	b2b6771a-b9e3-4350-8523-f49f83d66a05	3500
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
30f98574-14f5-4cb6-92a8-db953ce3b822	Сварочный цех	50	050
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

