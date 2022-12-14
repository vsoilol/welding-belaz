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

ALTER TABLE ONLY public."Workplaces" DROP CONSTRAINT "FK_Workplaces_ProductionAreas_ProductionAreaId";
ALTER TABLE ONLY public."Workplaces" DROP CONSTRAINT "FK_Workplaces_Posts_PostId";
ALTER TABLE ONLY public."WorkingShifts" DROP CONSTRAINT "FK_WorkingShifts_Days_DayId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Welders_WelderId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_TechnologicalProcessInstructions_Technological~";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Seam_SeamId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Product_ProductId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Masters_MasterId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Knot_KnotId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Inspectors_InspectorId";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "FK_WeldingTasks_Detail_DetailId";
ALTER TABLE ONLY public."WeldingEquipments" DROP CONSTRAINT "FK_WeldingEquipments_Welders_WelderId";
ALTER TABLE ONLY public."WeldingEquipments" DROP CONSTRAINT "FK_WeldingEquipments_Posts_PostId";
ALTER TABLE ONLY public."WeldingEquipments" DROP CONSTRAINT "FK_WeldingEquipments_Masters_MasterId";
ALTER TABLE ONLY public."WeldingEquipments" DROP CONSTRAINT "FK_WeldingEquipments_Calendars_CalendarId";
ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts" DROP CONSTRAINT "FK_WeldingEquipmentWorkingShifts_WorkingShifts_WorkingShiftId";
ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts" DROP CONSTRAINT "FK_WeldingEquipmentWorkingShifts_WeldingEquipments_WeldingEqui~";
ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts" DROP CONSTRAINT "FK_WeldingEquipmentWorkingShifts_WeldingEquipmentConditionTime~";
ALTER TABLE ONLY public."Welders" DROP CONSTRAINT "FK_Welders_Workplaces_WorkplaceId";
ALTER TABLE ONLY public."Welders" DROP CONSTRAINT "FK_Welders_WeldingEquipments_WeldingEquipmentId";
ALTER TABLE ONLY public."Welders" DROP CONSTRAINT "FK_Welders_Users_UserId";
ALTER TABLE ONLY public."Welders" DROP CONSTRAINT "FK_Welders_Calendars_CalendarId";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "FK_Users_ProductionAreas_ProductionAreaId";
ALTER TABLE ONLY public."UserRoles" DROP CONSTRAINT "FK_UserRoles_Users_UserId";
ALTER TABLE ONLY public."UserRoles" DROP CONSTRAINT "FK_UserRoles_Roles_RoleId";
ALTER TABLE ONLY public."Seam" DROP CONSTRAINT "FK_Seam_WeldingTasks_WeldingTaskId";
ALTER TABLE ONLY public."ProductionAreas" DROP CONSTRAINT "FK_ProductionAreas_Workshops_WorkshopId";
ALTER TABLE ONLY public."Product" DROP CONSTRAINT "FK_Product_WeldingTasks_WeldingTaskId";
ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "FK_Posts_ProductionAreas_ProductionAreaId";
ALTER TABLE ONLY public."Masters" DROP CONSTRAINT "FK_Masters_WeldingEquipments_WeldingEquipmentId";
ALTER TABLE ONLY public."Masters" DROP CONSTRAINT "FK_Masters_Users_UserId";
ALTER TABLE ONLY public."Layers" DROP CONSTRAINT "FK_Layers_TechnologicalProcessInstructions_TechnologicalProces~";
ALTER TABLE ONLY public."Knot" DROP CONSTRAINT "FK_Knot_WeldingTasks_WeldingTaskId";
ALTER TABLE ONLY public."Inspectors" DROP CONSTRAINT "FK_Inspectors_Users_UserId";
ALTER TABLE ONLY public."EventLogs" DROP CONSTRAINT "FK_EventLogs_Users_UserId";
ALTER TABLE ONLY public."Detail" DROP CONSTRAINT "FK_Detail_WeldingTasks_WeldingTaskId";
ALTER TABLE ONLY public."Days" DROP CONSTRAINT "FK_Days_Calendars_CalendarId";
DROP INDEX public."IX_Workplaces_ProductionAreaId";
DROP INDEX public."IX_Workplaces_PostId";
DROP INDEX public."IX_WorkingShifts_DayId";
DROP INDEX public."IX_WeldingTasks_WelderId";
DROP INDEX public."IX_WeldingTasks_TechnologicalProcessInstructionId";
DROP INDEX public."IX_WeldingTasks_SeamId";
DROP INDEX public."IX_WeldingTasks_ProductId";
DROP INDEX public."IX_WeldingTasks_MasterId";
DROP INDEX public."IX_WeldingTasks_KnotId";
DROP INDEX public."IX_WeldingTasks_InspectorId";
DROP INDEX public."IX_WeldingTasks_DetailId";
DROP INDEX public."IX_WeldingEquipments_WelderId";
DROP INDEX public."IX_WeldingEquipments_PostId";
DROP INDEX public."IX_WeldingEquipments_MasterId";
DROP INDEX public."IX_WeldingEquipments_CalendarId";
DROP INDEX public."IX_WeldingEquipmentWorkingShifts_WorkingShiftId";
DROP INDEX public."IX_WeldingEquipmentWorkingShifts_WeldingEquipmentConditionTime~";
DROP INDEX public."IX_Welders_WorkplaceId";
DROP INDEX public."IX_Welders_WeldingEquipmentId";
DROP INDEX public."IX_Welders_UserId";
DROP INDEX public."IX_Welders_CalendarId";
DROP INDEX public."IX_Users_ProductionAreaId";
DROP INDEX public."IX_UserRoles_UserId";
DROP INDEX public."IX_Seam_WeldingTaskId";
DROP INDEX public."IX_ProductionAreas_WorkshopId";
DROP INDEX public."IX_Product_WeldingTaskId";
DROP INDEX public."IX_Posts_ProductionAreaId";
DROP INDEX public."IX_Masters_WeldingEquipmentId";
DROP INDEX public."IX_Masters_UserId";
DROP INDEX public."IX_Layers_TechnologicalProcessInstructionId";
DROP INDEX public."IX_Knot_WeldingTaskId";
DROP INDEX public."IX_Inspectors_UserId";
DROP INDEX public."IX_EventLogs_UserId";
DROP INDEX public."IX_Detail_WeldingTaskId";
DROP INDEX public."IX_Days_CalendarId";
ALTER TABLE ONLY public."Workshops" DROP CONSTRAINT "PK_Workshops";
ALTER TABLE ONLY public."Workplaces" DROP CONSTRAINT "PK_Workplaces";
ALTER TABLE ONLY public."WorkingShifts" DROP CONSTRAINT "PK_WorkingShifts";
ALTER TABLE ONLY public."WeldingTasks" DROP CONSTRAINT "PK_WeldingTasks";
ALTER TABLE ONLY public."WeldingEquipments" DROP CONSTRAINT "PK_WeldingEquipments";
ALTER TABLE ONLY public."WeldingEquipmentWorkingShifts" DROP CONSTRAINT "PK_WeldingEquipmentWorkingShifts";
ALTER TABLE ONLY public."WeldingEquipmentConditionTimes" DROP CONSTRAINT "PK_WeldingEquipmentConditionTimes";
ALTER TABLE ONLY public."Welders" DROP CONSTRAINT "PK_Welders";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "PK_Users";
ALTER TABLE ONLY public."UserRoles" DROP CONSTRAINT "PK_UserRoles";
ALTER TABLE ONLY public."TechnologicalProcessInstructions" DROP CONSTRAINT "PK_TechnologicalProcessInstructions";
ALTER TABLE ONLY public."Seam" DROP CONSTRAINT "PK_Seam";
ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "PK_Roles";
ALTER TABLE ONLY public."ProductionAreas" DROP CONSTRAINT "PK_ProductionAreas";
ALTER TABLE ONLY public."Product" DROP CONSTRAINT "PK_Product";
ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "PK_Posts";
ALTER TABLE ONLY public."Masters" DROP CONSTRAINT "PK_Masters";
ALTER TABLE ONLY public."Layers" DROP CONSTRAINT "PK_Layers";
ALTER TABLE ONLY public."Knot" DROP CONSTRAINT "PK_Knot";
ALTER TABLE ONLY public."Inspectors" DROP CONSTRAINT "PK_Inspectors";
ALTER TABLE ONLY public."EventLogs" DROP CONSTRAINT "PK_EventLogs";
ALTER TABLE ONLY public."Detail" DROP CONSTRAINT "PK_Detail";
ALTER TABLE ONLY public."Days" DROP CONSTRAINT "PK_Days";
ALTER TABLE ONLY public."Calendars" DROP CONSTRAINT "PK_Calendars";
DROP TABLE public."Workshops";
DROP TABLE public."Workplaces";
DROP TABLE public."WorkingShifts";
DROP TABLE public."WeldingTasks";
DROP TABLE public."WeldingEquipments";
DROP TABLE public."WeldingEquipmentWorkingShifts";
DROP TABLE public."WeldingEquipmentConditionTimes";
DROP TABLE public."Welders";
DROP TABLE public."Users";
DROP TABLE public."UserRoles";
DROP TABLE public."TechnologicalProcessInstructions";
DROP TABLE public."Seam";
DROP TABLE public."Roles";
DROP TABLE public."ProductionAreas";
DROP TABLE public."Product";
DROP TABLE public."Posts";
DROP TABLE public."Masters";
DROP TABLE public."Layers";
DROP TABLE public."Knot";
DROP TABLE public."Inspectors";
DROP TABLE public."EventLogs";
DROP TABLE public."Detail";
DROP TABLE public."Days";
DROP TABLE public."Calendars";
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
-- Name: Detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Detail" (
    "Id" uuid NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Number" integer NOT NULL,
    "WeldingTaskId" uuid
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
-- Name: Knot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Knot" (
    "Id" uuid NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Number" integer NOT NULL,
    "WeldingTaskId" uuid
);


--
-- Name: Layers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Layers" (
    "Id" uuid NOT NULL,
    "WeldingCurrentMin" double precision NOT NULL,
    "WeldingCurrentMax" double precision NOT NULL,
    "ArcVoltageMin" double precision,
    "ArcVoltageMax" double precision,
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
    "TechnologicalProcessInstructionId" uuid NOT NULL
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
    "ProductionAreaId" uuid NOT NULL
);


--
-- Name: Product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product" (
    "Id" uuid NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Number" integer NOT NULL,
    "WeldingTaskId" uuid
);


--
-- Name: ProductionAreas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductionAreas" (
    "Id" uuid NOT NULL,
    "Name" character varying(100) NOT NULL,
    "WorkshopId" uuid NOT NULL
);


--
-- Name: Roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Roles" (
    "Id" uuid NOT NULL,
    "Name" character varying(20) NOT NULL
);


--
-- Name: Seam; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seam" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "WeldingTaskId" uuid
);


--
-- Name: TechnologicalProcessInstructions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TechnologicalProcessInstructions" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "Link" text NOT NULL
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
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "MiddleName" character varying(50) NOT NULL,
    "UserName" character varying(50) NOT NULL,
    "Email" character varying(100) NOT NULL,
    "PasswordHash" character varying(300) NOT NULL,
    "Position" character varying(100),
    "ServiceNumber" character varying(100),
    "CertificateValidityPeriod" timestamp without time zone,
    "RfidTag" character varying(100),
    "ProductionAreaId" uuid
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
    "RfidTag" character varying(100) NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Marking" character varying(50) NOT NULL,
    "FactoryNumber" character varying(50) NOT NULL,
    "CommissioningDate" timestamp without time zone NOT NULL,
    "CurrentCondition" integer NOT NULL,
    "Height" integer NOT NULL,
    "Width" integer NOT NULL,
    "Lenght" integer NOT NULL,
    "GroupNumber" integer NOT NULL,
    "ManufacturerName" character varying(100) NOT NULL,
    "NextAttestationDate" timestamp without time zone NOT NULL,
    "WeldingProcess" character varying(100) NOT NULL,
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
    "BasicMaterial" character varying(50) NOT NULL,
    "MainMaterialBatchNumber" character varying(50) NOT NULL,
    "WeldingMaterial" character varying(50) NOT NULL,
    "WeldingMaterialBatchNumber" character varying(50) NOT NULL,
    "ProtectiveGas" character varying(50),
    "ProtectiveGasBatchNumber" character varying(50),
    "SeamId" uuid NOT NULL,
    "ProductId" uuid,
    "KnotId" uuid,
    "DetailId" uuid,
    "TechnologicalProcessInstructionId" uuid NOT NULL
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
    "Name" character varying(100) NOT NULL
);


--
-- Data for Name: Calendars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Calendars" ("Id", "Year", "IsMain") FROM stdin;
00660342-52e9-40dc-8b47-9666d15bea3a	2022	t
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "BreakBetweenShifts", "CalendarId") FROM stdin;
fde4dec2-a4a5-4ad8-874f-ab5962b221b9	1	1	30	00660342-52e9-40dc-8b47-9666d15bea3a
\.


--
-- Data for Name: Detail; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Detail" ("Id", "Name", "Number", "WeldingTaskId") FROM stdin;
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
\.


--
-- Data for Name: Knot; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Knot" ("Id", "Name", "Number", "WeldingTaskId") FROM stdin;
\.


--
-- Data for Name: Layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Layers" ("Id", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalProcessInstructionId") FROM stdin;
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId") FROM stdin;
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "ProductionAreaId") FROM stdin;
124578ca-da18-479b-a625-4f3862935f72	2	69fb27a7-6670-4859-a565-3f0f74c54a03
5f16e5ed-020d-49a5-8d06-f69080b1ba84	1	b0dd7364-bbf0-43a3-8c00-ce7b59de2ba8
d489f7aa-e376-4a99-a78b-57d30abdb3a6	3	3a6cbac6-815c-4743-a779-a33e3d0a15b6
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Product" ("Id", "Name", "Number", "WeldingTaskId") FROM stdin;
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "WorkshopId") FROM stdin;
69fb27a7-6670-4859-a565-3f0f74c54a03	Производственный участок 2	f438de03-aff5-4a7e-bde5-95a7c1f2f116
b0dd7364-bbf0-43a3-8c00-ce7b59de2ba8	Производственный участок 1	f438de03-aff5-4a7e-bde5-95a7c1f2f116
3a6cbac6-815c-4743-a779-a33e3d0a15b6	Производственный участок 3	f438de03-aff5-4a7e-bde5-95a7c1f2f116
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name") FROM stdin;
c4c4e81a-2872-4d42-9d9a-71e3de704b58	Executor
26d9834a-1c54-4fe4-80fd-bdfe07a8ba08	Admin
fa333d33-751a-4515-8281-f7cdf84f8e3a	Master
ba24a399-d062-4424-b297-04f64329ac15	TechUser
\.


--
-- Data for Name: Seam; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seam" ("Id", "Number", "WeldingTaskId") FROM stdin;
\.


--
-- Data for Name: TechnologicalProcessInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcessInstructions" ("Id", "Number", "Name", "Link") FROM stdin;
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
7dcf0b34-ceed-4090-bfd5-43ede3974a51	c4c4e81a-2872-4d42-9d9a-71e3de704b58
24539179-8b94-42b1-8f42-3d02802c953a	c4c4e81a-2872-4d42-9d9a-71e3de704b58
fa101dee-a53d-4a60-8959-f7132e757441	c4c4e81a-2872-4d42-9d9a-71e3de704b58
00f07ed5-94d5-410b-a03b-be6d81b0848b	26d9834a-1c54-4fe4-80fd-bdfe07a8ba08
afbd68e1-4b9c-484f-9994-e91235e6607a	fa333d33-751a-4515-8281-f7cdf84f8e3a
04ac5b96-91eb-487e-b9ef-c7f57a1fc3e9	fa333d33-751a-4515-8281-f7cdf84f8e3a
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId") FROM stdin;
24539179-8b94-42b1-8f42-3d02802c953a	Имя 2	Отчество 2	Фамилия 2	UserName	Email	PasswordHash	Должность 2	Табельный номер  2	2025-01-01 00:00:00	RFID метка сварщика 2	b0dd7364-bbf0-43a3-8c00-ce7b59de2ba8
fa101dee-a53d-4a60-8959-f7132e757441	Имя 1	Отчество 1	Фамилия 1	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка сварщика 1	69fb27a7-6670-4859-a565-3f0f74c54a03
00f07ed5-94d5-410b-a03b-be6d81b0848b	Admin	Adminovich	Admin	admin	admin@admin.com	$MYHASH$V1$10000$/aqwsaFQrNFfxQgQHzEZZVYe1SPkS4dT3adxDHwTDdoxNXEa	\N	\N	\N	\N	\N
7dcf0b34-ceed-4090-bfd5-43ede3974a51	Имя 4	Отчество 4	Фамилия 4	Email@email.com	Email@email.com	PasswordHash	Должность 3	Табельный номер 3	2025-03-03 00:00:00	RFID метка сварщика 3	3a6cbac6-815c-4743-a779-a33e3d0a15b6
afbd68e1-4b9c-484f-9994-e91235e6607a	Имя 5	Отчество 4	Фамилия 4	Email@email.com	Email@email.com	$MYHASH$V1$10000$U6VKlZQKjq/27z699UaVCXMZEN4mTGkwxIkzX0pkTQY10FN1	\N	\N	\N	\N	\N
04ac5b96-91eb-487e-b9ef-c7f57a1fc3e9	string	string	string	string	user@example.com	$MYHASH$V1$10000$5PGLK3bEt+sLjHmMbz+o9NeAgxMxWh1gRtizgLa7uPZYO1MT	\N	\N	\N	\N	\N
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "CalendarId", "WeldingEquipmentId") FROM stdin;
263e71ff-d1f6-4817-8cdb-021b96210341	7dcf0b34-ceed-4090-bfd5-43ede3974a51	a380a584-77f0-4c70-aa79-ad1aba932336	\N	e80338d0-36c3-428d-939e-da0c3a768c3c
73be6fd6-6acc-4653-a98a-baa25953e401	fa101dee-a53d-4a60-8959-f7132e757441	\N	\N	82081de0-ff1e-44b2-bbda-b234c04fb319
905ee275-e72d-4f96-8d89-34c459dc24e8	24539179-8b94-42b1-8f42-3d02802c953a	f7d06ae1-fd8f-45de-b7c6-5cb7e9a4da8f	\N	7ca45df6-bcd9-404f-b4d0-61198c183fe4
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "DowntimeReason", "ChangeConditionTime", "Time") FROM stdin;
7770272f-cced-4e8c-872f-5b506c97f979	4	Какая-то причина простоя 2	19:30:00	10
ef61453d-5b41-4c75-a6d1-db18ab5a0b29	4	Какая-то причина простоя	09:30:00	30
946ad240-0e42-4999-9310-e7f662907ceb	3	\N	\N	30
b7ec0659-e0bb-4088-9e6e-40e8cbb61635	3	\N	\N	60
bcbd2d1e-897c-4e89-b100-6a0de6b531ff	3	\N	\N	60
6002d718-f15c-4227-a686-6af69fbf26c3	3	\N	\N	60
cc850a5c-3903-4718-b81d-3836f98f0b3f	4	Какая-то причина простоя 3	12:50:00	60
\.


--
-- Data for Name: WeldingEquipmentWorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkingShifts" ("WeldingEquipmentId", "WorkingShiftId", "WeldingEquipmentConditionTimeId") FROM stdin;
e80338d0-36c3-428d-939e-da0c3a768c3c	cde5583d-902c-4e6a-84f9-33e928199b5c	7770272f-cced-4e8c-872f-5b506c97f979
e80338d0-36c3-428d-939e-da0c3a768c3c	da866954-13b5-4e3a-ae21-b8964fec4e44	ef61453d-5b41-4c75-a6d1-db18ab5a0b29
e80338d0-36c3-428d-939e-da0c3a768c3c	de12735a-e5a0-47c5-af67-ec2087366aff	946ad240-0e42-4999-9310-e7f662907ceb
e80338d0-36c3-428d-939e-da0c3a768c3c	da866954-13b5-4e3a-ae21-b8964fec4e44	b7ec0659-e0bb-4088-9e6e-40e8cbb61635
7ca45df6-bcd9-404f-b4d0-61198c183fe4	da866954-13b5-4e3a-ae21-b8964fec4e44	bcbd2d1e-897c-4e89-b100-6a0de6b531ff
82081de0-ff1e-44b2-bbda-b234c04fb319	da866954-13b5-4e3a-ae21-b8964fec4e44	6002d718-f15c-4227-a686-6af69fbf26c3
82081de0-ff1e-44b2-bbda-b234c04fb319	de12735a-e5a0-47c5-af67-ec2087366aff	cc850a5c-3903-4718-b81d-3836f98f0b3f
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PostId", "CalendarId", "MasterId", "WelderId") FROM stdin;
7ca45df6-bcd9-404f-b4d0-61198c183fe4	RFID метка 2	Какое-то оборудование 2	Маркировка 2	22	2021-02-23 00:00:00	1	20	30	40	3	Изготовитель 2	2023-02-05 00:00:00	Способ сварки 2	12.3	5.5	10.9	6.1	7.9	5f16e5ed-020d-49a5-8d06-f69080b1ba84	\N	\N	905ee275-e72d-4f96-8d89-34c459dc24e8
e80338d0-36c3-428d-939e-da0c3a768c3c	RFID метка 1	Какое-то оборудование 1	Маркировка 1	12	2020-01-23 00:00:00	2	20	30	40	3	Изготовитель 1	2023-02-05 00:00:00	Способ сварки 1	12.3	5.5	10.9	6.1	7.9	5f16e5ed-020d-49a5-8d06-f69080b1ba84	\N	\N	263e71ff-d1f6-4817-8cdb-021b96210341
82081de0-ff1e-44b2-bbda-b234c04fb319	RFID метка 3	Какое-то оборудование 3	Маркировка 3	32	2022-02-23 00:00:00	3	20	30	40	3	Изготовитель 3	2024-02-05 00:00:00	Способ сварки 3	12.3	5.5	10.9	6.1	7.9	\N	\N	\N	73be6fd6-6acc-4653-a98a-baa25953e401
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WelderId", "MasterId", "InspectorId", "WeldingDate", "WeldingStartTime", "WeldingEndTime", "AmbientTemperature", "AirHumidity", "InterlayerTemperature", "CurrentLayerNumber", "PreheatingTemperature", "Status", "DefectReasons", "DefectsDetected", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "ProductId", "KnotId", "DetailId", "TechnologicalProcessInstructionId") FROM stdin;
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "DayId") FROM stdin;
da866954-13b5-4e3a-ae21-b8964fec4e44	1	08:00:00	12:00:00	fde4dec2-a4a5-4ad8-874f-ab5962b221b9
de12735a-e5a0-47c5-af67-ec2087366aff	2	12:30:00	16:00:00	fde4dec2-a4a5-4ad8-874f-ab5962b221b9
cde5583d-902c-4e6a-84f9-33e928199b5c	3	16:30:00	20:00:00	fde4dec2-a4a5-4ad8-874f-ab5962b221b9
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId") FROM stdin;
54a3966c-2a73-4d9b-9bdb-15f784f8207e	2	\N	69fb27a7-6670-4859-a565-3f0f74c54a03
f7d06ae1-fd8f-45de-b7c6-5cb7e9a4da8f	1	\N	b0dd7364-bbf0-43a3-8c00-ce7b59de2ba8
a380a584-77f0-4c70-aa79-ad1aba932336	3	\N	3a6cbac6-815c-4743-a779-a33e3d0a15b6
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name") FROM stdin;
f438de03-aff5-4a7e-bde5-95a7c1f2f116	Цех
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
-- Name: Detail PK_Detail; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Detail"
    ADD CONSTRAINT "PK_Detail" PRIMARY KEY ("Id");


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
-- Name: Knot PK_Knot; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Knot"
    ADD CONSTRAINT "PK_Knot" PRIMARY KEY ("Id");


--
-- Name: Layers PK_Layers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Layers"
    ADD CONSTRAINT "PK_Layers" PRIMARY KEY ("Id");


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
-- Name: Product PK_Product; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "PK_Product" PRIMARY KEY ("Id");


--
-- Name: ProductionAreas PK_ProductionAreas; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductionAreas"
    ADD CONSTRAINT "PK_ProductionAreas" PRIMARY KEY ("Id");


--
-- Name: Roles PK_Roles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_Roles" PRIMARY KEY ("Id");


--
-- Name: Seam PK_Seam; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seam"
    ADD CONSTRAINT "PK_Seam" PRIMARY KEY ("Id");


--
-- Name: TechnologicalProcessInstructions PK_TechnologicalProcessInstructions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TechnologicalProcessInstructions"
    ADD CONSTRAINT "PK_TechnologicalProcessInstructions" PRIMARY KEY ("Id");


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
-- Name: IX_Detail_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Detail_WeldingTaskId" ON public."Detail" USING btree ("WeldingTaskId");


--
-- Name: IX_EventLogs_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_EventLogs_UserId" ON public."EventLogs" USING btree ("UserId");


--
-- Name: IX_Inspectors_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Inspectors_UserId" ON public."Inspectors" USING btree ("UserId");


--
-- Name: IX_Knot_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Knot_WeldingTaskId" ON public."Knot" USING btree ("WeldingTaskId");


--
-- Name: IX_Layers_TechnologicalProcessInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Layers_TechnologicalProcessInstructionId" ON public."Layers" USING btree ("TechnologicalProcessInstructionId");


--
-- Name: IX_Masters_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Masters_UserId" ON public."Masters" USING btree ("UserId");


--
-- Name: IX_Masters_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Masters_WeldingEquipmentId" ON public."Masters" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_Product_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Product_WeldingTaskId" ON public."Product" USING btree ("WeldingTaskId");


--
-- Name: IX_ProductionAreas_WorkshopId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductionAreas_WorkshopId" ON public."ProductionAreas" USING btree ("WorkshopId");


--
-- Name: IX_Seam_WeldingTaskId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Seam_WeldingTaskId" ON public."Seam" USING btree ("WeldingTaskId");


--
-- Name: IX_UserRoles_UserId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_UserRoles_UserId" ON public."UserRoles" USING btree ("UserId");


--
-- Name: IX_Users_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Users_ProductionAreaId" ON public."Users" USING btree ("ProductionAreaId");


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

CREATE INDEX "IX_Welders_WeldingEquipmentId" ON public."Welders" USING btree ("WeldingEquipmentId");


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

CREATE INDEX "IX_WeldingEquipments_MasterId" ON public."WeldingEquipments" USING btree ("MasterId");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingEquipments_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_WelderId" ON public."WeldingEquipments" USING btree ("WelderId");


--
-- Name: IX_WeldingTasks_DetailId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_DetailId" ON public."WeldingTasks" USING btree ("DetailId");


--
-- Name: IX_WeldingTasks_InspectorId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_InspectorId" ON public."WeldingTasks" USING btree ("InspectorId");


--
-- Name: IX_WeldingTasks_KnotId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_KnotId" ON public."WeldingTasks" USING btree ("KnotId");


--
-- Name: IX_WeldingTasks_MasterId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_MasterId" ON public."WeldingTasks" USING btree ("MasterId");


--
-- Name: IX_WeldingTasks_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_ProductId" ON public."WeldingTasks" USING btree ("ProductId");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


--
-- Name: IX_WeldingTasks_TechnologicalProcessInstructionId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_TechnologicalProcessInstructionId" ON public."WeldingTasks" USING btree ("TechnologicalProcessInstructionId");


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
-- Name: Detail FK_Detail_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Detail"
    ADD CONSTRAINT "FK_Detail_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id") ON DELETE RESTRICT;


--
-- Name: EventLogs FK_EventLogs_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EventLogs"
    ADD CONSTRAINT "FK_EventLogs_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE RESTRICT;


--
-- Name: Inspectors FK_Inspectors_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Inspectors"
    ADD CONSTRAINT "FK_Inspectors_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Knot FK_Knot_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Knot"
    ADD CONSTRAINT "FK_Knot_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id") ON DELETE RESTRICT;


--
-- Name: Layers FK_Layers_TechnologicalProcessInstructions_TechnologicalProces~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Layers"
    ADD CONSTRAINT "FK_Layers_TechnologicalProcessInstructions_TechnologicalProces~" FOREIGN KEY ("TechnologicalProcessInstructionId") REFERENCES public."TechnologicalProcessInstructions"("Id") ON DELETE CASCADE;


--
-- Name: Masters FK_Masters_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Masters"
    ADD CONSTRAINT "FK_Masters_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Masters FK_Masters_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Masters"
    ADD CONSTRAINT "FK_Masters_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id") ON DELETE RESTRICT;


--
-- Name: Posts FK_Posts_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "FK_Posts_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE CASCADE;


--
-- Name: Product FK_Product_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "FK_Product_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id") ON DELETE RESTRICT;


--
-- Name: ProductionAreas FK_ProductionAreas_Workshops_WorkshopId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductionAreas"
    ADD CONSTRAINT "FK_ProductionAreas_Workshops_WorkshopId" FOREIGN KEY ("WorkshopId") REFERENCES public."Workshops"("Id") ON DELETE CASCADE;


--
-- Name: Seam FK_Seam_WeldingTasks_WeldingTaskId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Seam"
    ADD CONSTRAINT "FK_Seam_WeldingTasks_WeldingTaskId" FOREIGN KEY ("WeldingTaskId") REFERENCES public."WeldingTasks"("Id") ON DELETE RESTRICT;


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
    ADD CONSTRAINT "FK_Users_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE RESTRICT;


--
-- Name: Welders FK_Welders_Calendars_CalendarId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id") ON DELETE RESTRICT;


--
-- Name: Welders FK_Welders_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- Name: Welders FK_Welders_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id") ON DELETE RESTRICT;


--
-- Name: Welders FK_Welders_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Welders"
    ADD CONSTRAINT "FK_Welders_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id") ON DELETE RESTRICT;


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
    ADD CONSTRAINT "FK_WeldingEquipments_Calendars_CalendarId" FOREIGN KEY ("CalendarId") REFERENCES public."Calendars"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingEquipments FK_WeldingEquipments_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingEquipments FK_WeldingEquipments_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingTasks FK_WeldingTasks_Detail_DetailId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Detail_DetailId" FOREIGN KEY ("DetailId") REFERENCES public."Detail"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingTasks FK_WeldingTasks_Inspectors_InspectorId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Inspectors_InspectorId" FOREIGN KEY ("InspectorId") REFERENCES public."Inspectors"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_Knot_KnotId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Knot_KnotId" FOREIGN KEY ("KnotId") REFERENCES public."Knot"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingTasks FK_WeldingTasks_Masters_MasterId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_Product_ProductId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES public."Product"("Id") ON DELETE RESTRICT;


--
-- Name: WeldingTasks FK_WeldingTasks_Seam_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seam_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seam"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_TechnologicalProcessInstructions_Technological~; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_TechnologicalProcessInstructions_Technological~" FOREIGN KEY ("TechnologicalProcessInstructionId") REFERENCES public."TechnologicalProcessInstructions"("Id") ON DELETE CASCADE;


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
    ADD CONSTRAINT "FK_Workplaces_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id") ON DELETE RESTRICT;


--
-- Name: Workplaces FK_Workplaces_ProductionAreas_ProductionAreaId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Workplaces"
    ADD CONSTRAINT "FK_Workplaces_ProductionAreas_ProductionAreaId" FOREIGN KEY ("ProductionAreaId") REFERENCES public."ProductionAreas"("Id") ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

