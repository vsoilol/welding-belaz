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
    "ProductionAreaId" uuid,
    "IdFromSystem" text,
    "RfidTag" text
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
    "Time" double precision NOT NULL,
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
    "IdFromSystem" text,
    "RfidTag" text
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
    "MasterId" uuid,
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
66b4fcc8-efcc-4ca7-a07a-f423d045fd5c	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
ccc702f0-51fd-424b-babd-5f2efbd59a02	f0f1dd61-0235-48a0-90fc-35bb6319323c	a968ed54-a55b-4481-bda2-1a81f5909013	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
6423696d-e4cb-46a4-af8c-bb2533664725	1	10	t	66b4fcc8-efcc-4ca7-a07a-f423d045fd5c	\N
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
11567cf2-cd04-4e91-8ca6-132e0307ec2e	Обед	\N
1452dd05-2840-4278-8e6f-93bc11d41b6c	Неявка оператора (б/лист, отпуск, и пр.)	\N
3153b2c2-7830-4888-88b3-293c01da299d	Работа с управляющей программой	\N
35a64f03-1f7f-4e93-9b47-8b03027d66f1	Отсутствие энергоносителей	\N
35e1baa4-8143-41cb-9b10-b82d980ec14f	Отсутствие сотрудника ОТК	\N
35f22132-62aa-4f24-bdd2-d5a4fb24a4c9	Праздники и выходные	\N
3d226e24-bcec-4fe0-8876-cebf1dab82ac	Изменение режимов, смена инструмента, приспособления	\N
493fe4d8-5a58-42a5-b3c5-b5d7bc08d0b3	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
4a3c2efc-e2db-4781-bddd-cfddb4ca5a0a	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
4be091a6-b7d0-4eda-9b4d-07ac0bbf11ac	Сборочные операции	\N
546ff468-1e6c-4f22-977d-8212f742da83	Отсутствие материала, заготовок, деталей	\N
6202a96b-6919-457b-a4ee-4d05fb0bceff	Ознакомление с работой, документацией, инструктаж	\N
7d9b318b-a50a-4606-8529-782f48e1152d	Отсутствие конструктора, технолога или ожидание его решения	\N
8cbb8ab4-76e0-41e6-8401-17eb3ed2c423	Нерабочее время по графику согласно сменности	\N
8f91ebf6-107e-4be4-b66f-5206f70aaf87	Установка, выверка, снятие детали	\N
92906a9a-764c-43f1-96d1-18032153a214	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
941ce36c-19f6-45c0-aa88-386f3ac65ca4	Отсутствие оператора в связи с необеспеченностью	\N
c4c18808-4211-4409-8bcc-064b11035fd2	Установка, выверка, снятие детали	\N
cc260261-d60e-4ea2-a86c-8c51280ad5cb	Отсутствие крана, транспорта	\N
d4cbb1c7-a51e-4220-9ac2-1372c20a1961	Аварийный ремонт централизованными службами	\N
d5fb1895-a323-4ace-8807-c05eeba86676	Плановый ремонт централизованными службами	\N
d86fd5c6-1e24-4946-ad98-70888da06412	Работа по карте несоответствий	\N
e2dce6f5-d39e-4bc0-add0-a90acd5bc3f3	Контроль на рабочем месте	\N
e8a3141d-15e7-45fe-aead-ebbd68e92901	Отсутствие заданий	\N
f8929078-e758-42e0-8814-b7156787a4fa	Естественные надобности	\N
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
4e51bb84-8080-487e-8fc5-65fb26793774	e1d1df32-89c6-4f53-97af-12a16dee378d	249550
ceed41bb-9a39-465f-b196-fe2ccb266393	5b812036-9e0f-4376-a2ae-2854d7cce5be	219379
3a84369c-c0ea-4b01-8e41-ae8b5310e5e5	c1ebf8ed-3350-424f-b66f-07b594573b17	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
41858470-6bbf-47f1-9a37-6a071033cf38	fdc99a67-e252-48dc-ab43-07fdc94fedda	614962
d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	7f1d8dd5-6649-48da-8657-87fb2cde3739	610422
35f98e27-dbb3-4155-831e-43a7211c47a7	6f2631c7-1a29-47be-9d71-9f6ac6ce742d	\N
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
1e91f7ef-29df-4a0b-90c5-0f35800b5fda	5f8a0d82-9648-4b94-9b9b-60888960210c
922415ed-0a30-4715-a1b2-c516a7306b8f	5f8a0d82-9648-4b94-9b9b-60888960210c
c9006ce7-51a1-45d9-857f-fb00b95f98bf	5f8a0d82-9648-4b94-9b9b-60888960210c
e7fd7a7a-089e-4bbf-9018-4ffd11db0187	5f8a0d82-9648-4b94-9b9b-60888960210c
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
1e91f7ef-29df-4a0b-90c5-0f35800b5fda	2	2	2023-03-12 00:00:00	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	\N
922415ed-0a30-4715-a1b2-c516a7306b8f	3	2	2023-03-12 00:00:00	7e8c5fe8-431e-497b-9b13-2da25d6e5158	\N
c9006ce7-51a1-45d9-857f-fb00b95f98bf	4	2	2023-03-12 00:00:00	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	\N
e7fd7a7a-089e-4bbf-9018-4ffd11db0187	1	2	2023-03-12 00:00:00	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
645e14f9-fa85-4f89-b5bc-bea4bc2936f2	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb
c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	7e8c5fe8-431e-497b-9b13-2da25d6e5158
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
083503cd-8268-4b1c-bd67-98cf4a5176bd	0	2	\N	\N	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
1c906cf5-fa31-47fc-aeb9-132b822fc4d0	0	3	\N	\N	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
295e812a-c0b9-4578-8cc0-37499ffee346	0	3	\N	\N	922415ed-0a30-4715-a1b2-c516a7306b8f	\N
2ef67abc-d6f9-4f9c-b832-04f0d0d73300	0	3	\N	\N	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
30a50baa-40aa-4359-bd42-5d62416ee16d	0	1	\N	\N	922415ed-0a30-4715-a1b2-c516a7306b8f	\N
42502056-06e8-43e3-ad1f-4998a9a855b5	0	1	\N	\N	1e91f7ef-29df-4a0b-90c5-0f35800b5fda	\N
61b9b7a7-e2be-47ba-9c47-89f494aefff3	0	2	\N	\N	1e91f7ef-29df-4a0b-90c5-0f35800b5fda	\N
7936d091-b8c7-4d25-897a-af78012aee8d	0	2	\N	\N	922415ed-0a30-4715-a1b2-c516a7306b8f	\N
7d70ab8f-bb3a-437f-ab46-49f5e47bc824	0	3	\N	\N	1e91f7ef-29df-4a0b-90c5-0f35800b5fda	\N
97403853-363d-4885-a77f-d6d80c86faed	0	2	\N	\N	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
c03ecd79-5bba-493d-b2d4-a5670fa29141	0	1	\N	\N	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
c0dff7ba-47fb-4f8a-91ec-3fd1e5ffd7ed	0	1	\N	\N	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
57f33be5-0220-4e06-b57c-b674c26ff068	Сборка, сварка рам к/с г/п 120-130 т.	6	a968ed54-a55b-4481-bda2-1a81f5909013	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
645e14f9-fa85-4f89-b5bc-bea4bc2936f2	Рама	7513D-2800010-20	t	1	99fc55a8-e7f7-4d70-9772-f4b205503134	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	4536492774
6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	Поперечина рамы задняя	75131-2801300-20	t	2	99fc55a8-e7f7-4d70-9772-f4b205503134	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
7e8c5fe8-431e-497b-9b13-2da25d6e5158	Поперечина рамы задняя	75131-2801300-20	t	2	ce4d451a-35de-4a97-99c9-185b56d09d85	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	\N
c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	Рама	75131-2800010-70	t	1	ce4d451a-35de-4a97-99c9-185b56d09d85	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N	\N	4536479362
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
c1a705d3-e16e-49d2-bf1a-c5d0adc04e25	Admin	\N
d60cb7c9-37bb-480d-b705-5004895b9abe	Master	\N
511a8ec2-5758-40fc-b2a4-13e3873fedc3	Welder	\N
279f589c-7870-4c06-a6bc-30e2f46aba75	Inspector	\N
e3670749-108c-4d2a-bd33-0ea49bb0bf93	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
091df164-48ab-4961-a22b-1d872a61daac	2023-03-12 00:00:00	03876726-8de8-486d-a01b-50b644cc76f1	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
3279dffd-84e0-4756-b9e0-6a87e025edbc	2023-03-12 00:00:00	dfbf3824-def3-485b-b5af-66c0fcd1adca	922415ed-0a30-4715-a1b2-c516a7306b8f	\N
36828ae2-0410-4279-b1bb-67f512a24210	2023-03-12 00:00:00	b04049d0-5026-4014-bd26-e61dbd0bda14	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
398fcdf3-d382-4ba3-92ab-395b3135ccf1	2023-03-12 00:00:00	05d627b6-e193-4251-88b9-635cba1b9370	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
3f9e0cbe-4b89-42bf-923f-89526cbd682f	2023-03-12 00:00:00	d8955c29-4257-4705-afc3-552316d0e8bf	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
44d749e4-1554-478f-87df-e31d0bee3af2	2023-03-12 00:00:00	dc631901-db09-4add-9e04-3e5e006c2271	1e91f7ef-29df-4a0b-90c5-0f35800b5fda	\N
572e451f-944a-46d4-91c9-c1b05645ff82	2023-03-12 00:00:00	f43dc5cf-191d-4ba5-ab5f-5865f73589e0	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
722650c1-d999-492f-a795-6692f0878f5d	2023-03-12 00:00:00	3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1	922415ed-0a30-4715-a1b2-c516a7306b8f	\N
77f692ec-1e8d-4dfc-b25c-b4c66fc59404	2023-03-12 00:00:00	c4309e97-a1e8-49de-b124-c1aa1e89de8a	922415ed-0a30-4715-a1b2-c516a7306b8f	\N
7f92d503-300d-42f7-99aa-092c1d36d969	2023-03-12 00:00:00	a3b759d7-555a-41ea-93bf-2d9c7ce48371	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
8da2e1da-2b5d-41db-98a0-675e9ae8b816	2023-03-12 00:00:00	7d83ba4e-5b00-4935-baf1-df3ad86b15c8	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
8f448239-2ab1-4276-a3f5-a605d95625e4	2023-03-12 00:00:00	6eb38dfc-df1a-42c4-8b12-f9956cad632e	1e91f7ef-29df-4a0b-90c5-0f35800b5fda	\N
8f48b662-76ae-4d35-9d6e-05eaf954e83d	2023-03-12 00:00:00	c07e6c99-6ab0-4e57-8ea3-53bb68ffa507	1e91f7ef-29df-4a0b-90c5-0f35800b5fda	\N
a4c0bc87-26fd-45fe-a135-1169702387c0	2023-03-12 00:00:00	3af46b20-224a-4f72-97b6-5297d2b75bf5	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
acae688f-3fc8-47e7-8396-5dfaa74ae6b3	2023-03-12 00:00:00	b275eb65-ca76-4272-9662-d9b92e109177	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e	2023-03-12 00:00:00	ace294ec-b133-4fcb-aca8-7bdefef745f1	e7fd7a7a-089e-4bbf-9018-4ffd11db0187	\N
e1ad50e6-3cce-498a-9c30-a125df2783ae	2023-03-12 00:00:00	1b6a85ad-6da0-4269-a86f-180ec363cb9e	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
ea2dbfaf-a88b-4646-9444-f29592c84871	2023-03-12 00:00:00	b7703aeb-535a-4be2-a171-b71fbe3cec42	c9006ce7-51a1-45d9-857f-fb00b95f98bf	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
02fcb317-14de-41da-9a34-c5fe7e2b7f50	0	1	\N	\N	398fcdf3-d382-4ba3-92ab-395b3135ccf1	\N
046c3e3c-7f85-43dd-8601-b04e42909d58	0	2	\N	\N	ea2dbfaf-a88b-4646-9444-f29592c84871	\N
0b087319-87ab-4384-9819-2d296f72d8b9	0	2	\N	\N	8f48b662-76ae-4d35-9d6e-05eaf954e83d	\N
0d181a76-527b-4a4f-ae82-fe8b9c9ed647	0	1	\N	\N	c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e	\N
0fd3abad-75d0-478b-853a-50d68bd9a995	0	1	\N	\N	e1ad50e6-3cce-498a-9c30-a125df2783ae	\N
16c16cce-8ae2-446f-a89f-887ddd47c8f3	0	2	\N	\N	44d749e4-1554-478f-87df-e31d0bee3af2	\N
1731c4e0-9a2a-4b95-9ec8-dac6b4a03cdf	0	2	\N	\N	3279dffd-84e0-4756-b9e0-6a87e025edbc	\N
1c4fcbd2-e497-42cb-8c26-9b918f803f76	0	2	\N	\N	398fcdf3-d382-4ba3-92ab-395b3135ccf1	\N
20d34612-b9f6-4c67-9507-c5143b28fcdd	0	1	\N	\N	a4c0bc87-26fd-45fe-a135-1169702387c0	\N
2291f58b-b6b7-40bf-aa74-3b635e9c7b3c	0	1	\N	\N	acae688f-3fc8-47e7-8396-5dfaa74ae6b3	\N
23771ae3-3ab7-4754-bc30-9476071e92ae	0	3	\N	\N	3f9e0cbe-4b89-42bf-923f-89526cbd682f	\N
29f78160-767e-4272-beb8-ef8284a6b716	0	3	\N	\N	acae688f-3fc8-47e7-8396-5dfaa74ae6b3	\N
2eb633e9-83f9-4d0e-87e7-d33b84fe2ded	0	2	\N	\N	8da2e1da-2b5d-41db-98a0-675e9ae8b816	\N
368ec6c0-9a96-4e75-b029-7b9af043f501	0	1	\N	\N	ea2dbfaf-a88b-4646-9444-f29592c84871	\N
37f104cf-5c21-4fda-a882-b94ba6794e76	0	3	\N	\N	8da2e1da-2b5d-41db-98a0-675e9ae8b816	\N
43ad0214-ea37-457c-a46d-3505dad45a6f	0	1	\N	\N	7f92d503-300d-42f7-99aa-092c1d36d969	\N
4a06bc38-5fb7-4405-a331-35fd75ff98ca	0	1	\N	\N	44d749e4-1554-478f-87df-e31d0bee3af2	\N
5624088d-acc9-4e40-a68f-9168e337a5b8	0	1	\N	\N	36828ae2-0410-4279-b1bb-67f512a24210	\N
58b96bd4-6eda-4719-aadb-0377c82137a6	0	1	\N	\N	091df164-48ab-4961-a22b-1d872a61daac	\N
7090164d-82f5-44df-8429-4b981f3a060f	0	2	\N	\N	091df164-48ab-4961-a22b-1d872a61daac	\N
7612ba9f-7916-4591-81f3-c87e5cc42de1	0	3	\N	\N	77f692ec-1e8d-4dfc-b25c-b4c66fc59404	\N
771c9929-7a2b-488e-824b-d45fc06b4504	0	2	\N	\N	8f448239-2ab1-4276-a3f5-a605d95625e4	\N
7fd46f47-70a1-4dde-811b-d0dfabd7a5fd	0	2	\N	\N	acae688f-3fc8-47e7-8396-5dfaa74ae6b3	\N
80c6080e-9ee0-4e70-bc8d-d7255a09644f	0	2	\N	\N	3f9e0cbe-4b89-42bf-923f-89526cbd682f	\N
88882ba9-06ab-4110-b608-a7fefcd9a715	0	2	\N	\N	a4c0bc87-26fd-45fe-a135-1169702387c0	\N
8907611d-1cbc-4240-9751-4bfdb9bac019	0	3	\N	\N	a4c0bc87-26fd-45fe-a135-1169702387c0	\N
8afa9d8e-e0b4-48c1-8c39-308b017b33c1	0	2	\N	\N	722650c1-d999-492f-a795-6692f0878f5d	\N
8bf9175b-ba47-49d9-87e9-82204dedb215	0	3	\N	\N	36828ae2-0410-4279-b1bb-67f512a24210	\N
92024960-1a7a-4302-bf8e-6ec4317a6ba8	0	3	\N	\N	ea2dbfaf-a88b-4646-9444-f29592c84871	\N
9500195d-9958-4ee8-b919-6481321c79c7	0	2	\N	\N	c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e	\N
96dcac81-924e-4aba-ad9c-aeb7884f3597	0	3	\N	\N	7f92d503-300d-42f7-99aa-092c1d36d969	\N
9f1c8006-7791-4cc4-b4f5-ec0372d8ea8e	0	3	\N	\N	8f448239-2ab1-4276-a3f5-a605d95625e4	\N
9f669316-94ae-41e6-a4a0-e0628a3dd195	0	3	\N	\N	722650c1-d999-492f-a795-6692f0878f5d	\N
a08f3341-1b6a-45bc-865f-8fe3b4a3cb5a	0	1	\N	\N	722650c1-d999-492f-a795-6692f0878f5d	\N
a2a066c1-abfc-43b3-8b4d-42fcf4de3f06	0	1	\N	\N	3279dffd-84e0-4756-b9e0-6a87e025edbc	\N
aa7a096b-f411-4cd7-8146-b4abf4408949	0	2	\N	\N	572e451f-944a-46d4-91c9-c1b05645ff82	\N
ac542d14-0162-4e69-a8f5-d8cc0343c6ab	0	3	\N	\N	44d749e4-1554-478f-87df-e31d0bee3af2	\N
b4c2a187-8048-47ad-8cad-6f2dbc00712b	0	2	\N	\N	77f692ec-1e8d-4dfc-b25c-b4c66fc59404	\N
bf2238ca-ef98-45fb-92cf-59b127a60d95	0	1	\N	\N	3f9e0cbe-4b89-42bf-923f-89526cbd682f	\N
c38c15da-af09-49cc-941f-8b104ead8818	0	2	\N	\N	7f92d503-300d-42f7-99aa-092c1d36d969	\N
c825e763-f46c-4431-96a7-9e355f5a5d98	0	3	\N	\N	572e451f-944a-46d4-91c9-c1b05645ff82	\N
cb4884a4-4ae0-4ea8-a9df-6f8285a8ff72	0	1	\N	\N	77f692ec-1e8d-4dfc-b25c-b4c66fc59404	\N
cc65bc34-0a9a-4b94-a008-8aefc98ca135	0	3	\N	\N	091df164-48ab-4961-a22b-1d872a61daac	\N
ccfc3132-a911-4576-a547-4696a313b84e	0	1	\N	\N	8f48b662-76ae-4d35-9d6e-05eaf954e83d	\N
df46e4e9-7d2d-408e-afeb-95b2a035b922	0	3	\N	\N	398fcdf3-d382-4ba3-92ab-395b3135ccf1	\N
e54e5d04-ae7c-4112-a653-1730630510fb	0	3	\N	\N	8f48b662-76ae-4d35-9d6e-05eaf954e83d	\N
ea7d9713-4650-4f44-96ff-72122775942e	0	3	\N	\N	e1ad50e6-3cce-498a-9c30-a125df2783ae	\N
ecd18312-65f1-4047-8cd2-5d8cf2a53c83	0	3	\N	\N	3279dffd-84e0-4756-b9e0-6a87e025edbc	\N
f39b468c-251e-48c3-9292-40395a349341	0	3	\N	\N	c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e	\N
f3e0b1a3-8d04-482e-8971-1c4b8e752df1	0	1	\N	\N	8da2e1da-2b5d-41db-98a0-675e9ae8b816	\N
f46b1555-5786-4069-a165-61c92545f90f	0	2	\N	\N	e1ad50e6-3cce-498a-9c30-a125df2783ae	\N
f769fbd0-38ec-48d7-a684-ff21dbae16ab	0	1	\N	\N	8f448239-2ab1-4276-a3f5-a605d95625e4	\N
fcea9b6e-c835-4733-ac64-3547dea0fa40	0	1	\N	\N	572e451f-944a-46d4-91c9-c1b05645ff82	\N
ff35c0da-3691-42b1-940f-0f1fe4877c80	0	2	\N	\N	36828ae2-0410-4279-b1bb-67f512a24210	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
03876726-8de8-486d-a01b-50b644cc76f1	18	4000	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	8fd0d98d-6868-4412-9a66-78839fa644f1	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
05d627b6-e193-4251-88b9-635cba1b9370	57	400	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
1b6a85ad-6da0-4269-a86f-180ec363cb9e	54	400	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
3af46b20-224a-4f72-97b6-5297d2b75bf5	55	400	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1	52	1200	t	f	7e8c5fe8-431e-497b-9b13-2da25d6e5158	9398fa25-e906-406e-8e09-beb60975f75b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
6eb38dfc-df1a-42c4-8b12-f9956cad632e	52	1200	t	f	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	9398fa25-e906-406e-8e09-beb60975f75b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
7d83ba4e-5b00-4935-baf1-df3ad86b15c8	57	400	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
a3b759d7-555a-41ea-93bf-2d9c7ce48371	58	900	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
ace294ec-b133-4fcb-aca8-7bdefef745f1	54	400	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
b04049d0-5026-4014-bd26-e61dbd0bda14	58	900	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
b275eb65-ca76-4272-9662-d9b92e109177	39	280	t	f	645e14f9-fa85-4f89-b5bc-bea4bc2936f2	4b73a99f-0fb7-49fc-b930-521e67691895	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
b7703aeb-535a-4be2-a171-b71fbe3cec42	39	280	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	4b73a99f-0fb7-49fc-b930-521e67691895	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
c07e6c99-6ab0-4e57-8ea3-53bb68ffa507	1	1900	t	f	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
c4309e97-a1e8-49de-b124-c1aa1e89de8a	1	1900	t	f	7e8c5fe8-431e-497b-9b13-2da25d6e5158	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
d8955c29-4257-4705-afc3-552316d0e8bf	55	400	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
dc631901-db09-4add-9e04-3e5e006c2271	2	1880	t	f	6fb8852a-a4cd-4df7-8f9d-2294ae6990cb	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
dfbf3824-def3-485b-b5af-66c0fcd1adca	2	1880	t	f	7e8c5fe8-431e-497b-9b13-2da25d6e5158	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
f43dc5cf-191d-4ba5-ab5f-5865f73589e0	18	4000	t	f	c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46	8fd0d98d-6868-4412-9a66-78839fa644f1	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
09c84b21-5f0c-4fae-9dac-ceb5abc1917e	2	Инструкция 2	2
26693f0d-6c87-4210-8bb3-cee7fd394a08	48	Инструкция 48	48
3fb871cf-9101-4eee-8ee8-cb1c6c03978c	54	Инструкция 54	54
4b73a99f-0fb7-49fc-b930-521e67691895	39	Инструкция 39	39
7ea73afd-78ac-4b39-ba12-a6816a764ec8	1	Инструкция 1	1
8fd0d98d-6868-4412-9a66-78839fa644f1	18	Инструкция 18	18
9398fa25-e906-406e-8e09-beb60975f75b	52	Инструкция 52	52
aff9dccb-145d-4e42-8c34-8bb5579f522b	55	Инструкция 55	55
c050ab9a-1195-42f5-a27d-343d2d8d8c4d	56	Инструкция 56	56
d6068081-5eac-49bb-b6be-30f3aa5febf4	58	Инструкция 58	58
ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	57	Инструкция 57	57
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
05fb5b9e-115d-4afd-be72-ddc178b0194c	75131-2801300-20	Поперечина рамы задняя	\N	2868425
99fc55a8-e7f7-4d70-9772-f4b205503134	7513D-2800010-20	Рама	\N	3330041
ce4d451a-35de-4a97-99c9-185b56d09d85	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
5b812036-9e0f-4376-a2ae-2854d7cce5be	279f589c-7870-4c06-a6bc-30e2f46aba75
e1d1df32-89c6-4f53-97af-12a16dee378d	279f589c-7870-4c06-a6bc-30e2f46aba75
7f1d8dd5-6649-48da-8657-87fb2cde3739	d60cb7c9-37bb-480d-b705-5004895b9abe
fdc99a67-e252-48dc-ab43-07fdc94fedda	d60cb7c9-37bb-480d-b705-5004895b9abe
028b5ac3-8122-41fe-bbbc-36b056ca9fd8	511a8ec2-5758-40fc-b2a4-13e3873fedc3
29a5eb5c-478d-4156-ad77-46cdb5779b61	511a8ec2-5758-40fc-b2a4-13e3873fedc3
4aae0c43-0edf-4e49-87db-043bbec1ebc5	511a8ec2-5758-40fc-b2a4-13e3873fedc3
4de2c415-5229-442a-bf81-62c543f67446	511a8ec2-5758-40fc-b2a4-13e3873fedc3
5e9706ed-9a44-455b-b599-230e5822df9f	511a8ec2-5758-40fc-b2a4-13e3873fedc3
90c5adb1-c374-4a62-ac69-5e37fd2bb06a	511a8ec2-5758-40fc-b2a4-13e3873fedc3
9b5f302b-f6ce-40e6-a294-5cef58bef456	511a8ec2-5758-40fc-b2a4-13e3873fedc3
a056ae81-9750-46e8-a1f0-6f85e6845015	511a8ec2-5758-40fc-b2a4-13e3873fedc3
f0f1dd61-0235-48a0-90fc-35bb6319323c	e3670749-108c-4d2a-bd33-0ea49bb0bf93
11506328-827d-42fa-9bfb-328308ec4914	c1a705d3-e16e-49d2-bf1a-c5d0adc04e25
31bc2a90-8640-4f34-96d7-6c71196f7502	511a8ec2-5758-40fc-b2a4-13e3873fedc3
c1ebf8ed-3350-424f-b66f-07b594573b17	279f589c-7870-4c06-a6bc-30e2f46aba75
6edad27b-0e15-4266-9fd1-2c059fb24d36	e3670749-108c-4d2a-bd33-0ea49bb0bf93
6f2631c7-1a29-47be-9d71-9f6ac6ce742d	d60cb7c9-37bb-480d-b705-5004895b9abe
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
5b812036-9e0f-4376-a2ae-2854d7cce5be	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
e1d1df32-89c6-4f53-97af-12a16dee378d	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
7f1d8dd5-6649-48da-8657-87fb2cde3739	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
fdc99a67-e252-48dc-ab43-07fdc94fedda	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
028b5ac3-8122-41fe-bbbc-36b056ca9fd8	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	D7:F1:7D:5A
29a5eb5c-478d-4156-ad77-46cdb5779b61	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	17:CD:7F:5A
4aae0c43-0edf-4e49-87db-043bbec1ebc5	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	67:CD:7E:5A
4de2c415-5229-442a-bf81-62c543f67446	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	B7:5A:79:B5
5e9706ed-9a44-455b-b599-230e5822df9f	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	67:5A:70:B4
90c5adb1-c374-4a62-ac69-5e37fd2bb06a	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	97:17:60:B4
9b5f302b-f6ce-40e6-a294-5cef58bef456	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	D7:95:55:B4
a056ae81-9750-46e8-a1f0-6f85e6845015	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	27:45:7E:B4
f0f1dd61-0235-48a0-90fc-35bb6319323c	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
11506328-827d-42fa-9bfb-328308ec4914	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$ghqyzdnfjI+uNru6pK5JHJJuAN6hD/YP9vcUP+uDlTYP7QUv	\N	\N	\N	\N	\N	\N
31bc2a90-8640-4f34-96d7-6c71196f7502	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$zxsj2GOF/2Sx8biOBGmzGGbE4jIc2ZSRJ793f6oLAYL0oJA5	\N	\N	\N	\N	\N	\N
c1ebf8ed-3350-424f-b66f-07b594573b17	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$xuUMlsTWqmB5uALf7Z9s4HvMJ7wM8zOEsQ4FSqN+XVni0C1G	\N	\N	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
6edad27b-0e15-4266-9fd1-2c059fb24d36	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$2FvsXZFidkriRpJi2lTLMSXJrViSsJS2JhqnsxfHxaD5LM2C	\N	\N	\N	\N	\N	\N
6f2631c7-1a29-47be-9d71-9f6ac6ce742d	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$YL7ExnSzxdmC+qGfP6+P/Exoyz8CU5EIVEAmXMAmtPOn564r	\N	\N	\N	57f33be5-0220-4e06-b57c-b674c26ff068	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
03099708-040b-4244-8f48-9ad379d62746	1	Корневой	200	270	23	26	\N	\N	9398fa25-e906-406e-8e09-beb60975f75b	\N
0c82e207-ec76-4040-94ed-46c6bbc2b932	1	Корневой	200	270	23	26	\N	\N	26693f0d-6c87-4210-8bb3-cee7fd394a08	\N
26703804-4bd5-4468-ab40-2f2ed750ea5a	2	Заполняющий	270	310	23	26	\N	\N	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N
2ce20312-25f8-4d36-a24b-068b2cac2313	1	Корневой	200	270	23	26	\N	\N	09c84b21-5f0c-4fae-9dac-ceb5abc1917e	\N
3d8349dd-23de-4bfa-b654-0886ce421978	2	Заполняющий	270	310	23	26	\N	\N	c050ab9a-1195-42f5-a27d-343d2d8d8c4d	\N
3d9bcfd9-c9a5-4c62-a2ac-9ee09296fa73	2	Заполняющий	270	310	23	26	\N	\N	26693f0d-6c87-4210-8bb3-cee7fd394a08	\N
57a6ed41-80b6-4cea-b59a-0979f45b5c19	1	Корневой	200	270	23	26	\N	\N	8fd0d98d-6868-4412-9a66-78839fa644f1	\N
5eda9f2c-7abf-4553-882d-3bc0a1bedc0b	2	Заполняющий	270	310	23	26	\N	\N	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N
705b0fd8-cdc7-4a6e-93bd-bf8f77ab1664	1	Корневой	200	270	23	26	\N	\N	c050ab9a-1195-42f5-a27d-343d2d8d8c4d	\N
7b644a2d-a20e-46bf-b7a1-25ef68fa045d	1	Корневой	200	270	23	26	\N	\N	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N
88711a65-1df4-4c49-a0ab-08a91757fe76	1	Корневой	200	270	23	26	\N	\N	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N
8fd32666-98ae-4e85-992b-0db59dfceb1e	2	Заполняющий	270	310	23	26	\N	\N	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N
962261ec-e72b-4d71-8f06-f9f67471c9ac	1	Корневой	200	270	23	26	\N	\N	aff9dccb-145d-4e42-8c34-8bb5579f522b	\N
9b64ea13-e089-4a52-bf04-4714e62782ae	2	Заполняющий	270	310	23	26	\N	\N	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N
9df0e673-781b-42c2-a55b-ca627d4a7817	1	Корневой	200	270	23	26	\N	\N	4b73a99f-0fb7-49fc-b930-521e67691895	\N
9fdc57ae-25b3-4f6f-8dd5-c7278608356b	2	Заполняющий	270	310	23	26	\N	\N	4b73a99f-0fb7-49fc-b930-521e67691895	\N
ad8df5f0-2d0f-413c-be9b-38d23c380325	2	Заполняющий	270	310	23	26	\N	\N	9398fa25-e906-406e-8e09-beb60975f75b	\N
c382a15c-23cb-4e9e-a572-ceb7132c64a0	1	Корневой	200	270	23	26	\N	\N	d6068081-5eac-49bb-b6be-30f3aa5febf4	\N
deab1cdf-d29a-4e2c-bfe2-109d58809b5b	2	Заполняющий	270	310	23	26	\N	\N	7ea73afd-78ac-4b39-ba12-a6816a764ec8	\N
edf1e954-4a81-403f-b289-bd5f161002d6	2	Заполняющий	270	310	23	26	\N	\N	3fb871cf-9101-4eee-8ee8-cb1c6c03978c	\N
f82de241-4fb9-4e8a-a043-b5a354a36996	1	Корневой	200	270	23	26	\N	\N	ff0d2b37-9a2c-4e85-993c-7979aab5aa0f	\N
fdd6d112-bb06-4cb6-8651-87c300b6aa42	2	Заполняющий	270	310	23	26	\N	\N	8fd0d98d-6868-4412-9a66-78839fa644f1	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
04ad8b7d-7c32-432e-95b2-df9291291d66	7895122d-186d-47ea-9a69-463515f335d6
04ad8b7d-7c32-432e-95b2-df9291291d66	a623d6e5-7a95-4c22-addb-35ec1a76e606
120b75d9-39ca-4280-bd39-abf3edfdc577	a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a
19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e	7895122d-186d-47ea-9a69-463515f335d6
19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e	a623d6e5-7a95-4c22-addb-35ec1a76e606
285c7225-d2cb-487f-b8b7-a5205e3dd41b	7895122d-186d-47ea-9a69-463515f335d6
285c7225-d2cb-487f-b8b7-a5205e3dd41b	a623d6e5-7a95-4c22-addb-35ec1a76e606
2881ef4f-7783-4d22-8ff4-847d9bf70b13	5f8a0d82-9648-4b94-9b9b-60888960210c
398d8d0a-9d53-4632-8559-245816abd384	a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a
63d79615-e349-4cf0-8f38-816277172795	5f8a0d82-9648-4b94-9b9b-60888960210c
7e0519ae-a0cf-4fba-b678-359b93ee3642	7895122d-186d-47ea-9a69-463515f335d6
7e0519ae-a0cf-4fba-b678-359b93ee3642	a623d6e5-7a95-4c22-addb-35ec1a76e606
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
04ad8b7d-7c32-432e-95b2-df9291291d66	028b5ac3-8122-41fe-bbbc-36b056ca9fd8	\N	114729
120b75d9-39ca-4280-bd39-abf3edfdc577	9b5f302b-f6ce-40e6-a294-5cef58bef456	\N	132695
19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e	90c5adb1-c374-4a62-ac69-5e37fd2bb06a	\N	150838
285c7225-d2cb-487f-b8b7-a5205e3dd41b	29a5eb5c-478d-4156-ad77-46cdb5779b61	\N	150882
2881ef4f-7783-4d22-8ff4-847d9bf70b13	4de2c415-5229-442a-bf81-62c543f67446	\N	121267
398d8d0a-9d53-4632-8559-245816abd384	4aae0c43-0edf-4e49-87db-043bbec1ebc5	\N	122575
63d79615-e349-4cf0-8f38-816277172795	5e9706ed-9a44-455b-b599-230e5822df9f	\N	117390
7e0519ae-a0cf-4fba-b678-359b93ee3642	a056ae81-9750-46e8-a1f0-6f85e6845015	\N	146164
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
5f8a0d82-9648-4b94-9b9b-60888960210c	92d5a5ef-6961-480a-805d-af4646800c77
5f8a0d82-9648-4b94-9b9b-60888960210c	d840b4bb-f8af-4568-bed6-3061267f9220
7895122d-186d-47ea-9a69-463515f335d6	5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e
7895122d-186d-47ea-9a69-463515f335d6	ad15addb-3100-4fac-b70a-5f1db1d94893
7895122d-186d-47ea-9a69-463515f335d6	d840b4bb-f8af-4568-bed6-3061267f9220
7895122d-186d-47ea-9a69-463515f335d6	e9b97962-ade8-41b6-b1e9-64b830da256f
a623d6e5-7a95-4c22-addb-35ec1a76e606	5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e
a623d6e5-7a95-4c22-addb-35ec1a76e606	ad15addb-3100-4fac-b70a-5f1db1d94893
a623d6e5-7a95-4c22-addb-35ec1a76e606	d840b4bb-f8af-4568-bed6-3061267f9220
a623d6e5-7a95-4c22-addb-35ec1a76e606	e9b97962-ade8-41b6-b1e9-64b830da256f
a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a	5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e
a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a	9b64e6fa-f620-423f-a9a0-6edc86fbd88c
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
5f8a0d82-9648-4b94-9b9b-60888960210c	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49232	03:3D:93:0D
7895122d-186d-47ea-9a69-463515f335d6	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49141	93:57:D8:0B
a623d6e5-7a95-4c22-addb-35ec1a76e606	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49283	A6:F1:CF:48
a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	49286	35:4E:AC:A5
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
25eca326-855d-46d0-a637-c7fad6c7fb72	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	722650c1-d999-492f-a795-6692f0878f5d	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
3ad7c813-8874-48c5-a5fa-8c24663fac4f	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8f48b662-76ae-4d35-9d6e-05eaf954e83d	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
3d9636d7-91d3-440e-98c4-ff99e8b27b20	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7f92d503-300d-42f7-99aa-092c1d36d969	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
52c28286-9eb6-42f4-b09b-5a138e9cf9f7	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	77f692ec-1e8d-4dfc-b25c-b4c66fc59404	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
549cc4e8-1b72-4302-8d09-eaeca6f3cd0c	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	acae688f-3fc8-47e7-8396-5dfaa74ae6b3	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
6b78f20f-044a-448c-8f6e-ada103afdbac	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	44d749e4-1554-478f-87df-e31d0bee3af2	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
7d2c95c3-42f6-4f69-ab38-afcab1d39584	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	398fcdf3-d382-4ba3-92ab-395b3135ccf1	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
912b172c-cf5e-4591-96cc-4dabdfeddea6	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8da2e1da-2b5d-41db-98a0-675e9ae8b816	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
93a71de9-bd0a-489f-b39d-14b5c562b148	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ea2dbfaf-a88b-4646-9444-f29592c84871	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
a7b7e074-c2ed-4ad1-9f64-5e357d813941	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8f448239-2ab1-4276-a3f5-a605d95625e4	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
ac6410cb-4820-4d40-9cb4-3220b043bdf7	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c1a50c66-c72e-4cf7-9f4a-c0b540ae7b1e	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
b85807d0-389d-4f70-a8fd-b575f1db916c	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e1ad50e6-3cce-498a-9c30-a125df2783ae	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
be2efaf6-eeba-4261-b352-9fe2ad39d15f	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3f9e0cbe-4b89-42bf-923f-89526cbd682f	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
cf74a6ee-b873-4850-ad1b-448b14a5ba02	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	572e451f-944a-46d4-91c9-c1b05645ff82	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
da276c45-6338-475e-90e1-8fcf4c97617e	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3279dffd-84e0-4756-b9e0-6a87e025edbc	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
e05013de-6eb6-44f2-b27e-9c34dd206962	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	091df164-48ab-4961-a22b-1d872a61daac	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
edb35daf-cf5f-4ae9-9fab-ff461710cd0c	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a4c0bc87-26fd-45fe-a135-1169702387c0	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
f5f89a61-4893-465d-b915-2582007e8c12	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	36828ae2-0410-4279-b1bb-67f512a24210	\N	d2fa10a5-7f35-47d3-82e1-708e9ca42ab3	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
015c70bb-a2f3-4255-969c-a1f1d0321515	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	66b4fcc8-efcc-4ca7-a07a-f423d045fd5c	\N
b80f5697-6301-4d69-a02c-9992e6b99d3c	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	66b4fcc8-efcc-4ca7-a07a-f423d045fd5c	\N
b9e55639-5877-4d70-bde8-a5cba6cf0592	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	66b4fcc8-efcc-4ca7-a07a-f423d045fd5c	\N
09244438-72c2-4922-a5d7-9954768cb512	1	12:10:00	13:10:00	13:20:00	13:50:00	6423696d-e4cb-46a4-af8c-bb2533664725	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e	3500	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3500
92d5a5ef-6961-480a-805d-af4646800c77	3600	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3600
9b64e6fa-f620-423f-a9a0-6edc86fbd88c	3510	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3510
ad15addb-3100-4fac-b70a-5f1db1d94893	3550	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3550
d840b4bb-f8af-4568-bed6-3061267f9220	3610	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3610
e9b97962-ade8-41b6-b1e9-64b830da256f	3690	\N	57f33be5-0220-4e06-b57c-b674c26ff068	3690
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
a968ed54-a55b-4481-bda2-1a81f5909013	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 18, true);


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
    ADD CONSTRAINT "FK_WeldingTasks_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id");


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

