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
    "RfidTag" text,
    "ProductionAreaId" uuid,
    "IdFromSystem" text
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
    "MasterId" uuid,
    "IdFromSystem" text
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
6988bd9d-c501-4701-91bd-e5bdd648823f	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
2af41d91-0dc3-4aba-9648-85a4c519d7f9	5623e905-a39f-4a6f-892a-fe15932790fe	e828aca6-b54b-4b70-98c6-73d43113602e	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
b7b0654f-176b-4953-b6b3-96bcc4f06edd	1	10	t	6988bd9d-c501-4701-91bd-e5bdd648823f	\N
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
0873fe56-fba0-46e8-a853-646d1da00db7	Отсутствие материала, заготовок, деталей	\N
0879a83d-05cb-4b81-ba59-c5a54f31dc33	Нерабочее время по графику согласно сменности	\N
0b3d2e07-a6e5-480d-a111-d1b61773d693	Обед	\N
135e332d-635c-48c4-b144-9d50061c4653	Неявка оператора (б/лист, отпуск, и пр.)	\N
1f43dc14-708f-4d74-b6e9-cd69e1f303ac	Работа с управляющей программой	\N
26e8cdfa-dcee-4625-9d72-7bf8e03aa68f	Отсутствие заданий	\N
2735583d-19ba-47ae-86bf-2a76d01066dd	Отсутствие сотрудника ОТК	\N
41b27ce6-1dc7-4c96-b5dd-094a47b5172f	Отсутствие энергоносителей	\N
49e8811c-c9c4-440e-9705-6f161e80695c	Ознакомление с работой, документацией, инструктаж	\N
610e21e9-21aa-45a5-a6f8-f4e5a6474e38	Плановый ремонт централизованными службами	\N
65836f68-325d-4973-94f2-284b1d7a151e	Работа по карте несоответствий	\N
66d18ffd-bba6-409b-a17e-b5f5324b353a	Изменение режимов, смена инструмента, приспособления	\N
74a5e942-0350-440c-9d5a-f3f0dc526bd8	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
8f1bdc36-ff12-409c-82ac-f068a4a88f66	Контроль на рабочем месте	\N
96f1178a-b7e6-4198-b82f-1a4579e126ec	Отсутствие конструктора, технолога или ожидание его решения	\N
99848473-33fa-4445-bdc8-a7eb2fc398c9	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
a05663b8-b834-485f-aa16-820b0fa1d5b9	Сборочные операции	\N
a63f0e21-bfa6-4101-8fce-1b95ed68999b	Установка, выверка, снятие детали	\N
bc274aa2-d840-43cd-9861-e59c2f6cc0e9	Отсутствие крана, транспорта	\N
c08813b4-5302-4dd3-ae06-f9328fe24109	Естественные надобности	\N
c6c056de-74c9-4a92-8a38-333110979781	Аварийный ремонт централизованными службами	\N
f5d250b9-4829-4e56-bbe7-f681e58a0bbb	Праздники и выходные	\N
f6526036-4858-4b2c-811c-fc4ae1483a9d	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
f8e13003-d1bd-4300-8955-5d6857037d8c	Установка, выверка, снятие детали	\N
fce34497-ab30-4065-80dd-fd6cbb495af8	Отсутствие оператора в связи с необеспеченностью	\N
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
1b62466a-0262-4de3-b291-62414da93201	7f417fed-9aa0-4dbd-912e-a28ca7c211dc	219379
e66e7ea6-0952-4a28-bb53-642669c55d71	cb8759e0-081f-40dc-8663-25e29de98b0a	249550
0327a306-c81e-42cf-a1de-ecdfcf60e0d8	f8669c9f-7d8e-45a6-991f-f3074b9213f5	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
96db0528-326d-4f01-b8c7-f2f900cd0298	ca90bbbd-c734-43c0-9295-f40907b2bd76	610422
c3c9dce9-39c8-4094-b90f-689ceca31df6	468ea3e1-4b25-4a99-9d97-a8da8559f407	614962
81034154-bc0d-49f2-9469-8ceff93d621b	72b992fa-6df5-4be0-81bc-90dec3b9af8e	\N
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
0189be1c-3bd2-4feb-bf5d-938821d2d4d9	f46ffb24-c901-4bbd-bd11-95642ae5060e
0337171d-545c-4a85-99a4-2fdd0d872318	f46ffb24-c901-4bbd-bd11-95642ae5060e
040b778d-fa3e-437f-8094-35600a819261	f46ffb24-c901-4bbd-bd11-95642ae5060e
04412d22-0a13-4ac3-afaa-db6ec8d919eb	f46ffb24-c901-4bbd-bd11-95642ae5060e
0a5d79d3-b97e-45e1-8caf-e584aed5dac4	f46ffb24-c901-4bbd-bd11-95642ae5060e
0b29b25e-f13a-48e3-bf2c-a126e48b0e48	f46ffb24-c901-4bbd-bd11-95642ae5060e
0ea9fdd7-992a-4a7e-b0b3-15994f9bb256	f46ffb24-c901-4bbd-bd11-95642ae5060e
130ca9e5-5cb4-4cd2-a963-0aee0de505b3	f46ffb24-c901-4bbd-bd11-95642ae5060e
253d7e8d-f23e-4edc-98ce-ca8796a29eb9	f46ffb24-c901-4bbd-bd11-95642ae5060e
28a37300-7107-46e8-99d7-94ce298830d9	f46ffb24-c901-4bbd-bd11-95642ae5060e
2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	f46ffb24-c901-4bbd-bd11-95642ae5060e
2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	f46ffb24-c901-4bbd-bd11-95642ae5060e
48d2beee-5d86-4aff-bc1f-a09aee628f98	f46ffb24-c901-4bbd-bd11-95642ae5060e
4bd2ebf3-049c-45d9-90ae-93fb269cba2f	f46ffb24-c901-4bbd-bd11-95642ae5060e
4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	f46ffb24-c901-4bbd-bd11-95642ae5060e
611fb45f-f87a-45e0-be99-132c62442582	f46ffb24-c901-4bbd-bd11-95642ae5060e
619062f6-3f46-47c8-9656-9bd75e2ba484	f46ffb24-c901-4bbd-bd11-95642ae5060e
6e7464de-da01-4291-b9f7-922a081968f0	f46ffb24-c901-4bbd-bd11-95642ae5060e
743f3abc-ae64-43e9-a806-edae6605a7fe	f46ffb24-c901-4bbd-bd11-95642ae5060e
750d164b-02ff-427f-89ec-f397d4a50c47	f46ffb24-c901-4bbd-bd11-95642ae5060e
755f3254-7fa6-447b-8d70-d53e86dc973b	f46ffb24-c901-4bbd-bd11-95642ae5060e
76c5fb62-dd0a-4b53-8692-eb080c7927fc	f46ffb24-c901-4bbd-bd11-95642ae5060e
7e405454-7c68-4498-9b53-84d79752d2d2	f46ffb24-c901-4bbd-bd11-95642ae5060e
818b751e-5343-455a-9765-36d98deb499f	f46ffb24-c901-4bbd-bd11-95642ae5060e
8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	f46ffb24-c901-4bbd-bd11-95642ae5060e
9208e13c-03c5-441e-a3ed-35c89491b29e	f46ffb24-c901-4bbd-bd11-95642ae5060e
920a17cd-73c4-4a95-b56a-25dfbfbee90f	f46ffb24-c901-4bbd-bd11-95642ae5060e
ab7c3834-1fb6-499d-a42f-320055506913	f46ffb24-c901-4bbd-bd11-95642ae5060e
b71ee58f-939d-42d5-978a-801c2c96971d	f46ffb24-c901-4bbd-bd11-95642ae5060e
c2847237-b8bd-46b3-8f88-59fc86b50d09	f46ffb24-c901-4bbd-bd11-95642ae5060e
cddbecad-36b1-4abd-aa0a-c43f80a87781	f46ffb24-c901-4bbd-bd11-95642ae5060e
dc43793e-7e8f-4c3b-8915-fdd8780de1ae	f46ffb24-c901-4bbd-bd11-95642ae5060e
ec8b3f24-5ab9-4d76-a948-3fc22605ee99	f46ffb24-c901-4bbd-bd11-95642ae5060e
ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	f46ffb24-c901-4bbd-bd11-95642ae5060e
f455ee61-ad70-43e7-bbe9-37b377479a3b	f46ffb24-c901-4bbd-bd11-95642ae5060e
fecc7ef3-a3f4-4085-8ac0-d243cf8cf16a	f46ffb24-c901-4bbd-bd11-95642ae5060e
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
0189be1c-3bd2-4feb-bf5d-938821d2d4d9	27	2	2023-03-12 00:00:00	a613fcd6-439d-453f-a197-557e732c9f23	\N
0337171d-545c-4a85-99a4-2fdd0d872318	7	2	2023-03-12 00:00:00	191ee071-0f79-4674-8f59-199885193113	\N
040b778d-fa3e-437f-8094-35600a819261	17	2	2023-03-12 00:00:00	6cc2b060-7624-4a5e-88ad-1c8dda4233af	\N
04412d22-0a13-4ac3-afaa-db6ec8d919eb	26	2	2023-03-12 00:00:00	a1126f9d-cf31-49a6-9e49-be6cd4911aed	\N
0a5d79d3-b97e-45e1-8caf-e584aed5dac4	1	2	2023-03-12 00:00:00	00afe6fe-26c6-4885-9bee-1a3c748ce8da	\N
0b29b25e-f13a-48e3-bf2c-a126e48b0e48	3	2	2023-03-12 00:00:00	0da857d6-26d8-48e3-977c-7f4aeca0bf1f	\N
0ea9fdd7-992a-4a7e-b0b3-15994f9bb256	36	2	2023-03-12 00:00:00	fc517944-a10e-46d2-9f81-8f6b40bb6d06	\N
130ca9e5-5cb4-4cd2-a963-0aee0de505b3	19	2	2023-03-12 00:00:00	83458d8e-e7a4-4dad-9c4b-0bd89ea97487	\N
253d7e8d-f23e-4edc-98ce-ca8796a29eb9	20	2	2023-03-12 00:00:00	84d14097-a405-4cea-aa31-e2217d84adb2	\N
28a37300-7107-46e8-99d7-94ce298830d9	34	2	2023-03-12 00:00:00	fb3f1dcc-e547-47a1-95db-6f22dd470494	\N
2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	24	2	2023-03-12 00:00:00	9b90bd69-5b90-4d95-a385-b179229c1d0d	\N
2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	21	2	2023-03-12 00:00:00	8aa5a5e1-6949-4ea0-b0be-7a3ec73ac983	\N
48d2beee-5d86-4aff-bc1f-a09aee628f98	13	2	2023-03-12 00:00:00	60d8869c-d97c-45b5-9b86-6b09f0fdec1d	\N
4bd2ebf3-049c-45d9-90ae-93fb269cba2f	33	2	2023-03-12 00:00:00	f8091846-a419-406d-9b06-f8810a8fd39c	\N
4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	23	2	2023-03-12 00:00:00	92af9691-72c6-448b-83d3-f6bcfa2d65a2	\N
611fb45f-f87a-45e0-be99-132c62442582	28	2	2023-03-12 00:00:00	b43ecc28-7d49-4f2f-a6f5-909ed9ddf4f9	\N
619062f6-3f46-47c8-9656-9bd75e2ba484	15	2	2023-03-12 00:00:00	6509288d-7fd0-48ca-8cff-7b6b4639054a	\N
6e7464de-da01-4291-b9f7-922a081968f0	6	2	2023-03-12 00:00:00	1688a612-78a6-4dd8-afed-47b5fec081ca	\N
743f3abc-ae64-43e9-a806-edae6605a7fe	35	2	2023-03-12 00:00:00	fbad1ea7-a07d-4df3-8491-9235edcd0ba0	\N
750d164b-02ff-427f-89ec-f397d4a50c47	12	2	2023-03-12 00:00:00	4cc30b91-8588-4ec2-ab40-324dfb696372	\N
755f3254-7fa6-447b-8d70-d53e86dc973b	25	2	2023-03-12 00:00:00	9d06e121-c0c8-4b1c-ab85-eace8360218e	\N
76c5fb62-dd0a-4b53-8692-eb080c7927fc	22	2	2023-03-12 00:00:00	8fac6409-2a34-42f6-b4d7-ab5461175e9a	\N
7e405454-7c68-4498-9b53-84d79752d2d2	10	2	2023-03-12 00:00:00	33a0174c-8e69-4270-bbac-22d0734de27c	\N
818b751e-5343-455a-9765-36d98deb499f	18	2	2023-03-12 00:00:00	7cc40beb-31a0-43ef-9c93-373ed4fe514f	\N
8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	4	2	2023-03-12 00:00:00	0e41c78f-f11b-4799-b0ee-2b55f177bfac	\N
9208e13c-03c5-441e-a3ed-35c89491b29e	31	2	2023-03-12 00:00:00	de35a1eb-e5e9-4fb9-9f6a-3f6bd10eaad9	\N
920a17cd-73c4-4a95-b56a-25dfbfbee90f	5	2	2023-03-12 00:00:00	1194e6e1-d598-4fe9-a14a-8a5a08dbf086	\N
ab7c3834-1fb6-499d-a42f-320055506913	14	2	2023-03-12 00:00:00	64cb9c2d-8301-458c-adf1-1550ba378072	\N
b71ee58f-939d-42d5-978a-801c2c96971d	32	2	2023-03-12 00:00:00	e8abcae3-9a64-4ed4-bd34-2ef046e57a2f	\N
c2847237-b8bd-46b3-8f88-59fc86b50d09	9	2	2023-03-12 00:00:00	2b603c3d-c2c5-4a7e-8008-50dbae62b2b4	\N
cddbecad-36b1-4abd-aa0a-c43f80a87781	2	2	2023-03-12 00:00:00	0aa14e25-515f-4e1e-85b7-a24bcca0daed	\N
dc43793e-7e8f-4c3b-8915-fdd8780de1ae	16	2	2023-03-12 00:00:00	6bc332d8-4d6e-467e-9b3a-0e33c39494d4	\N
ec8b3f24-5ab9-4d76-a948-3fc22605ee99	30	2	2023-03-12 00:00:00	d330a48e-ea32-43b0-b0cf-f9775e521f51	\N
ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	8	2	2023-03-12 00:00:00	25978bc0-2221-4af4-a43b-4bc052a4987c	\N
f455ee61-ad70-43e7-bbe9-37b377479a3b	29	2	2023-03-12 00:00:00	bc08d987-d137-417f-9573-fcd35c516f26	\N
fecc7ef3-a3f4-4085-8ac0-d243cf8cf16a	11	2	2023-03-12 00:00:00	4c81ca95-1acf-4ee3-8faa-777247863627	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
a1126f9d-cf31-49a6-9e49-be6cd4911aed	00afe6fe-26c6-4885-9bee-1a3c748ce8da
0da857d6-26d8-48e3-977c-7f4aeca0bf1f	0aa14e25-515f-4e1e-85b7-a24bcca0daed
a1126f9d-cf31-49a6-9e49-be6cd4911aed	0da857d6-26d8-48e3-977c-7f4aeca0bf1f
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	0e41c78f-f11b-4799-b0ee-2b55f177bfac
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	1194e6e1-d598-4fe9-a14a-8a5a08dbf086
0da857d6-26d8-48e3-977c-7f4aeca0bf1f	1688a612-78a6-4dd8-afed-47b5fec081ca
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	191ee071-0f79-4674-8f59-199885193113
a1126f9d-cf31-49a6-9e49-be6cd4911aed	25978bc0-2221-4af4-a43b-4bc052a4987c
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	2b603c3d-c2c5-4a7e-8008-50dbae62b2b4
0da857d6-26d8-48e3-977c-7f4aeca0bf1f	33a0174c-8e69-4270-bbac-22d0734de27c
9d06e121-c0c8-4b1c-ab85-eace8360218e	4c81ca95-1acf-4ee3-8faa-777247863627
a1126f9d-cf31-49a6-9e49-be6cd4911aed	4cc30b91-8588-4ec2-ab40-324dfb696372
a1126f9d-cf31-49a6-9e49-be6cd4911aed	60d8869c-d97c-45b5-9b86-6b09f0fdec1d
a1126f9d-cf31-49a6-9e49-be6cd4911aed	64cb9c2d-8301-458c-adf1-1550ba378072
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	6509288d-7fd0-48ca-8cff-7b6b4639054a
9d06e121-c0c8-4b1c-ab85-eace8360218e	6bc332d8-4d6e-467e-9b3a-0e33c39494d4
a1126f9d-cf31-49a6-9e49-be6cd4911aed	6cc2b060-7624-4a5e-88ad-1c8dda4233af
9d06e121-c0c8-4b1c-ab85-eace8360218e	7cc40beb-31a0-43ef-9c93-373ed4fe514f
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	84d14097-a405-4cea-aa31-e2217d84adb2
a1126f9d-cf31-49a6-9e49-be6cd4911aed	8aa5a5e1-6949-4ea0-b0be-7a3ec73ac983
0da857d6-26d8-48e3-977c-7f4aeca0bf1f	8fac6409-2a34-42f6-b4d7-ab5461175e9a
a1126f9d-cf31-49a6-9e49-be6cd4911aed	92af9691-72c6-448b-83d3-f6bcfa2d65a2
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	9b90bd69-5b90-4d95-a385-b179229c1d0d
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	9d06e121-c0c8-4b1c-ab85-eace8360218e
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	a613fcd6-439d-453f-a197-557e732c9f23
9d06e121-c0c8-4b1c-ab85-eace8360218e	b43ecc28-7d49-4f2f-a6f5-909ed9ddf4f9
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	bc08d987-d137-417f-9573-fcd35c516f26
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	d330a48e-ea32-43b0-b0cf-f9775e521f51
a1126f9d-cf31-49a6-9e49-be6cd4911aed	de35a1eb-e5e9-4fb9-9f6a-3f6bd10eaad9
a1126f9d-cf31-49a6-9e49-be6cd4911aed	e8abcae3-9a64-4ed4-bd34-2ef046e57a2f
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	f8091846-a419-406d-9b06-f8810a8fd39c
a1126f9d-cf31-49a6-9e49-be6cd4911aed	fb3f1dcc-e547-47a1-95db-6f22dd470494
a1126f9d-cf31-49a6-9e49-be6cd4911aed	fbad1ea7-a07d-4df3-8491-9235edcd0ba0
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	fc517944-a10e-46d2-9f81-8f6b40bb6d06
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
03748bbf-f10a-4af1-b2ab-b4403d17daa7	0	1	\N	\N	2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	\N
03a2a5a7-beb7-453c-8d04-6b1e952c7159	0	3	\N	\N	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
05db7b31-0c40-4392-8018-67394b8f8c89	0	2	\N	\N	920a17cd-73c4-4a95-b56a-25dfbfbee90f	\N
088d1b19-8d15-49e4-aae1-3a1951435bec	0	3	\N	\N	c2847237-b8bd-46b3-8f88-59fc86b50d09	\N
0aa75e53-7ca9-47d4-812c-9b65b297f8f1	0	3	\N	\N	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
0bbbb6a3-9d90-48e5-be01-815c29942bc7	0	2	\N	\N	0b29b25e-f13a-48e3-bf2c-a126e48b0e48	\N
0ed2ad79-a2ad-42ef-bbf4-153ec44993d8	0	3	\N	\N	ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	\N
11c7f902-0d82-49b8-8a78-7f9cbca09711	0	1	\N	\N	48d2beee-5d86-4aff-bc1f-a09aee628f98	\N
12c2e716-256f-480c-b0ab-590c8bd1dc1b	0	3	\N	\N	7e405454-7c68-4498-9b53-84d79752d2d2	\N
15566af3-fb12-46e3-8011-82d791770429	0	2	\N	\N	c2847237-b8bd-46b3-8f88-59fc86b50d09	\N
1dfdc324-82e1-498a-802d-555d0b9a186e	0	2	\N	\N	ec8b3f24-5ab9-4d76-a948-3fc22605ee99	\N
23b64751-ec05-413c-b01d-2ecac68d1675	0	3	\N	\N	920a17cd-73c4-4a95-b56a-25dfbfbee90f	\N
23f555b7-afee-436b-b047-b0837f2e1940	0	3	\N	\N	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
254de389-9dba-4eff-b8ee-b2b19339e6ca	0	2	\N	\N	4bd2ebf3-049c-45d9-90ae-93fb269cba2f	\N
261261b0-e05a-4476-b40d-5e556cb188a0	0	1	\N	\N	ec8b3f24-5ab9-4d76-a948-3fc22605ee99	\N
262d76a9-43e4-4b18-b074-da9fc7fbe8d3	0	2	\N	\N	619062f6-3f46-47c8-9656-9bd75e2ba484	\N
327efb3f-6a30-4ae2-8f38-1c2e015e39d9	0	2	\N	\N	755f3254-7fa6-447b-8d70-d53e86dc973b	\N
32aa88ff-a74e-40bc-94e2-63e7cf1658d1	0	1	\N	\N	fecc7ef3-a3f4-4085-8ac0-d243cf8cf16a	\N
3af51cbb-651b-4a22-ab93-cdcbccc66c9f	0	3	\N	\N	b71ee58f-939d-42d5-978a-801c2c96971d	\N
3f69cb7b-d857-4381-a0fc-33e21a3c39de	0	2	\N	\N	611fb45f-f87a-45e0-be99-132c62442582	\N
407099cd-adb8-4110-b783-e807476cd8b9	0	1	\N	\N	8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	\N
40d0b8b4-421e-4090-b632-d6b0be777245	0	3	\N	\N	28a37300-7107-46e8-99d7-94ce298830d9	\N
4329300e-d8d1-4ac6-90b8-369b13435b3c	0	2	\N	\N	0337171d-545c-4a85-99a4-2fdd0d872318	\N
4704cff2-1ec7-42d0-9574-6dce182d0733	0	3	\N	\N	818b751e-5343-455a-9765-36d98deb499f	\N
472115c7-8113-4f4a-8884-e3ae1424e981	0	1	\N	\N	b71ee58f-939d-42d5-978a-801c2c96971d	\N
47502e0a-b1d7-419c-9974-fdd24f982c1b	0	2	\N	\N	7e405454-7c68-4498-9b53-84d79752d2d2	\N
47f216d0-d150-45ae-9cc0-77f42069cb55	0	3	\N	\N	4bd2ebf3-049c-45d9-90ae-93fb269cba2f	\N
489193dc-080d-435f-afed-8673c3a374c0	0	3	\N	\N	0189be1c-3bd2-4feb-bf5d-938821d2d4d9	\N
4d8b1ee3-39fc-483b-9358-8752cc03ce8f	0	3	\N	\N	76c5fb62-dd0a-4b53-8692-eb080c7927fc	\N
515500c1-94d8-418d-89df-58997858a1c2	0	2	\N	\N	0189be1c-3bd2-4feb-bf5d-938821d2d4d9	\N
5522770e-84f9-47ca-925a-dfa4fa7c7511	0	3	\N	\N	9208e13c-03c5-441e-a3ed-35c89491b29e	\N
55f8915a-02b8-407d-936d-f463bc6263de	0	1	\N	\N	920a17cd-73c4-4a95-b56a-25dfbfbee90f	\N
56712010-d879-4756-834c-194fce13935c	0	2	\N	\N	76c5fb62-dd0a-4b53-8692-eb080c7927fc	\N
583d0896-6bda-4457-9aa9-9883e97e5f80	0	3	\N	\N	0a5d79d3-b97e-45e1-8caf-e584aed5dac4	\N
5939290a-6085-48d0-9702-99b1a89037b2	0	3	\N	\N	0b29b25e-f13a-48e3-bf2c-a126e48b0e48	\N
5a830730-aca5-4c58-a0b8-51121254a81c	0	2	\N	\N	04412d22-0a13-4ac3-afaa-db6ec8d919eb	\N
5d79b0f7-efd0-403f-b72c-a1f214df40d4	0	1	\N	\N	4bd2ebf3-049c-45d9-90ae-93fb269cba2f	\N
5eee6df6-5473-47f6-8971-f8a215ae2c5b	0	1	\N	\N	76c5fb62-dd0a-4b53-8692-eb080c7927fc	\N
5fa42029-27f4-407f-9b65-d962f3658200	0	3	\N	\N	ec8b3f24-5ab9-4d76-a948-3fc22605ee99	\N
60877cff-d552-45d5-bd84-372a3f2605cd	0	3	\N	\N	fecc7ef3-a3f4-4085-8ac0-d243cf8cf16a	\N
63752c19-75b0-4ecd-8343-bd42ec7a9faf	0	3	\N	\N	130ca9e5-5cb4-4cd2-a963-0aee0de505b3	\N
638a8512-bbec-4a22-9d51-50d514d64e54	0	2	\N	\N	ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	\N
64fd4ff0-676c-4698-9768-5a02e97e96f7	0	2	\N	\N	48d2beee-5d86-4aff-bc1f-a09aee628f98	\N
6517e866-0a7e-4059-8627-80b6e85b8143	0	1	\N	\N	dc43793e-7e8f-4c3b-8915-fdd8780de1ae	\N
665c8bc7-7acf-4a77-9dc9-b0be1259eb2d	0	2	\N	\N	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
668d4b6c-9a83-4c2a-b659-3f8314d39df3	0	1	\N	\N	130ca9e5-5cb4-4cd2-a963-0aee0de505b3	\N
698322f0-86ad-486e-ab5f-c45d3b2f6ed5	0	2	\N	\N	dc43793e-7e8f-4c3b-8915-fdd8780de1ae	\N
69862dc9-0ae0-4a48-a0db-4693890035a7	0	1	\N	\N	611fb45f-f87a-45e0-be99-132c62442582	\N
6ac26e12-5e9b-4ba1-851b-a65b8f5e07b9	0	3	\N	\N	750d164b-02ff-427f-89ec-f397d4a50c47	\N
6d7a575f-2804-403b-963d-12a7d545bf2b	0	3	\N	\N	0337171d-545c-4a85-99a4-2fdd0d872318	\N
6df53bc7-204c-4be3-8e72-19469a18a1d2	0	3	\N	\N	dc43793e-7e8f-4c3b-8915-fdd8780de1ae	\N
6e2033bc-0270-4f15-a21e-5c6cb54a7efb	0	3	\N	\N	6e7464de-da01-4291-b9f7-922a081968f0	\N
6eff7eaa-d4c5-42da-8fe8-bf98a056bd75	0	1	\N	\N	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
711157ed-5ac5-420c-aae5-522565096402	0	2	\N	\N	28a37300-7107-46e8-99d7-94ce298830d9	\N
71d1ede5-bbeb-4a98-bd21-36ce086f4766	0	1	\N	\N	0b29b25e-f13a-48e3-bf2c-a126e48b0e48	\N
733b1227-d497-4d5c-a208-b4f158c4d732	0	3	\N	\N	755f3254-7fa6-447b-8d70-d53e86dc973b	\N
774772d7-4a5a-453f-a562-c5625534397f	0	3	\N	\N	8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	\N
78e449b8-9173-47e5-8038-4fd1e0942b35	0	1	\N	\N	755f3254-7fa6-447b-8d70-d53e86dc973b	\N
7baf6cc7-9e4c-4d90-86e8-faafd38b3f54	0	3	\N	\N	0ea9fdd7-992a-4a7e-b0b3-15994f9bb256	\N
7d93b351-2038-4f41-a82e-2bbf215f99d6	0	2	\N	\N	ab7c3834-1fb6-499d-a42f-320055506913	\N
7eed9084-ba09-4d54-a3b8-7693f2932cc4	0	1	\N	\N	04412d22-0a13-4ac3-afaa-db6ec8d919eb	\N
7ffa10dd-6bb0-4365-82d8-40e49ef72e38	0	1	\N	\N	ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	\N
82f97cb8-2c77-4ab9-a7cd-e719530d54c2	0	3	\N	\N	2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	\N
840884f4-a097-4dba-8a71-6aa24c362afd	0	2	\N	\N	130ca9e5-5cb4-4cd2-a963-0aee0de505b3	\N
8633f1f5-4102-40bf-9d0e-f9ba55866cb6	0	2	\N	\N	9208e13c-03c5-441e-a3ed-35c89491b29e	\N
8958b622-9476-449b-9c7a-e7352362d401	0	1	\N	\N	7e405454-7c68-4498-9b53-84d79752d2d2	\N
8d207e74-f4c6-4223-861b-acc7f53dd3da	0	1	\N	\N	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
9229fb7f-7af7-4aed-95dd-7bf6b8e671c2	0	1	\N	\N	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
92cad15d-a994-4c33-af1e-7e854ad86cc6	0	2	\N	\N	750d164b-02ff-427f-89ec-f397d4a50c47	\N
9560218d-62a1-4d0b-af25-1ce4db342eb3	0	1	\N	\N	ab7c3834-1fb6-499d-a42f-320055506913	\N
97605395-e532-4d28-8a44-4c3ca69865cb	0	1	\N	\N	040b778d-fa3e-437f-8094-35600a819261	\N
98fdee35-0a46-448b-b424-04bf4221dcd4	0	3	\N	\N	619062f6-3f46-47c8-9656-9bd75e2ba484	\N
9a4478e8-9e00-4e67-b254-0b2a6413b8d4	0	1	\N	\N	cddbecad-36b1-4abd-aa0a-c43f80a87781	\N
9d293701-8d47-498d-81ab-028d2c4a1b2b	0	3	\N	\N	cddbecad-36b1-4abd-aa0a-c43f80a87781	\N
a0be8225-5da1-4d8f-a51a-98e243031f11	0	3	\N	\N	040b778d-fa3e-437f-8094-35600a819261	\N
a1f3b421-0c32-4be8-b774-dfa16d35e47b	0	1	\N	\N	9208e13c-03c5-441e-a3ed-35c89491b29e	\N
a3eaab5c-fd22-408b-a658-a4d577d71d3f	0	1	\N	\N	750d164b-02ff-427f-89ec-f397d4a50c47	\N
a6e037f3-0880-4808-b430-bbbeb788f01f	0	3	\N	\N	ab7c3834-1fb6-499d-a42f-320055506913	\N
ae4f6807-2e40-43e9-90b7-62a416d84e04	0	2	\N	\N	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
af890b9c-fcba-4124-b96d-1add6cf17049	0	2	\N	\N	cddbecad-36b1-4abd-aa0a-c43f80a87781	\N
bc02b476-39b0-43dc-8931-7d0b2bcc6d21	0	1	\N	\N	0a5d79d3-b97e-45e1-8caf-e584aed5dac4	\N
bc7ea914-79a6-4d2e-962e-74eb9e93129e	0	1	\N	\N	619062f6-3f46-47c8-9656-9bd75e2ba484	\N
bd717054-0fe5-443b-ad67-da5a0cc2f1c1	0	2	\N	\N	040b778d-fa3e-437f-8094-35600a819261	\N
c087970b-77a1-4170-9d24-46a0ce9a366c	0	2	\N	\N	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
c2e32a00-9a2e-43c7-b532-3e3033a12ec7	0	1	\N	\N	28a37300-7107-46e8-99d7-94ce298830d9	\N
cb240471-a590-4f51-aba7-e3eb1dcd5017	0	2	\N	\N	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
ce0933ba-58d8-44ea-bf4d-a089b574ae06	0	2	\N	\N	2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	\N
cea5579a-789d-4779-8b4b-5e0cc74993ad	0	2	\N	\N	818b751e-5343-455a-9765-36d98deb499f	\N
d3a7f555-7ab4-467f-8f95-6361676bd5a4	0	2	\N	\N	6e7464de-da01-4291-b9f7-922a081968f0	\N
d967ecb1-3ff9-4500-bcf5-0310c79b2cac	0	2	\N	\N	f455ee61-ad70-43e7-bbe9-37b377479a3b	\N
da2c487e-914d-4e91-9e06-b99ffd049b83	0	2	\N	\N	8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	\N
dd05375d-86a8-43f6-9afe-f58034b3285e	0	2	\N	\N	0a5d79d3-b97e-45e1-8caf-e584aed5dac4	\N
e1097468-2fa7-4584-a325-2aaef49ff259	0	1	\N	\N	c2847237-b8bd-46b3-8f88-59fc86b50d09	\N
e54b6bfe-7850-4897-bfbe-508162c3f3c7	0	3	\N	\N	04412d22-0a13-4ac3-afaa-db6ec8d919eb	\N
e5633ecb-4398-47a4-8208-16e9e24be033	0	1	\N	\N	818b751e-5343-455a-9765-36d98deb499f	\N
e5a9da36-04ad-4d12-ad22-07ad5edbe081	0	1	\N	\N	f455ee61-ad70-43e7-bbe9-37b377479a3b	\N
e8860dac-280f-4fb6-be3f-f5a2fc63ccb5	0	1	\N	\N	0ea9fdd7-992a-4a7e-b0b3-15994f9bb256	\N
e9892eca-779e-40d9-9126-e784b1da7ce8	0	3	\N	\N	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
ec137ef0-a806-43e4-bca6-710fefb6b7e5	0	1	\N	\N	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
f05f8871-c580-4610-8370-2642c593930d	0	3	\N	\N	611fb45f-f87a-45e0-be99-132c62442582	\N
f107d8a9-472f-40e5-9b23-7a7f72630cd5	0	1	\N	\N	0337171d-545c-4a85-99a4-2fdd0d872318	\N
f4f93dca-30c6-4145-a213-ad99e211ca07	0	2	\N	\N	fecc7ef3-a3f4-4085-8ac0-d243cf8cf16a	\N
f5cad0ed-6e44-43ea-ae62-c6d201066644	0	1	\N	\N	6e7464de-da01-4291-b9f7-922a081968f0	\N
facc44a2-5c59-48e7-a5ee-153117819246	0	2	\N	\N	b71ee58f-939d-42d5-978a-801c2c96971d	\N
fafdd18a-f6e0-4784-bd1e-5ec2eacef9f3	0	3	\N	\N	48d2beee-5d86-4aff-bc1f-a09aee628f98	\N
fb6c8e70-b17d-4290-a765-ecdc18db716e	0	1	\N	\N	0189be1c-3bd2-4feb-bf5d-938821d2d4d9	\N
fc2b6e2b-c21e-4ee5-abc6-20d7e7500b8a	0	3	\N	\N	f455ee61-ad70-43e7-bbe9-37b377479a3b	\N
fecfbd7f-ac23-4202-9342-c72af88ce63b	0	2	\N	\N	0ea9fdd7-992a-4a7e-b0b3-15994f9bb256	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
27800995-a71f-4877-abc7-39218ee0af63	Сборка, сварка рам к/с г/п 120-130 т.	6	e828aca6-b54b-4b70-98c6-73d43113602e	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
00afe6fe-26c6-4885-9bee-1a3c748ce8da	Усилитель	75131-2801115-01	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
0aa14e25-515f-4e1e-85b7-a24bcca0daed	Поперечина	75131-2801325	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
0da857d6-26d8-48e3-977c-7f4aeca0bf1f	Поперечина рамы задняя	75131-2801300-20	t	2	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
0e41c78f-f11b-4799-b0ee-2b55f177bfac	Лонжерон рамы левый	75131-2801017-70	t	2	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
1194e6e1-d598-4fe9-a14a-8a5a08dbf086	Усилитель	75131-2801114-01	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
1688a612-78a6-4dd8-afed-47b5fec081ca	Кронштейн задней опоры	75131-8521183-20	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
191ee071-0f79-4674-8f59-199885193113	Опора	75131-2801188	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
25978bc0-2221-4af4-a43b-4bc052a4987c	Опора	75131-2801189	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
2b603c3d-c2c5-4a7e-8008-50dbae62b2b4	Усилитель	75131-2801115-01	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
33a0174c-8e69-4270-bbac-22d0734de27c	Лист верхний	75131-2801357-10	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
4c81ca95-1acf-4ee3-8faa-777247863627	Кронштейн задней опоры	75131-8521182-20	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
4cc30b91-8588-4ec2-ab40-324dfb696372	Лонжерон рамы правый	75131-2801016-70	t	2	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
60d8869c-d97c-45b5-9b86-6b09f0fdec1d	Поперечина №3 рамы с опорами	75132-2801152	t	2	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
64cb9c2d-8301-458c-adf1-1550ba378072	Накладка рамы поперечная передняя	75131-2801088-70	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
6509288d-7fd0-48ca-8cff-7b6b4639054a	Лист нижний	75131-2801358-10	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
6bc332d8-4d6e-467e-9b3a-0e33c39494d4	Лист верхний	75131-2801357-10	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
6cc2b060-7624-4a5e-88ad-1c8dda4233af	Усилитель	75131-2801114-01	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
7cc40beb-31a0-43ef-9c93-373ed4fe514f	Поперечина	75131-2801325	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
83458d8e-e7a4-4dad-9c4b-0bd89ea97487	Рама	7513D-2800010-20	t	1	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	4536492774
8aa5a5e1-6949-4ea0-b0be-7a3ec73ac983	Опора	75131-2801188	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
8fac6409-2a34-42f6-b4d7-ab5461175e9a	Кронштейн задней опоры	75131-8521182-20	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
92af9691-72c6-448b-83d3-f6bcfa2d65a2	Лонжерон рамы левый	75131-2801015-41	t	2	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
9b90bd69-5b90-4d95-a385-b179229c1d0d	Лонжерон рамы правый	75131-2801014-41	t	2	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
9d06e121-c0c8-4b1c-ab85-eace8360218e	Поперечина рамы задняя	75131-2801300-20	t	2	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
a1126f9d-cf31-49a6-9e49-be6cd4911aed	Рама	75131-2800010-70	t	1	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	4536479362
a613fcd6-439d-453f-a197-557e732c9f23	Опора	75131-2801189	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
b43ecc28-7d49-4f2f-a6f5-909ed9ddf4f9	Кронштейн задней опоры	75131-8521183-20	t	3	98b53467-5774-4a62-afe3-9caeb91739ee	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
bc08d987-d137-417f-9573-fcd35c516f26	Накладка рамы поперечная передняя	75131-2801088-70	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
d330a48e-ea32-43b0-b0cf-f9775e521f51	Лонжерон рамы правый	75131-2801016-70	t	2	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
e8abcae3-9a64-4ed4-bd34-2ef046e57a2f	Лонжерон рамы левый	75131-2801017-70	t	2	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
f8091846-a419-406d-9b06-f8810a8fd39c	Поперечина №3 рамы с опорами	75132-2801152	t	2	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
fb3f1dcc-e547-47a1-95db-6f22dd470494	Поперечина	75131-2801103-10	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
fbad1ea7-a07d-4df3-8491-9235edcd0ba0	Лонжерон рамы правый	75131-2801014-41	t	2	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
fc517944-a10e-46d2-9f81-8f6b40bb6d06	Поперечина	75131-2801103-10	t	3	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	\N	\N	\N	\N
84d14097-a405-4cea-aa31-e2217d84adb2	Лонжерон рамы левый	75131-2801015-41	t	2	c4c018fb-9eee-4a48-adbc-220e5062c7da	27800995-a71f-4877-abc7-39218ee0af63	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N	\N
de35a1eb-e5e9-4fb9-9f6a-3f6bd10eaad9	Лист нижний	75131-2801358-10	t	3	a9183121-2b66-499f-bcf3-39b78be4cc47	27800995-a71f-4877-abc7-39218ee0af63	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
f235b88b-6e76-4617-ad46-1b652ad03c1d	Admin	\N
a17e8296-005d-47e4-8661-97aebc67ebc2	Master	\N
6f5a6ff6-0211-49cb-852e-c333ffd6c1c1	Welder	\N
9a8b0211-2ed8-4d37-9255-fece43302107	Inspector	\N
c6b5d18f-5cb6-4213-9dfc-08e2bb5ec6df	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
023928e5-179b-4e40-bc18-2acd1a39dc73	2023-03-12 00:00:00	77140318-e825-4ecd-8c67-19724d69f4fb	ab7c3834-1fb6-499d-a42f-320055506913	\N
0381589f-2a7f-4e4c-b9b9-a31547b92e70	2023-03-12 00:00:00	3c977122-c2c5-488e-9416-e3c275368da8	cddbecad-36b1-4abd-aa0a-c43f80a87781	\N
05e1138c-05b2-4467-af14-8e5c09ff0337	2023-03-12 00:00:00	027bd9aa-217a-48e2-99e4-cc5b73f76b7c	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
16784c4e-c2a5-49f6-bd91-4d8953ee8cd8	2023-03-12 00:00:00	38ddd3cc-bec4-4a2b-9abb-da25fb1a5af6	0189be1c-3bd2-4feb-bf5d-938821d2d4d9	\N
1a529fff-d153-44da-8d3c-9bce96a31b2b	2023-03-12 00:00:00	bfc8cf81-a4f4-47cf-8e4f-326407466c91	7e405454-7c68-4498-9b53-84d79752d2d2	\N
1fdce7c6-18c3-4cc4-87fd-1639878e9c49	2023-03-12 00:00:00	d5069061-316d-4aaa-bad7-562c692e73b1	040b778d-fa3e-437f-8094-35600a819261	\N
20b91fd9-9869-46c4-ae94-6c62fa52709d	2023-03-12 00:00:00	f10af256-74da-4f37-8868-fe1c931e2a59	ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	\N
2a56d8da-b9a7-4945-b846-e1562d0efdf0	2023-03-12 00:00:00	4831663f-388c-4356-89da-b4b9ba886b1c	b71ee58f-939d-42d5-978a-801c2c96971d	\N
35fc292f-cb0e-4bb3-8bfe-5aaa4904bd56	2023-03-12 00:00:00	6025c74c-db73-4d2d-8965-e84dab872c2e	28a37300-7107-46e8-99d7-94ce298830d9	\N
36b6c695-6e3e-4150-adf5-731673968d65	2023-03-12 00:00:00	92d549e8-5be8-42fb-8a4d-f2eb8d9d7e27	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
39522f74-dd4b-4380-af3f-0822729642b0	2023-03-12 00:00:00	c6d3a0fe-00af-46cb-902b-e4bf07e743cf	0189be1c-3bd2-4feb-bf5d-938821d2d4d9	\N
40c669ad-6196-4c4b-a1bb-fe11a9869532	2023-03-12 00:00:00	0799c108-b2c8-4b28-9fcb-508740f74de5	76c5fb62-dd0a-4b53-8692-eb080c7927fc	\N
41c8e1e8-e417-434e-b332-a11604ab7122	2023-03-12 00:00:00	177df222-55c6-4f21-b7ae-c89d33e68e6d	2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	\N
42ba7f9d-8b19-45e2-a23f-5dc22c0b1bcf	2023-03-12 00:00:00	7185405b-0fff-472e-a90a-bcecdec2501b	0ea9fdd7-992a-4a7e-b0b3-15994f9bb256	\N
4343a84e-926f-484c-8e9f-12278741aee5	2023-03-12 00:00:00	f3748fcf-0002-4515-8033-bbaf26edc2f2	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
4b0c9bdd-4417-47ea-82a4-b10b588726d8	2023-03-12 00:00:00	619670e3-f2ca-41a6-beb7-1eb4830a0a66	9208e13c-03c5-441e-a3ed-35c89491b29e	\N
4b1256ab-7efe-45ba-8e0e-f9a86cfd9e93	2023-03-12 00:00:00	437c1414-3f8a-4d39-9911-978d1062073d	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
4d367cd3-cdd2-4036-aff3-fbdf64b99cd9	2023-03-12 00:00:00	d73e84f2-a9a5-4e8b-a732-f0423b9e6aa7	0a5d79d3-b97e-45e1-8caf-e584aed5dac4	\N
519f94dc-1645-4693-8df5-c042a75696a3	2023-03-12 00:00:00	572f6849-1af2-49a0-b2f0-e9b49a87cbff	ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	\N
578b0b6b-1324-4448-b614-a90919ff4002	2023-03-12 00:00:00	b5031781-f636-4272-a145-9129f05b03d7	619062f6-3f46-47c8-9656-9bd75e2ba484	\N
596e76eb-5393-4fd4-ade3-b717e1c4ba21	2023-03-12 00:00:00	3f3d7fd6-8d22-4337-8491-2147a093fac9	ec8b3f24-5ab9-4d76-a948-3fc22605ee99	\N
5b9def80-8100-48d4-b0f1-9227ad07016e	2023-03-12 00:00:00	3c6a81cf-8ea2-428a-ae52-8efbb6c61bcb	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
5d3fea06-c79e-4be6-ac83-31a365b9b5e8	2023-03-12 00:00:00	f4bb3ab6-89a3-41a6-b314-d2189809d58f	b71ee58f-939d-42d5-978a-801c2c96971d	\N
61c192c5-44d4-4d0e-91e3-8edc54a08fb9	2023-03-12 00:00:00	e0e2c307-5768-4f38-8bdc-7abea1dab334	c2847237-b8bd-46b3-8f88-59fc86b50d09	\N
68b304c5-2698-430c-b6cf-4602cd8132e0	2023-03-12 00:00:00	4b9d62aa-ad0b-480e-9df8-6f9c2b68409a	8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	\N
6d96bc7c-e453-4cae-b32c-a79b1b9a9e92	2023-03-12 00:00:00	0e73c937-bf17-4843-833f-c5eb44b31ffa	6e7464de-da01-4291-b9f7-922a081968f0	\N
6f0bb095-9f7d-4d80-8162-d8fce845d1af	2023-03-12 00:00:00	e62dac28-06ca-44ac-b4f6-1ebf2bc31a6b	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
6fd26656-1d40-4325-a230-1f8293c222af	2023-03-12 00:00:00	0d722664-34b5-48de-ad9d-754132229733	48d2beee-5d86-4aff-bc1f-a09aee628f98	\N
74e9683f-b371-43c8-8737-0a2221088858	2023-03-12 00:00:00	3188de0d-b30c-479e-8ddb-efb6e029c027	0337171d-545c-4a85-99a4-2fdd0d872318	\N
762397b3-ce13-4569-8128-25b7d4c931a9	2023-03-12 00:00:00	3e59cf32-23ee-443f-a0ca-a883c1fb231b	4bd2ebf3-049c-45d9-90ae-93fb269cba2f	\N
78a2fc46-59e8-469c-9dc5-3e80d1f577f5	2023-03-12 00:00:00	68920883-23be-4457-9435-ea2f59df8ba5	0b29b25e-f13a-48e3-bf2c-a126e48b0e48	\N
8097e5a1-c8e6-41b3-9061-959a2e213827	2023-03-12 00:00:00	7de44703-7689-4815-915c-16fff8d9ad47	818b751e-5343-455a-9765-36d98deb499f	\N
8619f901-92a7-4bc8-a4df-299f4764466b	2023-03-12 00:00:00	6813eb40-2882-4d1c-823e-29906eb97cb8	2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	\N
8b94f6fd-4130-4521-a947-27d6911a5738	2023-03-12 00:00:00	01761540-08ba-42a3-a195-e7276d647c56	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
953b2d05-e6bf-41e4-94df-c21830f976b4	2023-03-12 00:00:00	eccce182-e57f-4f52-bdf0-6b9dec4c49fa	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
962f072a-09cb-4feb-824b-5cb5e96b939a	2023-03-12 00:00:00	23a2bd77-d642-4ed8-acda-f46268f4b856	cddbecad-36b1-4abd-aa0a-c43f80a87781	\N
9989395c-edb6-4b6f-9064-690cce2a818b	2023-03-12 00:00:00	c3320c5d-3291-4e83-8bc3-490a5db27539	ecf5b5fc-0c5f-493b-966b-8e34a56a0a29	\N
aa89c205-1740-4b33-be54-2b28c23ed546	2023-03-12 00:00:00	28a5fa7f-34a5-4dfc-a12d-7ac050b68877	0189be1c-3bd2-4feb-bf5d-938821d2d4d9	\N
ab5aa367-ca0b-4c56-acac-ef34aa906218	2023-03-12 00:00:00	43cf6e3a-adf5-4524-9f1e-bb2847f85aaa	611fb45f-f87a-45e0-be99-132c62442582	\N
af7f7009-6283-418f-9def-56d139c0a83d	2023-03-12 00:00:00	66cccdb5-709d-4f9a-b6d7-2131bdf31fdf	755f3254-7fa6-447b-8d70-d53e86dc973b	\N
b0c3028e-015d-4a29-abe7-3c7708721055	2023-03-12 00:00:00	6fbd3962-9a31-4e38-927b-cfedb366bd34	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
b8cf2b8b-530e-4c98-a72a-c3a4ec8eea5d	2023-03-12 00:00:00	6469ef5d-587a-44f2-945f-17038fda8a5f	dc43793e-7e8f-4c3b-8915-fdd8780de1ae	\N
bb9c37ea-725d-45e2-8040-da6398765664	2023-03-12 00:00:00	f728daca-7223-4335-afa8-fc5f40ab69bf	0b29b25e-f13a-48e3-bf2c-a126e48b0e48	\N
bc675ad9-f408-48e4-9531-f933af9994b4	2023-03-12 00:00:00	e7502135-4cba-4c90-aec7-a7b75130083d	750d164b-02ff-427f-89ec-f397d4a50c47	\N
bd57ba28-f3e9-4ed0-a483-2deb17a740c0	2023-03-12 00:00:00	9970c6b6-6b4d-4137-8942-e6541fb68f65	7e405454-7c68-4498-9b53-84d79752d2d2	\N
bd8c738f-4dfb-4823-a7bb-6e9fbf33836b	2023-03-12 00:00:00	43b725be-d779-4d78-904e-b26c59366eea	818b751e-5343-455a-9765-36d98deb499f	\N
c34634cd-1626-4bbe-8ae3-4b40cbbbd422	2023-03-12 00:00:00	139f6e78-3104-4e87-8c63-58a27fc5dafe	750d164b-02ff-427f-89ec-f397d4a50c47	\N
c3508a89-a2d0-47d2-8c7d-c65706c93392	2023-03-12 00:00:00	75b6280d-a365-4936-a03f-42726270da0b	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
c8143ee0-8718-4d2b-855a-9c32247b8a9a	2023-03-12 00:00:00	a69aa705-da3b-4bba-b271-5a9a3f50c572	4f8e7caa-df87-4ce7-86e9-6dfbf2606a9d	\N
ca229289-8ad1-411d-ac74-b9c77fcb9b8e	2023-03-12 00:00:00	6220cf20-426b-442e-b536-862c3a0984bd	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
caf2c53a-091d-43b0-9c39-456a2fadf0eb	2023-03-12 00:00:00	c1e19001-5ac6-415c-9713-7690118aca47	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
cb73dee6-7ca2-489a-ae08-38ea42adb72f	2023-03-12 00:00:00	58ebdd20-f1b0-48ae-a4bb-51a52210c8bf	743f3abc-ae64-43e9-a806-edae6605a7fe	\N
cd606148-8576-4ec0-b2f9-191cba09fa0f	2023-03-12 00:00:00	936e975d-6910-49e9-9cf7-860dfe18702e	755f3254-7fa6-447b-8d70-d53e86dc973b	\N
ce1d6eab-ab24-44c6-a24c-fb10a82b7d17	2023-03-12 00:00:00	5aedf2e4-ddbb-43d4-85a0-e27a676c2bfe	dc43793e-7e8f-4c3b-8915-fdd8780de1ae	\N
d1b8891f-1713-471b-bf82-2700eaee6156	2023-03-12 00:00:00	9464a643-3306-456c-bf34-0a8bea72d160	8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	\N
d6e21646-cc16-4069-abb9-6bd745d30463	2023-03-12 00:00:00	c4d9f373-b88c-4334-b93e-65d5d85030a7	2fa79c3e-f7b3-4de8-b627-ffe14ff4acf1	\N
d79ef2ae-b059-48d4-ae23-0c9b670ef588	2023-03-12 00:00:00	c007a70e-2be7-4589-8eaa-bbe17fdeffae	ec8b3f24-5ab9-4d76-a948-3fc22605ee99	\N
dbe9588e-4dca-4085-a42b-28ba1687d086	2023-03-12 00:00:00	28baaf14-96cc-4233-8b7e-3f0076157be1	750d164b-02ff-427f-89ec-f397d4a50c47	\N
de18ac33-f364-4018-9c66-57fc8429d756	2023-03-12 00:00:00	b708e80c-6330-44ec-85ba-8c6f61f73d89	b71ee58f-939d-42d5-978a-801c2c96971d	\N
eed92b0c-fc6c-484b-8c54-cc635efa1719	2023-03-12 00:00:00	65a2c274-9384-45d9-8c5a-729fec31bc75	0337171d-545c-4a85-99a4-2fdd0d872318	\N
f042ccea-64f0-447d-9dd2-626e7d94e407	2023-03-12 00:00:00	0a92192d-841d-4828-8269-01a0d37d8acf	0337171d-545c-4a85-99a4-2fdd0d872318	\N
f1037e02-b38f-4df6-b848-aa0c3e087a48	2023-03-12 00:00:00	6ab8ccae-e363-466a-b4aa-7840fe563bfc	f455ee61-ad70-43e7-bbe9-37b377479a3b	\N
f29a09a4-5bb4-4fb9-bfb2-294f74b72fb8	2023-03-12 00:00:00	1c3d58f9-edc5-4ae1-8bc5-f593d241ab9a	fecc7ef3-a3f4-4085-8ac0-d243cf8cf16a	\N
f603ba8a-4b50-4a20-b6c3-2a4b88c2438f	2023-03-12 00:00:00	2388893f-0144-47db-bcbe-e4e664ec289c	253d7e8d-f23e-4edc-98ce-ca8796a29eb9	\N
f6b797d3-6a7f-4f33-b534-37206e320521	2023-03-12 00:00:00	f5dc50d6-e185-429a-80c2-81504bd4187e	ec8b3f24-5ab9-4d76-a948-3fc22605ee99	\N
f81cfe35-9c05-4689-852a-a0999d1af24b	2023-03-12 00:00:00	8dc02c13-3c93-4e25-9e63-0b277255870b	920a17cd-73c4-4a95-b56a-25dfbfbee90f	\N
fbf5ad55-69e6-4955-8bcf-a60d7bbd4b98	2023-03-12 00:00:00	6484796e-251d-4f6e-81ce-52abc15bb1ce	8ca92210-1c0c-4f57-ab85-29c0aa79e9a6	\N
fe7c107e-8c73-4af5-b031-4796609566fe	2023-03-12 00:00:00	83d6a9a1-d50f-4638-a746-584ba8ae9af5	2c8c81ae-c82e-4c76-b1c6-455fb0e32b70	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
0256760e-9e60-499b-bdff-19926a55a56d	0	2	\N	\N	f6b797d3-6a7f-4f33-b534-37206e320521	\N
056b0c0e-db23-44e3-98d8-e2078c258251	0	2	\N	\N	61c192c5-44d4-4d0e-91e3-8edc54a08fb9	\N
0834e002-b392-4c2c-ad12-536ae84814e3	0	2	\N	\N	f603ba8a-4b50-4a20-b6c3-2a4b88c2438f	\N
0d10cf29-17ba-46c6-88b5-27ee9de389e0	0	2	\N	\N	bb9c37ea-725d-45e2-8040-da6398765664	\N
1833c251-f05b-40cf-99f7-52034d3c0706	0	2	\N	\N	ca229289-8ad1-411d-ac74-b9c77fcb9b8e	\N
18c5d57e-148b-4cc3-99d5-1fbecc01d391	0	3	\N	\N	b8cf2b8b-530e-4c98-a72a-c3a4ec8eea5d	\N
1b9ff499-7b6d-491f-a787-65e33cc4d51d	0	2	\N	\N	5d3fea06-c79e-4be6-ac83-31a365b9b5e8	\N
1fdb2e73-76c5-4b7c-a68e-22232b3e7967	0	3	\N	\N	596e76eb-5393-4fd4-ade3-b717e1c4ba21	\N
2167ccbf-c6f5-4133-ba85-c749018ba92e	0	2	\N	\N	36b6c695-6e3e-4150-adf5-731673968d65	\N
24235a3e-848d-4c2e-8106-cbf57f428106	0	3	\N	\N	c3508a89-a2d0-47d2-8c7d-c65706c93392	\N
2527a2c1-1f81-4b27-bb93-eca88b3a9596	0	3	\N	\N	0381589f-2a7f-4e4c-b9b9-a31547b92e70	\N
256f7495-cae2-462e-9bd7-49bb24ecc82c	0	3	\N	\N	39522f74-dd4b-4380-af3f-0822729642b0	\N
264dfb06-5cf9-429e-a25a-a47750657204	0	3	\N	\N	41c8e1e8-e417-434e-b332-a11604ab7122	\N
270ec000-88aa-4e2f-a6ec-5f46d8cbfe8c	0	3	\N	\N	d79ef2ae-b059-48d4-ae23-0c9b670ef588	\N
2731996e-198d-4ce8-a975-993e8b023642	0	3	\N	\N	1fdce7c6-18c3-4cc4-87fd-1639878e9c49	\N
288bc032-efdc-4182-9d4a-167c0756fa40	0	3	\N	\N	dbe9588e-4dca-4085-a42b-28ba1687d086	\N
29ad0a31-521e-4710-9825-7a75d8fe3916	0	3	\N	\N	20b91fd9-9869-46c4-ae94-6c62fa52709d	\N
2e7dd2bc-5ef0-4216-8d60-82fa87314742	0	3	\N	\N	5d3fea06-c79e-4be6-ac83-31a365b9b5e8	\N
2fefdd2d-1a68-4f0a-8cb0-1b4061aa6382	0	3	\N	\N	023928e5-179b-4e40-bc18-2acd1a39dc73	\N
30222938-8378-4581-a0bf-31e9bdafaa19	0	2	\N	\N	8619f901-92a7-4bc8-a4df-299f4764466b	\N
311b242c-677d-423a-a546-2897fc2d043a	0	3	\N	\N	bb9c37ea-725d-45e2-8040-da6398765664	\N
331e6c13-b4d3-4f42-8a84-4e2a7e8f1a56	0	2	\N	\N	cb73dee6-7ca2-489a-ae08-38ea42adb72f	\N
34cca067-3690-4761-8860-32bb484dc863	0	3	\N	\N	4b1256ab-7efe-45ba-8e0e-f9a86cfd9e93	\N
36b7ee7f-f140-4d3b-85c3-a6de7cb8bce5	0	2	\N	\N	4b1256ab-7efe-45ba-8e0e-f9a86cfd9e93	\N
373fbfc4-febd-40ed-a938-83737803774e	0	3	\N	\N	f603ba8a-4b50-4a20-b6c3-2a4b88c2438f	\N
39a7f0aa-8973-4ddb-8fae-8cb00e780a3a	0	2	\N	\N	6d96bc7c-e453-4cae-b32c-a79b1b9a9e92	\N
3b3e1258-9c2b-4f36-a4ea-00084da7f5f7	0	3	\N	\N	fe7c107e-8c73-4af5-b031-4796609566fe	\N
3c74a624-7910-4094-a56c-6f8c14f5e8d6	0	2	\N	\N	8b94f6fd-4130-4521-a947-27d6911a5738	\N
3d52ced7-9431-473f-a487-a575bafd5b7c	0	3	\N	\N	ab5aa367-ca0b-4c56-acac-ef34aa906218	\N
40fbe84a-e80c-4ee7-9249-1448c8d5cc11	0	2	\N	\N	fe7c107e-8c73-4af5-b031-4796609566fe	\N
429d654c-c24e-4002-9abe-5b2a4e26edfc	0	3	\N	\N	953b2d05-e6bf-41e4-94df-c21830f976b4	\N
44268c00-3686-419f-b448-d49a427e7533	0	3	\N	\N	9989395c-edb6-4b6f-9064-690cce2a818b	\N
4780e7d4-3ff4-438d-959f-51e57103db46	0	3	\N	\N	c34634cd-1626-4bbe-8ae3-4b40cbbbd422	\N
47f33d4c-00b9-4106-afb0-23edc97b9886	0	3	\N	\N	762397b3-ce13-4569-8128-25b7d4c931a9	\N
49d4ddcb-3089-4e35-9f79-9eadc8a400ae	0	2	\N	\N	41c8e1e8-e417-434e-b332-a11604ab7122	\N
4d95f57a-a92a-4280-a940-6b29a8507199	0	2	\N	\N	5b9def80-8100-48d4-b0f1-9227ad07016e	\N
4da01792-5492-46d4-bda9-56b04970e340	0	3	\N	\N	af7f7009-6283-418f-9def-56d139c0a83d	\N
4e0c7ee5-3f5e-4ce8-88e4-29f3de6723c5	0	3	\N	\N	8b94f6fd-4130-4521-a947-27d6911a5738	\N
4fade8ee-9684-4e2c-8adb-0e50a28f360f	0	2	\N	\N	35fc292f-cb0e-4bb3-8bfe-5aaa4904bd56	\N
52d46abc-8e7a-42e7-83c8-8c661fa9256b	0	3	\N	\N	cb73dee6-7ca2-489a-ae08-38ea42adb72f	\N
5f2c55f7-cb69-4555-b347-a959f90f4da4	0	3	\N	\N	c8143ee0-8718-4d2b-855a-9c32247b8a9a	\N
60481b6b-00a4-4a76-b713-ad6afba9a85a	0	3	\N	\N	b0c3028e-015d-4a29-abe7-3c7708721055	\N
624a0a82-7937-4bab-a0a6-9728d30ee64f	0	2	\N	\N	f042ccea-64f0-447d-9dd2-626e7d94e407	\N
62e7125a-7b18-460b-9fdc-935eb5ec0a88	0	2	\N	\N	caf2c53a-091d-43b0-9c39-456a2fadf0eb	\N
6712bec9-7d73-496f-91ef-d2bd8a3b0439	0	2	\N	\N	6fd26656-1d40-4325-a230-1f8293c222af	\N
677edaa7-3bde-4ece-ae85-16ee99385b62	0	2	\N	\N	aa89c205-1740-4b33-be54-2b28c23ed546	\N
67b3e6e5-44bd-4154-8eb2-6bab58e9021a	0	2	\N	\N	bc675ad9-f408-48e4-9531-f933af9994b4	\N
686afbba-88c3-4597-91a5-bfcca2d028ac	0	3	\N	\N	1a529fff-d153-44da-8d3c-9bce96a31b2b	\N
6939c11a-8b83-4a4f-8d3d-10dfe9a47e4e	0	2	\N	\N	c34634cd-1626-4bbe-8ae3-4b40cbbbd422	\N
6ba4b345-ece6-4647-868e-c0d4d4e6f360	0	3	\N	\N	d6e21646-cc16-4069-abb9-6bd745d30463	\N
6c7b73a1-a4e6-4e31-be4c-5e964c23e5aa	0	2	\N	\N	c8143ee0-8718-4d2b-855a-9c32247b8a9a	\N
6d4521a1-09b9-4341-9f63-45d311d88f22	0	2	\N	\N	bd57ba28-f3e9-4ed0-a483-2deb17a740c0	\N
6d967efb-a420-4ef8-a276-749f1aba951a	0	2	\N	\N	05e1138c-05b2-4467-af14-8e5c09ff0337	\N
6e0c14ee-8ee8-4600-9740-95b340af00dd	0	2	\N	\N	1fdce7c6-18c3-4cc4-87fd-1639878e9c49	\N
708b7559-92d2-44b3-87b3-b433bdd15323	0	3	\N	\N	bd8c738f-4dfb-4823-a7bb-6e9fbf33836b	\N
70f8dfd4-f3aa-4399-a459-83e5e7308261	0	2	\N	\N	4d367cd3-cdd2-4036-aff3-fbdf64b99cd9	\N
70ffd71b-4cd4-47bf-933d-1ec850bb214c	0	3	\N	\N	4b0c9bdd-4417-47ea-82a4-b10b588726d8	\N
727e340b-e294-4c90-8024-cb146de28131	0	2	\N	\N	953b2d05-e6bf-41e4-94df-c21830f976b4	\N
7476384b-53d1-4704-a817-a07678809d16	0	2	\N	\N	d6e21646-cc16-4069-abb9-6bd745d30463	\N
765f3c3d-9de1-445c-a557-6f28aee22493	0	2	\N	\N	40c669ad-6196-4c4b-a1bb-fe11a9869532	\N
767f89e7-482c-4652-a505-6bd3403178c6	0	3	\N	\N	fbf5ad55-69e6-4955-8bcf-a60d7bbd4b98	\N
77130f28-c7dd-4fa9-a25a-77532f15dfff	0	2	\N	\N	f29a09a4-5bb4-4fb9-bfb2-294f74b72fb8	\N
77fca9ce-e31b-4bec-83b1-fce26df0059b	0	3	\N	\N	caf2c53a-091d-43b0-9c39-456a2fadf0eb	\N
7990681f-accc-4305-aacc-9c6167dddf8c	0	3	\N	\N	f29a09a4-5bb4-4fb9-bfb2-294f74b72fb8	\N
79b5325e-46e9-4654-8144-e4265b7ed467	0	3	\N	\N	5b9def80-8100-48d4-b0f1-9227ad07016e	\N
7a6b3fca-c071-4cb8-8e17-67eacdb1a915	0	3	\N	\N	eed92b0c-fc6c-484b-8c54-cc635efa1719	\N
7d1e1347-bedd-4b57-9c83-67541feb5d62	0	3	\N	\N	74e9683f-b371-43c8-8737-0a2221088858	\N
7d446e55-64d6-4034-8736-946cdde2442a	0	3	\N	\N	61c192c5-44d4-4d0e-91e3-8edc54a08fb9	\N
808ad777-b9b1-4655-a396-dcbd7c047526	0	2	\N	\N	2a56d8da-b9a7-4945-b846-e1562d0efdf0	\N
80e8f36b-f1d6-4db2-bd60-61bf7ed42512	0	3	\N	\N	bc675ad9-f408-48e4-9531-f933af9994b4	\N
8179ae10-f8bf-4c50-ad81-e94622659a79	0	3	\N	\N	de18ac33-f364-4018-9c66-57fc8429d756	\N
824a8ddd-c98f-4744-8119-e79202903682	0	2	\N	\N	74e9683f-b371-43c8-8737-0a2221088858	\N
83917daf-0083-441b-8826-29c37a57dfc2	0	2	\N	\N	78a2fc46-59e8-469c-9dc5-3e80d1f577f5	\N
852f1090-41fc-4319-a1b8-d34425210e9a	0	2	\N	\N	962f072a-09cb-4feb-824b-5cb5e96b939a	\N
87755bae-c20a-47af-87d7-f91377663386	0	3	\N	\N	8097e5a1-c8e6-41b3-9061-959a2e213827	\N
8b31e60e-0e19-4951-9b8e-9b54585929b5	0	3	\N	\N	cd606148-8576-4ec0-b2f9-191cba09fa0f	\N
929150c4-ea2a-43bf-a440-c5b81869cf9d	0	3	\N	\N	962f072a-09cb-4feb-824b-5cb5e96b939a	\N
93db6e65-c398-4dad-841e-33e38ce9d620	0	3	\N	\N	68b304c5-2698-430c-b6cf-4602cd8132e0	\N
989f1e9c-cbdc-4034-875b-0f416bc02c52	0	2	\N	\N	d1b8891f-1713-471b-bf82-2700eaee6156	\N
9c5521c6-10c9-42ac-8ed2-e075e703581f	0	3	\N	\N	05e1138c-05b2-4467-af14-8e5c09ff0337	\N
9e7fa740-30d1-4c01-b85a-eae2e4b02225	0	2	\N	\N	762397b3-ce13-4569-8128-25b7d4c931a9	\N
a314899d-7bd7-4b12-8cda-bd10adc81d62	0	3	\N	\N	6d96bc7c-e453-4cae-b32c-a79b1b9a9e92	\N
a380dff0-b583-4ffa-9153-c289bb30f339	0	2	\N	\N	519f94dc-1645-4693-8df5-c042a75696a3	\N
a779ebee-9bb9-4c8e-977d-0ce4c7ea9257	0	2	\N	\N	4b0c9bdd-4417-47ea-82a4-b10b588726d8	\N
a8363d25-84de-4bb2-a8e5-e21272f37860	0	3	\N	\N	36b6c695-6e3e-4150-adf5-731673968d65	\N
a874d848-8780-464f-aba5-312e2a105176	0	3	\N	\N	78a2fc46-59e8-469c-9dc5-3e80d1f577f5	\N
a9c5094b-3aef-4e20-9ed6-d08a852ed713	0	3	\N	\N	f81cfe35-9c05-4689-852a-a0999d1af24b	\N
aa4cd5e6-644f-4d5b-b081-55c740ee2d7c	0	2	\N	\N	eed92b0c-fc6c-484b-8c54-cc635efa1719	\N
aa4e1879-b9ce-4392-81f2-d522f2099496	0	2	\N	\N	c3508a89-a2d0-47d2-8c7d-c65706c93392	\N
aa673f1f-f784-431b-a45d-70d61c147990	0	3	\N	\N	42ba7f9d-8b19-45e2-a23f-5dc22c0b1bcf	\N
aaecfc0f-e9e4-479d-b586-44c3adc86882	0	3	\N	\N	ce1d6eab-ab24-44c6-a24c-fb10a82b7d17	\N
ac91ada4-68dd-456b-8de1-4215c911b215	0	2	\N	\N	f1037e02-b38f-4df6-b848-aa0c3e087a48	\N
ad6c573b-4d2a-4456-8c53-8b5bc2077d61	0	2	\N	\N	39522f74-dd4b-4380-af3f-0822729642b0	\N
ae2acbb2-cad7-48b4-add7-8ad5f22a2697	0	3	\N	\N	8619f901-92a7-4bc8-a4df-299f4764466b	\N
af9674d2-92ba-4c3f-a781-2c4c8f712c67	0	3	\N	\N	f042ccea-64f0-447d-9dd2-626e7d94e407	\N
b6892dee-83b8-4115-9c80-ea5c4b82b113	0	2	\N	\N	fbf5ad55-69e6-4955-8bcf-a60d7bbd4b98	\N
b88a59f6-bf64-4da7-a5e8-bccd17efc3d2	0	2	\N	\N	f81cfe35-9c05-4689-852a-a0999d1af24b	\N
ba10c267-39d0-428d-a4f9-fde6ff841445	0	2	\N	\N	af7f7009-6283-418f-9def-56d139c0a83d	\N
bdc3e738-6378-4a93-bb35-89bea943cf49	0	3	\N	\N	16784c4e-c2a5-49f6-bd91-4d8953ee8cd8	\N
be081d1d-4eef-4535-a0ba-89fc9430db3c	0	2	\N	\N	8097e5a1-c8e6-41b3-9061-959a2e213827	\N
bf09dc0b-ebd3-4f2f-b746-b0f8c29c8fea	0	2	\N	\N	cd606148-8576-4ec0-b2f9-191cba09fa0f	\N
bf4bafc6-8086-492f-a554-17b52940bbe9	0	2	\N	\N	d79ef2ae-b059-48d4-ae23-0c9b670ef588	\N
bfaa084f-6c79-4f1d-ac5a-e1bb00a4058c	0	3	\N	\N	519f94dc-1645-4693-8df5-c042a75696a3	\N
c061bda4-bdb7-4ea5-a3ef-717dc88d5a6c	0	3	\N	\N	bd57ba28-f3e9-4ed0-a483-2deb17a740c0	\N
c2bc4282-a065-40e8-8e2c-30df5026aeaf	0	2	\N	\N	ab5aa367-ca0b-4c56-acac-ef34aa906218	\N
c4cff08c-ef81-4e16-b3e0-06dfc95b4a71	0	2	\N	\N	b8cf2b8b-530e-4c98-a72a-c3a4ec8eea5d	\N
c9494fe3-6a14-4412-ab2e-5644e58a1819	0	2	\N	\N	1a529fff-d153-44da-8d3c-9bce96a31b2b	\N
c959a312-7198-4254-a0da-f02aed2c6d7a	0	3	\N	\N	6f0bb095-9f7d-4d80-8162-d8fce845d1af	\N
ce4e446e-e3e7-4062-a41a-a60105db83de	0	2	\N	\N	bd8c738f-4dfb-4823-a7bb-6e9fbf33836b	\N
cea944fc-8676-4c55-a797-86732f1c96bf	0	2	\N	\N	b0c3028e-015d-4a29-abe7-3c7708721055	\N
cf101ee8-6ed1-4f40-b3ea-949090c86c71	0	3	\N	\N	f6b797d3-6a7f-4f33-b534-37206e320521	\N
d276fd61-b771-47d6-831c-0bcf8cfa097b	0	3	\N	\N	578b0b6b-1324-4448-b614-a90919ff4002	\N
d337c6aa-ad18-4292-a0a6-a30521ee6ec9	0	2	\N	\N	578b0b6b-1324-4448-b614-a90919ff4002	\N
d3a2f083-d546-433c-9710-0faf36619358	0	3	\N	\N	4343a84e-926f-484c-8e9f-12278741aee5	\N
d3f8c71d-49e3-4d9e-864c-ac10eb55f513	0	2	\N	\N	6f0bb095-9f7d-4d80-8162-d8fce845d1af	\N
d84c4892-a70f-4042-99bb-ff8d97150b5e	0	2	\N	\N	de18ac33-f364-4018-9c66-57fc8429d756	\N
da977f3c-f004-41e4-ba5f-375dace78b75	0	2	\N	\N	ce1d6eab-ab24-44c6-a24c-fb10a82b7d17	\N
e0b8e09a-22f0-4327-9d75-67a43bade077	0	3	\N	\N	d1b8891f-1713-471b-bf82-2700eaee6156	\N
e2f66635-9b69-40a0-b9e4-e39bbd5c4b68	0	2	\N	\N	68b304c5-2698-430c-b6cf-4602cd8132e0	\N
e3316efd-ef99-447c-9afd-5a3dceac9cf0	0	3	\N	\N	aa89c205-1740-4b33-be54-2b28c23ed546	\N
e3a33515-edd4-428c-b095-0b1215d140c4	0	2	\N	\N	596e76eb-5393-4fd4-ade3-b717e1c4ba21	\N
e5973184-877a-4bd2-9642-4d831609343f	0	2	\N	\N	9989395c-edb6-4b6f-9064-690cce2a818b	\N
e6c0588d-39bd-4030-aa2a-015cd3b01f0b	0	2	\N	\N	20b91fd9-9869-46c4-ae94-6c62fa52709d	\N
ea24d1cb-e1ad-4d22-9054-1c88c22bd1ae	0	3	\N	\N	2a56d8da-b9a7-4945-b846-e1562d0efdf0	\N
ea5f3179-f758-4f6d-bcf9-66e827f15441	0	3	\N	\N	35fc292f-cb0e-4bb3-8bfe-5aaa4904bd56	\N
eacd43bd-0322-4ce8-bd01-01f208430373	0	2	\N	\N	42ba7f9d-8b19-45e2-a23f-5dc22c0b1bcf	\N
f0e6db09-7130-4a19-88d5-683c93a3a670	0	2	\N	\N	4343a84e-926f-484c-8e9f-12278741aee5	\N
f2bf22a4-c0e1-4562-86d1-985bdc0651be	0	2	\N	\N	023928e5-179b-4e40-bc18-2acd1a39dc73	\N
f41efac2-c84a-4b4c-8718-185999ef53b3	0	2	\N	\N	dbe9588e-4dca-4085-a42b-28ba1687d086	\N
f432af82-3c23-4212-ade0-979da050a87b	0	2	\N	\N	0381589f-2a7f-4e4c-b9b9-a31547b92e70	\N
f4825203-8243-4fba-b922-346839047b0c	0	3	\N	\N	f1037e02-b38f-4df6-b848-aa0c3e087a48	\N
f65ff5a7-e8b7-4ed7-a742-3ef9611fa49d	0	3	\N	\N	6fd26656-1d40-4325-a230-1f8293c222af	\N
f76de77b-1a1c-41bd-bc8b-fee1ceb16b10	0	2	\N	\N	16784c4e-c2a5-49f6-bd91-4d8953ee8cd8	\N
f770ad85-8c99-4cec-89e9-f83efbb90fa1	0	3	\N	\N	4d367cd3-cdd2-4036-aff3-fbdf64b99cd9	\N
fe97066e-a966-4d7a-8816-30ac9b7ee7ee	0	3	\N	\N	ca229289-8ad1-411d-ac74-b9c77fcb9b8e	\N
ff16b981-6225-4474-80a7-5c2618579e21	0	3	\N	\N	40c669ad-6196-4c4b-a1bb-fe11a9869532	\N
00232b65-8c74-4220-906e-14a86cafbc04	2	1	\N	\N	c3508a89-a2d0-47d2-8c7d-c65706c93392	\N
022b09de-4f0f-4d85-a264-e7d68dcc64c0	2	1	\N	\N	c34634cd-1626-4bbe-8ae3-4b40cbbbd422	\N
040e8c14-80fb-42b2-80a6-2cb7533db959	2	1	\N	\N	4b1256ab-7efe-45ba-8e0e-f9a86cfd9e93	\N
05abcbd4-29f9-4a38-a5d2-0be88c7206a1	2	1	\N	\N	f81cfe35-9c05-4689-852a-a0999d1af24b	\N
0a5e00cd-1582-4766-96b3-977dd9bbc260	2	1	\N	\N	caf2c53a-091d-43b0-9c39-456a2fadf0eb	\N
15aba5a4-ca8d-4b20-8c9d-55c8056310c8	2	1	\N	\N	cd606148-8576-4ec0-b2f9-191cba09fa0f	\N
1e23e95c-9dbb-4210-af4f-3bab480e3b27	2	1	\N	\N	bd8c738f-4dfb-4823-a7bb-6e9fbf33836b	\N
236c3d0f-8a23-4442-a8a2-e866c9f1259d	2	1	\N	\N	578b0b6b-1324-4448-b614-a90919ff4002	\N
25c4333c-1f77-4d8f-ac25-71f572519186	2	1	\N	\N	4d367cd3-cdd2-4036-aff3-fbdf64b99cd9	\N
25e7596d-ebbe-4002-981c-7ada0c2a7a60	2	1	\N	\N	cb73dee6-7ca2-489a-ae08-38ea42adb72f	\N
34b5ed22-7ade-4e2a-8e26-16fa45f110c9	2	1	\N	\N	36b6c695-6e3e-4150-adf5-731673968d65	\N
38fbfdaf-bd6b-427f-83f7-c9a417abb7b1	2	1	\N	\N	68b304c5-2698-430c-b6cf-4602cd8132e0	\N
3f93de9a-b333-485d-969c-dfffc8eebb11	2	1	\N	\N	1a529fff-d153-44da-8d3c-9bce96a31b2b	\N
4b2d6361-f003-48dd-ba52-b1f27a3b4a07	2	1	\N	\N	d1b8891f-1713-471b-bf82-2700eaee6156	\N
4cbed2b1-d769-4148-b17a-4b62c9e35073	2	1	\N	\N	6f0bb095-9f7d-4d80-8162-d8fce845d1af	\N
4d44d01c-e9d6-4325-bc4a-deab9a074543	2	1	\N	\N	bd57ba28-f3e9-4ed0-a483-2deb17a740c0	\N
4df07d4e-f586-4532-9c22-42644d78f8ba	2	1	\N	\N	aa89c205-1740-4b33-be54-2b28c23ed546	\N
50f79364-cf4c-4439-a70a-2098899c27d3	2	1	\N	\N	6d96bc7c-e453-4cae-b32c-a79b1b9a9e92	\N
52097eae-8eca-44cc-9c40-c32172152885	2	1	\N	\N	61c192c5-44d4-4d0e-91e3-8edc54a08fb9	\N
520a083b-873e-4cdd-9055-c0a92f6fff2e	2	1	\N	\N	4b0c9bdd-4417-47ea-82a4-b10b588726d8	\N
5606faf7-b51b-4372-b9f6-2fe80b3d429e	2	1	\N	\N	0381589f-2a7f-4e4c-b9b9-a31547b92e70	\N
59f573aa-46b2-48de-83a5-46e9af4155db	2	1	\N	\N	2a56d8da-b9a7-4945-b846-e1562d0efdf0	\N
5bb8d068-6dc1-4e01-af65-f01ac816683b	2	1	\N	\N	b8cf2b8b-530e-4c98-a72a-c3a4ec8eea5d	\N
5c69bebb-ba6e-41af-98c9-9967662d3bfc	2	1	\N	\N	c8143ee0-8718-4d2b-855a-9c32247b8a9a	\N
5c745ace-723a-442b-bf6d-0b2a7fcf3f33	2	1	\N	\N	de18ac33-f364-4018-9c66-57fc8429d756	\N
5d30c8b2-c98a-4a26-9dfb-0a54cb10a67c	2	1	\N	\N	8b94f6fd-4130-4521-a947-27d6911a5738	\N
62c7cfc7-5413-4770-974b-5d3164638e79	2	1	\N	\N	bb9c37ea-725d-45e2-8040-da6398765664	\N
638c3c77-3904-476c-b5df-2479b80cd0e5	2	1	\N	\N	fe7c107e-8c73-4af5-b031-4796609566fe	\N
63ce95e0-945b-42bc-bc2c-d941ea1f927b	2	1	\N	\N	5d3fea06-c79e-4be6-ac83-31a365b9b5e8	\N
644d74e1-ce39-4fde-b140-c83c06aec0a8	2	1	\N	\N	6fd26656-1d40-4325-a230-1f8293c222af	\N
660e37ea-fb0e-4177-b0f5-a8f45b1367f6	2	1	\N	\N	eed92b0c-fc6c-484b-8c54-cc635efa1719	\N
669abe09-72c5-4928-a679-948aba8688d0	2	1	\N	\N	05e1138c-05b2-4467-af14-8e5c09ff0337	\N
677c5f14-8690-434b-b47d-6ed364a19c1d	2	1	\N	\N	8097e5a1-c8e6-41b3-9061-959a2e213827	\N
67cbc807-f2b1-40c8-8ba5-78bd1e5b16e2	2	1	\N	\N	f6b797d3-6a7f-4f33-b534-37206e320521	\N
7379a4f5-e0ce-471f-a58f-5822aad29788	2	1	\N	\N	20b91fd9-9869-46c4-ae94-6c62fa52709d	\N
7606bdfb-a644-4125-9852-c19ad4090bcd	2	1	\N	\N	953b2d05-e6bf-41e4-94df-c21830f976b4	\N
7c77b61f-1655-4c95-972a-3b47a1d2a93a	2	1	\N	\N	af7f7009-6283-418f-9def-56d139c0a83d	\N
8cbddb91-660b-451a-bb17-d13d1017f5af	2	1	\N	\N	41c8e1e8-e417-434e-b332-a11604ab7122	\N
8cf8d765-2860-4e55-8df7-767219f8b7ee	2	1	\N	\N	762397b3-ce13-4569-8128-25b7d4c931a9	\N
90d2886b-ea14-4458-ad14-43e8adb434db	2	1	\N	\N	596e76eb-5393-4fd4-ade3-b717e1c4ba21	\N
9424f91b-4fce-43a2-81be-58f31d1ebd1d	2	1	\N	\N	ab5aa367-ca0b-4c56-acac-ef34aa906218	\N
9c16ffa9-a3ad-41a9-ab48-f1506b24aabc	2	1	\N	\N	74e9683f-b371-43c8-8737-0a2221088858	\N
9ea69ed9-afbe-420a-87a3-7901cf36bcdb	2	1	\N	\N	4343a84e-926f-484c-8e9f-12278741aee5	\N
9f5be864-7aae-4d3a-b051-13d69388b3b7	2	1	\N	\N	d6e21646-cc16-4069-abb9-6bd745d30463	\N
9f9f9498-ee19-4253-97bf-85b72cb8d110	2	1	\N	\N	42ba7f9d-8b19-45e2-a23f-5dc22c0b1bcf	\N
a3da2620-ae36-41b6-9b3b-7a1d7cb30f89	2	1	\N	\N	39522f74-dd4b-4380-af3f-0822729642b0	\N
a4db9cf9-535a-41cd-9684-2735e256084d	2	1	\N	\N	dbe9588e-4dca-4085-a42b-28ba1687d086	\N
a679ce95-045c-4aad-90b5-acfecec4a498	2	1	\N	\N	f042ccea-64f0-447d-9dd2-626e7d94e407	\N
b01b8e20-3c58-4789-81ad-510a56ea685f	2	1	\N	\N	5b9def80-8100-48d4-b0f1-9227ad07016e	\N
b34d4ba0-04f6-4218-932f-e5da850df43a	2	1	\N	\N	b0c3028e-015d-4a29-abe7-3c7708721055	\N
ba0bb177-0534-46f5-a0cf-2a0b79d766af	2	1	\N	\N	9989395c-edb6-4b6f-9064-690cce2a818b	\N
c19f7d5e-a03f-49ab-82b1-8593629d8284	2	1	\N	\N	1fdce7c6-18c3-4cc4-87fd-1639878e9c49	\N
c36300d3-8a0d-4f61-b56a-19f035b3b6c5	2	1	\N	\N	ca229289-8ad1-411d-ac74-b9c77fcb9b8e	\N
c5bcdb1e-59c5-44d7-8177-c926ba7089e8	2	1	\N	\N	962f072a-09cb-4feb-824b-5cb5e96b939a	\N
c855148a-38ba-464d-9b36-01c8b76603a7	2	1	\N	\N	023928e5-179b-4e40-bc18-2acd1a39dc73	\N
cc96a5d9-8d7a-40bd-9692-729f4e359de9	2	1	\N	\N	f29a09a4-5bb4-4fb9-bfb2-294f74b72fb8	\N
ccea5b2e-780b-4a64-9200-c1ca5160c5b9	2	1	\N	\N	bc675ad9-f408-48e4-9531-f933af9994b4	\N
cd73b4b9-11a4-4c19-9126-7189e33825c7	2	1	\N	\N	d79ef2ae-b059-48d4-ae23-0c9b670ef588	\N
d073f410-2255-4f73-b9c1-2e2c0d62fb64	2	1	\N	\N	8619f901-92a7-4bc8-a4df-299f4764466b	\N
d1060c6b-c09c-4a31-9c5e-4f4cea5eed0f	2	1	\N	\N	40c669ad-6196-4c4b-a1bb-fe11a9869532	\N
d68c202e-9750-4ea7-bf04-2236859849a5	2	1	\N	\N	f1037e02-b38f-4df6-b848-aa0c3e087a48	\N
dd39999c-5f09-4c3c-ae51-caa57d3b668a	2	1	\N	\N	519f94dc-1645-4693-8df5-c042a75696a3	\N
ed6bcd0a-a839-4478-a659-270f7f6103d5	2	1	\N	\N	ce1d6eab-ab24-44c6-a24c-fb10a82b7d17	\N
edb59cc3-9cbf-4794-b54c-210e764abb1c	2	1	\N	\N	f603ba8a-4b50-4a20-b6c3-2a4b88c2438f	\N
ef5d9f8f-595e-41a2-a7c7-ecb102099b76	2	1	\N	\N	fbf5ad55-69e6-4955-8bcf-a60d7bbd4b98	\N
f4bb6870-e9a6-45ee-bbbd-295abf8a868e	2	1	\N	\N	16784c4e-c2a5-49f6-bd91-4d8953ee8cd8	\N
f6041aaa-a86f-483f-b62a-c527c8183c68	2	1	\N	\N	35fc292f-cb0e-4bb3-8bfe-5aaa4904bd56	\N
f61fab52-436a-413c-81b8-26d6ccc17f66	2	1	\N	\N	78a2fc46-59e8-469c-9dc5-3e80d1f577f5	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
01761540-08ba-42a3-a195-e7276d647c56	54	400	t	f	fbad1ea7-a07d-4df3-8491-9235edcd0ba0	961fd1c2-9871-4153-af41-facdede02f56	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
027bd9aa-217a-48e2-99e4-cc5b73f76b7c	18	4000	t	f	84d14097-a405-4cea-aa31-e2217d84adb2	e2feafea-6408-4b14-be2b-3167c76d8212	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
0799c108-b2c8-4b28-9fcb-508740f74de5	2	1880	t	f	8fac6409-2a34-42f6-b4d7-ab5461175e9a	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
0a92192d-841d-4828-8269-01a0d37d8acf	58	900	t	f	191ee071-0f79-4674-8f59-199885193113	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
0d722664-34b5-48de-ad9d-754132229733	18	4000	t	f	60d8869c-d97c-45b5-9b86-6b09f0fdec1d	e2feafea-6408-4b14-be2b-3167c76d8212	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
0e73c937-bf17-4843-833f-c5eb44b31ffa	2	1880	t	f	1688a612-78a6-4dd8-afed-47b5fec081ca	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
139f6e78-3104-4e87-8c63-58a27fc5dafe	55	400	t	f	4cc30b91-8588-4ec2-ab40-324dfb696372	6136f45e-9fbb-42f1-85c8-1b0dd49d6e29	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
177df222-55c6-4f21-b7ae-c89d33e68e6d	54	400	t	f	8aa5a5e1-6949-4ea0-b0be-7a3ec73ac983	961fd1c2-9871-4153-af41-facdede02f56	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
1c3d58f9-edc5-4ae1-8bc5-f593d241ab9a	2	1880	t	f	4c81ca95-1acf-4ee3-8faa-777247863627	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
2388893f-0144-47db-bcbe-e4e664ec289c	56	400	t	f	84d14097-a405-4cea-aa31-e2217d84adb2	a5a27cd8-be32-413e-a7f7-4c67500cee83	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
23a2bd77-d642-4ed8-acda-f46268f4b856	1	1900	t	f	0aa14e25-515f-4e1e-85b7-a24bcca0daed	2d6e98b1-331d-403f-8ab8-1f5e9aa63df6	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
28a5fa7f-34a5-4dfc-a12d-7ac050b68877	58	900	t	f	a613fcd6-439d-453f-a197-557e732c9f23	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
28baaf14-96cc-4233-8b7e-3f0076157be1	58	900	t	f	4cc30b91-8588-4ec2-ab40-324dfb696372	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
3188de0d-b30c-479e-8ddb-efb6e029c027	55	400	t	f	191ee071-0f79-4674-8f59-199885193113	6136f45e-9fbb-42f1-85c8-1b0dd49d6e29	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
38ddd3cc-bec4-4a2b-9abb-da25fb1a5af6	57	400	t	f	a613fcd6-439d-453f-a197-557e732c9f23	a740b55b-343f-46a2-9aba-6c3fb4072eee	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
3c6a81cf-8ea2-428a-ae52-8efbb6c61bcb	18	4000	t	f	fbad1ea7-a07d-4df3-8491-9235edcd0ba0	e2feafea-6408-4b14-be2b-3167c76d8212	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
3c977122-c2c5-488e-9416-e3c275368da8	2	1880	t	f	0aa14e25-515f-4e1e-85b7-a24bcca0daed	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
3e59cf32-23ee-443f-a0ca-a883c1fb231b	18	4000	t	f	f8091846-a419-406d-9b06-f8810a8fd39c	e2feafea-6408-4b14-be2b-3167c76d8212	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
3f3d7fd6-8d22-4337-8491-2147a093fac9	39	280	t	f	d330a48e-ea32-43b0-b0cf-f9775e521f51	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
437c1414-3f8a-4d39-9911-978d1062073d	39	280	t	f	9b90bd69-5b90-4d95-a385-b179229c1d0d	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
43b725be-d779-4d78-904e-b26c59366eea	1	1900	t	f	7cc40beb-31a0-43ef-9c93-373ed4fe514f	2d6e98b1-331d-403f-8ab8-1f5e9aa63df6	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
43cf6e3a-adf5-4524-9f1e-bb2847f85aaa	2	1880	t	f	b43ecc28-7d49-4f2f-a6f5-909ed9ddf4f9	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
4831663f-388c-4356-89da-b4b9ba886b1c	57	400	t	f	e8abcae3-9a64-4ed4-bd34-2ef046e57a2f	a740b55b-343f-46a2-9aba-6c3fb4072eee	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
4b9d62aa-ad0b-480e-9df8-6f9c2b68409a	57	400	t	f	0e41c78f-f11b-4799-b0ee-2b55f177bfac	a740b55b-343f-46a2-9aba-6c3fb4072eee	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
572f6849-1af2-49a0-b2f0-e9b49a87cbff	58	900	t	f	25978bc0-2221-4af4-a43b-4bc052a4987c	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
58ebdd20-f1b0-48ae-a4bb-51a52210c8bf	58	900	t	f	fbad1ea7-a07d-4df3-8491-9235edcd0ba0	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
5aedf2e4-ddbb-43d4-85a0-e27a676c2bfe	1	1900	t	f	6bc332d8-4d6e-467e-9b3a-0e33c39494d4	2d6e98b1-331d-403f-8ab8-1f5e9aa63df6	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6025c74c-db73-4d2d-8965-e84dab872c2e	52	1200	t	f	fb3f1dcc-e547-47a1-95db-6f22dd470494	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
619670e3-f2ca-41a6-beb7-1eb4830a0a66	48	1900	t	f	de35a1eb-e5e9-4fb9-9f6a-3f6bd10eaad9	171b9ea0-3831-40ab-9f68-9af58d7b7b13	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6220cf20-426b-442e-b536-862c3a0984bd	54	400	t	f	9b90bd69-5b90-4d95-a385-b179229c1d0d	961fd1c2-9871-4153-af41-facdede02f56	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6469ef5d-587a-44f2-945f-17038fda8a5f	2	1880	t	f	6bc332d8-4d6e-467e-9b3a-0e33c39494d4	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6484796e-251d-4f6e-81ce-52abc15bb1ce	58	900	t	f	0e41c78f-f11b-4799-b0ee-2b55f177bfac	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
65a2c274-9384-45d9-8c5a-729fec31bc75	54	400	t	f	191ee071-0f79-4674-8f59-199885193113	961fd1c2-9871-4153-af41-facdede02f56	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
66cccdb5-709d-4f9a-b6d7-2131bdf31fdf	48	1900	t	f	9d06e121-c0c8-4b1c-ab85-eace8360218e	171b9ea0-3831-40ab-9f68-9af58d7b7b13	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6813eb40-2882-4d1c-823e-29906eb97cb8	55	400	t	f	8aa5a5e1-6949-4ea0-b0be-7a3ec73ac983	6136f45e-9fbb-42f1-85c8-1b0dd49d6e29	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
68920883-23be-4457-9435-ea2f59df8ba5	48	1900	t	f	0da857d6-26d8-48e3-977c-7f4aeca0bf1f	171b9ea0-3831-40ab-9f68-9af58d7b7b13	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6ab8ccae-e363-466a-b4aa-7840fe563bfc	39	280	t	f	bc08d987-d137-417f-9573-fcd35c516f26	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
6fbd3962-9a31-4e38-927b-cfedb366bd34	18	4000	t	f	9b90bd69-5b90-4d95-a385-b179229c1d0d	e2feafea-6408-4b14-be2b-3167c76d8212	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
7185405b-0fff-472e-a90a-bcecdec2501b	52	1200	t	f	fc517944-a10e-46d2-9f81-8f6b40bb6d06	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
75b6280d-a365-4936-a03f-42726270da0b	39	280	t	f	fbad1ea7-a07d-4df3-8491-9235edcd0ba0	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
77140318-e825-4ecd-8c67-19724d69f4fb	39	280	t	f	64cb9c2d-8301-458c-adf1-1550ba378072	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
7de44703-7689-4815-915c-16fff8d9ad47	2	1880	t	f	7cc40beb-31a0-43ef-9c93-373ed4fe514f	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
83d6a9a1-d50f-4638-a746-584ba8ae9af5	58	900	t	f	9b90bd69-5b90-4d95-a385-b179229c1d0d	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
8dc02c13-3c93-4e25-9e63-0b277255870b	52	1200	t	f	1194e6e1-d598-4fe9-a14a-8a5a08dbf086	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
92d549e8-5be8-42fb-8a4d-f2eb8d9d7e27	56	400	t	f	92af9691-72c6-448b-83d3-f6bcfa2d65a2	a5a27cd8-be32-413e-a7f7-4c67500cee83	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
936e975d-6910-49e9-9cf7-860dfe18702e	39	280	t	f	9d06e121-c0c8-4b1c-ab85-eace8360218e	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
9464a643-3306-456c-bf34-0a8bea72d160	39	280	t	f	0e41c78f-f11b-4799-b0ee-2b55f177bfac	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
9970c6b6-6b4d-4137-8942-e6541fb68f65	1	1900	t	f	33a0174c-8e69-4270-bbac-22d0734de27c	2d6e98b1-331d-403f-8ab8-1f5e9aa63df6	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
a69aa705-da3b-4bba-b271-5a9a3f50c572	58	900	t	f	92af9691-72c6-448b-83d3-f6bcfa2d65a2	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
b5031781-f636-4272-a145-9129f05b03d7	48	1900	t	f	6509288d-7fd0-48ca-8cff-7b6b4639054a	171b9ea0-3831-40ab-9f68-9af58d7b7b13	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
b708e80c-6330-44ec-85ba-8c6f61f73d89	58	900	t	f	e8abcae3-9a64-4ed4-bd34-2ef046e57a2f	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
bfc8cf81-a4f4-47cf-8e4f-326407466c91	2	1880	t	f	33a0174c-8e69-4270-bbac-22d0734de27c	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
c007a70e-2be7-4589-8eaa-bbe17fdeffae	55	400	t	f	d330a48e-ea32-43b0-b0cf-f9775e521f51	6136f45e-9fbb-42f1-85c8-1b0dd49d6e29	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
c1e19001-5ac6-415c-9713-7690118aca47	39	280	t	f	84d14097-a405-4cea-aa31-e2217d84adb2	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
c3320c5d-3291-4e83-8bc3-490a5db27539	57	400	t	f	25978bc0-2221-4af4-a43b-4bc052a4987c	a740b55b-343f-46a2-9aba-6c3fb4072eee	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
c4d9f373-b88c-4334-b93e-65d5d85030a7	58	900	t	f	8aa5a5e1-6949-4ea0-b0be-7a3ec73ac983	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
c6d3a0fe-00af-46cb-902b-e4bf07e743cf	56	400	t	f	a613fcd6-439d-453f-a197-557e732c9f23	a5a27cd8-be32-413e-a7f7-4c67500cee83	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
d5069061-316d-4aaa-bad7-562c692e73b1	52	1200	t	f	6cc2b060-7624-4a5e-88ad-1c8dda4233af	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
d73e84f2-a9a5-4e8b-a732-f0423b9e6aa7	52	1200	t	f	00afe6fe-26c6-4885-9bee-1a3c748ce8da	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
e0e2c307-5768-4f38-8bdc-7abea1dab334	52	1200	t	f	2b603c3d-c2c5-4a7e-8008-50dbae62b2b4	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
e62dac28-06ca-44ac-b4f6-1ebf2bc31a6b	39	280	t	f	92af9691-72c6-448b-83d3-f6bcfa2d65a2	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
e7502135-4cba-4c90-aec7-a7b75130083d	39	280	t	f	4cc30b91-8588-4ec2-ab40-324dfb696372	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
eccce182-e57f-4f52-bdf0-6b9dec4c49fa	58	900	t	f	84d14097-a405-4cea-aa31-e2217d84adb2	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
f10af256-74da-4f37-8868-fe1c931e2a59	56	400	t	f	25978bc0-2221-4af4-a43b-4bc052a4987c	a5a27cd8-be32-413e-a7f7-4c67500cee83	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
f3748fcf-0002-4515-8033-bbaf26edc2f2	18	4000	t	f	92af9691-72c6-448b-83d3-f6bcfa2d65a2	e2feafea-6408-4b14-be2b-3167c76d8212	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
f4bb3ab6-89a3-41a6-b314-d2189809d58f	39	280	t	f	e8abcae3-9a64-4ed4-bd34-2ef046e57a2f	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
f5dc50d6-e185-429a-80c2-81504bd4187e	58	900	t	f	d330a48e-ea32-43b0-b0cf-f9775e521f51	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
f728daca-7223-4335-afa8-fc5f40ab69bf	39	280	t	f	0da857d6-26d8-48e3-977c-7f4aeca0bf1f	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N	27800995-a71f-4877-abc7-39218ee0af63	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
171b9ea0-3831-40ab-9f68-9af58d7b7b13	48	Инструкция 48	48
2d6e98b1-331d-403f-8ab8-1f5e9aa63df6	1	Инструкция 1	1
3cbc37d0-2d1b-4042-8436-7970ebeca22c	58	Инструкция 58	58
5aa485aa-ef98-45f6-aadd-cffc5b4fff52	52	Инструкция 52	52
6136f45e-9fbb-42f1-85c8-1b0dd49d6e29	55	Инструкция 55	55
961fd1c2-9871-4153-af41-facdede02f56	54	Инструкция 54	54
a5a27cd8-be32-413e-a7f7-4c67500cee83	56	Инструкция 56	56
a740b55b-343f-46a2-9aba-6c3fb4072eee	57	Инструкция 57	57
d3c73c23-1660-466b-b5fb-0903c5a4dd70	39	Инструкция 39	39
dfde5a62-d230-4b00-b0d8-08a884bb6f95	2	Инструкция 2	2
e2feafea-6408-4b14-be2b-3167c76d8212	18	Инструкция 18	18
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
98b53467-5774-4a62-afe3-9caeb91739ee	75131-2801300-20	Поперечина рамы задняя	\N	2868425
a9183121-2b66-499f-bcf3-39b78be4cc47	75131-2800010-70	Рама	\N	3291137
c4c018fb-9eee-4a48-adbc-220e5062c7da	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
7f417fed-9aa0-4dbd-912e-a28ca7c211dc	9a8b0211-2ed8-4d37-9255-fece43302107
cb8759e0-081f-40dc-8663-25e29de98b0a	9a8b0211-2ed8-4d37-9255-fece43302107
468ea3e1-4b25-4a99-9d97-a8da8559f407	a17e8296-005d-47e4-8661-97aebc67ebc2
ca90bbbd-c734-43c0-9295-f40907b2bd76	a17e8296-005d-47e4-8661-97aebc67ebc2
0246b347-f21d-433e-865d-379080f759ac	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
056f6c7e-a120-42d8-99a8-3053eb1f6ee1	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
0811ca26-2326-4652-a305-ffe8ea170d96	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
1b9e5769-a0e9-4262-b94a-60abe3606862	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
287a26ff-4fb9-4147-a58c-2e65b8b800ae	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
9df48aa7-9ee5-4bbd-a4bb-65212c0a5a36	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
d4de5907-5c63-4426-87e4-5640a5775e12	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
f6fb807e-b9c1-47da-8495-8cc8c26ac3b3	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
5623e905-a39f-4a6f-892a-fe15932790fe	c6b5d18f-5cb6-4213-9dfc-08e2bb5ec6df
fd8a7e9e-57df-4054-a631-125f6ef7c10a	f235b88b-6e76-4617-ad46-1b652ad03c1d
a7cfc795-81af-4090-99b8-8924c4fb63c6	6f5a6ff6-0211-49cb-852e-c333ffd6c1c1
f8669c9f-7d8e-45a6-991f-f3074b9213f5	9a8b0211-2ed8-4d37-9255-fece43302107
59fcc8fb-ebeb-4db5-a594-70432652fc85	c6b5d18f-5cb6-4213-9dfc-08e2bb5ec6df
72b992fa-6df5-4be0-81bc-90dec3b9af8e	a17e8296-005d-47e4-8661-97aebc67ebc2
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
7f417fed-9aa0-4dbd-912e-a28ca7c211dc	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	27800995-a71f-4877-abc7-39218ee0af63	\N
cb8759e0-081f-40dc-8663-25e29de98b0a	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	27800995-a71f-4877-abc7-39218ee0af63	\N
468ea3e1-4b25-4a99-9d97-a8da8559f407	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	27800995-a71f-4877-abc7-39218ee0af63	\N
ca90bbbd-c734-43c0-9295-f40907b2bd76	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	27800995-a71f-4877-abc7-39218ee0af63	\N
0246b347-f21d-433e-865d-379080f759ac	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	27800995-a71f-4877-abc7-39218ee0af63	\N
056f6c7e-a120-42d8-99a8-3053eb1f6ee1	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	27800995-a71f-4877-abc7-39218ee0af63	\N
0811ca26-2326-4652-a305-ffe8ea170d96	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	27800995-a71f-4877-abc7-39218ee0af63	\N
1b9e5769-a0e9-4262-b94a-60abe3606862	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	27800995-a71f-4877-abc7-39218ee0af63	\N
287a26ff-4fb9-4147-a58c-2e65b8b800ae	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	27800995-a71f-4877-abc7-39218ee0af63	\N
9df48aa7-9ee5-4bbd-a4bb-65212c0a5a36	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	27800995-a71f-4877-abc7-39218ee0af63	\N
d4de5907-5c63-4426-87e4-5640a5775e12	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	27800995-a71f-4877-abc7-39218ee0af63	\N
f6fb807e-b9c1-47da-8495-8cc8c26ac3b3	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	27800995-a71f-4877-abc7-39218ee0af63	\N
5623e905-a39f-4a6f-892a-fe15932790fe	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
fd8a7e9e-57df-4054-a631-125f6ef7c10a	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$Eo1MDcHJgPlXzpICeB+ySCKP1GdMiQLk1BT3ZbLSpi3UTsqX	\N	\N	\N	\N	\N	\N
a7cfc795-81af-4090-99b8-8924c4fb63c6	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$JxhsWy2fXubUbhQPg78uzEM7+u/P7xDm42kKuLOCWLBQBZUY	\N	\N	\N	\N	\N	\N
f8669c9f-7d8e-45a6-991f-f3074b9213f5	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$WTtwX+YSmNH0ULxt5v5CwE3vYBvoL13dxBsaIHll7awWJX+m	\N	\N	\N	\N	27800995-a71f-4877-abc7-39218ee0af63	\N
59fcc8fb-ebeb-4db5-a594-70432652fc85	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$mLXSXC6GUn0r8kH722qraae+A+Am2zRnHQj8NKHqu6H1zI7s	\N	\N	\N	\N	\N	\N
72b992fa-6df5-4be0-81bc-90dec3b9af8e	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$jwHP2/r5IbpMHM/qjTxQN7FFEA+9K8wdILvtYqMuv8GK+BQK	\N	\N	\N	\N	27800995-a71f-4877-abc7-39218ee0af63	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
04daa948-9670-4b49-8a74-0c8591ce99c3	1	Заполняющий	230	270	23	26	\N	\N	3cbc37d0-2d1b-4042-8436-7970ebeca22c	\N
434293d7-f91d-45ea-a72d-5369254c46cc	1	Заполняющий	230	270	23	26	\N	\N	961fd1c2-9871-4153-af41-facdede02f56	\N
454098c1-a821-4717-a482-40fb264d2917	1	Заполняющий	230	270	23	26	\N	\N	e2feafea-6408-4b14-be2b-3167c76d8212	\N
5c3ee588-02ec-4c64-aae1-ede8b6b48de7	1	Заполняющий	230	270	23	26	\N	\N	5aa485aa-ef98-45f6-aadd-cffc5b4fff52	\N
60a6a8b9-09f4-47d7-94a0-714505c94c86	1	Заполняющий	230	270	23	26	\N	\N	dfde5a62-d230-4b00-b0d8-08a884bb6f95	\N
61c80fd2-9094-4d42-8483-a550af6fe52a	1	Заполняющий	230	270	23	26	\N	\N	a5a27cd8-be32-413e-a7f7-4c67500cee83	\N
73d432a7-2ef7-4bfd-b28c-e6b984e20381	1	Заполняющий	230	270	23	26	\N	\N	a740b55b-343f-46a2-9aba-6c3fb4072eee	\N
be6052ea-c507-4c60-8b1a-1057c99b5aaa	1	Заполняющий	230	270	23	26	\N	\N	171b9ea0-3831-40ab-9f68-9af58d7b7b13	\N
cc5e049d-4659-46f8-8deb-6e8e43979e7e	1	Заполняющий	230	270	23	26	\N	\N	2d6e98b1-331d-403f-8ab8-1f5e9aa63df6	\N
e2f255f3-7206-4353-9d9c-f0833bf61fb0	1	Заполняющий	230	270	23	26	\N	\N	d3c73c23-1660-466b-b5fb-0903c5a4dd70	\N
ee55ff4c-bab9-419e-8532-2ff92cd4920a	1	Заполняющий	230	270	23	26	\N	\N	6136f45e-9fbb-42f1-85c8-1b0dd49d6e29	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
750dfa58-154a-49e1-822a-7ab25586370d	1	Корневой	82	11	12	f	f	t	ea70d0be-4f30-4a32-9724-8f228bc2a5e5	3f5105c7-fe23-4b12-8c8c-2167ce8bcc08	\N
95e695a6-be0a-4487-9557-60f4944ceae4	1	Корневой	82	11	12	f	f	t	612abe7d-4ea9-42cb-bfaf-d8ead605cbd0	54d3fcd3-fc20-4b98-b5d8-a8c6de72319f	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
09c5c46b-2093-4710-beb4-c6348e5c784a	f46ffb24-c901-4bbd-bd11-95642ae5060e
20fdfff3-6501-4354-b26f-c81bf24a448a	3f689697-f432-4af5-bff8-db91376ef13a
2433bdc7-c639-4420-9833-3f999a777a8a	3f689697-f432-4af5-bff8-db91376ef13a
24a932fa-bfd9-4b21-852c-6e53f12e4458	90e4574d-1d13-4e68-a161-75abd4750792
24a932fa-bfd9-4b21-852c-6e53f12e4458	ec5bdf54-08be-480b-b446-df992a1d5e58
38e6084c-1fe0-4127-a32b-23768f118d79	90e4574d-1d13-4e68-a161-75abd4750792
38e6084c-1fe0-4127-a32b-23768f118d79	ec5bdf54-08be-480b-b446-df992a1d5e58
44a94808-8db5-44a2-ac73-f609e96c70ce	90e4574d-1d13-4e68-a161-75abd4750792
44a94808-8db5-44a2-ac73-f609e96c70ce	ec5bdf54-08be-480b-b446-df992a1d5e58
bacd6f55-f595-4b4c-90b1-a83cd63c6395	f46ffb24-c901-4bbd-bd11-95642ae5060e
e4eddbf4-4dcd-488a-bce0-b0d32ae1618f	90e4574d-1d13-4e68-a161-75abd4750792
e4eddbf4-4dcd-488a-bce0-b0d32ae1618f	ec5bdf54-08be-480b-b446-df992a1d5e58
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
09c5c46b-2093-4710-beb4-c6348e5c784a	9df48aa7-9ee5-4bbd-a4bb-65212c0a5a36	\N	117390
20fdfff3-6501-4354-b26f-c81bf24a448a	d4de5907-5c63-4426-87e4-5640a5775e12	\N	132695
2433bdc7-c639-4420-9833-3f999a777a8a	056f6c7e-a120-42d8-99a8-3053eb1f6ee1	\N	122575
24a932fa-bfd9-4b21-852c-6e53f12e4458	f6fb807e-b9c1-47da-8495-8cc8c26ac3b3	\N	150838
38e6084c-1fe0-4127-a32b-23768f118d79	0811ca26-2326-4652-a305-ffe8ea170d96	\N	114729
44a94808-8db5-44a2-ac73-f609e96c70ce	287a26ff-4fb9-4147-a58c-2e65b8b800ae	\N	150882
bacd6f55-f595-4b4c-90b1-a83cd63c6395	1b9e5769-a0e9-4262-b94a-60abe3606862	\N	121267
e4eddbf4-4dcd-488a-bce0-b0d32ae1618f	0246b347-f21d-433e-865d-379080f759ac	\N	146164
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
3f689697-f432-4af5-bff8-db91376ef13a	00a79fcc-6969-4357-ac01-32ffb5529283
3f689697-f432-4af5-bff8-db91376ef13a	f4fdf64d-e973-4cf5-9936-bb0ad4879483
90e4574d-1d13-4e68-a161-75abd4750792	2df65096-28ab-4119-a529-62d983fa35b4
90e4574d-1d13-4e68-a161-75abd4750792	4cf8abe8-154d-4577-b885-cd3ce967c19a
90e4574d-1d13-4e68-a161-75abd4750792	6dd3e254-bd94-49e7-9300-e08463c28517
90e4574d-1d13-4e68-a161-75abd4750792	f4fdf64d-e973-4cf5-9936-bb0ad4879483
ec5bdf54-08be-480b-b446-df992a1d5e58	2df65096-28ab-4119-a529-62d983fa35b4
ec5bdf54-08be-480b-b446-df992a1d5e58	4cf8abe8-154d-4577-b885-cd3ce967c19a
ec5bdf54-08be-480b-b446-df992a1d5e58	6dd3e254-bd94-49e7-9300-e08463c28517
ec5bdf54-08be-480b-b446-df992a1d5e58	f4fdf64d-e973-4cf5-9936-bb0ad4879483
f46ffb24-c901-4bbd-bd11-95642ae5060e	2df65096-28ab-4119-a529-62d983fa35b4
f46ffb24-c901-4bbd-bd11-95642ae5060e	424a8464-c52e-4bb4-acac-5158d4b56935
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
3f689697-f432-4af5-bff8-db91376ef13a	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	49286
90e4574d-1d13-4e68-a161-75abd4750792	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	49283
ec5bdf54-08be-480b-b446-df992a1d5e58	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	49141
f46ffb24-c901-4bbd-bd11-95642ae5060e	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	49232
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
612abe7d-4ea9-42cb-bfaf-d8ead605cbd0	2023-03-21 12:14:19.603706	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	90e4574d-1d13-4e68-a161-75abd4750792	bacd6f55-f595-4b4c-90b1-a83cd63c6395	96db0528-326d-4f01-b8c7-f2f900cd0298	\N
ea70d0be-4f30-4a32-9724-8f228bc2a5e5	2023-03-21 12:14:19.603868	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	90e4574d-1d13-4e68-a161-75abd4750792	bacd6f55-f595-4b4c-90b1-a83cd63c6395	96db0528-326d-4f01-b8c7-f2f900cd0298	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamAccountId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
3f5105c7-fe23-4b12-8c8c-2167ce8bcc08	1	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	05e1138c-05b2-4467-af14-8e5c09ff0337	bacd6f55-f595-4b4c-90b1-a83cd63c6395	96db0528-326d-4f01-b8c7-f2f900cd0298	e66e7ea6-0952-4a28-bb53-642669c55d71	\N
54d3fcd3-fc20-4b98-b5d8-a8c6de72319f	2	1	3	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	4b0c9bdd-4417-47ea-82a4-b10b588726d8	bacd6f55-f595-4b4c-90b1-a83cd63c6395	96db0528-326d-4f01-b8c7-f2f900cd0298	e66e7ea6-0952-4a28-bb53-642669c55d71	\N
01dd172f-b374-48a6-8fab-842466093f5b	3	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	caf2c53a-091d-43b0-9c39-456a2fadf0eb	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
08b529bc-fad2-423e-bb89-cffc14eaaff7	4	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	36b6c695-6e3e-4150-adf5-731673968d65	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
0aa09427-a4db-448c-8ebc-7eb5064a3e74	5	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fbf5ad55-69e6-4955-8bcf-a60d7bbd4b98	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
0c0f9d17-0253-4494-9b1a-94b55221b2cc	6	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5d3fea06-c79e-4be6-ac83-31a365b9b5e8	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
0c3f7576-4155-4ca3-b665-a7ff4a71d779	7	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c3508a89-a2d0-47d2-8c7d-c65706c93392	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
0e6d2927-21c4-488a-a88b-c44650668239	8	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ce1d6eab-ab24-44c6-a24c-fb10a82b7d17	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
0e779d0a-af42-42f8-bdde-7d1d6195230a	9	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8619f901-92a7-4bc8-a4df-299f4764466b	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
19147fe0-5f94-44c6-b5a4-f784dae304af	10	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	eed92b0c-fc6c-484b-8c54-cc635efa1719	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
1ed18d55-515d-4e56-9077-6c5ef86bab59	11	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6f0bb095-9f7d-4d80-8162-d8fce845d1af	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
21896303-2821-4ac8-be2f-9fdc93681272	12	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	39522f74-dd4b-4380-af3f-0822729642b0	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
24023a54-25cd-4d5c-96ad-343c5f32fff8	13	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bb9c37ea-725d-45e2-8040-da6398765664	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
2540c9e7-4d48-49be-abe9-8bbf7e7e3341	14	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	20b91fd9-9869-46c4-ae94-6c62fa52709d	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
26ff8d6f-1d96-4808-adfa-ddd7323fff69	15	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	af7f7009-6283-418f-9def-56d139c0a83d	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
2b5bbb74-62df-4929-8753-d0d36f4d1e82	16	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8097e5a1-c8e6-41b3-9061-959a2e213827	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
2d69d231-3c44-4d36-84c5-a9acdfc447ab	17	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	5b9def80-8100-48d4-b0f1-9227ad07016e	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
2d6bfe0d-8113-4090-ba1f-aabfaa90de2f	18	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6fd26656-1d40-4325-a230-1f8293c222af	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
2fe51beb-39c8-4a89-a968-a3ad370fb8d5	19	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	962f072a-09cb-4feb-824b-5cb5e96b939a	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
31e65ee3-7853-406f-8e90-4e0c8bc20dee	20	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4343a84e-926f-484c-8e9f-12278741aee5	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
39d70f19-d606-4cd1-9f32-fb793221a041	21	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	de18ac33-f364-4018-9c66-57fc8429d756	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
3a1a9a2d-4fd1-4e5c-8744-684455d430a5	22	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bd57ba28-f3e9-4ed0-a483-2deb17a740c0	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
46f54e84-854e-4053-84d7-1deb6537d36a	23	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	023928e5-179b-4e40-bc18-2acd1a39dc73	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
4ea7b57d-3544-4d02-a0d9-9ae181fdb371	24	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	35fc292f-cb0e-4bb3-8bfe-5aaa4904bd56	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
5046abbb-c157-4462-8d06-83ff0ddd174f	25	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	578b0b6b-1324-4448-b614-a90919ff4002	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
5306242e-b98c-48da-bbac-6e6506ac82b9	26	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	2a56d8da-b9a7-4945-b846-e1562d0efdf0	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
56ff5bca-ab93-4f34-a2b9-efea34ab4544	27	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1fdce7c6-18c3-4cc4-87fd-1639878e9c49	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
59e5cb7c-4913-446a-8630-76404a6d6906	28	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	6d96bc7c-e453-4cae-b32c-a79b1b9a9e92	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
5a48688c-4656-431a-83b4-406f6ab172ce	29	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d6e21646-cc16-4069-abb9-6bd745d30463	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
5c2afeae-588e-42eb-a400-068f51aa072f	30	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4d367cd3-cdd2-4036-aff3-fbdf64b99cd9	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
60681f97-03e8-4acf-baa3-2a7836d37340	31	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	762397b3-ce13-4569-8128-25b7d4c931a9	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
651da619-4bd5-4790-918e-64360314be2d	32	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b0c3028e-015d-4a29-abe7-3c7708721055	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
67cfa188-f7e7-4269-b6ab-c79228fc1d20	33	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	519f94dc-1645-4693-8df5-c042a75696a3	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
75fd81bc-9bed-4f7a-8328-417138f28e30	34	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	953b2d05-e6bf-41e4-94df-c21830f976b4	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
76ef174f-5939-45b2-aa79-f7520dcf8840	35	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4b0c9bdd-4417-47ea-82a4-b10b588726d8	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
7704db88-15db-4fd5-b8a3-14459d061d44	36	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	61c192c5-44d4-4d0e-91e3-8edc54a08fb9	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
7720c9fc-633f-40b1-81cb-b9add9d53eb4	37	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c8143ee0-8718-4d2b-855a-9c32247b8a9a	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
79b26529-3f9e-4175-907c-7b88651f7e31	38	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	16784c4e-c2a5-49f6-bd91-4d8953ee8cd8	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
7a8e63e7-0434-4648-a889-8e712a1dbf63	39	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	68b304c5-2698-430c-b6cf-4602cd8132e0	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
7b26bcfa-7103-4797-b07f-620494745c02	40	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	9989395c-edb6-4b6f-9064-690cce2a818b	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
86499415-7281-4ae4-8f04-32bb0b2098c8	41	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	8b94f6fd-4130-4521-a947-27d6911a5738	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
870949e6-c56a-4eb2-ac4b-0acca37371ce	42	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ca229289-8ad1-411d-ac74-b9c77fcb9b8e	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
887ab887-9f20-4235-a7cc-fe00764b62de	43	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bc675ad9-f408-48e4-9531-f933af9994b4	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
8896b575-b040-403c-92fa-f9632c42e3c3	44	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	fe7c107e-8c73-4af5-b031-4796609566fe	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
8b374d66-6347-4114-a1b0-c3862bf37839	45	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	ab5aa367-ca0b-4c56-acac-ef34aa906218	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
8f7697c2-e5d1-4b6b-a71a-e9ed730835eb	46	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	c34634cd-1626-4bbe-8ae3-4b40cbbbd422	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
8fd16929-bf4a-4847-a4d5-49f2a0c4735c	47	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	4b1256ab-7efe-45ba-8e0e-f9a86cfd9e93	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
967f45b5-a526-4b3b-9603-b3b9e66e3f00	48	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d1b8891f-1713-471b-bf82-2700eaee6156	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
9844c373-c791-4491-a7ed-6c676cc707d4	49	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f603ba8a-4b50-4a20-b6c3-2a4b88c2438f	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
9ebef418-ec83-4a30-b4f0-b1e98e6627b2	50	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	41c8e1e8-e417-434e-b332-a11604ab7122	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
a1680b6f-2b5b-4066-bc4d-48270b22cde1	51	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f29a09a4-5bb4-4fb9-bfb2-294f74b72fb8	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
a9e08a76-d730-4e81-a8e3-2f7de3da1ab5	52	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f6b797d3-6a7f-4f33-b534-37206e320521	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
aa152853-b259-4d4f-a202-d5e0e29d271e	53	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	d79ef2ae-b059-48d4-ae23-0c9b670ef588	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
aab23a5f-a5b2-4dc1-9ac3-ffb95ec9f606	54	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	bd8c738f-4dfb-4823-a7bb-6e9fbf33836b	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
abc55b11-8914-4e41-b15c-5bdd784a8dcd	55	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	74e9683f-b371-43c8-8737-0a2221088858	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
ae05145b-e1d0-4422-9732-8332af48e00f	56	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	40c669ad-6196-4c4b-a1bb-fe11a9869532	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
ae6df751-2524-4b6b-b687-753e372fd512	57	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	0381589f-2a7f-4e4c-b9b9-a31547b92e70	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
b2eb2bcf-dedc-4f73-a496-05b6bf40f27f	58	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	78a2fc46-59e8-469c-9dc5-3e80d1f577f5	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
bc0cd538-e824-4bcc-a7eb-d52947a98e74	59	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f1037e02-b38f-4df6-b848-aa0c3e087a48	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
bcd64212-d884-4db1-bd66-814d27094b82	60	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	dbe9588e-4dca-4085-a42b-28ba1687d086	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
c3b0f955-5c1f-4c1e-bb21-05653e1b449f	61	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f042ccea-64f0-447d-9dd2-626e7d94e407	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
c5306060-db40-49c6-a1b7-4617a7f31262	62	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	f81cfe35-9c05-4689-852a-a0999d1af24b	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
cb0016c8-5753-4c1d-8651-8173ee781dd0	63	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	1a529fff-d153-44da-8d3c-9bce96a31b2b	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
d15d880a-1d91-482f-9edb-53b76bdb4dc1	64	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	42ba7f9d-8b19-45e2-a23f-5dc22c0b1bcf	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
d6299ff4-3acc-4848-8d00-85aaf76c40ba	65	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	05e1138c-05b2-4467-af14-8e5c09ff0337	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
d805034d-2c54-4c54-a5be-f623decf51f3	66	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	596e76eb-5393-4fd4-ade3-b717e1c4ba21	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
da6eed15-4c9a-4ad2-9519-3e79feeac2cc	67	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	b8cf2b8b-530e-4c98-a72a-c3a4ec8eea5d	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
dace5273-ba99-45e9-a5ae-07433269dbff	68	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	aa89c205-1740-4b33-be54-2b28c23ed546	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
f8b5d68b-cd4d-4e34-a2f7-e4259ff28519	69	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cb73dee6-7ca2-489a-ae08-38ea42adb72f	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
f9abd843-7e44-4dbe-934b-36aac21db800	70	1	1	f	2023-03-12 00:00:00	\N	\N	\N	\N	\N	\N	cd606148-8576-4ec0-b2f9-191cba09fa0f	\N	96db0528-326d-4f01-b8c7-f2f900cd0298	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
6785cc87-04ea-4d2a-8b32-116b25a9f5dc	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	6988bd9d-c501-4701-91bd-e5bdd648823f	\N
d84ffeca-7265-4f49-9f66-b46578f4cfdb	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	6988bd9d-c501-4701-91bd-e5bdd648823f	\N
e7721131-17ef-4ee3-97f3-3cf98bf009c8	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	6988bd9d-c501-4701-91bd-e5bdd648823f	\N
29d65ee7-087d-4a59-a70c-bddf8a498421	1	12:10:00	13:10:00	13:20:00	13:50:00	b7b0654f-176b-4953-b6b3-96bcc4f06edd	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
00a79fcc-6969-4357-ac01-32ffb5529283	3510	\N	27800995-a71f-4877-abc7-39218ee0af63	3510
2df65096-28ab-4119-a529-62d983fa35b4	3610	\N	27800995-a71f-4877-abc7-39218ee0af63	3610
424a8464-c52e-4bb4-acac-5158d4b56935	3600	\N	27800995-a71f-4877-abc7-39218ee0af63	3600
4cf8abe8-154d-4577-b885-cd3ce967c19a	3690	\N	27800995-a71f-4877-abc7-39218ee0af63	3690
6dd3e254-bd94-49e7-9300-e08463c28517	3550	\N	27800995-a71f-4877-abc7-39218ee0af63	3550
f4fdf64d-e973-4cf5-9936-bb0ad4879483	3500	\N	27800995-a71f-4877-abc7-39218ee0af63	3500
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
e828aca6-b54b-4b70-98c6-73d43113602e	Сварочный цех	50	050
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

