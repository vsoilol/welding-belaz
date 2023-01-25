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
    "WeldingEquipmentId" uuid
);


--
-- Name: Chiefs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Chiefs" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WeldingEquipmentId" uuid
);


--
-- Name: Days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Days" (
    "Id" uuid NOT NULL,
    "MonthNumber" integer NOT NULL,
    "Number" integer NOT NULL,
    "IsWorkingDay" boolean NOT NULL,
    "CalendarId" uuid NOT NULL
);


--
-- Name: DowntimeReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DowntimeReasons" (
    "Id" uuid NOT NULL,
    "Reason" text NOT NULL
);


--
-- Name: EventLogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."EventLogs" (
    "Id" uuid NOT NULL,
    "Information" character varying(200) NOT NULL,
    "DateTime" timestamp without time zone NOT NULL,
    "UserId" uuid
);


--
-- Name: Inspectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Inspectors" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL
);


--
-- Name: LayerInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."LayerInstructions" (
    "Id" uuid NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
    "WeldPassageId" uuid
);


--
-- Name: Masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Masters" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WeldingEquipmentId" uuid
);


--
-- Name: Posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Posts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "ProductionAreaId" uuid NOT NULL
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
    "WorkshopId" uuid NOT NULL
);


--
-- Name: Products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Products" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Number" integer NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "ProductType" integer NOT NULL,
    "WeldingTaskId" uuid,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "MasterId" uuid,
    "InspectorId" uuid
);


--
-- Name: Roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Roles" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL
);


--
-- Name: Seams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seams" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "Status" integer NOT NULL,
    "ProductId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "WelderId" uuid,
    "InspectorId" uuid
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
    "SeamId" uuid
);


--
-- Name: TechnologicalInstruction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalInstruction" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "SeamId" uuid NOT NULL,
    "TechnologicalProcessId" uuid
);


--
-- Name: TechnologicalProcesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalProcesses" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "PdmSystemFileLink" text NOT NULL
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
    "ProductionAreaId" uuid
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
    "SeamId" uuid NOT NULL,
    "TechnologicalInstructionId" uuid NOT NULL
);


--
-- Name: Welders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Welders" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WorkplaceId" uuid
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
    "DowntimeReasonId" uuid
);


--
-- Name: WeldingEquipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipments" (
    "Id" uuid NOT NULL,
    "RfidTag" text NOT NULL,
    "Name" text NOT NULL,
    "Marking" text NOT NULL,
    "FactoryNumber" text NOT NULL,
    "CommissioningDate" timestamp without time zone NOT NULL,
    "CurrentCondition" integer NOT NULL,
    "Height" integer NOT NULL,
    "Width" integer NOT NULL,
    "Lenght" integer NOT NULL,
    "GroupNumber" integer NOT NULL,
    "ManufacturerName" text NOT NULL,
    "NextAttestationDate" timestamp without time zone NOT NULL,
    "WeldingProcess" text NOT NULL,
    "IdleVoltage" double precision NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision NOT NULL,
    "ArcVoltageMax" double precision NOT NULL,
    "PostId" uuid,
    "WelderId" uuid
);


--
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "WeldingDate" timestamp without time zone NOT NULL,
    "WeldingStartTime" timestamp without time zone,
    "WeldingEndTime" timestamp without time zone,
    "AmbientTemperature" integer NOT NULL,
    "AirHumidity" integer NOT NULL,
    "InterlayerTemperature" integer NOT NULL,
    "CurrentLayerNumber" integer NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "DefectReasons" text,
    "DefectsDetected" text,
    "WeldingCurrentValues" double precision[],
    "ArcVoltageValues" double precision[],
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "BasicMaterial" text NOT NULL,
    "MainMaterialBatchNumber" text NOT NULL,
    "WeldingMaterial" text NOT NULL,
    "WeldingMaterialBatchNumber" text NOT NULL,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL
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
    "CalendarId" uuid
);


--
-- Name: Workplaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workplaces" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "PostId" uuid,
    "ProductionAreaId" uuid
);


--
-- Name: Workshops; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Workshops" (
    "Id" uuid NOT NULL,
    "Name" text NOT NULL,
    "Number" integer NOT NULL
);


--
-- Data for Name: Calendars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Calendars" ("Id", "Year", "IsMain", "WelderId", "WeldingEquipmentId") FROM stdin;
7481ceb6-5498-4036-a975-cfd72a39fa4e	2023	t	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId") FROM stdin;
8c981dde-0b14-4bf1-a83b-b3510430b568	21e9acdd-f006-49b4-b169-8eb3157b968a	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId") FROM stdin;
6090e9fa-0873-44eb-af19-e392cd4ba542	1	10	t	7481ceb6-5498-4036-a975-cfd72a39fa4e
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason") FROM stdin;
0a668c27-2c13-4c7c-82ca-e47cc38fb059	Отсутствие заданий
0eb2d3d2-b1f2-4241-bbe8-bb3c0ea5b16e	Неявка оператора (б/лист, отпуск, и пр.)
10385049-910d-4dae-9ba1-735e17fca930	Работа с управляющей программой
2e92f9dd-b0a2-4d9a-b305-d75d68f10f8c	Отсутствие крана, транспорта
344b8299-7b76-4dec-bff3-d4734c991306	Отсутствие сотрудника ОТК
3652d22c-6526-4ff8-9234-cdd52157c89c	Плановый ремонт централизованными службами
43f369a2-b4ba-47f3-b3f4-b01486f38542	Отсутствие инструмента, оснастки вспомогательного оборудования
44ba5a37-e22a-4721-bce9-b50c4d8cb89b	Сборочные операции
4dbac7d5-dd1f-4151-a421-51afc92de4ce	Работа по карте несоответствий
578606de-4e62-4461-8a92-5ba99441c5be	Уборка, осмотр оборудования, чистка/смазка оборудования
6ccf772f-aea3-4f3e-bdcc-a336a522630b	Ознакомление с работой, документацией, инструктаж
72adf24b-fe4a-4d94-92bc-f9f3943a7db6	Отсутствие материала, заготовок, деталей
77217753-2d95-46c7-9c81-f0ca925e9f28	Отсутствие энергоносителей
7be5bd4f-61cc-455a-9c84-f5945cff656f	Отсутствие оператора в связи с необеспеченностью
7ef26989-a051-4c71-adde-3eec5520ca38	Естественные надобности
8e9f50cf-dcf7-4fd5-a289-ed5dee09fc1c	Контроль на рабочем месте
9eaa67c9-f3ae-474a-bf0d-ed8ee4ce7f16	Праздники и выходные
a47933c4-48d4-4ffa-8936-4ce00006f9cc	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы
b4afaae6-b36b-47ad-b6dc-2c588fe0cec0	Аварийный ремонт централизованными службами
b5d308ec-557d-4e08-9c67-b2cfc19db462	Установка, выверка, снятие детали
b9b704a5-d074-442b-adb5-dc785b07e020	Нерабочее время по графику согласно сменности
c36c991f-5e4c-4d9b-a1b0-8da15c6ebc4b	Изменение режимов, смена инструмента, приспособления
cd1bb9b1-d326-432f-912a-75b9ce554acf	Установка, выверка, снятие детали
cf86d785-b6b3-4c78-855f-f57eaa78f0cd	Обед
ee7fc913-ad02-4187-bef4-f5c2ea9306c9	Отсутствие конструктора, технолога или ожидание его решения
\.


--
-- Data for Name: EventLogs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."EventLogs" ("Id", "Information", "DateTime", "UserId") FROM stdin;
\.


--
-- Data for Name: Inspectors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Inspectors" ("Id", "UserId") FROM stdin;
18096520-652d-47a7-b2a8-01c15b494f32	501a64d4-043e-406d-89f6-59d51d51f840
\.


--
-- Data for Name: LayerInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."LayerInstructions" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "WeldPassageId") FROM stdin;
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId") FROM stdin;
6a040d3d-78ce-4088-b0c2-f25e5269ae68	c63b69fc-a4aa-42ba-a264-c1ccca228bb9	0c86b02f-0974-4586-aebf-4f4db61f2a69
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId") FROM stdin;
0bae3ba9-5f92-4a35-a976-dc6d6ff8cb14	3	Пост 3	c4d0e495-ed93-47a5-a7e6-716b02100650
0c9d1ca9-f5f4-4ca0-84fb-fbfb1eb2d17a	2	Пост 2	318200b5-41e9-425b-8817-00afb5dfe997
f91f9dbd-0873-4e8a-8716-c84197678c99	1	Пост 1	722e99ee-dc9c-4725-9bba-a9d7389391b6
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
688277ae-bc06-4121-8ea6-2513c8e16b8b	0b53a30a-3331-459f-9f1d-6f48f39e2633
21facc0d-9e8c-4b7f-8f7b-2eaf5c707fa0	368a7175-d2d9-46ca-9e1c-6148dcc76426
688277ae-bc06-4121-8ea6-2513c8e16b8b	4daecc7b-b5c9-4902-a5fd-0aaeeb4fb313
21facc0d-9e8c-4b7f-8f7b-2eaf5c707fa0	db785087-6f75-4a97-9fee-feef81fc48a9
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId") FROM stdin;
318200b5-41e9-425b-8817-00afb5dfe997	Производственный участок 2	2	50ebc951-1eff-41b0-8451-2b0363d35da6
722e99ee-dc9c-4725-9bba-a9d7389391b6	Производственный участок 1	1	50ebc951-1eff-41b0-8451-2b0363d35da6
c4d0e495-ed93-47a5-a7e6-716b02100650	Производственный участок 3	3	50ebc951-1eff-41b0-8451-2b0363d35da6
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "ProductType", "WeldingTaskId", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId") FROM stdin;
0b53a30a-3331-459f-9f1d-6f48f39e2633	Деталь 1	1	2	f	3	\N	\N	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	6a040d3d-78ce-4088-b0c2-f25e5269ae68	18096520-652d-47a7-b2a8-01c15b494f32
368a7175-d2d9-46ca-9e1c-6148dcc76426	Деталь 2	2	2	t	3	\N	\N	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	6a040d3d-78ce-4088-b0c2-f25e5269ae68	18096520-652d-47a7-b2a8-01c15b494f32
4daecc7b-b5c9-4902-a5fd-0aaeeb4fb313	Узел 1	1	2	f	2	\N	\N	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	6a040d3d-78ce-4088-b0c2-f25e5269ae68	18096520-652d-47a7-b2a8-01c15b494f32
db785087-6f75-4a97-9fee-feef81fc48a9	Узел 2	2	2	f	2	\N	\N	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	6a040d3d-78ce-4088-b0c2-f25e5269ae68	18096520-652d-47a7-b2a8-01c15b494f32
21facc0d-9e8c-4b7f-8f7b-2eaf5c707fa0	Изделие 2	2	4	f	1	\N	100b18d5-382a-45f9-aa60-7ecd5ca99eee	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	6a040d3d-78ce-4088-b0c2-f25e5269ae68	18096520-652d-47a7-b2a8-01c15b494f32
688277ae-bc06-4121-8ea6-2513c8e16b8b	Изделие 1	1	1	t	1	\N	f2c7285b-ea1a-49f5-9851-45530bfaa831	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	6a040d3d-78ce-4088-b0c2-f25e5269ae68	18096520-652d-47a7-b2a8-01c15b494f32
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
5f21aa17-0842-4c4d-99ba-9316c7987d12	Admin
abe8b1c3-01a3-47df-be40-283fe7c4660d	Master
64a638cf-8347-4abe-9c9b-e13a8e069fda	Executor
a7094599-4aea-4a49-97e2-f404af652307	TechUser
b84ad342-ab43-43be-b3ec-f80fa5b6af0c	Chief
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "IsControlSubject", "Status", "ProductId", "ProductionAreaId", "WorkplaceId", "WelderId", "InspectorId") FROM stdin;
8a3068e3-2f5f-49ad-839c-5e0aab30823e	1	f	3	688277ae-bc06-4121-8ea6-2513c8e16b8b	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	398c0caa-891d-4e15-902d-146173a1d19c	18096520-652d-47a7-b2a8-01c15b494f32
d2de8b34-1da3-4817-bca2-c8f717cb7eb6	2	t	2	21facc0d-9e8c-4b7f-8f7b-2eaf5c707fa0	318200b5-41e9-425b-8817-00afb5dfe997	1e80e43f-53ca-44d8-877b-7ff51b5d477c	398c0caa-891d-4e15-902d-146173a1d19c	18096520-652d-47a7-b2a8-01c15b494f32
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "ProductId", "SeamId") FROM stdin;
c4912932-fbdb-4b58-acb0-fbb03450244b	2023-01-25 22:34:31.912329	1	Какая-то причина брака	688277ae-bc06-4121-8ea6-2513c8e16b8b	\N
38252b79-550c-448e-b286-634911278622	2023-01-25 22:34:31.912918	1	Какая-то причина брака	\N	8a3068e3-2f5f-49ad-839c-5e0aab30823e
\.


--
-- Data for Name: TechnologicalInstruction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstruction" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId") FROM stdin;
810427de-ff34-409b-bf06-63bc957a06cd	1	Инструкция 1	8a3068e3-2f5f-49ad-839c-5e0aab30823e	f2c7285b-ea1a-49f5-9851-45530bfaa831
9515e1bf-7988-4fc6-969c-ed6ed483e811	2	Инструкция 2	d2de8b34-1da3-4817-bca2-c8f717cb7eb6	100b18d5-382a-45f9-aa60-7ecd5ca99eee
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink") FROM stdin;
100b18d5-382a-45f9-aa60-7ecd5ca99eee	2	Технологический процесс 2	Ссылка
f2c7285b-ea1a-49f5-9851-45530bfaa831	1	Технологический процесс 1	Ссылка
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
21e9acdd-f006-49b4-b169-8eb3157b968a	b84ad342-ab43-43be-b3ec-f80fa5b6af0c
56754043-afa7-4d62-ae35-9ffb0de31d42	64a638cf-8347-4abe-9c9b-e13a8e069fda
97100b3d-d2ad-4d5b-a8eb-864323845f1d	64a638cf-8347-4abe-9c9b-e13a8e069fda
c6cfcb12-00aa-4ea4-891f-cd2680002e74	64a638cf-8347-4abe-9c9b-e13a8e069fda
c63b69fc-a4aa-42ba-a264-c1ccca228bb9	abe8b1c3-01a3-47df-be40-283fe7c4660d
501a64d4-043e-406d-89f6-59d51d51f840	a7094599-4aea-4a49-97e2-f404af652307
1a5f789c-6502-4b5f-a94a-36a16485561b	5f21aa17-0842-4c4d-99ba-9316c7987d12
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
21e9acdd-f006-49b4-b169-8eb3157b968a	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	318200b5-41e9-425b-8817-00afb5dfe997
56754043-afa7-4d62-ae35-9ffb0de31d42	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	722e99ee-dc9c-4725-9bba-a9d7389391b6
97100b3d-d2ad-4d5b-a8eb-864323845f1d	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	318200b5-41e9-425b-8817-00afb5dfe997
c6cfcb12-00aa-4ea4-891f-cd2680002e74	Имя 3	Отчество 3	Фамилия 3	UserName	Email	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	c4d0e495-ed93-47a5-a7e6-716b02100650
c63b69fc-a4aa-42ba-a264-c1ccca228bb9	Имя мастера	Отчество мастера	Фамилия мастера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	318200b5-41e9-425b-8817-00afb5dfe997
501a64d4-043e-406d-89f6-59d51d51f840	Имя Контролера	Имя Контролера	Имя Контролера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	318200b5-41e9-425b-8817-00afb5dfe997
1a5f789c-6502-4b5f-a94a-36a16485561b	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$aAYktZuE1YAqfglXsIZZVUX6qkTVxDkVoi96avDdmJDQS1G4	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "SeamId", "TechnologicalInstructionId") FROM stdin;
062e432b-36d0-4efc-9435-ef76da0af887	2	Заполняющий	1	100	5	50	10	60	d2de8b34-1da3-4817-bca2-c8f717cb7eb6	9515e1bf-7988-4fc6-969c-ed6ed483e811
9cc3afad-e0f7-4304-b138-b2622b95edda	1	Корневой	1	100	5	50	10	60	8a3068e3-2f5f-49ad-839c-5e0aab30823e	810427de-ff34-409b-bf06-63bc957a06cd
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId") FROM stdin;
398c0caa-891d-4e15-902d-146173a1d19c	56754043-afa7-4d62-ae35-9ffb0de31d42	5521d9be-8b6d-4bd0-b2fe-ff0065d6a5cf
60aaa683-0e8c-4968-b69b-884f4d2afaf3	c6cfcb12-00aa-4ea4-891f-cd2680002e74	5a444b1e-b02a-48cf-9940-f8521f0176d9
a58f2a51-0071-4647-aa7b-1792366cb286	97100b3d-d2ad-4d5b-a8eb-864323845f1d	\N
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId") FROM stdin;
00345d2d-eb7a-46d9-a7d5-b356ace1d8cb	4	2023-01-25 00:00:00	12:50:00	60	0c86b02f-0974-4586-aebf-4f4db61f2a69	10385049-910d-4dae-9ba1-735e17fca930
0ad744d4-4ecd-4deb-874c-e99d0372fb01	3	2023-01-25 00:00:00	00:00:00	60	0c86b02f-0974-4586-aebf-4f4db61f2a69	\N
1919a61a-ae3c-44e0-bd04-36875951a5db	4	2023-01-25 00:00:00	09:30:00	30	dbceb4ef-58c5-4529-8baf-0f260281815a	0a668c27-2c13-4c7c-82ca-e47cc38fb059
241bb389-2dc6-4bb8-ad42-1b0b29aad4b3	3	2023-01-25 00:00:00	00:00:00	30	dbceb4ef-58c5-4529-8baf-0f260281815a	\N
7b978166-810e-4732-9679-1e4700aeec5d	3	2023-01-25 00:00:00	00:00:00	60	eee3ffc9-9c3e-4368-856f-0c07fc7c2a67	\N
a30c4c3b-15c2-4e94-83f6-3ac5203d3fba	4	2023-01-25 00:00:00	19:30:00	10	dbceb4ef-58c5-4529-8baf-0f260281815a	0eb2d3d2-b1f2-4241-bbe8-bb3c0ea5b16e
d90ba3c5-477f-4632-bc35-a1f2e24a46cf	3	2023-01-25 00:00:00	00:00:00	60	dbceb4ef-58c5-4529-8baf-0f260281815a	\N
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "WelderId") FROM stdin;
0c86b02f-0974-4586-aebf-4f4db61f2a69	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	a58f2a51-0071-4647-aa7b-1792366cb286
dbceb4ef-58c5-4529-8baf-0f260281815a	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	f91f9dbd-0873-4e8a-8716-c84197678c99	398c0caa-891d-4e15-902d-146173a1d19c
eee3ffc9-9c3e-4368-856f-0c07fc7c2a67	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	f91f9dbd-0873-4e8a-8716-c84197678c99	60aaa683-0e8c-4968-b69b-884f4d2afaf3
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId") FROM stdin;
73750510-5f8c-4d22-aef5-192f0761464b	2	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	320	1	220	12	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	8a3068e3-2f5f-49ad-839c-5e0aab30823e
d51d23cb-de95-44a5-b6a6-950e2c457d72	1	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	300	1	200	81	150	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	d2de8b34-1da3-4817-bca2-c8f717cb7eb6
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId") FROM stdin;
0de9dd12-4639-428a-bf7d-5c072f001cdf	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	7481ceb6-5498-4036-a975-cfd72a39fa4e
1a5617c2-8ce2-40d1-8413-a54eb368e4aa	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	7481ceb6-5498-4036-a975-cfd72a39fa4e
b1227e88-6f2f-47f0-9873-06bc69623556	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	7481ceb6-5498-4036-a975-cfd72a39fa4e
72fb84e5-fde5-458e-a2c0-3359292ae08b	1	12:10:00	13:10:00	13:20:00	13:50:00	6090e9fa-0873-44eb-af19-e392cd4ba542	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
1e80e43f-53ca-44d8-877b-7ff51b5d477c	3	\N	c4d0e495-ed93-47a5-a7e6-716b02100650
5521d9be-8b6d-4bd0-b2fe-ff0065d6a5cf	2	\N	318200b5-41e9-425b-8817-00afb5dfe997
5a444b1e-b02a-48cf-9940-f8521f0176d9	1	\N	722e99ee-dc9c-4725-9bba-a9d7389391b6
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number") FROM stdin;
50ebc951-1eff-41b0-8451-2b0363d35da6	Цех	1
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
-- Name: LayerInstructions PK_LayerInstructions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LayerInstructions"
    ADD CONSTRAINT "PK_LayerInstructions" PRIMARY KEY ("Id");


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
-- Name: TechnologicalInstruction PK_TechnologicalInstruction; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstruction"
    ADD CONSTRAINT "PK_TechnologicalInstruction" PRIMARY KEY ("Id");


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
-- Name: WeldPassages PK_WeldPassages; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "PK_WeldPassages" PRIMARY KEY ("Id");


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
-- Name: IX_Calendars_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Calendars_WelderId" ON public."Calendars" USING btree ("WelderId");


--
-- Name: IX_Calendars_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Calendars_WeldingEquipmentId" ON public."Calendars" USING btree ("WeldingEquipmentId");


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
-- Name: IX_EventLogs_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_EventLogs_UserId" ON public."EventLogs" USING btree ("UserId");


--
-- Name: IX_Inspectors_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Inspectors_UserId" ON public."Inspectors" USING btree ("UserId");


--
-- Name: IX_LayerInstructions_WeldPassageId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_LayerInstructions_WeldPassageId" ON public."LayerInstructions" USING btree ("WeldPassageId");


--
-- Name: IX_Masters_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Masters_UserId" ON public."Masters" USING btree ("UserId");


--
-- Name: IX_Masters_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Masters_WeldingEquipmentId" ON public."Masters" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_ProductInsides_MainProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductInsides_MainProductId" ON public."ProductInsides" USING btree ("MainProductId");


--
-- Name: IX_ProductionAreas_WorkshopId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductionAreas_WorkshopId" ON public."ProductionAreas" USING btree ("WorkshopId");


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
-- Name: IX_StatusReasons_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_ProductId" ON public."StatusReasons" USING btree ("ProductId");


--
-- Name: IX_StatusReasons_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_SeamId" ON public."StatusReasons" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstruction_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstruction_SeamId" ON public."TechnologicalInstruction" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstruction_TechnologicalProcessId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_TechnologicalInstruction_TechnologicalProcessId" ON public."TechnologicalInstruction" USING btree ("TechnologicalProcessId");


--
-- Name: IX_UserRoles_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_UserRoles_UserId" ON public."UserRoles" USING btree ("UserId");


--
-- Name: IX_Users_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Users_ProductionAreaId" ON public."Users" USING btree ("ProductionAreaId");


--
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


--
-- Name: IX_WeldPassages_TechnologicalInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_TechnologicalInstructionId" ON public."WeldPassages" USING btree ("TechnologicalInstructionId");


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
-- Name: IX_WeldingEquipmentConditionTimes_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentConditionTimes_WeldingEquipmentId" ON public."WeldingEquipmentConditionTimes" USING btree ("WeldingEquipmentId");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingEquipments_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_WelderId" ON public."WeldingEquipments" USING btree ("WelderId");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


--
-- Name: IX_WorkingShifts_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WorkingShifts_CalendarId" ON public."WorkingShifts" USING btree ("CalendarId");


--
-- Name: IX_WorkingShifts_DayId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WorkingShifts_DayId" ON public."WorkingShifts" USING btree ("DayId");


--
-- Name: IX_Workplaces_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Workplaces_PostId" ON public."Workplaces" USING btree ("PostId");


--
-- Name: IX_Workplaces_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Workplaces_ProductionAreaId" ON public."Workplaces" USING btree ("ProductionAreaId");


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
-- Name: LayerInstructions FK_LayerInstructions_WeldPassages_WeldPassageId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LayerInstructions"
    ADD CONSTRAINT "FK_LayerInstructions_WeldPassages_WeldPassageId" FOREIGN KEY ("WeldPassageId") REFERENCES public."WeldPassages"("Id");


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
-- Name: TechnologicalInstruction FK_TechnologicalInstruction_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstruction"
    ADD CONSTRAINT "FK_TechnologicalInstruction_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: TechnologicalInstruction FK_TechnologicalInstruction_TechnologicalProcesses_Technologic~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalInstruction"
    ADD CONSTRAINT "FK_TechnologicalInstruction_TechnologicalProcesses_Technologic~" FOREIGN KEY ("TechnologicalProcessId") REFERENCES public."TechnologicalProcesses"("Id");


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
-- Name: WeldPassages FK_WeldPassages_TechnologicalInstruction_TechnologicalInstruct~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_TechnologicalInstruction_TechnologicalInstruct~" FOREIGN KEY ("TechnologicalInstructionId") REFERENCES public."TechnologicalInstruction"("Id") ON DELETE CASCADE;


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
-- Name: WeldingEquipments FK_WeldingEquipments_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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

