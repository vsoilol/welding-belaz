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
    "WeldingEquipmentId" uuid,
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
-- Name: ProductInsides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductInsides" (
    "MainProductId" uuid NOT NULL,
    "InsideProductId" uuid NOT NULL
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
    "Name" text,
    "Number" text NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductType" integer NOT NULL,
    "WeldingTaskId" uuid,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "MasterId" uuid,
    "InspectorId" uuid,
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
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "WelderId" uuid,
    "InspectorId" uuid,
    "IdFromSystem" text
);


--
-- Name: StatusReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StatusReasons" (
    "Id" uuid NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Status" integer NOT NULL,
    "Reason" text,
    "DetectedDefects" text,
    "ProductId" uuid,
    "SeamId" uuid,
    "IdFromSystem" text
);


--
-- Name: TechnologicalInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalInstructions" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "SeamId" uuid NOT NULL,
    "TechnologicalProcessId" uuid,
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
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "IsDone" boolean NOT NULL,
    "SeamId" uuid NOT NULL,
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
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "WeldingDate" timestamp without time zone,
    "BasicMaterial" text NOT NULL,
    "MainMaterialBatchNumber" text NOT NULL,
    "WeldingMaterial" text NOT NULL,
    "WeldingMaterialBatchNumber" text NOT NULL,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "IdFromSystem" text
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
a9af3b6e-b917-4d26-8fb6-9a41c66236f8	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
c6b50cc1-0803-422e-ada6-fad2efb06156	7bbfda84-f5b8-4c80-a145-22839083125a	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
ac622970-9ad1-4453-987e-f55fd09ad18e	1	10	t	a9af3b6e-b917-4d26-8fb6-9a41c66236f8	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
02429c17-4d1d-4992-82d3-335136e6d063	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
0985726c-9a3a-4cc7-9530-20d75734233c	Естественные надобности	\N
272f5d48-3802-4b52-9189-a06248c60a12	Работа с управляющей программой	\N
2b347a71-c452-409a-9d5b-d1575ca5c99d	Установка, выверка, снятие детали	\N
2b89c1af-a1b4-4080-934f-b921906e6aa1	Отсутствие оператора в связи с необеспеченностью	\N
2ca30a64-4c4f-4f46-a7b0-c12ce5773a4d	Праздники и выходные	\N
2eb3baeb-9c1a-427d-a22b-3e410a7568f5	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
4bdfea13-dabe-4a07-a240-bc969408fb81	Сборочные операции	\N
507faaa7-d4b5-4ea6-88bc-e6efc1c140dd	Контроль на рабочем месте	\N
521bf3f3-33fc-4c73-9777-0b893eee8b50	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
536b1adf-c6b4-4455-90fe-3bc8b093b9b5	Плановый ремонт централизованными службами	\N
5c642857-0454-4095-b8c5-8793ddd32037	Ознакомление с работой, документацией, инструктаж	\N
7cfa17bc-8fac-4b3e-b30d-6990ef319101	Неявка оператора (б/лист, отпуск, и пр.)	\N
7d355ded-2097-4fec-9be7-a2a2595c8fd0	Нерабочее время по графику согласно сменности	\N
7d61c645-bf3e-4fa0-b041-6b8dd2fc0591	Аварийный ремонт централизованными службами	\N
8215be24-1f20-4263-8744-ad2c1e557914	Отсутствие энергоносителей	\N
82180056-ed60-49d3-a245-a17f4a5043dc	Отсутствие заданий	\N
82ce9d27-ef10-4d69-b748-ec9d5b30f4c6	Изменение режимов, смена инструмента, приспособления	\N
8aded3a9-6a9b-4c7c-a5d6-1bc2acd4e705	Отсутствие материала, заготовок, деталей	\N
bedce9a3-644d-4f29-ab19-36d58f65f10c	Отсутствие конструктора, технолога или ожидание его решения	\N
c51b6825-626d-47c6-be34-903450934132	Отсутствие крана, транспорта	\N
e3ba8dab-e433-4a55-bcf0-c5ed4096b12d	Обед	\N
f182718d-ec1b-4ea7-9be8-f804e9415832	Работа по карте несоответствий	\N
f9f8fd17-56e0-469b-abf4-57dcf7e7aafb	Отсутствие сотрудника ОТК	\N
ffffc7e1-4900-4e74-aa18-39bd414862f0	Установка, выверка, снятие детали	\N
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
30e2a6c1-fba1-428e-8098-bbcdd8110c7f	bf8ee0a6-fde9-4529-86cf-0f70e4eb1b7d	235565
803a35bf-9a20-4dc6-bcb6-dcc9eb3a2bcb	646fad25-bcf8-4c50-9752-6ad9ca4b4e76	251534
d6992935-335d-42c8-85b0-d793ab0db199	1e50a9d6-09f2-42f2-8754-9b91df3c1565	256467
0feb3ce5-cb67-4123-9b4e-e46a51a6b8da	843f5c5f-28a2-4d01-a3aa-9ad6920aac4a	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
2d204bf1-7524-410e-8bb7-e739768a5b11	d02b0081-350f-45e9-8db8-6fb70436aff4	\N	613668
68a10a8f-0e3e-4c7d-a596-3bb7bcab0e4c	eb342252-4cc8-4a7d-9180-d6259fae9a0a	\N	643759
88027041-3301-4c69-bc83-a6e1a258fb18	1aeb0adf-9497-41cc-b24a-159a008c91e7	\N	617215
90735cbd-7223-48fc-9c3e-c7caaeb148e8	a6d34751-940a-4efb-b69b-55a6b4b5010b	\N	612000
db07b406-b09e-4edc-9f1b-104144ef4765	40f70825-a7e4-4d2d-8629-75b1a22a89aa	\N	614208
768611e8-b69c-4a5c-8e35-246fea64f652	eb6736e2-bd25-480c-816c-bd4503b45b4a	\N	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
10581d2d-825f-4d3e-a619-77a17851a6b8	2	Пост 2	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
72db3679-ef24-41f3-a93e-7e54fe1736c1	1	Пост 1	5fef4716-891e-4ec6-9df2-697ac632b7af	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
c3d87244-3a72-4351-90c5-c57246b1b409	067e0bf3-774b-4aa4-9fc5-78c5765fc5d6
c3f99ccb-73e8-45c4-933c-9ca2950586a4	0ef68564-9547-49d1-babd-990e3787eca5
93244c3f-0a26-41b2-b0ca-bdbc674a0352	22b7bfb1-31e2-4687-a6ce-17018550cd78
e8159941-c5fb-440e-9880-5255b37bbd38	36231fe4-e3d9-4da7-9a96-c5089dbfc901
5df66ca3-6ec5-4eba-b672-6e74245e0c19	489f143e-d949-45db-8b87-0b7769c9c74f
5df66ca3-6ec5-4eba-b672-6e74245e0c19	493a2358-7fea-42b3-954a-13048fec86b1
e8159941-c5fb-440e-9880-5255b37bbd38	4ebc0a60-a7fd-44a7-8b3b-e0c5147e21da
0ef68564-9547-49d1-babd-990e3787eca5	550efdf4-27ef-48ba-b7d7-45e5afd0c979
097b00d8-5a41-4aff-abd6-015fafe8da75	5707493f-5b37-4095-933b-45d57bd33a9b
097b00d8-5a41-4aff-abd6-015fafe8da75	5df66ca3-6ec5-4eba-b672-6e74245e0c19
e8159941-c5fb-440e-9880-5255b37bbd38	921d6856-07de-462a-9c08-46a01a633563
c3f99ccb-73e8-45c4-933c-9ca2950586a4	93244c3f-0a26-41b2-b0ca-bdbc674a0352
d5a15588-63d7-4e92-afda-b776681ca9a4	a9d40448-e74c-448a-a985-5dd6d4ea9e0a
93244c3f-0a26-41b2-b0ca-bdbc674a0352	b457aa57-daa6-4967-9e89-3e9d0bc66548
097b00d8-5a41-4aff-abd6-015fafe8da75	bd64eada-4ff6-46c8-a393-e3ea2270182c
c3f99ccb-73e8-45c4-933c-9ca2950586a4	c1be2e3a-9525-495a-befb-d977a533f378
e8159941-c5fb-440e-9880-5255b37bbd38	c3d87244-3a72-4351-90c5-c57246b1b409
36231fe4-e3d9-4da7-9a96-c5089dbfc901	c855e1c0-8632-4a97-8945-0e44223fb7bf
0ef68564-9547-49d1-babd-990e3787eca5	d1545b2e-2dcd-4542-9953-cd513ecc7a01
097b00d8-5a41-4aff-abd6-015fafe8da75	d5a15588-63d7-4e92-afda-b776681ca9a4
c3f99ccb-73e8-45c4-933c-9ca2950586a4	d8a4a1c0-4ae9-431f-bf6b-7e8531bb68d2
c3d87244-3a72-4351-90c5-c57246b1b409	dc0c1a8c-803b-4b5f-a795-404212c3a9d4
d5a15588-63d7-4e92-afda-b776681ca9a4	ec1c17b1-001a-462c-b544-ec45d0194eec
36231fe4-e3d9-4da7-9a96-c5089dbfc901	ef8ea3c7-2d69-484f-ba81-26c32a4d681b
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
5c6b16bf-84ad-4186-8e7c-c0179de02584	Производственный участок 5	5	c8b6b066-35f3-4888-979c-442ccfb49682	05
5fef4716-891e-4ec6-9df2-697ac632b7af	Сборка, сварка мостов	1	05691a0c-8ca4-4595-9a19-3d16c04b5d4a	01
954426d6-cd6a-47ce-aa38-5d250d12f2bb	Сборка, сварка узл. и рам к/с г/п 120-220т	4	05691a0c-8ca4-4595-9a19-3d16c04b5d4a	04
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "WeldingTaskId", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
067e0bf3-774b-4aa4-9fc5-78c5765fc5d6	Кронштейн	75303-1001293	1	f	f	3	\N	72200315-f300-4f69-9e46-977031e90767	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536247228
097b00d8-5a41-4aff-abd6-015fafe8da75	Картер заднего моста	75132-2401006-50	1	f	f	1	\N	70461af2-a803-47a5-99cb-63db9f99a7a2	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536467567
0ef68564-9547-49d1-babd-990e3787eca5	Труба картера заднего моста	75580-2401010-01	1	f	f	2	\N	eb4ddcc2-c848-4a56-bac9-e97c0e8746f3	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536386240
22b7bfb1-31e2-4687-a6ce-17018550cd78	Кольцо	75580-2401227	1	f	f	3	\N	d0f24999-7011-4148-a18e-3d4fea4151a7	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536384312
36231fe4-e3d9-4da7-9a96-c5089dbfc901	Кронштейн	75310-1183100	1	f	f	2	\N	3329050f-6484-4885-b2d6-f0c145c906d0	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536267493
489f143e-d949-45db-8b87-0b7769c9c74f	Распорка	7521-3932688	1	f	f	3	\N	6778b35a-a89a-4c47-beaa-f9f5efbbc281	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536273606
493a2358-7fea-42b3-954a-13048fec86b1	Проушина	7521-2401224	1	f	f	3	\N	87a2bc73-52f9-4c75-8901-75daf762c6d7	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536274170
4ebc0a60-a7fd-44a7-8b3b-e0c5147e21da	Кронштейн	75211-1018162	1	f	f	3	\N	254f202c-dbaf-4d35-8236-22e5d5a1f8c9	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536270344
550efdf4-27ef-48ba-b7d7-45e5afd0c979	Фланец картера	75580-2401114-11	1	f	f	3	\N	53172fa4-ff2f-4b46-8bf8-c47b0dab3303	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536386265
5707493f-5b37-4095-933b-45d57bd33a9b	Кронштейн	75131-2113296-10	1	f	f	3	\N	001028fb-7d45-4fc0-9691-7163540eb2da	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536461620
5df66ca3-6ec5-4eba-b672-6e74245e0c19	Кронштейн	7521-2401220	1	f	f	2	\N	75732a9a-9350-48ea-97f5-b0340737a2d7	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536273956
921d6856-07de-462a-9c08-46a01a633563	Накладка	549Б-1015842	1	f	f	3	\N	65a641c4-deee-4361-a67f-0c10918541a3	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536196288
93244c3f-0a26-41b2-b0ca-bdbc674a0352	Картер заднего моста	75580-2401008	1	f	f	2	\N	139dc661-89d5-47c8-8522-1880f44d4f35	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536384295
a9d40448-e74c-448a-a985-5dd6d4ea9e0a	Пластина	75132-2401106	1	f	f	3	\N	abd82f73-dbc5-4d70-bafc-bd37cc469b9d	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536444153
b457aa57-daa6-4967-9e89-3e9d0bc66548	Втулка	75303-2128438	1	f	f	3	\N	b665af62-feb4-48e8-a471-09e8535ca0b2	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536248270
bd64eada-4ff6-46c8-a393-e3ea2270182c	Панель	75132-2105522	1	f	f	3	\N	1315bdce-dc20-4b6d-a8df-30f7cf90bd52	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536417730
c1be2e3a-9525-495a-befb-d977a533f378	Кронштейн	75580-2113192	1	f	f	3	\N	8e579e1c-2864-43be-a16c-b1d17d36721b	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536384314
c3d87244-3a72-4351-90c5-c57246b1b409	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	\N	6dc2f951-cd39-4b53-be7d-2b1bff913099	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536248707
c3f99ccb-73e8-45c4-933c-9ca2950586a4	Картер заднего моста	75580-2401006	1	f	f	1	\N	bb79afc5-8938-46b5-954e-032b825c46ac	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536384294
c855e1c0-8632-4a97-8945-0e44223fb7bf	Кронштейн	75310-1183106	1	f	f	3	\N	bb03e158-4cb3-4dd9-a925-ecfb96e4b8ba	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536267485
d1545b2e-2dcd-4542-9953-cd513ecc7a01	Труба картера	75580-2401132-10	1	f	f	3	\N	a82c289b-faf6-450d-85e1-ce8ed5d01165	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536386250
d5a15588-63d7-4e92-afda-b776681ca9a4	Картер заднего моста	75132-2401008-50	1	f	f	2	\N	c50b99fc-f350-4029-ba47-d98a9a345099	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	\N	\N	4536467565
dc0c1a8c-803b-4b5f-a795-404212c3a9d4	Кронштейн	75304-1001253	1	f	f	3	\N	f9e2148a-988f-4484-a4ef-58bf4853df18	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536248708
e8159941-c5fb-440e-9880-5255b37bbd38	Рама	75313-2800010-20	1	f	f	1	\N	53221e86-fe2b-46c0-a0f5-15e7069a9102	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536287819
ef8ea3c7-2d69-484f-ba81-26c32a4d681b	Кронштейн	75310-1183102	1	f	f	3	\N	577cedf3-fc4b-4638-b119-8d4516a8a309	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	\N	\N	4536267484
d8a4a1c0-4ae9-431f-bf6b-7e8531bb68d2	Панель	75580-2105522	1	f	f	3	\N	1fe0e49d-d7a7-421e-81ce-d01c026065c3	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	768611e8-b69c-4a5c-8e35-246fea64f652	\N	4536384399
ec1c17b1-001a-462c-b544-ec45d0194eec	Опора	75211-2401122	1	f	f	3	\N	68a06ab3-9ef3-4d7b-b0af-b91876ba85de	5fef4716-891e-4ec6-9df2-697ac632b7af	\N	768611e8-b69c-4a5c-8e35-246fea64f652	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
a0358457-b726-4ad1-9b4a-60a215ce281e	Admin	\N
7a72c637-524d-4cee-a881-04f09789330a	Master	\N
e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e	Welder	\N
88473306-fb16-4dc2-9922-e8cd108aa743	Inspector	\N
dce7713e-4bfd-4f3a-affa-e96bd38bdafc	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductId", "ProductionAreaId", "WorkplaceId", "WelderId", "InspectorId", "IdFromSystem") FROM stdin;
4fc78d2b-23d1-4cc9-8dd4-4fc9bebd3014	2	3	t	f	ec1c17b1-001a-462c-b544-ec45d0194eec	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	e001fff3-c6be-4e3b-8833-84d9f756de7d	0feb3ce5-cb67-4123-9b4e-e46a51a6b8da	\N
8ade0c96-fe20-4065-be86-4888fd5a2810	2	3	t	f	d8a4a1c0-4ae9-431f-bf6b-7e8531bb68d2	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N	e001fff3-c6be-4e3b-8833-84d9f756de7d	0feb3ce5-cb67-4123-9b4e-e46a51a6b8da	\N
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "DetectedDefects", "ProductId", "SeamId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId", "IdFromSystem") FROM stdin;
43fecfaf-e167-4c58-93ec-c816fb6c6c4f	1	ИТП	4fc78d2b-23d1-4cc9-8dd4-4fc9bebd3014	\N	\N
d96d7bc3-8ccf-4fcc-a09b-b9d23629a8fa	1	ИТП	8ade0c96-fe20-4065-be86-4888fd5a2810	\N	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
001028fb-7d45-4fc0-9691-7163540eb2da	526870	Технологический процесс	Ссылка	526870
1315bdce-dc20-4b6d-a8df-30f7cf90bd52	1053809	Технологический процесс	Ссылка	1053809
139dc661-89d5-47c8-8522-1880f44d4f35	3232938	Технологический процесс	Ссылка	3232938
1fe0e49d-d7a7-421e-81ce-d01c026065c3	1405307	Технологический процесс	Ссылка	1405307
254f202c-dbaf-4d35-8236-22e5d5a1f8c9	2841119	Технологический процесс	Ссылка	2841119
3329050f-6484-4885-b2d6-f0c145c906d0	1823031	Технологический процесс	Ссылка	1823031
53172fa4-ff2f-4b46-8bf8-c47b0dab3303	3338649	Технологический процесс	Ссылка	3338649
53221e86-fe2b-46c0-a0f5-15e7069a9102	3239598	Технологический процесс	Ссылка	3239598
577cedf3-fc4b-4638-b119-8d4516a8a309	1104641	Технологический процесс	Ссылка	1104641
65a641c4-deee-4361-a67f-0c10918541a3	1426226	Технологический процесс	Ссылка	1426226
6778b35a-a89a-4c47-beaa-f9f5efbbc281	908693	Технологический процесс	Ссылка	908693
68a06ab3-9ef3-4d7b-b0af-b91876ba85de	3211246	Технологический процесс	Ссылка	3211246
6dc2f951-cd39-4b53-be7d-2b1bff913099	1334123	Технологический процесс	Ссылка	1334123
70461af2-a803-47a5-99cb-63db9f99a7a2	3090319	Технологический процесс	Ссылка	3090319
72200315-f300-4f69-9e46-977031e90767	3049271	Технологический процесс	Ссылка	3049271
75732a9a-9350-48ea-97f5-b0340737a2d7	1362989	Технологический процесс	Ссылка	1362989
87a2bc73-52f9-4c75-8901-75daf762c6d7	1124147	Технологический процесс	Ссылка	1124147
8e579e1c-2864-43be-a16c-b1d17d36721b	1405914	Технологический процесс	Ссылка	1405914
a82c289b-faf6-450d-85e1-ce8ed5d01165	2822569	Технологический процесс	Ссылка	2822569
abd82f73-dbc5-4d70-bafc-bd37cc469b9d	1003048	Технологический процесс	Ссылка	1003048
b665af62-feb4-48e8-a471-09e8535ca0b2	3011514	Технологический процесс	Ссылка	3011514
bb03e158-4cb3-4dd9-a925-ecfb96e4b8ba	1119363	Технологический процесс	Ссылка	1119363
bb79afc5-8938-46b5-954e-032b825c46ac	2433634	Технологический процесс	Ссылка	2433634
c50b99fc-f350-4029-ba47-d98a9a345099	3232836	Технологический процесс	Ссылка	3232836
d0f24999-7011-4148-a18e-3d4fea4151a7	1402616	Технологический процесс	Ссылка	1402616
eb4ddcc2-c848-4a56-bac9-e97c0e8746f3	2915477	Технологический процесс	Ссылка	2915477
f9e2148a-988f-4484-a4ef-58bf4853df18	1492964	Технологический процесс	Ссылка	1492964
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
1e50a9d6-09f2-42f2-8754-9b91df3c1565	88473306-fb16-4dc2-9922-e8cd108aa743
646fad25-bcf8-4c50-9752-6ad9ca4b4e76	88473306-fb16-4dc2-9922-e8cd108aa743
bf8ee0a6-fde9-4529-86cf-0f70e4eb1b7d	88473306-fb16-4dc2-9922-e8cd108aa743
1aeb0adf-9497-41cc-b24a-159a008c91e7	7a72c637-524d-4cee-a881-04f09789330a
40f70825-a7e4-4d2d-8629-75b1a22a89aa	7a72c637-524d-4cee-a881-04f09789330a
a6d34751-940a-4efb-b69b-55a6b4b5010b	7a72c637-524d-4cee-a881-04f09789330a
d02b0081-350f-45e9-8db8-6fb70436aff4	7a72c637-524d-4cee-a881-04f09789330a
eb342252-4cc8-4a7d-9180-d6259fae9a0a	7a72c637-524d-4cee-a881-04f09789330a
0026ab9e-eb09-459e-9eb3-858e1143d653	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
228d9e83-dd63-4859-925a-c907733558e4	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
2ccc6d37-8562-4f15-979b-ff2d4af6c703	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
655c0bc9-a639-4533-b608-03bdd08b2d77	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
68ca3e49-8740-4517-874a-0c316f60811a	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
79c16b39-9a59-4d2d-a055-e5e09ec3ec76	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
89c8785d-3c34-469b-b08f-4e38792fa7cc	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
8abe4439-0184-4de1-94dc-8aba68c5c18f	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
8d80740e-61e3-45f5-b61e-3ebce8c92ab7	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
94271bf8-6f76-4fda-a769-ba54c44578e9	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
b7004c1e-3c69-49e4-bcf7-52ece3453f75	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
bb78cccb-fd49-4b07-bb7d-008130c88f79	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
c38221f4-7181-4a03-8bf2-ad43f23caf0b	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
f59e0ec5-c4b8-435d-aba1-f6c0bedef996	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
7bbfda84-f5b8-4c80-a145-22839083125a	dce7713e-4bfd-4f3a-affa-e96bd38bdafc
eb6736e2-bd25-480c-816c-bd4503b45b4a	7a72c637-524d-4cee-a881-04f09789330a
843f5c5f-28a2-4d01-a3aa-9ad6920aac4a	88473306-fb16-4dc2-9922-e8cd108aa743
4ea5ffdb-2870-41d9-8fdc-9b2f59aef4d8	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
fb8c5f81-0e01-4b51-9563-5609f3ce6578	a0358457-b726-4ad1-9b4a-60a215ce281e
9d24c556-ef5c-485b-a45d-13841160066f	e1eab37d-a0e4-4646-8ecb-91cdfcdbda1e
6a1fd0f1-bd2d-4363-bbe6-f7ef0cf5c137	88473306-fb16-4dc2-9922-e8cd108aa743
ed4d99e2-ae00-4ddc-b643-2ef46bc173d3	dce7713e-4bfd-4f3a-affa-e96bd38bdafc
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
1e50a9d6-09f2-42f2-8754-9b91df3c1565	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	5c6b16bf-84ad-4186-8e7c-c0179de02584	\N
646fad25-bcf8-4c50-9752-6ad9ca4b4e76	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	5c6b16bf-84ad-4186-8e7c-c0179de02584	\N
bf8ee0a6-fde9-4529-86cf-0f70e4eb1b7d	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	\N	\N	5c6b16bf-84ad-4186-8e7c-c0179de02584	\N
1aeb0adf-9497-41cc-b24a-159a008c91e7	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	\N
40f70825-a7e4-4d2d-8629-75b1a22a89aa	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	\N
a6d34751-940a-4efb-b69b-55a6b4b5010b	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
d02b0081-350f-45e9-8db8-6fb70436aff4	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
eb342252-4cc8-4a7d-9180-d6259fae9a0a	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
0026ab9e-eb09-459e-9eb3-858e1143d653	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
228d9e83-dd63-4859-925a-c907733558e4	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
2ccc6d37-8562-4f15-979b-ff2d4af6c703	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
655c0bc9-a639-4533-b608-03bdd08b2d77	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
68ca3e49-8740-4517-874a-0c316f60811a	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
79c16b39-9a59-4d2d-a055-e5e09ec3ec76	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
89c8785d-3c34-469b-b08f-4e38792fa7cc	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	\N
8abe4439-0184-4de1-94dc-8aba68c5c18f	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	\N
8d80740e-61e3-45f5-b61e-3ebce8c92ab7	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
94271bf8-6f76-4fda-a769-ba54c44578e9	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
b7004c1e-3c69-49e4-bcf7-52ece3453f75	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
bb78cccb-fd49-4b07-bb7d-008130c88f79	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	\N
c38221f4-7181-4a03-8bf2-ad43f23caf0b	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
f59e0ec5-c4b8-435d-aba1-f6c0bedef996	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
7bbfda84-f5b8-4c80-a145-22839083125a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	5c6b16bf-84ad-4186-8e7c-c0179de02584	\N
eb6736e2-bd25-480c-816c-bd4503b45b4a	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
4ea5ffdb-2870-41d9-8fdc-9b2f59aef4d8	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
843f5c5f-28a2-4d01-a3aa-9ad6920aac4a	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	\N
fb8c5f81-0e01-4b51-9563-5609f3ce6578	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$cV+BsH3JXsHdFmGVAT2g/SIE8ED+5FhVns9Rpej92Z2VV9XW	\N	\N	\N	\N	\N	\N
9d24c556-ef5c-485b-a45d-13841160066f	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$P5kS0AJ2GFrFrhSiryMGVs/kwKdwt/VQl2uOgqdGWMWHWsbG	\N	\N	\N	\N	\N	\N
6a1fd0f1-bd2d-4363-bbe6-f7ef0cf5c137	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$iNmnpAjhCtTYjXyFujCq8ChOnq9WbUVYh29oqypeIRE1t1dG	\N	\N	\N	\N	\N	\N
ed4d99e2-ae00-4ddc-b643-2ef46bc173d3	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$6Cx+0gcEWC9sWWBdWIX6vPurZwDGSZLWHNLEZlun4TulAFHp	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
2af067cf-b48b-47da-9925-8fbadfa54166	1	Корневой	80	120	22	24	50	250	43fecfaf-e167-4c58-93ec-c816fb6c6c4f	\N
72732930-a474-4b01-9efc-ffaf0c1cda38	2	Заполняющий	80	120	21	25	50	250	43fecfaf-e167-4c58-93ec-c816fb6c6c4f	\N
955bebad-0a0c-4ee8-a06a-3c5e8b8ee045	2	Заполняющий	80	120	21	25	50	250	d96d7bc3-8ccf-4fcc-a09b-b9d23629a8fa	\N
a2cae425-4494-416e-975c-ace291c48369	1	Корневой	80	120	\N	\N	50	250	d96d7bc3-8ccf-4fcc-a09b-b9d23629a8fa	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IsDone", "SeamId", "IdFromSystem") FROM stdin;
2db5e504-95fe-41d2-91fd-0431cb8a72b2	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	8ade0c96-fe20-4065-be86-4888fd5a2810	\N
40572120-405a-4e64-a954-2dace0676252	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	8ade0c96-fe20-4065-be86-4888fd5a2810	\N
ba0bf6b2-5bed-4bf8-bd67-75dfbea8d6e6	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	4fc78d2b-23d1-4cc9-8dd4-4fc9bebd3014	\N
c4736273-2d3a-41df-81c9-eb181e38f688	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	4fc78d2b-23d1-4cc9-8dd4-4fc9bebd3014	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
21b63acb-e7dd-458f-b55b-d711b62721d4	4978563a-63a1-4389-a560-49b6edfdc10c
4394c899-ad50-4831-a1e2-4d675825ead4	028a4c52-ab91-4c28-ba4a-88abd3a7e448
506f5496-e90f-4ac2-a109-ef43b5630cdb	028a4c52-ab91-4c28-ba4a-88abd3a7e448
70cea860-c6e4-4187-bf36-29a14d7970d9	76d5d064-3182-432a-9b03-6a7200c963c2
84e3aefc-40b2-4633-b198-5a357f7e025d	028a4c52-ab91-4c28-ba4a-88abd3a7e448
859a4fc0-3492-4f45-bf5c-d7cc9a44440d	bcb54dcb-66df-4d0f-abe0-02ccdd7a715c
910eca23-90e4-4187-8dfc-1d57b3ccc022	76d5d064-3182-432a-9b03-6a7200c963c2
9ce1ce35-5000-4ec8-9011-32b26cae5dce	76d5d064-3182-432a-9b03-6a7200c963c2
a0d346fe-634e-452c-b719-74209695e82e	4978563a-63a1-4389-a560-49b6edfdc10c
a71c9966-a6ee-40e6-95b0-359d6d0bc391	028a4c52-ab91-4c28-ba4a-88abd3a7e448
b453d865-a4e6-4a55-9343-d76a5ce886f7	76d5d064-3182-432a-9b03-6a7200c963c2
bfd55812-26cf-407e-a21c-44e8c6ced603	028a4c52-ab91-4c28-ba4a-88abd3a7e448
c0568afd-9f4d-401e-8696-c22bfd66bbeb	bcb54dcb-66df-4d0f-abe0-02ccdd7a715c
e0fb0666-0d23-4b52-8fd0-a4f6f4c1208e	4978563a-63a1-4389-a560-49b6edfdc10c
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
21b63acb-e7dd-458f-b55b-d711b62721d4	8abe4439-0184-4de1-94dc-8aba68c5c18f	\N	152444
4394c899-ad50-4831-a1e2-4d675825ead4	f59e0ec5-c4b8-435d-aba1-f6c0bedef996	\N	121537
506f5496-e90f-4ac2-a109-ef43b5630cdb	2ccc6d37-8562-4f15-979b-ff2d4af6c703	\N	156298
70cea860-c6e4-4187-bf36-29a14d7970d9	228d9e83-dd63-4859-925a-c907733558e4	\N	151861
84e3aefc-40b2-4633-b198-5a357f7e025d	b7004c1e-3c69-49e4-bcf7-52ece3453f75	\N	152365
859a4fc0-3492-4f45-bf5c-d7cc9a44440d	0026ab9e-eb09-459e-9eb3-858e1143d653	\N	150402
910eca23-90e4-4187-8dfc-1d57b3ccc022	8d80740e-61e3-45f5-b61e-3ebce8c92ab7	\N	153274
9ce1ce35-5000-4ec8-9011-32b26cae5dce	655c0bc9-a639-4533-b608-03bdd08b2d77	\N	155288
a0d346fe-634e-452c-b719-74209695e82e	89c8785d-3c34-469b-b08f-4e38792fa7cc	\N	156278
a71c9966-a6ee-40e6-95b0-359d6d0bc391	68ca3e49-8740-4517-874a-0c316f60811a	\N	147329
b453d865-a4e6-4a55-9343-d76a5ce886f7	c38221f4-7181-4a03-8bf2-ad43f23caf0b	\N	152441
bfd55812-26cf-407e-a21c-44e8c6ced603	79c16b39-9a59-4d2d-a055-e5e09ec3ec76	\N	121538
c0568afd-9f4d-401e-8696-c22bfd66bbeb	94271bf8-6f76-4fda-a769-ba54c44578e9	\N	149921
e0fb0666-0d23-4b52-8fd0-a4f6f4c1208e	bb78cccb-fd49-4b07-bb7d-008130c88f79	\N	152207
e001fff3-c6be-4e3b-8833-84d9f756de7d	4ea5ffdb-2870-41d9-8fdc-9b2f59aef4d8	\N	\N
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "IdFromSystem") FROM stdin;
028a4c52-ab91-4c28-ba4a-88abd3a7e448	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
4978563a-63a1-4389-a560-49b6edfdc10c	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
76d5d064-3182-432a-9b03-6a7200c963c2	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
bcb54dcb-66df-4d0f-abe0-02ccdd7a715c	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
627d9ee5-0980-41bc-8ebe-e26b046683b0	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
d25b9390-57ae-432d-8850-ea53e31ffb82	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
110b98d3-6225-40af-b48a-79180f7ac351	2	2023-02-03 17:54:11.543987	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8ade0c96-fe20-4065-be86-4888fd5a2810	627d9ee5-0980-41bc-8ebe-e26b046683b0	\N
9e8e825e-c4bc-4e52-87f8-08d6bf0936d7	1	2023-02-03 17:54:11.541623	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	4fc78d2b-23d1-4cc9-8dd4-4fc9bebd3014	d25b9390-57ae-432d-8850-ea53e31ffb82	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
60222662-e1c7-4563-abf1-5199b0bbcc17	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	a9af3b6e-b917-4d26-8fb6-9a41c66236f8	\N
62d76afe-2493-4d38-a02b-1922efd41445	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	a9af3b6e-b917-4d26-8fb6-9a41c66236f8	\N
f5b9a0c7-a201-4639-96e4-a0061ca69ec4	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	a9af3b6e-b917-4d26-8fb6-9a41c66236f8	\N
822f73f2-a7d8-4b25-a113-39bc2c59b277	1	12:10:00	13:10:00	13:20:00	13:50:00	ac622970-9ad1-4453-987e-f55fd09ad18e	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
068c7d05-f803-463a-80b6-d14c5f9fdd55	1550	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1550
14174cad-b2c6-4580-b071-6d42f0cd2e8c	2130	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	2130
23e9e822-9e31-43cb-baae-b7778a53ddc1	1400	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1400
3ca7c1eb-699b-41ac-8b6a-58fabec05b20	1360	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1360
45505097-bdf0-4e15-80ae-d957291d3be8	1280	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1280
60d1e891-8ae7-40d6-9872-21d76c09d8dd	2050	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	2050
75b89872-c806-4dcf-8a8d-900202e73da6	1390	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1390
910a8335-8b7a-4188-8db1-918c21a15304	2150	\N	5fef4716-891e-4ec6-9df2-697ac632b7af	2150
98a50bf3-9ba3-43ad-a7f7-3301860e1b01	1260	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1260
d84d0723-6329-4df4-b663-3cd78c453be8	1270	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1270
e1388c1f-1e4f-496e-b858-a8cca4dbb3eb	1380	\N	954426d6-cd6a-47ce-aa38-5d250d12f2bb	1380
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
05691a0c-8ca4-4595-9a19-3d16c04b5d4a	Цех 50	50	050
c8b6b066-35f3-4888-979c-442ccfb49682	Цех 480	480	480
\.


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
-- Name: ProductInsides PK_ProductInsides; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductInsides"
    ADD CONSTRAINT "PK_ProductInsides" PRIMARY KEY ("InsideProductId", "MainProductId");


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
-- Name: StatusReasons PK_StatusReasons; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StatusReasons"
    ADD CONSTRAINT "PK_StatusReasons" PRIMARY KEY ("Id");


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
-- Name: WeldingEquipments PK_WeldingEquipments; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "PK_WeldingEquipments" PRIMARY KEY ("Id");


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

CREATE UNIQUE INDEX "IX_Chiefs_WeldingEquipmentId" ON public."Chiefs" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Days_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Days_CalendarId" ON public."Days" USING btree ("CalendarId");


--
-- Name: IX_Days_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Days_IdFromSystem" ON public."Days" USING btree ("IdFromSystem");


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
-- Name: IX_Masters_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Masters_WeldingEquipmentId" ON public."Masters" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Posts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Posts_IdFromSystem" ON public."Posts" USING btree ("IdFromSystem");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_ProductInsides_InsideProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductInsides_InsideProductId" ON public."ProductInsides" USING btree ("InsideProductId");


--
-- Name: IX_ProductInsides_MainProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductInsides_MainProductId" ON public."ProductInsides" USING btree ("MainProductId");


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
-- Name: IX_Products_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Products_WeldingTaskId" ON public."Products" USING btree ("WeldingTaskId");


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
-- Name: IX_Seams_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_WelderId" ON public."Seams" USING btree ("WelderId");


--
-- Name: IX_Seams_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_WorkplaceId" ON public."Seams" USING btree ("WorkplaceId");


--
-- Name: IX_StatusReasons_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_StatusReasons_IdFromSystem" ON public."StatusReasons" USING btree ("IdFromSystem");


--
-- Name: IX_StatusReasons_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_ProductId" ON public."StatusReasons" USING btree ("ProductId");


--
-- Name: IX_StatusReasons_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_SeamId" ON public."StatusReasons" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstructions_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstructions_IdFromSystem" ON public."TechnologicalInstructions" USING btree ("IdFromSystem");


--
-- Name: IX_TechnologicalInstructions_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstructions_SeamId" ON public."TechnologicalInstructions" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstructions_TechnologicalProcessId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_TechnologicalInstructions_TechnologicalProcessId" ON public."TechnologicalInstructions" USING btree ("TechnologicalProcessId");


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
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


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
-- Name: IX_WeldingEquipments_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_IdFromSystem" ON public."WeldingEquipments" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingTasks_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_IdFromSystem" ON public."WeldingTasks" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


--
-- Name: IX_WeldingTasks_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_WeldingEquipmentId" ON public."WeldingTasks" USING btree ("WeldingEquipmentId");


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
-- Name: Days FK_Days_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Days"
    ADD CONSTRAINT "FK_Days_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id") ON DELETE CASCADE;


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
-- Name: Masters FK_Masters_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Masters"
    ADD CONSTRAINT "FK_Masters_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


--
-- Name: Posts FK_Posts_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "FK_Posts_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_Products_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id");


--
-- Name: Products FK_Products_TechnologicalProcesses_TechnologicalProcessId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_TechnologicalProcesses_TechnologicalProcessId" FOREIGN KEY ("TechnologicalProcessId") REFERENCES public."TechnologicalProcesses"("Id");


--
-- Name: Products FK_Products_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id");


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
-- Name: Seams FK_Seams_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: Seams FK_Seams_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: StatusReasons FK_StatusReasons_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StatusReasons"
    ADD CONSTRAINT "FK_StatusReasons_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id");


--
-- Name: StatusReasons FK_StatusReasons_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StatusReasons"
    ADD CONSTRAINT "FK_StatusReasons_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id");


--
-- Name: TechnologicalInstructions FK_TechnologicalInstructions_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstructions"
    ADD CONSTRAINT "FK_TechnologicalInstructions_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: TechnologicalInstructions FK_TechnologicalInstructions_TechnologicalProcesses_Technologi~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstructions"
    ADD CONSTRAINT "FK_TechnologicalInstructions_TechnologicalProcesses_Technologi~" FOREIGN KEY ("TechnologicalProcessId") REFERENCES public."TechnologicalProcesses"("Id");


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
-- Name: WeldPassages FK_WeldPassages_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


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

