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
22910fd9-1079-4085-8738-c275e69a35d4	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
4aef943f-e662-4bb2-b1b4-974b5099be03	0bc681bc-46b8-4556-beda-7bfd2e3ae684	bdee986f-91ae-45aa-93a2-eb806cbb7fe1	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
db4a1f8e-16b2-4ce4-8ff8-a1aaaa97c907	1	10	t	22910fd9-1079-4085-8738-c275e69a35d4	\N
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
10063147-1260-4a5b-b8f1-a854b32d876e	Отсутствие конструктора, технолога или ожидание его решения	\N
2d63b23d-0486-48e7-ba50-71033dca2b5e	Неявка оператора (б/лист, отпуск, и пр.)	\N
378698db-0526-46d6-91c7-4adcb44c4f5f	Ознакомление с работой, документацией, инструктаж	\N
3d0db86a-bb6d-4b8f-8ae7-b3770045f3d2	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
417c6387-74cc-4d30-bee8-dc6d60535e29	Отсутствие энергоносителей	\N
4dd8f941-889a-46e5-bf1a-5b1a57ff60e2	Установка, выверка, снятие детали	\N
58059479-578e-490c-99cd-d0631758f5ad	Установка, выверка, снятие детали	\N
5940177e-9526-417a-874b-8ca65181aef8	Отсутствие материала, заготовок, деталей	\N
5bc73295-6792-4dc1-afe4-845c4c16ceb2	Изменение режимов, смена инструмента, приспособления	\N
5ed3bf77-5245-4cad-9e9d-fee7a83cb6d6	Естественные надобности	\N
61206cb8-af61-4a08-a314-3a3d362262c3	Нерабочее время по графику согласно сменности	\N
62dc4c7c-6466-4f0b-bf02-46c0df5ca80e	Обед	\N
6537fbab-89ac-4119-bc1f-f8dae1be070b	Праздники и выходные	\N
65e34ea3-5d79-4031-bd51-d3c3bc6d6deb	Плановый ремонт централизованными службами	\N
a34dc148-c65f-459c-a88c-711e6d2203c9	Работа по карте несоответствий	\N
a6129135-cd37-4782-8af5-e25e97591c94	Сборочные операции	\N
aaeb9ca7-7d9c-410f-a8f2-08e0b872b9c3	Работа с управляющей программой	\N
af986725-8e10-40e1-9971-21f44807f6e1	Отсутствие заданий	\N
bd385252-a8f5-44f8-9b3f-56ed667581f0	Отсутствие крана, транспорта	\N
bffe3c8d-4778-487b-bc01-3702e5fb8001	Контроль на рабочем месте	\N
c3ff79f8-8af2-4fae-b282-7221c4eda7e5	Отсутствие оператора в связи с необеспеченностью	\N
e25b310f-c2dc-408e-98ba-d8cca96f840c	Отсутствие сотрудника ОТК	\N
e6acc9cb-9adf-486f-ab10-79dfd4501f70	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
eaccd8d8-0d7d-470f-b524-39698def2eb0	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
ecfd1cd1-003a-4f55-8253-4a6edaa855e8	Аварийный ремонт централизованными службами	\N
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
1f8c751f-1a9f-4ed6-a2c6-160d41f11462	d4212b72-e5e5-4653-b167-46113a07ba6e	219379
950e83c1-988d-45a3-88fb-9daba699dc51	00bdcf57-8bf9-4930-b863-e76a1640f717	249550
bc2bc2c7-22f8-4290-8bfc-2eb2d278a284	c1e044c1-d9f7-4b67-9063-d1049729ba8f	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
0a07d435-5871-4137-b505-89df622b4633	cd05a878-e766-446a-b8ce-d6a62f2a5a8b	610422
d04f4a37-2a60-4800-ac26-b4d2fda35c33	d9b31aff-6c93-43af-b77f-c665e77e7383	614962
82417150-ab44-44fc-b435-f5427b98d433	4e9bd5ba-58e7-461b-9c50-f09413a7118e	\N
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
1ee7495f-f0fb-4425-b7c4-13ce19365648	7d5f798b-16d9-49aa-bb34-a38d5c0d1005
276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	7d5f798b-16d9-49aa-bb34-a38d5c0d1005
97fd0bdd-48c9-4bd0-9744-91442aff9fd8	7d5f798b-16d9-49aa-bb34-a38d5c0d1005
c8ae5a1e-c184-4089-b78e-76a702f13352	7d5f798b-16d9-49aa-bb34-a38d5c0d1005
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
1ee7495f-f0fb-4425-b7c4-13ce19365648	1	2	2023-03-12 00:00:00	420bb39a-473f-4405-b144-9b2e8a89e287	\N
276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	2	2	2023-03-12 00:00:00	63b78311-44f6-479f-a750-8001f081ca3d	\N
97fd0bdd-48c9-4bd0-9744-91442aff9fd8	3	2	2023-03-12 00:00:00	faa4e894-c60f-460e-bc25-c0c022aa543d	\N
c8ae5a1e-c184-4089-b78e-76a702f13352	4	2	2023-03-12 00:00:00	feb56c02-2964-4173-8aeb-06e37fc43cb4	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
faa4e894-c60f-460e-bc25-c0c022aa543d	420bb39a-473f-4405-b144-9b2e8a89e287
63b78311-44f6-479f-a750-8001f081ca3d	feb56c02-2964-4173-8aeb-06e37fc43cb4
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
103977b1-8077-481f-83c3-d5e3b20b9e97	0	3	\N	\N	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
2cef9da7-9799-40a7-9584-a341dc2bfe77	0	2	\N	\N	c8ae5a1e-c184-4089-b78e-76a702f13352	\N
39cba7a6-7ce1-40ba-a6c8-74481308e05a	0	1	\N	\N	c8ae5a1e-c184-4089-b78e-76a702f13352	\N
5f90c0be-9e51-428b-922f-d3cd485885d3	0	1	\N	\N	1ee7495f-f0fb-4425-b7c4-13ce19365648	\N
68aac0ad-e36d-47d5-96b7-30599c0bfc5b	0	2	\N	\N	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
74800f07-60d8-4d30-9763-54e25172bf3c	0	1	\N	\N	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
884a8418-71e3-4a06-88d5-36be57c95687	0	2	\N	\N	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
8b3d88d9-f753-41ce-94f4-a075c8de6b1a	0	1	\N	\N	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
9ddc6155-5164-4528-a06a-3de03bd7bc1f	0	2	\N	\N	1ee7495f-f0fb-4425-b7c4-13ce19365648	\N
a9c5a2f7-b5aa-4797-8aa1-5ebd923c06ed	0	3	\N	\N	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
dfee439e-28de-4bdf-9e74-77a25e46cc5d	0	3	\N	\N	1ee7495f-f0fb-4425-b7c4-13ce19365648	\N
ee77ad16-a75d-44f5-b9b6-04faa177a03c	0	3	\N	\N	c8ae5a1e-c184-4089-b78e-76a702f13352	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
b26e630d-6438-44e3-8be1-b2f59268340f	Сборка, сварка рам к/с г/п 120-130 т.	6	bdee986f-91ae-45aa-93a2-eb806cbb7fe1	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
420bb39a-473f-4405-b144-9b2e8a89e287	Поперечина рамы задняя	75131-2801300-20	t	2	a00290e0-b914-4acd-a1c7-0387b8296b05	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N	\N	\N
63b78311-44f6-479f-a750-8001f081ca3d	Рама	7513D-2800010-20	t	1	55972782-e7ce-4e45-af98-26588640b974	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N	\N	4536492774
faa4e894-c60f-460e-bc25-c0c022aa543d	Рама	75131-2800010-70	t	1	a00290e0-b914-4acd-a1c7-0387b8296b05	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N	\N	4536479362
feb56c02-2964-4173-8aeb-06e37fc43cb4	Поперечина рамы задняя	75131-2801300-20	t	2	55972782-e7ce-4e45-af98-26588640b974	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
8350c99f-32ab-4296-951e-c834f888bfd6	Admin	\N
0a722dce-f71d-4951-9314-b0424bbbea53	Master	\N
34d94696-753e-4823-869a-5b6cc4069c91	Welder	\N
8d1a2931-211c-463c-bd34-4e814e696e38	Inspector	\N
bb100ac1-98db-400a-92da-115c27a8b300	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
13749168-e05b-49b3-bfa6-66628d488eaf	2023-03-12 00:00:00	170e26a3-8a12-4684-921f-8d4c80b332f5	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
21c538e9-e2b2-4467-9548-c3543c408c45	2023-03-12 00:00:00	067976ec-5594-4a39-b67a-9bd4b7327e28	c8ae5a1e-c184-4089-b78e-76a702f13352	\N
248ebf21-1f9d-43f7-88e9-a4f45dd4d9b5	2023-03-12 00:00:00	1c015f96-6bb2-4d29-9cf8-bedfa6d35d3a	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
6756ff18-177c-4945-bada-25d5745aa7f0	2023-03-12 00:00:00	adc0a56e-6442-45c7-866f-1b62828b2b50	1ee7495f-f0fb-4425-b7c4-13ce19365648	\N
6dc57998-9e7a-4915-9144-e80e69379643	2023-03-12 00:00:00	664e4abc-fd96-42a8-ad75-386c228b9bc0	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
75340cb2-a6e0-4367-8bfb-7389b3160af4	2023-03-12 00:00:00	5ed04047-c32d-4860-b297-e1d202d8e116	1ee7495f-f0fb-4425-b7c4-13ce19365648	\N
7aace5d4-9544-4d17-a553-5dadfe425af7	2023-03-12 00:00:00	ccc5641a-65c8-4bf1-a655-fd8a9e9eca97	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
7da13cb5-1e47-46f6-8191-dcef8da6beb4	2023-03-12 00:00:00	271a77bc-ff91-45ef-ab10-f916e437d734	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
863a93bf-3aa2-40d8-acbb-2324f1cca697	2023-03-12 00:00:00	50be552d-c34a-4eba-bed7-83f32e3adca8	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
8a9dde0f-fb81-4d5d-aef7-76dc0b4a8e5f	2023-03-12 00:00:00	20897435-b2ca-4b3c-b7ae-167047a4838f	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
97e16394-1c0a-4b45-addc-5b1b46dddc8e	2023-03-12 00:00:00	2c2b9b26-5f7b-4921-b784-b3ecae0143e5	c8ae5a1e-c184-4089-b78e-76a702f13352	\N
a39f4290-6719-46ee-a3e0-48b57875d8b4	2023-03-12 00:00:00	4ba50c48-3ea4-4293-b8f6-90e7c699c3bc	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
b2009702-b1b7-47da-8a3b-22598ea5c8d6	2023-03-12 00:00:00	0dfbaa75-4133-478a-9468-c248c7e2743e	276eed3c-5fe9-4ad8-ab9a-c8caa34e0553	\N
b5587532-f6b6-4616-b002-d6a4d932178f	2023-03-12 00:00:00	bcc3ff6f-f604-400e-9342-02e35c98d510	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
cbba9c8a-3b4f-4eec-b8f7-ef19452cc794	2023-03-12 00:00:00	600a5fa8-5815-4f3d-960c-cf2b5f1d5d35	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
dbd56ca0-24d4-4989-b6a0-5ee1ba4d878f	2023-03-12 00:00:00	f89f9171-a6b8-48d8-a1bb-105aebe37bcd	c8ae5a1e-c184-4089-b78e-76a702f13352	\N
e0c16fb0-9b9c-4026-8fbb-905cfd0ff361	2023-03-12 00:00:00	a637202f-d644-4938-92f4-14da79c2ad5b	97fd0bdd-48c9-4bd0-9744-91442aff9fd8	\N
edaf88ff-62f3-41a6-8a6a-411cf7c1d001	2023-03-12 00:00:00	1a8e62ac-9426-4518-89a1-c092d965cdd8	1ee7495f-f0fb-4425-b7c4-13ce19365648	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
02c9a193-cb23-4bad-9a73-9269608968f6	0	2	\N	\N	75340cb2-a6e0-4367-8bfb-7389b3160af4	\N
069271e9-0e23-45e3-bad1-f0326e13fd43	0	2	\N	\N	7aace5d4-9544-4d17-a553-5dadfe425af7	\N
12666acd-f4ea-4b22-a0c6-f27e9747835a	0	2	\N	\N	edaf88ff-62f3-41a6-8a6a-411cf7c1d001	\N
19e8851e-8b91-4d3b-b651-bd91610fcae6	0	2	\N	\N	13749168-e05b-49b3-bfa6-66628d488eaf	\N
200a55bd-ec6d-403b-855a-4e3510390338	0	3	\N	\N	e0c16fb0-9b9c-4026-8fbb-905cfd0ff361	\N
202ba0bf-3f89-43d5-aab8-114af7cb9346	0	2	\N	\N	dbd56ca0-24d4-4989-b6a0-5ee1ba4d878f	\N
265e89b0-a43f-4354-91ce-520baf4c6153	0	1	\N	\N	863a93bf-3aa2-40d8-acbb-2324f1cca697	\N
309596fa-9b55-4f8f-b124-0018f50de37a	0	1	\N	\N	8a9dde0f-fb81-4d5d-aef7-76dc0b4a8e5f	\N
39c294f4-d14b-415a-9259-d35066e95eb8	0	3	\N	\N	dbd56ca0-24d4-4989-b6a0-5ee1ba4d878f	\N
3c316681-ac79-4258-a4c0-bf83ba044e06	0	3	\N	\N	6dc57998-9e7a-4915-9144-e80e69379643	\N
44cd6318-477b-4671-8fa6-0bcee4a3c312	0	3	\N	\N	248ebf21-1f9d-43f7-88e9-a4f45dd4d9b5	\N
4529f0b5-6bce-4d84-98ac-3435eb705903	0	2	\N	\N	b5587532-f6b6-4616-b002-d6a4d932178f	\N
4573d11c-6725-4453-b184-00a229a3f3aa	0	3	\N	\N	b2009702-b1b7-47da-8a3b-22598ea5c8d6	\N
4b734e52-51c1-46fc-a30f-f0e8f786079c	0	3	\N	\N	a39f4290-6719-46ee-a3e0-48b57875d8b4	\N
4e251bfa-c20f-4586-a856-6934f15f7e72	0	2	\N	\N	7da13cb5-1e47-46f6-8191-dcef8da6beb4	\N
5110e61a-bf70-4416-b57b-2cd9220bfe6f	0	3	\N	\N	8a9dde0f-fb81-4d5d-aef7-76dc0b4a8e5f	\N
53d50244-2144-481a-8443-abfda1caf965	0	3	\N	\N	75340cb2-a6e0-4367-8bfb-7389b3160af4	\N
57192bae-3978-4e5d-beb4-c760868e9022	0	2	\N	\N	863a93bf-3aa2-40d8-acbb-2324f1cca697	\N
57f4843d-291d-4f09-ae86-81a6c3839ac9	0	2	\N	\N	e0c16fb0-9b9c-4026-8fbb-905cfd0ff361	\N
5ca1c234-6245-4966-a5d9-285d9b5db5bb	0	1	\N	\N	cbba9c8a-3b4f-4eec-b8f7-ef19452cc794	\N
659150fa-0e01-4cc8-a2e9-05b5bdfa3b44	0	1	\N	\N	13749168-e05b-49b3-bfa6-66628d488eaf	\N
681720ac-f5c1-4990-a9ef-d725c26a4bf5	0	1	\N	\N	dbd56ca0-24d4-4989-b6a0-5ee1ba4d878f	\N
6923e5f7-c212-4df2-a429-466d307d39d6	0	3	\N	\N	cbba9c8a-3b4f-4eec-b8f7-ef19452cc794	\N
6d42989a-5124-4adc-82ec-82d226b301bc	0	1	\N	\N	7aace5d4-9544-4d17-a553-5dadfe425af7	\N
7aaee822-2e21-430a-a814-86adf3fe7ced	0	3	\N	\N	edaf88ff-62f3-41a6-8a6a-411cf7c1d001	\N
7ed8ef16-e888-4ad0-90c8-20b89f18b856	0	1	\N	\N	a39f4290-6719-46ee-a3e0-48b57875d8b4	\N
859a27c2-1f5c-4f13-829a-15f5e310ef69	0	1	\N	\N	6dc57998-9e7a-4915-9144-e80e69379643	\N
89f00f39-234e-417e-9b31-61cb5d1a744f	0	2	\N	\N	6756ff18-177c-4945-bada-25d5745aa7f0	\N
8b16b0c9-4a86-42a2-aa64-f767efaf5514	0	2	\N	\N	6dc57998-9e7a-4915-9144-e80e69379643	\N
8dcf3f67-08d1-43f7-9bf7-f56c620a6718	0	3	\N	\N	6756ff18-177c-4945-bada-25d5745aa7f0	\N
8f5fb713-0805-41a2-86c9-1ab816281876	0	3	\N	\N	97e16394-1c0a-4b45-addc-5b1b46dddc8e	\N
92885e09-de27-48bb-892e-53898c7a40b1	0	1	\N	\N	6756ff18-177c-4945-bada-25d5745aa7f0	\N
93c64f1c-3d8e-446d-81b8-a3f823469fe6	0	1	\N	\N	e0c16fb0-9b9c-4026-8fbb-905cfd0ff361	\N
9c1005dc-e678-441e-860a-ded299bf3437	0	3	\N	\N	7aace5d4-9544-4d17-a553-5dadfe425af7	\N
9fb8e3ec-0dfa-448a-9ed0-058bf7588dab	0	2	\N	\N	b2009702-b1b7-47da-8a3b-22598ea5c8d6	\N
a056f9a7-3873-4fb3-aaea-0df7fe9591c7	0	2	\N	\N	248ebf21-1f9d-43f7-88e9-a4f45dd4d9b5	\N
a0b56660-f6f3-4af1-8b58-7bae69cd04db	0	2	\N	\N	97e16394-1c0a-4b45-addc-5b1b46dddc8e	\N
ac6cfcc8-0ae6-4609-88d2-f25a5ffa91ac	0	2	\N	\N	8a9dde0f-fb81-4d5d-aef7-76dc0b4a8e5f	\N
add8a8f7-a8f3-486b-9846-b07525efac77	0	3	\N	\N	21c538e9-e2b2-4467-9548-c3543c408c45	\N
ae4032e8-a73d-47dd-b551-538c8720601f	0	2	\N	\N	cbba9c8a-3b4f-4eec-b8f7-ef19452cc794	\N
b9a4cf79-fe30-426c-9fb3-a4f46e0a439a	0	1	\N	\N	edaf88ff-62f3-41a6-8a6a-411cf7c1d001	\N
c39e013a-4aab-436e-b738-1a1eb4a8417d	0	1	\N	\N	b2009702-b1b7-47da-8a3b-22598ea5c8d6	\N
c7e3d954-7406-4aaa-a095-8bf0019a8a3f	0	3	\N	\N	b5587532-f6b6-4616-b002-d6a4d932178f	\N
c9b59c36-4939-40e1-92d9-7b342dedb6c2	0	2	\N	\N	21c538e9-e2b2-4467-9548-c3543c408c45	\N
cbcfcfef-5b5b-43ad-831b-69c515f40173	0	2	\N	\N	a39f4290-6719-46ee-a3e0-48b57875d8b4	\N
d886f2ad-0721-4583-80b0-07a6097df36e	0	1	\N	\N	75340cb2-a6e0-4367-8bfb-7389b3160af4	\N
e0b4ed60-2606-4e9b-9c8b-abc84efa6ecd	0	3	\N	\N	7da13cb5-1e47-46f6-8191-dcef8da6beb4	\N
e4fa72b1-6808-498d-bf8d-82a31dc8f727	0	3	\N	\N	13749168-e05b-49b3-bfa6-66628d488eaf	\N
ea3c372c-813c-40b1-aefc-7ccec93de033	0	1	\N	\N	b5587532-f6b6-4616-b002-d6a4d932178f	\N
ecca30b5-2627-4c7c-9dd4-1e1457078138	0	1	\N	\N	248ebf21-1f9d-43f7-88e9-a4f45dd4d9b5	\N
eeda3d32-cf43-495d-9cf3-e7614b5d3d60	0	1	\N	\N	21c538e9-e2b2-4467-9548-c3543c408c45	\N
ef8a5e5f-297d-4a71-ad5f-3c4dce1026c0	0	3	\N	\N	863a93bf-3aa2-40d8-acbb-2324f1cca697	\N
f3788c8e-eb98-48be-adb3-93fb5c7fb5fa	0	1	\N	\N	7da13cb5-1e47-46f6-8191-dcef8da6beb4	\N
f9c8dd5f-18ff-4cb0-9da6-5bdf9aab6f1c	0	1	\N	\N	97e16394-1c0a-4b45-addc-5b1b46dddc8e	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
067976ec-5594-4a39-b67a-9bd4b7327e28	1	1900	t	f	feb56c02-2964-4173-8aeb-06e37fc43cb4	cfa67f3b-8914-4569-83b8-5078f4b6ce36	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
0dfbaa75-4133-478a-9468-c248c7e2743e	55	400	t	f	63b78311-44f6-479f-a750-8001f081ca3d	050f1333-4c68-403a-aaa8-9915282ed16f	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
170e26a3-8a12-4684-921f-8d4c80b332f5	57	400	t	f	faa4e894-c60f-460e-bc25-c0c022aa543d	6cd52a41-1eac-4100-a2f8-7e76e3454a91	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
1a8e62ac-9426-4518-89a1-c092d965cdd8	1	1900	t	f	420bb39a-473f-4405-b144-9b2e8a89e287	cfa67f3b-8914-4569-83b8-5078f4b6ce36	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
1c015f96-6bb2-4d29-9cf8-bedfa6d35d3a	39	280	t	f	faa4e894-c60f-460e-bc25-c0c022aa543d	86d64950-228c-4f9c-921c-b58fd38dade2	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
20897435-b2ca-4b3c-b7ae-167047a4838f	57	400	t	f	63b78311-44f6-479f-a750-8001f081ca3d	6cd52a41-1eac-4100-a2f8-7e76e3454a91	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
271a77bc-ff91-45ef-ab10-f916e437d734	39	280	t	f	63b78311-44f6-479f-a750-8001f081ca3d	86d64950-228c-4f9c-921c-b58fd38dade2	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
2c2b9b26-5f7b-4921-b784-b3ecae0143e5	52	1200	t	f	feb56c02-2964-4173-8aeb-06e37fc43cb4	b723577d-889b-4127-ac91-1dee6e09aa68	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
4ba50c48-3ea4-4293-b8f6-90e7c699c3bc	18	4000	t	f	63b78311-44f6-479f-a750-8001f081ca3d	c01c4d75-584c-4dc9-ba23-6da0d571f19f	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
50be552d-c34a-4eba-bed7-83f32e3adca8	58	900	t	f	63b78311-44f6-479f-a750-8001f081ca3d	e84c8a5f-3628-4857-a513-2eae910d2b29	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
5ed04047-c32d-4860-b297-e1d202d8e116	2	1880	t	f	420bb39a-473f-4405-b144-9b2e8a89e287	d05a227f-9d57-40cc-a60e-b1827247187d	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
600a5fa8-5815-4f3d-960c-cf2b5f1d5d35	55	400	t	f	faa4e894-c60f-460e-bc25-c0c022aa543d	050f1333-4c68-403a-aaa8-9915282ed16f	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
664e4abc-fd96-42a8-ad75-386c228b9bc0	54	400	t	f	63b78311-44f6-479f-a750-8001f081ca3d	249de48e-e6f0-4523-869b-52beb69ea6b9	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
a637202f-d644-4938-92f4-14da79c2ad5b	58	900	t	f	faa4e894-c60f-460e-bc25-c0c022aa543d	e84c8a5f-3628-4857-a513-2eae910d2b29	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
adc0a56e-6442-45c7-866f-1b62828b2b50	52	1200	t	f	420bb39a-473f-4405-b144-9b2e8a89e287	b723577d-889b-4127-ac91-1dee6e09aa68	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
bcc3ff6f-f604-400e-9342-02e35c98d510	54	400	t	f	faa4e894-c60f-460e-bc25-c0c022aa543d	249de48e-e6f0-4523-869b-52beb69ea6b9	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
ccc5641a-65c8-4bf1-a655-fd8a9e9eca97	18	4000	t	f	faa4e894-c60f-460e-bc25-c0c022aa543d	c01c4d75-584c-4dc9-ba23-6da0d571f19f	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
f89f9171-a6b8-48d8-a1bb-105aebe37bcd	2	1880	t	f	feb56c02-2964-4173-8aeb-06e37fc43cb4	d05a227f-9d57-40cc-a60e-b1827247187d	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
050f1333-4c68-403a-aaa8-9915282ed16f	55	Инструкция 55	55
249de48e-e6f0-4523-869b-52beb69ea6b9	54	Инструкция 54	54
68e782e2-8e87-4998-8bda-c1ef9361ec07	48	Инструкция 48	48
6cd52a41-1eac-4100-a2f8-7e76e3454a91	57	Инструкция 57	57
86d64950-228c-4f9c-921c-b58fd38dade2	39	Инструкция 39	39
b723577d-889b-4127-ac91-1dee6e09aa68	52	Инструкция 52	52
c01c4d75-584c-4dc9-ba23-6da0d571f19f	18	Инструкция 18	18
c51c8383-9b20-46e0-b9ae-74dfcc55a7b0	56	Инструкция 56	56
cfa67f3b-8914-4569-83b8-5078f4b6ce36	1	Инструкция 1	1
d05a227f-9d57-40cc-a60e-b1827247187d	2	Инструкция 2	2
e84c8a5f-3628-4857-a513-2eae910d2b29	58	Инструкция 58	58
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
047011db-8adf-4201-a300-03f348188a7a	75131-2801300-20	Поперечина рамы задняя	\N	2868425
55972782-e7ce-4e45-af98-26588640b974	7513D-2800010-20	Рама	\N	3330041
a00290e0-b914-4acd-a1c7-0387b8296b05	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
00bdcf57-8bf9-4930-b863-e76a1640f717	8d1a2931-211c-463c-bd34-4e814e696e38
d4212b72-e5e5-4653-b167-46113a07ba6e	8d1a2931-211c-463c-bd34-4e814e696e38
cd05a878-e766-446a-b8ce-d6a62f2a5a8b	0a722dce-f71d-4951-9314-b0424bbbea53
d9b31aff-6c93-43af-b77f-c665e77e7383	0a722dce-f71d-4951-9314-b0424bbbea53
1665582a-44bb-4ff2-96a4-c1b13f6d17f9	34d94696-753e-4823-869a-5b6cc4069c91
1a74f83c-d5bc-4671-9d91-ddd33fc5ecda	34d94696-753e-4823-869a-5b6cc4069c91
78c6e9e1-0f1e-4cf7-befe-e4c80038da8b	34d94696-753e-4823-869a-5b6cc4069c91
85da7cc8-c325-4694-a0b0-38563395a62a	34d94696-753e-4823-869a-5b6cc4069c91
978f08a2-144d-4e60-8892-e9b3b574275a	34d94696-753e-4823-869a-5b6cc4069c91
b05cbbf4-bae0-44c8-b3b3-fac99ec1696c	34d94696-753e-4823-869a-5b6cc4069c91
e99d8c95-88e5-4008-8c8e-bfd0f2f3a5df	34d94696-753e-4823-869a-5b6cc4069c91
f38e8d0d-4f86-4c5d-92bc-eb3ec9954667	34d94696-753e-4823-869a-5b6cc4069c91
0bc681bc-46b8-4556-beda-7bfd2e3ae684	bb100ac1-98db-400a-92da-115c27a8b300
d002419e-7dc7-494f-84f6-8dbbc8bd3e97	8350c99f-32ab-4296-951e-c834f888bfd6
31f05643-738c-461f-99bf-1c2735a01651	34d94696-753e-4823-869a-5b6cc4069c91
c1e044c1-d9f7-4b67-9063-d1049729ba8f	8d1a2931-211c-463c-bd34-4e814e696e38
d6f6a948-1920-4556-9d0f-c21f448f89f1	bb100ac1-98db-400a-92da-115c27a8b300
4e9bd5ba-58e7-461b-9c50-f09413a7118e	0a722dce-f71d-4951-9314-b0424bbbea53
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
00bdcf57-8bf9-4930-b863-e76a1640f717	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
d4212b72-e5e5-4653-b167-46113a07ba6e	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
cd05a878-e766-446a-b8ce-d6a62f2a5a8b	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
d9b31aff-6c93-43af-b77f-c665e77e7383	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
1665582a-44bb-4ff2-96a4-c1b13f6d17f9	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	D7:95:55:B4
1a74f83c-d5bc-4671-9d91-ddd33fc5ecda	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	17:CD:7F:5A
78c6e9e1-0f1e-4cf7-befe-e4c80038da8b	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	D7:F1:7D:5A
85da7cc8-c325-4694-a0b0-38563395a62a	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	97:17:60:B4
978f08a2-144d-4e60-8892-e9b3b574275a	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	67:CD:7E:5A
b05cbbf4-bae0-44c8-b3b3-fac99ec1696c	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	27:45:7E:B4
e99d8c95-88e5-4008-8c8e-bfd0f2f3a5df	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	B7:5A:79:B5
f38e8d0d-4f86-4c5d-92bc-eb3ec9954667	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	67:5A:70:B4
0bc681bc-46b8-4556-beda-7bfd2e3ae684	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
d002419e-7dc7-494f-84f6-8dbbc8bd3e97	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$nats0Rf3FKMS0/zlZowURvmp1sCVaMAz+5/VFHjVUTTI60mM	\N	\N	\N	\N	\N	\N
31f05643-738c-461f-99bf-1c2735a01651	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$sMJum91DH2mD4NcAR1AcAWylylC4GQjY3h/4/8tGwG90xMSV	\N	\N	\N	\N	\N	\N
c1e044c1-d9f7-4b67-9063-d1049729ba8f	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$BSkkR99mv7IiL79cTAsls6AZ5COY0FXk7Gl+CAIEbnhUjYv4	\N	\N	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
d6f6a948-1920-4556-9d0f-c21f448f89f1	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$OYwniMOT40htldVn5ACcbkTGrxrEtbjvR3W3hVSc3RhRdNDH	\N	\N	\N	\N	\N	\N
4e9bd5ba-58e7-461b-9c50-f09413a7118e	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$ezl567+/fFT/3pe+WrO2WMI9vsc7zAnmv0cpK4NREHlizmDx	\N	\N	\N	b26e630d-6438-44e3-8be1-b2f59268340f	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0de0fbb8-d5fc-44ab-bf49-5b352bb87095	2	Заполняющий	270	310	23	26	\N	\N	249de48e-e6f0-4523-869b-52beb69ea6b9	\N
22b183dc-f40f-4a57-bc76-860c91161a32	1	Корневой	200	270	23	26	\N	\N	c51c8383-9b20-46e0-b9ae-74dfcc55a7b0	\N
24035c0d-03f6-4ab9-a7fb-3794af8f8c11	1	Корневой	200	270	23	26	\N	\N	6cd52a41-1eac-4100-a2f8-7e76e3454a91	\N
2670c08a-99b8-44e9-bce1-470e48806c39	2	Заполняющий	270	310	23	26	\N	\N	cfa67f3b-8914-4569-83b8-5078f4b6ce36	\N
288042f2-ec68-4e9d-9b85-67a3e9436b65	2	Заполняющий	270	310	23	26	\N	\N	6cd52a41-1eac-4100-a2f8-7e76e3454a91	\N
2ad8e8b9-1095-48d3-b2c6-8494e5f71edf	1	Корневой	200	270	23	26	\N	\N	b723577d-889b-4127-ac91-1dee6e09aa68	\N
312127a2-5183-43ba-83b1-fd5c853d2c14	1	Корневой	200	270	23	26	\N	\N	249de48e-e6f0-4523-869b-52beb69ea6b9	\N
88c0aa3e-7b75-4f37-92fd-78ee7f84e8de	1	Корневой	200	270	23	26	\N	\N	c01c4d75-584c-4dc9-ba23-6da0d571f19f	\N
913aa2ce-2068-4280-ae19-3a438dcd5605	2	Заполняющий	270	310	23	26	\N	\N	c51c8383-9b20-46e0-b9ae-74dfcc55a7b0	\N
98aa60de-e066-4b5a-a8fd-21aa8978f80c	1	Корневой	200	270	23	26	\N	\N	050f1333-4c68-403a-aaa8-9915282ed16f	\N
9c976fc9-1004-4184-bd96-c964fa65f92f	2	Заполняющий	270	310	23	26	\N	\N	050f1333-4c68-403a-aaa8-9915282ed16f	\N
c8501121-9c25-4665-8036-0816d1e2a9df	1	Корневой	200	270	23	26	\N	\N	68e782e2-8e87-4998-8bda-c1ef9361ec07	\N
ce303ba7-c682-4913-81de-7cd15c15c9be	2	Заполняющий	270	310	23	26	\N	\N	e84c8a5f-3628-4857-a513-2eae910d2b29	\N
da0e35ae-97fd-44ed-8fc7-da976fcf4c99	1	Корневой	200	270	23	26	\N	\N	e84c8a5f-3628-4857-a513-2eae910d2b29	\N
e436d361-3ff5-4a77-b133-2a8ed15d6652	1	Корневой	200	270	23	26	\N	\N	d05a227f-9d57-40cc-a60e-b1827247187d	\N
e53772de-dad9-4115-aa6e-f598a0c9dba6	1	Корневой	200	270	23	26	\N	\N	cfa67f3b-8914-4569-83b8-5078f4b6ce36	\N
efb80178-b052-452e-98ae-db7200646604	2	Заполняющий	270	310	23	26	\N	\N	b723577d-889b-4127-ac91-1dee6e09aa68	\N
efbb995e-e599-4242-86a1-572d3fbacf29	2	Заполняющий	270	310	23	26	\N	\N	d05a227f-9d57-40cc-a60e-b1827247187d	\N
f590200f-2fec-40a5-8b5a-cf9c667d0946	2	Заполняющий	270	310	23	26	\N	\N	68e782e2-8e87-4998-8bda-c1ef9361ec07	\N
f7df7493-0dc9-4bbe-b3ae-4ee3be008da5	2	Заполняющий	270	310	23	26	\N	\N	c01c4d75-584c-4dc9-ba23-6da0d571f19f	\N
faed7967-e448-4deb-9aa4-7539aad774cb	1	Корневой	200	270	23	26	\N	\N	86d64950-228c-4f9c-921c-b58fd38dade2	\N
fe6bf1f3-cb58-426f-a4fd-45a573e2a88e	2	Заполняющий	270	310	23	26	\N	\N	86d64950-228c-4f9c-921c-b58fd38dade2	\N
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
05b3843b-4861-47cf-bd1c-0a10ad5c6117	7d5f798b-16d9-49aa-bb34-a38d5c0d1005
49b219a5-c531-44ca-8434-08d4ec049630	fe88c73c-b7cc-4f0b-beb9-035b7ec3d874
60ba6751-c257-4d75-947c-d02dc873a65f	978a0000-9cfc-4aff-8e00-fd51c30b595b
60ba6751-c257-4d75-947c-d02dc873a65f	b9c970fa-10ff-4191-9e0f-a6973345bc21
67eaaeb2-85c8-4bf6-87ce-58fc395a14f2	fe88c73c-b7cc-4f0b-beb9-035b7ec3d874
68fbb9cb-ad98-40e9-9977-c55ae0771d9a	978a0000-9cfc-4aff-8e00-fd51c30b595b
68fbb9cb-ad98-40e9-9977-c55ae0771d9a	b9c970fa-10ff-4191-9e0f-a6973345bc21
ce752dbd-4a8f-48c3-b24a-83d989289834	978a0000-9cfc-4aff-8e00-fd51c30b595b
ce752dbd-4a8f-48c3-b24a-83d989289834	b9c970fa-10ff-4191-9e0f-a6973345bc21
e0d30397-f51f-45e7-bf91-293da66aa8fd	978a0000-9cfc-4aff-8e00-fd51c30b595b
e0d30397-f51f-45e7-bf91-293da66aa8fd	b9c970fa-10ff-4191-9e0f-a6973345bc21
f1fe3c41-3e58-48fb-9ddd-8e78715839e5	7d5f798b-16d9-49aa-bb34-a38d5c0d1005
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
05b3843b-4861-47cf-bd1c-0a10ad5c6117	e99d8c95-88e5-4008-8c8e-bfd0f2f3a5df	\N	121267
49b219a5-c531-44ca-8434-08d4ec049630	1665582a-44bb-4ff2-96a4-c1b13f6d17f9	\N	132695
60ba6751-c257-4d75-947c-d02dc873a65f	b05cbbf4-bae0-44c8-b3b3-fac99ec1696c	\N	146164
67eaaeb2-85c8-4bf6-87ce-58fc395a14f2	978f08a2-144d-4e60-8892-e9b3b574275a	\N	122575
68fbb9cb-ad98-40e9-9977-c55ae0771d9a	78c6e9e1-0f1e-4cf7-befe-e4c80038da8b	\N	114729
ce752dbd-4a8f-48c3-b24a-83d989289834	1a74f83c-d5bc-4671-9d91-ddd33fc5ecda	\N	150882
e0d30397-f51f-45e7-bf91-293da66aa8fd	85da7cc8-c325-4694-a0b0-38563395a62a	\N	150838
f1fe3c41-3e58-48fb-9ddd-8e78715839e5	f38e8d0d-4f86-4c5d-92bc-eb3ec9954667	\N	117390
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
7d5f798b-16d9-49aa-bb34-a38d5c0d1005	2e2113e5-cf38-4502-b6ae-c6ab9f11f340
7d5f798b-16d9-49aa-bb34-a38d5c0d1005	567d9224-3123-4274-93b5-07e38d32ea3d
978a0000-9cfc-4aff-8e00-fd51c30b595b	2492164f-a647-4679-826e-ba8bc46f51c6
978a0000-9cfc-4aff-8e00-fd51c30b595b	2e2113e5-cf38-4502-b6ae-c6ab9f11f340
978a0000-9cfc-4aff-8e00-fd51c30b595b	3e384b3f-a6b2-4649-b0d7-c9fd842275ad
978a0000-9cfc-4aff-8e00-fd51c30b595b	c74f453b-789d-4c81-996a-5bf2e38006ef
b9c970fa-10ff-4191-9e0f-a6973345bc21	2492164f-a647-4679-826e-ba8bc46f51c6
b9c970fa-10ff-4191-9e0f-a6973345bc21	2e2113e5-cf38-4502-b6ae-c6ab9f11f340
b9c970fa-10ff-4191-9e0f-a6973345bc21	3e384b3f-a6b2-4649-b0d7-c9fd842275ad
b9c970fa-10ff-4191-9e0f-a6973345bc21	c74f453b-789d-4c81-996a-5bf2e38006ef
fe88c73c-b7cc-4f0b-beb9-035b7ec3d874	3e384b3f-a6b2-4649-b0d7-c9fd842275ad
fe88c73c-b7cc-4f0b-beb9-035b7ec3d874	c46712c4-3b61-4b72-948e-caf8a6ec6042
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
7d5f798b-16d9-49aa-bb34-a38d5c0d1005	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	0a07d435-5871-4137-b505-89df622b4633	49232	3A:94:69:86
978a0000-9cfc-4aff-8e00-fd51c30b595b	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	0a07d435-5871-4137-b505-89df622b4633	49283	A6:F1:CF:48
b9c970fa-10ff-4191-9e0f-a6973345bc21	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	0a07d435-5871-4137-b505-89df622b4633	49141	93:57:D8:0B
fe88c73c-b7cc-4f0b-beb9-035b7ec3d874	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	0a07d435-5871-4137-b505-89df622b4633	49286	35:4E:AC:A5
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
0bd23859-787f-4867-ab66-d119ef0f3748	1	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	21c538e9-e2b2-4467-9548-c3543c408c45	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
14597318-ba83-43ba-929e-2efe9077fb52	2	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8a9dde0f-fb81-4d5d-aef7-76dc0b4a8e5f	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
15e66371-6581-4650-9c61-148c9ed1de7e	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b5587532-f6b6-4616-b002-d6a4d932178f	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
26043078-eee0-4488-94be-e8530127d4ba	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	dbd56ca0-24d4-4989-b6a0-5ee1ba4d878f	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
28ac073a-e985-400e-891c-9a3ffd427f9c	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6dc57998-9e7a-4915-9144-e80e69379643	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
29365635-551c-40c0-bd41-4d4fb1c64cd1	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	13749168-e05b-49b3-bfa6-66628d488eaf	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
2df618eb-4e7b-46cd-8422-1f358ea94c26	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	75340cb2-a6e0-4367-8bfb-7389b3160af4	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
3a7c8c60-5e64-46ac-bf82-dcba0a443b42	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e0c16fb0-9b9c-4026-8fbb-905cfd0ff361	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
571a6662-dbed-431d-862e-4c1294f0de3f	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	248ebf21-1f9d-43f7-88e9-a4f45dd4d9b5	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
58baebd4-a83d-4b0a-bd94-d27b405e01fe	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6756ff18-177c-4945-bada-25d5745aa7f0	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
9cc9a1a0-d368-426b-ab84-6841b9e8a231	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	97e16394-1c0a-4b45-addc-5b1b46dddc8e	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
a921b5b3-eef7-4e4c-aa34-bac2824b7b2e	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7da13cb5-1e47-46f6-8191-dcef8da6beb4	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
c0dc9fa8-0524-4d14-8a7a-e2ce62367382	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cbba9c8a-3b4f-4eec-b8f7-ef19452cc794	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
c552d5f7-0efc-404c-90e4-7d1119b5e371	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	edaf88ff-62f3-41a6-8a6a-411cf7c1d001	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
c8096994-a493-4545-988c-b70f3beb9c54	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7aace5d4-9544-4d17-a553-5dadfe425af7	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
ce93beab-5239-4f6a-a9b1-64cecc933ade	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a39f4290-6719-46ee-a3e0-48b57875d8b4	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
e31b4487-d5ae-4f68-ae22-6bda313e8633	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	863a93bf-3aa2-40d8-acbb-2324f1cca697	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
fd3d99d3-d160-4391-b5c7-92559990e9f9	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b2009702-b1b7-47da-8a3b-22598ea5c8d6	\N	0a07d435-5871-4137-b505-89df622b4633	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
26dfeb22-a1ac-46c6-97ff-b289c61084ce	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	22910fd9-1079-4085-8738-c275e69a35d4	\N
31de37a3-df43-4ea9-a53c-50b410236d2b	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	22910fd9-1079-4085-8738-c275e69a35d4	\N
8ec15c21-d734-4711-b779-d723d8a3aac6	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	22910fd9-1079-4085-8738-c275e69a35d4	\N
3fb18a2a-284f-4be3-bae2-122b7fde1e20	1	12:10:00	13:10:00	13:20:00	13:50:00	db4a1f8e-16b2-4ce4-8ff8-a1aaaa97c907	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
2492164f-a647-4679-826e-ba8bc46f51c6	3690	\N	b26e630d-6438-44e3-8be1-b2f59268340f	3690
2e2113e5-cf38-4502-b6ae-c6ab9f11f340	3610	\N	b26e630d-6438-44e3-8be1-b2f59268340f	3610
3e384b3f-a6b2-4649-b0d7-c9fd842275ad	3500	\N	b26e630d-6438-44e3-8be1-b2f59268340f	3500
567d9224-3123-4274-93b5-07e38d32ea3d	3600	\N	b26e630d-6438-44e3-8be1-b2f59268340f	3600
c46712c4-3b61-4b72-948e-caf8a6ec6042	3510	\N	b26e630d-6438-44e3-8be1-b2f59268340f	3510
c74f453b-789d-4c81-996a-5bf2e38006ef	3550	\N	b26e630d-6438-44e3-8be1-b2f59268340f	3550
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
bdee986f-91ae-45aa-93a2-eb806cbb7fe1	Сварочный цех	50	050
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

