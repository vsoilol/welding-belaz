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
    "Time" integer NOT NULL,
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
    "MasterId" uuid NOT NULL,
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
647e6330-c115-4e75-a7d0-ef3b782dc21b	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
1172830f-1afd-41be-aca2-19a0217bd957	e6e65dfe-6356-426b-a94e-13586bcf57eb	c906840f-bb10-46ad-8737-e97a5d31622e	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
ff278ceb-9779-4b73-ad09-05d6631657f1	1	10	t	647e6330-c115-4e75-a7d0-ef3b782dc21b	\N
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
0bff8a07-3e4b-4e74-939a-a142f76340cc	Нерабочее время по графику согласно сменности	\N
12fe2e1b-afe5-496b-b9ab-b7eda55fe92b	Естественные надобности	\N
1a7d773c-814b-4b56-91bf-94e45ddb4230	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
203dc0f6-6934-45e0-9efe-d8db767c3f54	Аварийный ремонт централизованными службами	\N
2a0f5225-a589-49ba-9ebc-4fc14e0306e0	Изменение режимов, смена инструмента, приспособления	\N
32ba9d59-59a5-4a89-912c-6b8d44457000	Отсутствие крана, транспорта	\N
3ac88ffa-16c8-4c87-a15f-a6860f42546d	Установка, выверка, снятие детали	\N
4a3de305-259b-4c57-98a2-a1ed9e6d1b97	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
645f9f18-6bcd-4de0-a9ab-0a83f7c8224c	Отсутствие энергоносителей	\N
7f77332e-1f7e-4c4b-9ff0-08f3e454893d	Плановый ремонт централизованными службами	\N
83ee747c-073b-459d-a516-7bc6202380d3	Отсутствие конструктора, технолога или ожидание его решения	\N
8724718a-1e64-45f6-b4c8-843f4e65e1ab	Праздники и выходные	\N
8dc0e98e-ecbe-448b-91a0-7f2d3b2922c8	Отсутствие сотрудника ОТК	\N
8e9584a2-8acc-48f0-861e-c353ab9bcdaa	Ознакомление с работой, документацией, инструктаж	\N
8f5d7f90-55c5-4fd5-b776-6c3d72790874	Отсутствие оператора в связи с необеспеченностью	\N
9d7adadc-515f-4162-9e14-109e2147185d	Сборочные операции	\N
a3910102-cdeb-43c1-a49d-13900f05df99	Работа с управляющей программой	\N
a3fb6d88-530e-4c74-a7af-2484523f9ae4	Установка, выверка, снятие детали	\N
a9325f87-93d9-4cf3-82dd-f45b37e941f7	Отсутствие материала, заготовок, деталей	\N
b843c9e7-8129-45b2-a3d1-5c7332260c0f	Неявка оператора (б/лист, отпуск, и пр.)	\N
c71556d5-f8d3-4952-84c0-511c207186e1	Отсутствие заданий	\N
cd181452-8865-4202-97e2-1754fa392743	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
df968534-2452-4d8a-9a09-89a5b4636f8d	Работа по карте несоответствий	\N
ed71d247-fda2-414d-ba66-53eca8b509f5	Обед	\N
f6b9ae42-65ef-40be-bf66-7ae796591bd7	Контроль на рабочем месте	\N
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
d7af6afe-d877-4593-89f9-8a28aa1785c9	75436359-a05b-4aa6-bca9-9dbbe9687636	249550
e7e8b317-3317-4d6b-9b4e-69a7800d2e33	463787ca-e020-4f2a-b64b-3619e0bcdd4e	219379
f4c620db-ae94-41db-9be1-c3c17035fe90	2be566d7-519a-4da5-8e86-b2197954d498	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
29e5923c-bd0c-49ad-9698-c3f6fb32669c	1c7167da-2d65-4d7c-a29f-1594ce8b6bf6	610422
429474c4-c987-4420-9f8e-53ab0d66dfa7	4dd4cbe4-77eb-4598-87c5-951a9ebdc299	614962
b6f90c9e-0b91-47b4-88e2-3c67df63201e	a5fc2df1-d439-4da0-89eb-ca36a7649a8b	\N
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
0adb6733-83cd-4e4b-bd20-f5c69434b543	78e27e82-a001-4676-81c4-af7c2b8709ef
14245e1d-951d-4e29-a5e8-6bf576d9b109	78e27e82-a001-4676-81c4-af7c2b8709ef
1a04ccd8-9b3e-4b3a-8311-503509d2eba4	78e27e82-a001-4676-81c4-af7c2b8709ef
1d9d3305-fc95-4397-bd67-59cc52a20533	78e27e82-a001-4676-81c4-af7c2b8709ef
1e503cf4-a277-4920-8ce9-d2654a76cfcb	78e27e82-a001-4676-81c4-af7c2b8709ef
1f7e5c6f-bc0c-43de-aa27-dd79c7d28653	78e27e82-a001-4676-81c4-af7c2b8709ef
24be21de-5283-465b-bdc0-9de990b16158	78e27e82-a001-4676-81c4-af7c2b8709ef
2d3ebfd6-30e2-49c2-8b21-b9740c603dcb	78e27e82-a001-4676-81c4-af7c2b8709ef
2daf6270-ef07-4eb2-a550-9c45595d52b7	78e27e82-a001-4676-81c4-af7c2b8709ef
375e4bf1-e7e6-48f4-8928-be5b724ad402	78e27e82-a001-4676-81c4-af7c2b8709ef
3ff67bfd-378d-4838-a648-053175556eaf	78e27e82-a001-4676-81c4-af7c2b8709ef
45fb4d18-f3c8-4b3e-96fb-36224d4486cc	78e27e82-a001-4676-81c4-af7c2b8709ef
485890f5-d26f-4ad9-9739-9c585f6726b5	78e27e82-a001-4676-81c4-af7c2b8709ef
51437921-6dbd-460c-86ac-2718747be070	78e27e82-a001-4676-81c4-af7c2b8709ef
5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	78e27e82-a001-4676-81c4-af7c2b8709ef
5e265b12-1a53-4fb3-9fd0-a82d42290d09	78e27e82-a001-4676-81c4-af7c2b8709ef
71d9bf28-c03d-451e-aada-e0891c394366	78e27e82-a001-4676-81c4-af7c2b8709ef
7289b4d0-5d38-4cfb-b789-2ce2ee15b97f	78e27e82-a001-4676-81c4-af7c2b8709ef
7433511b-62cc-4750-a01b-e099c91646bf	78e27e82-a001-4676-81c4-af7c2b8709ef
746f5169-a87c-4d8b-b558-c38da218b706	78e27e82-a001-4676-81c4-af7c2b8709ef
77fe15fa-7ab6-45b8-baa3-7badb4769d03	78e27e82-a001-4676-81c4-af7c2b8709ef
7986f356-0572-4e7c-b785-cdcdcf6d53c2	78e27e82-a001-4676-81c4-af7c2b8709ef
8081dbd5-de32-4cc7-8aaa-2e5fa81b621b	78e27e82-a001-4676-81c4-af7c2b8709ef
8331fdd7-0357-4187-b9ac-2c329f0cb432	78e27e82-a001-4676-81c4-af7c2b8709ef
86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	78e27e82-a001-4676-81c4-af7c2b8709ef
8aa520b4-824c-4f59-8eb6-60fd83c66dd8	78e27e82-a001-4676-81c4-af7c2b8709ef
94635fa5-b79d-468d-9f5c-85cdc005ea4b	78e27e82-a001-4676-81c4-af7c2b8709ef
9dbd92f8-a74a-409f-88f9-0988f81d5df4	78e27e82-a001-4676-81c4-af7c2b8709ef
ae4d5bb4-4f2f-40eb-a7cc-5dc861fa57b4	78e27e82-a001-4676-81c4-af7c2b8709ef
b2ceb86d-23e0-4ba8-a338-65c38f189a82	78e27e82-a001-4676-81c4-af7c2b8709ef
b76c563e-ba2f-405b-95a8-8e437766a92f	78e27e82-a001-4676-81c4-af7c2b8709ef
c77a1a23-bff9-46be-b73c-f5d1f11d43d4	78e27e82-a001-4676-81c4-af7c2b8709ef
d495fc34-6815-4c09-8791-154543dfcb18	78e27e82-a001-4676-81c4-af7c2b8709ef
d82a2d5b-dc78-4076-b35b-2acd914b28d6	78e27e82-a001-4676-81c4-af7c2b8709ef
f0ad712d-62c4-4591-ad02-894acc792867	78e27e82-a001-4676-81c4-af7c2b8709ef
f907c372-bd4e-49ca-94da-77c9eebca1da	78e27e82-a001-4676-81c4-af7c2b8709ef
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
0adb6733-83cd-4e4b-bd20-f5c69434b543	18	2	2023-03-12 00:00:00	96a42159-2eda-4f0b-b30a-bf88496907a2	\N
14245e1d-951d-4e29-a5e8-6bf576d9b109	11	2	2023-03-12 00:00:00	7618a286-b4c2-4a0c-bd16-549d7bb46a2c	\N
1a04ccd8-9b3e-4b3a-8311-503509d2eba4	12	2	2023-03-12 00:00:00	7c1a415e-673f-4b1d-8fe7-598902095a59	\N
1d9d3305-fc95-4397-bd67-59cc52a20533	14	2	2023-03-12 00:00:00	87152a76-3fb3-4042-bf96-8cc20d19f22e	\N
1e503cf4-a277-4920-8ce9-d2654a76cfcb	33	2	2023-03-12 00:00:00	f0341d60-cf72-49f8-87a4-a2426f9f9a50	\N
1f7e5c6f-bc0c-43de-aa27-dd79c7d28653	15	2	2023-03-12 00:00:00	8760be35-d50b-45f3-b973-dc9747c0a013	\N
24be21de-5283-465b-bdc0-9de990b16158	21	2	2023-03-12 00:00:00	a8527bdf-3ee5-4aec-a544-c6a3675640b9	\N
2d3ebfd6-30e2-49c2-8b21-b9740c603dcb	13	2	2023-03-12 00:00:00	86c8fdd6-e4a6-43f9-a823-2f318e5ace15	\N
2daf6270-ef07-4eb2-a550-9c45595d52b7	31	2	2023-03-12 00:00:00	ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	\N
375e4bf1-e7e6-48f4-8928-be5b724ad402	3	2	2023-03-12 00:00:00	16c08acb-a79d-4075-9866-61bb1d8e9c07	\N
3ff67bfd-378d-4838-a648-053175556eaf	5	2	2023-03-12 00:00:00	26062b99-339e-4a4b-9e96-544d555ce750	\N
45fb4d18-f3c8-4b3e-96fb-36224d4486cc	17	2	2023-03-12 00:00:00	8b0c5c36-9161-491b-a7da-469da599c995	\N
485890f5-d26f-4ad9-9739-9c585f6726b5	10	2	2023-03-12 00:00:00	738d91e1-3dbb-422d-a056-7148068cc1a7	\N
51437921-6dbd-460c-86ac-2718747be070	30	2	2023-03-12 00:00:00	e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	\N
5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	9	2	2023-03-12 00:00:00	65aa4869-6c9c-438c-a88f-a025cb95cfc2	\N
5e265b12-1a53-4fb3-9fd0-a82d42290d09	6	2	2023-03-12 00:00:00	4617016b-31ab-464c-9682-8f9c707698a3	\N
71d9bf28-c03d-451e-aada-e0891c394366	7	2	2023-03-12 00:00:00	547d6f90-4368-469f-844e-a3927afeec21	\N
7289b4d0-5d38-4cfb-b789-2ce2ee15b97f	32	2	2023-03-12 00:00:00	ed8e415f-43b7-402a-a147-69a48d5aeec5	\N
7433511b-62cc-4750-a01b-e099c91646bf	36	2	2023-03-12 00:00:00	ff50f406-4ea5-46a6-827e-54876d25bae4	\N
746f5169-a87c-4d8b-b558-c38da218b706	29	2	2023-03-12 00:00:00	de61c274-e75a-4f8a-ab56-d9bc3b8922cc	\N
77fe15fa-7ab6-45b8-baa3-7badb4769d03	26	2	2023-03-12 00:00:00	c8d9afdf-5e4f-420e-bd3c-4bc95dc84b1e	\N
7986f356-0572-4e7c-b785-cdcdcf6d53c2	19	2	2023-03-12 00:00:00	9e964f61-63a4-4900-a1ec-ebe0bca8064c	\N
8081dbd5-de32-4cc7-8aaa-2e5fa81b621b	24	2	2023-03-12 00:00:00	ba238c23-e3b8-4851-a3ed-56983d44ba34	\N
8331fdd7-0357-4187-b9ac-2c329f0cb432	2	2	2023-03-12 00:00:00	12b30de9-9f1b-4b99-b3ea-dc910c9d97d9	\N
86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	1	2	2023-03-12 00:00:00	0f874450-2686-401e-b615-66a56cde237c	\N
8aa520b4-824c-4f59-8eb6-60fd83c66dd8	28	2	2023-03-12 00:00:00	d27071e9-5bcc-4f41-acc5-8589b183bb6d	\N
94635fa5-b79d-468d-9f5c-85cdc005ea4b	20	2	2023-03-12 00:00:00	a4120e2d-2bb1-4ea6-9360-1ad01dcec690	\N
9dbd92f8-a74a-409f-88f9-0988f81d5df4	16	2	2023-03-12 00:00:00	892bfc97-6abf-452c-b85b-9fbc69877a8c	\N
ae4d5bb4-4f2f-40eb-a7cc-5dc861fa57b4	8	2	2023-03-12 00:00:00	56160e31-1bfa-430e-953d-329f8f66e7ee	\N
b2ceb86d-23e0-4ba8-a338-65c38f189a82	27	2	2023-03-12 00:00:00	ca9ff468-3876-4cb4-90cf-7c354d522dd4	\N
b76c563e-ba2f-405b-95a8-8e437766a92f	34	2	2023-03-12 00:00:00	fa63a37a-9bec-4e7a-851a-fe56cda7ff63	\N
c77a1a23-bff9-46be-b73c-f5d1f11d43d4	25	2	2023-03-12 00:00:00	c834c846-f175-424e-b991-8d1aa456dc43	\N
d495fc34-6815-4c09-8791-154543dfcb18	23	2	2023-03-12 00:00:00	b26c83f0-53fb-4a91-b6e5-a281f6fb5ad4	\N
d82a2d5b-dc78-4076-b35b-2acd914b28d6	22	2	2023-03-12 00:00:00	b030668e-0449-465b-8b1b-3f58697bbc91	\N
f0ad712d-62c4-4591-ad02-894acc792867	35	2	2023-03-12 00:00:00	fcd17a14-2f1a-4a53-ab76-4c172ea9b749	\N
f907c372-bd4e-49ca-94da-77c9eebca1da	4	2	2023-03-12 00:00:00	1a9221ca-ebca-4f9a-aeeb-096ad1ab3c10	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
892bfc97-6abf-452c-b85b-9fbc69877a8c	0f874450-2686-401e-b615-66a56cde237c
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	12b30de9-9f1b-4b99-b3ea-dc910c9d97d9
892bfc97-6abf-452c-b85b-9fbc69877a8c	16c08acb-a79d-4075-9866-61bb1d8e9c07
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	1a9221ca-ebca-4f9a-aeeb-096ad1ab3c10
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	26062b99-339e-4a4b-9e96-544d555ce750
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	4617016b-31ab-464c-9682-8f9c707698a3
892bfc97-6abf-452c-b85b-9fbc69877a8c	547d6f90-4368-469f-844e-a3927afeec21
892bfc97-6abf-452c-b85b-9fbc69877a8c	56160e31-1bfa-430e-953d-329f8f66e7ee
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	65aa4869-6c9c-438c-a88f-a025cb95cfc2
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	738d91e1-3dbb-422d-a056-7148068cc1a7
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	7618a286-b4c2-4a0c-bd16-549d7bb46a2c
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	7c1a415e-673f-4b1d-8fe7-598902095a59
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	86c8fdd6-e4a6-43f9-a823-2f318e5ace15
a8527bdf-3ee5-4aec-a544-c6a3675640b9	87152a76-3fb3-4042-bf96-8cc20d19f22e
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	8760be35-d50b-45f3-b973-dc9747c0a013
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	892bfc97-6abf-452c-b85b-9fbc69877a8c
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	8b0c5c36-9161-491b-a7da-469da599c995
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	96a42159-2eda-4f0b-b30a-bf88496907a2
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	9e964f61-63a4-4900-a1ec-ebe0bca8064c
a8527bdf-3ee5-4aec-a544-c6a3675640b9	a4120e2d-2bb1-4ea6-9360-1ad01dcec690
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	a8527bdf-3ee5-4aec-a544-c6a3675640b9
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	b030668e-0449-465b-8b1b-3f58697bbc91
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	b26c83f0-53fb-4a91-b6e5-a281f6fb5ad4
a8527bdf-3ee5-4aec-a544-c6a3675640b9	ba238c23-e3b8-4851-a3ed-56983d44ba34
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	c834c846-f175-424e-b991-8d1aa456dc43
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	c8d9afdf-5e4f-420e-bd3c-4bc95dc84b1e
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	ca9ff468-3876-4cb4-90cf-7c354d522dd4
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	d27071e9-5bcc-4f41-acc5-8589b183bb6d
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	de61c274-e75a-4f8a-ab56-d9bc3b8922cc
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	ed8e415f-43b7-402a-a147-69a48d5aeec5
a8527bdf-3ee5-4aec-a544-c6a3675640b9	f0341d60-cf72-49f8-87a4-a2426f9f9a50
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	fa63a37a-9bec-4e7a-851a-fe56cda7ff63
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	fcd17a14-2f1a-4a53-ab76-4c172ea9b749
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	ff50f406-4ea5-46a6-827e-54876d25bae4
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
000ea143-4358-415a-9a72-ecd0b735d27e	0	1	\N	\N	2daf6270-ef07-4eb2-a550-9c45595d52b7	\N
021e5698-3e8f-4174-9e14-ae4dcb698f99	0	3	\N	\N	7289b4d0-5d38-4cfb-b789-2ce2ee15b97f	\N
025c9840-f978-4769-b15e-fb0087dab9a9	0	2	\N	\N	b2ceb86d-23e0-4ba8-a338-65c38f189a82	\N
02ea6b06-17f7-407b-9a16-7b8437a64dc3	0	3	\N	\N	f907c372-bd4e-49ca-94da-77c9eebca1da	\N
0ad6630c-2613-4198-884b-9ed3577f25d9	0	1	\N	\N	86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	\N
11f67465-9a7c-4237-a95b-585473395528	0	2	\N	\N	f0ad712d-62c4-4591-ad02-894acc792867	\N
1376e221-5211-41a0-8938-09672766e96e	0	2	\N	\N	2daf6270-ef07-4eb2-a550-9c45595d52b7	\N
1634c2c3-e21b-4543-9f01-ef405e70a01a	0	3	\N	\N	8081dbd5-de32-4cc7-8aaa-2e5fa81b621b	\N
176ece65-0b7f-493c-9b2a-5482dd2c4cb2	0	3	\N	\N	8aa520b4-824c-4f59-8eb6-60fd83c66dd8	\N
1a9ae03b-d24e-4e6e-ace9-865f57f6ba2e	0	2	\N	\N	d495fc34-6815-4c09-8791-154543dfcb18	\N
1afb3fc6-53c9-4f7c-bd28-03bad907b426	0	2	\N	\N	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
1f1c811c-eaf7-4943-9e6f-fc2bb264e586	0	3	\N	\N	ae4d5bb4-4f2f-40eb-a7cc-5dc861fa57b4	\N
22cb4b0d-1ec8-4bd9-a095-d886fff7ab08	0	1	\N	\N	7433511b-62cc-4750-a01b-e099c91646bf	\N
26b1b8ec-9a39-40c6-8268-446b316d3544	0	3	\N	\N	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
26cda535-38e9-4419-9dca-71a60193035f	0	1	\N	\N	1a04ccd8-9b3e-4b3a-8311-503509d2eba4	\N
2ebc354b-672a-401a-aafe-72eec9325191	0	3	\N	\N	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
2f3712e6-6ab9-47e5-a801-0d19226c5598	0	1	\N	\N	746f5169-a87c-4d8b-b558-c38da218b706	\N
3f287651-9f6c-4a92-a4ff-a36d7a5c9fd4	0	3	\N	\N	24be21de-5283-465b-bdc0-9de990b16158	\N
41c8076f-0873-47b4-9eb8-7d1152aa3acf	0	3	\N	\N	485890f5-d26f-4ad9-9739-9c585f6726b5	\N
433acc08-8c53-41b9-982c-b651a53183e0	0	1	\N	\N	d82a2d5b-dc78-4076-b35b-2acd914b28d6	\N
43452d90-38ba-45df-b364-b363d801d0ba	0	3	\N	\N	f0ad712d-62c4-4591-ad02-894acc792867	\N
44b667b3-f1f1-40b6-ae25-662f0e8725e4	0	3	\N	\N	b76c563e-ba2f-405b-95a8-8e437766a92f	\N
46375a58-c932-4113-ab55-8e316c691a89	0	1	\N	\N	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
490a07dc-644b-4f00-b27c-88aeb09d575b	0	2	\N	\N	1e503cf4-a277-4920-8ce9-d2654a76cfcb	\N
4a07b9b4-6086-4366-a158-8dd03a4dc360	0	3	\N	\N	c77a1a23-bff9-46be-b73c-f5d1f11d43d4	\N
4cdc0fac-390a-43cd-8092-6548d579e97a	0	1	\N	\N	9dbd92f8-a74a-409f-88f9-0988f81d5df4	\N
4f400406-d1cd-4726-8294-8b7cbc2a51ff	0	2	\N	\N	3ff67bfd-378d-4838-a648-053175556eaf	\N
519f65a9-e4e7-4587-b5ab-dcda79d246ff	0	1	\N	\N	8aa520b4-824c-4f59-8eb6-60fd83c66dd8	\N
52c4f441-94cc-428f-93b6-246293aa1aee	0	1	\N	\N	3ff67bfd-378d-4838-a648-053175556eaf	\N
535695bb-a2fb-4597-84d9-2f492aa3a02e	0	1	\N	\N	ae4d5bb4-4f2f-40eb-a7cc-5dc861fa57b4	\N
53a101d4-0392-4555-a671-4267c0efed37	0	1	\N	\N	f0ad712d-62c4-4591-ad02-894acc792867	\N
555d629e-54e4-491d-957a-53c41fc4a82d	0	3	\N	\N	71d9bf28-c03d-451e-aada-e0891c394366	\N
5a93bf62-a9e5-4d0a-9f8d-08277d18e724	0	2	\N	\N	d82a2d5b-dc78-4076-b35b-2acd914b28d6	\N
5cdf5542-8bc4-40e7-9bd9-1ea82fb0e695	0	1	\N	\N	d495fc34-6815-4c09-8791-154543dfcb18	\N
5cfc0997-7f65-47dc-a374-52d7201e9538	0	3	\N	\N	14245e1d-951d-4e29-a5e8-6bf576d9b109	\N
6110d113-4fea-405e-b03c-820b45c3a067	0	3	\N	\N	8331fdd7-0357-4187-b9ac-2c329f0cb432	\N
61d1d3e5-a55a-4185-9a43-eaf90ece6faa	0	2	\N	\N	1d9d3305-fc95-4397-bd67-59cc52a20533	\N
63d72927-f14f-452f-aa3d-5eb82bd0deeb	0	3	\N	\N	2d3ebfd6-30e2-49c2-8b21-b9740c603dcb	\N
64cb8edd-989f-4137-a4fa-f266494fc8a3	0	3	\N	\N	d495fc34-6815-4c09-8791-154543dfcb18	\N
671d73b1-de8e-45ea-b5c4-1bf5da9a6659	0	1	\N	\N	1d9d3305-fc95-4397-bd67-59cc52a20533	\N
6754f386-71c8-4b86-9a15-2ac0f093fdb5	0	2	\N	\N	94635fa5-b79d-468d-9f5c-85cdc005ea4b	\N
67d70d9b-e4f4-44d1-beed-ccac1fbb141a	0	2	\N	\N	77fe15fa-7ab6-45b8-baa3-7badb4769d03	\N
6831be13-9e5a-4162-8eb0-509f92472fab	0	2	\N	\N	5e265b12-1a53-4fb3-9fd0-a82d42290d09	\N
6910aeb6-156e-447d-a064-2f186fb09059	0	2	\N	\N	2d3ebfd6-30e2-49c2-8b21-b9740c603dcb	\N
6a0dcc85-a181-41f2-8ea1-a25596ff8906	0	2	\N	\N	71d9bf28-c03d-451e-aada-e0891c394366	\N
6d5da7fd-aef7-4e93-96c9-33f83c8ef0a2	0	1	\N	\N	2d3ebfd6-30e2-49c2-8b21-b9740c603dcb	\N
6df0ce4b-87a6-4c0f-9b7a-f565583330b3	0	1	\N	\N	1f7e5c6f-bc0c-43de-aa27-dd79c7d28653	\N
6e7bf4ff-6b89-4cb3-acad-6ba523d6c984	0	1	\N	\N	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
6f76d964-1a86-4f96-83ac-303181786986	0	1	\N	\N	1e503cf4-a277-4920-8ce9-d2654a76cfcb	\N
75e2d860-1581-49d9-8f4a-6d3e342b68a2	0	3	\N	\N	746f5169-a87c-4d8b-b558-c38da218b706	\N
7668c074-ef30-459c-9ed7-f790546187f5	0	3	\N	\N	375e4bf1-e7e6-48f4-8928-be5b724ad402	\N
78390b22-a98d-4a05-82c6-5d2055ba4339	0	1	\N	\N	7289b4d0-5d38-4cfb-b789-2ce2ee15b97f	\N
79fe3ddf-3e73-4d79-b124-c1f62baafe3f	0	2	\N	\N	c77a1a23-bff9-46be-b73c-f5d1f11d43d4	\N
7b27bcca-10ac-4b48-8366-ef5152b7cf52	0	1	\N	\N	5e265b12-1a53-4fb3-9fd0-a82d42290d09	\N
7be4e0e2-5680-4bbd-beb7-3474e01e45dd	0	3	\N	\N	1a04ccd8-9b3e-4b3a-8311-503509d2eba4	\N
7e0c994a-7702-4267-af0e-129c5ab4a66a	0	3	\N	\N	1e503cf4-a277-4920-8ce9-d2654a76cfcb	\N
7ee84ee4-88f8-457f-b43f-2125334ef21d	0	3	\N	\N	2daf6270-ef07-4eb2-a550-9c45595d52b7	\N
7fcbb9b8-26cd-4a27-942c-a3f3871947e5	0	2	\N	\N	1f7e5c6f-bc0c-43de-aa27-dd79c7d28653	\N
7ff54ded-7b75-41ea-90e4-a580fa59c0aa	0	2	\N	\N	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
86642b76-f69c-4704-91bc-917d9612e88a	0	3	\N	\N	1d9d3305-fc95-4397-bd67-59cc52a20533	\N
87633619-b327-4ab8-8482-4fb12b25925f	0	2	\N	\N	7433511b-62cc-4750-a01b-e099c91646bf	\N
8bea1547-2a10-492b-979f-ce0c04fc21da	0	1	\N	\N	94635fa5-b79d-468d-9f5c-85cdc005ea4b	\N
8cf28482-24fa-4556-b8ab-4c168efb0878	0	2	\N	\N	ae4d5bb4-4f2f-40eb-a7cc-5dc861fa57b4	\N
8dec08f2-5322-4d56-a97a-bb7a401bbacf	0	2	\N	\N	8331fdd7-0357-4187-b9ac-2c329f0cb432	\N
91003b9c-f60f-4f46-8112-fc2a52258c0a	0	1	\N	\N	14245e1d-951d-4e29-a5e8-6bf576d9b109	\N
93533f73-b9ea-4a33-825d-4beb299c55c0	0	3	\N	\N	1f7e5c6f-bc0c-43de-aa27-dd79c7d28653	\N
9559edf5-2022-44dc-96f9-cbfc12465448	0	2	\N	\N	8aa520b4-824c-4f59-8eb6-60fd83c66dd8	\N
972338e9-8dea-4fad-aacf-c9356560f769	0	2	\N	\N	24be21de-5283-465b-bdc0-9de990b16158	\N
9beeccdf-023c-458d-8241-38886ded3e45	0	2	\N	\N	b76c563e-ba2f-405b-95a8-8e437766a92f	\N
9e7babe5-c697-4874-98b9-85404d598e2d	0	3	\N	\N	94635fa5-b79d-468d-9f5c-85cdc005ea4b	\N
aa9157b3-dfeb-45c6-9db0-5726cd3f1706	0	2	\N	\N	51437921-6dbd-460c-86ac-2718747be070	\N
ab8815c7-ef85-47c1-ab5c-a2c53643ef5c	0	2	\N	\N	375e4bf1-e7e6-48f4-8928-be5b724ad402	\N
b065485f-eec8-4168-8e4f-fa0ef9338322	0	3	\N	\N	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
b2197b2e-4d2c-439d-bff7-b122ceb07d90	0	3	\N	\N	5e265b12-1a53-4fb3-9fd0-a82d42290d09	\N
b394a7f2-c99f-4cca-a4cd-affaeee58e18	0	2	\N	\N	14245e1d-951d-4e29-a5e8-6bf576d9b109	\N
b837bd4c-e83f-42d9-bc47-30cf8b4ffaae	0	3	\N	\N	d82a2d5b-dc78-4076-b35b-2acd914b28d6	\N
bbc93718-6f1f-4e74-9d39-31852871bb7f	0	3	\N	\N	86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	\N
be8bf2af-3d73-44ba-a80b-8b58409c6b0a	0	1	\N	\N	8081dbd5-de32-4cc7-8aaa-2e5fa81b621b	\N
c6386ddf-57a4-42b5-97ee-46a6921f20f7	0	3	\N	\N	b2ceb86d-23e0-4ba8-a338-65c38f189a82	\N
c7914590-39bf-4c86-b347-c59dd56a5325	0	1	\N	\N	45fb4d18-f3c8-4b3e-96fb-36224d4486cc	\N
cb366d60-38e5-4fcf-95e6-4809048c80c3	0	1	\N	\N	77fe15fa-7ab6-45b8-baa3-7badb4769d03	\N
cb5d11ef-bb67-4c9c-8d05-1e7a7246bb7a	0	1	\N	\N	8331fdd7-0357-4187-b9ac-2c329f0cb432	\N
ccf83d0b-314e-45de-905b-0c71fe501076	0	2	\N	\N	45fb4d18-f3c8-4b3e-96fb-36224d4486cc	\N
ce16d639-5010-4685-a8a4-0353cd8d7b66	0	1	\N	\N	24be21de-5283-465b-bdc0-9de990b16158	\N
cf1a3122-a6ad-45fd-acea-3101ca8a3180	0	1	\N	\N	c77a1a23-bff9-46be-b73c-f5d1f11d43d4	\N
cf3b7457-ea49-4a4c-8c9a-e03b6d88cb00	0	3	\N	\N	51437921-6dbd-460c-86ac-2718747be070	\N
d423f7c5-7d03-4b4f-b0b2-59ccbce96a55	0	1	\N	\N	f907c372-bd4e-49ca-94da-77c9eebca1da	\N
dc5d097d-89e6-436c-bdd5-4da28044fb9e	0	1	\N	\N	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
dd1c3b5a-af6a-40da-b59e-45bb5080d83a	0	2	\N	\N	8081dbd5-de32-4cc7-8aaa-2e5fa81b621b	\N
dd60a596-faef-4cc2-90e9-3b3e0356de87	0	2	\N	\N	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
df8b745a-8af4-468e-88f9-a6c86be8abcd	0	1	\N	\N	b2ceb86d-23e0-4ba8-a338-65c38f189a82	\N
e0ac86fa-5f35-49a4-bca4-5a1a37f2f863	0	2	\N	\N	7289b4d0-5d38-4cfb-b789-2ce2ee15b97f	\N
e116c6b7-bb47-4072-a44b-111ab447441a	0	2	\N	\N	746f5169-a87c-4d8b-b558-c38da218b706	\N
e226dd9a-810f-467e-8ad9-007538031773	0	1	\N	\N	b76c563e-ba2f-405b-95a8-8e437766a92f	\N
e2923991-1a4a-4948-82a5-140f0bef3576	0	1	\N	\N	71d9bf28-c03d-451e-aada-e0891c394366	\N
e31365b4-ce86-43c8-818b-a5999d94d044	0	2	\N	\N	9dbd92f8-a74a-409f-88f9-0988f81d5df4	\N
e46386ec-3cd8-4391-9ab3-b8e94d071de4	0	1	\N	\N	375e4bf1-e7e6-48f4-8928-be5b724ad402	\N
e7f03a9f-41b0-4ccb-aec1-a3c800dbd77f	0	3	\N	\N	9dbd92f8-a74a-409f-88f9-0988f81d5df4	\N
e8a72a31-5738-4e58-b81e-fa1537001210	0	3	\N	\N	45fb4d18-f3c8-4b3e-96fb-36224d4486cc	\N
e8d364b2-bed9-4d2c-9f54-e62189f79034	0	3	\N	\N	3ff67bfd-378d-4838-a648-053175556eaf	\N
eb19c2c8-cc5c-4cb9-bc43-a45eb2d0f971	0	2	\N	\N	485890f5-d26f-4ad9-9739-9c585f6726b5	\N
f0f2a7af-6e86-4803-bb57-2785c2c87e7a	0	2	\N	\N	1a04ccd8-9b3e-4b3a-8311-503509d2eba4	\N
f359bbf0-d5cf-43a6-89c2-7d7513959115	0	3	\N	\N	77fe15fa-7ab6-45b8-baa3-7badb4769d03	\N
f39a2478-beb0-4f1c-8298-5d2f49e244f2	0	1	\N	\N	485890f5-d26f-4ad9-9739-9c585f6726b5	\N
f4356a76-484e-466c-b1f4-18e6f8b3d56b	0	1	\N	\N	51437921-6dbd-460c-86ac-2718747be070	\N
f46144b5-c609-481b-b430-a3dbd6320dbf	0	2	\N	\N	f907c372-bd4e-49ca-94da-77c9eebca1da	\N
f607777c-83b8-4233-a1e1-15f4611fa93a	0	2	\N	\N	86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	\N
fe477725-f2a2-4648-b846-872d68c8ec2e	0	3	\N	\N	7433511b-62cc-4750-a01b-e099c91646bf	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
292688da-cb28-4913-b355-3d2a6760804e	Сборка, сварка рам к/с г/п 120-130 т.	6	c906840f-bb10-46ad-8737-e97a5d31622e	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
0f874450-2686-401e-b615-66a56cde237c	Поперечина	75131-2801325	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
12b30de9-9f1b-4b99-b3ea-dc910c9d97d9	Поперечина	75131-2801103-10	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
16c08acb-a79d-4075-9866-61bb1d8e9c07	Кронштейн задней опоры	75131-8521183-20	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
1a9221ca-ebca-4f9a-aeeb-096ad1ab3c10	Накладка рамы поперечная передняя	75131-2801088-70	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
26062b99-339e-4a4b-9e96-544d555ce750	Накладка рамы поперечная передняя	75131-2801088-70	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
4617016b-31ab-464c-9682-8f9c707698a3	Поперечина №3 рамы с опорами	75132-2801152	t	2	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
547d6f90-4368-469f-844e-a3927afeec21	Лист верхний	75131-2801357-10	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
56160e31-1bfa-430e-953d-329f8f66e7ee	Кронштейн задней опоры	75131-8521182-20	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
65aa4869-6c9c-438c-a88f-a025cb95cfc2	Лонжерон рамы правый	75131-2801014-41	t	2	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
738d91e1-3dbb-422d-a056-7148068cc1a7	Лонжерон рамы левый	75131-2801017-70	t	2	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
7618a286-b4c2-4a0c-bd16-549d7bb46a2c	Поперечина №3 рамы с опорами	75132-2801152	t	2	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
7c1a415e-673f-4b1d-8fe7-598902095a59	Опора	75131-2801188	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
86c8fdd6-e4a6-43f9-a823-2f318e5ace15	Усилитель	75131-2801115-01	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
87152a76-3fb3-4042-bf96-8cc20d19f22e	Поперечина	75131-2801325	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
892bfc97-6abf-452c-b85b-9fbc69877a8c	Поперечина рамы задняя	75131-2801300-20	t	2	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
8b0c5c36-9161-491b-a7da-469da599c995	Усилитель	75131-2801114-01	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
9e964f61-63a4-4900-a1ec-ebe0bca8064c	Лонжерон рамы левый	75131-2801015-41	t	2	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
a4120e2d-2bb1-4ea6-9360-1ad01dcec690	Кронштейн задней опоры	75131-8521182-20	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
a8527bdf-3ee5-4aec-a544-c6a3675640b9	Поперечина рамы задняя	75131-2801300-20	t	2	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
b030668e-0449-465b-8b1b-3f58697bbc91	Лист нижний	75131-2801358-10	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
b26c83f0-53fb-4a91-b6e5-a281f6fb5ad4	Лонжерон рамы левый	75131-2801017-70	t	2	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
ba238c23-e3b8-4851-a3ed-56983d44ba34	Кронштейн задней опоры	75131-8521183-20	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
c834c846-f175-424e-b991-8d1aa456dc43	Опора	75131-2801189	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
c8d9afdf-5e4f-420e-bd3c-4bc95dc84b1e	Поперечина	75131-2801103-10	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
ca9ff468-3876-4cb4-90cf-7c354d522dd4	Лонжерон рамы правый	75131-2801016-70	t	2	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
d27071e9-5bcc-4f41-acc5-8589b183bb6d	Усилитель	75131-2801115-01	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
de61c274-e75a-4f8a-ab56-d9bc3b8922cc	Опора	75131-2801189	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
e4516ba9-3d29-4f9f-8a5b-4fcc7f59cbf8	Рама	7513D-2800010-20	t	1	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	4536492774
ec84de05-5cc1-4faa-adcd-bc4b3a44b2d7	Рама	75131-2800010-70	t	1	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	4536479362
ed8e415f-43b7-402a-a147-69a48d5aeec5	Усилитель	75131-2801114-01	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
f0341d60-cf72-49f8-87a4-a2426f9f9a50	Лист верхний	75131-2801357-10	t	3	dfd92d18-4f74-4127-ac22-5e32aae46a3b	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
fa63a37a-9bec-4e7a-851a-fe56cda7ff63	Лонжерон рамы правый	75131-2801016-70	t	2	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
fcd17a14-2f1a-4a53-ab76-4c172ea9b749	Опора	75131-2801188	t	3	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
ff50f406-4ea5-46a6-827e-54876d25bae4	Лонжерон рамы левый	75131-2801015-41	t	2	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	\N	\N	\N	\N
8760be35-d50b-45f3-b973-dc9747c0a013	Лист нижний	75131-2801358-10	t	3	ca83517b-6111-4de0-bde6-ba7e57fb2b19	292688da-cb28-4913-b355-3d2a6760804e	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N	\N
96a42159-2eda-4f0b-b30a-bf88496907a2	Лонжерон рамы правый	75131-2801014-41	t	2	b5de6338-4009-4425-914a-7f35ea9a7117	292688da-cb28-4913-b355-3d2a6760804e	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
4e365c3f-ee99-40e8-9a9b-687ccc53735f	Admin	\N
25cf70db-cbba-48cd-a7bb-5970902a8990	Master	\N
444fa0c2-e093-4da4-872f-c2a39fc022bb	Welder	\N
0388f890-a08b-404b-9ea0-a09f3e44b4b9	Inspector	\N
7af2b25f-2fe7-45a4-a5f4-611f954020ca	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
008c5f3c-b38f-4ff7-ae2b-2b5a9ddf1deb	2023-03-12 00:00:00	572943c2-42f9-4a31-a3d3-d4586d237d3a	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
017a8514-2150-424f-9ee2-738a9c075799	2023-03-12 00:00:00	fc6d5843-56b1-4b59-8888-d87cce3e5d15	86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	\N
01ef2045-fbe3-4def-b365-a3e75471329d	2023-03-12 00:00:00	f71c73df-d735-4cf1-bf44-4c5fdf35a8d5	d495fc34-6815-4c09-8791-154543dfcb18	\N
03aba36c-9f09-4e20-8820-df3f782de001	2023-03-12 00:00:00	7c6154d6-740f-4d5a-8634-0de034a38387	1d9d3305-fc95-4397-bd67-59cc52a20533	\N
042e5218-46b2-417b-8b80-f6759ab13c6a	2023-03-12 00:00:00	ff990a2e-b1e5-4eba-a779-f2d6d6c4421a	ae4d5bb4-4f2f-40eb-a7cc-5dc861fa57b4	\N
08d05aa3-6f73-435e-93f6-816689207715	2023-03-12 00:00:00	e2c5ee53-59bf-4d4e-ba9a-cacf7f9ba946	d495fc34-6815-4c09-8791-154543dfcb18	\N
1033430c-d028-479a-a11b-266d2f818552	2023-03-12 00:00:00	faef541d-52ff-4b34-8081-7038ae5b0c27	71d9bf28-c03d-451e-aada-e0891c394366	\N
104bc3ed-4909-4132-8553-deb9372ea86f	2023-03-12 00:00:00	9edd789a-d343-4284-8f3d-429347b4cab9	485890f5-d26f-4ad9-9739-9c585f6726b5	\N
112155ba-6809-473d-a40f-1ee971891af7	2023-03-12 00:00:00	d036a585-87d9-4671-9a68-86a3d9431a5c	b76c563e-ba2f-405b-95a8-8e437766a92f	\N
15389279-ac20-4290-b614-fb2b7ebbc6fa	2023-03-12 00:00:00	8c2a0468-1b9e-4e69-8070-f043f33c4c67	f0ad712d-62c4-4591-ad02-894acc792867	\N
1aac6561-c619-4e5f-bb9d-671b84843f48	2023-03-12 00:00:00	a201ad78-fbe4-4da2-9de4-31a5eb8a3fd4	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
244e6828-8db5-4848-b073-f52723418d8d	2023-03-12 00:00:00	823a59bd-27b4-4265-b9c4-be04726d631f	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
2aec99aa-8fa3-4332-98ec-ff41a2e0ad13	2023-03-12 00:00:00	141dcd2f-a962-4abb-9b2e-69f0e0b7f6a7	86d6f817-9f04-4613-bb93-f2e9a2ed5ab6	\N
2c6e4910-e612-40b6-a6e3-737c56d894ea	2023-03-12 00:00:00	cc3cdfd5-f9bc-41a3-b560-eb4e14a27f1b	5e265b12-1a53-4fb3-9fd0-a82d42290d09	\N
2d30fd58-b4c9-4747-a281-5803b0ab60a9	2023-03-12 00:00:00	c22610ae-9e9b-4ae4-b8b3-0fb8077be14b	d82a2d5b-dc78-4076-b35b-2acd914b28d6	\N
2f275a2d-febb-4455-b216-20b2aaa4ad7f	2023-03-12 00:00:00	db0732b6-3af1-49f4-bf2d-ce6d45af4b4e	f907c372-bd4e-49ca-94da-77c9eebca1da	\N
2f374e2d-2e7f-4993-8b73-db2a4e95a523	2023-03-12 00:00:00	9e2ea457-6dd8-446f-861b-5e6e708034cf	7433511b-62cc-4750-a01b-e099c91646bf	\N
37d37d8c-2715-4a00-b3f4-a8915b92cc1e	2023-03-12 00:00:00	740e8f6a-c931-4ffd-a7bb-45a828d1daaa	24be21de-5283-465b-bdc0-9de990b16158	\N
38d9a56c-6c69-4f75-8a4c-63bcf0d2d929	2023-03-12 00:00:00	be02d7ef-8195-4dbf-a57f-8d7de47f17d5	7433511b-62cc-4750-a01b-e099c91646bf	\N
3a29528f-14e4-4eec-a7f4-c0ceda7c2398	2023-03-12 00:00:00	27211234-b367-42d8-b424-af2b6fd5371c	7433511b-62cc-4750-a01b-e099c91646bf	\N
48ac3253-0679-4a0e-983f-083e098530c0	2023-03-12 00:00:00	b58a6fdb-d745-43bb-ad5d-06fb1c3043f5	3ff67bfd-378d-4838-a648-053175556eaf	\N
66c4f8ea-b49c-44f3-8eb9-531c811cc7cf	2023-03-12 00:00:00	95f08d1a-54f8-4785-a8f3-8f9b78492bf0	485890f5-d26f-4ad9-9739-9c585f6726b5	\N
6963c303-cbf7-42d6-b6cc-1a130ee0015c	2023-03-12 00:00:00	b837a9c0-7346-4851-b146-3bb5859a4b0f	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
6c0c61d4-93e3-489f-871f-222c0f980fcc	2023-03-12 00:00:00	b7f3bb05-495a-4309-8449-3c6f9105caa0	8331fdd7-0357-4187-b9ac-2c329f0cb432	\N
71d6bbef-f02f-4003-8146-24fb6c276a45	2023-03-12 00:00:00	175bac35-8454-4339-9b48-486fd44065f8	b2ceb86d-23e0-4ba8-a338-65c38f189a82	\N
7651c6a6-2413-41b2-a42a-5933be6c4fc9	2023-03-12 00:00:00	265cc4a2-5df6-484b-bcec-8c6d1afa46d3	b76c563e-ba2f-405b-95a8-8e437766a92f	\N
7c3afe05-3b38-4df0-967e-811428e47980	2023-03-12 00:00:00	441a9f46-ed51-4515-99cf-3540203a9796	8081dbd5-de32-4cc7-8aaa-2e5fa81b621b	\N
828255a9-0596-429f-abef-92aa037ed715	2023-03-12 00:00:00	125523ee-aa64-4f66-bbc2-cf934870920e	71d9bf28-c03d-451e-aada-e0891c394366	\N
831bb369-32fb-4ea6-8584-2ff94005754a	2023-03-12 00:00:00	478ff01e-a24e-42a5-855f-92302c29cb98	b76c563e-ba2f-405b-95a8-8e437766a92f	\N
834b3a0f-5a31-491d-9251-334745b1b253	2023-03-12 00:00:00	35d2e766-6105-472f-a0cf-f796721faffd	1e503cf4-a277-4920-8ce9-d2654a76cfcb	\N
84609b18-5cb5-4c44-8f91-cd5babcfaeb7	2023-03-12 00:00:00	d927dd8d-f47d-40f1-87b3-5a0fe55c9974	d495fc34-6815-4c09-8791-154543dfcb18	\N
8537658e-679c-4725-bcff-404360beedec	2023-03-12 00:00:00	11b6fbfe-b782-42fc-b74d-802b7f0fdc7d	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
855529a8-b8c3-44bf-85ba-a97a71afe5d7	2023-03-12 00:00:00	b5b18516-f1dc-4b50-a0c1-c8b305c5ea76	f0ad712d-62c4-4591-ad02-894acc792867	\N
891d7630-0942-4ce3-a051-5dbcc5c0c38a	2023-03-12 00:00:00	b794bf4c-6b25-4243-95b8-0669b11a3682	24be21de-5283-465b-bdc0-9de990b16158	\N
8a718f4e-c0ca-4f76-a917-de268ce336a7	2023-03-12 00:00:00	3e61b515-3a76-4b39-b424-ca94d5ded2b2	485890f5-d26f-4ad9-9739-9c585f6726b5	\N
8bbc5c67-1531-41ae-a6e1-4d36c92b2998	2023-03-12 00:00:00	25d646fe-3236-48b8-bcbb-73aa951d6023	1f7e5c6f-bc0c-43de-aa27-dd79c7d28653	\N
90d8abd6-0924-4ae2-837f-ec8124165210	2023-03-12 00:00:00	e7e5103c-483a-4bcd-b6c8-1a15b6cf5997	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
938e612f-dc00-40c6-a9b5-c32f7d68143b	2023-03-12 00:00:00	a176f118-ace3-4da8-9984-947e3bc6a2d8	2d3ebfd6-30e2-49c2-8b21-b9740c603dcb	\N
97390ab5-a6e9-460e-ad47-9a64eb439f4a	2023-03-12 00:00:00	531f3823-658e-4e92-b36b-e073dad14901	94635fa5-b79d-468d-9f5c-85cdc005ea4b	\N
9e818da8-5e5e-41fb-a64a-b6965851825f	2023-03-12 00:00:00	9d3a8ccc-ee3f-4c84-88de-ae8a316a8509	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
a0ca1223-ca08-4725-9ba1-3af12f51ce40	2023-03-12 00:00:00	d1d4f0f8-2bf1-43d8-b150-ac9876315bf0	f0ad712d-62c4-4591-ad02-894acc792867	\N
a185fbc1-e531-4652-bccb-afba4a04d6a2	2023-03-12 00:00:00	5c1f87d9-c331-415d-ba8c-6a2c97c46d0f	375e4bf1-e7e6-48f4-8928-be5b724ad402	\N
a5c6cf61-1741-4ac6-84ac-d6608b9d4d6a	2023-03-12 00:00:00	de75bc49-bd3d-40c6-8223-9eb8919219e9	c77a1a23-bff9-46be-b73c-f5d1f11d43d4	\N
a8109fd1-fb23-461f-b391-090a56b5cae5	2023-03-12 00:00:00	c26b4117-ec41-4ade-b816-cf245d54e23b	7289b4d0-5d38-4cfb-b789-2ce2ee15b97f	\N
aa406581-15c9-4c46-a69f-489562abb4dd	2023-03-12 00:00:00	a8ac5d49-8e56-436a-99a1-03f6a440df75	45fb4d18-f3c8-4b3e-96fb-36224d4486cc	\N
aa89aa67-8417-4e49-9978-53f22916127a	2023-03-12 00:00:00	a2fede06-c237-4756-9fc2-3ec9112d3397	1a04ccd8-9b3e-4b3a-8311-503509d2eba4	\N
b622c36b-0ba1-4b23-a208-35541b47c56a	2023-03-12 00:00:00	1e661797-f4c7-4c03-a9aa-d52a7c9ee59a	9dbd92f8-a74a-409f-88f9-0988f81d5df4	\N
b7d4e7ff-75f0-41d8-9759-bc0981425f8b	2023-03-12 00:00:00	3332d408-44e5-4589-abe0-ca6550ff4256	746f5169-a87c-4d8b-b558-c38da218b706	\N
bb937ab9-3b94-40f7-a4a0-1cf0a82e8c14	2023-03-12 00:00:00	4cf1419f-2884-4ae2-9dc7-8f2f3a2ce4b3	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
bcc4983a-4417-4e28-b30a-9e1035778847	2023-03-12 00:00:00	4faf51aa-cf6f-45e7-ae27-cb1085bd1f5a	1d9d3305-fc95-4397-bd67-59cc52a20533	\N
bd3a4efc-4e88-496c-b3c7-a6502f869284	2023-03-12 00:00:00	38965f9b-6eb1-4e6a-86db-f9e47e7c2920	b2ceb86d-23e0-4ba8-a338-65c38f189a82	\N
bdb7a271-3f77-407b-9f6d-d91c8cddc8c0	2023-03-12 00:00:00	0ddae7d6-955e-468d-93c6-140950d7a0eb	b2ceb86d-23e0-4ba8-a338-65c38f189a82	\N
c108ead5-42d0-4c6a-8ae8-a925e435ab36	2023-03-12 00:00:00	13aa427e-ccbf-4232-875a-9fd751d15f8c	746f5169-a87c-4d8b-b558-c38da218b706	\N
c20b475e-1e65-4900-bb42-fde4c9159d14	2023-03-12 00:00:00	2e50b1c3-d184-42fa-b02a-47a9b7ba478c	1a04ccd8-9b3e-4b3a-8311-503509d2eba4	\N
cabfcfaa-225e-4ceb-95e5-4d2a4829cfd1	2023-03-12 00:00:00	9b54b11c-da0d-4ac8-aef1-cfdf1d20e81a	7433511b-62cc-4750-a01b-e099c91646bf	\N
d2a78fd0-cf1a-422a-92fb-6305c10827cf	2023-03-12 00:00:00	98f6507d-3c5e-42d2-9414-25a0a549ea66	7986f356-0572-4e7c-b785-cdcdcf6d53c2	\N
d662bc69-6e41-4f82-b3ee-9499e8ac6e12	2023-03-12 00:00:00	e0149aca-c39a-4e97-9fc1-469e3d18edbc	1a04ccd8-9b3e-4b3a-8311-503509d2eba4	\N
db41d131-f241-40f8-9446-2e83d9d79e9d	2023-03-12 00:00:00	72aa603b-4eec-4b0b-ab79-22718b0e5442	9dbd92f8-a74a-409f-88f9-0988f81d5df4	\N
dec1cb21-c6c6-41e6-bd26-3e79f688e7c9	2023-03-12 00:00:00	6c2d0a9d-cec6-47aa-a24b-86b6a5ec8762	77fe15fa-7ab6-45b8-baa3-7badb4769d03	\N
df2fd6a4-25e2-4f7f-91c4-e88d1ffb91b2	2023-03-12 00:00:00	c3dd8f8f-b13f-448d-bc5e-471479e2de01	14245e1d-951d-4e29-a5e8-6bf576d9b109	\N
dfaaa509-35b7-4e27-8404-b73a108c1453	2023-03-12 00:00:00	010a7bd4-c2c2-49d9-b9e2-3f6e713d394c	c77a1a23-bff9-46be-b73c-f5d1f11d43d4	\N
e065832c-30b4-43f7-8fe0-97086096359d	2023-03-12 00:00:00	f73bc0d1-30aa-40bf-b83b-e0ba78e6a978	8aa520b4-824c-4f59-8eb6-60fd83c66dd8	\N
e594b6c3-f7ac-43a0-8701-79c82ddad678	2023-03-12 00:00:00	6fa09971-f96b-4a0c-a9c4-b7a1330f7817	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
e941e2ea-d6f4-4dc6-8d36-eeecf210e383	2023-03-12 00:00:00	0c15deb0-28b0-40a8-a63d-676e8cb853e9	1e503cf4-a277-4920-8ce9-d2654a76cfcb	\N
f5e2ea68-6f90-41c7-a4cf-b3b8cff56fa6	2023-03-12 00:00:00	d9ed8f68-74b4-41c8-a147-5b27d966aca3	c77a1a23-bff9-46be-b73c-f5d1f11d43d4	\N
fb42ac53-dae0-42dc-8dad-2388ebfae7ad	2023-03-12 00:00:00	65ca2768-f7a4-452d-9ead-c818fad22c4d	0adb6733-83cd-4e4b-bd20-f5c69434b543	\N
fbc7ebfc-51e9-4685-b4ae-f9e387e02c8d	2023-03-12 00:00:00	ad822d96-ffca-4f4a-9020-c22c407074fa	5dfb1b47-521a-4cf1-83fd-3fb7e0d2e8ef	\N
fd7da6d1-c219-4e6a-aa18-fee7b1e16268	2023-03-12 00:00:00	9086191d-6f8b-4229-81b5-c9470956fcad	746f5169-a87c-4d8b-b558-c38da218b706	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
011b4e48-6e3c-4992-af41-f23d8ff2a069	0	2	\N	\N	c20b475e-1e65-4900-bb42-fde4c9159d14	\N
01c5185a-ac7b-4c7b-9743-0e3df72e531a	0	3	\N	\N	e065832c-30b4-43f7-8fe0-97086096359d	\N
021262cc-6560-4b8f-a4e0-9937a068c224	0	2	\N	\N	08d05aa3-6f73-435e-93f6-816689207715	\N
03d1069a-1ee2-42c4-8c11-472eae7d989a	0	3	\N	\N	2c6e4910-e612-40b6-a6e3-737c56d894ea	\N
0481e5a3-0d1d-4478-8fe6-dca1c1e24a93	0	2	\N	\N	1033430c-d028-479a-a11b-266d2f818552	\N
0931c340-784b-4506-abf1-9b9b7d4d6529	0	2	\N	\N	a0ca1223-ca08-4725-9ba1-3af12f51ce40	\N
096c3026-3d5b-4b9d-89f5-a09aa4f5663e	0	3	\N	\N	fb42ac53-dae0-42dc-8dad-2388ebfae7ad	\N
0bb5aafe-d9e0-44eb-869e-7126d277be43	0	2	\N	\N	e941e2ea-d6f4-4dc6-8d36-eeecf210e383	\N
0e73552b-6c18-4e21-83d5-e7bc17724f8d	0	2	\N	\N	855529a8-b8c3-44bf-85ba-a97a71afe5d7	\N
0ea2cf93-4e71-49d0-995e-aee930f16dc6	0	3	\N	\N	8a718f4e-c0ca-4f76-a917-de268ce336a7	\N
0fee4c93-d29a-420c-a04f-287b752178f3	0	3	\N	\N	7651c6a6-2413-41b2-a42a-5933be6c4fc9	\N
11219c80-d435-4be5-92a1-f32eac41733a	0	3	\N	\N	bcc4983a-4417-4e28-b30a-9e1035778847	\N
13911bdc-2178-4acf-a1a3-2f04f5ced5f5	0	2	\N	\N	104bc3ed-4909-4132-8553-deb9372ea86f	\N
1646a207-b9f0-4555-afb2-c8d1644cf6f6	0	2	\N	\N	d2a78fd0-cf1a-422a-92fb-6305c10827cf	\N
197323a9-4e22-45ef-8a6a-e98119a9936f	0	2	\N	\N	8bbc5c67-1531-41ae-a6e1-4d36c92b2998	\N
1a2084ed-5f8b-4260-a73d-ac22bf6f2a0d	0	2	\N	\N	fd7da6d1-c219-4e6a-aa18-fee7b1e16268	\N
1f2ed4ed-68f3-402f-a7a4-09d1368059c6	0	3	\N	\N	a5c6cf61-1741-4ac6-84ac-d6608b9d4d6a	\N
250e9e47-c7f2-4c5e-a4ec-94735e0f81b6	0	3	\N	\N	855529a8-b8c3-44bf-85ba-a97a71afe5d7	\N
2805e3ec-71f2-4666-b628-e9f078159d4c	0	2	\N	\N	db41d131-f241-40f8-9446-2e83d9d79e9d	\N
2a78aefb-3a46-46af-9cbe-2289a9d9ea2c	0	2	\N	\N	9e818da8-5e5e-41fb-a64a-b6965851825f	\N
2b679c44-9a4f-4a11-a195-6b3dc016d771	0	2	\N	\N	aa89aa67-8417-4e49-9978-53f22916127a	\N
2d396641-ab14-4806-aaec-db2c49238045	0	2	\N	\N	7c3afe05-3b38-4df0-967e-811428e47980	\N
33d220f0-662c-4847-95a3-57fad2f7bf55	0	3	\N	\N	8bbc5c67-1531-41ae-a6e1-4d36c92b2998	\N
393f51f3-45e3-4efe-82a6-0ee165fcc5d3	0	3	\N	\N	df2fd6a4-25e2-4f7f-91c4-e88d1ffb91b2	\N
3c501172-47ba-4f95-9cef-d3772d677003	0	3	\N	\N	dfaaa509-35b7-4e27-8404-b73a108c1453	\N
3d6b02b6-6e53-4b90-8a94-20abc8ec64f5	0	2	\N	\N	2c6e4910-e612-40b6-a6e3-737c56d894ea	\N
432ecf41-4bb4-46e2-8fd6-6ca08801a465	0	2	\N	\N	cabfcfaa-225e-4ceb-95e5-4d2a4829cfd1	\N
436e285d-2757-407f-8f86-8da6d24a08c3	0	3	\N	\N	e594b6c3-f7ac-43a0-8701-79c82ddad678	\N
43fa919f-b031-4e0f-8c3a-a4290b597d76	0	3	\N	\N	97390ab5-a6e9-460e-ad47-9a64eb439f4a	\N
4b5e92e8-901c-40c7-b015-e83054a3ec8e	0	2	\N	\N	f5e2ea68-6f90-41c7-a4cf-b3b8cff56fa6	\N
4f3e9f74-781c-4e04-adbb-9e390b0e5016	0	2	\N	\N	c108ead5-42d0-4c6a-8ae8-a925e435ab36	\N
4f523a71-32ae-4456-bc45-8475e5113658	0	3	\N	\N	15389279-ac20-4290-b614-fb2b7ebbc6fa	\N
4f9c1c80-5e80-417e-ac63-fae236158fe3	0	3	\N	\N	66c4f8ea-b49c-44f3-8eb9-531c811cc7cf	\N
50e06d55-32b5-4f52-badc-a69dfcde385e	0	2	\N	\N	bd3a4efc-4e88-496c-b3c7-a6502f869284	\N
555f283c-2af7-45b4-9322-f999c782f592	0	2	\N	\N	48ac3253-0679-4a0e-983f-083e098530c0	\N
559224f0-6a8b-41bb-8f20-d843baef8138	0	3	\N	\N	37d37d8c-2715-4a00-b3f4-a8915b92cc1e	\N
5737dd6d-50e5-476e-87c1-eb799ebdaabc	0	2	\N	\N	2f374e2d-2e7f-4993-8b73-db2a4e95a523	\N
5924e06e-ae5f-47da-9ea7-c4582cff5698	0	3	\N	\N	104bc3ed-4909-4132-8553-deb9372ea86f	\N
5c2611b1-b39a-49df-b245-7c7cc117a2b3	0	2	\N	\N	1aac6561-c619-4e5f-bb9d-671b84843f48	\N
5dd1024d-c11a-4a8f-bce3-1436a64780de	0	2	\N	\N	38d9a56c-6c69-4f75-8a4c-63bcf0d2d929	\N
5dd6ccfe-d789-4046-ac85-49fcb7f41b3d	0	3	\N	\N	6963c303-cbf7-42d6-b6cc-1a130ee0015c	\N
5e713c9f-bd34-4cf9-beac-8e50f1032131	0	2	\N	\N	bdb7a271-3f77-407b-9f6d-d91c8cddc8c0	\N
5ebb7ea0-d082-4a8e-9d56-30d84fa37f75	0	2	\N	\N	2aec99aa-8fa3-4332-98ec-ff41a2e0ad13	\N
6753b07e-3470-470f-96fe-a97f7db504ef	0	3	\N	\N	cabfcfaa-225e-4ceb-95e5-4d2a4829cfd1	\N
69579e45-9d83-4585-b76d-86e0c0442c06	0	3	\N	\N	1aac6561-c619-4e5f-bb9d-671b84843f48	\N
6cab2ffd-06ba-4407-a72a-5773e083cef0	0	2	\N	\N	244e6828-8db5-4848-b073-f52723418d8d	\N
6d1d758e-b395-4342-98f5-e8886359018e	0	3	\N	\N	6c0c61d4-93e3-489f-871f-222c0f980fcc	\N
71553ea8-2bbe-4ff2-b239-fd6e1ed394d4	0	2	\N	\N	66c4f8ea-b49c-44f3-8eb9-531c811cc7cf	\N
71d36dcb-0c53-4f80-9f58-2811dace37e7	0	3	\N	\N	90d8abd6-0924-4ae2-837f-ec8124165210	\N
729a8492-880c-40f4-880b-eabec47dafb8	0	3	\N	\N	9e818da8-5e5e-41fb-a64a-b6965851825f	\N
7385a10d-c918-4633-9991-b7e0407270dc	0	2	\N	\N	aa406581-15c9-4c46-a69f-489562abb4dd	\N
7b5f6b57-39c8-4bd5-8b81-d526301ff575	0	2	\N	\N	71d6bbef-f02f-4003-8146-24fb6c276a45	\N
7db4a688-3b92-4b60-86ee-be56df181201	0	3	\N	\N	7c3afe05-3b38-4df0-967e-811428e47980	\N
7f349f60-1aa3-4b57-9ab8-c5cda3898dc9	0	3	\N	\N	3a29528f-14e4-4eec-a7f4-c0ceda7c2398	\N
7f734533-eba5-40ac-a701-9a594b4620c4	0	3	\N	\N	a0ca1223-ca08-4725-9ba1-3af12f51ce40	\N
801c17c3-beed-4604-b490-429041bb1c57	0	3	\N	\N	fbc7ebfc-51e9-4685-b4ae-f9e387e02c8d	\N
82f934f0-db33-43fb-a303-25d50156f0a8	0	2	\N	\N	bb937ab9-3b94-40f7-a4a0-1cf0a82e8c14	\N
831e0fdd-1d97-49f2-8101-5127a7dc63a3	0	3	\N	\N	938e612f-dc00-40c6-a9b5-c32f7d68143b	\N
84564ac6-909f-4a65-8d58-e157913ae629	0	3	\N	\N	b622c36b-0ba1-4b23-a208-35541b47c56a	\N
84a45c6b-ac37-4075-84f2-1833f17093ec	0	2	\N	\N	828255a9-0596-429f-abef-92aa037ed715	\N
866464a6-c9ab-4b76-a03e-4caa5e99f6f6	0	3	\N	\N	38d9a56c-6c69-4f75-8a4c-63bcf0d2d929	\N
869d3633-a18b-4f19-87b0-3b1087ff113c	0	3	\N	\N	a8109fd1-fb23-461f-b391-090a56b5cae5	\N
89ea7832-79eb-4f9d-a468-85bfda6c080f	0	3	\N	\N	08d05aa3-6f73-435e-93f6-816689207715	\N
8b117552-83ab-47c8-bec4-846633d5fc17	0	2	\N	\N	b7d4e7ff-75f0-41d8-9759-bc0981425f8b	\N
8d04b491-15bf-4df3-ab4a-a9527ffe5408	0	3	\N	\N	8537658e-679c-4725-bcff-404360beedec	\N
8dafdb03-1806-403b-8008-a3e2c206ea5c	0	2	\N	\N	6963c303-cbf7-42d6-b6cc-1a130ee0015c	\N
8dfc85d6-ae21-4f19-aded-fb0ba58d92ca	0	3	\N	\N	891d7630-0942-4ce3-a051-5dbcc5c0c38a	\N
8f14c4f3-4dcc-409d-9ba4-2fd36db001c4	0	3	\N	\N	bdb7a271-3f77-407b-9f6d-d91c8cddc8c0	\N
9007587e-e9e8-4667-b291-e9785053f0e0	0	2	\N	\N	df2fd6a4-25e2-4f7f-91c4-e88d1ffb91b2	\N
94788ec6-693d-4c8d-8e79-23d3ddc83b6c	0	2	\N	\N	017a8514-2150-424f-9ee2-738a9c075799	\N
97fbacdc-1dc9-4bad-a7e0-1bc7295ef1ff	0	3	\N	\N	f5e2ea68-6f90-41c7-a4cf-b3b8cff56fa6	\N
99e4d0c3-9dc8-4b59-9438-e9c103a9a069	0	2	\N	\N	2d30fd58-b4c9-4747-a281-5803b0ab60a9	\N
9a2c54d0-42b5-45a0-bba6-971ddf1d99ac	0	3	\N	\N	017a8514-2150-424f-9ee2-738a9c075799	\N
9b7e247e-4849-4cdc-b3c3-d87e10d3e3fd	0	3	\N	\N	c108ead5-42d0-4c6a-8ae8-a925e435ab36	\N
9baa3e3d-d782-464c-a9fe-d5075015d41f	0	3	\N	\N	aa406581-15c9-4c46-a69f-489562abb4dd	\N
9d90f224-67db-4650-a16f-fc11d5c03289	0	2	\N	\N	3a29528f-14e4-4eec-a7f4-c0ceda7c2398	\N
a001977c-9a83-4f20-b108-eba819fadaf2	0	3	\N	\N	2aec99aa-8fa3-4332-98ec-ff41a2e0ad13	\N
a2e9c7f2-f3da-40c0-8256-33163534d0ee	0	3	\N	\N	834b3a0f-5a31-491d-9251-334745b1b253	\N
a367f185-0720-4de6-80cf-6b0492be7859	0	2	\N	\N	03aba36c-9f09-4e20-8820-df3f782de001	\N
a88ca122-5788-41a0-8e99-da3a05d912ed	0	2	\N	\N	6c0c61d4-93e3-489f-871f-222c0f980fcc	\N
ab858ac2-8595-450d-b6f8-7b698ada2486	0	2	\N	\N	37d37d8c-2715-4a00-b3f4-a8915b92cc1e	\N
abf37d8e-4129-4eab-b669-479e3bdf1499	0	2	\N	\N	8a718f4e-c0ca-4f76-a917-de268ce336a7	\N
ae9b0943-08cd-49a0-b542-9b5e3b117adc	0	2	\N	\N	834b3a0f-5a31-491d-9251-334745b1b253	\N
af50f20b-7a77-4cfb-86d0-e3dc14819ef9	0	2	\N	\N	fbc7ebfc-51e9-4685-b4ae-f9e387e02c8d	\N
afc92a94-5c96-44ec-a5f3-100b54d180e6	0	3	\N	\N	828255a9-0596-429f-abef-92aa037ed715	\N
b131f5dd-8a3b-4e53-b02e-6fc2337f7c27	0	3	\N	\N	71d6bbef-f02f-4003-8146-24fb6c276a45	\N
b24e1671-add0-4297-afd6-1a1a853cbfcc	0	3	\N	\N	042e5218-46b2-417b-8b80-f6759ab13c6a	\N
b553ce15-b2d8-4854-9aaa-d0ed95f8d09f	0	2	\N	\N	01ef2045-fbe3-4def-b365-a3e75471329d	\N
b5f86504-3544-40b7-b93f-1d6122aa16bb	0	3	\N	\N	a185fbc1-e531-4652-bccb-afba4a04d6a2	\N
b6992451-06d0-483f-b011-a3452bd9ee17	0	3	\N	\N	bd3a4efc-4e88-496c-b3c7-a6502f869284	\N
b8ae9797-5dc9-4cc6-ace1-0e9061fe40d0	0	2	\N	\N	bcc4983a-4417-4e28-b30a-9e1035778847	\N
b8cf8da8-f036-4fc5-a63d-92e409c32308	0	2	\N	\N	a185fbc1-e531-4652-bccb-afba4a04d6a2	\N
baaa54be-6b6f-441c-aa69-37a77685f70e	0	3	\N	\N	dec1cb21-c6c6-41e6-bd26-3e79f688e7c9	\N
bdc05139-ff37-4880-8d5d-baf885dea49b	0	2	\N	\N	dec1cb21-c6c6-41e6-bd26-3e79f688e7c9	\N
be8fdb37-6a27-4ac2-aaaa-a9e23838247b	0	2	\N	\N	fb42ac53-dae0-42dc-8dad-2388ebfae7ad	\N
be9054a9-3edb-4199-b0e1-12088f44f0a2	0	2	\N	\N	b622c36b-0ba1-4b23-a208-35541b47c56a	\N
bf25eb12-d267-41d1-8720-0e5452353751	0	3	\N	\N	2f374e2d-2e7f-4993-8b73-db2a4e95a523	\N
bf6c1baa-4889-4937-bfeb-206a6cfcf3c2	0	3	\N	\N	831bb369-32fb-4ea6-8584-2ff94005754a	\N
c148dfe3-cb60-4260-ae09-9a06598870a9	0	3	\N	\N	2f275a2d-febb-4455-b216-20b2aaa4ad7f	\N
c1b156e9-ed21-4158-be51-2fe9261909eb	0	3	\N	\N	84609b18-5cb5-4c44-8f91-cd5babcfaeb7	\N
c2390582-7e08-442f-9fd1-d2bb89815d19	0	2	\N	\N	e594b6c3-f7ac-43a0-8701-79c82ddad678	\N
c3df67fd-bc41-4650-aee0-9fc389ba67c4	0	2	\N	\N	938e612f-dc00-40c6-a9b5-c32f7d68143b	\N
c464cdc3-c4ee-4c5a-93ab-52ae0ebb56ef	0	2	\N	\N	2f275a2d-febb-4455-b216-20b2aaa4ad7f	\N
c778bacb-8d64-4c6b-a1ae-945b4bd8379d	0	3	\N	\N	48ac3253-0679-4a0e-983f-083e098530c0	\N
c9a4f009-2736-4a17-9d38-351a64da4e8a	0	3	\N	\N	aa89aa67-8417-4e49-9978-53f22916127a	\N
c9a85966-a83b-4684-a7a4-775dabec1f94	0	3	\N	\N	db41d131-f241-40f8-9446-2e83d9d79e9d	\N
cab66c59-1f69-43e4-9536-978b554b01d0	0	2	\N	\N	d662bc69-6e41-4f82-b3ee-9499e8ac6e12	\N
cfeffb17-3a93-4c29-8c44-26bdb0d626fe	0	2	\N	\N	831bb369-32fb-4ea6-8584-2ff94005754a	\N
d0126d00-2508-4954-ba51-caadc091e181	0	3	\N	\N	1033430c-d028-479a-a11b-266d2f818552	\N
d1da89fb-6fca-4f25-a1bd-971a65447aab	0	2	\N	\N	042e5218-46b2-417b-8b80-f6759ab13c6a	\N
d34fbdd5-9af3-4d71-a823-5c3d0e9d68b2	0	2	\N	\N	15389279-ac20-4290-b614-fb2b7ebbc6fa	\N
d5d0dce3-6bda-42fb-b809-0b11fdaa671d	0	2	\N	\N	a8109fd1-fb23-461f-b391-090a56b5cae5	\N
da09e223-94f4-4b0b-9a6a-d4a135c9ef84	0	3	\N	\N	d2a78fd0-cf1a-422a-92fb-6305c10827cf	\N
da967ec3-2929-4d79-ad6e-d312661c3b65	0	3	\N	\N	c20b475e-1e65-4900-bb42-fde4c9159d14	\N
dbebc628-c3ef-410c-9ebf-25a69e662676	0	3	\N	\N	244e6828-8db5-4848-b073-f52723418d8d	\N
dc7bf9e8-693c-4e46-9332-51a11606406d	0	3	\N	\N	e941e2ea-d6f4-4dc6-8d36-eeecf210e383	\N
dd164a72-2b14-4374-805f-96c99d8c41ba	0	2	\N	\N	e065832c-30b4-43f7-8fe0-97086096359d	\N
dd71198b-2241-4e05-bcdf-cb5ef5ba2ee9	0	2	\N	\N	97390ab5-a6e9-460e-ad47-9a64eb439f4a	\N
de290dec-3cb9-4032-acc9-d2743baab7b1	0	3	\N	\N	01ef2045-fbe3-4def-b365-a3e75471329d	\N
de84fc77-a6d3-4786-aef6-0cef66dad5c7	0	2	\N	\N	8537658e-679c-4725-bcff-404360beedec	\N
df919986-80dd-467d-aae4-1d6fcd231ef5	0	3	\N	\N	bb937ab9-3b94-40f7-a4a0-1cf0a82e8c14	\N
e0d4884e-1d5f-4d6e-be75-bdcfa7653425	0	2	\N	\N	891d7630-0942-4ce3-a051-5dbcc5c0c38a	\N
e46e1e42-6a0d-4f34-90bb-4e929122ed1e	0	3	\N	\N	2d30fd58-b4c9-4747-a281-5803b0ab60a9	\N
e6c62d71-73dc-409c-934a-35dfb18b3860	0	2	\N	\N	90d8abd6-0924-4ae2-837f-ec8124165210	\N
e80e0b64-e694-42a6-8c46-c2d3576ce5c2	0	2	\N	\N	a5c6cf61-1741-4ac6-84ac-d6608b9d4d6a	\N
e93073c2-4016-4f57-9a6e-b0ad35d03b59	0	3	\N	\N	03aba36c-9f09-4e20-8820-df3f782de001	\N
eaedbab1-b5af-4ff2-bcee-567da01de5f0	0	3	\N	\N	b7d4e7ff-75f0-41d8-9759-bc0981425f8b	\N
eb811aad-7829-4f6c-8c8a-eccc2c1ff9c7	0	2	\N	\N	112155ba-6809-473d-a40f-1ee971891af7	\N
ebd275c5-67f7-40c2-a5bd-68fa236477cc	0	2	\N	\N	dfaaa509-35b7-4e27-8404-b73a108c1453	\N
f12f66fb-a930-40ac-a3f6-de31d0dafde5	0	2	\N	\N	7651c6a6-2413-41b2-a42a-5933be6c4fc9	\N
f6bf9cfb-6c70-47c6-9988-ef2c0b4c5b6c	0	2	\N	\N	008c5f3c-b38f-4ff7-ae2b-2b5a9ddf1deb	\N
f79f1fd8-c0b4-4fb9-853b-41380a41eb52	0	2	\N	\N	84609b18-5cb5-4c44-8f91-cd5babcfaeb7	\N
f7b425eb-0ae9-4d02-90fd-79409ab865f8	0	3	\N	\N	fd7da6d1-c219-4e6a-aa18-fee7b1e16268	\N
f8ab32db-528e-47b4-b621-2b8255dd3445	0	3	\N	\N	d662bc69-6e41-4f82-b3ee-9499e8ac6e12	\N
f921e156-42a6-4db4-b078-b678f71a973b	0	3	\N	\N	008c5f3c-b38f-4ff7-ae2b-2b5a9ddf1deb	\N
fc105bf6-7f29-4cd3-acd4-1ee10dec4504	0	3	\N	\N	112155ba-6809-473d-a40f-1ee971891af7	\N
064cfa1d-04c4-4c48-9d6e-70c52e970160	2	1	\N	\N	1033430c-d028-479a-a11b-266d2f818552	\N
09619959-c60d-4525-9411-b180c82887a3	2	1	\N	\N	03aba36c-9f09-4e20-8820-df3f782de001	\N
0e430a5c-da0e-443a-ad64-417a5d5f4833	2	1	\N	\N	38d9a56c-6c69-4f75-8a4c-63bcf0d2d929	\N
0f714c95-411b-47c8-9d86-5e8a3866f0eb	2	1	\N	\N	d662bc69-6e41-4f82-b3ee-9499e8ac6e12	\N
11799c50-190f-4a10-9e36-1b6522685a9e	2	1	\N	\N	15389279-ac20-4290-b614-fb2b7ebbc6fa	\N
15cfa4ad-3774-4918-b965-ad692f91e203	2	1	\N	\N	a8109fd1-fb23-461f-b391-090a56b5cae5	\N
18f10165-23b5-496a-ac2f-7fabe974ad94	2	1	\N	\N	b622c36b-0ba1-4b23-a208-35541b47c56a	\N
1913b154-5ca9-4437-aaf8-1bcd3e5ddc5f	2	1	\N	\N	891d7630-0942-4ce3-a051-5dbcc5c0c38a	\N
1bd130b4-b81c-4084-9ffe-c608eaaada2f	2	1	\N	\N	90d8abd6-0924-4ae2-837f-ec8124165210	\N
1f8104b4-068e-42a6-adeb-4e962c7b80ea	2	1	\N	\N	104bc3ed-4909-4132-8553-deb9372ea86f	\N
258007fa-e004-46e0-b2ec-9bb62b519289	2	1	\N	\N	a185fbc1-e531-4652-bccb-afba4a04d6a2	\N
2a4918cc-8d93-4b1f-a8ec-a0f899e4d898	2	1	\N	\N	a0ca1223-ca08-4725-9ba1-3af12f51ce40	\N
2f46ad09-dbf7-4e2e-a9e8-da503c2bd3c0	2	1	\N	\N	c108ead5-42d0-4c6a-8ae8-a925e435ab36	\N
2f88c179-4125-49c2-b971-3f02f3a03e70	2	1	\N	\N	f5e2ea68-6f90-41c7-a4cf-b3b8cff56fa6	\N
31c93c38-8926-4ef9-a766-45a3faf5f001	2	1	\N	\N	97390ab5-a6e9-460e-ad47-9a64eb439f4a	\N
366ac42c-a691-4dd6-9348-ae5aa63b7904	2	1	\N	\N	244e6828-8db5-4848-b073-f52723418d8d	\N
393c56a9-a588-4e30-a6fa-ebd5fb677e86	2	1	\N	\N	d2a78fd0-cf1a-422a-92fb-6305c10827cf	\N
3c044a31-b67f-4301-a092-910f34434eb4	2	1	\N	\N	c20b475e-1e65-4900-bb42-fde4c9159d14	\N
3f306e99-40ae-4473-bc86-984e166da675	2	1	\N	\N	db41d131-f241-40f8-9446-2e83d9d79e9d	\N
3f8bcabb-0908-4c21-a99f-d5dbbd5ee6c7	2	1	\N	\N	aa89aa67-8417-4e49-9978-53f22916127a	\N
4661ece7-a6f8-4187-a365-68d4df19d39a	2	1	\N	\N	855529a8-b8c3-44bf-85ba-a97a71afe5d7	\N
472333f7-9f87-4366-9d0e-3c148e95204e	2	1	\N	\N	8a718f4e-c0ca-4f76-a917-de268ce336a7	\N
49c529a3-efa8-4186-a5ed-79e0c422901e	2	1	\N	\N	bcc4983a-4417-4e28-b30a-9e1035778847	\N
4b9aa849-b38a-4e19-b36e-5c860f91724f	2	1	\N	\N	08d05aa3-6f73-435e-93f6-816689207715	\N
4d4d8fd4-b83d-4464-9afd-8e5a4f6d2c78	2	1	\N	\N	938e612f-dc00-40c6-a9b5-c32f7d68143b	\N
518f3db2-ad1d-48c7-a5d3-3ae8e0bc65a4	2	1	\N	\N	bd3a4efc-4e88-496c-b3c7-a6502f869284	\N
5374c781-ce07-41ce-a272-82aa50bc0dad	2	1	\N	\N	6963c303-cbf7-42d6-b6cc-1a130ee0015c	\N
5485d6a8-c02a-44ab-9bbd-03088e4000be	2	1	\N	\N	84609b18-5cb5-4c44-8f91-cd5babcfaeb7	\N
562bdfb1-ecb3-472a-ba61-fb98d3b87e8a	2	1	\N	\N	834b3a0f-5a31-491d-9251-334745b1b253	\N
5a5bfb1c-565a-4ca9-bbab-3ab0702d5463	2	1	\N	\N	2d30fd58-b4c9-4747-a281-5803b0ab60a9	\N
5b4ed7d1-cfb4-44a3-b65e-16728dc11f08	2	1	\N	\N	e065832c-30b4-43f7-8fe0-97086096359d	\N
5caa733b-50a3-4c8b-819e-b8e4c2abd3af	2	1	\N	\N	e594b6c3-f7ac-43a0-8701-79c82ddad678	\N
617bc634-85c3-426b-bca9-03ab9a97f0db	2	1	\N	\N	8bbc5c67-1531-41ae-a6e1-4d36c92b2998	\N
622e1605-f32b-4e0b-adc5-b5eb133986dd	2	1	\N	\N	2f275a2d-febb-4455-b216-20b2aaa4ad7f	\N
62e52316-395d-404b-8000-dd7fdbed895f	2	1	\N	\N	2c6e4910-e612-40b6-a6e3-737c56d894ea	\N
65cfc4e7-1e9f-4617-b606-9b2a4ed940ce	2	1	\N	\N	fbc7ebfc-51e9-4685-b4ae-f9e387e02c8d	\N
66a1d00d-52c7-4b06-acdd-976a951049e4	2	1	\N	\N	bdb7a271-3f77-407b-9f6d-d91c8cddc8c0	\N
6b9e2be4-5192-4c62-9236-64ccb9a6508a	2	1	\N	\N	1aac6561-c619-4e5f-bb9d-671b84843f48	\N
6f60a848-86c1-4fa6-ae88-50963547edde	2	1	\N	\N	01ef2045-fbe3-4def-b365-a3e75471329d	\N
6f84b078-d200-45b4-bda6-c5e883cab609	2	1	\N	\N	7c3afe05-3b38-4df0-967e-811428e47980	\N
75670250-797a-4182-a29f-16a2fdd55539	2	1	\N	\N	042e5218-46b2-417b-8b80-f6759ab13c6a	\N
77d73ad2-108a-496b-817f-9730ef2242b0	2	1	\N	\N	008c5f3c-b38f-4ff7-ae2b-2b5a9ddf1deb	\N
7e066b28-927f-4845-afd7-f9a4269a7759	2	1	\N	\N	48ac3253-0679-4a0e-983f-083e098530c0	\N
a55e0ad1-a815-4624-834c-c93a9bad296e	2	1	\N	\N	b7d4e7ff-75f0-41d8-9759-bc0981425f8b	\N
a6df8bca-8cfd-4fe1-9714-42161250d709	2	1	\N	\N	3a29528f-14e4-4eec-a7f4-c0ceda7c2398	\N
a72e2e8b-c673-47bc-965d-c22fa365145b	2	1	\N	\N	8537658e-679c-4725-bcff-404360beedec	\N
a9563192-bdb3-42a7-a297-b435828ebbb6	2	1	\N	\N	df2fd6a4-25e2-4f7f-91c4-e88d1ffb91b2	\N
aa9e4f58-9a25-4f4d-aaab-7a990575a1e1	2	1	\N	\N	66c4f8ea-b49c-44f3-8eb9-531c811cc7cf	\N
aac6f80a-56e5-4b42-813e-608943cdc622	2	1	\N	\N	dec1cb21-c6c6-41e6-bd26-3e79f688e7c9	\N
b1b1fef5-1c26-4d02-b9ac-1fd59de549e6	2	1	\N	\N	e941e2ea-d6f4-4dc6-8d36-eeecf210e383	\N
b6c93a4b-2a88-49fe-a5f5-db7646dce346	2	1	\N	\N	aa406581-15c9-4c46-a69f-489562abb4dd	\N
c1cc7391-49ad-4d04-bc5b-7d387081922e	2	1	\N	\N	cabfcfaa-225e-4ceb-95e5-4d2a4829cfd1	\N
c38db61d-9805-4074-95ec-df27c2a4fc25	2	1	\N	\N	fb42ac53-dae0-42dc-8dad-2388ebfae7ad	\N
ca8b7077-6fb9-44c8-8918-d89fd13ad3e7	2	1	\N	\N	fd7da6d1-c219-4e6a-aa18-fee7b1e16268	\N
ccc41c9b-3c98-46bc-b638-15c7a52bd036	2	1	\N	\N	6c0c61d4-93e3-489f-871f-222c0f980fcc	\N
cd66b7fb-b0be-4a8f-b6e4-1061040af716	2	1	\N	\N	017a8514-2150-424f-9ee2-738a9c075799	\N
d12886db-4aa5-4357-b8c7-b246497bf4bd	2	1	\N	\N	112155ba-6809-473d-a40f-1ee971891af7	\N
d406984c-227a-4f68-828d-53ab2b769831	2	1	\N	\N	828255a9-0596-429f-abef-92aa037ed715	\N
d7c8a7a1-0791-4ef2-a44a-fcc6a81f2708	2	1	\N	\N	37d37d8c-2715-4a00-b3f4-a8915b92cc1e	\N
dd9dbb78-d336-4ef0-a5ff-d099f933cbfa	2	1	\N	\N	a5c6cf61-1741-4ac6-84ac-d6608b9d4d6a	\N
dea8c55e-26de-4099-af43-7891a0136140	2	1	\N	\N	9e818da8-5e5e-41fb-a64a-b6965851825f	\N
e68baba5-c9d2-4add-acb2-ae9a56d57671	2	1	\N	\N	71d6bbef-f02f-4003-8146-24fb6c276a45	\N
e9cd30ec-5b08-4ad0-91f4-0b5ad0311d87	2	1	\N	\N	bb937ab9-3b94-40f7-a4a0-1cf0a82e8c14	\N
f01662ea-3937-44da-892c-323459fb172e	2	1	\N	\N	dfaaa509-35b7-4e27-8404-b73a108c1453	\N
f2fb58c7-72dc-44c7-bc06-a7b2a982f1c1	2	1	\N	\N	2aec99aa-8fa3-4332-98ec-ff41a2e0ad13	\N
f35c3c17-9d99-46d7-8799-d51068551561	2	1	\N	\N	2f374e2d-2e7f-4993-8b73-db2a4e95a523	\N
f60cb7c3-b1a3-49fb-a4a6-8d478f0787d5	2	1	\N	\N	831bb369-32fb-4ea6-8584-2ff94005754a	\N
fc7d0833-9110-483b-8ef4-0a1e3f2e6871	2	1	\N	\N	7651c6a6-2413-41b2-a42a-5933be6c4fc9	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
010a7bd4-c2c2-49d9-b9e2-3f6e713d394c	56	400	t	f	c834c846-f175-424e-b991-8d1aa456dc43	33a45996-4928-4541-b3ae-ca81af45ebe1	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
0c15deb0-28b0-40a8-a63d-676e8cb853e9	2	1880	t	f	f0341d60-cf72-49f8-87a4-a2426f9f9a50	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
0ddae7d6-955e-468d-93c6-140950d7a0eb	58	900	t	f	ca9ff468-3876-4cb4-90cf-7c354d522dd4	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
11b6fbfe-b782-42fc-b74d-802b7f0fdc7d	18	4000	t	f	96a42159-2eda-4f0b-b30a-bf88496907a2	29eca622-5262-4719-bde8-d736315e8fd9	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
125523ee-aa64-4f66-bbc2-cf934870920e	2	1880	t	f	547d6f90-4368-469f-844e-a3927afeec21	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
13aa427e-ccbf-4232-875a-9fd751d15f8c	58	900	t	f	de61c274-e75a-4f8a-ab56-d9bc3b8922cc	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
141dcd2f-a962-4abb-9b2e-69f0e0b7f6a7	2	1880	t	f	0f874450-2686-401e-b615-66a56cde237c	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
175bac35-8454-4339-9b48-486fd44065f8	55	400	t	f	ca9ff468-3876-4cb4-90cf-7c354d522dd4	2f50c28d-4e1b-4b3f-9897-fbb8f5bd0978	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
1e661797-f4c7-4c03-a9aa-d52a7c9ee59a	48	1900	t	f	892bfc97-6abf-452c-b85b-9fbc69877a8c	3f4c550b-7b70-434d-abf0-26affca78fdd	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
25d646fe-3236-48b8-bcbb-73aa951d6023	48	1900	t	f	8760be35-d50b-45f3-b973-dc9747c0a013	3f4c550b-7b70-434d-abf0-26affca78fdd	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
265cc4a2-5df6-484b-bcec-8c6d1afa46d3	55	400	t	f	fa63a37a-9bec-4e7a-851a-fe56cda7ff63	2f50c28d-4e1b-4b3f-9897-fbb8f5bd0978	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
27211234-b367-42d8-b424-af2b6fd5371c	39	280	t	f	ff50f406-4ea5-46a6-827e-54876d25bae4	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
2e50b1c3-d184-42fa-b02a-47a9b7ba478c	58	900	t	f	7c1a415e-673f-4b1d-8fe7-598902095a59	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
3332d408-44e5-4589-abe0-ca6550ff4256	56	400	t	f	de61c274-e75a-4f8a-ab56-d9bc3b8922cc	33a45996-4928-4541-b3ae-ca81af45ebe1	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
35d2e766-6105-472f-a0cf-f796721faffd	1	1900	t	f	f0341d60-cf72-49f8-87a4-a2426f9f9a50	259a144e-5457-450d-abe9-138328d2c6dc	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
38965f9b-6eb1-4e6a-86db-f9e47e7c2920	39	280	t	f	ca9ff468-3876-4cb4-90cf-7c354d522dd4	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
3e61b515-3a76-4b39-b424-ca94d5ded2b2	58	900	t	f	738d91e1-3dbb-422d-a056-7148068cc1a7	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
441a9f46-ed51-4515-99cf-3540203a9796	2	1880	t	f	ba238c23-e3b8-4851-a3ed-56983d44ba34	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
478ff01e-a24e-42a5-855f-92302c29cb98	58	900	t	f	fa63a37a-9bec-4e7a-851a-fe56cda7ff63	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
4cf1419f-2884-4ae2-9dc7-8f2f3a2ce4b3	54	400	t	f	96a42159-2eda-4f0b-b30a-bf88496907a2	30f7657b-74cc-4184-9123-9f4ad5acd1ea	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
4faf51aa-cf6f-45e7-ae27-cb1085bd1f5a	2	1880	t	f	87152a76-3fb3-4042-bf96-8cc20d19f22e	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
531f3823-658e-4e92-b36b-e073dad14901	2	1880	t	f	a4120e2d-2bb1-4ea6-9360-1ad01dcec690	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
572943c2-42f9-4a31-a3d3-d4586d237d3a	58	900	t	f	9e964f61-63a4-4900-a1ec-ebe0bca8064c	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
5c1f87d9-c331-415d-ba8c-6a2c97c46d0f	2	1880	t	f	16c08acb-a79d-4075-9866-61bb1d8e9c07	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
65ca2768-f7a4-452d-9ead-c818fad22c4d	39	280	t	f	96a42159-2eda-4f0b-b30a-bf88496907a2	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
6c2d0a9d-cec6-47aa-a24b-86b6a5ec8762	52	1200	t	f	c8d9afdf-5e4f-420e-bd3c-4bc95dc84b1e	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
6fa09971-f96b-4a0c-a9c4-b7a1330f7817	39	280	t	f	65aa4869-6c9c-438c-a88f-a025cb95cfc2	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
72aa603b-4eec-4b0b-ab79-22718b0e5442	39	280	t	f	892bfc97-6abf-452c-b85b-9fbc69877a8c	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
740e8f6a-c931-4ffd-a7bb-45a828d1daaa	48	1900	t	f	a8527bdf-3ee5-4aec-a544-c6a3675640b9	3f4c550b-7b70-434d-abf0-26affca78fdd	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
7c6154d6-740f-4d5a-8634-0de034a38387	1	1900	t	f	87152a76-3fb3-4042-bf96-8cc20d19f22e	259a144e-5457-450d-abe9-138328d2c6dc	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
823a59bd-27b4-4265-b9c4-be04726d631f	58	900	t	f	65aa4869-6c9c-438c-a88f-a025cb95cfc2	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
8c2a0468-1b9e-4e69-8070-f043f33c4c67	58	900	t	f	fcd17a14-2f1a-4a53-ab76-4c172ea9b749	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
9086191d-6f8b-4229-81b5-c9470956fcad	57	400	t	f	de61c274-e75a-4f8a-ab56-d9bc3b8922cc	a9a08e90-a3ec-4118-b690-e24f6234d4af	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
95f08d1a-54f8-4785-a8f3-8f9b78492bf0	57	400	t	f	738d91e1-3dbb-422d-a056-7148068cc1a7	a9a08e90-a3ec-4118-b690-e24f6234d4af	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
98f6507d-3c5e-42d2-9414-25a0a549ea66	56	400	t	f	9e964f61-63a4-4900-a1ec-ebe0bca8064c	33a45996-4928-4541-b3ae-ca81af45ebe1	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
9b54b11c-da0d-4ac8-aef1-cfdf1d20e81a	18	4000	t	f	ff50f406-4ea5-46a6-827e-54876d25bae4	29eca622-5262-4719-bde8-d736315e8fd9	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
9d3a8ccc-ee3f-4c84-88de-ae8a316a8509	58	900	t	f	96a42159-2eda-4f0b-b30a-bf88496907a2	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
9e2ea457-6dd8-446f-861b-5e6e708034cf	58	900	t	f	ff50f406-4ea5-46a6-827e-54876d25bae4	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
9edd789a-d343-4284-8f3d-429347b4cab9	39	280	t	f	738d91e1-3dbb-422d-a056-7148068cc1a7	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
a176f118-ace3-4da8-9984-947e3bc6a2d8	52	1200	t	f	86c8fdd6-e4a6-43f9-a823-2f318e5ace15	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
a201ad78-fbe4-4da2-9de4-31a5eb8a3fd4	18	4000	t	f	9e964f61-63a4-4900-a1ec-ebe0bca8064c	29eca622-5262-4719-bde8-d736315e8fd9	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
a2fede06-c237-4756-9fc2-3ec9112d3397	54	400	t	f	7c1a415e-673f-4b1d-8fe7-598902095a59	30f7657b-74cc-4184-9123-9f4ad5acd1ea	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
a8ac5d49-8e56-436a-99a1-03f6a440df75	52	1200	t	f	8b0c5c36-9161-491b-a7da-469da599c995	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
ad822d96-ffca-4f4a-9020-c22c407074fa	54	400	t	f	65aa4869-6c9c-438c-a88f-a025cb95cfc2	30f7657b-74cc-4184-9123-9f4ad5acd1ea	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
b58a6fdb-d745-43bb-ad5d-06fb1c3043f5	39	280	t	f	26062b99-339e-4a4b-9e96-544d555ce750	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
b5b18516-f1dc-4b50-a0c1-c8b305c5ea76	55	400	t	f	fcd17a14-2f1a-4a53-ab76-4c172ea9b749	2f50c28d-4e1b-4b3f-9897-fbb8f5bd0978	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
b794bf4c-6b25-4243-95b8-0669b11a3682	39	280	t	f	a8527bdf-3ee5-4aec-a544-c6a3675640b9	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
b7f3bb05-495a-4309-8449-3c6f9105caa0	52	1200	t	f	12b30de9-9f1b-4b99-b3ea-dc910c9d97d9	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
b837a9c0-7346-4851-b146-3bb5859a4b0f	39	280	t	f	9e964f61-63a4-4900-a1ec-ebe0bca8064c	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
be02d7ef-8195-4dbf-a57f-8d7de47f17d5	56	400	t	f	ff50f406-4ea5-46a6-827e-54876d25bae4	33a45996-4928-4541-b3ae-ca81af45ebe1	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
c22610ae-9e9b-4ae4-b8b3-0fb8077be14b	48	1900	t	f	b030668e-0449-465b-8b1b-3f58697bbc91	3f4c550b-7b70-434d-abf0-26affca78fdd	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
c26b4117-ec41-4ade-b816-cf245d54e23b	52	1200	t	f	ed8e415f-43b7-402a-a147-69a48d5aeec5	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
c3dd8f8f-b13f-448d-bc5e-471479e2de01	18	4000	t	f	7618a286-b4c2-4a0c-bd16-549d7bb46a2c	29eca622-5262-4719-bde8-d736315e8fd9	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
cc3cdfd5-f9bc-41a3-b560-eb4e14a27f1b	18	4000	t	f	4617016b-31ab-464c-9682-8f9c707698a3	29eca622-5262-4719-bde8-d736315e8fd9	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
d036a585-87d9-4671-9a68-86a3d9431a5c	39	280	t	f	fa63a37a-9bec-4e7a-851a-fe56cda7ff63	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
d1d4f0f8-2bf1-43d8-b150-ac9876315bf0	54	400	t	f	fcd17a14-2f1a-4a53-ab76-4c172ea9b749	30f7657b-74cc-4184-9123-9f4ad5acd1ea	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
d927dd8d-f47d-40f1-87b3-5a0fe55c9974	39	280	t	f	b26c83f0-53fb-4a91-b6e5-a281f6fb5ad4	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
d9ed8f68-74b4-41c8-a147-5b27d966aca3	58	900	t	f	c834c846-f175-424e-b991-8d1aa456dc43	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
db0732b6-3af1-49f4-bf2d-ce6d45af4b4e	39	280	t	f	1a9221ca-ebca-4f9a-aeeb-096ad1ab3c10	260015f4-6765-4e36-9975-a1b0b16ea41c	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
de75bc49-bd3d-40c6-8223-9eb8919219e9	57	400	t	f	c834c846-f175-424e-b991-8d1aa456dc43	a9a08e90-a3ec-4118-b690-e24f6234d4af	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
e0149aca-c39a-4e97-9fc1-469e3d18edbc	55	400	t	f	7c1a415e-673f-4b1d-8fe7-598902095a59	2f50c28d-4e1b-4b3f-9897-fbb8f5bd0978	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
e2c5ee53-59bf-4d4e-ba9a-cacf7f9ba946	58	900	t	f	b26c83f0-53fb-4a91-b6e5-a281f6fb5ad4	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
e7e5103c-483a-4bcd-b6c8-1a15b6cf5997	18	4000	t	f	65aa4869-6c9c-438c-a88f-a025cb95cfc2	29eca622-5262-4719-bde8-d736315e8fd9	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
f71c73df-d735-4cf1-bf44-4c5fdf35a8d5	57	400	t	f	b26c83f0-53fb-4a91-b6e5-a281f6fb5ad4	a9a08e90-a3ec-4118-b690-e24f6234d4af	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
f73bc0d1-30aa-40bf-b83b-e0ba78e6a978	52	1200	t	f	d27071e9-5bcc-4f41-acc5-8589b183bb6d	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
faef541d-52ff-4b34-8081-7038ae5b0c27	1	1900	t	f	547d6f90-4368-469f-844e-a3927afeec21	259a144e-5457-450d-abe9-138328d2c6dc	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
fc6d5843-56b1-4b59-8888-d87cce3e5d15	1	1900	t	f	0f874450-2686-401e-b615-66a56cde237c	259a144e-5457-450d-abe9-138328d2c6dc	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
ff990a2e-b1e5-4eba-a779-f2d6d6c4421a	2	1880	t	f	56160e31-1bfa-430e-953d-329f8f66e7ee	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
259a144e-5457-450d-abe9-138328d2c6dc	1	Инструкция 1	1
260015f4-6765-4e36-9975-a1b0b16ea41c	39	Инструкция 39	39
29eca622-5262-4719-bde8-d736315e8fd9	18	Инструкция 18	18
2f50c28d-4e1b-4b3f-9897-fbb8f5bd0978	55	Инструкция 55	55
30f7657b-74cc-4184-9123-9f4ad5acd1ea	54	Инструкция 54	54
33a45996-4928-4541-b3ae-ca81af45ebe1	56	Инструкция 56	56
3f4c550b-7b70-434d-abf0-26affca78fdd	48	Инструкция 48	48
a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	58	Инструкция 58	58
a9a08e90-a3ec-4118-b690-e24f6234d4af	57	Инструкция 57	57
bb4b160f-25eb-4a53-956e-5f0980fa8d19	52	Инструкция 52	52
f7b84a2d-22ff-44e4-adc9-81240b638a98	2	Инструкция 2	2
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
b5de6338-4009-4425-914a-7f35ea9a7117	75131-2800010-70	Рама	\N	3291137
ca83517b-6111-4de0-bde6-ba7e57fb2b19	7513D-2800010-20	Рама	\N	3330041
dfd92d18-4f74-4127-ac22-5e32aae46a3b	75131-2801300-20	Поперечина рамы задняя	\N	2868425
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
463787ca-e020-4f2a-b64b-3619e0bcdd4e	0388f890-a08b-404b-9ea0-a09f3e44b4b9
75436359-a05b-4aa6-bca9-9dbbe9687636	0388f890-a08b-404b-9ea0-a09f3e44b4b9
1c7167da-2d65-4d7c-a29f-1594ce8b6bf6	25cf70db-cbba-48cd-a7bb-5970902a8990
4dd4cbe4-77eb-4598-87c5-951a9ebdc299	25cf70db-cbba-48cd-a7bb-5970902a8990
1e571ed4-dc75-4298-8136-6a6da5c475b2	444fa0c2-e093-4da4-872f-c2a39fc022bb
22184f49-5d79-4ed9-9492-45dc72e4b184	444fa0c2-e093-4da4-872f-c2a39fc022bb
73683622-53f1-4f65-a1cd-6532bc234977	444fa0c2-e093-4da4-872f-c2a39fc022bb
a1980110-db13-4f39-a100-7b0d6c455194	444fa0c2-e093-4da4-872f-c2a39fc022bb
b520d82a-edbb-4368-93df-7eca9a15694d	444fa0c2-e093-4da4-872f-c2a39fc022bb
d1c892da-5f03-4c1f-9826-191fedc571f9	444fa0c2-e093-4da4-872f-c2a39fc022bb
d35798b1-0517-49ce-bdb4-8750f2323b0e	444fa0c2-e093-4da4-872f-c2a39fc022bb
dbc6ec90-287c-4ff0-8489-e7c1ec4d9310	444fa0c2-e093-4da4-872f-c2a39fc022bb
e6e65dfe-6356-426b-a94e-13586bcf57eb	7af2b25f-2fe7-45a4-a5f4-611f954020ca
38cc3a63-83b2-4b6a-aaa2-d5f9b1f0a554	4e365c3f-ee99-40e8-9a9b-687ccc53735f
577f0b32-2c92-4b82-abdb-87d51534b74f	444fa0c2-e093-4da4-872f-c2a39fc022bb
2be566d7-519a-4da5-8e86-b2197954d498	0388f890-a08b-404b-9ea0-a09f3e44b4b9
7978e62d-c95e-495a-b0b5-675e633d208c	7af2b25f-2fe7-45a4-a5f4-611f954020ca
a5fc2df1-d439-4da0-89eb-ca36a7649a8b	25cf70db-cbba-48cd-a7bb-5970902a8990
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "ProductionAreaId", "IdFromSystem", "RfidTag") FROM stdin;
463787ca-e020-4f2a-b64b-3619e0bcdd4e	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
75436359-a05b-4aa6-bca9-9dbbe9687636	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
1c7167da-2d65-4d7c-a29f-1594ce8b6bf6	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
4dd4cbe4-77eb-4598-87c5-951a9ebdc299	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
1e571ed4-dc75-4298-8136-6a6da5c475b2	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	67:CD:7E:5A
22184f49-5d79-4ed9-9492-45dc72e4b184	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	D7:F1:7D:5A
73683622-53f1-4f65-a1cd-6532bc234977	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	D7:95:55:B4
a1980110-db13-4f39-a100-7b0d6c455194	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	67:5A:70:B4
b520d82a-edbb-4368-93df-7eca9a15694d	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	97:17:60:B4
d1c892da-5f03-4c1f-9826-191fedc571f9	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	27:45:7E:B4
d35798b1-0517-49ce-bdb4-8750f2323b0e	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	17:CD:7F:5A
dbc6ec90-287c-4ff0-8489-e7c1ec4d9310	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	B7:5A:79:B5
e6e65dfe-6356-426b-a94e-13586bcf57eb	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	\N	\N	RFID метка начальника цеха 1
38cc3a63-83b2-4b6a-aaa2-d5f9b1f0a554	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$k+ritf13rlBURlsQ3wFoHKJww2eQzxp0rv+1zGXNy1nC6sym	\N	\N	\N	\N	\N	\N
577f0b32-2c92-4b82-abdb-87d51534b74f	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$oReBiOFh2BKdS8lVA20W/Qmx8qJfd1cCXr/FUI9DG7rpOkMM	\N	\N	\N	\N	\N	\N
2be566d7-519a-4da5-8e86-b2197954d498	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$on4qsPA/EBX+PdjzWCPPuY+PgmoWpJpuwNa7rTXdwIq24VvF	\N	\N	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
7978e62d-c95e-495a-b0b5-675e633d208c	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$w6zVQoz7IM2n68phxccYyJanhMNhJRv7CA9bPKMn/IoztPKb	\N	\N	\N	\N	\N	\N
a5fc2df1-d439-4da0-89eb-ca36a7649a8b	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$NTRv0LCERYUgVGGuFgN7sXwgsF8b9DOxxxNtaHr+1ZfJ9BW4	\N	\N	\N	292688da-cb28-4913-b355-3d2a6760804e	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
1c0f6cab-ce4f-4c8d-a7a0-354aa0163458	1	Заполняющий	230	270	23	26	\N	\N	3f4c550b-7b70-434d-abf0-26affca78fdd	\N
61994b6d-1380-496c-abb2-8480882b3e5e	1	Заполняющий	230	270	23	26	\N	\N	260015f4-6765-4e36-9975-a1b0b16ea41c	\N
852af483-cda7-487b-8bc3-cf4d5a354153	1	Заполняющий	230	270	23	26	\N	\N	bb4b160f-25eb-4a53-956e-5f0980fa8d19	\N
8614df60-0347-4de2-9cf8-351050c182f1	1	Заполняющий	230	270	23	26	\N	\N	33a45996-4928-4541-b3ae-ca81af45ebe1	\N
8f4d5eeb-420d-4a3a-8ca7-0a3081fcc224	1	Заполняющий	230	270	23	26	\N	\N	30f7657b-74cc-4184-9123-9f4ad5acd1ea	\N
908143e5-4919-42b3-ae6a-a47f394569bf	1	Заполняющий	230	270	23	26	\N	\N	259a144e-5457-450d-abe9-138328d2c6dc	\N
9b16abeb-9a79-485c-a277-5c2debff9954	1	Заполняющий	230	270	23	26	\N	\N	2f50c28d-4e1b-4b3f-9897-fbb8f5bd0978	\N
ade71f2d-8f4f-4506-b162-454405e3db98	1	Заполняющий	230	270	23	26	\N	\N	29eca622-5262-4719-bde8-d736315e8fd9	\N
afcd022a-3392-4d5f-b690-79f1b24d0141	1	Заполняющий	230	270	23	26	\N	\N	a9a08e90-a3ec-4118-b690-e24f6234d4af	\N
b47b05ec-afc1-4d65-ae75-1d1cfdf341c5	1	Заполняющий	230	270	23	26	\N	\N	a84ef5ce-38d4-43d0-a38d-abce60d4f8c4	\N
ecd94202-ab14-460d-8feb-fc33738e84ab	1	Заполняющий	230	270	23	26	\N	\N	f7b84a2d-22ff-44e4-adc9-81240b638a98	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
9dd32888-938c-4dc0-a25e-f506379aeeb4	1	Корневой	82	11	12	f	f	t	b50b335c-e92c-4f8e-842a-ee3a46579e6b	383eacdf-7229-4450-837d-ad51d10d8988	\N
bc5b1b22-5630-4da0-b733-6086afbaf963	1	Корневой	82	11	12	f	f	t	c55800f4-e6c7-4fe3-9916-bdce7bbe3673	1b6672ad-6b86-4e7f-bd4e-9d58c0965cff	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
11212f18-58ff-4aa0-86a1-f48b9b78dcad	78e27e82-a001-4676-81c4-af7c2b8709ef
1bffa99b-cddc-4c45-abac-ef6465f51dad	712fe79d-79fc-4ff8-a6bc-e8a6ee159307
23cf9f27-9ce5-4019-8ade-6cc21c253379	1a724632-d5a3-4972-9131-0154f8ea05dd
23cf9f27-9ce5-4019-8ade-6cc21c253379	70c0af00-1d30-4cf1-9f4c-b46cb381b574
31979b1c-8234-4d3f-96fe-875c3dcbb843	1a724632-d5a3-4972-9131-0154f8ea05dd
31979b1c-8234-4d3f-96fe-875c3dcbb843	70c0af00-1d30-4cf1-9f4c-b46cb381b574
61c5834d-973a-49ce-aac3-4f024283de7f	1a724632-d5a3-4972-9131-0154f8ea05dd
61c5834d-973a-49ce-aac3-4f024283de7f	70c0af00-1d30-4cf1-9f4c-b46cb381b574
67ed32f5-d843-411d-9194-14a93f426649	712fe79d-79fc-4ff8-a6bc-e8a6ee159307
98a7e1c9-da34-4665-b7ff-a7abea45cf8a	1a724632-d5a3-4972-9131-0154f8ea05dd
98a7e1c9-da34-4665-b7ff-a7abea45cf8a	70c0af00-1d30-4cf1-9f4c-b46cb381b574
bedfe636-5b04-4ee0-8c79-e284eafe6f71	78e27e82-a001-4676-81c4-af7c2b8709ef
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
11212f18-58ff-4aa0-86a1-f48b9b78dcad	a1980110-db13-4f39-a100-7b0d6c455194	\N	117390
1bffa99b-cddc-4c45-abac-ef6465f51dad	73683622-53f1-4f65-a1cd-6532bc234977	\N	132695
23cf9f27-9ce5-4019-8ade-6cc21c253379	b520d82a-edbb-4368-93df-7eca9a15694d	\N	150838
31979b1c-8234-4d3f-96fe-875c3dcbb843	d35798b1-0517-49ce-bdb4-8750f2323b0e	\N	150882
61c5834d-973a-49ce-aac3-4f024283de7f	22184f49-5d79-4ed9-9492-45dc72e4b184	\N	114729
67ed32f5-d843-411d-9194-14a93f426649	1e571ed4-dc75-4298-8136-6a6da5c475b2	\N	122575
98a7e1c9-da34-4665-b7ff-a7abea45cf8a	d1c892da-5f03-4c1f-9826-191fedc571f9	\N	146164
bedfe636-5b04-4ee0-8c79-e284eafe6f71	dbc6ec90-287c-4ff0-8489-e7c1ec4d9310	\N	121267
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
1a724632-d5a3-4972-9131-0154f8ea05dd	3e926c6d-4643-47b0-b6f3-1003e60dd226
1a724632-d5a3-4972-9131-0154f8ea05dd	8aa24842-8008-4e99-bfc9-c0d79bcd2da3
1a724632-d5a3-4972-9131-0154f8ea05dd	d605261d-a309-419d-8296-e3ebcbcf4607
1a724632-d5a3-4972-9131-0154f8ea05dd	ff514b6e-f849-4610-b01b-59c21b85d7b8
70c0af00-1d30-4cf1-9f4c-b46cb381b574	3e926c6d-4643-47b0-b6f3-1003e60dd226
70c0af00-1d30-4cf1-9f4c-b46cb381b574	8aa24842-8008-4e99-bfc9-c0d79bcd2da3
70c0af00-1d30-4cf1-9f4c-b46cb381b574	d605261d-a309-419d-8296-e3ebcbcf4607
70c0af00-1d30-4cf1-9f4c-b46cb381b574	ff514b6e-f849-4610-b01b-59c21b85d7b8
712fe79d-79fc-4ff8-a6bc-e8a6ee159307	27ac2b07-de42-4b08-91c1-bfd217bd9fdd
712fe79d-79fc-4ff8-a6bc-e8a6ee159307	d605261d-a309-419d-8296-e3ebcbcf4607
78e27e82-a001-4676-81c4-af7c2b8709ef	1e22b6d9-6951-437a-b0e8-4d184d097a5f
78e27e82-a001-4676-81c4-af7c2b8709ef	3e926c6d-4643-47b0-b6f3-1003e60dd226
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
1a724632-d5a3-4972-9131-0154f8ea05dd	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	49283	A6:F1:CF:48
70c0af00-1d30-4cf1-9f4c-b46cb381b574	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	49141	93:57:D8:0B
712fe79d-79fc-4ff8-a6bc-e8a6ee159307	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	49286	35:4E:AC:A5
78e27e82-a001-4676-81c4-af7c2b8709ef	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	49232	03:3D:93:0D
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
b50b335c-e92c-4f8e-842a-ee3a46579e6b	2023-04-09 18:21:40.172415	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	1a724632-d5a3-4972-9131-0154f8ea05dd	bedfe636-5b04-4ee0-8c79-e284eafe6f71	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N
c55800f4-e6c7-4fe3-9916-bdce7bbe3673	2023-04-09 18:21:40.172571	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	1a724632-d5a3-4972-9131-0154f8ea05dd	bedfe636-5b04-4ee0-8c79-e284eafe6f71	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
1b6672ad-6b86-4e7f-bd4e-9d58c0965cff	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8537658e-679c-4725-bcff-404360beedec	bedfe636-5b04-4ee0-8c79-e284eafe6f71	29e5923c-bd0c-49ad-9698-c3f6fb32669c	d7af6afe-d877-4593-89f9-8a28aa1785c9	\N
383eacdf-7229-4450-837d-ad51d10d8988	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	8bbc5c67-1531-41ae-a6e1-4d36c92b2998	bedfe636-5b04-4ee0-8c79-e284eafe6f71	29e5923c-bd0c-49ad-9698-c3f6fb32669c	d7af6afe-d877-4593-89f9-8a28aa1785c9	\N
00bf3fee-eb2f-4ded-89c8-d8c53972e75e	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	017a8514-2150-424f-9ee2-738a9c075799	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
01eaa66d-1ff0-428b-891b-d40d6d8cd081	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6c0c61d4-93e3-489f-871f-222c0f980fcc	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
032b581d-3fc2-4e4e-91ef-2c6c753b30da	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	244e6828-8db5-4848-b073-f52723418d8d	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
0c24b588-add8-4d27-a99c-e4a4c7dcb9a2	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	112155ba-6809-473d-a40f-1ee971891af7	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
131a59f3-b270-4e6e-84ac-92e7d55b24bb	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e594b6c3-f7ac-43a0-8701-79c82ddad678	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
1dbd8f4a-1b73-4d1e-88d9-3ededad41f1f	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	15389279-ac20-4290-b614-fb2b7ebbc6fa	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
1fb50eb3-f49c-46c1-8ba7-bfaaad7f878a	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2aec99aa-8fa3-4332-98ec-ff41a2e0ad13	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
201a9672-3a9c-45ef-8b80-fa86bfaa5490	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	aa89aa67-8417-4e49-9978-53f22916127a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
256170d3-da21-4b2b-8592-b1c117cda85a	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	03aba36c-9f09-4e20-8820-df3f782de001	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
25acd0ad-0bf7-4e3c-bbee-6024f37a7339	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	aa406581-15c9-4c46-a69f-489562abb4dd	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
29cd6b53-baa6-46e2-b164-9f1cf9391212	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	90d8abd6-0924-4ae2-837f-ec8124165210	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
2aca1909-bc18-424e-b59b-0df0d07c715a	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d2a78fd0-cf1a-422a-92fb-6305c10827cf	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
2b931e1d-fc4f-4b82-b899-b63b00b3088f	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a5c6cf61-1741-4ac6-84ac-d6608b9d4d6a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
2cda0bd9-35e0-45fd-b1a9-b4aa12816a97	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d662bc69-6e41-4f82-b3ee-9499e8ac6e12	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
2e7bae59-7981-4d97-9943-142dc83201b2	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bdb7a271-3f77-407b-9f6d-d91c8cddc8c0	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
34439a2f-b724-48b2-82f5-79e36dbc3dd4	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	37d37d8c-2715-4a00-b3f4-a8915b92cc1e	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
38aacb00-79cd-450c-b862-8965c0be0c26	19	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2d30fd58-b4c9-4747-a281-5803b0ab60a9	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
3b0ca171-fabb-4a1a-ae20-95b0f4541951	20	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fbc7ebfc-51e9-4685-b4ae-f9e387e02c8d	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
3f1a21dd-2d6e-4d37-82be-35cd678a421e	21	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1033430c-d028-479a-a11b-266d2f818552	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
45b18249-27c1-4ea6-83ce-35ca063d16e2	22	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	08d05aa3-6f73-435e-93f6-816689207715	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
4c32b90d-06b1-482d-a515-3babf354b006	23	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	008c5f3c-b38f-4ff7-ae2b-2b5a9ddf1deb	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
548b5fd5-8bd2-49ef-9e13-a48bd71b595f	24	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	dfaaa509-35b7-4e27-8404-b73a108c1453	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
5c276fb4-49cc-4d46-b745-00277402c591	25	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c108ead5-42d0-4c6a-8ae8-a925e435ab36	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
5e3544a3-03bd-412b-a3b4-ef02835a5d4b	26	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	38d9a56c-6c69-4f75-8a4c-63bcf0d2d929	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
6004963a-4311-4ea0-8438-8e0e8097bf6e	27	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bcc4983a-4417-4e28-b30a-9e1035778847	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
61c935b1-903d-4607-a9a6-ea80d819bd06	28	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	66c4f8ea-b49c-44f3-8eb9-531c811cc7cf	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
623a5311-db92-4476-94ca-0ee17334b5d7	29	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7c3afe05-3b38-4df0-967e-811428e47980	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
63f47662-73d4-42ba-9add-cc3e94fea97c	30	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6963c303-cbf7-42d6-b6cc-1a130ee0015c	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
692a639f-1550-4354-9758-c42a6f0ec732	31	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e065832c-30b4-43f7-8fe0-97086096359d	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
6b4a05f2-84f6-416f-ad27-0ea58dd792fb	32	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bb937ab9-3b94-40f7-a4a0-1cf0a82e8c14	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
6dfe6190-a35f-41a5-9443-1bd147438261	33	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	71d6bbef-f02f-4003-8146-24fb6c276a45	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
75cf6da3-332d-4870-ab42-ada19f30598a	34	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8a718f4e-c0ca-4f76-a917-de268ce336a7	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
762aec54-869b-469c-bc33-ab4717140737	35	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	84609b18-5cb5-4c44-8f91-cd5babcfaeb7	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
78ca2f40-dff0-426b-94ea-4fa9deffd5e4	36	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	db41d131-f241-40f8-9446-2e83d9d79e9d	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
7c317fb2-c995-4dac-b81f-b2e29ccf1343	37	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2f275a2d-febb-4455-b216-20b2aaa4ad7f	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
7e02b10a-9cec-4cac-9632-b311724748f5	38	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1aac6561-c619-4e5f-bb9d-671b84843f48	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
7f778053-c58e-429f-91d6-806f6413847d	39	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	dec1cb21-c6c6-41e6-bd26-3e79f688e7c9	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
80409882-ab13-44c0-ba8f-ae797e1ebdeb	40	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	828255a9-0596-429f-abef-92aa037ed715	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
8ad139bb-73cb-4736-9ce0-e080cdcc7636	41	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	48ac3253-0679-4a0e-983f-083e098530c0	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
91cb3889-8bc7-4346-aac2-17ee65501009	42	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c20b475e-1e65-4900-bb42-fde4c9159d14	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
9224d19b-c589-42e1-b6e5-5618869c3242	43	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	e941e2ea-d6f4-4dc6-8d36-eeecf210e383	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
982e8447-3fdc-4d37-a416-148956590d34	44	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b622c36b-0ba1-4b23-a208-35541b47c56a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
a09bb9ed-4297-4fa8-affe-4599796c5e2b	45	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	97390ab5-a6e9-460e-ad47-9a64eb439f4a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
a53bcd08-6de4-41c2-bab6-3233446af902	46	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	938e612f-dc00-40c6-a9b5-c32f7d68143b	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
aa9fea28-accf-4260-b69a-17874d13a211	47	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b7d4e7ff-75f0-41d8-9759-bc0981425f8b	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
aac2787f-ba2b-4c5b-a233-8858bfc8df04	48	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fb42ac53-dae0-42dc-8dad-2388ebfae7ad	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
bdfab8e8-c00e-4d54-8085-27788aac7152	49	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a185fbc1-e531-4652-bccb-afba4a04d6a2	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
bf8f789a-d1c3-4d6b-b342-b6bbed1f4954	50	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	855529a8-b8c3-44bf-85ba-a97a71afe5d7	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
c049368c-28f1-4624-a4a5-b808fba406f6	51	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a8109fd1-fb23-461f-b391-090a56b5cae5	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
c0e98d19-fb44-4f7f-9edb-47e74cfcf80f	52	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	3a29528f-14e4-4eec-a7f4-c0ceda7c2398	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
c2ea986c-46a8-4fb1-8a22-eaa5d91089db	53	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fd7da6d1-c219-4e6a-aa18-fee7b1e16268	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
c5a34754-f785-499c-b082-2939c7e15498	54	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	834b3a0f-5a31-491d-9251-334745b1b253	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
c5c4e6db-b631-4013-be26-227db0ead370	55	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	891d7630-0942-4ce3-a051-5dbcc5c0c38a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
c75ccdb9-6bbe-41e4-950d-b82e5eeb9310	56	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2f374e2d-2e7f-4993-8b73-db2a4e95a523	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
ccfce2e6-a92e-4f08-8d0e-432c87e38212	57	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	831bb369-32fb-4ea6-8584-2ff94005754a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
cd6d8e68-bbab-41ac-bce7-5b53b0095b8e	58	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	104bc3ed-4909-4132-8553-deb9372ea86f	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
cfec9eb0-6c26-4b2b-ac40-808a17c3f186	59	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8537658e-679c-4725-bcff-404360beedec	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
d23d55e1-6702-4f0f-b454-ec96ff67ea11	60	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	7651c6a6-2413-41b2-a42a-5933be6c4fc9	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
d5d3f875-be56-466d-9f67-4d8866a6f7ac	61	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	042e5218-46b2-417b-8b80-f6759ab13c6a	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
d918c011-44d0-4a14-a360-0e85f14e3976	62	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2c6e4910-e612-40b6-a6e3-737c56d894ea	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
dbd1112c-9ef6-4fde-8470-2e2cfeb42718	63	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bd3a4efc-4e88-496c-b3c7-a6502f869284	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
dd25dc8e-1acd-41a7-947f-1879007af8d1	64	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	a0ca1223-ca08-4725-9ba1-3af12f51ce40	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
e65fcfee-184f-4c61-ac2a-a1c7e48ff7a0	65	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8bbc5c67-1531-41ae-a6e1-4d36c92b2998	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
ebf45232-81b8-4e6f-a5e9-8cd6cd8778dc	66	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cabfcfaa-225e-4ceb-95e5-4d2a4829cfd1	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
f05ac614-889b-4b9d-946f-631abc17c55f	67	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f5e2ea68-6f90-41c7-a4cf-b3b8cff56fa6	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
f0cfa19d-11fa-4cbb-9b7d-18c9178de329	68	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	df2fd6a4-25e2-4f7f-91c4-e88d1ffb91b2	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
ff94613d-87c4-44b6-bf2c-8fd30810959b	69	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	01ef2045-fbe3-4def-b365-a3e75471329d	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
ffc1327b-f78c-4a54-aa04-95e16976a82f	70	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9e818da8-5e5e-41fb-a64a-b6965851825f	\N	29e5923c-bd0c-49ad-9698-c3f6fb32669c	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
4e4cbf27-76e6-49c0-9e50-2adcbbbec15c	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	647e6330-c115-4e75-a7d0-ef3b782dc21b	\N
c540682b-8b27-4d40-a955-cc488c80ca67	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	647e6330-c115-4e75-a7d0-ef3b782dc21b	\N
fb9c34a2-cb1a-425f-95c8-f920233f3ce6	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	647e6330-c115-4e75-a7d0-ef3b782dc21b	\N
a487b533-fdb5-43a2-9ff7-9e4c6240d445	1	12:10:00	13:10:00	13:20:00	13:50:00	ff278ceb-9779-4b73-ad09-05d6631657f1	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
1e22b6d9-6951-437a-b0e8-4d184d097a5f	3600	\N	292688da-cb28-4913-b355-3d2a6760804e	3600
27ac2b07-de42-4b08-91c1-bfd217bd9fdd	3510	\N	292688da-cb28-4913-b355-3d2a6760804e	3510
3e926c6d-4643-47b0-b6f3-1003e60dd226	3610	\N	292688da-cb28-4913-b355-3d2a6760804e	3610
8aa24842-8008-4e99-bfc9-c0d79bcd2da3	3690	\N	292688da-cb28-4913-b355-3d2a6760804e	3690
d605261d-a309-419d-8296-e3ebcbcf4607	3500	\N	292688da-cb28-4913-b355-3d2a6760804e	3500
ff514b6e-f849-4610-b01b-59c21b85d7b8	3550	\N	292688da-cb28-4913-b355-3d2a6760804e	3550
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
c906840f-bb10-46ad-8737-e97a5d31622e	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 70, true);


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
    ADD CONSTRAINT "FK_WeldingTasks_Masters_MasterId" FOREIGN KEY ("MasterId") REFERENCES public."Masters"("Id") ON DELETE CASCADE;


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

