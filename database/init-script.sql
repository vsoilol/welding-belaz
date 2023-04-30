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
    "Information" text NOT NULL,
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
    "ManufacturingTime" double precision NOT NULL,
    "ProductType" integer NOT NULL,
    "TechnologicalProcessId" uuid,
    "ProductionAreaId" uuid NOT NULL,
    "MasterId" uuid,
    "InspectorId" uuid,
    "WorkplaceId" uuid,
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
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users" (
    "Id" uuid NOT NULL,
    "FirstName" text NOT NULL,
    "LastName" text NOT NULL,
    "MiddleName" text NOT NULL,
    "UserName" text,
    "Email" text,
    "IsEmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "Position" text,
    "ServiceNumber" text,
    "CertificateValidityPeriod" timestamp without time zone,
    "Role" integer NOT NULL,
    "ProductionAreaId" uuid,
    "ConfirmEmailToken" text,
    "ResetPasswordToken" text,
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
    "Estimation" double precision,
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
    "WelderId" uuid NOT NULL,
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
94d80ba5-d897-4879-9088-af1d7af3562d	2023	t	\N	\N	\N
\.


--
-- Data for Name: Chiefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Chiefs" ("Id", "UserId", "WorkshopId", "WeldingEquipmentId", "IdFromSystem") FROM stdin;
7dc200c1-64f4-4bda-8f20-c681d0f40734	4f78dfda-311a-4334-b2b3-dbff618f6679	bf9f9876-de64-42b7-9ecb-9828781bc3a8	\N	\N
\.


--
-- Data for Name: Days; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Days" ("Id", "MonthNumber", "Number", "IsWorkingDay", "CalendarId", "IdFromSystem") FROM stdin;
03c5c3cd-fd49-446f-9028-b8018b8381e8	2	19	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
074fcf0b-187e-4b30-84b8-ef129873135d	4	30	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
0aa14913-9e1f-4cbe-b98e-55209ceadc95	5	9	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
0afbfc7b-d67f-442e-92ae-e4e72733039c	4	1	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1022996c-f995-47e2-8138-1edc7e6f5c97	12	10	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
102fd2d3-a40f-4d7c-9ee0-5392e6ccec49	5	21	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1336b085-3ae0-42d5-b6ed-aa5de5b18c45	7	15	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
150a59de-863e-4a39-ab9f-bf461e788467	1	14	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1548ac48-165b-4f39-8267-ef174b3aaf94	1	28	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
16adaba4-2cad-4af1-aff5-005e818c39fa	8	13	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
16f0772b-01ee-47fa-b281-c437ed92a724	4	9	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
18742a35-510f-4049-8dde-b65f9e92681b	7	16	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1a946eb3-3df8-4467-a500-9fc8c4b7ccc2	7	2	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1ae62424-5d92-4e0d-ada4-4c1dbcdd8b87	9	24	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1b83c2b3-e856-4192-a7b0-b16432b2173a	10	1	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1d57d09c-1705-4132-b596-bd50779d4960	2	18	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1ee00283-ca01-474c-9d2d-ee7799d8990b	5	28	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1f960cd9-8e6d-49ac-b51e-7dc75df929c6	5	14	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
1fd07dd6-5025-4e36-88c1-51f9d4af9f23	12	25	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
232d6e2d-04f9-46d7-9911-3071b87d437b	9	2	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
25b4208f-b407-44ec-b171-236b35c90d33	5	1	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
337ce44f-36ba-40be-b9e7-138c2c6ce526	11	4	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
34640b2c-37fd-4295-a96f-f3513815ad3f	4	8	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
35adb76e-647b-4972-9604-7913e4b2f8a9	11	6	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
360bbade-c68f-4a1a-9bdf-9af83dc9bb9f	7	29	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
3666c97b-2284-43a7-b809-5a0e744bf129	4	15	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
36ffeb5c-3006-4d04-8155-999bc8d88bac	6	17	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
384997c4-609f-40a7-a272-c466811e26ce	9	10	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
3863e041-88d3-4d9c-ba5d-6fe0a9a18cbb	4	24	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
3b3ce422-7f51-4a58-85e1-8b4e474e40aa	3	11	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
40d8dcb6-f7a6-4232-a5b7-0ea079c3887a	10	15	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
4348dfa4-4ae9-4be5-93d3-c5f5a0b25b69	5	13	t	94d80ba5-d897-4879-9088-af1d7af3562d	\N
450d16c7-85c1-4621-8aa2-855dd60de4a8	10	14	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
49a4edf3-9fc6-4c4c-a630-75581b614865	8	5	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
49c8db0e-0f1a-4522-b1cf-134a87fdc704	3	26	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
4d1c22d8-ece4-41d5-901a-bded1c62a293	3	7	t	94d80ba5-d897-4879-9088-af1d7af3562d	\N
4dd4f78f-8da1-4b9d-8120-7542fcea3851	9	16	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
50d299b2-88e8-471c-9521-778d878ae2c0	12	24	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
52ef0a57-a1e5-4f89-b304-b3fc88753bfb	11	26	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
54eb2554-ee94-4747-9775-dff2da40e150	7	8	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
552aa2d2-ea98-4a87-a414-7ea3ea6ebd5e	10	29	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
5de20948-06e7-4487-ab32-42d99ec05fac	10	21	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
61cd9a2e-ae55-4f9b-a1bc-6a2f495e0ee5	9	30	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
62092df2-ea45-44ff-b9a3-cc9d49b31008	12	31	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
6321983c-9a7c-42ab-9975-049161cbfc5c	7	1	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
63522969-f910-4604-b15d-526bfe7fcebb	7	9	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
659c6030-7231-4803-a8e0-9de5b22d7942	5	27	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
6c0912a4-2298-420c-8bd2-07401b37f10a	11	12	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
7050b6ae-a597-4c04-9058-e10c613d1485	1	1	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
71c0fb92-76bf-4604-b2ab-f8fa63a663f8	6	11	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
727b06a3-38e5-4e8e-a5c3-c6912d666217	10	28	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
738724f3-d5ed-49d6-8717-3c6b8d0b7256	5	20	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
75a30a91-764f-4b75-b6a1-d2311c8049fb	6	3	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
76b76192-7683-4ca6-a8a9-311ca90ef1ca	1	7	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
7881ad2c-4acb-4f59-99e2-84a7a9e4850b	12	16	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
78856f0e-7c81-45ac-a05b-4339311b3b86	4	16	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
78ae2166-9ab9-4671-be60-d206fef5d6b7	7	23	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
7dcbb4cc-18b5-4fa9-8b9d-dbf6cf965971	2	11	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
7fbf4719-4d66-47eb-84ac-d427545aee2c	12	30	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
7fcd6518-a729-4256-9fa6-a693a50cca97	11	11	t	94d80ba5-d897-4879-9088-af1d7af3562d	\N
800d1923-824a-4b7e-b958-ae55225497e7	8	12	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
81344a14-79b6-4a27-8668-36e563ba7c04	9	23	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
8330703b-fccb-405b-9f46-1c60a7f65baa	4	2	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
86541d3e-64e2-4e4b-96c0-a6edc52c176f	3	4	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
8744fad1-527e-4a90-b344-86c8b35c1638	5	7	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
8bedb5cc-aa5e-4357-8bf3-8976d22949ae	2	5	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
9186c0d1-c65d-428f-8eaf-52bf6cc1ea18	9	9	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
932b947d-d359-43b0-b709-8299c8250499	8	19	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
93b2df02-fe4f-4bde-8c68-4d0657618128	10	8	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
94d0ec4b-5031-42f8-a447-77b06d9aa4da	8	20	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
971da442-3008-4069-a728-350a2d3d707d	8	6	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
9999d05c-4046-43bb-bdd9-8ab19c31ffda	2	12	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
9afb9ca3-205d-4108-bd6b-604b090f4c90	2	4	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
9e1eaf4d-7339-4f96-873e-737346f04953	10	7	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
a35ee003-471f-4212-936c-cdabfaa153e4	3	5	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
a3de4153-bf88-4d63-9e95-b8a987ff3af1	11	18	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
aa59e316-a299-4e31-a414-e2ef8749a4c5	9	3	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
ae9feb0c-50ac-4058-9e77-39cbef4671e9	7	22	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b035a5cd-90c8-42a7-b1be-cd1ec3995073	4	22	t	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b2318f2d-375e-4686-b5c4-64671e9348c9	6	10	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b299ec7b-5690-495d-8de1-9950c09907a1	12	17	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b3998952-0260-4338-8166-7d4faa7c5fb9	11	5	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b65c5086-5007-4240-840d-4e0f560090db	4	29	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b678917b-489b-44e9-bb49-54dd76700735	1	8	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
b7b65f60-deff-4f79-a2a0-45be7477bac5	11	19	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
bd5e3b44-0193-41ed-bfcc-7d1db52f8021	4	23	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
be49ba70-bff1-4ce4-ae83-60c156e0f99a	4	25	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
c4a0fab5-2cf2-4ce1-b5a0-cb2b91eb30f6	12	9	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
c7e2e97c-436a-4709-9b50-143fbfa4ba5c	1	6	t	94d80ba5-d897-4879-9088-af1d7af3562d	\N
c885bd0f-9fbb-49c8-9c00-d1021a1a3861	8	26	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
c908c22b-8609-4581-9218-16d8229d5de5	9	17	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
cc0d4404-7c9e-4626-a35a-6540014b0218	12	23	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
d3035605-d037-447f-bb7c-2b2007b77c73	3	12	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
d31afc31-ab8e-43e1-986d-5fc9e4e45e1b	8	27	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
d6133a84-cfec-4a62-ac5f-c2c545848780	11	25	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
d8905f1b-16fa-4537-b3b4-aa377033c0c0	1	29	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
da12e701-de56-4785-bef5-66c0f6810400	5	8	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
dd04ee0f-6e61-4573-8aee-90112eaf199f	6	4	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
dec9ac70-690a-49d0-b2e6-e3dfce428c5e	3	18	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
e063222a-3997-4bf6-9351-a73981a9a871	3	19	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
e2048518-fd01-44d7-8982-b362330797df	5	6	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
e2e5d984-6452-4bbe-adbb-6b45edbfafdd	3	25	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
e4433643-5323-4a15-8ee4-934bbdade1f2	2	26	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
e6844fe6-4011-4a48-ba44-cd4ccfb8c34c	12	3	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
e756fce8-f9d6-4b63-b789-5e76ddc457d1	12	2	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
ea806d5d-6eac-40c9-8f6a-75bd91cf9092	2	25	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
ec0593b9-a09f-461e-aaa5-d5c30c199238	1	21	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
ed6daf4e-a6c1-4602-aba1-71a4060bd9e2	7	30	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
eec66a54-edc1-43cd-b529-fa6cc3455d3e	11	7	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
f2b4e2b6-bc63-4587-994e-b528813ddff3	1	15	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
f7249e68-e2a9-4eb0-99e4-5a2c457a1059	6	24	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
f93d2615-1300-4701-8736-191ea8b1138f	1	22	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
f989243b-fb38-40ce-92fe-914a27c48244	10	22	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
f9d2cd92-ecf3-450a-8ccc-b992519feedd	6	25	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
fadbd142-309b-4077-a046-6709f7887eb5	3	8	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
faf52156-9d73-466b-bcef-b1abccbf2b78	6	18	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
fee325cb-0a90-4c43-84b5-8cbda3f38930	1	2	f	94d80ba5-d897-4879-9088-af1d7af3562d	\N
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
02d8f0d1-a422-41bd-a98c-0a6bba32fc6d	Сборочные операции	\N
0667a68e-18aa-4f8e-9202-cce78602c9e4	Уборка, осмотр оборудования, чистка/смазка оборудования	\N
079b51a7-558a-44dc-94b3-4f762a0642ce	Нерабочее время по графику согласно сменности	\N
08bef822-8023-4c88-a746-80c2906e236b	Ознакомление с работой, документацией, инструктаж	\N
0ffbc626-061a-412c-8846-c6e57894abe6	Обед	\N
4b2a4588-4dcf-4ac0-9a7b-9ece691faf9e	Установка, выверка, снятие детали	\N
55c09e12-ad72-4769-bd8d-e96b6f46880e	Аварийный ремонт централизованными службами	\N
69cb483b-fd94-4d32-9ca6-9b88948d6073	Контроль на рабочем месте	\N
702d13a7-06cc-4581-82b1-fdad05aa7f62	Отсутствие энергоносителей	\N
7856b0f4-35d3-4c68-89ce-69fae2901e9d	Работа с управляющей программой	\N
7a1feaf7-0407-4eed-854c-3edb511dec2a	Отсутствие конструктора, технолога или ожидание его решения	\N
81f48901-07c1-4f72-9f47-f7c83b1806c5	Установка, выверка, снятие детали	\N
961ecdb6-ddf1-4da0-93a5-f4cb29b2c286	Неявка оператора (б/лист, отпуск, и пр.)	\N
9d82974b-cc70-46cd-ac03-e9fdb78aa4f6	Отсутствие материала, заготовок, деталей	\N
a1685e40-2a4d-462b-a00f-375704009aab	Отсутствие крана, транспорта	\N
a51ffe41-03e6-42de-86b6-190009915205	Работа по карте несоответствий	\N
a82fd935-8e41-4199-9556-b1622e527fa2	Отсутствие инструмента, оснастки вспомогательного оборудования	\N
b20b96a0-bea2-439a-9974-80630e2c74b8	Отсутствие сотрудника ОТК	\N
b6204989-13b9-4b71-88b0-f8e4b2f489fa	Отсутствие оператора в связи с необеспеченностью	\N
bef5eeeb-bb4a-483c-87ca-72a460f3ba58	Праздники и выходные	\N
d000f7f8-2692-41c4-940f-91e87f6dc3c5	Плановый ремонт централизованными службами	\N
dd24e19a-60cd-4e6d-be75-3d44c4078e23	Естественные надобности	\N
f0818071-9627-40c3-931d-422a00b3b792	Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы	\N
fb97f17f-5812-498a-aeef-a3800da19653	Отсутствие заданий	\N
fde07178-4313-4555-9d76-8d30c8872061	Изменение режимов, смена инструмента, приспособления	\N
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
71a69962-16eb-4641-b80c-447d8fb18180	b1864ed4-d87a-4b51-8194-04e946517128	219379
f54e0c33-9567-4019-9105-083842a7d3ac	23a4094a-15b3-435d-a97a-96dc41d40655	249550
259c4be9-dfaa-448b-9053-015e60707609	61ca7812-3249-4d6d-80a0-b817e8bf03e8	\N
\.


--
-- Data for Name: Masters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Masters" ("Id", "UserId", "IdFromSystem") FROM stdin;
3e8d8b29-3069-416c-ba06-2ed519614333	012ea81e-0998-40fd-9cf2-c2f9f40aeb30	610422
a46d1b1c-1415-4b72-b0ba-f8167db8f19a	24dddc35-ce12-4fae-b22b-85ceace2b8c7	614962
1e1fecdb-825e-4a7e-a975-909bb7f22e70	65055fef-61e7-49fc-b3f6-040cdcec3d79	\N
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
\.


--
-- Data for Name: ProductInsides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductInsides" ("MainProductId", "InsideProductId") FROM stdin;
1eefd907-7cf4-4219-8a1d-11a64984b050	4ffac3a8-29b1-44a0-b57e-82a41e8e8182
2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	8924230d-a92a-4500-a112-fdfc61034f12
\.


--
-- Data for Name: ProductResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "ProductAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: ProductionAreas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductionAreas" ("Id", "Name", "Number", "WorkshopId", "IdFromSystem") FROM stdin;
c2043c99-ee52-4602-9e37-818be24513ba	Сборка, сварка рам к/с г/п 120-130 т.	6	bf9f9876-de64-42b7-9ecb-9828781bc3a8	06
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Products" ("Id", "Name", "Number", "IsControlSubject", "ManufacturingTime", "ProductType", "TechnologicalProcessId", "ProductionAreaId", "MasterId", "InspectorId", "WorkplaceId", "IdFromSystem") FROM stdin;
1eefd907-7cf4-4219-8a1d-11a64984b050	Рама	7513D-2800010-20	t	10	1	92794895-157a-4dfb-971f-b38c7306a53b	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	4536492774
2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	Рама	75131-2800010-70	t	11	1	3144dfd2-e95c-4ac5-b311-ea663d03d1bf	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	4536479362
4ffac3a8-29b1-44a0-b57e-82a41e8e8182	Поперечина рамы задняя	75131-2801300-20	t	20	2	92794895-157a-4dfb-971f-b38c7306a53b	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
8924230d-a92a-4500-a112-fdfc61034f12	Поперечина рамы задняя	75131-2801300-20	t	41	2	3144dfd2-e95c-4ac5-b311-ea663d03d1bf	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
\.


--
-- Data for Name: SeamAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamAccounts" ("Id", "DateFromPlan", "SeamId", "ProductAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: SeamResults; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SeamResults" ("Id", "Amount", "Status", "Reason", "DetectedDefects", "SeamAccountId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: Seams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Seams" ("Id", "Number", "Length", "IsControlSubject", "IsPerformed", "ProductId", "TechnologicalInstructionId", "InspectorId", "ProductionAreaId", "WorkplaceId", "IdFromSystem") FROM stdin;
0b6a63bc-5f74-421b-a324-bf9d6cf5d8a5	55	400	t	f	2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	e0d1d9d5-64e5-44e9-ae68-9b82815a0de2	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
0cfae3bc-cae8-49d4-bd29-2ec0e8f1924e	2	1880	t	f	4ffac3a8-29b1-44a0-b57e-82a41e8e8182	6dd518cc-d659-4cc8-9650-2799a8e85496	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
25982d2b-7df0-4fa1-abbd-ea16b268eb1a	52	1200	t	f	4ffac3a8-29b1-44a0-b57e-82a41e8e8182	c471ba8a-ec20-488d-aa3d-06d499abbd4c	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
2b054845-e803-431a-8816-af75ef66b5d3	57	400	t	f	2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	418a1caa-280c-4a09-a518-f9ab5934244e	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
6014326c-a5f2-412b-a139-cc2485841cfc	18	4000	t	f	2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	3ba01408-dc6d-4b0b-9959-2d54b9542a9a	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
675e1c39-28e5-4c14-9cba-13b9438de3bb	55	400	t	f	1eefd907-7cf4-4219-8a1d-11a64984b050	e0d1d9d5-64e5-44e9-ae68-9b82815a0de2	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
708caf62-f489-4b72-ad93-3ebe35600331	18	4000	t	f	1eefd907-7cf4-4219-8a1d-11a64984b050	3ba01408-dc6d-4b0b-9959-2d54b9542a9a	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
85736ca8-513f-4300-b8f1-8527f49aca84	1	1900	t	f	8924230d-a92a-4500-a112-fdfc61034f12	37c7d574-8bd4-4592-847d-cffb587c4d1f	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
97842b53-a238-4305-982d-4a6b5a289934	57	400	t	f	1eefd907-7cf4-4219-8a1d-11a64984b050	418a1caa-280c-4a09-a518-f9ab5934244e	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
9fab0140-e41f-4a1b-9aa9-af20950ffaca	1	1900	t	f	4ffac3a8-29b1-44a0-b57e-82a41e8e8182	37c7d574-8bd4-4592-847d-cffb587c4d1f	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
ae29a8ba-c381-420c-a72c-802e13598d64	52	1200	t	f	8924230d-a92a-4500-a112-fdfc61034f12	c471ba8a-ec20-488d-aa3d-06d499abbd4c	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
b085cf43-f17a-4c79-b5d6-04d6e4cf372e	39	280	t	f	2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	441631b8-055f-41c5-ba72-3ad85f211847	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
b3d37b7c-d1d4-44d1-bfb3-d00e3e23111a	54	400	t	f	2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	d037daba-a4ea-4c35-9f4e-46ce1571e157	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
e02aa18d-5d6b-4d73-8c3f-a98eb035037c	2	1880	t	f	8924230d-a92a-4500-a112-fdfc61034f12	6dd518cc-d659-4cc8-9650-2799a8e85496	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
e16eca81-979e-4b26-a828-8e544e640514	58	900	t	f	2e29a7c3-2edf-4cd8-95e1-d6f00ad129b1	c5886432-5dbf-4b3e-9243-7a49b16804af	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
ed7b899a-4642-4440-8acb-29b6e8a5b89c	58	900	t	f	1eefd907-7cf4-4219-8a1d-11a64984b050	c5886432-5dbf-4b3e-9243-7a49b16804af	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
f09d7c6a-b64b-4384-a7ba-79aded0ca484	39	280	t	f	1eefd907-7cf4-4219-8a1d-11a64984b050	441631b8-055f-41c5-ba72-3ad85f211847	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
f492f710-5ffd-4131-ba33-da29b0cbfc5f	54	400	t	f	1eefd907-7cf4-4219-8a1d-11a64984b050	d037daba-a4ea-4c35-9f4e-46ce1571e157	\N	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N
\.


--
-- Data for Name: TechnologicalInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalInstructions" ("Id", "Number", "Name", "IdFromSystem") FROM stdin;
37c7d574-8bd4-4592-847d-cffb587c4d1f	1	Инструкция 1	1
3ba01408-dc6d-4b0b-9959-2d54b9542a9a	18	Инструкция 18	18
418a1caa-280c-4a09-a518-f9ab5934244e	57	Инструкция 57	57
441631b8-055f-41c5-ba72-3ad85f211847	39	Инструкция 39	39
6dd518cc-d659-4cc8-9650-2799a8e85496	2	Инструкция 2	2
9b7a8e33-481f-47a1-9468-8a4a2ac2b4fc	48	Инструкция 48	48
c471ba8a-ec20-488d-aa3d-06d499abbd4c	52	Инструкция 52	52
c5886432-5dbf-4b3e-9243-7a49b16804af	58	Инструкция 58	58
d0230432-e03a-42aa-ab24-393fe78f0f56	56	Инструкция 56	56
d037daba-a4ea-4c35-9f4e-46ce1571e157	54	Инструкция 54	54
e0d1d9d5-64e5-44e9-ae68-9b82815a0de2	55	Инструкция 55	55
\.


--
-- Data for Name: TechnologicalProcesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TechnologicalProcesses" ("Id", "Number", "Name", "PdmSystemFileLink", "IdFromSystem") FROM stdin;
3144dfd2-e95c-4ac5-b311-ea663d03d1bf	75131-2800010-70	Рама	\N	3291137
46d99822-fbae-4021-a698-fc7bd742655f	75131-2801300-20	Поперечина рамы задняя	\N	2868425
92794895-157a-4dfb-971f-b38c7306a53b	7513D-2800010-20	Рама	\N	3330041
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Users" ("Id", "FirstName", "LastName", "MiddleName", "UserName", "Email", "IsEmailConfirmed", "PasswordHash", "Position", "ServiceNumber", "CertificateValidityPeriod", "Role", "ProductionAreaId", "ConfirmEmailToken", "ResetPasswordToken", "IdFromSystem", "RfidTag") FROM stdin;
23a4094a-15b3-435d-a97a-96dc41d40655	Екатерина	Сергеевна	Грук	\N	\N	f	\N	Контролер сварочных работ	49550	\N	4	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
b1864ed4-d87a-4b51-8194-04e946517128	Мария	Николаевна	Шабалинская	\N	\N	f	\N	Контролер сварочных работ	19379	\N	4	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
012ea81e-0998-40fd-9cf2-c2f9f40aeb30	Сергей	Николаевич	Беляцкий	\N	\N	f	\N	Мастер производственного участка	10422	\N	2	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
24dddc35-ce12-4fae-b22b-85ceace2b8c7	Геннадий	Александрович	Алёксов	\N	\N	f	\N	Мастер производственного участка	14962	\N	2	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
0cb53279-d696-43cf-82d7-83cc5df87d8e	Сергей	Анатольевич	Казачёнок	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	17390	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	67:5A:70:B4
19314938-979e-4efa-982d-5fc0f46dd6ab	Василий	Владимирович	Казинец	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	21267	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	B7:5A:79:B5
5ab776b3-ff13-4aaa-a07b-50fdfb8ce923	Александр	Васильевич	Михейчик	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	46164	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	27:45:7E:B4
78f8d39a-a80d-421d-8b32-ee8992371175	Максим	Александрович	Костюкевич	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	22575	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	67:CD:7E:5A
825046f3-c27a-4b00-9a7b-50c81e40ee40	Виталий	Владимирович	Казинец	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	14729	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	D7:F1:7D:5A
9704f275-e136-4417-9407-734587175357	Владимир	Францевич	Виторский	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	32695	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	D7:95:55:B4
9dee5a50-3e90-42af-99f3-4da3cd7df184	Валерий	Сергеевич	Зубковский	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	50838	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	97:17:60:B4
dabde064-cce0-4991-9080-b1c4217598de	Юрий	Сергеевич	Буландо	\N	\N	f	\N	Электросварщик на автоматических и полуавтоматических машинах	50882	\N	3	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	17:CD:7F:5A
4f78dfda-311a-4334-b2b3-dbff618f6679	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	UserName	Email	f	PasswordHash	Должность 1	Табельный номер  1	2025-02-02 00:00:00	5	\N	\N	\N	\N	RFID метка начальника цеха 1
d3d4a3d9-e0f0-4b0d-950d-829d53ce18ef	Admin	Adminovich	Admin	admin1@admin.com	admin@admin.com	f	$MYHASH$V1$10000$Y9eknzsdzpqYb4ZrTsdBXkwGcxtWYzhmwKkho2E0iDyOZXjJ	\N	\N	\N	1	\N	\N	\N	\N	\N
66011898-6040-4a6e-a3f9-932a0b192a92	Имя сварщика	Отчество сварщика	Фамилия сварщика	welder@welder.com	welder@welder.com	f	$MYHASH$V1$10000$lIAsxcKfLy9rS/yMpb+3BSc83qOSBR9YyOwxM4O/FNoc9FhL	\N	\N	\N	3	\N	\N	\N	\N	\N
61ca7812-3249-4d6d-80a0-b817e8bf03e8	Имя контролера	Отчество контролера	Фамилия контролера	inspector@inspector.com	inspector@inspector.com	f	$MYHASH$V1$10000$Tox6qF1SWeGKdkrZnLXqp0C99D1L3iMIZ7wEJGvvrw68zDvu	\N	\N	\N	4	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
40183cdc-87fc-401d-af45-98589db39294	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	chief@chief.com	chief@chief.com	f	$MYHASH$V1$10000$1wExifza3vC+AED6pZUkqxa1/ZYpMDi2ZzhGaqteYSA93Esj	\N	\N	\N	5	\N	\N	\N	\N	\N
65055fef-61e7-49fc-b3f6-040cdcec3d79	Имя начальника цеха	Отчество начальника цеха	Фамилия начальника цеха	master@master.com	master@master.com	f	$MYHASH$V1$10000$kuLnZKTiFYccSCp5N3uJJjZP+zyELBatfmapPS1TzbrgOR6g	\N	\N	\N	2	c2043c99-ee52-4602-9e37-818be24513ba	\N	\N	\N	\N
\.


--
-- Data for Name: WeldPassageInstructions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassageInstructions" ("Id", "Number", "Name", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "PreheatingTemperatureMin", "PreheatingTemperatureMax", "TechnologicalInstructionId", "IdFromSystem") FROM stdin;
0a560dd0-8074-4741-b81a-2f62e02b368b	1	Корневой	200	270	23	26	\N	\N	c5886432-5dbf-4b3e-9243-7a49b16804af	\N
19b72184-d08f-4421-a3c7-d0803b9f1cba	1	Корневой	200	270	23	26	\N	\N	e0d1d9d5-64e5-44e9-ae68-9b82815a0de2	\N
29f9ff90-a693-474e-a419-163d2933deaf	1	Корневой	200	270	23	26	\N	\N	3ba01408-dc6d-4b0b-9959-2d54b9542a9a	\N
2d17a161-f447-4bfa-9b8e-ad0bc0a24aca	2	Заполняющий	270	310	23	26	\N	\N	3ba01408-dc6d-4b0b-9959-2d54b9542a9a	\N
2d8d1a05-da37-408c-a643-aa28e59242c2	1	Корневой	200	270	23	26	\N	\N	37c7d574-8bd4-4592-847d-cffb587c4d1f	\N
364448cf-5674-4ade-be40-203372f196e7	2	Заполняющий	270	310	23	26	\N	\N	6dd518cc-d659-4cc8-9650-2799a8e85496	\N
3b22a8d2-d0eb-40ac-9f04-a643584f4373	2	Заполняющий	270	310	23	26	\N	\N	c471ba8a-ec20-488d-aa3d-06d499abbd4c	\N
51fcacf2-e2dd-4f4d-894e-bd8a0233a0bc	1	Корневой	200	270	23	26	\N	\N	9b7a8e33-481f-47a1-9468-8a4a2ac2b4fc	\N
638b353e-f342-4871-8083-b1378fc8825e	2	Заполняющий	270	310	23	26	\N	\N	37c7d574-8bd4-4592-847d-cffb587c4d1f	\N
63953141-8fe7-4d99-ba90-8c076bb0681b	2	Заполняющий	270	310	23	26	\N	\N	c5886432-5dbf-4b3e-9243-7a49b16804af	\N
64e3a646-1b52-4937-9112-94c6330fa1e8	1	Корневой	200	270	23	26	\N	\N	c471ba8a-ec20-488d-aa3d-06d499abbd4c	\N
71ae68fb-e028-4676-998d-2c2e890bed4d	2	Заполняющий	270	310	23	26	\N	\N	418a1caa-280c-4a09-a518-f9ab5934244e	\N
7acc9c55-0203-4b27-a3ce-6a0ec961f539	2	Заполняющий	270	310	23	26	\N	\N	d037daba-a4ea-4c35-9f4e-46ce1571e157	\N
8213d9f3-3bb4-4c03-98e9-39cecd10341b	1	Корневой	200	270	23	26	\N	\N	418a1caa-280c-4a09-a518-f9ab5934244e	\N
90ed076d-9b8c-4109-929a-c0a5c176534b	2	Заполняющий	270	310	23	26	\N	\N	e0d1d9d5-64e5-44e9-ae68-9b82815a0de2	\N
9190f325-d7df-4de2-801b-c1ec8c672110	1	Корневой	200	270	23	26	\N	\N	d0230432-e03a-42aa-ab24-393fe78f0f56	\N
9acf59e3-3300-441e-a868-3e77d80d7b12	2	Заполняющий	270	310	23	26	\N	\N	9b7a8e33-481f-47a1-9468-8a4a2ac2b4fc	\N
b2eef3d2-6c09-470c-9e04-b8c47dbc8da2	1	Корневой	200	270	23	26	\N	\N	6dd518cc-d659-4cc8-9650-2799a8e85496	\N
b77e05c6-f84f-4da6-8895-3eecea60a470	2	Заполняющий	270	310	23	26	\N	\N	d0230432-e03a-42aa-ab24-393fe78f0f56	\N
bae40104-5ecb-48c6-8e5b-2f913fbbbdea	1	Корневой	200	270	23	26	\N	\N	d037daba-a4ea-4c35-9f4e-46ce1571e157	\N
d5c4d696-9024-4be8-9cac-1369bcba4a81	1	Корневой	200	270	23	26	\N	\N	441631b8-055f-41c5-ba72-3ad85f211847	\N
e3eeadd7-b1e2-4414-90b4-f2395eb1bd4b	2	Заполняющий	270	310	23	26	\N	\N	441631b8-055f-41c5-ba72-3ad85f211847	\N
\.


--
-- Data for Name: WeldPassages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldPassages" ("Id", "Number", "Name", "PreheatingTemperature", "ShortTermDeviation", "LongTermDeviation", "IsEnsuringCurrentAllowance", "IsEnsuringVoltageAllowance", "IsEnsuringTemperatureAllowance", "Estimation", "WeldingRecordId", "WeldingTaskId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WelderWeldingEquipment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WelderWeldingEquipment" ("WeldersId", "WeldingEquipmentsId") FROM stdin;
0712edc2-bfe8-4169-848e-aaaac79bc642	cf542d4c-62c4-4625-9c06-4fad95df8f18
0712edc2-bfe8-4169-848e-aaaac79bc642	eb24fa95-7935-4d90-b45f-14e6b23bf7d5
0ec7ec29-d11a-44a5-b69a-d08e3aa8d17f	cf542d4c-62c4-4625-9c06-4fad95df8f18
0ec7ec29-d11a-44a5-b69a-d08e3aa8d17f	eb24fa95-7935-4d90-b45f-14e6b23bf7d5
2a509ff2-c3d9-4675-b1c3-fa063600926e	0b2db97f-d767-4b54-8b76-93de9e056724
5a69bb73-a885-46c3-899f-0d9ae7804034	cf542d4c-62c4-4625-9c06-4fad95df8f18
5a69bb73-a885-46c3-899f-0d9ae7804034	eb24fa95-7935-4d90-b45f-14e6b23bf7d5
70d9a2c9-7289-4bae-a983-5d8aba243ac4	cf542d4c-62c4-4625-9c06-4fad95df8f18
70d9a2c9-7289-4bae-a983-5d8aba243ac4	eb24fa95-7935-4d90-b45f-14e6b23bf7d5
844db31b-3c64-4ef6-8c9a-1303be02f8dd	42ba1bac-9bbf-43bd-9943-5bf67c0cef9c
a1d26bd5-37ea-4f0e-a223-4fe6be553679	42ba1bac-9bbf-43bd-9943-5bf67c0cef9c
d589c019-3db4-43ca-9b88-9ca9987fe10c	0b2db97f-d767-4b54-8b76-93de9e056724
\.


--
-- Data for Name: Welders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Welders" ("Id", "UserId", "WorkplaceId", "IdFromSystem") FROM stdin;
0712edc2-bfe8-4169-848e-aaaac79bc642	5ab776b3-ff13-4aaa-a07b-50fdfb8ce923	\N	146164
0ec7ec29-d11a-44a5-b69a-d08e3aa8d17f	dabde064-cce0-4991-9080-b1c4217598de	\N	150882
2a509ff2-c3d9-4675-b1c3-fa063600926e	78f8d39a-a80d-421d-8b32-ee8992371175	\N	122575
5a69bb73-a885-46c3-899f-0d9ae7804034	9dee5a50-3e90-42af-99f3-4da3cd7df184	\N	150838
70d9a2c9-7289-4bae-a983-5d8aba243ac4	825046f3-c27a-4b00-9a7b-50c81e40ee40	\N	114729
844db31b-3c64-4ef6-8c9a-1303be02f8dd	19314938-979e-4efa-982d-5fc0f46dd6ab	\N	121267
a1d26bd5-37ea-4f0e-a223-4fe6be553679	0cb53279-d696-43cf-82d7-83cc5df87d8e	\N	117390
d589c019-3db4-43ca-9b88-9ca9987fe10c	9704f275-e136-4417-9407-734587175357	\N	132695
\.


--
-- Data for Name: WeldingEquipmentConditionTimes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentConditionTimes" ("Id", "Condition", "Date", "StartConditionTime", "Time", "WeldingEquipmentId", "WelderId", "DowntimeReasonId", "IdFromSystem") FROM stdin;
\.


--
-- Data for Name: WeldingEquipmentWorkplace; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipmentWorkplace" ("WeldingEquipmentsId", "WorkplacesId") FROM stdin;
0b2db97f-d767-4b54-8b76-93de9e056724	a600d6d6-85af-443c-ac81-360ec2b506d6
0b2db97f-d767-4b54-8b76-93de9e056724	ec1e0178-88b7-44d0-84be-b1feb74f8828
42ba1bac-9bbf-43bd-9943-5bf67c0cef9c	7b07da4c-05f1-4ea9-8fed-f31f07b20e66
42ba1bac-9bbf-43bd-9943-5bf67c0cef9c	a1edb196-ac47-4db9-ad49-0cc99a166a63
cf542d4c-62c4-4625-9c06-4fad95df8f18	2342d6c4-0ff1-4e8e-aed5-1ef72317893f
cf542d4c-62c4-4625-9c06-4fad95df8f18	52428a80-1ac7-49a1-b0e5-9c32d139cc68
cf542d4c-62c4-4625-9c06-4fad95df8f18	7b07da4c-05f1-4ea9-8fed-f31f07b20e66
cf542d4c-62c4-4625-9c06-4fad95df8f18	ec1e0178-88b7-44d0-84be-b1feb74f8828
eb24fa95-7935-4d90-b45f-14e6b23bf7d5	2342d6c4-0ff1-4e8e-aed5-1ef72317893f
eb24fa95-7935-4d90-b45f-14e6b23bf7d5	52428a80-1ac7-49a1-b0e5-9c32d139cc68
eb24fa95-7935-4d90-b45f-14e6b23bf7d5	7b07da4c-05f1-4ea9-8fed-f31f07b20e66
eb24fa95-7935-4d90-b45f-14e6b23bf7d5	ec1e0178-88b7-44d0-84be-b1feb74f8828
\.


--
-- Data for Name: WeldingEquipments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeldingEquipments" ("Id", "Name", "Marking", "FactoryNumber", "CommissioningDate", "CurrentCondition", "Height", "Width", "Lenght", "GroupNumber", "ManufacturerName", "NextAttestationDate", "WeldingProcess", "IdleVoltage", "WeldingCurrentMin", "WeldingCurrentMax", "ArcVoltageMin", "ArcVoltageMax", "LoadDuration", "PostId", "MasterId", "IdFromSystem", "RfidTag") FROM stdin;
0b2db97f-d767-4b54-8b76-93de9e056724	Полуавтомат сварочный	GLC556-C	49286	2010-07-29 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	3e8d8b29-3069-416c-ba06-2ed519614333	49286	35:4E:AC:A5
42ba1bac-9bbf-43bd-9943-5bf67c0cef9c	Полуавтомат сварочный	GLC556-C	49232	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	3e8d8b29-3069-416c-ba06-2ed519614333	49232	03:3D:93:0D
cf542d4c-62c4-4625-9c06-4fad95df8f18	Полуавтомат сварочный	GLC556-C	49141	2005-01-28 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	80	550	18	41.5	100	\N	3e8d8b29-3069-416c-ba06-2ed519614333	49141	93:57:D8:0B
eb24fa95-7935-4d90-b45f-14e6b23bf7d5	Полуавтомат сварочный	GLC556-C	49283	2008-10-31 00:00:00	1	\N	\N	\N	3.11	CLOOS	\N	Полуавтоматическая сварка	70	10	500	14.5	39	100	\N	3e8d8b29-3069-416c-ba06-2ed519614333	49283	A6:F1:CF:48
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
\.


--
-- Data for Name: WorkingShifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorkingShifts" ("Id", "Number", "ShiftStart", "ShiftEnd", "BreakStart", "BreakEnd", "DayId", "CalendarId", "IdFromSystem") FROM stdin;
8eae6a50-3c9b-4678-b829-282d793c5ebb	1	07:30:00	16:00:00	12:00:00	12:30:00	\N	94d80ba5-d897-4879-9088-af1d7af3562d	\N
ae37e59b-2368-42d0-890d-274ceb9812f6	2	16:00:00	00:30:00	20:00:00	20:30:00	\N	94d80ba5-d897-4879-9088-af1d7af3562d	\N
d3156660-daa8-42e9-9419-8550c8e9884f	3	00:30:00	07:50:00	02:00:00	02:20:00	\N	94d80ba5-d897-4879-9088-af1d7af3562d	\N
067e697a-b528-45b1-a21f-f93689645c78	1	07:30:00	15:00:00	12:00:00	12:30:00	4348dfa4-4ae9-4be5-93d3-c5f5a0b25b69	\N	\N
09d72e7f-ffbf-41f7-ac9b-0ac54c478322	3	00:30:00	06:50:00	02:00:00	02:20:00	4d1c22d8-ece4-41d5-901a-bded1c62a293	\N	\N
142ee91f-169d-4f9e-bf6e-5ef76bbe35d4	2	16:00:00	23:30:00	20:00:00	20:30:00	b035a5cd-90c8-42a7-b1be-cd1ec3995073	\N	\N
174fab5b-226a-4d1a-a177-55571708cbf6	2	16:00:00	23:30:00	20:00:00	20:30:00	7fcd6518-a729-4256-9fa6-a693a50cca97	\N	\N
228eb45b-c3e9-4a9e-b8a6-a6a52f261120	3	00:30:00	06:50:00	02:00:00	02:20:00	4348dfa4-4ae9-4be5-93d3-c5f5a0b25b69	\N	\N
4aef3ca9-13e1-444d-82b0-f55a7b1c4cc5	1	07:30:00	15:00:00	12:00:00	12:30:00	c7e2e97c-436a-4709-9b50-143fbfa4ba5c	\N	\N
4b955635-26b2-46f8-a2d2-67cddce47771	1	07:30:00	15:00:00	12:00:00	12:30:00	4d1c22d8-ece4-41d5-901a-bded1c62a293	\N	\N
6aac5e4f-31a0-4f41-9878-154725d0a4b3	1	07:30:00	15:00:00	12:00:00	12:30:00	7fcd6518-a729-4256-9fa6-a693a50cca97	\N	\N
6abab5c2-fb3c-434a-a214-d6017feea4b6	3	00:30:00	06:50:00	02:00:00	02:20:00	c7e2e97c-436a-4709-9b50-143fbfa4ba5c	\N	\N
6ee05de0-559e-4868-9725-a70a8b17632b	2	16:00:00	23:30:00	20:00:00	20:30:00	4d1c22d8-ece4-41d5-901a-bded1c62a293	\N	\N
7a5848a9-211a-47be-9cfb-3d1f39383843	3	00:30:00	06:50:00	02:00:00	02:20:00	b035a5cd-90c8-42a7-b1be-cd1ec3995073	\N	\N
89cf502f-b37a-4ad9-ac2c-d0b542b8ea38	2	16:00:00	23:30:00	20:00:00	20:30:00	4348dfa4-4ae9-4be5-93d3-c5f5a0b25b69	\N	\N
a958b529-45d2-4eca-b51c-6c9dec4142db	2	16:00:00	23:30:00	20:00:00	20:30:00	c7e2e97c-436a-4709-9b50-143fbfa4ba5c	\N	\N
c8ad0fd9-ed44-4951-8f06-616cba047db6	1	07:30:00	15:00:00	12:00:00	12:30:00	b035a5cd-90c8-42a7-b1be-cd1ec3995073	\N	\N
e539dd5c-c07a-4601-9995-3e19dd644887	3	00:30:00	06:50:00	02:00:00	02:20:00	7fcd6518-a729-4256-9fa6-a693a50cca97	\N	\N
\.


--
-- Data for Name: Workplaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workplaces" ("Id", "Number", "PostId", "ProductionAreaId", "IdFromSystem") FROM stdin;
2342d6c4-0ff1-4e8e-aed5-1ef72317893f	3690	\N	c2043c99-ee52-4602-9e37-818be24513ba	3690
52428a80-1ac7-49a1-b0e5-9c32d139cc68	3550	\N	c2043c99-ee52-4602-9e37-818be24513ba	3550
7b07da4c-05f1-4ea9-8fed-f31f07b20e66	3610	\N	c2043c99-ee52-4602-9e37-818be24513ba	3610
a1edb196-ac47-4db9-ad49-0cc99a166a63	3600	\N	c2043c99-ee52-4602-9e37-818be24513ba	3600
a600d6d6-85af-443c-ac81-360ec2b506d6	3510	\N	c2043c99-ee52-4602-9e37-818be24513ba	3510
ec1e0178-88b7-44d0-84be-b1feb74f8828	3500	\N	c2043c99-ee52-4602-9e37-818be24513ba	3500
\.


--
-- Data for Name: Workshops; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Workshops" ("Id", "Name", "Number", "IdFromSystem") FROM stdin;
bf9f9876-de64-42b7-9ecb-9828781bc3a8	Сварочный цех	50	050
\.


--
-- Name: WeldingTasks_Number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeldingTasks_Number_seq"', 1, false);


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
-- Name: IX_WeldingEquipmentConditionTimes_WelderId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_WeldingEquipmentConditionTimes_WelderId" ON public."WeldingEquipmentConditionTimes" USING btree ("WelderId");


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
-- Name: WeldingEquipmentConditionTimes FK_WeldingEquipmentConditionTimes_Welders_WelderId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeldingEquipmentConditionTimes"
    ADD CONSTRAINT "FK_WeldingEquipmentConditionTimes_Welders_WelderId" FOREIGN KEY ("WelderId") REFERENCES public."Welders"("Id") ON DELETE CASCADE;


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

