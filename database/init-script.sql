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
-- Name: MasterWeldingEquipment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."MasterWeldingEquipment" (
    "MastersId" uuid NOT NULL,
    "WeldingEquipmentsId" uuid NOT NULL
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
    "PreheatingTemperature" integer NOT NULL,
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "WeldingEquipmentId" uuid NOT NULL,
    "WelderId" uuid NOT NULL,
    "MasterId" uuid NOT NULL,
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
da0ea292-fa9f-453c-b3b4-b0684095816c	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
f871a591-7517-445c-b35f-a3060991df40	008445a3-49be-4299-8575-9630a9ed45df	3aa495f6-db77-43c2-bac3-9ce156c25eb8	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
93b1790d-62e0-4bb6-98a4-15b9fe98b338	1	10	t	da0ea292-fa9f-453c-b3b4-b0684095816c	\N
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
033a054f-36b5-4da9-95b9-c01014471995	Отсутствие конструктора, технолога или ожидание его решения	\N
1c2af3e4-d6c7-48a1-bd94-7d743f408803	Установка, выверка, снятие детали	\N
23032c2c-d1cc-4874-bca7-2a4c9f3d6a4e	Работа с управляющей программой	\N
2faaaa9a-ae6f-468b-8009-e96cebcfc623	Ознакомление с работой, документацией, инструктаж	\N
6c9cf36a-1126-4327-9384-cdb06d103fe4	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
6d10311a-6409-46b8-8daf-343031cd73fb	Контроль на рабочем месте	\N
72aeb686-05d6-4156-b2f1-d55c9cb50705	Отсутствие материала, заготовок, деталей	\N
88bc8740-cabb-46d0-b5a9-7ea23deb62ff	Отсутствие энергоносителей	\N
8996c398-6f07-463c-b548-b4e32f2bf3f0	Отсутствие заданий	\N
8f287f1b-2d05-44ea-a210-23e011eed21e	Отсутствие крана, транспорта	\N
91f16cfb-117f-447d-8fd5-e8153ce6b076	Изменение режимов, смена инструмента, приспособления	\N
925b7e17-78eb-4e14-ace7-5f85e62954a7	Отсутствие сотрудника ОТК	\N
9808e43f-d97f-4854-8f24-4a6c25c84d7c	Отсутствие оператора в связи с необеспеченностью	\N
af3400f8-7a0f-4a1b-9ca7-c230cc972b63	Сборочные операции	\N
b6a13fa5-8f2f-4994-8437-1fb85425bdbf	Праздники и выходные	\N
c4da02bd-94f2-4a9c-8d58-7957e4dd5cef	Неявка оператора (б/лист, отпуск, и пр.)	\N
d36db64f-aaa8-43a2-961d-a309a5c3a058	Нерабочее время по графику согласно сменности	\N
d818e53f-1611-41e9-87bd-ca8dfc928eb7	Обед	\N
e1f3c96f-ca77-4522-8a76-354719c6990e	Естественные надобности	\N
e3043829-cdbd-4357-9c86-b120c2ebe824	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
e4d4a4dd-f6c1-4c67-a255-e874a893d007	Работа по карте несоответствий	\N
ed8fe8f7-34d7-4027-9fa3-3dbae87bf2e3	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
efe9f514-54f0-46a7-8454-e322a717f580	Плановый ремонт централизованными службами	\N
fb645a95-d74c-4505-834b-39cce73af196	Аварийный ремонт централизованными службами	\N
fdad6e16-b680-4d46-ab11-d84fb3a0fb82	Установка, выверка, снятие детали	\N
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
308e6203-a7db-4e06-800c-adec255aa7b8	c3eb214e-5c7b-4b7d-8589-4f0f8affa23c	256467
9df1a70b-1466-42c1-bcb0-b80380ca027c	74b6e996-d9fb-486a-b124-340cff8bfe79	249550
af0e822b-c7d1-48c7-a594-b82c02cce982	07a618cf-145c-4c80-b4c8-f8c680f8a596	251534
dd291f3c-5bdc-400d-9ecf-255ba071a7a9	1431e66a-67e5-43e7-981d-267e996fe5ec	235565
\.


--
-- Data for Name: MasterWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."MasterWeldingEquipment" ("MastersId", "WeldingEquipmentsId") FROM stdin;
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
10a46306-35bd-4819-a40e-412bc382ff34	e5e2da57-523d-4571-8809-b7a658f18de3	614962
1ca486f9-5c6c-4e0d-8483-9e33c2550873	9b2c0df5-c71f-4ea9-8a9e-c0ac8833c92a	610422
311615ab-60a8-477b-bdca-e0b362c64c32	cb006317-97b9-4573-81a0-db032480ace3	613668
5886d56f-f691-4caf-997f-69bf296442da	fe465e1c-3e6b-49f2-8727-e06fde14b564	612000
aa7f5126-a721-450b-a58a-b131e1ed68e7	408fd65f-2deb-4fed-ac5a-27e6d5e3f44c	614208
d0c2f21e-b3ba-4288-85cd-9cce5024869b	123225e3-5f72-4349-8803-cbaf672f3444	617215
d227c0a6-b9a2-4023-8f44-b34cae12ebcf	756f0abd-acf2-4698-a4c7-86ce58cd912b	643759
a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	025c5bd9-8bc7-43bb-86eb-a96bb9cdc501	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
ae5ee3ab-6a67-4580-9f25-7f4ad91ab1ab	1	Пост 1	27a08003-d76b-407c-a5b9-65f0890b356b	\N
ca369533-90bc-40e0-87be-a080143d846b	2	Пост 2	75eca319-7c5d-4759-a645-93963cfddf69	\N
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
590f6d94-0248-4223-8d1b-306471f7a1fd	0e139eb5-5b33-4b98-a320-91de97b5cfb1
cd33e24f-eb59-4c94-bd57-e2e679f146fe	23bb0116-6f88-4930-84a4-31b1243a4697
fc79c212-5516-4b59-b284-e75a228a5d54	24cdec90-3765-46ad-845c-e5de16eb502d
d6f8acad-604b-44aa-b462-572cbf52f1e8	3009a8de-e26a-437b-aa04-80368dc031a9
cd33e24f-eb59-4c94-bd57-e2e679f146fe	321de2a7-1ccd-417f-8d55-f7f102d823e8
5e5eac3d-ec51-4c26-a911-9bc0d44865fa	37cc29af-8f26-4cf1-8660-b62b6045faf5
ae326abc-18e0-4e21-8a3e-61a347c82cde	3b73a275-383f-49dd-bb45-351d49f89309
0e139eb5-5b33-4b98-a320-91de97b5cfb1	50b1b67a-62a9-450e-80fe-105c4d452503
590f6d94-0248-4223-8d1b-306471f7a1fd	5e5eac3d-ec51-4c26-a911-9bc0d44865fa
590f6d94-0248-4223-8d1b-306471f7a1fd	729258dc-143f-4685-be92-e195ac250ae1
fc79c212-5516-4b59-b284-e75a228a5d54	74e40703-372e-4a20-a23b-332bf143ee84
41541043-cfb7-40b0-b8a5-54cb0c9e194c	88518c0b-640b-4fb2-92d4-6a91579b66f9
321de2a7-1ccd-417f-8d55-f7f102d823e8	9ad7b62c-e048-4394-ba51-16e7a07d879c
41541043-cfb7-40b0-b8a5-54cb0c9e194c	ae326abc-18e0-4e21-8a3e-61a347c82cde
5e5eac3d-ec51-4c26-a911-9bc0d44865fa	bd5e022f-b68f-4d05-a98c-ec0d9f83ae64
0e139eb5-5b33-4b98-a320-91de97b5cfb1	c3cb136d-1f59-4d79-b1ee-ae57dcdfe532
41541043-cfb7-40b0-b8a5-54cb0c9e194c	c90e8bb8-0433-4e81-b731-2b35880ee097
590f6d94-0248-4223-8d1b-306471f7a1fd	cc660f4e-e240-4473-874b-3543afbaa03b
321de2a7-1ccd-417f-8d55-f7f102d823e8	d09cea3b-7ebc-4c02-a6ec-a08d93dcaaee
cd33e24f-eb59-4c94-bd57-e2e679f146fe	d6f8acad-604b-44aa-b462-572cbf52f1e8
cd33e24f-eb59-4c94-bd57-e2e679f146fe	eb5af0ff-c4fd-47c0-8eb3-800851e2e816
ae326abc-18e0-4e21-8a3e-61a347c82cde	f6b85c66-13f0-4195-84f9-c362af749eec
41541043-cfb7-40b0-b8a5-54cb0c9e194c	fc79c212-5516-4b59-b284-e75a228a5d54
d6f8acad-604b-44aa-b462-572cbf52f1e8	fccb6734-7ae6-4449-87ce-217d3fb3c85c
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
27a08003-d76b-407c-a5b9-65f0890b356b	Сборка, сварка мостов	1	88e1453f-7e30-46a4-9ec9-b5f74a959065	01
3e5e438d-f9fe-4d33-bfe8-17f5e1bff8c8	Производственный участок 5	5	3aa495f6-db77-43c2-bac3-9ce156c25eb8	05
699689e1-e3cd-47c9-b4d4-1916de493820	Сборка, сварка рам к/с г/п 120-130 т.	6	88e1453f-7e30-46a4-9ec9-b5f74a959065	06
75eca319-7c5d-4759-a645-93963cfddf69	Сборка, сварка узл. и рам к/с г/п 120-220т	4	88e1453f-7e30-46a4-9ec9-b5f74a959065	04
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0e139eb5-5b33-4b98-a320-91de97b5cfb1	Кронштейн	75310-1183100	t	2	9bf2f496-4f7e-424b-a001-1d8fff14dd94	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536267493
23bb0116-6f88-4930-84a4-31b1243a4697	Кронштейн	75131-2113296-10	t	3	d4558ea9-8721-4c2e-9dcf-564d3024497a	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536461620
24cdec90-3765-46ad-845c-e5de16eb502d	Труба картера	75580-2401132-10	t	3	a806e588-b038-4853-96e4-8a0c559ceeb6	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536386250
3009a8de-e26a-437b-aa04-80368dc031a9	Проушина	7521-2401224	t	3	759cafcd-2a11-411c-899a-7db56f1b3dc0	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536274170
321de2a7-1ccd-417f-8d55-f7f102d823e8	Картер заднего моста	75132-2401008-50	t	2	154cc7e3-90a3-4acc-b931-99cb2255cfea	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536467565
37cc29af-8f26-4cf1-8660-b62b6045faf5	Кронштейн	75304-1001253	t	3	5e221281-1492-422c-9dd5-8803fd67bc10	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536248708
3b73a275-383f-49dd-bb45-351d49f89309	Втулка	75303-2128438	t	3	5ab8b9d5-1eb9-47d9-be85-aa13b5737773	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536248270
41541043-cfb7-40b0-b8a5-54cb0c9e194c	Картер заднего моста	75580-2401006	t	1	320f17e7-4cec-4bcc-b608-87646c128f74	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536384294
50b1b67a-62a9-450e-80fe-105c4d452503	Кронштейн	75310-1183102	t	3	62ee37ad-199d-4852-b4bd-0fd7d88dbd52	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536267484
590f6d94-0248-4223-8d1b-306471f7a1fd	Рама	75313-2800010-20	t	1	00cb7b7d-8a6c-4b10-a48a-07c7de3df199	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536287819
5e5eac3d-ec51-4c26-a911-9bc0d44865fa	Кронштейн амортизатора левый	75304-1001251	t	2	a8ffed87-949f-469f-ac4d-5b987ced0e1f	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536248707
729258dc-143f-4685-be92-e195ac250ae1	Кронштейн	75211-1018162	t	3	bdb649c8-48b8-4fae-a228-19bd490dea41	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536270344
74e40703-372e-4a20-a23b-332bf143ee84	Фланец картера	75580-2401114-11	t	3	0945df89-a44d-408d-838a-4d37e74c673a	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536386265
9ad7b62c-e048-4394-ba51-16e7a07d879c	Пластина	75132-2401106	t	3	f8a56bca-fc3e-418f-9545-d66774f46950	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536444153
ae326abc-18e0-4e21-8a3e-61a347c82cde	Картер заднего моста	75580-2401008	t	2	2d640530-8d76-4eda-9bb8-a028f5976165	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536384295
bd5e022f-b68f-4d05-a98c-ec0d9f83ae64	Кронштейн	75303-1001293	t	3	6d800bfa-9ca6-4a33-a64d-247003c6e90a	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536247228
c3cb136d-1f59-4d79-b1ee-ae57dcdfe532	Кронштейн	75310-1183106	t	3	579f54ef-3993-4ae1-b00d-df17aeaeb981	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536267485
c90e8bb8-0433-4e81-b731-2b35880ee097	Кронштейн	75580-2113192	t	3	b34c863b-7493-4a29-918e-371a840348b1	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536384314
cc660f4e-e240-4473-874b-3543afbaa03b	Накладка	549Б-1015842	t	3	68f983af-04ff-4a3c-aa8d-3e727233e73a	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N	\N	4536196288
cd33e24f-eb59-4c94-bd57-e2e679f146fe	Картер заднего моста	75132-2401006-50	t	1	d46439cb-dcda-403b-86ec-f4180f3fce1c	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536467567
d6f8acad-604b-44aa-b462-572cbf52f1e8	Кронштейн	7521-2401220	t	2	f3432822-7d27-4368-909d-2203c1782ec3	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536273956
eb5af0ff-c4fd-47c0-8eb3-800851e2e816	Панель	75132-2105522	t	3	1b8bc93e-6651-44c3-a85e-51b51c446cf6	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536417730
f6b85c66-13f0-4195-84f9-c362af749eec	Кольцо	75580-2401227	t	3	4f4a03ff-1bb3-41c7-8617-8c9f6bcbf01d	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536384312
fc79c212-5516-4b59-b284-e75a228a5d54	Труба картера заднего моста	75580-2401010-01	t	2	fbc5b95b-be11-40a2-91c0-5a2f3acdb15b	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536386240
fccb6734-7ae6-4449-87ce-217d3fb3c85c	Распорка	7521-3932688	t	3	d9e550c5-9367-4273-a10d-558aaf0e2da1	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N	\N	4536273606
88518c0b-640b-4fb2-92d4-6a91579b66f9	Панель	75580-2105522	t	3	5c74b3e8-dd0b-48d2-9514-b2429cf39e2e	27a08003-d76b-407c-a5b9-65f0890b356b	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	\N	\N	4536384399
d09cea3b-7ebc-4c02-a6ec-a08d93dcaaee	Опора	75211-2401122	t	3	a511142b-5772-4eb8-a918-df219b3bfc7b	27a08003-d76b-407c-a5b9-65f0890b356b	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	\N	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
0b84a107-ca68-4a53-879f-ad6257fe415b	Admin	\N
89dda4fe-0e53-4f31-b601-5ce4b3e29afd	Master	\N
8def38d6-e087-4573-bc66-e634d512e426	Welder	\N
7ca85915-29a9-46fa-85ab-d40c91694cda	Inspector	\N
acb3fbd7-9dc2-4ea6-92bc-17649dd18f02	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
11fa1aca-90c8-4ee6-8b2d-f25ef7d3e706	3	333	t	f	590f6d94-0248-4223-8d1b-306471f7a1fd	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N
4bc1eed2-55c2-44ec-921d-c2c38556a161	1	111	t	f	cd33e24f-eb59-4c94-bd57-e2e679f146fe	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N
8241be0b-317c-4220-b663-e91274004bd9	2	222	t	f	cd33e24f-eb59-4c94-bd57-e2e679f146fe	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N
bdff0e46-fe6c-4e59-ac93-a43daa1de345	4	222	t	f	590f6d94-0248-4223-8d1b-306471f7a1fd	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N	\N
3a2d259a-36ae-4eae-9ee8-28f8204403be	1	100	t	f	d09cea3b-7ebc-4c02-a6ec-a08d93dcaaee	c63167dd-19bc-4b3f-89dd-97148eb76328	dd291f3c-5bdc-400d-9ecf-255ba071a7a9	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N
8207264f-7a19-4053-90fe-aa77d76e8eb3	2	200	t	f	88518c0b-640b-4fb2-92d4-6a91579b66f9	2826f2c8-cb50-410d-9cb3-639f39202718	dd291f3c-5bdc-400d-9ecf-255ba071a7a9	75eca319-7c5d-4759-a645-93963cfddf69	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
2826f2c8-cb50-410d-9cb3-639f39202718	1	ИТП	\N
c63167dd-19bc-4b3f-89dd-97148eb76328	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
00cb7b7d-8a6c-4b10-a48a-07c7de3df199	3239598	Технологический процесс	Ссылка	3239598
0945df89-a44d-408d-838a-4d37e74c673a	3338649	Технологический процесс	Ссылка	3338649
154cc7e3-90a3-4acc-b931-99cb2255cfea	3232836	Технологический процесс	Ссылка	3232836
1b8bc93e-6651-44c3-a85e-51b51c446cf6	1053809	Технологический процесс	Ссылка	1053809
2d640530-8d76-4eda-9bb8-a028f5976165	3232938	Технологический процесс	Ссылка	3232938
320f17e7-4cec-4bcc-b608-87646c128f74	2433634	Технологический процесс	Ссылка	2433634
4f4a03ff-1bb3-41c7-8617-8c9f6bcbf01d	1402616	Технологический процесс	Ссылка	1402616
579f54ef-3993-4ae1-b00d-df17aeaeb981	1119363	Технологический процесс	Ссылка	1119363
5ab8b9d5-1eb9-47d9-be85-aa13b5737773	3011514	Технологический процесс	Ссылка	3011514
5c74b3e8-dd0b-48d2-9514-b2429cf39e2e	1405307	Технологический процесс	Ссылка	1405307
5e221281-1492-422c-9dd5-8803fd67bc10	1492964	Технологический процесс	Ссылка	1492964
62ee37ad-199d-4852-b4bd-0fd7d88dbd52	1104641	Технологический процесс	Ссылка	1104641
68f983af-04ff-4a3c-aa8d-3e727233e73a	1426226	Технологический процесс	Ссылка	1426226
6d800bfa-9ca6-4a33-a64d-247003c6e90a	3049271	Технологический процесс	Ссылка	3049271
759cafcd-2a11-411c-899a-7db56f1b3dc0	1124147	Технологический процесс	Ссылка	1124147
9bf2f496-4f7e-424b-a001-1d8fff14dd94	1823031	Технологический процесс	Ссылка	1823031
a511142b-5772-4eb8-a918-df219b3bfc7b	3211246	Технологический процесс	Ссылка	3211246
a806e588-b038-4853-96e4-8a0c559ceeb6	2822569	Технологический процесс	Ссылка	2822569
a8ffed87-949f-469f-ac4d-5b987ced0e1f	1334123	Технологический процесс	Ссылка	1334123
b34c863b-7493-4a29-918e-371a840348b1	1405914	Технологический процесс	Ссылка	1405914
bdb649c8-48b8-4fae-a228-19bd490dea41	2841119	Технологический процесс	Ссылка	2841119
d4558ea9-8721-4c2e-9dcf-564d3024497a	526870	Технологический процесс	Ссылка	526870
d46439cb-dcda-403b-86ec-f4180f3fce1c	3090319	Технологический процесс	Ссылка	3090319
d9e550c5-9367-4273-a10d-558aaf0e2da1	908693	Технологический процесс	Ссылка	908693
f3432822-7d27-4368-909d-2203c1782ec3	1362989	Технологический процесс	Ссылка	1362989
f8a56bca-fc3e-418f-9545-d66774f46950	1003048	Технологический процесс	Ссылка	1003048
fbc5b95b-be11-40a2-91c0-5a2f3acdb15b	2915477	Технологический процесс	Ссылка	2915477
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
07a618cf-145c-4c80-b4c8-f8c680f8a596	7ca85915-29a9-46fa-85ab-d40c91694cda
74b6e996-d9fb-486a-b124-340cff8bfe79	7ca85915-29a9-46fa-85ab-d40c91694cda
c3eb214e-5c7b-4b7d-8589-4f0f8affa23c	7ca85915-29a9-46fa-85ab-d40c91694cda
123225e3-5f72-4349-8803-cbaf672f3444	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
408fd65f-2deb-4fed-ac5a-27e6d5e3f44c	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
756f0abd-acf2-4698-a4c7-86ce58cd912b	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
9b2c0df5-c71f-4ea9-8a9e-c0ac8833c92a	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
cb006317-97b9-4573-81a0-db032480ace3	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
e5e2da57-523d-4571-8809-b7a658f18de3	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
fe465e1c-3e6b-49f2-8727-e06fde14b564	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
040a3505-8179-4828-946f-d212bde4c267	8def38d6-e087-4573-bc66-e634d512e426
101e5ba5-bda6-4d5f-a010-5523ad4ed07f	8def38d6-e087-4573-bc66-e634d512e426
108e96ba-1983-47b4-803d-99c6848919e4	8def38d6-e087-4573-bc66-e634d512e426
14ccb8ee-9983-4012-8c89-8f1f1271c46f	8def38d6-e087-4573-bc66-e634d512e426
20420c61-cc9e-4dd8-a495-09e41385abd4	8def38d6-e087-4573-bc66-e634d512e426
2a0e612e-a9b3-4016-aa5b-0395d22c61be	8def38d6-e087-4573-bc66-e634d512e426
35d9a7bd-117d-4a41-be80-0dfdc13ec8d8	8def38d6-e087-4573-bc66-e634d512e426
4b7bfa58-bc00-486f-a2e9-881dc2bd7e50	8def38d6-e087-4573-bc66-e634d512e426
5788ee0b-ddb6-4185-b98a-c721ac360a12	8def38d6-e087-4573-bc66-e634d512e426
5e9e6b49-fe8f-4274-ab29-fd7bddc12037	8def38d6-e087-4573-bc66-e634d512e426
6cbf0bcc-c9fb-4d93-ab09-6c425f1b8cc9	8def38d6-e087-4573-bc66-e634d512e426
7457b781-c1c8-4027-873a-1f8987b3a1b2	8def38d6-e087-4573-bc66-e634d512e426
74fd38e3-853a-42b6-9077-8818bd2d03a8	8def38d6-e087-4573-bc66-e634d512e426
76e2eea2-125f-44fb-88a7-685420635ec3	8def38d6-e087-4573-bc66-e634d512e426
7b122d37-6580-48fd-bbd2-59d129988e6f	8def38d6-e087-4573-bc66-e634d512e426
841a364e-590e-4c23-80bd-a1270ad069c3	8def38d6-e087-4573-bc66-e634d512e426
959e7830-bebe-4acc-82db-857af1e4e078	8def38d6-e087-4573-bc66-e634d512e426
982efe6e-5c64-4bd3-b6a3-76dfa317869b	8def38d6-e087-4573-bc66-e634d512e426
c7641c9c-9dac-4c0f-abad-ebbfdeb0c8af	8def38d6-e087-4573-bc66-e634d512e426
cba73c8f-89e0-4102-9876-bbe4cec424d5	8def38d6-e087-4573-bc66-e634d512e426
e0a81cd6-bc6a-47f4-911f-0a174cff9563	8def38d6-e087-4573-bc66-e634d512e426
f97e88b5-a939-4448-b20b-8d8f961a72e1	8def38d6-e087-4573-bc66-e634d512e426
faf8d37f-24fc-49d4-a19b-f2c65560d380	8def38d6-e087-4573-bc66-e634d512e426
008445a3-49be-4299-8575-9630a9ed45df	acb3fbd7-9dc2-4ea6-92bc-17649dd18f02
025c5bd9-8bc7-43bb-86eb-a96bb9cdc501	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
1431e66a-67e5-43e7-981d-267e996fe5ec	7ca85915-29a9-46fa-85ab-d40c91694cda
c550d472-f6c9-4390-9b8c-4433d2d64e2d	8def38d6-e087-4573-bc66-e634d512e426
588c8502-1c4b-4267-a250-3ba0d139a726	0b84a107-ca68-4a53-879f-ad6257fe415b
618a22e4-e068-41c7-8080-34be4a8c6e8c	8def38d6-e087-4573-bc66-e634d512e426
91b35983-7f39-4a11-bea6-369e51c64a1b	7ca85915-29a9-46fa-85ab-d40c91694cda
8d3f1600-b89d-4a30-a128-2ffcf95fa9ef	acb3fbd7-9dc2-4ea6-92bc-17649dd18f02
ad7e6492-3dc8-4ab5-bffd-d079e0dfdc49	89dda4fe-0e53-4f31-b601-5ce4b3e29afd
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
07a618cf-145c-4c80-b4c8-f8c680f8a596	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	3e5e438d-f9fe-4d33-bfe8-17f5e1bff8c8	\N
74b6e996-d9fb-486a-b124-340cff8bfe79	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
c3eb214e-5c7b-4b7d-8589-4f0f8affa23c	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	3e5e438d-f9fe-4d33-bfe8-17f5e1bff8c8	\N
123225e3-5f72-4349-8803-cbaf672f3444	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N
408fd65f-2deb-4fed-ac5a-27e6d5e3f44c	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N
756f0abd-acf2-4698-a4c7-86ce58cd912b	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
9b2c0df5-c71f-4ea9-8a9e-c0ac8833c92a	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
cb006317-97b9-4573-81a0-db032480ace3	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
e5e2da57-523d-4571-8809-b7a658f18de3	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
fe465e1c-3e6b-49f2-8727-e06fde14b564	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
040a3505-8179-4828-946f-d212bde4c267	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
101e5ba5-bda6-4d5f-a010-5523ad4ed07f	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
108e96ba-1983-47b4-803d-99c6848919e4	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
14ccb8ee-9983-4012-8c89-8f1f1271c46f	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
20420c61-cc9e-4dd8-a495-09e41385abd4	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
2a0e612e-a9b3-4016-aa5b-0395d22c61be	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
35d9a7bd-117d-4a41-be80-0dfdc13ec8d8	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	22222	699689e1-e3cd-47c9-b4d4-1916de493820	\N
4b7bfa58-bc00-486f-a2e9-881dc2bd7e50	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
5788ee0b-ddb6-4185-b98a-c721ac360a12	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
5e9e6b49-fe8f-4274-ab29-fd7bddc12037	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
6cbf0bcc-c9fb-4d93-ab09-6c425f1b8cc9	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
7457b781-c1c8-4027-873a-1f8987b3a1b2	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
74fd38e3-853a-42b6-9077-8818bd2d03a8	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
76e2eea2-125f-44fb-88a7-685420635ec3	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
7b122d37-6580-48fd-bbd2-59d129988e6f	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N
841a364e-590e-4c23-80bd-a1270ad069c3	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N
959e7830-bebe-4acc-82db-857af1e4e078	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
982efe6e-5c64-4bd3-b6a3-76dfa317869b	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
c7641c9c-9dac-4c0f-abad-ebbfdeb0c8af	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
cba73c8f-89e0-4102-9876-bbe4cec424d5	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
e0a81cd6-bc6a-47f4-911f-0a174cff9563	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
f97e88b5-a939-4448-b20b-8d8f961a72e1	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	27a08003-d76b-407c-a5b9-65f0890b356b	\N
faf8d37f-24fc-49d4-a19b-f2c65560d380	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	699689e1-e3cd-47c9-b4d4-1916de493820	\N
008445a3-49be-4299-8575-9630a9ed45df	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
025c5bd9-8bc7-43bb-86eb-a96bb9cdc501	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
1431e66a-67e5-43e7-981d-267e996fe5ec	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
c550d472-f6c9-4390-9b8c-4433d2d64e2d	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	75eca319-7c5d-4759-a645-93963cfddf69	\N
588c8502-1c4b-4267-a250-3ba0d139a726	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$HFyneHYcrU7DbwnwxLgv3yGXwEEUy1CHdikVm5rWhBiOu6nm	\N	\N	\N	\N	\N	\N
618a22e4-e068-41c7-8080-34be4a8c6e8c	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$wiYLcNwe9ugbQQKHuDbYnV013V6WekitenWC1zrCfplpQS0s	\N	\N	\N	\N	\N	\N
91b35983-7f39-4a11-bea6-369e51c64a1b	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$d3z/2MQVXS9T/eprjxQCnIoHFiHpmtKkER1NJrp9h1iX5CoJ	\N	\N	\N	\N	\N	\N
8d3f1600-b89d-4a30-a128-2ffcf95fa9ef	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$rmG32fbHgjkXijKywq2GaJ4eLHPRMRY1+7uPf706cg7f5yty	\N	\N	\N	\N	\N	\N
ad7e6492-3dc8-4ab5-bffd-d079e0dfdc49	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$OiMTYJ3Pln9hvCPpQgBeqRd89p3pZ8KL/3COoYKsQlLvRcg1	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
3d40c0aa-35a5-4401-a802-6cdbec45d8e7	1	Корневой	80	120	\N	\N	50	250	2826f2c8-cb50-410d-9cb3-639f39202718	\N
4b39f224-29b2-4a8a-8bd5-8152cbd32138	2	Заполняющий	80	120	21	25	50	250	2826f2c8-cb50-410d-9cb3-639f39202718	\N
59c98c32-6a71-4a75-a658-bc6bc65ac6c0	1	Корневой	80	120	22	24	50	250	c63167dd-19bc-4b3f-89dd-97148eb76328	\N
6a2c5f9a-0edb-4a9b-bc0d-0733654b4979	2	Заполняющий	80	120	21	25	50	250	c63167dd-19bc-4b3f-89dd-97148eb76328	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentTolerance", "IsEnsuringVoltageTolerance", "IsEnsuringTemperatureTolerance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
40de4e2c-d626-4561-bf51-fc86bed80e4c	2	Заполняющий	0.22	0.44	\N	\N	\N	a4978be6-6e1c-41c0-a7e0-461e22f082ad	dc2d7bbc-9194-41da-bc31-2000001d1cb3	\N
5ca03d23-d657-427e-80ee-c9e2842db91f	1	Корневой	0.11	0.68	\N	\N	\N	be2ddc65-f3a1-4a50-a1c4-959aed607e21	dc2d7bbc-9194-41da-bc31-2000001d1cb3	\N
68c34f82-2dbe-4d8d-abd0-be42de222ce6	2	Заполняющий	0.22	0.44	\N	\N	\N	616dc5b3-c733-44a8-ae94-86149187cd19	0e494411-0c15-4b9e-ac11-0de49363902f	\N
8f0ed590-0616-442f-9b32-a77e9757d3d8	1	Корневой	0.11	0.68	\N	\N	\N	f9c3aa69-1ff0-443a-824f-33f891f176b2	0e494411-0c15-4b9e-ac11-0de49363902f	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
07346e03-e4e0-4c76-8fb7-6533533ab0c0	8b8977f2-e946-41bb-87e3-3a6326759685
1643b58a-11ab-44b8-a4f1-f1191d795d03	8b8977f2-e946-41bb-87e3-3a6326759685
1d417ab7-0260-4c70-b7e4-20aa6b43c025	68eb5ed1-0077-452c-b6ca-4eebf1a1280c
28e76297-185a-48ac-8a43-a26699d21a30	729236eb-d12c-45f8-90e3-80316536c069
33c47c2b-038e-4799-aeb3-6dccdb2dce7b	b19a60ae-3a84-494a-adcf-587ab8057c7f
37c81fb0-d78b-4a6a-accd-aef143c8af11	983e3df7-f124-4a79-9c3a-eff259a7c956
38f9e769-6730-4514-9230-beb9327c6303	d29f070e-3868-4f8d-8a52-a99d2dad2652
5e7bd019-f70c-4051-8281-9d41f3652be4	b19a60ae-3a84-494a-adcf-587ab8057c7f
62e7b2ed-f49a-44be-a281-0683a08a20df	9aec6305-502c-45d2-a3e8-5694a8d02cfe
6988c27a-1016-4ee8-9152-59ed531f3643	8b8977f2-e946-41bb-87e3-3a6326759685
7f1269d3-a492-4866-bed4-9e6a0b074217	8b8977f2-e946-41bb-87e3-3a6326759685
86486815-6c2f-49bd-9d5b-97d44f2bd34a	729236eb-d12c-45f8-90e3-80316536c069
9325045c-94f6-4981-97d8-c5c621cdee1d	9aec6305-502c-45d2-a3e8-5694a8d02cfe
9868cec6-2f52-4b00-9dd3-5b055bc406ca	68eb5ed1-0077-452c-b6ca-4eebf1a1280c
99dfe2c5-1cfb-4631-99dd-e94c02350557	9aec6305-502c-45d2-a3e8-5694a8d02cfe
a2619cff-2aac-4bf0-aadf-573e9f0d2aeb	226d040d-a046-4697-8f3f-75c35804c710
b4dd185e-d862-4adb-a400-a66c0871b65d	9aec6305-502c-45d2-a3e8-5694a8d02cfe
bdb1b12d-c16b-4293-98cf-bb793693ca34	cb47b3e1-d373-43e9-962a-fa664fcacc82
c0837f8b-918e-4684-a612-d6c99cf0d98f	226d040d-a046-4697-8f3f-75c35804c710
c5d16322-f78b-4442-8a25-7fbc40bfab2f	9aec6305-502c-45d2-a3e8-5694a8d02cfe
cd420984-2fbd-4b22-ac87-a2e64481e1dc	729236eb-d12c-45f8-90e3-80316536c069
e64d674a-5be1-4f2a-89eb-e3b0e9fb64b8	d29f070e-3868-4f8d-8a52-a99d2dad2652
fa70c644-a843-482b-a779-d98931242c6b	983e3df7-f124-4a79-9c3a-eff259a7c956
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
07346e03-e4e0-4c76-8fb7-6533533ab0c0	2a0e612e-a9b3-4016-aa5b-0395d22c61be	\N	153274
1643b58a-11ab-44b8-a4f1-f1191d795d03	982efe6e-5c64-4bd3-b6a3-76dfa317869b	\N	155288
1d417ab7-0260-4c70-b7e4-20aa6b43c025	5e9e6b49-fe8f-4274-ab29-fd7bddc12037	76f508dd-7713-4bcf-abd1-a479fd13d704	151299
28e76297-185a-48ac-8a43-a26699d21a30	841a364e-590e-4c23-80bd-a1270ad069c3	\N	152444
33c47c2b-038e-4799-aeb3-6dccdb2dce7b	e0a81cd6-bc6a-47f4-911f-0a174cff9563	fa2d0c70-b756-42b0-8cfe-c3ca5fcc1d2f	132695
37c81fb0-d78b-4a6a-accd-aef143c8af11	c7641c9c-9dac-4c0f-abad-ebbfdeb0c8af	9c64a538-eb87-4633-9904-93610245af02	120756
38f9e769-6730-4514-9230-beb9327c6303	5788ee0b-ddb6-4185-b98a-c721ac360a12	3970514d-099b-4adc-be89-c960fc8bc398	121267
5e7bd019-f70c-4051-8281-9d41f3652be4	76e2eea2-125f-44fb-88a7-685420635ec3	72d836f6-40a4-49eb-a6c4-9b6eb90b9774	145092
62e7b2ed-f49a-44be-a281-0683a08a20df	74fd38e3-853a-42b6-9077-8818bd2d03a8	\N	147329
6988c27a-1016-4ee8-9152-59ed531f3643	6cbf0bcc-c9fb-4d93-ab09-6c425f1b8cc9	\N	151861
7f1269d3-a492-4866-bed4-9e6a0b074217	20420c61-cc9e-4dd8-a495-09e41385abd4	\N	152441
86486815-6c2f-49bd-9d5b-97d44f2bd34a	f97e88b5-a939-4448-b20b-8d8f961a72e1	\N	156278
9325045c-94f6-4981-97d8-c5c621cdee1d	101e5ba5-bda6-4d5f-a010-5523ad4ed07f	\N	121537
9868cec6-2f52-4b00-9dd3-5b055bc406ca	faf8d37f-24fc-49d4-a19b-f2c65560d380	2d108954-02e1-4db2-bdce-77c4c5d6a367	150882
99dfe2c5-1cfb-4631-99dd-e94c02350557	7457b781-c1c8-4027-873a-1f8987b3a1b2	\N	121538
a2619cff-2aac-4bf0-aadf-573e9f0d2aeb	959e7830-bebe-4acc-82db-857af1e4e078	\N	149921
b4dd185e-d862-4adb-a400-a66c0871b65d	4b7bfa58-bc00-486f-a2e9-881dc2bd7e50	\N	156298
bdb1b12d-c16b-4293-98cf-bb793693ca34	35d9a7bd-117d-4a41-be80-0dfdc13ec8d8	72d836f6-40a4-49eb-a6c4-9b6eb90b9774	\N
c0837f8b-918e-4684-a612-d6c99cf0d98f	108e96ba-1983-47b4-803d-99c6848919e4	\N	150402
c5d16322-f78b-4442-8a25-7fbc40bfab2f	040a3505-8179-4828-946f-d212bde4c267	\N	152365
cd420984-2fbd-4b22-ac87-a2e64481e1dc	7b122d37-6580-48fd-bbd2-59d129988e6f	\N	152207
e64d674a-5be1-4f2a-89eb-e3b0e9fb64b8	cba73c8f-89e0-4102-9876-bbe4cec424d5	a720b4ed-05d6-4799-bae5-c3321344cdbb	117390
fa70c644-a843-482b-a779-d98931242c6b	14ccb8ee-9983-4012-8c89-8f1f1271c46f	a720b4ed-05d6-4799-bae5-c3321344cdbb	146325
932bbd8a-2f49-4601-8453-ca60799544c6	c550d472-f6c9-4390-9b8c-4433d2d64e2d	\N	\N
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
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "IdFromSystem") FROM stdin;
226d040d-a046-4697-8f3f-75c35804c710	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
68eb5ed1-0077-452c-b6ca-4eebf1a1280c	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
729236eb-d12c-45f8-90e3-80316536c069	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
8b8977f2-e946-41bb-87e3-3a6326759685	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
983e3df7-f124-4a79-9c3a-eff259a7c956	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
9aec6305-502c-45d2-a3e8-5694a8d02cfe	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
b19a60ae-3a84-494a-adcf-587ab8057c7f	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
cb47b3e1-d373-43e9-962a-fa664fcacc82	11111	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
d29f070e-3868-4f8d-8a52-a99d2dad2652	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
63dcd574-fcd4-4475-be0d-7cebfafb2930	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
616dc5b3-c733-44a8-ae94-86149187cd19	2023-02-19 02:13:55.157836	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	63dcd574-fcd4-4475-be0d-7cebfafb2930	932bbd8a-2f49-4601-8453-ca60799544c6	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	\N
a4978be6-6e1c-41c0-a7e0-461e22f082ad	2023-02-19 02:13:55.156851	19:43:13	19:43:58	100	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	63dcd574-fcd4-4475-be0d-7cebfafb2930	932bbd8a-2f49-4601-8453-ca60799544c6	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	\N
be2ddc65-f3a1-4a50-a1c4-959aed607e21	2023-02-19 02:13:55.156743	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	63dcd574-fcd4-4475-be0d-7cebfafb2930	932bbd8a-2f49-4601-8453-ca60799544c6	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	\N
f9c3aa69-1ff0-443a-824f-33f891f176b2	2023-02-19 02:13:55.157836	13:25:43	13:26:12	82	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	63dcd574-fcd4-4475-be0d-7cebfafb2930	932bbd8a-2f49-4601-8453-ca60799544c6	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
0e494411-0c15-4b9e-ac11-0de49363902f	1	1	f	2023-02-19 02:13:55.157835	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8207264f-7a19-4053-90fe-aa77d76e8eb3	932bbd8a-2f49-4601-8453-ca60799544c6	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	dd291f3c-5bdc-400d-9ecf-255ba071a7a9	\N
dc2d7bbc-9194-41da-bc31-2000001d1cb3	2	1	f	2023-02-19 02:13:55.155197	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	3a2d259a-36ae-4eae-9ee8-28f8204403be	932bbd8a-2f49-4601-8453-ca60799544c6	a9fc6a53-e5a7-4b2a-8926-52d78eb51f2b	dd291f3c-5bdc-400d-9ecf-255ba071a7a9	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
2c060082-fa79-48c1-9cb9-b5b578334bef	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	da0ea292-fa9f-453c-b3b4-b0684095816c	\N
9b545b33-e146-4319-9320-a7ba59b23a1e	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	da0ea292-fa9f-453c-b3b4-b0684095816c	\N
ea4e6e54-e036-45a1-8cfc-83fb644a10ab	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	da0ea292-fa9f-453c-b3b4-b0684095816c	\N
30467d20-25ee-4023-bbf3-4d3d0bcd8b31	1	12:10:00	13:10:00	13:20:00	13:50:00	93b1790d-62e0-4bb6-98a4-15b9fe98b338	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0c0ba714-5e98-4f1c-b4f9-fc96b9e69b00	2050	\N	27a08003-d76b-407c-a5b9-65f0890b356b	2050
2d108954-02e1-4db2-bdce-77c4c5d6a367	3690	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3690
31ab0d7b-4b72-4127-be3f-b65f6ab47f54	2150	\N	27a08003-d76b-407c-a5b9-65f0890b356b	2150
3970514d-099b-4adc-be89-c960fc8bc398	3600	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3600
3bb63017-e95b-456a-b786-3268c4300a76	1400	\N	75eca319-7c5d-4759-a645-93963cfddf69	1400
72d836f6-40a4-49eb-a6c4-9b6eb90b9774	3590	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3590
76f508dd-7713-4bcf-abd1-a479fd13d704	3650	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3650
87958787-8e89-47b6-9e8a-992442f6470b	2130	\N	27a08003-d76b-407c-a5b9-65f0890b356b	2130
9c64a538-eb87-4633-9904-93610245af02	3520	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3520
a720b4ed-05d6-4799-bae5-c3321344cdbb	3610	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3610
ac3f6844-bbf5-4698-82a1-c59e878a888c	1280	\N	75eca319-7c5d-4759-a645-93963cfddf69	1280
bf524bc4-b5a9-40d7-a598-65ad2c4a003a	1270	\N	75eca319-7c5d-4759-a645-93963cfddf69	1270
cb36fc00-7175-4751-9b7c-14697bded394	1390	\N	75eca319-7c5d-4759-a645-93963cfddf69	1390
d3bb8124-cc01-4706-9386-f0ffe88c8ebd	1550	\N	75eca319-7c5d-4759-a645-93963cfddf69	1550
d437822a-9e39-47f0-b416-62352cfa8b78	1360	\N	75eca319-7c5d-4759-a645-93963cfddf69	1360
d5cec8d1-bc70-4516-be22-eeae60e941d5	1260	\N	75eca319-7c5d-4759-a645-93963cfddf69	1260
fa2d0c70-b756-42b0-8cfe-c3ca5fcc1d2f	3500	\N	699689e1-e3cd-47c9-b4d4-1916de493820	3500
fc5cc0bc-c3f3-4fd4-ad81-eeb90e883f88	1380	\N	75eca319-7c5d-4759-a645-93963cfddf69	1380
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
3aa495f6-db77-43c2-bac3-9ce156c25eb8	Цех 480	480	480
88e1453f-7e30-46a4-9ec9-b5f74a959065	Цех 50	50	050
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
-- Name: MasterWeldingEquipment PK_MasterWeldingEquipment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MasterWeldingEquipment"
    ADD CONSTRAINT "PK_MasterWeldingEquipment" PRIMARY KEY ("MastersId", "WeldingEquipmentsId");


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
-- Name: IX_MasterWeldingEquipment_WeldingEquipmentsId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_MasterWeldingEquipment_WeldingEquipmentsId" ON public."MasterWeldingEquipment" USING btree ("WeldingEquipmentsId");


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
-- Name: MasterWeldingEquipment FK_MasterWeldingEquipment_Masters_MastersId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MasterWeldingEquipment"
    ADD CONSTRAINT "FK_MasterWeldingEquipment_Masters_MastersId" FOREIGN KEY ("MastersId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


--
-- Name: MasterWeldingEquipment FK_MasterWeldingEquipment_WeldingEquipments_WeldingEquipmentsId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MasterWeldingEquipment"
    ADD CONSTRAINT "FK_MasterWeldingEquipment_WeldingEquipments_WeldingEquipmentsId" FOREIGN KEY ("WeldingEquipmentsId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


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
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: WeldingRecords FK_WeldingRecords_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingRecords"
    ADD CONSTRAINT "FK_WeldingRecords_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


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

