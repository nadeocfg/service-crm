--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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

--
-- Name: service-crm; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "service-crm";


ALTER SCHEMA "service-crm" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cash; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm".cash (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "readySum" bigint DEFAULT 0 NOT NULL,
    "notReadySum" bigint DEFAULT 0 NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "paidSum" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE "service-crm".cash OWNER TO postgres;

--
-- Name: cashHistoryLog; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."cashHistoryLog" (
    id integer NOT NULL,
    "createdBy" integer NOT NULL,
    "serviceManId" integer NOT NULL,
    "requestedAmount" integer DEFAULT 0 NOT NULL,
    "readySumAfter" integer NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now(),
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE "service-crm"."cashHistoryLog" OWNER TO postgres;

--
-- Name: TABLE "cashHistoryLog"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."cashHistoryLog" IS 'cash operation history';


--
-- Name: cashHistoryLog_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."cashHistoryLog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."cashHistoryLog_id_seq" OWNER TO postgres;

--
-- Name: cashHistoryLog_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."cashHistoryLog_id_seq" OWNED BY "service-crm"."cashHistoryLog".id;


--
-- Name: cash_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm".cash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm".cash_id_seq OWNER TO postgres;

--
-- Name: cash_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm".cash_id_seq OWNED BY "service-crm".cash.id;


--
-- Name: customers; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm".customers (
    id integer NOT NULL,
    address text NOT NULL,
    email text,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "createdBy" integer NOT NULL,
    "fullName" text NOT NULL,
    phone text NOT NULL,
    phone2 text,
    "isActive" boolean DEFAULT true NOT NULL,
    "boilerSerial" text NOT NULL,
    "boilerId" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "service-crm".customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm".customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm".customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm".customers_id_seq OWNED BY "service-crm".customers.id;


--
-- Name: dictBoilers; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."dictBoilers" (
    id integer NOT NULL,
    article text NOT NULL,
    name text NOT NULL,
    price integer DEFAULT 0 NOT NULL,
    "daysOfGuarantee" integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    price1 integer,
    price2 integer,
    price3 integer,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "createdBy" integer NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."dictBoilers" OWNER TO postgres;

--
-- Name: TABLE "dictBoilers"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."dictBoilers" IS '???????????????????? ????????????';


--
-- Name: dictBoilers_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."dictBoilers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."dictBoilers_id_seq" OWNER TO postgres;

--
-- Name: dictBoilers_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."dictBoilers_id_seq" OWNED BY "service-crm"."dictBoilers".id;


--
-- Name: dictJobTypes; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."dictJobTypes" (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now(),
    price integer DEFAULT 0 NOT NULL,
    "createdBy" integer NOT NULL,
    "daysOfGuarantee" integer DEFAULT 0 NOT NULL,
    price1 integer,
    price2 integer,
    price3 integer,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."dictJobTypes" OWNER TO postgres;

--
-- Name: TABLE "dictJobTypes"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."dictJobTypes" IS '???????? ??????????';


--
-- Name: dictJobTypes_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."dictJobTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."dictJobTypes_id_seq" OWNER TO postgres;

--
-- Name: dictJobTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."dictJobTypes_id_seq" OWNED BY "service-crm"."dictJobTypes".id;


--
-- Name: dictOrderStatuses; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."dictOrderStatuses" (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    action text,
    "availableOn" text,
    "commentRequired" boolean DEFAULT false NOT NULL
);


ALTER TABLE "service-crm"."dictOrderStatuses" OWNER TO postgres;

--
-- Name: dictOrderStatuses_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."dictOrderStatuses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."dictOrderStatuses_id_seq" OWNER TO postgres;

--
-- Name: dictOrderStatuses_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."dictOrderStatuses_id_seq" OWNED BY "service-crm"."dictOrderStatuses".id;


--
-- Name: dictParts; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."dictParts" (
    id integer NOT NULL,
    article text NOT NULL,
    name text NOT NULL,
    price integer DEFAULT 0 NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "daysOfGuarantee" integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    price1 integer DEFAULT 0 NOT NULL,
    price2 integer DEFAULT 0 NOT NULL,
    price3 integer DEFAULT 0 NOT NULL,
    "createdBy" integer,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."dictParts" OWNER TO postgres;

--
-- Name: TABLE "dictParts"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."dictParts" IS '???????????????????? ??????????????????';


--
-- Name: dictParts_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."dictParts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."dictParts_id_seq" OWNER TO postgres;

--
-- Name: dictParts_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."dictParts_id_seq" OWNED BY "service-crm"."dictParts".id;


--
-- Name: dictRoles; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."dictRoles" (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."dictRoles" OWNER TO postgres;

--
-- Name: dict_roles_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm".dict_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm".dict_roles_id_seq OWNER TO postgres;

--
-- Name: dict_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm".dict_roles_id_seq OWNED BY "service-crm"."dictRoles".id;


--
-- Name: orders; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm".orders (
    id integer NOT NULL,
    "customerId" integer NOT NULL,
    "createdBy" integer NOT NULL,
    address text NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    status integer NOT NULL,
    "serviceManId" integer NOT NULL,
    comment text,
    "isActive" boolean DEFAULT true NOT NULL,
    "isPaidOut" boolean DEFAULT false NOT NULL,
    "boilerId" integer DEFAULT 0 NOT NULL,
    "visitPrice" integer DEFAULT 0 NOT NULL,
    "totalSum" bigint DEFAULT 0 NOT NULL,
    phone text,
    "doneDate" timestamp with time zone
);


ALTER TABLE "service-crm".orders OWNER TO postgres;

--
-- Name: ordersStatusHistory; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."ordersStatusHistory" (
    id integer NOT NULL,
    "orderId" integer NOT NULL,
    status integer NOT NULL,
    comment text,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "createdBy" integer NOT NULL
);


ALTER TABLE "service-crm"."ordersStatusHistory" OWNER TO postgres;

--
-- Name: TABLE "ordersStatusHistory"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."ordersStatusHistory" IS 'Orders status history log';


--
-- Name: ordersStatusHistory_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."ordersStatusHistory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."ordersStatusHistory_id_seq" OWNER TO postgres;

--
-- Name: ordersStatusHistory_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."ordersStatusHistory_id_seq" OWNED BY "service-crm"."ordersStatusHistory".id;


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm".orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm".orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm".orders_id_seq OWNED BY "service-crm".orders.id;


--
-- Name: serviceManPaidOuts; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."serviceManPaidOuts" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    job integer DEFAULT 0 NOT NULL,
    parts integer DEFAULT 0,
    visit integer DEFAULT 0,
    "orderId" integer NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "isPaid" boolean DEFAULT false NOT NULL
);


ALTER TABLE "service-crm"."serviceManPaidOuts" OWNER TO postgres;

--
-- Name: paidOuts_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."paidOuts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."paidOuts_id_seq" OWNER TO postgres;

--
-- Name: paidOuts_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."paidOuts_id_seq" OWNED BY "service-crm"."serviceManPaidOuts".id;


--
-- Name: soldBoilers; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."soldBoilers" (
    id integer NOT NULL,
    "boilerId" integer NOT NULL,
    price integer DEFAULT 0 NOT NULL,
    "serialNumber" text NOT NULL,
    quantity integer DEFAULT 0,
    sum integer DEFAULT 0 NOT NULL,
    "orderId" integer NOT NULL,
    "launchDate" date,
    "daysOfGuarantee" integer DEFAULT 0 NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."soldBoilers" OWNER TO postgres;

--
-- Name: TABLE "soldBoilers"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."soldBoilers" IS '???????????? ?????????????????? ????????????';


--
-- Name: soldBoilers_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."soldBoilers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."soldBoilers_id_seq" OWNER TO postgres;

--
-- Name: soldBoilers_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."soldBoilers_id_seq" OWNED BY "service-crm"."soldBoilers".id;


--
-- Name: soldJobTypes; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."soldJobTypes" (
    id integer NOT NULL,
    "jobTypeId" integer NOT NULL,
    price integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    sum integer DEFAULT 0 NOT NULL,
    "orderId" integer NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "daysOfGuarantee" integer,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."soldJobTypes" OWNER TO postgres;

--
-- Name: TABLE "soldJobTypes"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."soldJobTypes" IS '???????????? ?????????????????? ??????????';


--
-- Name: soldJobTypes_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."soldJobTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."soldJobTypes_id_seq" OWNER TO postgres;

--
-- Name: soldJobTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."soldJobTypes_id_seq" OWNED BY "service-crm"."soldJobTypes".id;


--
-- Name: soldParts; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm"."soldParts" (
    id integer NOT NULL,
    price integer DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    sum integer DEFAULT 0 NOT NULL,
    "orderId" integer NOT NULL,
    "partId" integer NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    "daysOfGuarantee" integer DEFAULT 0 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL
);


ALTER TABLE "service-crm"."soldParts" OWNER TO postgres;

--
-- Name: TABLE "soldParts"; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm"."soldParts" IS '???????????? ?????????????????? ??????????????????';


--
-- Name: soldParts_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm"."soldParts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm"."soldParts_id_seq" OWNER TO postgres;

--
-- Name: soldParts_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm"."soldParts_id_seq" OWNED BY "service-crm"."soldParts".id;


--
-- Name: users; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm".users (
    id integer NOT NULL,
    login text NOT NULL,
    "birthDay" date,
    password text NOT NULL,
    phone text NOT NULL,
    "isActive" boolean DEFAULT true,
    "createdDate" timestamp with time zone DEFAULT now(),
    "updatedDate" timestamp with time zone DEFAULT now(),
    "fullName" text DEFAULT 'Full name'::text NOT NULL,
    "roleId" integer DEFAULT 3 NOT NULL,
    "percentFromJob" integer,
    "percentFromParts" integer,
    "percentFromVisit" integer
);


ALTER TABLE "service-crm".users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm".users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm".users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm".users_id_seq OWNED BY "service-crm".users.id;


--
-- Name: utils; Type: TABLE; Schema: service-crm; Owner: postgres
--

CREATE TABLE "service-crm".utils (
    id integer NOT NULL,
    name text NOT NULL,
    value text NOT NULL,
    "createdDate" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedDate" timestamp with time zone DEFAULT now() NOT NULL,
    description text
);


ALTER TABLE "service-crm".utils OWNER TO postgres;

--
-- Name: TABLE utils; Type: COMMENT; Schema: service-crm; Owner: postgres
--

COMMENT ON TABLE "service-crm".utils IS 'table for utils constants';


--
-- Name: utils_id_seq; Type: SEQUENCE; Schema: service-crm; Owner: postgres
--

CREATE SEQUENCE "service-crm".utils_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "service-crm".utils_id_seq OWNER TO postgres;

--
-- Name: utils_id_seq; Type: SEQUENCE OWNED BY; Schema: service-crm; Owner: postgres
--

ALTER SEQUENCE "service-crm".utils_id_seq OWNED BY "service-crm".utils.id;


--
-- Name: cash id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".cash ALTER COLUMN id SET DEFAULT nextval('"service-crm".cash_id_seq'::regclass);


--
-- Name: cashHistoryLog id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."cashHistoryLog" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."cashHistoryLog_id_seq"'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".customers ALTER COLUMN id SET DEFAULT nextval('"service-crm".customers_id_seq'::regclass);


--
-- Name: dictBoilers id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictBoilers" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."dictBoilers_id_seq"'::regclass);


--
-- Name: dictJobTypes id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictJobTypes" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."dictJobTypes_id_seq"'::regclass);


--
-- Name: dictOrderStatuses id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictOrderStatuses" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."dictOrderStatuses_id_seq"'::regclass);


--
-- Name: dictParts id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictParts" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."dictParts_id_seq"'::regclass);


--
-- Name: dictRoles id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictRoles" ALTER COLUMN id SET DEFAULT nextval('"service-crm".dict_roles_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".orders ALTER COLUMN id SET DEFAULT nextval('"service-crm".orders_id_seq'::regclass);


--
-- Name: ordersStatusHistory id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."ordersStatusHistory" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."ordersStatusHistory_id_seq"'::regclass);


--
-- Name: serviceManPaidOuts id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."serviceManPaidOuts" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."paidOuts_id_seq"'::regclass);


--
-- Name: soldBoilers id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldBoilers" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."soldBoilers_id_seq"'::regclass);


--
-- Name: soldJobTypes id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldJobTypes" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."soldJobTypes_id_seq"'::regclass);


--
-- Name: soldParts id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldParts" ALTER COLUMN id SET DEFAULT nextval('"service-crm"."soldParts_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".users ALTER COLUMN id SET DEFAULT nextval('"service-crm".users_id_seq'::regclass);


--
-- Name: utils id; Type: DEFAULT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".utils ALTER COLUMN id SET DEFAULT nextval('"service-crm".utils_id_seq'::regclass);


--
-- Data for Name: cash; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") FROM stdin;
1	36	0	0	2022-01-01 08:00:40.46918+00	2022-04-13 09:23:28.916167+00	0
\.


--
-- Data for Name: cashHistoryLog; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."cashHistoryLog" (id, "createdBy", "serviceManId", "requestedAmount", "readySumAfter", "createdDate", "updatedDate") FROM stdin;
1	1	36	100	85900	2022-01-11 12:30:51.788908+00	2022-01-11 12:30:51.788908+00
2	1	36	200	85700	2022-01-11 12:34:49.165935+00	2022-01-11 12:34:49.165935+00
3	1	36	100	85600	2022-01-11 12:34:56.007136+00	2022-01-11 12:34:56.007136+00
4	1	36	200	85400	2022-01-11 18:00:52.72906+00	2022-01-11 18:00:52.72906+00
5	32	36	2000	83400	2022-01-13 04:43:56.68305+00	2022-01-13 04:43:56.68305+00
6	32	36	40000	43400	2022-01-13 07:41:05.459244+00	2022-01-13 07:41:05.459244+00
7	32	36	43500	32900	2022-01-20 08:22:02.431639+00	2022-01-20 08:22:02.431639+00
8	32	36	32900	0	2022-01-20 08:22:15.400115+00	2022-01-20 08:22:15.400115+00
9	32	36	15870	0	2022-04-13 09:23:28.917752+00	2022-04-13 09:23:28.917752+00
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId") FROM stdin;
50	????. ??????????????????, 139??	asd@asd.rr	2022-03-02 08:28:13.691558+00	2022-04-17 10:25:26.648356+00	32	????????_1	+7 (777) 777-77-77	+7 (123) 123-45-67	t	123123123123	11
66	?????????????? ????????????????		2022-04-15 12:22:48.684545+00	2022-04-17 10:44:30.415806+00	42	??????????	+7 (701) 521-11-46		t	1509	16
67	???????????????? 286		2022-04-18 03:25:29.322979+00	2022-04-18 03:25:29.322979+00	42	????????	+7 (707) 832-16-88		t	1705	16
68	?????????? 3??		2022-04-18 03:28:37.674818+00	2022-04-18 03:28:37.674818+00	42	??????????	+7 (701) 511-14-40		t	1704	30
57	????. ???????????? 67		2022-04-14 06:29:47.419285+00	2022-04-19 12:48:41.260955+00	42	??????????	+7 (701) 343-73-11		t	6LK000142562	11
59	????. ?????????? ????????????, 17/1		2022-04-14 06:41:53.28488+00	2022-04-19 12:52:23.146119+00	32	??????????	+7 (776) 777-77-54		t	5BH131000512	42
61	???????????????? ???????????? 55		2022-04-14 07:07:20.948964+00	2022-04-19 12:54:06.242141+00	42	????????	+7 (778) 666-66-77		t	5G5181000231	17
62	?????????????? ??????????????????????		2022-04-14 10:18:34.76866+00	2022-04-19 12:57:13.440361+00	42	??????????????	+7 (708) 943-08-90		t	6LT001209899	17
65	?????????????????? ???????? 6?? ??????????		2022-04-15 05:03:55.885312+00	2022-04-19 12:58:33.500734+00	42	??????????	+7 (700) 264-34-75		t	5G1181000339	15
69	?????????? 67		2022-04-18 05:01:58.504543+00	2022-04-19 13:08:26.835967+00	42	????????????	+7 (701) 324-04-88		t	6LK000202022	16
60	??. ????????????????, ????. ????????????????, 71		2022-04-14 06:51:48.829443+00	2022-04-14 06:51:48.829443+00	32	???????????? ??????	+7 (776) 213-86-86		t	RT_??????????_140422-1	40
51	??????. ????????????????, ????. 1 ??????, ??. 14		2022-04-13 07:02:22.629464+00	2022-04-14 07:03:32.087336+00	32	?????? ??????????????	+7 (705) 625-51-79		t	6LK000271590	13
53	??????. ????????????, ????. ??????????????, 5		2022-04-13 07:47:03.947889+00	2022-04-14 08:51:57.865734+00	32	??????????????????	+7 (777) 277-83-25	+7 (708) 971-42-49	t	502161000468	12
52	??????. ????????????????, ????. ?????????? ????????, ??. 21		2022-04-13 07:44:22.558103+00	2022-04-14 08:54:19.129881+00	32	???????????? SSB	+7 (777) 290-00-77		t	SSB_????????????_1	41
63	?????????????? 25		2022-04-14 10:46:34.805071+00	2022-04-14 10:46:34.805071+00	42	???????????? 	+7 (707) 721-09-58	+7 (701) 721-09-58	t	1405	30
64	???????????? ?????????????????? 		2022-04-15 04:21:05.396635+00	2022-04-15 04:21:05.396635+00	42	??????????	+7 (771) 606-21-21		t	1506	22
49	??????????????????????, 123	test@test123.kz	2022-01-01 07:25:28.21198+00	2022-04-17 10:16:10.109809+00	1	????????_222	+7 (435) 345-34-53	+7 (345) 345-34-53	t	Z 123456987 SD	13
54	???????????????? ?????????????? 23/1		2022-04-14 03:09:05.008446+00	2022-04-14 03:09:05.008446+00	42	????????	+7 (701) 289-71-23		t	123????????????????	16
55	???????????????? ????????		2022-04-14 03:16:59.430402+00	2022-04-14 03:16:59.430402+00	42	??????????	+7 (707) 515-97-71		t	1404	13
56	?????????????????????????? 41		2022-04-14 04:05:33.250116+00	2022-04-14 04:05:33.250116+00	42	??????????????	+7 (778) 480-97-23		t	14??4	13
58	????. ??????????????????, 37		2022-04-14 06:34:52.334311+00	2022-04-14 06:34:52.334311+00	32	????????????????	+7 (701) 774-75-24		t	RINNAI_??????????_1	39
\.


--
-- Data for Name: dictBoilers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") FROM stdin;
29	AR3301672	Ariston Alteas XC 35	0	1095	99999999	0	0	0	2022-04-13 06:50:26.888313+00	2022-04-13 07:00:59.481523+00	32	t
28	AR3301671	Ariston Alteas XC 30	0	1095	99999999	0	0	0	2022-04-13 06:50:18.980185+00	2022-04-13 07:01:08.008911+00	32	t
38	SSB20	SSB 20	0	0	99999999	0	0	0	2022-04-13 07:43:21.363711+00	2022-04-13 07:43:21.363711+00	32	t
39	RMF167	Rinnai RMF 167	0	1095	99999999	0	0	0	2022-04-14 06:32:38.807454+00	2022-04-14 06:32:38.807454+00	32	t
40	RT_PT16	???????????????? PT-16	0	1095	9999999	0	0	0	2022-04-14 06:50:32.825539+00	2022-04-14 06:50:32.825539+00	32	t
41	SSB25	SSB 25	0	1095	9999999	0	0	0	2022-04-14 08:53:39.837525+00	2022-04-14 08:53:39.837525+00	32	t
42	MGSEOUL21	Master Gas Seoul 21	0	1095	9999999	0	0	0	2022-04-19 12:51:52.15135+00	2022-04-19 12:51:52.15135+00	32	t
11	ESR2.20	DAESUNG ESR 2.20	340000	1095	99999999	0	0	0	2022-01-01 07:23:43.169227+00	2022-04-13 06:56:08.510975+00	1	t
12	ESR2.13	DAESUNG ESR 2.13	313000	1095	99999999	0	0	0	2022-01-20 08:23:47.000009+00	2022-04-13 06:56:13.123469+00	32	t
13	ESR2.30	DAESUNG ESR 2.30	374000	1095	99999999	0	0	0	2022-01-20 08:24:51.941351+00	2022-04-13 06:56:17.004054+00	32	t
14	ESR2.35	DAESUNG ESR 2.35	393000	1095	99999999	0	0	0	2022-01-20 08:25:02.397433+00	2022-04-13 06:56:21.489403+00	32	t
15	FAF2.13	FAF2.13	0	1095	99999999	0	0	0	2022-04-13 06:43:15.318535+00	2022-04-13 06:56:25.331344+00	32	t
16	FAF2.20	FAF2.20	0	1095	99999999	0	0	0	2022-04-13 06:43:38.946385+00	2022-04-13 06:58:38.231644+00	32	t
17	FAF2.30	FAF2.30	0	1095	99999999	0	0	0	2022-04-13 06:44:03.667826+00	2022-04-13 06:58:42.363769+00	32	t
18	FAF2.35	FAF2.35	0	1095	99999999	0	0	0	2022-04-13 06:44:11.636933+00	2022-04-13 06:58:45.67525+00	32	t
19	FAF2.50	FAF2.50	0	1095	99999999	0	0	0	2022-04-13 06:44:19.284016+00	2022-04-13 06:58:50.430269+00	32	t
20	FER_F18	Ferroli Fortuna F18	0	1095	99999999	0	0	0	2022-04-13 06:45:36.704563+00	2022-04-13 06:58:59.700623+00	32	t
21	FER_F24	Ferroli Fortuna F24	0	1095	99999999	0	0	0	2022-04-13 06:45:44.721064+00	2022-04-13 06:59:06.700736+00	32	t
22	FER_F32	Ferroli Fortuna F32	0	1095	99999999	0	0	0	2022-04-13 06:45:55.340458+00	2022-04-13 06:59:20.861416+00	32	t
23	FER_F40	Ferroli Fortuna F40	0	1095	99999999	0	0	0	2022-04-13 06:46:03.488146+00	2022-04-13 06:59:31.010679+00	32	t
31	AR3301677	Ariston CLAS XC 28	0	1095	99999999	0	0	0	2022-04-13 06:51:18.851598+00	2022-04-13 06:59:38.27607+00	32	t
24	FER_HF24	Ferroli Fortuna HF24	0	1095	99999999	0	0	0	2022-04-13 06:46:25.454063+00	2022-04-13 06:59:46.291378+00	32	t
32	AR3301678	Ariston CLAS XC 35	0	1095	99999999	0	0	0	2022-04-13 06:51:27.181742+00	2022-04-13 06:59:54.097979+00	32	t
25	FER_HF32	Ferroli Fortuna HF32	0	1095	99999999	0	0	0	2022-04-13 06:46:32.471781+00	2022-04-13 07:00:01.413038+00	32	t
33	AR3301685	Ariston CARES XC 10	0	1095	99999999	0	0	0	2022-04-13 06:53:30.542665+00	2022-04-13 07:00:07.540266+00	32	t
26	FER_HF40	Ferroli Fortuna HF40	0	1095	99999999	0	0	0	2022-04-13 06:46:39.990948+00	2022-04-13 07:00:14.187159+00	32	t
34	AR3301684	Ariston CARES XC 15	0	1095	99999999	0	0	0	2022-04-13 06:53:41.537979+00	2022-04-13 07:00:21.299136+00	32	t
27	AR3301670	Ariston Alteas XC 24	0	1095	99999999	0	0	0	2022-04-13 06:50:07.144611+00	2022-04-13 07:00:27.705817+00	32	t
35	AR3301683	Ariston CARES XC 18	0	1095	99999999	0	0	0	2022-04-13 06:53:52.264587+00	2022-04-13 07:00:33.483151+00	32	t
36	AR3301682	Ariston CARES XC 24	0	1095	99999999	0	0	0	2022-04-13 06:54:01.099935+00	2022-04-13 07:00:41.57819+00	32	t
30	AR3301676	Ariston CLAS XC 24	0	1095	99999999	0	0	0	2022-04-13 06:51:05.883002+00	2022-04-13 07:00:48.01907+00	32	t
37	AR3300844	Ariston ALTEAS X 24	0	1095	99999999	0	0	0	2022-04-13 06:54:56.498507+00	2022-04-13 07:00:53.186626+00	32	t
\.


--
-- Data for Name: dictJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") FROM stdin;
29	WORK1	???????????? 1	2022-01-01 07:23:06.965276+00	2022-01-01 07:23:06.965276+00	5000	1	30	4000	3000	2000	t
30	1ST_START	??????	2022-01-20 08:26:07.94059+00	2022-04-13 06:39:53.171161+00	0	32	14	5000	0	0	t
32	MAINT	????????????????????????	2022-04-13 06:40:39.178992+00	2022-04-13 06:40:39.178992+00	15000	32	14	25000	0	0	t
33	PCB_REMOVE	???????????? ?????????? ????????????????????	2022-04-14 06:44:32.351565+00	2022-04-14 06:44:32.351565+00	3000	32	14	5000	10000	15000	t
34	DHW_CLEAN	???????????? ???????????????????????????? ??????	2022-04-14 06:56:42.914998+00	2022-04-14 06:56:42.914998+00	7000	32	14	9000	12000	15000	t
\.


--
-- Data for Name: dictOrderStatuses; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") FROM stdin;
1	CREATED	????????????	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	?????????????? ??????????	\N	f
6	SERVICE_DONE	????????????????	2021-12-10 08:59:45.943436+00	2021-12-10 08:59:45.943436+00	t	????????????????	IN_PROGRESS	f
4	DONE	????????????????	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	??????????????????	SERVICE_DONE	f
2	IN_PROGRESS	?? ????????????	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	?????????? ?? ????????????	CREATED, ON_HOLD	f
7	ON_HOLD	??????????????	2021-12-10 09:06:50.067763+00	2021-12-10 09:06:50.067763+00	t	????????????????	IN_PROGRESS, CREATED	t
3	CANCELED	??????????????	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	???????????????? ??????????	IN_PROGRESS, CREATED	t
\.


--
-- Data for Name: dictParts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") FROM stdin;
35	2060237	?????????????????????????? ?????? (20)	26300	2022-01-24 09:50:18.078726+00	2022-01-24 09:50:18.078726+00	30	10	0	0	13000	32	t
36	2060185A	?????????????????????????? ?????? (25-35)	32500	2022-01-24 09:50:46.771862+00	2022-01-24 09:50:46.771862+00	30	10	0	0	17600	32	t
37	53080487	?????????????????? ??18	500	2022-01-24 09:51:05.930622+00	2022-01-24 09:51:05.930622+00	30	10	0	0	300	32	t
38	53080484	?????????????????? ??6	500	2022-01-24 09:51:23.629535+00	2022-01-24 09:51:23.629535+00	30	10	0	0	300	32	t
39	2060229	???????????? ?????????????? ?????? (13-35)	17900	2022-01-24 09:51:55.234129+00	2022-01-24 09:51:55.234129+00	30	10	0	0	7400	32	t
40	53080472	?????????????????? ??18.6	500	2022-01-24 09:52:23.466939+00	2022-01-24 09:52:23.466939+00	30	10	0	0	300	32	t
41	3080546	?????????????????? ??22	500	2022-01-24 09:52:38.617705+00	2022-01-24 09:52:38.617705+00	30	10	0	0	300	32	t
42	3130527A	???????????? ?????????????????????? ?????? (ESR 13-35)	12100	2022-01-24 09:53:22.737471+00	2022-01-24 09:53:22.737471+00	30	10	0	0	3800	32	t
43	2080250	???????????? ?????????????????????? ?????????????????? (ESR 13-35)	12100	2022-01-24 09:53:54.159741+00	2022-01-24 09:53:54.159741+00	30	10	0	0	3800	32	t
44	2081017	???????????? ?????????????????? ???? ?????????????? (13-35)	10000	2022-01-24 09:54:29.744795+00	2022-01-24 09:54:29.744795+00	30	10	0	0	3000	32	t
45	52080973	?????????? (DSR-220RH, PLATINUM)	22700	2022-01-24 09:55:19.989278+00	2022-01-24 09:56:10.351974+00	30	10	0	0	12500	32	t
46	2080997	?????????? (DSR-550, ESR)	22700	2022-01-24 09:56:45.853739+00	2022-01-24 09:56:45.853739+00	30	10	0	0	12500	32	t
47	2082754	???????? ???????????????????? (A, D MAX 13-16)	49900	2022-01-24 09:58:57.817268+00	2022-01-24 09:58:57.817268+00	30	10	0	0	32900	32	t
48	2082746	???????? ???????????????????? (A, D MAX 20-35)	49900	2022-01-24 09:59:21.548933+00	2022-01-24 09:59:21.548933+00	30	10	0	0	32900	32	t
49	52070811	???????????????????????????? ?????? (A 13-20)	32300	2022-01-24 10:00:05.6656+00	2022-01-24 10:00:05.6656+00	30	10	0	0	18200	32	t
50	3012298	???????????? (A 13-16)	17700	2022-01-24 10:01:00.242603+00	2022-01-24 10:01:00.242603+00	30	10	0	0	5000	32	t
51	3011922M	???????????? (A 20)	18300	2022-01-24 10:01:26.666152+00	2022-01-24 10:01:26.666152+00	30	10	0	0	5500	32	t
52	2070847	?????????????????????????? ???????????????? (A 13-16)	41100	2022-01-24 10:02:10.41001+00	2022-01-24 10:02:10.41001+00	30	10	0	0	22600	32	t
53	2070830	?????????????????????????? ???????????????? (A 20)	46700	2022-01-24 10:02:45.558924+00	2022-01-24 10:02:45.558924+00	30	10	0	0	26800	32	t
54	3130448	???????????? ?????????????????????? ?????????????????? (A 13-35)	12100	2022-01-24 10:03:37.74454+00	2022-01-24 10:03:37.74454+00	30	10	0	0	3800	32	t
8	2070877	???????????????????????????? ?????? (ESR 2.13-35)	32300	2022-01-24 09:00:45.625884+00	2022-01-24 09:00:45.625884+00	30	10	0	0	18200	32	t
10	2080653	???????????????? (????????????????????)	15900	2022-01-24 09:02:06.916545+00	2022-01-24 09:02:06.916545+00	30	10	0	0	5900	32	t
9	2081212M	???????????????? (??????????????)	13000	2022-01-24 09:01:38.694007+00	2022-01-24 09:02:58.517923+00	30	10	0	0	3000	32	t
12	2080971	???????? ???????????????????? (PLATINUM)	49900	2022-01-24 09:04:03.283026+00	2022-01-24 09:04:03.283026+00	30	10	0	0	32900	32	t
14	2081024	???????? ???????????????????? (VANS)	49900	2022-01-24 09:14:04.279017+00	2022-01-24 09:14:04.279017+00	30	10	0	0	32900	32	t
19	3050075	???????????? (ESR 25-35)	19000	2022-01-24 09:19:41.00068+00	2022-01-24 09:19:41.00068+00	30	10	0	0	6000	32	t
55	52100317	???????????????????? (?? 13-16)	31500	2022-01-24 10:04:20.230383+00	2022-01-24 10:04:20.230383+00	30	10	0	0	18400	32	t
56	52060749	???????????????? ???????????????????? ?? ?????????????? ?????????????????? ???????????? (A 13-35)	23100	2022-01-24 10:05:06.095151+00	2022-01-24 10:05:06.095151+00	30	10	0	0	10600	32	t
20	2070392M	?????????????????????????? ???????????????? (ESR 13-16)	41100	2022-01-24 09:39:47.40057+00	2022-01-24 09:39:47.40057+00	30	10	0	0	22600	32	t
17	3050073	???????????? (ESR 13-16)	17700	2022-01-24 09:16:09.85036+00	2022-01-24 09:40:15.255171+00	30	10	0	0	5000	32	t
18	3050074	???????????? (ESR 20)	18300	2022-01-24 09:16:32.943867+00	2022-01-24 09:40:43.054923+00	30	10	0	0	5500	32	t
21	2070391M	?????????????????????????? ???????????????? (ESR 20)	46700	2022-01-24 09:41:38.119472+00	2022-01-24 09:41:38.119472+00	30	10	0	0	26800	32	t
23	2080390	???????????? ??????????????????	9500	2022-01-24 09:42:50.474593+00	2022-01-24 09:42:50.474593+00	30	10	0	0	2600	32	t
24	53080471	?????????????????? ??16	500	2022-01-24 09:43:35.177064+00	2022-01-24 09:43:35.177064+00	30	10	0	0	300	32	t
57	2080459A	???????????? ?????????????????????? ?????? (A 13-35)	12100	2022-01-24 10:05:42.899962+00	2022-01-24 10:05:42.899962+00	30	10	0	0	3800	32	t
25	2080364	?????????????????????????? ??????????????	16100	2022-01-24 09:44:10.17757+00	2022-01-24 09:44:10.17757+00	30	10	0	0	7600	32	t
26	2100259	???????????????????? (ESR 13-20)	31500	2022-01-24 09:45:07.696679+00	2022-01-24 09:45:07.696679+00	30	10	0	0	18400	32	t
58	2082743	?????????? (DR-240A, A)	22700	2022-01-24 10:06:34.245388+00	2022-01-24 10:06:34.245388+00	30	10	0	0	12500	32	t
27	2100291	???????????????????? (ESR 25-35)	31500	2022-01-24 09:45:26.503713+00	2022-01-24 09:45:26.503713+00	30	10	0	0	18400	32	t
60	2080768	???????? ???????????????????? (A MAX 50)	64100	2022-01-24 10:08:41.738581+00	2022-01-24 10:08:41.738581+00	30	10	0	0	43600	32	t
28	52050118	?????????? (ESR 13-20)	41900	2022-01-24 09:46:00.864624+00	2022-01-24 09:46:00.864624+00	30	10	0	0	25400	32	t
29	52050115	?????????? (ESR 25-35)	41900	2022-01-24 09:46:17.574777+00	2022-01-24 09:46:17.574777+00	30	10	0	0	25400	32	t
30	2060296	???????????????? ???????????????????? ?? ?????????????? ?????????????????? ???????????? (ESR 13-35)	23100	2022-01-24 09:47:46.60234+00	2022-01-24 09:47:46.60234+00	30	10	0	0	10600	32	t
31	53080473	?????????????????? ????????????	500	2022-01-24 09:48:17.463175+00	2022-01-24 09:48:17.463175+00	30	10	0	0	300	32	t
32	3080543	?????????????????? ??12	500	2022-01-24 09:48:36.165718+00	2022-01-24 09:48:36.165718+00	30	10	0	0	300	32	t
33	53080485	?????????????????? ??14	500	2022-01-24 09:48:50.868947+00	2022-01-24 09:48:50.868947+00	30	10	0	0	300	32	t
34	2060236	?????????????????????????? ?????? (13-16)	25500	2022-01-24 09:49:34.004646+00	2022-01-24 09:49:34.004646+00	30	10	0	0	12400	32	t
61	2030277	?????????????? ???????????? (50)	45000	2022-01-24 10:09:23.255632+00	2022-01-24 10:09:23.255632+00	30	10	0	0	36000	32	t
62	3090222	???????????? ???????????? ???????????? ???????????????? (50)	17000	2022-01-24 10:10:02.442981+00	2022-01-24 10:10:02.442981+00	30	10	0	0	5000	32	t
63	2070470	???????????????????????????? ?????? (50)	42300	2022-01-24 10:10:34.591143+00	2022-01-24 10:10:34.591143+00	30	10	0	0	32300	32	t
64	2060281	?????????????????????????? ?????? (50)	48100	2022-01-24 10:11:02.692741+00	2022-01-24 10:11:02.692741+00	30	10	0	0	29300	32	t
65	52100325	???????????????????? (50)	41500	2022-01-24 10:11:30.252732+00	2022-01-24 10:11:30.252732+00	30	10	0	0	31500	32	t
15	2081015	???????? ???????????????????? (EUROCLIMA)	49900	2022-01-24 09:14:23.794568+00	2022-01-24 09:14:23.794568+00	30	7	0	0	32900	32	t
11	2080833	???????? ???????????????????? (APRIL)	49900	2022-01-24 09:03:43.811919+00	2022-01-24 09:03:43.811919+00	30	9	0	0	32900	32	t
22	2070429M	?????????????????????????? ???????????????? (ESR 25-35)	54500	2022-01-24 09:42:13.149471+00	2022-01-24 09:42:13.149471+00	30	9	0	0	32600	32	t
7	2040105	3?????????????? ???????????? (2.13-35)	26300	2022-01-01 07:24:33.734711+00	2022-01-24 08:57:33.873357+00	30	490	0	0	11500	1	t
13	2080831	???????? ???????????????????? (ESR)	49900	2022-01-24 09:12:13.396103+00	2022-01-24 09:12:13.396103+00	30	8	0	0	32900	32	t
66	2070469M	?????????????????????????? ???????????????? (50)	96600	2022-01-24 10:12:07.316924+00	2022-01-24 10:12:07.316924+00	30	10	0	0	64200	32	t
67	2130439	?????????????????????????? ?????????????????????????????? (50)	122300	2022-01-24 10:12:38.403231+00	2022-01-24 10:12:38.403231+00	30	10	0	0	83500	32	t
68	2082760	?????????? (DSR-400U, 50)	32700	2022-01-24 10:13:12.658599+00	2022-01-24 10:13:12.658599+00	30	10	0	0	22700	32	t
16	2030280	?????????????? ???????????? (2.13-35)	36700	2022-01-24 09:14:59.508114+00	2022-01-24 09:14:59.508114+00	30	8	0	0	21500	32	t
\.


--
-- Data for Name: dictRoles; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictRoles" (id, code, name, "createdDate", "updatedDate", "isActive") FROM stdin;
1	SUPER_ADMIN	?????????? ??????????	2021-06-05 16:26:42.956451+00	2021-06-05 16:26:42.956451+00	t
2	ADMIN	??????????????????????????	2021-06-05 16:26:42.956451+00	2021-06-05 16:26:42.956451+00	t
3	SERVICE_MAN	???????????????????? ???? ??????????????	2021-06-05 16:26:42.956451+00	2021-06-05 16:26:42.956451+00	t
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") FROM stdin;
66	52	32	??????. ????????????????, ????. ?????????? ????????, ??. 21	2022-04-13 07:45:36.068784+00	2022-04-14 06:57:07.94735+00	6	36	?????? ??????.  ???????????????? ???????????????? ?????????? ?? ???????????? ??????????	t	f	38	5000	90003000	+7 (777) 290-00-77	\N
71	59	32	????. ?????????? ????????????, 17/1	2022-04-14 06:43:26.340692+00	2022-04-14 11:04:38.447942+00	6	39	???? ????????????????????. ????????????????, ?????? ???????????? ?????????? ????????????????????. ???????????????? ???????????????? ?????????? ?? ???????????? ??????????.	t	f	11	5000	58900	+7 (776) 777-77-54	\N
68	56	42	?????????????????????????? 41	2022-04-14 04:32:47.687813+00	2022-04-14 07:30:42.47827+00	6	39	???????????? ?????????????????? ???????????????????????????? 	t	f	13	5000	59500	+7 (778) 480-97-23	\N
75	54	42	???????????????? ?????????????? 23/1	2022-04-14 10:33:52.806621+00	2022-04-14 11:08:33.676549+00	3	39	??3 ???? ???????????? ???????????????????????????? 	t	f	16	5000	14000	+7 (701) 289-71-23	\N
78	65	42	?????????????????? ???????? 6?? ??????????	2022-04-15 05:05:55.684035+00	2022-04-15 12:26:06.887786+00	6	36	?????????????????????? ?????? 0	t	f	16	5000	0	+7 (700) 264-34-75	\N
65	51	32	??????. ????????????????, ????. 1 ??????, ??. 14	2022-04-13 07:35:49.909692+00	2022-04-14 07:34:17.95921+00	6	40	??????. ???????????????? ???????????????? ?????????? ?? ???????????? ??????????	t	f	15	3000	3000	+7 (705) 625-51-79	\N
82	69	42	?????????? 67	2022-04-18 05:02:33.952917+00	2022-04-19 13:07:46.537416+00	6	36	??????	t	f	16	0	0	+7 (701) 324-04-88	\N
73	61	42	???????????????? ???????????? 55	2022-04-14 07:09:57.518778+00	2022-04-14 11:39:05.912809+00	6	36	?????? ????. ???? ?????????????? 	t	f	17	5000	8000	+7 (778) 666-66-77	\N
76	63	42	?????????????? 25	2022-04-14 10:47:30.997968+00	2022-04-15 17:46:30.799639+00	6	38	?????? 17.00	t	f	30	5000	5000	+7 (707) 721-09-58	\N
69	57	42	????. ???????????? 67	2022-04-14 06:31:55.88745+00	2022-04-14 09:14:43.158252+00	6	40	??????	t	f	13	0	0	+7 (701) 343-73-11	\N
72	60	32	??. ????????????????, ????. ????????????????, 71	2022-04-14 06:53:53.609722+00	2022-04-15 04:38:04.918002+00	6	40	??????	t	f	40	2000	2000	+7 (776) 213-86-86	\N
67	53	32	??????. ????????????, ????. ??????????????, 5	2022-04-13 07:48:11.787276+00	2022-04-14 09:38:07.960929+00	6	36	????????????????????????. ???????????????? ?? ??????. ???????????????? ???????????????? ??????????	t	f	11	0	25000	+7 (777) 277-83-25	\N
70	58	32	????. ??????????????????, 37	2022-04-14 06:40:20.448847+00	2022-04-16 05:04:25.162195+00	6	36	???????????? 99. ???????????? ??????????. ???? 15.04.2022. ???????????????? ???????????????? ??????????	t	f	39	0	250000	+7 (701) 774-75-24	\N
79	66	42	?????????????? ????????????????	2022-04-15 12:23:44.783268+00	2022-04-16 08:14:56.237305+00	6	40	?????? ??????	t	f	16	5000	5000	+7 (701) 521-11-46	\N
74	62	42	?????????????? ??????????????????????	2022-04-14 10:19:21.563268+00	2022-04-15 06:40:52.37226+00	6	40	??????	t	f	16	2000	2000	+7 (708) 943-08-90	\N
77	64	42	???????????? ?????????????????? 	2022-04-15 04:22:21.236771+00	2022-04-18 03:33:16.99853+00	7	36	???????????? ???? ?????????????????????? 	t	f	22	0	0	+7 (771) 606-21-21	\N
81	68	42	?????????? 3??	2022-04-18 03:29:51.395914+00	2022-04-18 03:34:47.795626+00	3	39	?????? ??????	t	f	30	5000	5000	+7 (701) 511-14-40	\N
80	67	42	???????????????? 286	2022-04-18 03:26:11.92423+00	2022-04-18 05:46:18.238522+00	6	36	?????? ??????	t	f	16	5000	5000	+7 (707) 832-16-88	\N
\.


--
-- Data for Name: ordersStatusHistory; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") FROM stdin;
119	65	1	??????	2022-04-13 07:35:49.912523+00	32
120	66	1	?????? ??????	2022-04-13 07:45:36.071746+00	32
121	67	1	????????????????????????. ???????????????? ?? ??????	2022-04-13 07:48:11.790079+00	32
122	68	1	???????????? ?????????????????? ???????????????????????????? 	2022-04-14 04:32:47.690643+00	42
123	66	2		2022-04-14 04:55:20.285973+00	36
124	68	2		2022-04-14 05:12:35.687637+00	39
125	69	1	??????	2022-04-14 06:31:55.889987+00	42
126	70	1	???????????? 99. ???????????? ??????????. ???? 15.04.2022. ???????????????? ???????????????? ??????????	2022-04-14 06:40:20.451984+00	32
127	71	1	???? ????????????????????. ????????????????, ?????? ???????????? ?????????? ????????????????????. ???????????????? ???????????????? ?????????? ?? ???????????? ??????????.	2022-04-14 06:43:26.343711+00	32
128	66	6	???????????? ??????	2022-04-14 06:51:14.222709+00	36
129	72	1	??????	2022-04-14 06:53:53.612599+00	32
130	67	2	??????????????	2022-04-14 06:54:47.481026+00	36
131	73	1	?????? ????. ???? ?????????????? 	2022-04-14 07:09:57.521603+00	42
132	68	6		2022-04-14 07:30:42.480631+00	39
133	65	2		2022-04-14 07:34:05.247234+00	40
134	65	6		2022-04-14 07:34:17.961409+00	40
135	71	2		2022-04-14 07:40:16.719674+00	39
136	71	7	?????????? ???? ???????????? 	2022-04-14 08:44:39.851106+00	39
137	69	2		2022-04-14 09:14:40.202548+00	40
138	69	6		2022-04-14 09:14:43.159723+00	40
139	67	6		2022-04-14 09:38:07.963153+00	36
140	73	2		2022-04-14 09:46:35.714193+00	36
141	74	1	??????	2022-04-14 10:19:21.566558+00	42
142	75	1	????????????????	2022-04-14 10:33:52.809563+00	42
143	76	1	?????? 17.00	2022-04-14 10:47:31.000779+00	42
144	71	2		2022-04-14 11:03:27.553753+00	39
145	71	6		2022-04-14 11:04:38.450213+00	39
146	75	3	???????????? ???????????? ???? ????????????????. ?????????? ???????????????? ?????????? ??????????	2022-04-14 11:08:33.678481+00	39
147	73	6	???????????? ?????????????????????????????? ?????? ????	2022-04-14 11:39:05.914956+00	36
148	77	1	???????????? ???? ?????????????????????? 	2022-04-15 04:22:21.239695+00	42
149	72	2	???? ???????????????? ?????? 2'18	2022-04-15 04:24:17.682045+00	40
150	72	6		2022-04-15 04:38:04.920043+00	40
151	78	1	?????????????????????? ?????? 12000 ???????????? 32000	2022-04-15 05:05:55.686947+00	42
152	70	7	?????????????????? ???? ????????????. ?????????? ?? ?????????? ??????????	2022-04-15 05:21:49.42849+00	36
153	74	2		2022-04-15 06:37:03.713338+00	40
154	74	6	?????? ??????????	2022-04-15 06:40:52.374534+00	40
155	78	2	???? ???????????????? ???????????? 3-?? ?? ???????? ?? ?????? ???????? ??????	2022-04-15 10:38:20.639945+00	36
156	78	6	???? ???????????????? 	2022-04-15 11:00:57.987699+00	36
157	79	1	?????? ??????	2022-04-15 12:23:44.786093+00	42
158	76	2		2022-04-15 17:46:27.366521+00	38
159	76	6		2022-04-15 17:46:30.801762+00	38
160	70	2	???????????? ?????????????????????? ?? ???????????? ???????????????? ?????? ??????????????????	2022-04-16 05:04:16.229824+00	36
161	70	6		2022-04-16 05:04:25.164314+00	36
162	79	2		2022-04-16 08:14:50.095574+00	40
163	79	6	???????????? ??????	2022-04-16 08:14:56.239149+00	40
164	80	1	?????? ??????	2022-04-18 03:26:11.927865+00	42
165	81	1	?????? ??????	2022-04-18 03:29:51.398527+00	42
166	77	7	????????????????????	2022-04-18 03:33:17.001667+00	36
167	81	3	???????????? ?????? ????????????	2022-04-18 03:34:47.797567+00	39
168	82	1	??????	2022-04-18 05:02:33.955488+00	42
169	80	2	???????????? ??????	2022-04-18 05:45:40.22125+00	36
170	80	6	?????????????? 14000 ?????????? 	2022-04-18 05:46:18.240709+00	36
171	82	2		2022-04-19 13:07:17.505849+00	36
172	82	6		2022-04-19 13:07:46.539194+00	36
\.


--
-- Data for Name: serviceManPaidOuts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") FROM stdin;
38	36	12500	0	0	67	2022-04-13 07:48:11.796221+00	2022-04-13 07:48:29.363717+00	f
36	40	0	0	0	65	2022-04-13 07:35:49.918597+00	2022-04-13 07:49:01.039958+00	f
39	39	0	5450	5000	68	2022-04-14 04:32:47.697349+00	2022-04-14 04:32:47.697349+00	f
41	36	12500	0	0	70	2022-04-14 06:40:20.457645+00	2022-04-14 06:40:20.457645+00	f
42	39	400	4990	5000	71	2022-04-14 06:43:26.352683+00	2022-04-14 06:45:03.849466+00	f
40	40	0	0	0	69	2022-04-14 06:31:55.893668+00	2022-04-14 06:46:14.503453+00	f
43	40	0	0	0	72	2022-04-14 06:53:53.618009+00	2022-04-14 06:53:53.618009+00	f
37	36	4500	0	3000	66	2022-04-13 07:45:36.075425+00	2022-04-14 06:57:07.954444+00	f
45	40	0	0	0	74	2022-04-14 10:19:21.570617+00	2022-04-14 10:19:21.570617+00	f
46	39	900	0	5000	75	2022-04-14 10:33:52.813663+00	2022-04-14 10:38:11.369474+00	f
47	38	0	0	0	76	2022-04-14 10:47:31.004767+00	2022-04-14 10:47:31.004767+00	f
44	36	1500	0	5000	73	2022-04-14 07:09:57.525489+00	2022-04-14 11:26:55.074526+00	f
48	36	0	0	0	77	2022-04-15 04:22:21.243678+00	2022-04-15 04:22:21.243678+00	f
50	40	0	0	0	79	2022-04-15 12:23:44.790639+00	2022-04-15 12:23:44.790639+00	f
49	36	0	0	0	78	2022-04-15 05:05:55.693767+00	2022-04-15 12:26:06.89758+00	f
51	36	0	0	5000	80	2022-04-18 03:26:11.932301+00	2022-04-18 03:26:11.932301+00	f
52	39	0	0	5000	81	2022-04-18 03:29:51.40215+00	2022-04-18 03:29:51.40215+00	f
53	36	0	0	0	82	2022-04-18 05:02:33.959224+00	2022-04-19 13:05:43.316327+00	f
\.


--
-- Data for Name: soldBoilers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."soldBoilers" (id, "boilerId", price, "serialNumber", quantity, sum, "orderId", "launchDate", "daysOfGuarantee", "createdDate", "updatedDate", "isActive") FROM stdin;
\.


--
-- Data for Name: soldJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") FROM stdin;
143	32	25000	1	25000	67	2022-04-13 07:48:11.792087+00	2022-04-13 07:48:29.358427+00	14	f
144	32	25000	1	25000	67	2022-04-13 07:48:29.360035+00	2022-04-13 07:48:29.360035+00	14	t
142	30	0	1	0	65	2022-04-13 07:35:49.914602+00	2022-04-13 07:49:01.034543+00	14	f
145	30	0	1	0	65	2022-04-13 07:49:01.035909+00	2022-04-13 07:49:01.035909+00	14	t
146	32	25000	1	25000	70	2022-04-14 06:40:20.454033+00	2022-04-14 06:40:20.454033+00	14	t
147	29	5000	1	5000	71	2022-04-14 06:43:26.348811+00	2022-04-14 06:45:03.844612+00	30	f
148	29	4000	1	4000	71	2022-04-14 06:45:03.846117+00	2022-04-14 06:45:03.846117+00	30	t
149	30	0	1	0	69	2022-04-14 06:46:14.500077+00	2022-04-14 06:46:14.500077+00	14	t
150	30	0	1	0	72	2022-04-14 06:53:53.614548+00	2022-04-14 06:53:53.614548+00	14	t
151	34	9000	1	9000	66	2022-04-14 06:57:07.950468+00	2022-04-14 06:57:07.950468+00	14	t
152	34	9000	1	9000	75	2022-04-14 10:38:11.365433+00	2022-04-14 10:38:11.365433+00	14	t
153	33	3000	1	3000	73	2022-04-14 11:26:55.070538+00	2022-04-14 11:26:55.070538+00	14	t
\.


--
-- Data for Name: soldParts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") FROM stdin;
156	54500	1	54500	68	22	2022-04-14 04:32:47.692512+00	2022-04-14 04:32:47.692512+00	30	t
157	49900	1	49900	71	13	2022-04-14 06:43:26.345602+00	2022-04-14 06:45:03.838592+00	30	f
158	49900	1	49900	71	13	2022-04-14 06:45:03.841835+00	2022-04-14 06:45:03.841835+00	30	t
159	26300	1	26300	78	7	2022-04-15 05:05:55.688755+00	2022-04-15 12:26:06.889886+00	30	f
160	0	1	0	78	7	2022-04-15 12:26:06.892162+00	2022-04-15 12:26:06.892162+00	30	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit") FROM stdin;
1	khegay.alexey@mail.ru	2021-07-16	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	+7 (705) 577-88-52	t	2021-05-25 00:00:00+00	2021-06-10 09:48:10.601766+00	Full name	1	0	0	0
32	info@z-star.kz	2021-01-01	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	+7 (777) 005-31-36	t	2021-11-19 06:29:49.889886+00	2022-04-13 07:31:59.739888+00	???????????? ??????	1	0	0	0
40	azret@z-star.kz	1990-12-15	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-03	t	2022-04-13 07:22:21.044438+00	2022-04-13 07:32:25.60644+00	?????????? ????????????????	3	0	0	0
42	tech@z-star.kz	1999-12-12	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (777) 055-60-09	t	2022-04-13 07:34:04.084892+00	2022-04-13 07:34:04.084892+00	?????????? ??????????????	2	10	10	10
37	val@z-star.kz	1981-11-11	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	+7 (777) 131-02-40	t	2022-01-20 08:28:42.194786+00	2022-01-20 08:28:42.194786+00	??????????????	3	50	10	100
36	yarik@z-star.kz	2000-01-01	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	+7 (771) 766-70-01	t	2022-01-01 07:21:52.789373+00	2022-04-19 02:51:20.954248+00	?????????????? ??????????	3	50	30	100
39	vitya@z-star.kz	1999-12-12	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-02	t	2022-04-13 07:17:40.793162+00	2022-04-13 07:17:40.793162+00	???????????? ??????	3	10	10	100
41	ilya@z-star.kz	1999-12-12	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-04	t	2022-04-13 07:24:47.698394+00	2022-04-13 07:24:47.698394+00	???????? ??????????????	3	\N	\N	\N
38	oleg@z-star.kz	1991-01-28	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-05	t	2022-03-02 09:22:50.597731+00	2022-04-13 07:29:21.319716+00	???????? ????????	3	0	0	0
\.


--
-- Data for Name: utils; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".utils (id, name, value, "createdDate", "updatedDate", description) FROM stdin;
1	paidOutTerm	15	2021-12-18 09:39:32.757578+00	2021-12-18 09:39:32.757578+00	???????????????????? ????????, ???????????? ?????????????? ???????????????? ?????????????? ?????? ??????????????????????
\.


--
-- Name: cashHistoryLog_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."cashHistoryLog_id_seq"', 9, true);


--
-- Name: cash_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".cash_id_seq', 1, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".customers_id_seq', 74, true);


--
-- Name: dictBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictBoilers_id_seq"', 42, true);


--
-- Name: dictJobTypes_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictJobTypes_id_seq"', 34, true);


--
-- Name: dictOrderStatuses_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictOrderStatuses_id_seq"', 7, true);


--
-- Name: dictParts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictParts_id_seq"', 68, true);


--
-- Name: dict_roles_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".dict_roles_id_seq', 5, true);


--
-- Name: ordersStatusHistory_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."ordersStatusHistory_id_seq"', 172, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".orders_id_seq', 82, true);


--
-- Name: paidOuts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."paidOuts_id_seq"', 53, true);


--
-- Name: soldBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldBoilers_id_seq"', 1, false);


--
-- Name: soldJobTypes_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldJobTypes_id_seq"', 153, true);


--
-- Name: soldParts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldParts_id_seq"', 160, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".users_id_seq', 42, true);


--
-- Name: utils_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".utils_id_seq', 1, true);


--
-- Name: cash cash_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".cash
    ADD CONSTRAINT cash_pk PRIMARY KEY (id);


--
-- Name: cashHistoryLog cashhistorylog_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."cashHistoryLog"
    ADD CONSTRAINT cashhistorylog_pk PRIMARY KEY (id);


--
-- Name: customers customers_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".customers
    ADD CONSTRAINT customers_pk PRIMARY KEY (id);


--
-- Name: dictRoles dict_roles_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictRoles"
    ADD CONSTRAINT dict_roles_pk PRIMARY KEY (id);


--
-- Name: dictBoilers dictboilers_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictBoilers"
    ADD CONSTRAINT dictboilers_pk PRIMARY KEY (id);


--
-- Name: dictJobTypes dictjobtypes_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictJobTypes"
    ADD CONSTRAINT dictjobtypes_pk PRIMARY KEY (id);


--
-- Name: dictOrderStatuses dictorderstatuses_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictOrderStatuses"
    ADD CONSTRAINT dictorderstatuses_pk PRIMARY KEY (id);


--
-- Name: dictParts dictparts_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictParts"
    ADD CONSTRAINT dictparts_pk PRIMARY KEY (id);


--
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (id);


--
-- Name: ordersStatusHistory ordersstatushistory_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."ordersStatusHistory"
    ADD CONSTRAINT ordersstatushistory_pk PRIMARY KEY (id);


--
-- Name: serviceManPaidOuts paidouts_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."serviceManPaidOuts"
    ADD CONSTRAINT paidouts_pk PRIMARY KEY (id);


--
-- Name: soldBoilers soldboilers_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldBoilers"
    ADD CONSTRAINT soldboilers_pk PRIMARY KEY (id);


--
-- Name: soldJobTypes soldjobtypes_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldJobTypes"
    ADD CONSTRAINT soldjobtypes_pk PRIMARY KEY (id);


--
-- Name: soldParts soldparts_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldParts"
    ADD CONSTRAINT soldparts_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: utils utils_pk; Type: CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".utils
    ADD CONSTRAINT utils_pk PRIMARY KEY (id);


--
-- Name: cash_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX cash_id_uindex ON "service-crm".cash USING btree (id);


--
-- Name: cash_userid_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX cash_userid_uindex ON "service-crm".cash USING btree ("userId");


--
-- Name: cashhistorylog_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX cashhistorylog_id_uindex ON "service-crm"."cashHistoryLog" USING btree (id);


--
-- Name: customers_boilerserial_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX customers_boilerserial_uindex ON "service-crm".customers USING btree ("boilerSerial");


--
-- Name: customers_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX customers_id_uindex ON "service-crm".customers USING btree (id);


--
-- Name: customers_phone_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX customers_phone_uindex ON "service-crm".customers USING btree (phone);


--
-- Name: dict_roles_code_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dict_roles_code_uindex ON "service-crm"."dictRoles" USING btree (code);


--
-- Name: dict_roles_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dict_roles_id_uindex ON "service-crm"."dictRoles" USING btree (id);


--
-- Name: dictboilers_article_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictboilers_article_uindex ON "service-crm"."dictBoilers" USING btree (article);


--
-- Name: dictboilers_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictboilers_id_uindex ON "service-crm"."dictBoilers" USING btree (id);


--
-- Name: dictjobtypes_code_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictjobtypes_code_uindex ON "service-crm"."dictJobTypes" USING btree (code);


--
-- Name: dictjobtypes_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictjobtypes_id_uindex ON "service-crm"."dictJobTypes" USING btree (id);


--
-- Name: dictorderstatuses_code_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictorderstatuses_code_uindex ON "service-crm"."dictOrderStatuses" USING btree (code);


--
-- Name: dictorderstatuses_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictorderstatuses_id_uindex ON "service-crm"."dictOrderStatuses" USING btree (id);


--
-- Name: dictparts_article_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictparts_article_uindex ON "service-crm"."dictParts" USING btree (article);


--
-- Name: dictparts_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX dictparts_id_uindex ON "service-crm"."dictParts" USING btree (id);


--
-- Name: orders_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX orders_id_uindex ON "service-crm".orders USING btree (id);


--
-- Name: ordersstatushistory_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX ordersstatushistory_id_uindex ON "service-crm"."ordersStatusHistory" USING btree (id);


--
-- Name: paidouts_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX paidouts_id_uindex ON "service-crm"."serviceManPaidOuts" USING btree (id);


--
-- Name: soldboilers_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX soldboilers_id_uindex ON "service-crm"."soldBoilers" USING btree (id);


--
-- Name: soldboilers_serialnumber_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX soldboilers_serialnumber_uindex ON "service-crm"."soldBoilers" USING btree ("serialNumber");


--
-- Name: soldjobtypes_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX soldjobtypes_id_uindex ON "service-crm"."soldJobTypes" USING btree (id);


--
-- Name: soldparts_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX soldparts_id_uindex ON "service-crm"."soldParts" USING btree (id);


--
-- Name: users_login_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX users_login_uindex ON "service-crm".users USING btree (login);


--
-- Name: utils_id_uindex; Type: INDEX; Schema: service-crm; Owner: postgres
--

CREATE UNIQUE INDEX utils_id_uindex ON "service-crm".utils USING btree (id);


--
-- Name: cash cash_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".cash
    ADD CONSTRAINT cash_users_id_fk FOREIGN KEY ("userId") REFERENCES "service-crm".users(id);


--
-- Name: customers customers_dictboilers_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".customers
    ADD CONSTRAINT customers_dictboilers_id_fk FOREIGN KEY ("boilerId") REFERENCES "service-crm"."dictBoilers"(id);


--
-- Name: customers customers_users__fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".customers
    ADD CONSTRAINT customers_users__fk FOREIGN KEY ("createdBy") REFERENCES "service-crm".users(id);


--
-- Name: dictBoilers dictboilers_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictBoilers"
    ADD CONSTRAINT dictboilers_users_id_fk FOREIGN KEY ("createdBy") REFERENCES "service-crm".users(id);


--
-- Name: dictJobTypes dictjobtypes_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictJobTypes"
    ADD CONSTRAINT dictjobtypes_users_id_fk FOREIGN KEY ("createdBy") REFERENCES "service-crm".users(id);


--
-- Name: dictParts dictparts_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."dictParts"
    ADD CONSTRAINT dictparts_users_id_fk FOREIGN KEY ("createdBy") REFERENCES "service-crm".users(id);


--
-- Name: orders orders_customers__fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".orders
    ADD CONSTRAINT orders_customers__fk FOREIGN KEY ("customerId") REFERENCES "service-crm".customers(id);


--
-- Name: orders orders_dictorderstatuses_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".orders
    ADD CONSTRAINT orders_dictorderstatuses_id_fk FOREIGN KEY (status) REFERENCES "service-crm"."dictOrderStatuses"(id);


--
-- Name: orders orders_users__fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".orders
    ADD CONSTRAINT orders_users__fk FOREIGN KEY ("createdBy") REFERENCES "service-crm".users(id);


--
-- Name: orders orders_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".orders
    ADD CONSTRAINT orders_users_id_fk FOREIGN KEY ("serviceManId") REFERENCES "service-crm".users(id);


--
-- Name: ordersStatusHistory ordersstatushistory_dictorderstatuses_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."ordersStatusHistory"
    ADD CONSTRAINT ordersstatushistory_dictorderstatuses_id_fk FOREIGN KEY (status) REFERENCES "service-crm"."dictOrderStatuses"(id);


--
-- Name: ordersStatusHistory ordersstatushistory_orders_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."ordersStatusHistory"
    ADD CONSTRAINT ordersstatushistory_orders_id_fk FOREIGN KEY ("orderId") REFERENCES "service-crm".orders(id);


--
-- Name: ordersStatusHistory ordersstatushistory_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."ordersStatusHistory"
    ADD CONSTRAINT ordersstatushistory_users_id_fk FOREIGN KEY ("createdBy") REFERENCES "service-crm".users(id);


--
-- Name: serviceManPaidOuts paidouts_users_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."serviceManPaidOuts"
    ADD CONSTRAINT paidouts_users_id_fk FOREIGN KEY ("userId") REFERENCES "service-crm".users(id);


--
-- Name: serviceManPaidOuts servicemanpaidouts_orders_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."serviceManPaidOuts"
    ADD CONSTRAINT servicemanpaidouts_orders_id_fk FOREIGN KEY ("orderId") REFERENCES "service-crm".orders(id);


--
-- Name: soldBoilers soldboilers_dictboilers_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldBoilers"
    ADD CONSTRAINT soldboilers_dictboilers_id_fk FOREIGN KEY ("boilerId") REFERENCES "service-crm"."dictBoilers"(id);


--
-- Name: soldBoilers soldboilers_orders_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldBoilers"
    ADD CONSTRAINT soldboilers_orders_id_fk FOREIGN KEY ("orderId") REFERENCES "service-crm".orders(id);


--
-- Name: soldJobTypes soldjobtypes_dictjobtypes_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldJobTypes"
    ADD CONSTRAINT soldjobtypes_dictjobtypes_id_fk FOREIGN KEY ("jobTypeId") REFERENCES "service-crm"."dictJobTypes"(id);


--
-- Name: soldJobTypes soldjobtypes_orders_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldJobTypes"
    ADD CONSTRAINT soldjobtypes_orders_id_fk FOREIGN KEY ("orderId") REFERENCES "service-crm".orders(id);


--
-- Name: soldParts soldparts_dictparts_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldParts"
    ADD CONSTRAINT soldparts_dictparts_id_fk FOREIGN KEY ("partId") REFERENCES "service-crm"."dictParts"(id);


--
-- Name: soldParts soldparts_orders_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm"."soldParts"
    ADD CONSTRAINT soldparts_orders_id_fk FOREIGN KEY ("orderId") REFERENCES "service-crm".orders(id);


--
-- Name: users users_dictroles_id_fk; Type: FK CONSTRAINT; Schema: service-crm; Owner: postgres
--

ALTER TABLE ONLY "service-crm".users
    ADD CONSTRAINT users_dictroles_id_fk FOREIGN KEY ("roleId") REFERENCES "service-crm"."dictRoles"(id);


--
-- Name: SCHEMA "service-crm"; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA "service-crm" TO "service-crm";


--
-- Name: TABLE cash; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm".cash TO "service-crm";


--
-- Name: TABLE "cashHistoryLog"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."cashHistoryLog" TO "service-crm";


--
-- Name: SEQUENCE "cashHistoryLog_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."cashHistoryLog_id_seq" TO "service-crm";


--
-- Name: SEQUENCE cash_id_seq; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm".cash_id_seq TO "service-crm";


--
-- Name: TABLE customers; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm".customers TO "service-crm";


--
-- Name: SEQUENCE customers_id_seq; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm".customers_id_seq TO "service-crm";


--
-- Name: TABLE "dictBoilers"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."dictBoilers" TO "service-crm";


--
-- Name: SEQUENCE "dictBoilers_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."dictBoilers_id_seq" TO "service-crm";


--
-- Name: TABLE "dictJobTypes"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."dictJobTypes" TO "service-crm";


--
-- Name: SEQUENCE "dictJobTypes_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."dictJobTypes_id_seq" TO "service-crm";


--
-- Name: TABLE "dictOrderStatuses"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."dictOrderStatuses" TO "service-crm";


--
-- Name: SEQUENCE "dictOrderStatuses_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."dictOrderStatuses_id_seq" TO "service-crm";


--
-- Name: TABLE "dictParts"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."dictParts" TO "service-crm";


--
-- Name: SEQUENCE "dictParts_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."dictParts_id_seq" TO "service-crm";


--
-- Name: TABLE "dictRoles"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."dictRoles" TO "service-crm";


--
-- Name: SEQUENCE dict_roles_id_seq; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm".dict_roles_id_seq TO "service-crm";


--
-- Name: TABLE orders; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm".orders TO "service-crm";


--
-- Name: TABLE "ordersStatusHistory"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."ordersStatusHistory" TO "service-crm";


--
-- Name: SEQUENCE "ordersStatusHistory_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."ordersStatusHistory_id_seq" TO "service-crm";


--
-- Name: SEQUENCE orders_id_seq; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm".orders_id_seq TO "service-crm";


--
-- Name: TABLE "serviceManPaidOuts"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."serviceManPaidOuts" TO "service-crm";


--
-- Name: SEQUENCE "paidOuts_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."paidOuts_id_seq" TO "service-crm";


--
-- Name: TABLE "soldBoilers"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."soldBoilers" TO "service-crm";


--
-- Name: SEQUENCE "soldBoilers_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."soldBoilers_id_seq" TO "service-crm";


--
-- Name: TABLE "soldJobTypes"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."soldJobTypes" TO "service-crm";


--
-- Name: SEQUENCE "soldJobTypes_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."soldJobTypes_id_seq" TO "service-crm";


--
-- Name: TABLE "soldParts"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm"."soldParts" TO "service-crm";


--
-- Name: SEQUENCE "soldParts_id_seq"; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm"."soldParts_id_seq" TO "service-crm";


--
-- Name: TABLE users; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm".users TO "service-crm";


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm".users_id_seq TO "service-crm";


--
-- Name: TABLE utils; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON TABLE "service-crm".utils TO "service-crm";


--
-- Name: SEQUENCE utils_id_seq; Type: ACL; Schema: service-crm; Owner: postgres
--

GRANT ALL ON SEQUENCE "service-crm".utils_id_seq TO "service-crm";


--
-- PostgreSQL database dump complete
--

