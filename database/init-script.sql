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
    "SeamId" uuid NOT NULL,
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
b7efd176-48b9-4815-bf61-3396f8b3230f	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
a49ac387-03bb-480c-9728-99efc193ef9a	c6cca739-0298-4d02-901a-3d865b804f03	81828d09-f1f8-47ae-94c9-039357bbeba1	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
9ade40c0-44db-4c4d-9488-76e7deae5d04	1	10	t	b7efd176-48b9-4815-bf61-3396f8b3230f	\N
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
12df59f9-04d5-4601-a4a2-9b600f2b9f51	Естественные надобности	\N
17237f6f-2902-43b2-ad7d-68997c118dd6	Установка, выверка, снятие детали	\N
178bf3f8-087e-4ad4-b354-9c7dd38e4d40	Аварийный ремонт централизованными службами	\N
2944854b-b589-416a-9e7b-4e0001abad4e	Контроль на рабочем месте	\N
30f8876d-335a-4081-80f7-41c5ef1a4689	Отсутствие оператора в связи с необеспеченностью	\N
35356bf9-cbb9-4c08-b90b-8a4bfc6e6987	Установка, выверка, снятие детали	\N
4c2377e9-7a99-4969-a006-e39bf7fdfedd	Отсутствие конструктора, технолога или ожидание его решения	\N
64b7568f-8294-490f-9722-1a054393b8d4	Отсутствие крана, транспорта	\N
78d771c7-685a-44f1-ab85-7701fdce2d24	Работа с управляющей программой	\N
8676160a-2038-492c-b362-8800eb6ed92e	Ознакомление с работой, документацией, инструктаж	\N
8dd6aca8-1aff-41aa-be8f-234fa425504e	Сборочные операции	\N
9bc8fa6a-96bd-4f52-8d24-d6b720403a68	Плановый ремонт централизованными службами	\N
9f289cb0-d1c2-4ba8-b972-70462b79c6c1	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
b6679712-2f6d-435a-82ac-41a2551016d1	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
c2248830-8a59-404c-b557-a307d9d4e1d6	Изменение режимов, смена инструмента, приспособления	\N
c7b0a697-7e28-480c-940e-b3c9b776e449	Работа по карте несоответствий	\N
c899be7f-2385-43a5-8332-8626ae2699b4	Неявка оператора (б/лист, отпуск, и пр.)	\N
d2b8dfb0-e3ec-47b7-8873-e1d04dc995a6	Отсутствие сотрудника ОТК	\N
d380650a-fd36-45ca-8658-4ac541a0ca57	Нерабочее время по графику согласно сменности	\N
d6603a8f-4323-47b4-920b-adb0493f58db	Обед	\N
ed269833-fc21-40f2-8fe3-6a8c6a1ac666	Отсутствие энергоносителей	\N
f15efcaa-c4bd-41a9-b545-a02af3e40b0c	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
f19eea45-6241-4eda-a25a-f8783a73c92e	Отсутствие заданий	\N
f9b69836-5345-431a-b8b6-30c47293fa95	Праздники и выходные	\N
fe791424-a334-465f-8f85-066e517099bb	Отсутствие материала, заготовок, деталей	\N
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
43dd989f-b01b-4fc1-998a-99623d9234f3	eea6f775-72c5-468d-a12e-657739f07bd9	249550
5bf73f9c-de94-42e5-b109-539ce331dd1b	f1824810-c535-4b0f-996c-45c821106a87	219379
824b32b6-ee02-47e1-b662-45eb856453d0	16b88700-5231-424b-916e-729f91297941	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
0ec996bc-b4d3-47b5-9da8-029c4b26337b	e8f8b59f-d20e-4b47-9ae0-3134c267b29b	610422
5423b9ab-c64f-4dcd-978b-22cd63684e3f	de2379dc-974c-4c9b-abae-316488c1790e	\N
c80d387d-e200-4ffc-bfd6-3cdf56c9f248	15221781-a87b-4aba-8580-6fe87dabdc83	614962
29357343-f611-4905-b496-b01af1fb2999	ae78f31f-350c-4d8a-af9f-3365e83bfc77	\N
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
\.


--
-- Data for Name: ProductAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccounts" ("Id", "Number", "AmountFromPlan", "DateFromPlan", "ProductId", "IdFromSystem") FROM stdin;
03fffc17-c7a0-4963-a0b4-8d44507da6d8	8	2	2023-03-05 12:07:22.801022	2cad4fd4-2e47-4d86-b836-a31d3470e52a	\N
067d77fa-d44f-48f1-9ea0-027dc5de57ab	26	2	2023-03-05 12:07:22.802756	8cebe317-ea1a-41c7-8cc2-8ffb15b56b64	\N
0b2372b2-72bf-45c6-ba3a-84f78ccb7406	5	2	2023-03-05 12:07:22.80077	16a903a6-cf82-4617-95fe-56bd445060c1	\N
1f33e939-e335-4d60-b4b9-a4f27060a5ee	33	2	2023-03-05 12:07:22.803611	b6ce4daa-c2d4-4736-9d41-6431050be88d	\N
248670ce-1074-4e83-93a4-48c9c768e024	42	2	2023-03-05 12:07:22.804393	fc435124-9e0e-4e4b-9ac4-b79cf2a4d19c	\N
25d2088c-a635-44f9-b1a1-8335d93d6650	2	2	2023-03-05 12:07:22.800469	0705dfdc-a718-4980-9394-c2f530cd502f	\N
2f7d0ad6-5513-4906-b720-e795e92eab49	7	2	2023-03-05 12:07:22.800938	1cc3238c-3da7-49e9-b8f4-242ecb75e527	\N
308c7ab0-0da8-4df3-9a05-de0d8ccc0d41	9	2	2023-03-05 12:07:22.801106	429c297a-4e71-421b-9841-f33337cb3a50	\N
36e6a7ff-60fb-48fe-a6d5-701bf775ddb1	12	2	2023-03-05 12:07:22.801354	4ab8c53c-4179-4c2b-ba92-04ebc2152b24	\N
3c482a76-0311-4152-b69a-560c91d2b6b8	1	2	2023-03-05 12:07:22.77335	047801d7-4f39-41c1-90da-03a0d3d18b07	\N
40674ed2-7c21-47c7-8fc0-9ff54cf34488	22	2	2023-03-05 12:07:22.802326	7676faff-91d0-40e2-9e23-69644f72c836	\N
4aebc9cd-b05f-4a45-b3e3-139cfc2c1959	23	2	2023-03-05 12:07:22.802416	7793c56b-2801-40d4-926f-4617d7a98263	\N
4f37f606-3965-4d15-9483-765176ec708f	11	2	2023-03-05 12:07:22.801269	454d2d8a-32b1-4064-a648-19566e87c2ae	\N
5948e5af-b2d1-4cee-80e7-9deebc06b931	15	2	2023-03-05 12:07:22.801632	5bc1cc55-7c3f-4012-9739-41a7ba0da8d3	\N
65440c62-4bf8-4c5b-a6fd-9abd5f285a3c	32	2	2023-03-05 12:07:22.803525	b2cf59af-4e75-4681-aeca-092f74afb449	\N
6990200f-2667-4848-a904-c9e9108a7a55	25	2	2023-03-05 12:07:22.802614	88440a72-88cf-45f9-9686-ca1aedefe9fb	\N
6b98e45a-6783-4c7f-884a-0218520bb793	40	2	2023-03-05 12:07:22.804223	ea78d843-7940-499c-8d6f-4a3518861772	\N
744ee638-940d-4d2d-ad66-a70515f616c9	29	2	2023-03-05 12:07:22.803247	a8f3ecc8-8f38-4569-8744-56c9eb35d4f3	\N
79904ad5-0634-4438-a052-0bb029dde05b	6	2	2023-03-05 12:07:22.800853	17aef579-9a56-482d-857d-9fab32fcb448	\N
8861d18c-fc86-49a5-b826-e7a01b11e82b	37	2	2023-03-05 12:07:22.803956	d86c0eb3-7041-4433-aab6-255a86f5e716	\N
8a6694be-7f94-4023-a2ac-a3f02a3d4aa0	31	2	2023-03-05 12:07:22.803434	b2155b24-c782-483b-a9c1-2bb07d01e183	\N
934009b7-1fa8-4d51-82a1-77f44d7d60e6	35	2	2023-03-05 12:07:22.803787	ca6c0d6d-968b-4606-82a4-f0731c9f1550	\N
a474b8ca-33b4-40b9-89b7-66a0c9bcc21c	19	2	2023-03-05 12:07:22.802025	66ac54d8-990a-4991-86f9-f62ab2fd8059	\N
a509a4e5-0659-48b7-90bc-b4fef91e0f82	39	2	2023-03-05 12:07:22.804134	e2028bf1-22d1-4967-bc60-10af376ff152	\N
a6fe4e2b-c77a-441c-ab3e-0c364126f952	21	2	2023-03-05 12:07:22.80223	72161873-08f5-4bde-bd6f-1a32d2692b5b	\N
a7b87b91-b6be-423b-9be4-54dfd3acc1ec	3	2	2023-03-05 12:07:22.800593	10e32ec9-aa49-4425-b866-0cf4b88658f5	\N
aa5d723e-1933-49d5-b096-f039f011cb00	38	2	2023-03-05 12:07:22.80404	d939e569-ad99-49eb-af70-063a80d46195	\N
aacb2c85-3649-4856-ae6b-81452279abd1	36	2	2023-03-05 12:07:22.80387	d3de4df8-a509-4693-a52d-4ffa156a4d8e	\N
b673376d-c61e-44b9-91e0-bcbc5def69d4	4	2	2023-03-05 12:07:22.800683	1306e14f-f819-48f1-9a9f-3894ffe105ef	\N
bb5b8a98-d2ec-4c1d-aaee-12c0b1a160e3	27	2	2023-03-05 12:07:22.802944	9e28b61a-8af1-459a-9613-e6561bda4a44	\N
bd41c54a-8bab-4ac8-85cc-1862a42fd4fc	20	2	2023-03-05 12:07:22.802133	6f2f47c9-3e1f-4a9e-a888-c2dbb6eec47a	\N
c9079ce8-662e-4796-8387-598e77c446e1	28	2	2023-03-05 12:07:22.803159	a7e250b4-a7d2-4719-a151-b4d590dff2f3	\N
ca9bceb7-75a1-4197-a24a-3cc00910fa4c	24	2	2023-03-05 12:07:22.802515	83dba3d4-c5d3-458f-84c9-3947a1a64989	\N
d8202fa4-bc79-41a3-befc-b08bdd05959a	34	2	2023-03-05 12:07:22.803698	ba4ab0c7-afae-4d60-91fe-0269bccfe1b0	\N
d8f9eda7-0891-48d0-af7a-1c2578b6e579	16	2	2023-03-05 12:07:22.801717	5e5b91d6-3c85-4f8d-a682-9cb8d0b71155	\N
e09b5699-86be-4a74-ac16-f533274f75eb	10	2	2023-03-05 12:07:22.801188	42a88d64-40e7-49a6-9660-853393d555a1	\N
e306729f-d42b-412a-a5da-9a4469491252	18	2	2023-03-05 12:07:22.801887	61f0de40-1dfa-4e07-96f1-fdc33b15e84f	\N
e3c69b83-affc-4059-abb0-0183759e5204	17	2	2023-03-05 12:07:22.801803	60e289fb-de3d-45e2-8897-bb3b4f58604d	\N
e980f509-ee3d-44bb-a850-56d25ef3faec	30	2	2023-03-05 12:07:22.803332	aea0486a-f045-4435-bbb2-24aa19ae0b28	\N
eee69e08-4ab4-4610-b4a7-634f40527f1d	41	2	2023-03-05 12:07:22.804307	ebda0cea-a5f5-4eb7-8624-28639ddeada8	\N
f5b99057-9b2a-4af0-a4a7-53845625000c	13	2	2023-03-05 12:07:22.801447	4cfdad14-c064-4b01-a883-c97b02c6746b	\N
f69038c4-da10-4433-a725-544a01ffac8f	14	2	2023-03-05 12:07:22.801544	58cd394e-acac-454f-8c32-f0179c872b4f	\N
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
b6ce4daa-c2d4-4736-9d41-6431050be88d	047801d7-4f39-41c1-90da-03a0d3d18b07
4cfdad14-c064-4b01-a883-c97b02c6746b	0705dfdc-a718-4980-9394-c2f530cd502f
aea0486a-f045-4435-bbb2-24aa19ae0b28	10e32ec9-aa49-4425-b866-0cf4b88658f5
ca6c0d6d-968b-4606-82a4-f0731c9f1550	1306e14f-f819-48f1-9a9f-3894ffe105ef
ca6c0d6d-968b-4606-82a4-f0731c9f1550	16a903a6-cf82-4617-95fe-56bd445060c1
4cfdad14-c064-4b01-a883-c97b02c6746b	17aef579-9a56-482d-857d-9fab32fcb448
4cfdad14-c064-4b01-a883-c97b02c6746b	1cc3238c-3da7-49e9-b8f4-242ecb75e527
8cebe317-ea1a-41c7-8cc2-8ffb15b56b64	2cad4fd4-2e47-4d86-b836-a31d3470e52a
4cfdad14-c064-4b01-a883-c97b02c6746b	429c297a-4e71-421b-9841-f33337cb3a50
16a903a6-cf82-4617-95fe-56bd445060c1	42a88d64-40e7-49a6-9660-853393d555a1
60e289fb-de3d-45e2-8897-bb3b4f58604d	454d2d8a-32b1-4064-a648-19566e87c2ae
16a903a6-cf82-4617-95fe-56bd445060c1	4ab8c53c-4179-4c2b-ba92-04ebc2152b24
72161873-08f5-4bde-bd6f-1a32d2692b5b	58cd394e-acac-454f-8c32-f0179c872b4f
ca6c0d6d-968b-4606-82a4-f0731c9f1550	5bc1cc55-7c3f-4012-9739-41a7ba0da8d3
b6ce4daa-c2d4-4736-9d41-6431050be88d	5e5b91d6-3c85-4f8d-a682-9cb8d0b71155
ca6c0d6d-968b-4606-82a4-f0731c9f1550	60e289fb-de3d-45e2-8897-bb3b4f58604d
ca6c0d6d-968b-4606-82a4-f0731c9f1550	61f0de40-1dfa-4e07-96f1-fdc33b15e84f
1cc3238c-3da7-49e9-b8f4-242ecb75e527	66ac54d8-990a-4991-86f9-f62ab2fd8059
72161873-08f5-4bde-bd6f-1a32d2692b5b	6f2f47c9-3e1f-4a9e-a888-c2dbb6eec47a
ca6c0d6d-968b-4606-82a4-f0731c9f1550	72161873-08f5-4bde-bd6f-1a32d2692b5b
9e28b61a-8af1-459a-9613-e6561bda4a44	7676faff-91d0-40e2-9e23-69644f72c836
b6ce4daa-c2d4-4736-9d41-6431050be88d	7793c56b-2801-40d4-926f-4617d7a98263
1306e14f-f819-48f1-9a9f-3894ffe105ef	83dba3d4-c5d3-458f-84c9-3947a1a64989
b6ce4daa-c2d4-4736-9d41-6431050be88d	88440a72-88cf-45f9-9686-ca1aedefe9fb
ca6c0d6d-968b-4606-82a4-f0731c9f1550	8cebe317-ea1a-41c7-8cc2-8ffb15b56b64
4cfdad14-c064-4b01-a883-c97b02c6746b	9e28b61a-8af1-459a-9613-e6561bda4a44
aea0486a-f045-4435-bbb2-24aa19ae0b28	a7e250b4-a7d2-4719-a151-b4d590dff2f3
16a903a6-cf82-4617-95fe-56bd445060c1	a8f3ecc8-8f38-4569-8744-56c9eb35d4f3
4cfdad14-c064-4b01-a883-c97b02c6746b	aea0486a-f045-4435-bbb2-24aa19ae0b28
1306e14f-f819-48f1-9a9f-3894ffe105ef	b2155b24-c782-483b-a9c1-2bb07d01e183
429c297a-4e71-421b-9841-f33337cb3a50	b2cf59af-4e75-4681-aeca-092f74afb449
4cfdad14-c064-4b01-a883-c97b02c6746b	b6ce4daa-c2d4-4736-9d41-6431050be88d
16a903a6-cf82-4617-95fe-56bd445060c1	ba4ab0c7-afae-4d60-91fe-0269bccfe1b0
16a903a6-cf82-4617-95fe-56bd445060c1	d3de4df8-a509-4693-a52d-4ffa156a4d8e
b6ce4daa-c2d4-4736-9d41-6431050be88d	d86c0eb3-7041-4433-aab6-255a86f5e716
1cc3238c-3da7-49e9-b8f4-242ecb75e527	d939e569-ad99-49eb-af70-063a80d46195
4cfdad14-c064-4b01-a883-c97b02c6746b	e2028bf1-22d1-4967-bc60-10af376ff152
ca6c0d6d-968b-4606-82a4-f0731c9f1550	ea78d843-7940-499c-8d6f-4a3518861772
4cfdad14-c064-4b01-a883-c97b02c6746b	ebda0cea-a5f5-4eb7-8624-28639ddeada8
ca6c0d6d-968b-4606-82a4-f0731c9f1550	fc435124-9e0e-4e4b-9ac4-b79cf2a4d19c
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
041b3c4f-2365-44d1-9f83-e1f3e14a2e1b	0	3	\N	\N	248670ce-1074-4e83-93a4-48c9c768e024	\N
04878a3b-e694-41c6-a929-f8e87ade3de1	0	2	\N	\N	a509a4e5-0659-48b7-90bc-b4fef91e0f82	\N
05ab64d5-2bc8-4e89-bd99-2f11cda903a4	0	1	\N	\N	c9079ce8-662e-4796-8387-598e77c446e1	\N
09279ce8-c926-4fa1-aa5c-c88ae8e30bb0	0	3	\N	\N	c9079ce8-662e-4796-8387-598e77c446e1	\N
09fc84ba-bedc-439d-9746-64c96dedd94e	0	2	\N	\N	2f7d0ad6-5513-4906-b720-e795e92eab49	\N
0a7d9e89-7ea4-466b-bec6-f01c67e24d34	0	3	\N	\N	3c482a76-0311-4152-b69a-560c91d2b6b8	\N
0dc7c3fc-7b1e-4ace-ac8a-0f8975fb3eb1	0	3	\N	\N	8861d18c-fc86-49a5-b826-e7a01b11e82b	\N
0f76f23a-ad82-4909-8ea0-b00294db2619	0	3	\N	\N	4f37f606-3965-4d15-9483-765176ec708f	\N
0ff3e7d8-00ee-4adf-9867-494730de5eb8	0	2	\N	\N	c9079ce8-662e-4796-8387-598e77c446e1	\N
19e7c845-01c2-46e1-bb36-5d7ba6379f6b	0	1	\N	\N	e3c69b83-affc-4059-abb0-0183759e5204	\N
1d23e05a-a605-4ca9-a14c-9f45c18daa40	0	3	\N	\N	aacb2c85-3649-4856-ae6b-81452279abd1	\N
201be7af-ceca-4e91-9c66-bf9d5076e114	0	3	\N	\N	744ee638-940d-4d2d-ad66-a70515f616c9	\N
2461214f-fd4e-46fa-afc1-2ecfba9a8e46	0	2	\N	\N	a474b8ca-33b4-40b9-89b7-66a0c9bcc21c	\N
2475facc-d5ac-495e-b234-72e67a13bf0f	0	3	\N	\N	aa5d723e-1933-49d5-b096-f039f011cb00	\N
257da3fe-84e8-40c9-b4de-379377bfd810	0	2	\N	\N	aacb2c85-3649-4856-ae6b-81452279abd1	\N
27a5a3ca-6618-4c88-9207-6800f70d1852	0	2	\N	\N	e3c69b83-affc-4059-abb0-0183759e5204	\N
27f8a8e7-2679-422d-b279-64a377c69d79	0	3	\N	\N	067d77fa-d44f-48f1-9ea0-027dc5de57ab	\N
2b470157-f343-405c-b0af-575df10dc9f3	0	1	\N	\N	8a6694be-7f94-4023-a2ac-a3f02a3d4aa0	\N
2b9ffb67-9ece-4713-83d8-93e06dc26b9d	0	2	\N	\N	40674ed2-7c21-47c7-8fc0-9ff54cf34488	\N
2d4591fd-f1d9-4c15-b8ca-eb4b54664f9d	0	1	\N	\N	5948e5af-b2d1-4cee-80e7-9deebc06b931	\N
2dbd0881-68c2-43b0-93e5-b170e8b961fb	0	2	\N	\N	3c482a76-0311-4152-b69a-560c91d2b6b8	\N
2efba391-64a8-4b7f-b36a-288f72d52ba7	0	2	\N	\N	067d77fa-d44f-48f1-9ea0-027dc5de57ab	\N
2fb3d3af-40b5-434d-9e51-3ac8d0cab5ba	0	3	\N	\N	d8f9eda7-0891-48d0-af7a-1c2578b6e579	\N
300be442-c572-4daa-acf8-460f23874869	0	1	\N	\N	aa5d723e-1933-49d5-b096-f039f011cb00	\N
32cf4176-0d30-4c68-a4b9-4ce5a43dae58	0	2	\N	\N	4aebc9cd-b05f-4a45-b3e3-139cfc2c1959	\N
33372647-312a-4e00-82cc-32fd86c249a8	0	2	\N	\N	b673376d-c61e-44b9-91e0-bcbc5def69d4	\N
3a747e9d-cf8f-4a65-b3ad-8dec1cadc38f	0	2	\N	\N	a7b87b91-b6be-423b-9be4-54dfd3acc1ec	\N
3af60f8a-5654-453e-a43e-141ebde9f8ed	0	1	\N	\N	ca9bceb7-75a1-4197-a24a-3cc00910fa4c	\N
3afd1805-c759-4265-ae35-dbae95726485	0	1	\N	\N	6990200f-2667-4848-a904-c9e9108a7a55	\N
3c9168d5-4a71-4973-a4bb-895604b1f1b1	0	2	\N	\N	8861d18c-fc86-49a5-b826-e7a01b11e82b	\N
3d71ad5a-4744-4caa-8510-593e41118336	0	2	\N	\N	4f37f606-3965-4d15-9483-765176ec708f	\N
3e9cafb9-7469-4d16-a487-feb1451c7cac	0	3	\N	\N	e09b5699-86be-4a74-ac16-f533274f75eb	\N
3f5263fb-7698-4a13-a85b-830b45d62279	0	2	\N	\N	744ee638-940d-4d2d-ad66-a70515f616c9	\N
41435ba0-6e9b-406c-8f63-7bf7baf5447e	0	3	\N	\N	e980f509-ee3d-44bb-a850-56d25ef3faec	\N
42f59392-1c1c-4690-a3b1-4f50870b47a6	0	3	\N	\N	e3c69b83-affc-4059-abb0-0183759e5204	\N
43d71da1-661f-4fe2-9f92-497626b08d4a	0	1	\N	\N	d8202fa4-bc79-41a3-befc-b08bdd05959a	\N
48b46042-a255-4caa-a949-f7de96ce2b95	0	1	\N	\N	b673376d-c61e-44b9-91e0-bcbc5def69d4	\N
4a0db34c-4651-49a9-910c-24dc63e26d0b	0	3	\N	\N	a474b8ca-33b4-40b9-89b7-66a0c9bcc21c	\N
4a460ef9-734b-42d3-a0c1-c3120c374fb3	0	1	\N	\N	eee69e08-4ab4-4610-b4a7-634f40527f1d	\N
4b01e3c4-944d-415e-a71b-425d55ff5e71	0	1	\N	\N	4aebc9cd-b05f-4a45-b3e3-139cfc2c1959	\N
4be1d28e-85f7-4363-aa94-0a32919aae6d	0	2	\N	\N	eee69e08-4ab4-4610-b4a7-634f40527f1d	\N
4c4b571f-923c-48f8-bd9b-9017f2e363b1	0	2	\N	\N	d8f9eda7-0891-48d0-af7a-1c2578b6e579	\N
4d29ccb3-2020-409e-ac2d-323957d70f6c	0	2	\N	\N	0b2372b2-72bf-45c6-ba3a-84f78ccb7406	\N
4dbc8018-75a4-4f3a-995d-ab465c18e231	0	2	\N	\N	bd41c54a-8bab-4ac8-85cc-1862a42fd4fc	\N
4e69c60d-2a6d-4fad-b6b8-c7c9bf3d135e	0	2	\N	\N	03fffc17-c7a0-4963-a0b4-8d44507da6d8	\N
4ec1e5c0-82f2-4422-b60b-a648972b2a2a	0	3	\N	\N	bb5b8a98-d2ec-4c1d-aaee-12c0b1a160e3	\N
509134ef-fa29-4126-ac5c-f0a25a97a69b	0	1	\N	\N	8861d18c-fc86-49a5-b826-e7a01b11e82b	\N
51b2166e-0139-4812-804f-4c287cb29b03	0	2	\N	\N	5948e5af-b2d1-4cee-80e7-9deebc06b931	\N
54ccd809-4633-4667-a68c-b549829657d0	0	1	\N	\N	e306729f-d42b-412a-a5da-9a4469491252	\N
564ed66c-af25-4e84-a178-3cd3f5f6b2b6	0	2	\N	\N	a6fe4e2b-c77a-441c-ab3e-0c364126f952	\N
56608659-3be9-4ba0-97a7-eee12b1b7893	0	1	\N	\N	4f37f606-3965-4d15-9483-765176ec708f	\N
58863581-cd05-4db4-a59b-3c4736a5be51	0	2	\N	\N	248670ce-1074-4e83-93a4-48c9c768e024	\N
59efe3de-ecb6-49aa-bf48-7b25e6c46b5c	0	1	\N	\N	a474b8ca-33b4-40b9-89b7-66a0c9bcc21c	\N
5a26cda9-ac42-4ef0-8bee-e44f90734c65	0	3	\N	\N	65440c62-4bf8-4c5b-a6fd-9abd5f285a3c	\N
5bae1af1-1dc6-493a-bcdb-7fec6e2216ec	0	3	\N	\N	36e6a7ff-60fb-48fe-a6d5-701bf775ddb1	\N
5e04b20d-c975-4bf3-a962-1b160d9d352f	0	3	\N	\N	eee69e08-4ab4-4610-b4a7-634f40527f1d	\N
61dd8121-85bf-4e82-87e6-3a1d120bdbde	0	2	\N	\N	8a6694be-7f94-4023-a2ac-a3f02a3d4aa0	\N
63890082-90e2-496b-8d84-32cca2546484	0	2	\N	\N	25d2088c-a635-44f9-b1a1-8335d93d6650	\N
63a9ea84-61bb-48c7-9adf-f5165d17a4ac	0	2	\N	\N	e980f509-ee3d-44bb-a850-56d25ef3faec	\N
641dd15e-fc4a-4486-a37b-1b2222bf1cdb	0	1	\N	\N	40674ed2-7c21-47c7-8fc0-9ff54cf34488	\N
650a4ab9-eefa-4bc4-9ce8-dc05fb444498	0	3	\N	\N	0b2372b2-72bf-45c6-ba3a-84f78ccb7406	\N
6612385e-e6a2-4729-8b89-52790235a8bb	0	3	\N	\N	6990200f-2667-4848-a904-c9e9108a7a55	\N
661e5b1f-c412-4030-bde6-8db17e11f338	0	3	\N	\N	03fffc17-c7a0-4963-a0b4-8d44507da6d8	\N
6819cdec-21c9-4ad4-9741-59762d0bae8c	0	2	\N	\N	934009b7-1fa8-4d51-82a1-77f44d7d60e6	\N
68bd110a-4087-4646-a2d9-498dbf6f0be0	0	3	\N	\N	934009b7-1fa8-4d51-82a1-77f44d7d60e6	\N
68ce079d-88b7-4701-9779-86b00a6e2716	0	3	\N	\N	b673376d-c61e-44b9-91e0-bcbc5def69d4	\N
6b98560a-c86a-4ecc-969c-3291e634ae10	0	2	\N	\N	1f33e939-e335-4d60-b4b9-a4f27060a5ee	\N
6df248cc-c6e2-428a-8e0d-9637d2868cdb	0	2	\N	\N	65440c62-4bf8-4c5b-a6fd-9abd5f285a3c	\N
6e74d2bd-e1e5-4cda-a0cb-76c9c366186b	0	3	\N	\N	d8202fa4-bc79-41a3-befc-b08bdd05959a	\N
73caa6d8-3b4c-4c08-a07a-f2369cd37747	0	1	\N	\N	bb5b8a98-d2ec-4c1d-aaee-12c0b1a160e3	\N
7559938e-4ecb-4e93-82b9-acc69fde1a91	0	2	\N	\N	f5b99057-9b2a-4af0-a4a7-53845625000c	\N
76e58ce0-ca51-4ffa-94c1-bdb255f086dd	0	2	\N	\N	ca9bceb7-75a1-4197-a24a-3cc00910fa4c	\N
7a37a532-2b2a-4d4e-8894-e1c069c17eaf	0	1	\N	\N	e09b5699-86be-4a74-ac16-f533274f75eb	\N
7c3d5269-ca18-4ff4-83e5-b4695ffcf6aa	0	3	\N	\N	f69038c4-da10-4433-a725-544a01ffac8f	\N
7de6ae0e-7ab9-4b8b-8056-2910b44f0159	0	3	\N	\N	40674ed2-7c21-47c7-8fc0-9ff54cf34488	\N
82b615cc-ed0d-4f02-89a6-8dd9d9167b6c	0	2	\N	\N	e09b5699-86be-4a74-ac16-f533274f75eb	\N
85edbb70-5920-4864-80da-5339a574c6b3	0	2	\N	\N	d8202fa4-bc79-41a3-befc-b08bdd05959a	\N
89b1a107-6cee-43ac-a587-7bcb72c022aa	0	1	\N	\N	bd41c54a-8bab-4ac8-85cc-1862a42fd4fc	\N
8af1a36f-882c-4256-88da-835c7e28c271	0	3	\N	\N	8a6694be-7f94-4023-a2ac-a3f02a3d4aa0	\N
8b2b9353-da19-4c2b-8744-fb2353c7d3f8	0	1	\N	\N	3c482a76-0311-4152-b69a-560c91d2b6b8	\N
8bd35f84-ecb0-4fd5-83d2-b866bdacac31	0	2	\N	\N	79904ad5-0634-4438-a052-0bb029dde05b	\N
92e27dab-f5c0-45ba-a9d7-f7de23985836	0	3	\N	\N	1f33e939-e335-4d60-b4b9-a4f27060a5ee	\N
95ac5577-4782-4b05-8036-222a93d9baf4	0	3	\N	\N	a7b87b91-b6be-423b-9be4-54dfd3acc1ec	\N
96566d17-42fa-4173-a832-3a34b24ebaa9	0	3	\N	\N	a509a4e5-0659-48b7-90bc-b4fef91e0f82	\N
96d3c5cd-fe19-41a4-b80a-157ada648c71	0	3	\N	\N	79904ad5-0634-4438-a052-0bb029dde05b	\N
97b81bc5-2ec0-417a-b6cd-375c8a767e7c	0	1	\N	\N	308c7ab0-0da8-4df3-9a05-de0d8ccc0d41	\N
98629313-5f82-4cde-a41d-44774d1409aa	0	2	\N	\N	6990200f-2667-4848-a904-c9e9108a7a55	\N
9b98b5a1-cf3a-4458-ac95-99292129126e	0	1	\N	\N	65440c62-4bf8-4c5b-a6fd-9abd5f285a3c	\N
9fbadee2-0815-42bb-9203-7a98af5a84c5	0	1	\N	\N	e980f509-ee3d-44bb-a850-56d25ef3faec	\N
a04758f1-ede4-4483-a33d-ef18ec91a4e8	0	3	\N	\N	308c7ab0-0da8-4df3-9a05-de0d8ccc0d41	\N
a065f047-93f7-4da3-9e0c-3b5a3f44fde8	0	3	\N	\N	6b98e45a-6783-4c7f-884a-0218520bb793	\N
a09acaff-9e33-443e-a840-80afb5ed1950	0	1	\N	\N	0b2372b2-72bf-45c6-ba3a-84f78ccb7406	\N
a3726f90-ed49-4fda-81cf-64be1dcc4883	0	1	\N	\N	a6fe4e2b-c77a-441c-ab3e-0c364126f952	\N
a38362c5-e692-4de6-a61b-8c2f31ac31e2	0	1	\N	\N	79904ad5-0634-4438-a052-0bb029dde05b	\N
a6a7cf6b-9d1b-4fe2-9065-0427b7710457	0	3	\N	\N	a6fe4e2b-c77a-441c-ab3e-0c364126f952	\N
ac9998b3-6023-4c0b-922f-ba8426ca29de	0	3	\N	\N	5948e5af-b2d1-4cee-80e7-9deebc06b931	\N
af4cd22c-bc24-4f53-b300-db87bb21971f	0	1	\N	\N	2f7d0ad6-5513-4906-b720-e795e92eab49	\N
afe24544-b3dc-416e-915e-6d595c2551ae	0	3	\N	\N	bd41c54a-8bab-4ac8-85cc-1862a42fd4fc	\N
b2a2fa4a-1075-470e-8c2c-4eeeaa7d6d6e	0	1	\N	\N	934009b7-1fa8-4d51-82a1-77f44d7d60e6	\N
b401feb6-e1c6-424b-8646-9d6642e12e05	0	2	\N	\N	36e6a7ff-60fb-48fe-a6d5-701bf775ddb1	\N
b7d84fd6-7d1a-4910-802c-ec1e9eed688c	0	3	\N	\N	f5b99057-9b2a-4af0-a4a7-53845625000c	\N
bc340c0a-aa36-4a40-b716-272ade5b1e2f	0	3	\N	\N	e306729f-d42b-412a-a5da-9a4469491252	\N
be9cd251-b119-4705-9764-730b583cfb7a	0	2	\N	\N	6b98e45a-6783-4c7f-884a-0218520bb793	\N
bf4a6804-ea62-40ed-a5fe-f770ca6d7163	0	1	\N	\N	f69038c4-da10-4433-a725-544a01ffac8f	\N
bf5fd5f4-052c-4ed9-8e40-54e3a84447ee	0	1	\N	\N	d8f9eda7-0891-48d0-af7a-1c2578b6e579	\N
c9136fc4-dd18-465d-aeb6-b9fc9e5e1752	0	1	\N	\N	067d77fa-d44f-48f1-9ea0-027dc5de57ab	\N
ca77f11a-1416-40bc-9bee-ccfe96eb1e8c	0	1	\N	\N	a7b87b91-b6be-423b-9be4-54dfd3acc1ec	\N
cc74e88e-e48f-4df4-b9bc-dfa4795f2d7f	0	1	\N	\N	f5b99057-9b2a-4af0-a4a7-53845625000c	\N
d04a6552-430b-4dcd-a6d9-0ce29f817a26	0	1	\N	\N	248670ce-1074-4e83-93a4-48c9c768e024	\N
d3be7e7f-02f1-4085-9800-627bfde7770f	0	1	\N	\N	6b98e45a-6783-4c7f-884a-0218520bb793	\N
d922ee84-7b7b-430f-9f04-bffd969abb40	0	2	\N	\N	aa5d723e-1933-49d5-b096-f039f011cb00	\N
d99b8d0e-bb28-405b-b297-0491e1280b9c	0	3	\N	\N	2f7d0ad6-5513-4906-b720-e795e92eab49	\N
dcdfb981-0170-4ff3-a83f-ca2ccc6d8e68	0	2	\N	\N	308c7ab0-0da8-4df3-9a05-de0d8ccc0d41	\N
dddd2b85-5600-44e5-8ebb-10e28e1a6d10	0	2	\N	\N	bb5b8a98-d2ec-4c1d-aaee-12c0b1a160e3	\N
e229d75a-f2c8-4974-90a9-9bf258901fa1	0	2	\N	\N	e306729f-d42b-412a-a5da-9a4469491252	\N
e5787285-bd4e-4993-a621-4122718a0115	0	1	\N	\N	03fffc17-c7a0-4963-a0b4-8d44507da6d8	\N
e8c41b87-8887-4d96-91c0-2c9271a2f437	0	1	\N	\N	aacb2c85-3649-4856-ae6b-81452279abd1	\N
eb65a4ee-b782-43ad-982e-157148617cab	0	3	\N	\N	25d2088c-a635-44f9-b1a1-8335d93d6650	\N
f440ca89-83ea-42fe-a200-571916fc1d5e	0	1	\N	\N	744ee638-940d-4d2d-ad66-a70515f616c9	\N
f4ec1696-64c2-4295-bd98-964daa55958e	0	1	\N	\N	a509a4e5-0659-48b7-90bc-b4fef91e0f82	\N
fa845bc2-0eb5-4e66-bb42-7175f82c025f	0	3	\N	\N	4aebc9cd-b05f-4a45-b3e3-139cfc2c1959	\N
fae60dc9-a8dd-4851-babe-8ecc692aaa1c	0	2	\N	\N	f69038c4-da10-4433-a725-544a01ffac8f	\N
fb6c58f7-a81d-40d5-8057-096f1c8c48d5	0	1	\N	\N	25d2088c-a635-44f9-b1a1-8335d93d6650	\N
fbdb7336-3280-495a-80a0-b960cb407644	0	3	\N	\N	ca9bceb7-75a1-4197-a24a-3cc00910fa4c	\N
fc1eea47-705a-462b-99a9-3d9047aa0ab4	0	1	\N	\N	36e6a7ff-60fb-48fe-a6d5-701bf775ddb1	\N
ff2d80bd-52ce-4ba9-8713-b19226788c6c	0	1	\N	\N	1f33e939-e335-4d60-b4b9-a4f27060a5ee	\N
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
35c83195-141c-4cf8-a8cc-72f0970456d5	Сборка, сварка рам к/с г/п 120-130 т.	6	81828d09-f1f8-47ae-94c9-039357bbeba1	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
047801d7-4f39-41c1-90da-03a0d3d18b07	Лист верхний	75131-2801357-10	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
0705dfdc-a718-4980-9394-c2f530cd502f	Поперечина №3 рамы с опорами	75132-2801152	t	2	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
10e32ec9-aa49-4425-b866-0cf4b88658f5	Накладка рамы поперечная передняя	75131-2801088-70	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
1306e14f-f819-48f1-9a9f-3894ffe105ef	Лонжерон рамы правый	75131-2801016-70	t	2	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
16a903a6-cf82-4617-95fe-56bd445060c1	Поперечина рамы задняя	75131-2801300-20	t	2	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
17aef579-9a56-482d-857d-9fab32fcb448	Усилитель	75131-2801114-01	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
1cc3238c-3da7-49e9-b8f4-242ecb75e527	Лонжерон рамы левый	75131-2801017-70	t	2	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
2cad4fd4-2e47-4d86-b836-a31d3470e52a	Опора	75131-2801188	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
429c297a-4e71-421b-9841-f33337cb3a50	Лонжерон рамы правый	75131-2801014-41	t	2	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
454d2d8a-32b1-4064-a648-19566e87c2ae	Опора	75131-2801188	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
4ab8c53c-4179-4c2b-ba92-04ebc2152b24	Кронштейн задней опоры	75131-8521183-20	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
4cfdad14-c064-4b01-a883-c97b02c6746b	Рама	7513D-2800010-20	t	1	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	4536492774
58cd394e-acac-454f-8c32-f0179c872b4f	Опора	75131-2801188	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
5bc1cc55-7c3f-4012-9739-41a7ba0da8d3	Усилитель	75131-2801114-01	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
5e5b91d6-3c85-4f8d-a682-9cb8d0b71155	Лист нижний	75131-2801358-10	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
60e289fb-de3d-45e2-8897-bb3b4f58604d	Лонжерон рамы правый	75131-2801014-41	t	2	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
61f0de40-1dfa-4e07-96f1-fdc33b15e84f	Поперечина №3 рамы с опорами	75132-2801152	t	2	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
66ac54d8-990a-4991-86f9-f62ab2fd8059	Опора	75131-2801188	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
6f2f47c9-3e1f-4a9e-a888-c2dbb6eec47a	Накладка рамы поперечная передняя	75131-2801088-70	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
72161873-08f5-4bde-bd6f-1a32d2692b5b	Лонжерон рамы левый	75131-2801017-70	t	2	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
7676faff-91d0-40e2-9e23-69644f72c836	Опора	75131-2801188	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
7793c56b-2801-40d4-926f-4617d7a98263	Поперечина	75131-2801325	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
83dba3d4-c5d3-458f-84c9-3947a1a64989	Накладка рамы поперечная передняя	75131-2801088-70	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
88440a72-88cf-45f9-9686-ca1aedefe9fb	Кронштейн задней опоры	75131-8521183-20	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
8cebe317-ea1a-41c7-8cc2-8ffb15b56b64	Лонжерон рамы левый	75131-2801015-41	t	2	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
a7e250b4-a7d2-4719-a151-b4d590dff2f3	Опора	75131-2801188	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
a8f3ecc8-8f38-4569-8744-56c9eb35d4f3	Кронштейн задней опоры	75131-8521182-20	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
aea0486a-f045-4435-bbb2-24aa19ae0b28	Лонжерон рамы правый	75131-2801016-70	t	2	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
b2155b24-c782-483b-a9c1-2bb07d01e183	Опора	75131-2801188	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
b2cf59af-4e75-4681-aeca-092f74afb449	Опора	75131-2801188	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
b6ce4daa-c2d4-4736-9d41-6431050be88d	Поперечина рамы задняя	75131-2801300-20	t	2	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
ba4ab0c7-afae-4d60-91fe-0269bccfe1b0	Поперечина	75131-2801325	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
ca6c0d6d-968b-4606-82a4-f0731c9f1550	Рама	75131-2800010-70	t	1	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	4536479362
d3de4df8-a509-4693-a52d-4ffa156a4d8e	Лист верхний	75131-2801357-10	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
d86c0eb3-7041-4433-aab6-255a86f5e716	Кронштейн задней опоры	75131-8521182-20	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
d939e569-ad99-49eb-af70-063a80d46195	Накладка рамы поперечная передняя	75131-2801088-70	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
e2028bf1-22d1-4967-bc60-10af376ff152	Усилитель	75131-2801115-01	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
ea78d843-7940-499c-8d6f-4a3518861772	Поперечина	75131-2801103-10	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
ebda0cea-a5f5-4eb7-8624-28639ddeada8	Поперечина	75131-2801103-10	t	3	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
fc435124-9e0e-4e4b-9ac4-b79cf2a4d19c	Усилитель	75131-2801115-01	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N	\N	\N
42a88d64-40e7-49a6-9660-853393d555a1	Лист нижний	75131-2801358-10	t	3	d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	35c83195-141c-4cf8-a8cc-72f0970456d5	0ec996bc-b4d3-47b5-9da8-029c4b26337b	\N	\N	\N
9e28b61a-8af1-459a-9613-e6561bda4a44	Лонжерон рамы левый	75131-2801015-41	t	2	d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	35c83195-141c-4cf8-a8cc-72f0970456d5	0ec996bc-b4d3-47b5-9da8-029c4b26337b	\N	\N	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Roles" ("Id", "Name", "IdFromSystem") FROM stdin;
875b9130-9c23-4ff6-a5ab-f6663c228a6b	Admin	\N
8aed4864-5401-4214-aecf-222a8fe64850	Master	\N
2520a9e4-36a8-4658-aa9e-c457240a938b	Welder	\N
2eeaa9d1-fedb-45ef-9868-9234cc8a3fd6	Inspector	\N
6c149511-9e31-4e3e-a1e5-6345656ab20a	Chief	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "IdFromSystem") FROM stdin;
01c48aea-6d06-4150-be9c-7bcef8c7ccee	2023-03-05 12:07:22.826887	d715afff-f165-4cf8-8c06-e75ae7039eaa	\N
033ec69f-6ce8-4ce1-9b78-b9d1dddc0138	2023-03-05 12:07:22.826807	6f8a92fc-3241-4bb2-8ef6-03fccdb4dedf	\N
04a11fd5-432f-4116-84c1-adb070504975	2023-03-05 12:07:22.82583	a6471ab4-3742-4485-b301-af55853fa0f8	\N
0e039094-5347-4c81-b4b7-6098b7aa53a5	2023-03-05 12:07:22.824593	598e788b-67bf-40db-9f2c-d6c76f56cee5	\N
1261ea5f-cbbf-4993-9457-9bdd0fd45253	2023-03-05 12:07:22.825655	7343d705-d937-44a6-8688-4e0f0c0d3765	\N
12bde6bf-6746-4b7b-8653-4e4d08ee966b	2023-03-05 12:07:22.823844	4d78121f-6e60-4d8a-9e97-8a250c2a97d5	\N
1ecfbeaa-59a5-4bb7-97e3-42485fe0a1a7	2023-03-05 12:07:22.824511	feaf787a-76f7-4f94-86d5-61e0bded33f5	\N
1f2a4040-07cf-40a0-8d1c-f8969c583d98	2023-03-05 12:07:22.824683	8ed1b5ba-2660-4919-a13f-a7d8879d699a	\N
20d4b42d-ce33-43c4-a535-3d93e7c22590	2023-03-05 12:07:22.823678	d60564da-b2f5-42e1-9fda-82a585958cf2	\N
21b3dfcd-9ff9-4d12-92ed-adceee9aa9b4	2023-03-05 12:07:22.827054	591f61db-8f65-442b-a396-0ae59864b86e	\N
311d2fde-4fb6-4862-91b6-cb40c5db9e05	2023-03-05 12:07:22.824933	584d693c-a402-4178-a8b2-5790f03e87a0	\N
36b431f2-54f0-4350-8a21-5de1e71411f7	2023-03-05 12:07:22.823493	575c0927-fd26-4594-8d57-1549a6f501e7	\N
399cfa1b-d25b-4295-b371-10aabacfe45d	2023-03-05 12:07:22.825176	294be175-9ab9-474e-9653-5a4192458ad1	\N
3ab6c017-4889-43fe-8afb-cf58451c2710	2023-03-05 12:07:22.82755	5b6bff27-93ad-473f-bd36-d124fc7ad0eb	\N
3c7d4394-e787-4460-b386-92fa1a48837e	2023-03-05 12:07:22.824102	465df89a-1bac-4877-99c3-0a3c93e904f6	\N
3cebf84f-03f3-4afa-be9e-bd6c867b9668	2023-03-05 12:07:22.825497	814f0785-5de9-4d11-a42d-16570cf16e68	\N
4924f9a5-c966-4f8a-be22-5e8601feefc0	2023-03-05 12:07:22.825575	63536e66-f57c-4495-a634-d26abf7a956c	\N
5039b673-6826-4ecd-a932-4fe9c3fb69ff	2023-03-05 12:07:22.824181	90410e9b-e1d9-42cf-9a68-e4bfe35770f2	\N
5144fc93-cee6-4bd2-9e72-6653a2f9e6cf	2023-03-05 12:07:22.826651	08e9ae93-79b3-43ec-8104-5ff3ef97b281	\N
577f7b1b-bb5b-4696-bbde-6b1f0a54e4d4	2023-03-05 12:07:22.823363	f83fb281-01e4-42d3-8a14-1d3d64ad9b18	\N
578a9c30-7b9f-4625-be7b-c19f32c3701c	2023-03-05 12:07:22.825909	e3bb2cbb-c2d4-47e2-99d5-a2c7edfb40b7	\N
5f982df1-e57f-4641-9761-f5c35ad17694	2023-03-05 12:07:22.826311	8da97bbc-bed3-47a1-9976-a7841bb19bf3	\N
69f1b1c8-035a-4b5d-a3b8-c71c26e00a04	2023-03-05 12:07:22.826149	4c31ba3f-6c60-4b84-8138-7972c2a15ac6	\N
6adf71a9-b187-4d81-b8e0-82b8ed284a3e	2023-03-05 12:07:22.827133	9f330447-21f1-4043-93b5-be11f3e8ebda	\N
6afcc34a-47c0-4d16-bbdb-66c863f006fe	2023-03-05 12:07:22.825415	61be4824-e4e5-422a-8337-0e2206b26c2b	\N
6c96a1a6-73ce-4a75-8eac-29fe4ce827e0	2023-03-05 12:07:22.824022	26e78bc2-1d02-4271-aff9-66b3df211354	\N
75969f43-af29-4e89-9b27-154cf179758c	2023-03-05 12:07:22.824344	de84819c-ff20-4bdb-8534-57a127fcc4b0	\N
78e1f5f0-38a4-43f4-bd62-51ec3a6168cf	2023-03-05 12:07:22.825743	27983d69-7f55-4538-a416-095679119a86	\N
7be1bdaf-8422-4426-a242-ce700fdfbcc0	2023-03-05 12:07:22.825017	9c14f85d-02bb-442e-a631-5bca017a00c8	\N
7e8a3716-258f-4b9d-afbf-fbeca2b83056	2023-03-05 12:07:22.825098	084284f3-3898-41d1-8bd4-7cc27791b6a6	\N
7f4be6f7-0d13-4e04-a1f8-cb2c20e343a9	2023-03-05 12:07:22.826394	dcfa5323-8e16-46a1-bb4b-0d9896e607ed	\N
844ab8bc-9b3c-4aae-b481-379eabef453a	2023-03-05 12:07:22.826569	29325ecf-6536-4121-9888-b8e54fb88d61	\N
85225210-7caa-4eca-a747-63259d875c10	2023-03-05 12:07:22.823927	bafe5565-04ad-44a2-b5f6-2300631aee1e	\N
955e1182-c102-4dda-af0e-cef5f1135f11	2023-03-05 12:07:22.826068	1b8b7950-e4ce-4c7c-8477-986c21b8189d	\N
9bfd60f8-8afd-47ef-a534-aaf6c87a3e88	2023-03-05 12:07:22.826729	1de0f8f2-1e21-4b31-8fd1-073386771031	\N
a043251b-4493-4fd5-a0b8-02d5bf39ac1e	2023-03-05 12:07:22.82526	f8642560-5df9-49a2-9c8f-213165a5b143	\N
a7212f36-9288-4741-b5e6-a740a1834c81	2023-03-05 12:07:22.827305	c6c59afc-891e-4383-a68b-4631e6d104e9	\N
aa1b1b9d-b34c-49a5-be39-a47838ded1f6	2023-03-05 12:07:22.824429	33bf182d-1a48-48a3-8bd7-5df4294b0980	\N
b021b326-59c6-4629-a1df-b4f6b6991691	2023-03-05 12:07:22.805163	9e5af818-a120-44e5-84a2-3675505a15fb	\N
bb617f9f-c174-4eb8-aa61-9f9070013790	2023-03-05 12:07:22.827217	cb42b10e-48f9-4542-942b-2c5743724890	\N
cc6b4d76-ae22-4231-8276-1f32e74d385b	2023-03-05 12:07:22.823587	74cdb447-f5c6-4333-8f57-78efaca435f3	\N
cde4b2b5-7f46-4d61-825c-42d79a56b97b	2023-03-05 12:07:22.823762	58140b16-e20b-43df-8b82-dec529b8903d	\N
d409a081-0e32-447f-a132-53c81d8acb3e	2023-03-05 12:07:22.827388	4e64e76b-d57b-4738-afa4-791044559429	\N
da75aadd-f3c7-41f3-8f42-1e0d82316cf8	2023-03-05 12:07:22.827471	12fb7455-f91e-4f77-8958-a72e6b0bcdf6	\N
df45b455-091b-421c-bd60-93563bee154a	2023-03-05 12:07:22.82426	57f48991-121a-4b7c-8c34-51852ca52c30	\N
e111ca3a-66ec-4e56-8d45-4b3d6c9aa7f7	2023-03-05 12:07:22.824765	94f95137-f7ca-4b6e-bd93-1d07e2e0b9ab	\N
e773b99e-3fef-4f66-b410-cc2589d68eab	2023-03-05 12:07:22.825341	eceb4376-dfbb-4b72-b7b8-13ad7eee7568	\N
efc73ce0-b2fc-4bc5-b4ef-5ce7fd7f4b1d	2023-03-05 12:07:22.825991	c77c6c23-3f23-47c5-85e6-9541e2fb97e4	\N
f609b365-7cb4-4cbf-b697-d05e3fb83f62	2023-03-05 12:07:22.826971	71ff1234-f125-44f1-916d-930c72ee36ed	\N
f9b2b980-ce04-4fe4-b92c-c6c2199eebd0	2023-03-05 12:07:22.826485	d251dd79-342b-4898-96a9-fbbba7c76fd5	\N
fc35f335-21b0-424b-b708-fba3a8a294e4	2023-03-05 12:07:22.824853	4e39240d-e518-4e9f-bd8b-3281ee936932	\N
ff7d588f-f8b0-416b-af1e-4becb6008448	2023-03-05 12:07:22.826229	8fbf95e9-f0a6-45b3-a59e-8783d393a2dc	\N
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
018c0595-7b24-4326-9283-c876bbcaa28e	0	2	\N	\N	311d2fde-4fb6-4862-91b6-cb40c5db9e05	\N
01a2bf2d-2444-433d-a845-123b2879b07d	0	1	\N	\N	9bfd60f8-8afd-47ef-a534-aaf6c87a3e88	\N
04ce6e10-368b-4ce5-bfb3-deefc96827aa	0	2	\N	\N	399cfa1b-d25b-4295-b371-10aabacfe45d	\N
0729bbe6-ea95-43ab-a916-2d683892171d	0	3	\N	\N	21b3dfcd-9ff9-4d12-92ed-adceee9aa9b4	\N
078b8aff-2099-4bf1-b2c8-465248f03f50	0	2	\N	\N	0e039094-5347-4c81-b4b7-6098b7aa53a5	\N
08b9b4bb-e562-46d2-9e09-510e9232de50	0	2	\N	\N	3cebf84f-03f3-4afa-be9e-bd6c867b9668	\N
125387d1-96ad-4f12-b6cf-3b7c16b395bc	0	1	\N	\N	b021b326-59c6-4629-a1df-b4f6b6991691	\N
14471066-3122-4ddf-bbe8-9f62b2604abd	0	3	\N	\N	bb617f9f-c174-4eb8-aa61-9f9070013790	\N
1508a08c-62aa-433b-8069-27c578a5bb35	0	1	\N	\N	a7212f36-9288-4741-b5e6-a740a1834c81	\N
150b2367-2e5a-4faa-83aa-fb03b252777c	0	3	\N	\N	955e1182-c102-4dda-af0e-cef5f1135f11	\N
15a4d714-c492-405c-969a-d05c41966288	0	2	\N	\N	9bfd60f8-8afd-47ef-a534-aaf6c87a3e88	\N
170f1a50-95b1-4204-99a4-4870c8d59e98	0	2	\N	\N	5144fc93-cee6-4bd2-9e72-6653a2f9e6cf	\N
1747411b-d84d-469d-8125-0fbf20c87dee	0	2	\N	\N	6afcc34a-47c0-4d16-bbdb-66c863f006fe	\N
1e0a8ac5-f822-483f-8fd0-52213fbe7554	0	1	\N	\N	df45b455-091b-421c-bd60-93563bee154a	\N
1e83b99d-029c-4d43-9102-b4ddb245d2ea	0	2	\N	\N	85225210-7caa-4eca-a747-63259d875c10	\N
2033ac4f-2cb8-4089-b2e1-f7607625cd0f	0	3	\N	\N	aa1b1b9d-b34c-49a5-be39-a47838ded1f6	\N
2392ee12-1f22-475a-81c6-1ab1d5ad2c11	0	1	\N	\N	6c96a1a6-73ce-4a75-8eac-29fe4ce827e0	\N
23e932e4-1481-4ad3-b259-44ff6813adf0	0	2	\N	\N	efc73ce0-b2fc-4bc5-b4ef-5ce7fd7f4b1d	\N
25e20c59-e5ee-4a6f-96d9-303172101c02	0	2	\N	\N	578a9c30-7b9f-4625-be7b-c19f32c3701c	\N
27f98361-9692-43aa-80fb-946e6669f227	0	3	\N	\N	033ec69f-6ce8-4ce1-9b78-b9d1dddc0138	\N
2a08927c-84f8-49cc-8353-44d432491982	0	3	\N	\N	f609b365-7cb4-4cbf-b697-d05e3fb83f62	\N
2b4e4031-ed3c-40e5-bcf0-3b85e39a0eb5	0	1	\N	\N	1261ea5f-cbbf-4993-9457-9bdd0fd45253	\N
2f189b60-07a3-4169-b4c6-867759f8a076	0	1	\N	\N	36b431f2-54f0-4350-8a21-5de1e71411f7	\N
33b2948e-168d-4810-953c-1f592ec161f5	0	1	\N	\N	1f2a4040-07cf-40a0-8d1c-f8969c583d98	\N
342dc522-8028-4a98-9ff4-b7434fe9f7ba	0	1	\N	\N	6afcc34a-47c0-4d16-bbdb-66c863f006fe	\N
35aac1aa-5f0b-44a6-9a3b-07e421f92e70	0	3	\N	\N	69f1b1c8-035a-4b5d-a3b8-c71c26e00a04	\N
379a4938-ea88-4f44-8035-69b0603324ed	0	2	\N	\N	955e1182-c102-4dda-af0e-cef5f1135f11	\N
3f56417a-f98d-4d71-8d29-46c6cf186db5	0	3	\N	\N	b021b326-59c6-4629-a1df-b4f6b6991691	\N
44e74db5-0e7c-48b8-8e46-d8ddbcefecb1	0	1	\N	\N	3c7d4394-e787-4460-b386-92fa1a48837e	\N
44eca111-39a3-4569-bf58-677dfaa40f25	0	1	\N	\N	7f4be6f7-0d13-4e04-a1f8-cb2c20e343a9	\N
45758263-9e8b-4796-8542-81877448fc8e	0	2	\N	\N	a7212f36-9288-4741-b5e6-a740a1834c81	\N
47782bf1-6e34-43b9-a118-26fd585b44f5	0	3	\N	\N	0e039094-5347-4c81-b4b7-6098b7aa53a5	\N
49a696b4-ff5f-40a9-8a30-6ecbe0c15661	0	2	\N	\N	cde4b2b5-7f46-4d61-825c-42d79a56b97b	\N
4c5ce745-1c99-48e5-ad07-9ad88ef4ab81	0	1	\N	\N	6adf71a9-b187-4d81-b8e0-82b8ed284a3e	\N
4c7962e3-1ba5-4c74-af8f-43bbb3e50029	0	1	\N	\N	399cfa1b-d25b-4295-b371-10aabacfe45d	\N
4ddb00a5-9e31-4c14-a8cb-5a0c4540d399	0	2	\N	\N	844ab8bc-9b3c-4aae-b481-379eabef453a	\N
4e561262-1a76-4e95-8257-2ff36031498e	0	3	\N	\N	85225210-7caa-4eca-a747-63259d875c10	\N
50c0564b-039d-4095-a71b-6afdb6c6b3b4	0	1	\N	\N	cc6b4d76-ae22-4231-8276-1f32e74d385b	\N
50eb606a-bac4-4ad0-a3f8-5adde3863ac0	0	2	\N	\N	1f2a4040-07cf-40a0-8d1c-f8969c583d98	\N
52bf70d0-cdcf-4240-8b53-a7c74c59c948	0	3	\N	\N	a043251b-4493-4fd5-a0b8-02d5bf39ac1e	\N
54061e64-7c98-4156-9875-1a7b6c5bc5fa	0	3	\N	\N	d409a081-0e32-447f-a132-53c81d8acb3e	\N
554f9c47-c0e4-49b9-bfd5-c0e3e7b95323	0	2	\N	\N	5f982df1-e57f-4641-9761-f5c35ad17694	\N
5b8ffafb-d094-494d-8b2e-55e20b58343d	0	2	\N	\N	bb617f9f-c174-4eb8-aa61-9f9070013790	\N
5c004b1b-a742-4ecc-9dfb-8ba6cc3b390b	0	3	\N	\N	fc35f335-21b0-424b-b708-fba3a8a294e4	\N
5d122160-37f9-45af-a620-e170b400e36d	0	3	\N	\N	9bfd60f8-8afd-47ef-a534-aaf6c87a3e88	\N
5e7c1f74-d0b9-4661-8be0-51f248dd6e26	0	3	\N	\N	1261ea5f-cbbf-4993-9457-9bdd0fd45253	\N
5efeb11a-cfb1-4042-ad8e-abde512cecc0	0	3	\N	\N	578a9c30-7b9f-4625-be7b-c19f32c3701c	\N
5f4f9c14-2032-439b-9aa3-2a0f46e3414d	0	3	\N	\N	20d4b42d-ce33-43c4-a535-3d93e7c22590	\N
5f6136b3-b2fe-4d62-ab78-86e344acc477	0	2	\N	\N	e111ca3a-66ec-4e56-8d45-4b3d6c9aa7f7	\N
5ff3b780-9750-4f1c-8148-973790f9fd32	0	1	\N	\N	20d4b42d-ce33-43c4-a535-3d93e7c22590	\N
6072d41d-98d4-4215-bd4b-374e41edb8b6	0	2	\N	\N	b021b326-59c6-4629-a1df-b4f6b6991691	\N
60ab1c9b-2725-4b70-83c3-69e74d51c99c	0	1	\N	\N	7e8a3716-258f-4b9d-afbf-fbeca2b83056	\N
636ae560-4ba1-4565-b68e-decf5d0cea86	0	3	\N	\N	da75aadd-f3c7-41f3-8f42-1e0d82316cf8	\N
644c1d76-04ba-46d7-a680-4ba88ff4bdbd	0	3	\N	\N	e773b99e-3fef-4f66-b410-cc2589d68eab	\N
648a1660-6db3-457b-9321-e1dc25f81bec	0	2	\N	\N	69f1b1c8-035a-4b5d-a3b8-c71c26e00a04	\N
6673b9cf-329c-4c37-9baa-3d906fd588e3	0	1	\N	\N	4924f9a5-c966-4f8a-be22-5e8601feefc0	\N
67c17e4e-94c8-4d5e-bceb-191cb7228767	0	1	\N	\N	69f1b1c8-035a-4b5d-a3b8-c71c26e00a04	\N
68aca5aa-a3e7-451b-8048-badc2fc71761	0	2	\N	\N	20d4b42d-ce33-43c4-a535-3d93e7c22590	\N
690eaee9-6941-479c-923e-ad823640a17f	0	3	\N	\N	3cebf84f-03f3-4afa-be9e-bd6c867b9668	\N
69bc54e2-1575-4339-baf9-15ef3a99a560	0	3	\N	\N	df45b455-091b-421c-bd60-93563bee154a	\N
6a083812-14c4-41d9-b0e5-dc64b8189ae8	0	1	\N	\N	e111ca3a-66ec-4e56-8d45-4b3d6c9aa7f7	\N
6c3f1e1e-8491-4da1-ad40-e4810b675e21	0	1	\N	\N	da75aadd-f3c7-41f3-8f42-1e0d82316cf8	\N
6c9af43c-5090-4d62-9cd5-9bb302cd13c4	0	2	\N	\N	78e1f5f0-38a4-43f4-bd62-51ec3a6168cf	\N
6cef30da-1a6c-43f7-a819-636d4a524e60	0	1	\N	\N	5039b673-6826-4ecd-a932-4fe9c3fb69ff	\N
6fa8c7db-9093-41d1-ba66-5b125731ae13	0	1	\N	\N	cde4b2b5-7f46-4d61-825c-42d79a56b97b	\N
7126bfdf-580d-4b95-a3f4-a1545e478bed	0	2	\N	\N	577f7b1b-bb5b-4696-bbde-6b1f0a54e4d4	\N
71f0a05a-3efe-457c-95e5-53ddbc5bee75	0	2	\N	\N	5039b673-6826-4ecd-a932-4fe9c3fb69ff	\N
783115b9-ec29-4e59-9ad1-c304363749e9	0	1	\N	\N	577f7b1b-bb5b-4696-bbde-6b1f0a54e4d4	\N
7b1c6631-9534-411b-9581-d86bc9eeff93	0	3	\N	\N	5f982df1-e57f-4641-9761-f5c35ad17694	\N
7dce0c22-2587-4168-a14e-562d3bc3bcf1	0	1	\N	\N	efc73ce0-b2fc-4bc5-b4ef-5ce7fd7f4b1d	\N
7f3a5bfc-21a8-4a51-93ca-198dd1406ae8	0	3	\N	\N	78e1f5f0-38a4-43f4-bd62-51ec3a6168cf	\N
80404f44-3d4c-4f10-8dde-d2d270d92d92	0	2	\N	\N	21b3dfcd-9ff9-4d12-92ed-adceee9aa9b4	\N
824b884d-9d33-4073-bb9f-dca213f882b1	0	2	\N	\N	7be1bdaf-8422-4426-a242-ce700fdfbcc0	\N
8281805f-9831-48f3-ae9a-dc303ca906cf	0	3	\N	\N	01c48aea-6d06-4150-be9c-7bcef8c7ccee	\N
83e52cba-5821-4f61-bc4e-b21330323771	0	2	\N	\N	f609b365-7cb4-4cbf-b697-d05e3fb83f62	\N
8422440c-3897-4be4-96d5-4350b47d599a	0	2	\N	\N	36b431f2-54f0-4350-8a21-5de1e71411f7	\N
84a4b4fd-f65d-4de8-a38e-9585d6f31547	0	1	\N	\N	f609b365-7cb4-4cbf-b697-d05e3fb83f62	\N
84b069f2-356b-4739-bcf3-809cfcea2d35	0	1	\N	\N	12bde6bf-6746-4b7b-8653-4e4d08ee966b	\N
85d42305-cf51-4a17-9736-4f7065a3634a	0	3	\N	\N	6adf71a9-b187-4d81-b8e0-82b8ed284a3e	\N
87809f03-8f75-4992-9c32-3f84ac419ba2	0	1	\N	\N	e773b99e-3fef-4f66-b410-cc2589d68eab	\N
897883c2-1e51-487b-a3ca-09e25df3ddc7	0	3	\N	\N	7f4be6f7-0d13-4e04-a1f8-cb2c20e343a9	\N
89f684cc-03c5-4115-b4da-9fecbb9cd3f6	0	3	\N	\N	311d2fde-4fb6-4862-91b6-cb40c5db9e05	\N
8add91cd-4dd4-4ded-892b-89e949bc6234	0	1	\N	\N	21b3dfcd-9ff9-4d12-92ed-adceee9aa9b4	\N
8bba0d2e-8c6d-4ed4-b178-8907ba0ccafa	0	1	\N	\N	578a9c30-7b9f-4625-be7b-c19f32c3701c	\N
8c7c6a50-30b9-4507-b193-5aa77cfeeb83	0	2	\N	\N	6adf71a9-b187-4d81-b8e0-82b8ed284a3e	\N
8e9224f4-eaab-4c5b-8c3c-ce05edac893b	0	3	\N	\N	f9b2b980-ce04-4fe4-b92c-c6c2199eebd0	\N
916ec8a1-6cf9-4ddb-a086-e1acb62ffdb2	0	2	\N	\N	f9b2b980-ce04-4fe4-b92c-c6c2199eebd0	\N
926125b6-7e7f-4bbe-a541-514e6797ed15	0	1	\N	\N	75969f43-af29-4e89-9b27-154cf179758c	\N
9282a5d7-6893-44b1-ab38-e6a880b22cd6	0	1	\N	\N	f9b2b980-ce04-4fe4-b92c-c6c2199eebd0	\N
94175dfb-78a8-4c86-b096-9f176e20b857	0	1	\N	\N	04a11fd5-432f-4116-84c1-adb070504975	\N
966008ee-8569-4270-9b13-c2cac83f515b	0	3	\N	\N	1ecfbeaa-59a5-4bb7-97e3-42485fe0a1a7	\N
97520dab-273b-481b-a6e3-380bc9a385e6	0	2	\N	\N	3ab6c017-4889-43fe-8afb-cf58451c2710	\N
980e12e2-4b5a-4af3-8531-368631437646	0	2	\N	\N	12bde6bf-6746-4b7b-8653-4e4d08ee966b	\N
9964ffc0-638c-403c-85a2-eead3e98d0ad	0	3	\N	\N	75969f43-af29-4e89-9b27-154cf179758c	\N
9cf01846-b553-4c37-9c97-edf3d38cce1c	0	2	\N	\N	d409a081-0e32-447f-a132-53c81d8acb3e	\N
9f565be3-0dc4-4c62-9ecd-e2d324f34b18	0	1	\N	\N	311d2fde-4fb6-4862-91b6-cb40c5db9e05	\N
a3bc0a97-739b-49b0-8023-1e2cca828a20	0	3	\N	\N	399cfa1b-d25b-4295-b371-10aabacfe45d	\N
a3d51063-e903-479b-9eb6-ea597a289fbc	0	3	\N	\N	1f2a4040-07cf-40a0-8d1c-f8969c583d98	\N
a4723c1c-f06d-4ecc-848e-87e337f086ec	0	2	\N	\N	04a11fd5-432f-4116-84c1-adb070504975	\N
a66dc0df-623a-4c2d-9fda-9644b84b73aa	0	3	\N	\N	cc6b4d76-ae22-4231-8276-1f32e74d385b	\N
a7143c0c-6b90-465d-bafb-dcd3c33e4b28	0	1	\N	\N	033ec69f-6ce8-4ce1-9b78-b9d1dddc0138	\N
a8a5003d-5e09-466e-a843-54cba3802d23	0	1	\N	\N	bb617f9f-c174-4eb8-aa61-9f9070013790	\N
aa1bb2f3-d6cf-4d94-af51-1083ea17c064	0	2	\N	\N	da75aadd-f3c7-41f3-8f42-1e0d82316cf8	\N
ac3542bf-f07a-48b9-a5d9-844a66d3c083	0	1	\N	\N	5f982df1-e57f-4641-9761-f5c35ad17694	\N
acd1cfd6-4e57-4509-ae03-da64dffb33b6	0	2	\N	\N	1261ea5f-cbbf-4993-9457-9bdd0fd45253	\N
acea8055-5538-4b23-9819-68ab91bdb73b	0	3	\N	\N	7e8a3716-258f-4b9d-afbf-fbeca2b83056	\N
adb36e62-3840-477c-bee3-9ce35972c8e3	0	2	\N	\N	4924f9a5-c966-4f8a-be22-5e8601feefc0	\N
b09855c9-298e-4ffb-b249-864dc1cb0bdf	0	3	\N	\N	5039b673-6826-4ecd-a932-4fe9c3fb69ff	\N
b0e2c9d3-be73-4a9b-bcb8-22ab415aab49	0	1	\N	\N	955e1182-c102-4dda-af0e-cef5f1135f11	\N
b17e9de6-5d0f-496e-b19f-45e5a5298c3c	0	2	\N	\N	cc6b4d76-ae22-4231-8276-1f32e74d385b	\N
b294cb81-f247-4a2b-ae4b-3ca023a31559	0	2	\N	\N	e773b99e-3fef-4f66-b410-cc2589d68eab	\N
b5b30965-1e09-42bd-95ab-f9796707e2f0	0	2	\N	\N	7f4be6f7-0d13-4e04-a1f8-cb2c20e343a9	\N
b6e718e8-b8c5-41c9-b178-62a6bac1caa4	0	1	\N	\N	a043251b-4493-4fd5-a0b8-02d5bf39ac1e	\N
b72cb324-ed0f-4dde-bdee-a21e20f5c4a5	0	3	\N	\N	7be1bdaf-8422-4426-a242-ce700fdfbcc0	\N
b7363e8a-a1f2-4066-abe0-dedb55d91d70	0	1	\N	\N	aa1b1b9d-b34c-49a5-be39-a47838ded1f6	\N
c23f7f31-cc31-4a05-b4b4-5edc9e22ec58	0	2	\N	\N	75969f43-af29-4e89-9b27-154cf179758c	\N
c3333a4c-57b3-4b6a-b3bf-b57ecea26079	0	3	\N	\N	6c96a1a6-73ce-4a75-8eac-29fe4ce827e0	\N
c7553b6a-4c5c-42f7-be5f-95bf44f55071	0	1	\N	\N	d409a081-0e32-447f-a132-53c81d8acb3e	\N
c867c35b-0771-43a0-9bfb-d09e67f23b95	0	2	\N	\N	ff7d588f-f8b0-416b-af1e-4becb6008448	\N
c87dc60a-b93b-46bb-acc0-4f58adafe4bb	0	2	\N	\N	fc35f335-21b0-424b-b708-fba3a8a294e4	\N
c8951c5c-54c5-4ae2-b549-7fd58d81ffd6	0	2	\N	\N	aa1b1b9d-b34c-49a5-be39-a47838ded1f6	\N
c8c01037-a7af-49da-bfba-1adc5c5f1df0	0	1	\N	\N	ff7d588f-f8b0-416b-af1e-4becb6008448	\N
cb8c7c56-613c-4cf2-9a5d-43087cf081b4	0	3	\N	\N	efc73ce0-b2fc-4bc5-b4ef-5ce7fd7f4b1d	\N
cba96a3d-79ff-4548-b3b0-b3699956c7f3	0	1	\N	\N	01c48aea-6d06-4150-be9c-7bcef8c7ccee	\N
ce870479-d188-47d2-8eb6-fbc2e8ff99ee	0	2	\N	\N	033ec69f-6ce8-4ce1-9b78-b9d1dddc0138	\N
d1795a8a-00c7-49bc-b392-f70b870b7c3c	0	1	\N	\N	85225210-7caa-4eca-a747-63259d875c10	\N
d2dffc02-ba6f-45e3-ac33-a2b72e01611a	0	1	\N	\N	5144fc93-cee6-4bd2-9e72-6653a2f9e6cf	\N
d40117bb-a6ee-47f2-b17d-c35ccc6699e8	0	3	\N	\N	36b431f2-54f0-4350-8a21-5de1e71411f7	\N
d6e5735f-4a60-49db-8026-0534ab995a59	0	1	\N	\N	fc35f335-21b0-424b-b708-fba3a8a294e4	\N
d8d4ab2e-451c-4ff9-9224-a873868771d4	0	1	\N	\N	844ab8bc-9b3c-4aae-b481-379eabef453a	\N
d90e25d5-e7a1-4f18-98b6-94b7f6a51ff5	0	3	\N	\N	12bde6bf-6746-4b7b-8653-4e4d08ee966b	\N
d91948b7-7233-4be8-8bde-c7fe536667dd	0	1	\N	\N	78e1f5f0-38a4-43f4-bd62-51ec3a6168cf	\N
db48f787-5157-45dd-ba41-0455386f4dee	0	2	\N	\N	01c48aea-6d06-4150-be9c-7bcef8c7ccee	\N
dd529fb7-18a6-4ff7-8810-19adb6b0171b	0	3	\N	\N	577f7b1b-bb5b-4696-bbde-6b1f0a54e4d4	\N
dd69d0f7-c4d7-49b0-bdc1-02ee4a147487	0	1	\N	\N	3cebf84f-03f3-4afa-be9e-bd6c867b9668	\N
dd8ff255-1035-4973-a8c4-150d6336fa06	0	3	\N	\N	5144fc93-cee6-4bd2-9e72-6653a2f9e6cf	\N
df010ea3-fca2-4179-9c20-3c13b6df7ae9	0	3	\N	\N	3c7d4394-e787-4460-b386-92fa1a48837e	\N
df8b032f-6d28-43f8-89c3-f41b86fd6a34	0	3	\N	\N	3ab6c017-4889-43fe-8afb-cf58451c2710	\N
e0289e02-5274-4c22-b49d-2d757c3a92d1	0	2	\N	\N	a043251b-4493-4fd5-a0b8-02d5bf39ac1e	\N
e05c6e3d-9bb3-41b6-93dc-8dac0a6d0d0b	0	2	\N	\N	7e8a3716-258f-4b9d-afbf-fbeca2b83056	\N
e1066510-6d61-4242-af93-a90a9f0c8f9d	0	1	\N	\N	1ecfbeaa-59a5-4bb7-97e3-42485fe0a1a7	\N
e2a6db3a-470d-4496-a3d1-3305aa14e842	0	2	\N	\N	1ecfbeaa-59a5-4bb7-97e3-42485fe0a1a7	\N
e5586a08-c950-4454-9964-707160cc7bcd	0	3	\N	\N	6afcc34a-47c0-4d16-bbdb-66c863f006fe	\N
e69c3eaa-f6c6-4b1b-8765-7f29cc0c5f17	0	2	\N	\N	3c7d4394-e787-4460-b386-92fa1a48837e	\N
e6be3a9b-4c35-4c96-afd0-5faff1deed46	0	3	\N	\N	844ab8bc-9b3c-4aae-b481-379eabef453a	\N
ebd09639-c32b-4b43-8fd9-cc0f9771ddd7	0	3	\N	\N	a7212f36-9288-4741-b5e6-a740a1834c81	\N
ed23e5de-c627-4d8d-a312-d1d3a4ad88a8	0	3	\N	\N	cde4b2b5-7f46-4d61-825c-42d79a56b97b	\N
eee02cf5-85a0-4af2-b421-430753513811	0	2	\N	\N	df45b455-091b-421c-bd60-93563bee154a	\N
f12578cb-512c-4996-9f75-d6a1bdb7f060	0	3	\N	\N	e111ca3a-66ec-4e56-8d45-4b3d6c9aa7f7	\N
f1b1f971-696f-43a8-a77b-88562e63f994	0	1	\N	\N	7be1bdaf-8422-4426-a242-ce700fdfbcc0	\N
f5f8d7a8-8c70-4a77-aec7-b297c693dda9	0	2	\N	\N	6c96a1a6-73ce-4a75-8eac-29fe4ce827e0	\N
f6a71d6b-5ef9-4150-984c-97c07ff0090e	0	3	\N	\N	ff7d588f-f8b0-416b-af1e-4becb6008448	\N
f79eab46-6c60-47f5-b17a-76644d5c5cd2	0	1	\N	\N	0e039094-5347-4c81-b4b7-6098b7aa53a5	\N
f8f99a35-724b-46c6-8bd5-4f07bd48f366	0	1	\N	\N	3ab6c017-4889-43fe-8afb-cf58451c2710	\N
f951df6b-a78c-49e3-ba67-a02595adcccc	0	3	\N	\N	4924f9a5-c966-4f8a-be22-5e8601feefc0	\N
fcc0f79a-7366-41c3-9d30-7e671af2496c	0	3	\N	\N	04a11fd5-432f-4116-84c1-adb070504975	\N
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
084284f3-3898-41d1-8bd4-7cc27791b6a6	57	400	t	f	66ac54d8-990a-4991-86f9-f62ab2fd8059	695cbb73-03c0-4635-8e8c-46109d0b3de0	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
08e9ae93-79b3-43ec-8104-5ff3ef97b281	58	900	t	f	b2cf59af-4e75-4681-aeca-092f74afb449	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
12fb7455-f91e-4f77-8958-a72e6b0bcdf6	52	1200	t	f	ebda0cea-a5f5-4eb7-8624-28639ddeada8	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
1b8b7950-e4ce-4c7c-8477-986c21b8189d	18	4000	t	f	9e28b61a-8af1-459a-9613-e6561bda4a44	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
1de0f8f2-1e21-4b31-8fd1-073386771031	39	280	t	f	b6ce4daa-c2d4-4736-9d41-6431050be88d	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
26e78bc2-1d02-4271-aff9-66b3df211354	39	280	t	f	429c297a-4e71-421b-9841-f33337cb3a50	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
27983d69-7f55-4538-a416-095679119a86	2	1880	t	f	88440a72-88cf-45f9-9686-ca1aedefe9fb	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
29325ecf-6536-4121-9888-b8e54fb88d61	54	400	t	f	b2cf59af-4e75-4681-aeca-092f74afb449	11da2440-41fe-48cc-9492-ca38545de087	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
294be175-9ab9-474e-9653-5a4192458ad1	58	900	t	f	66ac54d8-990a-4991-86f9-f62ab2fd8059	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
33bf182d-1a48-48a3-8bd7-5df4294b0980	2	1880	t	f	4ab8c53c-4179-4c2b-ba92-04ebc2152b24	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
465df89a-1bac-4877-99c3-0a3c93e904f6	18	4000	t	f	429c297a-4e71-421b-9841-f33337cb3a50	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
4c31ba3f-6c60-4b84-8138-7972c2a15ac6	55	400	t	f	a7e250b4-a7d2-4719-a151-b4d590dff2f3	5a94e104-4b62-4d62-be13-b9a5763b1021	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
4d78121f-6e60-4d8a-9e97-8a250c2a97d5	56	400	t	f	2cad4fd4-2e47-4d86-b836-a31d3470e52a	088ae2f5-af0c-4b2d-99dd-5f8c0e7519ca	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
4e39240d-e518-4e9f-bd8b-3281ee936932	39	280	t	f	60e289fb-de3d-45e2-8897-bb3b4f58604d	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
4e64e76b-d57b-4738-afa4-791044559429	52	1200	t	f	ea78d843-7940-499c-8d6f-4a3518861772	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
575c0927-fd26-4594-8d57-1549a6f501e7	18	4000	t	f	0705dfdc-a718-4980-9394-c2f530cd502f	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
57f48991-121a-4b7c-8c34-51852ca52c30	54	400	t	f	454d2d8a-32b1-4064-a648-19566e87c2ae	11da2440-41fe-48cc-9492-ca38545de087	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
58140b16-e20b-43df-8b82-dec529b8903d	52	1200	t	f	17aef579-9a56-482d-857d-9fab32fcb448	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
584d693c-a402-4178-a8b2-5790f03e87a0	18	4000	t	f	60e289fb-de3d-45e2-8897-bb3b4f58604d	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
591f61db-8f65-442b-a396-0ae59864b86e	2	1880	t	f	d3de4df8-a509-4693-a52d-4ffa156a4d8e	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
598e788b-67bf-40db-9f2c-d6c76f56cee5	58	900	t	f	58cd394e-acac-454f-8c32-f0179c872b4f	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
5b6bff27-93ad-473f-bd36-d124fc7ad0eb	52	1200	t	f	fc435124-9e0e-4e4b-9ac4-b79cf2a4d19c	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
61be4824-e4e5-422a-8337-0e2206b26c2b	58	900	t	f	7676faff-91d0-40e2-9e23-69644f72c836	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
63536e66-f57c-4495-a634-d26abf7a956c	2	1880	t	f	7793c56b-2801-40d4-926f-4617d7a98263	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
6f8a92fc-3241-4bb2-8ef6-03fccdb4dedf	1	1900	t	f	ba4ab0c7-afae-4d60-91fe-0269bccfe1b0	403c79a6-4d77-4835-bc37-90331d1d0fff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
71ff1234-f125-44f1-916d-930c72ee36ed	1	1900	t	f	d3de4df8-a509-4693-a52d-4ffa156a4d8e	403c79a6-4d77-4835-bc37-90331d1d0fff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
7343d705-d937-44a6-8688-4e0f0c0d3765	39	280	t	f	83dba3d4-c5d3-458f-84c9-3947a1a64989	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
74cdb447-f5c6-4333-8f57-78efaca435f3	39	280	t	f	10e32ec9-aa49-4425-b866-0cf4b88658f5	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
814f0785-5de9-4d11-a42d-16570cf16e68	1	1900	t	f	7793c56b-2801-40d4-926f-4617d7a98263	403c79a6-4d77-4835-bc37-90331d1d0fff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
8da97bbc-bed3-47a1-9976-a7841bb19bf3	2	1880	t	f	a8f3ecc8-8f38-4569-8744-56c9eb35d4f3	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
8ed1b5ba-2660-4919-a13f-a7d8879d699a	52	1200	t	f	5bc1cc55-7c3f-4012-9739-41a7ba0da8d3	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
8fbf95e9-f0a6-45b3-a59e-8783d393a2dc	58	900	t	f	a7e250b4-a7d2-4719-a151-b4d590dff2f3	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
90410e9b-e1d9-42cf-9a68-e4bfe35770f2	48	1900	t	f	42a88d64-40e7-49a6-9660-853393d555a1	b1dc2918-a884-45c0-a5ed-d72117d47dcb	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
94f95137-f7ca-4b6e-bd93-1d07e2e0b9ab	48	1900	t	f	5e5b91d6-3c85-4f8d-a682-9cb8d0b71155	b1dc2918-a884-45c0-a5ed-d72117d47dcb	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
9c14f85d-02bb-442e-a631-5bca017a00c8	18	4000	t	f	61f0de40-1dfa-4e07-96f1-fdc33b15e84f	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
9e5af818-a120-44e5-84a2-3675505a15fb	1	1900	t	f	047801d7-4f39-41c1-90da-03a0d3d18b07	403c79a6-4d77-4835-bc37-90331d1d0fff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
9f330447-21f1-4043-93b5-be11f3e8ebda	2	1880	t	f	d86c0eb3-7041-4433-aab6-255a86f5e716	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
a6471ab4-3742-4485-b301-af55853fa0f8	39	280	t	f	8cebe317-ea1a-41c7-8cc2-8ffb15b56b64	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
bafe5565-04ad-44a2-b5f6-2300631aee1e	58	900	t	f	2cad4fd4-2e47-4d86-b836-a31d3470e52a	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
c6c59afc-891e-4383-a68b-4631e6d104e9	52	1200	t	f	e2028bf1-22d1-4967-bc60-10af376ff152	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
c77c6c23-3f23-47c5-85e6-9541e2fb97e4	39	280	t	f	9e28b61a-8af1-459a-9613-e6561bda4a44	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
cb42b10e-48f9-4542-942b-2c5743724890	39	280	t	f	d939e569-ad99-49eb-af70-063a80d46195	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
d251dd79-342b-4898-96a9-fbbba7c76fd5	58	900	t	f	b2155b24-c782-483b-a9c1-2bb07d01e183	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
d60564da-b2f5-42e1-9fda-82a585958cf2	39	280	t	f	16a903a6-cf82-4617-95fe-56bd445060c1	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
d715afff-f165-4cf8-8c06-e75ae7039eaa	2	1880	t	f	ba4ab0c7-afae-4d60-91fe-0269bccfe1b0	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
dcfa5323-8e16-46a1-bb4b-0d9896e607ed	55	400	t	f	b2155b24-c782-483b-a9c1-2bb07d01e183	5a94e104-4b62-4d62-be13-b9a5763b1021	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
de84819c-ff20-4bdb-8534-57a127fcc4b0	58	900	t	f	454d2d8a-32b1-4064-a648-19566e87c2ae	b4a0ad26-4952-408d-941d-81b618cedbad	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
e3bb2cbb-c2d4-47e2-99d5-a2c7edfb40b7	18	4000	t	f	8cebe317-ea1a-41c7-8cc2-8ffb15b56b64	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
eceb4376-dfbb-4b72-b7b8-13ad7eee7568	56	400	t	f	7676faff-91d0-40e2-9e23-69644f72c836	088ae2f5-af0c-4b2d-99dd-5f8c0e7519ca	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
f83fb281-01e4-42d3-8a14-1d3d64ad9b18	2	1880	t	f	047801d7-4f39-41c1-90da-03a0d3d18b07	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
f8642560-5df9-49a2-9c8f-213165a5b143	39	280	t	f	6f2f47c9-3e1f-4a9e-a888-c2dbb6eec47a	ea5a779b-aab8-4540-8207-1ffcac599218	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
feaf787a-76f7-4f94-86d5-61e0bded33f5	57	400	t	f	58cd394e-acac-454f-8c32-f0179c872b4f	695cbb73-03c0-4635-8e8c-46109d0b3de0	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
088ae2f5-af0c-4b2d-99dd-5f8c0e7519ca	56	Инструкция 56	56
11da2440-41fe-48cc-9492-ca38545de087	54	Инструкция 54	54
35a43103-21d3-4f16-a8fd-63e09d0fd255	18	Инструкция 18	18
403c79a6-4d77-4835-bc37-90331d1d0fff	1	Инструкция 1	1
5a94e104-4b62-4d62-be13-b9a5763b1021	55	Инструкция 55	55
5e2a1424-17f2-47fc-8f58-d92d1a480d9f	2	Инструкция 2	2
695cbb73-03c0-4635-8e8c-46109d0b3de0	57	Инструкция 57	57
b1dc2918-a884-45c0-a5ed-d72117d47dcb	48	Инструкция 48	48
b4a0ad26-4952-408d-941d-81b618cedbad	58	Инструкция 58	58
ea5a779b-aab8-4540-8207-1ffcac599218	39	Инструкция 39	39
f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	52	Инструкция 52	52
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
23c10db8-220f-4d8a-b049-6a7184be25cc	75131-2801300-20	Поперечина рамы задняя	\N	2868425
d0cacb7d-1a8d-47ae-8dda-b097ddb52b1c	7513D-2800010-20	Рама	\N	3330041
d6467a1b-3f7f-4cb3-8698-52f3ec0bdb29	75131-2800010-70	Рама	\N	3291137
\.


--
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserRoles" ("UserId", "RoleId") FROM stdin;
eea6f775-72c5-468d-a12e-657739f07bd9	2eeaa9d1-fedb-45ef-9868-9234cc8a3fd6
f1824810-c535-4b0f-996c-45c821106a87	2eeaa9d1-fedb-45ef-9868-9234cc8a3fd6
15221781-a87b-4aba-8580-6fe87dabdc83	8aed4864-5401-4214-aecf-222a8fe64850
de2379dc-974c-4c9b-abae-316488c1790e	8aed4864-5401-4214-aecf-222a8fe64850
e8f8b59f-d20e-4b47-9ae0-3134c267b29b	8aed4864-5401-4214-aecf-222a8fe64850
4e24fc46-176f-4bc2-a52a-07e8843b6ebd	2520a9e4-36a8-4658-aa9e-c457240a938b
58a1e9f1-7d85-43ec-b53f-630bd2959e58	2520a9e4-36a8-4658-aa9e-c457240a938b
749d723d-8faa-4798-b8a1-117a7aff13ff	2520a9e4-36a8-4658-aa9e-c457240a938b
86ac12f1-08ca-446d-ad10-297cdf1d9e1a	2520a9e4-36a8-4658-aa9e-c457240a938b
94635442-4b2d-4878-9fee-541412080714	2520a9e4-36a8-4658-aa9e-c457240a938b
c4b2b1fe-cd33-40ff-92cd-706a4c975f81	2520a9e4-36a8-4658-aa9e-c457240a938b
cf23f92f-017a-41c7-a350-d6795eb6e533	2520a9e4-36a8-4658-aa9e-c457240a938b
feb40994-5d4d-428a-953e-e5aa42447b58	2520a9e4-36a8-4658-aa9e-c457240a938b
c6cca739-0298-4d02-901a-3d865b804f03	6c149511-9e31-4e3e-a1e5-6345656ab20a
578379dc-6028-4de9-8ed3-25a1e5a9e792	875b9130-9c23-4ff6-a5ab-f6663c228a6b
bdaf8aef-73ac-4689-8027-d7af0cc2e8d8	2520a9e4-36a8-4658-aa9e-c457240a938b
16b88700-5231-424b-916e-729f91297941	2eeaa9d1-fedb-45ef-9868-9234cc8a3fd6
65ac0523-abfb-4d4f-8425-0911ca8c7112	6c149511-9e31-4e3e-a1e5-6345656ab20a
ae78f31f-350c-4d8a-af9f-3365e83bfc77	8aed4864-5401-4214-aecf-222a8fe64850
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "RfidTag", "ProductionAreaId", "IdFromSystem") FROM stdin;
eea6f775-72c5-468d-a12e-657739f07bd9	Екатерина	Сергеевна	Грук	\N	\N	\N	Контролер сварочных работ	49550	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
f1824810-c535-4b0f-996c-45c821106a87	Мария	Николаевна	Шабалинская	\N	\N	\N	Контролер сварочных работ	19379	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
15221781-a87b-4aba-8580-6fe87dabdc83	Геннадий	Александрович	Алёксов	\N	\N	\N	Мастер производственного участка	14962	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
de2379dc-974c-4c9b-abae-316488c1790e	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
e8f8b59f-d20e-4b47-9ae0-3134c267b29b	Сергей	Николаевич	Беляцкий	\N	\N	\N	Мастер производственного участка	10422	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
4e24fc46-176f-4bc2-a52a-07e8843b6ebd	Валерий	Сергеевич	Зубковский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	97:17:60:B4	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
58a1e9f1-7d85-43ec-b53f-630bd2959e58	Василий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	B7:5A:79:B5	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
749d723d-8faa-4798-b8a1-117a7aff13ff	Максим	Александрович	Костюкевич	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	67:CD:7E:5A	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
86ac12f1-08ca-446d-ad10-297cdf1d9e1a	Сергей	Анатольевич	Казачёнок	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	67:5A:70:B4	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
94635442-4b2d-4878-9fee-541412080714	Владимир	Францевич	Виторский	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	D7:95:55:B4	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
c4b2b1fe-cd33-40ff-92cd-706a4c975f81	Виталий	Владимирович	Казинец	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	D7:F1:7D:5A	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
cf23f92f-017a-41c7-a350-d6795eb6e533	Александр	Васильевич	Михейчик	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	27:45:7E:B4	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
feb40994-5d4d-428a-953e-e5aa42447b58	Юрий	Сергеевич	Буландо	\N	\N	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	17:CD:7F:5A	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
c6cca739-0298-4d02-901a-3d865b804f03	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	RFID метка начальника цеха 1	\N	\N
578379dc-6028-4de9-8ed3-25a1e5a9e792	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	$MYHASH$V1$10000$WAdmY3NdPMBRDdoF9LP3BdNwTs/xQiyNuOWYFulrb4quxWPG	\N	\N	\N	\N	\N	\N
bdaf8aef-73ac-4689-8027-d7af0cc2e8d8	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	$MYHASH$V1$10000$hA/WbZgNbuctqroAM5ENU9M2BLJuJ8+DqrlX6OHVwd1EfwxE	\N	\N	\N	\N	\N	\N
16b88700-5231-424b-916e-729f91297941	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	$MYHASH$V1$10000$h1F5HdPNG/pIGQjVa0yLbof8e3nocsB/gtvrkVLKP2CV7m/S	\N	\N	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
65ac0523-abfb-4d4f-8425-0911ca8c7112	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	$MYHASH$V1$10000$G6e/Cv0ArMkm0zupRFQYDdMs0Go0tezZ+82xEPokjw7eNGpp	\N	\N	\N	\N	\N	\N
ae78f31f-350c-4d8a-af9f-3365e83bfc77	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	$MYHASH$V1$10000$jROs2lYCEkXWpkRv8cmD6Veu+76iT0jL8fQhEOn8W+aO5JT6	\N	\N	\N	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
09698621-b450-4930-9bce-6285b6d6cd03	1	Заполняющий	230	270	23	26	\N	\N	35a43103-21d3-4f16-a8fd-63e09d0fd255	\N
453c43f6-5408-4e9e-a8a2-9a37bdc10eba	1	Заполняющий	230	270	23	26	\N	\N	11da2440-41fe-48cc-9492-ca38545de087	\N
4b64c218-2b7b-4429-a0f6-2748adb59025	1	Заполняющий	230	270	23	26	\N	\N	695cbb73-03c0-4635-8e8c-46109d0b3de0	\N
60ff61da-1598-497b-9fb9-be86d96a4aeb	1	Заполняющий	230	270	23	26	\N	\N	5e2a1424-17f2-47fc-8f58-d92d1a480d9f	\N
7bd1354d-234a-43c4-b757-8e36b88db812	1	Заполняющий	230	270	23	26	\N	\N	b4a0ad26-4952-408d-941d-81b618cedbad	\N
9025ca30-fde4-465b-83aa-ae1bbe078548	1	Заполняющий	230	270	23	26	\N	\N	403c79a6-4d77-4835-bc37-90331d1d0fff	\N
b0a0ee36-6e86-4277-9f32-378bc33e56af	1	Заполняющий	230	270	23	26	\N	\N	ea5a779b-aab8-4540-8207-1ffcac599218	\N
ebd95191-3dc9-4d12-a3b3-eed48bdd3ddb	1	Заполняющий	230	270	23	26	\N	\N	b1dc2918-a884-45c0-a5ed-d72117d47dcb	\N
efa3a7f5-1b58-4be3-ae44-fd0b7f3d8a08	1	Заполняющий	230	270	23	26	\N	\N	088ae2f5-af0c-4b2d-99dd-5f8c0e7519ca	\N
f88ae214-4387-48b5-9632-fca41a687bb2	1	Заполняющий	230	270	23	26	\N	\N	f45f66a2-9ae4-417d-a61f-56d2b4b5c2ff	\N
fd58d217-8e9c-4191-a5a9-4c069418e522	1	Заполняющий	230	270	23	26	\N	\N	5a94e104-4b62-4d62-be13-b9a5763b1021	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
637bd5a5-fab4-45c9-88fe-b8993a591be9	2	Заполняющий	100	0.22	0.44	\N	\N	\N	bd596187-8a5c-4b85-9dfd-36b557e78eb1	1482f5d2-ff02-4e80-96aa-6648ad65f636	\N
6e57a9ef-fc9a-4196-9a3e-3fb6abe623ae	2	Заполняющий	100	0.22	0.44	\N	\N	\N	bd8e77a9-c9e8-4ab4-848d-841d9a1a986f	72370758-89cc-45f1-bc9e-8ad1198bdc6d	\N
d45456be-2777-4f01-a61f-d3c29b1f7759	1	Корневой	82	0.11	0.68	\N	\N	\N	d3fd5593-7e84-4f8e-a20c-abae0b3a7bf7	72370758-89cc-45f1-bc9e-8ad1198bdc6d	\N
df12df22-0198-4351-9485-7b4fccfb62fc	1	Корневой	82	0.11	0.68	\N	\N	\N	76ff4fb4-b695-4293-ae32-9f899d0ef42a	1482f5d2-ff02-4e80-96aa-6648ad65f636	\N
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
33159f42-23ce-496f-a90f-371ddb12c619	831d4098-aa04-45f6-8bd5-fba1443ced12
3e0c7adc-b844-43b9-b7b0-66d9545bc1e6	3b71f550-7852-45c4-a214-245d8cf73342
5e6c8b7a-e7ce-42b4-82c7-0d4b24f59a76	079fd360-4022-45eb-80f4-629e4fa3eede
5e6c8b7a-e7ce-42b4-82c7-0d4b24f59a76	5970620a-f49c-4e09-b7d6-4d1a9a5c58c9
91fe953f-4191-4000-9728-a61c1e7f64c5	079fd360-4022-45eb-80f4-629e4fa3eede
91fe953f-4191-4000-9728-a61c1e7f64c5	5970620a-f49c-4e09-b7d6-4d1a9a5c58c9
a7f95d90-ef36-49c1-8020-394a4674c3f2	831d4098-aa04-45f6-8bd5-fba1443ced12
b1888ac2-3655-4437-94ff-670aa3e1640c	3b71f550-7852-45c4-a214-245d8cf73342
e779b321-bf3f-47d3-996d-203347633395	079fd360-4022-45eb-80f4-629e4fa3eede
e779b321-bf3f-47d3-996d-203347633395	5970620a-f49c-4e09-b7d6-4d1a9a5c58c9
edaf6f9b-0730-4c05-b0a0-07a0a730b196	079fd360-4022-45eb-80f4-629e4fa3eede
edaf6f9b-0730-4c05-b0a0-07a0a730b196	5970620a-f49c-4e09-b7d6-4d1a9a5c58c9
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
33159f42-23ce-496f-a90f-371ddb12c619	94635442-4b2d-4878-9fee-541412080714	\N	132695
3e0c7adc-b844-43b9-b7b0-66d9545bc1e6	86ac12f1-08ca-446d-ad10-297cdf1d9e1a	\N	117390
5e6c8b7a-e7ce-42b4-82c7-0d4b24f59a76	c4b2b1fe-cd33-40ff-92cd-706a4c975f81	\N	114729
91fe953f-4191-4000-9728-a61c1e7f64c5	feb40994-5d4d-428a-953e-e5aa42447b58	\N	150882
a7f95d90-ef36-49c1-8020-394a4674c3f2	749d723d-8faa-4798-b8a1-117a7aff13ff	\N	122575
b1888ac2-3655-4437-94ff-670aa3e1640c	58a1e9f1-7d85-43ec-b53f-630bd2959e58	\N	121267
e779b321-bf3f-47d3-996d-203347633395	cf23f92f-017a-41c7-a350-d6795eb6e533	\N	146164
edaf6f9b-0730-4c05-b0a0-07a0a730b196	4e24fc46-176f-4bc2-a52a-07e8843b6ebd	\N	150838
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
079fd360-4022-45eb-80f4-629e4fa3eede	1aefed04-ef9d-4199-bfe7-74d6a4055725
079fd360-4022-45eb-80f4-629e4fa3eede	ad3e8df5-6292-4da7-9a27-a748cbfd3baa
079fd360-4022-45eb-80f4-629e4fa3eede	de32277d-5dd1-4994-bbc4-0da68d9ce572
079fd360-4022-45eb-80f4-629e4fa3eede	ef7ded0c-ea93-4900-888e-7d3c82737b76
3b71f550-7852-45c4-a214-245d8cf73342	01ebcbfc-c0ba-425f-9a30-d1feb5c98dd2
3b71f550-7852-45c4-a214-245d8cf73342	ad3e8df5-6292-4da7-9a27-a748cbfd3baa
5970620a-f49c-4e09-b7d6-4d1a9a5c58c9	1aefed04-ef9d-4199-bfe7-74d6a4055725
5970620a-f49c-4e09-b7d6-4d1a9a5c58c9	ad3e8df5-6292-4da7-9a27-a748cbfd3baa
5970620a-f49c-4e09-b7d6-4d1a9a5c58c9	de32277d-5dd1-4994-bbc4-0da68d9ce572
5970620a-f49c-4e09-b7d6-4d1a9a5c58c9	ef7ded0c-ea93-4900-888e-7d3c82737b76
831d4098-aa04-45f6-8bd5-fba1443ced12	1aefed04-ef9d-4199-bfe7-74d6a4055725
831d4098-aa04-45f6-8bd5-fba1443ced12	8043d1c8-a6fd-434b-9ba7-eb6c77e11f0a
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "RfidTag", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem") FROM stdin;
079fd360-4022-45eb-80f4-629e4fa3eede	A6:F1:CF:48	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	0ec996bc-b4d3-47b5-9da8-029c4b26337b	49283
3b71f550-7852-45c4-a214-245d8cf73342	03:3D:93:0D	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	0ec996bc-b4d3-47b5-9da8-029c4b26337b	49232
5970620a-f49c-4e09-b7d6-4d1a9a5c58c9	93:57:D8:0B	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	0ec996bc-b4d3-47b5-9da8-029c4b26337b	49141
831d4098-aa04-45f6-8bd5-fba1443ced12	35:4E:AC:A5	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	0ec996bc-b4d3-47b5-9da8-029c4b26337b	49286
\.


--
-- Data for Name: WeldingRecords; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingRecords" ("Id", "Date", "WeldingStartTime", "WeldingEndTime", "WeldingCurrentValues", "ArcVoltageValues", "WeldingEquipmentId", "WelderId", "MasterId", "IdFromSystem") FROM stdin;
76ff4fb4-b695-4293-ae32-9f899d0ef42a	2023-03-05 12:07:22.598339	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	079fd360-4022-45eb-80f4-629e4fa3eede	b1888ac2-3655-4437-94ff-670aa3e1640c	0ec996bc-b4d3-47b5-9da8-029c4b26337b	\N
bd596187-8a5c-4b85-9dfd-36b557e78eb1	2023-03-05 12:07:22.598411	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	079fd360-4022-45eb-80f4-629e4fa3eede	b1888ac2-3655-4437-94ff-670aa3e1640c	0ec996bc-b4d3-47b5-9da8-029c4b26337b	\N
bd8e77a9-c9e8-4ab4-848d-841d9a1a986f	2023-03-05 12:07:22.598481	19:43:13	19:43:58	{53.3,52.7,53,53,52.7,52.7,52.7,53,54,101.3,102.7,100.3,100.6,102.7,100.6,100.3,100.3,100.3,100.6,100.3,100.3,100.3,100.3,100.3,100.3,100.3,102.7,100.6,100.6,100.3,100.6,100,100.3,100.3,100.6,100.6,100.3,100,100.3,101,102.3,100.3,100,102.3,100.3,100.3,100.3,100,100,100,100,100.3,100.6,99.6,99.6,100,102.3,100,100,99.6,100,100,100,100,100,100,100,100,99.6,100.6,102,100,100,102,100.3,100,99.6,99.6,99.6,100,99.6,175,178,178.3,178.3,178.3,178.3,178.3,178.3,178.3,178.7,178.7,178.7,179,179,179,179,179,178.7,179,179,178.7,178.7,178.7,178.7,178.3,178.7,178.7,178.3,178.7,178.3,178.7,178.3,178.3,178.3,178.3,178.3,178.7,178.3,178.3,178.3,177,162.1,156.69,157,156.69,156.69,156.4,156.4,156.4,156,156.4,156.4,156.69,156,156,156.4,156.4,156.69,156,156.4,156.69,156.4,156.4,156.4,156.4,156.4,156,155.69,156,156,156.4,156,156,155.69,156,156,156,156.4,156,156,156,156,156.4,155.69,155.69,156,155.69,156,155.4,155.4,156,156.4,146.9,114.5,116.8,114.1,119.2,138.5,138.5,138.8,138.5,138.5,138.5,138.8,138.8,138.5,138.5,138.5,138.5,138.5,138.5,138.5,138.1,138.1,138.1,138.5,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,138.1,137.8,123.6,113.8,115.8,115.2,113.5,116.2,113.8,116.2,113.5,113.5,113.5,116.2,113.5,113.8,116.2,113.5,116.5,113.8,113.8,113.1,113.5,116.2,113.5,113.1,113.5,113.5,113.8,113.5,113.8,113.1,113.5,115.8,115.2,113.5,113.1,113.1,113.5,113.8,113.5,113.1,113.8,113.1,115.8,113.1,113.1,113.1,113.1,113.1,113.5,112.8,113.1,113.1,113.1,113.1,115.8,112.8,112.8,113.1,113.1,112.8,113.1,112.8,113.1,113.1,113.1,112.8,115.2,112.8,112.5,115.2,112.8,112.8,112.8,112.5,112.8,112.8,112.5,112.8,114.8,120.9,122.2,122.2,122.2,122.2,122.2,122.2,122.2,122.6,122.2,122.2,122.2,122.2,122.6,122.2,116.2,112.1,112.1,112.5,114.5,112.5,112.5,114.5,112.1,112.5,112.5,112.1,112.1,112.1,112.5,111.8,112.5,112.1,112.1,112.1,114.5,113.1,112.1,111.8,112.1,111.8,111.8,112.1,112.1,112.1,111.8,111.8,112.5,112.5,114.5,111.8,112.1,114.5,112.5,111.8,112.1,112.1,112.5,112.5,111.8,112.1,111.8,111.8,112.1,111.8,114.5,113.1,111.4,111.8,111.8,111.8,111.8,111.4,111.8,111.4,111.8,111.4,111.4,111.4,114.1,111.8,111.4,114.1,111.8,111.8,111.8,112.1,112.1,111.8,111.4,111.4,111.4,111.4,111.8,111.8,113.8,112.5,111.4,111.8,111.8,111.4,111.4,111.4,111.8,111.1,111.1,111.8,111.8,121.2,120.9,121.2,120.9,121.2,121.2,120.9,120.9,120.9,120.9,120.9,120.9,120.6,115.5,111.4,111.4,111.4,111.1,110.8,111.1,111.8,113.8,111.4,111.1,113.1,111.1,111.1,111.4,111.8,110.8,110.8,110.8,111.1,110.4,110.8,130.69,134.69,134.4,134.69,113.5,53,52,51,51.6,52.3,51,51.6,51.6,51,51.3,51.3,51.6}	{79.2,78.7,78.7,78.9,78.2,78.09,78.09,78.7,77.7,51.3,52,50.9,50.9,52,50.9,50.9,50.9,50.8,50.9,50.8,50.9,50.8,50.9,50.8,50.8,50.9,51.9,50.9,51,50.9,51,50.9,50.9,50.8,50.9,50.9,51,50.7,50.8,51.1,51.8,50.8,50.9,51.9,50.9,50.9,50.9,50.8,50.9,50.7,50.8,50.9,51,50.8,50.8,50.7,51.8,50.9,50.8,50.7,50.8,50.9,50.8,50.9,51,50.9,50.9,50.8,50.9,51.2,52.1,51,51,51.9,51,50.9,51,50.9,50.9,50.9,50.9,40.7,40.4,40.5,40.4,40.29,40.29,40.29,40.4,40.4,40.29,40.4,40.4,40.4,40.5,40.4,40.6,40.4,40.5,40.4,40.4,40.5,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.4,40.5,40.5,40.5,40.4,40.4,40.4,40.4,40.4,40.5,40.4,40.6,41.2,41.5,41.4,41.5,41.3,41.5,41.6,41.5,41.6,41.5,41.4,41.3,41.4,41.7,41.5,41.7,41.3,41.8,41.5,41.7,41.5,41.6,41.6,41.5,41.3,41.5,41.7,41.2,41.5,41.5,41.7,41.6,41.5,41.6,41.2,41.4,41.4,41.5,41.5,41.8,41.4,41.2,41.5,41.7,41.4,41.5,41.5,41.8,41.5,41.6,41.2,42.8,44.7,45.6,44.7,43.7,43.3,43.3,43.3,43.4,43.4,43.3,43.4,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.2,43.2,43.3,43.3,43.3,43.3,43.3,43.3,43.2,43.3,43.3,43.3,43.4,45.7,44.7,45.5,45.5,44.7,45.7,44.8,45.7,44.7,44.7,44.8,45.7,44.7,44.8,45.7,44.9,45.9,44.9,44.9,44.8,44.7,45.8,44.9,44.8,44.9,44.8,45,44.9,45,44.9,44.9,45.7,45.6,44.9,44.9,44.9,45,45,44.9,45,45.1,45,45.9,44.9,45,44.9,45,45,45,44.9,45,45,45,45,45.9,45,44.9,45,44.9,45,45,45,45,45,45,44.9,45.9,45,45,45.9,45,45,45.1,44.9,45,45,44.9,45.1,45.9,46.2,45.9,45.8,45.8,45.7,45.7,45.7,45.7,45.8,45.7,45.9,45.9,45.8,45.9,45.9,45.8,45,45,45,46,45.2,45.3,46.1,45.1,45.1,45.1,45.1,45.2,45.2,45.2,45.1,45.3,45.1,45.2,45.2,45.9,45.6,45.3,45,45.2,45.1,45.2,45.2,45.2,45.2,45.1,45.1,45.3,45.3,46.2,45.2,45.3,46.2,45.4,45.2,45.3,45.3,45.3,45.3,45.2,45.3,45.3,45.3,45.3,45.3,46.2,45.8,45.2,45.3,45.3,45.4,45.2,45.2,45.3,45.1,45.3,45.2,45.3,45.3,46.4,45.3,45.3,46.3,45.4,45.4,45.4,45.6,45.6,45.4,45.4,45.4,45.3,45.3,45.3,45.6,46.3,45.9,45.3,45.5,45.5,45.5,45.4,45.5,45.6,45.4,45.4,45.6,45.4,46.1,45.9,46.2,46.2,46.1,46.2,46.1,46.1,46.3,46.1,46,46.1,46.3,45.9,45.6,45.6,45.6,45.5,45.5,45.6,45.7,46.6,45.7,45.7,46.5,45.7,45.5,45.7,45.8,45.6,45.6,45.6,45.6,45.5,45.6,44.4,43.7,43.6,43.7,48.8,78.7,78.09,77,77.5,78.5,76.59,77.59,77.3,76.7,77.09,77.59,77.3}	079fd360-4022-45eb-80f4-629e4fa3eede	b1888ac2-3655-4437-94ff-670aa3e1640c	0ec996bc-b4d3-47b5-9da8-029c4b26337b	\N
d3fd5593-7e84-4f8e-a20c-abae0b3a7bf7	2023-03-05 12:07:22.59848	13:25:43	13:26:12	{115.8,135.4,87.8,150,103,133.1,122.6,122.9,146.9,122.2,146.9,124.6,117.5,134.4,106,109.7,111.4,103.3,107,96.2,109.4,123.6,109.7,70.59,101,125,51.3,95.2,94.2,83.4,140.19,62.5,95.2,132,62.1,94.9,77.7,78.7,120.6,52.3,78,102.3,77.7,57.4,119.2,91.2,52.3,101,87.8,68.5,101.6,53.3,124.6,57,111.4,29.7,77,22.2,66.8,49.6,81.7,99.6,8.4,35.79,40.5,47.2,28.3,27,16.2,22.6,35.4,14.5,43.5,21.2,16.5,15.2,10.1,37.1,35.4,35.4,23.9,19.89,28,27.3,17.2,55.4,27.7,46.9,38.5,21.2,15.5,66.2,18.5,8.1,13.1,30,43.5,55.4,49.3,17.5,81.4,61.1,7.4,11.4,2.7,18.2,15.5,32.7,53.7,76.59,16.8,44.2,57,29.3,112.5,44.2,65.5,41.5,58.4,116.2,29.3,46.2,44.5,19.89,53.7,36.79,136.8,43.2,28,40.79,100.3,98.6,7,8.1,6.7,130.69,118.9,8.4,8.1,125.3,23.3,13.5,58.1,130.69,43.2,86.8,9.1,34.7,136.1,24.6,84.7,15.5,53,130,8.69,146.9,30.7,63.1,88.1,77.3,37.1,22.9,121.2,45.9,62.8,78.3,56.4,92.9,54.3,66.5,23.3,59.1,116.2,86.1,11.8,118.5,72.2,26.6,31.7,159.69,28.7,159.4,34.4,147.6,8.1,25.6,140.8,78,130.4,53.3,134.1,97.6,105,103,125.6,79.7,139.5,62.8,159.4,23.3,140.5,37.5,127.3,78.3,74.59,95.6,99.3,94.5,60.1,132.4,96.9,142.9,93.2,116.2,95.2,113.5,90.2,128.69,66.5,110.1,114.1,81.4,116.8,98.3,109.4,100.3,108.1,94.2,100.6,118.2,96.2,107,112.1,101.3,105.4,106,114.1,97.2,116.5,99.3,106.4,121.2,92.2,116.5,89.8,105.7,127.7,96.6,95.6,107,127.3,86.8,124.6,91.5,91.8,128,92.2,116.5,55.4,130.4,128.3,88.1,130.4,91.8,106.7,108.4,112.1,115.5,124.3,69.2,115.2,102,119.9,106,104,122.6,107.7,111.1,82.4,121.2,85.8,88.5,102.7,113.8,100.6,117.2}	{23.2,25.3,26.8,23.8,27,24.9,25.3,25,24.6,24.9,23.8,25,25,22.4,21.2,21.4,21,20.9,20.7,21.5,20.6,20.39,20.3,22.1,21.2,19.7,22.1,21.4,21.5,20.7,18.89,21,20.8,19.7,21.6,19.6,22.1,20,18,21.6,19.2,19,20,20.2,17.6,19,20.1,18.7,18.2,20.2,18.3,19.6,17.7,19.6,16.8,30.3,17.1,30.9,16.89,17.8,15.7,18.5,22,18.3,17.8,16.2,17.1,18,25.9,22.8,22.7,57.3,21.8,27.4,18.2,18,18.1,14.7,15.6,15.4,15.9,16.7,14.8,15.2,16.2,13.1,16,13.6,17.8,17.1,16.2,11.9,16.5,17.8,16.8,14.3,13.2,12,12.2,15.6,9.5,13.4,18.39,59.3,63.4,39.6,44.7,14.7,11.5,10.6,45.3,21.8,18.7,38.7,10.6,15.6,14.6,14.7,14.1,11.6,25.8,17.5,13.9,34.79,19.89,14.9,10.5,18.7,15.9,15.8,12.2,16.5,41.2,28.1,36.2,10.1,14,29,29,8.8,57.5,56.4,23.1,8.8,23.4,14.8,22.5,43.1,9.3,20.6,33.1,29.8,17.8,11.8,35.9,9.9,18.8,15.1,15.4,13.6,49,56.6,10.4,16.1,13.9,13.6,14.5,16.6,14.8,17.5,16.8,17.5,13.7,18.1,47.1,12.2,16.2,19,17.3,15.5,19.8,14.4,21.2,15.7,32.79,48.6,16.3,20.2,15.4,19.3,16.7,17.5,18.6,18.39,17.89,19,17.1,20.6,16.2,64.7,22.5,21.1,18,24.6,19,23.5,17.8,19.7,20.6,17.89,18.7,18.39,19.1,18.8,19.6,21.4,19.7,18.39,20.5,19.6,18.8,20.3,19,20.39,19.3,19.6,19.39,20.3,20.5,19.5,20,20,19.6,20,19.7,19.7,20.1,19.5,19.89,20.5,19.6,20.2,19.89,20.2,20.7,20,19.5,19.8,20.39,19.3,19.6,21,18.7,21.2,20.39,19.1,20.7,19.1,21.8,19.39,20.1,20.1,20.1,20.9,20,19.7,19.89,19.39,19.3,21.2,19.6,20.5,19.6,20.3,19.8,19,20.6,19.6,21.1,19.6,20.6,20.5,19.6,20.39,20,19.7}	079fd360-4022-45eb-80f4-629e4fa3eede	b1888ac2-3655-4437-94ff-670aa3e1640c	0ec996bc-b4d3-47b5-9da8-029c4b26337b	\N
\.


--
-- Data for Name: WeldingTasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingTasks" ("Id", "Number", "Status", "TaskStatus", "IsAddManually", "WeldingDate", "BasicMaterial", "MainMaterialBatchNumber", "WeldingMaterial", "WeldingMaterialBatchNumber", "ProtectiveGas", "ProtectiveGasBatchNumber", "SeamId", "WelderId", "MasterId", "InspectorId", "IdFromSystem") FROM stdin;
1482f5d2-ff02-4e80-96aa-6648ad65f636	1	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	90410e9b-e1d9-42cf-9a68-e4bfe35770f2	b1888ac2-3655-4437-94ff-670aa3e1640c	0ec996bc-b4d3-47b5-9da8-029c4b26337b	43dd989f-b01b-4fc1-998a-99623d9234f3	\N
72370758-89cc-45f1-bc9e-8ad1198bdc6d	2	1	1	f	2000-01-01 00:00:00	Сталь 20	454578	Проволока 1,2 Св-08Г2С	00252565	Какой-то Защитный газ	111111	1b8b7950-e4ce-4c7c-8477-986c21b8189d	b1888ac2-3655-4437-94ff-670aa3e1640c	0ec996bc-b4d3-47b5-9da8-029c4b26337b	43dd989f-b01b-4fc1-998a-99623d9234f3	\N
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
9dc62bdf-12ce-4994-9385-5ebac0de7ffe	3	16:00:00	17:00:00	17:10:00	17:40:00	\N	b7efd176-48b9-4815-bf61-3396f8b3230f	\N
9fd887c1-99e6-4c4e-b36a-cc6ca1efbd56	1	12:00:00	13:00:00	13:10:00	13:40:00	\N	b7efd176-48b9-4815-bf61-3396f8b3230f	\N
a7b6f944-3d63-46be-a8e6-98dc9103defc	2	14:00:00	15:00:00	15:10:00	15:40:00	\N	b7efd176-48b9-4815-bf61-3396f8b3230f	\N
ca85d578-2ea2-4fec-bac3-3778f8913e7d	1	12:10:00	13:10:00	13:20:00	13:50:00	9ade40c0-44db-4c4d-9488-76e7deae5d04	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
01ebcbfc-c0ba-425f-9a30-d1feb5c98dd2	3600	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	3600
1aefed04-ef9d-4199-bfe7-74d6a4055725	3500	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	3500
8043d1c8-a6fd-434b-9ba7-eb6c77e11f0a	3510	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	3510
ad3e8df5-6292-4da7-9a27-a748cbfd3baa	3610	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	3610
de32277d-5dd1-4994-bbc4-0da68d9ce572	3690	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	3690
ef7ded0c-ea93-4900-888e-7d3c82737b76	3550	\N	35c83195-141c-4cf8-a8cc-72f0970456d5	3550
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
81828d09-f1f8-47ae-94c9-039357bbeba1	Сварочный цех	50	050
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
-- Name: IX_WeldingTasks_SeamId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingTasks_SeamId" ON public."WeldingTasks" USING btree ("SeamId");


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

