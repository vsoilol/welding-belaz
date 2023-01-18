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
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid
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
    "WorkplaceId" uuid
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
    "WelderId" uuid NOT NULL,
    "MasterId" uuid NOT NULL,
    "InspectorId" uuid NOT NULL,
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
    "ProductId" uuid,
    "SeamId" uuid
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
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId") FROM stdin;
20a64d00-809e-4753-98ae-c3e11fb73107	68bc562c-0d1d-4131-aecb-7934dd49d01d	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId") FROM stdin;
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason") FROM stdin;
1289b7d6-0687-48ce-9204-8099bb7cbc2f	Аварийный ремонт централизованными службами
1f5b4c8a-2d61-46d9-bce0-2931fc3f1622	Отсутствие сотрудника ОТК
2056baf9-7bce-4f99-8cc4-494f71a98d24	Праздники и выходные
26291f46-a7e0-41e6-89c5-719f2bc2a851	Отсутствие инструмента, оснастки вспомогательного оборудования
2fa846b3-28f9-4965-a6e2-155ffd3cf2f0	Естественные надобности
352acec2-bc55-44e1-a759-b33971fb0c1a	Нерабочее время по графику согласно сменности
36d46aaf-e94e-4fa8-881e-fd40e0259d60	Отсутствие конструктора, технолога или ожидание его решения
38fd9222-8548-4b46-b86e-a91edaea0136	Обед
3d989906-493b-424a-969c-b770d483f169	Отсутствие заданий
42fa0857-f665-4e5e-8ca6-80f32794108c	Плановый ремонт централизованными службами
4cbbe7f7-6189-4263-b2a3-5bfd06fa11c1	Изменение режимов, смена инструмента, приспособления
54f44dd9-6e5f-4adb-a560-3a8ae85c571a	Работа с управляющей программой
5b5440d3-ec5e-4765-901e-9df877492151	Отсутствие энергоносителей
814367d5-346c-426f-b3c0-60fb1dab6193	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы
82a1109d-fcaf-4940-a712-c18d7b9fa88c	Уборка, осмотр оборудования, чистка/смазка оборудования
9540e987-ee2f-499f-a45a-3f938befe7f2	Неявка оператора (б/лист, отпуск, и пр.)
9602e0c5-f697-4197-b101-99fb01e75e95	Работа по карте несоответствий
a3860c58-a78e-4da0-bea5-9a1c5c7875fa	Отсутствие крана, транспорта
aabe198f-9cd4-4da4-b95c-698865a42549	Отсутствие материала, заготовок, деталей
aca4cf56-b5dd-4eb6-98d4-cadf550e1748	Ознакомление с работой, документацией, инструктаж
b9b10199-b702-42ad-b0c5-42c01def54ec	Контроль на рабочем месте
c3f534a1-3d50-48cc-a08e-00eef6355569	Сборочные операции
cb883ab6-b171-4fc7-bcd6-e2f6eebb0137	Отсутствие оператора в связи с необеспеченностью
dad2f3f7-4f45-413f-986e-559038632b5d	Установка, выверка, снятие детали
ef883a8d-6421-43dc-81d0-6ce25e990b54	Установка, выверка, снятие детали
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
dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	4f777763-54a3-4445-8b99-3e22596ef27e
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
b9e91227-18ab-4372-ab49-0a528a0da860	5e0b43a4-3ae1-4fc8-ad61-b8155450f09a	5b5df251-d2eb-4684-9282-127e16aa67e3
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId") FROM stdin;
5c268fd5-7dbd-4785-a068-bc221af8684d	3	Пост 3	56ef186e-0b1a-4527-99da-0c606b89a259
a45f08d3-aca5-48f8-9b82-1e391704bd2e	2	Пост 2	d3d205ed-9d73-44f6-b8d7-f19074db25b3
bf2ea123-3fd8-411d-a5a5-76c9840180a2	1	Пост 1	3a0e2549-a445-4718-a906-3e2f884406ae
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
d9053c48-c45f-4cdf-a2b5-623362054cd2	b841c493-60c7-4eac-a01b-3d03aa6cd0c6
d9053c48-c45f-4cdf-a2b5-623362054cd2	c6217860-78e5-418f-a799-d2ff7700d617
628400cd-421c-46d3-b350-bbc2b1c37021	e00d2a0b-ba70-453b-a9dd-840ac25dfeec
628400cd-421c-46d3-b350-bbc2b1c37021	ff9dddb6-ca88-4596-8523-582fe1aaf059
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId") FROM stdin;
3a0e2549-a445-4718-a906-3e2f884406ae	Производственный участок 1	1	edd813cb-1562-4180-a321-b5b30b416f8d
56ef186e-0b1a-4527-99da-0c606b89a259	Производственный участок 3	3	edd813cb-1562-4180-a321-b5b30b416f8d
d3d205ed-9d73-44f6-b8d7-f19074db25b3	Производственный участок 2	2	edd813cb-1562-4180-a321-b5b30b416f8d
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId") FROM stdin;
b841c493-60c7-4eac-a01b-3d03aa6cd0c6	Деталь 1	1	2	f	3	\N	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
c6217860-78e5-418f-a799-d2ff7700d617	Узел 1	1	2	f	2	\N	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
e00d2a0b-ba70-453b-a9dd-840ac25dfeec	Деталь 2	2	2	t	3	\N	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
ff9dddb6-ca88-4596-8523-582fe1aaf059	Узел 2	2	2	f	2	\N	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
628400cd-421c-46d3-b350-bbc2b1c37021	Изделие 2	2	4	f	1	5f147af4-fc0a-4c9f-957d-9f513512a988	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
d9053c48-c45f-4cdf-a2b5-623362054cd2	Изделие 1	1	1	t	1	bc9b7d9e-648a-4f35-bf73-b593c4b3561a	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
83108a5c-9626-40c4-a9bd-5134bebbd0ab	Admin
a1f9fe21-8fa8-4b55-a826-ad892a26e8d6	Master
081fb6f7-e031-4d84-a483-7534ce071fad	Executor
068c1530-1ac3-45e3-a25c-11d55b2bae69	TechUser
009cde21-e229-42d8-ba59-d02e0cf42578	Chief
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "IsControlSubject", "Status", "ProductId", "ProductionAreaId", "WorkplaceId") FROM stdin;
96df13bf-c97c-4ee4-a545-7e1de961920f	1	f	3	d9053c48-c45f-4cdf-a2b5-623362054cd2	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
f03a31dc-12da-4471-bded-887d40928b3c	2	t	2	628400cd-421c-46d3-b350-bbc2b1c37021	3a0e2549-a445-4718-a906-3e2f884406ae	311f0c99-04fc-439e-b078-95241bf44a29
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "ProductId", "SeamId") FROM stdin;
41339bdb-b2a7-4aa1-9a4e-dd2d255cc373	2023-01-18 17:30:42.025948	1	Какая-то причина брака	d9053c48-c45f-4cdf-a2b5-623362054cd2	\N
\.


--
-- Data for Name: TechnologicalInstruction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstruction" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId") FROM stdin;
a61e3b05-2ae7-40f2-a0d8-0cf059539260	1	Инструкция 1	96df13bf-c97c-4ee4-a545-7e1de961920f	bc9b7d9e-648a-4f35-bf73-b593c4b3561a
cb7b5ff1-65eb-474d-85b6-30a7bcc86db7	2	Инструкция 2	f03a31dc-12da-4471-bded-887d40928b3c	5f147af4-fc0a-4c9f-957d-9f513512a988
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink") FROM stdin;
5f147af4-fc0a-4c9f-957d-9f513512a988	2	Технологический процесс 2	Ссылка
bc9b7d9e-648a-4f35-bf73-b593c4b3561a	1	Технологический процесс 1	Ссылка
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
68bc562c-0d1d-4131-aecb-7934dd49d01d	009cde21-e229-42d8-ba59-d02e0cf42578
2e2ed8c3-71a8-476c-be85-f59a258a4ff8	081fb6f7-e031-4d84-a483-7534ce071fad
3274930a-9a69-41dd-bc7d-b29cba64bc23	081fb6f7-e031-4d84-a483-7534ce071fad
cd8503e9-e381-4125-aab5-4ca83ab5eb63	081fb6f7-e031-4d84-a483-7534ce071fad
4f777763-54a3-4445-8b99-3e22596ef27e	068c1530-1ac3-45e3-a25c-11d55b2bae69
5e0b43a4-3ae1-4fc8-ad61-b8155450f09a	a1f9fe21-8fa8-4b55-a826-ad892a26e8d6
9b61f44a-1e9f-4f2f-a5fc-1cc6efd538a2	83108a5c-9626-40c4-a9bd-5134bebbd0ab
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
68bc562c-0d1d-4131-aecb-7934dd49d01d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	3a0e2549-a445-4718-a906-3e2f884406ae
2e2ed8c3-71a8-476c-be85-f59a258a4ff8	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	3a0e2549-a445-4718-a906-3e2f884406ae
3274930a-9a69-41dd-bc7d-b29cba64bc23	Имя 3	Отчество 3	Фамилия 3	UserName	Email	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	d3d205ed-9d73-44f6-b8d7-f19074db25b3
cd8503e9-e381-4125-aab5-4ca83ab5eb63	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	56ef186e-0b1a-4527-99da-0c606b89a259
4f777763-54a3-4445-8b99-3e22596ef27e	Имя Контролера	Имя Контролера	Имя Контролера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	3a0e2549-a445-4718-a906-3e2f884406ae
5e0b43a4-3ae1-4fc8-ad61-b8155450f09a	Имя мастера	Отчество мастера	Фамилия мастера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	3a0e2549-a445-4718-a906-3e2f884406ae
9b61f44a-1e9f-4f2f-a5fc-1cc6efd538a2	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$avgePUtsjue0Pvx10oIIpGtof0DOQMrJD0Xy0bBcsthyEIih	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "SeamId", "TechnologicalInstructionId") FROM stdin;
86daf723-2b12-4582-a46a-f781faf49fd8	2	Заполняющий	1	100	5	50	10	60	f03a31dc-12da-4471-bded-887d40928b3c	cb7b5ff1-65eb-474d-85b6-30a7bcc86db7
de5323eb-f6ed-4e07-adf1-46ac9154e3b0	1	Корневой	1	100	5	50	10	60	96df13bf-c97c-4ee4-a545-7e1de961920f	a61e3b05-2ae7-40f2-a0d8-0cf059539260
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId") FROM stdin;
634e48dd-24c6-4bf6-8b3f-dc30bdac472b	2e2ed8c3-71a8-476c-be85-f59a258a4ff8	\N
a5d689ce-aa73-47e6-9a01-17a21713dc28	3274930a-9a69-41dd-bc7d-b29cba64bc23	c56ae77a-93e7-40f2-b584-27347808f5c1
da7b60ad-cb84-43c6-b4c3-928cff3b34aa	cd8503e9-e381-4125-aab5-4ca83ab5eb63	8e2cc919-63c4-4473-b451-b8994cd16b9c
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId") FROM stdin;
1cb75228-794b-4e49-bdeb-93f931716210	4	2023-01-18 00:00:00	12:50:00	60	cd468142-0c8a-4031-84df-aced1d95b7d0	2056baf9-7bce-4f99-8cc4-494f71a98d24
2eaecd36-12ae-43f7-aecc-398dda0136e8	4	2023-01-18 00:00:00	09:30:00	30	5b5df251-d2eb-4684-9282-127e16aa67e3	1289b7d6-0687-48ce-9204-8099bb7cbc2f
504ecf1e-8eda-4718-958c-7f169bec3648	3	2023-01-18 00:00:00	00:00:00	30	5b5df251-d2eb-4684-9282-127e16aa67e3	\N
68a3a150-44d5-4b1f-b495-cf38f46512be	3	2023-01-18 00:00:00	00:00:00	60	c20210d7-0408-4b78-897b-179295e6ac1d	\N
a976f127-40d0-4f23-ad76-cb369cc79743	4	2023-01-18 00:00:00	19:30:00	10	5b5df251-d2eb-4684-9282-127e16aa67e3	1f5b4c8a-2d61-46d9-bce0-2931fc3f1622
bbfb59d5-c16b-44c1-977e-7695dfcedb57	3	2023-01-18 00:00:00	00:00:00	60	5b5df251-d2eb-4684-9282-127e16aa67e3	\N
e8ce2a7d-fdf7-45d4-a4a8-54decbec0b9a	3	2023-01-18 00:00:00	00:00:00	60	cd468142-0c8a-4031-84df-aced1d95b7d0	\N
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "WelderId") FROM stdin;
5b5df251-d2eb-4684-9282-127e16aa67e3	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	bf2ea123-3fd8-411d-a5a5-76c9840180a2	634e48dd-24c6-4bf6-8b3f-dc30bdac472b
c20210d7-0408-4b78-897b-179295e6ac1d	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	bf2ea123-3fd8-411d-a5a5-76c9840180a2	a5d689ce-aa73-47e6-9a01-17a21713dc28
cd468142-0c8a-4031-84df-aced1d95b7d0	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	da7b60ad-cb84-43c6-b4c3-928cff3b34aa
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WelderId", "MasterId", "InspectorId", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "ProductId", "SeamId") FROM stdin;
2153f613-5b8e-4daf-90c9-d0e6af5483b8	6	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	ff9dddb6-ca88-4596-8523-582fe1aaf059	\N
37dacf3d-bacb-497f-802c-5926fad12de1	2	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	3067	41	203	31	110	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	d9053c48-c45f-4cdf-a2b5-623362054cd2	\N
6d89ed1a-b1f9-4cf5-8627-04f76847415b	5	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	130	21	23	13	10	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	628400cd-421c-46d3-b350-bbc2b1c37021	\N
a3d045e2-df33-479b-bd3b-adcd2385eaae	6	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	c6217860-78e5-418f-a799-d2ff7700d617	\N
ad4d3d30-6773-4649-a617-5c0a7bcf51b8	4	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	320	1	220	12	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	96df13bf-c97c-4ee4-a545-7e1de961920f
bd62df02-b638-4198-b97b-d94b60a889fb	1	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	300	1	200	81	150	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	f03a31dc-12da-4471-bded-887d40928b3c
c44638f4-b1ec-41ce-92f2-4020fe3dde39	3	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	390	81	820	81	170	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	b841c493-60c7-4eac-a01b-3d03aa6cd0c6	\N
fe20997b-3d5c-42d8-bfa6-f9166e7d9c61	6	a5d689ce-aa73-47e6-9a01-17a21713dc28	b9e91227-18ab-4372-ab49-0a528a0da860	dc16bb84-32f1-4f28-ae73-02e7bb2ccff8	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	e00d2a0b-ba70-453b-a9dd-840ac25dfeec	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId") FROM stdin;
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
311f0c99-04fc-439e-b078-95241bf44a29	3	\N	56ef186e-0b1a-4527-99da-0c606b89a259
8e2cc919-63c4-4473-b451-b8994cd16b9c	2	\N	d3d205ed-9d73-44f6-b8d7-f19074db25b3
c56ae77a-93e7-40f2-b584-27347808f5c1	1	\N	3a0e2549-a445-4718-a906-3e2f884406ae
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number") FROM stdin;
edd813cb-1562-4180-a321-b5b30b416f8d	Цех	1
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
-- Name: IX_Seams_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_ProductId" ON public."Seams" USING btree ("ProductId");


--
-- Name: IX_Seams_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_ProductionAreaId" ON public."Seams" USING btree ("ProductionAreaId");


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
-- Name: IX_WeldingTasks_InspectorId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_InspectorId" ON public."WeldingTasks" USING btree ("InspectorId");


--
-- Name: IX_WeldingTasks_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_MasterId" ON public."WeldingTasks" USING btree ("MasterId");


--
-- Name: IX_WeldingTasks_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_ProductId" ON public."WeldingTasks" USING btree ("ProductId");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


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
-- Name: Products FK_Products_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


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
-- Name: WeldingTasks FK_WeldingTasks_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id");


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

