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
    "Reason" text NOT NULL,
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
-- Name: WeldPassageResult; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldPassageResult" (
    "Id" uuid NOT NULL,
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "IdFromSystem" text
);


--
-- Name: WeldPassages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldPassages" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
    "IsDone" boolean NOT NULL,
    "SeamId" uuid NOT NULL,
    "WeldPassageResultId" uuid,
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
c37735d2-f464-4bd4-8b9b-29781a2878bf	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
e720bca4-216c-46ba-a9b8-ce48712d8087	0b700e41-e7e1-4e60-8d69-093b32afe06c	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
66f1bd0e-33d9-416e-b255-b19371e6ce72	1	10	t	c37735d2-f464-4bd4-8b9b-29781a2878bf	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
17d49acc-c3be-4bfe-bf3c-416bd9a364ba	Работа по карте несоответствий	\N
1de33a0f-a1e3-4139-a626-624a74cabaaf	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
213018b3-0752-4d25-8ee9-14d7871c6143	Сборочные операции	\N
2f5e3254-10a5-4f6a-aade-a309d2d11f82	Отсутствие заданий	\N
4f4739e6-7e72-483f-a46f-2ce63b42b0e4	Неявка оператора (б/лист, отпуск, и пр.)	\N
532f9903-9d5b-4766-acd4-1c04504ebd96	Установка, выверка, снятие детали	\N
57f50d50-00ff-4d13-9fbb-09f8aed28571	Плановый ремонт централизованными службами	\N
59ef52cc-0a05-469c-a22c-fbb035adabad	Естественные надобности	\N
6676ab38-f9b5-4de8-a116-da9c0cf388e2	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
67029c46-a158-4973-8edc-412848c08e6c	Отсутствие сотрудника ОТК	\N
6ffe1c0f-e8fd-4710-99fa-58cefc8c274a	Контроль на рабочем месте	\N
7e13998f-78a2-4b97-9817-6ba0350332e1	Изменение режимов, смена инструмента, приспособления	\N
7eb0ccc5-a544-4244-9b9c-e5048966fce1	Работа с управляющей программой	\N
abaceff7-66c6-49f5-87b3-1c864234c80b	Нерабочее время по графику согласно сменности	\N
bd9a3c85-1fce-45c5-8871-9cf2e0829a09	Ознакомление с работой, документацией, инструктаж	\N
ca59d4e0-d1ce-446a-a835-f8414df5f9a8	Отсутствие оператора в связи с необеспеченностью	\N
cc63c19b-130c-404e-8ded-69cc5a7dadf7	Отсутствие конструктора, технолога или ожидание его решения	\N
cd700363-f865-41c2-bd7a-0f08507a8036	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
da2d980e-9be8-4764-ba22-9ee483107cca	Установка, выверка, снятие детали	\N
de2755a2-dfbf-4576-8598-fe730ca2f240	Праздники и выходные	\N
e12f4af1-64b6-482c-a1ce-e12339053bc6	Отсутствие материала, заготовок, деталей	\N
e5f77f4f-45ad-4455-ba73-4d4a763ac6b4	Отсутствие энергоносителей	\N
f0d47918-42a8-4868-ae36-28ddf51e12e3	Обед	\N
fe85bd7c-0f64-4c55-8858-225aa7aac92e	Аварийный ремонт централизованными службами	\N
febefa44-4468-4f6c-8660-2e582bf3b75b	Отсутствие крана, транспорта	\N
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
9f49eebb-9b95-4ee8-bb4b-63a3e1d49d3d	384a19c6-87b3-4a4a-a321-50748db2a013	256467
ae90fb11-52be-4f7e-bd92-91a731848d01	3fc9b223-1879-4ec4-886a-e05559acddfc	235565
fbfe137b-14b5-4373-bd23-b6beadb3d6ef	863d753e-b78a-4970-bba9-8e3dcdd79de0	251534
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
624f6f2f-e759-417f-ac1e-938781c23701	5595d650-7c93-4494-bb8f-0faadb84ef19	\N	617215
9388afa2-84ce-4b14-a9e0-b70af2673162	284b04dd-7b80-4937-a1cb-a98979dfcc9f	\N	613668
e4437d5b-6af4-49f2-95ef-41d76b1c6e7a	4069596d-55ab-4829-8f7a-0974384d6507	\N	612000
f7bc157b-b0d4-4fab-846c-7a248cbb7f34	b01d81ec-58a8-4563-9ab0-7a20a1a38d87	\N	614208
f83667c7-aa39-49df-b47d-e0291d15ed20	3b4bc365-215d-468d-b3cc-aa7f5fc3568a	\N	643759
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
158bf782-cd3f-41d8-bc3b-7d680a0b47b8	1	Пост 1	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N
bd8c6f25-8d78-4c2a-a62f-84d6b8753ddc	2	Пост 2	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b6fb2161-f9c2-42d8-9041-afaf5c41552d	07d398e7-d8a6-4aca-b7fe-a35d9374e940
34f91140-ca34-475c-8ca9-351fd85e0dee	09c2fc84-8443-44e6-bce5-fbefc63b3f01
84d7b4bc-4d46-4177-9201-b23c961c59fa	0bc0e226-49e1-4de4-a6e7-084083dc012a
d5685516-eea1-4bf2-9eca-a84420591e56	26f7c3f7-cf7b-498e-aad0-0fb5a6307eaa
34f91140-ca34-475c-8ca9-351fd85e0dee	28cbdc43-2794-4ac0-b17e-04cfba4c79ef
28cbdc43-2794-4ac0-b17e-04cfba4c79ef	34fbf525-af94-4b65-a965-511d522e6b19
34f91140-ca34-475c-8ca9-351fd85e0dee	3be6b215-4938-4d19-b5f3-68e869e19955
d5685516-eea1-4bf2-9eca-a84420591e56	3d9e54dc-db47-423d-bab5-927f0ddc4610
e138e9ba-b43e-40a5-9919-6d29cbfeefdc	3fcb236e-d191-4440-a023-147b9782ae0c
3d9e54dc-db47-423d-bab5-927f0ddc4610	50f3549a-9554-41f0-b5b2-e2aa36634e70
07d398e7-d8a6-4aca-b7fe-a35d9374e940	680d9c06-c76d-4bae-a3c2-92864142bdde
b6fb2161-f9c2-42d8-9041-afaf5c41552d	82425729-2f50-4422-b609-dea8c79dc72f
d5685516-eea1-4bf2-9eca-a84420591e56	84d7b4bc-4d46-4177-9201-b23c961c59fa
3be6b215-4938-4d19-b5f3-68e869e19955	86b7d0ee-40e1-4916-8e41-ec00333c0b76
d5685516-eea1-4bf2-9eca-a84420591e56	89614397-7994-4a50-87b6-2d80064baaac
84d7b4bc-4d46-4177-9201-b23c961c59fa	a7c823b3-2891-4957-92fb-33e9db422d94
34f91140-ca34-475c-8ca9-351fd85e0dee	ae6f4334-e82f-4d1f-b97e-7b3402fdbbe8
28cbdc43-2794-4ac0-b17e-04cfba4c79ef	b2162db8-0dac-4023-8242-e91175e33b0e
b6fb2161-f9c2-42d8-9041-afaf5c41552d	b2e7045c-d02e-4f31-b000-413f41d0ad2a
3d9e54dc-db47-423d-bab5-927f0ddc4610	b6a051b4-cf3b-4248-9a21-18668a2d9140
07d398e7-d8a6-4aca-b7fe-a35d9374e940	c91f6565-fc3d-488d-b431-91e67cec7e4d
3be6b215-4938-4d19-b5f3-68e869e19955	d8b5e6ae-8d75-4c51-80c6-674316c0d34f
e138e9ba-b43e-40a5-9919-6d29cbfeefdc	df1f2730-cd8f-4ad3-8b2e-cbedf0530203
b6fb2161-f9c2-42d8-9041-afaf5c41552d	e138e9ba-b43e-40a5-9919-6d29cbfeefdc
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
36552b54-fc5d-4b01-be82-f922f3c6e7ae	Производственный участок 5	5	0b1f2357-92ba-4afe-ba47-712118ae5676	05
7dd21ea4-6a53-4d06-8825-ec322fb4ab50	Сборка, сварка узл. и рам к/с г/п 120-220т	4	f71e8839-e5b3-4f8f-889a-c7bc7fd4e030	04
fb33ca0a-514f-4b91-9ea6-f3593fd67caa	Сборка, сварка мостов	1	f71e8839-e5b3-4f8f-889a-c7bc7fd4e030	01
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "WeldingTaskId", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
07d398e7-d8a6-4aca-b7fe-a35d9374e940	Картер заднего моста	75132-2401008-50	1	f	f	2	\N	01a7556a-00b4-421a-8b13-4992dd28eed4	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536467565
09c2fc84-8443-44e6-bce5-fbefc63b3f01	Панель	75580-2105522	1	f	f	3	\N	4a419061-16ef-4156-addc-81e075bd3d62	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536384399
0bc0e226-49e1-4de4-a6e7-084083dc012a	Кронштейн	75310-1183106	1	f	f	3	\N	1b7d4fcf-8514-4495-b88a-db947faec8f8	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536267485
26f7c3f7-cf7b-498e-aad0-0fb5a6307eaa	Накладка	549Б-1015842	1	f	f	3	\N	406979d4-5deb-49c8-97a0-2265bab9dfc0	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536196288
28cbdc43-2794-4ac0-b17e-04cfba4c79ef	Картер заднего моста	75580-2401008	1	f	f	1	\N	7d70219f-c172-4c06-8a72-faed3fa9d8ea	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536384295
34f91140-ca34-475c-8ca9-351fd85e0dee	Картер заднего моста	75580-2401006	1	f	f	1	\N	9dfc981a-9bf1-44e7-b218-b823d6d4e04b	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536384294
34fbf525-af94-4b65-a965-511d522e6b19	Кольцо	75580-2401227	1	f	f	3	\N	c8bf9b04-8c27-440d-93c4-c0abed0a0011	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536384312
3be6b215-4938-4d19-b5f3-68e869e19955	Труба картера заднего моста	75580-2401010-01	1	f	f	2	\N	b30b4dc1-e759-4fea-b0e1-9b704e92b2d2	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536386240
3d9e54dc-db47-423d-bab5-927f0ddc4610	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	\N	3b729018-31b4-435f-84d2-f2c39c401dba	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536248707
3fcb236e-d191-4440-a023-147b9782ae0c	Проушина	7521-2401224	1	f	f	3	\N	3f6c2adb-990e-4fd6-93f1-46be14e316ea	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536274170
50f3549a-9554-41f0-b5b2-e2aa36634e70	Кронштейн	75304-1001253	1	f	f	3	\N	95f3ed9e-2883-4960-8531-20d4947a21b7	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536248708
680d9c06-c76d-4bae-a3c2-92864142bdde	Опора	75211-2401122	1	f	f	3	\N	8c79aeb3-1465-4824-ae86-e5e581231645	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536276803
82425729-2f50-4422-b609-dea8c79dc72f	Панель	75132-2105522	1	f	f	3	\N	b93d1889-c02e-486a-924f-27735f5961f2	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536417730
84d7b4bc-4d46-4177-9201-b23c961c59fa	Кронштейн	75310-1183100	1	f	f	1	\N	aba4b561-2cfe-4313-b6b6-d4d2de35c185	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536267493
86b7d0ee-40e1-4916-8e41-ec00333c0b76	Труба картера	75580-2401132-10	1	f	f	3	\N	442f3530-e218-49db-a072-c66b6dd98f9f	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536386250
89614397-7994-4a50-87b6-2d80064baaac	Кронштейн	75211-1018162	1	f	f	3	\N	3f3c0e5e-27ba-48f6-9b0a-11d91c53fd05	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536270344
a7c823b3-2891-4957-92fb-33e9db422d94	Кронштейн	75310-1183102	1	f	f	3	\N	c5ad8c1d-1ec6-4a31-848b-0c9ef5d4f608	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536267484
ae6f4334-e82f-4d1f-b97e-7b3402fdbbe8	Кронштейн	75580-2113192	1	f	f	3	\N	33994b1d-bfae-437a-93f5-3b4f290229a3	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536384314
b2162db8-0dac-4023-8242-e91175e33b0e	Втулка	75303-2128438	1	f	f	3	\N	668b2f8b-43a8-472e-872b-4111fcca7950	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536248270
b2e7045c-d02e-4f31-b000-413f41d0ad2a	Кронштейн	75131-2113296-10	1	f	f	3	\N	40f505da-67f2-4190-93de-8ef1516b626a	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536461620
b6a051b4-cf3b-4248-9a21-18668a2d9140	Кронштейн	75303-1001293	1	f	f	3	\N	251c1c06-dd89-438c-9ee2-c9bb8eadaa33	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536247228
b6fb2161-f9c2-42d8-9041-afaf5c41552d	Картер заднего моста	75132-2401006-50	1	f	f	1	\N	61af313a-de03-4229-b6fc-274ac28bbc6d	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536467567
c91f6565-fc3d-488d-b431-91e67cec7e4d	Пластина	75132-2401106	1	f	f	3	\N	c791fac3-7271-40d9-8c68-9fbc8e67d1d5	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536444153
d5685516-eea1-4bf2-9eca-a84420591e56	Рама	75313-2800010-20	1	f	f	1	\N	b71f0ef1-9e02-4a11-a3e7-dc172a8e9bfc	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N	\N	\N	4536287819
d8b5e6ae-8d75-4c51-80c6-674316c0d34f	Фланец картера	75580-2401114-11	1	f	f	3	\N	c242f696-722e-4658-81c4-7ccc801ae979	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536386265
df1f2730-cd8f-4ad3-8b2e-cbedf0530203	Распорка	7521-3932688	1	f	f	3	\N	6b57da66-1c42-4e6e-91f8-80ec35868994	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536273606
e138e9ba-b43e-40a5-9919-6d29cbfeefdc	Кронштейн	7521-2401220	1	f	f	2	\N	4af57bc7-d7e6-4c74-8334-4e3fd99aa487	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N	\N	\N	4536273956
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
bf4711d4-209c-4df9-b2fd-74c58529b56f	Admin	\N
95264e64-a78b-4e33-b0f2-6000d3a8fa4d	Master	\N
944fe04f-632c-495d-bc3b-2605af6fd367	Executor	\N
6911147e-d047-4ce8-a4d4-5192e6842483	TechUser	\N
6f9cbe69-0fe3-4b61-8fd7-c9e7ccae2ada	Chief	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductId", "ProductionAreaId", "WorkplaceId", "WelderId", "InspectorId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "ProductId", "SeamId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
01a7556a-00b4-421a-8b13-4992dd28eed4	3232836	Технологический процесс	Ссылка	3232836
1b7d4fcf-8514-4495-b88a-db947faec8f8	1119363	Технологический процесс	Ссылка	1119363
251c1c06-dd89-438c-9ee2-c9bb8eadaa33	3049271	Технологический процесс	Ссылка	3049271
33994b1d-bfae-437a-93f5-3b4f290229a3	1405914	Технологический процесс	Ссылка	1405914
3b729018-31b4-435f-84d2-f2c39c401dba	1334123	Технологический процесс	Ссылка	1334123
3f3c0e5e-27ba-48f6-9b0a-11d91c53fd05	2841119	Технологический процесс	Ссылка	2841119
3f6c2adb-990e-4fd6-93f1-46be14e316ea	1124147	Технологический процесс	Ссылка	1124147
406979d4-5deb-49c8-97a0-2265bab9dfc0	1426226	Технологический процесс	Ссылка	1426226
40f505da-67f2-4190-93de-8ef1516b626a	526870	Технологический процесс	Ссылка	526870
442f3530-e218-49db-a072-c66b6dd98f9f	2822569	Технологический процесс	Ссылка	2822569
4a419061-16ef-4156-addc-81e075bd3d62	1405307	Технологический процесс	Ссылка	1405307
4af57bc7-d7e6-4c74-8334-4e3fd99aa487	1362989	Технологический процесс	Ссылка	1362989
61af313a-de03-4229-b6fc-274ac28bbc6d	3090319	Технологический процесс	Ссылка	3090319
668b2f8b-43a8-472e-872b-4111fcca7950	3011514	Технологический процесс	Ссылка	3011514
6b57da66-1c42-4e6e-91f8-80ec35868994	908693	Технологический процесс	Ссылка	908693
7d70219f-c172-4c06-8a72-faed3fa9d8ea	3232938	Технологический процесс	Ссылка	3232938
8c79aeb3-1465-4824-ae86-e5e581231645	3211246	Технологический процесс	Ссылка	3211246
95f3ed9e-2883-4960-8531-20d4947a21b7	1492964	Технологический процесс	Ссылка	1492964
9dfc981a-9bf1-44e7-b218-b823d6d4e04b	2433634	Технологический процесс	Ссылка	2433634
aba4b561-2cfe-4313-b6b6-d4d2de35c185	1823031	Технологический процесс	Ссылка	1823031
b30b4dc1-e759-4fea-b0e1-9b704e92b2d2	2915477	Технологический процесс	Ссылка	2915477
b71f0ef1-9e02-4a11-a3e7-dc172a8e9bfc	3239598	Технологический процесс	Ссылка	3239598
b93d1889-c02e-486a-924f-27735f5961f2	1053809	Технологический процесс	Ссылка	1053809
c242f696-722e-4658-81c4-7ccc801ae979	3338649	Технологический процесс	Ссылка	3338649
c5ad8c1d-1ec6-4a31-848b-0c9ef5d4f608	1104641	Технологический процесс	Ссылка	1104641
c791fac3-7271-40d9-8c68-9fbc8e67d1d5	1003048	Технологический процесс	Ссылка	1003048
c8bf9b04-8c27-440d-93c4-c0abed0a0011	1402616	Технологический процесс	Ссылка	1402616
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
384a19c6-87b3-4a4a-a321-50748db2a013	6911147e-d047-4ce8-a4d4-5192e6842483
3fc9b223-1879-4ec4-886a-e05559acddfc	6911147e-d047-4ce8-a4d4-5192e6842483
863d753e-b78a-4970-bba9-8e3dcdd79de0	6911147e-d047-4ce8-a4d4-5192e6842483
284b04dd-7b80-4937-a1cb-a98979dfcc9f	95264e64-a78b-4e33-b0f2-6000d3a8fa4d
3b4bc365-215d-468d-b3cc-aa7f5fc3568a	95264e64-a78b-4e33-b0f2-6000d3a8fa4d
4069596d-55ab-4829-8f7a-0974384d6507	95264e64-a78b-4e33-b0f2-6000d3a8fa4d
5595d650-7c93-4494-bb8f-0faadb84ef19	95264e64-a78b-4e33-b0f2-6000d3a8fa4d
b01d81ec-58a8-4563-9ab0-7a20a1a38d87	95264e64-a78b-4e33-b0f2-6000d3a8fa4d
0d81bb11-4ad8-4d59-aa85-89c6cecf94ad	944fe04f-632c-495d-bc3b-2605af6fd367
0f214cc0-00cd-4b61-b8eb-87015f7c70c3	944fe04f-632c-495d-bc3b-2605af6fd367
0f4f73fd-6419-4ea5-af17-c2e45106b1a9	944fe04f-632c-495d-bc3b-2605af6fd367
22ef7668-8373-4e6d-928b-ec21ea17e6bf	944fe04f-632c-495d-bc3b-2605af6fd367
25d96b09-a43b-46c2-8c32-4c501b4ddadd	944fe04f-632c-495d-bc3b-2605af6fd367
49d208e5-5872-48b9-a7a3-cf2dd885de3c	944fe04f-632c-495d-bc3b-2605af6fd367
4fedd9c9-215a-43aa-870b-474d913a62ab	944fe04f-632c-495d-bc3b-2605af6fd367
73c369e8-033b-47f1-acff-db116753869d	944fe04f-632c-495d-bc3b-2605af6fd367
7dfe097e-764b-46f7-8155-207fecf6c3cb	944fe04f-632c-495d-bc3b-2605af6fd367
8112c62e-f42b-4f90-9cb0-e16094488b30	944fe04f-632c-495d-bc3b-2605af6fd367
a92220bd-df99-4484-9868-d79f4b40a1da	944fe04f-632c-495d-bc3b-2605af6fd367
add80805-0f52-4676-adc7-2efe1fbaeced	944fe04f-632c-495d-bc3b-2605af6fd367
e7b07f14-b2ab-4cca-810e-d538776003fc	944fe04f-632c-495d-bc3b-2605af6fd367
ef41c3e8-69a7-4faf-a8ae-0b3cc84a75a6	944fe04f-632c-495d-bc3b-2605af6fd367
0b700e41-e7e1-4e60-8d69-093b32afe06c	6f9cbe69-0fe3-4b61-8fd7-c9e7ccae2ada
3b29fb8c-6bd6-4382-9fd9-703f85d87e7a	bf4711d4-209c-4df9-b2fd-74c58529b56f
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
384a19c6-87b3-4a4a-a321-50748db2a013	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	36552b54-fc5d-4b01-be82-f922f3c6e7ae	\N
3fc9b223-1879-4ec4-886a-e05559acddfc	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	\N	\N	36552b54-fc5d-4b01-be82-f922f3c6e7ae	\N
863d753e-b78a-4970-bba9-8e3dcdd79de0	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	36552b54-fc5d-4b01-be82-f922f3c6e7ae	\N
284b04dd-7b80-4937-a1cb-a98979dfcc9f	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
3b4bc365-215d-468d-b3cc-aa7f5fc3568a	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
4069596d-55ab-4829-8f7a-0974384d6507	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
5595d650-7c93-4494-bb8f-0faadb84ef19	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N
b01d81ec-58a8-4563-9ab0-7a20a1a38d87	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N
0d81bb11-4ad8-4d59-aa85-89c6cecf94ad	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
0f214cc0-00cd-4b61-b8eb-87015f7c70c3	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
0f4f73fd-6419-4ea5-af17-c2e45106b1a9	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
22ef7668-8373-4e6d-928b-ec21ea17e6bf	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N
25d96b09-a43b-46c2-8c32-4c501b4ddadd	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
49d208e5-5872-48b9-a7a3-cf2dd885de3c	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
4fedd9c9-215a-43aa-870b-474d913a62ab	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
73c369e8-033b-47f1-acff-db116753869d	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
7dfe097e-764b-46f7-8155-207fecf6c3cb	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
8112c62e-f42b-4f90-9cb0-e16094488b30	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N
a92220bd-df99-4484-9868-d79f4b40a1da	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
add80805-0f52-4676-adc7-2efe1fbaeced	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	\N
e7b07f14-b2ab-4cca-810e-d538776003fc	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
ef41c3e8-69a7-4faf-a8ae-0b3cc84a75a6	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	\N
0b700e41-e7e1-4e60-8d69-093b32afe06c	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	36552b54-fc5d-4b01-be82-f922f3c6e7ae	\N
3b29fb8c-6bd6-4382-9fd9-703f85d87e7a	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$akmLN9B4GeMgH4UxqoqC6kc3DNNReoD0h4Lh13ckcpQripuw	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageResult; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageResult" ("Id", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "IsDone", "SeamId", "WeldPassageResultId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
052544a7-2dca-4f9d-aeae-e6595061a7de	541b9b9d-8367-4c29-9a25-c9f44df94d56
06afe499-bcbe-4c7c-aba7-641d6ee6d626	c4109d82-d80c-4b81-8893-77329477f535
3ba4a39d-4937-4da5-b479-ec13565fec06	8891c640-53ef-4985-864c-62f1b89e9cfe
4fb0ac05-afd9-47c8-ad6b-3d7fc7b7e3f7	6cc76d71-aaee-4d77-b71f-a066e6c3542a
60643592-9e8f-4170-b7d0-1a731f6cde20	8891c640-53ef-4985-864c-62f1b89e9cfe
779d2f16-3cb3-41b9-88a3-8e1dc94aef2c	c4109d82-d80c-4b81-8893-77329477f535
8a56b19c-a438-44e2-8e28-a433eaef88d8	541b9b9d-8367-4c29-9a25-c9f44df94d56
91635c5b-2ffd-42e2-97aa-582ac49255de	541b9b9d-8367-4c29-9a25-c9f44df94d56
9cbf58d9-2f1d-4591-8351-ca8f4727c045	8891c640-53ef-4985-864c-62f1b89e9cfe
9f18cdde-fd0f-4c6a-b5c6-aee8c1aae051	c4109d82-d80c-4b81-8893-77329477f535
b8cbc05c-7665-4bf0-985f-a86ae7385260	8891c640-53ef-4985-864c-62f1b89e9cfe
c8faa0a6-e25e-4d64-a3bc-101e60fb3f63	8891c640-53ef-4985-864c-62f1b89e9cfe
ec17e1a6-10b8-4c26-b212-66c253dc36ce	c4109d82-d80c-4b81-8893-77329477f535
f633eddc-d3ec-4495-a77e-7ebf2bba7c6f	6cc76d71-aaee-4d77-b71f-a066e6c3542a
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
052544a7-2dca-4f9d-aeae-e6595061a7de	8112c62e-f42b-4f90-9cb0-e16094488b30	\N	152207
06afe499-bcbe-4c7c-aba7-641d6ee6d626	25d96b09-a43b-46c2-8c32-4c501b4ddadd	\N	152441
3ba4a39d-4937-4da5-b479-ec13565fec06	a92220bd-df99-4484-9868-d79f4b40a1da	\N	121537
4fb0ac05-afd9-47c8-ad6b-3d7fc7b7e3f7	ef41c3e8-69a7-4faf-a8ae-0b3cc84a75a6	\N	149921
60643592-9e8f-4170-b7d0-1a731f6cde20	0f214cc0-00cd-4b61-b8eb-87015f7c70c3	\N	152365
779d2f16-3cb3-41b9-88a3-8e1dc94aef2c	7dfe097e-764b-46f7-8155-207fecf6c3cb	\N	155288
8a56b19c-a438-44e2-8e28-a433eaef88d8	22ef7668-8373-4e6d-928b-ec21ea17e6bf	\N	156278
91635c5b-2ffd-42e2-97aa-582ac49255de	add80805-0f52-4676-adc7-2efe1fbaeced	\N	152444
9cbf58d9-2f1d-4591-8351-ca8f4727c045	49d208e5-5872-48b9-a7a3-cf2dd885de3c	\N	156298
9f18cdde-fd0f-4c6a-b5c6-aee8c1aae051	0d81bb11-4ad8-4d59-aa85-89c6cecf94ad	\N	151861
b8cbc05c-7665-4bf0-985f-a86ae7385260	4fedd9c9-215a-43aa-870b-474d913a62ab	\N	147329
c8faa0a6-e25e-4d64-a3bc-101e60fb3f63	73c369e8-033b-47f1-acff-db116753869d	\N	121538
ec17e1a6-10b8-4c26-b212-66c253dc36ce	0f4f73fd-6419-4ea5-af17-c2e45106b1a9	\N	153274
f633eddc-d3ec-4495-a77e-7ebf2bba7c6f	e7b07f14-b2ab-4cca-810e-d538776003fc	\N	150402
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
541b9b9d-8367-4c29-9a25-c9f44df94d56	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
6cc76d71-aaee-4d77-b71f-a066e6c3542a	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
8891c640-53ef-4985-864c-62f1b89e9cfe	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
c4109d82-d80c-4b81-8893-77329477f535	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
0825dd14-107b-4e50-a542-f7becefb7956	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	c37735d2-f464-4bd4-8b9b-29781a2878bf	\N
0f8741d1-62a0-4468-b61f-8a5ea1aa1d67	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	c37735d2-f464-4bd4-8b9b-29781a2878bf	\N
2b4048dc-929f-4dbb-9791-32e50a06a4a4	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	c37735d2-f464-4bd4-8b9b-29781a2878bf	\N
57ef7e5b-9459-40dd-b42d-8844b487edcf	1	12:10:00	13:10:00	13:20:00	13:50:00	66f1bd0e-33d9-416e-b255-b19371e6ce72	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
32efb421-d865-4fb8-8fa9-ff4f2d5a7d13	1550	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1550
642fd0be-c9d7-4048-b0dd-17d63a9847b7	1260	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1260
adb962b4-3be3-40f6-827f-59187d032b3b	1280	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1280
b6a76890-c472-4457-a55a-11803e4701a5	1380	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1380
c9860537-c144-46ec-a455-8449657ae87a	1360	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1360
d4658e14-f15a-4990-bd31-6176e8d182ba	2130	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	2130
e6ee647e-6652-4496-9ec9-cab1e30de9a0	1270	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1270
ee067b5f-48c7-4c58-86cb-1bf5611dc50d	2050	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	2050
f5180082-c37a-4810-83ef-5595274da295	1400	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1400
f696224c-0551-445c-b3db-6f624a071271	1390	\N	7dd21ea4-6a53-4d06-8825-ec322fb4ab50	1390
fe273e3d-af5b-470a-9d64-6546853886ca	2150	\N	fb33ca0a-514f-4b91-9ea6-f3593fd67caa	2150
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
0b1f2357-92ba-4afe-ba47-712118ae5676	Цех 480	480	480
f71e8839-e5b3-4f8f-889a-c7bc7fd4e030	Цех 50	50	050
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
-- Name: WeldPassageResult PK_WeldPassageResult; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassageResult"
    ADD CONSTRAINT "PK_WeldPassageResult" PRIMARY KEY ("Id");


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
-- Name: IX_WeldPassageResult_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassageResult_IdFromSystem" ON public."WeldPassageResult" USING btree ("IdFromSystem");


--
-- Name: IX_WeldPassages_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassages_IdFromSystem" ON public."WeldPassages" USING btree ("IdFromSystem");


--
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


--
-- Name: IX_WeldPassages_WeldPassageResultId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_WeldPassageResultId" ON public."WeldPassages" USING btree ("WeldPassageResultId");


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
-- Name: WeldPassages FK_WeldPassages_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: WeldPassages FK_WeldPassages_WeldPassageResult_WeldPassageResultId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_WeldPassageResult_WeldPassageResultId" FOREIGN KEY ("WeldPassageResultId") REFERENCES public."WeldPassageResult"("Id");


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

