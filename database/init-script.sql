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
    "WeldingEquipmentId" uuid,
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
    "WorkshopId" uuid NOT NULL,
    "IdFromSystem" text
);


--
-- Name: Products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Products" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Number" text NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductType" integer NOT NULL,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "MasterId" uuid,
    "InspectorId" uuid,
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
-- Name: SeamWelder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SeamWelder" (
    "SeamsId" uuid NOT NULL,
    "WeldersId" uuid NOT NULL
);


--
-- Name: Seams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Seams" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Length" integer NOT NULL,
    "Status" integer NOT NULL,
    "IsControlSubject" boolean NOT NULL,
    "IsAddManually" boolean NOT NULL,
    "ProductId" uuid,
    "TechnologicalInstructionId" uuid,
    "ProductionAreaId" uuid,
    "WorkplaceId" uuid,
    "InspectorId" uuid,
    "IdFromSystem" text
);


--
-- Name: StatusReasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StatusReasons" (
    "Id" uuid NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Status" integer NOT NULL,
    "Reason" text,
    "DetectedDefects" text,
    "ProductId" uuid,
    "SeamId" uuid,
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
    "Number" integer NOT NULL,
    "Name" text NOT NULL,
    "PdmSystemFileLink" text NOT NULL,
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
    "PreheatingTemperatureMin" double precision NOT NULL,
    "PreheatingTemperatureMax" double precision NOT NULL,
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
    "WeldingCurrentValues" double precision[] NOT NULL,
    "ArcVoltageValues" double precision[] NOT NULL,
    "ShortTermDeviation" double precision,
    "LongTermDeviation" double precision,
    "WeldingStartTime" interval NOT NULL,
    "WeldingEndTime" interval NOT NULL,
    "PreheatingTemperature" integer NOT NULL,
    "IsDone" boolean NOT NULL,
    "SeamId" uuid NOT NULL,
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
    "IdFromSystem" text
);


--
-- Name: WeldingTasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeldingTasks" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "WhenTaskIsDoneDate" timestamp without time zone,
    "WeldingDate" timestamp without time zone,
    "WeldingPlanDate" timestamp without time zone,
    "BasicMaterial" text,
    "MainMaterialBatchNumber" text,
    "WeldingMaterial" text,
    "WeldingMaterialBatchNumber" text,
    "ProtectiveGas" text,
    "ProtectiveGasBatchNumber" text,
    "SeamId" uuid NOT NULL,
    "WeldingEquipmentId" uuid,
    "WelderId" uuid,
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
a61e86fc-7054-4cce-af85-78ecde1a1b1d	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
0f107953-4ba1-4771-87cc-85d526b4bc3f	c874cad2-7e15-4bf9-b035-f1cc21c88998	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
2118bfb6-bd17-40e1-a486-2ba2495b2839	1	10	t	a61e86fc-7054-4cce-af85-78ecde1a1b1d	\N
\.


--
-- Data for Name: DowntimeReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DowntimeReasons" ("Id", "Reason", "IdFromSystem") FROM stdin;
0620a6aa-6265-48d8-807e-476bdde44762	Работа с управляющей программой	\N
119233e7-038d-46d4-988a-789a12641da9	Установка, выверка, снятие детали	\N
23ff1a5a-59b6-4187-bebf-8d80d95fc7f3	Сборочные операции	\N
2657f587-6f9c-4b3a-9dc4-3bbd08957a7d	Естественные надобности	\N
2eb26e91-915c-4ad1-ae27-7bcaa6bba557	Отсутствие оператора в связи с необеспеченностью	\N
3494c20d-93f5-4549-b6c7-44bf695686e1	Отсутствие крана, транспорта	\N
3bdadf69-264b-4f6b-ac15-e47d330d3a49	Аварийный ремонт централизованными службами	\N
48b67456-2efd-4730-a956-084c57790105	Неявка оператора (б/лист, отпуск, и пр.)	\N
4ca2a858-d45a-45ad-8f40-2306749b378d	Работа по карте несоответствий	\N
54494b3e-bee3-4b0d-ad56-22a7ffdfc67d	Отсутствие материала, заготовок, деталей	\N
604fda3a-8dd6-430a-8a67-6ec11fc74d63	Отсутствие заданий	\N
6ed26c68-d4de-4d41-9523-13c77504aa18	Установка, выверка, снятие детали	\N
75784391-4fca-4afd-ad8b-64896c7297bb	Контроль на рабочем месте	\N
79bd8e09-1fa5-4fb3-b65a-fb588942e69f	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
862c6a4c-54f5-4a3e-b49c-ebe0a80ae60d	Изменение режимов, смена инструмента, приспособления	\N
90865eca-d5d9-4341-8be8-cd4055fd967e	Отсутствие сотрудника ОТК	\N
a2c2e467-9b76-4ec4-8bee-7f02e8525336	Обед	\N
b1ee8e9d-ed45-486c-96c1-5fe248dc6643	Отсутствие конструктора, технолога или ожидание его решения	\N
b981884e-13c6-40c2-b62a-981338f5966c	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
c65f4f1a-2c1f-4af6-8a63-d951fc730ff9	Нерабочее время по графику согласно сменности	\N
d5d42b67-1b0a-4fdc-81a0-34b4cb31feb5	Плановый ремонт централизованными службами	\N
d658794d-0a54-4249-8331-bffc3ae470ff	Отсутствие энергоносителей	\N
dcc00773-13fc-48b7-9f1a-b6ebe01ff12d	Ознакомление с работой, документацией, инструктаж	\N
e21a096a-4619-496c-8bb7-57291713f7c2	Праздники и выходные	\N
e7fbcf5a-6cbd-429f-b816-87db7aa98ba7	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
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
6c521dae-2492-4c46-b17f-50aa56cb7190	bd0f35ed-e5a0-4c34-9400-c019f6ff71a5	251534
73db72ba-c8c6-427b-a42d-0667f77a2d63	d18bad03-803e-479e-b596-c92459d2490b	256467
dbe73ece-9f5e-4924-b7ce-38644487a8df	f8d73ffd-bc73-40b2-8242-9b069ae14f7e	249550
60a068f3-1f5d-4142-9632-4bad212779db	8ecf0a28-5f05-4d6a-90dc-70462b4c6d6d	235565
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
4b171038-747b-4064-ba33-84e96dab196f	cd0b83b3-5b5e-47bf-8319-315f69dc5623	\N	612000
ae331520-9882-4c66-8f78-6640cbac5fe7	8d61cb87-cb94-4edd-b476-5fb90c3b1aea	\N	614208
d01e5ced-5caa-4eb6-9b62-f14fc05e3b72	4455614b-4d86-458c-8227-793237b403fd	\N	614962
ed28f367-3ef7-48f1-862f-e35709451eaa	fbb4b0fb-784d-466f-82a1-c248569f98bf	\N	610422
fb30a0e3-4468-4fa4-bd58-f4683064a879	a39fb082-530e-4024-ae4c-218a5b7ddbe6	\N	617215
fd68fcba-8ff1-4d0d-88b8-a5e1068f106b	d88e0459-4b6c-4c21-9291-2cd058419c6b	\N	643759
fd7d421d-bcf3-4ff6-988c-c0f6965c39b3	94bcabc8-e8bf-40e7-abce-c7a68d7bcac1	\N	613668
8a94c6e3-174e-43cc-a0ad-4ccf9f1266f4	5d1d1744-6095-4fac-991d-747a32af9279	\N	\N
\.


--
-- Data for Name: Posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Posts" ("Id", "Number", "Name", "ProductionAreaId", "IdFromSystem") FROM stdin;
2efed014-e3f2-44c5-ba52-7522ec1b3ad4	2	Пост 2	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
6ce57b2a-a53d-4596-9364-0d6c7b73a74f	1	Пост 1	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	0aac1a4c-e11e-4749-a24d-e8c6970a940a
24eff0d9-20b2-4b9f-b79b-b167e0a046ba	0ab74bcc-b978-4d16-bbda-9a53ba4267b3
0ab74bcc-b978-4d16-bbda-9a53ba4267b3	0c64696d-c3c1-46ba-88b4-a6ea623ce1ee
531e3612-3abc-47fb-87dc-4c8aa81684eb	0f7e432c-2e58-46ef-a28c-66195fc9c66d
24eff0d9-20b2-4b9f-b79b-b167e0a046ba	33d194c1-5cc4-4179-a98e-a2448b3e5274
b745f799-b055-481f-886a-5f2174147b26	344d9647-fbd2-4124-9026-0c81b9f48d22
b7df0e7f-5a17-4f48-8eb7-090c34ee6195	3a3ea8b1-a3a6-4407-808a-2d44db2265a3
24eff0d9-20b2-4b9f-b79b-b167e0a046ba	3a6cfbdc-9c3a-4e7b-ac14-05b45f68c3cc
3a6cfbdc-9c3a-4e7b-ac14-05b45f68c3cc	44e80056-2410-485f-b6c8-165d80af4732
fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	531e3612-3abc-47fb-87dc-4c8aa81684eb
b7df0e7f-5a17-4f48-8eb7-090c34ee6195	67ab3ff9-5a25-47bf-b4d5-74ecfa36706e
fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	6edce26f-2dc1-49ff-86f2-7c198bdfc10e
3a3ea8b1-a3a6-4407-808a-2d44db2265a3	70fe19f6-64bd-4ca5-80d8-f66ea3065892
6edce26f-2dc1-49ff-86f2-7c198bdfc10e	8ca4fe71-824d-4a42-8d78-e88218e901a2
0ab74bcc-b978-4d16-bbda-9a53ba4267b3	a9795b79-3541-4cd2-85fb-e5f96249b253
b7df0e7f-5a17-4f48-8eb7-090c34ee6195	b745f799-b055-481f-886a-5f2174147b26
24eff0d9-20b2-4b9f-b79b-b167e0a046ba	bc17cabd-cb25-4918-82dd-0898020e675d
fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	c099638f-8e0c-4f32-a252-06cbc117b752
b745f799-b055-481f-886a-5f2174147b26	c23ce0ab-c64d-448e-8f02-2868cdbcc38e
b7df0e7f-5a17-4f48-8eb7-090c34ee6195	cc0abf72-0657-4706-b005-73601d85ce05
3a6cfbdc-9c3a-4e7b-ac14-05b45f68c3cc	d8bddded-1599-4a93-a4a7-2d5351a86328
3a3ea8b1-a3a6-4407-808a-2d44db2265a3	db57c22c-f739-47c3-b027-71985a37ed11
6edce26f-2dc1-49ff-86f2-7c198bdfc10e	e48698f9-2c89-4c62-93a9-8de7a348745d
531e3612-3abc-47fb-87dc-4c8aa81684eb	f2a5258c-21b0-44af-9f47-00e7aaba8a40
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
a2f1e204-61ed-4a72-8329-b5082f4abb58	Сборка, сварка мостов	1	6b6fa9d0-ab06-4d09-b035-951ab9ce4718	01
be100c94-61d8-4e6a-8e29-6a82e8680d17	Производственный участок 5	5	b6f55917-cf58-4826-9563-b05cf3d04347	05
dde51228-dd75-4d01-8014-8571749b1037	Сборка, сварка рам к/с г/п 120-130 т.	6	6b6fa9d0-ab06-4d09-b035-951ab9ce4718	06
f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	Сборка, сварка узл. и рам к/с г/п 120-220т	4	6b6fa9d0-ab06-4d09-b035-951ab9ce4718	04
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "Status", "IsControlSubject", "IsAddManually", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "WorkplaceId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
0aac1a4c-e11e-4749-a24d-e8c6970a940a	Кронштейн	75131-2113296-10	1	f	f	3	30e1a15e-ab4f-4ae2-9dd8-bd03c0b0d629	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536461620
0ab74bcc-b978-4d16-bbda-9a53ba4267b3	Кронштейн амортизатора левый	75304-1001251	1	f	f	2	d481b414-5a4f-4b66-87ce-b9496cef3cc4	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536248707
0c64696d-c3c1-46ba-88b4-a6ea623ce1ee	Кронштейн	75303-1001293	1	f	f	3	14c0f6f2-c10b-48a7-a415-4f66c7b6e0b3	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536247228
0f7e432c-2e58-46ef-a28c-66195fc9c66d	Распорка	7521-3932688	1	f	f	3	87d60dfd-5e43-4d21-9b7e-c096a0876cc0	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536273606
24eff0d9-20b2-4b9f-b79b-b167e0a046ba	Рама	75313-2800010-20	1	f	f	1	a0d36b1b-336f-4fd2-9834-ae168ac47d45	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536287819
33d194c1-5cc4-4179-a98e-a2448b3e5274	Накладка	549Б-1015842	1	f	f	3	d2a4093c-133b-4590-8714-8f8e4500a567	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536196288
344d9647-fbd2-4124-9026-0c81b9f48d22	Фланец картера	75580-2401114-11	1	f	f	3	5a18cb07-ea00-4bcc-97b9-954fd5db15e1	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536386265
3a3ea8b1-a3a6-4407-808a-2d44db2265a3	Картер заднего моста	75580-2401008	1	f	f	2	7971f490-cd89-4a04-9e1e-72fc1005b60f	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536384295
3a6cfbdc-9c3a-4e7b-ac14-05b45f68c3cc	Кронштейн	75310-1183100	1	f	f	2	b3ef2fd9-4364-4ccf-859b-06c035dc6ec6	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536267493
44e80056-2410-485f-b6c8-165d80af4732	Кронштейн	75310-1183106	1	f	f	3	c1a2565a-4859-4298-8048-99452f638b6f	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536267485
531e3612-3abc-47fb-87dc-4c8aa81684eb	Кронштейн	7521-2401220	1	f	f	2	57fb1b13-9d9d-4485-a864-81c11ea8a55f	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536273956
6edce26f-2dc1-49ff-86f2-7c198bdfc10e	Картер заднего моста	75132-2401008-50	1	f	f	2	013f2840-5db0-4c0c-ae79-bb14dae25678	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536467565
70fe19f6-64bd-4ca5-80d8-f66ea3065892	Втулка	75303-2128438	1	f	f	3	d68d5005-25e8-444d-8131-ea7fb4ce43ed	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536248270
8ca4fe71-824d-4a42-8d78-e88218e901a2	Пластина	75132-2401106	1	f	f	3	74b785cc-008e-4b2f-8d2d-433a34f7a24a	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536444153
a9795b79-3541-4cd2-85fb-e5f96249b253	Кронштейн	75304-1001253	1	f	f	3	a7ea8be1-acc1-400d-97b8-770119e764c5	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536248708
b745f799-b055-481f-886a-5f2174147b26	Труба картера заднего моста	75580-2401010-01	1	f	f	2	d1874b06-c79d-4f02-aaa4-2017a2a415fc	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536386240
b7df0e7f-5a17-4f48-8eb7-090c34ee6195	Картер заднего моста	75580-2401006	1	f	f	1	7d49f954-142e-4f0a-bce8-c6e624f20e53	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536384294
bc17cabd-cb25-4918-82dd-0898020e675d	Кронштейн	75211-1018162	1	f	f	3	15b0876d-21c1-4fb7-8288-48ea3453448e	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536270344
c099638f-8e0c-4f32-a252-06cbc117b752	Панель	75132-2105522	1	f	f	3	6e4439c0-6763-4947-9bbe-6ccc54926b0a	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536417730
c23ce0ab-c64d-448e-8f02-2868cdbcc38e	Труба картера	75580-2401132-10	1	f	f	3	9b7a2a89-5259-4d3a-b43b-7bc3798f8a04	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536386250
cc0abf72-0657-4706-b005-73601d85ce05	Кронштейн	75580-2113192	1	f	f	3	fb14ec43-04b8-49cb-aa7a-946d90fc8843	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536384314
d8bddded-1599-4a93-a4a7-2d5351a86328	Кронштейн	75310-1183102	1	f	f	3	e3513039-4d23-4cfe-8aca-eb99e1919ebd	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	\N	\N	4536267484
db57c22c-f739-47c3-b027-71985a37ed11	Кольцо	75580-2401227	1	f	f	3	a536d4bc-2d76-487a-95ed-ad315a9423d3	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536384312
f2a5258c-21b0-44af-9f47-00e7aaba8a40	Проушина	7521-2401224	1	f	f	3	75988cd9-a6b9-4375-a665-6015e1952051	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536274170
fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	Картер заднего моста	75132-2401006-50	1	f	f	1	0cf5d797-1889-4194-89f8-1c8768b7f91b	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N	4536467567
67ab3ff9-5a25-47bf-b4d5-74ecfa36706e	Панель	75580-2105522	1	f	f	3	192f0f97-545e-42ea-857d-e04125bcff67	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	8a94c6e3-174e-43cc-a0ad-4ccf9f1266f4	\N	4536384399
e48698f9-2c89-4c62-93a9-8de7a348745d	Опора	75211-2401122	1	f	f	3	d26bce24-9e01-4990-acbe-81cafe0d43fa	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	8a94c6e3-174e-43cc-a0ad-4ccf9f1266f4	\N	4536276803
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
5c098b94-033e-447e-af60-a871f5bcb3f9	Admin	\N
e888879b-a684-4be3-a3ea-c471c029128c	Master	\N
1112ad1d-d982-4de9-a277-d6eb0652b54c	Welder	\N
d48fb039-c82d-4ee4-b55f-3dfdd5891266	Inspector	\N
e3fbed1b-b475-44a7-afe9-a2d3d19a5e6f	Chief	\N
\.


--
-- Data for Name: SeamWelder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamWelder" ("SeamsId", "WeldersId") FROM stdin;
51b571fb-4ec6-4b3f-bb13-35499c21cdeb	159d12cb-2b38-4149-917a-6aaef8c2c319
73d33ca2-cc74-40bb-b360-88af3313bf9a	159d12cb-2b38-4149-917a-6aaef8c2c319
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "Status", "IsControlSubject", "IsAddManually", "ProductId", "TechnologicalInstructionId", "ProductionAreaId", "WorkplaceId", "InspectorId", "IdFromSystem") FROM stdin;
35163afa-f876-47b0-b32d-bf53418825ea	3	333	1	t	f	24eff0d9-20b2-4b9f-b79b-b167e0a046ba	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N
45f2011d-b1fc-4a26-9586-3357b4831478	4	222	1	t	f	24eff0d9-20b2-4b9f-b79b-b167e0a046ba	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N
8be42d3f-2d96-453f-b3b6-5e941132434e	1	111	1	t	f	fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N
a2626345-2e97-4950-b2b9-3902b8f8ddb1	2	222	1	t	f	fe2d17c2-efe5-4e20-9fe8-c4eba748d0d8	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N	\N	\N
51b571fb-4ec6-4b3f-bb13-35499c21cdeb	2	200	3	t	f	67ab3ff9-5a25-47bf-b4d5-74ecfa36706e	f412be47-d87f-4174-9b2b-86f7e32707aa	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	60a068f3-1f5d-4142-9632-4bad212779db	\N
73d33ca2-cc74-40bb-b360-88af3313bf9a	2	100	3	t	f	e48698f9-2c89-4c62-93a9-8de7a348745d	77c16a81-ad53-4170-982d-aa5f3cb31918	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N	60a068f3-1f5d-4142-9632-4bad212779db	\N
\.


--
-- Data for Name: StatusReasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StatusReasons" ("Id", "Date", "Status", "Reason", "DetectedDefects", "ProductId", "SeamId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
77c16a81-ad53-4170-982d-aa5f3cb31918	1	ИТП	\N
f412be47-d87f-4174-9b2b-86f7e32707aa	1	ИТП	\N
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
013f2840-5db0-4c0c-ae79-bb14dae25678	3232836	Технологический процесс	Ссылка	3232836
0cf5d797-1889-4194-89f8-1c8768b7f91b	3090319	Технологический процесс	Ссылка	3090319
14c0f6f2-c10b-48a7-a415-4f66c7b6e0b3	3049271	Технологический процесс	Ссылка	3049271
15b0876d-21c1-4fb7-8288-48ea3453448e	2841119	Технологический процесс	Ссылка	2841119
192f0f97-545e-42ea-857d-e04125bcff67	1405307	Технологический процесс	Ссылка	1405307
30e1a15e-ab4f-4ae2-9dd8-bd03c0b0d629	526870	Технологический процесс	Ссылка	526870
57fb1b13-9d9d-4485-a864-81c11ea8a55f	1362989	Технологический процесс	Ссылка	1362989
5a18cb07-ea00-4bcc-97b9-954fd5db15e1	3338649	Технологический процесс	Ссылка	3338649
6e4439c0-6763-4947-9bbe-6ccc54926b0a	1053809	Технологический процесс	Ссылка	1053809
74b785cc-008e-4b2f-8d2d-433a34f7a24a	1003048	Технологический процесс	Ссылка	1003048
75988cd9-a6b9-4375-a665-6015e1952051	1124147	Технологический процесс	Ссылка	1124147
7971f490-cd89-4a04-9e1e-72fc1005b60f	3232938	Технологический процесс	Ссылка	3232938
7d49f954-142e-4f0a-bce8-c6e624f20e53	2433634	Технологический процесс	Ссылка	2433634
87d60dfd-5e43-4d21-9b7e-c096a0876cc0	908693	Технологический процесс	Ссылка	908693
9b7a2a89-5259-4d3a-b43b-7bc3798f8a04	2822569	Технологический процесс	Ссылка	2822569
a0d36b1b-336f-4fd2-9834-ae168ac47d45	3239598	Технологический процесс	Ссылка	3239598
a536d4bc-2d76-487a-95ed-ad315a9423d3	1402616	Технологический процесс	Ссылка	1402616
a7ea8be1-acc1-400d-97b8-770119e764c5	1492964	Технологический процесс	Ссылка	1492964
b3ef2fd9-4364-4ccf-859b-06c035dc6ec6	1823031	Технологический процесс	Ссылка	1823031
c1a2565a-4859-4298-8048-99452f638b6f	1119363	Технологический процесс	Ссылка	1119363
d1874b06-c79d-4f02-aaa4-2017a2a415fc	2915477	Технологический процесс	Ссылка	2915477
d26bce24-9e01-4990-acbe-81cafe0d43fa	3211246	Технологический процесс	Ссылка	3211246
d2a4093c-133b-4590-8714-8f8e4500a567	1426226	Технологический процесс	Ссылка	1426226
d481b414-5a4f-4b66-87ce-b9496cef3cc4	1334123	Технологический процесс	Ссылка	1334123
d68d5005-25e8-444d-8131-ea7fb4ce43ed	3011514	Технологический процесс	Ссылка	3011514
e3513039-4d23-4cfe-8aca-eb99e1919ebd	1104641	Технологический процесс	Ссылка	1104641
fb14ec43-04b8-49cb-aa7a-946d90fc8843	1405914	Технологический процесс	Ссылка	1405914
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
bd0f35ed-e5a0-4c34-9400-c019f6ff71a5	d48fb039-c82d-4ee4-b55f-3dfdd5891266
d18bad03-803e-479e-b596-c92459d2490b	d48fb039-c82d-4ee4-b55f-3dfdd5891266
f8d73ffd-bc73-40b2-8242-9b069ae14f7e	d48fb039-c82d-4ee4-b55f-3dfdd5891266
4455614b-4d86-458c-8227-793237b403fd	e888879b-a684-4be3-a3ea-c471c029128c
8d61cb87-cb94-4edd-b476-5fb90c3b1aea	e888879b-a684-4be3-a3ea-c471c029128c
94bcabc8-e8bf-40e7-abce-c7a68d7bcac1	e888879b-a684-4be3-a3ea-c471c029128c
a39fb082-530e-4024-ae4c-218a5b7ddbe6	e888879b-a684-4be3-a3ea-c471c029128c
cd0b83b3-5b5e-47bf-8319-315f69dc5623	e888879b-a684-4be3-a3ea-c471c029128c
d88e0459-4b6c-4c21-9291-2cd058419c6b	e888879b-a684-4be3-a3ea-c471c029128c
fbb4b0fb-784d-466f-82a1-c248569f98bf	e888879b-a684-4be3-a3ea-c471c029128c
1b8ac23c-03d1-4ee9-9fbe-b37c75afc39b	1112ad1d-d982-4de9-a277-d6eb0652b54c
24203954-7bdb-42ab-a3f5-4a874ef62c54	1112ad1d-d982-4de9-a277-d6eb0652b54c
26bedabc-3f49-45fe-8037-15f2dbecff91	1112ad1d-d982-4de9-a277-d6eb0652b54c
3283fba4-196d-44a7-9e9e-be42494634fe	1112ad1d-d982-4de9-a277-d6eb0652b54c
444bad71-a485-4920-8bfb-39019af72dce	1112ad1d-d982-4de9-a277-d6eb0652b54c
45641c5a-6c2b-4f9f-be8e-3eb84699a318	1112ad1d-d982-4de9-a277-d6eb0652b54c
638d2900-cfa7-47b9-bdb2-0cd921389208	1112ad1d-d982-4de9-a277-d6eb0652b54c
691127d1-ab41-4e54-bd29-aa5165194778	1112ad1d-d982-4de9-a277-d6eb0652b54c
6f44e18b-c43a-4431-8b9e-2454d6126eb0	1112ad1d-d982-4de9-a277-d6eb0652b54c
70e85ebc-d8fd-4f3c-8e67-3690221d8bb0	1112ad1d-d982-4de9-a277-d6eb0652b54c
7a06792d-05ff-4bfc-987d-236cb5766e7f	1112ad1d-d982-4de9-a277-d6eb0652b54c
803b479e-bb51-41e9-9408-5b358ff378cd	1112ad1d-d982-4de9-a277-d6eb0652b54c
8a74284f-f853-4755-b419-eee70f65010c	1112ad1d-d982-4de9-a277-d6eb0652b54c
8d17b4f9-c1b4-4c74-a3ce-16c900b6207c	1112ad1d-d982-4de9-a277-d6eb0652b54c
91478528-63a0-4eb6-9f3c-46806cb269f4	1112ad1d-d982-4de9-a277-d6eb0652b54c
a245ecc1-320c-4fc5-a94c-707b3b0d8b1e	1112ad1d-d982-4de9-a277-d6eb0652b54c
a24f9956-f24a-4961-a03a-a0e23f907f27	1112ad1d-d982-4de9-a277-d6eb0652b54c
b5197c60-f338-4772-bf93-4f5c6ee09a4e	1112ad1d-d982-4de9-a277-d6eb0652b54c
c25d1bd6-20ea-4f4e-9fcd-981dbb215441	1112ad1d-d982-4de9-a277-d6eb0652b54c
c897b4d4-3a90-4c80-8961-83ec6ddfe3b9	1112ad1d-d982-4de9-a277-d6eb0652b54c
d821744d-ee03-4d62-a912-d0ed7eb21d14	1112ad1d-d982-4de9-a277-d6eb0652b54c
fd12e864-a9f3-43ab-9280-0d471373d022	1112ad1d-d982-4de9-a277-d6eb0652b54c
c874cad2-7e15-4bf9-b035-f1cc21c88998	e3fbed1b-b475-44a7-afe9-a2d3d19a5e6f
5d1d1744-6095-4fac-991d-747a32af9279	e888879b-a684-4be3-a3ea-c471c029128c
5f99ec5b-1123-4bc4-8936-546be9c337d0	1112ad1d-d982-4de9-a277-d6eb0652b54c
8ecf0a28-5f05-4d6a-90dc-70462b4c6d6d	d48fb039-c82d-4ee4-b55f-3dfdd5891266
c880f7e0-5f09-4fb4-95f1-e08d8aa3480b	5c098b94-033e-447e-af60-a871f5bcb3f9
720990f6-d464-4fb4-b7e9-cb9e1a30ff86	1112ad1d-d982-4de9-a277-d6eb0652b54c
7d66dc15-86c3-40ec-becc-8e358dd96375	d48fb039-c82d-4ee4-b55f-3dfdd5891266
222d135f-a410-4218-8d60-3a47f2e693df	e3fbed1b-b475-44a7-afe9-a2d3d19a5e6f
19d97708-263c-40ee-99f6-5194eb7e6cdf	e888879b-a684-4be3-a3ea-c471c029128c
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
bd0f35ed-e5a0-4c34-9400-c019f6ff71a5	Ирина	Алексеевна	Люцко	\N	\N	\N	Контролер сварочных работ	51534	\N	\N	be100c94-61d8-4e6a-8e29-6a82e8680d17	\N
d18bad03-803e-479e-b596-c92459d2490b	Елена	Викторовна	Михальченко	\N	\N	\N	Контролер сварочных работ	56467	\N	\N	be100c94-61d8-4e6a-8e29-6a82e8680d17	\N
f8d73ffd-bc73-40b2-8242-9b069ae14f7e	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
4455614b-4d86-458c-8227-793237b403fd	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
8d61cb87-cb94-4edd-b476-5fb90c3b1aea	Александр	Михайлович	Кузьминский	\N	\N	\N	Мастер производственного участка	14208	\N	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
94bcabc8-e8bf-40e7-abce-c7a68d7bcac1	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
a39fb082-530e-4024-ae4c-218a5b7ddbe6	Сергей	Николаевич	Слабухо	\N	\N	\N	Старший мастер производственного участка	17215	\N	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
cd0b83b3-5b5e-47bf-8319-315f69dc5623	Денис	Александрович	Подобед	\N	\N	\N	Мастер производственного участка	12000	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
d88e0459-4b6c-4c21-9291-2cd058419c6b	Игорь	Сергеевич	Шаврук	\N	\N	\N	Мастер производственного участка	43759	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
fbb4b0fb-784d-466f-82a1-c248569f98bf	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
1b8ac23c-03d1-4ee9-9fbe-b37c75afc39b	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
24203954-7bdb-42ab-a3f5-4a874ef62c54	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
26bedabc-3f49-45fe-8037-15f2dbecff91	Владислав	Николаевич	Курто	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52207	\N	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
3283fba4-196d-44a7-9e9e-be42494634fe	Василий	Васильевич	Михолап	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51299	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
444bad71-a485-4920-8bfb-39019af72dce	Иван	Игоревич	Редько	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	55288	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
45641c5a-6c2b-4f9f-be8e-3eb84699a318	Александр	Николаевич	Спиридонов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	51861	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
638d2900-cfa7-47b9-bdb2-0cd921389208	Максим	Александрович	Баркетов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52441	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
691127d1-ab41-4e54-bd29-aa5165194778	Александр	Сергеевич	Смородин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50402	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
6f44e18b-c43a-4431-8b9e-2454d6126eb0	Олег	Дмитриевич	Канапацкий	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46325	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
70e85ebc-d8fd-4f3c-8e67-3690221d8bb0	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
7a06792d-05ff-4bfc-987d-236cb5766e7f	Дмитрий	Сергеевич	Малиновский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	53274	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
803b479e-bb51-41e9-9408-5b358ff378cd	Пётр	Алексеевич	Авхимович	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	20756	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
8a74284f-f853-4755-b419-eee70f65010c	Вячеслав	Сергеевич	Распутин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56298	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
8d17b4f9-c1b4-4c74-a3ce-16c900b6207c	Павел	Антонович	Ходот	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52365	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
91478528-63a0-4eb6-9f3c-46806cb269f4	Антон	Павлович	Козылев	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	45092	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
a245ecc1-320c-4fc5-a94c-707b3b0d8b1e	Василий	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21538	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
a24f9956-f24a-4961-a03a-a0e23f907f27	Вадим	Александрович	Ильюшонок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	49921	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
b5197c60-f338-4772-bf93-4f5c6ee09a4e	Егор	Николаевич	Пучнин	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	47329	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
c25d1bd6-20ea-4f4e-9fcd-981dbb215441	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	\N	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
c897b4d4-3a90-4c80-8961-83ec6ddfe3b9	Александр	Анатольевич	Слаёк	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	56278	\N	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
d821744d-ee03-4d62-a912-d0ed7eb21d14	Сергей	Анатольевич	Хурсанов	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	52444	\N	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
fd12e864-a9f3-43ab-9280-0d471373d022	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	\N	dde51228-dd75-4d01-8014-8571749b1037	\N
c874cad2-7e15-4bf9-b035-f1cc21c88998	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	a2f1e204-61ed-4a72-8329-b5082f4abb58	\N
5d1d1744-6095-4fac-991d-747a32af9279	Павел	Анатольевич	Яичкин	\N	\N	\N	Старший мастер производственного участка	13668	2021-01-30 00:00:00	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
5f99ec5b-1123-4bc4-8936-546be9c337d0	Александр	Николаевич	Денисенко	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21537	2023-05-12 00:00:00	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
8ecf0a28-5f05-4d6a-90dc-70462b4c6d6d	Татьяна	Стефановна	Долгая	\N	\N	\N	Контролер сварочных работ	35565	2023-01-30 00:00:00	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	\N
c880f7e0-5f09-4fb4-95f1-e08d8aa3480b	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$JSLwO8YakrfgrMB2mOzv47YhHzrzscFlZxYJG5plJmjubbMa	\N	\N	\N	\N	\N	\N
720990f6-d464-4fb4-b7e9-cb9e1a30ff86	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$9Zaie33Uv//2Fh/d1YpzjejZ4PKUxjTjIbTD9npB0AudVYyc	\N	\N	\N	\N	\N	\N
7d66dc15-86c3-40ec-becc-8e358dd96375	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$jL7K1NpSbChSpSirrtovwkFHWUEccOFLx+o6tLGLngpp61ik	\N	\N	\N	\N	\N	\N
222d135f-a410-4218-8d60-3a47f2e693df	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$woenyQGXnF8vCrbtJW8p1oz37Qel7zJSbfukJk7ymiMyaIaj	\N	\N	\N	\N	\N	\N
19d97708-263c-40ee-99f6-5194eb7e6cdf	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$/CLvRb1iBAhhRByKiM+EshRkoixt+k0yY1z9q9ZAa2jlyZaz	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
1ae1c117-634b-4785-81dd-57451ae96f74	2	Заполняющий	80	120	21	25	50	250	f412be47-d87f-4174-9b2b-86f7e32707aa	\N
7413ac21-7ff6-4933-8b58-7702262ba326	1	Корневой	80	120	\N	\N	50	250	f412be47-d87f-4174-9b2b-86f7e32707aa	\N
9b57d2fe-59d0-4654-98c8-8494210b0acc	1	Корневой	80	120	22	24	50	250	77c16a81-ad53-4170-982d-aa5f3cb31918	\N
cd6c8504-01bd-4edb-969b-663333e055c5	2	Заполняющий	80	120	21	25	50	250	77c16a81-ad53-4170-982d-aa5f3cb31918	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "WeldingCurrentValues", "ArcVoltageValues", "ShortTermDeviation", "LongTermDeviation", "WeldingStartTime", "WeldingEndTime", "PreheatingTemperature", "IsDone", "SeamId", "IdFromSystem") FROM stdin;
3011aef1-bb2c-410a-9b11-080177434a67	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	51b571fb-4ec6-4b3f-bb13-35499c21cdeb	\N
74724de2-e36e-46b7-8203-443ec1369203	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	73d33ca2-cc74-40bb-b360-88af3313bf9a	\N
c3da4d34-c4c9-445a-aee2-6d36e9597f09	2	Заполняющий	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	0.22	0.44	19:43:13	19:43:58	100	f	51b571fb-4ec6-4b3f-bb13-35499c21cdeb	\N
ece06bef-cece-477b-8b89-258f6345bb7b	1	Корневой	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	0.11	0.68	13:25:43	13:26:12	82	f	73d33ca2-cc74-40bb-b360-88af3313bf9a	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0f088524-2684-4c99-8db4-92ca0e09187e	36097cc8-6595-4a8d-b429-40f9ebde5bc8
150489b9-ac81-40ae-be60-6c8d8b6795f6	5485aed9-81d0-4dda-839b-3f015e7f3421
2bc9693e-4e10-46c9-94c8-9c0eba671692	1d9b0ac7-9db1-4564-b2a7-934abb36f9c3
2cb01d03-8b25-43ce-88b3-46133527e16f	d4d14eab-f53c-48ad-b7a5-1ad1bd0622de
356a53e0-ecc2-4bcb-b700-6f3a8c2e19bb	0a9ea318-55b4-4488-b265-0588adcb9a4f
36c8e55b-7bf2-45c5-923e-e11fc5582392	1d9b0ac7-9db1-4564-b2a7-934abb36f9c3
3b218eaf-32ba-4282-a068-710099c52443	55b7d199-b3c9-4e6e-bbde-a92406ad18ff
60cc7f58-fbb7-4a03-997e-628de63b756c	e46b847e-2ee2-4d61-a941-e990eba2236b
6d67b07b-6123-4d07-b953-5435c7ab56de	36097cc8-6595-4a8d-b429-40f9ebde5bc8
709dbd28-b26f-47c6-89fd-117e140fc741	0a9ea318-55b4-4488-b265-0588adcb9a4f
833f02c6-e5f8-4c1d-be31-86369bcf0601	a96c2b67-e0b4-4b48-a6df-0c1a4e31f2cc
a475a464-7983-4f3b-ba9c-81e44f3bf83f	36097cc8-6595-4a8d-b429-40f9ebde5bc8
b11fac2e-faf3-40de-85cb-0f591f464116	36097cc8-6595-4a8d-b429-40f9ebde5bc8
b71017d5-1724-451f-96a4-7290c7950bb3	a96c2b67-e0b4-4b48-a6df-0c1a4e31f2cc
c4d48f0b-bd64-4efa-b998-a84d311b0be1	d4d14eab-f53c-48ad-b7a5-1ad1bd0622de
cbbbc33a-aba3-4edf-8fca-3ad2d8a15f1a	55b7d199-b3c9-4e6e-bbde-a92406ad18ff
cceb3107-a0a8-4540-8def-1400394b31d3	5485aed9-81d0-4dda-839b-3f015e7f3421
d8d3c974-bf86-43a5-b31a-7ebab7feb93a	36097cc8-6595-4a8d-b429-40f9ebde5bc8
e7ea1edc-898b-4ffe-829b-f1f15c78a2df	a96c2b67-e0b4-4b48-a6df-0c1a4e31f2cc
fe13d145-7934-4c8c-a850-f01071b98e8a	e46b847e-2ee2-4d61-a941-e990eba2236b
febdd30c-0073-4953-aea4-d191eea4becf	d4d14eab-f53c-48ad-b7a5-1ad1bd0622de
ff9097e1-e1cc-4dc7-95fb-10b408f74ea1	d4d14eab-f53c-48ad-b7a5-1ad1bd0622de
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0f088524-2684-4c99-8db4-92ca0e09187e	8a74284f-f853-4755-b419-eee70f65010c	\N	156298
150489b9-ac81-40ae-be60-6c8d8b6795f6	1b8ac23c-03d1-4ee9-9fbe-b37c75afc39b	314a2aba-20fe-44ef-917f-853164ff9efc	132695
2bc9693e-4e10-46c9-94c8-9c0eba671692	803b479e-bb51-41e9-9408-5b358ff378cd	ed5bb79d-6695-4c60-b3e0-335ce87dd43d	120756
2cb01d03-8b25-43ce-88b3-46133527e16f	7a06792d-05ff-4bfc-987d-236cb5766e7f	\N	153274
356a53e0-ecc2-4bcb-b700-6f3a8c2e19bb	24203954-7bdb-42ab-a3f5-4a874ef62c54	1aa2d64b-49b6-4600-a183-21e969ffc0be	150882
36c8e55b-7bf2-45c5-923e-e11fc5582392	6f44e18b-c43a-4431-8b9e-2454d6126eb0	c4a5459a-2e94-44a2-a092-e1ab7fb8ad26	146325
3b218eaf-32ba-4282-a068-710099c52443	691127d1-ab41-4e54-bd29-aa5165194778	\N	150402
60cc7f58-fbb7-4a03-997e-628de63b756c	70e85ebc-d8fd-4f3c-8e67-3690221d8bb0	c4a5459a-2e94-44a2-a092-e1ab7fb8ad26	117390
6d67b07b-6123-4d07-b953-5435c7ab56de	8d17b4f9-c1b4-4c74-a3ce-16c900b6207c	\N	152365
709dbd28-b26f-47c6-89fd-117e140fc741	3283fba4-196d-44a7-9e9e-be42494634fe	e173f295-5b0c-4534-a7d3-2426cc4a0a6b	151299
833f02c6-e5f8-4c1d-be31-86369bcf0601	c897b4d4-3a90-4c80-8961-83ec6ddfe3b9	\N	156278
a475a464-7983-4f3b-ba9c-81e44f3bf83f	c25d1bd6-20ea-4f4e-9fcd-981dbb215441	\N	121537
b11fac2e-faf3-40de-85cb-0f591f464116	b5197c60-f338-4772-bf93-4f5c6ee09a4e	\N	147329
b71017d5-1724-451f-96a4-7290c7950bb3	d821744d-ee03-4d62-a912-d0ed7eb21d14	\N	152444
c4d48f0b-bd64-4efa-b998-a84d311b0be1	638d2900-cfa7-47b9-bdb2-0cd921389208	\N	152441
cbbbc33a-aba3-4edf-8fca-3ad2d8a15f1a	a24f9956-f24a-4961-a03a-a0e23f907f27	\N	149921
cceb3107-a0a8-4540-8def-1400394b31d3	91478528-63a0-4eb6-9f3c-46806cb269f4	78bfdd0e-4b22-4d0f-b481-0e64b53533d6	145092
d8d3c974-bf86-43a5-b31a-7ebab7feb93a	a245ecc1-320c-4fc5-a94c-707b3b0d8b1e	\N	121538
e7ea1edc-898b-4ffe-829b-f1f15c78a2df	26bedabc-3f49-45fe-8037-15f2dbecff91	\N	152207
fe13d145-7934-4c8c-a850-f01071b98e8a	fd12e864-a9f3-43ab-9280-0d471373d022	110ae33b-94e6-426b-bfa2-d5d4896bcc31	121267
febdd30c-0073-4953-aea4-d191eea4becf	45641c5a-6c2b-4f9f-be8e-3eb84699a318	\N	151861
ff9097e1-e1cc-4dc7-95fb-10b408f74ea1	444bad71-a485-4920-8bfb-39019af72dce	\N	155288
159d12cb-2b38-4149-917a-6aaef8c2c319	5f99ec5b-1123-4bc4-8936-546be9c337d0	\N	\N
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "DowntimeReasonId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "IdFromSystem") FROM stdin;
0a9ea318-55b4-4488-b265-0588adcb9a4f	\N	GLC556-C	GLC556-C	49283	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	499
1d9b0ac7-9db1-4564-b2a7-934abb36f9c3	\N	GLC556-C	GLC556-C	49225	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	508
36097cc8-6595-4a8d-b429-40f9ebde5bc8	\N	QINEO TRONIC	ECO600CQWDM2	49451	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	8008336102-130
5485aed9-81d0-4dda-839b-3f015e7f3421	\N	GLC556-C	GLC556-C	49286	2010-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	535
55b7d199-b3c9-4e6e-bbde-a92406ad18ff	\N	QINEO TRONIC	ECO600CQWDM2	49504	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	146
a96c2b67-e0b4-4b48-a6df-0c1a4e31f2cc	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	114
d4d14eab-f53c-48ad-b7a5-1ad1bd0622de	\N	QINEO TRONIC	ECO600CQWDM2	49506	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	162
e46b847e-2ee2-4d61-a941-e990eba2236b	\N	GLC556-C	GLC556-C	49232	2008-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	511
17f42e3c-1b0e-4fe5-a2e3-7c1ce04b5aef	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
647eda1c-fadf-443a-87ee-0cde1f1a4002	\N	QINEO TRONIC	ECO600CQWDM2	49505	2013-01-01 00:00:00	1	\N	\N	\N	3.11	CLOOS	2023-06-25 00:00:00	Полуавтоматическая сварка	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "WhenTaskIsDoneDate", "WeldingDate", "WeldingPlanDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WeldingEquipmentId", "WelderId", "IdFromSystem") FROM stdin;
e56879ff-6a3c-44c6-9852-11b88eef2790	1	\N	2023-02-10 13:35:22.076187	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	51b571fb-4ec6-4b3f-bb13-35499c21cdeb	17f42e3c-1b0e-4fe5-a2e3-7c1ce04b5aef	\N	\N
f05bda94-9bae-4716-9465-37735a1929b9	2	\N	2023-02-10 13:35:22.073979	\N	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	73d33ca2-cc74-40bb-b360-88af3313bf9a	647eda1c-fadf-443a-87ee-0cde1f1a4002	\N	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
3d9533ee-7c90-4c0f-a2dd-dc2aaff550c9	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	a61e86fc-7054-4cce-af85-78ecde1a1b1d	\N
6562ed0e-0a0f-4b7f-ab65-bee1e1ffec76	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	a61e86fc-7054-4cce-af85-78ecde1a1b1d	\N
ac2c4e14-84f3-4782-a2c4-bbeaa4ffad0b	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	a61e86fc-7054-4cce-af85-78ecde1a1b1d	\N
b6e62569-f6dc-4f74-b2d4-899353b9dd5b	1	12:10:00	13:10:00	13:20:00	13:50:00	2118bfb6-bd17-40e1-a486-2ba2495b2839	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
0108def8-82d9-4303-9356-f1e20f5a06ad	1270	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1270
110ae33b-94e6-426b-bfa2-d5d4896bcc31	3600	\N	dde51228-dd75-4d01-8014-8571749b1037	3600
1aa2d64b-49b6-4600-a183-21e969ffc0be	3690	\N	dde51228-dd75-4d01-8014-8571749b1037	3690
28b0ce9c-0082-4e34-b327-f6937305afff	2150	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	2150
2a97f5fb-50a5-45cc-b3a4-c862552de6c8	1390	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1390
314a2aba-20fe-44ef-917f-853164ff9efc	3500	\N	dde51228-dd75-4d01-8014-8571749b1037	3500
33fd5d1f-92af-40fb-a1af-5367c1a5b113	1380	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1380
3b2194dc-353e-426d-9cbf-0d0f0f72e296	1400	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1400
56a99890-17d0-4585-a8a5-0c089a569099	1260	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1260
6f59f4ef-1eff-4546-a823-04121ed436ac	1360	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1360
78bfdd0e-4b22-4d0f-b481-0e64b53533d6	3590	\N	dde51228-dd75-4d01-8014-8571749b1037	3590
8d0ca112-fa30-4f6d-bc50-7ab71c61a0c3	1550	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1550
c1050028-cd0c-4bb2-b279-c00547ac9566	2050	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	2050
c4a5459a-2e94-44a2-a092-e1ab7fb8ad26	3610	\N	dde51228-dd75-4d01-8014-8571749b1037	3610
c4d21cce-9c5d-4e07-a51e-f6a287064f3b	1280	\N	f8f10964-a1f1-4f02-ae2a-9aa87c9f6081	1280
d9c460ea-8d6c-4ac0-ba11-2c15f2c31f36	2130	\N	a2f1e204-61ed-4a72-8329-b5082f4abb58	2130
e173f295-5b0c-4534-a7d3-2426cc4a0a6b	3650	\N	dde51228-dd75-4d01-8014-8571749b1037	3650
ed5bb79d-6695-4c60-b3e0-335ce87dd43d	3520	\N	dde51228-dd75-4d01-8014-8571749b1037	3520
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
6b6fa9d0-ab06-4d09-b035-951ab9ce4718	Цех 50	50	050
b6f55917-cf58-4826-9563-b05cf3d04347	Цех 480	480	480
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 2, true);


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
-- Name: SeamWelder PK_SeamWelder; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamWelder"
    ADD CONSTRAINT "PK_SeamWelder" PRIMARY KEY ("SeamsId", "WeldersId");


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

CREATE UNIQUE INDEX "IX_Chiefs_WeldingEquipmentId" ON public."Chiefs" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Days_CalendarId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Days_CalendarId" ON public."Days" USING btree ("CalendarId");


--
-- Name: IX_Days_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Days_IdFromSystem" ON public."Days" USING btree ("IdFromSystem");


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
-- Name: IX_Masters_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Masters_WeldingEquipmentId" ON public."Masters" USING btree ("WeldingEquipmentId");


--
-- Name: IX_Posts_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_Posts_IdFromSystem" ON public."Posts" USING btree ("IdFromSystem");


--
-- Name: IX_Posts_ProductionAreaId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Posts_ProductionAreaId" ON public."Posts" USING btree ("ProductionAreaId");


--
-- Name: IX_ProductInsides_InsideProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_ProductInsides_InsideProductId" ON public."ProductInsides" USING btree ("InsideProductId");


--
-- Name: IX_ProductInsides_MainProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_ProductInsides_MainProductId" ON public."ProductInsides" USING btree ("MainProductId");


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
-- Name: IX_SeamWelder_WeldersId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_SeamWelder_WeldersId" ON public."SeamWelder" USING btree ("WeldersId");


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
-- Name: IX_StatusReasons_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_StatusReasons_IdFromSystem" ON public."StatusReasons" USING btree ("IdFromSystem");


--
-- Name: IX_StatusReasons_ProductId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_ProductId" ON public."StatusReasons" USING btree ("ProductId");


--
-- Name: IX_StatusReasons_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_StatusReasons_SeamId" ON public."StatusReasons" USING btree ("SeamId");


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
-- Name: IX_WeldPassages_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldPassages_SeamId" ON public."WeldPassages" USING btree ("SeamId");


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
-- Name: IX_WeldingEquipments_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingEquipments_IdFromSystem" ON public."WeldingEquipments" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingEquipments_PostId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipments_PostId" ON public."WeldingEquipments" USING btree ("PostId");


--
-- Name: IX_WeldingTasks_IdFromSystem; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_IdFromSystem" ON public."WeldingTasks" USING btree ("IdFromSystem");


--
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


--
-- Name: IX_WeldingTasks_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_WelderId" ON public."WeldingTasks" USING btree ("WelderId");


--
-- Name: IX_WeldingTasks_WeldingEquipmentId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_WeldingEquipmentId" ON public."WeldingTasks" USING btree ("WeldingEquipmentId");


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
-- Name: Products FK_Products_Workplaces_WorkplaceId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Workplaces_WorkplaceId" FOREIGN KEY ("WorkplaceId") REFERENCES public."Workplaces"("Id");


--
-- Name: SeamWelder FK_SeamWelder_Seams_SeamsId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamWelder"
    ADD CONSTRAINT "FK_SeamWelder_Seams_SeamsId" FOREIGN KEY ("SeamsId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: SeamWelder FK_SeamWelder_Welders_WeldersId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SeamWelder"
    ADD CONSTRAINT "FK_SeamWelder_Welders_WeldersId" FOREIGN KEY ("WeldersId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


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
-- Name: WeldPassages FK_WeldPassages_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldPassages"
    ADD CONSTRAINT "FK_WeldPassages_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


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
-- Name: WeldingEquipments FK_WeldingEquipments_Posts_PostId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipments"
    ADD CONSTRAINT "FK_WeldingEquipments_Posts_PostId" FOREIGN KEY ("PostId") REFERENCES public."Posts"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_Seams_SeamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Seams_SeamId" FOREIGN KEY ("SeamId") REFERENCES public."Seams"("Id") ON DELETE CASCADE;


--
-- Name: WeldingTasks FK_WeldingTasks_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id");


--
-- Name: WeldingTasks FK_WeldingTasks_WeldingEquipments_WeldingEquipmentId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingTasks"
    ADD CONSTRAINT "FK_WeldingTasks_WeldingEquipments_WeldingEquipmentId" FOREIGN KEY ("WeldingEquipmentId") REFERENCES public."WeldingEquipments"("Id");


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

