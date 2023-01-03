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
    "SeamId" uuid NOT NULL,
    "TechnologicalInstructionId" uuid NOT NULL,
    "Name" text NOT NULL,
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
4528cbde-0e21-4cb9-87af-c79045d7436d	2022	t
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "BreakBetweenShifts", "CalendarId") FROM stdin;
ca93960a-5387-473c-a459-cf8d0d0e5c25	1	1	30	4528cbde-0e21-4cb9-87af-c79045d7436d
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
79ed2992-a6d4-4d8c-8125-7824ddcebc82	bed692aa-d3e3-4008-baf8-deaf07173ecf
\.


--
-- Data for Name: LayerInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."LayerInstructions" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax") FROM stdin;
462236c1-dca4-4299-9e07-31d8acea56fc	1	100	5	50	10	60
5f42bd24-c213-410e-84aa-052fc9ba7062	1	100	5	50	10	60
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId") FROM stdin;
833d3b9a-6ef1-4899-9bc5-fef9219eb02f	31e879eb-0640-4a39-bf49-163a4298c379
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "ProductionAreaId") FROM stdin;
12e61d17-687d-4fbd-a7d3-39f5d9d356d8	1	84f3510c-eba4-4c62-97d7-ad32bcbba51b
36ad336c-731d-4e86-b312-7dc3c6a7781b	3	ebef0729-e6dc-4f92-9c1f-1689bfbf0022
7ffdc73f-8774-4dd1-8cde-cb979ff4accd	2	bff163d1-372c-431e-b7da-879098632c02
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
33b7c04c-f72e-47df-a0e0-a85ed4d485e0	4b1b0bba-833c-4e7f-8436-ea55aaffd59e
33b7c04c-f72e-47df-a0e0-a85ed4d485e0	5d4066d2-edcb-45db-b1e1-908b709b9642
4a3f57ce-d1c5-4f70-aeb7-5c08e272c9ee	8bfabb47-af28-4ce9-81e0-dbb789b9fa8e
4a3f57ce-d1c5-4f70-aeb7-5c08e272c9ee	efd6bd85-61f0-4632-967a-74a2b4a1c3e2
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId") FROM stdin;
84f3510c-eba4-4c62-97d7-ad32bcbba51b	Производственный участок 1	1	1e1a9d95-3a4d-46ab-8399-0111f47a0b4d
bff163d1-372c-431e-b7da-879098632c02	Производственный участок 2	2	1e1a9d95-3a4d-46ab-8399-0111f47a0b4d
ebef0729-e6dc-4f92-9c1f-1689bfbf0022	Производственный участок 3	3	1e1a9d95-3a4d-46ab-8399-0111f47a0b4d
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType") FROM stdin;
33b7c04c-f72e-47df-a0e0-a85ed4d485e0	Изделие 2	2	f	1
4a3f57ce-d1c5-4f70-aeb7-5c08e272c9ee	Изделие 1	1	t	1
4b1b0bba-833c-4e7f-8436-ea55aaffd59e	Деталь 2	2	t	3
5d4066d2-edcb-45db-b1e1-908b709b9642	Узел 2	2	f	2
8bfabb47-af28-4ce9-81e0-dbb789b9fa8e	Деталь 1	1	f	3
efd6bd85-61f0-4632-967a-74a2b4a1c3e2	Узел 1	1	f	2
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
4cd381e6-5660-41d1-8dcc-c9c2448b77fb	Admin
4408bf96-89d7-476d-856d-dd03d0a06362	Master
ca16b431-8457-4f8c-966a-ea96567cb18c	Executor
c91eb75f-8e9c-4bea-93ab-51a155b96a4a	TechUser
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "IsControlSubject", "ProductId") FROM stdin;
6aff0c71-bec4-4b1a-9568-ac7e2c30f3f4	1	f	4a3f57ce-d1c5-4f70-aeb7-5c08e272c9ee
9c425646-3dcb-4f88-9bc2-ca6d1ce56078	2	t	33b7c04c-f72e-47df-a0e0-a85ed4d485e0
\.


--
-- Data for Name: TechnologicalInstruction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstruction" ("Id", "Number", "Name", "SeamId", "TechnologicalProcessId") FROM stdin;
4d94276a-8d59-4de1-bb14-961199d8a911	1	Инструкция 1	6aff0c71-bec4-4b1a-9568-ac7e2c30f3f4	35403bcb-db69-4376-9c39-e1f463326555
91218b4d-08ca-45ad-8ad8-ffa376281569	2	Инструкция 2	9c425646-3dcb-4f88-9bc2-ca6d1ce56078	0212442f-5e9b-46d9-b8cb-43243edcf66d
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "ProductId") FROM stdin;
0212442f-5e9b-46d9-b8cb-43243edcf66d	2	Технологический процесс 2	Ссылка	33b7c04c-f72e-47df-a0e0-a85ed4d485e0
35403bcb-db69-4376-9c39-e1f463326555	1	Технологический процесс 1	Ссылка	4a3f57ce-d1c5-4f70-aeb7-5c08e272c9ee
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
01b9c362-826b-40fc-9d8c-408b230d6455	ca16b431-8457-4f8c-966a-ea96567cb18c
44588438-6d28-492f-b5c7-1688b95d10d9	ca16b431-8457-4f8c-966a-ea96567cb18c
cbce6b8c-bd2f-4636-a0e8-6fb4e5f085e8	ca16b431-8457-4f8c-966a-ea96567cb18c
bed692aa-d3e3-4008-baf8-deaf07173ecf	c91eb75f-8e9c-4bea-93ab-51a155b96a4a
31e879eb-0640-4a39-bf49-163a4298c379	4408bf96-89d7-476d-856d-dd03d0a06362
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
01b9c362-826b-40fc-9d8c-408b230d6455	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	84f3510c-eba4-4c62-97d7-ad32bcbba51b
44588438-6d28-492f-b5c7-1688b95d10d9	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	bff163d1-372c-431e-b7da-879098632c02
cbce6b8c-bd2f-4636-a0e8-6fb4e5f085e8	Имя 3	Отчество 3	Фамилия 3	UserName	Email	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	ebef0729-e6dc-4f92-9c1f-1689bfbf0022
bed692aa-d3e3-4008-baf8-deaf07173ecf	Имя Контролера	Имя Контролера	Имя Контролера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	\N
31e879eb-0640-4a39-bf49-163a4298c379	Имя мастера	Отчество мастера	Фамилия мастера	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка проверяющего 1	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("SeamId", "TechnologicalInstructionId", "Name", "LayerInstructionId") FROM stdin;
6aff0c71-bec4-4b1a-9568-ac7e2c30f3f4	4d94276a-8d59-4de1-bb14-961199d8a911	Название прохода 1	5f42bd24-c213-410e-84aa-052fc9ba7062
9c425646-3dcb-4f88-9bc2-ca6d1ce56078	91218b4d-08ca-45ad-8ad8-ffa376281569	Название прохода 1	462236c1-dca4-4299-9e07-31d8acea56fc
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "CalendarId") FROM stdin;
66acaa98-8a72-40d6-a965-8851703fd422	cbce6b8c-bd2f-4636-a0e8-6fb4e5f085e8	98efa037-e236-4672-a960-d486d5943e92	\N
7ac88d6b-7935-4474-ae78-d71a233090f6	01b9c362-826b-40fc-9d8c-408b230d6455	\N	\N
a41bc37c-77fd-4c33-aefa-334eea01bc44	44588438-6d28-492f-b5c7-1688b95d10d9	92eebb93-d18b-4c0c-ba5d-9fb53ec97d19	\N
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "DowntimeReason", "ChangeConditionTime", "Time") FROM stdin;
287f7145-e59a-4c8c-8c1c-b580aa27b62b	3	\N	\N	60
39dbcaec-c577-40ce-853b-47e2f0963ab2	3	\N	\N	60
3ba6d209-6bc8-4bfe-bc2a-ec6e590c2b38	4	Какая-то причина простоя	09:30:00	30
8441d278-e1f5-45c2-b6dd-aaa639eddffa	4	Какая-то причина простоя 3	12:50:00	60
ad60e220-bc2a-4591-bc19-f4c5d0015af0	4	Какая-то причина простоя 2	19:30:00	10
e9cd20e1-7214-460d-9b65-185513f43028	3	\N	\N	30
fe6a86a2-2916-4d8c-8404-9de279c5554a	3	\N	\N	60
\.


--
-- Data for Name: WeldingEquipmentWorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkingShifts" ("WeldingEquipmentId", "WorkingShiftId", "WeldingEquipmentConditionTimeId") FROM stdin;
213da2ec-a8fb-4c56-abf2-1bd291931f4f	193833b6-dc6d-4a24-ade4-fcd796c43912	3ba6d209-6bc8-4bfe-bc2a-ec6e590c2b38
213da2ec-a8fb-4c56-abf2-1bd291931f4f	193833b6-dc6d-4a24-ade4-fcd796c43912	fe6a86a2-2916-4d8c-8404-9de279c5554a
213da2ec-a8fb-4c56-abf2-1bd291931f4f	84f36513-4c01-4282-b705-35a4dde0f8f6	e9cd20e1-7214-460d-9b65-185513f43028
213da2ec-a8fb-4c56-abf2-1bd291931f4f	b033057e-15cc-48b6-892a-5f8b2eb6ddd2	ad60e220-bc2a-4591-bc19-f4c5d0015af0
5f260957-b792-4042-adb8-fcdbe0a60461	193833b6-dc6d-4a24-ade4-fcd796c43912	287f7145-e59a-4c8c-8c1c-b580aa27b62b
5f260957-b792-4042-adb8-fcdbe0a60461	84f36513-4c01-4282-b705-35a4dde0f8f6	8441d278-e1f5-45c2-b6dd-aaa639eddffa
d2064635-5916-48a3-bd00-e1d14556e22e	193833b6-dc6d-4a24-ade4-fcd796c43912	39dbcaec-c577-40ce-853b-47e2f0963ab2
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "CalendarId", "MasterId", "WelderId") FROM stdin;
213da2ec-a8fb-4c56-abf2-1bd291931f4f	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	12e61d17-687d-4fbd-a7d3-39f5d9d356d8	\N	\N	66acaa98-8a72-40d6-a965-8851703fd422
5f260957-b792-4042-adb8-fcdbe0a60461	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	\N	\N	a41bc37c-77fd-4c33-aefa-334eea01bc44
d2064635-5916-48a3-bd00-e1d14556e22e	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	12e61d17-687d-4fbd-a7d3-39f5d9d356d8	\N	\N	7ac88d6b-7935-4474-ae78-d71a233090f6
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WelderId", "MasterId", "InspectorId", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "Status", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "ProductId", "SeamId") FROM stdin;
3e41570e-acd5-4111-b4b9-a69250ea14c5	6	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	efd6bd85-61f0-4632-967a-74a2b4a1c3e2	\N
5b036f70-0453-4c56-bed1-81098285eee7	1	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	300	1	200	81	150	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	9c425646-3dcb-4f88-9bc2-ca6d1ce56078
6ff23058-25a1-4815-88e7-d50d427113ef	3	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	390	81	820	81	170	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	8bfabb47-af28-4ce9-81e0-dbb789b9fa8e	\N
b7544acd-cd2e-4daa-82d6-6208eac22373	2	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	3067	41	203	31	110	1	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	4a3f57ce-d1c5-4f70-aeb7-5c08e272c9ee	\N
ba6f8a0c-210e-491f-aeb0-3980866dd9cd	6	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	5d4066d2-edcb-45db-b1e1-908b709b9642	\N
c43c2d70-57ea-4a78-987b-be68e85d71bd	4	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	320	1	220	12	2	3	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	\N	6aff0c71-bec4-4b1a-9568-ac7e2c30f3f4
ccb02120-8d86-447b-90a5-49a10354fddc	5	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	130	21	23	13	10	4	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	33b7c04c-f72e-47df-a0e0-a85ed4d485e0	\N
def2b5b1-a027-40bb-b7a0-25c1efb412be	6	66acaa98-8a72-40d6-a965-8851703fd422	833d3b9a-6ef1-4899-9bc5-fef9219eb02f	79ed2992-a6d4-4d8c-8125-7824ddcebc82	2022-01-01 00:00:00	2022-01-03 00:00:00	\N	31	2	22	2	11	2	\N	\N	{1.2,2.3,6.8}	{11.2,2.33,26.8}	\N	\N	Основной материал	№ сертификата	варочные материалы	№ сертификата	\N	\N	4b1b0bba-833c-4e7f-8436-ea55aaffd59e	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "DayId") FROM stdin;
193833b6-dc6d-4a24-ade4-fcd796c43912	2	12:30:00	16:00:00	ca93960a-5387-473c-a459-cf8d0d0e5c25
84f36513-4c01-4282-b705-35a4dde0f8f6	3	16:30:00	20:00:00	ca93960a-5387-473c-a459-cf8d0d0e5c25
b033057e-15cc-48b6-892a-5f8b2eb6ddd2	1	08:00:00	12:00:00	ca93960a-5387-473c-a459-cf8d0d0e5c25
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
28d60b53-7d85-4a6b-97a3-df313cec987f	2	\N	bff163d1-372c-431e-b7da-879098632c02
92eebb93-d18b-4c0c-ba5d-9fb53ec97d19	1	\N	84f3510c-eba4-4c62-97d7-ad32bcbba51b
98efa037-e236-4672-a960-d486d5943e92	3	\N	ebef0729-e6dc-4f92-9c1f-1689bfbf0022
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number") FROM stdin;
1e1a9d95-3a4d-46ab-8399-0111f47a0b4d	Цех	1
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
    ADD CONSTRAINT "PK_WeldPassages" PRIMARY KEY ("SeamId", "TechnologicalInstructionId");


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

