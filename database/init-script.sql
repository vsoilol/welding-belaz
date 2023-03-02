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
f9edf148-1c79-45ff-bff3-3169087d61b4	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
30b9c6d6-594a-42b7-b221-4d6ae6ee4927	7afea02b-2725-40ef-a1b0-e056ed1481cf	940b4e18-023f-4a67-a350-3a3d6d33c7b2	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
4b52540d-75df-4192-92e2-b618f218e779	1	10	t	f9edf148-1c79-45ff-bff3-3169087d61b4	\N
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
0764b399-4ac3-4c6a-9df3-fa8d9d23a9d8	Плановый ремонт централизованными службами	\N
19875f2b-4f47-448c-93e0-6199af4229bf	Отсутствие заданий	\N
1e92f7f4-a9f0-4556-8616-a812ea044cf9	Сборочные операции	\N
268e0fa1-afe0-47fa-8ea4-84a771a07cfc	Отсутствие сотрудника ОТК	\N
3583e291-9d33-42a7-a09a-06879fd41047	Отсутствие энергоносителей	\N
4d3ad372-9d73-4f14-87c0-28ccfc3bfcdc	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
59cec7e5-2b0b-4b46-bc60-c422e1c3cd28	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
5c630e8c-d044-4cc2-839a-8cd55dcf92af	Отсутствие крана, транспорта	\N
5d8e814a-e72d-4db4-aa36-ea3da745c001	Изменение режимов, смена инструмента, приспособления	\N
686960ab-c0b9-4c2c-a630-7c280ce256ef	Установка, выверка, снятие детали	\N
70b9257e-1959-45c1-a5b4-9def88c27e6e	Работа по карте несоответствий	\N
7381a728-2212-4cef-a551-b36235745ef2	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
7fb9cc89-2258-40c7-9582-373771e69fac	Праздники и выходные	\N
836ee2f9-f973-49b5-ac81-2323dd3972a2	Обед	\N
8a91953d-8a09-47c9-ab91-426faf081659	Аварийный ремонт централизованными службами	\N
9979e698-183a-44a1-985d-a6902b799309	Отсутствие оператора в связи с необеспеченностью	\N
9cffcdb8-6a21-42cd-a4be-e4bf3d9b8884	Отсутствие материала, заготовок, деталей	\N
addbeb64-9b4e-4787-899d-064aa4895ed2	Отсутствие конструктора, технолога или ожидание его решения	\N
ae587032-bb7b-4e44-969a-27141fccbd64	Ознакомление с работой, документацией, инструктаж	\N
aedac362-957e-41b4-ad1c-3776759e4a8b	Нерабочее время по графику согласно сменности	\N
be15f555-a410-482b-ac40-30828b4d68c5	Неявка оператора (б/лист, отпуск, и пр.)	\N
d4030c01-6db9-47fa-b53d-ffb5b217a1f2	Работа с управляющей программой	\N
d801e3bb-470d-46f0-b16f-4ee410725503	Контроль на рабочем месте	\N
db871fa5-80d1-4d87-943c-9c3b8d8a4c47	Естественные надобности	\N
f7321bd7-467b-4865-a325-3ec18c4a642d	Установка, выверка, снятие детали	\N
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
02411c0b-54d7-4d5a-b2d7-99dbf1950594	2e636bb5-c6c5-4af1-8d82-c6de3aa52b14	219379
74ec8235-3875-40f2-9e86-17c24137ef7b	32f061ac-8d89-4790-b64e-58f4a7f0f19a	249550
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
26c72794-dc92-4dc7-8649-380fccb22550	f4c8407e-05c3-4dfc-9200-426cd906ee97	614962
62a936ff-5e07-4098-9147-a3da18b1bb9e	4f9c9e70-f976-446e-85da-f788766f60f0	\N
bad3a3e3-9c43-4a8e-bb8d-827489235dea	66694f76-e102-4b4f-be8e-a6461847b47e	610422
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
61722d26-dd35-48fd-a839-75924856c952	1	Пост 1	f263d96e-60ad-4e7c-bbb2-23128c6e4310	\N
bed04239-ba47-4461-9b8e-79d612d61908	2	Пост 2	72ba087a-a6f9-48af-9bdc-e089cb274351	\N
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
acd8364a-586a-44ea-b527-cca767b768ca	03429340-bb2f-430f-981e-b1442f51bd3e
30be526d-ef90-4fa9-a35f-61332d732309	08ccf889-c6ac-4943-9308-38b2479195af
f82c70e5-7c00-4e61-bb64-625f555b00a5	0f765005-b26b-4d94-abda-596f87a95746
acd8364a-586a-44ea-b527-cca767b768ca	0ff5d193-c5f2-4046-8ae4-f2a90027d40c
f82c70e5-7c00-4e61-bb64-625f555b00a5	17b60724-d739-4bc1-9ba1-697087dc647c
f82c70e5-7c00-4e61-bb64-625f555b00a5	2137ff93-4a39-4a4d-a692-4a98a1169cac
acd8364a-586a-44ea-b527-cca767b768ca	2bcbf24d-135f-42dc-bcb1-541dc8035a31
acd8364a-586a-44ea-b527-cca767b768ca	2d2d649e-b751-4576-b299-6e1020455508
28c4b9dd-f1d2-4068-8972-05757fa5736f	30be526d-ef90-4fa9-a35f-61332d732309
28c4b9dd-f1d2-4068-8972-05757fa5736f	32af1438-f775-40bd-9696-39164bb48beb
2bcbf24d-135f-42dc-bcb1-541dc8035a31	3851f60a-dc1c-44d6-9451-289547983820
03429340-bb2f-430f-981e-b1442f51bd3e	3f2883be-3374-4523-92bc-da578eb5eae9
ed7a2618-7986-4310-b370-4c8fa7d824b4	3fd3e9cc-d4e2-4953-bc11-16f384b7983a
acd8364a-586a-44ea-b527-cca767b768ca	45357c39-a015-4574-b963-74f42c103f87
32af1438-f775-40bd-9696-39164bb48beb	48c76ab9-90ef-4981-8804-4c17f03121af
28c4b9dd-f1d2-4068-8972-05757fa5736f	4e4d8345-9a91-41aa-82c0-96ac3d4d4bc6
877a4798-ed1c-420f-8ec2-cab3250ea658	4f07a40f-32b6-4cf2-af39-8c34a9574870
28c4b9dd-f1d2-4068-8972-05757fa5736f	5ecb7e83-97cb-4238-b11b-0f203529f9df
28c4b9dd-f1d2-4068-8972-05757fa5736f	6adae453-8a6f-4b6e-a91f-4281278120cf
28c4b9dd-f1d2-4068-8972-05757fa5736f	78a3bbed-2ee5-477c-b87c-8b35dc21610a
877a4798-ed1c-420f-8ec2-cab3250ea658	7b62ae29-2bd0-4168-a95c-191a6edac7f5
78a3bbed-2ee5-477c-b87c-8b35dc21610a	7b7384a8-5fde-471d-8e89-59a54ab1d254
78a3bbed-2ee5-477c-b87c-8b35dc21610a	7d00dca4-da86-43ab-ae49-8ca285b1ff29
28c4b9dd-f1d2-4068-8972-05757fa5736f	809f2cb4-0a40-4005-b8e2-3d3009e67545
acd8364a-586a-44ea-b527-cca767b768ca	877a4798-ed1c-420f-8ec2-cab3250ea658
acd8364a-586a-44ea-b527-cca767b768ca	8d2f7fe7-65fb-4906-8ad0-d4d1a0abd10a
f82c70e5-7c00-4e61-bb64-625f555b00a5	9f1d1464-8250-4b11-b084-c50faf78209e
f392c54e-f3b0-43dc-93d5-8153be6da734	ae22b539-f6c2-4c01-b35d-6bfb8d03ef34
acd8364a-586a-44ea-b527-cca767b768ca	af4c55a4-49c9-4f82-bafa-84fd87e4e1d8
28c4b9dd-f1d2-4068-8972-05757fa5736f	b3bb04da-bad0-4747-8cad-a9fd17e749fb
877a4798-ed1c-420f-8ec2-cab3250ea658	b865ba19-1b72-419a-95ea-2fc3b0ff4849
03429340-bb2f-430f-981e-b1442f51bd3e	b9b1c6e2-52a6-4fde-aae3-b816aba853c4
877a4798-ed1c-420f-8ec2-cab3250ea658	c3b09feb-d855-42d3-a3c8-c2af2a800b19
acd8364a-586a-44ea-b527-cca767b768ca	cbbe14f3-9636-44b8-bfe5-23f39220abf4
ed7a2618-7986-4310-b370-4c8fa7d824b4	d04d4969-e1a7-47ad-a1b0-5492f5928ce8
8d2f7fe7-65fb-4906-8ad0-d4d1a0abd10a	dd3a5638-226c-47a3-b593-85fd9455e4c2
acd8364a-586a-44ea-b527-cca767b768ca	dfa7a6ff-188f-4d95-b1cd-877fe556a76a
28c4b9dd-f1d2-4068-8972-05757fa5736f	e3625233-d938-4ecf-a16c-3f7fe6fa02f4
28c4b9dd-f1d2-4068-8972-05757fa5736f	e39b58dd-7bf1-4164-9561-c76fac5d2a9a
acd8364a-586a-44ea-b527-cca767b768ca	e91e24c5-7a13-4f83-b5f6-8b20d835710f
28c4b9dd-f1d2-4068-8972-05757fa5736f	ed7a2618-7986-4310-b370-4c8fa7d824b4
28c4b9dd-f1d2-4068-8972-05757fa5736f	f06c7913-d607-4c54-9d46-d7ebe5cf88de
acd8364a-586a-44ea-b527-cca767b768ca	f392c54e-f3b0-43dc-93d5-8153be6da734
28c4b9dd-f1d2-4068-8972-05757fa5736f	f82c70e5-7c00-4e61-bb64-625f555b00a5
f392c54e-f3b0-43dc-93d5-8153be6da734	fdb22a65-04a6-48cd-807c-242327aed13a
acd8364a-586a-44ea-b527-cca767b768ca	fe3f180e-b821-429c-9852-2512409a6e99
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
51102f24-89c3-45e9-b0f2-c78d17de2a9f	Сборка, сварка рам к/с г/п 120-130 т.	6	940b4e18-023f-4a67-a350-3a3d6d33c7b2	06
72ba087a-a6f9-48af-9bdc-e089cb274351	Сборка, сварка узл. и рам к/с г/п 120-220т	4	940b4e18-023f-4a67-a350-3a3d6d33c7b2	04
d48331f7-75a4-440f-845d-4d9aad57182b	Производственный участок 5	5	fe77afaf-9aca-4b5b-9407-622cfde3df57	05
f263d96e-60ad-4e7c-bbb2-23128c6e4310	Сборка, сварка мостов	1	940b4e18-023f-4a67-a350-3a3d6d33c7b2	01
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
03429340-bb2f-430f-981e-b1442f51bd3e	Лонжерон рамы правый	75131-2801016-70	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
08ccf889-c6ac-4943-9308-38b2479195af	Опора	75131-2801189	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
0f765005-b26b-4d94-abda-596f87a95746	Кронштейн задней опоры	75131-8521182-20	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
0ff5d193-c5f2-4046-8ae4-f2a90027d40c	Усилитель	75131-2801115-01	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
17b60724-d739-4bc1-9ba1-697087dc647c	Поперечина	75131-2801325	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
2137ff93-4a39-4a4d-a692-4a98a1169cac	Лист верхний	75131-2801357-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
28c4b9dd-f1d2-4068-8972-05757fa5736f	Рама	7513D-2800010-20	t	1	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	4536492774
2bcbf24d-135f-42dc-bcb1-541dc8035a31	Лонжерон рамы правый	75131-2801014-41	t	2	27365db1-2dc2-40d2-8f87-155cc93b7606	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
30be526d-ef90-4fa9-a35f-61332d732309	Лонжерон рамы левый	75131-2801015-41	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
3851f60a-dc1c-44d6-9451-289547983820	Опора	75131-2801188	t	3	27365db1-2dc2-40d2-8f87-155cc93b7606	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
3f2883be-3374-4523-92bc-da578eb5eae9	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
3fd3e9cc-d4e2-4953-bc11-16f384b7983a	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
45357c39-a015-4574-b963-74f42c103f87	Усилитель	75131-2801114-01	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
48c76ab9-90ef-4981-8804-4c17f03121af	Опора	75131-2801188	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
4e4d8345-9a91-41aa-82c0-96ac3d4d4bc6	Поперечина	75131-2801325	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
4f07a40f-32b6-4cf2-af39-8c34a9574870	Поперечина	75131-2801325	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
5ecb7e83-97cb-4238-b11b-0f203529f9df	Усилитель	75131-2801115-01	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
6adae453-8a6f-4b6e-a91f-4281278120cf	Усилитель	75131-2801114-01	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
78a3bbed-2ee5-477c-b87c-8b35dc21610a	Лонжерон рамы правый	75131-2801016-70	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
7b62ae29-2bd0-4168-a95c-191a6edac7f5	Лист верхний	75131-2801357-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
7b7384a8-5fde-471d-8e89-59a54ab1d254	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
7d00dca4-da86-43ab-ae49-8ca285b1ff29	Опора	75131-2801188	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
809f2cb4-0a40-4005-b8e2-3d3009e67545	Кронштейн задней опоры	75131-8521182-20	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
877a4798-ed1c-420f-8ec2-cab3250ea658	Поперечина рамы задняя	75131-2801300-20	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
8d2f7fe7-65fb-4906-8ad0-d4d1a0abd10a	Лонжерон рамы левый	75131-2801015-41	t	2	27365db1-2dc2-40d2-8f87-155cc93b7606	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
9f1d1464-8250-4b11-b084-c50faf78209e	Кронштейн задней опоры	75131-8521183-20	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
acd8364a-586a-44ea-b527-cca767b768ca	Рама	75131-2800010-70	t	1	27365db1-2dc2-40d2-8f87-155cc93b7606	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	4536479362
ae22b539-f6c2-4c01-b35d-6bfb8d03ef34	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
af4c55a4-49c9-4f82-bafa-84fd87e4e1d8	Поперечина №3 рамы с опорами	75132-2801152	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
b3bb04da-bad0-4747-8cad-a9fd17e749fb	Лист верхний	75131-2801357-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
b865ba19-1b72-419a-95ea-2fc3b0ff4849	Кронштейн задней опоры	75131-8521182-20	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
b9b1c6e2-52a6-4fde-aae3-b816aba853c4	Опора	75131-2801188	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
c3b09feb-d855-42d3-a3c8-c2af2a800b19	Кронштейн задней опоры	75131-8521183-20	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
cbbe14f3-9636-44b8-bfe5-23f39220abf4	Кронштейн задней опоры	75131-8521182-20	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
d04d4969-e1a7-47ad-a1b0-5492f5928ce8	Опора	75131-2801189	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
dd3a5638-226c-47a3-b593-85fd9455e4c2	Опора	75131-2801189	t	3	27365db1-2dc2-40d2-8f87-155cc93b7606	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
dfa7a6ff-188f-4d95-b1cd-877fe556a76a	Поперечина	75131-2801103-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
e3625233-d938-4ecf-a16c-3f7fe6fa02f4	Поперечина №3 рамы с опорами	75132-2801152	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
e39b58dd-7bf1-4164-9561-c76fac5d2a9a	Поперечина	75131-2801103-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
e91e24c5-7a13-4f83-b5f6-8b20d835710f	Поперечина	75131-2801325	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
ed7a2618-7986-4310-b370-4c8fa7d824b4	Лонжерон рамы левый	75131-2801017-70	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
f06c7913-d607-4c54-9d46-d7ebe5cf88de	Лист нижний	75131-2801358-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
f392c54e-f3b0-43dc-93d5-8153be6da734	Лонжерон рамы левый	75131-2801017-70	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
f82c70e5-7c00-4e61-bb64-625f555b00a5	Поперечина рамы задняя	75131-2801300-20	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
fdb22a65-04a6-48cd-807c-242327aed13a	Опора	75131-2801189	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
fe3f180e-b821-429c-9852-2512409a6e99	Лист верхний	75131-2801357-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N	\N	\N
2d2d649e-b751-4576-b299-6e1020455508	Лист нижний	75131-2801358-10	t	3	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	bad3a3e3-9c43-4a8e-bb8d-827489235dea	\N	\N	\N
32af1438-f775-40bd-9696-39164bb48beb	Лонжерон рамы правый	75131-2801014-41	t	2	b09e0181-9c1f-4c53-8c91-baa330dd0b2a	51102f24-89c3-45e9-b0f2-c78d17de2a9f	bad3a3e3-9c43-4a8e-bb8d-827489235dea	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
65e97f7e-97e4-44a8-92af-56a9d8fd7665	Admin	\N
c8d05e07-d70b-491d-9828-5247a655cad2	Master	\N
87ff7b09-cb16-4e84-ba61-64ed0814a137	Welder	\N
ad486d69-7e98-4794-918a-ed6a9efe6f9b	Inspector	\N
fae65a47-35db-4152-9698-fee545555f7f	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
002929e9-c228-48d6-bb85-d68c6e1bd094	18	4000	t	f	32af1438-f775-40bd-9696-39164bb48beb	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
0e95fd16-00ed-421b-8ada-afa5bb54b1b2	2	1880	t	f	b3bb04da-bad0-4747-8cad-a9fd17e749fb	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
12d300d3-5a4c-4863-99dc-1227a8e3bd2f	1	1900	t	f	17b60724-d739-4bc1-9ba1-697087dc647c	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
131aa38c-e9c4-4d44-897f-2a7070c86ec5	2	1880	t	f	e91e24c5-7a13-4f83-b5f6-8b20d835710f	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
1354e90f-1405-423c-bbba-6f5bb3d674ee	2	1880	t	f	c3b09feb-d855-42d3-a3c8-c2af2a800b19	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
1a938467-435d-47df-b1bf-2d193680e15d	58	900	t	f	7d00dca4-da86-43ab-ae49-8ca285b1ff29	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
1c1d9916-77ef-4c32-a650-7083554ba115	39	280	t	f	8d2f7fe7-65fb-4906-8ad0-d4d1a0abd10a	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
1d3da8a3-d720-401e-8b39-32aa4550b3e1	39	280	t	f	30be526d-ef90-4fa9-a35f-61332d732309	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
20c928bd-f1e8-488d-a61d-9e69378898a9	58	1520	t	f	08ccf889-c6ac-4943-9308-38b2479195af	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
26851a77-5159-4439-8921-436a659c2b8e	54	400	t	f	48c76ab9-90ef-4981-8804-4c17f03121af	bf5bfd12-3142-4b00-82f9-fd41e3a04c01	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
2ab7451f-5e8f-4362-a053-ccf5c8670a09	52	1200	t	f	5ecb7e83-97cb-4238-b11b-0f203529f9df	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
32627cea-6347-4038-92ec-4ac2cb7340d1	1	1900	t	f	7b62ae29-2bd0-4168-a95c-191a6edac7f5	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
3489a617-ab65-4a83-a31a-f855958062cb	2	1880	t	f	cbbe14f3-9636-44b8-bfe5-23f39220abf4	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
34d33ee0-b294-4cff-ba3c-d2b158c72c04	54	400	t	f	3851f60a-dc1c-44d6-9451-289547983820	bf5bfd12-3142-4b00-82f9-fd41e3a04c01	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
37273e79-7fa0-4ca1-90a7-adbe29c384d9	2	1880	t	f	4e4d8345-9a91-41aa-82c0-96ac3d4d4bc6	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
376535f6-2056-4fa7-bee9-de2761378233	58	900	t	f	b9b1c6e2-52a6-4fde-aae3-b816aba853c4	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
3c64cad2-e5e0-49af-a662-9b270763e7c6	52	1200	t	f	dfa7a6ff-188f-4d95-b1cd-877fe556a76a	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
3e989092-915e-4576-906e-8e975f63d4eb	57	400	t	f	d04d4969-e1a7-47ad-a1b0-5492f5928ce8	100e8820-6bc0-4f78-9658-2c31b5454935	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
43509cb8-fad6-4cf4-8352-22591a8ade0e	57	400	t	f	fdb22a65-04a6-48cd-807c-242327aed13a	100e8820-6bc0-4f78-9658-2c31b5454935	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
54d530c6-3549-4d87-abbb-a7e165763bc5	2	1880	t	f	17b60724-d739-4bc1-9ba1-697087dc647c	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
59a9c267-8dee-406b-99c7-8eb0143c8c86	18	4000	t	f	8d2f7fe7-65fb-4906-8ad0-d4d1a0abd10a	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
5c0715bf-2927-454d-a4aa-e615954d5f3e	56	400	t	f	dd3a5638-226c-47a3-b593-85fd9455e4c2	bf5bfd12-3142-4b00-82f9-fd41e3a04c01	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
5dd403d9-2b94-4d18-a399-1d24b867f12e	48	1900	t	f	2d2d649e-b751-4576-b299-6e1020455508	dd42c8cc-a520-44ed-a328-3fcc05eb3f8d	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
63720d10-3fed-4eab-97f4-bb9296a3d3dd	2	1880	t	f	fe3f180e-b821-429c-9852-2512409a6e99	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
68731fc0-df5d-4ea6-867c-2dde2189e62e	2	1880	t	f	0f765005-b26b-4d94-abda-596f87a95746	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
74524497-b583-4ea3-af5b-93882ac5c33a	58	1520	t	f	48c76ab9-90ef-4981-8804-4c17f03121af	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
7c62b860-5699-4e01-8b73-bae1296aee66	1	1900	t	f	4f07a40f-32b6-4cf2-af39-8c34a9574870	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
7cc8eeac-9203-4618-933e-9086fa9269f6	18	4000	t	f	af4c55a4-49c9-4f82-bafa-84fd87e4e1d8	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
8337cfc3-bd61-4aa6-a098-6cc8da4a73bd	58	1520	t	f	dd3a5638-226c-47a3-b593-85fd9455e4c2	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
854e8f4f-a9fb-48ed-ba63-3ce449cbf6a9	52	1200	t	f	45357c39-a015-4574-b963-74f42c103f87	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
91463574-22e0-404d-a3ec-d4e59b2bd27f	2	1880	t	f	7b62ae29-2bd0-4168-a95c-191a6edac7f5	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
91f346f6-ae7e-4122-9f8d-dfdf756abfae	58	900	t	f	fdb22a65-04a6-48cd-807c-242327aed13a	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
9b06a2ea-cd76-418f-aac4-389d25e160cc	2	1880	t	f	809f2cb4-0a40-4005-b8e2-3d3009e67545	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
a2d80382-54c1-4f18-9a91-db5f0cc35e63	1	1900	t	f	4e4d8345-9a91-41aa-82c0-96ac3d4d4bc6	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
a4916897-1a88-4cbd-9f1a-96d95ed7b869	52	1200	t	f	e39b58dd-7bf1-4164-9561-c76fac5d2a9a	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	52
a5934731-3378-4fbd-8be9-c4e612817695	52	1200	t	f	0ff5d193-c5f2-4046-8ae4-f2a90027d40c	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
aae71447-f0e7-45ca-9b3a-a769412a5685	55	400	t	f	7d00dca4-da86-43ab-ae49-8ca285b1ff29	e194ee83-0fca-43ac-b8ad-609904ddc866	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
b417c230-6cb2-4c8f-ac7c-3d306d104836	1	1900	t	f	e91e24c5-7a13-4f83-b5f6-8b20d835710f	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
ba61d5c9-45f4-4cd6-af5f-7e72abfb8dfb	39	280	t	f	877a4798-ed1c-420f-8ec2-cab3250ea658	65994824-4eff-4328-87c8-fb9a10d6828f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
bb156858-3670-42a0-a943-eaddda2c825f	56	400	t	f	08ccf889-c6ac-4943-9308-38b2479195af	bf5bfd12-3142-4b00-82f9-fd41e3a04c01	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
bd4ca66e-8d07-4654-938c-dc7d0bfbd8fc	2	1880	t	f	4f07a40f-32b6-4cf2-af39-8c34a9574870	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
c164170b-16c7-4896-af46-65ab0f683b41	58	1520	t	f	3851f60a-dc1c-44d6-9451-289547983820	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
c29e833e-01fd-4a24-a3e2-144deec8172b	18	4000	t	f	e3625233-d938-4ecf-a16c-3f7fe6fa02f4	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
cab4fbfd-bcb6-4adf-a261-1c19f8fe0d8d	39	280	t	f	2bcbf24d-135f-42dc-bcb1-541dc8035a31	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
cca20363-0010-41d1-b75a-116e1a76bcd4	2	1880	t	f	b865ba19-1b72-419a-95ea-2fc3b0ff4849	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
d3e1cbfc-b324-4fb5-b7f7-c4645b001d7e	55	400	t	f	b9b1c6e2-52a6-4fde-aae3-b816aba853c4	e194ee83-0fca-43ac-b8ad-609904ddc866	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
d7541ab1-e004-485e-8267-43388312eaad	18	4000	t	f	30be526d-ef90-4fa9-a35f-61332d732309	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
d81fa12c-5c12-4f41-8a27-0b6ed2516ee6	39	280	t	f	32af1438-f775-40bd-9696-39164bb48beb	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
d89552cd-d40f-4351-a164-3454a923cf75	39	280	t	f	3f2883be-3374-4523-92bc-da578eb5eae9	65994824-4eff-4328-87c8-fb9a10d6828f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
dc3dab2a-1b93-470d-936f-4a8a6c8b1897	48	1900	t	f	f06c7913-d607-4c54-9d46-d7ebe5cf88de	dd42c8cc-a520-44ed-a328-3fcc05eb3f8d	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
e1512168-30ec-4788-afce-946a19d295e1	1	1900	t	f	b3bb04da-bad0-4747-8cad-a9fd17e749fb	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
e9c89d20-cae7-4218-8f51-ebe6bd83b25b	2	1880	t	f	9f1d1464-8250-4b11-b084-c50faf78209e	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
eac8ad6f-aa60-4bea-b28a-3854a0a91481	58	900	t	f	d04d4969-e1a7-47ad-a1b0-5492f5928ce8	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
eb02112d-d321-47a8-b752-dbfdbc8f50f1	39	280	t	f	ae22b539-f6c2-4c01-b35d-6bfb8d03ef34	65994824-4eff-4328-87c8-fb9a10d6828f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
ecb47a60-ed62-4ffb-96ed-3cfebff2187b	52	1200	t	f	6adae453-8a6f-4b6e-a91f-4281278120cf	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
f04dc1fd-bd61-4526-ac89-b1a2160ebd75	1	1900	t	f	fe3f180e-b821-429c-9852-2512409a6e99	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
f41d6f91-2fe0-42f5-b052-a84ff10daf22	2	1880	t	f	2137ff93-4a39-4a4d-a692-4a98a1169cac	b172c46f-473b-46d7-a939-56f5c6427b50	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
f4cde0f5-7a24-42cd-ba3f-f44cb75ee054	1	1900	t	f	2137ff93-4a39-4a4d-a692-4a98a1169cac	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
f50b4278-f9b1-4adc-9d08-9811c1c7b617	39	280	t	f	3fd3e9cc-d4e2-4953-bc11-16f384b7983a	65994824-4eff-4328-87c8-fb9a10d6828f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	39
f649c567-b8b4-4a94-a45e-b56fb7fabc60	39	280	t	f	f82c70e5-7c00-4e61-bb64-625f555b00a5	65994824-4eff-4328-87c8-fb9a10d6828f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
fdd7ced5-ca3b-497c-abef-5ab2438397a1	39	280	t	f	7b7384a8-5fde-471d-8e89-59a54ab1d254	65994824-4eff-4328-87c8-fb9a10d6828f	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
ffc2831f-8e9a-4e8a-9215-ae3adac6f363	18	4000	t	f	2bcbf24d-135f-42dc-bcb1-541dc8035a31	0abad024-8850-4776-9196-4791c73db9c1	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
0abad024-8850-4776-9196-4791c73db9c1	18	Инструкция 18	18
100e8820-6bc0-4f78-9658-2c31b5454935	57	Инструкция 57	57
39e56c67-29a3-462a-bebe-6cab1b9c9ce7	52	Инструкция 52	52
646b1ed0-fb5d-4151-a99e-63f5287a3df1	1	Инструкция 1	1
65994824-4eff-4328-87c8-fb9a10d6828f	39	Инструкция 39	39
6e892c20-f24a-40f2-b5c9-77f6f6b98c0e	56	Инструкция 56	56
b172c46f-473b-46d7-a939-56f5c6427b50	2	Инструкция 2	2
bf5bfd12-3142-4b00-82f9-fd41e3a04c01	54	Инструкция 54	54
c4bb0946-ea88-4421-b3f7-5c17d543891f	58	Инструкция 58	58
dd42c8cc-a520-44ed-a328-3fcc05eb3f8d	48	Инструкция 48	48
e194ee83-0fca-43ac-b8ad-609904ddc866	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
27365db1-2dc2-40d2-8f87-155cc93b7606	75131-2800010-70	Рама	\N	3291137
99d4fcef-fe93-4cb8-a172-879720fe5d1a	75131-2801300-20	Поперечина рамы задняя	\N	2868425
b09e0181-9c1f-4c53-8c91-baa330dd0b2a	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
2e636bb5-c6c5-4af1-8d82-c6de3aa52b14	ad486d69-7e98-4794-918a-ed6a9efe6f9b
32f061ac-8d89-4790-b64e-58f4a7f0f19a	ad486d69-7e98-4794-918a-ed6a9efe6f9b
4f9c9e70-f976-446e-85da-f788766f60f0	c8d05e07-d70b-491d-9828-5247a655cad2
66694f76-e102-4b4f-be8e-a6461847b47e	c8d05e07-d70b-491d-9828-5247a655cad2
f4c8407e-05c3-4dfc-9200-426cd906ee97	c8d05e07-d70b-491d-9828-5247a655cad2
2223a81b-6112-46fc-ab73-2beb9dc68db7	87ff7b09-cb16-4e84-ba61-64ed0814a137
57a99411-7576-4b24-9eee-9aa69b599d93	87ff7b09-cb16-4e84-ba61-64ed0814a137
8541a7ed-cb06-4dfc-938e-5661932f86cf	87ff7b09-cb16-4e84-ba61-64ed0814a137
906bd19c-3e70-41bd-8c3d-84f02dc2be5a	87ff7b09-cb16-4e84-ba61-64ed0814a137
b66e6df8-1221-42f2-8b32-3e91cd62b84f	87ff7b09-cb16-4e84-ba61-64ed0814a137
eeb61c68-c9f5-4824-88e6-5b8217e96148	87ff7b09-cb16-4e84-ba61-64ed0814a137
f22bb71c-1314-435c-a60c-c7bfa5a22769	87ff7b09-cb16-4e84-ba61-64ed0814a137
ff5b24fd-b3cc-4d0e-ab6d-1248d801dd04	87ff7b09-cb16-4e84-ba61-64ed0814a137
7afea02b-2725-40ef-a1b0-e056ed1481cf	fae65a47-35db-4152-9698-fee545555f7f
615c992d-9d5d-4241-8fd0-cb339ece1758	65e97f7e-97e4-44a8-92af-56a9d8fd7665
a83aa193-afa8-4086-996b-ada4ba3f5cf1	87ff7b09-cb16-4e84-ba61-64ed0814a137
a398eebd-7b03-41f4-a8d6-ad81c4258021	ad486d69-7e98-4794-918a-ed6a9efe6f9b
29fc3cf6-44d4-48db-b507-efa9f49b4de9	fae65a47-35db-4152-9698-fee545555f7f
b2eea4c2-81c3-461b-9ccf-160b37bad057	c8d05e07-d70b-491d-9828-5247a655cad2
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
2e636bb5-c6c5-4af1-8d82-c6de3aa52b14	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
32f061ac-8d89-4790-b64e-58f4a7f0f19a	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
4f9c9e70-f976-446e-85da-f788766f60f0	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
66694f76-e102-4b4f-be8e-a6461847b47e	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
f4c8407e-05c3-4dfc-9200-426cd906ee97	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
2223a81b-6112-46fc-ab73-2beb9dc68db7	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
57a99411-7576-4b24-9eee-9aa69b599d93	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
8541a7ed-cb06-4dfc-938e-5661932f86cf	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
906bd19c-3e70-41bd-8c3d-84f02dc2be5a	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
b66e6df8-1221-42f2-8b32-3e91cd62b84f	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
eeb61c68-c9f5-4824-88e6-5b8217e96148	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	D7:F1:7D:5A	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
f22bb71c-1314-435c-a60c-c7bfa5a22769	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	B7:5A:79:B5	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
ff5b24fd-b3cc-4d0e-ab6d-1248d801dd04	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	51102f24-89c3-45e9-b0f2-c78d17de2a9f	\N
7afea02b-2725-40ef-a1b0-e056ed1481cf	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
615c992d-9d5d-4241-8fd0-cb339ece1758	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$njWMzENyqCLQG7PbNsSZirP4Oq3/9qbUEBidYK5vy7anpLME	\N	\N	\N	\N	\N	\N
a83aa193-afa8-4086-996b-ada4ba3f5cf1	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$scjpisbNQBq1Mi6lxgBWia3++hGzL0NwFnn0QpDYksvwY/KK	\N	\N	\N	\N	\N	\N
a398eebd-7b03-41f4-a8d6-ad81c4258021	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$To3vwsFP82Vjm+A0T4wRSNDWtcQphq9fYDyQrfrsDNeemW2g	\N	\N	\N	\N	\N	\N
29fc3cf6-44d4-48db-b507-efa9f49b4de9	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$h9qmcFOe7W+8rY1C1Cz5b3x2YjSLJw5Ucs9gGgfzd1QGfNrJ	\N	\N	\N	\N	\N	\N
b2eea4c2-81c3-461b-9ccf-160b37bad057	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$GAUqsjDRSIngA4/JCieCp9fpOG/UmlWf7RjqVT2U7m0y9/6b	\N	\N	\N	\N	f263d96e-60ad-4e7c-bbb2-23128c6e4310	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
02f59993-5a88-4614-a72d-020691209e0b	1	Заполняющий	230	270	23	26	0	0	b172c46f-473b-46d7-a939-56f5c6427b50	\N
08a21543-6fd4-48ff-b2cb-e768f5083fbe	1	Заполняющий	230	270	23	26	0	0	100e8820-6bc0-4f78-9658-2c31b5454935	\N
309a63c9-376c-4536-b681-b6a510f15d9d	1	Заполняющий	230	270	23	26	0	0	6e892c20-f24a-40f2-b5c9-77f6f6b98c0e	\N
5c4a617e-de53-40b6-8fca-048da3cf6560	1	Заполняющий	230	270	23	26	0	0	e194ee83-0fca-43ac-b8ad-609904ddc866	\N
77d4ba7d-ecfe-4ad4-bf53-23f2b20dd5ca	1	Заполняющий	230	270	23	26	0	0	65994824-4eff-4328-87c8-fb9a10d6828f	\N
9ed9e68c-0dfb-401f-bda6-edc7bf23984e	1	Заполняющий	230	270	23	26	0	0	0abad024-8850-4776-9196-4791c73db9c1	\N
a664ce61-ed9b-47ce-91cc-bea34047a5f8	1	Заполняющий	230	270	23	26	0	0	c4bb0946-ea88-4421-b3f7-5c17d543891f	\N
ba2fb973-0e2a-435e-9721-f2366f821c89	1	Заполняющий	230	270	23	26	0	0	dd42c8cc-a520-44ed-a328-3fcc05eb3f8d	\N
d0d823d4-708b-41b8-8b4f-800034d31686	1	Заполняющий	230	270	23	26	0	0	646b1ed0-fb5d-4151-a99e-63f5287a3df1	\N
e9af8f94-28e3-45a6-95cb-6526059817cc	1	Заполняющий	230	270	23	26	0	0	39e56c67-29a3-462a-bebe-6cab1b9c9ce7	\N
fdaddebb-e82a-4e09-8d85-c7a4fc63e0b1	1	Заполняющий	230	270	23	26	0	0	bf5bfd12-3142-4b00-82f9-fd41e3a04c01	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
4165298d-dae2-46be-ba07-d10a77190a59	1	Корневой	82	0.11	0.68	\N	\N	\N	67e9d451-88a5-4cd9-b8a7-35260738ac25	cc4f38d1-bdb4-4233-af00-ca8879bf8d93	\N
4609dc9e-44ae-49cd-94b0-ffb44ad48665	1	Корневой	82	0.11	0.68	\N	\N	\N	9c98a80a-d70d-43f3-aede-9055bb831e35	438c4931-504e-49e2-a7a6-ee9400b2f03c	\N
a51bc9e0-eebe-4cab-8a7b-046ebe81f993	2	Заполняющий	100	0.22	0.44	\N	\N	\N	eb850e8b-e22f-49e6-b7fe-65328567a073	cc4f38d1-bdb4-4233-af00-ca8879bf8d93	\N
eb20755a-ba03-4831-938c-0aaa57f9ba67	2	Заполняющий	100	0.22	0.44	\N	\N	\N	31d31c1c-ae51-4a9d-89a7-cb5ddca0a03d	438c4931-504e-49e2-a7a6-ee9400b2f03c	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
3cdcfb9c-7cba-4f91-a826-36a8f8dc1482	28b4ba06-d2b0-47e3-8dfe-608ba45c5059
3cdcfb9c-7cba-4f91-a826-36a8f8dc1482	778840a8-f9a7-4984-9037-56943fa6d1a3
5916196b-6ad7-4af1-a7a7-94d6e5f05f60	28b4ba06-d2b0-47e3-8dfe-608ba45c5059
5916196b-6ad7-4af1-a7a7-94d6e5f05f60	778840a8-f9a7-4984-9037-56943fa6d1a3
857ce2aa-d8da-4a92-a68e-0a49f15faf33	28b4ba06-d2b0-47e3-8dfe-608ba45c5059
857ce2aa-d8da-4a92-a68e-0a49f15faf33	778840a8-f9a7-4984-9037-56943fa6d1a3
85b22642-bbb7-4cf5-95ea-0927f78af06a	28b4ba06-d2b0-47e3-8dfe-608ba45c5059
85b22642-bbb7-4cf5-95ea-0927f78af06a	778840a8-f9a7-4984-9037-56943fa6d1a3
cc74a2e7-ae60-4986-8e1c-216e6701efa5	480ede96-4825-4380-92a0-8d6580d65995
d482cea7-cb4c-4515-8d57-e4ac81dc9083	480ede96-4825-4380-92a0-8d6580d65995
f42b07a5-783b-47c7-8c31-542a35960fb4	73f99a07-9f26-4827-89fc-eafe49329277
f5eb7e39-b48c-4d9e-9183-68023ec1b92e	73f99a07-9f26-4827-89fc-eafe49329277
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
3cdcfb9c-7cba-4f91-a826-36a8f8dc1482	906bd19c-3e70-41bd-8c3d-84f02dc2be5a	\N	150882
5916196b-6ad7-4af1-a7a7-94d6e5f05f60	ff5b24fd-b3cc-4d0e-ab6d-1248d801dd04	\N	150838
857ce2aa-d8da-4a92-a68e-0a49f15faf33	f22bb71c-1314-435c-a60c-c7bfa5a22769	\N	114729
85b22642-bbb7-4cf5-95ea-0927f78af06a	2223a81b-6112-46fc-ab73-2beb9dc68db7	\N	146164
cc74a2e7-ae60-4986-8e1c-216e6701efa5	b66e6df8-1221-42f2-8b32-3e91cd62b84f	\N	132695
d482cea7-cb4c-4515-8d57-e4ac81dc9083	57a99411-7576-4b24-9eee-9aa69b599d93	\N	122575
f42b07a5-783b-47c7-8c31-542a35960fb4	8541a7ed-cb06-4dfc-938e-5661932f86cf	\N	117390
f5eb7e39-b48c-4d9e-9183-68023ec1b92e	eeb61c68-c9f5-4824-88e6-5b8217e96148	\N	121267
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
28b4ba06-d2b0-47e3-8dfe-608ba45c5059	41fa2f56-0a3d-402a-b47a-8de76354ea41
28b4ba06-d2b0-47e3-8dfe-608ba45c5059	514eda13-3a2f-4a63-844a-436adb86aa2c
480ede96-4825-4380-92a0-8d6580d65995	350c5f06-2f40-418e-a600-2d417de1bff9
480ede96-4825-4380-92a0-8d6580d65995	6556c072-fd8b-493f-b938-c20af461dbc4
73f99a07-9f26-4827-89fc-eafe49329277	41fa2f56-0a3d-402a-b47a-8de76354ea41
73f99a07-9f26-4827-89fc-eafe49329277	a02718a3-0908-4666-b1f8-5ea47fc518f3
778840a8-f9a7-4984-9037-56943fa6d1a3	9c80c58f-df7d-4a52-bf3e-54629dd4e2dc
778840a8-f9a7-4984-9037-56943fa6d1a3	d7426c28-6b9a-41e3-b500-6c1f0c65b55a
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
28b4ba06-d2b0-47e3-8dfe-608ba45c5059	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	bad3a3e3-9c43-4a8e-bb8d-827489235dea	49141
480ede96-4825-4380-92a0-8d6580d65995	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	bad3a3e3-9c43-4a8e-bb8d-827489235dea	49286
73f99a07-9f26-4827-89fc-eafe49329277	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	bad3a3e3-9c43-4a8e-bb8d-827489235dea	49232
778840a8-f9a7-4984-9037-56943fa6d1a3	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	bad3a3e3-9c43-4a8e-bb8d-827489235dea	49283
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
31d31c1c-ae51-4a9d-89a7-cb5ddca0a03d	2023-03-02 12:56:19.901042	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	778840a8-f9a7-4984-9037-56943fa6d1a3	f5eb7e39-b48c-4d9e-9183-68023ec1b92e	bad3a3e3-9c43-4a8e-bb8d-827489235dea	\N
67e9d451-88a5-4cd9-b8a7-35260738ac25	2023-03-02 12:56:19.90095	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	778840a8-f9a7-4984-9037-56943fa6d1a3	f5eb7e39-b48c-4d9e-9183-68023ec1b92e	bad3a3e3-9c43-4a8e-bb8d-827489235dea	\N
9c98a80a-d70d-43f3-aede-9055bb831e35	2023-03-02 12:56:19.901042	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	778840a8-f9a7-4984-9037-56943fa6d1a3	f5eb7e39-b48c-4d9e-9183-68023ec1b92e	bad3a3e3-9c43-4a8e-bb8d-827489235dea	\N
eb850e8b-e22f-49e6-b7fe-65328567a073	2023-03-02 12:56:19.900992	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	778840a8-f9a7-4984-9037-56943fa6d1a3	f5eb7e39-b48c-4d9e-9183-68023ec1b92e	bad3a3e3-9c43-4a8e-bb8d-827489235dea	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
438c4931-504e-49e2-a7a6-ee9400b2f03c	1	1	f	2023-03-02 12:56:19.901041	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	002929e9-c228-48d6-bb85-d68c6e1bd094	f5eb7e39-b48c-4d9e-9183-68023ec1b92e	bad3a3e3-9c43-4a8e-bb8d-827489235dea	74ec8235-3875-40f2-9e86-17c24137ef7b	\N
cc4f38d1-bdb4-4233-af00-ca8879bf8d93	2	1	f	2023-03-02 12:56:19.900346	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	5dd403d9-2b94-4d18-a399-1d24b867f12e	f5eb7e39-b48c-4d9e-9183-68023ec1b92e	bad3a3e3-9c43-4a8e-bb8d-827489235dea	74ec8235-3875-40f2-9e86-17c24137ef7b	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
052c1ba5-caad-46ac-852a-12c7560f52bf	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	f9edf148-1c79-45ff-bff3-3169087d61b4	\N
29675a5e-3e80-49ac-82d6-d0c468946548	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	f9edf148-1c79-45ff-bff3-3169087d61b4	\N
bcc671dd-261b-493a-87dc-a040e3d9c47a	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	f9edf148-1c79-45ff-bff3-3169087d61b4	\N
2e7280d4-f0ec-45dc-ac59-624e424c50ca	1	12:10:00	13:10:00	13:20:00	13:50:00	4b52540d-75df-4192-92e2-b618f218e779	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
02717b01-b798-4254-99aa-1174440a7085	3540	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3540
109a9ca9-cbf5-49bd-876b-364709dcae6e	1390	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1390
146726d0-13c8-449f-a2da-121b4f76852a	1270	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1270
17eedada-7bbb-4d9d-8bb2-56925ce82b53	3550	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3550
214aa111-7c54-4228-9e97-6e3e6023b3eb	1260	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1260
2d9e28d1-0bc0-40be-a920-eb55689a162b	1280	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1280
350c5f06-2f40-418e-a600-2d417de1bff9	3500	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3500
351e5395-09e7-44d3-aa63-c791c156ae59	3660	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3660
37e1769c-3a96-40f4-b502-4186f275db17	3640	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3640
41fa2f56-0a3d-402a-b47a-8de76354ea41	3610	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3610
49664fa5-a0f9-48e4-adb2-805f7bfcef7d	3680	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3680
514eda13-3a2f-4a63-844a-436adb86aa2c	3520	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3520
5345846a-3802-4bae-90c6-63f0a510645b	2050	\N	f263d96e-60ad-4e7c-bbb2-23128c6e4310	2050
5d3240fd-ff0c-4783-ad08-ee2b9753ef93	3570	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3570
6556c072-fd8b-493f-b938-c20af461dbc4	3590	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3590
799b0f2a-e118-4e65-9adc-01a17b664d7b	1380	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1380
8988952d-1041-42b1-b7a0-91b7f393bd10	3580	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3580
9c80c58f-df7d-4a52-bf3e-54629dd4e2dc	3690	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3690
9f9ad482-28f0-46a8-ab7c-fa9e562ca047	1550	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1550
a02718a3-0908-4666-b1f8-5ea47fc518f3	3600	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3600
a73bec8a-84f5-43fb-9423-9e5f7278261f	2130	\N	f263d96e-60ad-4e7c-bbb2-23128c6e4310	2130
ae32bf45-c9a9-454d-981d-5ce026c3f6db	3530	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3530
bb7539a5-3c2e-46d8-9e71-c5ccb0c2e633	3620	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3620
cb181d35-b2b4-4858-886c-1c2b827d9fe9	3560	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3560
d2375bdd-2d04-4cdb-9c44-2476fc941720	3510	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3510
d60df1f1-c6a5-4eed-85c5-b4fe2a2d887d	2150	\N	f263d96e-60ad-4e7c-bbb2-23128c6e4310	2150
d7426c28-6b9a-41e3-b500-6c1f0c65b55a	3650	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3650
f2438ab7-b8db-4f32-8c13-4ae77168dce7	3630	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3630
f436d3ee-84e8-4fe2-889e-86a652a64c97	3670	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3670
f4d2c7af-747f-4a3f-902f-70170da63f4f	1360	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1360
f8ec86f8-3786-48eb-b6b1-4c7afcbdaba2	3700	\N	51102f24-89c3-45e9-b0f2-c78d17de2a9f	3700
ff589d26-ee49-4a94-b0df-4404d8f3c1c8	1400	\N	72ba087a-a6f9-48af-9bdc-e089cb274351	1400
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
940b4e18-023f-4a67-a350-3a3d6d33c7b2	Сварочный цех	50	050
fe77afaf-9aca-4b5b-9407-622cfde3df57	Цех 480	480	480
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

