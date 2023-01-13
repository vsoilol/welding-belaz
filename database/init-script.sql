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
-- Name: Chiefs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Chiefs" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL
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
    "PreheatingTemperatureMax" double precision NOT NULL,
    "WeldPassageId" uuid
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
    "ProductId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid
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
    "WorkplaceId" uuid,
    "CalendarId" uuid,
    "WeldingEquipmentId" uuid
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
    "MasterId" uuid
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
7690d13e-2a2f-4c3f-905a-39f079617cc3	2022	t
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId") FROM stdin;
5cd482b6-d875-4a90-a1e0-7160d4acf6ac	6b582c10-b5a5-47fb-bb95-086022a91783
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "BreakBetweenShifts", "CalendarId") FROM stdin;
90952b00-bd8c-430f-9058-3ba08c403b1d	1	1	30	7690d13e-2a2f-4c3f-905a-39f079617cc3
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
b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	ab64093c-c6d5-4fc2-b153-56d2c89fdf89
\.


--
-- Data for Name: LayerInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."LayerInstructions" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "WeldPassageId") FROM stdin;
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId") FROM stdin;
fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	a178c989-e661-4d32-99c6-b48c8542b742
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "ProductionAreaId") FROM stdin;
39d8e742-61c4-4410-89da-21f8b82649c1	1	4e9c6116-eeb8-4fe7-83e7-855979f4a0ba
ba01eddf-d12a-4fce-96bc-1cf728826391	3	424b3e42-c758-466e-8fc5-6f945f4032b6
c0172845-bb64-40b7-a5d4-df2a4a880929	2	1d1c07b0-103b-4a3c-b055-83601e07fd7a
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
9def4485-6ee2-4423-8e8b-c7133c749ee8	18852678-4166-4879-b8a4-6252016385ca
9def4485-6ee2-4423-8e8b-c7133c749ee8	5795492b-8d85-4fca-ad7d-4c800bdd7f74
c9f65d34-5cf0-4d4a-8825-8dec86c15226	d6b6b71c-3e18-485d-8def-07077d0c928d
c9f65d34-5cf0-4d4a-8825-8dec86c15226	eb7f9484-87cc-49f8-89a4-a27a443e2700
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId") FROM stdin;
1d1c07b0-103b-4a3c-b055-83601e07fd7a	Производственный участок 2	2	f5095e91-4dc6-4228-b318-576296d69784
424b3e42-c758-466e-8fc5-6f945f4032b6	Производственный участок 3	3	f5095e91-4dc6-4228-b318-576296d69784
4e9c6116-eeb8-4fe7-83e7-855979f4a0ba	Производственный участок 1	1	f5095e91-4dc6-4228-b318-576296d69784
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId") FROM stdin;
18852678-4166-4879-b8a4-6252016385ca	Узел 1	1	f	2	\N	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
5795492b-8d85-4fca-ad7d-4c800bdd7f74	Деталь 1	1	f	3	\N	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
d6b6b71c-3e18-485d-8def-07077d0c928d	Деталь 2	2	t	3	\N	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
eb7f9484-87cc-49f8-89a4-a27a443e2700	Узел 2	2	f	2	\N	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
9def4485-6ee2-4423-8e8b-c7133c749ee8	Изделие 1	1	t	1	c95b4914-d6bd-400b-91af-76c7f7390981	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
c9f65d34-5cf0-4d4a-8825-8dec86c15226	Изделие 2	2	f	1	569280a4-a074-40ea-91ef-35e2a9ec959d	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
6be5f97c-7409-4bb2-b131-10367fdd03c5	Admin
d63972e7-bbab-4dfd-917c-41402347cf21	Master
7ca7aa49-baea-4482-a488-694135888773	Executor
4fb4a6a5-dbe6-4f8f-92ca-030ffdc7d59d	TechUser
04113601-c0fc-4d04-91f4-4790f1a24792	Chief
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "IsControlSubject", "ProductId", "ProductionAreaId", "WorkplaceId") FROM stdin;
c1a3804e-1839-44e7-bd82-c70f8248c0a3	1	f	9def4485-6ee2-4423-8e8b-c7133c749ee8	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
f3f83d23-85c3-469b-bca2-8736549aaa04	2	t	c9f65d34-5cf0-4d4a-8825-8dec86c15226	1d1c07b0-103b-4a3c-b055-83601e07fd7a	595485e7-6ba2-458f-8b32-7c3ab8e22a82
\.


--
-- Data for Name: TechnologicalInstruction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstruction" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId") FROM stdin;
9243dc1d-947a-4e26-a818-7de29244e167	2	Инструкция 2	f3f83d23-85c3-469b-bca2-8736549aaa04	569280a4-a074-40ea-91ef-35e2a9ec959d
b3249203-8898-4514-b8d8-4bc2ff5ec677	1	Инструкция 1	c1a3804e-1839-44e7-bd82-c70f8248c0a3	c95b4914-d6bd-400b-91af-76c7f7390981
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink") FROM stdin;
569280a4-a074-40ea-91ef-35e2a9ec959d	2	Технологический процесс 2	Ссылка
c95b4914-d6bd-400b-91af-76c7f7390981	1	Технологический процесс 1	Ссылка
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
6b582c10-b5a5-47fb-bb95-086022a91783	04113601-c0fc-4d04-91f4-4790f1a24792
30a2a2ea-de72-40c9-847f-d971fe833ffd	7ca7aa49-baea-4482-a488-694135888773
69f9cbb1-8d32-4573-b179-5ad2efeaff5e	7ca7aa49-baea-4482-a488-694135888773
e6f7d74a-8a79-459f-9854-faa49cc4608b	7ca7aa49-baea-4482-a488-694135888773
ab64093c-c6d5-4fc2-b153-56d2c89fdf89	4fb4a6a5-dbe6-4f8f-92ca-030ffdc7d59d
a178c989-e661-4d32-99c6-b48c8542b742	d63972e7-bbab-4dfd-917c-41402347cf21
4da6c3fd-b5b8-44db-850a-3b50172b7935	6be5f97c-7409-4bb2-b131-10367fdd03c5
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
6b582c10-b5a5-47fb-bb95-086022a91783	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	1d1c07b0-103b-4a3c-b055-83601e07fd7a
30a2a2ea-de72-40c9-847f-d971fe833ffd	Имя 3	Отчество 3	Фамилия 3	UserName	Email	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	4e9c6116-eeb8-4fe7-83e7-855979f4a0ba
69f9cbb1-8d32-4573-b179-5ad2efeaff5e	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	1d1c07b0-103b-4a3c-b055-83601e07fd7a
e6f7d74a-8a79-459f-9854-faa49cc4608b	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	424b3e42-c758-466e-8fc5-6f945f4032b6
ab64093c-c6d5-4fc2-b153-56d2c89fdf89	Имя Контролера	Имя Контролера	Имя Контролера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	1d1c07b0-103b-4a3c-b055-83601e07fd7a
a178c989-e661-4d32-99c6-b48c8542b742	Имя мастера	Отчество мастера	Фамилия мастера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	1d1c07b0-103b-4a3c-b055-83601e07fd7a
4da6c3fd-b5b8-44db-850a-3b50172b7935	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$0PjT1WEnGqjfXXPpOyyb6gJAp6K5OrOlB3G7l/Px/VmUIhuA	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "SeamId", "TechnologicalInstructionId") FROM stdin;
5861308b-c0fa-4c9b-838e-948d55b950b6	Название прохода 1	1	100	5	50	10	60	f3f83d23-85c3-469b-bca2-8736549aaa04	9243dc1d-947a-4e26-a818-7de29244e167
f87d00fd-950d-415a-820c-d345f698c251	Название прохода 1	1	100	5	50	10	60	c1a3804e-1839-44e7-bd82-c70f8248c0a3	b3249203-8898-4514-b8d8-4bc2ff5ec677
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "CalendarId", "WeldingEquipmentId") FROM stdin;
1f6b9fe7-b488-41b3-8c8a-24c4935216a4	30a2a2ea-de72-40c9-847f-d971fe833ffd	f1dd8cdc-a157-4263-bfae-102d3a0cc267	\N	8f534088-d8a2-4c59-b7cb-3039a85ea1a0
74be0288-b783-4c7a-b259-7521ae7151ad	e6f7d74a-8a79-459f-9854-faa49cc4608b	62a5e399-3a69-449c-9b4a-5afc39f85740	\N	662b468c-cc20-416c-81aa-e6ea15895aef
a530330b-3adf-4dd3-b16a-752e7a1753fd	69f9cbb1-8d32-4573-b179-5ad2efeaff5e	\N	\N	6fe3f0cf-c4c5-4b69-8d95-e3f2ba0175a2
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "DowntimeReason", "ChangeConditionTime", "Time") FROM stdin;
020dd916-0c6f-40f5-b5a6-374d0b898580	3	\N	\N	60
7d774255-8915-4b08-bea2-b3b84ec5219d	3	\N	\N	60
7f321427-68b0-4e56-8ced-e5f46a0a3c00	4	Какая-то причина простоя 3	12:50:00	60
9cd4777f-0f33-4095-a9d7-6a8174575f38	3	\N	\N	60
a4b5476e-305a-4dc7-aa65-21a6052f8d10	4	Какая-то причина простоя	09:30:00	30
b9db0736-bb26-41a3-a86e-cd3f53448004	3	\N	\N	30
bbe9cc16-fa60-41a0-9d24-927a2611bf64	4	Какая-то причина простоя 2	19:30:00	10
\.


--
-- Data for Name: WeldingEquipmentWorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkingShifts" ("WeldingEquipmentId", "WorkingShiftId", "WeldingEquipmentConditionTimeId") FROM stdin;
662b468c-cc20-416c-81aa-e6ea15895aef	0f7a8d6a-246e-403d-b656-5f74cd8cf6fb	7d774255-8915-4b08-bea2-b3b84ec5219d
6fe3f0cf-c4c5-4b69-8d95-e3f2ba0175a2	0f7a8d6a-246e-403d-b656-5f74cd8cf6fb	9cd4777f-0f33-4095-a9d7-6a8174575f38
6fe3f0cf-c4c5-4b69-8d95-e3f2ba0175a2	6b5c4d8b-d4c7-4dcf-a931-d635f9ffee67	7f321427-68b0-4e56-8ced-e5f46a0a3c00
8f534088-d8a2-4c59-b7cb-3039a85ea1a0	0f7a8d6a-246e-403d-b656-5f74cd8cf6fb	020dd916-0c6f-40f5-b5a6-374d0b898580
8f534088-d8a2-4c59-b7cb-3039a85ea1a0	0f7a8d6a-246e-403d-b656-5f74cd8cf6fb	a4b5476e-305a-4dc7-aa65-21a6052f8d10
8f534088-d8a2-4c59-b7cb-3039a85ea1a0	6b5c4d8b-d4c7-4dcf-a931-d635f9ffee67	b9db0736-bb26-41a3-a86e-cd3f53448004
8f534088-d8a2-4c59-b7cb-3039a85ea1a0	d8ca34d0-1e3f-48f6-be65-d3deb9c5ee68	bbe9cc16-fa60-41a0-9d24-927a2611bf64
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "CalendarId", "MasterId") FROM stdin;
6fe3f0cf-c4c5-4b69-8d95-e3f2ba0175a2	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	\N	\N
8f534088-d8a2-4c59-b7cb-3039a85ea1a0	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	39d8e742-61c4-4410-89da-21f8b82649c1	\N	\N
662b468c-cc20-416c-81aa-e6ea15895aef	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	39d8e742-61c4-4410-89da-21f8b82649c1	\N	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WelderId", "MasterId", "InspectorId", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "Status", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "ProductId", "SeamId") FROM stdin;
07d342d7-9517-4001-9885-7a3c35b384cb	6	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	eb7f9484-87cc-49f8-89a4-a27a443e2700	\N
364f49e9-58f8-43fc-93c6-ebf4992d1358	2	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	3067	41	203	31	110	1	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	9def4485-6ee2-4423-8e8b-c7133c749ee8	\N
4d4e5143-ca3d-4765-b0c7-12c5750912f4	1	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	300	1	200	81	150	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	f3f83d23-85c3-469b-bca2-8736549aaa04
542f5f84-eabb-4d8e-8427-89b363b9f320	3	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	390	81	820	81	170	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	5795492b-8d85-4fca-ad7d-4c800bdd7f74	\N
554e822a-30db-43fd-92a3-3c4f293c8081	6	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	18852678-4166-4879-b8a4-6252016385ca	\N
7f7ea7cf-c34b-4268-a7d5-0fd081987abb	5	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	130	21	23	13	10	4	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	c9f65d34-5cf0-4d4a-8825-8dec86c15226	\N
a78dd261-fe3d-4845-a83a-f1eecceac949	4	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	320	1	220	12	2	3	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	c1a3804e-1839-44e7-bd82-c70f8248c0a3
c889cffc-08bd-4015-a823-a35002d63b21	6	1f6b9fe7-b488-41b3-8c8a-24c4935216a4	fe38d4b9-cd60-4dd9-b6d8-d40581b25e0a	b444c9d8-e5bd-447f-abcf-9a8f733c6bd5	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	d6b6b71c-3e18-485d-8def-07077d0c928d	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "DayId") FROM stdin;
0f7a8d6a-246e-403d-b656-5f74cd8cf6fb	3	16:30:00	20:00:00	90952b00-bd8c-430f-9058-3ba08c403b1d
6b5c4d8b-d4c7-4dcf-a931-d635f9ffee67	2	12:30:00	16:00:00	90952b00-bd8c-430f-9058-3ba08c403b1d
d8ca34d0-1e3f-48f6-be65-d3deb9c5ee68	1	08:00:00	12:00:00	90952b00-bd8c-430f-9058-3ba08c403b1d
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
595485e7-6ba2-458f-8b32-7c3ab8e22a82	3	\N	424b3e42-c758-466e-8fc5-6f945f4032b6
62a5e399-3a69-449c-9b4a-5afc39f85740	1	\N	4e9c6116-eeb8-4fe7-83e7-855979f4a0ba
f1dd8cdc-a157-4263-bfae-102d3a0cc267	2	\N	1d1c07b0-103b-4a3c-b055-83601e07fd7a
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number") FROM stdin;
f5095e91-4dc6-4228-b318-576296d69784	Цех	1
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
-- Name: IX_Chiefs_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Chiefs_UserId" ON public."Chiefs" USING btree ("UserId");


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
-- Name: IX_Welders_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_CalendarId" ON public."Welders" USING btree ("CalendarId");


--
-- Name: IX_Welders_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Welders_UserId" ON public."Welders" USING btree ("UserId");


--
-- Name: IX_Welders_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Welders_WeldingEquipmentId" ON public."Welders" USING btree ("WeldingEquipmentId");


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
-- Name: Chiefs FK_Chiefs_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Chiefs"
    ADD CONSTRAINT "FK_Chiefs_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


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
-- Name: Welders FK_Welders_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


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

