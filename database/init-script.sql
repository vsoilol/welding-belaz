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
    "IsMain" boolean NOT NULL
);


--
-- Name: Days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Days" (
    "Id" uuid NOT NULL,
    "MonthNumber" integer NOT NULL,
    "Number" integer NOT NULL,
    "BreakBetweenShifts" integer,
    "CalendarId" uuid NOT NULL
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
    "PreheatingTemperatureMax" double precision NOT NULL
);


--
-- Name: Masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Masters" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL
);


--
-- Name: Posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Posts" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
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
    "IsControlSubject" boolean NOT NULL,
    "ProductType" integer NOT NULL
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
    "ProductId" uuid
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
    "PdmSystemFileLink" text NOT NULL,
    "ProductId" uuid
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
    "UserName" text NOT NULL,
    "Email" text NOT NULL,
    "PasswordHash" text NOT NULL,
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
    "Name" text NOT NULL,
    "SeamId" uuid NOT NULL,
    "TechnologicalInstructionId" uuid NOT NULL,
    "LayerInstructionId" uuid NOT NULL
);


--
-- Name: Welders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Welders" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "WorkplaceId" uuid,
    "CalendarId" uuid
);


--
-- Name: WeldingEquipmentConditionTimes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipmentConditionTimes" (
    "Id" uuid NOT NULL,
    "Condition" integer NOT NULL,
    "DowntimeReason" text,
    "ChangeConditionTime" interval,
    "Time" integer NOT NULL
);


--
-- Name: WeldingEquipmentWorkingShifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingEquipmentWorkingShifts" (
    "WeldingEquipmentId" uuid NOT NULL,
    "WorkingShiftId" uuid NOT NULL,
    "WeldingEquipmentConditionTimeId" uuid NOT NULL
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
    "CalendarId" uuid,
    "MasterId" uuid,
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
    "Status" integer NOT NULL,
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
    "DayId" uuid NOT NULL
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

COPY public."Calendars" ("Id", "Year", "IsMain") FROM stdin;
ea48c2b4-0cca-466d-9a19-01abfbb77a03	2022	t
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "BreakBetweenShifts", "CalendarId") FROM stdin;
64bf1d6e-4476-4fd3-a93f-0d4dd4a7ce9b	1	1	30	ea48c2b4-0cca-466d-9a19-01abfbb77a03
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
d4e78707-b703-4938-9da8-fed69aeb27bf	297b5e3b-ba7d-4214-b6f5-37c6992509c9
\.


--
-- Data for Name: LayerInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."LayerInstructions" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax") FROM stdin;
25df9a81-a3cd-4bcb-bb81-41c548ca6544	1	100	5	50	10	60
98cdda52-4651-43ab-ba99-92aca22db945	1	100	5	50	10	60
8c580e01-3e88-41d9-b7f1-4acb941d24ca	13	23	33	43	53	63
f0f85686-84d3-41f2-9cb1-807e352af640	12	22	32	42	52	62
3618c854-317c-4477-9f0e-8c9af7897518	11	21	31	41	51	61
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId") FROM stdin;
8138794c-4823-4f9e-bee0-06c3e2e6f643	6a478253-d81f-4d5b-a6e1-ff4b3221fc54
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "ProductionAreaId") FROM stdin;
0c2f5310-7431-42eb-9466-d1e43ad14d29	3	3cf46bf2-35ef-40e4-8207-bda84dfb2b1f
b4c29dd8-7551-4a70-a0ef-84fa295a2c3a	1	5df7e1d5-e595-4c83-9bf5-e0c9936c403f
e2d8d49f-e6f7-450f-83bb-2f3f69320f57	2	f4162f89-d78a-4718-b1c5-ab984b958f34
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
45260166-de46-4073-828b-f719b84eb3b4	0821ddc6-85e0-4c80-91f7-cb06c4132cfe
3ff67753-47a7-45d1-a93d-4ba77d9ad557	93b5ade6-071a-4805-a3c6-3e0bb0cd3f90
3ff67753-47a7-45d1-a93d-4ba77d9ad557	ea0241c4-49eb-4216-ad7b-83563d0f082f
45260166-de46-4073-828b-f719b84eb3b4	f01dd18b-0860-4318-bdaa-7b420f26a8c1
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId") FROM stdin;
3cf46bf2-35ef-40e4-8207-bda84dfb2b1f	Производственный участок 3	3	983a5d39-7244-4823-b841-64c39c0bd0df
5df7e1d5-e595-4c83-9bf5-e0c9936c403f	Производственный участок 1	1	983a5d39-7244-4823-b841-64c39c0bd0df
f4162f89-d78a-4718-b1c5-ab984b958f34	Производственный участок 2	2	983a5d39-7244-4823-b841-64c39c0bd0df
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType") FROM stdin;
0821ddc6-85e0-4c80-91f7-cb06c4132cfe	Узел 2	2	f	2
3ff67753-47a7-45d1-a93d-4ba77d9ad557	Изделие 1	1	t	1
45260166-de46-4073-828b-f719b84eb3b4	Изделие 2	2	f	1
93b5ade6-071a-4805-a3c6-3e0bb0cd3f90	Деталь 1	1	f	3
ea0241c4-49eb-4216-ad7b-83563d0f082f	Узел 1	1	f	2
f01dd18b-0860-4318-bdaa-7b420f26a8c1	Деталь 2	2	t	3
c8a47489-df75-4083-8745-54fe0ebf3397	string	0	t	1
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
84e82414-16e2-48d2-accb-8646eb904566	Admin
411a5944-dbb2-40f5-809f-687174ae925e	Master
ab438f6a-8636-4c70-b2e5-af91cb63b91d	Executor
79c7992b-940c-4cd3-a42d-c3e0b156ab39	TechUser
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "IsControlSubject", "ProductId") FROM stdin;
2506f799-f41c-47da-a5a8-c34f30168632	2	t	45260166-de46-4073-828b-f719b84eb3b4
2cc6e286-d31f-4ee4-b50c-1fad58ab3c3b	1	f	3ff67753-47a7-45d1-a93d-4ba77d9ad557
a6a0b180-4cb7-437b-94c5-72790eecbd5e	3	t	c8a47489-df75-4083-8745-54fe0ebf3397
\.


--
-- Data for Name: TechnologicalInstruction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstruction" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId") FROM stdin;
2456e177-22cf-4023-8a95-69e8246671f8	1	Инструкция 1	2cc6e286-d31f-4ee4-b50c-1fad58ab3c3b	d9ba357f-2d19-4ac8-ab55-ba7d3b9df5ae
29d18c34-b2c1-4def-99d0-1596eaeba757	2	Инструкция 2	2506f799-f41c-47da-a5a8-c34f30168632	217958f0-d624-4e20-bf6a-f88d467d9463
4876cdbe-5d2b-4476-958a-20c708689a0f	3	Технологическая инструкция 3 новая	a6a0b180-4cb7-437b-94c5-72790eecbd5e	217958f0-d624-4e20-bf6a-f88d467d9463
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "ProductId") FROM stdin;
217958f0-d624-4e20-bf6a-f88d467d9463	2	Технологический процесс 2	Ссылка	45260166-de46-4073-828b-f719b84eb3b4
d9ba357f-2d19-4ac8-ab55-ba7d3b9df5ae	1	Технологический процесс 1	Ссылка	3ff67753-47a7-45d1-a93d-4ba77d9ad557
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
54213cc0-8cf6-4b57-a784-696d67dc116c	ab438f6a-8636-4c70-b2e5-af91cb63b91d
592296ab-9ec9-4e55-9583-6ed0a6b1edbc	ab438f6a-8636-4c70-b2e5-af91cb63b91d
e8d907da-a7a5-4e8c-b363-375400900fb7	ab438f6a-8636-4c70-b2e5-af91cb63b91d
297b5e3b-ba7d-4214-b6f5-37c6992509c9	79c7992b-940c-4cd3-a42d-c3e0b156ab39
6a478253-d81f-4d5b-a6e1-ff4b3221fc54	411a5944-dbb2-40f5-809f-687174ae925e
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
54213cc0-8cf6-4b57-a784-696d67dc116c	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	5df7e1d5-e595-4c83-9bf5-e0c9936c403f
592296ab-9ec9-4e55-9583-6ed0a6b1edbc	Имя 3	Отчество 3	Фамилия 3	UserName	Email	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	f4162f89-d78a-4718-b1c5-ab984b958f34
e8d907da-a7a5-4e8c-b363-375400900fb7	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	3cf46bf2-35ef-40e4-8207-bda84dfb2b1f
297b5e3b-ba7d-4214-b6f5-37c6992509c9	Имя Контролера	Имя Контролера	Имя Контролера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	\N
6a478253-d81f-4d5b-a6e1-ff4b3221fc54	Имя мастера	Отчество мастера	Фамилия мастера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Name", "SeamId", "TechnologicalInstructionId", "LayerInstructionId") FROM stdin;
430a0acf-2f5e-4727-a08e-a4085090e6a6	Название прохода 1	2506f799-f41c-47da-a5a8-c34f30168632	29d18c34-b2c1-4def-99d0-1596eaeba757	98cdda52-4651-43ab-ba99-92aca22db945
74004b61-119e-4140-8c1e-353e46988c63	Название прохода 1	2cc6e286-d31f-4ee4-b50c-1fad58ab3c3b	2456e177-22cf-4023-8a95-69e8246671f8	25df9a81-a3cd-4bcb-bb81-41c548ca6544
7b3d4bf1-18e0-470a-9b5b-a6f03ee0f156	второй обход новый	a6a0b180-4cb7-437b-94c5-72790eecbd5e	4876cdbe-5d2b-4476-958a-20c708689a0f	8c580e01-3e88-41d9-b7f1-4acb941d24ca
f099bd7e-1c20-421d-be53-bdacb2c3e8d0	Один обход новый	a6a0b180-4cb7-437b-94c5-72790eecbd5e	4876cdbe-5d2b-4476-958a-20c708689a0f	f0f85686-84d3-41f2-9cb1-807e352af640
e915080e-71ba-47ac-9bf1-af7ba7b577f4	третий обход новый	a6a0b180-4cb7-437b-94c5-72790eecbd5e	4876cdbe-5d2b-4476-958a-20c708689a0f	3618c854-317c-4477-9f0e-8c9af7897518
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "CalendarId") FROM stdin;
47c9cf27-1aa9-450b-b6e1-59a21f60e8e6	e8d907da-a7a5-4e8c-b363-375400900fb7	\N	\N
d32574b4-cc64-4abe-8602-e403eaafe9c8	54213cc0-8cf6-4b57-a784-696d67dc116c	c711b3f8-ce4c-4fed-8484-27e624e3e85f	\N
ed914da5-a8e2-45a7-b273-fca7da224d57	592296ab-9ec9-4e55-9583-6ed0a6b1edbc	ca699afc-0b1d-4207-b65c-5c1251f9bbcc	\N
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "DowntimeReason", "ChangeConditionTime", "Time") FROM stdin;
41f3fad8-b238-4ed5-b296-dd73731ac098	4	Какая-то причина простоя 3	12:50:00	60
742ed08b-f571-4438-8213-33a99ec6b50e	4	Какая-то причина простоя	09:30:00	30
90329bab-3bb4-435a-9848-91b4c695cd87	4	Какая-то причина простоя 2	19:30:00	10
96f0c6f3-a247-4bd6-946e-031a21c05d9c	3	\N	\N	60
c5b72779-d55c-4fe4-acb3-657ec8f8a1f0	3	\N	\N	60
cfac0a95-047a-429a-8434-388bd4b45d89	3	\N	\N	30
f9df8dd6-aeda-4874-b7cd-7987593eadd0	3	\N	\N	60
\.


--
-- Data for Name: WeldingEquipmentWorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkingShifts" ("WeldingEquipmentId", "WorkingShiftId", "WeldingEquipmentConditionTimeId") FROM stdin;
068a4be6-b5b7-4113-89c5-d5cba38a5da0	4e06a7de-d00a-40e1-86e5-86352db5fa03	96f0c6f3-a247-4bd6-946e-031a21c05d9c
5911ed72-53a0-4f9d-9d13-5be84f3e0ee8	4e06a7de-d00a-40e1-86e5-86352db5fa03	742ed08b-f571-4438-8213-33a99ec6b50e
5911ed72-53a0-4f9d-9d13-5be84f3e0ee8	4e06a7de-d00a-40e1-86e5-86352db5fa03	c5b72779-d55c-4fe4-acb3-657ec8f8a1f0
5911ed72-53a0-4f9d-9d13-5be84f3e0ee8	a2e79cd1-d047-468c-9af8-7ca653bbb30e	cfac0a95-047a-429a-8434-388bd4b45d89
5911ed72-53a0-4f9d-9d13-5be84f3e0ee8	f8ef42b5-9e76-45b6-a55b-82e02c3c4c39	90329bab-3bb4-435a-9848-91b4c695cd87
875b1ef0-1f61-429c-9b8d-d6359cca4fdc	4e06a7de-d00a-40e1-86e5-86352db5fa03	f9df8dd6-aeda-4874-b7cd-7987593eadd0
875b1ef0-1f61-429c-9b8d-d6359cca4fdc	a2e79cd1-d047-468c-9af8-7ca653bbb30e	41f3fad8-b238-4ed5-b296-dd73731ac098
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "CalendarId", "MasterId", "WelderId") FROM stdin;
068a4be6-b5b7-4113-89c5-d5cba38a5da0	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	b4c29dd8-7551-4a70-a0ef-84fa295a2c3a	\N	\N	d32574b4-cc64-4abe-8602-e403eaafe9c8
5911ed72-53a0-4f9d-9d13-5be84f3e0ee8	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	b4c29dd8-7551-4a70-a0ef-84fa295a2c3a	\N	\N	47c9cf27-1aa9-450b-b6e1-59a21f60e8e6
875b1ef0-1f61-429c-9b8d-d6359cca4fdc	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	\N	\N	ed914da5-a8e2-45a7-b273-fca7da224d57
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WelderId", "MasterId", "InspectorId", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "Status", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "ProductId", "SeamId") FROM stdin;
16ef962c-a244-43ad-844c-b07739427741	6	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	0821ddc6-85e0-4c80-91f7-cb06c4132cfe	\N
18e06de9-0b92-4cc8-b26e-336b042a75b7	4	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	320	1	220	12	2	3	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	2cc6e286-d31f-4ee4-b50c-1fad58ab3c3b
1bedba77-ba09-4cf2-8ea4-904dee2065f8	2	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	3067	41	203	31	110	1	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	3ff67753-47a7-45d1-a93d-4ba77d9ad557	\N
1d0faf71-1151-4fe7-ba06-acce22d6a0e2	6	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	f01dd18b-0860-4318-bdaa-7b420f26a8c1	\N
21ccc1aa-596a-4400-ae4c-9dbe7a3096e0	6	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	ea0241c4-49eb-4216-ad7b-83563d0f082f	\N
50a4db03-c643-4858-bf9d-a3261de431db	3	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	390	81	820	81	170	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	93b5ade6-071a-4805-a3c6-3e0bb0cd3f90	\N
77859d4b-84b5-49ae-bfc5-607806e7f913	5	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	130	21	23	13	10	4	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	45260166-de46-4073-828b-f719b84eb3b4	\N
f3f3e512-5dc1-4f63-908c-9ce8cd0d67dd	1	d32574b4-cc64-4abe-8602-e403eaafe9c8	8138794c-4823-4f9e-bee0-06c3e2e6f643	d4e78707-b703-4938-9da8-fed69aeb27bf	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	300	1	200	81	150	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	2506f799-f41c-47da-a5a8-c34f30168632
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "DayId") FROM stdin;
4e06a7de-d00a-40e1-86e5-86352db5fa03	3	16:30:00	20:00:00	64bf1d6e-4476-4fd3-a93f-0d4dd4a7ce9b
a2e79cd1-d047-468c-9af8-7ca653bbb30e	1	08:00:00	12:00:00	64bf1d6e-4476-4fd3-a93f-0d4dd4a7ce9b
f8ef42b5-9e76-45b6-a55b-82e02c3c4c39	2	12:30:00	16:00:00	64bf1d6e-4476-4fd3-a93f-0d4dd4a7ce9b
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
5173e246-61c0-4858-b790-618640e6a43b	1	\N	5df7e1d5-e595-4c83-9bf5-e0c9936c403f
c711b3f8-ce4c-4fed-8484-27e624e3e85f	2	\N	f4162f89-d78a-4718-b1c5-ab984b958f34
ca699afc-0b1d-4207-b65c-5c1251f9bbcc	3	\N	3cf46bf2-35ef-40e4-8207-bda84dfb2b1f
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number") FROM stdin;
983a5d39-7244-4823-b841-64c39c0bd0df	Цех	1
\.


--
-- Name: Calendars PK_Calendars; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Calendars"
    ADD CONSTRAINT "PK_Calendars" PRIMARY KEY ("Id");


--
-- Name: Days PK_Days; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Days"
    ADD CONSTRAINT "PK_Days" PRIMARY KEY ("Id");


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
-- Name: WeldingEquipmentWorkingShifts PK_WeldingEquipmentWorkingShifts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts"
    ADD CONSTRAINT "PK_WeldingEquipmentWorkingShifts" PRIMARY KEY ("WeldingEquipmentId", "WorkingShiftId", "WeldingEquipmentConditionTimeId");


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
-- Name: IX_Masters_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Masters_UserId" ON public."Masters" USING btree ("UserId");


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
-- Name: IX_Seams_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seams_ProductId" ON public."Seams" USING btree ("ProductId");


--
-- Name: IX_TechnologicalInstruction_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalInstruction_SeamId" ON public."TechnologicalInstruction" USING btree ("SeamId");


--
-- Name: IX_TechnologicalInstruction_TechnologicalProcessId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_TechnologicalInstruction_TechnologicalProcessId" ON public."TechnologicalInstruction" USING btree ("TechnologicalProcessId");


--
-- Name: IX_TechnologicalProcesses_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_TechnologicalProcesses_ProductId" ON public."TechnologicalProcesses" USING btree ("ProductId");


--
-- Name: IX_UserRoles_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_UserRoles_UserId" ON public."UserRoles" USING btree ("UserId");


--
-- Name: IX_Users_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Users_ProductionAreaId" ON public."Users" USING btree ("ProductionAreaId");


--
-- Name: IX_WeldPassages_LayerInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldPassages_LayerInstructionId" ON public."WeldPassages" USING btree ("LayerInstructionId");


--
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


--
-- Name: IX_WeldPassages_TechnologicalInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_TechnologicalInstructionId" ON public."WeldPassages" USING btree ("TechnologicalInstructionId");


--
-- Name: IX_Welders_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_CalendarId" ON public."Welders" USING btree ("CalendarId");


--
-- Name: IX_Welders_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_UserId" ON public."Welders" USING btree ("UserId");


--
-- Name: IX_Welders_WorkplaceId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_WorkplaceId" ON public."Welders" USING btree ("WorkplaceId");


--
-- Name: IX_WeldingEquipmentWorkingShifts_WeldingEquipmentConditionTime~; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipmentWorkingShifts_WeldingEquipmentConditionTime~" ON public."WeldingEquipmentWorkingShifts" USING btree ("WeldingEquipmentConditionTimeId");


--
-- Name: IX_WeldingEquipmentWorkingShifts_WorkingShiftId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentWorkingShifts_WorkingShiftId" ON public."WeldingEquipmentWorkingShifts" USING btree ("WorkingShiftId");


--
-- Name: IX_WeldingEquipments_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_CalendarId" ON public."WeldingEquipments" USING btree ("CalendarId");


--
-- Name: IX_WeldingEquipments_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_MasterId" ON public."WeldingEquipments" USING btree ("MasterId");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingEquipments_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_WelderId" ON public."WeldingEquipments" USING btree ("WelderId");


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
-- Name: Seams FK_Seams_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seams"
    ADD CONSTRAINT "FK_Seams_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id");


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
-- Name: TechnologicalProcesses FK_TechnologicalProcesses_Products_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalProcesses"
    ADD CONSTRAINT "FK_TechnologicalProcesses_Products_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id");


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
-- Name: WeldPassages FK_WeldPassages_LayerInstructions_LayerInstructionId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_LayerInstructions_LayerInstructionId" FOREIGN KEY ("LayerInstructionId") REFERENCES public."LayerInstructions"("Id") ON DELETE CASCADE;


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
-- Name: Welders FK_Welders_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id");


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
-- Name: WeldingEquipmentWorkingShifts FK_WeldingEquipmentWorkingShifts_WeldingEquipmentConditionTime~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts"
    ADD CONSTRAINT "FK_WeldingEquipmentWorkingShifts_WeldingEquipmentConditionTime~" FOREIGN KEY ("WeldingEquipmentConditionTimeId") REFERENCES public."WeldingEquipmentConditionTimes"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipmentWorkingShifts FK_WeldingEquipmentWorkingShifts_WeldingEquipments_WeldingEqui~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts"
    ADD CONSTRAINT "FK_WeldingEquipmentWorkingShifts_WeldingEquipments_WeldingEqui~" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipmentWorkingShifts FK_WeldingEquipmentWorkingShifts_WorkingShifts_WorkingShiftId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts"
    ADD CONSTRAINT "FK_WeldingEquipmentWorkingShifts_WorkingShifts_WorkingShiftId" FOREIGN KEY ("WorkingShiftId") REFERENCES public."WorkingShifts"("Id") ON DELETE CASCADE;


--
-- Name: WeldingEquipments FK_WeldingEquipments_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id");


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
-- Name: WorkingShifts FK_WorkingShifts_Days_DayId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WorkingShifts"
    ADD CONSTRAINT "FK_WorkingShifts_Days_DayId" FOREIGN KEY ("DayId") REFERENCES public."Days"("Id") ON DELETE CASCADE;


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

