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
    "boilerId" integer DEFAULT 0 NOT NULL,
    "purchaseDate" timestamp with time zone
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

COMMENT ON TABLE "service-crm"."dictBoilers" IS 'Справочник котлов';


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

COMMENT ON TABLE "service-crm"."dictJobTypes" IS 'Виды работ';


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

COMMENT ON TABLE "service-crm"."dictParts" IS 'Справочник запчастей';


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

COMMENT ON TABLE "service-crm"."soldBoilers" IS 'Список проданных котлов';


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

COMMENT ON TABLE "service-crm"."soldJobTypes" IS 'Список оказанных услуг';


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

COMMENT ON TABLE "service-crm"."soldParts" IS 'Список проданных запчастей';


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

COPY "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") FROM stdin;
55	Боролдай дачи		2022-04-14 03:16:59.430402+00	2022-04-22 05:59:05.225852+00	42	Батыр	+7 (707) 515-97-71		t	6LK000238351	13	\N
50	пр. Рыскулова, 139в	asd@asd.rr	2022-03-02 08:28:13.691558+00	2022-04-17 10:25:26.648356+00	32	ТЕСТ_1	+7 (777) 777-77-77	+7 (123) 123-45-67	t	123123123123	11	\N
66	Бесагаш баянаулы		2022-04-15 12:22:48.684545+00	2022-04-17 10:44:30.415806+00	42	Неизв	+7 (701) 521-11-46		t	1509	16	\N
68	Аксай 3б		2022-04-18 03:28:37.674818+00	2022-04-18 03:28:37.674818+00	42	Неизв	+7 (701) 511-14-40		t	1704	30	\N
57	ст. Достык 67		2022-04-14 06:29:47.419285+00	2022-04-19 12:48:41.260955+00	42	Еркын	+7 (701) 343-73-11		t	6LK000142562	11	\N
59	ул. Айтей батыра, 17/1		2022-04-14 06:41:53.28488+00	2022-04-19 12:52:23.146119+00	32	Ринат	+7 (776) 777-77-54		t	5BH131000512	42	\N
61	Тумебаев жетесу 55		2022-04-14 07:07:20.948964+00	2022-04-19 12:54:06.242141+00	42	Неиз	+7 (778) 666-66-77		t	5G5181000231	17	\N
62	Кендала новостройка		2022-04-14 10:18:34.76866+00	2022-04-19 12:57:13.440361+00	42	Неизвес	+7 (708) 943-08-90		t	6LT001209899	17	\N
65	Кыргаулды дачи 6я линия		2022-04-15 05:03:55.885312+00	2022-04-19 12:58:33.500734+00	42	Батыр	+7 (700) 264-34-75		t	5G1181000339	15	\N
75	Каскелен жангозина 41а		2022-04-21 03:52:58.840512+00	2022-04-21 03:52:58.840512+00	42	  Дарья	+7 (701) 767-33-07		t	2104	16	\N
76	Улан 2 бертайкызы143		2022-04-21 03:56:17.978722+00	2022-04-21 03:56:17.978722+00	42	  Неиз	+7 (777) 095-27-54	+7 (708) 887-56-07	t	21045	16	\N
82	Боролдай м.р. жайнак жангильдина4		2022-04-21 04:12:15.016301+00	2022-04-21 04:12:15.016301+00	42	 Эрика	+7 (702) 431-13-26		t	21048	11	\N
81	Антонова 69 а		2022-04-21 04:05:03.895473+00	2022-04-22 05:51:36.011284+00	42	  Неиз	+7 (708) 325-63-39		t	6LK000142560	11	\N
86	Карабулак кошками 57		2022-04-22 10:55:16.043532+00	2022-04-22 10:55:16.043532+00	42	Неизв	+7 (747) 128-19-82		t	22041	16	\N
60	г. Каскелен, ул. Кисикова, 71		2022-04-14 06:51:48.829443+00	2022-04-14 06:51:48.829443+00	32	Узнать имя	+7 (776) 213-86-86		t	RT_новый_140422-1	40	\N
51	пос. Тумебаев, ул. 1 мая, д. 14		2022-04-13 07:02:22.629464+00	2022-04-14 07:03:32.087336+00	32	Имя клиента	+7 (705) 625-51-79		t	6LK000271590	13	\N
53	мкр. Алатау, ул. Каипова, 5		2022-04-13 07:47:03.947889+00	2022-04-14 08:51:57.865734+00	32	Шаймардан	+7 (777) 277-83-25	+7 (708) 971-42-49	t	502161000468	12	\N
52	пос. Гульдала, ул. Жибек жолы, д. 21		2022-04-13 07:44:22.558103+00	2022-04-14 08:54:19.129881+00	32	Клиент SSB	+7 (777) 290-00-77		t	SSB_старый_1	41	\N
63	Хорошей 25		2022-04-14 10:46:34.805071+00	2022-04-14 10:46:34.805071+00	42	Сергей 	+7 (707) 721-09-58	+7 (701) 721-09-58	t	1405	30	\N
83	Умбетали		2022-04-21 04:38:17.960907+00	2022-04-22 17:09:49.003502+00	42	 Камила даулет	+7 (777) 045-18-68		t	506151000164	43	\N
58	ул. Кауметова, 37		2022-04-14 06:34:52.334311+00	2022-04-22 17:15:00.29058+00	32	Владимир	+7 (701) 774-75-24		t	40557	44	\N
49	Ташкентская, 123	test@test123.kz	2022-01-01 07:25:28.21198+00	2022-04-17 10:16:10.109809+00	1	ТЕСТ_222	+7 (435) 345-34-53	+7 (345) 345-34-53	t	Z 123456987 SD	13	\N
67	Жасканат 286		2022-04-18 03:25:29.322979+00	2022-04-22 17:16:19.17429+00	42	Неиз	+7 (707) 832-16-88		t	6LT001140105	16	\N
69	Шарын 67		2022-04-18 05:01:58.504543+00	2022-04-22 17:19:35.318962+00	42	Арипов	+7 (701) 324-04-88		t	6LK000202022	14	\N
84	Узынагаш карасай батыра 35 к 3		2022-04-21 04:56:12.146954+00	2022-04-22 17:21:30.767532+00	42	Даурен	+7 (701) 173-73-02		t	502141000079	12	\N
87	Татимбета 174		2022-04-23 03:38:53.297644+00	2022-04-23 03:38:53.297644+00	42	Анна Николаевна 	+7 (777) 127-18-15		t	2404	15	\N
88	Кемертоган за БАКАД (21 квартал)		2022-04-23 05:07:01.230642+00	2022-04-23 05:07:01.230642+00	32	Индира	+7 (702) 626-00-00		t	GRG30V02Y01148	45	\N
64	Жамбыл новострой 		2022-04-15 04:21:05.396635+00	2022-04-25 04:19:57.988902+00	42	Самат	+7 (771) 606-21-21	+7 (747) 440-21-21	t	21110071GCKG8KYA	22	\N
89	Казахфильм жанар37 а кв7		2022-04-25 04:48:44.001214+00	2022-04-25 04:48:44.001214+00	42	Карина	+7 (701) 555-86-92		t	2504	11	\N
90	Айгерим, ул. Байтерек 8а		2022-04-26 03:45:47.926079+00	2022-04-26 10:11:00.240672+00	32	Сауле	+7 (707) 836-13-27		t	6LT001245836	46	\N
91	Туздыбастау м.р. Арматура Оролман35		2022-04-27 04:02:15.464792+00	2022-04-27 04:02:15.464792+00	42	Неиз	+7 (747) 300-02-52		t	2604	16	\N
92	Туздыбастау 		2022-04-27 04:03:42.710809+00	2022-04-27 04:04:59.726589+00	42	Неиз	+7 (700) 300-18-30		t	26041	14	\N
93	Иргели казмис		2022-04-27 09:48:32.22233+00	2022-04-27 09:48:32.22233+00	42	Неиз	+7 (707) 938-19-10		t	26042	15	\N
85	Шемякина 256		2022-04-22 04:16:08.693442+00	2022-04-28 05:38:44.348215+00	42	Неизв	+7 (707) 865-19-11		t	2204	16	\N
94	sdfdg 234	test@test.as	2022-04-28 09:36:00.067121+00	2022-04-28 09:54:04.34209+00	1	test	+7 (234) 354-65-46		f	23435sadf	12	2022-04-28 00:00:00+00
95	dfgdfg 345		2022-04-28 09:54:26.512347+00	2022-04-28 09:54:48.508991+00	1	dfgdfg	+7 (234) 346-45-67		f	ertert	13	2022-12-12 00:00:00+00
54	Каскелен Жамбыла 23/1		2022-04-14 03:09:05.008446+00	2022-04-14 03:09:05.008446+00	42	Есен	+7 (701) 289-71-23		t	123уточнить	16	\N
56	Международная 41		2022-04-14 04:05:33.250116+00	2022-04-14 04:05:33.250116+00	42	Асылхан	+7 (778) 480-97-23		t	14о4	13	\N
\.


--
-- Data for Name: dictBoilers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") FROM stdin;
29	AR3301672	Ariston Alteas XC 35	0	1095	99999999	0	0	0	2022-04-13 06:50:26.888313+00	2022-04-13 07:00:59.481523+00	32	t
28	AR3301671	Ariston Alteas XC 30	0	1095	99999999	0	0	0	2022-04-13 06:50:18.980185+00	2022-04-13 07:01:08.008911+00	32	t
38	SSB20	SSB 20	0	0	99999999	0	0	0	2022-04-13 07:43:21.363711+00	2022-04-13 07:43:21.363711+00	32	t
39	RMF167	Rinnai RMF 167	0	1095	99999999	0	0	0	2022-04-14 06:32:38.807454+00	2022-04-14 06:32:38.807454+00	32	t
40	RT_PT16	Росстерм PT-16	0	1095	9999999	0	0	0	2022-04-14 06:50:32.825539+00	2022-04-14 06:50:32.825539+00	32	t
41	SSB25	SSB 25	0	1095	9999999	0	0	0	2022-04-14 08:53:39.837525+00	2022-04-14 08:53:39.837525+00	32	t
42	MGSEOUL21	Master Gas Seoul 21	0	1095	9999999	0	0	0	2022-04-19 12:51:52.15135+00	2022-04-19 12:51:52.15135+00	32	t
43	PL3.25	Celtic Platinum 3.25	0	1095	9999999	0	0	0	2022-04-22 17:09:11.61637+00	2022-04-22 17:09:11.61637+00	32	t
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
44	RINNAI_178532	Rinnai RB-106	0	1095	1095	0	0	0	2022-04-22 17:12:25.053019+00	2022-04-22 17:12:25.053019+00	32	t
45	GRW-3.0/230	KOSPEL ТЭН GRW-3.0/230	0	1095	9999999	0	0	0	2022-04-23 05:02:07.452545+00	2022-04-23 05:02:07.452545+00	32	t
46	FAF2.18	FAF2.18	0	1095	9999999	0	0	0	2022-04-26 10:10:19.132923+00	2022-04-26 10:10:19.132923+00	32	t
\.


--
-- Data for Name: dictJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") FROM stdin;
30	1ST_START	ПНР	2022-01-20 08:26:07.94059+00	2022-04-13 06:39:53.171161+00	0	32	14	5000	0	0	t
32	MAINT	Профилактика	2022-04-13 06:40:39.178992+00	2022-04-13 06:40:39.178992+00	15000	32	14	25000	0	0	t
33	PCB_REMOVE	Замена блока управления	2022-04-14 06:44:32.351565+00	2022-04-14 06:44:32.351565+00	3000	32	14	5000	10000	15000	t
34	DHW_CLEAN	Чистка теплообменника ГВС	2022-04-14 06:56:42.914998+00	2022-04-14 06:56:42.914998+00	7000	32	14	9000	12000	15000	t
29	WORK1	человекочас	2022-01-01 07:23:06.965276+00	2022-04-27 05:56:17.547984+00	2000	1	30	4000	6000	8000	t
\.


--
-- Data for Name: dictOrderStatuses; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") FROM stdin;
1	CREATED	Создан	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	Создать заказ	\N	f
6	SERVICE_DONE	Выполнен	2021-12-10 08:59:45.943436+00	2021-12-10 08:59:45.943436+00	t	Выполнен	IN_PROGRESS	f
4	DONE	Завершен	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	Завершить	SERVICE_DONE	f
2	IN_PROGRESS	В работе	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	Взять в работу	CREATED, ON_HOLD	f
7	ON_HOLD	Отложен	2021-12-10 09:06:50.067763+00	2021-12-10 09:06:50.067763+00	t	Отложить	IN_PROGRESS, CREATED	t
3	CANCELED	Отменен	2021-06-05 16:35:29.872593+00	2021-06-05 16:35:29.872593+00	t	Отменить заказ	IN_PROGRESS, CREATED	t
\.


--
-- Data for Name: dictParts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") FROM stdin;
36	2060185A	Теплообменник ГВС (25-35)	30400	2022-01-24 09:50:46.771862+00	2022-04-22 11:47:48.354946+00	30	10	27400	25800	19800	32	t
50	3012298	Колпак (A 13-16)	17700	2022-01-24 10:01:00.242603+00	2022-01-24 10:01:00.242603+00	30	10	0	0	5000	32	t
51	3011922M	Колпак (A 20)	18300	2022-01-24 10:01:26.666152+00	2022-01-24 10:01:26.666152+00	30	10	0	0	5500	32	t
10	2080653	Манометр (квадратный)	12300	2022-01-24 09:02:06.916545+00	2022-04-22 11:22:37.55289+00	30	10	11100	10500	8000	32	t
19	3050075	Колпак (ESR 25-35)	19000	2022-01-24 09:19:41.00068+00	2022-01-24 09:19:41.00068+00	30	10	0	0	6000	32	t
17	3050073	Колпак (ESR 13-16)	17700	2022-01-24 09:16:09.85036+00	2022-01-24 09:40:15.255171+00	30	10	0	0	5000	32	t
18	3050074	Колпак (ESR 20)	18300	2022-01-24 09:16:32.943867+00	2022-01-24 09:40:43.054923+00	30	10	0	0	5500	32	t
62	3090222	Задняя стенка камеры сгорания (50)	17000	2022-01-24 10:10:02.442981+00	2022-01-24 10:10:02.442981+00	30	10	0	0	5000	32	t
20	2070392M	Теплообменник основной (ESR 13-16)	50900	2022-01-24 09:39:47.40057+00	2022-04-22 11:26:28.292171+00	30	10	45800	43300	33100	32	t
12	2080971	Блок управления (PLATINUM)	54500	2022-01-24 09:04:03.283026+00	2022-04-22 11:23:45.703047+00	30	10	49100	46300	35400	32	t
23	2080390	Датчик перегрева	6000	2022-01-24 09:42:50.474593+00	2022-04-22 11:34:19.467217+00	30	10	5400	5100	3900	32	t
7	2040105	3ходовой клапан (2.13-35)	16500	2022-01-01 07:24:33.734711+00	2022-04-22 06:33:36.875891+00	30	489	14900	14000	10700	1	t
8	2070877	Расширительный бак (ESR 2.13-35)	29000	2022-01-24 09:00:45.625884+00	2022-04-22 06:51:25.044989+00	30	10	26100	24700	18900	32	t
14	2081024	Блок управления (VANS)	54500	2022-01-24 09:14:04.279017+00	2022-04-22 11:24:29.550915+00	30	10	49100	46300	35400	32	t
9	2081212M	Манометр (круглый)	12300	2022-01-24 09:01:38.694007+00	2022-04-22 06:52:05.048422+00	30	10	11100	10500	8000	32	t
11	2080833	Блок управления (APRIL)	54500	2022-01-24 09:03:43.811919+00	2022-04-22 11:23:31.717844+00	30	9	49100	46300	35400	32	t
13	2080831	Блок управления (ESR)	54500	2022-01-24 09:12:13.396103+00	2022-04-22 11:24:11.557049+00	30	8	49100	46300	35400	32	t
15	2081015	Блок управления (EUROCLIMA)	54500	2022-01-24 09:14:23.794568+00	2022-04-22 11:24:53.711209+00	30	7	49100	46300	35400	32	t
65	52100325	Вентилятор (50)	49500	2022-01-24 10:11:30.252732+00	2022-04-22 11:28:50.187363+00	30	10	44600	42100	32200	32	t
64	2060281	Теплообменник ГВС (50)	46500	2022-01-24 10:11:02.692741+00	2022-04-22 11:29:14.183934+00	30	10	41900	39500	30200	32	t
63	2070470	Расширительный бак (50)	52800	2022-01-24 10:10:34.591143+00	2022-04-22 11:29:46.489396+00	30	10	47500	44900	34400	32	t
61	2030277	Газовый клапан (50)	87100	2022-01-24 10:09:23.255632+00	2022-04-22 11:30:21.462686+00	30	10	78400	74000	56600	32	t
60	2080768	Блок управления (A MAX 50)	67000	2022-01-24 10:08:41.738581+00	2022-04-22 11:30:50.209313+00	30	10	60300	57000	43500	32	t
58	2082743	Пульт (DR-240A, A)	18200	2022-01-24 10:06:34.245388+00	2022-04-22 11:31:27.358523+00	30	10	16400	15500	11900	32	t
57	2080459A	Датчик температуры ГВС (A 13-35)	9200	2022-01-24 10:05:42.899962+00	2022-04-22 11:31:58.69541+00	30	10	8300	7800	6000	32	t
56	52060749	Патрубок возвратный с фланцем крепления насоса (A 13-35)	17800	2022-01-24 10:05:06.095151+00	2022-04-22 11:32:40.609372+00	30	10	16000	15100	11500	32	t
21	2070391M	Теплообменник основной (ESR 20)	56400	2022-01-24 09:41:38.119472+00	2022-04-22 11:33:17.476742+00	30	10	50800	47900	36700	32	t
22	2070429M	Теплообменник основной (ESR 25-35)	66400	2022-01-24 09:42:13.149471+00	2022-04-22 11:33:44.871161+00	30	9	59800	56400	43200	32	t
24	53080471	Прокладка Р16	500	2022-01-24 09:43:35.177064+00	2022-04-22 11:35:34.833994+00	30	10	500	400	300	32	t
25	2080364	Трансформатор поджига	10600	2022-01-24 09:44:10.17757+00	2022-04-22 11:36:06.816828+00	30	10	9500	9000	6900	32	t
26	2100259	Вентилятор (ESR 13-20)	30400	2022-01-24 09:45:07.696679+00	2022-04-22 11:36:50.938312+00	30	10	27400	25800	19800	32	t
27	2100291	Вентилятор (ESR 25-35)	30400	2022-01-24 09:45:26.503713+00	2022-04-22 11:37:09.377071+00	30	10	27400	25800	19800	32	t
37	53080487	Прокладка Р18	500	2022-01-24 09:51:05.930622+00	2022-04-22 11:37:22.054542+00	30	10	500	400	300	32	t
28	52050118	Насос (ESR 13-20)	58000	2022-01-24 09:46:00.864624+00	2022-04-22 11:37:54.95447+00	30	10	52200	49300	37700	32	t
38	53080484	Прокладка Р6	500	2022-01-24 09:51:23.629535+00	2022-04-22 11:38:07.246491+00	30	10	500	400	300	32	t
29	52050115	Насос (ESR 25-35)	58000	2022-01-24 09:46:17.574777+00	2022-04-22 11:38:35.369384+00	30	10	52200	49300	37700	32	t
39	2060229	Датчик протока ГВС (13-35)	14800	2022-01-24 09:51:55.234129+00	2022-04-22 11:38:54.866765+00	30	10	13300	12600	9600	32	t
30	2060296	Патрубок возвратный с фланцем крепления насоса (ESR 13-35)	17800	2022-01-24 09:47:46.60234+00	2022-04-22 11:39:10.241489+00	30	10	16000	15100	11500	32	t
40	53080472	Прокладка Р18.6	500	2022-01-24 09:52:23.466939+00	2022-04-22 11:39:18.57988+00	30	10	500	400	300	32	t
31	53080473	Прокладка насоса	500	2022-01-24 09:48:17.463175+00	2022-04-22 11:39:29.427157+00	30	10	500	400	300	32	t
41	3080546	Прокладка Р22	500	2022-01-24 09:52:38.617705+00	2022-04-22 11:39:38.227291+00	30	10	500	400	300	32	t
32	3080543	Прокладка Р12	500	2022-01-24 09:48:36.165718+00	2022-04-22 11:39:47.900708+00	30	10	500	400	300	32	t
42	3130527A	Датчик температуры ГВС (ESR 13-35)	9200	2022-01-24 09:53:22.737471+00	2022-04-22 11:40:11.950863+00	30	10	8300	7800	6000	32	t
33	53080485	Прокладка Р14	500	2022-01-24 09:48:50.868947+00	2022-04-22 11:40:20.961758+00	30	10	500	400	300	32	t
43	2080250	Датчик температуры отопления (ESR 13-35)	9300	2022-01-24 09:53:54.159741+00	2022-04-22 11:40:35.454678+00	30	10	8400	7900	6000	32	t
34	2060236	Теплообменник ГВС (13-16)	22200	2022-01-24 09:49:34.004646+00	2022-04-22 11:41:06.062944+00	30	10	20000	18900	14400	32	t
44	2081017	Датчик перегрева на колпаке (13-35)	4300	2022-01-24 09:54:29.744795+00	2022-04-22 11:46:04.672929+00	30	10	3900	3700	2800	32	t
35	2060237	Теплообменник ГВС (20)	24200	2022-01-24 09:50:18.078726+00	2022-04-22 11:46:31.124822+00	30	10	21800	20600	15800	32	t
45	52080973	Пульт (DSR-220RH, PLATINUM)	16100	2022-01-24 09:55:19.989278+00	2022-04-22 11:47:19.035929+00	30	10	14500	13700	10500	32	t
46	2080997	Пульт (DSR-550, ESR)	16100	2022-01-24 09:56:45.853739+00	2022-04-22 11:48:04.531988+00	30	10	14500	13700	10500	32	t
47	2082754	Блок управления (A, D MAX 13-16)	54500	2022-01-24 09:58:57.817268+00	2022-04-22 11:49:32.122225+00	30	10	49100	46300	35400	32	t
48	2082746	Блок управления (A, D MAX 20-35)	54500	2022-01-24 09:59:21.548933+00	2022-04-22 11:50:13.969358+00	30	10	49100	46300	35400	32	t
49	52070811	Расширительный бак (A 13-20)	29000	2022-01-24 10:00:05.6656+00	2022-04-22 11:50:48.583551+00	30	10	26100	24700	18900	32	t
52	2070847	Теплообменник основной (A 13-16)	50900	2022-01-24 10:02:10.41001+00	2022-04-22 11:51:10.14483+00	30	10	45800	43300	33100	32	t
53	2070830	Теплообменник основной (A 20)	56400	2022-01-24 10:02:45.558924+00	2022-04-22 11:51:35.959227+00	30	10	50800	47900	36700	32	t
55	52100317	Вентилятор (А 13-16)	30400	2022-01-24 10:04:20.230383+00	2022-04-22 11:52:24.934501+00	30	10	27400	25800	19800	32	t
16	2030280	Газовый клапан (2.13-35)	52600	2022-01-24 09:14:59.508114+00	2022-04-22 11:25:32.549781+00	30	8	47300	44700	34200	32	t
68	2082760	Пульт (DSR-400U, 50)	16100	2022-01-24 10:13:12.658599+00	2022-04-22 11:27:17.410195+00	30	10	14500	13700	10500	32	t
67	2130439	Теплообменник конденсационный (50)	110300	2022-01-24 10:12:38.403231+00	2022-04-22 11:27:52.980493+00	30	10	99300	93800	71700	32	t
66	2070469M	Теплообменник основной (50)	84700	2022-01-24 10:12:07.316924+00	2022-04-22 11:28:26.163424+00	30	10	76200	72000	55100	32	t
54	3130448	Датчик температуры отопления (A 13-35)	9300	2022-01-24 10:03:37.74454+00	2022-04-22 11:51:59.710413+00	30	10	8400	7900	6000	32	t
\.


--
-- Data for Name: dictRoles; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."dictRoles" (id, code, name, "createdDate", "updatedDate", "isActive") FROM stdin;
1	SUPER_ADMIN	Супер админ	2021-06-05 16:26:42.956451+00	2021-06-05 16:26:42.956451+00	t
2	ADMIN	Администратор	2021-06-05 16:26:42.956451+00	2021-06-05 16:26:42.956451+00	t
3	SERVICE_MAN	Специалист по ремонту	2021-06-05 16:26:42.956451+00	2021-06-05 16:26:42.956451+00	t
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") FROM stdin;
66	52	32	пос. Гульдала, ул. Жибек жолы, д. 21	2022-04-13 07:45:36.068784+00	2022-04-14 06:57:07.94735+00	6	36	Нет ГВС.  Уточнить серийный номер и модель котла	t	f	38	5000	90003000	+7 (777) 290-00-77	\N
71	59	32	ул. Айтей батыра, 17/1	2022-04-14 06:43:26.340692+00	2022-04-14 11:04:38.447942+00	6	39	Не включается. Возможно, под замену плата управления. Уточнить серийный номер и модель котла.	t	f	11	5000	58900	+7 (776) 777-77-54	\N
68	56	42	Международная 41	2022-04-14 04:32:47.687813+00	2022-04-14 07:30:42.47827+00	6	39	Замена основного теплообменника 	t	f	13	5000	59500	+7 (778) 480-97-23	\N
75	54	42	Каскелен Жамбыла 23/1	2022-04-14 10:33:52.806621+00	2022-04-14 11:08:33.676549+00	3	39	А3 аа чистка теплообменника 	t	f	16	5000	14000	+7 (701) 289-71-23	\N
78	65	42	Кыргаулды дачи 6я линия	2022-04-15 05:05:55.684035+00	2022-04-15 12:26:06.887786+00	6	36	Трехходовой рем 0	t	f	16	5000	0	+7 (700) 264-34-75	\N
65	51	32	пос. Тумебаев, ул. 1 мая, д. 14	2022-04-13 07:35:49.909692+00	2022-04-14 07:34:17.95921+00	6	40	ПНР. Уточнить серийный номер и модель котла	t	f	15	3000	3000	+7 (705) 625-51-79	\N
82	69	42	Шарын 67	2022-04-18 05:02:33.952917+00	2022-04-19 13:07:46.537416+00	6	36	Пнр	t	f	16	0	0	+7 (701) 324-04-88	\N
73	61	42	Тумебаев жетесу 55	2022-04-14 07:09:57.518778+00	2022-04-14 11:39:05.912809+00	6	36	Нет вк. На сегодня 	t	f	17	5000	8000	+7 (778) 666-66-77	\N
76	63	42	Хорошей 25	2022-04-14 10:47:30.997968+00	2022-04-15 17:46:30.799639+00	6	38	Пнр 17.00	t	f	30	5000	5000	+7 (707) 721-09-58	\N
84	76	42	Улан 2 бертайкызы143	2022-04-21 03:57:28.945333+00	2022-04-22 07:28:59.606364+00	6	40	Нет гвс оценить	t	f	16	0	0	+7 (777) 095-27-54	\N
96	90	32	Айгерим, ул. Байтерек 8а	2022-04-26 03:47:01.233904+00	2022-04-26 09:53:14.942079+00	6	39	К 14:00. Нет ГВС. Возможно профилактика. Узнать серийный номер.	t	f	16	5000	5000	+7 (707) 836-13-27	\N
69	57	42	ст. Достык 67	2022-04-14 06:31:55.88745+00	2022-04-14 09:14:43.158252+00	6	40	Пнр	t	f	13	0	0	+7 (701) 343-73-11	\N
72	60	32	г. Каскелен, ул. Кисикова, 71	2022-04-14 06:53:53.609722+00	2022-04-15 04:38:04.918002+00	6	40	ПНР	t	f	40	2000	2000	+7 (776) 213-86-86	\N
67	53	32	мкр. Алатау, ул. Каипова, 5	2022-04-13 07:48:11.787276+00	2022-04-14 09:38:07.960929+00	6	36	Профилактика. Проблема с ГВС. Уточнить серийный номер	t	f	11	0	25000	+7 (777) 277-83-25	\N
70	58	32	ул. Кауметова, 37	2022-04-14 06:40:20.448847+00	2022-04-16 05:04:25.162195+00	6	36	Ошибка 99. Чистка котла. на 15.04.2022. Уточнить серийный номер	t	f	39	0	250000	+7 (701) 774-75-24	\N
86	55	42	Боролдай дачи	2022-04-21 04:09:26.373859+00	2022-04-21 09:22:09.661967+00	6	40	Пнр	t	f	13	0	0	+7 (707) 515-97-71	\N
79	66	42	Бесагаш баянаулы	2022-04-15 12:23:44.783268+00	2022-04-16 08:14:56.237305+00	6	40	Нет гвс	t	f	16	5000	5000	+7 (701) 521-11-46	\N
74	62	42	Кендала новостройка	2022-04-14 10:19:21.563268+00	2022-04-15 06:40:52.37226+00	6	40	Пнр	t	f	16	2000	2000	+7 (708) 943-08-90	\N
95	89	42	Казахфильм жанар37 а кв7	2022-04-25 04:49:19.210284+00	2022-04-28 04:37:30.080982+00	7	36	Нет гвс	t	f	11	5000	5000	+7 (701) 555-86-92	\N
81	68	42	Аксай 3б	2022-04-18 03:29:51.395914+00	2022-04-18 03:34:47.795626+00	3	39	Нет гвс	t	f	30	5000	5000	+7 (701) 511-14-40	\N
90	85	42	Шимякина 256	2022-04-22 04:17:31.179616+00	2022-04-22 11:06:06.830082+00	6	36	Нет гвс течёт с котла возможна профилактика	t	f	16	5000	5000	+7 (707) 865-19-11	\N
92	64	32	Жамбыл новострой 	2022-04-22 11:59:51.112777+00	2022-04-25 04:55:31.995328+00	6	36	Заявка 77 дублирую. Гремит вентилятор. +7 747 440 21 21. Дата покупки 12.10.2021	t	f	22	2000	2000	+7 (771) 606-21-21	\N
80	67	42	Жасканат 286	2022-04-18 03:26:11.92423+00	2022-04-18 05:46:18.238522+00	6	36	Нет гвс	t	f	16	5000	5000	+7 (707) 832-16-88	\N
85	81	42	Ахтонова 69 а	2022-04-21 04:07:10.849512+00	2022-04-21 05:14:40.237062+00	6	40	Пнр	t	f	11	0	0	+7 (708) 325-63-39	\N
83	75	42	Каскелен жангозина 41а	2022-04-21 03:54:31.40207+00	2022-04-22 03:15:51.279746+00	6	36	Профилактика и трехходовой 	t	f	16	25000	1150025000	+7 (701) 767-33-07	\N
88	83	42	Умбетали	2022-04-21 04:39:13.500482+00	2022-04-21 06:33:25.870443+00	6	36	Не греет	t	f	11	5000	5000	+7 (777) 045-18-68	\N
91	86	42	Карабулак кошками 57	2022-04-22 10:56:38.822481+00	2022-04-27 02:35:29.03189+00	6	40	Капает с котла до обеда	t	f	16	4000	2000	+7 (747) 128-19-82	\N
89	84	42	Узынагаш карасай батыра 35 к 3	2022-04-21 04:56:41.022571+00	2022-04-22 04:54:31.404772+00	6	36	Нет гвс	t	f	11	5000	5000	+7 (701) 173-73-02	\N
77	64	42	Жамбыл новострой 	2022-04-15 04:22:21.236771+00	2022-04-22 06:11:42.272642+00	3	36	Гремит на понедельник 	t	f	22	0	0	+7 (771) 606-21-21	\N
93	87	42	Татимбета 174	2022-04-23 03:39:22.715057+00	2022-04-25 04:33:56.946789+00	6	36	Гудит	t	f	15	5000	5000	+7 (777) 127-18-15	\N
87	82	42	Боролдай м.р. жайнак жангильдина4	2022-04-21 04:12:49.986551+00	2022-04-23 05:41:33.918902+00	3	40	Самсунг бежит 	t	f	11	5000	5000	+7 (702) 431-13-26	\N
94	88	32	Кемертоган за БАКАД (21 квартал)	2022-04-23 05:09:31.328124+00	2022-04-25 04:53:26.604835+00	6	37	Не включается. Не горит лампочка	t	f	45	2000	2000	+7 (702) 626-00-00	\N
97	91	42	Туздыбастау м.р. Арматура Оролман35	2022-04-27 04:02:52.407493+00	2022-04-28 03:01:47.835695+00	6	40	Пнр	t	f	16	0	0	+7 (747) 300-02-52	\N
98	92	42	Туздыбастау м.р. Арматура Оролман35	2022-04-27 04:04:26.730184+00	2022-04-28 03:02:17.714448+00	7	40		t	f	14	25000	25000	+7 (700) 300-18-30	\N
99	93	42	Иргели казмис	2022-04-27 09:49:14.219844+00	2022-04-28 04:38:12.364435+00	6	36	Пнр	t	f	15	0	0	+7 (707) 938-19-10	\N
\.


--
-- Data for Name: ordersStatusHistory; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") FROM stdin;
119	65	1	ПНР	2022-04-13 07:35:49.912523+00	32
120	66	1	Нет ГВС	2022-04-13 07:45:36.071746+00	32
121	67	1	Профилактика. Проблема с ГВС	2022-04-13 07:48:11.790079+00	32
122	68	1	Замена основного теплообменника 	2022-04-14 04:32:47.690643+00	42
123	66	2		2022-04-14 04:55:20.285973+00	36
124	68	2		2022-04-14 05:12:35.687637+00	39
125	69	1	Пнр	2022-04-14 06:31:55.889987+00	42
126	70	1	Ошибка 99. Чистка котла. на 15.04.2022. Уточнить серийный номер	2022-04-14 06:40:20.451984+00	32
127	71	1	Не включается. Возможно, под замену плата управления. Уточнить серийный номер и модель котла.	2022-04-14 06:43:26.343711+00	32
128	66	6	Чистка гвс	2022-04-14 06:51:14.222709+00	36
129	72	1	ПНР	2022-04-14 06:53:53.612599+00	32
130	67	2	Выехали	2022-04-14 06:54:47.481026+00	36
131	73	1	Нет вк. На сегодня 	2022-04-14 07:09:57.521603+00	42
132	68	6		2022-04-14 07:30:42.480631+00	39
133	65	2		2022-04-14 07:34:05.247234+00	40
134	65	6		2022-04-14 07:34:17.961409+00	40
135	71	2		2022-04-14 07:40:16.719674+00	39
136	71	7	Плата на ремонт 	2022-04-14 08:44:39.851106+00	39
137	69	2		2022-04-14 09:14:40.202548+00	40
138	69	6		2022-04-14 09:14:43.159723+00	40
139	67	6		2022-04-14 09:38:07.963153+00	36
140	73	2		2022-04-14 09:46:35.714193+00	36
141	74	1	Пнр	2022-04-14 10:19:21.566558+00	42
142	75	1	Уточнить	2022-04-14 10:33:52.809563+00	42
143	76	1	Пнр 17.00	2022-04-14 10:47:31.000779+00	42
144	71	2		2022-04-14 11:03:27.553753+00	39
145	71	6		2022-04-14 11:04:38.450213+00	39
146	75	3	Клиент сказал не приежать. Будет покупать новый котел	2022-04-14 11:08:33.678481+00	39
147	73	6	Замена предохранителей все ок	2022-04-14 11:39:05.914956+00	36
148	77	1	Гремит на понедельник 	2022-04-15 04:22:21.239695+00	42
149	72	2	Не росттерм фаф 2'18	2022-04-15 04:24:17.682045+00	40
150	72	6		2022-04-15 04:38:04.920043+00	40
151	78	1	Трехходовой рем 12000 замена 32000	2022-04-15 05:05:55.686947+00	42
152	70	7	Перенесен на завтра. Взять у Игоря пьезу	2022-04-15 05:21:49.42849+00	36
153	74	2		2022-04-15 06:37:03.713338+00	40
154	74	6	Имя Ильяс	2022-04-15 06:40:52.374534+00	40
155	78	2	По гарантии ремонт 3-х и течь с дат темп гвс	2022-04-15 10:38:20.639945+00	36
156	78	6	По гарантии 	2022-04-15 11:00:57.987699+00	36
157	79	1	Нет гвс	2022-04-15 12:23:44.786093+00	42
158	76	2		2022-04-15 17:46:27.366521+00	38
159	76	6		2022-04-15 17:46:30.801762+00	38
160	70	2	Чистка вентилятора и камеры сгорания без фанатизма	2022-04-16 05:04:16.229824+00	36
161	70	6		2022-04-16 05:04:25.164314+00	36
162	79	2		2022-04-16 08:14:50.095574+00	40
163	79	6	Чистка гвс	2022-04-16 08:14:56.239149+00	40
164	80	1	Нет гвс	2022-04-18 03:26:11.927865+00	42
165	81	1	Нет гвс	2022-04-18 03:29:51.398527+00	42
166	77	7	Недоступен	2022-04-18 03:33:17.001667+00	36
167	81	3	Клиент сам сделал	2022-04-18 03:34:47.797567+00	39
168	82	1	Пнр	2022-04-18 05:02:33.955488+00	42
169	80	2	Чистка гвс	2022-04-18 05:45:40.22125+00	36
170	80	6	Сделали 14000 взяли 	2022-04-18 05:46:18.240709+00	36
171	82	2		2022-04-19 13:07:17.505849+00	36
172	82	6		2022-04-19 13:07:46.539194+00	36
173	83	1	Профилактика и трехходовой 	2022-04-21 03:54:31.40495+00	42
174	84	1	Нет гвс оценить	2022-04-21 03:57:28.948204+00	42
175	85	1	Пнр	2022-04-21 04:07:10.852271+00	42
176	86	1	Пнр	2022-04-21 04:09:26.375908+00	42
177	87	1	Самсунг бежит 	2022-04-21 04:12:49.989389+00	42
178	88	1	Не греет	2022-04-21 04:39:13.504458+00	42
179	89	1	Нет гвс	2022-04-21 04:56:41.025105+00	42
180	85	2		2022-04-21 05:14:37.83427+00	40
181	85	6		2022-04-21 05:14:40.238954+00	40
182	88	2	Отопление не греет	2022-04-21 06:32:46.233584+00	36
183	88	6	Замена 3х 37000	2022-04-21 06:33:25.872413+00	36
184	89	2	Ожидаю местоположение 	2022-04-21 06:59:33.639791+00	36
185	86	2		2022-04-21 09:09:49.670213+00	40
186	86	6		2022-04-21 09:22:09.663839+00	40
187	83	2		2022-04-21 09:28:15.621219+00	36
188	77	2		2022-04-22 03:07:01.41172+00	36
189	77	7	Проверка	2022-04-22 03:07:15.422048+00	36
190	83	6		2022-04-22 03:15:51.282149+00	36
191	90	1	Нет гвс течёт с котла возможна профилактика	2022-04-22 04:17:31.182631+00	42
192	89	6		2022-04-22 04:54:31.407129+00	36
193	90	2		2022-04-22 05:01:10.391519+00	36
194	77	2		2022-04-22 06:11:32.734546+00	36
195	77	3	Недоступен 	2022-04-22 06:11:42.274493+00	36
196	84	2	Улжан 2	2022-04-22 06:42:50.055186+00	40
197	84	6	Чистка гвс	2022-04-22 07:28:59.608759+00	40
198	91	1	Капает с котла до обеда	2022-04-22 10:56:38.825214+00	42
199	90	6	Чистка гвс замена 3х	2022-04-22 11:06:06.832287+00	36
200	92	1	Заявка 77 дублирую. Гремит вентилятор. +7 747 440 21 21	2022-04-22 11:59:51.115478+00	32
201	93	1	Гудит	2022-04-23 03:39:22.717788+00	42
202	93	2		2022-04-23 04:45:06.119597+00	36
203	94	1	Не включается. Не горит лампочка	2022-04-23 05:09:31.3307+00	32
204	94	2		2022-04-23 05:10:04.828408+00	32
205	94	6	Включили предохранитель, выставил терморегулятор на более низкую температуру. ТЭН стоит на БКН Sunsystem	2022-04-23 05:11:13.265973+00	32
206	93	6		2022-04-23 05:29:43.668936+00	36
207	91	2		2022-04-23 05:40:57.80779+00	40
208	87	3	Новый котел брать будет 	2022-04-23 05:41:33.920946+00	40
209	92	2		2022-04-23 08:33:38.437879+00	36
210	92	6	По гарантии подложил картон	2022-04-23 09:58:23.180359+00	36
211	95	1	Нет гвс	2022-04-25 04:49:19.212955+00	42
212	96	1	К 14:00. Нет ГВС. Возможно профилактика. Узнать серийный номер.	2022-04-26 03:47:01.236682+00	32
213	96	2		2022-04-26 05:56:09.024877+00	39
214	96	7	Не поднимают трубку	2022-04-26 06:00:27.664791+00	39
215	96	2		2022-04-26 07:13:10.837694+00	39
216	96	6		2022-04-26 09:53:14.944229+00	39
217	91	6		2022-04-27 02:35:29.033897+00	40
218	97	1	Пнр	2022-04-27 04:02:52.410261+00	42
219	98	1		2022-04-27 04:04:26.732706+00	42
220	99	1	Пнр	2022-04-27 09:49:14.222543+00	42
221	97	2		2022-04-28 03:01:44.986071+00	40
222	97	6		2022-04-28 03:01:47.837365+00	40
223	98	7	Назавтра	2022-04-28 03:02:17.71646+00	40
224	95	2		2022-04-28 04:35:44.363771+00	36
225	95	7	Передал азрета он выполнил	2022-04-28 04:37:30.082937+00	36
226	99	2		2022-04-28 04:38:09.499837+00	36
227	99	6		2022-04-28 04:38:12.365799+00	36
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
54	36	0	3450	25000	83	2022-04-21 03:54:31.416318+00	2022-04-21 03:54:31.416318+00	f
55	40	0	0	0	84	2022-04-21 03:57:28.952003+00	2022-04-21 03:57:28.952003+00	f
56	40	0	0	0	85	2022-04-21 04:07:10.855835+00	2022-04-21 04:07:10.855835+00	f
57	40	0	0	0	86	2022-04-21 04:09:26.379591+00	2022-04-21 04:09:26.379591+00	f
58	40	0	0	0	87	2022-04-21 04:12:49.993214+00	2022-04-21 04:12:49.993214+00	f
59	36	0	0	5000	88	2022-04-21 04:39:13.507825+00	2022-04-21 04:39:13.507825+00	f
60	36	0	0	5000	89	2022-04-21 04:56:41.028434+00	2022-04-21 04:56:41.028434+00	f
61	36	0	0	5000	90	2022-04-22 04:17:31.187226+00	2022-04-22 04:17:31.187226+00	f
62	40	0	0	0	91	2022-04-22 10:56:38.829001+00	2022-04-25 04:26:34.617941+00	f
64	36	0	0	5000	93	2022-04-23 03:39:22.721254+00	2022-04-25 04:33:57.443852+00	f
66	36	0	0	5000	95	2022-04-25 04:49:19.216339+00	2022-04-25 04:49:19.216339+00	f
65	37	0	0	2000	94	2022-04-23 05:09:31.334555+00	2022-04-25 04:53:26.609837+00	f
63	36	0	0	2000	92	2022-04-22 11:59:51.119189+00	2022-04-25 04:55:31.999945+00	f
67	39	0	0	5000	96	2022-04-26 03:47:01.24055+00	2022-04-26 03:47:01.24055+00	f
68	40	0	0	0	97	2022-04-27 04:02:52.413664+00	2022-04-27 04:02:52.413664+00	f
69	40	0	0	0	98	2022-04-27 04:04:26.73617+00	2022-04-27 04:04:26.73617+00	f
70	36	0	0	0	99	2022-04-27 09:49:14.225863+00	2022-04-27 14:52:47.27826+00	f
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
161	11500	1	11500	83	7	2022-04-21 03:54:31.407238+00	2022-04-21 03:54:31.407238+00	30	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit") FROM stdin;
1	khegay.alexey@mail.ru	2021-07-16	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	+7 (705) 577-88-52	t	2021-05-25 00:00:00+00	2021-06-10 09:48:10.601766+00	Full name	1	0	0	0
32	info@z-star.kz	2021-01-01	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	+7 (777) 005-31-36	t	2021-11-19 06:29:49.889886+00	2022-04-13 07:31:59.739888+00	Сергей Ним	1	0	0	0
40	azret@z-star.kz	1990-12-15	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-03	t	2022-04-13 07:22:21.044438+00	2022-04-13 07:32:25.60644+00	Азрет Саркитов	3	0	0	0
42	tech@z-star.kz	1999-12-12	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (777) 055-60-09	t	2022-04-13 07:34:04.084892+00	2022-04-13 07:34:04.084892+00	Игорь Мачехин	2	10	10	10
37	val@z-star.kz	1981-11-11	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	+7 (777) 131-02-40	t	2022-01-20 08:28:42.194786+00	2022-01-20 08:28:42.194786+00	Валихан	3	50	10	100
39	vitya@z-star.kz	1999-12-12	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-02	t	2022-04-13 07:17:40.793162+00	2022-04-13 07:17:40.793162+00	Виктор Пен	3	10	10	100
41	ilya@z-star.kz	1999-12-12	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-04	t	2022-04-13 07:24:47.698394+00	2022-04-13 07:24:47.698394+00	Илья Мачехин	3	\N	\N	\N
38	oleg@z-star.kz	1991-01-28	a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3	+7 (771) 766-70-05	t	2022-03-02 09:22:50.597731+00	2022-04-13 07:29:21.319716+00	Олег Огай	3	0	0	0
36	yarik@z-star.kz	2000-01-01	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	+7 (771) 766-70-01	t	2022-01-01 07:21:52.789373+00	2022-04-19 02:51:20.954248+00	Ярослав Мацюк	3	50	30	100
\.


--
-- Data for Name: utils; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

COPY "service-crm".utils (id, name, value, "createdDate", "updatedDate", description) FROM stdin;
1	paidOutTerm	15	2021-12-18 09:39:32.757578+00	2021-12-18 09:39:32.757578+00	Количество дней, спустя которые возможна выплата для специалиста
\.


--
-- Name: cashHistoryLog_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."cashHistoryLog_id_seq"', 9, true);


--
-- Name: cash_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".cash_id_seq', 5, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".customers_id_seq', 95, true);


--
-- Name: dictBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictBoilers_id_seq"', 46, true);


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

SELECT pg_catalog.setval('"service-crm"."ordersStatusHistory_id_seq"', 227, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".orders_id_seq', 99, true);


--
-- Name: paidOuts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."paidOuts_id_seq"', 70, true);


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

SELECT pg_catalog.setval('"service-crm"."soldParts_id_seq"', 161, true);


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

