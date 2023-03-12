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
0300daa1-9687-468b-8801-a38eb73e1a48	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
0fef3810-f8b0-48d0-9197-7a52f874e976	92b90e22-f8bc-4bf6-bd21-0ac2d7c3eff6	ef3d070a-05c8-4197-b422-f7b41a089eda	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
ed841dc6-0390-4227-9e4f-da662dbfbcdc	1	10	t	0300daa1-9687-468b-8801-a38eb73e1a48	\N
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
0b26cc85-d138-4b88-8683-fee51c704ab0	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
1155b433-b2c5-4670-a480-a67d56c7664e	Установка, выверка, снятие детали	\N
1639dc98-3763-4a4a-9bef-a9b130862b1a	Отсутствие сотрудника ОТК	\N
1939ca74-427f-4365-8199-3e036f2b943e	Плановый ремонт централизованными службами	\N
198df6e5-e80f-4e04-bb85-22bde03906f8	Ознакомление с работой, документацией, инструктаж	\N
1bea3339-bacf-4ba8-ade0-ead116e456b9	Праздники и выходные	\N
2b2193fb-6ba0-4a46-9e72-3964308d455d	Неявка оператора (б/лист, отпуск, и пр.)	\N
36c27d7b-c79c-409f-af49-418f1809532f	Обед	\N
49cb2679-a4c8-4d40-b95a-152920ee0d5f	Сборочные операции	\N
558dd47a-dece-4791-95d9-266318953241	Отсутствие материала, заготовок, деталей	\N
5a9940c5-ab63-4cfd-8a80-7b34a3aeec47	Аварийный ремонт централизованными службами	\N
624002a8-b767-4eba-9846-8d528c62b69f	Естественные надобности	\N
7046f377-210c-4ec6-9738-c0ba8d9cb62d	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
94a4bda8-3c63-4e99-aace-ce7a3b549ecb	Нерабочее время по графику согласно сменности	\N
99aa1e8a-ffce-4466-81cc-fc21f81c4382	Отсутствие заданий	\N
9d2f0a89-ce86-44db-b236-03444126474b	Работа по карте несоответствий	\N
9e1005b7-a63b-49a2-8f40-cc53a845873b	Отсутствие энергоносителей	\N
a459b7be-df6a-4cee-ba3f-4b6006de306d	Работа с управляющей программой	\N
b0f5fd78-8019-4ddd-9646-a690267e4250	Отсутствие крана, транспорта	\N
b2da438f-8400-4659-877f-9262f0d6a727	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
bb55d2d2-a8a3-41b5-a56f-da2f7b667387	Изменение режимов, смена инструмента, приспособления	\N
c27535d6-8b00-448d-857a-398272aef186	Установка, выверка, снятие детали	\N
c38cea84-7407-4548-a955-6db6cd19cd31	Контроль на рабочем месте	\N
d0ae61ac-052d-4a7c-aca0-7b9537b745b1	Отсутствие конструктора, технолога или ожидание его решения	\N
d23a5491-bcb1-4603-a2a3-9adb91345ad9	Отсутствие оператора в связи с необеспеченностью	\N
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
061783c8-f5cf-45d4-836b-bf000991d718	d8977782-218a-4ae1-b1c4-13b802ee11b2	219379
ec3ec66a-c020-457e-89ce-56e475901daf	40db31b1-d5bb-42aa-ba3a-269351d7cd2d	249550
01fe7df5-c066-47dc-a6c3-b53c763be6ec	64d6cbd2-51f0-44e8-96c7-e1f865df59e9	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
73f29544-f289-44e2-8ce9-80052abe49ba	1dddbf83-a0fc-43fe-9b94-79cb4aae8204	610422
ba14a53f-ad36-40f1-8cb1-131fda458518	e80108dc-7854-40d3-b895-3c2f646e9157	614962
5bf3bf73-4a95-4685-b790-8d2295efb72c	f25749ac-faba-422b-befb-4d8198bf908f	\N
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
05cba0aa-c3e9-4221-8935-7d05ced5b23f	27	2	2023-03-12 12:56:49.666381	93258644-ed20-4779-b586-8cc0fc4d836c	\N
0a3ea100-02b0-49a9-a0fb-9ad2fb6ae5aa	24	2	2023-03-12 12:56:49.666376	840922d2-a88e-463c-9770-602050ee1de2	\N
0b64be80-3b41-4aa2-8d01-1d48a4bbf093	26	2	2023-03-12 12:56:49.666381	8b046eb8-b7ef-4c06-8056-0b61277fa893	\N
0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	9	2	2023-03-12 12:56:49.666359	2a2b05ee-1417-40a0-b0a3-9361c29e97af	\N
123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	10	2	2023-03-12 12:56:49.666359	31cac7b5-b08e-41c8-b16a-ac6c925563e7	\N
1488ae86-b4df-480a-9770-a7143332e9b9	15	2	2023-03-12 12:56:49.666365	4fd927d0-908b-47f3-9e8d-424c9b827c6b	\N
1d011815-ea6a-4a38-93f7-2d95b5c977b8	18	2	2023-03-12 12:56:49.666367	679a789d-5479-4ecd-bb3b-ae72af5b56ee	\N
1e2ab086-0c56-4f5d-acf2-9781642dc1bb	16	2	2023-03-12 12:56:49.666366	59e26aa8-f0d8-4df9-a6b7-69d8d7ef87fc	\N
25cb2cb2-e553-4014-9306-f91cd31c26fc	19	2	2023-03-12 12:56:49.666367	6c41941d-38fb-4119-a2ed-091429bd916c	\N
4b27eb58-ca6e-448f-bbc8-be0de5859ef5	3	2	2023-03-12 12:56:49.666346	19886c8d-e4cd-4c13-9df6-db3b98e4b43b	\N
4b725a37-d5f5-43fe-acfc-bf67539d2857	11	2	2023-03-12 12:56:49.66636	327f314d-0c05-49fd-b730-9b34f3a4d7e9	\N
4e2a2461-2c4d-4702-8aca-af64562e3aa7	2	2	2023-03-12 12:56:49.666345	1183be85-60aa-4f12-9fef-2fcfe06a3d59	\N
50e6b3af-ada8-448a-8daf-57791f9b2761	34	2	2023-03-12 12:56:49.666388	de00c88f-02e6-49b9-b468-a9a5ea425e41	\N
52fa56e9-9530-45ab-a32a-497b79e9ba60	8	2	2023-03-12 12:56:49.666354	2580406a-d593-48cb-b9ae-cf37a7c16339	\N
55f6a3b2-6ec7-443d-9b4c-8868ecd4a4a4	4	2	2023-03-12 12:56:49.666352	1eb4ef5d-1a96-4177-8b35-ceffbc27ef35	\N
590867ba-0fda-421e-a567-56cd459b7013	28	2	2023-03-12 12:56:49.666382	9aa12897-6add-435b-8920-18282ac0412f	\N
5a86b8d0-6723-4a35-987a-8e325cfec722	13	2	2023-03-12 12:56:49.666361	3411c50d-0de7-45bb-9fee-a7360addbdb2	\N
658a438d-cc59-4ff1-89ef-d66c9f333f72	29	2	2023-03-12 12:56:49.666382	ae62891e-f9ad-445d-b1c1-fdcc4856a788	\N
67a44e94-528b-4025-9fb6-56511336b812	20	2	2023-03-12 12:56:49.666368	72c8931f-47ff-4762-a884-c66b1a8f8811	\N
825d742d-d501-4793-9fe4-30daa7329abc	7	2	2023-03-12 12:56:49.666354	24bfc6f7-1f61-4261-b9c8-cc50b903d70a	\N
84a1627e-10d8-424d-b83b-c9657a24f576	17	2	2023-03-12 12:56:49.666366	5c85656b-665c-4ac9-97f5-d50145290d8a	\N
86485457-134b-4bfd-aad9-233923461f18	30	2	2023-03-12 12:56:49.666382	ae94e562-5e50-420c-8ecb-896ab2310d2f	\N
a0c71973-b70e-4812-85e1-a377e02e555c	25	2	2023-03-12 12:56:49.666376	85db1316-7e7e-419f-9d3b-683a5e8ed07e	\N
a6eb3643-7833-46ed-91b1-96de4c9c121a	21	2	2023-03-12 12:56:49.666374	73ac1426-fa4e-4839-bf66-8a9ab04e884c	\N
a985eaa5-120a-4137-b3af-4152a9b5445f	5	2	2023-03-12 12:56:49.666353	21ececf9-24fc-4463-9589-c0fce2fcb976	\N
b57df3f7-14b2-4e6b-b897-33edcbcfd046	36	2	2023-03-12 12:56:49.666389	eeb0bc45-bfef-482d-919c-38cf0defa556	\N
baf9e344-fc61-4b48-806e-17e55570b078	12	2	2023-03-12 12:56:49.66636	33455f91-db6f-431f-a95a-79e9d5da76ec	\N
c4c113d6-4742-4a30-8931-a76586dd6595	14	2	2023-03-12 12:56:49.666365	49a70041-773c-4de8-98f8-efea4453047d	\N
c6c6a15e-b8c5-4189-9edc-55fa8165b191	1	2	2023-03-12 12:56:49.666262	013358a3-bc69-409a-a01f-4cfba3ea4c7c	\N
c7d9f1cb-4502-47c7-a5f9-4d56b5c288e6	32	2	2023-03-12 12:56:49.666383	bf9b3b78-d618-446e-8722-a85a0094fda7	\N
df7168e3-0c38-4d2d-b308-ece179280689	22	2	2023-03-12 12:56:49.666375	7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b	\N
e76eed77-3cbb-4c9e-8858-84a00d1b01a5	6	2	2023-03-12 12:56:49.666353	23273a77-40d5-472c-bcb6-cc1adf2b7bc9	\N
e87ac597-41e7-4262-a38f-9ef69d2714bf	23	2	2023-03-12 12:56:49.666376	8388fc98-0131-4b28-b815-727be8cd4849	\N
e976d713-2629-4788-99db-975856ee038a	31	2	2023-03-12 12:56:49.666383	b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	\N
f2d46fae-277f-4d1f-8ee2-03c3ac18d081	35	2	2023-03-12 12:56:49.666388	e869c718-fe85-4296-8745-fd76857cf5cb	\N
f9f2f176-441e-468f-8b72-cb0619dbe9de	33	2	2023-03-12 12:56:49.666387	c6952e0b-83f7-4574-b55b-02b74a3bdbe1	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	013358a3-bc69-409a-a01f-4cfba3ea4c7c
72c8931f-47ff-4762-a884-c66b1a8f8811	1183be85-60aa-4f12-9fef-2fcfe06a3d59
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	19886c8d-e4cd-4c13-9df6-db3b98e4b43b
de00c88f-02e6-49b9-b468-a9a5ea425e41	1eb4ef5d-1a96-4177-8b35-ceffbc27ef35
72c8931f-47ff-4762-a884-c66b1a8f8811	21ececf9-24fc-4463-9589-c0fce2fcb976
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	23273a77-40d5-472c-bcb6-cc1adf2b7bc9
b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	2580406a-d593-48cb-b9ae-cf37a7c16339
72c8931f-47ff-4762-a884-c66b1a8f8811	2a2b05ee-1417-40a0-b0a3-9361c29e97af
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	31cac7b5-b08e-41c8-b16a-ac6c925563e7
de00c88f-02e6-49b9-b468-a9a5ea425e41	327f314d-0c05-49fd-b730-9b34f3a4d7e9
72c8931f-47ff-4762-a884-c66b1a8f8811	33455f91-db6f-431f-a95a-79e9d5da76ec
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	3411c50d-0de7-45bb-9fee-a7360addbdb2
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	49a70041-773c-4de8-98f8-efea4453047d
72c8931f-47ff-4762-a884-c66b1a8f8811	4fd927d0-908b-47f3-9e8d-424c9b827c6b
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	59e26aa8-f0d8-4df9-a6b7-69d8d7ef87fc
72c8931f-47ff-4762-a884-c66b1a8f8811	5c85656b-665c-4ac9-97f5-d50145290d8a
72c8931f-47ff-4762-a884-c66b1a8f8811	679a789d-5479-4ecd-bb3b-ae72af5b56ee
72c8931f-47ff-4762-a884-c66b1a8f8811	6c41941d-38fb-4119-a2ed-091429bd916c
72c8931f-47ff-4762-a884-c66b1a8f8811	73ac1426-fa4e-4839-bf66-8a9ab04e884c
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	8388fc98-0131-4b28-b815-727be8cd4849
b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	840922d2-a88e-463c-9770-602050ee1de2
72c8931f-47ff-4762-a884-c66b1a8f8811	85db1316-7e7e-419f-9d3b-683a5e8ed07e
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	8b046eb8-b7ef-4c06-8056-0b61277fa893
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	93258644-ed20-4779-b586-8cc0fc4d836c
72c8931f-47ff-4762-a884-c66b1a8f8811	9aa12897-6add-435b-8920-18282ac0412f
72c8931f-47ff-4762-a884-c66b1a8f8811	ae62891e-f9ad-445d-b1c1-fdcc4856a788
b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	ae94e562-5e50-420c-8ecb-896ab2310d2f
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	b0dbe5cd-edda-4f5c-86d7-f04a9da0a161
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	bf9b3b78-d618-446e-8722-a85a0094fda7
de00c88f-02e6-49b9-b468-a9a5ea425e41	c6952e0b-83f7-4574-b55b-02b74a3bdbe1
72c8931f-47ff-4762-a884-c66b1a8f8811	de00c88f-02e6-49b9-b468-a9a5ea425e41
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	e869c718-fe85-4296-8745-fd76857cf5cb
de00c88f-02e6-49b9-b468-a9a5ea425e41	eeb0bc45-bfef-482d-919c-38cf0defa556
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
0051de79-966e-4bb6-8d9d-f639501e4c2c	0	2	\N	\N	4b725a37-d5f5-43fe-acfc-bf67539d2857	\N
03c14673-548a-4f27-a446-d1b614461196	0	1	\N	\N	0a3ea100-02b0-49a9-a0fb-9ad2fb6ae5aa	\N
05aeec93-f293-4818-9ff8-ae1d8b667f77	0	2	\N	\N	a6eb3643-7833-46ed-91b1-96de4c9c121a	\N
079f830e-2cdd-483b-ad79-2104a74800cd	0	3	\N	\N	67a44e94-528b-4025-9fb6-56511336b812	\N
0bac5b6c-b430-49c5-8a7a-e3198fc648c3	0	1	\N	\N	67a44e94-528b-4025-9fb6-56511336b812	\N
0d5a25cc-2789-44ed-8014-7280ec730809	0	3	\N	\N	1488ae86-b4df-480a-9770-a7143332e9b9	\N
0ea9e88e-5feb-4c9c-b46e-df49928d1c6a	0	1	\N	\N	55f6a3b2-6ec7-443d-9b4c-8868ecd4a4a4	\N
150777fe-0259-4f71-972f-8c5a8adf8d6c	0	2	\N	\N	84a1627e-10d8-424d-b83b-c9657a24f576	\N
1558b2a2-50d5-4307-b47a-eb8be12ebb30	0	2	\N	\N	c4c113d6-4742-4a30-8931-a76586dd6595	\N
15d8dc61-4e66-4ae5-bc35-662ec5bed1ee	0	1	\N	\N	25cb2cb2-e553-4014-9306-f91cd31c26fc	\N
1a97a4bf-f97b-42f7-a9c9-b820a6626757	0	2	\N	\N	590867ba-0fda-421e-a567-56cd459b7013	\N
1b066290-8e10-484f-9c26-71a3c1271031	0	2	\N	\N	e87ac597-41e7-4262-a38f-9ef69d2714bf	\N
1f75f3bd-fca9-4ffd-bc28-c5da75e1d02d	0	1	\N	\N	f9f2f176-441e-468f-8b72-cb0619dbe9de	\N
20c1ed3a-8cde-45cc-b5d9-1a080a8c2999	0	1	\N	\N	658a438d-cc59-4ff1-89ef-d66c9f333f72	\N
22ebbd5c-e316-4766-ba06-f0167e71d9ca	0	1	\N	\N	05cba0aa-c3e9-4221-8935-7d05ced5b23f	\N
2445a132-9ae8-402c-9473-367a11e5eb9a	0	2	\N	\N	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
254f3d22-a3b5-4dc7-8c6a-8467a52fd710	0	1	\N	\N	4b725a37-d5f5-43fe-acfc-bf67539d2857	\N
2922c028-70d7-4295-b914-51fc92bd070e	0	1	\N	\N	c7d9f1cb-4502-47c7-a5f9-4d56b5c288e6	\N
2d7051e1-c216-42b0-91f4-32183f40cdb6	0	3	\N	\N	0b64be80-3b41-4aa2-8d01-1d48a4bbf093	\N
2df0f1ac-abc4-48cd-ba43-d85db4b38411	0	1	\N	\N	1e2ab086-0c56-4f5d-acf2-9781642dc1bb	\N
2e9c7478-0d26-47d6-a113-ef1e13b4b03d	0	2	\N	\N	0a3ea100-02b0-49a9-a0fb-9ad2fb6ae5aa	\N
300d33a1-aef8-4417-b0da-0af7bce56751	0	1	\N	\N	0b64be80-3b41-4aa2-8d01-1d48a4bbf093	\N
34c2d850-2f73-4658-88fd-c3d428329037	0	2	\N	\N	67a44e94-528b-4025-9fb6-56511336b812	\N
3ff53b3e-c493-48b1-9b2a-837e10301046	0	2	\N	\N	5a86b8d0-6723-4a35-987a-8e325cfec722	\N
460fe99d-092b-4243-a95c-9d216232873a	0	1	\N	\N	825d742d-d501-4793-9fe4-30daa7329abc	\N
47bfc997-3f34-4bf4-8c04-e431632c31fc	0	3	\N	\N	825d742d-d501-4793-9fe4-30daa7329abc	\N
47cc05a9-555a-45b0-979d-18f1389d47e1	0	1	\N	\N	baf9e344-fc61-4b48-806e-17e55570b078	\N
4ba0b837-b64b-4976-896e-4b555fdbc25f	0	3	\N	\N	e76eed77-3cbb-4c9e-8858-84a00d1b01a5	\N
4e2fa538-933a-486f-baf6-13f94a7738ca	0	3	\N	\N	25cb2cb2-e553-4014-9306-f91cd31c26fc	\N
4eae1bde-d1df-4037-b2be-74eefdda726d	0	2	\N	\N	c7d9f1cb-4502-47c7-a5f9-4d56b5c288e6	\N
51c7e136-74a5-47cd-9a7c-2b0578df0692	0	3	\N	\N	c7d9f1cb-4502-47c7-a5f9-4d56b5c288e6	\N
575cfa89-fbd4-424c-8068-d62d4b756dbc	0	2	\N	\N	0b64be80-3b41-4aa2-8d01-1d48a4bbf093	\N
576b0045-2e7d-44f7-b9d7-be65061ad3c1	0	2	\N	\N	1d011815-ea6a-4a38-93f7-2d95b5c977b8	\N
5cd2a58a-f86b-4f0f-9b2a-77ac74873ac0	0	3	\N	\N	0a3ea100-02b0-49a9-a0fb-9ad2fb6ae5aa	\N
63c0d9a6-9d87-4f71-a47b-506b8a438916	0	2	\N	\N	52fa56e9-9530-45ab-a32a-497b79e9ba60	\N
63d5bde8-470a-4a1d-8369-2367f5e800a1	0	3	\N	\N	50e6b3af-ada8-448a-8daf-57791f9b2761	\N
670a6fe3-4617-4e1f-a758-8827db7cfdb2	0	2	\N	\N	05cba0aa-c3e9-4221-8935-7d05ced5b23f	\N
7086170c-a13c-4250-bd92-1cebc77f4a2b	0	3	\N	\N	f2d46fae-277f-4d1f-8ee2-03c3ac18d081	\N
726a2444-d183-4dde-9a04-21141c57b088	0	3	\N	\N	52fa56e9-9530-45ab-a32a-497b79e9ba60	\N
72871618-b6d7-497f-9798-1ff03e8bc2fb	0	2	\N	\N	4b27eb58-ca6e-448f-bbc8-be0de5859ef5	\N
73df0cd4-f133-467d-aa1b-bcbceb594b62	0	3	\N	\N	86485457-134b-4bfd-aad9-233923461f18	\N
74eecd3d-ec4b-4e15-9c81-cddb3081b559	0	1	\N	\N	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
79877531-0a49-42a7-9d26-12dc0cef4931	0	2	\N	\N	658a438d-cc59-4ff1-89ef-d66c9f333f72	\N
7d36e654-1c9c-48b0-a41a-32fc01a47ca5	0	1	\N	\N	c4c113d6-4742-4a30-8931-a76586dd6595	\N
7d88409b-a8a1-4189-8747-74dbefd09442	0	3	\N	\N	5a86b8d0-6723-4a35-987a-8e325cfec722	\N
831d0b70-ab4d-4fe3-b01d-af36ffee44f0	0	1	\N	\N	4b27eb58-ca6e-448f-bbc8-be0de5859ef5	\N
83ebc59c-3978-4a9b-a0bf-0ada80ad9c14	0	2	\N	\N	df7168e3-0c38-4d2d-b308-ece179280689	\N
85caca5a-515a-4912-9849-c50787fbb940	0	2	\N	\N	e76eed77-3cbb-4c9e-8858-84a00d1b01a5	\N
8711751b-dbc8-4355-b2ec-a612ba83b0f0	0	1	\N	\N	1d011815-ea6a-4a38-93f7-2d95b5c977b8	\N
875a8734-7925-469a-8098-384b647ef501	0	3	\N	\N	1d011815-ea6a-4a38-93f7-2d95b5c977b8	\N
87ef4e0a-f030-48cf-800b-9bedbe61212d	0	3	\N	\N	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
8961f8da-92ba-4c78-85e6-ad6cbe23980a	0	2	\N	\N	825d742d-d501-4793-9fe4-30daa7329abc	\N
8cfa9cdd-f1fd-4dbd-9942-6584097877fc	0	3	\N	\N	baf9e344-fc61-4b48-806e-17e55570b078	\N
972d4bcc-cb93-4947-8050-363415d508e8	0	1	\N	\N	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
97a6cecf-f5b7-4e55-96c0-c96cce895eae	0	3	\N	\N	4b27eb58-ca6e-448f-bbc8-be0de5859ef5	\N
97b8db99-2222-4562-b7c3-aa8024f6607b	0	2	\N	\N	a985eaa5-120a-4137-b3af-4152a9b5445f	\N
981138fd-4eae-4b7f-9971-2c1350404e47	0	1	\N	\N	e87ac597-41e7-4262-a38f-9ef69d2714bf	\N
99c35ad2-e670-4208-8f97-a2b346576022	0	2	\N	\N	f9f2f176-441e-468f-8b72-cb0619dbe9de	\N
9aede796-5750-460f-be99-69ccf4794891	0	2	\N	\N	25cb2cb2-e553-4014-9306-f91cd31c26fc	\N
a012bcc1-af6c-447f-996f-241ceec47ce2	0	1	\N	\N	e976d713-2629-4788-99db-975856ee038a	\N
a05bf2f6-19fc-405f-9d1f-b9400a441f27	0	2	\N	\N	c6c6a15e-b8c5-4189-9edc-55fa8165b191	\N
a2476ab8-a4ea-4b19-9620-d0eb5f4eb36d	0	3	\N	\N	84a1627e-10d8-424d-b83b-c9657a24f576	\N
a3ee13dd-5f38-41a7-bb5d-7f981ff9103f	0	1	\N	\N	c6c6a15e-b8c5-4189-9edc-55fa8165b191	\N
a44ec342-fbd2-43ff-98b8-9de29fb94027	0	2	\N	\N	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
a586a03b-ea70-47c0-98dc-a3a6ef2e9dc7	0	3	\N	\N	c6c6a15e-b8c5-4189-9edc-55fa8165b191	\N
a5a8d4c8-ba5e-4a8f-ae49-be9316ac56eb	0	3	\N	\N	4b725a37-d5f5-43fe-acfc-bf67539d2857	\N
a72772ce-c41f-44a4-afbe-37cdd987598e	0	2	\N	\N	a0c71973-b70e-4812-85e1-a377e02e555c	\N
a93bd06c-5825-443e-bfa6-a9866062ed4e	0	1	\N	\N	b57df3f7-14b2-4e6b-b897-33edcbcfd046	\N
a9c7ff0f-e9ff-4ef0-9aa2-6a624137d877	0	3	\N	\N	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
ab99e1f4-2204-47e0-8f34-a8cdf833b8b2	0	3	\N	\N	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
ade2bab6-f9c6-4626-b9b1-b4419e0a4ebd	0	1	\N	\N	590867ba-0fda-421e-a567-56cd459b7013	\N
b2496ac5-d030-4e7d-8449-408e43cda9a8	0	2	\N	\N	1e2ab086-0c56-4f5d-acf2-9781642dc1bb	\N
b2bdc4bc-d244-4a5f-9e24-1e81af33b352	0	1	\N	\N	1488ae86-b4df-480a-9770-a7143332e9b9	\N
b395ffbd-e53c-4f1f-8a53-7ec41e961571	0	3	\N	\N	b57df3f7-14b2-4e6b-b897-33edcbcfd046	\N
b46c60a8-4bb1-4856-8892-5c2c40bac61b	0	1	\N	\N	a0c71973-b70e-4812-85e1-a377e02e555c	\N
b5ae4463-5631-4b32-b87d-8f5b61427af7	0	3	\N	\N	a985eaa5-120a-4137-b3af-4152a9b5445f	\N
b633e6aa-0529-4079-b329-8ebe0feb1691	0	2	\N	\N	50e6b3af-ada8-448a-8daf-57791f9b2761	\N
b66ec495-5b8a-47d2-971a-a8802d963de3	0	2	\N	\N	86485457-134b-4bfd-aad9-233923461f18	\N
b81c2e37-184b-4811-9394-4f3fd517c497	0	1	\N	\N	a6eb3643-7833-46ed-91b1-96de4c9c121a	\N
b9c1ed97-fa93-4977-8abd-e75bcfbf50be	0	3	\N	\N	05cba0aa-c3e9-4221-8935-7d05ced5b23f	\N
b9e7e073-1691-4246-a84f-5a3c93ea7b7d	0	1	\N	\N	84a1627e-10d8-424d-b83b-c9657a24f576	\N
bcf1bbde-fba5-4275-95c1-10557919dddd	0	3	\N	\N	e87ac597-41e7-4262-a38f-9ef69d2714bf	\N
bffc075e-ed63-4e8d-b8ba-560344f45f91	0	2	\N	\N	b57df3f7-14b2-4e6b-b897-33edcbcfd046	\N
c0f025fb-9509-4e10-87c2-e991095ddffc	0	3	\N	\N	590867ba-0fda-421e-a567-56cd459b7013	\N
c4817a43-875e-4d44-9c0e-3d04948b7df8	0	2	\N	\N	baf9e344-fc61-4b48-806e-17e55570b078	\N
c4ecfbb0-4260-4a99-bfd5-e9dc1dfb0e82	0	3	\N	\N	e976d713-2629-4788-99db-975856ee038a	\N
c59ed4d7-9afe-4897-bf88-499f9f5b2e85	0	3	\N	\N	f9f2f176-441e-468f-8b72-cb0619dbe9de	\N
c6da9395-541a-476b-a0fe-1332b3c52116	0	1	\N	\N	86485457-134b-4bfd-aad9-233923461f18	\N
ccf208f4-8a18-48de-bf88-ba2bee6767ff	0	2	\N	\N	55f6a3b2-6ec7-443d-9b4c-8868ecd4a4a4	\N
d21e3b22-241f-4a10-ac4f-a9d170d876de	0	3	\N	\N	df7168e3-0c38-4d2d-b308-ece179280689	\N
d3d91915-2833-4aed-a3c0-b0a7e85ca74a	0	3	\N	\N	c4c113d6-4742-4a30-8931-a76586dd6595	\N
d90e51fd-17f2-4c0b-ba46-1daddc938100	0	1	\N	\N	df7168e3-0c38-4d2d-b308-ece179280689	\N
dc2e5285-f191-461f-b4c2-03b96cd24cb6	0	3	\N	\N	658a438d-cc59-4ff1-89ef-d66c9f333f72	\N
dc95bccb-20e3-445e-bf2d-2870119c3123	0	2	\N	\N	f2d46fae-277f-4d1f-8ee2-03c3ac18d081	\N
de700051-35e3-4154-ab63-bc338fb37542	0	3	\N	\N	55f6a3b2-6ec7-443d-9b4c-8868ecd4a4a4	\N
df7ddd00-bc09-45a2-a667-762e24f3fb9c	0	3	\N	\N	a6eb3643-7833-46ed-91b1-96de4c9c121a	\N
e0d1b84c-2ac2-45b8-b89a-191a8cef6832	0	1	\N	\N	5a86b8d0-6723-4a35-987a-8e325cfec722	\N
e35368e2-8522-49d3-baa5-326101c3fce3	0	3	\N	\N	1e2ab086-0c56-4f5d-acf2-9781642dc1bb	\N
e7150210-db44-4317-a6c8-46ac9592ef10	0	1	\N	\N	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
ecd87938-f2c4-4198-8580-8d0ce89fc673	0	2	\N	\N	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
ed41e5e3-a1ca-4d48-860b-b2db648e76cc	0	2	\N	\N	e976d713-2629-4788-99db-975856ee038a	\N
ed67538b-29da-4fb3-9c6e-a6cee2353dd5	0	3	\N	\N	a0c71973-b70e-4812-85e1-a377e02e555c	\N
ef5a89c2-a427-40e6-b335-2c42db2c2ead	0	1	\N	\N	52fa56e9-9530-45ab-a32a-497b79e9ba60	\N
f3a1564b-409a-4dfc-8268-c33075e0826d	0	1	\N	\N	f2d46fae-277f-4d1f-8ee2-03c3ac18d081	\N
fd928ca1-9835-47c5-852f-b8289ec2b76d	0	1	\N	\N	e76eed77-3cbb-4c9e-8858-84a00d1b01a5	\N
ff0320e5-075a-411a-b55c-878f053bb3c1	0	1	\N	\N	50e6b3af-ada8-448a-8daf-57791f9b2761	\N
ffabb06f-9b1c-4b9c-b36a-7a8f6757da0f	0	2	\N	\N	1488ae86-b4df-480a-9770-a7143332e9b9	\N
ffed7091-6cba-4cb0-b4b6-b09c2ce62c4e	0	1	\N	\N	a985eaa5-120a-4137-b3af-4152a9b5445f	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
b6cb036d-a485-4f54-bf88-d409f90a74d0	Сборка, сварка рам к/с г/п 120-130 т.	6	ef3d070a-05c8-4197-b422-f7b41a089eda	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
013358a3-bc69-409a-a01f-4cfba3ea4c7c	Поперечина	75131-2801325	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
1183be85-60aa-4f12-9fef-2fcfe06a3d59	Лонжерон рамы правый	75131-2801014-41	t	2	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
19886c8d-e4cd-4c13-9df6-db3b98e4b43b	Опора	75131-2801188	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
1eb4ef5d-1a96-4177-8b35-ceffbc27ef35	Кронштейн задней опоры	75131-8521182-20	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
21ececf9-24fc-4463-9589-c0fce2fcb976	Лонжерон рамы левый	75131-2801017-70	t	2	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
23273a77-40d5-472c-bcb6-cc1adf2b7bc9	Опора	75131-2801189	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
24bfc6f7-1f61-4261-b9c8-cc50b903d70a	Рама	75131-2800010-70	t	1	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	4536479362
2580406a-d593-48cb-b9ae-cf37a7c16339	Лист верхний	75131-2801357-10	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
2a2b05ee-1417-40a0-b0a3-9361c29e97af	Лонжерон рамы левый	75131-2801015-41	t	2	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
31cac7b5-b08e-41c8-b16a-ac6c925563e7	Лонжерон рамы левый	75131-2801015-41	t	2	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
327f314d-0c05-49fd-b730-9b34f3a4d7e9	Кронштейн задней опоры	75131-8521183-20	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
33455f91-db6f-431f-a95a-79e9d5da76ec	Усилитель	75131-2801114-01	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
3411c50d-0de7-45bb-9fee-a7360addbdb2	Лист нижний	75131-2801358-10	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
49a70041-773c-4de8-98f8-efea4453047d	Лонжерон рамы левый	75131-2801017-70	t	2	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
4fd927d0-908b-47f3-9e8d-424c9b827c6b	Поперечина №3 рамы с опорами	75132-2801152	t	2	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
59e26aa8-f0d8-4df9-a6b7-69d8d7ef87fc	Поперечина №3 рамы с опорами	75132-2801152	t	2	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
5c85656b-665c-4ac9-97f5-d50145290d8a	Лонжерон рамы правый	75131-2801016-70	t	2	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
679a789d-5479-4ecd-bb3b-ae72af5b56ee	Поперечина	75131-2801103-10	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
6c41941d-38fb-4119-a2ed-091429bd916c	Опора	75131-2801188	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
72c8931f-47ff-4762-a884-c66b1a8f8811	Рама	7513D-2800010-20	t	1	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	4536492774
73ac1426-fa4e-4839-bf66-8a9ab04e884c	Опора	75131-2801189	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
8388fc98-0131-4b28-b815-727be8cd4849	Усилитель	75131-2801115-01	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
840922d2-a88e-463c-9770-602050ee1de2	Кронштейн задней опоры	75131-8521183-20	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
85db1316-7e7e-419f-9d3b-683a5e8ed07e	Накладка рамы поперечная передняя	75131-2801088-70	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
8b046eb8-b7ef-4c06-8056-0b61277fa893	Лонжерон рамы правый	75131-2801016-70	t	2	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
93258644-ed20-4779-b586-8cc0fc4d836c	Поперечина	75131-2801103-10	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
ae62891e-f9ad-445d-b1c1-fdcc4856a788	Усилитель	75131-2801115-01	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
ae94e562-5e50-420c-8ecb-896ab2310d2f	Кронштейн задней опоры	75131-8521182-20	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	Поперечина рамы задняя	75131-2801300-20	t	2	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
bf9b3b78-d618-446e-8722-a85a0094fda7	Усилитель	75131-2801114-01	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
c6952e0b-83f7-4574-b55b-02b74a3bdbe1	Поперечина	75131-2801325	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
de00c88f-02e6-49b9-b468-a9a5ea425e41	Поперечина рамы задняя	75131-2801300-20	t	2	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
e869c718-fe85-4296-8745-fd76857cf5cb	Накладка рамы поперечная передняя	75131-2801088-70	t	3	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
eeb0bc45-bfef-482d-919c-38cf0defa556	Лист верхний	75131-2801357-10	t	3	c5807e80-769b-4653-bc75-e0d004ae6a9d	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N	\N	\N
7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b	Лонжерон рамы правый	75131-2801014-41	t	2	ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	b6cb036d-a485-4f54-bf88-d409f90a74d0	73f29544-f289-44e2-8ce9-80052abe49ba	\N	\N	\N
9aa12897-6add-435b-8920-18282ac0412f	Лист нижний	75131-2801358-10	t	3	18093ee7-a817-4301-a7f8-daf7d028b9d0	b6cb036d-a485-4f54-bf88-d409f90a74d0	73f29544-f289-44e2-8ce9-80052abe49ba	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
b971ebad-51b1-4e3d-a4ad-acbd6c8efc5d	Admin	\N
f2f3323c-8b26-4747-95c4-d30e22a7d309	Master	\N
f5c83c6b-f748-4203-8d13-e09a914bdeb7	Welder	\N
28099864-bfd3-4a72-89ae-6dd706673fcb	Inspector	\N
d70d68cc-539a-41dd-82cb-bbd57ef38ada	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
00dab965-c964-4ea7-b5f8-68a3c03a2570	2023-03-12 12:56:49.666383	b5d1269a-34f1-452a-9a15-2924dc1b70dc	c7d9f1cb-4502-47c7-a5f9-4d56b5c288e6	\N
070c9ba3-22b8-425b-b694-cc6342647375	2023-03-12 12:56:49.666367	c476cbc6-e46d-45e5-87e0-51c11c57a20d	25cb2cb2-e553-4014-9306-f91cd31c26fc	\N
195996f4-46d7-4377-9afc-84effee02179	2023-03-12 12:56:49.666388	d66e4bbb-4ced-4019-ac9a-7f534f688e60	50e6b3af-ada8-448a-8daf-57791f9b2761	\N
1994e5f1-bb57-4e20-8e95-f0cb0a274fee	2023-03-12 12:56:49.666381	4879439b-52df-411b-8b66-58c9dca4de34	0b64be80-3b41-4aa2-8d01-1d48a4bbf093	\N
1adcae1c-7f4b-4de6-a36d-cba31d7c0571	2023-03-12 12:56:49.666365	5a63863b-6377-47de-b459-0fa10d3acd89	c4c113d6-4742-4a30-8931-a76586dd6595	\N
1b811094-933a-4451-bc40-66c6167aa615	2023-03-12 12:56:49.666383	deb4b352-42f6-46fb-9826-113902779278	e976d713-2629-4788-99db-975856ee038a	\N
1c9e3d50-fe31-4075-8142-914b22836941	2023-03-12 12:56:49.666355	b5a45ca1-1207-48d5-a31f-2b52937e753f	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
1ec3e449-c0f4-4579-9fa6-1b752515b81d	2023-03-12 12:56:49.666359	b6821394-662f-48b8-94a5-7a5eaaf8d687	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
1f366500-6a4a-4e8e-b9b1-3c3497dae376	2023-03-12 12:56:49.666374	38859c55-5ded-4caa-afae-a7374c16bced	a6eb3643-7833-46ed-91b1-96de4c9c121a	\N
283bc270-3e6e-42ba-8f2d-14cf9ae6c6bc	2023-03-12 12:56:49.666377	14b3f9e6-0a8a-487e-9f74-e50926147691	0b64be80-3b41-4aa2-8d01-1d48a4bbf093	\N
28895916-9fb9-4bc5-9f69-abb0d5821e6e	2023-03-12 12:56:49.666374	85d782c6-54c0-4661-9330-9a4aeb97f89c	a6eb3643-7833-46ed-91b1-96de4c9c121a	\N
2fb02910-c6ba-40df-a641-76f3233d6fc6	2023-03-12 12:56:49.666388	042346f0-c534-4fae-abba-89b7f8205927	f2d46fae-277f-4d1f-8ee2-03c3ac18d081	\N
31f75acd-1f8f-40f0-8761-809935e341b5	2023-03-12 12:56:49.666352	e8a61f7e-919d-424f-ac7c-1a33630bf7b3	a985eaa5-120a-4137-b3af-4152a9b5445f	\N
392e0ffa-15ce-40ec-b3b7-0e72933a38ed	2023-03-12 12:56:49.666365	245f9e2e-5efb-457f-a0bc-445b2b9df9aa	1e2ab086-0c56-4f5d-acf2-9781642dc1bb	\N
3fb9a3c9-b75f-41ba-8482-98e42a8eca85	2023-03-12 12:56:49.666388	c3317ca7-73be-4997-9841-b08640c5f241	50e6b3af-ada8-448a-8daf-57791f9b2761	\N
43e5ba94-d59b-4ee0-be5e-2ac7ce289cb9	2023-03-12 12:56:49.666375	0e8e0ac6-19ac-44a8-a8d0-67ee1b84beee	df7168e3-0c38-4d2d-b308-ece179280689	\N
459c2405-b814-4041-8f44-a6d9412fe4fd	2023-03-12 12:56:49.666367	b1541987-8397-4ece-804e-3a8d2afe8348	1d011815-ea6a-4a38-93f7-2d95b5c977b8	\N
49566e55-90ae-4a1e-94ed-cee3a6a919af	2023-03-12 12:56:49.666346	9b4af8e4-5d06-4810-b547-1aa31312b954	4b27eb58-ca6e-448f-bbc8-be0de5859ef5	\N
4f8d2899-5c47-4bb9-b1f7-b7fcc8456da4	2023-03-12 12:56:49.666376	c40ba7ec-98d6-4fd4-9fc1-bd8aee9cfb7d	e87ac597-41e7-4262-a38f-9ef69d2714bf	\N
51a6d8c4-deb2-448e-b2cb-902d314f4c43	2023-03-12 12:56:49.666346	bedfdae9-a2db-4320-aa7d-2bb0d873ea49	4b27eb58-ca6e-448f-bbc8-be0de5859ef5	\N
558589ad-528c-4b20-939b-a2784a5d988c	2023-03-12 12:56:49.666354	a338397e-bfb9-404d-a941-6dc2e86e5315	52fa56e9-9530-45ab-a32a-497b79e9ba60	\N
629bf57d-eb37-441f-a712-5015913f57ad	2023-03-12 12:56:49.666361	f8c15d4b-7dd9-4629-ac2d-5267ba54f05f	c4c113d6-4742-4a30-8931-a76586dd6595	\N
68f83905-4a77-4cd4-bb6d-c8f1983aac70	2023-03-12 12:56:49.666345	8dcddfc8-7839-411e-b5fd-d3f14a5dac2c	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
6a59617c-18a3-4ade-adac-5f7a95499640	2023-03-12 12:56:49.666358	7126b35f-a7ac-4864-b2ed-b3985b9e637c	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
6a8f1ce0-7626-461a-a95b-a5c5900695d0	2023-03-12 12:56:49.666361	7f3137ad-5547-454a-bb88-4dd84f68d058	5a86b8d0-6723-4a35-987a-8e325cfec722	\N
6cd4432c-e0cc-4626-a051-709fb7c17af2	2023-03-12 12:56:49.666366	fd1f5ac5-3571-4471-8395-8fe87192b67b	84a1627e-10d8-424d-b83b-c9657a24f576	\N
715a900a-a04a-4fac-a489-5866d3fcb54e	2023-03-12 12:56:49.666376	bc485460-7bd9-440d-83b2-538347657dc0	0a3ea100-02b0-49a9-a0fb-9ad2fb6ae5aa	\N
77ce9ea4-4851-4c74-b7a5-3e0108f8c6c0	2023-03-12 12:56:49.666359	2362cbcb-4d90-4fdc-be01-bbed98dd265f	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
7a0919e5-c944-420c-a43d-3807dd621c4d	2023-03-12 12:56:49.666125	cafdf838-6c12-47b4-9e69-5027dcfd1719	c6c6a15e-b8c5-4189-9edc-55fa8165b191	\N
80fdef98-e561-41ab-886f-fb1f4c549e2c	2023-03-12 12:56:49.666374	209d2e9e-e095-4133-bf27-e821ab6798c0	a6eb3643-7833-46ed-91b1-96de4c9c121a	\N
860101d6-b7ba-498e-9f44-ea85cc851a97	2023-03-12 12:56:49.666359	aad6168b-ba92-4dd6-ac60-8dc46a27d75f	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
8689f917-d94a-46c6-ac50-8ad34475ba4d	2023-03-12 12:56:49.666352	0864ea12-5c27-4239-9c7f-e4077f2497c5	55f6a3b2-6ec7-443d-9b4c-8868ecd4a4a4	\N
8804e712-4382-40d8-82a2-cc0e8d958523	2023-03-12 12:56:49.666383	5c1390b2-0b1c-4bc1-8015-6546964eaa8b	f9f2f176-441e-468f-8b72-cb0619dbe9de	\N
8c930444-101a-4daa-8de9-9d7363bed241	2023-03-12 12:56:49.666382	aaac0425-9c3f-42ec-b759-3ca5028508e8	86485457-134b-4bfd-aad9-233923461f18	\N
8d312394-feb0-4d2a-a7a9-7cbadbbc046a	2023-03-12 12:56:49.666381	2c5a999d-b9f9-4372-911e-8b0efa837a9b	05cba0aa-c3e9-4221-8935-7d05ced5b23f	\N
9670b933-f80f-40d1-a05e-5dce97e535ec	2023-03-12 12:56:49.666358	0de04073-302e-4f6f-8dd1-bc09a3337c74	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
985a6d0b-6d73-447e-ad73-1262d46a7343	2023-03-12 12:56:49.666366	232ae45b-94ac-4c5b-be7e-c607079bc17e	84a1627e-10d8-424d-b83b-c9657a24f576	\N
9b800cbd-f935-49c0-91ee-7ae9a5cc77c2	2023-03-12 12:56:49.666353	3e5d0b1d-d006-4067-95ed-8390d45bb4a5	e76eed77-3cbb-4c9e-8858-84a00d1b01a5	\N
9fbb7fbe-9cef-4cda-834b-23aa8f5c8450	2023-03-12 12:56:49.666353	db6e758f-6916-4c58-89fb-1019a13d0c89	e76eed77-3cbb-4c9e-8858-84a00d1b01a5	\N
a3cca651-a135-4360-a0ed-89bcfe1d4572	2023-03-12 12:56:49.666346	712b999e-a0ff-4475-bddb-dbc05acb7524	4b27eb58-ca6e-448f-bbc8-be0de5859ef5	\N
a4a377a2-bfea-431d-94b4-b615c35c3dcf	2023-03-12 12:56:49.666367	31f884cf-083b-4290-bcbe-5a7166a774d2	25cb2cb2-e553-4014-9306-f91cd31c26fc	\N
a62e736d-1b73-42f6-b0dc-eb1206b42562	2023-03-12 12:56:49.66636	856db091-b8db-492b-ac73-a272ae0dee26	4b725a37-d5f5-43fe-acfc-bf67539d2857	\N
ab32e481-89ea-4929-9981-31e422a229c7	2023-03-12 12:56:49.66636	5df2d781-9bfc-457d-b441-b8c60f7f0846	baf9e344-fc61-4b48-806e-17e55570b078	\N
ac03577f-80c2-4654-b1ba-b6f353b7eda4	2023-03-12 12:56:49.666382	cbd95fb2-f2aa-4380-88db-b5187d4d75b2	658a438d-cc59-4ff1-89ef-d66c9f333f72	\N
b0345ab1-f658-4eed-8ab3-1fe6d81d6a44	2023-03-12 12:56:49.666352	b553c5f9-118c-44c8-9913-6c2addcde9c3	a985eaa5-120a-4137-b3af-4152a9b5445f	\N
b0d5c02c-a82c-4993-9d12-8d690d53615b	2023-03-12 12:56:49.666345	a313c5d6-6ec9-432d-8844-2a0d59f96f54	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
b260853f-d6af-44d7-855f-96ac4775a51f	2023-03-12 12:56:49.666359	154eb88f-cf9b-4817-b50f-dd50c51cfff0	123b78ff-ddf6-4ab4-ac19-a2aa00a65d7b	\N
b34eec55-1c38-4627-9279-f6c7f799f409	2023-03-12 12:56:49.666389	4aeee022-7c57-4732-a527-d9fc30aed4a6	b57df3f7-14b2-4e6b-b897-33edcbcfd046	\N
b975afb3-7e29-4fc5-8b07-5a28dad54869	2023-03-12 12:56:49.666383	d0cc448c-7ac9-46b9-a965-c699ed997266	e976d713-2629-4788-99db-975856ee038a	\N
b9dffe2f-355b-4efd-b475-26c97ee43af1	2023-03-12 12:56:49.666367	bd442ce7-2a1f-4e24-9f96-052d2226aa52	25cb2cb2-e553-4014-9306-f91cd31c26fc	\N
bc80e57f-4267-4a17-a9cc-2b6cc9226011	2023-03-12 12:56:49.666375	5493952b-c03f-4975-b745-101102ccaa97	df7168e3-0c38-4d2d-b308-ece179280689	\N
c0405b10-234a-47be-ba19-973ff521cfa4	2023-03-12 12:56:49.666376	5aeea841-1fe0-4c0c-ac87-8ab6fd461e37	a0c71973-b70e-4812-85e1-a377e02e555c	\N
cac51a0f-b274-49f8-a9f7-ce168f5615f9	2023-03-12 12:56:49.666195	fa6598fc-93f8-4f09-b4b3-090ed4adbcb4	c6c6a15e-b8c5-4189-9edc-55fa8165b191	\N
ccbd06bb-259a-4fd8-aaf4-7c2e8d8698a7	2023-03-12 12:56:49.666366	59256bd8-bb59-425f-a300-febf732be1fc	84a1627e-10d8-424d-b83b-c9657a24f576	\N
d2227a1f-ad79-43f8-8c4a-763c4c3d4060	2023-03-12 12:56:49.666354	286ee474-6bf4-4ddd-b0cc-0c7990802f04	0ed2c49f-fcbd-4209-bd3e-c954f470cf3c	\N
d32b6076-cd63-464b-a906-71a5cffb720b	2023-03-12 12:56:49.666387	fef1ba04-41b5-4c02-b52a-44177aafaa5d	f9f2f176-441e-468f-8b72-cb0619dbe9de	\N
d5a226bb-135c-439e-8fb8-965fcfceef0d	2023-03-12 12:56:49.666382	2df5eb27-7f89-4494-8834-e3321a8a135a	590867ba-0fda-421e-a567-56cd459b7013	\N
d77997cc-8632-4cb2-b558-e745c34c739e	2023-03-12 12:56:49.666365	3f312511-3db2-4154-b137-ab71183089b3	1488ae86-b4df-480a-9770-a7143332e9b9	\N
d9b502a8-1c87-4207-ad21-4b9bc289031c	2023-03-12 12:56:49.666388	d63d798b-0994-4a57-93c8-ae9fa4bfc872	b57df3f7-14b2-4e6b-b897-33edcbcfd046	\N
db08f0f9-4653-477a-9b46-c723a6d72a10	2023-03-12 12:56:49.666375	64c70e33-0db5-43fd-9460-5e71fba91a8e	df7168e3-0c38-4d2d-b308-ece179280689	\N
dc1e1826-200d-477b-90ba-3e2d34328f53	2023-03-12 12:56:49.666345	2cfec354-c0dc-45e0-b572-ff740c6cfa68	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
eac8127d-7f3e-4d6a-bac4-1c5ef92adf5d	2023-03-12 12:56:49.666353	954f53ff-a53a-470c-85ae-d2de381c7141	e76eed77-3cbb-4c9e-8858-84a00d1b01a5	\N
ecaa14f4-48e7-436c-94eb-85aec58c428f	2023-03-12 12:56:49.666353	5bed7897-0b96-433e-9b06-1e3d81ee022e	a985eaa5-120a-4137-b3af-4152a9b5445f	\N
ee163e6c-4b5c-45d9-a464-477236324263	2023-03-12 12:56:49.666381	cd0b83ed-661d-4f17-8ff4-0c527667401d	0b64be80-3b41-4aa2-8d01-1d48a4bbf093	\N
eeef0db3-8706-4633-b733-5e4ee1ec5458	2023-03-12 12:56:49.666345	d636cf63-c92d-48e8-9b0a-2ad5f72f92e3	4e2a2461-2c4d-4702-8aca-af64562e3aa7	\N
f18df287-c3aa-464d-82c9-01451972ba78	2023-03-12 12:56:49.666375	0af04f43-0ce4-4aea-9345-2e7d62b20b43	df7168e3-0c38-4d2d-b308-ece179280689	\N
f58e7e28-8082-410f-a445-4005ca74a2d7	2023-03-12 12:56:49.666354	7a2edb58-acbd-4b33-a564-409808ce8bf4	52fa56e9-9530-45ab-a32a-497b79e9ba60	\N
f890faae-7d34-44d2-a337-665487594c70	2023-03-12 12:56:49.666361	373352ac-90ab-47e1-bdce-6d008f704f25	c4c113d6-4742-4a30-8931-a76586dd6595	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0023445f-6499-4934-83e3-e491efb34ea5	0	1	\N	\N	db08f0f9-4653-477a-9b46-c723a6d72a10	\N
00cddbb6-63a7-4039-be9e-3f737a06e359	0	3	\N	\N	ac03577f-80c2-4654-b1ba-b6f353b7eda4	\N
0141641c-ea66-4b11-ae72-ccc7c9e03e7b	0	1	\N	\N	1f366500-6a4a-4e8e-b9b1-3c3497dae376	\N
01a0677b-44fc-4dfd-b6c9-68e82e6c1127	0	3	\N	\N	43e5ba94-d59b-4ee0-be5e-2ac7ce289cb9	\N
02fd9c84-3b29-4bcd-b998-2783ba04329b	0	2	\N	\N	a4a377a2-bfea-431d-94b4-b615c35c3dcf	\N
0375a114-33aa-4cf6-ba12-f6d3dd75892c	0	2	\N	\N	1f366500-6a4a-4e8e-b9b1-3c3497dae376	\N
039b649f-6be4-45aa-a59f-7c2073494811	0	2	\N	\N	1c9e3d50-fe31-4075-8142-914b22836941	\N
051abc19-b686-4c87-a5bb-2d179027acac	0	2	\N	\N	985a6d0b-6d73-447e-ad73-1262d46a7343	\N
05bdeb34-703e-468d-98c7-ffb213e7e2f6	0	2	\N	\N	d5a226bb-135c-439e-8fb8-965fcfceef0d	\N
064e0f15-0894-490d-8c48-a603daf6e173	0	1	\N	\N	ac03577f-80c2-4654-b1ba-b6f353b7eda4	\N
07a5869b-96d0-43cc-bd4f-dbfac757e1e1	0	1	\N	\N	1ec3e449-c0f4-4579-9fa6-1b752515b81d	\N
0806de41-cec4-4116-8f0e-db933083d903	0	3	\N	\N	b9dffe2f-355b-4efd-b475-26c97ee43af1	\N
08891ec8-4a4a-431b-974c-94fc588c044a	0	3	\N	\N	28895916-9fb9-4bc5-9f69-abb0d5821e6e	\N
0a66f1fb-fe9e-4e27-b26a-14621bac7ef2	0	3	\N	\N	d9b502a8-1c87-4207-ad21-4b9bc289031c	\N
0c5098f9-6ae6-4710-ae99-77db93a8e404	0	3	\N	\N	b260853f-d6af-44d7-855f-96ac4775a51f	\N
0d7461b5-ab59-4bd2-af6c-b356d5b24b0b	0	3	\N	\N	195996f4-46d7-4377-9afc-84effee02179	\N
0e31cd6d-4728-43f2-8854-bcda00a3b61c	0	2	\N	\N	b9dffe2f-355b-4efd-b475-26c97ee43af1	\N
0eb84290-f11a-4d7e-922b-61238ce0458a	0	2	\N	\N	d2227a1f-ad79-43f8-8c4a-763c4c3d4060	\N
11f207ac-c3a5-4e71-8db1-a28b8a97f5ed	0	1	\N	\N	00dab965-c964-4ea7-b5f8-68a3c03a2570	\N
1388a238-07e3-4589-8411-a75dc50b7360	0	2	\N	\N	b975afb3-7e29-4fc5-8b07-5a28dad54869	\N
143ba6da-92e8-4ebf-ab8e-5997d756df21	0	1	\N	\N	43e5ba94-d59b-4ee0-be5e-2ac7ce289cb9	\N
14c66f42-ea29-46e8-a1ff-1302fa26251d	0	3	\N	\N	860101d6-b7ba-498e-9f44-ea85cc851a97	\N
15829bd2-5d28-4009-b469-af8988bc17a7	0	1	\N	\N	eac8127d-7f3e-4d6a-bac4-1c5ef92adf5d	\N
16434f59-0939-437b-87e3-8a4e74081788	0	3	\N	\N	d5a226bb-135c-439e-8fb8-965fcfceef0d	\N
1656d1fe-c876-4344-9ec1-901d28642d0c	0	3	\N	\N	1c9e3d50-fe31-4075-8142-914b22836941	\N
167efc59-6760-4223-baa1-7e4a0219c83c	0	1	\N	\N	a4a377a2-bfea-431d-94b4-b615c35c3dcf	\N
17a78d8e-e622-414f-8223-a3b9f556e0cb	0	1	\N	\N	6cd4432c-e0cc-4626-a051-709fb7c17af2	\N
188d3f8f-c4f6-4a83-a284-064a3b8ced16	0	2	\N	\N	b34eec55-1c38-4627-9279-f6c7f799f409	\N
19665eab-1387-49ff-bfa5-5ff221ed6d0b	0	2	\N	\N	77ce9ea4-4851-4c74-b7a5-3e0108f8c6c0	\N
1ab5a7ea-f62f-4afd-8e2a-657d7cec5537	0	1	\N	\N	459c2405-b814-4041-8f44-a6d9412fe4fd	\N
1bb527f4-21db-4514-aaf6-08ba65d0d3c7	0	1	\N	\N	283bc270-3e6e-42ba-8f2d-14cf9ae6c6bc	\N
1ed09762-f856-4e88-8aa6-b883449566a3	0	2	\N	\N	9670b933-f80f-40d1-a05e-5dce97e535ec	\N
1fd38f8c-5c56-45da-aed5-6071f70dce7d	0	2	\N	\N	d9b502a8-1c87-4207-ad21-4b9bc289031c	\N
23052469-b7ef-4b62-92e3-83aaac44b26a	0	2	\N	\N	80fdef98-e561-41ab-886f-fb1f4c549e2c	\N
231e8821-d6f5-4f77-bbb9-44fa6f23d2ee	0	3	\N	\N	b34eec55-1c38-4627-9279-f6c7f799f409	\N
23758810-5abf-4d7d-941f-8e8957eeea1e	0	3	\N	\N	715a900a-a04a-4fac-a489-5866d3fcb54e	\N
23afd5dd-860a-432f-8378-fe8561f48f81	0	3	\N	\N	ab32e481-89ea-4929-9981-31e422a229c7	\N
25f6a7d1-d7c7-4f63-b82f-13cb5d579bf8	0	3	\N	\N	283bc270-3e6e-42ba-8f2d-14cf9ae6c6bc	\N
267577fb-ea28-4945-b08e-1c6300901ed6	0	2	\N	\N	1ec3e449-c0f4-4579-9fa6-1b752515b81d	\N
27f44aa9-5d03-4254-b439-3ebd4d663df3	0	1	\N	\N	b260853f-d6af-44d7-855f-96ac4775a51f	\N
2a4724c5-7ad3-4405-860f-c9d1dabe9d55	0	2	\N	\N	28895916-9fb9-4bc5-9f69-abb0d5821e6e	\N
2c182c9c-2fd9-4bdc-994b-8c076e71f25f	0	1	\N	\N	28895916-9fb9-4bc5-9f69-abb0d5821e6e	\N
2c9de5fd-60cb-42dc-b093-48ec55fae6ca	0	3	\N	\N	80fdef98-e561-41ab-886f-fb1f4c549e2c	\N
2f1537c6-e21f-4c68-8f92-ae828094cffe	0	3	\N	\N	6a59617c-18a3-4ade-adac-5f7a95499640	\N
30e3f084-c177-4236-825b-71a5d6c7e5a6	0	3	\N	\N	77ce9ea4-4851-4c74-b7a5-3e0108f8c6c0	\N
31acd23b-e80f-4dda-8d7f-f859c8681849	0	3	\N	\N	49566e55-90ae-4a1e-94ed-cee3a6a919af	\N
31b80414-492c-4750-8bb9-437028bf771a	0	1	\N	\N	a62e736d-1b73-42f6-b0dc-eb1206b42562	\N
32b1643a-3823-4773-ad07-6a1234aa1604	0	2	\N	\N	1adcae1c-7f4b-4de6-a36d-cba31d7c0571	\N
332f052d-a290-41e8-9f31-acbd37ab79df	0	1	\N	\N	ecaa14f4-48e7-436c-94eb-85aec58c428f	\N
33e839e3-0d0e-455b-9974-36e708b0190d	0	3	\N	\N	070c9ba3-22b8-425b-b694-cc6342647375	\N
34358aee-fa78-4799-8fc6-7b7c84623d9b	0	3	\N	\N	ecaa14f4-48e7-436c-94eb-85aec58c428f	\N
359389a9-a860-4312-a3af-a9a320f4cd85	0	3	\N	\N	558589ad-528c-4b20-939b-a2784a5d988c	\N
36cad0a5-74f8-470e-8e8c-df45a4c9d01c	0	1	\N	\N	ee163e6c-4b5c-45d9-a464-477236324263	\N
37191921-2f5d-45d4-b3d5-367b263ca71e	0	2	\N	\N	392e0ffa-15ce-40ec-b3b7-0e72933a38ed	\N
385161f0-edca-48ab-9843-8f471476c625	0	1	\N	\N	9b800cbd-f935-49c0-91ee-7ae9a5cc77c2	\N
3a950ed0-6eea-4712-8d74-d8c561bf09cf	0	1	\N	\N	80fdef98-e561-41ab-886f-fb1f4c549e2c	\N
3ac2c3d3-6e75-4d5e-a33f-57117b0980f2	0	2	\N	\N	a3cca651-a135-4360-a0ed-89bcfe1d4572	\N
3b507594-b6f1-4e1c-abff-4546454920ac	0	3	\N	\N	6a8f1ce0-7626-461a-a95b-a5c5900695d0	\N
3dda7822-7f5a-4bea-b9c4-3cabef520bdb	0	3	\N	\N	d2227a1f-ad79-43f8-8c4a-763c4c3d4060	\N
40456ce5-37ab-4c26-bae9-80f5a0a8ea76	0	2	\N	\N	1994e5f1-bb57-4e20-8e95-f0cb0a274fee	\N
43aa1d99-5569-4eaa-af02-3204e1b162fc	0	3	\N	\N	a62e736d-1b73-42f6-b0dc-eb1206b42562	\N
454eaf09-b66a-42ed-b4ef-5bab2a45ce9b	0	2	\N	\N	b0d5c02c-a82c-4993-9d12-8d690d53615b	\N
45bb38d9-cdf3-45f0-9b6a-0896e048a630	0	3	\N	\N	db08f0f9-4653-477a-9b46-c723a6d72a10	\N
462dbaaf-e511-4dd3-9441-f2eee9c34666	0	1	\N	\N	d2227a1f-ad79-43f8-8c4a-763c4c3d4060	\N
47485b80-571f-4ac8-a931-861a9d7a79b1	0	1	\N	\N	3fb9a3c9-b75f-41ba-8482-98e42a8eca85	\N
4816b3c2-dbaf-469b-9d41-42abb443c7e9	0	2	\N	\N	d32b6076-cd63-464b-a906-71a5cffb720b	\N
489ff05b-5599-4282-9314-57cafce851a4	0	1	\N	\N	49566e55-90ae-4a1e-94ed-cee3a6a919af	\N
4be191cc-0e06-4c72-b461-fd7589aee9b2	0	1	\N	\N	7a0919e5-c944-420c-a43d-3807dd621c4d	\N
4ccfdaa4-a27f-4e84-997d-a2b09372276f	0	1	\N	\N	eeef0db3-8706-4633-b733-5e4ee1ec5458	\N
5299c105-6d5d-466f-89ac-1f8c7a65095f	0	3	\N	\N	b975afb3-7e29-4fc5-8b07-5a28dad54869	\N
53ad06b9-f9b9-4905-a72c-561932abe5db	0	1	\N	\N	1adcae1c-7f4b-4de6-a36d-cba31d7c0571	\N
541c1613-97c4-4785-b1d1-80524082be71	0	3	\N	\N	f58e7e28-8082-410f-a445-4005ca74a2d7	\N
54bce42e-c4b7-47f0-9e4a-3848fa5608a5	0	3	\N	\N	4f8d2899-5c47-4bb9-b1f7-b7fcc8456da4	\N
58eef00b-9ca2-4160-8e95-e30ce4c48223	0	2	\N	\N	715a900a-a04a-4fac-a489-5866d3fcb54e	\N
59ae257f-6132-441a-abdc-0dff9612cd5f	0	3	\N	\N	f890faae-7d34-44d2-a337-665487594c70	\N
5cd61d18-ad5e-482c-8dbb-f1b865910f56	0	3	\N	\N	cac51a0f-b274-49f8-a9f7-ce168f5615f9	\N
5df81e55-b613-4eb1-afb8-09c4b5e5ceb5	0	1	\N	\N	d9b502a8-1c87-4207-ad21-4b9bc289031c	\N
5e751759-e742-485f-834d-2fb1a5d93dab	0	2	\N	\N	8804e712-4382-40d8-82a2-cc0e8d958523	\N
5fd2d6e2-6cc5-490b-94cf-4e2c2ce03927	0	3	\N	\N	6cd4432c-e0cc-4626-a051-709fb7c17af2	\N
60c0808b-ab44-434c-b399-c7a85ab57330	0	2	\N	\N	8689f917-d94a-46c6-ac50-8ad34475ba4d	\N
61c54608-9d95-4378-82d4-a9147251d2d1	0	3	\N	\N	b0d5c02c-a82c-4993-9d12-8d690d53615b	\N
63a01d92-45dd-4394-af25-2b73cb5454ae	0	3	\N	\N	9670b933-f80f-40d1-a05e-5dce97e535ec	\N
6430005c-4099-4c54-b4fc-5950eb0387b1	0	2	\N	\N	eeef0db3-8706-4633-b733-5e4ee1ec5458	\N
643c5492-3ba3-4e5d-ae52-26769b1049a6	0	3	\N	\N	a3cca651-a135-4360-a0ed-89bcfe1d4572	\N
646874de-1641-4cfd-a555-b927b4202c45	0	1	\N	\N	1994e5f1-bb57-4e20-8e95-f0cb0a274fee	\N
64bcbacd-edae-463b-99ae-a9bc0da28c4b	0	1	\N	\N	8804e712-4382-40d8-82a2-cc0e8d958523	\N
65080357-19e0-4610-8d44-8266a2cdc046	0	1	\N	\N	f18df287-c3aa-464d-82c9-01451972ba78	\N
659501b9-6fec-4128-a193-d7e62c3a83a8	0	1	\N	\N	1c9e3d50-fe31-4075-8142-914b22836941	\N
65c22c78-c85f-46fb-b298-03acb054d8c6	0	2	\N	\N	43e5ba94-d59b-4ee0-be5e-2ac7ce289cb9	\N
65c65621-121d-49ac-8f9c-e922062e4d28	0	2	\N	\N	eac8127d-7f3e-4d6a-bac4-1c5ef92adf5d	\N
688c1c1a-08ae-45b4-9d08-183b90ca2b44	0	1	\N	\N	860101d6-b7ba-498e-9f44-ea85cc851a97	\N
7123c974-64fc-4683-9c5b-2d80ea997768	0	1	\N	\N	b34eec55-1c38-4627-9279-f6c7f799f409	\N
7169fe5f-871b-4112-b9f7-8ac6028d725c	0	1	\N	\N	b0d5c02c-a82c-4993-9d12-8d690d53615b	\N
724747aa-4f0f-42d7-9bbb-887c115dbb34	0	2	\N	\N	b260853f-d6af-44d7-855f-96ac4775a51f	\N
73dd0690-60b3-4e18-a58c-c541fe6bf4b0	0	3	\N	\N	51a6d8c4-deb2-448e-b2cb-902d314f4c43	\N
7564bc9b-1230-4340-aa28-a2919a090474	0	1	\N	\N	ab32e481-89ea-4929-9981-31e422a229c7	\N
75d0c1df-ceb1-440d-ae5b-67c9a18b4f8d	0	2	\N	\N	860101d6-b7ba-498e-9f44-ea85cc851a97	\N
7957f2d9-e52b-40c8-a559-cbea01afea57	0	2	\N	\N	558589ad-528c-4b20-939b-a2784a5d988c	\N
79749de7-4ec6-451a-9462-5be7ee347a5e	0	3	\N	\N	dc1e1826-200d-477b-90ba-3e2d34328f53	\N
7abf9f3e-16b6-402a-9525-8c6b70e4aced	0	3	\N	\N	00dab965-c964-4ea7-b5f8-68a3c03a2570	\N
7b87f627-49f9-4193-8333-bd7816208aaa	0	2	\N	\N	bc80e57f-4267-4a17-a9cc-2b6cc9226011	\N
7d4fe69a-32ab-4531-9413-f04dd784eabe	0	1	\N	\N	d77997cc-8632-4cb2-b558-e745c34c739e	\N
7f3cda12-d7f0-4807-abd4-9ab38d6129f5	0	1	\N	\N	bc80e57f-4267-4a17-a9cc-2b6cc9226011	\N
810743c2-3c22-4111-9434-f5d8ea327de5	0	2	\N	\N	ab32e481-89ea-4929-9981-31e422a229c7	\N
8740a41b-d1f1-4fb9-9a73-7fb8b7a57a6a	0	1	\N	\N	9670b933-f80f-40d1-a05e-5dce97e535ec	\N
87449b79-94e5-47a5-b4cc-6ed9fdffb91f	0	2	\N	\N	283bc270-3e6e-42ba-8f2d-14cf9ae6c6bc	\N
8759027d-2c8a-4382-8944-c37f04eb5130	0	2	\N	\N	a62e736d-1b73-42f6-b0dc-eb1206b42562	\N
8928470c-556c-4623-a0a5-2c7a1f6a3a07	0	1	\N	\N	9fbb7fbe-9cef-4cda-834b-23aa8f5c8450	\N
892b34b0-0501-4232-82ec-32dd6d24995d	0	2	\N	\N	6a59617c-18a3-4ade-adac-5f7a95499640	\N
89cc19cc-d635-489e-a18f-5d65e9436d2a	0	2	\N	\N	8c930444-101a-4daa-8de9-9d7363bed241	\N
89d739fa-e015-4aca-b0c8-b571c5c30e0f	0	2	\N	\N	3fb9a3c9-b75f-41ba-8482-98e42a8eca85	\N
8b3fb8ba-2309-47ed-bf3c-5a43af571bb8	0	3	\N	\N	1adcae1c-7f4b-4de6-a36d-cba31d7c0571	\N
8bd01ad7-ab21-4017-8e44-13242f4b6827	0	2	\N	\N	7a0919e5-c944-420c-a43d-3807dd621c4d	\N
8c4d3cf2-0108-4b73-a49f-7b1cf73dfb7d	0	3	\N	\N	ccbd06bb-259a-4fd8-aaf4-7c2e8d8698a7	\N
8d4584b6-c070-491f-a5b4-c7fd3ff23d30	0	2	\N	\N	db08f0f9-4653-477a-9b46-c723a6d72a10	\N
8e48d051-3c18-4fd3-941b-76bfc11031dc	0	1	\N	\N	31f75acd-1f8f-40f0-8761-809935e341b5	\N
8eb89576-14eb-45b0-86dd-84e3a7b65285	0	3	\N	\N	9b800cbd-f935-49c0-91ee-7ae9a5cc77c2	\N
91227872-3b17-4edf-ac8c-05436418cf53	0	2	\N	\N	459c2405-b814-4041-8f44-a6d9412fe4fd	\N
913dbec4-eb54-46ea-bc6c-f43d17f317ef	0	2	\N	\N	2fb02910-c6ba-40df-a641-76f3233d6fc6	\N
92f8b175-c90d-464d-b83f-a41f17c0cfb8	0	3	\N	\N	7a0919e5-c944-420c-a43d-3807dd621c4d	\N
9322f588-1bce-44c7-b848-7233b089e2fb	0	2	\N	\N	49566e55-90ae-4a1e-94ed-cee3a6a919af	\N
95d9a574-c6f2-4340-b40f-8dc886852bf2	0	2	\N	\N	ccbd06bb-259a-4fd8-aaf4-7c2e8d8698a7	\N
98997b3f-bf4f-40a3-8636-8eb6a792874c	0	3	\N	\N	ee163e6c-4b5c-45d9-a464-477236324263	\N
98ade248-ebc3-4c86-aaf4-800a440be78a	0	2	\N	\N	ac03577f-80c2-4654-b1ba-b6f353b7eda4	\N
999b2bdc-b8e0-483d-92fe-e88398c8b664	0	1	\N	\N	195996f4-46d7-4377-9afc-84effee02179	\N
9c764317-0a57-4263-8d0c-145489f9c345	0	3	\N	\N	985a6d0b-6d73-447e-ad73-1262d46a7343	\N
9cf75a07-30f2-463e-a237-100a6329eb4f	0	2	\N	\N	f18df287-c3aa-464d-82c9-01451972ba78	\N
9d11df2b-e92d-4b59-8157-5db790c1bf05	0	1	\N	\N	77ce9ea4-4851-4c74-b7a5-3e0108f8c6c0	\N
9d1acad7-e5fa-4d06-9504-a3ebf2ec5ae8	0	2	\N	\N	9fbb7fbe-9cef-4cda-834b-23aa8f5c8450	\N
9d57f6d8-69cf-469b-85ca-935f390e9507	0	1	\N	\N	c0405b10-234a-47be-ba19-973ff521cfa4	\N
9ea9144a-309a-4a69-a2a5-06ee62754545	0	3	\N	\N	2fb02910-c6ba-40df-a641-76f3233d6fc6	\N
a2079b35-7d08-4cc9-972b-62b21dee96ed	0	1	\N	\N	b9dffe2f-355b-4efd-b475-26c97ee43af1	\N
a2b299b7-b311-430b-95c3-b01c633932d0	0	3	\N	\N	629bf57d-eb37-441f-a712-5015913f57ad	\N
a779c931-b6ce-4419-9e89-3f595787a4d6	0	1	\N	\N	8d312394-feb0-4d2a-a7a9-7cbadbbc046a	\N
a7c6e3a2-8a55-4676-a29c-80c3964648c8	0	1	\N	\N	4f8d2899-5c47-4bb9-b1f7-b7fcc8456da4	\N
aab334d8-eeb3-4ca1-9abf-7af205ae8b88	0	3	\N	\N	31f75acd-1f8f-40f0-8761-809935e341b5	\N
aacbe860-25a8-42c3-8582-c7ec95660a39	0	1	\N	\N	f58e7e28-8082-410f-a445-4005ca74a2d7	\N
ac99c5f0-5b7e-48b1-b213-7eeb20475b46	0	3	\N	\N	8c930444-101a-4daa-8de9-9d7363bed241	\N
ad94e749-867e-4b4a-aef2-5e15b1f52a2e	0	3	\N	\N	eeef0db3-8706-4633-b733-5e4ee1ec5458	\N
aec52035-3ade-4d73-9ab0-7b75304da245	0	1	\N	\N	ccbd06bb-259a-4fd8-aaf4-7c2e8d8698a7	\N
af8e91df-c781-47b7-a113-935c94afeb8a	0	2	\N	\N	629bf57d-eb37-441f-a712-5015913f57ad	\N
b0186b46-9318-4f9f-92d2-dd157b3d6cb7	0	1	\N	\N	558589ad-528c-4b20-939b-a2784a5d988c	\N
b0b1aec3-451f-4d3a-ba26-9e29e2714ad5	0	2	\N	\N	ee163e6c-4b5c-45d9-a464-477236324263	\N
b1780254-fb3f-4f16-971c-38cd1935ab4e	0	1	\N	\N	2fb02910-c6ba-40df-a641-76f3233d6fc6	\N
b2cf04ca-330a-4f14-a5af-b5ce6002eead	0	3	\N	\N	392e0ffa-15ce-40ec-b3b7-0e72933a38ed	\N
b354e981-9c63-4e3f-a243-f94bbef9c63f	0	2	\N	\N	9b800cbd-f935-49c0-91ee-7ae9a5cc77c2	\N
b48c116c-a3f7-4040-b296-70e5f6157ba3	0	2	\N	\N	4f8d2899-5c47-4bb9-b1f7-b7fcc8456da4	\N
b4fcbb69-ba36-41b2-bf04-581731c71427	0	3	\N	\N	1ec3e449-c0f4-4579-9fa6-1b752515b81d	\N
b7dba71f-6294-4d26-b25c-6c0d0f0de330	0	1	\N	\N	51a6d8c4-deb2-448e-b2cb-902d314f4c43	\N
b80bccfd-9141-432f-89ac-4516a73e08a4	0	1	\N	\N	b975afb3-7e29-4fc5-8b07-5a28dad54869	\N
ba165405-0b1e-4d9b-a988-8d18dd10a7a0	0	2	\N	\N	070c9ba3-22b8-425b-b694-cc6342647375	\N
ba2af1f5-2e5a-4eb6-8d0d-8ed3d4a17348	0	2	\N	\N	8d312394-feb0-4d2a-a7a9-7cbadbbc046a	\N
ba9c9447-9a99-4d80-bcd8-93b4d81388f0	0	2	\N	\N	b0345ab1-f658-4eed-8ab3-1fe6d81d6a44	\N
c0f246fa-9d34-4f9c-b9ab-b3adbe03e9a6	0	1	\N	\N	cac51a0f-b274-49f8-a9f7-ce168f5615f9	\N
c20664f3-b7a0-4d1c-bc88-c90dc21af753	0	2	\N	\N	68f83905-4a77-4cd4-bb6d-c8f1983aac70	\N
c39ea84b-c6ff-4ec0-88eb-59f204a8f5fb	0	3	\N	\N	bc80e57f-4267-4a17-a9cc-2b6cc9226011	\N
c3d14afc-8cfe-4142-bb9e-2a862d1f8ffd	0	3	\N	\N	1994e5f1-bb57-4e20-8e95-f0cb0a274fee	\N
c5363879-f67e-4525-82a3-d8b69d5a7208	0	3	\N	\N	1b811094-933a-4451-bc40-66c6167aa615	\N
c7d91383-3655-4c2e-a882-54ff721ed596	0	3	\N	\N	b0345ab1-f658-4eed-8ab3-1fe6d81d6a44	\N
c8def425-78c6-4a27-8cb9-913f7427c543	0	2	\N	\N	f890faae-7d34-44d2-a337-665487594c70	\N
c98e8f5e-745a-4ad9-a724-8436936204f6	0	3	\N	\N	d77997cc-8632-4cb2-b558-e745c34c739e	\N
c9a3058c-fceb-447d-9f65-3d93b47eb17d	0	1	\N	\N	68f83905-4a77-4cd4-bb6d-c8f1983aac70	\N
cc263820-40ea-4a56-9e7a-c6ffa30043f6	0	3	\N	\N	1f366500-6a4a-4e8e-b9b1-3c3497dae376	\N
cce415d1-9b5c-46d7-96b2-3cc5c26b0498	0	2	\N	\N	6a8f1ce0-7626-461a-a95b-a5c5900695d0	\N
cce86be9-2f1b-4320-a214-0290e29a96d0	0	3	\N	\N	8804e712-4382-40d8-82a2-cc0e8d958523	\N
d03a2c92-0613-4422-afe5-b42641239323	0	1	\N	\N	8c930444-101a-4daa-8de9-9d7363bed241	\N
d171eb8a-0bff-40cc-aa90-b83551ba6231	0	1	\N	\N	d32b6076-cd63-464b-a906-71a5cffb720b	\N
d2c25411-04c2-4128-b928-11ab2ed442c2	0	3	\N	\N	459c2405-b814-4041-8f44-a6d9412fe4fd	\N
d2ef8fb4-07d2-415b-93f6-a04a12a51398	0	2	\N	\N	dc1e1826-200d-477b-90ba-3e2d34328f53	\N
d3d0d27a-3acf-4191-8b0d-ea8c21e50ffa	0	3	\N	\N	9fbb7fbe-9cef-4cda-834b-23aa8f5c8450	\N
d549be43-357c-465b-8a58-de4038c661fe	0	3	\N	\N	c0405b10-234a-47be-ba19-973ff521cfa4	\N
d5706f5a-2edb-419d-a4f7-e1d383e16b52	0	2	\N	\N	d77997cc-8632-4cb2-b558-e745c34c739e	\N
d64f1b2c-b67e-43c0-8ca7-0f1f0be6b7a2	0	3	\N	\N	a4a377a2-bfea-431d-94b4-b615c35c3dcf	\N
d758b83e-86bb-4987-b158-7a90fdaccabc	0	3	\N	\N	68f83905-4a77-4cd4-bb6d-c8f1983aac70	\N
daa691c6-6d7f-44e4-9bb0-c15c296be45a	0	1	\N	\N	a3cca651-a135-4360-a0ed-89bcfe1d4572	\N
dc6619eb-c145-4556-ba73-027c3a6da88a	0	2	\N	\N	31f75acd-1f8f-40f0-8761-809935e341b5	\N
dd2dbdd3-f6b7-4d60-95ed-590f6b5682ef	0	2	\N	\N	6cd4432c-e0cc-4626-a051-709fb7c17af2	\N
dfecc50d-02a1-4b90-a82d-f453001611b9	0	1	\N	\N	6a59617c-18a3-4ade-adac-5f7a95499640	\N
e020e1a7-cb97-4ce9-b945-b36cbc30fb86	0	1	\N	\N	392e0ffa-15ce-40ec-b3b7-0e72933a38ed	\N
e034945d-cc40-4d2a-9333-9c68690b4f53	0	1	\N	\N	d5a226bb-135c-439e-8fb8-965fcfceef0d	\N
e1432e7a-652e-4c9a-b7d0-07a4810c5087	0	1	\N	\N	985a6d0b-6d73-447e-ad73-1262d46a7343	\N
e23acefd-be6f-4359-8959-22c7f06c0303	0	2	\N	\N	cac51a0f-b274-49f8-a9f7-ce168f5615f9	\N
e3fc6db2-4d7f-4a27-b890-388a7aa747dd	0	1	\N	\N	6a8f1ce0-7626-461a-a95b-a5c5900695d0	\N
e40f4007-0920-4bb7-a525-d18e64c1b2a7	0	1	\N	\N	dc1e1826-200d-477b-90ba-3e2d34328f53	\N
e42b8816-cc7f-4325-9950-2de6c437d05c	0	2	\N	\N	51a6d8c4-deb2-448e-b2cb-902d314f4c43	\N
e502a000-a99d-4ad1-970e-c1036e9f5f35	0	2	\N	\N	ecaa14f4-48e7-436c-94eb-85aec58c428f	\N
e9e7bd95-3b5e-4c7b-8f68-2bd1d96a73f6	0	2	\N	\N	f58e7e28-8082-410f-a445-4005ca74a2d7	\N
ec76de13-b1b2-459f-a27f-6e3a92276875	0	2	\N	\N	1b811094-933a-4451-bc40-66c6167aa615	\N
ec8f4eb9-7c67-4b81-a18b-b6f6aba1bd6f	0	1	\N	\N	715a900a-a04a-4fac-a489-5866d3fcb54e	\N
ecd3853b-8522-4491-a662-13cf6bd59fa7	0	1	\N	\N	1b811094-933a-4451-bc40-66c6167aa615	\N
eff7c36f-da2a-4d10-8d2a-d09a927c4049	0	3	\N	\N	8689f917-d94a-46c6-ac50-8ad34475ba4d	\N
f1cdbe63-b77d-4970-a5c2-4d9b106779f4	0	1	\N	\N	b0345ab1-f658-4eed-8ab3-1fe6d81d6a44	\N
f1defb59-5e58-474f-92a2-737d4bfea725	0	1	\N	\N	f890faae-7d34-44d2-a337-665487594c70	\N
f38b6ac3-ee36-4104-a2c7-fcee9d33d1ef	0	1	\N	\N	629bf57d-eb37-441f-a712-5015913f57ad	\N
f426b209-e7b3-483e-a00d-73756dfe1b5a	0	3	\N	\N	eac8127d-7f3e-4d6a-bac4-1c5ef92adf5d	\N
f49a84bc-44e8-4fe3-b189-0bd320fb6dd9	0	1	\N	\N	8689f917-d94a-46c6-ac50-8ad34475ba4d	\N
f6824fe8-e57c-4f0a-ad42-d7041edba08a	0	1	\N	\N	070c9ba3-22b8-425b-b694-cc6342647375	\N
f989e81a-9388-47c1-bcbc-a73bb9f6666f	0	2	\N	\N	c0405b10-234a-47be-ba19-973ff521cfa4	\N
fb57d9f4-489b-452c-9fee-f8eef6bdf271	0	3	\N	\N	8d312394-feb0-4d2a-a7a9-7cbadbbc046a	\N
fbe9079d-2f17-4b63-b9e6-5605beaa8e54	0	3	\N	\N	f18df287-c3aa-464d-82c9-01451972ba78	\N
fc7c3f8f-97d3-45e0-a97f-a317f72f4546	0	3	\N	\N	d32b6076-cd63-464b-a906-71a5cffb720b	\N
fccbaffc-a641-4961-a64f-c2559cf681ce	0	2	\N	\N	00dab965-c964-4ea7-b5f8-68a3c03a2570	\N
fef4c6a0-40a5-46ed-b595-8931bea76f9f	0	3	\N	\N	3fb9a3c9-b75f-41ba-8482-98e42a8eca85	\N
ffc9745a-83a0-403a-9a29-350ccef6a3d2	0	2	\N	\N	195996f4-46d7-4377-9afc-84effee02179	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
042346f0-c534-4fae-abba-89b7f8205927	39	280	t	f	e869c718-fe85-4296-8745-fd76857cf5cb	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
0864ea12-5c27-4239-9c7f-e4077f2497c5	2	1880	t	f	1eb4ef5d-1a96-4177-8b35-ceffbc27ef35	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
0af04f43-0ce4-4aea-9345-2e7d62b20b43	18	4000	t	f	7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b	6657a044-8407-4959-b295-d2e74cf316c2	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
0de04073-302e-4f6f-8dd1-bc09a3337c74	56	400	t	f	2a2b05ee-1417-40a0-b0a3-9361c29e97af	7d31c6b7-98a4-4d9b-ac29-a32f74eb6a22	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
0e8e0ac6-19ac-44a8-a8d0-67ee1b84beee	58	900	t	f	7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
14b3f9e6-0a8a-487e-9f74-e50926147691	39	280	t	f	8b046eb8-b7ef-4c06-8056-0b61277fa893	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
154eb88f-cf9b-4817-b50f-dd50c51cfff0	18	4000	t	f	31cac7b5-b08e-41c8-b16a-ac6c925563e7	6657a044-8407-4959-b295-d2e74cf316c2	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
209d2e9e-e095-4133-bf27-e821ab6798c0	58	900	t	f	73ac1426-fa4e-4839-bf66-8a9ab04e884c	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
232ae45b-94ac-4c5b-be7e-c607079bc17e	39	280	t	f	5c85656b-665c-4ac9-97f5-d50145290d8a	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
2362cbcb-4d90-4fdc-be01-bbed98dd265f	56	400	t	f	31cac7b5-b08e-41c8-b16a-ac6c925563e7	7d31c6b7-98a4-4d9b-ac29-a32f74eb6a22	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
245f9e2e-5efb-457f-a0bc-445b2b9df9aa	18	4000	t	f	59e26aa8-f0d8-4df9-a6b7-69d8d7ef87fc	6657a044-8407-4959-b295-d2e74cf316c2	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
286ee474-6bf4-4ddd-b0cc-0c7990802f04	39	280	t	f	2a2b05ee-1417-40a0-b0a3-9361c29e97af	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
2c5a999d-b9f9-4372-911e-8b0efa837a9b	52	1200	t	f	93258644-ed20-4779-b586-8cc0fc4d836c	d4066030-9fa1-451f-9a68-6db9716335a4	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
2cfec354-c0dc-45e0-b572-ff740c6cfa68	39	280	t	f	1183be85-60aa-4f12-9fef-2fcfe06a3d59	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
2df5eb27-7f89-4494-8834-e3321a8a135a	48	1900	t	f	9aa12897-6add-435b-8920-18282ac0412f	5e2bf136-3026-4068-84da-68c385b48eab	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
31f884cf-083b-4290-bcbe-5a7166a774d2	55	400	t	f	6c41941d-38fb-4119-a2ed-091429bd916c	d07f6cb0-5148-4988-a6d4-6928ebb01e94	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
373352ac-90ab-47e1-bdce-6d008f704f25	39	280	t	f	49a70041-773c-4de8-98f8-efea4453047d	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
38859c55-5ded-4caa-afae-a7374c16bced	57	400	t	f	73ac1426-fa4e-4839-bf66-8a9ab04e884c	01a58123-c65f-4329-8ffe-d56e225dea84	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
3e5d0b1d-d006-4067-95ed-8390d45bb4a5	57	400	t	f	23273a77-40d5-472c-bcb6-cc1adf2b7bc9	01a58123-c65f-4329-8ffe-d56e225dea84	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
3f312511-3db2-4154-b137-ab71183089b3	18	4000	t	f	4fd927d0-908b-47f3-9e8d-424c9b827c6b	6657a044-8407-4959-b295-d2e74cf316c2	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
4879439b-52df-411b-8b66-58c9dca4de34	58	900	t	f	8b046eb8-b7ef-4c06-8056-0b61277fa893	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
4aeee022-7c57-4732-a527-d9fc30aed4a6	2	1880	t	f	eeb0bc45-bfef-482d-919c-38cf0defa556	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
5493952b-c03f-4975-b745-101102ccaa97	54	400	t	f	7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b	c06493d0-18db-4b37-8c58-97e168e5c3d3	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
59256bd8-bb59-425f-a300-febf732be1fc	58	900	t	f	5c85656b-665c-4ac9-97f5-d50145290d8a	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
5a63863b-6377-47de-b459-0fa10d3acd89	58	900	t	f	49a70041-773c-4de8-98f8-efea4453047d	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
5aeea841-1fe0-4c0c-ac87-8ab6fd461e37	39	280	t	f	85db1316-7e7e-419f-9d3b-683a5e8ed07e	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
5bed7897-0b96-433e-9b06-1e3d81ee022e	58	900	t	f	21ececf9-24fc-4463-9589-c0fce2fcb976	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
5c1390b2-0b1c-4bc1-8015-6546964eaa8b	1	1900	t	f	c6952e0b-83f7-4574-b55b-02b74a3bdbe1	25e2364a-4178-4524-b0d8-d86803014a6d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
5df2d781-9bfc-457d-b441-b8c60f7f0846	52	1200	t	f	33455f91-db6f-431f-a95a-79e9d5da76ec	d4066030-9fa1-451f-9a68-6db9716335a4	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
64c70e33-0db5-43fd-9460-5e71fba91a8e	39	280	t	f	7ea57bf1-1f3f-4f6c-9a90-40ab2800fa6b	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
7126b35f-a7ac-4864-b2ed-b3985b9e637c	58	900	t	f	2a2b05ee-1417-40a0-b0a3-9361c29e97af	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
712b999e-a0ff-4475-bddb-dbc05acb7524	55	400	t	f	19886c8d-e4cd-4c13-9df6-db3b98e4b43b	d07f6cb0-5148-4988-a6d4-6928ebb01e94	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
7a2edb58-acbd-4b33-a564-409808ce8bf4	2	1880	t	f	2580406a-d593-48cb-b9ae-cf37a7c16339	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
7f3137ad-5547-454a-bb88-4dd84f68d058	48	1900	t	f	3411c50d-0de7-45bb-9fee-a7360addbdb2	5e2bf136-3026-4068-84da-68c385b48eab	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
856db091-b8db-492b-ac73-a272ae0dee26	2	1880	t	f	327f314d-0c05-49fd-b730-9b34f3a4d7e9	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
85d782c6-54c0-4661-9330-9a4aeb97f89c	56	400	t	f	73ac1426-fa4e-4839-bf66-8a9ab04e884c	7d31c6b7-98a4-4d9b-ac29-a32f74eb6a22	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
8dcddfc8-7839-411e-b5fd-d3f14a5dac2c	58	900	t	f	1183be85-60aa-4f12-9fef-2fcfe06a3d59	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
954f53ff-a53a-470c-85ae-d2de381c7141	56	400	t	f	23273a77-40d5-472c-bcb6-cc1adf2b7bc9	7d31c6b7-98a4-4d9b-ac29-a32f74eb6a22	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
9b4af8e4-5d06-4810-b547-1aa31312b954	58	900	t	f	19886c8d-e4cd-4c13-9df6-db3b98e4b43b	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
a313c5d6-6ec9-432d-8844-2a0d59f96f54	54	400	t	f	1183be85-60aa-4f12-9fef-2fcfe06a3d59	c06493d0-18db-4b37-8c58-97e168e5c3d3	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
a338397e-bfb9-404d-a941-6dc2e86e5315	1	1900	t	f	2580406a-d593-48cb-b9ae-cf37a7c16339	25e2364a-4178-4524-b0d8-d86803014a6d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
aaac0425-9c3f-42ec-b759-3ca5028508e8	2	1880	t	f	ae94e562-5e50-420c-8ecb-896ab2310d2f	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
aad6168b-ba92-4dd6-ac60-8dc46a27d75f	58	900	t	f	31cac7b5-b08e-41c8-b16a-ac6c925563e7	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
b1541987-8397-4ece-804e-3a8d2afe8348	52	1200	t	f	679a789d-5479-4ecd-bb3b-ae72af5b56ee	d4066030-9fa1-451f-9a68-6db9716335a4	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
b553c5f9-118c-44c8-9913-6c2addcde9c3	57	400	t	f	21ececf9-24fc-4463-9589-c0fce2fcb976	01a58123-c65f-4329-8ffe-d56e225dea84	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
b5a45ca1-1207-48d5-a31f-2b52937e753f	18	4000	t	f	2a2b05ee-1417-40a0-b0a3-9361c29e97af	6657a044-8407-4959-b295-d2e74cf316c2	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
b5d1269a-34f1-452a-9a15-2924dc1b70dc	52	1200	t	f	bf9b3b78-d618-446e-8722-a85a0094fda7	d4066030-9fa1-451f-9a68-6db9716335a4	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
b6821394-662f-48b8-94a5-7a5eaaf8d687	39	280	t	f	31cac7b5-b08e-41c8-b16a-ac6c925563e7	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
bc485460-7bd9-440d-83b2-538347657dc0	2	1880	t	f	840922d2-a88e-463c-9770-602050ee1de2	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
bd442ce7-2a1f-4e24-9f96-052d2226aa52	54	400	t	f	6c41941d-38fb-4119-a2ed-091429bd916c	c06493d0-18db-4b37-8c58-97e168e5c3d3	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
bedfdae9-a2db-4320-aa7d-2bb0d873ea49	54	400	t	f	19886c8d-e4cd-4c13-9df6-db3b98e4b43b	c06493d0-18db-4b37-8c58-97e168e5c3d3	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
c3317ca7-73be-4997-9841-b08640c5f241	48	1900	t	f	de00c88f-02e6-49b9-b468-a9a5ea425e41	5e2bf136-3026-4068-84da-68c385b48eab	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
c40ba7ec-98d6-4fd4-9fc1-bd8aee9cfb7d	52	1200	t	f	8388fc98-0131-4b28-b815-727be8cd4849	d4066030-9fa1-451f-9a68-6db9716335a4	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
c476cbc6-e46d-45e5-87e0-51c11c57a20d	58	900	t	f	6c41941d-38fb-4119-a2ed-091429bd916c	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
cafdf838-6c12-47b4-9e69-5027dcfd1719	1	1900	t	f	013358a3-bc69-409a-a01f-4cfba3ea4c7c	25e2364a-4178-4524-b0d8-d86803014a6d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
cbd95fb2-f2aa-4380-88db-b5187d4d75b2	52	1200	t	f	ae62891e-f9ad-445d-b1c1-fdcc4856a788	d4066030-9fa1-451f-9a68-6db9716335a4	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
cd0b83ed-661d-4f17-8ff4-0c527667401d	55	400	t	f	8b046eb8-b7ef-4c06-8056-0b61277fa893	d07f6cb0-5148-4988-a6d4-6928ebb01e94	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
d0cc448c-7ac9-46b9-a965-c699ed997266	39	280	t	f	b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
d636cf63-c92d-48e8-9b0a-2ad5f72f92e3	18	4000	t	f	1183be85-60aa-4f12-9fef-2fcfe06a3d59	6657a044-8407-4959-b295-d2e74cf316c2	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
d63d798b-0994-4a57-93c8-ae9fa4bfc872	1	1900	t	f	eeb0bc45-bfef-482d-919c-38cf0defa556	25e2364a-4178-4524-b0d8-d86803014a6d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
d66e4bbb-4ced-4019-ac9a-7f534f688e60	39	280	t	f	de00c88f-02e6-49b9-b468-a9a5ea425e41	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
db6e758f-6916-4c58-89fb-1019a13d0c89	58	900	t	f	23273a77-40d5-472c-bcb6-cc1adf2b7bc9	8b19030a-74f5-4f2c-9af5-03de39d19213	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
deb4b352-42f6-46fb-9826-113902779278	48	1900	t	f	b0dbe5cd-edda-4f5c-86d7-f04a9da0a161	5e2bf136-3026-4068-84da-68c385b48eab	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
e8a61f7e-919d-424f-ac7c-1a33630bf7b3	39	280	t	f	21ececf9-24fc-4463-9589-c0fce2fcb976	adab7b5c-e893-4cee-b731-43c367a9013f	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
f8c15d4b-7dd9-4629-ac2d-5267ba54f05f	57	400	t	f	49a70041-773c-4de8-98f8-efea4453047d	01a58123-c65f-4329-8ffe-d56e225dea84	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
fa6598fc-93f8-4f09-b4b3-090ed4adbcb4	2	1880	t	f	013358a3-bc69-409a-a01f-4cfba3ea4c7c	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
fd1f5ac5-3571-4471-8395-8fe87192b67b	55	400	t	f	5c85656b-665c-4ac9-97f5-d50145290d8a	d07f6cb0-5148-4988-a6d4-6928ebb01e94	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
fef1ba04-41b5-4c02-b52a-44177aafaa5d	2	1880	t	f	c6952e0b-83f7-4574-b55b-02b74a3bdbe1	44b3423b-5adf-4196-8776-5446f5ad739d	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
01a58123-c65f-4329-8ffe-d56e225dea84	57	Инструкция 57	57
25e2364a-4178-4524-b0d8-d86803014a6d	1	Инструкция 1	1
44b3423b-5adf-4196-8776-5446f5ad739d	2	Инструкция 2	2
5e2bf136-3026-4068-84da-68c385b48eab	48	Инструкция 48	48
6657a044-8407-4959-b295-d2e74cf316c2	18	Инструкция 18	18
7d31c6b7-98a4-4d9b-ac29-a32f74eb6a22	56	Инструкция 56	56
8b19030a-74f5-4f2c-9af5-03de39d19213	58	Инструкция 58	58
adab7b5c-e893-4cee-b731-43c367a9013f	39	Инструкция 39	39
c06493d0-18db-4b37-8c58-97e168e5c3d3	54	Инструкция 54	54
d07f6cb0-5148-4988-a6d4-6928ebb01e94	55	Инструкция 55	55
d4066030-9fa1-451f-9a68-6db9716335a4	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
18093ee7-a817-4301-a7f8-daf7d028b9d0	7513D-2800010-20	Рама	\N	3330041
ac977fe9-d0ac-4888-89cc-4fe0a5914cf5	75131-2800010-70	Рама	\N	3291137
c5807e80-769b-4653-bc75-e0d004ae6a9d	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
40db31b1-d5bb-42aa-ba3a-269351d7cd2d	28099864-bfd3-4a72-89ae-6dd706673fcb
d8977782-218a-4ae1-b1c4-13b802ee11b2	28099864-bfd3-4a72-89ae-6dd706673fcb
1dddbf83-a0fc-43fe-9b94-79cb4aae8204	f2f3323c-8b26-4747-95c4-d30e22a7d309
e80108dc-7854-40d3-b895-3c2f646e9157	f2f3323c-8b26-4747-95c4-d30e22a7d309
0b033db9-5dca-4743-939c-2aff71909a2a	f5c83c6b-f748-4203-8d13-e09a914bdeb7
28425653-6ce5-47d9-8ac6-fdde3fa6d308	f5c83c6b-f748-4203-8d13-e09a914bdeb7
3d2fadb9-9cb0-4bc8-a742-13566811bfae	f5c83c6b-f748-4203-8d13-e09a914bdeb7
5691e672-2e8b-43f1-b795-e70c29079db4	f5c83c6b-f748-4203-8d13-e09a914bdeb7
8c431f4a-2025-4fcc-9288-fddc2ac62051	f5c83c6b-f748-4203-8d13-e09a914bdeb7
a30ec538-b23e-47a4-ab0f-395aacf7eded	f5c83c6b-f748-4203-8d13-e09a914bdeb7
a4be7509-bca6-4f3e-a0c6-68600bdaed9b	f5c83c6b-f748-4203-8d13-e09a914bdeb7
da56ee4a-3ba9-4def-b23c-3ec2aee622ec	f5c83c6b-f748-4203-8d13-e09a914bdeb7
92b90e22-f8bc-4bf6-bd21-0ac2d7c3eff6	d70d68cc-539a-41dd-82cb-bbd57ef38ada
fb107f71-f777-420a-be58-d9688ab94971	b971ebad-51b1-4e3d-a4ad-acbd6c8efc5d
e4e81c4c-6848-4087-93d2-f7b3f27936ea	f5c83c6b-f748-4203-8d13-e09a914bdeb7
64d6cbd2-51f0-44e8-96c7-e1f865df59e9	28099864-bfd3-4a72-89ae-6dd706673fcb
38687417-1e59-4ed7-8256-00e9ad4c350f	d70d68cc-539a-41dd-82cb-bbd57ef38ada
f25749ac-faba-422b-befb-4d8198bf908f	f2f3323c-8b26-4747-95c4-d30e22a7d309
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
40db31b1-d5bb-42aa-ba3a-269351d7cd2d	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
d8977782-218a-4ae1-b1c4-13b802ee11b2	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
1dddbf83-a0fc-43fe-9b94-79cb4aae8204	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
e80108dc-7854-40d3-b895-3c2f646e9157	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
0b033db9-5dca-4743-939c-2aff71909a2a	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
28425653-6ce5-47d9-8ac6-fdde3fa6d308	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
3d2fadb9-9cb0-4bc8-a742-13566811bfae	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
5691e672-2e8b-43f1-b795-e70c29079db4	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
8c431f4a-2025-4fcc-9288-fddc2ac62051	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
a30ec538-b23e-47a4-ab0f-395aacf7eded	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
a4be7509-bca6-4f3e-a0c6-68600bdaed9b	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
da56ee4a-3ba9-4def-b23c-3ec2aee622ec	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
92b90e22-f8bc-4bf6-bd21-0ac2d7c3eff6	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
fb107f71-f777-420a-be58-d9688ab94971	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$+fxNbaBXXxQDH71uWah0haD3nvnmK3AUNPx90to8EPDUx9zS	\N	\N	\N	\N	\N	\N
e4e81c4c-6848-4087-93d2-f7b3f27936ea	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$dXniSJfQm3wAyyrn7b85ip4GAF4yBUgxGTznsbLVAGvgMEbd	\N	\N	\N	\N	\N	\N
64d6cbd2-51f0-44e8-96c7-e1f865df59e9	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$S8gQvbBBEyY7H9e07eoPz6HNdlMWfXaNR+1Q/8bjCpaszblQ	\N	\N	\N	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
38687417-1e59-4ed7-8256-00e9ad4c350f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$xcqN8FZOT2byU2BEJIzQ0t9CCBBSA9EP/+iTH93ZELygowig	\N	\N	\N	\N	\N	\N
f25749ac-faba-422b-befb-4d8198bf908f	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$NhdwGNELPTl+/Pw73JcBYhHweo7XkdzPf77ByMiD5qym2cj4	\N	\N	\N	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
2e1d5d1c-3d2d-4c67-9722-dc4de8d89509	1	Заполняющий	230	270	23	26	\N	\N	44b3423b-5adf-4196-8776-5446f5ad739d	\N
36cbed63-2f88-4550-9c7c-a3eb4aeda590	1	Заполняющий	230	270	23	26	\N	\N	c06493d0-18db-4b37-8c58-97e168e5c3d3	\N
37353bf7-bbbf-48c2-8251-759dd9339177	1	Заполняющий	230	270	23	26	\N	\N	25e2364a-4178-4524-b0d8-d86803014a6d	\N
6ee0717d-2877-4f4b-9bc4-d49fa0aed240	1	Заполняющий	230	270	23	26	\N	\N	5e2bf136-3026-4068-84da-68c385b48eab	\N
6f3e0a9c-339a-482f-b8eb-26945e53bdc2	1	Заполняющий	230	270	23	26	\N	\N	01a58123-c65f-4329-8ffe-d56e225dea84	\N
76e48c61-1aca-4526-828a-ce4b2c2666bb	1	Заполняющий	230	270	23	26	\N	\N	d4066030-9fa1-451f-9a68-6db9716335a4	\N
85a93b41-36c5-4bf5-8c53-44cd69bc52e6	1	Заполняющий	230	270	23	26	\N	\N	7d31c6b7-98a4-4d9b-ac29-a32f74eb6a22	\N
b586ab1c-a7e9-4225-a9d3-9d44d7ce7bdf	1	Заполняющий	230	270	23	26	\N	\N	8b19030a-74f5-4f2c-9af5-03de39d19213	\N
bc23ee19-79a9-4eb1-9aec-77c9ba742e43	1	Заполняющий	230	270	23	26	\N	\N	adab7b5c-e893-4cee-b731-43c367a9013f	\N
c94af965-0524-4a5c-bf09-2ecdc7bf5f02	1	Заполняющий	230	270	23	26	\N	\N	6657a044-8407-4959-b295-d2e74cf316c2	\N
ee5e33fb-0551-4c6b-a791-c895594e58bb	1	Заполняющий	230	270	23	26	\N	\N	d07f6cb0-5148-4988-a6d4-6928ebb01e94	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
3d9e3191-ded9-44bb-b379-51a25c6592ad	1	Корневой	82	0.11	0.68	f	f	t	647a98b0-bb26-4cb9-b879-7c8a8758c058	24e928f8-df13-435a-a262-da9c41bb4c20	\N
ee1a2e5b-5645-4309-b1f5-02391c6054ac	1	Корневой	82	0.11	0.68	f	f	t	eed2d389-e098-4572-ba52-e712b0b62180	3ef405ae-5b3a-402b-9bda-3f3e20b864ee	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0f894bab-45f3-4b39-8871-2ae16228d5cc	04d0e72a-499a-4ea8-8c35-64784d804645
0f894bab-45f3-4b39-8871-2ae16228d5cc	9c496bc1-c8df-4e33-8646-ea414ea1b912
6172ee6e-3e89-4e64-b70a-6fcf5345a71a	04d0e72a-499a-4ea8-8c35-64784d804645
6172ee6e-3e89-4e64-b70a-6fcf5345a71a	9c496bc1-c8df-4e33-8646-ea414ea1b912
72ec1cb5-184e-401c-bd9e-de8437ac2246	04d0e72a-499a-4ea8-8c35-64784d804645
72ec1cb5-184e-401c-bd9e-de8437ac2246	9c496bc1-c8df-4e33-8646-ea414ea1b912
a7c5289b-3e0c-4749-b65d-28e302bff1f5	02518dc6-43c6-4ebb-864d-7c093d226ead
bb242da3-81c7-4ef0-957c-45f0eebda256	a86d59f8-e52e-4ef8-b044-34c8ae30e07c
c9383630-b13e-4ccf-b53f-60b22eb5882c	04d0e72a-499a-4ea8-8c35-64784d804645
c9383630-b13e-4ccf-b53f-60b22eb5882c	9c496bc1-c8df-4e33-8646-ea414ea1b912
f17dbbc4-935c-46e9-835d-53ce1b1d2b1c	a86d59f8-e52e-4ef8-b044-34c8ae30e07c
f5b47d4a-8525-4fa6-9e85-f4dbf5f8ae1c	02518dc6-43c6-4ebb-864d-7c093d226ead
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0f894bab-45f3-4b39-8871-2ae16228d5cc	0b033db9-5dca-4743-939c-2aff71909a2a	\N	150838
6172ee6e-3e89-4e64-b70a-6fcf5345a71a	3d2fadb9-9cb0-4bc8-a742-13566811bfae	\N	150882
72ec1cb5-184e-401c-bd9e-de8437ac2246	a4be7509-bca6-4f3e-a0c6-68600bdaed9b	\N	146164
a7c5289b-3e0c-4749-b65d-28e302bff1f5	5691e672-2e8b-43f1-b795-e70c29079db4	\N	121267
bb242da3-81c7-4ef0-957c-45f0eebda256	a30ec538-b23e-47a4-ab0f-395aacf7eded	\N	132695
c9383630-b13e-4ccf-b53f-60b22eb5882c	da56ee4a-3ba9-4def-b23c-3ec2aee622ec	\N	114729
f17dbbc4-935c-46e9-835d-53ce1b1d2b1c	8c431f4a-2025-4fcc-9288-fddc2ac62051	\N	122575
f5b47d4a-8525-4fa6-9e85-f4dbf5f8ae1c	28425653-6ce5-47d9-8ac6-fdde3fa6d308	\N	117390
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
02518dc6-43c6-4ebb-864d-7c093d226ead	234c54b7-20ed-4752-9f12-e2baa3574c59
02518dc6-43c6-4ebb-864d-7c093d226ead	7926fba8-045a-4c81-9748-34e53e4d968b
04d0e72a-499a-4ea8-8c35-64784d804645	021b749b-dcba-4d55-8dd6-96d51510e10c
04d0e72a-499a-4ea8-8c35-64784d804645	234c54b7-20ed-4752-9f12-e2baa3574c59
04d0e72a-499a-4ea8-8c35-64784d804645	e0a700fd-f7b0-4a3c-989c-e3c444ba49f9
04d0e72a-499a-4ea8-8c35-64784d804645	e4004490-5b78-4e7e-b7c0-c9db04bd78ab
9c496bc1-c8df-4e33-8646-ea414ea1b912	021b749b-dcba-4d55-8dd6-96d51510e10c
9c496bc1-c8df-4e33-8646-ea414ea1b912	234c54b7-20ed-4752-9f12-e2baa3574c59
9c496bc1-c8df-4e33-8646-ea414ea1b912	e0a700fd-f7b0-4a3c-989c-e3c444ba49f9
9c496bc1-c8df-4e33-8646-ea414ea1b912	e4004490-5b78-4e7e-b7c0-c9db04bd78ab
a86d59f8-e52e-4ef8-b044-34c8ae30e07c	021b749b-dcba-4d55-8dd6-96d51510e10c
a86d59f8-e52e-4ef8-b044-34c8ae30e07c	c91ca004-6f0e-44b2-abfb-50304e75f9db
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
02518dc6-43c6-4ebb-864d-7c093d226ead	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	73f29544-f289-44e2-8ce9-80052abe49ba	49232
04d0e72a-499a-4ea8-8c35-64784d804645	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	73f29544-f289-44e2-8ce9-80052abe49ba	49283
9c496bc1-c8df-4e33-8646-ea414ea1b912	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	73f29544-f289-44e2-8ce9-80052abe49ba	49141
a86d59f8-e52e-4ef8-b044-34c8ae30e07c	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	73f29544-f289-44e2-8ce9-80052abe49ba	49286
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
647a98b0-bb26-4cb9-b879-7c8a8758c058	2023-03-12 12:56:50.140436	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	04d0e72a-499a-4ea8-8c35-64784d804645	a7c5289b-3e0c-4749-b65d-28e302bff1f5	73f29544-f289-44e2-8ce9-80052abe49ba	\N
eed2d389-e098-4572-ba52-e712b0b62180	2023-03-12 12:56:50.140276	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	04d0e72a-499a-4ea8-8c35-64784d804645	a7c5289b-3e0c-4749-b65d-28e302bff1f5	73f29544-f289-44e2-8ce9-80052abe49ba	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
24e928f8-df13-435a-a262-da9c41bb4c20	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	f18df287-c3aa-464d-82c9-01451972ba78	a7c5289b-3e0c-4749-b65d-28e302bff1f5	73f29544-f289-44e2-8ce9-80052abe49ba	ec3ec66a-c020-457e-89ce-56e475901daf	\N
3ef405ae-5b3a-402b-9bda-3f3e20b864ee	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	d5a226bb-135c-439e-8fb8-965fcfceef0d	a7c5289b-3e0c-4749-b65d-28e302bff1f5	73f29544-f289-44e2-8ce9-80052abe49ba	ec3ec66a-c020-457e-89ce-56e475901daf	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
94567d59-92ca-434c-ba63-2ee2f4276671	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	0300daa1-9687-468b-8801-a38eb73e1a48	\N
d4de2747-02b3-4686-8eae-d31a55febee6	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	0300daa1-9687-468b-8801-a38eb73e1a48	\N
fcb26c0f-114a-489a-a832-705647f304be	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	0300daa1-9687-468b-8801-a38eb73e1a48	\N
893f3dd0-01f5-4760-b74f-62fe56e8b227	1	12:10:00	13:10:00	13:20:00	13:50:00	ed841dc6-0390-4227-9e4f-da662dbfbcdc	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
021b749b-dcba-4d55-8dd6-96d51510e10c	3500	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	3500
234c54b7-20ed-4752-9f12-e2baa3574c59	3610	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	3610
7926fba8-045a-4c81-9748-34e53e4d968b	3600	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	3600
c91ca004-6f0e-44b2-abfb-50304e75f9db	3510	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	3510
e0a700fd-f7b0-4a3c-989c-e3c444ba49f9	3550	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	3550
e4004490-5b78-4e7e-b7c0-c9db04bd78ab	3690	\N	b6cb036d-a485-4f54-bf88-d409f90a74d0	3690
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
ef3d070a-05c8-4197-b422-f7b41a089eda	Сварочный цех	50	050
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

