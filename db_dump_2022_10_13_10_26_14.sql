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

ALTER TABLE ONLY "service-crm".users DROP CONSTRAINT users_dictroles_id_fk;
ALTER TABLE ONLY "service-crm"."soldParts" DROP CONSTRAINT soldparts_orders_id_fk;
ALTER TABLE ONLY "service-crm"."soldParts" DROP CONSTRAINT soldparts_dictparts_id_fk;
ALTER TABLE ONLY "service-crm"."soldJobTypes" DROP CONSTRAINT soldjobtypes_orders_id_fk;
ALTER TABLE ONLY "service-crm"."soldJobTypes" DROP CONSTRAINT soldjobtypes_dictjobtypes_id_fk;
ALTER TABLE ONLY "service-crm"."soldBoilers" DROP CONSTRAINT soldboilers_orders_id_fk;
ALTER TABLE ONLY "service-crm"."soldBoilers" DROP CONSTRAINT soldboilers_dictboilers_id_fk;
ALTER TABLE ONLY "service-crm"."serviceManPaidOuts" DROP CONSTRAINT servicemanpaidouts_orders_id_fk;
ALTER TABLE ONLY "service-crm"."serviceManPaidOuts" DROP CONSTRAINT paidouts_users_id_fk;
ALTER TABLE ONLY "service-crm"."ordersStatusHistory" DROP CONSTRAINT ordersstatushistory_users_id_fk;
ALTER TABLE ONLY "service-crm"."ordersStatusHistory" DROP CONSTRAINT ordersstatushistory_orders_id_fk;
ALTER TABLE ONLY "service-crm"."ordersStatusHistory" DROP CONSTRAINT ordersstatushistory_dictorderstatuses_id_fk;
ALTER TABLE ONLY "service-crm".orders DROP CONSTRAINT orders_users_id_fk;
ALTER TABLE ONLY "service-crm".orders DROP CONSTRAINT orders_users__fk;
ALTER TABLE ONLY "service-crm".orders DROP CONSTRAINT orders_dictorderstatuses_id_fk;
ALTER TABLE ONLY "service-crm".orders DROP CONSTRAINT orders_customers__fk;
ALTER TABLE ONLY "service-crm"."dictParts" DROP CONSTRAINT dictparts_users_id_fk;
ALTER TABLE ONLY "service-crm"."dictJobTypes" DROP CONSTRAINT dictjobtypes_users_id_fk;
ALTER TABLE ONLY "service-crm"."dictBoilers" DROP CONSTRAINT dictboilers_users_id_fk;
ALTER TABLE ONLY "service-crm".customers DROP CONSTRAINT customers_users__fk;
ALTER TABLE ONLY "service-crm".customers DROP CONSTRAINT customers_dictboilers_id_fk;
ALTER TABLE ONLY "service-crm".cash DROP CONSTRAINT cash_users_id_fk;
DROP INDEX "service-crm".utils_id_uindex;
DROP INDEX "service-crm".users_login_uindex;
DROP INDEX "service-crm".soldparts_id_uindex;
DROP INDEX "service-crm".soldjobtypes_id_uindex;
DROP INDEX "service-crm".soldboilers_serialnumber_uindex;
DROP INDEX "service-crm".soldboilers_id_uindex;
DROP INDEX "service-crm".paidouts_id_uindex;
DROP INDEX "service-crm".ordersstatushistory_id_uindex;
DROP INDEX "service-crm".orders_id_uindex;
DROP INDEX "service-crm".dictparts_id_uindex;
DROP INDEX "service-crm".dictparts_article_uindex;
DROP INDEX "service-crm".dictorderstatuses_id_uindex;
DROP INDEX "service-crm".dictorderstatuses_code_uindex;
DROP INDEX "service-crm".dictjobtypes_id_uindex;
DROP INDEX "service-crm".dictjobtypes_code_uindex;
DROP INDEX "service-crm".dictboilers_id_uindex;
DROP INDEX "service-crm".dictboilers_article_uindex;
DROP INDEX "service-crm".dict_roles_id_uindex;
DROP INDEX "service-crm".dict_roles_code_uindex;
DROP INDEX "service-crm".customers_id_uindex;
DROP INDEX "service-crm".customers_boilerserial_uindex;
DROP INDEX "service-crm".cashhistorylog_id_uindex;
DROP INDEX "service-crm".cash_userid_uindex;
DROP INDEX "service-crm".cash_id_uindex;
ALTER TABLE ONLY "service-crm".utils DROP CONSTRAINT utils_pk;
ALTER TABLE ONLY "service-crm".users DROP CONSTRAINT users_pk;
ALTER TABLE ONLY "service-crm"."soldParts" DROP CONSTRAINT soldparts_pk;
ALTER TABLE ONLY "service-crm"."soldJobTypes" DROP CONSTRAINT soldjobtypes_pk;
ALTER TABLE ONLY "service-crm"."soldBoilers" DROP CONSTRAINT soldboilers_pk;
ALTER TABLE ONLY "service-crm"."serviceManPaidOuts" DROP CONSTRAINT paidouts_pk;
ALTER TABLE ONLY "service-crm"."ordersStatusHistory" DROP CONSTRAINT ordersstatushistory_pk;
ALTER TABLE ONLY "service-crm".orders DROP CONSTRAINT orders_pk;
ALTER TABLE ONLY "service-crm"."dictParts" DROP CONSTRAINT dictparts_pk;
ALTER TABLE ONLY "service-crm"."dictOrderStatuses" DROP CONSTRAINT dictorderstatuses_pk;
ALTER TABLE ONLY "service-crm"."dictJobTypes" DROP CONSTRAINT dictjobtypes_pk;
ALTER TABLE ONLY "service-crm"."dictBoilers" DROP CONSTRAINT dictboilers_pk;
ALTER TABLE ONLY "service-crm"."dictRoles" DROP CONSTRAINT dict_roles_pk;
ALTER TABLE ONLY "service-crm".customers DROP CONSTRAINT customers_pk;
ALTER TABLE ONLY "service-crm"."cashHistoryLog" DROP CONSTRAINT cashhistorylog_pk;
ALTER TABLE ONLY "service-crm".cash DROP CONSTRAINT cash_pk;
ALTER TABLE "service-crm".utils ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm".users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."soldParts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."soldJobTypes" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."soldBoilers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."serviceManPaidOuts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."ordersStatusHistory" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm".orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."dictRoles" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."dictParts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."dictOrderStatuses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."dictJobTypes" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."dictBoilers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm".customers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm"."cashHistoryLog" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE "service-crm".cash ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE "service-crm".utils_id_seq;
DROP TABLE "service-crm".utils;
DROP SEQUENCE "service-crm".users_id_seq;
DROP TABLE "service-crm".users;
DROP SEQUENCE "service-crm"."soldParts_id_seq";
DROP TABLE "service-crm"."soldParts";
DROP SEQUENCE "service-crm"."soldJobTypes_id_seq";
DROP TABLE "service-crm"."soldJobTypes";
DROP SEQUENCE "service-crm"."soldBoilers_id_seq";
DROP TABLE "service-crm"."soldBoilers";
DROP SEQUENCE "service-crm"."paidOuts_id_seq";
DROP TABLE "service-crm"."serviceManPaidOuts";
DROP SEQUENCE "service-crm".orders_id_seq;
DROP SEQUENCE "service-crm"."ordersStatusHistory_id_seq";
DROP TABLE "service-crm"."ordersStatusHistory";
DROP TABLE "service-crm".orders;
DROP SEQUENCE "service-crm".dict_roles_id_seq;
DROP TABLE "service-crm"."dictRoles";
DROP SEQUENCE "service-crm"."dictParts_id_seq";
DROP TABLE "service-crm"."dictParts";
DROP SEQUENCE "service-crm"."dictOrderStatuses_id_seq";
DROP TABLE "service-crm"."dictOrderStatuses";
DROP SEQUENCE "service-crm"."dictJobTypes_id_seq";
DROP TABLE "service-crm"."dictJobTypes";
DROP SEQUENCE "service-crm"."dictBoilers_id_seq";
DROP TABLE "service-crm"."dictBoilers";
DROP SEQUENCE "service-crm".customers_id_seq;
DROP TABLE "service-crm".customers;
DROP SEQUENCE "service-crm".cash_id_seq;
DROP SEQUENCE "service-crm"."cashHistoryLog_id_seq";
DROP TABLE "service-crm"."cashHistoryLog";
DROP TABLE "service-crm".cash;
DROP SCHEMA "service-crm";
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
    "percentFromVisit" integer,
    "tgAccount" text,
    "chatId" text
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

INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (8, 41, 0, 0, '2022-06-23 07:00:27.47617+00', '2022-10-03 15:00:11.506573+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (7, 39, 2500, 40920, '2022-06-23 06:56:05.467552+00', '2022-10-08 04:19:59.174287+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (9, 38, 0, 12380, '2022-06-23 08:55:19.08077+00', '2022-10-08 04:22:05.32965+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (1, 36, 0, 142000, '2022-01-01 08:00:40.46918+00', '2022-10-08 04:22:41.495287+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (6, 40, 0, 80320, '2022-06-23 06:55:32.940625+00', '2022-10-08 04:23:15.062843+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (10, 37, 0, 0, '2022-06-23 09:00:39.964672+00', '2022-07-14 15:18:49.26187+00', 0);


--
-- Data for Name: cashHistoryLog; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (55, 'Боролдай дачи', '', '2022-04-14 03:16:59.430402+00', '2022-04-22 05:59:05.225852+00', 42, 'Батыр', '+7 (707) 515-97-71', '', true, '6LK000238351', 13, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (50, 'пр. Рыскулова, 139в', 'asd@asd.rr', '2022-03-02 08:28:13.691558+00', '2022-04-17 10:25:26.648356+00', 32, 'ТЕСТ_1', '+7 (777) 777-77-77', '+7 (123) 123-45-67', true, '123123123123', 11, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (66, 'Бесагаш баянаулы', '', '2022-04-15 12:22:48.684545+00', '2022-04-17 10:44:30.415806+00', 42, 'Неизв', '+7 (701) 521-11-46', '', true, '1509', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (249, 'Капчегай мкр 10 д 4', '', '2022-07-20 06:24:27.809828+00', '2022-07-20 06:24:27.809828+00', 42, 'Неизв', '+7 (708) 230-59-74', '', true, '18074', 16, '2020-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (68, 'Аксай 3б', '', '2022-04-18 03:28:37.674818+00', '2022-04-18 03:28:37.674818+00', 42, 'Неизв', '+7 (701) 511-14-40', '', true, '1704', 30, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (57, 'ст. Достык 67', '', '2022-04-14 06:29:47.419285+00', '2022-04-19 12:48:41.260955+00', 42, 'Еркын', '+7 (701) 343-73-11', '', true, '6LK000142562', 11, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (59, 'ул. Айтей батыра, 17/1', '', '2022-04-14 06:41:53.28488+00', '2022-04-19 12:52:23.146119+00', 32, 'Ринат', '+7 (776) 777-77-54', '', true, '5BH131000512', 42, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (61, 'Тумебаев жетесу 55', '', '2022-04-14 07:07:20.948964+00', '2022-04-19 12:54:06.242141+00', 42, 'Неиз', '+7 (778) 666-66-77', '', true, '5G5181000231', 17, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (62, 'Кендала новостройка', '', '2022-04-14 10:18:34.76866+00', '2022-04-19 12:57:13.440361+00', 42, 'Неизвес', '+7 (708) 943-08-90', '', true, '6LT001209899', 17, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (65, 'Кыргаулды дачи 6я линия', '', '2022-04-15 05:03:55.885312+00', '2022-04-19 12:58:33.500734+00', 42, 'Батыр', '+7 (700) 264-34-75', '', true, '5G1181000339', 15, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (102, 'Ержанова 54 а', '', '2022-04-29 08:34:52.016195+00', '2022-04-29 08:34:52.016195+00', 42, 'Виктория', '+7 (705) 230-01-75', '', true, '2809', 11, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (75, 'Каскелен жангозина 41а', '', '2022-04-21 03:52:58.840512+00', '2022-04-21 03:52:58.840512+00', 42, '  Дарья', '+7 (701) 767-33-07', '', true, '2104', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (76, 'Улан 2 бертайкызы143', '', '2022-04-21 03:56:17.978722+00', '2022-04-21 03:56:17.978722+00', 42, '  Неиз', '+7 (777) 095-27-54', '+7 (708) 887-56-07', true, '21045', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (103, 'Стадионная27/2', '', '2022-05-03 04:07:23.151638+00', '2022-05-03 04:07:23.151638+00', 42, 'Неиз', '+7 (707) 411-13-04', '', true, '0305', 15, '2019-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (81, 'Антонова 69 а', '', '2022-04-21 04:05:03.895473+00', '2022-04-22 05:51:36.011284+00', 42, '  Неиз', '+7 (708) 325-63-39', '', true, '6LK000142560', 11, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (86, 'Карабулак кошками 57', '', '2022-04-22 10:55:16.043532+00', '2022-04-22 10:55:16.043532+00', 42, 'Неизв', '+7 (747) 128-19-82', '', true, '22041', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (104, 'Дуйсенова153/1', '', '2022-05-03 04:10:43.923956+00', '2022-05-03 04:10:43.923956+00', 42, 'Неиз', '+7 (708) 630-96-00', '', true, '03051', 15, '2019-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (60, 'г. Каскелен, ул. Кисикова, 71', '', '2022-04-14 06:51:48.829443+00', '2022-04-14 06:51:48.829443+00', 32, 'Узнать имя', '+7 (776) 213-86-86', '', true, 'RT_новый_140422-1', 40, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (51, 'пос. Тумебаев, ул. 1 мая, д. 14', '', '2022-04-13 07:02:22.629464+00', '2022-04-14 07:03:32.087336+00', 32, 'Имя клиента', '+7 (705) 625-51-79', '', true, '6LK000271590', 13, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (53, 'мкр. Алатау, ул. Каипова, 5', '', '2022-04-13 07:47:03.947889+00', '2022-04-14 08:51:57.865734+00', 32, 'Шаймардан', '+7 (777) 277-83-25', '+7 (708) 971-42-49', true, '502161000468', 12, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (52, 'пос. Гульдала, ул. Жибек жолы, д. 21', '', '2022-04-13 07:44:22.558103+00', '2022-04-14 08:54:19.129881+00', 32, 'Клиент SSB', '+7 (777) 290-00-77', '', true, 'SSB_старый_1', 41, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (63, 'Хорошей 25', '', '2022-04-14 10:46:34.805071+00', '2022-04-14 10:46:34.805071+00', 42, 'Сергей ', '+7 (707) 721-09-58', '+7 (701) 721-09-58', true, '1405', 30, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (83, 'Умбетали', '', '2022-04-21 04:38:17.960907+00', '2022-04-22 17:09:49.003502+00', 42, ' Камила даулет', '+7 (777) 045-18-68', '', true, '506151000164', 43, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (58, 'ул. Кауметова, 37', '', '2022-04-14 06:34:52.334311+00', '2022-04-22 17:15:00.29058+00', 32, 'Владимир', '+7 (701) 774-75-24', '', true, '40557', 44, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (49, 'Ташкентская, 123', 'test@test123.kz', '2022-01-01 07:25:28.21198+00', '2022-04-17 10:16:10.109809+00', 1, 'ТЕСТ_222', '+7 (435) 345-34-53', '+7 (345) 345-34-53', true, 'Z 123456987 SD', 13, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (67, 'Жасканат 286', '', '2022-04-18 03:25:29.322979+00', '2022-04-22 17:16:19.17429+00', 42, 'Неиз', '+7 (707) 832-16-88', '', true, '6LT001140105', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (69, 'Шарын 67', '', '2022-04-18 05:01:58.504543+00', '2022-04-22 17:19:35.318962+00', 42, 'Арипов', '+7 (701) 324-04-88', '', true, '6LK000202022', 14, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (84, 'Узынагаш карасай батыра 35 к 3', '', '2022-04-21 04:56:12.146954+00', '2022-04-22 17:21:30.767532+00', 42, 'Даурен', '+7 (701) 173-73-02', '', true, '502141000079', 12, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (87, 'Татимбета 174', '', '2022-04-23 03:38:53.297644+00', '2022-04-23 03:38:53.297644+00', 42, 'Анна Николаевна ', '+7 (777) 127-18-15', '', true, '2404', 15, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (88, 'Кемертоган за БАКАД (21 квартал)', '', '2022-04-23 05:07:01.230642+00', '2022-04-23 05:07:01.230642+00', 32, 'Индира', '+7 (702) 626-00-00', '', true, 'GRG30V02Y01148', 45, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (89, 'Казахфильм жанар37 а кв7', '', '2022-04-25 04:48:44.001214+00', '2022-04-25 04:48:44.001214+00', 42, 'Карина', '+7 (701) 555-86-92', '', true, '2504', 11, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (90, 'Айгерим, ул. Байтерек 8а', '', '2022-04-26 03:45:47.926079+00', '2022-04-26 10:11:00.240672+00', 32, 'Сауле', '+7 (707) 836-13-27', '', true, '6LT001245836', 46, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (91, 'Туздыбастау м.р. Арматура Оролман35', '', '2022-04-27 04:02:15.464792+00', '2022-04-27 04:02:15.464792+00', 42, 'Неиз', '+7 (747) 300-02-52', '', true, '2604', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (92, 'Туздыбастау ', '', '2022-04-27 04:03:42.710809+00', '2022-04-27 04:04:59.726589+00', 42, 'Неиз', '+7 (700) 300-18-30', '', true, '26041', 14, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (93, 'Иргели казмис', '', '2022-04-27 09:48:32.22233+00', '2022-04-27 09:48:32.22233+00', 42, 'Неиз', '+7 (707) 938-19-10', '', true, '26042', 15, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (85, 'Шемякина 256', '', '2022-04-22 04:16:08.693442+00', '2022-04-28 05:38:44.348215+00', 42, 'Неизв', '+7 (707) 865-19-11', '', true, '2204', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (105, 'Карасу болашак 13', '', '2022-05-03 04:13:33.195872+00', '2022-05-03 04:13:33.195872+00', 42, 'Неиз', '+7 (708) 177-70-77', '', true, '03052', 15, '2019-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (94, 'sdfdg 234', 'test@test.as', '2022-04-28 09:36:00.067121+00', '2022-04-28 09:54:04.34209+00', 1, 'test', '+7 (234) 354-65-46', '', false, '23435sadf', 12, '2022-04-28 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (106, 'Бетховена 4', '', '2022-05-03 04:17:53.941313+00', '2022-05-03 04:17:53.941313+00', 42, 'Неизв ', '+7 (778) 184-28-88', '', true, '0503', 15, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (95, 'dfgdfg 345', '', '2022-04-28 09:54:26.512347+00', '2022-04-28 09:54:48.508991+00', 1, 'dfgdfg', '+7 (234) 346-45-67', '', false, 'ertert', 13, '2022-12-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (96, 'Звёздная алатау 72', '', '2022-04-28 10:08:25.638676+00', '2022-04-28 10:08:25.638676+00', 42, ' Ергали', '+7 (771) 202-22-22', '', true, '2804', 27, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (97, 'Хасе наролдная 182', '', '2022-04-29 03:45:34.431179+00', '2022-04-29 03:45:34.431179+00', 42, ' Эльшат', '+7 (708) 851-33-04', '', true, '28005', 18, '2020-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (98, 'Алгабас серикбай 21', '', '2022-04-29 05:01:34.137073+00', '2022-04-29 05:01:34.137073+00', 42, 'Неиз', '+7 (708) 190-39-47', '', true, '28004', 13, '2020-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (99, 'Черкасской обороны 37', '', '2022-04-29 05:03:45.285712+00', '2022-04-29 05:03:45.285712+00', 42, 'Неиз', '+7 (701) 748-05-54', '', true, '28006', 13, '2020-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (100, 'Сеньжинского 3', '', '2022-04-29 07:55:44.796172+00', '2022-04-29 07:55:44.796172+00', 42, 'Александр', '+7 (701) 386-00-00', '', true, '28007', 11, '2020-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (101, 'Байсерке кенесары хан 14', '', '2022-04-29 07:58:22.922297+00', '2022-04-29 07:58:22.922297+00', 42, 'Неиз', '+7 (747) 687-71-76', '', true, '28008', 16, '2020-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (107, 'Узынагаш алгабас 85', '', '2022-05-03 04:20:16.629551+00', '2022-05-03 04:20:16.629551+00', 42, 'Неизв ', '+7 (777) 724-80-16', '', true, '05032', 15, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (108, 'Таусамалы сад. Об. Саулет', '', '2022-05-03 04:23:21.736098+00', '2022-05-03 04:23:21.736098+00', 42, 'Неизв ', '+7 (707) 743-59-89', '', true, '05033', 15, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (109, 'Михайловича 85', '', '2022-05-03 04:25:32.828285+00', '2022-05-03 04:25:32.828285+00', 42, 'Эмирхан', '+7 (777) 265-87-79', '', true, '05034', 17, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (110, 'Дружба алмаатинская 27а', '', '2022-05-03 05:39:25.768059+00', '2022-05-03 05:39:25.768059+00', 42, 'Комбар', '+7 (747) 455-38-53', '', true, '05035', 17, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (111, 'Каскелен', '', '2022-05-03 06:23:30.273083+00', '2022-05-03 06:23:30.273083+00', 42, 'Бахтияр', '+7 (775) 336-77-21', '', true, '05036', 30, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (54, 'Каскелен Жамбыла 23/1', '', '2022-04-14 03:09:05.008446+00', '2022-04-14 03:09:05.008446+00', 42, 'Есен', '+7 (701) 289-71-23', '', true, '123уточнить', 16, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (56, 'Международная 41', '', '2022-04-14 04:05:33.250116+00', '2022-04-14 04:05:33.250116+00', 42, 'Асылхан', '+7 (778) 480-97-23', '', true, '14о4', 13, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (64, 'Жамбыл новострой ', '', '2022-04-15 04:21:05.396635+00', '2022-05-03 06:16:36.054356+00', 42, 'Самат', '+7 (771) 606-21-21', '+7 (747) 440-21-21', true, '21110071GCKG8KYA', 22, '2021-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (112, 'Варшавский переулок 22', '', '2022-05-03 13:34:41.605517+00', '2022-05-03 13:34:41.605517+00', 42, 'Руслан', '+7 (701) 575-77-47', '', true, '03058', 15, '2020-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (113, 'Пока не знаю', '', '2022-05-04 08:24:26.128224+00', '2022-05-04 08:24:26.128224+00', 32, 'Жалгас', '+7 (771) 815-19-47', '', true, '1111111', 27, '2011-11-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (114, 'Суюнбая 571', '', '2022-05-04 10:24:07.733744+00', '2022-05-04 10:24:07.733744+00', 42, '  Нуржанар', '+7 (776) 832-74-04', '', true, '05067', 15, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (115, 'Кыргаулды енбекши 11/1', '', '2022-05-04 10:27:21.786959+00', '2022-05-04 10:27:21.786959+00', 42, '  Неизв', '+7 (777) 384-81-24', '', true, '05068', 16, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (116, 'Ну алатау 8я улица 15', '', '2022-05-05 01:49:22.440272+00', '2022-05-05 01:49:22.440272+00', 42, ' Мадина', '+7 (777) 248-02-04', '', true, '0605', 16, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (117, 'Шугла дала 120', '', '2022-05-05 02:52:29.51631+00', '2022-05-05 02:52:29.51631+00', 42, ' Неиз', '+7 (707) 701-17-75', '', true, '06051', 16, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (118, 'Казцик токтарова 1а', '', '2022-05-05 06:00:56.124355+00', '2022-05-05 06:00:56.124355+00', 42, ' Неиз', '+7 (777) 822-50-27', '', true, '06052', 16, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (119, 'Ерминсай переулок 7 д 27', '', '2022-05-05 06:03:28.019329+00', '2022-05-05 06:03:28.019329+00', 42, ' Неиз', '+7 (701) 755-69-48', '', true, '06053', 16, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (120, 'Костромская 42', '', '2022-05-06 00:58:08.65666+00', '2022-05-06 00:58:08.65666+00', 42, 'Андрей ', '+7 (701) 988-84-81', '', true, '06050', 11, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (121, 'Кулжинский тракт75', '', '2022-05-06 06:53:34.682406+00', '2022-05-06 06:53:34.682406+00', 42, 'Незв', '+7 (775) 398-71-83', '', true, '0606', 11, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (122, 'Калкаман 2 кусынова46', '', '2022-05-06 07:46:57.999276+00', '2022-05-06 07:46:57.999276+00', 42, 'Бахыткуль', '+7 (701) 852-03-00', '', true, '06061', 11, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (123, 'Бутаковка', '', '2022-05-06 09:44:43.305443+00', '2022-05-06 09:44:43.305443+00', 42, 'Сергей', '+7 (701) 712-28-70', '', true, '06062', 11, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (124, 'пос. Туздыбастау, мкр. Айжарык, ул. Кайнар, 19 (по новой алатауской трассе)', '', '2022-05-07 07:16:28.459602+00', '2022-05-07 07:16:28.459602+00', 32, 'Неизв', '+7 (777) 264-13-39', '', true, 'Неизв', 17, '2000-11-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (125, 'Улжан 1 балалайка 59', '', '2022-05-10 07:40:10.088691+00', '2022-05-10 07:40:10.088691+00', 42, 'Гайша', '+7 (747) 153-07-93', '', true, '0602', 12, '2018-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (126, 'Кательникова 30', '', '2022-05-10 12:14:46.199757+00', '2022-05-10 12:14:46.199757+00', 42, 'Неиз', '+7 (747) 844-60-41', '', true, '0601', 16, '2018-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (127, 'Коксай 8й квартал 14', '', '2022-05-10 12:16:52.383795+00', '2022-05-10 12:16:52.383795+00', 42, 'Неиз', '+7 (702) 473-12-74', '', true, '06011', 16, '2018-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (128, 'Татарка', '', '2022-05-11 03:44:01.409245+00', '2022-05-11 03:44:01.409245+00', 42, 'Татьяна', '+7 (701) 804-43-11', '', true, '0101', 30, '2018-12-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (250, 'Айгерим бугыты 75', '', '2022-07-20 06:28:51.928527+00', '2022-07-20 06:28:51.928527+00', 42, 'Неизв', '+7 (700) 257-79-41', '', true, '18075', 16, '2022-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (133, 'ул. Монтажная, 77', '', '2022-05-11 03:48:36.322427+00', '2022-05-11 03:48:36.322427+00', 32, 'Неизв', '+7 (707) 717-11-35', '', true, '21110038GCKGAKYA', 23, '2021-10-17 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (134, 'с. Жанатурмыс, 1-й квартал, 108 (уточнить по телефону)', '', '2022-05-11 08:35:26.782078+00', '2022-05-11 08:35:26.782078+00', 32, 'Неизв', '+7 (747) 987-65-46', '', true, '2207654', 15, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (135, 'Каскелен есиль 22', '', '2022-05-11 09:54:26.013784+00', '2022-05-11 23:59:24.226218+00', 42, 'Неизв', '+7 (702) 683-57-40', '', true, '6KS0117078', 16, '2018-12-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (136, 'Ботан саламатова 14', '', '2022-05-12 04:12:47.991877+00', '2022-05-12 04:12:47.991877+00', 42, 'Неизв', '+7 (702) 310-04-82', '', true, '050512', 17, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (144, 'Ладушки 13', '', '2022-05-12 06:54:11.019738+00', '2022-05-12 06:54:11.019738+00', 42, 'Семба', '+7 (701) 744-72-83', '', true, '1205', 27, '2022-05-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (145, 'Енбекши ынтымак 9а', '', '2022-05-12 07:11:03.983683+00', '2022-05-12 07:11:03.983683+00', 42, 'Неизв', '+7 (702) 155-51-98', '', true, '12051', 17, '2022-05-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (146, 'Таусамал 4я линия 243', '', '2022-05-12 07:24:17.621872+00', '2022-05-12 07:24:17.621872+00', 42, 'Аскар', '+7 (701) 120-30-36', '', true, '12052', 27, '2022-05-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (147, 'Карагайлы тажиева 28', '', '2022-05-12 10:27:55.143401+00', '2022-05-12 10:27:55.143401+00', 42, 'Шахар', '+7 (701) 485-93-99', '', true, '12053', 27, '2022-05-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (148, 'Туздыбастау кунаева 568', '', '2022-05-12 11:12:34.055217+00', '2022-05-12 11:12:34.055217+00', 42, 'Нурлан', '+7 (776) 280-79-77', '', true, '12054', 27, '2022-05-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (149, 'Кораллы 9', '', '2022-05-13 05:30:24.960355+00', '2022-05-13 05:30:24.960355+00', 42, 'Неиз', '+7 (701) 983-30-01', '', true, '121001', 18, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (150, 'Калкаман 2 орман 113', '', '2022-05-13 07:39:26.553706+00', '2022-05-13 07:39:26.553706+00', 42, 'Сергей ', '+7 (777) 020-80-04', '', true, '121002', 18, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (151, 'Туздыбастау бокина 6', '', '2022-05-14 03:23:59.951655+00', '2022-05-14 03:23:59.951655+00', 42, 'Ерлан', '+7 (701) 761-75-00', '', true, '12056', 30, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (152, 'Весна 65 акжар', '', '2022-05-15 06:08:05.685083+00', '2022-05-15 06:08:05.685083+00', 42, 'Хван', '+7 (701) 321-76-77', '', true, '112201', 13, '2020-12-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (153, 'Акбулак алтынден у.сатпаева1в', '', '2022-05-16 03:44:05.850741+00', '2022-05-16 03:44:05.850741+00', 42, 'Лиза', '+7 (707) 130-00-00', '', true, '121201', 30, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (154, 'Сейфулина 210', '', '2022-05-16 03:52:49.754076+00', '2022-05-16 03:52:49.754076+00', 42, 'Неиз', '+7 (700) 400-19-64', '', true, '121202', 15, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (155, 'Узынагаш жестокая 103', '', '2022-05-16 03:57:05.019872+00', '2022-05-16 03:57:05.019872+00', 42, 'Неиз', '+7 (777) 971-20-27', '', true, '121203', 15, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (156, 'Дальневосточный 3', '', '2022-05-16 05:40:08.675578+00', '2022-05-16 05:40:08.675578+00', 42, 'Борис', '+7 (701) 111-70-88', '', true, '121204', 29, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (158, 'Калкаман 2 Латифа кыдырбекова 36/1', '', '2022-05-16 08:42:08.927574+00', '2022-05-16 08:42:08.927574+00', 42, 'Неизв', '+7 (776) 222-00-06', '', true, '121206', 40, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (159, 'Жангильдина 112', '', '2022-05-17 03:51:07.870677+00', '2022-05-17 03:51:07.870677+00', 42, 'Неизв', '+7 (701) 755-80-35', '', true, '121207', 11, '2015-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (160, 'Туздыбастау мр. Акжарык 329', '', '2022-05-17 03:55:38.010304+00', '2022-05-17 03:55:38.010304+00', 42, 'Аутанов ', '+7 (707) 604-54-62', '', true, '121208', 17, '2015-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (161, 'Карабулак школьная 161', '', '2022-05-17 05:52:12.228801+00', '2022-05-17 05:52:12.228801+00', 42, 'Неиз', '+7 (707) 114-90-57', '', true, '121209', 17, '2015-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (164, 'Кайрат общежитие', '', '2022-05-18 03:49:37.196675+00', '2022-05-18 03:49:37.196675+00', 42, 'Айбек', '+7 (700) 992-25-27', '', true, '18051', 17, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (167, 'Бесагаш ', '', '2022-05-18 06:17:29.237763+00', '2022-05-18 06:17:29.237763+00', 42, 'Мади', '+7 (702) 702-34-56', '', true, '18054', 11, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (170, 'Каскелен абылайхана 41', '', '2022-05-20 03:16:17.398935+00', '2022-05-20 03:16:17.398935+00', 42, 'Неизв', '+7 (778) 316-48-88', '', true, '20051', 16, '2019-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (171, 'Бесагаш мамышулы 65', '', '2022-05-20 03:19:34.248364+00', '2022-05-20 03:19:34.248364+00', 42, 'Неизв', '+7 (700) 088-86-09', '', true, '20052', 16, '2019-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (173, 'Айтей Байконур 31', '', '2022-05-20 09:40:32.564416+00', '2022-05-20 09:40:32.564416+00', 42, 'Неизв', '+7 (778) 164-63-63', '', true, '20054', 40, '2019-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (174, 'Боролдай', '', '2022-05-20 10:58:51.617452+00', '2022-05-20 10:58:51.617452+00', 42, 'Альбина', '+7 (747) 666-80-72', '', true, '20055', 40, '2019-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (157, 'Жанайдар садукасова 1/1', '', '2022-05-16 08:37:57.456551+00', '2022-05-31 07:50:22.339155+00', 42, 'Неизв', '+7 (778) 000-20-86', '', true, '6LT001140091', 16, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (162, 'Затаевича 51', '', '2022-05-17 09:20:19.690509+00', '2022-05-31 07:51:02.993323+00', 42, 'Нуржан', '+7 (701) 930-99-88', '', true, '330167823220320000538', 29, '2022-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (168, 'Борзова 32 кв1', '', '2022-05-18 06:26:24.800169+00', '2022-05-31 07:52:03.011217+00', 42, 'Неизв', '+7 (776) 189-81-89', '', true, '330167623212630003639', 27, '2022-05-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (165, 'Долан новостройка', '', '2022-05-18 03:53:18.505496+00', '2022-05-31 07:53:09.200554+00', 42, 'Калдан', '+7 (775) 818-02-64', '', true, '5G5171000075', 16, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (166, 'Иргили нурлы тан 27', '', '2022-05-18 04:20:03.135618+00', '2022-05-31 07:53:53.066327+00', 42, 'Владислав', '+7 (708) 843-64-61', '', true, '6KS0143250', 16, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (169, 'Асылбек сыграй 93', '', '2022-05-20 03:13:11.023818+00', '2022-05-31 07:55:48.104999+00', 42, 'Неизв', '+7 (702) 431-51-17', '', true, '5G7171000097', 16, '2017-11-02 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (172, 'Акбота мамышулы 225', '', '2022-05-20 09:23:30.292178+00', '2022-05-31 07:57:09.005839+00', 42, 'Неизв', '+7 (707) 296-53-94', '', true, '2021110573', 40, '2019-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (175, 'Дауленова 5/42', '', '2022-05-23 03:29:40.303954+00', '2022-05-23 03:29:40.303954+00', 42, 'Ержан', '+7 (707) 111-93-17', '', true, '2105', 11, '2019-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (251, 'Айганым', '', '2022-07-20 06:30:54.941907+00', '2022-07-20 06:30:54.941907+00', 42, 'Неизв', '+7 (707) 111-36-11', '', true, '18076', 16, '2022-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (179, 'Улжан карасаз 60', '', '2022-05-30 03:28:42.473941+00', '2022-05-30 03:28:42.473941+00', 42, 'Неизв', '+7 (707) 329-16-24', '', true, '2505', 16, '2020-12-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (180, 'Кыргаулды шалкар 40', '', '2022-05-30 03:31:58.198221+00', '2022-05-30 03:31:58.198221+00', 42, 'Неизв', '+7 (771) 242-24-98', '', true, '25051', 40, '2020-12-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (181, 'Коксай таулесыздык 103', '', '2022-05-30 07:52:12.224323+00', '2022-05-30 07:52:12.224323+00', 42, 'Мольдер ', '+7 (778) 794-25-09', '', true, '25052', 11, '2020-12-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (163, 'Асылбекова 87', '', '2022-05-17 10:13:47.599211+00', '2022-05-31 07:45:53.970758+00', 42, 'Алишер', '+7 (707) 677-83-44', '', true, '22080006GCAY6K2A', 21, '2022-05-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (182, 'Коктюбе', '', '2022-05-31 06:32:40.244703+00', '2022-05-31 07:46:51.395626+00', 42, 'Елизавета', '+7 (777) 777-71-12', '', true, '330167123213010000074', 28, '2022-05-28 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (178, 'мкр. Нур Алатау, ул. Нурлы Байкенова, 36', '', '2022-05-25 02:55:32.884581+00', '2022-05-31 07:47:46.103828+00', 32, 'Бимурат', '+7 (702) 318-56-44', '', true, '506151000607', 11, '2015-03-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (176, 'Кайрат бельбулак 20', '', '2022-05-23 03:32:40.825391+00', '2022-05-31 07:58:12.025425+00', 42, 'Даурен', '+7 (701) 728-39-20', '', true, '6LK000142501', 11, '2021-05-14 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (177, 'Коккайнар жангильдина 8а', '', '2022-05-24 02:29:08.51148+00', '2022-05-31 07:59:02.839529+00', 42, 'Нурлан', '+7 (771) 493-53-89', '', true, '504191000208', 11, '2019-08-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (183, 'п. Каргаулды, ул. Коктем-2, 88А', '', '2022-06-02 04:26:20.999448+00', '2022-06-02 04:26:20.999448+00', 32, 'Лайлим', '+7 (707) 602-10-02', '', true, '220602-1', 11, '2019-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (184, 'Раимбёк суюнбая 8а', '', '2022-06-02 10:49:33.56325+00', '2022-06-02 10:49:33.56325+00', 42, 'Куаныш', '+7 (775) 783-78-50', '', true, '2705', 12, '2018-12-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (185, 'Таусамалы сакебатыра 19', '', '2022-06-03 05:38:13.42081+00', '2022-06-03 05:38:13.42081+00', 42, 'Неизв', '+7 (707) 458-58-92', '', true, '27051', 16, '2021-12-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (187, 'ул. Малиновая 163/1', '', '2022-06-21 03:22:48.076629+00', '2022-06-21 03:22:48.076629+00', 32, 'Халида', '+7 (775) 205-03-95', '', true, '20480087GCKG6KYA', 21, '2021-10-06 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (188, 'РВ 90  Франка 9', '', '2022-06-24 05:00:04.315178+00', '2022-06-24 13:29:32.183651+00', 42, 'Михаил', '+7 (700) 495-75-25', '', true, '330088523202740000087', 27, '2022-06-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (191, 'Садовникова 29', '', '2022-06-27 08:28:15.491557+00', '2022-06-27 08:28:15.491557+00', 42, 'Неизв', '+7 (747) 212-64-07', '', true, '2606222', 40, '2022-06-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (189, 'Львова 34', '', '2022-06-27 03:32:31.54493+00', '2022-06-27 11:22:16.33241+00', 42, 'Денис', '+7 (701) 740-17-71', '', true, '330167623212630003505', 27, '2022-06-22 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (190, 'Жанакуат', '', '2022-06-27 04:30:11.905536+00', '2022-06-28 03:34:31.02266+00', 42, 'Игорь', '+7 (701) 933-88-84', '', true, '330168423211950001771', 30, '2022-06-22 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (193, 'Узынагаш баспана 33б', '', '2022-06-30 03:22:06.689455+00', '2022-06-30 03:22:06.689455+00', 42, 'Неизв', '+7 (747) 538-91-33', '', true, '2906201', 17, '2020-10-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (194, 'Боролдай возник 3 д 105а', '', '2022-06-30 03:25:23.015586+00', '2022-06-30 03:25:23.015586+00', 42, 'Неизв', '+7 (701) 744-52-85', '', true, '2906202', 13, '2020-10-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (196, 'Рихорда зорге 2б', '', '2022-06-30 06:24:12.91399+00', '2022-06-30 06:24:12.91399+00', 42, 'Жандос', '+7 (747) 457-95-97', '', true, '2906204', 22, '2022-06-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (192, 'Акбулак перехотько 8', '', '2022-06-30 03:17:35.357+00', '2022-07-03 05:51:45.228921+00', 42, 'Алла Николаевна ', '+7 (701) 608-38-13', '', true, '20150035GCKG4KYA', 20, '2020-12-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (195, 'Каскелен, к/г "Теремки", 58', '', '2022-06-30 04:22:15.240547+00', '2022-06-30 11:33:01.299252+00', 42, 'Тимур', '+7 (701) 700-38-80', '+7 (778) 470-08-20', true, '2030L70956', 49, '2022-02-18 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (197, 'Коккайнар', '', '2022-07-01 02:52:45.014655+00', '2022-07-01 02:52:45.014655+00', 42, 'Умарбек', '+7 (776) 715-80-05', '', true, '0107', 16, '2018-05-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (206, 'Фабричный', '', '2022-07-03 05:56:53.324344+00', '2022-07-03 05:56:53.324344+00', 42, 'Мухамедияр', '+7 (708) 330-90-70', '', true, '03722', 16, '2020-10-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (207, 'Ахьанова 28', '', '2022-07-04 08:31:24.455254+00', '2022-07-04 08:31:24.455254+00', 42, 'Фархат', '+7 (701) 314-58-36', '', true, '040722', 11, '2019-10-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (209, 'Коянкус', '', '2022-07-04 08:40:40.32372+00', '2022-07-04 08:40:40.32372+00', 42, 'Болат', '+7 (771) 250-04-80', '', true, '040724', 16, '2019-10-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (210, 'Жаналык', '', '2022-07-04 08:46:40.550577+00', '2022-07-04 08:46:40.550577+00', 42, 'Виталик', '+7 (707) 240-76-69', '', true, '330168223213270002903', 30, '2022-06-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (211, 'Каскелен', '', '2022-07-05 03:38:38.941918+00', '2022-07-05 03:38:38.941918+00', 42, 'Ернур', '+7 (707) 487-74-48', '', true, '0607', 27, '2022-07-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (213, 'Мейрам 47', '', '2022-07-05 04:41:25.354755+00', '2022-07-05 04:41:25.354755+00', 42, 'Неиз', '+7 (707) 329-07-78', '', true, '06072', 16, '2021-07-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (212, 'Жамбыл жанбыла 43', '', '2022-07-05 04:38:34.484404+00', '2022-07-05 10:16:53.349641+00', 42, 'Неиз', '+7 (708) 193-84-42', '', true, '6Lk000284714', 16, '2022-07-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (214, 'Луганского 48 а', '', '2022-07-05 05:32:06.759675+00', '2022-07-05 10:18:37.260574+00', 42, 'Владислав', '+7 (705) 619-29-54', '', true, '6Lk000238346', 11, '2022-07-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (217, 'Якира 17б', '', '2022-07-07 05:26:07.796597+00', '2022-07-07 05:26:07.796597+00', 42, 'Неизв', '+7 (777) 260-90-05', '', true, '06077', 12, '2008-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (220, 'Талгар байгазинова 45', '', '2022-07-07 06:59:55.479727+00', '2022-07-07 06:59:55.479727+00', 42, 'Неизв', '+7 (747) 225-15-91', '', true, '0608', 16, '2021-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (208, 'Коксай, новостройка', '', '2022-07-04 08:37:20.802705+00', '2022-07-08 04:12:14.132205+00', 42, 'Акморал', '+7 (777) 215-95-48', '+7 (701) 406-04-10', true, '5G3181000025', 16, '2019-10-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (218, 'Есенберлина 14', '', '2022-07-07 05:31:46.212859+00', '2022-07-08 04:13:52.153175+00', 42, 'Неизв', '+7 (702) 411-21-00', '', true, '2020062864', 40, '2021-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (219, 'Токашбукина 4 кв. 1', '', '2022-07-07 05:35:20.504385+00', '2022-07-08 04:14:36.253791+00', 42, 'Неизв', '+7 (707) 515-00-06', '', true, '6LK000284436', 15, '2022-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (222, 'Каскелен аксаут 5', '', '2022-07-08 03:18:55.977225+00', '2022-07-08 08:59:14.275232+00', 42, 'Неизв', '+7 (777) 694-00-05', '', true, ' 6Lk000202038', 13, '2022-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (221, 'Декабристов 35/1', '', '2022-07-08 03:16:49.045028+00', '2022-07-08 09:00:19.394365+00', 42, 'Неизв', '+7 (702) 377-77-74', '', true, '6Lk000175739', 13, '2021-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (224, 'Туздыбастау ертарган 23', '', '2022-07-08 09:28:56.53802+00', '2022-07-08 09:28:56.53802+00', 42, 'Неизв', '+7 (707) 379-38-22', '', true, '06085', 16, '2020-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (226, 'Шаляпина-Правды', '', '2022-07-10 05:16:12.143743+00', '2022-07-10 05:17:32.539668+00', 32, 'Баня SAU BU', '+7 (702) 320-80-45', '', true, 'Sek', 50, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (230, 'Панфилов', '', '2022-07-11 03:22:36.929878+00', '2022-07-11 03:22:36.929878+00', 42, 'Неизв', '+7 (771) 862-46-32', '', true, '08071', 16, '2020-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (231, 'Ачинская 25 кв.3', '', '2022-07-11 04:23:56.709246+00', '2022-07-11 04:23:56.709246+00', 42, 'Рабига', '+7 (707) 181-16-66', '+7 (777) 876-09-31', true, '08072', 16, '2020-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (215, 'Омская 29', '', '2022-07-05 09:47:22.738732+00', '2022-07-11 11:16:40.685748+00', 42, 'Неизв', '+7 (777) 823-78-02', '', true, 'L2615T314040055', 51, '2019-07-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (223, 'Жандарбекова 259', '', '2022-07-08 03:21:36.761834+00', '2022-07-11 11:17:43.279025+00', 42, 'Неизв', '+7 (707) 404-63-70', '', true, '5G1171000463', 15, '2020-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (82, 'Боролдай м.р. жайнак жангильдина4', '', '2022-04-21 04:12:15.016301+00', '2022-07-12 03:42:07.686334+00', 42, ' Эрика', '+7 (702) 431-13-26', '', true, '6LK000334865', 11, '2022-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (225, 'Посёлок жобек жолы ертаргын 23', '', '2022-07-08 09:33:38.514448+00', '2022-07-12 03:42:43.5405+00', 42, 'Неизв', '+7 (701) 823-49-47', '', true, '6LK000270607', 16, '2022-06-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (232, 'Пакрышкина 2а', '', '2022-07-12 05:19:10.140538+00', '2022-07-12 05:19:10.140538+00', 42, 'Наиля', '+7 (701) 767-91-61', '', true, '0807', 13, '2017-10-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (233, 'Гурьевская 19', '', '2022-07-12 14:53:39.074884+00', '2022-07-12 14:53:39.074884+00', 42, 'Надежда', '+7 (700) 251-30-59', '', true, '0875', 17, '2008-01-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (234, 'Гульдала', '', '2022-07-12 14:57:11.566567+00', '2022-07-12 14:57:11.566567+00', 42, 'Неизвестный ', '+7 (707) 864-65-51', '', true, '0876', 17, '2019-01-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (186, 'Айгерим 2 шалкар 12', '', '2022-06-15 03:56:29.722846+00', '2022-07-15 03:02:21.965873+00', 42, ' Жанна', '+7 (701) 303-10-07', '+7 (702) 333-13-33', true, '1406', 22, '2021-11-16 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (235, 'Чембулак ресторан', '', '2022-07-15 08:48:06.60841+00', '2022-07-15 08:48:06.60841+00', 42, 'Данияр', '+7 (708) 767-76-75', '', true, '1507', 20, '2022-07-07 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (236, 'Мамыр 105', '', '2022-07-15 15:43:03.448015+00', '2022-07-15 15:43:03.448015+00', 42, 'Неизвестно ', '+7 (707) 777-59-42', '', true, '15072', 17, '2020-01-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (237, 'Таугуль 3 нурмаханова32', '', '2022-07-16 03:04:49.084382+00', '2022-07-16 03:04:49.084382+00', 42, 'Шырын', '+7 (777) 493-92-22', '', true, '15073', 17, '2022-01-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (238, 'Атамекен 178 ', '', '2022-07-16 03:36:16.084165+00', '2022-07-16 03:36:16.084165+00', 42, 'Айдар', '+7 (778) 422-90-00', '', true, '15074', 17, '2019-01-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (240, 'Кемиртоган новостройка', '', '2022-07-18 03:08:20.194901+00', '2022-07-18 03:08:20.194901+00', 42, 'Неизв ', '+7 (707) 485-72-23', '', true, '1707', 40, '2022-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (239, 'Каменка айболит', '', '2022-07-16 09:57:15.33434+00', '2022-07-19 04:29:36.215409+00', 42, 'Манарбек', '+7 (776) 692-22-66', '', true, '5G2181000314', 17, '2019-01-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (242, 'Дулатова 33в', '', '2022-07-18 04:21:38.846647+00', '2022-07-18 04:21:38.846647+00', 42, 'Неизв ', '+7 (701) 733-58-40', '', true, '17072', 27, '2022-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (243, 'Село чемолган квартал 3 д 111', '', '2022-07-18 04:24:58.825635+00', '2022-07-18 04:24:58.825635+00', 42, 'Неизв ', '+7 (701) 178-54-50', '', true, '17073', 16, '2020-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (244, 'Коянкус берлик 12', '', '2022-07-18 09:00:33.566352+00', '2022-07-18 09:00:33.566352+00', 42, 'Шерхан', '+7 (701) 651-00-00', '', true, '17074', 16, '2020-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (245, 'Киз', '', '2022-07-19 03:19:19.511274+00', '2022-07-19 03:19:19.511274+00', 42, 'Неизв', '+7 (777) 756-67-12', '', true, '1807', 13, '2021-09-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (246, 'Т', '', '2022-07-19 03:21:46.393183+00', '2022-07-19 03:21:46.393183+00', 42, 'Неизв', '+7 (707) 479-10-49', '', true, '18071', 15, '2022-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (247, 'Тюмебаев', '', '2022-07-19 03:22:14.321248+00', '2022-07-19 03:22:14.321248+00', 42, 'Неизв', '+7 (707) 479-10-49', '', true, '18072', 15, '2022-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (248, 'Тургутозала 110', '', '2022-07-19 03:24:36.034388+00', '2022-07-19 03:24:36.034388+00', 42, 'Неизв', '+7 (771) 775-07-30', '', true, '18073', 40, '2022-07-11 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (241, 'Альфараби 7', '', '2022-07-18 03:11:18.777929+00', '2022-07-19 04:28:28.615809+00', 42, 'Неизв ', '+7 (705) 992-42-83', '', true, '6Lk000201734', 16, '2022-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (252, 'Байсерке', '', '2022-07-21 03:12:57.461362+00', '2022-07-21 03:12:57.461362+00', 42, 'Неизве', '+7 (700) 989-96-01', '', true, '1907', 16, '2018-03-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (253, 'Михайловича 55', '', '2022-07-21 13:13:02.097474+00', '2022-07-21 13:13:02.097474+00', 42, 'Неизве', '+7 (707) 603-15-19', '', true, '19071', 11, '2017-01-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (254, 'Московская 38', '', '2022-07-22 05:55:58.798975+00', '2022-07-22 05:55:58.798975+00', 42, 'Карлыгаш', '+7 (777) 393-30-13', '', true, '2007', 11, '2017-03-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (255, 'Афценау 20а', '', '2022-07-22 06:04:27.630527+00', '2022-07-22 06:04:27.630527+00', 42, 'Неизв ', '+7 (705) 150-00-05', '', true, '20071', 16, '2022-07-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (257, 'Карасу д 29 кв. 2', '', '2022-07-22 06:09:15.119828+00', '2022-07-22 06:09:15.119828+00', 42, 'Неизв ', '+7 (778) 618-53-20', '', true, '20073', 16, '2022-07-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (258, 'Кемертоган', '', '2022-07-22 06:20:07.444366+00', '2022-07-22 06:20:07.444366+00', 42, 'Неизв ', '+7 (707) 995-49-52', '', true, '20074', 40, '2022-07-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (256, 'Кемертоган новостройка', '', '2022-07-22 06:07:16.878889+00', '2022-07-22 08:06:09.643708+00', 42, 'Неизв ', '+7 (701) 901-25-84', '+7 (707) 158-70-60', true, '6Lk020334842', 16, '2022-07-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (259, ' Тюмебаева Кенесарыхана 92', '', '2022-07-22 08:10:21.403878+00', '2022-07-22 08:10:21.403878+00', 42, 'Неизв ', '+7 (700) 436-10-10', '+7 (747) 156-14-24', true, '20075', 40, '2022-07-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (260, 'Кимел есенхана 11', '', '2022-07-23 02:31:31.108342+00', '2022-07-23 02:31:31.108342+00', 42, 'Неизв ', '+7 (701) 768-64-42', '', true, '2107', 15, '2022-07-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (261, 'Даркенбаева 65', '', '2022-07-25 03:39:58.017326+00', '2022-07-25 03:39:58.017326+00', 42, 'Неизве', '+7 (701) 424-44-27', '', true, '21075', 16, '2020-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (262, 'Крылова 36', '', '2022-07-25 03:42:11.369447+00', '2022-07-25 03:42:11.369447+00', 42, 'Неизве', '+7 (701) 344-78-90', '', true, '21076', 16, '2022-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (263, 'Панфилов', '', '2022-07-27 06:09:45.856518+00', '2022-07-27 06:09:45.856518+00', 42, 'Неизв', '+7 (700) 353-65-85', '', true, '2207', 40, '2020-06-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (264, 'Междуреченск', '', '2022-07-28 05:15:26.343928+00', '2022-07-28 05:15:26.343928+00', 42, 'Неизв', '+7 (708) 981-97-24', '', true, '22071', 40, '2022-06-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (265, 'Абайские дачи', '', '2022-07-29 14:00:09.508645+00', '2022-07-29 14:00:09.508645+00', 42, 'Неизве ', '+7 (777) 029-41-91', '', true, '2907', 13, '2018-04-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (266, 'Алгабас беласу 5', '', '2022-07-29 14:21:18.533352+00', '2022-07-29 14:21:18.533352+00', 42, 'Ришат', '+7 (747) 228-88-05', '', true, '29071', 20, '2022-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (267, 'Теректы', '', '2022-07-30 03:42:16.657328+00', '2022-07-30 03:42:16.657328+00', 42, 'Неизв', '+7 (778) 363-05-12', '', true, '29072', 14, '2019-07-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (268, 'Калкаман 2 маулен балакая 15', '', '2022-08-01 07:00:22.468972+00', '2022-08-01 07:00:22.468972+00', 42, 'Неизв', '+7 (707) 648-90-97', '', true, '3107', 16, '2019-07-07 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (269, 'Весна 65 участок 89', '', '2022-08-01 07:12:58.011152+00', '2022-08-01 07:12:58.011152+00', 42, 'Неизв', '+7 (701) 575-77-73', '', true, '31071', 21, '2022-07-07 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (270, 'Каскелен автовокзал новостройка', '', '2022-08-03 04:43:45.757717+00', '2022-08-03 04:43:45.757717+00', 42, 'Неизв ', '+7 (775) 815-48-21', '', true, '0208', 16, '2020-05-21 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (271, 'Омарова 18', '', '2022-08-05 05:18:01.928692+00', '2022-08-05 05:18:01.928692+00', 42, 'Жанарбек', '+7 (701) 417-80-00', '', true, '02081', 14, '2021-12-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (272, 'ул. Пролетарская, 6', '', '2022-08-05 06:38:10.201253+00', '2022-08-05 06:38:10.201253+00', 32, 'Ербол', '+7 (705) 777-75-03', '', true, 'Ййй', 12, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (273, 'Туздыбастау достык', '', '2022-08-08 03:59:49.653837+00', '2022-08-08 03:59:49.653837+00', 42, 'Неизвестно ', '+7 (701) 732-12-20', '', true, '0708', 16, '2020-10-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (274, 'Шалкар у.жаболы14', '', '2022-08-08 04:26:06.553538+00', '2022-08-08 04:26:06.553538+00', 42, 'Неизвестно ', '+7 (707) 282-74-01', '', true, '07081', 16, '2022-10-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (275, 'Иргели', '', '2022-08-09 06:58:07.555953+00', '2022-08-09 06:58:07.555953+00', 42, 'Неизвестно ', '+7 (707) 348-64-72', '', true, '07082', 16, '2022-10-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (276, '19й кл.', '', '2022-08-09 07:29:17.57685+00', '2022-08-09 07:29:17.57685+00', 42, 'Марат', '+7 (777) 282-91-53', '', true, '07083', 16, '2019-10-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (277, 'Первомайские пруды дачи ардагер 8я линия д.17', '', '2022-08-09 08:11:35.223864+00', '2022-08-09 08:11:35.223864+00', 42, 'Неизв', '+7 (747) 346-83-81', '', true, '07084', 40, '2019-10-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (278, 'Левского 26', '', '2022-08-11 03:50:06.059439+00', '2022-08-11 03:50:06.059439+00', 42, 'Базаркуль', '+7 (707) 361-33-47', '', true, '1008', 16, '2019-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (279, 'Калкаман 2 Тыныбаева 7', '', '2022-08-11 04:22:01.721495+00', '2022-08-11 04:22:01.721495+00', 42, 'Неизв', '+7 (708) 256-35-61', '', true, '10081', 16, '2019-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (280, 'ул. Жумабаева, 232/20', '', '2022-08-23 04:05:09.214486+00', '2022-08-23 04:05:09.214486+00', 32, 'Юсунов Марат', '+7 (705) 946-28-07', '+7 (707) 175-51-76', true, '20150055GCG4KYA', 20, '2021-09-08 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (281, 'ул. Изгилик, 31а', '', '2022-08-23 04:08:01.965194+00', '2022-08-23 04:08:01.965194+00', 32, 'Мустафина Алина (Галым)', '+7 (707) 304-05-88', '+7 (747) 710-70-11', true, '21110099GCKGAKYA', 23, '2001-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (282, 'мкр. Алгабас, ул. Беласу, 5', '', '2022-09-13 05:01:53.396047+00', '2022-09-13 05:01:53.396047+00', 32, 'Хамраев Ришат', '+7 (747) 228-88-05', '', true, '21400006GCKG4K2A', 20, '2022-06-29 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (283, 'Новои 12я улица д 44', '', '2022-09-14 07:39:17.638551+00', '2022-09-14 07:39:17.638551+00', 42, 'Болат', '+7 (701) 221-18-88', '', true, '100922', 21, '2021-09-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (284, 'пос. Абай, новостройка', '', '2022-09-14 11:28:07.728432+00', '2022-09-14 11:28:07.728432+00', 32, 'Болат', '+7 (701) 045-00-55', '', true, 'уточнить', 27, '2001-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (285, 'Татимбета 52/1', '', '2022-09-16 03:52:34.555715+00', '2022-09-16 03:52:34.555715+00', 42, 'Неизв', '+7 (707) 559-74-95', '', true, '1209', 16, '2020-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (287, 'Алгабас куган жирау ', '', '2022-09-16 03:59:37.434877+00', '2022-09-16 03:59:37.434877+00', 42, 'Неизв', '+7 (778) 308-56-57', '', true, '12092', 16, '2020-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (288, 'Новостройка за леруа мерлен', '', '2022-09-16 04:18:40.401997+00', '2022-09-16 04:18:40.401997+00', 42, 'Ольга', '+7 (707) 240-04-41', '', true, '12093', 30, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (286, 'Туздыбастау Сейфулина 124', '', '2022-09-16 03:56:15.582519+00', '2022-09-19 06:39:40.614922+00', 42, 'Неизв', '+7 (777) 299-17-26', '', true, '6ЛЫ0029691', 18, '2020-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (290, 'Бельбулак', '', '2022-09-16 05:30:25.036612+00', '2022-09-16 05:30:25.036612+00', 42, 'Серик', '+7 (700) 555-58-53', '', true, '12095', 16, '2020-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (294, 'Каскелен Южный ', '', '2022-09-17 04:17:40.980663+00', '2022-09-17 04:17:40.980663+00', 42, 'Инна ', '+7 (777) 429-82-45', '', true, '12099', 27, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (298, 'Орёт Жапсарбаева 7', '', '2022-09-17 12:07:55.493613+00', '2022-09-17 12:07:55.493613+00', 42, 'Марат', '+7 (701) 449-89-23', '', true, '120913', 40, '2020-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (299, 'Орёт Жапсарбаева 7', '', '2022-09-17 12:08:39.683834+00', '2022-09-17 12:08:39.683834+00', 42, 'Марат', '+7 (701) 449-89-23', '', true, '120914', 40, '2020-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (301, 'Тайманова 222 г', '', '2022-09-17 12:20:04.075241+00', '2022-09-17 12:20:04.075241+00', 42, 'Владимер', '+7 (777) 802-52-00', '', true, '120916', 28, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (303, 'Жамбыл Сарыбай би19 ', '', '2022-09-17 12:27:26.35258+00', '2022-09-17 12:27:26.35258+00', 42, 'Неизв', '+7 (705) 783-86-81', '', true, '120918', 16, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (308, 'ул. Латифа хамиди, уг. ул. Мусорского', '', '2022-09-19 05:47:51.261321+00', '2022-09-19 05:47:51.261321+00', 32, 'Неизв', '+7 (778) 027-18-81', '', true, '220919-FAF2', 15, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (309, 'ул. Осоавиахима, 21а', '', '2022-09-19 05:50:06.932039+00', '2022-09-19 05:50:06.932039+00', 32, 'Неизв', '+7 (701) 033-12-22', '', true, '220919-Celtic', 12, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (326, 'Шалкар жобалы 14', '', '2022-09-26 05:05:59.431208+00', '2022-09-26 05:05:59.431208+00', 42, 'Неиз', '+7 (707) 828-74-01', '', true, '12105', 16, '2021-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (289, 'Новостройка за леруа мерлен', '', '2022-09-16 04:21:14.239335+00', '2022-09-19 06:37:49.565001+00', 42, 'Ольга', '+7 (707) 240-04-41', '', true, '330168223220280000276', 36, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (292, 'Мельникайте 27/2', '', '2022-09-17 02:08:13.025994+00', '2022-09-19 06:40:17.84361+00', 42, 'Анжела', '+7 (701) 474-44-97', '', true, '504141005715', 11, '2018-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (293, 'Вильямса 130', '', '2022-09-17 04:05:17.1965+00', '2022-09-19 06:42:25.526+00', 42, 'Таубай', '+7 (707) 277-19-66', '', true, '502171000320', 46, '2018-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (296, 'Ужет бекболата 92', '', '2022-09-17 07:43:28.585105+00', '2022-09-19 06:43:30.47827+00', 42, 'Дамир', '+7 (771) 748-71-21', '', true, '330168223221810000290', 36, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (297, 'Салтыкова щедрина 6', '', '2022-09-17 11:59:14.439135+00', '2022-09-19 06:44:27.321796+00', 42, 'Талгат', '+7 (701) 991-11-03', '', true, '330168223212350002770', 36, '2021-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (300, 'Фабричный Подгорная 4 кв. 10', '', '2022-09-17 12:15:09.336281+00', '2022-09-19 06:45:07.943667+00', 42, 'Гаухар', '+7 (707) 046-48-28', '', true, '330168223221810000259', 36, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (302, 'Станция чемолган ', '', '2022-09-17 12:23:23.014172+00', '2022-09-19 06:53:06.635697+00', 42, 'Нурекешев Б.', '+7 (707) 200-50-91', '', true, '6LK000284768', 54, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (216, 'Артиллерийская, 18', '', '2022-07-05 10:25:33.224711+00', '2022-09-19 06:58:23.381536+00', 42, 'Акрам Юнусович', '+7 (777) 666-77-72', '', true, '06075', 13, '2019-07-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (304, 'Узынагаш, село Ынтымак, ул. Оспанова, 31', '', '2022-09-19 05:38:22.810648+00', '2022-09-19 08:17:32.418211+00', 32, 'Неизв', '+7 (776) 969-31-26', '', true, '2021121219', 40, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (311, 'Алматинская область, Жамбылский район, село Узынагаш, ул. Конаева, 24', '', '2022-09-19 06:02:06.317087+00', '2022-09-19 11:57:48.733122+00', 32, 'Курманжан', '+7 (747) 638-08-83', '', true, '5G3181000252', 16, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (291, 'Институт ядерной  физики ', '', '2022-09-16 06:28:26.244707+00', '2022-09-20 03:08:39.425553+00', 42, 'Данияр', '+7 (777) 090-80-00', '', true, '6LK000205617', 16, '2022-06-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (307, 'Илийский район, с. Мухамеджан Тумебаева, ул. 50 лет победы, 235', '', '2022-09-19 05:46:04.382525+00', '2022-09-20 03:09:27.446723+00', 32, 'Неизв', '+7 (778) 940-24-86', '', true, '6LK000284383', 46, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (306, 'Илийский район, пос. Отеген батыр, ул. 6 линия, 282', '', '2022-09-19 05:44:41.589142+00', '2022-09-20 03:10:07.723658+00', 32, 'Неизв', '+7 (747) 375-71-57', '', true, '6LK000205704', 16, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (310, 'Алатауский район, мкр. Мадениет, ул. Аскар Сулейменова, 1', '', '2022-09-19 05:57:13.120383+00', '2022-09-20 03:13:00.107895+00', 32, 'Неизв', '+7 (775) 742-41-15', '', true, '6LK000271661', 54, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (295, 'Туздыбастау мангелик ель 13', '', '2022-09-17 04:50:48.770559+00', '2022-09-20 03:14:32.274366+00', 42, 'Айдар', '+7 (778) 565-41-43', '', true, '5G5191000021', 13, '2019-04-25 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (312, 'Каскелен', '', '2022-09-23 05:06:45.429604+00', '2022-09-23 07:08:59.228286+00', 42, 'Гайдар', '+7 (700) 400-19-64', '', true, '507101000964', 13, '2010-11-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (317, 'Карагайлы Жана 12в', '', '2022-09-23 07:11:30.086975+00', '2022-09-23 07:11:30.086975+00', 42, 'Мадина', '+7 (701) 758-48-82', '', true, '1215', 11, '2018-10-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (319, 'Каскелен новостройка', '', '2022-09-24 07:11:16.663357+00', '2022-09-28 05:32:20.076862+00', 42, 'Неизв ', '+7 (747) 470-08-95', '', true, '2021112205', 56, '2022-08-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (320, 'Узынагаш ', '', '2022-09-24 07:15:25.481388+00', '2022-09-24 07:15:25.481388+00', 42, 'Неизв ', '+7 (702) 322-08-55', '', true, '12033', 40, '2018-08-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (322, 'Таугуль ', '', '2022-09-26 03:45:54.924411+00', '2022-09-26 03:45:54.924411+00', 42, 'Мадина', '+7 (707) 131-32-40', '', true, '12101', 19, '2020-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (325, 'Абай абдулкарима 34', '', '2022-09-26 04:01:26.46141+00', '2022-09-26 04:01:26.46141+00', 42, 'Неиз', '+7 (702) 654-40-33', '', true, '12104', 16, '2021-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (318, 'Кайрат даулеткирея 130', '', '2022-09-24 07:06:02.789681+00', '2022-09-26 06:19:59.610444+00', 42, 'Неизв ', '+7 (701) 757-99-34', '', true, '5G3181000094', 16, '2018-10-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (328, 'Каскелен уч. 107', '', '2022-09-26 07:28:48.785886+00', '2022-09-26 07:28:48.785886+00', 42, 'Неизв ', '+7 (702) 840-68-69', '', true, '12107', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (329, 'Кемертоган ', '', '2022-09-26 07:30:22.354295+00', '2022-09-26 07:30:22.354295+00', 42, 'Неизв ', '+7 (702) 741-71-88', '', true, '12108', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (330, 'Покровский 18 кв.2', '', '2022-09-26 07:32:29.633257+00', '2022-09-26 07:32:29.633257+00', 42, 'Неизв ', '+7 (777) 608-21-64', '', true, '12109', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (331, 'Кыргаулды шаумяна 9', '', '2022-09-26 07:34:23.707142+00', '2022-09-26 07:34:23.707142+00', 42, 'Неизв ', '+7 (747) 598-78-43', '', true, '12110', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (332, 'Каскелен кайнарбулак 15/51', '', '2022-09-26 07:36:55.234454+00', '2022-09-26 07:36:55.234454+00', 42, 'Неизв ', '+7 (702) 976-58-22', '', true, '12111', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (333, 'мкр. Нур Алатау, 12-я улица, 46', '', '2022-09-26 08:22:45.294676+00', '2022-09-26 08:22:45.294676+00', 32, 'Когай Елена Александровна', '+7 (701) 714-66-91', '', true, '21110116GCKGAKYA', 23, '2021-10-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (334, 'мкр. Нур Алатау, 12-я улица, 46', '', '2022-09-26 08:23:24.907039+00', '2022-09-26 08:23:24.907039+00', 32, 'Когай Елена Александровна', '+7 (701) 714-66-91', '', true, '20410005GCKGAKYA', 23, '2021-10-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (335, 'мкр. Нур Алатау, 12-я улица, 44', '', '2022-09-26 08:23:52.936014+00', '2022-09-26 08:23:52.936014+00', 32, 'Когай Елена Александровна', '+7 (701) 714-66-91', '', true, '21110002GCKGAKYA', 23, '2021-10-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (313, '19йкилометр', '', '2022-09-23 05:48:34.08027+00', '2022-09-26 10:37:01.131446+00', 42, 'Канат', '+7 (707) 770-20-97', '', true, '5G3171000396', 16, '2018-10-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (324, 'Национальная 19', '', '2022-09-26 03:57:07.897484+00', '2022-09-26 10:37:44.099012+00', 42, 'Неиз', '+7 (707) 717-74-79', '', true, '6LK000318343', 16, '2022-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (327, 'Гульдала участок 566', '', '2022-09-26 05:19:52.797558+00', '2022-09-26 10:39:13.96938+00', 42, 'Гуля', '+7 (702) 488-91-01', '', true, '20400017GCKG4KYA', 21, '2021-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (323, 'Акбулак байконырова', '', '2022-09-26 03:53:31.293489+00', '2022-09-28 05:19:28.807457+00', 42, 'Неиз', '+7 (702) 154-66-44', '', true, '6KS0116953', 16, '2020-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (316, 'Ст. Чемолган нурлы  22а', '', '2022-09-23 06:18:07.659404+00', '2022-09-28 05:29:39.788732+00', 42, 'Неизв ', '+7 (747) 727-55-63', '', true, '6LT001211084', 16, '2020-10-08 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (314, 'Бельбулак новостройка', '', '2022-09-23 06:00:00.632304+00', '2022-09-28 05:33:07.613854+00', 42, 'Неизв ', '+7 (702) 121-22-12', '', true, '6LK000318338', 16, '2022-10-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (305, 'СТ Родники, 501', '', '2022-09-19 05:41:42.413581+00', '2022-10-03 07:18:31.211339+00', 32, 'Авдеева Карина', '+7 (708) 850-09-40', '', true, '2142L80541', 21, '2022-03-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (336, 'мкр. Нур Алатау, 12-я улица, 44', '', '2022-09-26 08:24:14.780187+00', '2022-09-26 08:24:14.780187+00', 32, 'Когай Елена Александровна', '+7 (701) 714-66-91', '', true, '20410056GCKGAKYA', 23, '2021-10-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (337, 'Майкопская 46', '', '2022-09-26 08:41:16.85767+00', '2022-09-26 08:45:08.285609+00', 42, 'Роман', '+7 (707) 236-27-69', '+7 (707) 162-73-64', true, '21400006GCKG6K2A', 21, '2022-01-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (315, 'Узынагаш кенесары хана 142', '', '2022-09-23 06:15:20.943506+00', '2022-09-26 09:39:31.651879+00', 42, 'Неизв ', '+7 (778) 099-77-86', '', true, '6LK000202006', 16, '2021-07-19 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (338, 'Айтей батыра17/1', '', '2022-09-26 14:09:08.984988+00', '2022-09-26 14:09:08.984988+00', 42, 'Неизв', '+7 (776) 777-77-54', '', true, '12112', 16, '2021-01-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (341, 'Ашибулак жетесу 45', '', '2022-09-27 02:18:55.792621+00', '2022-09-27 02:18:55.792621+00', 42, 'Неизве ', '+7 (707) 421-91-51', '', true, '12117', 40, '2021-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (343, 'Рауан 53', '', '2022-09-27 02:23:03.071083+00', '2022-09-27 02:23:03.071083+00', 42, 'Неизве ', '+7 (707) 997-88-99', '', true, '12119', 40, '2021-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (344, 'Узынагаш ', '', '2022-09-27 02:24:57.452249+00', '2022-09-27 02:24:57.452249+00', 42, 'Неизве ', '+7 (778) 108-34-51', '', true, '12120', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (345, 'Каскелен ', '', '2022-09-27 02:27:13.354477+00', '2022-09-27 02:27:13.354477+00', 42, 'Неизве ', '+7 (747) 470-08-95', '', true, '12121', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (346, 'Узынагаш карасай батыра 78', '', '2022-09-27 02:29:07.314285+00', '2022-09-27 02:29:07.314285+00', 42, 'Неизве ', '+7 (771) 448-38-48', '', true, '12122', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (347, 'Каскелен кайнарбулак', '', '2022-09-27 02:30:43.213507+00', '2022-09-27 02:30:43.213507+00', 42, 'Неизве ', '+7 (707) 505-20-06', '', true, '12123', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (348, 'Каскелен кайнарбулак 17', '', '2022-09-27 02:32:10.51147+00', '2022-09-27 02:32:10.51147+00', 42, 'Неизве ', '+7 (702) 971-62-22', '', true, '12124', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (349, 'Каскелен кот. Гор.', '', '2022-09-27 02:33:43.226197+00', '2022-09-27 02:33:43.226197+00', 42, 'Неизве ', '+7 (708) 926-92-87', '', true, '12125', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (375, 'Каскелен ', '', '2022-09-28 07:53:05.817906+00', '2022-09-28 07:53:05.817906+00', 42, 'Неиз', '+7 (702) 809-22-70', '', true, '12151', 27, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (354, 'Узынагаш мажитова 8 кв.5', '', '2022-09-27 03:42:47.793247+00', '2022-09-27 03:42:47.793247+00', 42, 'Неизве ', '+7 (777) 596-49-78', '', true, '12130', 16, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (357, 'Амангельды 83', '', '2022-09-28 04:27:44.077811+00', '2022-09-28 04:27:44.077811+00', 42, 'Неизв ', '+7 (707) 811-11-16', '', true, '12134', 16, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (358, 'Шалкар жобалы 14', '', '2022-09-28 04:29:46.106714+00', '2022-09-28 04:29:46.106714+00', 42, 'Неизв ', '+7 (707) 282-74-01', '', true, '12135', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (359, 'Туздыбастау саркиева 26', '', '2022-09-28 04:31:47.910158+00', '2022-09-28 04:31:47.910158+00', 42, 'Неизв ', '+7 (747) 154-03-52', '', true, '12136', 20, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (360, 'Ащибулак ул2 д 15', '', '2022-09-28 04:33:53.236364+00', '2022-09-28 04:33:53.236364+00', 42, 'Неизв ', '+7 (705) 138-10-04', '', true, '12137', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (321, 'с. Чемолган, ул. Сатжайлау, 41', '', '2022-09-24 07:20:27.560602+00', '2022-09-28 04:50:22.649858+00', 42, 'Шухан Синр', '+7 (747) 842-25-81', '', true, '2140023GCKG4K2A', 21, '2022-02-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (340, 'Мочалка 6', '', '2022-09-27 02:16:32.869437+00', '2022-09-28 05:20:07.52246+00', 42, 'Неизве ', '+7 (707) 276-25-25', '', true, '2021121217', 40, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (342, 'Комсомол', '', '2022-09-27 02:20:54.411667+00', '2022-09-28 05:22:27.747254+00', 42, 'Неизве ', '+7 (705) 626-67-95', '', true, '2021111210', 55, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (352, 'Боролдай Черёмушки 3 ', '', '2022-09-27 02:40:42.585472+00', '2022-09-28 05:23:10.159136+00', 42, 'Неизве ', '+7 (700) 500-61-21', '', true, '5G110-----------', 15, '2019-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (351, 'Каскелен дачи рахат', '', '2022-09-27 02:37:29.486286+00', '2022-09-28 05:24:35.041115+00', 42, 'Неизве ', '+7 (700) 809-20-40', '', true, '330167823212420002477', 32, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (353, 'Каскелен ', '', '2022-09-27 03:35:53.032001+00', '2022-09-28 05:26:17.470203+00', 42, 'Неизве ', '+7 (707) 173-54-25', '', true, '330167823212420002333', 32, '2019-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (362, 'Бельбулак, новостройка', '', '2022-09-28 05:34:42.17307+00', '2022-09-28 05:34:42.17307+00', 32, 'Неизв', '+7 (702) 121-22-12', '', true, '6LK000284680', 17, '2021-10-27 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (363, 'Туздыбастау монтаева', '', '2022-09-28 07:18:36.825723+00', '2022-09-28 07:18:36.825723+00', 42, 'Неизв ', '+7 (700) 300-18-30', '', true, '12139', 16, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (367, 'Карасай абая 1в', '', '2022-09-28 07:30:08.542047+00', '2022-09-28 07:30:08.542047+00', 42, 'Неизв ', '+7 (707) 555-07-78', '', true, '12143', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (368, 'Абай раимбека 180', '', '2022-09-28 07:31:49.653021+00', '2022-09-28 07:31:49.653021+00', 42, 'Неизв ', '+7 (708) 851-15-21', '', true, '12144', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (372, 'Исык тихи абланбаева ', '', '2022-09-28 07:45:53.175552+00', '2022-09-28 07:45:53.175552+00', 42, 'Неизв ', '+7 (747) 248-05-61', '', true, '12148', 16, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (374, 'Табаксовхоз', '', '2022-09-28 07:51:34.422264+00', '2022-09-28 07:51:34.422264+00', 42, 'Неиз', '+7 (707) 771-46-36', '', true, '12150', 27, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (376, 'Кыргаулды шаумяна 9', '', '2022-09-28 07:55:21.870898+00', '2022-09-28 07:55:21.870898+00', 42, 'Неиз', '+7 (747) 598-78-43', '', true, '12152', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (377, 'Бесагаш каурыбай батыра 9а', '', '2022-09-28 07:58:01.246307+00', '2022-09-28 07:58:01.246307+00', 42, 'Мустафа', '+7 (707) 518-59-58', '', true, '12153', 16, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (364, 'Ашибулак  жандосова 30', '', '2022-09-28 07:22:30.601191+00', '2022-09-28 10:11:53.896526+00', 42, 'Неизв ', '+7 (707) 483-11-75', '', true, '6LK000312138', 46, '2021-11-29 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (378, 'Каскелен новостройка', '', '2022-09-29 03:44:33.151958+00', '2022-09-29 03:44:33.151958+00', 42, 'Олжас', '+7 (707) 850-19-94', '', true, '12154', 27, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (379, 'Карасу', '', '2022-09-29 03:48:12.540284+00', '2022-09-29 03:48:12.540284+00', 42, 'Газиз', '+7 (747) 116-57-82', '', true, '12155', 16, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (381, 'Аксайское ущелье с.о. солнечное уч. 23', '', '2022-09-29 03:57:22.886118+00', '2022-09-29 03:57:22.886118+00', 42, 'Неизве ', '+7 (701) 748-06-49', '', true, '12157', 27, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (382, 'Узынагаш таулесыздык 61', '', '2022-09-29 04:01:24.553048+00', '2022-09-29 04:01:24.553048+00', 42, 'Неизве ', '+7 (771) 412-02-98', '', true, '12158', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (356, 'Жангильдина 99а', '', '2022-09-28 04:10:54.850669+00', '2022-09-30 05:26:17.783175+00', 42, 'Борис Николаевич ', '+7 (707) 223-36-60', '', true, '5G1171000208', 15, '2017-06-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (339, 'Кемиртоган ', '', '2022-09-26 14:12:45.736538+00', '2022-09-30 05:28:06.567799+00', 42, 'Неизв', '+7 (775) 202-80-00', '', true, '6KS0048372', 46, '2019-07-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (350, 'Осипенко', '', '2022-09-27 02:35:34.41429+00', '2022-09-30 05:30:15.443802+00', 42, 'Ольга ', '+7 (707) 907-40-46', '', true, '6LK000142612', 15, '2021-05-14 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (373, 'Бесагаш', '', '2022-09-28 07:48:33.690512+00', '2022-09-30 05:31:58.393585+00', 42, 'Лидия', '+7 (702) 705-67-65', '', true, '330167123212720000014', 28, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (370, 'Айгерим 2 бемберина 18 мечеть', '', '2022-09-28 07:37:37.745686+00', '2022-09-30 05:36:44.114478+00', 42, 'Алтай', '+7 (708) 321-52-61', '', true, '5G6191000086', 18, '2019-04-25 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (361, 'Каскелен гоголя125', '', '2022-09-28 04:35:29.315323+00', '2022-09-30 05:40:27.557313+00', 42, 'Неизв ', '+7 (707) 133-10-34', '', true, '6LK000334844', 18, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (371, 'Каскелен кв. 17 уч 1555', '', '2022-09-28 07:43:12.852786+00', '2022-09-30 05:46:40.47639+00', 42, 'Неизв ', '+7 (701) 721-38-02', '', true, '2021113009', 56, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (380, 'Шугла жамбыла 21кв. 2', '', '2022-09-29 03:52:25.546687+00', '2022-09-30 05:48:17.482358+00', 42, 'Неизве ', '+7 (778) 954-14-72', '', true, '2019105521', 55, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (366, 'Абай новостройка', '', '2022-09-28 07:27:37.959631+00', '2022-09-30 05:49:02.914478+00', 42, 'Неизв ', '+7 (747) 200-16-86', '', true, '6LK000334921', 17, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (365, 'Монтаева', '', '2022-09-28 07:24:34.301719+00', '2022-09-30 06:30:33.926401+00', 42, 'Неизв ', '+7 (702) 465-59-09', '', true, '6LK000173519', 17, '2021-06-22 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (385, 'Узынагаш  алгабас 85', '', '2022-09-29 04:06:15.354069+00', '2022-10-02 10:58:59.609303+00', 42, 'Неизве ', '+7 (777) 224-80-16', '', true, '20211111126', 56, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (369, 'Жалпоксай таусамалы 129', '', '2022-09-28 07:34:35.580037+00', '2022-10-02 11:03:48.016781+00', 42, 'Неизв ', '+7 (707) 147-47-35', '', true, '6Lk000175704', 16, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (384, 'Уштерек уч.239', '', '2022-09-29 04:03:54.710001+00', '2022-10-03 10:18:40.678173+00', 42, 'Неизве ', '+7 (777) 112-92-62', '', true, '6LK000201682', 46, '2021-07-19 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (383, 'ул. Шокая, 303', '', '2022-09-29 04:02:09.197461+00', '2022-09-29 04:09:17.759731+00', 32, 'Алексей', '+7 (707) 575-19-70', '', true, '2209291', 11, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (387, 'Жетысуйская, 70А', '', '2022-09-29 04:59:48.954246+00', '2022-09-29 04:59:48.954246+00', 32, 'Денис', '+7 (705) 333-33-25', '', true, '22222ц22', 11, '2000-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (390, 'Сабыр шарипова 117', '', '2022-09-29 14:44:50.293718+00', '2022-09-29 14:44:50.293718+00', 42, 'Неизвес', '+7 (701) 477-77-96', '', true, '1261', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (391, 'Иргили квартал 5', '', '2022-09-29 14:52:43.890506+00', '2022-09-29 14:52:43.890506+00', 42, 'Неизвес', '+7 (705) 410-10-10', '', true, '1262', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (393, 'Иргили темирлан', '', '2022-09-29 14:57:34.54056+00', '2022-09-29 14:57:34.54056+00', 42, 'Неизвес', '+7 (771) 113-18-27', '', true, '1264', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (394, 'Наурызбай ул. Алмалы 3/11', '', '2022-09-29 15:00:31.304607+00', '2022-09-29 15:00:31.304607+00', 42, 'Неизвес', '+7 (747) 371-88-15', '', true, '1265', 15, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (396, 'Кемиртоган егемдик', '', '2022-09-29 15:06:29.902175+00', '2022-09-29 15:06:29.902175+00', 42, 'Неизвес', '+7 (702) 135-22-02', '', true, '1267', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (398, 'Каскелен кайнарбулак 17', '', '2022-09-29 15:12:12.986237+00', '2022-09-29 15:12:12.986237+00', 42, 'Неизвес', '+7 (702) 971-62-22', '', true, '1269', 56, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (401, 'Байсерке д.м. энергетик', '', '2022-09-30 01:41:06.427961+00', '2022-09-30 01:41:06.427961+00', 42, 'Николай', '+7 (771) 123-48-03', '', true, '1272', 27, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (403, 'Туздыбастау', '', '2022-09-30 01:45:27.621328+00', '2022-09-30 01:45:27.621328+00', 42, 'Неизв', '+7 (701) 761-75-00', '', true, '1274', 27, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (404, 'Рабочий паселок душанбинская 17 кв.2', '', '2022-09-30 01:48:33.037227+00', '2022-09-30 01:48:33.037227+00', 42, 'Соня', '+7 (708) 321-14-36', '', true, '1275', 27, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (406, 'Кошмамбет', '', '2022-09-30 01:53:17.581944+00', '2022-09-30 01:53:17.581944+00', 42, 'Неизв', '+7 (747) 548-10-46', '', true, '1277', 27, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (407, 'ст. Чемолган толеби 51', '', '2022-09-30 03:33:40.80289+00', '2022-09-30 03:33:40.80289+00', 42, 'Неизв', '+7 (707) 266-62-72', '', true, '1278', 27, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (409, 'Киз ерлекпесова 22/1', '', '2022-09-30 03:40:56.815617+00', '2022-09-30 03:40:56.815617+00', 42, 'Неизв', '+7 (708) 476-17-87', '', true, '1280', 16, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (412, 'Уштерек', '', '2022-09-30 03:50:56.388626+00', '2022-09-30 03:50:56.388626+00', 42, 'Неизв', '+7 (708) 757-53-78', '', true, '1283', 16, '2021-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (413, 'Карасаз 60', '', '2022-09-30 03:52:47.512513+00', '2022-09-30 03:52:47.512513+00', 42, 'Неизв', '+7 (707) 329-16-24', '', true, '1284', 16, '2021-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (355, 'Узынагаш азербаева 149', '', '2022-09-27 09:51:51.157213+00', '2022-09-30 05:20:07.793374+00', 42, 'Неизве ', '+7 (707) 555-48-50', '', true, '6KS0045372', 46, '2019-07-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (414, 'мкр. Мадениет, ул. Молдагулова, 4', '', '2022-09-30 05:56:35.607946+00', '2022-09-30 05:56:35.607946+00', 42, 'Торемурат', '+7 (701) 468-40-40', '', true, '300922111', 15, '2021-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (415, 'Каскелен, Рахат дачи', '', '2022-09-30 06:01:06.520861+00', '2022-09-30 06:06:28.679015+00', 42, 'Неизвестный', '+7 (707) 500-51-22', '', true, '71000493', 18, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (399, 'Косым шариков 55', '', '2022-09-29 15:14:23.460171+00', '2022-09-30 06:32:49.002236+00', 42, 'Неизвес', '+7 (707) 714-31-32', '', true, '6LK000118414', 15, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (405, 'Ияф', '', '2022-09-30 01:51:01.281664+00', '2022-09-30 06:58:14.271418+00', 42, 'Неизв', '+7 (747) 104-49-59', '', true, '330084923200800000264', 57, '2021-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (416, 'Калкаман 2, Сагатова 26', '', '2022-09-30 07:03:42.401814+00', '2022-09-30 07:03:42.401814+00', 42, 'Евгений', '+7 (705) 670-17-30', '', true, '3009221221', 15, '1999-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (417, 'с. Ащибулак, ул. Каракат 11', '', '2022-09-30 07:10:55.944751+00', '2022-09-30 07:10:55.944751+00', 42, 'Расул', '+7 (705) 250-50-02', '', true, '300922333', 11, '2022-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (400, 'Талгар ломоносова 13/2', '', '2022-09-29 15:21:52.791463+00', '2022-09-30 08:28:47.443534+00', 42, 'Гулчира', '+7 (701) 473-11-95', '', true, '6LK000173802', 58, '2021-06-22 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (410, 'Кызыл кайрат розбакиева 21', '', '2022-09-30 03:42:59.320477+00', '2022-09-30 08:30:51.785728+00', 42, 'Неизв', '+7 (701) 373-07-15', '', true, '5G2171000090', 46, '2021-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (395, 'Коянкус бейбитшилик 95', '', '2022-09-29 15:03:17.148316+00', '2022-09-30 08:31:56.985195+00', 42, 'Неизвес', '+7 (771) 401-09-35', '', true, '6LK000270592', 19, '2021-10-19 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (418, 'ул. Карасай батыра, 302', '', '2022-09-30 08:33:36.945453+00', '2022-09-30 08:33:36.945453+00', 32, 'Кайыржан', '+7 (701) 316-73-24', '', true, '502141000751', 12, '2014-11-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (397, 'Каскелен шынбулак 43', '', '2022-09-29 15:09:20.230648+00', '2022-09-30 10:50:48.994302+00', 42, 'Неизвес', '+7 (708) 252-95-20', '', true, '6LK600271835', 59, '2021-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (389, 'Туздыбастау жагдосова 57', '', '2022-09-29 14:41:36.162269+00', '2022-09-30 10:53:03.725494+00', 42, 'Неизвес', '+7 (701) 462-56-97', '', true, '5G619100082', 18, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (420, 'Верх. Каменка мереке 42', '', '2022-10-01 03:36:55.091974+00', '2022-10-01 03:36:55.091974+00', 42, 'Андрей', '+7 (747) 538-42-70', '', true, '1293', 11, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (421, 'Балхашская 3', '', '2022-10-01 03:41:25.078179+00', '2022-10-01 03:41:25.078179+00', 42, 'Неизв', '+7 (777) 307-13-38', '', true, '1294', 16, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (422, 'НурАлатау темербек козакеев 50', '', '2022-10-01 03:51:14.730928+00', '2022-10-01 03:51:14.730928+00', 42, 'Ерик', '+7 (701) 227-88-33', '', true, '1295', 27, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (411, 'Абай кв. 1уч. 79/2', '', '2022-09-30 03:45:46.693132+00', '2022-10-01 03:57:00.490628+00', 42, 'Неизв', '+7 (778) 647-98-77', '', true, '6Lk000204705', 16, '2021-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (402, 'Байсерке д.м. энергетик', '', '2022-09-30 01:43:44.972268+00', '2022-10-01 05:50:57.941504+00', 42, 'Неизв', '+7 (701) 794-71-20', '', true, '330168223213270002910', 36, '2022-08-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (419, 'Байсерке солнечная 2', '', '2022-10-01 03:31:35.183551+00', '2022-10-01 09:07:11.805646+00', 42, 'Неизв', '+7 (707) 365-30-65', '', true, '6LK000334983', 54, '2021-12-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (423, ' Бемберина 98/1', '', '2022-10-02 04:03:25.930679+00', '2022-10-02 04:03:25.930679+00', 42, 'Неизв ', '+7 (701) 711-99-07', '', true, '1296', 16, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (424, ' Сейфулина белинского', '', '2022-10-02 04:05:26.762576+00', '2022-10-02 04:05:26.762576+00', 42, 'Неизв ', '+7 (701) 158-88-87', '', true, '1297', 11, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (425, 'Жалпоксай таусамалы129', '', '2022-10-02 06:16:05.220516+00', '2022-10-02 06:16:05.220516+00', 42, 'Неизв ', '+7 (707) 147-47-34', '+7 (707) 147-47-35', true, '1298', 16, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (426, 'Беспакова 23', '', '2022-10-02 06:18:44.05326+00', '2022-10-02 06:18:44.05326+00', 42, 'Неизв ', '+7 (771) 708-51-63', '', true, '1299', 55, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (427, 'Комсомол', '', '2022-10-02 06:20:56.548535+00', '2022-10-02 06:20:56.548535+00', 42, 'Неизв ', '+7 (705) 552-40-87', '', true, '1300', 55, '2019-09-30 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (392, 'Иргили квартал 5', '', '2022-09-29 14:54:57.71464+00', '2022-10-02 11:00:46.561826+00', 42, 'Неизвес', '+7 (707) 239-64-87', '', true, ' 6Lk000312131', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (386, 'Каскелен кокбастау 71', '', '2022-09-29 04:09:56.212405+00', '2022-10-02 11:02:08.39663+00', 42, 'Неизве ', '+7 (707) 554-53-04', '', true, '2021111290', 56, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (431, 'Каскелен', '', '2022-10-03 04:43:39.250655+00', '2022-10-03 04:43:39.250655+00', 42, 'Неивес', '+7 (707) 358-94-07', '', true, '1304', 17, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (433, 'Таугуль 3', '', '2022-10-03 05:04:02.320774+00', '2022-10-03 05:04:02.320774+00', 42, 'Неизв', '+7 (778) 572-92-07', '', true, '1306', 13, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (434, 'Улжан такежанова 59/1', '', '2022-10-03 05:14:55.419323+00', '2022-10-03 05:14:55.419323+00', 42, 'Талгат', '+7 (747) 316-89-09', '', true, '1307', 16, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (435, 'Ачинская 5', '', '2022-10-03 05:20:45.119924+00', '2022-10-03 05:20:45.119924+00', 42, 'Неив', '+7 (701) 242-60-24', '', true, '1308', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (430, 'Фабричный', '', '2022-10-03 04:41:23.564847+00', '2022-10-03 10:40:02.60174+00', 42, 'Неивес', '+7 (747) 758-24-99', '', true, '330168223221810000285', 36, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (388, 'Кыргаулды саттикова 6', '', '2022-09-29 14:32:14.145083+00', '2022-10-03 10:41:16.1512+00', 42, 'Неизвес', '+7 (775) 515-57-90', '', true, '330167823212370000340', 32, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (432, 'Село шемолган', '', '2022-10-03 04:59:48.147738+00', '2022-10-04 07:25:00.387794+00', 42, 'Алпамыс', '+7 (707) 894-33-36', '', true, '6LK000202099', 54, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (429, 'Башкирская 2', '', '2022-10-03 04:31:54.716345+00', '2022-10-04 07:27:32.316881+00', 42, 'Женя', '+7 (770) 572-78-88', '', true, '6LK000201693', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (436, 'Ачинская 5', '', '2022-10-03 05:21:35.067226+00', '2022-10-03 05:21:35.067226+00', 42, 'Неив', '+7 (701) 242-60-24', '', true, '1309', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (437, 'Авиатора214 /1', '', '2022-10-03 05:23:49.08737+00', '2022-10-03 05:23:49.08737+00', 42, 'Неив', '+7 (747) 400-75-93', '', true, '1310', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (438, 'Шалкар ул 4 кв 67', '', '2022-10-03 05:26:22.946117+00', '2022-10-03 05:26:22.946117+00', 42, 'Неив', '+7 (747) 309-23-62', '', true, '1311', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (439, 'Прижевальского 42/2', '', '2022-10-03 05:34:44.536619+00', '2022-10-03 05:34:44.536619+00', 42, 'Неив', '+7 (707) 505-69-47', '', true, '1312', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (440, 'Бериктас 87', '', '2022-10-03 05:40:51.338186+00', '2022-10-03 05:40:51.338186+00', 42, 'Неив', '+7 (747) 525-08-58', '+7 (701) 456-44-66', true, '1313', 13, '2019-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (441, 'Каменка сад.общ.наука 2 д. 124', '', '2022-10-03 05:48:18.565259+00', '2022-10-03 05:48:18.565259+00', 42, 'Неизв', '+7 (775) 706-64-64', '', true, '1314', 28, '2019-07-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (442, 'Джамиденова 3/1 аскарова', '', '2022-10-03 05:50:30.068927+00', '2022-10-03 05:50:30.068927+00', 42, 'Неизв', '+7 (702) 339-12-46', '', true, '1315', 28, '2022-07-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (408, 'пос. Абай, новостройки', '', '2022-09-30 03:36:33.502493+00', '2022-10-03 07:29:12.043679+00', 42, 'Неизв', '+7 (705) 222-25-11', '', true, '22080012GCKG4K2A', 21, '2022-08-23 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (428, 'Туркебаева 153', '', '2022-10-03 04:30:11.682341+00', '2022-10-03 10:40:38.420076+00', 42, 'Неизв', '+7 (701) 728-07-81', '', true, '330167223212640001797', 29, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (443, 'ул. Хмельницкого, 40', '', '2022-10-03 10:50:58.51441+00', '2022-10-03 10:51:04.819367+00', 32, 'Кошали', '+7 (701) 758-98-30', '', true, '221003-115', 60, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (444, 'Туздыбастау Ахмет Саркеева 26', '', '2022-10-03 14:12:59.505681+00', '2022-10-03 14:12:59.505681+00', 42, 'Светлана югай', '+7 (747) 154-03-52', '', true, '21110040GCkGAKYA', 23, '2021-11-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (445, 'с. Айганым, ул. Алмерек баба, 524', '', '2022-10-04 06:15:42.322052+00', '2022-10-04 06:15:42.322052+00', 32, 'Неизв', '+7 (707) 171-03-80', '', true, '221004-1', 15, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (448, 'мкр. Таусамалы, ул. Канат, 62', '', '2022-10-04 06:21:39.688879+00', '2022-10-04 06:21:39.688879+00', 32, 'Неизв', '+7 (701) 399-11-71', '', true, '221004-4', 15, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (449, 'СО Здоровье, новостройка', '', '2022-10-04 06:23:43.919711+00', '2022-10-04 06:23:43.919711+00', 32, 'Неизв', '+7 (707) 320-70-02', '', true, '221004-5', 15, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (451, 'ул. Саулет, 63', '', '2022-10-04 06:31:23.128538+00', '2022-10-04 06:31:23.128538+00', 32, 'Неизв', '+7 (708) 915-33-28', '', true, '221004-7', 40, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (453, 'пос. Айтей, ул. Байконыр, 26', '', '2022-10-04 06:38:27.023223+00', '2022-10-04 06:38:27.023223+00', 32, 'Неизв', '+7 (708) 469-52-76', '', true, '221004-9', 15, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (454, 'Бурундай, мкр. Водник 3, д. 105А', '', '2022-10-04 06:40:55.190254+00', '2022-10-04 06:40:55.190254+00', 32, 'Неизв', '+7 (701) 744-52-85', '', true, '221004-10', 11, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (455, 'мкр. Шанырак 2, ул. Искакова, 81', '', '2022-10-04 06:44:10.38019+00', '2022-10-04 06:44:10.38019+00', 32, 'Неизв', '+7 (707) 393-58-44', '', true, '221004-11', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (456, 'мкр. Томирис', '', '2022-10-04 06:46:13.569187+00', '2022-10-04 06:46:13.569187+00', 32, 'Неизв', '+7 (747) 429-79-39', '', true, '221004-12', 60, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (459, 'ул. Кырмызы, 6', '', '2022-10-04 06:50:54.132474+00', '2022-10-04 06:50:54.132474+00', 32, 'Неизв', '+7 (778) 426-14-24', '', true, '221004-15', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (461, 'Ремизовка, ул. Горный садовод, 180', '', '2022-10-04 06:53:22.393262+00', '2022-10-04 06:53:22.393262+00', 32, 'Неизв', '+7 (702) 284-32-03', '', true, '221004-17', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (462, 'пос. Булакты, ул. Жетысу, 33', '', '2022-10-04 06:54:22.980979+00', '2022-10-04 06:54:22.980979+00', 32, 'Неизв', '+7 (707) 952-53-35', '', true, '221004-18', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (463, 'ул. Дала, 2', '', '2022-10-04 06:55:49.238236+00', '2022-10-04 06:55:49.238236+00', 32, 'Неизв', '+7 (707) 775-56-48', '', true, '221004-19', 40, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (464, 'мкр. Шанырак 1, ул. Утемисова, 65б', '', '2022-10-04 06:57:55.587863+00', '2022-10-04 06:57:55.587863+00', 32, 'Неизв', '+7 (747) 392-44-50', '', true, '221004-20', 20, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (465, 'Ашыбулак батыр', '', '2022-10-04 06:58:58.111945+00', '2022-10-04 06:58:58.111945+00', 32, 'Неизв', '+7 (777) 326-47-47', '', true, '221004-21', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (466, 'Междуреченск', '', '2022-10-04 07:00:20.314891+00', '2022-10-04 07:00:20.314891+00', 32, 'Неизв', '+7 (700) 783-15-07', '+7 (777) 200-43-49', true, '221004-22', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (467, 'Узынагач, Унгиртай', '', '2022-10-04 07:01:24.542592+00', '2022-10-04 07:01:24.542592+00', 32, 'Неизв', '+7 (775) 699-91-80', '', true, '221004-23', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (468, 'с. Чемолган, ул. Жайык, 31', '', '2022-10-04 07:02:28.419593+00', '2022-10-04 07:02:28.419593+00', 32, 'Неизв', '+7 (707) 765-22-05', '', true, '221004-24', 40, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (469, 'Каскелен, ул. Карлыгаш', '', '2022-10-04 07:03:16.388697+00', '2022-10-04 07:03:16.388697+00', 32, 'Неизв', '+7 (707) 358-94-07', '', true, '221004-25', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (470, 'пос. Уштерек, ул. Аккайын, 222', '', '2022-10-04 07:03:59.077174+00', '2022-10-04 07:03:59.077174+00', 32, 'Неизв', '+7 (701) 434-89-51', '', true, '221004-26', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (471, 'ст. Чемолган, ул. Карасу, 12', '', '2022-10-04 07:07:45.863445+00', '2022-10-04 07:07:45.863445+00', 32, 'Неизв', '+7 (775) 926-29-70', '', true, '221004-27', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (472, 'ст. Чемолган, пос. Колашы, ул. Коктем, 30', '', '2022-10-04 07:08:36.639776+00', '2022-10-04 07:08:36.639776+00', 32, 'Неизв', '+7 (708) 404-66-93', '', true, '221004-28', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (447, 'Бесагаш, ул. Гагарина, 28', '', '2022-10-04 06:18:00.832078+00', '2022-10-04 07:58:21.876421+00', 32, 'Неизв', '+7 (708) 480-01-94', '', true, '6LK000312169', 46, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (446, 'Талгар', '', '2022-10-04 06:16:56.507617+00', '2022-10-04 07:13:07.006335+00', 32, 'Неизв', '+7 (747) 148-05-44', '', true, '6LK000334820', 18, '2021-12-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (475, 'Село Шемолган', '', '2022-10-04 07:26:43.24321+00', '2022-10-04 07:26:43.24321+00', 32, 'Алпамыс', '+7 (707) 894-33-36', '', true, '6LK000284651', 18, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (477, 'Акжар, ул. Коккайнар, 16', '', '2022-10-04 08:17:36.777437+00', '2022-10-04 08:17:36.777437+00', 32, 'Неизв', '+7 (705) 175-03-33', '', true, '221004-33', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (478, 'с. Узынагаш, ул. Наурызбай батыра, 230', '', '2022-10-04 08:18:33.48629+00', '2022-10-04 08:18:33.48629+00', 32, 'Неизв', '+7 (700) 525-29-89', '', true, '221004-34', 15, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (458, 'ул. Бердигулова, 124', '', '2022-10-04 06:49:41.645994+00', '2022-10-04 13:02:22.784697+00', 32, 'Неизв', '+7 (707) 778-89-94', '', true, '5G1181000320', 15, '2018-10-02 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (450, 'ул. Кашаубаева, 17', '', '2022-10-04 06:25:19.90932+00', '2022-10-04 13:03:07.220465+00', 32, 'Неизв', '+7 (707) 117-55-96', '', true, '2021104055', 40, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (452, 'Узынагаш', '', '2022-10-04 06:37:08.061448+00', '2022-10-04 13:04:56.538062+00', 32, 'Неизв', '+7 (747) 317-90-10', '', true, '58013002219', 11, '2015-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (457, 'ул. Лисаковского, 253', '', '2022-10-04 06:47:44.804805+00', '2022-10-04 13:07:22.174515+00', 32, 'Неизв', '+7 (777) 166-80-36', '', true, '5BK131001218', 62, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (473, 'с. Узынагаш, ул. Бабажанова, 17', '', '2022-10-04 07:09:20.045728+00', '2022-10-04 13:09:41.290599+00', 32, 'Неизв', '+7 (702) 957-34-85', '', true, '6LK00312143', 46, '2021-11-29 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (460, 'Покровка, мкр Рахат, ул. Садовая, 30', '', '2022-10-04 06:52:26.406865+00', '2022-10-04 13:10:57.708565+00', 32, 'Неизв', '+7 (747) 376-47-21', '', true, '6LK000299153', 15, '2021-11-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (479, 'Айтей, ул. Байконур, 31', '', '2022-10-04 08:19:21.030076+00', '2022-10-05 08:48:02.827923+00', 32, 'Неизв', '+7 (778) 164-63-63', '', true, '2019121888', 40, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (476, 'Каскелен, новостройка коттеджный городок', '', '2022-10-04 08:16:31.443201+00', '2022-10-05 08:50:03.398659+00', 32, 'Алпамыс', '+7 (705) 187-73-83', '', true, '2022011906', 63, '2011-06-13 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (474, 'ст. Чемолган, ул. Дусикова, 39', '', '2022-10-04 07:11:32.378058+00', '2022-10-06 03:27:41.429583+00', 32, 'Неизв', '+7 (707) 674-25-55', '', true, '6KS0116899', 54, '2019-10-16 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (482, 'Кыргаулды', '', '2022-10-06 04:31:53.351748+00', '2022-10-06 06:31:50.843324+00', 42, 'Неизв', '+7 (702) 747-61-81', '', true, '1331', 66, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (481, 'Абай', '', '2022-10-06 04:27:22.372656+00', '2022-10-07 09:28:53.225461+00', 42, 'Неизв', '+7 (778) 396-46-61', '', true, '3301680023220840000342', 31, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (483, 'Нижняя пятилетка', '', '2022-10-06 04:39:40.560441+00', '2022-10-06 04:39:40.560441+00', 42, 'Неизв', '+7 (787) 014-55-75', '', true, '1332', 27, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (484, 'Алгабас', '', '2022-10-06 04:42:17.144498+00', '2022-10-06 04:42:17.144498+00', 42, 'Неизв', '+7 (778) 945-33-69', '', true, '1333', 27, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (485, 'Ташкенская розбакиева', '', '2022-10-06 04:46:24.800694+00', '2022-10-06 04:46:24.800694+00', 42, 'Неизв', '+7 (701) 924-25-05', '', true, '1334', 27, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (486, 'Коктюбе 2', '', '2022-10-06 04:48:53.812552+00', '2022-10-06 04:48:53.812552+00', 42, 'Неизв', '+7 (747) 509-94-45', '+7 (778) 110-41-20', true, '1335', 27, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (487, 'Уштерек аккаин 222', '', '2022-10-06 04:56:06.137635+00', '2022-10-06 04:56:06.137635+00', 42, 'Неизв', '+7 (770) 143-48-95', '+7 (778) 110-41-20', true, '1336', 16, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (488, 'Коксай 194', '', '2022-10-06 05:01:31.660189+00', '2022-10-06 05:01:31.660189+00', 42, 'Неизв', '+7 (775) 455-14-22', '', true, '1337', 16, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (489, 'Каскелен', '', '2022-10-06 05:02:59.507523+00', '2022-10-06 05:02:59.507523+00', 42, 'Неизв', '+7 (778) 140-43-20', '', true, '1338', 55, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (490, 'Иргили', '', '2022-10-06 05:07:26.496987+00', '2022-10-06 05:07:26.496987+00', 42, 'Неизв', '+7 (707) 747-61-81', '', true, '1339', 55, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (491, 'Касымбек', '', '2022-10-06 05:14:46.23197+00', '2022-10-06 05:14:46.23197+00', 42, 'Неизв', '+7 (707) 224-56-24', '', true, '1340', 55, '2022-06-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (493, 'Айтей байконыр 26', '', '2022-10-06 05:20:24.520254+00', '2022-10-06 05:20:24.520254+00', 42, 'Неивес', '+7 (708) 469-52-76', '', true, '1342', 16, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (494, 'Акан серы', '', '2022-10-06 05:21:46.650444+00', '2022-10-06 05:21:46.650444+00', 32, 'Марат', '+7 (747) 852-11-03', '', true, 'STS2210061', 65, '1990-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (495, 'Уштерек арай кабанбай 18', '', '2022-10-06 05:24:31.154792+00', '2022-10-06 05:24:31.154792+00', 42, 'Неивес', '+7 (777) 363-78-06', '', true, '1343', 16, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (480, 'Суюнбая, 185б', '', '2022-10-04 10:21:10.43895+00', '2022-10-06 05:28:06.162784+00', 32, 'Ким Антон. ТОО Arco Invest', '+7 (705) 554-44-45', '', true, 'RST07220261', 61, '2022-10-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (496, 'Суюнбая, 185б', '', '2022-10-06 05:29:44.3797+00', '2022-10-06 05:29:44.3797+00', 32, 'Ким Антон. ТОО Arco Invest', '+7 (705) 554-44-45', '', true, 'RSTS07220262', 61, '2022-10-05 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (497, 'Ащибулак', '', '2022-10-06 05:30:32.059207+00', '2022-10-06 05:30:32.059207+00', 42, 'Динара', '+7 (747) 427-66-51', '', true, '1344', 27, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (498, 'Жанадаур малькеева 16 б', '', '2022-10-06 05:37:44.083811+00', '2022-10-06 05:37:44.083811+00', 42, 'Неизв', '+7 (775) 654-28-40', '', true, '1345', 56, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (499, 'Мадниет дукенбай 29', '', '2022-10-06 05:42:53.480531+00', '2022-10-06 05:42:53.480531+00', 42, 'Неизв', '+7 (747) 976-72-23', '', true, '1346', 56, '2021-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (501, 'Астровского 6', '', '2022-10-06 14:00:32.962689+00', '2022-10-06 14:00:32.962689+00', 42, 'Неизв', '+7 (747) 505-05-63', '', true, '1349', 55, '2019-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (502, 'Меркулова 7 кв.3', '', '2022-10-06 14:03:23.875657+00', '2022-10-06 14:03:23.875657+00', 42, 'Неизв', '+7 (705) 234-14-08', '', true, '1350', 55, '2022-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (504, 'Жасканат баймагамбетова 51а', '', '2022-10-07 03:45:18.905669+00', '2022-10-07 03:45:18.905669+00', 42, 'Неизв', '+7 (747) 989-91-56', '', true, '1360', 17, '2017-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (505, 'ГРЭС карасу достык 68', '', '2022-10-07 03:48:51.729477+00', '2022-10-07 03:48:51.729477+00', 42, 'Неизв', '+7 (775) 919-74-34', '', true, '1361', 17, '2022-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (506, 'ГРЭС карасу достык 68', '', '2022-10-07 03:50:36.249378+00', '2022-10-07 03:50:36.249378+00', 42, 'Неизв', '+7 (708) 671-81-20', '', true, '1362', 17, '2022-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (507, 'Кыргаулды арасан 47', '', '2022-10-07 03:59:18.703272+00', '2022-10-07 03:59:18.703272+00', 42, 'Неизв', '+7 (747) 731-85-31', '', true, '1363', 17, '2022-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (511, 'Бесагаш кудайбергенова12', '', '2022-10-07 04:26:32.159554+00', '2022-10-07 04:26:32.159554+00', 42, 'Неизв', '+7 (707) 796-53-76', '', true, '1367', 16, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (512, 'Туздыбастау бок на 27', '', '2022-10-07 04:29:10.5384+00', '2022-10-07 04:29:10.5384+00', 42, 'Неизв', '+7 (747) 833-91-01', '', true, '1368', 16, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (513, 'Жулдыз сарымулдаева 3', '', '2022-10-07 04:32:14.463862+00', '2022-10-07 04:32:14.463862+00', 42, 'Неизв', '+7 (701) 218-02-72', '', true, '1369', 16, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (515, 'Карасу', '', '2022-10-07 04:43:06.596862+00', '2022-10-07 04:43:06.596862+00', 42, 'Янкун', '+7 (700) 255-50-65', '', true, '1371', 16, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (516, 'Достык акжаукент 54', '', '2022-10-07 04:49:58.159085+00', '2022-10-07 04:49:58.159085+00', 42, 'Неизв', '+7 (707) 356-72-09', '', true, '1372', 56, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (517, 'Брод кого 28 кв.2', '', '2022-10-07 05:05:29.40616+00', '2022-10-07 05:05:29.40616+00', 42, 'Неизв', '+7 (701) 764-61-00', '', true, '1373', 16, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (520, '20 линия, 62/1', '', '2022-10-07 05:16:40.425374+00', '2022-10-07 05:16:40.425374+00', 32, 'Муслимова', '+7 (777) 741-91-99', '', true, '221007-2', 21, '2021-10-15 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (522, 'Ингуртас курлышы 20', '', '2022-10-07 05:39:33.975888+00', '2022-10-07 05:39:33.975888+00', 42, 'Неизв', '+7 (771) 452-27-73', '', true, '1377', 16, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (523, 'Кокса жасулан 45', '', '2022-10-07 05:44:30.30803+00', '2022-10-07 05:44:30.30803+00', 42, 'Неизв', '+7 (771) 409-98-63', '', true, '1378', 13, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (500, 'Касымбек коктобе 30', '', '2022-10-06 05:56:03.915953+00', '2022-10-07 09:30:09.20655+00', 42, 'Неизв', '+7 (705) 157-36-40', '', true, '6KS0116861', 17, '2019-10-16 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (492, 'Фабричный самал 14', '', '2022-10-06 05:18:04.020617+00', '2022-10-07 09:30:51.553167+00', 42, 'Неивес', '+7 (701) 904-97-34', '', true, '2021112091', 63, '2022-07-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (519, 'Гульдала', '', '2022-10-07 05:11:58.295208+00', '2022-10-07 09:34:16.317953+00', 42, 'Неизв', '+7 (705) 499-70-73', '', true, '5G6171000429', 18, '2017-11-02 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (518, 'Каскелен', '', '2022-10-07 05:07:26.870598+00', '2022-10-07 09:34:54.792978+00', 42, 'Неизв', '+7 (778) 140-43-20', '', true, '2020092582', 56, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (510, 'Туздыбастау берлинского 19', '', '2022-10-07 04:23:27.666553+00', '2022-10-07 09:35:58.336441+00', 42, 'Неизв', '+7 (701) 477-77-11', '', true, '6LK000271654', 17, '2021-10-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (514, 'Пестсковского 54', '', '2022-10-07 04:36:22.873832+00', '2022-10-07 10:08:28.386539+00', 42, 'Неизв', '+7 (778) 424-33-33', '', true, '6LK000206249', 19, '2021-07-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (528, 'Тастыбулак сад.тв. алмазы 2/9', '', '2022-10-07 14:59:33.232273+00', '2022-10-07 14:59:33.232273+00', 42, 'Неизв', '+7 (707) 487-07-00', '', true, '1382', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (529, 'Лазо 8', '', '2022-10-07 15:01:53.071169+00', '2022-10-07 15:01:53.071169+00', 42, 'Неизв', '+7 (707) 105-23-11', '', true, '1383', 13, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (530, 'Даулеткирея 78', '', '2022-10-07 15:03:38.42251+00', '2022-10-07 15:03:38.42251+00', 42, 'Айбек', '+7 (700) 992-25-27', '', true, '1384', 17, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (533, 'Киз хабибулина 12 кв.20', '', '2022-10-08 02:27:15.689792+00', '2022-10-08 02:27:15.689792+00', 42, 'Неизв', '+7 (707) 140-44-66', '', true, '1387', 13, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (534, 'Ельтай', '', '2022-10-08 03:33:50.167393+00', '2022-10-08 03:33:50.167393+00', 42, 'Неизв', '+7 (708) 827-05-70', '', true, '1388', 30, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (531, 'Туздыбастау ', '', '2022-10-07 15:06:48.435633+00', '2022-10-10 07:08:54.087385+00', 42, 'Неизв', '+7 (747) 119-70-68', '', true, '6KS0029649', 17, '2019-06-29 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (532, 'Коксай ', '', '2022-10-08 02:25:33.014429+00', '2022-10-10 07:09:29.810421+00', 42, 'Неизв', '+7 (771) 409-98-63', '', true, '6LK000238340', 13, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (535, 'Гульдала новостройки ', '', '2022-10-08 03:38:39.635215+00', '2022-10-10 07:11:26.236132+00', 42, 'Неизв', '+7 (747) 506-59-18', '', true, '330168223213490000130', 36, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (526, 'Гульдала новостройка', '', '2022-10-07 14:53:27.976879+00', '2022-10-10 07:12:27.361672+00', 42, 'Асхат', '+7 (777) 272-72-42', '', true, '330167823212420002341', 32, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (525, 'Радищева 50а', '', '2022-10-07 14:50:45.122004+00', '2022-10-10 07:13:07.794113+00', 42, 'Неизвес', '+7 (707) 203-39-26', '', true, '330168223220280000151', 36, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (527, 'Гульдала новостройка', '', '2022-10-07 14:55:11.131948+00', '2022-10-10 07:13:46.275501+00', 42, 'Шугла', '+7 (702) 548-95-27', '', true, '330167623220210001169', 30, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (508, 'Кыргаулды акций 74', '', '2022-10-07 04:03:56.195637+00', '2022-10-10 07:14:22.037291+00', 42, 'Неизв', '+7 (702) 888-87-89', '', true, '6LK000206179', 19, '2021-07-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (521, 'Чемодан абиш1/1', '', '2022-10-07 05:24:22.854427+00', '2022-10-10 07:16:42.172905+00', 42, 'Неизв', '+7 (702) 480-09-03', '', true, '2022011763', 67, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (537, 'Салат ашимбаева36', '', '2022-10-08 03:45:41.739713+00', '2022-10-08 03:45:41.739713+00', 42, 'Неизв', '+7 (701) 822-50-70', '', true, '1391', 15, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (538, 'Гульдала', '', '2022-10-08 03:54:37.096132+00', '2022-10-08 03:54:37.096132+00', 42, 'Неизв', '+7 (747) 565-47-73', '', true, ' 6Lk000142548', 13, '2022-01-31 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (539, 'Алмалы 99/1', '', '2022-10-08 04:18:21.632313+00', '2022-10-08 04:18:21.632313+00', 42, 'Зикош', '+7 (707) 487-07-00', '', true, ' 1382', 16, '2022-01-31 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (540, 'Карой', '', '2022-10-08 04:54:22.371539+00', '2022-10-08 04:54:22.371539+00', 42, 'Неизв', '+7 (747) 649-83-95', '', true, '1392', 30, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (541, 'Алтайская трасса', '', '2022-10-10 04:08:01.472023+00', '2022-10-10 04:08:01.472023+00', 42, 'Неизв', '+7 (701) 345-16-82', '', true, '139', 30, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (542, 'Жанадаур тастарханова 41', '', '2022-10-10 04:10:19.906435+00', '2022-10-10 04:10:19.906435+00', 42, 'Неизв', '+7 (702) 561-01-62', '', true, '1394', 17, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (544, 'Жетыген садовая 1г', '', '2022-10-10 04:17:47.271417+00', '2022-10-10 04:17:47.271417+00', 42, 'Неизв', '+7 (777) 270-23-78', '', true, '1396', 28, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (546, 'Туздыбастау самая 2 217', '', '2022-10-10 04:24:36.945236+00', '2022-10-10 04:24:36.945236+00', 42, 'Неизв', '+7 (701) 789-99-09', '', true, '1398', 12, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (550, '19й км. Желтоксан 77', '', '2022-10-10 05:04:47.621131+00', '2022-10-10 05:04:47.621131+00', 42, 'Неизв', '+7 (708) 230-32-15', '', true, '1402', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (551, 'Алабама Аксёнов 20', '', '2022-10-10 05:06:50.113272+00', '2022-10-10 05:06:50.113272+00', 42, 'Неизв', '+7 (701) 344-55-54', '', true, '1403', 16, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (552, 'Байсерке Аркадия 250', '', '2022-10-10 06:10:35.371138+00', '2022-10-10 06:10:35.371138+00', 42, 'Неизв', '+7 (747) 978-54-69', '', true, '1404', 28, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (524, 'Акта дачи пенсионер', '', '2022-10-07 14:47:09.141197+00', '2022-10-10 07:07:03.808333+00', 42, 'Неизв', '+7 (705) 742-76-37', '', true, '330168223213570000590', 36, '2020-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (543, 'Суюнбая571/1', '', '2022-10-10 04:11:51.216616+00', '2022-10-10 07:07:41.025791+00', 42, 'Неизв', '+7 (776) 832-74-04', '', true, '5BK141000284', 62, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (536, 'Каскелен жаналык 4', '', '2022-10-08 03:42:14.51157+00', '2022-10-10 07:08:14.891542+00', 42, 'Неизв', '+7 (708) 887-74-14', '', true, '2022001309', 55, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (509, 'Бесагаш', '', '2022-10-07 04:19:05.013756+00', '2022-10-10 07:10:39.960019+00', 42, 'Неизв', '+7 (775) 888-88-17', '', true, '6LT001211077', 16, '2020-10-08 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (503, 'п. Кендала, ул. Амангельды, 62 (район Талгара, Раздольный, остановка "Баня")', '', '2022-10-07 02:50:19.763884+00', '2022-10-10 08:34:40.57306+00', 32, 'Ващеникин Антон', '+7 (776) 204-09-74', '', true, '21400027GCKG6K2A', 21, '2022-01-01 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (554, 'Шимякина 128', '', '2022-10-10 15:10:40.501651+00', '2022-10-10 15:10:40.501651+00', 42, 'Неизв', '+7 (707) 400-01-32', '', true, '1408', 28, '2021-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (555, 'Конкурс именовать 92', '', '2022-10-10 15:13:42.828989+00', '2022-10-10 15:13:42.828989+00', 42, 'Неизв ', '+7 (777) 677-05-26', '', true, '1409', 30, '2021-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (556, 'Ст. Чемолган ', '', '2022-10-10 15:17:05.044579+00', '2022-10-10 15:17:05.044579+00', 42, 'Неизв ', '+7 (701) 674-89-00', '+7 (701) 159-00-77', true, '1410', 30, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (557, 'Капчегай', '', '2022-10-10 15:19:22.6065+00', '2022-10-10 15:19:22.6065+00', 42, 'Неизв ', '+7 (701) 713-68-34', '+7 (701) 159-00-77', true, '1411', 30, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (558, 'Колаши макатаева 31а', '', '2022-10-10 15:22:18.222347+00', '2022-10-10 15:22:18.222347+00', 42, 'Неизв ', '+7 (702) 333-76-54', '+7 (701) 159-00-77', true, '1412', 56, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (560, 'Алгабас акселератор 20', '', '2022-10-10 15:25:56.672262+00', '2022-10-10 15:25:56.672262+00', 42, 'Неизв ', '+7 (770) 134-45-55', '', true, '1414', 16, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (562, 'Каскелен кот гор омирзак 86/49кв.4', '', '2022-10-10 15:31:20.478343+00', '2022-10-10 15:31:20.478343+00', 42, 'Неизв ', '+7 (775) 846-32-53', '', true, '1416', 56, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (563, 'Енбекши новостройка ', '', '2022-10-10 15:33:27.705803+00', '2022-10-10 15:33:27.705803+00', 42, 'Неизв ', '+7 (702) 404-21-42', '', true, '1417', 16, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (564, 'Кемертоган 8й кв,уч 11', '', '2022-10-10 15:35:57.410676+00', '2022-10-10 15:35:57.410676+00', 42, 'Неизв ', '+7 (707) 168-43-02', '', true, '1418', 17, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (569, 'Чемолган байтурсынова 284', '', '2022-10-11 03:55:36.91518+00', '2022-10-11 03:55:36.91518+00', 42, 'Неизвестно ', '+7 (707) 797-08-08', '', true, '1429', 56, '2022-09-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (571, 'Касина 25', '', '2022-10-11 04:06:24.183589+00', '2022-10-11 04:06:24.183589+00', 42, 'Неизвестно ', '+7 (702) 141-16-81', '', true, '1431', 13, '2019-09-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (570, 'Узынагаш ', '', '2022-10-11 04:02:59.749109+00', '2022-10-11 10:37:50.54854+00', 42, 'Неизвестно ', '+7 (700) 228-50-32', '', true, '1430', 28, '2022-09-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (575, 'Талгар', '', '2022-10-12 04:22:51.230205+00', '2022-10-12 04:22:51.230205+00', 42, 'Неизвестно ', '+7 (705) 904-72-52', '', true, '1441', 17, '2020-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (576, 'Туздыбастау ', '', '2022-10-12 04:24:49.639811+00', '2022-10-12 04:24:49.639811+00', 42, 'Неизвестно ', '+7 (775) 825-19-65', '', true, '1442', 17, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (578, 'Алгабес шубат 12/2', '', '2022-10-12 04:45:29.678085+00', '2022-10-12 04:45:29.678085+00', 42, 'Неизвестно ', '+7 (707) 919-44-99', '', true, '1444', 56, '2022-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (579, 'Кошмамбет самсы 118', '', '2022-10-12 04:48:48.127145+00', '2022-10-12 04:48:48.127145+00', 42, 'Неизвестно ', '+7 (778) 781-19-78', '', true, '1445', 56, '2022-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (580, 'Достык акжунис 54', '', '2022-10-12 04:51:59.901688+00', '2022-10-12 04:51:59.901688+00', 42, 'Неизвестно ', '+7 (707) 356-72-09', '', true, '1446', 56, '2022-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (582, 'Рыбинская 37', '', '2022-10-12 04:56:42.048486+00', '2022-10-12 04:56:42.048486+00', 42, 'Ольга', '+7 (701) 788-60-21', '', true, '1448', 13, '2022-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (583, 'Лашин 2', '', '2022-10-12 05:02:20.047319+00', '2022-10-12 05:02:20.047319+00', 42, 'Неизвестно ', '+7 (747) 319-11-76', '', true, '1449', 13, '2021-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (584, 'Истомина 15', '', '2022-10-12 05:14:33.808517+00', '2022-10-12 05:14:33.808517+00', 42, 'Неизвестно ', '+7 (700) 992-25-27', '', true, '1450', 16, '2021-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (585, 'Утемисова 8', '', '2022-10-12 05:17:56.781796+00', '2022-10-12 05:17:56.781796+00', 42, 'Неизвестно ', '+7 (708) 710-40-77', '', true, '1451', 27, '2021-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (549, 'Улан', '', '2022-10-10 05:01:13.254134+00', '2022-10-12 10:28:07.043307+00', 42, 'Неизв', '+7 (702) 730-99-97', '', true, '6LK002205603', 16, '2021-07-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (547, 'Бесагаш тайгашева 6', '', '2022-10-10 04:38:01.654166+00', '2022-10-12 10:28:37.217394+00', 42, 'Неизв', '+7 (705) 290-18-08', '', true, '2021104840', 40, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (548, 'Туздыбастау канала 6', '', '2022-10-10 04:41:04.618953+00', '2022-10-12 10:30:07.895664+00', 42, 'Неизв', '+7 (747) 875-80-54', '', true, '506151000566', 68, '2015-11-03 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (567, 'Туздыбастау коктейль 3', '', '2022-10-10 15:46:27.107311+00', '2022-10-12 10:30:42.694808+00', 42, 'Неизв ', '+7 (777) 029-02-34', '', true, '2020104480', 67, '2022-08-12 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (566, 'Бесагаш кашаубаева149', '', '2022-10-10 15:43:16.124965+00', '2022-10-12 10:32:51.192558+00', 42, 'Неизв ', '+7 (777) 201-99-99', '', true, '5BK131002739', 62, '2013-09-04 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (565, 'Воровского 58', '', '2022-10-10 15:40:42.220173+00', '2022-10-12 10:34:18.043144+00', 42, 'Неизв DS2.13T', '+7 (777) 684-84-50', '', true, '5G1181000073', 15, '2018-07-18 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (553, 'Карасу д 20', '', '2022-10-10 15:09:14.341758+00', '2022-10-12 10:34:55.422553+00', 42, 'Неизв', '+7 (777) 357-49-12', '', true, '330168423220110000274', 34, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (561, 'Узынагаш токкулова 52', '', '2022-10-10 15:28:55.553552+00', '2022-10-12 10:35:44.233878+00', 42, 'Неизв ', '+7 (708) 190-63-16', '', true, '5G1181000278', 16, '2018-09-19 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (559, 'Жамбыл новостройка', '', '2022-10-10 15:24:15.806618+00', '2022-10-12 10:42:08.03351+00', 42, 'Неизв ', '+7 (747) 126-40-57', '', true, '6LK200299150', 46, '2021-11-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (574, 'Тургень ', '', '2022-10-12 04:20:21.20517+00', '2022-10-12 10:42:51.399427+00', 42, 'Неизвестно ', '+7 (705) 965-66-55', '', true, '6LK000334822', 16, '2021-12-09 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (573, 'Тургень сатмонбая 44', '', '2022-10-12 04:18:35.220452+00', '2022-10-12 10:43:29.929588+00', 42, 'Неизвестно ', '+7 (747) 992-52-01', '', true, '6LK000284495', 16, '2021-10-27 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (572, 'Энбекши', '', '2022-10-12 04:16:03.629052+00', '2022-10-12 10:44:10.7478+00', 42, 'Неизвестно ', '+7 (702) 404-21-42', '', true, '6LK000202042', 17, '2021-07-19 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (577, 'ИЯФ', '', '2022-10-12 04:38:10.84088+00', '2022-10-12 10:44:55.517741+00', 42, 'Елена', '+7 (705) 259-16-36', '', true, '6LL000198944', 18, '2022-06-22 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (581, 'Муратбаева 53', '', '2022-10-12 04:54:47.149965+00', '2022-10-12 11:03:02.242982+00', 42, 'Неизвестно ', '+7 (707) 145-48-92', '', true, '2021121061', 40, '2022-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (586, 'ГРЭС 16я лин.д 47', '', '2022-10-12 05:20:33.235955+00', '2022-10-12 05:20:33.235955+00', 42, 'Неизвестно ', '+7 (747) 525-36-37', '', true, '1452', 15, '2021-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (545, 'Исык хан гельды', '', '2022-10-10 04:22:00.508603+00', '2022-10-12 10:27:03.560441+00', 42, 'Неизв', '+7 (777) 275-00-00', '', true, '330167223211410000615', 29, '2022-09-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (568, 'Туздыбастау айжарык', '', '2022-10-11 03:45:10.562485+00', '2022-10-12 10:32:09.41187+00', 42, 'Неизвестно ', '+7 (775) 825-19-65', '', true, '6LK000206257', 16, '2021-07-26 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (587, 'Бесагаш к.г. радуга 21', '', '2022-10-13 03:31:38.044672+00', '2022-10-13 03:31:38.044672+00', 42, 'Неизвестно ', '+7 (701) 717-17-55', '', true, '1453', 13, '2021-10-10 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (588, 'Туздыбастау речная 19', '', '2022-10-13 03:45:16.757786+00', '2022-10-13 03:45:16.757786+00', 42, 'Неизвестно ', '+7 (707) 747-02-66', '', true, '1458', 13, '2018-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (589, 'Туздыбастау к.г.белауса вилодж', '', '2022-10-13 03:55:44.594812+00', '2022-10-13 03:55:44.594812+00', 42, 'Неизвестно ', '+7 (701) 345-16-82', '', true, '1459', 30, '2022-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (590, 'Наваи вверх Архат уч5в', '', '2022-10-13 04:05:04.065085+00', '2022-10-13 04:05:04.065085+00', 42, 'Неизвестно ', '+7 (707) 529-89-00', '', true, '1460', 30, '2022-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (591, 'Таусамал', '', '2022-10-13 04:09:54.457134+00', '2022-10-13 04:09:54.457134+00', 42, 'Неизвестно ', '+7 (701) 716-49-07', '', true, '1461', 16, '2022-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (592, 'Кокозек', '', '2022-10-13 04:18:13.075296+00', '2022-10-13 04:18:13.075296+00', 42, 'Неизвестно ', '+7 (707) 688-94-74', '', true, '1462', 16, '2022-08-20 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (593, 'Карасу центральная 20', '', '2022-10-13 04:25:41.858072+00', '2022-10-13 04:25:41.858072+00', 42, 'Неизвестно ', '+7 (708) 671-81-20', '', true, '1463', 17, '2020-09-20 00:00:00+00');


--
-- Data for Name: dictBoilers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (29, 'AR3301672', 'Ariston Alteas XC 35', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:50:26.888313+00', '2022-04-13 07:00:59.481523+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (28, 'AR3301671', 'Ariston Alteas XC 30', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:50:18.980185+00', '2022-04-13 07:01:08.008911+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (38, 'SSB20', 'SSB 20', 0, 0, 99999999, 0, 0, 0, '2022-04-13 07:43:21.363711+00', '2022-04-13 07:43:21.363711+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (39, 'RMF167', 'Rinnai RMF 167', 0, 1095, 99999999, 0, 0, 0, '2022-04-14 06:32:38.807454+00', '2022-04-14 06:32:38.807454+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (40, 'RT_PT16', 'Росстерм PT-16', 0, 1095, 9999999, 0, 0, 0, '2022-04-14 06:50:32.825539+00', '2022-04-14 06:50:32.825539+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (41, 'SSB25', 'SSB 25', 0, 1095, 9999999, 0, 0, 0, '2022-04-14 08:53:39.837525+00', '2022-04-14 08:53:39.837525+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (42, 'MGSEOUL21', 'Master Gas Seoul 21', 0, 1095, 9999999, 0, 0, 0, '2022-04-19 12:51:52.15135+00', '2022-04-19 12:51:52.15135+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (43, 'PL3.25', 'Celtic Platinum 3.25', 0, 1095, 9999999, 0, 0, 0, '2022-04-22 17:09:11.61637+00', '2022-04-22 17:09:11.61637+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (68, 'ESR2.25', 'DAESUNG ESR 2.25', 0, 0, 999999, 0, 0, 0, '2022-10-12 10:29:48.765126+00', '2022-10-12 10:29:48.765126+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (11, 'ESR2.20', 'DAESUNG ESR 2.20', 340000, 1095, 99999999, 0, 0, 0, '2022-01-01 07:23:43.169227+00', '2022-04-13 06:56:08.510975+00', 1, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (12, 'ESR2.13', 'DAESUNG ESR 2.13', 313000, 1095, 99999999, 0, 0, 0, '2022-01-20 08:23:47.000009+00', '2022-04-13 06:56:13.123469+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (13, 'ESR2.30', 'DAESUNG ESR 2.30', 374000, 1095, 99999999, 0, 0, 0, '2022-01-20 08:24:51.941351+00', '2022-04-13 06:56:17.004054+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (14, 'ESR2.35', 'DAESUNG ESR 2.35', 393000, 1095, 99999999, 0, 0, 0, '2022-01-20 08:25:02.397433+00', '2022-04-13 06:56:21.489403+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (15, 'FAF2.13', 'FAF2.13', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:43:15.318535+00', '2022-04-13 06:56:25.331344+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (16, 'FAF2.20', 'FAF2.20', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:43:38.946385+00', '2022-04-13 06:58:38.231644+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (17, 'FAF2.30', 'FAF2.30', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:44:03.667826+00', '2022-04-13 06:58:42.363769+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (18, 'FAF2.35', 'FAF2.35', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:44:11.636933+00', '2022-04-13 06:58:45.67525+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (19, 'FAF2.50', 'FAF2.50', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:44:19.284016+00', '2022-04-13 06:58:50.430269+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (20, 'FER_F18', 'Ferroli Fortuna F18', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:45:36.704563+00', '2022-04-13 06:58:59.700623+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (21, 'FER_F24', 'Ferroli Fortuna F24', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:45:44.721064+00', '2022-04-13 06:59:06.700736+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (22, 'FER_F32', 'Ferroli Fortuna F32', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:45:55.340458+00', '2022-04-13 06:59:20.861416+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (23, 'FER_F40', 'Ferroli Fortuna F40', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:46:03.488146+00', '2022-04-13 06:59:31.010679+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (31, 'AR3301677', 'Ariston CLAS XC 28', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:51:18.851598+00', '2022-04-13 06:59:38.27607+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (24, 'FER_HF24', 'Ferroli Fortuna HF24', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:46:25.454063+00', '2022-04-13 06:59:46.291378+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (32, 'AR3301678', 'Ariston CLAS XC 35', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:51:27.181742+00', '2022-04-13 06:59:54.097979+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (25, 'FER_HF32', 'Ferroli Fortuna HF32', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:46:32.471781+00', '2022-04-13 07:00:01.413038+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (33, 'AR3301685', 'Ariston CARES XC 10', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:53:30.542665+00', '2022-04-13 07:00:07.540266+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (26, 'FER_HF40', 'Ferroli Fortuna HF40', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:46:39.990948+00', '2022-04-13 07:00:14.187159+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (34, 'AR3301684', 'Ariston CARES XC 15', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:53:41.537979+00', '2022-04-13 07:00:21.299136+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (27, 'AR3301670', 'Ariston Alteas XC 24', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:50:07.144611+00', '2022-04-13 07:00:27.705817+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (35, 'AR3301683', 'Ariston CARES XC 18', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:53:52.264587+00', '2022-04-13 07:00:33.483151+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (36, 'AR3301682', 'Ariston CARES XC 24', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:54:01.099935+00', '2022-04-13 07:00:41.57819+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (30, 'AR3301676', 'Ariston CLAS XC 24', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:51:05.883002+00', '2022-04-13 07:00:48.01907+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (37, 'AR3300844', 'Ariston ALTEAS X 24', 0, 1095, 99999999, 0, 0, 0, '2022-04-13 06:54:56.498507+00', '2022-04-13 07:00:53.186626+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (44, 'RINNAI_178532', 'Rinnai RB-106', 0, 1095, 1095, 0, 0, 0, '2022-04-22 17:12:25.053019+00', '2022-04-22 17:12:25.053019+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (45, 'GRW-3.0/230', 'KOSPEL ТЭН GRW-3.0/230', 0, 1095, 9999999, 0, 0, 0, '2022-04-23 05:02:07.452545+00', '2022-04-23 05:02:07.452545+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (46, 'FAF2.18', 'FAF2.18', 0, 1095, 9999999, 0, 0, 0, '2022-04-26 10:10:19.132923+00', '2022-04-26 10:10:19.132923+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (47, 'FER_DF24', 'Ferroli DIVAtech D F24', 0, 1095, 999999999, 0, 0, 0, '2022-06-30 11:31:15.147488+00', '2022-06-30 11:31:15.147488+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (48, 'FER_DF32', 'Ferroli DIVAtech D F32', 0, 1095, 999999999, 0, 0, 0, '2022-06-30 11:31:27.222625+00', '2022-06-30 11:31:27.222625+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (49, 'FER_DF37', 'Ferroli DIVAtech D F37', 0, 1095, 999999999, 0, 0, 0, '2022-06-30 11:31:35.546585+00', '2022-06-30 11:31:35.546585+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (50, 'SEK150G', 'SEK-150 (газ)', 0, 1095, 10000000, 0, 0, 0, '2022-07-10 05:17:07.867147+00', '2022-07-10 05:17:07.867147+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (51, 'HUBERT_AGB26L', 'HUBERT AGB 26L', 0, 0, 99999999, 0, 0, 0, '2022-07-11 11:15:18.135+00', '2022-07-11 11:16:13.346125+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (54, 'FAF2.25', 'FAF2.25', 0, 1095, 9999999, 0, 0, 0, '2022-09-19 06:52:09.842249+00', '2022-09-19 06:52:09.842249+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (55, 'RT_PT18', 'Росстерм РТ-18', 0, 0, 999999999, 0, 0, 0, '2022-09-28 05:21:25.173914+00', '2022-09-28 05:21:58.655885+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (56, 'RT_PT20', 'Росстерм РТ-20', 0, 0, 99999999, 0, 0, 0, '2022-09-28 05:31:31.155657+00', '2022-09-30 05:46:08.602297+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (57, 'AR3300849', 'Ariston Alteas X 35', 0, 0, 9999999, 0, 0, 0, '2022-09-30 06:57:42.942244+00', '2022-09-30 06:57:42.942244+00', 42, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (58, 'SSP2.20', 'SSP2.20', 0, 0, 999999, 0, 0, 0, '2022-09-30 08:28:05.760146+00', '2022-09-30 08:28:05.760146+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (59, 'SSP2.35', 'SSP2.35', 0, 0, 9999999, 0, 0, 0, '2022-09-30 10:48:45.434471+00', '2022-09-30 10:48:45.434471+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (60, 'MGSEOUL14', 'Master Gas Seoul 14', 0, 0, 9999999, 0, 0, 0, '2022-10-03 10:49:56.192185+00', '2022-10-03 10:50:20.358411+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (62, 'MGSEOUL11', 'Master Gas Seoul 11', 0, 0, 9999, 0, 0, 0, '2022-10-04 13:06:57.684426+00', '2022-10-04 13:06:57.684426+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (61, 'STS700G', 'STS-700 (газ)', 0, 365, 999999, 0, 0, 0, '2022-10-04 10:20:06.64242+00', '2022-10-05 03:07:55.281893+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (63, 'RT_PT24', 'Росстерм РТ-24', 0, 0, 99999, 0, 0, 0, '2022-10-05 08:49:43.849243+00', '2022-10-05 08:49:43.849243+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (65, 'STS1000G', 'STS-1000 (газ)', 0, 0, 999990, 0, 0, 0, '2022-10-06 05:20:29.469391+00', '2022-10-06 05:20:29.469391+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (66, 'ISISD28', 'ISI SD-28', 0, 0, 99990, 0, 0, 0, '2022-10-06 06:30:43.48956+00', '2022-10-06 06:30:43.48956+00', 32, true);
INSERT INTO "service-crm"."dictBoilers" (id, article, name, price, "daysOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy", "isActive") VALUES (67, 'RT_PT30', 'Росстерм РТ-30', 0, 0, 999990, 0, 0, 0, '2022-10-10 07:15:53.623552+00', '2022-10-10 07:16:29.037588+00', 32, true);


--
-- Data for Name: dictJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (39, 'EXCH_HYDRAULIC', 'Замена в гидроузле', '2022-06-23 06:03:35.419008+00', '2022-06-27 04:16:07.882654+00', 7000, 32, 14, 6000, 5000, 3000, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (37, 'REP_COMB_CHAMB', 'Ремонт камеры сгорания', '2022-06-23 06:00:51.259709+00', '2022-06-27 04:16:43.634167+00', 15000, 32, 14, 6000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (38, 'EXCH_COMB_CHAMB', 'Замена в камере сгорания', '2022-06-23 06:02:32.874455+00', '2022-06-27 04:18:07.6298+00', 10000, 32, 14, 6000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (42, 'EXCH_ELECTRIC', 'Замена в электрической части', '2022-06-23 06:06:21.359263+00', '2022-06-27 04:20:11.94266+00', 8000, 32, 14, 5000, 3000, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (40, 'REP_HYDRAULIC', 'Ремонт в гидроузле', '2022-06-23 06:04:30.770617+00', '2022-06-27 04:22:42.038681+00', 11000, 32, 14, 9000, 3000, 4000, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (30, '1ST_START', 'ПНР', '2022-01-20 08:26:07.94059+00', '2022-04-13 06:39:53.171161+00', 0, 32, 14, 5000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (32, 'MAINT', 'Профилактика', '2022-04-13 06:40:39.178992+00', '2022-04-13 06:40:39.178992+00', 15000, 32, 14, 25000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (33, 'PCB_REMOVE', 'Замена блока управления', '2022-04-14 06:44:32.351565+00', '2022-06-23 05:56:47.774428+00', 3000, 32, 14, 5000, 10000, 15000, false);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (34, 'DHW_CLEAN', 'Чистка теплообменника ГВС', '2022-04-14 06:56:42.914998+00', '2022-06-23 05:56:53.10112+00', 7000, 32, 14, 9000, 12000, 15000, false);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (35, 'DIAG', 'Диагностика', '2022-06-16 05:13:04.328328+00', '2022-06-23 05:57:08.993571+00', 5000, 32, 14, 0, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (36, 'WAR_REPAIR', 'Ремонт по гарантии', '2022-06-23 05:57:55.310378+00', '2022-06-23 05:57:55.310378+00', 0, 32, 14, 0, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (29, 'WORK1', 'Почасовая оплата', '2022-01-01 07:23:06.965276+00', '2022-06-23 05:58:50.209794+00', 2000, 1, 14, 1000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (41, 'REP_ELECTRIC', 'Ремонт в электрической части', '2022-06-23 06:05:29.609878+00', '2022-06-23 06:05:29.609878+00', 15000, 32, 14, 9000, 7000, 4000, true);


--
-- Data for Name: dictOrderStatuses; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") VALUES (1, 'CREATED', 'Создан', '2021-06-05 16:35:29.872593+00', '2021-06-05 16:35:29.872593+00', true, 'Создать заказ', NULL, false);
INSERT INTO "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") VALUES (6, 'SERVICE_DONE', 'Выполнен', '2021-12-10 08:59:45.943436+00', '2021-12-10 08:59:45.943436+00', true, 'Выполнен', 'IN_PROGRESS', false);
INSERT INTO "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") VALUES (4, 'DONE', 'Завершен', '2021-06-05 16:35:29.872593+00', '2021-06-05 16:35:29.872593+00', true, 'Завершить', 'SERVICE_DONE', false);
INSERT INTO "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") VALUES (2, 'IN_PROGRESS', 'В работе', '2021-06-05 16:35:29.872593+00', '2021-06-05 16:35:29.872593+00', true, 'Взять в работу', 'CREATED, ON_HOLD', false);
INSERT INTO "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") VALUES (7, 'ON_HOLD', 'Отложен', '2021-12-10 09:06:50.067763+00', '2021-12-10 09:06:50.067763+00', true, 'Отложить', 'IN_PROGRESS, CREATED', true);
INSERT INTO "service-crm"."dictOrderStatuses" (id, code, name, "createdDate", "updatedDate", "isActive", action, "availableOn", "commentRequired") VALUES (3, 'CANCELED', 'Отменен', '2021-06-05 16:35:29.872593+00', '2021-06-05 16:35:29.872593+00', true, 'Отменить заказ', 'IN_PROGRESS, CREATED', true);


--
-- Data for Name: dictParts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (36, '2060185A', 'Теплообменник ГВС (25-35)', 30400, '2022-01-24 09:50:46.771862+00', '2022-04-22 11:47:48.354946+00', 30, 10, 27400, 25800, 19800, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (50, '3012298', 'Колпак (A 13-16)', 17700, '2022-01-24 10:01:00.242603+00', '2022-01-24 10:01:00.242603+00', 30, 10, 0, 0, 5000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (51, '3011922M', 'Колпак (A 20)', 18300, '2022-01-24 10:01:26.666152+00', '2022-01-24 10:01:26.666152+00', 30, 10, 0, 0, 5500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (10, '2080653', 'Манометр (квадратный)', 12300, '2022-01-24 09:02:06.916545+00', '2022-04-22 11:22:37.55289+00', 30, 10, 11100, 10500, 8000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (19, '3050075', 'Колпак (ESR 25-35)', 19000, '2022-01-24 09:19:41.00068+00', '2022-01-24 09:19:41.00068+00', 30, 10, 0, 0, 6000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (17, '3050073', 'Колпак (ESR 13-16)', 17700, '2022-01-24 09:16:09.85036+00', '2022-01-24 09:40:15.255171+00', 30, 10, 0, 0, 5000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (18, '3050074', 'Колпак (ESR 20)', 18300, '2022-01-24 09:16:32.943867+00', '2022-01-24 09:40:43.054923+00', 30, 10, 0, 0, 5500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (62, '3090222', 'Задняя стенка камеры сгорания (50)', 17000, '2022-01-24 10:10:02.442981+00', '2022-01-24 10:10:02.442981+00', 30, 10, 0, 0, 5000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (20, '2070392M', 'Теплообменник основной (ESR 13-16)', 50900, '2022-01-24 09:39:47.40057+00', '2022-04-22 11:26:28.292171+00', 30, 10, 45800, 43300, 33100, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (12, '2080971', 'Блок управления (PLATINUM)', 54500, '2022-01-24 09:04:03.283026+00', '2022-04-22 11:23:45.703047+00', 30, 10, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (23, '2080390', 'Датчик перегрева', 6000, '2022-01-24 09:42:50.474593+00', '2022-04-22 11:34:19.467217+00', 30, 10, 5400, 5100, 3900, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (9, '2081212M', 'Манометр (круглый)', 12300, '2022-01-24 09:01:38.694007+00', '2022-04-22 06:52:05.048422+00', 30, 9, 11100, 10500, 8000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (7, '2040105', '3ходовой клапан (2.13-35)', 16500, '2022-01-01 07:24:33.734711+00', '2022-04-22 06:33:36.875891+00', 30, 483, 14900, 14000, 10700, 1, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (14, '2081024', 'Блок управления (VANS)', 54500, '2022-01-24 09:14:04.279017+00', '2022-04-22 11:24:29.550915+00', 30, 10, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (11, '2080833', 'Блок управления (APRIL)', 54500, '2022-01-24 09:03:43.811919+00', '2022-04-22 11:23:31.717844+00', 30, 9, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (13, '2080831', 'Блок управления (ESR)', 54500, '2022-01-24 09:12:13.396103+00', '2022-04-22 11:24:11.557049+00', 30, 8, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (15, '2081015', 'Блок управления (EUROCLIMA)', 54500, '2022-01-24 09:14:23.794568+00', '2022-04-22 11:24:53.711209+00', 30, 7, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (65, '52100325', 'Вентилятор (50)', 49500, '2022-01-24 10:11:30.252732+00', '2022-04-22 11:28:50.187363+00', 30, 10, 44600, 42100, 32200, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (64, '2060281', 'Теплообменник ГВС (50)', 46500, '2022-01-24 10:11:02.692741+00', '2022-04-22 11:29:14.183934+00', 30, 10, 41900, 39500, 30200, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (63, '2070470', 'Расширительный бак (50)', 52800, '2022-01-24 10:10:34.591143+00', '2022-04-22 11:29:46.489396+00', 30, 10, 47500, 44900, 34400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (61, '2030277', 'Газовый клапан (50)', 87100, '2022-01-24 10:09:23.255632+00', '2022-04-22 11:30:21.462686+00', 30, 10, 78400, 74000, 56600, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (60, '2080768', 'Блок управления (A MAX 50)', 67000, '2022-01-24 10:08:41.738581+00', '2022-04-22 11:30:50.209313+00', 30, 10, 60300, 57000, 43500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (58, '2082743', 'Пульт (DR-240A, A)', 18200, '2022-01-24 10:06:34.245388+00', '2022-04-22 11:31:27.358523+00', 30, 10, 16400, 15500, 11900, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (57, '2080459A', 'Датчик температуры ГВС (A 13-35)', 9200, '2022-01-24 10:05:42.899962+00', '2022-04-22 11:31:58.69541+00', 30, 10, 8300, 7800, 6000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (56, '52060749', 'Патрубок возвратный с фланцем крепления насоса (A 13-35)', 17800, '2022-01-24 10:05:06.095151+00', '2022-04-22 11:32:40.609372+00', 30, 10, 16000, 15100, 11500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (21, '2070391M', 'Теплообменник основной (ESR 20)', 56400, '2022-01-24 09:41:38.119472+00', '2022-04-22 11:33:17.476742+00', 30, 10, 50800, 47900, 36700, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (22, '2070429M', 'Теплообменник основной (ESR 25-35)', 66400, '2022-01-24 09:42:13.149471+00', '2022-04-22 11:33:44.871161+00', 30, 9, 59800, 56400, 43200, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (24, '53080471', 'Прокладка Р16', 500, '2022-01-24 09:43:35.177064+00', '2022-04-22 11:35:34.833994+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (25, '2080364', 'Трансформатор поджига', 10600, '2022-01-24 09:44:10.17757+00', '2022-04-22 11:36:06.816828+00', 30, 10, 9500, 9000, 6900, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (26, '2100259', 'Вентилятор (ESR 13-20)', 30400, '2022-01-24 09:45:07.696679+00', '2022-04-22 11:36:50.938312+00', 30, 10, 27400, 25800, 19800, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (27, '2100291', 'Вентилятор (ESR 25-35)', 30400, '2022-01-24 09:45:26.503713+00', '2022-04-22 11:37:09.377071+00', 30, 10, 27400, 25800, 19800, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (37, '53080487', 'Прокладка Р18', 500, '2022-01-24 09:51:05.930622+00', '2022-04-22 11:37:22.054542+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (28, '52050118', 'Насос (ESR 13-20)', 58000, '2022-01-24 09:46:00.864624+00', '2022-04-22 11:37:54.95447+00', 30, 6, 52200, 49300, 37700, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (38, '53080484', 'Прокладка Р6', 500, '2022-01-24 09:51:23.629535+00', '2022-04-22 11:38:07.246491+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (29, '52050115', 'Насос (ESR 25-35)', 58000, '2022-01-24 09:46:17.574777+00', '2022-04-22 11:38:35.369384+00', 30, 10, 52200, 49300, 37700, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (39, '2060229', 'Датчик протока ГВС (13-35)', 14800, '2022-01-24 09:51:55.234129+00', '2022-04-22 11:38:54.866765+00', 30, 10, 13300, 12600, 9600, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (30, '2060296', 'Патрубок возвратный с фланцем крепления насоса (ESR 13-35)', 17800, '2022-01-24 09:47:46.60234+00', '2022-04-22 11:39:10.241489+00', 30, 10, 16000, 15100, 11500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (40, '53080472', 'Прокладка Р18.6', 500, '2022-01-24 09:52:23.466939+00', '2022-04-22 11:39:18.57988+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (31, '53080473', 'Прокладка насоса', 500, '2022-01-24 09:48:17.463175+00', '2022-04-22 11:39:29.427157+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (41, '3080546', 'Прокладка Р22', 500, '2022-01-24 09:52:38.617705+00', '2022-04-22 11:39:38.227291+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (32, '3080543', 'Прокладка Р12', 500, '2022-01-24 09:48:36.165718+00', '2022-04-22 11:39:47.900708+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (42, '3130527A', 'Датчик температуры ГВС (ESR 13-35)', 9200, '2022-01-24 09:53:22.737471+00', '2022-04-22 11:40:11.950863+00', 30, 10, 8300, 7800, 6000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (33, '53080485', 'Прокладка Р14', 500, '2022-01-24 09:48:50.868947+00', '2022-04-22 11:40:20.961758+00', 30, 10, 500, 400, 300, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (43, '2080250', 'Датчик температуры отопления (ESR 13-35)', 9300, '2022-01-24 09:53:54.159741+00', '2022-04-22 11:40:35.454678+00', 30, 10, 8400, 7900, 6000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (34, '2060236', 'Теплообменник ГВС (13-16)', 22200, '2022-01-24 09:49:34.004646+00', '2022-04-22 11:41:06.062944+00', 30, 10, 20000, 18900, 14400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (44, '2081017', 'Датчик перегрева на колпаке (13-35)', 4300, '2022-01-24 09:54:29.744795+00', '2022-04-22 11:46:04.672929+00', 30, 10, 3900, 3700, 2800, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (35, '2060237', 'Теплообменник ГВС (20)', 24200, '2022-01-24 09:50:18.078726+00', '2022-04-22 11:46:31.124822+00', 30, 10, 21800, 20600, 15800, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (45, '52080973', 'Пульт (DSR-220RH, PLATINUM)', 16100, '2022-01-24 09:55:19.989278+00', '2022-04-22 11:47:19.035929+00', 30, 10, 14500, 13700, 10500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (46, '2080997', 'Пульт (DSR-550, ESR)', 16100, '2022-01-24 09:56:45.853739+00', '2022-04-22 11:48:04.531988+00', 30, 10, 14500, 13700, 10500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (47, '2082754', 'Блок управления (A, D MAX 13-16)', 54500, '2022-01-24 09:58:57.817268+00', '2022-04-22 11:49:32.122225+00', 30, 10, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (48, '2082746', 'Блок управления (A, D MAX 20-35)', 54500, '2022-01-24 09:59:21.548933+00', '2022-04-22 11:50:13.969358+00', 30, 10, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (49, '52070811', 'Расширительный бак (A 13-20)', 29000, '2022-01-24 10:00:05.6656+00', '2022-04-22 11:50:48.583551+00', 30, 10, 26100, 24700, 18900, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (52, '2070847', 'Теплообменник основной (A 13-16)', 50900, '2022-01-24 10:02:10.41001+00', '2022-04-22 11:51:10.14483+00', 30, 10, 45800, 43300, 33100, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (53, '2070830', 'Теплообменник основной (A 20)', 56400, '2022-01-24 10:02:45.558924+00', '2022-04-22 11:51:35.959227+00', 30, 10, 50800, 47900, 36700, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (55, '52100317', 'Вентилятор (А 13-16)', 30400, '2022-01-24 10:04:20.230383+00', '2022-04-22 11:52:24.934501+00', 30, 10, 27400, 25800, 19800, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (8, '2070877', 'Расширительный бак (ESR 2.13-35)', 29000, '2022-01-24 09:00:45.625884+00', '2022-04-22 06:51:25.044989+00', 30, 8, 26100, 24700, 18900, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (68, '2082760', 'Пульт (DSR-400U, 50)', 16100, '2022-01-24 10:13:12.658599+00', '2022-04-22 11:27:17.410195+00', 30, 10, 14500, 13700, 10500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (67, '2130439', 'Теплообменник конденсационный (50)', 110300, '2022-01-24 10:12:38.403231+00', '2022-04-22 11:27:52.980493+00', 30, 10, 99300, 93800, 71700, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (66, '2070469M', 'Теплообменник основной (50)', 84700, '2022-01-24 10:12:07.316924+00', '2022-04-22 11:28:26.163424+00', 30, 10, 76200, 72000, 55100, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (54, '3130448', 'Датчик температуры отопления (A 13-35)', 9300, '2022-01-24 10:03:37.74454+00', '2022-04-22 11:51:59.710413+00', 30, 10, 8400, 7900, 6000, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (16, '2030280', 'Газовый клапан (2.13-35)', 52600, '2022-01-24 09:14:59.508114+00', '2022-04-22 11:25:32.549781+00', 30, 7, 47300, 44700, 34200, 32, true);


--
-- Data for Name: dictRoles; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."dictRoles" (id, code, name, "createdDate", "updatedDate", "isActive") VALUES (1, 'SUPER_ADMIN', 'Супер админ', '2021-06-05 16:26:42.956451+00', '2021-06-05 16:26:42.956451+00', true);
INSERT INTO "service-crm"."dictRoles" (id, code, name, "createdDate", "updatedDate", "isActive") VALUES (2, 'ADMIN', 'Администратор', '2021-06-05 16:26:42.956451+00', '2021-06-05 16:26:42.956451+00', true);
INSERT INTO "service-crm"."dictRoles" (id, code, name, "createdDate", "updatedDate", "isActive") VALUES (3, 'SERVICE_MAN', 'Специалист по ремонту', '2021-06-05 16:26:42.956451+00', '2021-06-05 16:26:42.956451+00', true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (71, 59, 32, 'ул. Айтей батыра, 17/1', '2022-04-14 06:43:26.340692+00', '2022-04-14 11:04:38.447942+00', 4, 39, 'Не включается. Возможно, под замену плата управления. Уточнить серийный номер и модель котла.', true, false, 11, 5000, 58900, '+7 (776) 777-77-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (222, 232, 42, 'Пакрышкина 2а', '2022-07-12 05:35:21.941997+00', '2022-07-13 03:01:29.18818+00', 4, 36, 'Диагностика к17 00', true, false, 13, 0, 50000, '+7 (701) 767-91-61', '2022-07-13 03:01:29.18818+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (210, 218, 42, 'Есенберлина 14', '2022-07-07 05:32:42.285605+00', '2022-07-13 04:14:14.369892+00', 6, 40, 'Гудит', true, false, 40, 0, 50000, '+7 (702) 411-21-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (75, 54, 42, 'Каскелен Жамбыла 23/1', '2022-04-14 10:33:52.806621+00', '2022-04-14 11:08:33.676549+00', 3, 39, 'А3 аа чистка теплообменника ', true, false, 16, 5000, 14000, '+7 (701) 289-71-23', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (206, 214, 42, 'Луганского 48 а', '2022-07-05 05:32:55.247291+00', '2022-07-05 10:22:43.382582+00', 4, 40, 'Пнр сегодня обязательно переделать дымоход обязательно ', true, false, 11, 0, 0, '+7 (705) 619-29-54', '2022-07-05 10:22:43.382582+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (66, 52, 32, 'пос. Гульдала, ул. Жибек жолы, д. 21', '2022-04-13 07:45:36.068784+00', '2022-06-23 08:59:42.58976+00', 4, 36, 'Нет ГВС.  Уточнить серийный номер и модель котла', true, false, 38, 5000, 90003000, '+7 (777) 290-00-77', '2022-06-23 08:59:42.58976+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (189, 189, 42, 'Львова 34', '2022-06-27 03:33:15.119187+00', '2022-07-04 03:32:56.964282+00', 4, 39, 'Пнр', true, false, 27, 0, 50000, '+7 (701) 740-17-71', '2022-07-04 03:32:56.964282+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (266, 277, 42, 'Первомайские пруды дачи ардагер 8я линия д.17', '2022-08-09 08:12:37.407263+00', '2022-09-17 04:43:43.563943+00', 6, 36, 'Профилактика пятница', true, false, 40, 0, 150000, '+7 (747) 346-83-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (226, 235, 42, 'Чембулак ресторан', '2022-07-15 08:49:14.003033+00', '2022-07-15 10:03:44.414309+00', 2, 37, 'Электротен не греет забрали тен на праверку. Другой работает нормально ', true, false, 20, 5000, 5000, '+7 (708) 767-76-75', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (218, 226, 32, 'Шаляпина-Правды', '2022-07-10 05:18:41.166239+00', '2022-07-10 11:40:27.155632+00', 3, 37, 'Не видит воду. Висит в аварии, насос включен, вода в котле есть. Водомер?', true, false, 50, 15000, 15000, '+7 (702) 320-80-45', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (194, 194, 42, 'Боролдай возник 3 д 105а', '2022-06-30 03:27:04.6975+00', '2022-07-04 11:23:05.836678+00', 4, 36, 'Профилактика', true, false, 13, 0, 250000, '+7 (701) 744-52-85', '2022-07-04 11:23:05.836678+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (214, 222, 42, 'Каскелен аксаут 5', '2022-07-08 03:19:38.865628+00', '2022-07-11 03:44:26.382274+00', 4, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (777) 694-00-05', '2022-07-11 03:44:26.382274+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (198, 206, 42, 'Фабричный', '2022-07-03 05:57:59.912973+00', '2022-07-04 11:24:27.466323+00', 4, 36, 'Профилактика ', true, false, 16, 3000, 250003000, '+7 (708) 330-90-70', '2022-07-04 11:24:27.466323+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (250, 260, 42, 'Кимел есенхана 11', '2022-07-23 02:32:17.507843+00', '2022-07-25 03:45:22.952821+00', 4, 36, 'Пнр', true, false, 15, 0, 0, '+7 (701) 768-64-42', '2022-07-25 03:45:22.952821+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (202, 210, 42, 'Жаналык', '2022-07-04 08:48:47.009413+00', '2022-07-05 09:15:04.895972+00', 4, 39, 'Перевод на пропан плюс жиклеры', true, false, 30, 2000, 110002000, '+7 (707) 240-76-69', '2022-07-05 09:15:04.895972+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (246, 256, 42, 'Кемертоган новостройка', '2022-07-22 06:07:49.245968+00', '2022-07-26 05:48:40.553183+00', 4, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (701) 901-25-84', '2022-07-26 05:48:40.553183+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (242, 252, 42, 'Байсерке', '2022-07-21 03:14:11.992078+00', '2022-07-21 11:11:10.958622+00', 4, 36, 'Чистка гвс и может профилактика', true, false, 16, 2000, 2000, '+7 (700) 989-96-01', '2022-07-21 11:11:10.958622+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (234, 243, 42, 'Село чемолган квартал 3 д 111', '2022-07-18 04:25:42.45567+00', '2022-07-18 04:45:08.92817+00', 3, 39, 'Нет гвс', true, false, 16, 3000, 50003000, '+7 (701) 178-54-50', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (238, 248, 42, 'Тургутозала 110', '2022-07-19 03:25:01.517741+00', '2022-07-21 11:11:55.680064+00', 4, 36, 'Пнр', true, false, 40, 0, 0, '+7 (771) 775-07-30', '2022-07-21 11:11:55.680064+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (230, 239, 42, 'Каменка айболит', '2022-07-16 09:58:28.278044+00', '2022-07-26 05:57:10.385831+00', 4, 39, 'Нет гвс понидельник до обеда ', true, false, 17, 0, 5000, '+7 (776) 692-22-66', '2022-07-26 05:57:10.385831+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (95, 89, 42, 'Казахфильм жанар37 а кв7', '2022-04-25 04:49:19.210284+00', '2022-05-18 16:50:04.839039+00', 3, 36, 'Нет гвс', true, false, 11, 5000, 5000, '+7 (701) 555-86-92', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (81, 68, 42, 'Аксай 3б', '2022-04-18 03:29:51.395914+00', '2022-04-18 03:34:47.795626+00', 3, 39, 'Нет гвс', true, false, 30, 5000, 5000, '+7 (701) 511-14-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (281, 292, 42, 'Мельникайте 27/2', '2022-09-17 02:09:05.214206+00', '2022-09-17 04:44:19.462767+00', 6, 39, 'Профилактика можно на следующей неделе ', true, false, 11, 0, 25000, '+7 (771) 474-44-97', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (262, 273, 42, 'Туздыбастау достык', '2022-08-08 04:00:41.32078+00', '2022-08-11 06:59:29.15594+00', 4, 36, 'Профилактика', true, false, 16, 0, 250000, '+7 (701) 732-12-20', '2022-08-11 06:59:29.15594+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (254, 265, 42, 'Абайские дачи', '2022-07-29 14:01:18.429902+00', '2022-08-03 04:49:11.700007+00', 4, 39, 'Нет гвс АЕ завтра утром ', true, false, 13, 0, 5000, '+7 (777) 029-41-91', '2022-08-03 04:49:11.700007+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (258, 269, 42, 'Весна 65 участок 89', '2022-08-01 07:14:15.75782+00', '2022-08-03 04:49:57.223135+00', 4, 39, 'Пнр', true, false, 21, 0, 0, '+7 (701) 575-77-73', '2022-08-03 04:49:57.223135+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (271, 282, 32, 'мкр. Алгабас, ул. Беласу, 5', '2022-09-13 05:02:15.130138+00', '2022-09-17 04:44:29.306488+00', 6, 36, 'ПНР', true, false, 20, 0, 0, '+7 (747) 228-88-05', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (275, 286, 42, 'Туздыбастау Сейфулина 124', '2022-09-16 03:57:27.493704+00', '2022-09-17 04:37:22.0687+00', 6, 39, 'Профилактика на субботу ', true, false, 16, 0, 250000, '+7 (777) 299-17-26', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (284, 295, 42, 'Туздыбастау мангелик ель 13', '2022-09-17 04:52:53.021858+00', '2022-09-19 16:28:37.364522+00', 6, 39, 'Профилактика на следующей субботу  утром', true, false, 13, 0, 250000, '+7 (778) 565-41-43', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (278, 216, 32, 'Артемьевская 18', '2022-09-16 04:58:39.629738+00', '2022-09-19 15:18:43.609357+00', 6, 36, 'А6', true, false, 13, 0, 5000, '+7 (777) 666-77-72', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (77, 64, 42, 'Жамбыл новострой ', '2022-04-15 04:22:21.236771+00', '2022-04-22 06:11:42.272642+00', 3, 36, 'Гремит на понедельник ', true, false, 22, 0, 0, '+7 (771) 606-21-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (290, 301, 42, 'Тайманова 222 г', '2022-09-17 12:21:27.084726+00', '2022-09-29 09:08:46.205049+00', 6, 38, 'Пнр', true, false, 28, 0, 50000, '+7 (777) 802-52-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (87, 82, 42, 'Боролдай м.р. жайнак жангильдина4', '2022-04-21 04:12:49.986551+00', '2022-04-23 05:41:33.918902+00', 3, 40, 'Самсунг бежит ', true, false, 11, 5000, 5000, '+7 (702) 431-13-26', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (287, 299, 42, 'Орёт Жапсарбаева 7', '2022-09-17 12:11:10.242295+00', '2022-09-26 16:09:33.782244+00', 3, 36, 'Водогрейка илди нет гвс', true, false, 40, 0, 0, '+7 (701) 449-89-23', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (98, 92, 42, 'Туздыбастау м.р. Арматура Оролман35', '2022-04-27 04:04:26.730184+00', '2022-06-23 06:45:23.011022+00', 3, 40, '', true, false, 14, 25000, 25000, '+7 (700) 300-18-30', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (303, 314, 42, 'Бельбулак новостройка', '2022-09-23 06:01:00.700237+00', '2022-09-26 16:22:23.349278+00', 6, 36, '', true, false, 16, 2000, 0, '+7 (702) 121-22-12', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (65, 51, 32, 'пос. Тумебаев, ул. 1 мая, д. 14', '2022-04-13 07:35:49.909692+00', '2022-06-23 06:55:32.937621+00', 4, 40, 'ПНР. Уточнить серийный номер и модель котла', true, false, 15, 3000, 3000, '+7 (705) 625-51-79', '2022-06-23 06:55:32.937621+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (82, 69, 42, 'Шарын 67', '2022-04-18 05:02:33.952917+00', '2022-04-19 13:07:46.537416+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (701) 324-04-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (102, 98, 42, 'Алгабас серикбай 21', '2022-04-29 05:02:20.861954+00', '2022-04-29 11:06:40.878115+00', 3, 40, 'Профилактика', true, false, 13, 25000, 25000, '+7 (708) 190-39-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (144, 148, 42, 'Туздыбастау кунаева 568', '2022-05-12 11:13:51.97667+00', '2022-06-23 06:47:58.433042+00', 3, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (776) 280-79-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (251, 261, 42, 'Даркенбаева 65', '2022-07-25 03:40:40.182026+00', '2022-08-03 04:47:49.323756+00', 4, 40, 'А5', true, false, 16, 0, 50000, '+7 (701) 424-44-27', '2022-08-03 04:47:49.323756+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (207, 215, 42, 'Омская 29', '2022-07-05 09:49:38.387738+00', '2022-07-11 03:11:13.437703+00', 4, 36, 'Замена датчика тяги', true, false, 40, 0, 130000, '+7 (777) 823-78-02', '2022-07-11 03:11:13.437703+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (215, 223, 42, 'Жандарбекова 259', '2022-07-08 03:22:23.496063+00', '2022-07-11 03:13:00.353436+00', 4, 36, 'Профилактика', true, false, 16, 0, 250000, '+7 (707) 404-63-70', '2022-07-11 03:13:00.353436+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (243, 253, 42, 'Михайловича 55', '2022-07-21 13:17:11.961065+00', '2022-07-25 03:44:10.669458+00', 4, 36, 'Профилактика кател гидроста на завтра после 14.00', true, false, 11, 0, 15000, '+7 (707) 603-15-19', '2022-07-25 03:44:10.669458+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (211, 219, 42, 'Токашбукина 4 кв. 1', '2022-07-07 05:36:28.473166+00', '2022-07-11 03:42:59.383289+00', 4, 40, 'Пнр', true, false, 16, 0, 0, '+7 (707) 515-00-06', '2022-07-11 03:42:59.383289+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (195, 195, 42, 'Каскелен', '2022-06-30 04:24:03.158825+00', '2022-07-04 03:28:26.469211+00', 4, 36, 'Пнр сфотографировать обвязку серийник', true, false, 22, 0, 0, '+7 (701) 700-38-80', '2022-07-04 03:28:26.469211+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (190, 190, 42, 'Жанакуат', '2022-06-27 04:31:41.63312+00', '2022-07-04 03:32:31.824449+00', 4, 39, '', true, false, 27, 0, 50000, '+7 (701) 933-88-84', '2022-07-04 03:32:31.824449+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (219, 82, 42, 'Боролдай м.р. жайнак жангильдина4', '2022-07-11 03:19:35.563754+00', '2022-07-12 02:58:24.999797+00', 4, 39, 'Замена котла', true, false, 11, 0, 150000, '+7 (702) 431-13-26', '2022-07-12 02:58:24.999797+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (199, 207, 42, 'Ахьанова 28', '2022-07-04 08:35:40.468393+00', '2022-07-05 05:33:39.030946+00', 4, 38, 'Замена трехходового ', true, false, 11, 5000, 33800, '+7 (701) 314-58-36', '2022-07-05 05:33:39.030946+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (235, 244, 42, 'Коянкус берлик 12', '2022-07-18 09:01:27.243844+00', '2022-07-20 10:14:43.516691+00', 4, 36, 'Кипит', true, false, 16, 0, 12000, '+7 (701) 651-00-00', '2022-07-20 10:14:43.516691+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (108, 106, 42, 'Бетховена 4', '2022-05-03 04:19:01.407265+00', '2022-06-23 06:48:51.839838+00', 3, 39, 'Давление воды не в норме ростерм', true, false, 15, 5000, 5000, '+7 (778) 184-28-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (107, 105, 42, 'Карасу болашак 13', '2022-05-03 04:14:45.622772+00', '2022-06-23 06:49:15.39268+00', 3, 39, 'Шибка е3 уточнить по гарантии ', true, false, 15, 5000, 5000, '+7 (708) 177-70-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (203, 211, 42, 'Каскелен', '2022-07-05 03:39:44.718623+00', '2022-07-05 09:13:23.763594+00', 4, 38, 'Пнр одноконтурный', true, false, 27, 2000, 50002000, '+7 (707) 487-74-48', '2022-07-05 09:13:23.763594+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (279, 290, 42, 'Бельбулак', '2022-09-16 05:31:49.634377+00', '2022-09-17 13:37:28.969445+00', 6, 36, 'Профилактика на субботу ', true, false, 16, 0, 250000, '+7 (700) 555-58-53', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (247, 257, 42, 'Карасу д 29 кв. 2', '2022-07-22 06:09:53.245639+00', '2022-07-26 05:48:56.770475+00', 4, 40, 'Пнр', true, false, 16, 0, 0, '+7 (778) 618-53-20', '2022-07-26 05:48:56.770475+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (239, 249, 42, 'Капчегай мкр 10 д 4', '2022-07-20 06:25:33.741512+00', '2022-07-21 11:11:31.630513+00', 4, 36, 'Нет гвс ', true, false, 16, 5000, 10000, '+7 (708) 230-59-74', '2022-07-21 11:11:31.630513+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (109, 107, 42, 'Узынагаш алгабас 85', '2022-05-03 04:20:47.565623+00', '2022-05-18 16:50:49.683898+00', 3, 36, 'Пнр ростерм', true, false, 15, 5000, 5000, '+7 (777) 724-80-16', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (231, 240, 42, 'Кемиртоган новостройка', '2022-07-18 03:08:59.37005+00', '2022-07-26 05:50:36.698821+00', 4, 36, 'Пнр', true, false, 40, 2000, 2000, '+7 (707) 485-72-23', '2022-07-26 05:50:36.698821+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (223, 233, 42, 'Гурьевская 19', '2022-07-12 14:54:56.032881+00', '2022-07-26 05:56:14.206913+00', 4, 36, 'Ринай профилактика', true, false, 17, 0, 250000, '+7 (700) 251-30-59', '2022-07-26 05:56:14.206913+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (138, 136, 42, 'Ботан саламатова 14', '2022-05-12 04:13:54.015013+00', '2022-06-23 07:00:27.473787+00', 4, 41, 'Нет гвс дорога 2000 плюс остальное ', true, false, 17, 5000, 5000, '+7 (702) 310-04-82', '2022-06-23 07:00:27.473787+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (272, 283, 42, 'Новои 12я улица д 44', '2022-09-14 07:40:24.669825+00', '2022-09-26 16:20:01.970952+00', 6, 36, 'Течёт с котла меняли сальник трехходового клапана ', true, false, 21, 0, 0, '+7 (701) 221-18-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (267, 278, 42, 'Левского 26', '2022-08-11 03:51:07.871415+00', '2022-08-11 03:51:07.871415+00', 1, 40, 'Профилактика ', true, false, 16, 0, 250000, '+7 (707) 361-33-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (263, 274, 42, 'Шалкар у.жаболы14', '2022-08-08 04:26:44.179188+00', '2022-08-11 06:59:57.43007+00', 4, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (707) 282-74-01', '2022-08-11 06:59:57.43007+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (227, 236, 42, 'Мамыр 105', '2022-07-15 15:44:04.433709+00', '2022-08-11 07:02:29.356378+00', 4, 36, 'Нет гвс  на завтра утро обязательно ', true, false, 17, 0, 50000, '+7 (707) 777-59-42', '2022-08-11 07:02:29.356378+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (255, 266, 42, 'Алгабас беласу 5', '2022-07-29 14:21:54.028214+00', '2022-07-30 07:01:11.239897+00', 3, 39, 'Пнр', true, false, 20, 0, 0, '+7 (747) 228-88-05', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (276, 287, 42, 'Алгабас куган жирау ', '2022-09-16 04:02:12.156291+00', '2022-10-02 11:08:19.884784+00', 6, 40, 'Идёт постоянная подпитка', true, false, 16, 0, 50000, '+7 (778) 308-56-57', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (295, 306, 32, 'Илийский район, пос. Отеген батыр, ул. 6 линия, 282', '2022-09-19 05:45:03.076683+00', '2022-09-19 15:20:13.280881+00', 6, 36, 'ПНР. К запуску готовы', true, false, 15, 2000, 2000, '+7 (747) 375-71-57', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (282, 293, 42, 'Вильямса 130', '2022-09-17 04:06:36.123911+00', '2022-09-17 12:09:45.725293+00', 6, 39, 'Шумит ', true, false, 16, 0, 50000, '+7 (707) 277-19-66', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (288, 299, 42, 'Орёт Жапсарбаева 7', '2022-09-17 12:11:23.798962+00', '2022-09-17 13:38:02.421153+00', 6, 36, 'Водогрейка илди нет гвс', true, false, 40, 0, 0, '+7 (701) 449-89-23', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (285, 296, 42, 'Ужет бекболата 92', '2022-09-17 07:44:37.410794+00', '2022-09-17 12:46:52.192772+00', 6, 39, 'Пнр понидельник ', true, false, 27, 0, 50000, '+7 (771) 748-71-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (297, 308, 32, 'ул. Латифа хамиди, уг. ул. Мусорского', '2022-09-19 05:48:15.400915+00', '2022-09-21 02:37:48.994259+00', 3, 39, 'ПНР ФАФ. К запуску готовы', true, false, 15, 2000, 2000, '+7 (778) 027-18-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (118, 113, 32, 'Пока не знаю', '2022-05-04 08:25:00.642806+00', '2022-05-04 09:57:44.463122+00', 4, 39, 'Не могут включить ГВС', true, false, 27, 5000, 5000, '+7 (771) 815-19-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (299, 310, 32, 'Алатауский район, мкр. Мадениет, ул. Аскар Сулейменова, 1', '2022-09-19 05:57:35.703274+00', '2022-09-19 15:22:44.387787+00', 6, 36, 'ПНР на пропан.', true, false, 15, 2000, 2000, '+7 (775) 742-41-15', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (291, 302, 42, 'Станция чемолган ', '2022-09-17 12:24:33.978307+00', '2022-09-19 06:42:25.068686+00', 6, 39, 'Пнр', true, false, 16, 4000, 4000, '+7 (707) 200-50-91', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (293, 304, 32, 'Узынагаш, село Ынтымак, ул. Оспанова, 31', '2022-09-19 05:38:52.467853+00', '2022-09-19 07:46:16.058514+00', 6, 39, 'ПНР. К запуску готовы', true, false, 40, 5000, 5000, '+7 (776) 969-31-26', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (259, 270, 42, 'Каскелен автовокзал новостройка', '2022-08-03 04:44:40.096706+00', '2022-10-02 04:32:27.194283+00', 6, 40, 'Профилактика', true, false, 16, 2000, 250002000, '+7 (775) 815-48-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (125, 119, 42, 'Ерминсай переулок 7 д 27', '2022-05-05 06:04:08.813904+00', '2022-05-18 16:51:56.523645+00', 3, 36, 'Не включается', true, false, 16, 5000, 5000, '+7 (701) 755-69-48', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (304, 314, 42, 'Бельбулак новостройка', '2022-09-23 06:02:20.171826+00', '2022-09-26 16:22:55.699746+00', 3, 36, '', true, false, 16, 2000, 2000, '+7 (702) 121-22-12', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (306, 316, 42, 'Ст. Чемолган нурлы  22а', '2022-09-23 06:18:35.033041+00', '2022-09-23 07:30:07.756525+00', 6, 36, 'Пнр', true, false, 16, 5000, 5000, '+7 (747) 727-55-63', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (113, 111, 42, 'Каскелен', '2022-05-03 06:24:15.799715+00', '2022-05-03 08:39:20.244198+00', 4, 39, '6р1', true, false, 30, 0, 0, '+7 (775) 336-77-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (147, 151, 42, 'Туздыбастау бокина 6', '2022-05-14 03:24:29.824784+00', '2022-06-24 13:27:06.131945+00', 4, 38, 'Пнр', true, false, 30, 5000, 5000, '+7 (701) 761-75-00', '2022-06-24 13:27:06.131945+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (175, 176, 42, 'Кайрат бельбулак 20', '2022-05-23 03:33:26.689993+00', '2022-06-23 07:00:39.353074+00', 4, 36, 'Уточнить проблему к 17.00', true, false, 11, 5000, 5000, '+7 (701) 728-39-20', '2022-06-23 07:00:39.353074+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (167, 168, 42, 'Борзова 32 кв1', '2022-05-18 06:26:58.248792+00', '2022-06-23 07:02:56.484486+00', 4, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (776) 189-81-89', '2022-06-23 07:02:56.484486+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (158, 160, 42, 'Туздыбастау мр. Акжарык 329', '2022-05-17 03:56:12.217881+00', '2022-06-23 07:04:20.291283+00', 4, 36, 'Течёт с котла ', true, false, 17, 5000, 5000, '+7 (707) 604-54-62', '2022-06-23 07:04:20.291283+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (166, 167, 42, 'Бесагаш ', '2022-05-18 06:18:21.433619+00', '2022-06-23 07:03:03.973848+00', 4, 36, 'Нетгвс', true, false, 11, 14000, 14000, '+7 (702) 702-34-56', '2022-06-23 07:03:03.973848+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (154, 156, 42, 'Дальневосточный 3', '2022-05-16 05:42:19.104743+00', '2022-06-23 09:01:43.3605+00', 4, 39, '108', true, false, 29, 0, 0, '+7 (701) 111-70-88', '2022-06-23 09:01:43.3605+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (172, 173, 42, 'Айтей Байконур 31', '2022-05-20 09:41:13.985617+00', '2022-06-23 07:00:59.985309+00', 4, 36, 'Не гвс вода потекла', true, false, 40, 5000, 5000, '+7 (778) 164-63-63', '2022-06-23 07:00:59.985309+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (159, 161, 42, 'Карабулак школьная 161', '2022-05-17 05:53:11.100448+00', '2022-06-23 07:04:12.106186+00', 4, 36, 'Нет гвс', true, false, 17, 5000, 5000, '+7 (707) 114-90-57', '2022-06-23 07:04:12.106186+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (80, 67, 42, 'Жасканат 286', '2022-04-18 03:26:11.92423+00', '2022-04-18 05:46:18.238522+00', 4, 36, 'Нет гвс', true, false, 16, 5000, 5000, '+7 (707) 832-16-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (161, 163, 42, 'Асылбекова 87', '2022-05-17 10:19:36.610474+00', '2022-06-23 07:03:51.77043+00', 4, 36, 'Пнр на завтро', true, false, 21, 0, 0, '+7 (707) 677-83-44', '2022-06-23 07:03:51.77043+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (168, 169, 42, 'Асылбек сыграй 93', '2022-05-20 03:13:38.275614+00', '2022-06-23 07:02:42.443639+00', 4, 36, 'Нет гвс', true, false, 16, 5000, 5000, '+7 (702) 431-51-17', '2022-06-23 07:02:42.443639+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (155, 157, 42, 'Жанайдар садукасова 1/1', '2022-05-16 08:38:38.215327+00', '2022-06-23 09:01:03.790787+00', 4, 41, 'Течёт с котла', true, false, 16, 5000, 5000, '+7 (778) 000-20-86', '2022-06-23 09:01:03.790787+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (150, 153, 42, 'Акбулак алтынден у.сатпаева1в', '2022-05-16 03:44:31.809415+00', '2022-06-23 08:55:19.077845+00', 4, 38, 'Пнр', true, false, 30, 5000, 5000, '+7 (707) 130-00-00', '2022-06-23 08:55:19.077845+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (153, 133, 32, 'ул. Монтажная, 77', '2022-05-16 05:37:20.129464+00', '2022-06-23 09:01:21.612505+00', 4, 39, 'Со слов клиента бежит сверху.', true, false, 23, 5000, 5000, '+7 (707) 717-11-35', '2022-06-23 09:01:21.612505+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (164, 166, 42, 'Иргили нурлы тан 27', '2022-05-18 04:21:17.706191+00', '2022-06-23 07:03:20.579305+00', 4, 36, 'Осмотр профилактика нет гвс на утро 19', true, false, 11, 5000, 5000, '+7 (708) 843-64-61', '2022-06-23 07:03:20.579305+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (151, 154, 42, 'Сейфулина 210', '2022-05-16 03:53:40.809635+00', '2022-05-18 17:02:45.575165+00', 3, 36, 'Пнр висит давно', true, false, 15, 0, 0, '+7 (700) 400-19-64', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (152, 155, 42, 'Узынагаш жестокая 103', '2022-05-16 03:57:59.973278+00', '2022-05-18 17:03:36.86223+00', 3, 36, 'Неисправно работает', true, false, 15, 5000, 5000, '+7 (777) 971-20-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (191, 191, 42, 'Садовникова 29', '2022-06-27 08:28:57.599535+00', '2022-07-04 03:32:05.586292+00', 4, 40, 'Пнр ждёт ', true, false, 40, 0, 0, '+7 (747) 212-64-07', '2022-07-04 03:32:05.586292+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (160, 162, 42, 'Затаевича 51', '2022-05-17 09:21:14.028245+00', '2022-06-23 07:04:04.389076+00', 4, 39, 'Пнр', true, false, 28, 5000, 5000, '+7 (701) 930-99-88', '2022-06-23 07:04:04.389076+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (148, 88, 32, 'Кемертоган за БАКАД (21 квартал)', '2022-05-14 12:31:39.945904+00', '2022-06-23 09:00:39.962004+00', 4, 37, 'Отключился и не включается ТЭН', true, false, 45, 5000, 5000, '+7 (702) 626-00-00', '2022-06-23 09:00:39.962004+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (165, 167, 42, 'Бесагаш ', '2022-05-18 06:17:49.073615+00', '2022-05-18 17:05:54.018906+00', 3, 36, '', true, false, 11, 5000, 5000, '+7 (702) 702-34-56', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (157, 159, 42, 'Жангильдина 112', '2022-05-17 03:52:47.741899+00', '2022-06-23 08:54:59.5414+00', 4, 41, 'Замена основного теплообменника ремонт платы посмотреть газ. клапан', true, false, 11, 5000, 5000, '+7 (701) 755-80-35', '2022-06-23 08:54:59.5414+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (169, 170, 42, 'Каскелен абылайхана 41', '2022-05-20 03:16:49.509453+00', '2022-06-23 07:02:33.883925+00', 4, 36, 'Нет гвс ', true, false, 16, 5000, 5000, '+7 (778) 316-48-88', '2022-06-23 07:02:33.883925+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (174, 175, 42, 'Дауленова 5/42', '2022-05-23 03:30:13.726741+00', '2022-06-23 07:00:52.714711+00', 4, 36, 'Нет гвс', true, false, 11, 5000, 5000, '+7 (707) 111-93-17', '2022-06-23 07:00:52.714711+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (171, 172, 42, 'Акбота мамышулы 225', '2022-05-20 09:25:02.05735+00', '2022-06-23 07:02:18.182134+00', 4, 36, 'Пнр ждёт давно', true, false, 40, 0, 0, '+7 (707) 296-53-94', '2022-06-23 07:02:18.182134+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (156, 158, 42, 'Калкаман 2 Латифа кыдырбекова 36/1', '2022-05-16 08:42:38.826961+00', '2022-06-23 08:59:21.522281+00', 4, 36, 'Пнр', true, false, 40, 0, 0, '+7 (776) 222-00-06', '2022-06-23 08:59:21.522281+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (176, 177, 42, 'Коккайнар жангильдина 8а', '2022-05-24 02:29:33.573508+00', '2022-06-23 07:00:14.954719+00', 4, 36, 'Не вкл.', true, false, 13, 5000, 5000, '+7 (771) 493-53-89', '2022-06-23 07:00:14.954719+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (177, 178, 32, 'мкр. Нур Алатау, ул. Нурлы Байкенова, 36', '2022-05-25 02:56:44.447673+00', '2022-05-26 14:27:16.383349+00', 3, 36, 'Бежит из котла. Утечка газа на трубе. Уточнить серийник. ', true, false, 11, 5000, 5000, '+7 (702) 318-56-44', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (170, 171, 42, 'Бесагаш мамышулы 65', '2022-05-20 03:20:26.214749+00', '2022-06-23 07:02:25.775598+00', 4, 36, 'Неисправно работает', true, false, 16, 5000, 5000, '+7 (700) 088-86-09', '2022-06-23 07:02:25.775598+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (162, 164, 42, 'Кайрат общежитие', '2022-05-18 03:50:07.252679+00', '2022-06-23 07:03:43.312859+00', 4, 36, 'Не греет ', true, false, 17, 5000, 5000, '+7 (700) 992-25-27', '2022-06-23 07:03:43.312859+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (149, 152, 42, 'Весна 65 акжар', '2022-05-15 06:48:58.503773+00', '2022-06-23 09:00:09.670463+00', 4, 36, 'Нет гвс надо доехать и взять деньги', true, false, 13, 5000, 5000, '+7 (701) 321-76-77', '2022-06-23 09:00:09.670463+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (163, 165, 42, 'Долан новостройка', '2022-05-18 03:54:08.259586+00', '2022-06-23 07:03:13.283311+00', 4, 36, 'Чистка теплообменника гвс 12000', true, false, 16, 5000, 5000, '+7 (775) 818-02-64', '2022-06-23 07:03:13.283311+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (173, 174, 42, 'Боролдай', '2022-05-20 10:59:53.347571+00', '2022-06-23 07:02:07.046548+00', 4, 36, 'Чистка гвс на завтра', true, false, 40, 10000, 10000, '+7 (747) 666-80-72', '2022-06-23 07:02:07.046548+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (178, 178, 32, 'мкр. Нур Алатау, ул. Нурлы Байкенова, 36', '2022-05-26 14:59:59.093355+00', '2022-06-23 06:59:45.659178+00', 4, 39, 'Дублирую 177. Ярик передал Вите. Бежит из котла. Утечка газа на трубе. Уточнить серийник.', true, false, 11, 5000, 5000, '+7 (702) 318-56-44', '2022-06-23 06:59:45.659178+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (179, 179, 42, 'Улжан карасаз 60', '2022-05-30 03:29:39.026709+00', '2022-06-23 06:59:39.665532+00', 4, 36, 'А6 после 18.00', true, false, 16, 5000, 5000, '+7 (707) 329-16-24', '2022-06-23 06:59:39.665532+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (181, 181, 42, 'Коксай таулесыздык 103', '2022-05-30 07:53:00.321909+00', '2022-06-23 06:59:26.30578+00', 4, 36, 'А6 на завтра ', true, false, 11, 5000, 5000, '+7 (778) 794-25-09', '2022-06-23 06:59:26.30578+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (180, 180, 42, 'Кыргаулды шалкар 40', '2022-05-30 03:32:43.557991+00', '2022-06-23 06:59:32.145973+00', 4, 40, 'Не греет', true, false, 40, 5000, 5000, '+7 (771) 242-24-98', '2022-06-23 06:59:32.145973+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (182, 182, 42, 'Коктюбе', '2022-05-31 06:33:13.311778+00', '2022-06-23 06:59:11.091749+00', 4, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (777) 777-71-12', '2022-06-23 06:59:11.091749+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (85, 81, 42, 'Ахтонова 69 а', '2022-04-21 04:07:10.849512+00', '2022-04-21 05:14:40.237062+00', 4, 40, 'Пнр', true, false, 11, 0, 0, '+7 (708) 325-63-39', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (83, 75, 42, 'Каскелен жангозина 41а', '2022-04-21 03:54:31.40207+00', '2022-04-22 03:15:51.279746+00', 4, 36, 'Профилактика и трехходовой ', true, false, 16, 25000, 1150025000, '+7 (701) 767-33-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (88, 83, 42, 'Умбетали', '2022-04-21 04:39:13.500482+00', '2022-04-21 06:33:25.870443+00', 4, 36, 'Не греет', true, false, 11, 5000, 5000, '+7 (777) 045-18-68', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (204, 212, 42, 'Жамбыл жанбыла 43', '2022-07-05 04:39:15.758689+00', '2022-07-05 09:13:02.273018+00', 4, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (708) 193-84-42', '2022-07-05 09:13:02.273018+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (200, 208, 42, 'Коксай', '2022-07-04 08:38:24.772796+00', '2022-07-05 09:44:26.823175+00', 4, 36, 'А4', true, false, 16, 0, 5000, '+7 (777) 215-95-48', '2022-07-05 09:44:26.823175+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (220, 230, 42, 'Панфилов', '2022-07-11 03:23:41.387831+00', '2022-07-13 03:11:16.198633+00', 4, 36, 'Проблемы с гвс', true, false, 16, 0, 5000, '+7 (771) 862-46-32', '2022-07-13 03:11:16.198633+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (192, 192, 42, 'Акбулак перехотько 8', '2022-06-30 03:19:18.589527+00', '2022-07-04 03:31:09.892809+00', 4, 36, 'Уточнить по гарантии нет гвс А01', true, false, 20, 0, 8000, '+7 (701) 608-38-13', '2022-07-04 03:31:09.892809+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (196, 196, 42, 'Рихорда зорге 2б', '2022-06-30 06:26:56.286802+00', '2022-07-13 04:58:25.147737+00', 4, 37, 'Нет гвс проверить гарантийник вместе с Азымом', true, false, 22, 0, 5000, '+7 (747) 457-95-97', '2022-07-13 04:58:25.147737+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (208, 216, 42, 'Артемьевская 18', '2022-07-05 10:32:44.31435+00', '2022-07-07 04:23:56.173109+00', 4, 39, 'А6 чистка возможна замена газового клапана на среду', true, false, 13, 0, 492000, '+7 (777) 666-77-72', '2022-07-07 04:23:56.173109+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (212, 220, 42, 'Талгар байгазинова 45', '2022-07-07 07:00:40.068492+00', '2022-07-13 04:17:51.910416+00', 3, 36, 'Течёт с котла ', true, false, 16, 2000, 50002000, '+7 (747) 225-15-91', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (216, 224, 42, 'Туздыбастау ертарган 23', '2022-07-08 09:29:53.242709+00', '2022-07-11 03:46:05.401676+00', 4, 36, 'Неисправно работает ', true, false, 16, 0, 50000, '+7 (707) 379-38-22', '2022-07-11 03:46:05.401676+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (187, 187, 32, 'ул. Малиновая 163/1', '2022-06-21 03:23:16.18458+00', '2022-06-23 06:56:05.464657+00', 4, 39, 'Профилактика. Течь', true, false, 21, 0, 150000, '+7 (775) 205-03-95', '2022-06-23 06:56:05.464657+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (186, 186, 42, 'Айгерим 2 шолкар 12', '2022-06-15 03:57:14.196244+00', '2022-06-23 06:56:18.659235+00', 4, 36, 'А 02', true, false, 20, 0, 0, '+7 (701) 303-10-07', '2022-06-23 06:56:18.659235+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (185, 185, 42, 'Таусамалы сакебатыра 19', '2022-06-03 05:38:45.568356+00', '2022-06-23 06:59:03.19011+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (707) 458-58-92', '2022-06-23 06:59:03.19011+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (183, 183, 32, 'п. Каргаулды, ул. Коктем-2, 88А', '2022-06-02 04:27:11.717654+00', '2022-06-23 06:59:17.599898+00', 4, 39, 'Мало горячей воды. Узнать серийный номер. Котел должен быть на гарантии, но клиент предупрежден, что работа может быть платной.', true, false, 11, 5000, 5000, '+7 (707) 602-10-02', '2022-06-23 06:59:17.599898+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (184, 184, 42, 'Раимбёк суюнбая 8а', '2022-06-02 10:50:06.019178+00', '2022-06-23 06:59:58.202175+00', 4, 36, 'Не вкл.', true, false, 12, 5000, 5000, '+7 (775) 783-78-50', '2022-06-23 06:59:58.202175+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (68, 56, 42, 'Международная 41', '2022-04-14 04:32:47.687813+00', '2022-04-14 07:30:42.47827+00', 4, 39, 'Замена основного теплообменника ', true, false, 13, 5000, 59500, '+7 (778) 480-97-23', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (78, 65, 42, 'Кыргаулды дачи 6я линия', '2022-04-15 05:05:55.684035+00', '2022-04-15 12:26:06.887786+00', 4, 36, 'Трехходовой рем 0', true, false, 16, 5000, 0, '+7 (700) 264-34-75', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (73, 61, 42, 'Тумебаев жетесу 55', '2022-04-14 07:09:57.518778+00', '2022-04-14 11:39:05.912809+00', 4, 36, 'Нет вк. На сегодня ', true, false, 17, 5000, 8000, '+7 (778) 666-66-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (76, 63, 42, 'Хорошей 25', '2022-04-14 10:47:30.997968+00', '2022-04-15 17:46:30.799639+00', 4, 38, 'Пнр 17.00', true, false, 30, 5000, 5000, '+7 (707) 721-09-58', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (84, 76, 42, 'Улан 2 бертайкызы143', '2022-04-21 03:57:28.945333+00', '2022-04-22 07:28:59.606364+00', 4, 40, 'Нет гвс оценить', true, false, 16, 0, 0, '+7 (777) 095-27-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (96, 90, 32, 'Айгерим, ул. Байтерек 8а', '2022-04-26 03:47:01.233904+00', '2022-04-26 09:53:14.942079+00', 4, 39, 'К 14:00. Нет ГВС. Возможно профилактика. Узнать серийный номер.', true, false, 16, 5000, 5000, '+7 (707) 836-13-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (69, 57, 42, 'ст. Достык 67', '2022-04-14 06:31:55.88745+00', '2022-04-14 09:14:43.158252+00', 4, 40, 'Пнр', true, false, 13, 0, 0, '+7 (701) 343-73-11', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (72, 60, 32, 'г. Каскелен, ул. Кисикова, 71', '2022-04-14 06:53:53.609722+00', '2022-04-15 04:38:04.918002+00', 4, 40, 'ПНР', true, false, 40, 2000, 2000, '+7 (776) 213-86-86', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (67, 53, 32, 'мкр. Алатау, ул. Каипова, 5', '2022-04-13 07:48:11.787276+00', '2022-04-14 09:38:07.960929+00', 4, 36, 'Профилактика. Проблема с ГВС. Уточнить серийный номер', true, false, 11, 0, 25000, '+7 (777) 277-83-25', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (70, 58, 32, 'ул. Кауметова, 37', '2022-04-14 06:40:20.448847+00', '2022-04-16 05:04:25.162195+00', 4, 36, 'Ошибка 99. Чистка котла. на 15.04.2022. Уточнить серийный номер', true, false, 39, 0, 250000, '+7 (701) 774-75-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (86, 55, 42, 'Боролдай дачи', '2022-04-21 04:09:26.373859+00', '2022-04-21 09:22:09.661967+00', 4, 40, 'Пнр', true, false, 13, 0, 0, '+7 (707) 515-97-71', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (79, 66, 42, 'Бесагаш баянаулы', '2022-04-15 12:23:44.783268+00', '2022-04-16 08:14:56.237305+00', 4, 40, 'Нет гвс', true, false, 16, 5000, 5000, '+7 (701) 521-11-46', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (74, 62, 42, 'Кендала новостройка', '2022-04-14 10:19:21.563268+00', '2022-04-15 06:40:52.37226+00', 4, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (708) 943-08-90', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (90, 85, 42, 'Шимякина 256', '2022-04-22 04:17:31.179616+00', '2022-04-22 11:06:06.830082+00', 4, 36, 'Нет гвс течёт с котла возможна профилактика', true, false, 16, 5000, 5000, '+7 (707) 865-19-11', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (92, 64, 32, 'Жамбыл новострой ', '2022-04-22 11:59:51.112777+00', '2022-04-25 04:55:31.995328+00', 4, 36, 'Заявка 77 дублирую. Гремит вентилятор. +7 747 440 21 21. Дата покупки 12.10.2021', true, false, 22, 2000, 2000, '+7 (771) 606-21-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (240, 250, 42, 'Айгерим бугыты 75', '2022-07-20 06:29:25.951977+00', '2022-07-20 10:13:53.756353+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (700) 257-79-41', '2022-07-20 10:13:53.756353+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (228, 237, 42, 'Таугуль 3 нурмаханова32', '2022-07-16 03:05:18.13843+00', '2022-07-17 16:50:13.580948+00', 6, 36, 'Нет гвс', true, false, 17, 0, 0, '+7 (777) 493-92-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (236, 245, 42, 'Киз', '2022-07-19 03:20:06.60707+00', '2022-07-19 04:19:49.347338+00', 3, 39, 'Нет гвс', true, false, 13, 0, 50000, '+7 (777) 756-67-12', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (224, 234, 42, 'Гульдала', '2022-07-12 14:57:47.662742+00', '2022-09-19 15:17:07.016318+00', 3, 36, 'Нет гвс', true, false, 17, 0, 0, '+7 (707) 864-65-51', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (232, 241, 42, 'Альфараби 7', '2022-07-18 03:11:59.71219+00', '2022-07-26 05:49:58.80028+00', 4, 39, 'Пнр', true, false, 16, 5000, 5000, '+7 (705) 992-42-83', '2022-07-26 05:49:58.80028+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (252, 262, 42, 'Крылова 36', '2022-07-25 03:42:43.724726+00', '2022-08-03 04:48:13.886461+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (701) 344-78-90', '2022-08-03 04:48:13.886461+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (244, 254, 42, 'Московская 38', '2022-07-22 05:57:26.764022+00', '2022-07-25 03:44:29.867603+00', 4, 36, 'Профилактика селтик и део на завтра до обеда ', true, false, 11, 0, 150000, '+7 (777) 393-30-13', '2022-07-25 03:44:29.867603+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (248, 258, 42, 'Кемертоган', '2022-07-22 06:20:55.34236+00', '2022-07-26 05:49:08.59046+00', 4, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (707) 995-49-52', '2022-07-26 05:49:08.59046+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (256, 267, 42, 'Теректы', '2022-07-30 03:42:58.120664+00', '2022-08-03 04:51:02.786996+00', 4, 40, 'Нет гвс', true, false, 14, 0, 50000, '+7 (778) 363-05-12', '2022-08-03 04:51:02.786996+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (260, 271, 42, 'Омарова 18', '2022-08-05 05:19:36.880125+00', '2022-08-11 07:00:48.643921+00', 4, 36, 'Течёт с котла проверить гарантийник', true, false, 14, 0, 0, '+7 (701) 417-80-00', '2022-08-11 07:00:48.643921+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (264, 275, 42, 'Иргели', '2022-08-09 06:59:05.360122+00', '2022-08-11 07:00:29.938557+00', 4, 36, 'Пнр', true, false, 16, 2000, 2000, '+7 (707) 348-64-72', '2022-08-11 07:00:29.938557+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (268, 279, 42, 'Калкаман 2 Тыныбаева 7', '2022-08-11 04:22:45.490548+00', '2022-08-11 06:57:59.437411+00', 4, 40, 'Бежитвода', true, false, 16, 0, 50000, '+7 (708) 256-35-61', '2022-08-11 06:57:59.437411+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (273, 284, 32, 'пос. Абай, новостройка', '2022-09-14 11:34:24.749228+00', '2022-09-16 06:18:48.494404+00', 7, 38, 'ПНР', true, false, 33, 0, 5000, '+7 (701) 045-00-55', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (91, 86, 42, 'Карабулак кошками 57', '2022-04-22 10:56:38.822481+00', '2022-04-27 02:35:29.03189+00', 4, 40, 'Капает с котла до обеда', true, false, 16, 4000, 2000, '+7 (747) 128-19-82', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (89, 84, 42, 'Узынагаш карасай батыра 35 к 3', '2022-04-21 04:56:41.022571+00', '2022-04-22 04:54:31.404772+00', 4, 36, 'Нет гвс', true, false, 11, 5000, 5000, '+7 (701) 173-73-02', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (93, 87, 42, 'Татимбета 174', '2022-04-23 03:39:22.715057+00', '2022-04-25 04:33:56.946789+00', 4, 36, 'Гудит', true, false, 15, 5000, 5000, '+7 (777) 127-18-15', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (100, 96, 42, 'Звёздная алатау 72', '2022-04-28 10:09:35.063427+00', '2022-04-28 15:06:38.987891+00', 4, 39, '6р1  6р2', true, false, 27, 0, 0, '+7 (771) 202-22-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (94, 88, 32, 'Кемертоган за БАКАД (21 квартал)', '2022-04-23 05:09:31.328124+00', '2022-04-25 04:53:26.604835+00', 4, 37, 'Не включается. Не горит лампочка', true, false, 45, 2000, 2000, '+7 (702) 626-00-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (97, 91, 42, 'Туздыбастау м.р. Арматура Оролман35', '2022-04-27 04:02:52.407493+00', '2022-04-28 03:01:47.835695+00', 4, 40, 'Пнр', true, false, 16, 0, 0, '+7 (747) 300-02-52', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (99, 93, 42, 'Иргели казмис', '2022-04-27 09:49:14.219844+00', '2022-04-28 04:38:12.364435+00', 4, 36, 'Пнр', true, false, 15, 0, 0, '+7 (707) 938-19-10', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (103, 99, 42, 'Черкасской обороны 37', '2022-04-29 05:04:17.420236+00', '2022-04-29 12:44:12.135434+00', 4, 40, 'Не вкл', true, false, 13, 5000, 5000, '+7 (701) 748-05-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (122, 116, 42, 'Ну алатау 8я улица 15', '2022-05-05 01:51:40.607488+00', '2022-05-05 10:27:53.211522+00', 4, 36, 'Замена котла део на део 15000 с утра можно к 9.00а', true, false, 16, 5000, 5000, '+7 (777) 248-02-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (127, 121, 42, 'Кулжинский тракт75', '2022-05-06 06:56:01.264137+00', '2022-05-10 14:48:04.965149+00', 4, 36, 'А6 замена датчика ', true, false, 11, 5000, 5000, '+7 (775) 398-71-83', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (124, 118, 42, 'Казцик токтарова 1а', '2022-05-05 06:02:01.180146+00', '2022-05-05 10:28:18.494455+00', 4, 36, 'Течёт с котла три года нужна профилактика', true, false, 16, 5000, 5000, '+7 (777) 822-50-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (101, 97, 42, 'Хасе наролдная 182', '2022-04-29 03:47:28.163776+00', '2022-05-03 05:41:15.067472+00', 4, 36, 'Бежит Теплообменник 72000 не вкл остальное по факту', true, false, 18, 5000, 5000, '+7 (708) 851-33-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (119, 113, 32, 'Пока не знаю', '2022-05-04 10:03:30.141975+00', '2022-05-04 10:06:05.348468+00', 4, 39, 'Тест уведомления', true, false, 27, 0, 0, '+7 (771) 815-19-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (106, 104, 42, 'Дуйсенова153/1', '2022-05-03 04:11:52.097858+00', '2022-05-03 06:56:15.95479+00', 4, 39, 'Гудит скорей всего надо чистить', true, false, 15, 5000, 5000, '+7 (708) 630-96-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (123, 117, 42, 'Шугла дала 120', '2022-05-05 02:54:17.084386+00', '2022-05-05 12:47:02.713009+00', 4, 41, 'А4 уточнить по гарантии и профилактику ', true, false, 16, 5000, 5000, '+7 (707) 701-17-75', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (110, 108, 42, 'Таусамалы сад. Об. Саулет', '2022-05-03 04:23:54.671824+00', '2022-05-03 07:55:03.363857+00', 4, 36, 'Шумит', true, false, 15, 5000, 5000, '+7 (707) 743-59-89', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (112, 110, 42, 'Дружба алмаатинская 27а', '2022-05-03 05:40:02.122821+00', '2022-05-03 10:02:57.606934+00', 4, 38, 'Нет гвс', true, false, 17, 5000, 5000, '+7 (747) 455-38-53', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (105, 103, 42, 'Стадионная27/2', '2022-05-03 04:09:16.675746+00', '2022-05-03 11:45:20.4508+00', 4, 38, 'Неисправно работает уточнить по гарантии', true, false, 15, 0, 0, '+7 (707) 411-13-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (111, 109, 42, 'Михайловича 85', '2022-05-03 04:26:13.588142+00', '2022-05-04 01:26:20.414494+00', 4, 38, 'Течёт скотла профилактика', true, false, 17, 5000, 5000, '+7 (777) 265-87-79', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (114, 112, 42, 'Варшавский переулок 22', '2022-05-03 13:36:16.69172+00', '2022-05-04 13:11:01.560545+00', 4, 36, 'Утром Ринай замена насоса есть второй котёл ', true, false, 15, 5000, 5000, '+7 (701) 575-77-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (120, 114, 42, 'Суюнбая 571', '2022-05-04 10:24:44.425415+00', '2022-05-04 13:12:03.068177+00', 4, 36, 'Сеул течёт с котла ', true, false, 15, 5000, 5000, '+7 (776) 832-74-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (129, 123, 42, 'Бутаковка', '2022-05-06 09:45:49.477131+00', '2022-05-10 14:48:56.638518+00', 4, 36, 'На субботу нет гвс', true, false, 11, 5000, 5000, '+7 (701) 712-28-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (128, 122, 42, 'Калкаман 2 кусынова46', '2022-05-06 07:47:46.772198+00', '2022-05-11 11:30:30.405971+00', 4, 36, 'Пнр', true, false, 11, 0, 0, '+7 (701) 852-03-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (136, 134, 32, 'с. Жанатурмыс, 1-й квартал, 108 (уточнить по телефону)', '2022-05-11 08:36:38.422929+00', '2022-05-11 11:16:29.984612+00', 4, 36, 'Ошибки АА, А2, А1. Проверить в чем дело. Уточнить серийник. ', true, false, 15, 5000, 5000, '+7 (747) 987-65-46', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (139, 103, 42, 'Стадионная27/2', '2022-05-12 04:18:02.699205+00', '2022-05-12 13:50:17.803983+00', 4, 36, 'Скачет давление  узнать серийник', true, false, 40, 5000, 5000, '+7 (707) 411-13-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (135, 133, 32, 'ул. Монтажная, 77', '2022-05-11 03:49:09.323608+00', '2022-05-11 04:21:14.462798+00', 4, 39, 'Течь', true, false, 23, 0, 0, '+7 (707) 717-11-35', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (121, 115, 42, 'Кыргаулды енбекши 11/1', '2022-05-04 10:28:15.245958+00', '2022-05-10 14:44:57.825596+00', 4, 36, 'Нет гвс просит в пятницу ', true, false, 16, 5000, 5000, '+7 (777) 384-81-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (130, 124, 32, 'пос. Туздыбастау, мкр. Айжарык, ул. Кайнар, 19 (по новой алатауской трассе)', '2022-05-07 07:17:08.30259+00', '2022-05-10 14:49:26.98516+00', 4, 36, 'Ремонт 3ходового коапана (бежит)', true, false, 17, 5000, 5000, '+7 (777) 264-13-39', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (126, 120, 42, 'Костромская 42', '2022-05-06 02:11:53.847454+00', '2022-05-10 14:47:14.720951+00', 4, 36, 'Замена насоса', true, false, 11, 5000, 5000, '+7 (701) 988-84-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (132, 126, 42, 'Кательникова 30', '2022-05-10 12:15:16.510654+00', '2022-05-11 08:53:54.537634+00', 4, 36, 'Нет гвс', true, false, 16, 5000, 5000, '+7 (747) 844-60-41', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (131, 125, 42, 'Улжан 1 балалайка 59', '2022-05-10 07:41:14.653799+00', '2022-05-11 06:53:41.078605+00', 4, 36, 'Течёт с котла нужно сегодня', true, false, 12, 5000, 5000, '+7 (747) 153-07-93', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (137, 135, 42, 'Каскелен есиль 22', '2022-05-11 09:55:02.874215+00', '2022-05-11 15:43:50.583009+00', 4, 36, 'Нет гвс', true, false, 16, 5000, 5000, '+7 (702) 683-57-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (133, 127, 42, 'Коксай 8й квартал 14', '2022-05-10 12:17:30.036644+00', '2022-05-11 07:32:07.2906+00', 4, 36, 'Нет гвс', true, false, 16, 5000, 5000, '+7 (702) 473-12-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (140, 144, 42, 'Ладушки 13', '2022-05-12 06:55:08.967172+00', '2022-05-14 06:16:00.595783+00', 4, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (701) 744-72-83', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (141, 145, 42, 'Енбекши ынтымак 9а', '2022-05-12 07:12:00.965688+00', '2022-05-12 13:38:15.445782+00', 4, 41, 'Нет гвс на сегодня ждёт давно', true, false, 17, 5000, 5000, '+7 (702) 155-51-98', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (142, 146, 42, 'Таусамал 4я линия 243', '2022-05-12 07:24:55.682953+00', '2022-05-14 03:49:36.170271+00', 4, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (701) 120-30-36', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (143, 147, 42, 'Карагайлы тажиева 28', '2022-05-12 11:09:36.264572+00', '2022-05-14 04:42:21.981522+00', 4, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (701) 485-93-99', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (134, 128, 42, 'Татарка', '2022-05-11 03:48:01.495338+00', '2022-05-17 17:36:51.900577+00', 4, 36, 'На завтра профилактика утром позвонить', true, false, 30, 5000, 5000, '+7 (701) 804-43-11', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (104, 100, 42, 'Сеньжинского 3', '2022-04-29 07:56:12.754497+00', '2022-06-23 06:45:48.371749+00', 4, 40, 'Пнр', true, false, 11, 0, 0, '+7 (701) 386-00-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (145, 149, 42, 'Кораллы 9', '2022-05-13 05:31:29.227993+00', '2022-05-17 17:37:40.866966+00', 4, 36, 'Замена трехходового два котла по 32000', true, false, 18, 5000, 5000, '+7 (701) 983-30-01', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (146, 150, 42, 'Калкаман 2 орман 113', '2022-05-13 07:39:58.951792+00', '2022-05-17 17:38:02.844621+00', 4, 36, 'Нет гвс а4', true, false, 18, 5000, 5000, '+7 (777) 020-80-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (269, 280, 32, 'ул. Жумабаева, 232/20', '2022-08-23 04:08:25.877789+00', '2022-08-23 09:43:32.549596+00', 6, 39, '', true, false, 20, 0, 0, '+7 (705) 946-28-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (280, 291, 42, 'Институт ядерной  физики ', '2022-09-16 06:29:17.52416+00', '2022-09-19 15:20:45.365962+00', 6, 36, 'Пнр на понидельник', true, false, 16, 0, 0, '+7 (777) 090-80-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (188, 188, 42, 'РВ 90  Франка 9', '2022-06-24 05:00:49.156068+00', '2022-06-27 09:54:39.334844+00', 4, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (700) 495-75-25', '2022-06-27 09:54:39.334844+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (270, 281, 32, 'ул. Изгилик, 31а', '2022-08-23 04:08:43.899849+00', '2022-08-23 09:43:51.167727+00', 6, 39, '', true, false, 23, 0, 0, '+7 (707) 304-05-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (225, 186, 32, 'Айгерим 2 шалкар 12', '2022-07-14 09:57:37.953921+00', '2022-07-14 15:18:49.259311+00', 4, 37, 'Ошибка А01', true, false, 20, 0, 0, '+7 (701) 303-10-07', '2022-07-14 15:18:49.259311+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (197, 197, 42, 'Коккайнар', '2022-07-01 02:54:03.065225+00', '2022-07-04 03:26:56.46867+00', 4, 40, 'Нет гвс', true, false, 16, 2000, 23500, '+7 (776) 715-80-05', '2022-07-04 03:26:56.46867+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (253, 263, 42, 'Панфилов', '2022-07-27 06:10:34.366789+00', '2022-08-03 04:48:47.611987+00', 4, 40, 'Е1 ', true, false, 40, 2000, 50002000, '+7 (700) 353-65-85', '2022-08-03 04:48:47.611987+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (257, 268, 42, 'Калкаман 2 маулен балакая 15', '2022-08-01 07:01:06.960252+00', '2022-08-03 04:50:18.851081+00', 4, 40, 'Чистка', true, false, 16, 0, 250000, '+7 (707) 648-90-97', '2022-08-03 04:50:18.851081+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (294, 305, 32, 'СТ Родники, 501', '2022-09-19 05:42:13.014944+00', '2022-09-20 07:10:31.299469+00', 3, 39, 'ПНР. Не знаю что за котел', true, false, 11, 2000, 2000, '+7 (708) 850-09-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (201, 209, 42, 'Коянкус', '2022-07-04 08:42:42.409075+00', '2022-07-05 09:44:44.698622+00', 4, 36, 'Профилактика на вторник', true, false, 16, 0, 250000, '+7 (771) 250-04-80', '2022-07-05 09:44:44.698622+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (241, 251, 42, 'Айганым', '2022-07-20 06:31:22.944066+00', '2022-07-20 10:13:33.199996+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (707) 111-36-11', '2022-07-20 10:13:33.199996+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (205, 213, 42, 'Мейрам 47', '2022-07-05 04:42:15.487274+00', '2022-07-11 03:27:49.209564+00', 4, 40, 'Течёт с котла', true, false, 16, 0, 50000, '+7 (707) 329-07-78', '2022-07-11 03:27:49.209564+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (213, 221, 42, 'Декабристов 35/1', '2022-07-08 03:17:26.829313+00', '2022-07-11 03:43:46.570418+00', 3, 40, 'А4', true, false, 16, 0, 50000, '+7 (702) 377-77-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (233, 242, 42, 'Дулатова 33в', '2022-07-18 04:22:17.970948+00', '2022-07-21 03:15:52.269442+00', 4, 38, 'Пнр', true, false, 27, 0, 0, '+7 (701) 733-58-40', '2022-07-21 03:15:52.269442+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (237, 247, 42, 'Тюмебаев', '2022-07-19 03:23:02.487013+00', '2022-07-21 11:09:43.954047+00', 4, 36, 'Пнр', true, false, 15, 2000, 2000, '+7 (707) 479-10-49', '2022-07-21 11:09:43.954047+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (217, 225, 42, 'Посёлок жобек жолы ертаргын 23', '2022-07-08 09:34:24.382953+00', '2022-07-12 02:58:54.291666+00', 4, 40, 'Пнр', true, false, 16, 5000, 5000, '+7 (701) 823-49-46', '2022-07-12 02:58:54.291666+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (221, 231, 42, 'Ачинская 25 кв.3', '2022-07-11 04:24:50.744918+00', '2022-07-13 03:03:30.752967+00', 3, 36, 'Бьёт током возможно трехходовой ', true, false, 16, 0, 50000, '+7 (707) 181-16-66', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (193, 193, 42, 'Узынагаш баспана 33б', '2022-06-30 03:22:57.749031+00', '2022-07-13 04:13:26.570769+00', 3, 40, 'Течёт с котла', true, false, 17, 5000, 10000, '+7 (747) 538-91-33', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (298, 309, 32, 'ул. Осоавиахима, 21а', '2022-09-19 05:50:42.124947+00', '2022-09-19 15:21:59.571066+00', 6, 36, 'Селтик. Ошибка АА', true, false, 12, 3000, 50003000, '+7 (701) 033-12-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (209, 217, 42, 'Якира 17б', '2022-07-07 05:28:59.327016+00', '2022-07-13 04:18:48.91228+00', 3, 36, 'Не зажигается', true, false, 12, 0, 50000, '+7 (777) 260-90-05', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (277, 289, 42, 'Новостройка за леруа мерлен', '2022-09-16 04:26:41.013512+00', '2022-09-16 08:31:19.837379+00', 6, 39, 'Пнр нужно установить шланг газа диэлектрическую муфту и сигнализатор газа 5000 + 5000гарантия ', true, false, 30, 0, 50000, '+7 (707) 240-04-41', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (265, 276, 42, '19й кл.', '2022-08-09 07:30:08.714119+00', '2022-08-11 06:58:38.737455+00', 4, 36, 'Диагностика ', true, false, 16, 0, 50000, '+7 (777) 282-91-53', '2022-08-11 06:58:38.737455+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (249, 259, 42, ' Тюмебаева Кенесарыхана 92', '2022-07-22 08:10:58.299119+00', '2022-07-26 05:49:22.139786+00', 4, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (700) 436-10-10', '2022-07-26 05:49:22.139786+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (261, 272, 32, 'ул. Пролетарская, 6', '2022-08-05 06:40:15.716356+00', '2022-08-11 06:59:04.339514+00', 4, 40, 'Замена насоса. Уточнить серийный номер', true, false, 12, 3300, 44000, '+7 (705) 777-75-03', '2022-08-11 06:59:04.339514+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (245, 255, 42, 'Афценау 20а', '2022-07-22 06:05:44.199313+00', '2022-08-11 07:01:33.879983+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (705) 150-00-05', '2022-08-11 07:01:33.879983+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (274, 285, 42, 'Татимбета 52/1', '2022-09-16 03:54:05.439511+00', '2022-09-17 04:46:07.271402+00', 6, 36, 'Профилактика на субботу до обеда ', true, false, 16, 0, 250000, '+7 (707) 559-74-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (302, 313, 42, '19йкилометр', '2022-09-23 05:58:16.322523+00', '2022-09-23 11:37:16.726466+00', 6, 39, 'Не гарантийный а4', true, false, 16, 2000, 50002000, '+7 (707) 770-20-97', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (286, 297, 42, 'Салтыкова щедрина 6', '2022-09-17 12:00:55.879258+00', '2022-09-17 14:08:18.220976+00', 6, 39, 'Нет гвс 6р1 ', true, false, 27, 0, 0, '+7 (701) 991-11-03', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (300, 311, 32, 'Алматинская область, Жамбылский район, село Узынагаш, ул. Конаева, 24', '2022-09-19 06:02:23.422024+00', '2022-09-19 08:33:41.41493+00', 6, 39, 'Течет трехходовой клапан.', true, false, 15, 5000, 5000, '+7 (747) 638-08-83', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (292, 303, 42, 'Жамбыл Сарыбай би19 ', '2022-09-17 12:28:19.128213+00', '2022-09-19 03:03:31.210193+00', 3, 39, 'Пнр', true, false, 16, 2000, 2000, '+7 (705) 783-86-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (289, 300, 42, 'Фабричный Подгорная 4 кв. 10', '2022-09-17 12:16:02.685486+00', '2022-09-19 04:12:19.008075+00', 6, 39, 'Пнр в понедельник ', true, false, 27, 4000, 9000, '+7 (707) 046-48-28', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (296, 307, 32, 'Илийский район, с. Мухамеджан Тумебаева, ул. 50 лет победы, 235', '2022-09-19 05:46:15.847709+00', '2022-09-19 15:22:17.802678+00', 6, 36, 'ПНР', true, false, 15, 2000, 2000, '+7 (778) 940-24-86', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (229, 238, 42, 'Атамекен 178 ', '2022-07-16 03:37:17.547115+00', '2022-09-19 15:17:55.420746+00', 3, 36, 'Ринай чистка вторник до обеда ', true, false, 17, 0, 250000, '+7 (778) 422-90-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (301, 312, 42, 'Каскелен', '2022-09-23 05:09:26.160996+00', '2022-09-23 07:04:34.277109+00', 6, 39, 'Не запускается либо датчик давления или плата', true, false, 13, 2000, 50002000, '+7 (700) 400-19-64', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (305, 315, 42, 'Узынагаш кенесары хана 142', '2022-09-23 06:16:04.658002+00', '2022-09-23 08:19:59.119424+00', 6, 39, 'Пнр', true, false, 16, 5000, 5000, '+7 (778) 099-77-86', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (311, 320, 42, 'Узынагаш ', '2022-09-24 07:19:00.672194+00', '2022-09-26 16:24:04.158264+00', 6, 36, 'Плохо работает', true, false, 40, 5000, 10000, '+7 (702) 322-08-55', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (310, 319, 42, 'Каскелен новостройка', '2022-09-24 07:12:42.843214+00', '2022-09-26 16:41:02.973259+00', 3, 36, 'Пнр', true, false, 40, 2000, 2000, '+7 (747) 470-08-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (314, 322, 42, 'Таугуль ', '2022-09-26 03:46:55.691418+00', '2022-09-26 16:24:37.110385+00', 6, 36, 'А6 ', true, false, 19, 0, 50000, '+7 (707) 131-32-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (313, 321, 42, 'Село чемолган', '2022-09-24 07:21:41.626457+00', '2022-09-26 16:25:15.349053+00', 3, 36, 'Пнр', true, false, 21, 3000, 3000, '+7 (747) 842-25-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (312, 321, 42, 'Село чемолган', '2022-09-24 07:21:18.956857+00', '2022-09-27 05:31:09.243696+00', 6, 36, 'Пнр', true, false, 21, 3000, 0, '+7 (747) 842-25-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (309, 319, 42, 'Каскелен новостройка', '2022-09-24 07:12:20.441698+00', '2022-09-28 05:39:47.341902+00', 6, 36, 'Пнр', true, false, 40, 2000, 0, '+7 (747) 470-08-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (283, 294, 42, 'Каскелен Южный ', '2022-09-17 04:19:36.33073+00', '2022-09-29 09:08:21.794731+00', 6, 38, 'Пнр', true, false, 27, 2000, 50002000, '+7 (777) 429-82-45', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (308, 318, 42, 'Кайрат даулеткирея 130', '2022-09-24 07:07:21.427351+00', '2022-09-24 11:27:35.467512+00', 6, 39, 'Нет гвс', true, false, 16, 0, 100000, '+7 (701) 757-99-34', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (315, 323, 42, 'Акбулак байконырова', '2022-09-26 03:54:29.684963+00', '2022-09-26 11:31:47.726801+00', 6, 39, 'Профилактика ', true, false, 16, 0, 150000, '+7 (702) 154-66-44', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (317, 325, 42, 'Абай абдулкарима 34', '2022-09-26 04:02:16.680269+00', '2022-09-29 09:09:11.504901+00', 6, 38, 'Профилактика ', true, false, 16, 0, 150000, '+7 (702) 654-40-33', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (334, 344, 42, 'Шамолган узынбулак 18', '2022-09-27 02:25:18.408325+00', '2022-09-27 02:26:16.342207+00', 1, 40, 'Пнр', true, false, 40, 5000, 5000, '+7 (778) 108-34-51', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (335, 345, 42, 'Каскелен ', '2022-09-27 02:27:40.048144+00', '2022-09-29 08:45:58.8223+00', 6, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (747) 470-08-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (316, 324, 42, 'Национальная 19', '2022-09-26 03:58:11.585834+00', '2022-09-26 06:11:37.883437+00', 6, 39, 'Пнр', true, false, 16, 0, 0, '+7 (707) 717-74-79', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (320, 328, 42, 'Каскелен уч. 107', '2022-09-26 07:29:17.824004+00', '2022-09-26 07:29:17.824004+00', 1, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (702) 840-68-69', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (321, 329, 42, 'Кемертоган ', '2022-09-26 07:31:07.287905+00', '2022-09-26 07:31:07.287905+00', 1, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (702) 741-71-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (322, 330, 42, 'Покровский 18 кв.2', '2022-09-26 07:32:55.100422+00', '2022-09-26 07:32:55.100422+00', 1, 40, 'Пнр', true, false, 40, 0, 0, '+7 (777) 608-21-64', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (323, 331, 42, 'Кыргаулды шаумяна 9', '2022-09-26 07:35:31.034566+00', '2022-09-26 07:35:31.034566+00', 1, 40, 'Пнр', true, false, 40, 5000, 5000, '+7 (747) 598-78-43', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (324, 332, 42, 'Каскелен кайнарбулак 15/51', '2022-09-26 07:37:36.054006+00', '2022-09-26 07:37:36.054006+00', 1, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (702) 976-58-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (345, 355, 42, 'Узынагаш азербаева 149', '2022-09-27 09:52:49.069937+00', '2022-09-28 06:28:52.897566+00', 6, 40, 'Бежит вода', true, false, 16, 5000, 5000, '+7 (707) 555-48-50', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (326, 337, 42, 'Майкопская 46', '2022-09-26 08:42:24.377647+00', '2022-09-28 10:14:36.10968+00', 3, 41, 'Не вкл.', true, false, 21, 0, 0, '+7 (707) 236-27-69', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (319, 327, 42, 'Гульдала участок 566', '2022-09-26 05:20:48.084765+00', '2022-09-26 09:35:12.82412+00', 6, 39, 'Нет гвс', true, false, 21, 0, 0, '+7 (702) 488-91-01', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (329, 339, 42, 'Кемиртоган ', '2022-09-26 14:13:30.336133+00', '2022-09-28 11:38:34.894512+00', 6, 40, 'Замена трехходового 26000', true, false, 16, 0, 0, '+7 (775) 202-80-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (336, 346, 42, 'Узынагаш карасай батыра 78', '2022-09-27 02:29:30.35033+00', '2022-09-27 02:29:30.35033+00', 1, 40, 'Пнр', true, false, 40, 5000, 5000, '+7 (771) 448-38-48', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (325, 337, 42, 'Майкопская 46', '2022-09-26 08:41:58.155605+00', '2022-09-27 01:07:40.374507+00', 6, 41, 'Не вкл.', true, false, 21, 0, 0, '+7 (707) 236-27-69', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (346, 356, 42, 'Жангильдина 99а', '2022-09-28 04:11:56.59638+00', '2022-09-28 11:05:27.621344+00', 6, 36, 'Профилактика замена теплообменника ', true, false, 16, 0, 150000, '+7 (707) 223-36-60', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (333, 343, 42, 'Рауан 53', '2022-09-27 02:23:43.715525+00', '2022-10-05 10:43:25.579073+00', 6, 36, 'Нет включается ', true, false, 40, 0, 0, '+7 (707) 997-88-99', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (332, 342, 42, 'Комсомол', '2022-09-27 02:21:30.167454+00', '2022-09-27 06:58:51.262752+00', 6, 39, 'Пнр', true, false, 40, 2000, 2000, '+7 (705) 626-67-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (337, 347, 42, 'Каскелен кайнарбулак', '2022-09-27 02:31:14.009936+00', '2022-09-27 02:31:14.009936+00', 1, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (707) 505-20-06', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (338, 348, 42, 'Каскелен кайнарбулак 17', '2022-09-27 02:32:34.669552+00', '2022-09-27 02:32:34.669552+00', 1, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (702) 971-62-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (339, 349, 42, 'Каскелен кот. Гор.', '2022-09-27 02:34:16.636348+00', '2022-09-27 02:34:16.636348+00', 1, 40, 'Пнр', true, false, 40, 2000, 2000, '+7 (708) 926-92-87', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (340, 350, 42, 'Осипенко', '2022-09-27 02:36:07.470695+00', '2022-09-28 11:57:00.36567+00', 6, 36, 'Пнр среда', true, false, 16, 0, 0, '+7 (707) 907-40-46', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (348, 358, 42, 'Шалкар жобалы 14', '2022-09-28 04:30:11.861839+00', '2022-10-02 11:43:09.847159+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (707) 282-74-01', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (344, 354, 42, 'Узынагаш мажитова 8 кв.5', '2022-09-27 03:43:49.132633+00', '2022-09-29 03:41:06.596032+00', 6, 40, 'Пнр', true, false, 16, 5000, 5000, '+7 (777) 596-49-78', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (349, 359, 42, 'Туздыбастау саркиева 26', '2022-09-28 04:32:34.851445+00', '2022-10-02 05:27:35.312008+00', 3, 36, 'Пнр четверг', true, false, 20, 0, 0, '+7 (747) 154-03-52', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (330, 340, 42, 'Мочалка 6', '2022-09-27 02:17:18.217877+00', '2022-09-27 04:53:03.65173+00', 6, 39, 'Пнр', true, false, 40, 0, 0, '+7 (707) 276-25-25', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (342, 352, 42, 'Боролдай Черёмушки 3 ', '2022-09-27 02:41:26.549188+00', '2022-09-27 07:53:52.61087+00', 6, 39, 'Поднимается давление ', true, false, 16, 0, 0, '+7 (700) 500-61-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (327, 337, 42, 'Майкопская 46', '2022-09-26 08:42:57.614455+00', '2022-09-28 10:14:12.966309+00', 3, 41, 'Не вкл.', true, false, 21, 0, 0, '+7 (707) 236-27-69', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (347, 357, 42, 'Амангельды 83', '2022-09-28 04:28:22.349355+00', '2022-10-02 05:34:46.076535+00', 3, 36, 'Профилактика ', true, false, 16, 0, 250000, '+7 (707) 811-11-16', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (331, 341, 42, 'Ашибулак жетесу 45', '2022-09-27 02:19:30.316435+00', '2022-09-27 10:30:16.203525+00', 6, 39, 'Е3', true, false, 40, 2000, 2000, '+7 (707) 421-91-51', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (341, 351, 42, 'Каскелен дачи рахат', '2022-09-27 02:38:14.718991+00', '2022-09-27 11:38:35.724953+00', 6, 39, '101 очень ждёт ', true, false, 30, 2000, 2000, '+7 (700) 809-20-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (351, 361, 42, 'Каскелен гоголя125', '2022-09-28 04:35:56.943544+00', '2022-09-29 07:30:01.443838+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (707) 133-10-34', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (343, 353, 42, 'Каскелен ', '2022-09-27 03:37:07.566319+00', '2022-09-27 11:55:41.4275+00', 6, 39, 'Пнр', true, false, 27, 2000, 50002000, '+7 (707) 173-54-25', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (318, 326, 42, 'Шалкар жобалы 14', '2022-09-26 05:07:12.292653+00', '2022-09-28 05:38:04.574201+00', 3, 36, 'Нет гвс', true, false, 16, 2000, 50002000, '+7 (707) 828-74-01', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (307, 317, 42, 'Карагайлы Жана 12в', '2022-09-23 07:13:34.383639+00', '2022-10-06 07:09:14.663676+00', 6, 36, 'После скачка напряжения а2 на суботу', true, false, 11, 0, 50000, '+7 (701) 758-48-82', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (328, 338, 42, 'Айтей батыра17/1', '2022-09-26 14:09:45.008573+00', '2022-09-28 05:39:17.293217+00', 3, 36, 'Гудит', true, false, 16, 0, 50000, '+7 (776) 777-77-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (354, 365, 42, 'Монтаева', '2022-09-28 07:24:59.08039+00', '2022-09-29 12:34:51.377925+00', 6, 36, 'Пнр ', true, false, 16, 0, 0, '+7 (702) 465-59-09', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (355, 366, 42, 'Абай новостройка', '2022-09-28 07:28:39.398668+00', '2022-09-29 11:40:48.834297+00', 6, 40, 'Пнр', true, false, 16, 0, 0, '+7 (747) 200-16-86', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (356, 367, 42, 'Карасай абая 1в', '2022-09-28 07:30:42.787508+00', '2022-09-28 07:30:42.787508+00', 1, 40, 'Пнр ', true, false, 16, 0, 0, '+7 (707) 555-07-78', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (357, 368, 42, 'Абай раимбека 180', '2022-09-28 07:32:17.973505+00', '2022-09-29 12:14:33.404294+00', 6, 40, 'Пнр ', true, false, 16, 0, 0, '+7 (708) 851-15-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (358, 369, 42, 'Жалпоксай таусамалы 129', '2022-09-28 07:35:10.507476+00', '2022-10-02 11:00:51.58791+00', 6, 40, 'Нет гвс', true, false, 16, 0, 50000, '+7 (707) 147-47-35', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (359, 370, 42, 'Айгерим 2 бемберина 18 мечеть', '2022-09-28 07:39:05.849729+00', '2022-09-29 05:59:23.863903+00', 6, 36, 'Профилактика заменить полифосфат на четверг ', true, false, 16, 0, 250000, '+7 (708) 321-52-61', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (360, 371, 42, 'Каскелен кв. 17 уч 1555', '2022-09-28 07:43:39.188079+00', '2022-09-29 08:40:53.164563+00', 6, 40, 'Пнр', true, false, 56, 2000, 2000, '+7 (701) 721-38-02', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (350, 360, 42, 'Ащибулак ул2 д 15', '2022-09-28 04:34:18.268728+00', '2022-09-28 08:23:36.347204+00', 3, 39, 'Пнр', true, false, 40, 2000, 2000, '+7 (705) 138-10-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (402, 412, 42, 'Уштерек', '2022-09-30 03:51:42.265154+00', '2022-10-07 09:00:06.552606+00', 6, 40, 'Течет с котла', true, false, 16, 2000, 50002000, '+7 (708) 757-53-78', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (566, 576, 42, 'Туздыбастау ', '2022-10-12 04:25:08.515885+00', '2022-10-12 04:34:41.640694+00', 3, 39, 'Пнр', true, false, 17, 0, 0, '+7 (775) 825-19-65', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (376, 387, 32, 'Жетысуйская, 70А', '2022-09-29 05:01:33.595326+00', '2022-10-01 09:34:33.185676+00', 6, 36, 'Чистка. Суббота.  Зелёные ворота', true, false, 11, 0, 15000, '+7 (705) 333-33-25', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (363, 374, 42, 'Табаксовхоз', '2022-09-28 07:52:13.281604+00', '2022-10-03 16:10:55.210341+00', 6, 39, 'Пнр можно на субботу ', true, false, 27, 2000, 2000, '+7 (707) 771-46-36', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (381, 391, 42, 'Иргили квартал 5', '2022-09-29 14:53:28.370133+00', '2022-10-02 03:42:07.00425+00', 6, 36, 'Пнр', true, false, 55, 0, 0, '+7 (705) 410-10-10', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (365, 376, 42, 'Кыргаулды шаумяна 9', '2022-09-28 07:56:01.876586+00', '2022-09-28 07:56:01.876586+00', 1, 40, 'Не помню что сним', true, false, 55, 0, 0, '+7 (747) 598-78-43', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (366, 377, 42, 'Бесагаш каурыбай батыра 9а', '2022-09-28 07:58:41.811588+00', '2022-10-05 05:47:38.711641+00', 6, 36, 'Профилактика вторник', true, false, 16, 0, 250000, '+7 (707) 518-59-58', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (361, 372, 42, 'Исык тихи абланбаева ', '2022-09-28 07:46:52.413156+00', '2022-09-28 08:28:13.668388+00', 3, 39, 'Профилактика ', true, false, 16, 5000, 30000, '+7 (747) 248-05-61', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (353, 364, 42, 'Ашибулак  жандосова 30', '2022-09-28 07:23:04.085464+00', '2022-09-28 10:09:56.650268+00', 6, 39, 'Пнр ', true, false, 16, 2000, 2000, '+7 (707) 483-11-75', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (362, 373, 42, 'Бесагаш', '2022-09-28 07:49:02.25135+00', '2022-09-28 12:59:09.997214+00', 6, 39, 'Пнр пятница ', true, false, 27, 0, 0, '+7 (702) 705-67-65', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (384, 394, 42, 'Наурызбай ул. Алмалы 3/11', '2022-09-29 15:01:01.150209+00', '2022-10-03 10:27:03.175592+00', 6, 36, 'Пнр', true, false, 15, 0, 0, '+7 (747) 371-88-15', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (370, 381, 42, 'Аксайское ущелье с.о. солнечное уч. 23', '2022-09-29 03:57:53.913878+00', '2022-09-29 05:09:25.320637+00', 6, 39, '501', true, false, 27, 0, 0, '+7 (701) 748-06-49', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (382, 392, 42, 'Иргили квартал 5', '2022-09-29 14:55:44.08591+00', '2022-10-02 10:50:14.966673+00', 6, 40, 'Пнр', true, false, 16, 3000, 3000, '+7 (707) 239-64-87', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (371, 382, 42, 'Узынагаш таулесыздык 61', '2022-09-29 04:01:51.040058+00', '2022-10-06 08:53:39.020842+00', 6, 40, 'Пнр', true, false, 55, 5000, 5000, '+7 (771) 412-02-98', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (372, 384, 42, 'Уштерек уч.239', '2022-09-29 04:04:38.864587+00', '2022-10-01 14:38:06.812132+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (777) 112-92-62', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (368, 379, 42, 'Карасу', '2022-09-29 03:48:45.831169+00', '2022-09-29 07:45:23.072273+00', 6, 39, 'Профилактика ', true, false, 16, 0, 250000, '+7 (747) 116-57-82', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (374, 385, 42, 'Узынагаш  алгабас 85', '2022-09-29 04:08:20.553452+00', '2022-10-02 10:46:28.722447+00', 6, 40, 'Пнр', true, false, 56, 5000, 5000, '+7 (777) 224-80-16', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (375, 386, 42, 'Каскелен кокбастау 71', '2022-09-29 04:10:22.928237+00', '2022-10-02 10:54:49.660786+00', 6, 40, '', true, false, 56, 5000, 5000, '+7 (707) 554-53-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (367, 378, 42, 'Каскелен новостройка', '2022-09-29 03:45:01.917565+00', '2022-10-01 09:50:15.821556+00', 3, 38, 'Пнр', true, false, 27, 2000, 2000, '+7 (707) 850-19-94', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (386, 396, 42, 'Кемиртоган егемдик', '2022-09-29 15:07:05.021191+00', '2022-10-07 12:30:47.057019+00', 3, 36, 'Пнр', true, false, 40, 0, 0, '+7 (702) 135-22-02', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (383, 393, 42, 'Иргили темирлан', '2022-09-29 14:58:08.603576+00', '2022-10-02 05:38:53.24539+00', 6, 36, 'Пнр', true, false, 55, 0, 0, '+7 (771) 113-18-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (385, 395, 42, 'Коянкус бейбитшилик 95', '2022-09-29 15:04:17.346389+00', '2022-09-30 08:11:13.883648+00', 6, 39, 'Пнр', true, false, 15, 2000, 2000, '+7 (771) 401-09-35', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (369, 380, 42, 'Шугла жамбыла 21кв. 2', '2022-09-29 03:54:06.925529+00', '2022-09-29 09:08:40.667468+00', 6, 39, 'Профилактика ', true, false, 55, 0, 150000, '+7 (778) 954-14-72', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (364, 375, 42, 'Каскелен ', '2022-09-28 07:53:33.271727+00', '2022-09-29 09:09:34.114469+00', 6, 38, 'Пнр', true, false, 27, 2000, 2000, '+7 (702) 809-22-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (378, 388, 42, 'Кыргаулды саттикова 6', '2022-09-29 14:34:16.506447+00', '2022-10-03 08:56:08.477509+00', 6, 39, 'Пнр ппонидельник к 12.00', true, false, 27, 0, 50000, '+7 (775) 515-57-90', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (379, 389, 42, 'Туздыбастау жагдосова 57', '2022-09-29 14:42:45.254633+00', '2022-09-30 10:23:25.78761+00', 6, 36, 'Профилактика ', true, false, 16, 0, 150000, '+7 (701) 462-56-97', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (380, 390, 42, 'Сабыр шарипова 117', '2022-09-29 14:45:32.64785+00', '2022-10-01 13:15:40.243058+00', 6, 36, 'Пнр', true, false, 16, 0, 0, '+7 (701) 477-77-96', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (387, 397, 42, 'Каскелен шынбулак 43', '2022-09-29 15:09:57.572476+00', '2022-09-30 10:08:16.093335+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (708) 252-95-20', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (388, 398, 42, 'Каскелен кайнарбулак 17', '2022-09-29 15:13:02.682772+00', '2022-09-29 15:13:02.682772+00', 1, 40, 'Пнр при запуске е2', true, false, 56, 2000, 2000, '+7 (702) 971-62-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (389, 399, 42, 'Косым шариков 55', '2022-09-29 15:15:06.056498+00', '2022-09-30 05:01:11.079037+00', 6, 39, 'Не исправно работает', true, false, 16, 0, 0, '+7 (707) 714-31-32', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (390, 400, 42, 'Талгар ломоносова 13/2', '2022-09-29 15:22:52.886775+00', '2022-09-30 08:17:36.6349+00', 6, 36, 'А6 аа', true, false, 16, 2000, 2000, '+7 (701) 473-11-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (393, 403, 42, 'Туздыбастау', '2022-09-30 01:46:19.205356+00', '2022-10-01 09:40:57.603762+00', 6, 38, 'Пнр', true, false, 27, 0, 50000, '+7 (701) 761-75-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (373, 383, 32, 'ул. М. Шокая, 303', '2022-09-29 04:07:41.995428+00', '2022-09-29 16:02:50.45029+00', 6, 36, 'Бежит трехходовой. Слабо идет горячая вода. Предложить чистку. Просит до 14:00', true, false, 11, 3500, 41000, '+7 (707) 575-19-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (391, 401, 42, 'Байсерке д.м. энергетик', '2022-09-30 01:42:16.363856+00', '2022-10-01 05:04:21.721385+00', 3, 39, 'Пнр субота', true, false, 27, 2000, 50002000, '+7 (771) 123-48-03', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (392, 402, 42, 'Байсерке д.м. энергетик', '2022-09-30 01:44:24.568466+00', '2022-10-01 05:27:39.67029+00', 6, 39, 'Пнр субота', true, false, 27, 2000, 50002000, '+7 (701) 794-71-20', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (394, 404, 42, 'Рабочий паселок душанбинская 17 кв.2', '2022-09-30 01:49:09.335879+00', '2022-10-01 09:41:49.668155+00', 6, 38, 'Пнр', true, false, 27, 0, 50000, '+7 (708) 321-14-36', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (395, 405, 42, 'Ияф', '2022-09-30 01:51:56.589133+00', '2022-09-30 06:53:48.45675+00', 6, 39, 'Профилактика от15000', true, false, 27, 0, 0, '+7 (747) 104-49-59', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (396, 406, 42, 'Кошмамбет', '2022-09-30 01:53:44.658177+00', '2022-10-03 03:44:51.424956+00', 6, 38, 'Пнр субота', true, false, 27, 0, 0, '+7 (747) 548-10-46', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (397, 407, 42, 'ст. Чемолган толеби 51', '2022-09-30 03:34:32.847339+00', '2022-10-03 03:44:22.915471+00', 6, 38, 'Пнр субота', true, false, 27, 3000, 50003000, '+7 (707) 266-62-72', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (398, 408, 42, 'Абай', '2022-09-30 03:39:19.003844+00', '2022-10-01 09:41:28.443287+00', 6, 36, 'Пнр пятница субота', true, false, 21, 0, 0, '+7 (705) 222-25-11', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (399, 409, 42, 'Киз ерлекпесова 22/1', '2022-09-30 03:41:20.460126+00', '2022-10-02 04:37:04.686746+00', 6, 40, 'Пнр', true, false, 16, 0, 0, '+7 (708) 476-17-87', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (400, 410, 42, 'Кызыл кайрат розбакиева 21', '2022-09-30 03:43:45.215266+00', '2022-09-30 08:17:53.802806+00', 6, 36, 'Профилактика', true, false, 16, 2000, 250002000, '+7 (701) 373-07-15', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (401, 411, 42, 'Абай кв. 1уч. 79/2', '2022-09-30 03:46:16.812655+00', '2022-09-30 15:25:30.821663+00', 6, 40, 'Пнр', true, false, 16, 0, 0, '+7 (778) 647-98-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (421, 430, 42, 'Фабричный', '2022-10-03 04:42:11.804861+00', '2022-10-03 07:42:35.828614+00', 6, 39, 'Пнр', true, false, 27, 4000, 50004000, '+7 (747) 758-24-99', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (403, 413, 42, 'Карасаз 60', '2022-09-30 03:53:42.957249+00', '2022-10-01 06:37:54.191605+00', 6, 36, 'Профилактика на суботу до обеда', true, false, 16, 0, 250000, '+7 (707) 329-16-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (427, 436, 42, 'Ачинская 5', '2022-10-03 05:22:19.150585+00', '2022-10-03 09:22:08.065236+00', 3, 36, 'Пнр', true, false, 16, 0, 0, '+7 (701) 242-60-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (413, 422, 42, 'НурАлатау темербек козакеев 50', '2022-10-01 03:52:02.6298+00', '2022-10-01 10:54:36.358735+00', 6, 38, 'Болер 200 литров не вкл.', true, false, 27, 0, 0, '+7 (701) 227-88-33', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (430, 439, 42, 'Прижевальского 42/2', '2022-10-03 05:35:31.336069+00', '2022-10-03 08:02:52.003931+00', 6, 36, 'Пнр', true, false, 55, 0, 0, '+7 (707) 505-69-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (411, 420, 42, 'Верх. Каменка мереке 42', '2022-10-01 03:37:56.290269+00', '2022-10-01 11:27:16.508211+00', 3, 39, 'Профилактика на суботу', true, false, 11, 0, 250000, '+7 (747) 538-42-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (409, 418, 32, 'ул. Карасай батыра, 302', '2022-09-30 08:34:17.084053+00', '2022-09-30 09:42:57.590705+00', 6, 39, 'Замена насоса. Насос 58''000 тг', true, false, 12, 5000, 63000, '+7 (701) 316-73-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (404, 414, 42, 'мкр. Мадениет, ул. Молдагулова, 4', '2022-09-30 06:03:01.245487+00', '2022-09-30 15:30:14.119643+00', 6, 36, 'Бежит 3ходовой. Связаться по дате', true, false, 15, 5000, 5000, '+7 (701) 468-40-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (405, 415, 42, 'Рахат дачи', '2022-09-30 06:05:59.656509+00', '2022-10-01 14:34:49.518949+00', 6, 40, 'Профилактика продление гарантии.  Возле большего синего склада. Связаться уточнить по времени', true, false, 18, 5000, 250005000, '+7 (707) 500-51-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (377, 305, 42, 'СТ Родники, 501', '2022-09-29 08:28:17.090305+00', '2022-10-01 03:45:46.06593+00', 6, 39, 'ПНР. Должны оплатить 4000 тг (в прошлый раз не были готовы). На субботу. Созвониться заранее. Не забываем отчёт по монтажа и бланк запуска и гарантийный талон', true, false, 21, 4000, 4000, '+7 (708) 850-09-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (414, 423, 42, ' Бемберина 98/1', '2022-10-02 04:03:52.082367+00', '2022-10-02 04:03:52.082367+00', 1, 40, 'Пнр', true, false, 16, 0, 0, '+7 (701) 711-99-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (410, 419, 42, 'Байсерке солнечная 2', '2022-10-01 03:32:17.060436+00', '2022-10-01 05:52:31.436935+00', 6, 39, 'Пнр', true, false, 17, 2000, 2000, '+7 (707) 365-30-65', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (412, 421, 42, 'Балхашская 3', '2022-10-01 03:42:00.138555+00', '2022-10-01 06:37:21.668203+00', 6, 36, 'Течет с котла', true, false, 16, 0, 0, '+7 (777) 307-13-38', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (415, 424, 42, ' Сейфулина белинского', '2022-10-02 04:06:02.0694+00', '2022-10-07 16:06:59.50241+00', 6, 40, 'Нет гвс', true, false, 11, 0, 50000, '+7 (701) 158-88-87', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (352, 363, 42, 'Туздыбастау монтаева', '2022-09-28 07:20:26.433894+00', '2022-10-02 05:23:15.859086+00', 6, 36, 'Нет гвс а3', true, false, 16, 0, 50000, '+7 (700) 300-18-30', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (408, 417, 42, 'с. Ащибулак, ул. Каракат 11', '2022-09-30 07:12:12.199531+00', '2022-10-07 12:28:26.219967+00', 3, 36, 'Пнр', true, false, 11, 5000, 5000, '+7 (705) 250-50-02', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (423, 432, 42, 'Село шемолган', '2022-10-03 05:00:23.422288+00', '2022-10-04 06:42:58.84331+00', 6, 40, 'Пнр на сегодня', true, false, 17, 2000, 2000, '+7 (707) 894-33-36', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (417, 426, 42, 'Беспакова 23', '2022-10-02 06:19:21.00915+00', '2022-10-02 06:19:21.00915+00', 1, 40, 'Е2', true, false, 55, 0, 50000, '+7 (771) 708-51-63', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (418, 427, 42, 'Комсомол новостройка', '2022-10-02 06:21:56.877415+00', '2022-10-02 06:21:56.877415+00', 1, 40, 'Не включается', true, false, 55, 2000, 50002000, '+7 (705) 552-40-87', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (416, 425, 42, 'Жалпоксай таусамалы129', '2022-10-02 06:16:37.076297+00', '2022-10-02 07:54:43.834852+00', 6, 40, 'Нет гвс', true, false, 16, 0, 50000, '+7 (707) 147-47-34', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (428, 437, 42, 'Авиатора214 /1', '2022-10-03 05:24:30.347219+00', '2022-10-03 08:03:17.39878+00', 6, 36, 'Пнр', true, false, 16, 0, 0, '+7 (747) 400-75-93', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (406, 221, 42, 'Декабристов 35/1', '2022-09-30 06:16:56.741411+00', '2022-10-03 04:29:15.494955+00', 3, 39, 'Ошибка АА', true, false, 13, 5000, 5000, '+7 (702) 377-77-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (425, 434, 42, 'Улжан такежанова 59/1', '2022-10-03 05:16:10.879739+00', '2022-10-03 05:16:10.879739+00', 1, 36, 'Профилактика вторник среда', true, false, 16, 0, 0, '+7 (747) 316-89-09', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (431, 440, 42, 'Бериктас 87', '2022-10-03 05:41:34.093297+00', '2022-10-03 11:39:29.199609+00', 6, 39, 'Замена трехходового 26000 на сегодня', true, false, 13, 0, 0, '+7 (747) 525-08-58', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (426, 435, 42, 'Ачинская 5', '2022-10-03 05:21:12.274635+00', '2022-10-03 09:22:23.182062+00', 6, 36, 'Пнр', true, false, 55, 0, 0, '+7 (701) 242-60-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (435, 444, 42, 'Туздыбастау Ахмет Саркеева 26', '2022-10-03 14:13:35.827018+00', '2022-10-03 15:00:11.504109+00', 4, 41, 'F05', true, false, 23, 0, 0, '+7 (747) 154-03-52', '2022-10-03 15:00:11.504109+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (429, 438, 42, 'Шалкар ул 4 кв 67', '2022-10-03 05:26:50.580833+00', '2022-10-04 06:46:20.066357+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (747) 309-23-62', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (419, 428, 42, 'Туркебаева 153', '2022-10-03 04:30:37.499673+00', '2022-10-03 05:55:39.936465+00', 6, 39, 'Пнр', true, false, 27, 0, 0, '+7 (701) 728-07-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (437, 446, 32, 'Талгар', '2022-10-04 06:17:10.966959+00', '2022-10-04 06:55:24.289283+00', 6, 39, 'ПНР пропан', true, false, 15, 5000, 5000, '+7 (747) 148-05-44', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (432, 441, 42, 'Каменка сад.общ.наука 2 д. 124', '2022-10-03 05:49:06.51333+00', '2022-10-03 05:49:06.51333+00', 1, 38, 'Болер 200л не греет', true, false, 28, 0, 0, '+7 (775) 706-64-64', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (433, 442, 42, 'Джамиденова 3/1 аскарова', '2022-10-03 05:51:17.103347+00', '2022-10-03 05:51:17.103347+00', 1, 38, 'Болер 200л пнр немогут вкл.', true, false, 28, 0, 0, '+7 (702) 339-12-46', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (424, 433, 42, 'Таугуль 3', '2022-10-03 05:10:48.723667+00', '2022-10-05 08:51:23.122566+00', 3, 39, 'А4 аа', true, false, 13, 0, 50000, '+7 (778) 572-92-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (422, 431, 42, 'Каскелен', '2022-10-03 04:45:15.168987+00', '2022-10-03 06:04:59.811574+00', 3, 39, 'Течет с котла', true, false, 17, 2000, 50002000, '+7 (707) 358-94-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (407, 416, 42, 'Калкаман 2, Сагатова 26', '2022-09-30 07:06:24.812293+00', '2022-10-04 05:23:36.761067+00', 3, 39, 'Профилактика на вторник после обеда', true, false, 15, 5000, 20000, '+7 (705) 670-17-30', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (420, 429, 42, 'Башкирская 2', '2022-10-03 04:32:31.039248+00', '2022-10-03 06:35:54.798002+00', 6, 36, 'А6', true, false, 16, 0, 0, '+7 (770) 572-78-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (436, 445, 32, 'с. Айганым, ул. Алмерек баба, 524', '2022-10-04 06:16:03.254771+00', '2022-10-04 06:43:48.56999+00', 3, 39, 'Нет горячей воды', true, false, 15, 5000, 5000, '+7 (707) 171-03-80', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (438, 447, 32, 'Бесагаш, ул. Гагарина, 28', '2022-10-04 06:18:47.958353+00', '2022-10-04 07:52:45.62277+00', 6, 39, 'ПНР', true, false, 11, 5000, 5000, '+7 (708) 480-01-94', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (439, 448, 32, 'мкр. Таусамалы, ул. Канат, 62', '2022-10-04 06:21:49.575699+00', '2022-10-04 06:21:49.575699+00', 1, 38, 'ПНР', true, false, 15, 5000, 5000, '+7 (701) 399-11-71', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (440, 449, 32, 'СО Здоровье, новостройка', '2022-10-04 06:23:54.884862+00', '2022-10-04 06:23:54.884862+00', 1, 38, 'ПНР', true, false, 15, 5000, 5000, '+7 (707) 320-70-02', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (442, 451, 32, 'ул. Саулет, 63', '2022-10-04 06:36:26.935029+00', '2022-10-06 04:52:21.959755+00', 6, 38, 'Кажется ПНР', true, false, 40, 5000, 5000, '+7 (708) 915-33-28', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (469, 479, 32, 'Айтей, ул. Байконур, 31', '2022-10-04 08:19:33.060265+00', '2022-10-05 07:40:48.855679+00', 6, 40, 'Потекла вода с котла', true, false, 40, 5000, 5000, '+7 (778) 164-63-63', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (446, 455, 32, 'мкр. Шанырак 2, ул. Искакова, 81', '2022-10-04 06:44:30.434693+00', '2022-10-04 09:56:35.630418+00', 6, 36, 'Потекла вода. Ожидает срочно!', true, false, 15, 5000, 5000, '+7 (707) 393-58-44', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (471, 481, 42, 'Абай', '2022-10-06 04:28:03.096397+00', '2022-10-06 07:14:33.27769+00', 6, 39, 'Пнр', true, false, 27, 0, 0, '+7 (778) 396-46-61', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (450, 459, 32, 'ул. Кырмызы, 6', '2022-10-04 06:51:10.970819+00', '2022-10-06 04:52:01.720754+00', 6, 38, 'Давление воды не в норме', true, false, 15, 5000, 5000, '+7 (778) 426-14-24', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (451, 460, 32, 'Покровка, мкр Рахат, ул. Садовая, 30', '2022-10-04 06:52:37.994824+00', '2022-10-04 12:21:32.350696+00', 6, 39, 'ПНР', true, false, 15, 5000, 5000, '+7 (747) 376-47-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (466, 476, 32, 'Каскелен, новостройка коттеджный городок', '2022-10-04 08:16:46.665425+00', '2022-10-05 07:43:50.372077+00', 6, 40, 'ПНР', true, false, 40, 5000, 5000, '+7 (705) 187-73-83', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (452, 461, 32, 'Ремизовка, ул. Горный садовод, 180', '2022-10-04 06:53:31.293978+00', '2022-10-06 04:51:39.865335+00', 6, 38, 'ПНР', true, false, 15, 5000, 5000, '+7 (702) 284-32-03', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (453, 462, 32, 'пос. Булакты, ул. Жетысу, 33', '2022-10-04 06:54:31.870366+00', '2022-10-06 04:53:43.782717+00', 6, 38, 'ПНР', true, false, 15, 5000, 5000, '+7 (707) 952-53-35', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (454, 463, 32, 'ул. Дала, 2', '2022-10-04 06:55:59.332909+00', '2022-10-06 04:54:03.310789+00', 6, 38, 'ПНР', true, false, 40, 5000, 5000, '+7 (707) 775-56-48', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (445, 454, 32, 'Бурундай, мкр. Водник 3, д. 105А', '2022-10-04 06:41:41.580331+00', '2022-10-05 05:46:47.909878+00', 6, 36, 'Ошибка А5. Скорее всего глючит датчик. Детский сад. СЕГОДНЯ НУЖНО ПОПАСТЬ', true, false, 11, 5000, 5000, '+7 (701) 744-52-85', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (479, 490, 42, 'Иргили', '2022-10-06 05:08:14.54591+00', '2022-10-08 04:19:23.487196+00', 4, 40, 'Неисправно работает', true, false, 55, 0, 0, '+7 (707) 747-61-81', '2022-10-08 04:19:23.487196+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (462, 471, 32, 'ст. Чемолган, ул. Карасу, 12', '2022-10-04 07:07:56.053248+00', '2022-10-05 10:46:20.787649+00', 6, 40, 'ПНР', true, false, 15, 5000, 5000, '+7 (775) 926-29-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (464, 473, 32, 'с. Узынагаш, ул. Бабажанова, 17', '2022-10-04 07:09:29.595458+00', '2022-10-04 11:36:33.025878+00', 6, 40, 'ПНР', true, false, 15, 5000, 5000, '+7 (702) 957-34-85', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (455, 464, 32, 'мкр. Шанырак 1, ул. Утемисова, 65б', '2022-10-04 06:58:14.572805+00', '2022-10-04 14:10:46.193587+00', 3, 39, 'Ошибка А08. После 18:00', true, false, 20, 5000, 5000, '+7 (747) 392-44-50', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (460, 469, 32, 'Каскелен, ул. Карлыгаш', '2022-10-04 07:03:28.233048+00', '2022-10-07 08:56:45.537402+00', 6, 40, 'Потекла вода', true, false, 15, 5000, 5000, '+7 (707) 358-94-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (461, 470, 32, 'пос. Уштерек, ул. Аккайын, 222', '2022-10-04 07:07:08.771619+00', '2022-10-07 08:45:16.684656+00', 6, 40, 'ПНР', true, false, 15, 5000, 5000, '+7 (701) 434-89-51', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (472, 482, 42, 'Кыргаулды', '2022-10-06 04:32:18.81001+00', '2022-10-06 06:26:47.793364+00', 6, 39, 'Пнр', true, false, 55, 0, 0, '+7 (702) 747-61-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (447, 456, 32, 'мкр. Томирис', '2022-10-04 06:46:24.895995+00', '2022-10-05 06:18:46.191651+00', 3, 36, 'Шумит', true, false, 60, 5000, 5000, '+7 (747) 429-79-39', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (434, 443, 32, 'ул. Хмельницкого, 40', '2022-10-03 10:52:01.187849+00', '2022-10-04 07:53:56.560896+00', 6, 36, 'Замена трехходового клапана. Озвученная стоимость работ с запчастью 26''000 тг. Позвонить предварительно', true, false, 60, 5000, 5000, '+7 (701) 758-98-30', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (463, 472, 32, 'ст. Чемолган, пос. Колашы, ул. Коктем, 30', '2022-10-04 07:08:47.221878+00', '2022-10-06 03:39:36.388741+00', 6, 40, 'Профилактика', true, false, 15, 5000, 5000, '+7 (708) 404-66-93', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (457, 466, 32, 'Междуреченск', '2022-10-04 07:00:34.55791+00', '2022-10-04 07:59:36.60876+00', 1, 40, 'Неисправно работает', true, false, 15, 5000, 5000, '+7 (700) 783-15-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (467, 477, 32, 'Акжар, ул. Коккайнар, 16', '2022-10-04 08:17:52.710879+00', '2022-10-06 04:50:59.700732+00', 6, 38, 'Ошибка А6', true, false, 15, 5000, 5000, '+7 (705) 175-03-33', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (468, 478, 32, 'с. Узынагаш, ул. Наурызбай батыра, 230', '2022-10-04 08:18:44.117303+00', '2022-10-06 05:51:03.447156+00', 6, 40, 'Профилактика', true, false, 15, 5000, 5000, '+7 (700) 525-29-89', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (465, 474, 32, 'ст. Чемолган, ул. Дусикова, 39', '2022-10-04 07:11:49.514178+00', '2022-10-05 10:17:08.281801+00', 6, 40, 'Ошибка А5. СРОЧНО СЕГОДНЯ!', true, false, 15, 5000, 5000, '+7 (707) 674-25-55', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (443, 452, 32, 'Узынагаш', '2022-10-04 06:37:28.893477+00', '2022-10-04 10:47:28.966112+00', 6, 40, 'Ошибки А4, А5. СРОЧНО', true, false, 11, 5000, 5000, '+7 (747) 317-90-10', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (470, 480, 32, 'Суюнбая, 185б', '2022-10-04 10:21:55.483806+00', '2022-10-06 04:48:43.277594+00', 6, 38, 'ПНР двух котлов. Запуск каждого 40''000 тг. На завтра', true, false, 61, 80000, 80000, '+7 (705) 554-44-45', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (449, 458, 32, 'ул. Бердигулова, 124', '2022-10-04 06:49:54.79582+00', '2022-10-04 10:29:19.762295+00', 6, 39, 'Утечка воды', true, false, 15, 5000, 5000, '+7 (707) 778-89-94', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (458, 467, 32, 'Узынагач, Унгиртай', '2022-10-04 07:01:39.950448+00', '2022-10-04 10:53:02.249669+00', 6, 40, 'Замена трехходового клапана', true, false, 15, 5000, 5000, '+7 (775) 699-91-80', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (441, 450, 32, 'ул. Кашаубаева, 17', '2022-10-04 06:25:48.442846+00', '2022-10-04 10:30:35.235271+00', 6, 39, 'ПНР. клиент потеет. Если неошибаюсь, Бесагаш', true, false, 40, 5000, 5000, '+7 (707) 117-55-96', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (459, 468, 32, 'с. Чемолган, ул. Жайык, 31', '2022-10-04 07:02:42.682572+00', '2022-10-04 11:42:39.280025+00', 6, 40, 'Ошибка А6', true, false, 40, 5000, 5000, '+7 (707) 765-22-05', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (448, 457, 32, 'ул. Лисаковского, 253', '2022-10-04 06:48:15.317473+00', '2022-10-04 11:33:00.273307+00', 6, 39, 'Датчик давления. Капает с котла', true, false, 60, 5000, 5000, '+7 (777) 166-80-36', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (456, 465, 32, 'Ашыбулак батыр', '2022-10-04 06:59:09.927225+00', '2022-10-07 07:09:57.382683+00', 3, 36, 'Профилактика', true, false, 15, 5000, 5000, '+7 (777) 326-47-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (474, 484, 42, 'Алгабас', '2022-10-06 04:42:50.355617+00', '2022-10-06 12:29:52.404948+00', 6, 38, 'Не вкл.', true, false, 27, 0, 0, '+7 (778) 945-33-69', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (475, 485, 42, 'Ташкенская розбакиева', '2022-10-06 04:47:07.633626+00', '2022-10-06 12:29:27.365446+00', 6, 38, 'Пнр', true, false, 27, 0, 0, '+7 (701) 924-25-05', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (473, 483, 42, 'Нижняя пятилетка', '2022-10-06 04:40:19.097375+00', '2022-10-07 04:19:55.471306+00', 3, 38, 'Течет с котла', true, false, 27, 0, 0, '+7 (787) 014-55-75', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (476, 487, 42, 'Уштерек аккаин 222', '2022-10-06 04:58:43.922822+00', '2022-10-06 04:58:43.922822+00', 1, 40, 'Не вкл.', true, false, 16, 2000, 2000, '+7 (770) 143-48-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (477, 488, 42, 'Коксай 194', '2022-10-06 05:01:54.22323+00', '2022-10-06 05:01:54.22323+00', 1, 40, 'Пнр', true, false, 16, 0, 0, '+7 (775) 455-14-22', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (478, 489, 42, 'Каскелен', '2022-10-06 05:03:55.592772+00', '2022-10-06 11:14:42.70917+00', 6, 40, 'Нет гвс', true, false, 55, 2000, 2000, '+7 (778) 140-43-20', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (444, 453, 32, 'пос. Айтей, ул. Байконыр, 26', '2022-10-04 06:38:50.20366+00', '2022-10-06 05:41:58.788445+00', 6, 40, 'Неисправно работает. Клиент потеет', true, false, 15, 5000, 5000, '+7 (708) 469-52-76', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (487, 499, 42, 'Мадниет дукенбай 29', '2022-10-06 05:43:25.14677+00', '2022-10-07 12:30:10.580974+00', 3, 36, 'Перевод на пропан', true, false, 56, 0, 0, '+7 (747) 976-72-23', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (484, 494, 32, 'Акан серы', '2022-10-06 05:22:36.283967+00', '2022-10-08 04:22:05.326533+00', 4, 38, 'Греется транс и МД. Выезд/диагностика 15''000. ', true, false, 65, 0, 0, '+7 (747) 852-11-03', '2022-10-08 04:22:05.326533+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (482, 492, 42, 'Фабричный самал 14', '2022-10-06 05:18:22.719911+00', '2022-10-08 04:21:23.886139+00', 4, 40, 'Пнр', true, false, 56, 5000, 5000, '+7 (701) 904-97-34', '2022-10-08 04:21:23.886139+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (480, 87, 42, 'Татимбета 174', '2022-10-06 05:13:12.397256+00', '2022-10-08 04:19:59.171122+00', 4, 39, 'Профилактика 15000', true, false, 15, 0, 0, '+7 (777) 127-18-15', '2022-10-08 04:19:59.171122+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (515, 526, 42, 'Гульдала новостройка', '2022-10-07 14:53:47.637421+00', '2022-10-08 05:34:26.267178+00', 6, 39, 'Пнр', true, false, 27, 0, 0, '+7 (777) 272-72-42', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (497, 508, 42, 'Кыргаулды акций 74', '2022-10-07 04:14:55.65945+00', '2022-10-08 04:42:39.998914+00', 6, 39, 'Пнр', true, false, 17, 0, 0, '+7 (702) 888-87-89', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (495, 507, 42, 'Кыргаулды арасан 47', '2022-10-07 03:59:49.318288+00', '2022-10-07 05:41:07.967829+00', 3, 39, 'Пнр', true, false, 17, 0, 0, '+7 (747) 731-85-31', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (483, 493, 42, 'Айтей байконыр 26', '2022-10-06 05:21:01.260735+00', '2022-10-08 04:21:44.29942+00', 4, 40, 'Неисправно работает', true, false, 16, 2000, 2000, '+7 (708) 469-52-76', '2022-10-08 04:21:44.29942+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (502, 513, 42, 'Жулдыз сарымулдаева 3', '2022-10-07 04:33:00.900184+00', '2022-10-08 04:20:36.371564+00', 4, 36, 'Скачет давление', true, false, 16, 0, 0, '+7 (701) 218-02-72', '2022-10-08 04:20:36.371564+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (485, 497, 42, 'Ащибулак', '2022-10-06 05:31:17.339626+00', '2022-10-06 09:32:50.936717+00', 3, 39, 'Пнр', true, false, 27, 2000, 2000, '+7 (747) 427-66-51', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (486, 498, 42, 'Жанадаур малькеева 16 б', '2022-10-06 05:38:28.266108+00', '2022-10-08 04:22:41.492184+00', 4, 36, 'Е2', true, false, 56, 2000, 2000, '+7 (775) 654-28-40', '2022-10-08 04:22:41.492184+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (488, 500, 42, 'Касымбек коктобе 30', '2022-10-06 05:56:25.112533+00', '2022-10-08 04:23:15.060023+00', 4, 40, 'Профилактика', true, false, 16, 5000, 5000, '+7 (705) 157-36-40', '2022-10-08 04:23:15.060023+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (489, 501, 42, 'Астровского 6', '2022-10-06 14:00:54.290287+00', '2022-10-12 14:28:57.767758+00', 6, 36, 'Пнр', true, false, 55, 0, 0, '+7 (747) 505-05-63', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (490, 502, 42, 'Меркулова 7 кв.3', '2022-10-06 14:04:00.551789+00', '2022-10-12 14:27:55.056209+00', 6, 36, 'Пнр', true, false, 55, 0, 0, '+7 (705) 234-14-08', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (501, 512, 42, 'Туздыбастау бок на 27', '2022-10-07 04:29:27.700409+00', '2022-10-07 05:41:43.885558+00', 3, 39, 'Пнр', true, false, 16, 0, 0, '+7 (747) 833-91-01', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (493, 505, 42, 'ГРЭС карасу достык 68', '2022-10-07 03:49:11.697991+00', '2022-10-07 07:36:17.877867+00', 6, 36, 'Пнр', true, false, 17, 0, 0, '+7 (775) 919-74-34', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (516, 527, 42, 'Разумного 78а', '2022-10-07 14:56:04.69682+00', '2022-10-08 05:36:23.739281+00', 6, 39, 'Пнр', true, false, 27, 0, 0, '+7 (702) 548-95-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (503, 514, 42, 'Пестсковского 54', '2022-10-07 04:36:52.859462+00', '2022-10-07 09:58:24.36925+00', 6, 39, 'Пнр', true, false, 16, 0, 0, '+7 (778) 424-33-33', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (519, 530, 42, 'Даулеткирея 78', '2022-10-07 15:04:05.128434+00', '2022-10-11 05:45:35.710078+00', 6, 36, 'Течёт с насоса', true, false, 17, 0, 0, '+7 (700) 992-25-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (509, 520, 32, '20 линия, 62/1', '2022-10-07 05:17:37.846979+00', '2022-10-07 07:48:55.816108+00', 3, 38, 'Ошибка FH', true, false, 21, 0, 0, '+7 (777) 741-91-99', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (513, 524, 42, 'Актас дачи пенсионер', '2022-10-07 14:48:01.426477+00', '2022-10-10 07:04:24.255496+00', 6, 39, 'Пнр понидельник', true, false, 28, 3000, 8000, '+7 (705) 742-76-37', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (496, 508, 42, 'Кыргаулды акций 74', '2022-10-07 04:04:25.889384+00', '2022-10-07 04:39:52.443956+00', 3, 36, 'Пнр', true, false, 17, 0, 0, '+7 (702) 888-87-89', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (498, 509, 42, 'Бесагаш', '2022-10-07 04:19:49.001797+00', '2022-10-08 09:12:45.240304+00', 6, 39, 'Падает давление а4', true, false, 16, 0, 0, '+7 (707) 765-35-76', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (504, 515, 42, 'Карасу', '2022-10-07 04:45:35.174656+00', '2022-10-07 10:07:46.50817+00', 6, 36, 'А6', true, false, 16, 0, 0, '+7 (700) 255-50-65', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (514, 525, 42, 'Радищева 50а', '2022-10-07 14:51:07.797432+00', '2022-10-08 06:00:32.221608+00', 6, 39, 'Пнр', true, false, 27, 0, 0, '+7 (707) 203-39-26', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (494, 506, 42, 'ГРЭС карасу достык 68', '2022-10-07 03:52:13.088806+00', '2022-10-11 11:58:05.952871+00', 6, 36, 'Пнр и второй  котёл ремонт трехходового', true, false, 17, 0, 0, '+7 (708) 671-81-20', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (505, 516, 42, 'Достык акжаукент 54', '2022-10-07 04:50:21.076201+00', '2022-10-07 10:43:00.058499+00', 6, 38, 'Пнр', true, false, 56, 0, 0, '+7 (707) 356-72-09', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (510, 521, 42, 'Чемодан абиш1/1', '2022-10-07 05:25:03.009856+00', '2022-10-07 15:56:09.607386+00', 6, 40, 'Отключается', true, false, 55, 2000, 2000, '+7 (702) 480-09-03', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (511, 522, 42, 'Ингуртас курлышы 20', '2022-10-07 05:40:20.611852+00', '2022-10-07 05:40:20.611852+00', 1, 40, 'Не греет дом 100т километр', true, false, 16, 5000, 5000, '+7 (771) 452-27-73', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (512, 523, 42, 'Кокса жасулан 45', '2022-10-07 05:45:04.835697+00', '2022-10-07 15:59:13.702253+00', 6, 40, 'Пнр срочно на сегодня', true, false, 13, 0, 0, '+7 (771) 409-98-63', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (507, 518, 42, 'Каскелен', '2022-10-07 05:08:17.629319+00', '2022-10-07 08:39:02.635272+00', 6, 40, 'Нет гвс', true, false, 56, 2000, 2000, '+7 (778) 140-43-20', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (492, 504, 42, 'Жасканат баймагамбетова 51а', '2022-10-07 03:46:39.20036+00', '2022-10-12 14:30:44.229498+00', 6, 36, 'А4 А3', true, false, 17, 0, 50000, '+7 (747) 989-91-56', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (499, 510, 42, 'Туздыбастау берлинского 19', '2022-10-07 04:23:42.523522+00', '2022-10-07 09:02:41.43671+00', 6, 39, 'Пнр', true, false, 16, 0, 0, '+7 (701) 477-77-11', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (481, 491, 42, 'Касымбек', '2022-10-06 05:15:03.006545+00', '2022-10-08 04:20:57.887378+00', 4, 40, 'Пнр', true, false, 55, 5000, 5000, '+7 (707) 224-56-24', '2022-10-08 04:20:57.887378+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (508, 519, 42, 'Гульдала', '2022-10-07 05:12:44.210248+00', '2022-10-07 07:35:33.420436+00', 6, 39, 'Трехходовой', true, false, 16, 0, 0, '+7 (705) 499-70-73', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (506, 517, 42, 'Брод кого 28 кв.2', '2022-10-07 05:05:48.212197+00', '2022-10-07 09:06:49.824891+00', 6, 38, 'Пнр', true, false, 16, 0, 0, '+7 (701) 764-61-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (517, 528, 42, 'Тастыбулак сад.тв. алмазы 2/9', '2022-10-07 15:00:30.187456+00', '2022-10-12 14:30:14.441851+00', 6, 36, 'Пнр на завтра обязательно', true, false, 16, 0, 0, '+7 (707) 487-07-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (518, 529, 42, 'Лазо 8', '2022-10-07 15:02:11.019086+00', '2022-10-12 14:25:42.164026+00', 6, 36, 'Пнр', true, false, 13, 0, 0, '+7 (707) 105-23-11', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (520, 531, 42, 'Туздыбастау ', '2022-10-07 15:07:25.911252+00', '2022-10-08 10:12:35.532698+00', 6, 39, 'Плохо греет дом', true, false, 17, 0, 0, '+7 (747) 119-70-68', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (521, 532, 42, 'Коксай ', '2022-10-08 02:26:00.641625+00', '2022-10-08 09:31:28.088552+00', 6, 40, 'Пнр', true, false, 13, 0, 0, '+7 (771) 409-98-63', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (522, 533, 42, 'Киз хабибулина 12 кв.20', '2022-10-08 02:28:22.992803+00', '2022-10-10 04:11:27.465191+00', 6, 40, 'Течёт с котла возможно трехходовой ', true, false, 13, 0, 0, '+7 (707) 140-44-66', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (523, 534, 42, 'Ельтай', '2022-10-08 03:34:17.652806+00', '2022-10-10 04:05:11.75779+00', 6, 38, 'Нет гвс', true, false, 30, 2000, 2000, '+7 (708) 827-05-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (500, 511, 42, 'Бесагаш кудайбергенова12', '2022-10-07 04:26:45.706343+00', '2022-10-08 10:17:44.103144+00', 3, 39, 'Пнр', true, false, 16, 5000, 5000, '+7 (707) 796-53-76', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (540, 551, 42, 'Алабама Аксёнов 20', '2022-10-10 05:07:09.154537+00', '2022-10-10 05:07:09.154537+00', 1, 40, 'Пнр', true, false, 16, 0, 0, '+7 (701) 344-55-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (526, 537, 42, 'Салат ашимбаева36', '2022-10-08 03:47:25.845542+00', '2022-10-12 14:28:28.217012+00', 6, 36, 'Пнр сегодня обязательно', true, false, 15, 0, 0, '+7 (701) 822-50-70', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (532, 543, 42, 'Суюнбая571/1', '2022-10-10 04:14:30.594844+00', '2022-10-10 05:52:19.363423+00', 6, 39, 'Течёт с котла', true, false, 15, 0, 0, '+7 (776) 832-74-04', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (550, 560, 42, 'Алгабас акселератор 20', '2022-10-10 15:27:02.704646+00', '2022-10-10 15:27:02.704646+00', 1, 40, 'Пнр', true, false, 16, 0, 0, '+7 (701) 344-55-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (530, 541, 42, 'Алтайская трасса', '2022-10-10 04:08:20.133135+00', '2022-10-10 06:09:33.795888+00', 3, 39, 'Пнр', true, false, 30, 0, 0, '+7 (701) 345-16-82', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (524, 535, 42, 'Гульдала новостройки ', '2022-10-08 03:38:59.172962+00', '2022-10-08 07:24:57.243719+00', 6, 39, 'Пнр', true, false, 30, 0, 0, '+7 (747) 506-59-18', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (527, 538, 42, 'Гульдала', '2022-10-08 03:55:34.057608+00', '2022-10-08 08:10:20.815424+00', 6, 39, ' Поменять жилеты на природный газ сказал 5000', true, false, 13, 5000, 5000, '+7 (747) 565-47-73', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (536, 547, 42, 'Бесагаш тайгашева 6', '2022-10-10 04:38:23.509718+00', '2022-10-10 11:58:57.885876+00', 6, 39, 'Пнр', true, false, 56, 0, 0, '+7 (705) 290-18-08', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (551, 561, 42, 'Узынагаш токкулова 52', '2022-10-10 15:29:20.188077+00', '2022-10-11 15:54:03.923207+00', 6, 40, 'Профилактика', true, false, 16, 5000, 5000, '+7 (708) 190-63-16', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (539, 550, 42, '19й км. Желтоксан 77', '2022-10-10 05:05:12.199929+00', '2022-10-10 08:08:10.532237+00', 2, 40, 'Нет гвс', true, false, 16, 2000, 2000, '+7 (708) 230-32-15', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (531, 542, 42, 'Жанадаур тастарханова 41', '2022-10-10 04:10:39.10145+00', '2022-10-10 04:15:03.28607+00', 1, 38, 'Пнр', true, false, 17, 2000, 2000, '+7 (702) 561-01-62', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (528, 539, 42, 'Алмалы 99/1', '2022-10-08 04:18:41.790278+00', '2022-10-10 12:07:33.76006+00', 6, 40, 'Пнр', true, false, 16, 0, 0, '+7 (707) 487-07-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (529, 540, 42, 'Карой', '2022-10-08 04:54:44.053304+00', '2022-10-10 12:20:59.943232+00', 6, 38, 'Пнр 8000', true, false, 30, 3000, 3000, '+7 (747) 649-83-95', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (552, 562, 42, 'Каскелен кот гор омирзак 86/49кв.4', '2022-10-10 15:31:54.835426+00', '2022-10-12 11:56:33.642664+00', 6, 40, 'Не включается ', true, false, 56, 2000, 2000, '+7 (775) 846-32-53', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (537, 548, 42, 'Туздыбастау канала 6', '2022-10-10 04:42:11.31235+00', '2022-10-10 13:40:36.133846+00', 6, 39, 'Замена теплообменника', true, false, 13, 0, 0, '+7 (747) 875-80-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (535, 546, 42, 'Туздыбастау самая 2 217', '2022-10-10 04:25:26.693662+00', '2022-10-10 04:51:18.298441+00', 3, 39, 'Сломал с ростом клапан ', true, false, 12, 0, 0, '+7 (701) 789-99-09', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (543, 553, 42, 'Карасу д 20', '2022-10-10 15:09:35.109901+00', '2022-10-11 11:36:57.62011+00', 6, 39, 'Пнр', true, false, 28, 0, 0, '+7 (777) 357-49-12', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (525, 536, 42, 'Каскелен жаналык 4', '2022-10-08 03:42:35.147422+00', '2022-10-10 05:03:43.471359+00', 6, 40, 'Пнр', true, false, 56, 2000, 2000, '+7 (708) 887-74-14', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (562, 572, 42, 'Энбекши', '2022-10-12 04:16:39.64349+00', '2022-10-12 08:37:57.458195+00', 6, 39, 'Пнр', true, false, 16, 2000, 2000, '+7 (702) 404-21-42', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (544, 554, 42, 'Шимякина 128', '2022-10-10 15:11:38.441957+00', '2022-10-10 15:11:38.441957+00', 1, 39, 'Чистка пятница до обеда ', true, false, 28, 0, 0, '+7 (707) 400-01-32', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (491, 503, 32, 'п. Кендала, ул. Амангельды, 62 (район Талгара, Раздольный, остановка "Баня")', '2022-10-07 02:52:09.093831+00', '2022-10-10 09:08:52.943705+00', 6, 39, 'Пнр. К запуску готов. На субботу', true, false, 20, 0, 0, '+7 (776) 204-09-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (538, 549, 42, 'Улан', '2022-10-10 05:01:43.442435+00', '2022-10-10 10:07:34.764924+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (702) 730-99-97', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (534, 545, 42, 'Исык хан гельды', '2022-10-10 04:22:33.44368+00', '2022-10-10 10:20:20.726572+00', 6, 39, 'Профилактика 15000', true, false, 28, 5000, 5000, '+7 (777) 275-00-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (545, 555, 42, 'Конкурс именовать 92', '2022-10-10 15:14:17.357969+00', '2022-10-10 15:14:17.357969+00', 1, 38, 'Не работает сенсор ', true, false, 30, 2000, 2000, '+7 (777) 677-05-26', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (541, 552, 42, 'Байсерке Аркадия 250', '2022-10-10 06:11:02.846332+00', '2022-10-10 10:34:43.648281+00', 6, 38, 'Пнр', true, false, 28, 2000, 2000, '+7 (747) 978-54-69', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (533, 544, 42, 'Жетыген садовая 1г', '2022-10-10 04:18:10.196462+00', '2022-10-10 11:19:37.934481+00', 6, 38, 'Пнр 10000', true, false, 28, 5000, 5000, '+7 (777) 270-23-78', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (546, 556, 42, 'Ст. Чемолган ', '2022-10-10 15:17:24.059824+00', '2022-10-11 09:51:33.54579+00', 6, 38, 'Пнр', true, false, 30, 3000, 3000, '+7 (701) 674-89-00', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (547, 557, 42, 'Капчегай', '2022-10-10 15:20:24.162956+00', '2022-10-11 12:50:14.254537+00', 6, 38, 'Пнр перевод на пропан субота ', true, false, 30, 5000, 5000, '+7 (701) 713-68-34', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (556, 566, 42, 'Бесагаш кашаубаева149', '2022-10-10 15:43:52.500926+00', '2022-10-11 07:45:06.819878+00', 6, 39, 'Чистка 2 котла', true, false, 16, 0, 0, '+7 (777) 201-99-99', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (549, 559, 42, 'Жамбыл новостройка', '2022-10-10 15:24:35.182596+00', '2022-10-11 15:55:58.42201+00', 6, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (747) 126-40-57', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (553, 563, 42, 'Енбекши новостройка ', '2022-10-10 15:33:49.394965+00', '2022-10-10 15:33:49.394965+00', 1, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (702) 404-21-42', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (554, 564, 42, 'Кемертоган 8й кв,уч 11', '2022-10-10 15:36:20.539575+00', '2022-10-10 15:36:20.539575+00', 1, 40, 'Пнр', true, false, 17, 0, 0, '+7 (707) 168-43-02', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (548, 558, 42, 'Колаши макатаева 31а', '2022-10-10 15:22:35.426431+00', '2022-10-11 09:51:49.616171+00', 6, 38, 'Пнр', true, false, 56, 2000, 2000, '+7 (702) 333-76-54', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (555, 565, 42, 'Воровского 58', '2022-10-10 15:42:00.703366+00', '2022-10-11 11:03:28.341513+00', 6, 39, 'Бахает при запуске течёт с котла', true, false, 12, 0, 0, '+7 (777) 684-84-50', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (558, 568, 42, 'Туздыбастау айжарык', '2022-10-11 03:45:44.12141+00', '2022-10-11 06:01:01.263795+00', 6, 39, 'Пнр', true, false, 16, 0, 0, '+7 (775) 825-19-65', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (559, 569, 42, 'Чемолган байтурсынова 284', '2022-10-11 03:55:56.714558+00', '2022-10-11 09:28:48.394647+00', 6, 38, 'Пнр', true, false, 56, 3000, 3000, '+7 (707) 797-08-08', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (560, 570, 42, 'Узынагаш ', '2022-10-11 04:04:22.19585+00', '2022-10-11 04:04:22.19585+00', 1, 38, '101', true, false, 28, 5000, 5000, '+7 (707) 228-50-32', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (565, 575, 42, 'Талгар', '2022-10-12 04:23:40.282048+00', '2022-10-13 04:05:26.867858+00', 2, 39, 'Замена трехходового 2.50', true, false, 17, 2000, 2000, '+7 (705) 904-72-52', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (557, 567, 42, 'Туздыбастау коктейль 3', '2022-10-10 15:46:48.413008+00', '2022-10-11 05:29:08.261238+00', 6, 39, 'Е3', true, false, 56, 0, 0, '+7 (702) 029-02-34', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (561, 571, 42, 'Касина 25', '2022-10-11 04:08:05.468766+00', '2022-10-12 14:25:12.749845+00', 3, 36, 'Нет циркуляции ', true, false, 13, 0, 0, '+7 (702) 141-16-81', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (563, 573, 42, 'Тургень сатмонбая 44', '2022-10-12 04:18:53.382245+00', '2022-10-12 06:57:29.143937+00', 6, 39, 'Пнр', true, false, 16, 5000, 5000, '+7 (747) 992-52-01', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (564, 574, 42, 'Тургень ', '2022-10-12 04:20:39.355664+00', '2022-10-12 07:27:02.71553+00', 6, 39, 'Пнр', true, false, 16, 5000, 5000, '+7 (705) 965-66-55', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (569, 579, 42, 'Кошмамбет самсы 118', '2022-10-12 04:49:26.53661+00', '2022-10-12 04:49:26.53661+00', 1, 40, 'Настроить кател', true, false, 56, 3000, 3000, '+7 (778) 781-19-78', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (570, 580, 42, 'Достык акжунис 54', '2022-10-12 04:52:16.037386+00', '2022-10-12 04:52:16.037386+00', 1, 40, 'Пнр', true, false, 56, 0, 0, '+7 (707) 356-72-09', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (581, 591, 42, 'Таусамал', '2022-10-13 04:10:24.830725+00', '2022-10-13 04:10:24.830725+00', 1, 36, 'Пнр', true, false, 16, 0, 0, '+7 (701) 716-49-07', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (582, 592, 42, 'Кокозек', '2022-10-13 04:18:43.566859+00', '2022-10-13 04:18:43.566859+00', 1, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (707) 688-94-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (575, 585, 42, 'Утемисова 8', '2022-10-12 05:18:32.173662+00', '2022-10-12 05:18:32.173662+00', 1, 38, 'Пнр', true, false, 27, 0, 0, '+7 (708) 710-40-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (583, 592, 42, 'Кокозек', '2022-10-13 04:23:32.978806+00', '2022-10-13 04:23:32.978806+00', 1, 40, 'Пнр', true, false, 16, 2000, 2000, '+7 (707) 688-94-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (573, 583, 42, 'Лашин 2', '2022-10-12 05:02:53.503338+00', '2022-10-12 06:34:04.980874+00', 6, 36, 'Не греет дом', true, false, 13, 0, 0, '+7 (747) 319-11-76', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (542, 503, 32, 'п. Кендала, ул. Амангельды, 62 (район Талгара, Раздольный, остановка "Баня")', '2022-10-10 08:51:30.996837+00', '2022-10-12 07:32:46.139396+00', 6, 39, 'Замена датчика давления по гарантии.', true, false, 21, 0, 0, '+7 (776) 204-09-74', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (574, 584, 42, 'Истомина 15', '2022-10-12 05:15:29.651721+00', '2022-10-12 08:21:04.327333+00', 6, 36, 'Нет циркуляции ', true, false, 16, 0, 0, '+7 (700) 992-25-27', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (584, 593, 42, 'Карасу центральная 20', '2022-10-13 04:26:01.582+00', '2022-10-13 04:26:01.582+00', 1, 36, 'Чистка', true, false, 17, 5000, 5000, '+7 (708) 671-81-20', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (572, 582, 42, 'Рыбинская 37', '2022-10-12 04:57:07.964424+00', '2022-10-12 09:02:01.942058+00', 6, 36, 'Пнр', true, false, 13, 0, 0, '+7 (701) 788-60-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (567, 577, 42, 'ИЯФ', '2022-10-12 04:38:28.33732+00', '2022-10-12 09:04:15.495818+00', 6, 39, 'Пнр', true, false, 13, 0, 0, '+7 (705) 259-16-36', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (571, 581, 42, 'Муратбаева 53', '2022-10-12 04:55:14.775914+00', '2022-10-12 11:00:41.266392+00', 6, 36, 'Пнр', true, false, 56, 0, 0, '+7 (707) 145-48-92', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (568, 578, 42, 'Алгабес шубат 12/2', '2022-10-12 04:46:06.07104+00', '2022-10-12 11:55:49.896006+00', 6, 40, 'Чистка', true, false, 56, 0, 0, '+7 (707) 919-44-99', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (576, 586, 42, 'ГРЭС 16я лин.д 47', '2022-10-12 05:20:56.123491+00', '2022-10-12 12:08:15.417921+00', 6, 38, 'Гудит', true, false, 15, 0, 0, '+7 (747) 525-36-37', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (577, 587, 42, 'Бесагаш к.г. радуга 21', '2022-10-13 03:40:28.048713+00', '2022-10-13 03:40:28.048713+00', 1, 39, 'Аа а4', true, false, 13, 0, 0, '+7 (701) 717-17-55', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (578, 588, 42, 'Туздыбастау речная 19', '2022-10-13 03:47:39.696815+00', '2022-10-13 03:47:39.696815+00', 1, 39, 'Гудит насос', true, false, 13, 0, 0, '+7 (707) 747-02-66', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (579, 589, 42, 'Туздыбастау к.г.белауса вилодж', '2022-10-13 03:56:06.373498+00', '2022-10-13 03:56:44.04283+00', 1, 39, 'Пнр после обеда ', true, false, 30, 0, 0, '+7 (701) 345-16-82', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (580, 590, 42, 'Наваи вверх Архат уч5в', '2022-10-13 04:05:23.51574+00', '2022-10-13 04:05:23.51574+00', 1, 38, 'Пнр', true, false, 30, 0, 0, '+7 (707) 529-89-00', NULL);


--
-- Data for Name: ordersStatusHistory; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (119, 65, 1, 'ПНР', '2022-04-13 07:35:49.912523+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (120, 66, 1, 'Нет ГВС', '2022-04-13 07:45:36.071746+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (121, 67, 1, 'Профилактика. Проблема с ГВС', '2022-04-13 07:48:11.790079+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (122, 68, 1, 'Замена основного теплообменника ', '2022-04-14 04:32:47.690643+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (123, 66, 2, '', '2022-04-14 04:55:20.285973+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (124, 68, 2, '', '2022-04-14 05:12:35.687637+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (125, 69, 1, 'Пнр', '2022-04-14 06:31:55.889987+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (126, 70, 1, 'Ошибка 99. Чистка котла. на 15.04.2022. Уточнить серийный номер', '2022-04-14 06:40:20.451984+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (127, 71, 1, 'Не включается. Возможно, под замену плата управления. Уточнить серийный номер и модель котла.', '2022-04-14 06:43:26.343711+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (128, 66, 6, 'Чистка гвс', '2022-04-14 06:51:14.222709+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (129, 72, 1, 'ПНР', '2022-04-14 06:53:53.612599+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (130, 67, 2, 'Выехали', '2022-04-14 06:54:47.481026+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (131, 73, 1, 'Нет вк. На сегодня ', '2022-04-14 07:09:57.521603+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (132, 68, 6, '', '2022-04-14 07:30:42.480631+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (133, 65, 2, '', '2022-04-14 07:34:05.247234+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (134, 65, 6, '', '2022-04-14 07:34:17.961409+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (135, 71, 2, '', '2022-04-14 07:40:16.719674+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (136, 71, 7, 'Плата на ремонт ', '2022-04-14 08:44:39.851106+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (137, 69, 2, '', '2022-04-14 09:14:40.202548+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (138, 69, 6, '', '2022-04-14 09:14:43.159723+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (139, 67, 6, '', '2022-04-14 09:38:07.963153+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (140, 73, 2, '', '2022-04-14 09:46:35.714193+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (141, 74, 1, 'Пнр', '2022-04-14 10:19:21.566558+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (142, 75, 1, 'Уточнить', '2022-04-14 10:33:52.809563+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (143, 76, 1, 'Пнр 17.00', '2022-04-14 10:47:31.000779+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (144, 71, 2, '', '2022-04-14 11:03:27.553753+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (145, 71, 6, '', '2022-04-14 11:04:38.450213+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (146, 75, 3, 'Клиент сказал не приежать. Будет покупать новый котел', '2022-04-14 11:08:33.678481+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (147, 73, 6, 'Замена предохранителей все ок', '2022-04-14 11:39:05.914956+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (148, 77, 1, 'Гремит на понедельник ', '2022-04-15 04:22:21.239695+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (149, 72, 2, 'Не росттерм фаф 2''18', '2022-04-15 04:24:17.682045+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (150, 72, 6, '', '2022-04-15 04:38:04.920043+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (151, 78, 1, 'Трехходовой рем 12000 замена 32000', '2022-04-15 05:05:55.686947+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (152, 70, 7, 'Перенесен на завтра. Взять у Игоря пьезу', '2022-04-15 05:21:49.42849+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (153, 74, 2, '', '2022-04-15 06:37:03.713338+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (154, 74, 6, 'Имя Ильяс', '2022-04-15 06:40:52.374534+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (155, 78, 2, 'По гарантии ремонт 3-х и течь с дат темп гвс', '2022-04-15 10:38:20.639945+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (156, 78, 6, 'По гарантии ', '2022-04-15 11:00:57.987699+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (157, 79, 1, 'Нет гвс', '2022-04-15 12:23:44.786093+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (158, 76, 2, '', '2022-04-15 17:46:27.366521+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (159, 76, 6, '', '2022-04-15 17:46:30.801762+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (160, 70, 2, 'Чистка вентилятора и камеры сгорания без фанатизма', '2022-04-16 05:04:16.229824+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (161, 70, 6, '', '2022-04-16 05:04:25.164314+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (162, 79, 2, '', '2022-04-16 08:14:50.095574+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (163, 79, 6, 'Чистка гвс', '2022-04-16 08:14:56.239149+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (164, 80, 1, 'Нет гвс', '2022-04-18 03:26:11.927865+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (165, 81, 1, 'Нет гвс', '2022-04-18 03:29:51.398527+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (166, 77, 7, 'Недоступен', '2022-04-18 03:33:17.001667+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (167, 81, 3, 'Клиент сам сделал', '2022-04-18 03:34:47.797567+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (168, 82, 1, 'Пнр', '2022-04-18 05:02:33.955488+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (169, 80, 2, 'Чистка гвс', '2022-04-18 05:45:40.22125+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (170, 80, 6, 'Сделали 14000 взяли ', '2022-04-18 05:46:18.240709+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (171, 82, 2, '', '2022-04-19 13:07:17.505849+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (172, 82, 6, '', '2022-04-19 13:07:46.539194+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (173, 83, 1, 'Профилактика и трехходовой ', '2022-04-21 03:54:31.40495+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (174, 84, 1, 'Нет гвс оценить', '2022-04-21 03:57:28.948204+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (175, 85, 1, 'Пнр', '2022-04-21 04:07:10.852271+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (176, 86, 1, 'Пнр', '2022-04-21 04:09:26.375908+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (177, 87, 1, 'Самсунг бежит ', '2022-04-21 04:12:49.989389+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (178, 88, 1, 'Не греет', '2022-04-21 04:39:13.504458+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (179, 89, 1, 'Нет гвс', '2022-04-21 04:56:41.025105+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (180, 85, 2, '', '2022-04-21 05:14:37.83427+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (181, 85, 6, '', '2022-04-21 05:14:40.238954+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (182, 88, 2, 'Отопление не греет', '2022-04-21 06:32:46.233584+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (183, 88, 6, 'Замена 3х 37000', '2022-04-21 06:33:25.872413+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (184, 89, 2, 'Ожидаю местоположение ', '2022-04-21 06:59:33.639791+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (185, 86, 2, '', '2022-04-21 09:09:49.670213+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (186, 86, 6, '', '2022-04-21 09:22:09.663839+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (187, 83, 2, '', '2022-04-21 09:28:15.621219+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (188, 77, 2, '', '2022-04-22 03:07:01.41172+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (189, 77, 7, 'Проверка', '2022-04-22 03:07:15.422048+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (190, 83, 6, '', '2022-04-22 03:15:51.282149+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (191, 90, 1, 'Нет гвс течёт с котла возможна профилактика', '2022-04-22 04:17:31.182631+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (192, 89, 6, '', '2022-04-22 04:54:31.407129+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (193, 90, 2, '', '2022-04-22 05:01:10.391519+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (194, 77, 2, '', '2022-04-22 06:11:32.734546+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (195, 77, 3, 'Недоступен ', '2022-04-22 06:11:42.274493+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (196, 84, 2, 'Улжан 2', '2022-04-22 06:42:50.055186+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (197, 84, 6, 'Чистка гвс', '2022-04-22 07:28:59.608759+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (198, 91, 1, 'Капает с котла до обеда', '2022-04-22 10:56:38.825214+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (199, 90, 6, 'Чистка гвс замена 3х', '2022-04-22 11:06:06.832287+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (200, 92, 1, 'Заявка 77 дублирую. Гремит вентилятор. +7 747 440 21 21', '2022-04-22 11:59:51.115478+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (201, 93, 1, 'Гудит', '2022-04-23 03:39:22.717788+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (202, 93, 2, '', '2022-04-23 04:45:06.119597+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (203, 94, 1, 'Не включается. Не горит лампочка', '2022-04-23 05:09:31.3307+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (204, 94, 2, '', '2022-04-23 05:10:04.828408+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (205, 94, 6, 'Включили предохранитель, выставил терморегулятор на более низкую температуру. ТЭН стоит на БКН Sunsystem', '2022-04-23 05:11:13.265973+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (206, 93, 6, '', '2022-04-23 05:29:43.668936+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (207, 91, 2, '', '2022-04-23 05:40:57.80779+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (208, 87, 3, 'Новый котел брать будет ', '2022-04-23 05:41:33.920946+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (209, 92, 2, '', '2022-04-23 08:33:38.437879+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (210, 92, 6, 'По гарантии подложил картон', '2022-04-23 09:58:23.180359+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (211, 95, 1, 'Нет гвс', '2022-04-25 04:49:19.212955+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (212, 96, 1, 'К 14:00. Нет ГВС. Возможно профилактика. Узнать серийный номер.', '2022-04-26 03:47:01.236682+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (213, 96, 2, '', '2022-04-26 05:56:09.024877+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (214, 96, 7, 'Не поднимают трубку', '2022-04-26 06:00:27.664791+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (215, 96, 2, '', '2022-04-26 07:13:10.837694+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (216, 96, 6, '', '2022-04-26 09:53:14.944229+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (217, 91, 6, '', '2022-04-27 02:35:29.033897+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (218, 97, 1, 'Пнр', '2022-04-27 04:02:52.410261+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (219, 98, 1, '', '2022-04-27 04:04:26.732706+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (220, 99, 1, 'Пнр', '2022-04-27 09:49:14.222543+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (221, 97, 2, '', '2022-04-28 03:01:44.986071+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (222, 97, 6, '', '2022-04-28 03:01:47.837365+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (223, 98, 7, 'Назавтра', '2022-04-28 03:02:17.71646+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (224, 95, 2, '', '2022-04-28 04:35:44.363771+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (225, 95, 7, 'Передал азрета он выполнил', '2022-04-28 04:37:30.082937+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (226, 99, 2, '', '2022-04-28 04:38:09.499837+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (227, 99, 6, '', '2022-04-28 04:38:12.365799+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (228, 100, 1, '6р1  6р2', '2022-04-28 10:09:35.066122+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (229, 100, 2, '', '2022-04-28 12:20:36.996933+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (230, 100, 7, 'После 8 вечера', '2022-04-28 12:20:55.087389+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (231, 100, 2, '', '2022-04-28 15:06:26.530927+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (232, 100, 6, '', '2022-04-28 15:06:38.989928+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (233, 101, 1, 'Бежит Теплообменник 72000 не вкл остальное по факту', '2022-04-29 03:47:28.166386+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (234, 102, 1, 'Профилактика', '2022-04-29 05:02:20.864772+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (235, 103, 1, 'Не вкл', '2022-04-29 05:04:17.422251+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (236, 104, 1, 'Пнр', '2022-04-29 07:56:12.757211+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (237, 102, 2, '', '2022-04-29 10:41:43.510253+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (238, 103, 2, '', '2022-04-29 10:41:58.437138+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (239, 102, 3, 'Отказался', '2022-04-29 11:06:40.880321+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (240, 104, 2, 'Меньжинского д3', '2022-04-29 11:10:28.537539+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (241, 103, 6, 'Не работает 3ходовой. Забитый теплообменник.не работает воздухаотаодчик', '2022-04-29 12:44:12.138036+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (242, 105, 1, 'Неисправно работает уточнить по гарантии', '2022-05-03 04:09:16.680697+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (243, 106, 1, 'Гудит скорей всего надо чистить', '2022-05-03 04:11:52.100558+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (244, 107, 1, 'Шибка е3 уточнить по гарантии ', '2022-05-03 04:14:45.624835+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (245, 108, 1, 'Давление воды не в норме ростерм', '2022-05-03 04:19:01.40932+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (246, 109, 1, 'Пнр ростерм', '2022-05-03 04:20:47.568107+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (247, 110, 1, 'Шумит', '2022-05-03 04:23:54.674512+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (248, 111, 1, 'Течёт скотла профилактика', '2022-05-03 04:26:13.590687+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (249, 106, 2, '', '2022-05-03 04:42:17.643499+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (250, 112, 1, 'Нет гвс', '2022-05-03 05:40:02.125383+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (251, 101, 2, '', '2022-05-03 05:40:43.27348+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (252, 101, 6, 'Выполнил в день поступления заявки 72000.', '2022-05-03 05:41:15.069402+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (253, 113, 1, '6р1', '2022-05-03 06:24:15.802244+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (254, 106, 6, '', '2022-05-03 06:56:15.956742+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (255, 112, 2, '', '2022-05-03 07:02:12.23947+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (256, 108, 7, 'Через неделю дома нет не кого уехал в Чемкент', '2022-05-03 07:10:11.31998+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (257, 107, 7, 'В пятницу сказал наберёт ', '2022-05-03 07:12:48.858539+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (258, 113, 2, '', '2022-05-03 07:19:57.930159+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (259, 110, 2, '', '2022-05-03 07:51:38.428262+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (260, 110, 6, 'Будет звонить по поводу фероли и аристона', '2022-05-03 07:55:03.366049+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (261, 113, 6, '', '2022-05-03 08:39:20.246366+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (262, 112, 6, '', '2022-05-03 10:02:57.609048+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (263, 105, 2, '', '2022-05-03 11:45:17.94592+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (264, 105, 6, '', '2022-05-03 11:45:20.452483+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (265, 109, 7, 'Номер не существует ', '2022-05-03 13:31:38.561063+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (266, 114, 1, 'Утром Ринай замена насоса есть второй котёл ', '2022-05-03 13:36:16.694348+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (267, 111, 2, '', '2022-05-04 01:26:17.631507+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (268, 111, 6, '', '2022-05-04 01:26:20.415921+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (280, 118, 1, 'Не могут включить ГВС', '2022-05-04 08:25:00.64615+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (281, 118, 2, 'Тест', '2022-05-04 08:27:41.489249+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (282, 118, 7, '123', '2022-05-04 08:29:02.037937+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (283, 118, 2, 'asd', '2022-05-04 08:35:04.838434+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (284, 118, 7, 'asd', '2022-05-04 08:36:28.302781+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (285, 118, 2, '', '2022-05-04 08:37:08.088394+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (286, 118, 2, '', '2022-05-04 08:37:58.553997+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (287, 118, 7, 'test', '2022-05-04 08:38:33.272178+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (288, 118, 2, '', '2022-05-04 08:39:05.688087+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (289, 118, 7, 'test', '2022-05-04 08:41:08.088044+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (290, 118, 2, '123', '2022-05-04 08:41:12.487598+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (291, 118, 6, '', '2022-05-04 09:57:44.46507+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (292, 119, 1, '', '2022-05-04 10:03:30.14435+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (293, 119, 2, '', '2022-05-04 10:05:54.44301+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (294, 119, 6, '', '2022-05-04 10:06:05.350858+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (295, 120, 1, 'Сеул течёт с котла ', '2022-05-04 10:24:44.428238+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (296, 121, 1, 'Нет гвс просит в пятницу ', '2022-05-04 10:28:15.249708+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (297, 114, 2, '', '2022-05-04 13:10:10.686636+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (298, 114, 6, '1 котел Замена насоса на ринай 2 котел перебрали насос один из двух', '2022-05-04 13:11:01.562454+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (299, 120, 2, '', '2022-05-04 13:11:41.530435+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (300, 120, 6, 'На след недели на профилактику записать ', '2022-05-04 13:12:03.070173+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (301, 122, 1, 'Замена котла део на део 15000 с утра можно к 9.00а', '2022-05-05 01:51:40.610243+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (302, 123, 1, 'А4 уточнить по гарантии и профилактику ', '2022-05-05 02:54:17.087027+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (303, 124, 1, 'Течёт с котла три года нужна профилактика', '2022-05-05 06:02:01.182728+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (304, 125, 1, 'Не включается', '2022-05-05 06:04:08.816424+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (305, 125, 2, '', '2022-05-05 07:05:01.085419+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (306, 122, 2, '', '2022-05-05 10:27:02.12193+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (307, 122, 6, 'Перевесили котел заменили полифосфатный фильтр ', '2022-05-05 10:27:53.213319+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (308, 124, 2, '', '2022-05-05 10:28:11.364284+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (309, 124, 6, 'Профилактика', '2022-05-05 10:28:18.495731+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (310, 123, 2, '', '2022-05-05 11:10:21.321195+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (311, 123, 6, '', '2022-05-05 12:47:02.714836+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (312, 126, 1, 'Замена насоса', '2022-05-06 02:11:53.850192+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (313, 127, 1, 'А6 замена датчика ', '2022-05-06 06:56:01.267447+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (314, 128, 1, 'Пнр', '2022-05-06 07:47:46.77478+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (315, 129, 1, 'На субботу нет гвс', '2022-05-06 09:45:49.479668+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (316, 121, 2, '', '2022-05-06 18:09:42.717432+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (317, 130, 1, 'Ремонт 3ходового коапана (бежит)', '2022-05-07 07:17:08.305306+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (318, 131, 1, 'Течёт с котла нужно сегодня', '2022-05-10 07:41:14.656798+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (319, 132, 1, 'Нет гвс', '2022-05-10 12:15:16.51342+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (320, 133, 1, 'Нет гвс', '2022-05-10 12:17:30.039488+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (321, 121, 6, 'Профилактика выполнил в день поступления заявки ', '2022-05-10 14:44:57.827479+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (322, 126, 2, '', '2022-05-10 14:45:57.868679+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (323, 126, 6, 'Выполнил в день поступления заявки. Замена конденсатора на насосе', '2022-05-10 14:47:14.722683+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (324, 127, 2, '', '2022-05-10 14:47:31.34467+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (325, 127, 6, 'Выполнил в день поступления заявки. ', '2022-05-10 14:48:04.966906+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (326, 129, 2, '', '2022-05-10 14:48:25.82426+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (327, 129, 6, 'Выполнил в субботу ', '2022-05-10 14:48:56.640402+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (328, 130, 2, '', '2022-05-10 14:49:18.943153+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (329, 130, 6, 'Выполнил в день поступления заявки ', '2022-05-10 14:49:26.986504+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (330, 131, 2, '', '2022-05-10 14:49:50.481736+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (331, 131, 7, 'На завтра к 10:30', '2022-05-10 14:50:41.710681+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (332, 134, 1, 'На завтра профилактика утром позвонить', '2022-05-11 03:48:01.498084+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (333, 135, 1, 'Течь', '2022-05-11 03:49:09.326373+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (334, 135, 2, '', '2022-05-11 04:21:05.568657+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (335, 135, 6, '', '2022-05-11 04:21:14.464189+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (336, 131, 2, '', '2022-05-11 06:53:28.8019+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (337, 131, 6, 'Профилактика и замена 3х', '2022-05-11 06:53:41.080536+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (338, 133, 2, '', '2022-05-11 07:32:00.405345+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (339, 133, 6, 'Чистка гвс', '2022-05-11 07:32:07.29193+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (340, 136, 1, 'Ошибки АА, А2, А1. Проверить в чем дело. Уточнить серийник. ', '2022-05-11 08:36:38.425512+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (341, 132, 2, '', '2022-05-11 08:53:38.083395+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (342, 132, 6, '', '2022-05-11 08:53:54.53933+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (343, 136, 7, 'Первый раз взял мужчина сказал щас скинет местоположение и пропал Звоню берет ребенок говорит вышел', '2022-05-11 09:02:23.359186+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (344, 137, 1, 'Нет гвс', '2022-05-11 09:55:02.876771+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (345, 136, 2, 'Скинул местоположение авехали', '2022-05-11 10:21:57.599196+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (346, 136, 6, 'Денег нет на ремонт. Гарантийный талон не был предоставлен. За выезд не оплатил.', '2022-05-11 11:16:29.986551+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (347, 137, 2, '', '2022-05-11 11:29:57.755345+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (348, 128, 2, '', '2022-05-11 11:30:25.399988+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (349, 128, 6, '', '2022-05-11 11:30:30.407664+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (350, 137, 6, 'Профилактика и замена 3х', '2022-05-11 15:43:50.584845+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (351, 138, 1, 'Нет гвс дорога 2000 плюс остальное ', '2022-05-12 04:13:54.017906+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (352, 139, 1, 'Скачет давление  узнать серийник', '2022-05-12 04:18:02.701735+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (353, 140, 1, 'Пнр', '2022-05-12 06:55:08.969771+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (354, 141, 1, 'Нет гвс на сегодня ждёт давно', '2022-05-12 07:12:00.968436+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (355, 142, 1, 'Пнр', '2022-05-12 07:24:55.685025+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (356, 143, 1, 'Пнр', '2022-05-12 11:09:36.267259+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (357, 144, 1, 'Пнр', '2022-05-12 11:13:51.979601+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (358, 138, 2, '', '2022-05-12 12:44:23.711795+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (359, 138, 6, 'Котёл исправен полностью, за выезд не платят...', '2022-05-12 12:45:09.383053+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (360, 141, 2, '', '2022-05-12 13:37:58.288279+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (361, 141, 6, 'Всё исправно работает. ', '2022-05-12 13:38:15.447493+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (362, 139, 2, '', '2022-05-12 13:50:14.961815+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (363, 139, 6, '', '2022-05-12 13:50:17.805342+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (364, 134, 7, 'На субботу ', '2022-05-12 13:50:49.05338+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (365, 145, 1, 'Замена трехходового два котла по 32000', '2022-05-13 05:31:29.23101+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (366, 146, 1, 'Нет гвс а4', '2022-05-13 07:39:58.954324+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (367, 142, 2, '', '2022-05-14 02:43:03.711324+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (368, 147, 1, 'Пнр', '2022-05-14 03:24:29.827348+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (369, 142, 6, '', '2022-05-14 03:49:36.172206+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (370, 143, 2, '', '2022-05-14 03:49:53.814179+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (371, 143, 6, '', '2022-05-14 04:42:21.983448+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (372, 144, 7, 'К ПНР не готов ', '2022-05-14 05:15:36.702016+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (373, 140, 2, '', '2022-05-14 05:51:34.741398+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (374, 140, 6, '', '2022-05-14 06:16:00.597571+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (375, 148, 1, 'Отключился и не включается ТЭН', '2022-05-14 12:31:39.948646+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (376, 149, 1, 'Нет гвс надо доехать и взять деньги', '2022-05-15 06:48:58.506598+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (377, 144, 2, 'Тест', '2022-05-15 10:11:08.255411+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (378, 144, 7, 'тест', '2022-05-15 10:13:18.267173+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (379, 144, 2, '', '2022-05-15 10:14:10.677193+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (380, 144, 7, 'asd', '2022-05-15 10:17:46.182891+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (381, 144, 2, 'test', '2022-05-15 10:18:09.248569+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (382, 144, 7, 'test', '2022-05-15 10:20:08.682808+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (383, 144, 2, 'test', '2022-05-15 10:26:40.351938+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (384, 144, 7, 'test', '2022-05-15 10:26:47.162732+00', 1);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (385, 150, 1, 'Пнр', '2022-05-16 03:44:31.811587+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (386, 151, 1, 'Пнр висит давно', '2022-05-16 03:53:40.812331+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (387, 152, 1, 'Неисправно работает', '2022-05-16 03:57:59.97607+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (388, 153, 1, 'Со слов клиента бежит сверху.', '2022-05-16 05:37:20.132229+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (389, 153, 2, '', '2022-05-16 05:38:11.400252+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (390, 153, 6, '', '2022-05-16 05:38:52.261394+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (391, 154, 1, '108', '2022-05-16 05:42:19.106929+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (392, 154, 2, '', '2022-05-16 06:26:42.397242+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (393, 154, 6, '', '2022-05-16 06:27:45.426687+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (394, 155, 1, 'Течёт с котла', '2022-05-16 08:38:38.21797+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (395, 156, 1, 'Пнр', '2022-05-16 08:42:38.830288+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (396, 148, 2, '', '2022-05-16 09:57:43.02801+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (397, 148, 6, 'ТЭН оброс накипью, из-за этого перегревается. ', '2022-05-16 09:58:28.134337+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (398, 155, 2, '', '2022-05-16 11:23:44.526816+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (399, 155, 6, '', '2022-05-16 11:24:15.34132+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (400, 157, 1, 'Замена основного теплообменника ремонт платы посмотреть газ. клапан', '2022-05-17 03:52:47.744454+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (401, 158, 1, 'Течёт с котла ', '2022-05-17 03:56:12.220959+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (402, 159, 1, 'Нет гвс', '2022-05-17 05:53:11.103082+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (403, 160, 1, 'Пнр', '2022-05-17 09:21:14.030346+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (404, 160, 2, '', '2022-05-17 09:28:45.552063+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (405, 161, 1, 'Пнр на завтро', '2022-05-17 10:19:36.613311+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (406, 160, 6, '', '2022-05-17 12:44:30.627012+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (407, 134, 2, '', '2022-05-17 17:36:29.703468+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (408, 134, 6, '', '2022-05-17 17:36:51.902377+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (409, 145, 2, '', '2022-05-17 17:37:36.798624+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (410, 145, 6, '', '2022-05-17 17:37:40.86831+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (411, 146, 2, '', '2022-05-17 17:37:59.726005+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (412, 146, 6, '', '2022-05-17 17:38:02.846249+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (413, 149, 2, '', '2022-05-17 17:38:27.526911+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (414, 149, 6, '', '2022-05-17 17:38:32.799055+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (415, 158, 2, '', '2022-05-17 17:40:39.760916+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (416, 158, 6, 'Ремонт 3-х клапана 12000тг', '2022-05-17 17:41:09.403746+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (417, 159, 7, 'На завтра нету дома никого', '2022-05-17 17:42:03.8257+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (418, 162, 1, 'Не греет ', '2022-05-18 03:50:07.256061+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (419, 163, 1, 'Чистка теплообменника гвс 12000', '2022-05-18 03:54:08.262037+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (716, 232, 1, 'Пнр', '2022-07-18 03:11:59.714911+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (420, 164, 1, 'Осмотр профилактика нет гвс на утро 19', '2022-05-18 04:21:17.708839+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (421, 165, 1, '', '2022-05-18 06:17:49.07559+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (422, 166, 1, 'Нетгвс', '2022-05-18 06:18:21.436056+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (423, 167, 1, 'Пнр', '2022-05-18 06:26:58.250765+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (424, 167, 2, '', '2022-05-18 06:53:48.562147+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (425, 167, 6, '', '2022-05-18 07:27:04.307889+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (426, 157, 2, '', '2022-05-18 16:09:58.556751+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (427, 157, 6, 'Плату заменили на новую. Слабый проток, плохо греет ГВС.', '2022-05-18 16:12:11.285711+00', 41);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (428, 95, 2, '', '2022-05-18 16:49:33.278015+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (429, 95, 3, 'Передал', '2022-05-18 16:50:04.841132+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (430, 109, 2, '', '2022-05-18 16:50:40.514313+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (431, 109, 3, 'Номер не существует ', '2022-05-18 16:50:49.68536+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (432, 125, 3, 'Передал илье', '2022-05-18 16:51:56.525617+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (433, 151, 3, 'Передал азыму', '2022-05-18 17:02:45.577079+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (434, 152, 3, 'Передал азыму', '2022-05-18 17:03:36.864252+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (435, 161, 7, 'Не готов к запуску', '2022-05-18 17:04:45.372579+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (436, 165, 3, 'Заявка повторя', '2022-05-18 17:05:54.020887+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (437, 150, 2, '', '2022-05-19 01:42:04.848062+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (438, 150, 6, '', '2022-05-19 01:42:09.557085+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (439, 168, 1, 'Нет гвс', '2022-05-20 03:13:38.278376+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (440, 169, 1, 'Нет гвс ', '2022-05-20 03:16:49.512368+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (441, 170, 1, 'Неисправно работает', '2022-05-20 03:20:26.218313+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (442, 171, 1, 'Пнр ждёт давно', '2022-05-20 09:25:02.060302+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (443, 172, 1, 'Не гвс вода потекла', '2022-05-20 09:41:13.989354+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (444, 173, 1, 'Чистка гвс на завтра', '2022-05-20 10:59:53.350488+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (445, 156, 2, '', '2022-05-20 15:16:50.013385+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (446, 156, 6, '', '2022-05-20 15:16:57.074725+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (447, 159, 2, '', '2022-05-20 15:18:37.398079+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (448, 159, 6, 'За выезд не заплатили. ', '2022-05-20 15:21:33.548946+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (449, 162, 2, '', '2022-05-20 15:22:44.194972+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (450, 162, 6, '2 котла 2 чистки гвс. Одна ошибка ае замкнул датчик 30000', '2022-05-20 15:23:44.694881+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (451, 163, 2, '', '2022-05-20 15:24:26.805428+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (452, 163, 6, 'Чистка гвс замена резинки датчика протока 16000', '2022-05-20 15:24:51.750704+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (453, 164, 2, '', '2022-05-20 15:25:39.172126+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (454, 164, 6, 'Выезд диагностика 5000 будет вешать Новый котел', '2022-05-20 15:26:24.690107+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (455, 166, 2, '', '2022-05-20 15:27:06.085017+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (456, 166, 6, 'Чистка гвс 14000', '2022-05-20 15:27:21.767943+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (457, 168, 2, '', '2022-05-20 15:27:46.295981+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (458, 168, 6, '2 котла 2 читски гвс 22000', '2022-05-20 15:28:48.30577+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (459, 169, 2, '', '2022-05-20 15:29:08.903889+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (460, 169, 6, 'Печка была отключена 5000', '2022-05-20 15:29:34.050231+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (461, 170, 2, '', '2022-05-20 15:29:54.511621+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (462, 170, 6, 'Чистка газ магистрали 8000 оплатили 6000 долг.обещали в течение 4 дней оплатить', '2022-05-20 15:30:50.14788+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (463, 173, 2, '', '2022-05-22 14:54:52.910549+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (464, 173, 6, 'Чистка гвс 10000', '2022-05-22 14:55:16.180125+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (465, 174, 1, 'Нет гвс', '2022-05-23 03:30:13.729355+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (466, 175, 1, 'Уточнить проблему к 17.00', '2022-05-23 03:33:26.692779+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (467, 174, 2, '', '2022-05-23 09:23:55.015233+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (468, 174, 6, 'Чистка гвс 15000', '2022-05-23 09:24:14.694858+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (469, 176, 1, 'Не вкл.', '2022-05-24 02:29:33.576255+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (470, 171, 2, '', '2022-05-24 14:56:17.111259+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (471, 171, 6, 'Переделать дымоход ', '2022-05-24 14:57:25.096869+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (472, 172, 2, '', '2022-05-24 14:57:45.118286+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (473, 172, 6, 'Чистка гвс 12000 замена дат протока и контактора на насосыы', '2022-05-24 14:58:24.874625+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (474, 176, 2, '', '2022-05-24 14:58:48.578554+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (475, 176, 6, 'Замена насоса и предохранителей ', '2022-05-24 14:59:18.665315+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (476, 175, 2, '', '2022-05-24 14:59:41.291058+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (477, 175, 6, '', '2022-05-24 14:59:52.913116+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (478, 177, 1, 'Бежит из котла. Утечка газа на трубе. Уточнить серийник. ', '2022-05-25 02:56:44.45049+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (479, 177, 3, 'Вите передал', '2022-05-26 14:27:16.385231+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (480, 178, 1, 'Дублирую 177. Ярик передал Вите. Бежит из котла. Утечка газа на трубе. Уточнить серийник.', '2022-05-26 14:59:59.095988+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (481, 178, 2, '', '2022-05-26 15:31:28.217414+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (482, 178, 6, '', '2022-05-26 15:31:37.16951+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (483, 179, 1, 'А6 после 18.00', '2022-05-30 03:29:39.028937+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (484, 180, 1, 'Не греет', '2022-05-30 03:32:43.560581+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (485, 181, 1, 'А6 на завтра ', '2022-05-30 07:53:00.324314+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (486, 161, 2, '', '2022-05-31 04:12:42.370435+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (487, 161, 6, '', '2022-05-31 04:12:46.474546+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (488, 181, 2, '', '2022-05-31 04:13:45.700698+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (489, 182, 1, 'Пнр', '2022-05-31 06:33:13.313926+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (490, 182, 2, '', '2022-05-31 06:36:13.109285+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (491, 182, 6, '', '2022-05-31 07:42:53.49129+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (492, 179, 2, '', '2022-05-31 08:42:09.474848+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (493, 179, 6, 'Кран подачи газа был закрыт 3000', '2022-05-31 08:42:26.362331+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (494, 181, 6, 'Сигнализатор газа сработал. В течение недели обещали заплатить.', '2022-05-31 08:43:23.724284+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (495, 180, 7, 'Азыму передал', '2022-05-31 08:43:47.55375+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (496, 183, 1, 'Мало горячей воды. Узнать серийный номер. Котел должен быть на гарантии, но клиент предупрежден, что работа может быть платной.', '2022-06-02 04:27:11.720901+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (497, 183, 2, '', '2022-06-02 07:40:52.76342+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (498, 183, 6, '', '2022-06-02 10:05:24.687125+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (499, 184, 1, 'Не вкл.', '2022-06-02 10:50:06.021927+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (500, 185, 1, 'Пнр', '2022-06-03 05:38:45.570873+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (501, 186, 1, 'А 02', '2022-06-15 03:57:14.198904+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (502, 187, 1, 'Профилактика. Течь', '2022-06-21 03:23:16.187111+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (503, 187, 2, '', '2022-06-21 03:29:17.37826+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (504, 187, 6, '', '2022-06-21 09:17:18.165229+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (505, 186, 2, '', '2022-06-23 06:43:02.999617+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (506, 186, 6, 'Зачистил датчик пламени и выполнил зазор ', '2022-06-23 06:43:45.762304+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (507, 185, 2, '', '2022-06-23 06:44:05.719575+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (508, 185, 6, '', '2022-06-23 06:44:08.90306+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (509, 184, 2, '', '2022-06-23 06:44:24.623791+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (510, 184, 6, 'Замена предохранителей 8000', '2022-06-23 06:44:49.80378+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (511, 98, 2, '', '2022-06-23 06:45:07.078298+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (512, 144, 2, '', '2022-06-23 06:45:17.305474+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (513, 98, 3, 'Старая заявка', '2022-06-23 06:45:23.012421+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (514, 104, 6, '', '2022-06-23 06:45:48.373485+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (515, 144, 3, 'Не готов пнр', '2022-06-23 06:47:58.435528+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (516, 108, 2, '', '2022-06-23 06:48:27.682+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (517, 108, 3, 'Отказались', '2022-06-23 06:48:51.841636+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (518, 107, 2, '', '2022-06-23 06:49:07.58181+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (519, 107, 3, 'Отказались', '2022-06-23 06:49:15.39401+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (520, 180, 2, '', '2022-06-23 06:53:41.704396+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (521, 180, 6, '', '2022-06-23 06:53:48.169891+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (522, 65, 4, 'Тест', '2022-06-23 06:55:32.941986+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (523, 187, 4, 'Тестовый прогон', '2022-06-23 06:56:05.468997+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (524, 186, 4, 'Тестовый прогон', '2022-06-23 06:56:18.663068+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (525, 185, 4, '', '2022-06-23 06:59:03.194028+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (526, 182, 4, 'Тестовый прогон', '2022-06-23 06:59:11.095664+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (527, 183, 4, 'Тестовый прогон', '2022-06-23 06:59:17.603297+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (528, 181, 4, 'Тестовый прогон', '2022-06-23 06:59:26.309372+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (529, 180, 4, 'Тестовый прогон', '2022-06-23 06:59:32.149303+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (530, 179, 4, 'Тестовый прогон', '2022-06-23 06:59:39.668842+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (531, 178, 4, 'Тестовый прогон', '2022-06-23 06:59:45.662239+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (532, 184, 4, 'Тестовый прогон', '2022-06-23 06:59:58.205463+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (533, 176, 4, 'Тестовый прогон', '2022-06-23 07:00:14.958652+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (534, 138, 4, 'Тестовый прогон', '2022-06-23 07:00:27.477519+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (535, 175, 4, 'Тестовый прогон', '2022-06-23 07:00:39.356492+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (536, 174, 4, 'Тестовый прогон', '2022-06-23 07:00:52.718805+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (537, 172, 4, 'Тестовый прогон', '2022-06-23 07:00:59.989401+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (538, 173, 4, 'Тестовый прогон', '2022-06-23 07:02:07.050443+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (539, 171, 4, 'Тестовый прогон', '2022-06-23 07:02:18.186246+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (540, 170, 4, 'Тестовый прогон', '2022-06-23 07:02:25.779255+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (541, 169, 4, 'Тестовый прогон', '2022-06-23 07:02:33.887245+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (542, 168, 4, 'Тестовый прогон', '2022-06-23 07:02:42.44765+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (543, 167, 4, 'Тестовый прогон', '2022-06-23 07:02:56.488756+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (544, 166, 4, 'Тестовый прогон', '2022-06-23 07:03:03.97727+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (545, 163, 4, 'Тестовый прогон', '2022-06-23 07:03:13.286469+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (546, 164, 4, 'Тестовый прогон', '2022-06-23 07:03:20.582859+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (547, 162, 4, 'Тестовый прогон', '2022-06-23 07:03:43.316592+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (548, 161, 4, 'Тестовый прогон', '2022-06-23 07:03:51.773831+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (549, 160, 4, 'Тестовый прогон', '2022-06-23 07:04:04.393012+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (550, 159, 4, 'Тестовый прогон', '2022-06-23 07:04:12.10926+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (551, 158, 4, 'Тестовый прогон', '2022-06-23 07:04:20.294582+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (552, 157, 4, '', '2022-06-23 08:54:59.545247+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (553, 150, 4, '', '2022-06-23 08:55:19.082041+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (554, 156, 4, '', '2022-06-23 08:59:21.52656+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (555, 66, 4, '', '2022-06-23 08:59:42.5945+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (556, 149, 4, '', '2022-06-23 09:00:09.674329+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (557, 148, 4, '', '2022-06-23 09:00:39.966048+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (558, 155, 4, '', '2022-06-23 09:01:03.795475+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (559, 153, 4, '', '2022-06-23 09:01:21.61671+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (560, 154, 4, '', '2022-06-23 09:01:43.365268+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (561, 147, 2, '', '2022-06-24 03:36:47.742355+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (562, 147, 6, '', '2022-06-24 03:36:52.839355+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (563, 188, 1, 'Пнр', '2022-06-24 05:00:49.158711+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (564, 188, 2, '', '2022-06-24 11:29:13.36727+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (565, 188, 6, '', '2022-06-24 11:29:20.595062+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (566, 189, 1, 'Пнр', '2022-06-27 03:33:15.121822+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (567, 190, 1, '', '2022-06-27 04:31:41.635822+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (568, 191, 1, 'Пнр ждёт ', '2022-06-27 08:28:57.60256+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (569, 189, 2, '', '2022-06-27 09:53:02.341431+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (570, 188, 4, '', '2022-06-27 09:54:39.339066+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (571, 191, 2, '', '2022-06-27 10:42:07.868403+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (572, 191, 6, '', '2022-06-27 10:42:17.59467+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (573, 189, 6, '', '2022-06-27 10:46:26.781+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (574, 190, 2, '', '2022-06-27 10:46:40.222908+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (575, 190, 6, '', '2022-06-27 13:10:12.864074+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (576, 192, 1, 'Уточнить по гарантии нет гвс А01', '2022-06-30 03:19:18.592391+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (577, 193, 1, 'Течёт с котла', '2022-06-30 03:22:57.75096+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (578, 194, 1, 'Профилактика', '2022-06-30 03:27:04.700622+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (579, 195, 1, 'Пнр сфотографировать обвязку серийник', '2022-06-30 04:24:03.161527+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (580, 196, 1, 'Нет гвс проверить гарантийник вместе с Азымом', '2022-06-30 06:26:56.289482+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (581, 195, 2, '', '2022-06-30 10:25:57.055056+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (582, 195, 6, '', '2022-06-30 10:26:00.830976+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (583, 194, 2, 'Забрал котел на базу', '2022-06-30 10:27:22.652016+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (584, 197, 1, 'Нет гвс', '2022-07-01 02:54:03.067897+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (585, 192, 2, '', '2022-07-01 10:24:29.470352+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (586, 192, 6, 'Чистка газ магистрали 8000', '2022-07-01 10:24:55.045447+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (587, 197, 2, '3 хадавой заменил', '2022-07-01 10:30:35.976553+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (588, 197, 6, '', '2022-07-01 10:31:11.370829+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (589, 198, 1, 'Профилактика ', '2022-07-03 05:57:59.915737+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (590, 197, 4, '', '2022-07-04 03:26:56.472738+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (591, 195, 4, '', '2022-07-04 03:28:26.47327+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (592, 192, 4, '', '2022-07-04 03:31:09.897042+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (593, 191, 4, '', '2022-07-04 03:32:05.590331+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (594, 190, 4, '', '2022-07-04 03:32:31.828466+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (595, 189, 4, '', '2022-07-04 03:32:56.96873+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (596, 199, 1, 'Замена трехходового ', '2022-07-04 08:35:40.471183+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (597, 200, 1, 'А4', '2022-07-04 08:38:24.775821+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (598, 201, 1, 'Профилактика на вторник', '2022-07-04 08:42:42.411645+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (599, 202, 1, 'Перевод на пропан', '2022-07-04 08:48:47.011941+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (600, 202, 2, '', '2022-07-04 09:00:42.448726+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (601, 202, 7, 'На завтра не готов', '2022-07-04 09:03:59.36862+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (602, 194, 6, '', '2022-07-04 09:11:50.467992+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (603, 194, 4, '', '2022-07-04 11:23:05.84072+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (604, 199, 2, '', '2022-07-04 11:23:59.384231+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (605, 199, 6, '', '2022-07-04 11:24:03.817186+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (606, 198, 2, '', '2022-07-04 11:24:18.329965+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (607, 198, 6, '', '2022-07-04 11:24:23.447771+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (608, 198, 4, '', '2022-07-04 11:24:27.469986+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (609, 200, 2, '', '2022-07-04 13:34:53.652598+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (610, 200, 6, 'Замена крыльчатки на насос замена 3-х клапана чистка гвс 44000. Ещё требуется замена мономера чистка не помогла', '2022-07-04 13:37:47.972243+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (611, 202, 2, '', '2022-07-05 03:08:26.934386+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (612, 203, 1, 'Пнр одноконтурный', '2022-07-05 03:39:44.721214+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (613, 204, 1, 'Пнр', '2022-07-05 04:39:15.761322+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (614, 205, 1, 'Течёт с котла', '2022-07-05 04:42:15.489837+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (615, 206, 1, 'Пнр сегодня обязательно ', '2022-07-05 05:32:55.250059+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (616, 199, 4, '', '2022-07-05 05:33:39.035395+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (717, 232, 2, '', '2022-07-18 03:31:17.288403+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (718, 233, 1, 'Пнр', '2022-07-18 04:22:17.973646+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (617, 202, 6, 'Не смог отрегулировать газ. Нет коллектора пнр на одном балконе. Гарантийного талона нет , на гарантию не поставил . Будет повторный вызов . Клиента уведомил что платный.', '2022-07-05 05:58:27.388353+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (618, 201, 2, '', '2022-07-05 06:32:40.736854+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (619, 201, 6, 'Скоро понадобится замена 3х клапана 25000', '2022-07-05 06:33:01.215958+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (620, 203, 2, '', '2022-07-05 06:58:42.946402+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (621, 203, 6, '', '2022-07-05 06:59:02.510142+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (622, 204, 2, '', '2022-07-05 07:45:32.943196+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (623, 204, 6, '', '2022-07-05 07:45:42.84344+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (624, 204, 4, '', '2022-07-05 09:13:02.279663+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (625, 203, 4, '', '2022-07-05 09:13:23.767642+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (626, 202, 4, '', '2022-07-05 09:15:04.900314+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (627, 200, 4, '', '2022-07-05 09:44:26.827384+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (628, 201, 4, '', '2022-07-05 09:44:44.702489+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (629, 207, 1, 'Замена датчика тяги', '2022-07-05 09:49:38.391079+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (630, 206, 2, '', '2022-07-05 10:00:34.124179+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (631, 206, 6, '', '2022-07-05 10:00:39.292501+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (632, 206, 4, '', '2022-07-05 10:22:43.386826+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (633, 208, 1, 'А6 чистка возможна замена газового клапана на среду', '2022-07-05 10:32:44.317234+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (634, 205, 2, '3 хадавой заменил', '2022-07-05 12:53:39.452994+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (635, 208, 2, '', '2022-07-06 04:45:54.526209+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (636, 208, 6, '', '2022-07-06 07:06:09.599249+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (637, 205, 6, '', '2022-07-07 04:23:17.581317+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (638, 208, 4, '', '2022-07-07 04:23:56.177497+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (639, 209, 1, 'Не зажигается', '2022-07-07 05:28:59.329574+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (640, 210, 1, 'Гудит', '2022-07-07 05:32:42.288345+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (641, 211, 1, 'Пнр', '2022-07-07 05:36:28.475781+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (642, 212, 1, 'Течёт с котла ', '2022-07-07 07:00:40.071161+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (643, 211, 2, '', '2022-07-07 10:02:56.826121+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (644, 211, 6, '', '2022-07-07 10:03:02.11377+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (645, 210, 2, 'Настройка', '2022-07-07 10:03:36.518904+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (646, 213, 1, 'А4', '2022-07-08 03:17:26.831984+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (647, 214, 1, 'Пнр', '2022-07-08 03:19:38.868186+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (648, 215, 1, 'Профилактика', '2022-07-08 03:22:23.498734+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (649, 207, 2, '', '2022-07-08 04:42:18.461124+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (650, 207, 6, '', '2022-07-08 04:42:21.875466+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (651, 215, 2, '', '2022-07-08 07:01:18.117785+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (652, 215, 6, 'Профилактика 25000+ замена 3-х клапана 23000', '2022-07-08 07:01:54.040919+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (653, 209, 7, 'Не берут', '2022-07-08 07:35:23.551772+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (654, 212, 7, 'Заявку не оставляли', '2022-07-08 07:35:52.040338+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (655, 214, 2, '', '2022-07-08 08:49:37.539567+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (656, 216, 1, 'Неисправно работает ', '2022-07-08 09:29:53.245545+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (657, 217, 1, 'Пнр', '2022-07-08 09:34:24.385606+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (658, 217, 7, 'Номер не правелни', '2022-07-08 09:38:47.178316+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (659, 218, 1, 'Не видит воду. Висит в аварии, насос включен, вода в котле есть. Водомер?', '2022-07-10 05:18:41.168903+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (660, 218, 3, 'Клиент отказался. Вызвал других', '2022-07-10 11:40:27.15752+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (661, 207, 4, '', '2022-07-11 03:11:13.441769+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (662, 215, 4, '', '2022-07-11 03:13:00.357533+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (663, 219, 1, 'Замена котла', '2022-07-11 03:19:35.566353+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (664, 220, 1, 'Проблемы с гвс', '2022-07-11 03:23:41.390642+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (665, 205, 4, '', '2022-07-11 03:27:49.213748+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (666, 219, 2, '', '2022-07-11 03:28:39.7665+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (667, 211, 4, '', '2022-07-11 03:42:59.387179+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (668, 213, 3, 'Работает', '2022-07-11 03:43:46.575599+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (669, 214, 6, '', '2022-07-11 03:44:12.888351+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (670, 214, 4, '', '2022-07-11 03:44:26.38965+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (671, 216, 2, '', '2022-07-11 03:45:58.015848+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (672, 216, 6, '', '2022-07-11 03:46:02.31046+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (673, 216, 4, '', '2022-07-11 03:46:05.405586+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (674, 221, 1, 'Бьёт током возможно трехходовой ', '2022-07-11 04:24:50.747617+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (675, 217, 2, '', '2022-07-11 05:31:59.717929+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (676, 217, 6, '', '2022-07-11 05:32:04.447254+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (677, 219, 6, '', '2022-07-11 12:53:23.736539+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (678, 219, 4, '', '2022-07-12 02:58:25.004969+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (679, 217, 4, '', '2022-07-12 02:58:54.296367+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (680, 222, 1, 'Диагностика к17 00', '2022-07-12 05:35:21.944891+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (681, 223, 1, 'Ринай профилактика', '2022-07-12 14:54:56.035483+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (682, 224, 1, 'Нет гвс', '2022-07-12 14:57:47.665506+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (683, 222, 2, 'Осмотр', '2022-07-13 03:01:16.274895+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (684, 222, 6, '', '2022-07-13 03:01:22.52597+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (685, 222, 4, '', '2022-07-13 03:01:29.192406+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (686, 221, 3, 'Нет дома', '2022-07-13 03:03:30.754903+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (687, 220, 2, '', '2022-07-13 03:11:05.174424+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (688, 220, 6, '', '2022-07-13 03:11:08.542212+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (689, 220, 4, '', '2022-07-13 03:11:16.204314+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (690, 193, 3, 'Не дозвонились', '2022-07-13 04:13:26.572541+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (691, 210, 6, '', '2022-07-13 04:14:14.371734+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (692, 212, 2, '', '2022-07-13 04:17:30.423191+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (693, 212, 3, 'Недавали заявку', '2022-07-13 04:17:51.912257+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (694, 209, 2, '', '2022-07-13 04:18:33.948482+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (695, 209, 3, 'Не берет трубку ', '2022-07-13 04:18:48.914116+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (696, 196, 2, '', '2022-07-13 04:56:44.994834+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (697, 196, 6, 'Чистка теплообменников. ', '2022-07-13 04:56:59.532673+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (698, 196, 4, '', '2022-07-13 04:58:25.151708+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (699, 225, 1, 'Ошибка А01', '2022-07-14 09:57:37.957076+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (700, 225, 2, '', '2022-07-14 10:06:03.273719+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (701, 225, 6, 'Не работает стабилизатор напряжение ', '2022-07-14 15:18:45.613368+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (702, 225, 4, '', '2022-07-14 15:18:49.263126+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (703, 226, 1, 'Электротен не греет ', '2022-07-15 08:49:14.005697+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (704, 226, 2, '', '2022-07-15 10:01:21.793035+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (705, 227, 1, 'Нет гвс  на завтра утро обязательно ', '2022-07-15 15:44:04.436465+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (706, 228, 1, 'Нет гвс', '2022-07-16 03:05:18.141182+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (707, 229, 1, 'Ринай чистка вторник до обеда ', '2022-07-16 03:37:17.549861+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (708, 230, 1, 'Нет гвс понидельник до обеда ', '2022-07-16 09:58:28.281211+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (709, 223, 2, 'Забрал на базу ', '2022-07-17 16:46:38.664748+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (710, 223, 6, 'Профилактика и замена воздухаотвод.35000', '2022-07-17 16:47:51.332936+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (711, 227, 2, 'На понедельник утро замена основного теплообменника и чистка гвс цена 94000', '2022-07-17 16:49:08.022456+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (712, 228, 2, '', '2022-07-17 16:49:35.741794+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (713, 228, 6, 'Профилактика и замена 3х 48000', '2022-07-17 16:50:13.582884+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (714, 224, 7, 'Звонил в день заявки. Договорились вечером созвониться так и не взяли телефон ', '2022-07-17 16:51:31.680377+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (715, 231, 1, 'Пнр', '2022-07-18 03:08:59.372749+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (719, 234, 1, 'Нет гвс', '2022-07-18 04:25:42.458269+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (720, 234, 3, 'Хотят бесплатно', '2022-07-18 04:45:08.930013+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (721, 232, 6, '', '2022-07-18 05:04:17.006534+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (722, 230, 2, '', '2022-07-18 05:18:17.795346+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (723, 230, 6, '', '2022-07-18 08:02:43.303425+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (724, 235, 1, 'Кипит', '2022-07-18 09:01:27.24643+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (725, 236, 1, 'Нет гвс', '2022-07-19 03:20:06.609748+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (726, 237, 1, 'Пнр', '2022-07-19 03:23:02.48971+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (727, 238, 1, 'Пнр', '2022-07-19 03:25:01.520458+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (728, 236, 3, 'Клиент не хочет платить ', '2022-07-19 04:19:49.349362+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (729, 227, 6, 'Замена основного теплообменника и чистка гвс 94000', '2022-07-19 10:44:01.227912+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (730, 229, 7, 'Не берет тел', '2022-07-19 10:44:23.082769+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (731, 231, 2, '', '2022-07-19 10:44:42.804901+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (732, 231, 6, '', '2022-07-19 10:44:46.762105+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (733, 235, 2, '', '2022-07-19 10:45:09.508047+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (734, 235, 6, 'Чистка грязевого фильтра и накачал расш бак 8000', '2022-07-19 10:45:30.05192+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (735, 237, 2, '', '2022-07-19 10:45:43.459321+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (736, 237, 6, '', '2022-07-19 10:45:50.270785+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (737, 238, 2, '', '2022-07-19 10:46:13.393376+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (738, 238, 6, 'На гарантию не поставил печка печка находится в ванной и рядом туалет ', '2022-07-19 10:47:02.449841+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (739, 239, 1, 'Нет гвс ', '2022-07-20 06:25:33.743794+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (740, 240, 1, 'Пнр', '2022-07-20 06:29:25.954752+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (741, 241, 1, 'Пнр', '2022-07-20 06:31:22.946686+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (742, 240, 2, '', '2022-07-20 06:33:22.287789+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (743, 240, 6, '', '2022-07-20 06:33:26.357931+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (744, 241, 2, '', '2022-07-20 09:49:09.500012+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (745, 241, 6, 'Выписал днём покупки', '2022-07-20 09:49:20.857925+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (746, 239, 2, '', '2022-07-20 10:01:23.088652+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (747, 241, 4, '', '2022-07-20 10:13:33.204488+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (748, 240, 4, '', '2022-07-20 10:13:53.760441+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (749, 235, 4, '', '2022-07-20 10:14:43.520671+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (750, 242, 1, 'Чистка гвс и может профилактика', '2022-07-21 03:14:11.994752+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (751, 233, 2, '', '2022-07-21 03:15:45.616046+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (752, 233, 6, '', '2022-07-21 03:15:49.298346+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (753, 233, 4, '', '2022-07-21 03:15:52.273047+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (754, 239, 6, 'Профилактика замена дат темп', '2022-07-21 06:26:31.500987+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (755, 242, 2, '', '2022-07-21 06:51:52.844034+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (756, 242, 6, '', '2022-07-21 10:04:32.834019+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (757, 237, 4, '', '2022-07-21 11:09:43.958236+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (758, 242, 4, '', '2022-07-21 11:11:10.962531+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (759, 239, 4, '', '2022-07-21 11:11:31.635425+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (760, 238, 4, '', '2022-07-21 11:11:55.684386+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (761, 243, 1, 'Профилактика кател гидроста', '2022-07-21 13:17:11.963752+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (762, 244, 1, 'Профилактика селтик и део на завтра до обеда ', '2022-07-22 05:57:26.766766+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (763, 245, 1, 'Пнр', '2022-07-22 06:05:44.202227+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (764, 246, 1, 'Пнр', '2022-07-22 06:07:49.248814+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (765, 247, 1, 'Пнр', '2022-07-22 06:09:53.248229+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (766, 248, 1, 'Пнр', '2022-07-22 06:20:55.344938+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (767, 246, 2, '', '2022-07-22 07:50:57.947378+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (768, 246, 6, '', '2022-07-22 07:51:04.212069+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (769, 249, 1, 'Пнр', '2022-07-22 08:10:58.301688+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (770, 248, 2, '', '2022-07-22 09:23:01.635179+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (771, 248, 6, '', '2022-07-22 09:23:12.0807+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (772, 243, 2, '', '2022-07-22 14:11:17.047514+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (773, 243, 6, 'Без фанатизма15000', '2022-07-22 14:11:37.922049+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (774, 247, 2, '', '2022-07-22 14:23:35.31992+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (775, 247, 6, '', '2022-07-22 14:23:40.639014+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (776, 250, 1, 'Пнр', '2022-07-23 02:32:17.510675+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (777, 244, 2, '', '2022-07-23 09:57:34.696426+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (778, 244, 6, 'Оба без фанатизма 30000', '2022-07-23 09:58:09.578254+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (779, 250, 2, '', '2022-07-23 09:58:24.750318+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (780, 250, 6, '', '2022-07-23 09:58:34.95711+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (781, 251, 1, 'А5', '2022-07-25 03:40:40.184793+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (782, 252, 1, 'Пнр', '2022-07-25 03:42:43.72745+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (783, 243, 4, '', '2022-07-25 03:44:10.673429+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (784, 244, 4, '', '2022-07-25 03:44:29.871902+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (785, 250, 4, '', '2022-07-25 03:45:22.956898+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (786, 251, 2, 'Датчик давления ', '2022-07-25 10:38:23.8003+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (787, 251, 6, '', '2022-07-25 10:38:32.939054+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (788, 249, 2, '', '2022-07-25 10:45:08.172865+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (789, 249, 6, '', '2022-07-25 10:45:12.312778+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (790, 246, 4, '', '2022-07-26 05:48:40.55737+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (791, 247, 4, '', '2022-07-26 05:48:56.77468+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (792, 248, 4, '', '2022-07-26 05:49:08.59436+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (793, 249, 4, '', '2022-07-26 05:49:22.14356+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (794, 232, 4, '', '2022-07-26 05:49:58.804517+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (795, 231, 4, '', '2022-07-26 05:50:36.703121+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (796, 223, 4, '', '2022-07-26 05:56:14.210885+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (797, 230, 4, '', '2022-07-26 05:57:10.389781+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (798, 245, 2, '', '2022-07-26 08:45:33.572772+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (799, 252, 2, '', '2022-07-26 08:46:32.210989+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (800, 252, 6, 'Отказ в пнр из за монтажа', '2022-07-26 08:46:57.493346+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (801, 245, 6, '', '2022-07-26 13:36:09.387885+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (802, 253, 1, 'Е1 ', '2022-07-27 06:10:34.369648+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (803, 253, 2, 'Толка диагностика', '2022-07-27 09:49:28.432209+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (804, 254, 1, 'Нет гвс АЕ завтра утром ', '2022-07-29 14:01:18.432666+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (805, 255, 1, 'Пнр', '2022-07-29 14:21:54.030901+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (806, 256, 1, 'Нет гвс', '2022-07-30 03:42:58.123573+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (807, 254, 2, '', '2022-07-30 04:35:50.962444+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (808, 254, 6, '', '2022-07-30 06:20:16.495747+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (809, 255, 2, '', '2022-07-30 06:20:27.155213+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (810, 255, 3, 'Не готово к пнр', '2022-07-30 07:01:11.24189+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (811, 256, 2, 'Прафилактика', '2022-07-30 08:39:25.39637+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (812, 257, 1, 'Чистка', '2022-08-01 07:01:06.963005+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (813, 258, 1, 'Пнр', '2022-08-01 07:14:15.760677+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (814, 258, 2, '', '2022-08-01 09:28:21.281908+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (815, 258, 6, '', '2022-08-01 09:28:24.929649+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (816, 257, 2, '', '2022-08-02 10:03:14.983309+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (817, 257, 6, '', '2022-08-02 10:03:23.178791+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (818, 259, 1, 'Профилактика', '2022-08-03 04:44:40.099367+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (819, 251, 4, '', '2022-08-03 04:47:49.327811+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (820, 252, 4, '', '2022-08-03 04:48:13.890277+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (821, 253, 6, '', '2022-08-03 04:48:37.643504+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (822, 253, 4, '', '2022-08-03 04:48:47.616227+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (823, 254, 4, '', '2022-08-03 04:49:11.703995+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (824, 258, 4, '', '2022-08-03 04:49:57.227267+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (825, 257, 4, '', '2022-08-03 04:50:18.855312+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (826, 256, 6, '', '2022-08-03 04:50:58.898693+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (827, 256, 4, '', '2022-08-03 04:51:02.790961+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (828, 259, 2, 'Диагностика', '2022-08-03 13:47:04.716527+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (829, 260, 1, 'Течёт с котла проверить гарантийник', '2022-08-05 05:19:36.882781+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (830, 261, 1, 'Замена насоса. Уточнить серийный номер', '2022-08-05 06:40:15.719158+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (831, 262, 1, 'Профилактика', '2022-08-08 04:00:41.323502+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (832, 263, 1, 'Пнр', '2022-08-08 04:26:44.181582+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (833, 263, 2, '', '2022-08-08 11:29:50.081507+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (834, 263, 6, '', '2022-08-08 11:29:57.132862+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (835, 264, 1, 'Пнр', '2022-08-09 06:59:05.362366+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (836, 265, 1, 'Диагностика ', '2022-08-09 07:30:08.716764+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (837, 266, 1, 'Профилактика пятница', '2022-08-09 08:12:37.409872+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (838, 265, 2, '', '2022-08-09 10:01:40.320563+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (839, 265, 6, '', '2022-08-09 10:01:46.922857+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (840, 260, 2, '', '2022-08-10 09:55:03.40033+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (841, 260, 6, '', '2022-08-10 09:55:08.191248+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (842, 262, 2, '', '2022-08-10 09:55:47.85231+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (843, 262, 6, 'Взял 25000', '2022-08-10 09:56:06.755677+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (844, 264, 2, '', '2022-08-10 09:56:18.668442+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (845, 264, 6, '', '2022-08-10 09:56:47.555847+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (846, 261, 2, '', '2022-08-11 03:45:29.640001+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (847, 261, 6, '', '2022-08-11 03:49:58.954592+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (848, 267, 1, 'Профилактика ', '2022-08-11 03:51:07.874054+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (849, 268, 1, 'Бежитвода', '2022-08-11 04:22:45.493153+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (850, 268, 2, 'Гарантинни', '2022-08-11 05:19:55.720479+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (851, 268, 6, '', '2022-08-11 05:20:01.652006+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (852, 268, 4, '', '2022-08-11 06:57:59.442645+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (853, 265, 4, '', '2022-08-11 06:58:38.741466+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (854, 261, 4, '', '2022-08-11 06:59:04.343514+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (855, 262, 4, '', '2022-08-11 06:59:29.160201+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (856, 263, 4, '', '2022-08-11 06:59:57.434232+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (857, 264, 4, '', '2022-08-11 07:00:29.942476+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (858, 260, 4, '', '2022-08-11 07:00:48.64832+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (859, 245, 4, '', '2022-08-11 07:01:33.884304+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (860, 227, 4, '', '2022-08-11 07:02:29.36061+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (861, 269, 1, '', '2022-08-23 04:08:25.880462+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (862, 270, 1, '', '2022-08-23 04:08:43.901763+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (863, 269, 2, '', '2022-08-23 09:43:27.049039+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (864, 269, 6, '', '2022-08-23 09:43:32.551685+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (865, 270, 2, '', '2022-08-23 09:43:47.896788+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (866, 270, 6, '', '2022-08-23 09:43:51.169066+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (867, 271, 1, 'ПНР', '2022-09-13 05:02:15.132765+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (868, 272, 1, 'Течёт с котла меняли сальник трехходового клапана ', '2022-09-14 07:40:24.672305+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (869, 273, 1, 'ПНР', '2022-09-14 11:34:24.751903+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (870, 273, 2, '', '2022-09-15 09:06:14.847983+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (871, 274, 1, 'Профилактика на субботу до обеда ', '2022-09-16 03:54:05.442363+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (872, 275, 1, 'Профилактика на субботу ', '2022-09-16 03:57:27.496483+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (873, 276, 1, 'Идёт постоянная подпитка', '2022-09-16 04:02:12.159315+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (874, 277, 1, 'Пнр нужно установить шланг газа диэлектрическую муфту и сигнализатор газа 5000 + 5000гарантия ', '2022-09-16 04:26:41.016376+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (875, 278, 1, 'А6', '2022-09-16 04:58:39.632423+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (876, 279, 1, 'Профилактика на субботу ', '2022-09-16 05:31:49.636925+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (877, 273, 7, 'Передал Олегу', '2022-09-16 06:08:05.997503+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (878, 277, 2, '', '2022-09-16 06:16:46.051941+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (879, 280, 1, 'Пнр на понидельник', '2022-09-16 06:29:17.526674+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (880, 277, 6, '', '2022-09-16 08:31:19.839343+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (881, 281, 1, 'Профилактика ', '2022-09-17 02:09:05.216992+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (882, 275, 2, '', '2022-09-17 03:15:12.185902+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (883, 282, 1, 'Шумит ', '2022-09-17 04:06:36.12653+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (884, 283, 1, 'Пнр', '2022-09-17 04:19:36.333795+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (885, 275, 6, '', '2022-09-17 04:37:22.07043+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (886, 266, 2, '', '2022-09-17 04:43:30.348061+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (887, 266, 6, 'Выполнил ещё до болезни', '2022-09-17 04:43:43.565468+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (888, 271, 2, '', '2022-09-17 04:43:57.62536+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (889, 281, 2, '', '2022-09-17 04:44:15.484409+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (890, 281, 6, '', '2022-09-17 04:44:19.464977+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (891, 271, 6, 'Выполнил ему нужен гарантийное в магазине не выдали', '2022-09-17 04:44:29.308308+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (892, 272, 7, 'Сегодня на 11:30 договорились. Опять не получается ключи от котельной потеряли', '2022-09-17 04:45:30.653347+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (893, 274, 2, '', '2022-09-17 04:46:03.541987+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (894, 274, 6, '', '2022-09-17 04:46:07.272698+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (895, 284, 1, 'Профилактика на следующей субботу  утром', '2022-09-17 04:52:53.02458+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (896, 278, 2, '', '2022-09-17 06:02:11.572294+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (897, 278, 7, 'На понедельник требуется  трансформатор розж', '2022-09-17 06:16:28.583838+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (898, 285, 1, 'Пнр понидельник ', '2022-09-17 07:44:37.413517+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (899, 282, 2, '', '2022-09-17 10:34:50.088135+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (900, 286, 1, 'Нет гвс 6р1 ', '2022-09-17 12:00:55.881815+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (901, 282, 6, 'Шум от насоса не большой, поднималось давление устранил проблему. Сделал полную профилактику.', '2022-09-17 12:09:45.727027+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (902, 287, 1, 'Водогрейка илди нет гвс', '2022-09-17 12:11:10.245006+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (903, 288, 1, 'Водогрейка илди нет гвс', '2022-09-17 12:11:23.80143+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (904, 289, 1, 'Пнр', '2022-09-17 12:16:02.688048+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (905, 290, 1, 'Пнр', '2022-09-17 12:21:27.087567+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (906, 291, 1, 'Пнр', '2022-09-17 12:24:33.981188+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (907, 292, 1, 'Пнр', '2022-09-17 12:28:19.130983+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (908, 285, 2, '', '2022-09-17 12:46:48.380605+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (909, 285, 6, '', '2022-09-17 12:46:52.194452+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (910, 286, 2, '', '2022-09-17 12:56:51.14027+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (911, 279, 2, '', '2022-09-17 13:37:25.321005+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (912, 279, 6, '', '2022-09-17 13:37:28.970852+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (913, 288, 2, '', '2022-09-17 13:37:47.93028+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (914, 288, 6, 'Повторяется ', '2022-09-17 13:38:02.423014+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (915, 286, 6, '', '2022-09-17 14:08:18.222935+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (916, 292, 3, 'Клиент не хочет ставить на гарантию. Трубку взяла потом бросила. Я на вацап написал она отказалась', '2022-09-19 03:03:31.212236+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (917, 289, 2, '', '2022-09-19 03:11:02.609173+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (918, 289, 6, '', '2022-09-19 04:12:19.009888+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (919, 291, 2, '', '2022-09-19 04:13:25.87234+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (920, 293, 1, 'ПНР. К запуску готовы', '2022-09-19 05:38:52.470953+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (921, 294, 1, 'ПНР. Не знаю что за котел', '2022-09-19 05:42:13.017714+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (922, 295, 1, 'ПНР. К запуску готовы', '2022-09-19 05:45:03.079479+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (923, 296, 1, 'ПНР', '2022-09-19 05:46:15.849985+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (924, 297, 1, 'ПНР ФАФ. К запуску готовы', '2022-09-19 05:48:15.403461+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (925, 298, 1, 'Селтик. Ошибка АА', '2022-09-19 05:50:42.127782+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (926, 299, 1, 'ПНР на пропан', '2022-09-19 05:57:35.706081+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (927, 300, 1, 'Течет трехходовой клапан.', '2022-09-19 06:02:23.424809+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (928, 291, 6, '', '2022-09-19 06:42:25.07042+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (929, 293, 2, '', '2022-09-19 06:42:55.747344+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (930, 293, 6, '', '2022-09-19 07:46:16.060545+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (931, 300, 2, '', '2022-09-19 07:46:44.360289+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (932, 300, 6, '', '2022-09-19 08:33:41.416976+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (933, 284, 2, '', '2022-09-19 12:37:23.211931+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (934, 224, 2, '', '2022-09-19 15:16:48.211203+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (935, 224, 3, 'Так и не взяли тел', '2022-09-19 15:17:07.018206+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (936, 229, 2, '', '2022-09-19 15:17:38.991681+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (937, 229, 3, 'Так и не взяли тел', '2022-09-19 15:17:55.422653+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (938, 278, 2, '', '2022-09-19 15:18:36.656268+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (939, 278, 6, '', '2022-09-19 15:18:43.611203+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (940, 295, 2, '', '2022-09-19 15:20:07.521326+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (941, 295, 6, '', '2022-09-19 15:20:13.28278+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (942, 280, 2, '', '2022-09-19 15:20:34.86203+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (943, 280, 6, '', '2022-09-19 15:20:45.36755+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (944, 298, 2, '', '2022-09-19 15:21:48.757988+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (945, 298, 6, '', '2022-09-19 15:21:59.572854+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (946, 296, 2, '', '2022-09-19 15:22:13.302386+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (947, 296, 6, '', '2022-09-19 15:22:17.804436+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (948, 299, 2, '', '2022-09-19 15:22:41.046436+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (949, 299, 6, '', '2022-09-19 15:22:44.389477+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (950, 284, 6, '', '2022-09-19 16:28:37.366151+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (951, 294, 2, '', '2022-09-20 04:51:01.86762+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (952, 294, 3, 'К запуску не готов', '2022-09-20 07:10:31.301356+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (953, 297, 3, 'Ярик  пнр', '2022-09-21 02:37:48.996364+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (954, 301, 1, 'Не запускается либо датчик давления или плата', '2022-09-23 05:09:26.163748+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (955, 302, 1, 'Не гарантийный а4', '2022-09-23 05:58:16.324559+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (956, 303, 1, '', '2022-09-23 06:01:00.702972+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (957, 304, 1, '', '2022-09-23 06:02:20.17433+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (958, 301, 2, '', '2022-09-23 06:07:17.654432+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (959, 305, 1, 'Пнр', '2022-09-23 06:16:04.660487+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (960, 306, 1, 'Пнр', '2022-09-23 06:18:35.034933+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (961, 301, 6, '', '2022-09-23 07:04:34.279803+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (962, 305, 2, '', '2022-09-23 07:13:03.53164+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (963, 307, 1, 'После скачка напряжения а2 на суботу', '2022-09-23 07:13:34.385893+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (964, 306, 2, '', '2022-09-23 07:30:03.683551+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (965, 306, 6, '', '2022-09-23 07:30:07.758111+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (966, 305, 6, '', '2022-09-23 08:19:59.121133+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (967, 302, 2, '', '2022-09-23 08:21:52.114816+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (968, 302, 6, '', '2022-09-23 11:37:16.728363+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (969, 308, 1, 'Нет гвс', '2022-09-24 07:07:21.429893+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (970, 309, 1, 'Пнр', '2022-09-24 07:12:20.444555+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (971, 310, 1, 'Пнр', '2022-09-24 07:12:42.845618+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (972, 311, 1, 'Плохо работает', '2022-09-24 07:19:00.674928+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (973, 312, 1, 'Пнр', '2022-09-24 07:21:18.96004+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (974, 313, 1, 'Пнр', '2022-09-24 07:21:41.629085+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (975, 308, 2, '', '2022-09-24 09:18:07.971142+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (976, 308, 6, '', '2022-09-24 11:27:35.4694+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (977, 314, 1, 'А6 ', '2022-09-26 03:46:55.693995+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (978, 315, 1, 'Профилактика ', '2022-09-26 03:54:29.687681+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (979, 316, 1, 'Пнр', '2022-09-26 03:58:11.588421+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (980, 317, 1, 'Профилактика ', '2022-09-26 04:02:16.682965+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (981, 316, 2, '', '2022-09-26 04:47:02.997799+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (982, 318, 1, 'Нет гвс', '2022-09-26 05:07:12.295375+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (983, 319, 1, 'Нет гвс', '2022-09-26 05:20:48.087391+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (984, 316, 6, '', '2022-09-26 06:11:37.88529+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (985, 307, 2, '', '2022-09-26 07:10:39.450483+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (986, 320, 1, 'Пнр', '2022-09-26 07:29:17.827619+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (987, 321, 1, 'Пнр', '2022-09-26 07:31:07.290528+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (988, 322, 1, 'Пнр', '2022-09-26 07:32:55.102882+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (989, 323, 1, 'Пнр', '2022-09-26 07:35:31.037325+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (990, 324, 1, 'Пнр', '2022-09-26 07:37:36.056461+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (991, 318, 7, 'Номер не зарегистрирован ', '2022-09-26 08:40:51.584813+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (992, 325, 1, 'Не вкл.', '2022-09-26 08:41:58.157679+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (993, 326, 1, 'Не вкл.', '2022-09-26 08:42:24.380204+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (994, 327, 1, 'Не вкл.', '2022-09-26 08:42:57.616979+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (995, 319, 2, '', '2022-09-26 09:35:09.674487+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (996, 319, 6, '', '2022-09-26 09:35:12.825496+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (997, 315, 2, '', '2022-09-26 09:50:21.810347+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (998, 315, 6, '', '2022-09-26 11:31:47.728319+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (999, 328, 1, 'Гудит', '2022-09-26 14:09:45.011261+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1000, 329, 1, 'Замена трехходового 26000', '2022-09-26 14:13:30.338838+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1001, 287, 3, 'Не берет тел', '2022-09-26 16:09:33.784237+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1002, 307, 7, 'Нужен вентилятор ', '2022-09-26 16:19:17.635491+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1003, 272, 2, '', '2022-09-26 16:19:55.547421+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1004, 272, 6, '', '2022-09-26 16:20:01.978898+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1005, 303, 2, '', '2022-09-26 16:22:18.375727+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1006, 303, 6, '', '2022-09-26 16:22:23.350684+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1007, 304, 3, 'Повторяется ', '2022-09-26 16:22:55.701786+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1008, 311, 2, '', '2022-09-26 16:23:59.431313+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1009, 311, 6, '', '2022-09-26 16:24:04.160062+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1010, 314, 2, '', '2022-09-26 16:24:30.592524+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1011, 314, 6, '', '2022-09-26 16:24:37.111731+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1012, 313, 3, 'Повторяется', '2022-09-26 16:25:15.350932+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1013, 310, 3, 'Повторяется', '2022-09-26 16:41:02.975211+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1014, 325, 2, '', '2022-09-27 01:06:38.892805+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1015, 325, 6, 'Неправильно установлен дымоход ', '2022-09-27 01:07:40.376502+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1016, 330, 1, 'Пнр', '2022-09-27 02:17:18.22035+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1017, 331, 1, 'Е3', '2022-09-27 02:19:30.318973+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1018, 332, 1, 'Пнр', '2022-09-27 02:21:30.170341+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1019, 333, 1, 'Нет включается ', '2022-09-27 02:23:43.718063+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1020, 334, 1, 'Пнр', '2022-09-27 02:25:18.410186+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1021, 335, 1, 'Пнр', '2022-09-27 02:27:40.050703+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1022, 336, 1, 'Пнр', '2022-09-27 02:29:30.352953+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1023, 337, 1, 'Пнр', '2022-09-27 02:31:14.012458+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1024, 338, 1, 'Пнр', '2022-09-27 02:32:34.672048+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1025, 339, 1, 'Пнр', '2022-09-27 02:34:16.638876+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1026, 340, 1, 'Пнр среда', '2022-09-27 02:36:07.473268+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1027, 341, 1, '101 очень ждёт ', '2022-09-27 02:38:14.722036+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1028, 342, 1, 'Поднимается давление ', '2022-09-27 02:41:26.552348+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1029, 343, 1, 'Пнр', '2022-09-27 03:37:07.569049+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1030, 344, 1, 'Пнр', '2022-09-27 03:43:49.135212+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1031, 330, 2, '', '2022-09-27 04:02:35.339381+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1032, 330, 6, '', '2022-09-27 04:53:03.653529+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1033, 312, 2, '', '2022-09-27 05:31:05.036214+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1034, 312, 6, '', '2022-09-27 05:31:09.245+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1035, 331, 2, '', '2022-09-27 06:07:10.788543+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1036, 331, 7, 'Ремонт платы', '2022-09-27 06:07:51.522234+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1037, 332, 2, '', '2022-09-27 06:08:43.816819+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1038, 332, 6, '', '2022-09-27 06:58:51.264639+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1039, 342, 2, '', '2022-09-27 07:42:07.92876+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1040, 342, 6, '', '2022-09-27 07:53:52.612716+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1041, 345, 1, 'Бежит вода', '2022-09-27 09:52:49.072694+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1042, 331, 2, '', '2022-09-27 10:30:10.683332+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1043, 331, 6, '', '2022-09-27 10:30:16.204862+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1044, 341, 2, '', '2022-09-27 11:22:07.959903+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1045, 341, 6, '', '2022-09-27 11:38:35.726922+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1046, 343, 2, '', '2022-09-27 11:38:55.076189+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1047, 343, 6, '', '2022-09-27 11:55:41.429471+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1048, 346, 1, 'Профилактика замена теплообменника ', '2022-09-28 04:11:56.598883+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1049, 347, 1, 'Профилактика ', '2022-09-28 04:28:22.352068+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1050, 348, 1, 'Пнр', '2022-09-28 04:30:11.864388+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1051, 349, 1, 'Пнр четверг', '2022-09-28 04:32:34.854302+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1052, 350, 1, 'Пнр', '2022-09-28 04:34:18.271331+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1053, 351, 1, 'Пнр', '2022-09-28 04:35:56.946178+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1054, 318, 2, '', '2022-09-28 05:37:54.188658+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1055, 318, 3, 'Номер не сущ', '2022-09-28 05:38:04.575744+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1056, 333, 2, 'Платы в работе', '2022-09-28 05:38:35.040056+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1057, 328, 3, 'С Игорем должен связаться ', '2022-09-28 05:39:17.295326+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1058, 309, 2, '', '2022-09-28 05:39:43.26198+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1059, 309, 6, '', '2022-09-28 05:39:47.343455+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1060, 307, 2, '', '2022-09-28 05:40:30.862418+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1061, 345, 2, '3хадавой заменил', '2022-09-28 06:28:44.852057+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1062, 345, 6, '', '2022-09-28 06:28:52.899032+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1063, 352, 1, 'Нет гвс а3', '2022-09-28 07:20:26.436555+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1064, 353, 1, 'Пнр ', '2022-09-28 07:23:04.087717+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1065, 354, 1, 'Пнр ', '2022-09-28 07:24:59.082841+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1066, 355, 1, 'Пнр', '2022-09-28 07:28:39.401678+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1067, 356, 1, 'Пнр ', '2022-09-28 07:30:42.790181+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1068, 357, 1, 'Пнр ', '2022-09-28 07:32:17.976059+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1069, 358, 1, 'Нет гвс', '2022-09-28 07:35:10.510003+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1070, 359, 1, 'Профилактика заменить полифосфат на четверг ', '2022-09-28 07:39:05.853132+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1071, 360, 1, 'Пнр', '2022-09-28 07:43:39.190749+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1072, 361, 1, 'Профилактика ', '2022-09-28 07:46:52.415902+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1073, 362, 1, 'Пнр пятница ', '2022-09-28 07:49:02.253689+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1074, 363, 1, 'Пнр можно на субботу ', '2022-09-28 07:52:13.284222+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1075, 364, 1, 'Пнр', '2022-09-28 07:53:33.274217+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1076, 365, 1, 'Не помню что сним', '2022-09-28 07:56:01.879409+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1077, 366, 1, 'Профилактика вторник', '2022-09-28 07:58:41.814143+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1078, 350, 3, 'Газ н провели ', '2022-09-28 08:23:36.349252+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1079, 361, 3, 'Отказ клиенту дорого', '2022-09-28 08:28:13.670297+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1080, 353, 2, '', '2022-09-28 08:41:12.693542+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1081, 353, 6, '', '2022-09-28 10:09:56.65237+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1082, 327, 3, 'Продублирован', '2022-09-28 10:14:12.968653+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1083, 326, 3, 'Продублирован', '2022-09-28 10:14:36.111501+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1084, 346, 2, '', '2022-09-28 11:05:23.894434+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1085, 346, 6, '', '2022-09-28 11:05:27.622952+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1086, 329, 2, '3хадавой заменил', '2022-09-28 11:38:01.974586+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1087, 329, 6, '30000', '2022-09-28 11:38:34.89643+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1088, 340, 2, '', '2022-09-28 11:56:54.865343+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1089, 340, 6, '', '2022-09-28 11:57:00.367218+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1090, 362, 2, '', '2022-09-28 12:09:21.509546+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1091, 362, 6, '', '2022-09-28 12:59:09.998992+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1092, 344, 2, '', '2022-09-29 03:40:51.926938+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1093, 344, 6, 'Запуск', '2022-09-29 03:41:06.597941+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1094, 367, 1, 'Пнр', '2022-09-29 03:45:01.92041+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1095, 368, 1, 'Профилактика ', '2022-09-29 03:48:45.833293+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1096, 369, 1, 'Профилактика ', '2022-09-29 03:54:06.928011+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1097, 370, 1, '501', '2022-09-29 03:57:53.916435+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1098, 371, 1, 'Пнр', '2022-09-29 04:01:51.04281+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1099, 372, 1, 'Пнр', '2022-09-29 04:04:38.867375+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1100, 373, 1, 'Бежит трехходовой. Слабо идет горячая вода. Предложить чистку', '2022-09-29 04:07:41.998171+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1101, 374, 1, 'Пнр', '2022-09-29 04:08:20.555447+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1102, 375, 1, '', '2022-09-29 04:10:22.930126+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1103, 368, 2, '', '2022-09-29 04:17:23.742855+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1104, 376, 1, 'Чистка. Зелёные ворота', '2022-09-29 05:01:33.597922+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1105, 370, 2, 'Решил по телефону', '2022-09-29 05:09:12.316748+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1106, 370, 6, '', '2022-09-29 05:09:25.322717+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1107, 359, 2, '', '2022-09-29 05:59:19.55817+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1108, 359, 6, '', '2022-09-29 05:59:23.865426+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1109, 351, 2, '', '2022-09-29 07:29:55.728832+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1110, 351, 6, '', '2022-09-29 07:30:01.445373+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1111, 368, 6, '', '2022-09-29 07:45:23.074032+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1112, 377, 1, 'ПНР. Должны оплатить 4000 тг (в прошлый раз не были готовы). На субботу. Созвониться заранее', '2022-09-29 08:28:17.093176+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1113, 360, 2, '', '2022-09-29 08:40:49.082784+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1114, 360, 6, '', '2022-09-29 08:40:53.165835+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1115, 335, 2, '2 раз он гатова', '2022-09-29 08:45:55.185075+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1116, 335, 6, '', '2022-09-29 08:45:58.82403+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1117, 369, 2, '', '2022-09-29 09:07:02.043423+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1118, 283, 2, '', '2022-09-29 09:08:18.04301+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1119, 283, 6, '', '2022-09-29 09:08:21.79615+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1120, 369, 6, '', '2022-09-29 09:08:40.669197+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1121, 290, 2, '', '2022-09-29 09:08:42.516444+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1122, 290, 6, '', '2022-09-29 09:08:46.206458+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1123, 317, 2, '', '2022-09-29 09:09:07.760186+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1124, 317, 6, '', '2022-09-29 09:09:11.506607+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1125, 364, 2, '', '2022-09-29 09:09:30.239647+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1126, 364, 6, '', '2022-09-29 09:09:34.115823+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1127, 355, 2, '', '2022-09-29 11:40:45.04007+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1128, 355, 6, '', '2022-09-29 11:40:48.836023+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1129, 357, 2, '', '2022-09-29 12:14:29.361208+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1130, 357, 6, '', '2022-09-29 12:14:33.40595+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1131, 352, 2, '', '2022-09-29 12:33:54.209145+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1132, 354, 2, '', '2022-09-29 12:34:41.544661+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1133, 354, 6, '', '2022-09-29 12:34:51.379663+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1134, 378, 1, 'Пнр ппонидельник к 12.00', '2022-09-29 14:34:16.5092+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1135, 379, 1, 'Профилактика ', '2022-09-29 14:42:45.257401+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1136, 380, 1, 'Пнр', '2022-09-29 14:45:32.650296+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1137, 381, 1, 'Пнр', '2022-09-29 14:53:28.372958+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1138, 382, 1, 'Пнр', '2022-09-29 14:55:44.088349+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1139, 383, 1, 'Пнр', '2022-09-29 14:58:08.606438+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1140, 384, 1, 'Пнр', '2022-09-29 15:01:01.152753+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1141, 385, 1, 'Пнр', '2022-09-29 15:04:17.348844+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1142, 386, 1, 'Пнр', '2022-09-29 15:07:05.023864+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1143, 387, 1, 'Пнр', '2022-09-29 15:09:57.574994+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1144, 388, 1, 'Пнр при запуске е2', '2022-09-29 15:13:02.685683+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1145, 389, 1, 'Не исправно работает', '2022-09-29 15:15:06.059337+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1146, 390, 1, 'А6 аа', '2022-09-29 15:22:52.889798+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1147, 373, 2, '', '2022-09-29 16:02:43.900079+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1148, 373, 6, '', '2022-09-29 16:02:50.451794+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1149, 391, 1, 'Пнр субота', '2022-09-30 01:42:16.365948+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1150, 392, 1, 'Пнр субота', '2022-09-30 01:44:24.570951+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1151, 393, 1, 'Пнр', '2022-09-30 01:46:19.20826+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1152, 394, 1, 'Пнр', '2022-09-30 01:49:09.338302+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1153, 395, 1, 'Профилактика от15000', '2022-09-30 01:51:56.592071+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1154, 396, 1, 'Пнр субота', '2022-09-30 01:53:44.660931+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1155, 397, 1, 'Пнр субота', '2022-09-30 03:34:32.850382+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1156, 398, 1, 'Пнр пятница субота', '2022-09-30 03:39:19.006738+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1157, 399, 1, 'Пнр', '2022-09-30 03:41:20.462276+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1158, 400, 1, 'Профилактика', '2022-09-30 03:43:45.218489+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1159, 401, 1, 'Пнр', '2022-09-30 03:46:16.815754+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1160, 402, 1, 'Течет с котла', '2022-09-30 03:51:42.267935+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1161, 403, 1, 'Профилактика на суботу до обеда', '2022-09-30 03:53:42.959748+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1162, 389, 2, '', '2022-09-30 04:37:37.71205+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1163, 389, 6, 'Клиент жаловался на угарный газ. ', '2022-09-30 05:01:11.081209+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1164, 395, 2, '', '2022-09-30 05:13:16.942719+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1165, 404, 1, 'Бежит 3ходовой. Связаться по дате', '2022-09-30 06:03:01.248426+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1166, 405, 1, 'Профилактика продление гарантии.  Возле большего синего склада. Связаться уточнить по времени', '2022-09-30 06:05:59.65932+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1167, 406, 1, 'Ошибка АА', '2022-09-30 06:16:56.744755+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1168, 395, 6, '', '2022-09-30 06:53:48.458642+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1169, 385, 2, '', '2022-09-30 06:59:32.011345+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1170, 407, 1, 'Профилактика на вторник после обеда', '2022-09-30 07:06:24.815946+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1171, 408, 1, 'Пнр', '2022-09-30 07:12:12.20241+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1172, 385, 6, '', '2022-09-30 08:11:13.88565+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1173, 390, 2, '', '2022-09-30 08:17:32.717162+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1174, 390, 6, '', '2022-09-30 08:17:36.636384+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1175, 400, 2, '', '2022-09-30 08:17:49.613815+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1176, 400, 6, '', '2022-09-30 08:17:53.804521+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1177, 409, 1, 'Замена насоса. Насос 58''000 тг', '2022-09-30 08:34:17.086506+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1178, 406, 7, 'С клиентом созвонился но ее нет дома. Не берет трубку.', '2022-09-30 08:36:43.852474+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1179, 409, 2, '', '2022-09-30 08:39:33.22349+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1180, 409, 6, '', '2022-09-30 09:42:57.59243+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1181, 387, 2, '', '2022-09-30 10:08:12.415525+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1182, 387, 6, '', '2022-09-30 10:08:16.096036+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1183, 379, 2, '', '2022-09-30 10:23:22.194046+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1184, 379, 6, '', '2022-09-30 10:23:25.789444+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1185, 401, 2, '', '2022-09-30 15:25:24.367374+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1186, 401, 6, '', '2022-09-30 15:25:30.822974+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1187, 404, 2, '', '2022-09-30 15:30:10.621395+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1188, 404, 6, '', '2022-09-30 15:30:14.121392+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1189, 377, 2, '', '2022-10-01 02:23:25.651382+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1190, 410, 1, 'Пнр', '2022-10-01 03:32:17.063082+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1191, 411, 1, 'Профилактика на суботу', '2022-10-01 03:37:56.293144+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1192, 412, 1, 'Течет с котла', '2022-10-01 03:42:00.141282+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1193, 377, 6, '', '2022-10-01 03:45:46.067479+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1194, 413, 1, 'Болер 200 литров не вкл.', '2022-10-01 03:52:02.632562+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1195, 391, 2, '', '2022-10-01 04:21:00.386077+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1196, 391, 3, 'Не готов к запуску', '2022-10-01 05:04:21.723511+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1197, 392, 2, '', '2022-10-01 05:09:48.210199+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1198, 392, 6, '', '2022-10-01 05:27:39.672226+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1199, 410, 2, '', '2022-10-01 05:29:31.526717+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1200, 410, 6, '', '2022-10-01 05:52:31.438933+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1201, 393, 2, '', '2022-10-01 06:30:05.472967+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1202, 412, 2, '', '2022-10-01 06:36:38.135952+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1203, 412, 6, 'Все исправно работает клиен от. Приезда отказался ', '2022-10-01 06:37:21.669978+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1204, 403, 2, '', '2022-10-01 06:37:37.583652+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1205, 403, 6, '', '2022-10-01 06:37:54.193472+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1206, 376, 2, '', '2022-10-01 09:34:27.715405+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1207, 376, 6, '', '2022-10-01 09:34:33.187691+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1208, 393, 6, '', '2022-10-01 09:40:57.605769+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1209, 398, 2, '', '2022-10-01 09:41:23.877587+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1210, 398, 6, '', '2022-10-01 09:41:28.44472+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1211, 394, 2, '', '2022-10-01 09:41:46.070636+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1212, 394, 6, '', '2022-10-01 09:41:49.669589+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1213, 386, 2, '', '2022-10-01 09:42:27.958346+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1214, 383, 2, '', '2022-10-01 09:48:08.88659+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1215, 367, 3, 'Выполнена ', '2022-10-01 09:50:15.823472+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1216, 411, 2, '', '2022-10-01 10:34:56.115435+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1217, 413, 2, '', '2022-10-01 10:54:32.005065+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1218, 413, 6, '', '2022-10-01 10:54:36.36035+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1219, 411, 3, 'У клиента 3 котла. Хочет за 30000 профилактику за  все. ', '2022-10-01 11:27:16.510075+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1220, 380, 2, '', '2022-10-01 13:15:35.78497+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1221, 380, 6, '', '2022-10-01 13:15:40.244351+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1222, 405, 2, 'Не хочет прафилактика', '2022-10-01 14:34:33.422542+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1223, 405, 6, 'Диагностика толка', '2022-10-01 14:34:49.520969+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1224, 372, 2, '', '2022-10-01 14:38:03.234978+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1225, 372, 6, '', '2022-10-01 14:38:06.813358+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1226, 381, 2, '', '2022-10-02 03:41:31.841166+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1227, 381, 6, 'Выполнили', '2022-10-02 03:42:07.00616+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1228, 384, 7, 'Не готов', '2022-10-02 03:59:48.515255+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1229, 414, 1, 'Пнр', '2022-10-02 04:03:52.08497+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1230, 415, 1, 'Нет гвс', '2022-10-02 04:06:02.079319+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1231, 259, 6, '', '2022-10-02 04:32:27.196412+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1232, 399, 2, '', '2022-10-02 04:36:54.546859+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1233, 399, 6, '', '2022-10-02 04:37:04.688435+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1234, 352, 6, 'А3 это а6', '2022-10-02 05:23:15.860988+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1235, 349, 2, 'Сказали не надо был кто то из наших дымоход заброкавал ', '2022-10-02 05:26:52.354308+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1236, 349, 3, 'Был кто то из наших заброкавал дымоход сказала не приезжать', '2022-10-02 05:27:35.313894+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1237, 408, 7, 'Сейчас за выезд не могут платить на недели позвонят', '2022-10-02 05:30:58.509299+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1238, 347, 3, 'Не берут тел', '2022-10-02 05:34:46.078435+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1239, 386, 7, 'Не го ов', '2022-10-02 05:37:27.078083+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1240, 383, 6, 'Выполнили', '2022-10-02 05:38:53.247279+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1241, 416, 1, 'Нет гвс', '2022-10-02 06:16:37.07965+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1242, 417, 1, 'Е2', '2022-10-02 06:19:21.011854+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1243, 418, 1, 'Не включается', '2022-10-02 06:21:56.880379+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1244, 416, 2, '', '2022-10-02 07:54:27.20405+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1245, 416, 6, 'ГВС чистил', '2022-10-02 07:54:43.836662+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1246, 374, 2, '', '2022-10-02 10:46:24.35318+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1247, 374, 6, '', '2022-10-02 10:46:28.724311+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1248, 382, 2, '', '2022-10-02 10:50:11.447675+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1249, 382, 6, '', '2022-10-02 10:50:14.969541+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1250, 375, 2, '', '2022-10-02 10:54:46.735678+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1251, 375, 6, '', '2022-10-02 10:54:49.662729+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1252, 358, 2, '', '2022-10-02 10:59:25.493865+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1253, 358, 6, '', '2022-10-02 11:00:51.58943+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1254, 348, 2, '', '2022-10-02 11:03:21.445591+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1255, 276, 2, '', '2022-10-02 11:07:43.880188+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1256, 276, 6, '3хадавой заменил давноо', '2022-10-02 11:08:19.886512+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1257, 348, 6, 'Ложни визф', '2022-10-02 11:43:09.848987+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1258, 397, 2, '', '2022-10-03 03:44:18.935302+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1259, 397, 6, '', '2022-10-03 03:44:22.916832+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1260, 396, 2, '', '2022-10-03 03:44:47.713398+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1261, 396, 6, '', '2022-10-03 03:44:51.426841+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1262, 406, 2, '', '2022-10-03 04:28:29.900903+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1263, 406, 3, 'С клиентом созвонился переговорил . Повторно не берет трубку несколько дней уже', '2022-10-03 04:29:15.496885+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1264, 419, 1, 'Пнр', '2022-10-03 04:30:37.502333+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1265, 420, 1, 'А6', '2022-10-03 04:32:31.04158+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1266, 421, 1, 'Пнр', '2022-10-03 04:42:11.80788+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1267, 422, 1, 'Течет с котла', '2022-10-03 04:45:15.171426+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1268, 423, 1, 'Пнр на сегодня', '2022-10-03 05:00:23.424802+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1269, 424, 1, 'А4 аа', '2022-10-03 05:10:48.72662+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1270, 425, 1, 'Профилактика вторник среда', '2022-10-03 05:16:10.88245+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1271, 426, 1, 'Пнр', '2022-10-03 05:21:12.277334+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1272, 427, 1, 'Пнр', '2022-10-03 05:22:19.153254+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1273, 428, 1, 'Пнр', '2022-10-03 05:24:30.349898+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1274, 429, 1, 'Пнр', '2022-10-03 05:26:50.583569+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1275, 430, 1, 'Пнр', '2022-10-03 05:35:31.338824+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1276, 431, 1, 'Замена трехходового 26000', '2022-10-03 05:41:34.096134+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1277, 432, 1, 'Болер 200л не греет', '2022-10-03 05:49:06.515928+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1278, 433, 1, 'Болер 200л пнр немогут вкл.', '2022-10-03 05:51:17.105746+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1279, 419, 2, '', '2022-10-03 05:55:36.022722+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1280, 419, 6, '', '2022-10-03 05:55:39.938303+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1281, 424, 7, 'Клиент сказал на среду', '2022-10-03 06:00:44.922713+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1282, 422, 3, 'Клиент сам устранил', '2022-10-03 06:04:59.813478+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1283, 421, 2, '', '2022-10-03 06:17:24.231102+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1284, 420, 2, '', '2022-10-03 06:35:51.181108+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1285, 420, 6, '', '2022-10-03 06:35:54.799732+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1286, 421, 6, 'Дымоход уклон в нутрь', '2022-10-03 07:42:35.830801+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1287, 378, 2, '', '2022-10-03 07:57:04.740867+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1288, 430, 2, '', '2022-10-03 08:02:47.616678+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1289, 430, 6, '', '2022-10-03 08:02:52.005273+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1290, 428, 2, '', '2022-10-03 08:03:14.418443+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1291, 428, 6, '', '2022-10-03 08:03:17.40028+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1292, 378, 6, '', '2022-10-03 08:56:08.479378+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1293, 427, 2, '', '2022-10-03 09:21:51.929809+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1294, 427, 3, 'Повторяется ', '2022-10-03 09:22:08.067062+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1295, 426, 2, '', '2022-10-03 09:22:19.855409+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1296, 426, 6, '', '2022-10-03 09:22:23.183507+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1297, 384, 2, '', '2022-10-03 10:26:59.70015+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1298, 384, 6, '', '2022-10-03 10:27:03.177288+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1299, 431, 2, '', '2022-10-03 10:41:52.566417+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1300, 434, 1, 'Замена трехходового клапана. Озвученная стоимость работ с запчастью 26''000 тг. Позвонить предварительно', '2022-10-03 10:52:01.191285+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1301, 431, 6, '', '2022-10-03 11:39:29.201569+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1302, 435, 1, 'F05', '2022-10-03 14:13:35.830045+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1303, 435, 2, '', '2022-10-03 14:13:59.555888+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1304, 435, 6, '', '2022-10-03 15:00:05.77349+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1305, 435, 4, '', '2022-10-03 15:00:11.507679+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1306, 363, 2, '', '2022-10-03 16:10:51.300899+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1307, 363, 6, '', '2022-10-03 16:10:55.211871+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1308, 407, 7, 'Клиент созвонился с Игорем и сделал отбой говорит.', '2022-10-04 03:14:07.395301+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1309, 407, 2, '', '2022-10-04 05:23:23.239984+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1310, 407, 3, 'Клиент отказался', '2022-10-04 05:23:36.762997+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1311, 436, 1, 'Нет горячей воды', '2022-10-04 06:16:03.257391+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1312, 437, 1, 'ПНР пропан', '2022-10-04 06:17:10.969666+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1313, 438, 1, 'ПГР', '2022-10-04 06:18:47.960819+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1314, 439, 1, 'ПНР', '2022-10-04 06:21:49.578132+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1315, 440, 1, 'ПНР', '2022-10-04 06:23:54.89471+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1316, 441, 1, 'ПНР. клиент потеет. Если неошибаюсь, Бесагаш', '2022-10-04 06:25:48.445465+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1317, 442, 1, 'Кажется ПНР', '2022-10-04 06:36:26.937982+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1318, 443, 1, 'Ошибки А4, А5. СРОЧНО', '2022-10-04 06:37:28.89561+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1319, 437, 2, '', '2022-10-04 06:38:11.387129+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1320, 444, 1, 'Неисправно работает. Клиент потеет', '2022-10-04 06:38:50.206295+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1321, 445, 1, 'Ошибка А5. Скорее всего глючит датчик. Детский сад. СЕГОДНЯ НУЖНО ПОПАСТЬ', '2022-10-04 06:41:41.582378+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1322, 423, 2, '', '2022-10-04 06:42:55.538045+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1323, 423, 6, '', '2022-10-04 06:42:58.84477+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1324, 436, 3, 'Клиент сказал сделали сами', '2022-10-04 06:43:48.571826+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1325, 446, 1, 'Потекла вода. Ожидает срочно!', '2022-10-04 06:44:30.437377+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1326, 429, 2, '', '2022-10-04 06:46:15.087131+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1327, 429, 6, '', '2022-10-04 06:46:20.067875+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1328, 447, 1, 'Шумит', '2022-10-04 06:46:24.897774+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1329, 448, 1, 'Датчик давления. Капает с котла', '2022-10-04 06:48:15.320253+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1330, 449, 1, 'Утечка воды', '2022-10-04 06:49:54.797745+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1331, 450, 1, 'Давление воды не в норме', '2022-10-04 06:51:10.973307+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1332, 443, 2, '', '2022-10-04 06:52:06.332514+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1333, 451, 1, 'ПНР', '2022-10-04 06:52:37.996878+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1334, 452, 1, 'ПНР', '2022-10-04 06:53:31.296469+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1335, 453, 1, 'ПНР', '2022-10-04 06:54:31.872337+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1336, 437, 6, '', '2022-10-04 06:55:24.290986+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1337, 454, 1, 'ПНР', '2022-10-04 06:55:59.335107+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1338, 455, 1, 'Ошибка А08. После 18:00', '2022-10-04 06:58:14.575404+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1339, 456, 1, 'Профилактика', '2022-10-04 06:59:09.929368+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1340, 457, 1, 'Неисправно работает', '2022-10-04 07:00:34.559783+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1341, 458, 1, 'Замена трехходового клапана', '2022-10-04 07:01:39.953128+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1342, 438, 2, '', '2022-10-04 07:02:06.553382+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1343, 459, 1, 'Ошибка А6', '2022-10-04 07:02:42.684953+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1344, 460, 1, 'Потекла вода', '2022-10-04 07:03:28.235461+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1345, 461, 1, 'ПНР', '2022-10-04 07:07:08.774397+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1346, 462, 1, 'ПНР', '2022-10-04 07:07:56.055401+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1347, 463, 1, 'Профилактика', '2022-10-04 07:08:47.224163+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1348, 464, 1, 'ПНР', '2022-10-04 07:09:29.597788+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1349, 465, 1, 'Ошибка А5. СРОЧНО СЕГОДНЯ!', '2022-10-04 07:11:49.516986+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1350, 438, 6, '', '2022-10-04 07:52:45.62513+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1351, 434, 2, '', '2022-10-04 07:53:52.936586+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1352, 434, 6, '', '2022-10-04 07:53:56.562697+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1353, 448, 2, '', '2022-10-04 07:56:50.588473+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1354, 466, 1, 'ПНР', '2022-10-04 08:16:46.668192+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1355, 467, 1, 'Ошибка А6', '2022-10-04 08:17:52.71374+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1356, 468, 1, 'Профилактика', '2022-10-04 08:18:44.119395+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1357, 469, 1, 'Потекла вода с котла', '2022-10-04 08:19:33.062379+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1358, 448, 7, 'Нет датчика', '2022-10-04 09:13:08.573017+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1359, 449, 2, '', '2022-10-04 09:16:35.700343+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1360, 446, 2, '', '2022-10-04 09:56:31.719504+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1361, 446, 6, '', '2022-10-04 09:56:35.63185+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1362, 470, 1, 'ПНР двух котлов. Запуск каждого 40''000 тг. На завтра', '2022-10-04 10:21:55.486856+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1363, 449, 6, '', '2022-10-04 10:29:19.764073+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1364, 441, 2, '', '2022-10-04 10:30:32.42268+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1365, 441, 6, '', '2022-10-04 10:30:35.236784+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1366, 443, 6, '', '2022-10-04 10:47:28.967877+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1367, 458, 2, 'Не нада сказал', '2022-10-04 10:52:58.016973+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1368, 458, 6, '', '2022-10-04 10:53:02.25139+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1369, 448, 2, '', '2022-10-04 11:03:11.111326+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1370, 448, 6, '', '2022-10-04 11:33:00.275522+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1371, 464, 2, '', '2022-10-04 11:36:28.936464+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1372, 464, 6, '', '2022-10-04 11:36:33.027265+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1373, 451, 2, '', '2022-10-04 11:39:10.199406+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1374, 459, 2, '', '2022-10-04 11:42:21.418597+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1375, 459, 6, 'Не нада сказал ', '2022-10-04 11:42:39.281966+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1376, 451, 6, '', '2022-10-04 12:21:32.3524+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1377, 455, 2, '', '2022-10-04 12:38:58.175039+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1378, 455, 3, 'Ошибка а08. Начал делать диагностику на в ходе газ накапливается мах до 11 мбар на выходе 0.3-0.1 в газовой трубе нет давление газа не стоит газовый фильтр диэ.муфты. у клиента долг 5000 за диагностику', '2022-10-04 14:10:46.195984+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1379, 445, 2, '', '2022-10-05 05:46:43.073893+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1380, 445, 6, '', '2022-10-05 05:46:47.911741+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1381, 366, 2, '', '2022-10-05 05:47:35.347429+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1382, 366, 6, '', '2022-10-05 05:47:38.713366+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1383, 447, 3, 'Тел отключен второй день ', '2022-10-05 06:18:46.193718+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1384, 469, 2, '', '2022-10-05 07:40:44.44324+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1385, 469, 6, '', '2022-10-05 07:40:48.857178+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1386, 466, 2, '', '2022-10-05 07:42:23.437266+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1387, 466, 6, '', '2022-10-05 07:43:50.373833+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1388, 424, 2, '', '2022-10-05 08:08:25.837414+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1389, 424, 3, 'Китайский селтик битермический ', '2022-10-05 08:51:23.124338+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1390, 465, 2, '', '2022-10-05 10:16:52.034856+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1391, 465, 6, 'Прафилактика', '2022-10-05 10:17:08.283763+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1392, 333, 6, '', '2022-10-05 10:43:25.580753+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1393, 462, 2, '', '2022-10-05 10:46:17.220362+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1394, 462, 6, '', '2022-10-05 10:46:20.789454+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1395, 463, 2, '', '2022-10-06 03:39:22.386471+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1396, 463, 6, 'Прафилактика', '2022-10-06 03:39:36.390659+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1397, 471, 1, 'Пнр', '2022-10-06 04:28:03.099058+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1398, 472, 1, 'Пнр', '2022-10-06 04:32:18.812844+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1399, 473, 1, 'Течет с котла', '2022-10-06 04:40:19.100165+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1400, 474, 1, 'Не вкл.', '2022-10-06 04:42:50.358133+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1401, 475, 1, 'Пнр', '2022-10-06 04:47:07.636493+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1402, 470, 2, '', '2022-10-06 04:48:38.834046+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1403, 470, 6, '', '2022-10-06 04:48:43.27894+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1404, 467, 2, '', '2022-10-06 04:50:55.719132+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1405, 467, 6, '', '2022-10-06 04:50:59.702179+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1406, 452, 2, '', '2022-10-06 04:51:36.8022+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1407, 452, 6, '', '2022-10-06 04:51:39.867172+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1408, 450, 2, '', '2022-10-06 04:51:58.751668+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1409, 450, 6, '', '2022-10-06 04:52:01.723005+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1410, 442, 2, '', '2022-10-06 04:52:11.473368+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1411, 442, 6, '', '2022-10-06 04:52:21.961466+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1412, 453, 2, '', '2022-10-06 04:53:40.996952+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1413, 453, 6, '', '2022-10-06 04:53:43.784594+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1414, 454, 2, '', '2022-10-06 04:53:58.912001+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1415, 454, 6, '', '2022-10-06 04:54:03.312185+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1416, 444, 2, '', '2022-10-06 04:57:14.84233+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1417, 476, 1, 'Не вкл.', '2022-10-06 04:58:43.925384+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1418, 477, 1, 'Пнр', '2022-10-06 05:01:54.225779+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1419, 478, 1, 'Нет гвс', '2022-10-06 05:03:55.59541+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1420, 479, 1, 'Неисправно работает', '2022-10-06 05:08:14.54835+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1421, 480, 1, 'Профилактика 15000', '2022-10-06 05:13:12.399887+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1422, 481, 1, 'Пнр', '2022-10-06 05:15:03.008914+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1423, 482, 1, 'Пнр', '2022-10-06 05:18:22.722419+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1424, 483, 1, 'Неисправно работает', '2022-10-06 05:21:01.263406+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1425, 484, 1, 'Греется транс и МД. Выезд/диагностика 15''000. ', '2022-10-06 05:22:36.28869+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1426, 485, 1, 'Пнр', '2022-10-06 05:31:17.342285+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1427, 486, 1, 'Е2', '2022-10-06 05:38:28.268056+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1428, 444, 6, 'Платит не хочит', '2022-10-06 05:41:58.790323+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1429, 487, 1, 'Перевод на пропан', '2022-10-06 05:43:25.149371+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1430, 483, 2, '', '2022-10-06 05:46:40.163956+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1431, 483, 6, 'Платит не хочит', '2022-10-06 05:46:58.203935+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1432, 468, 2, 'Не нада ', '2022-10-06 05:50:55.68553+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1433, 468, 6, 'Отмена', '2022-10-06 05:51:03.448877+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1434, 472, 2, '', '2022-10-06 05:51:28.298672+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1435, 481, 2, '', '2022-10-06 05:52:59.647798+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1436, 481, 6, 'Ярослав был', '2022-10-06 05:53:23.161432+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1437, 488, 1, 'Профилактика', '2022-10-06 05:56:25.115143+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1438, 472, 6, '', '2022-10-06 06:26:47.794973+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1439, 471, 2, '', '2022-10-06 07:00:43.182647+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1440, 487, 7, 'Понедельник ', '2022-10-06 07:03:01.660126+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1441, 307, 6, '', '2022-10-06 07:09:14.66565+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1442, 471, 6, '', '2022-10-06 07:14:33.279706+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1443, 488, 2, '', '2022-10-06 07:21:19.845222+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1444, 488, 6, 'Отмена не нада сказал', '2022-10-06 07:21:37.355297+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1445, 480, 2, '', '2022-10-06 08:11:19.687671+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1446, 482, 2, '', '2022-10-06 08:52:00.131165+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1447, 482, 6, '', '2022-10-06 08:52:04.007896+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1448, 371, 2, '', '2022-10-06 08:53:27.120191+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1449, 371, 6, '', '2022-10-06 08:53:39.022673+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1450, 480, 6, '', '2022-10-06 09:22:48.149285+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1451, 485, 3, 'Отказался от гарантии. Магазин не предупредил что 5000', '2022-10-06 09:32:50.938727+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1452, 486, 2, '', '2022-10-06 10:00:43.993361+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1453, 486, 6, '', '2022-10-06 10:00:48.28235+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1454, 478, 2, '', '2022-10-06 11:14:39.344343+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1455, 478, 6, '', '2022-10-06 11:14:42.710499+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1456, 475, 2, '', '2022-10-06 12:29:23.608359+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1457, 475, 6, '', '2022-10-06 12:29:27.367202+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1458, 474, 2, '', '2022-10-06 12:29:47.366628+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1459, 474, 6, '', '2022-10-06 12:29:52.406405+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1460, 489, 1, 'Пнр', '2022-10-06 14:00:54.292962+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1461, 490, 1, 'Пнр', '2022-10-06 14:04:00.554754+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1462, 491, 1, 'Пнр. К запуску готов. Заранее позвонить', '2022-10-07 02:52:09.096734+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1463, 492, 1, 'А4 А3', '2022-10-07 03:46:39.203004+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1464, 493, 1, 'Пнр', '2022-10-07 03:49:11.701284+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1465, 494, 1, 'Пнр и второй  котёл ремонт трехходового', '2022-10-07 03:52:13.091386+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1466, 495, 1, 'Пнр', '2022-10-07 03:59:49.320969+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1467, 496, 1, 'Пнр', '2022-10-07 04:04:25.893179+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1468, 497, 1, 'Пнр', '2022-10-07 04:14:55.662056+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1469, 498, 1, 'Падает давление а4', '2022-10-07 04:19:49.004494+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1470, 473, 3, 'Номер не обслуживается', '2022-10-07 04:19:55.473163+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1471, 484, 2, '', '2022-10-07 04:20:22.300338+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1472, 484, 6, '', '2022-10-07 04:20:25.476586+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1473, 499, 1, 'Пнр', '2022-10-07 04:23:42.526149+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1474, 500, 1, 'Пнр', '2022-10-07 04:26:45.708456+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1475, 501, 1, 'Пнр', '2022-10-07 04:29:27.703247+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1476, 502, 1, 'Скачет давление', '2022-10-07 04:33:00.902945+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1477, 503, 1, 'Пнр', '2022-10-07 04:36:52.862016+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1478, 496, 3, 'Ошибка', '2022-10-07 04:39:52.446003+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1479, 504, 1, 'А6', '2022-10-07 04:45:35.17725+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1480, 505, 1, 'Пнр', '2022-10-07 04:50:21.078378+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1481, 506, 1, 'Пнр', '2022-10-07 05:05:48.215154+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1482, 507, 1, 'Нет гвс', '2022-10-07 05:08:17.631404+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1483, 508, 1, 'Трехходовой', '2022-10-07 05:12:44.212874+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1484, 509, 1, 'Ошибка FH', '2022-10-07 05:17:37.849467+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1485, 510, 1, 'Отключается', '2022-10-07 05:25:03.012444+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1486, 511, 1, 'Не греет дом 100т километр', '2022-10-07 05:40:20.614509+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1487, 495, 3, 'Клиент не верит что я хочу поставить на гарантию ', '2022-10-07 05:41:07.969825+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1488, 501, 3, 'У клиента с 2020 года стоит на гарантии и работает все хорошо', '2022-10-07 05:41:43.887384+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1489, 512, 1, 'Пнр срочно на сегодня', '2022-10-07 05:45:04.838266+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1490, 508, 2, '', '2022-10-07 05:49:15.810371+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1491, 492, 7, 'На завтратребунтся насос', '2022-10-07 06:10:42.651193+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1492, 502, 2, '', '2022-10-07 06:46:03.998434+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1493, 502, 6, '', '2022-10-07 06:46:06.920105+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1494, 456, 3, 'Валихану передал', '2022-10-07 07:09:57.384832+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1495, 508, 6, '', '2022-10-07 07:35:33.421937+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1496, 493, 2, '', '2022-10-07 07:36:13.83214+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1497, 493, 6, '', '2022-10-07 07:36:17.879901+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1498, 509, 3, 'Отмена', '2022-10-07 07:48:55.818113+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1499, 499, 2, '', '2022-10-07 08:27:41.422795+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1500, 507, 2, '', '2022-10-07 08:38:55.162111+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1501, 507, 6, '', '2022-10-07 08:39:02.636756+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1502, 461, 2, '', '2022-10-07 08:45:12.842766+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1503, 461, 6, '', '2022-10-07 08:45:16.686295+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1504, 460, 2, '', '2022-10-07 08:56:38.411318+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1505, 460, 6, 'Отмена', '2022-10-07 08:56:45.539114+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1506, 402, 2, '', '2022-10-07 08:58:43.449137+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1507, 402, 6, '', '2022-10-07 09:00:06.554402+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1508, 499, 6, '', '2022-10-07 09:02:41.439012+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1509, 506, 2, '', '2022-10-07 09:06:46.620371+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1510, 506, 6, '', '2022-10-07 09:06:49.826304+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1511, 505, 2, '', '2022-10-07 09:07:18.850904+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1512, 503, 2, '', '2022-10-07 09:44:48.703508+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1513, 503, 6, '', '2022-10-07 09:58:24.371135+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1514, 504, 2, '', '2022-10-07 10:07:42.658462+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1515, 504, 6, '', '2022-10-07 10:07:46.509739+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1516, 494, 2, '', '2022-10-07 10:08:06.510949+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1517, 494, 7, 'Вторник', '2022-10-07 10:08:15.398994+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1518, 505, 6, '', '2022-10-07 10:43:00.061007+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1519, 479, 2, '', '2022-10-07 11:21:04.835602+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1520, 479, 6, 'Ложни визф', '2022-10-07 11:21:21.153827+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1521, 408, 2, '', '2022-10-07 12:28:12.191815+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1522, 408, 3, 'Передал валихану ', '2022-10-07 12:28:26.22221+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1523, 487, 2, '', '2022-10-07 12:29:52.774402+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1524, 487, 3, 'Передал валихану ', '2022-10-07 12:30:10.582879+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1525, 386, 2, '', '2022-10-07 12:30:36.239602+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1526, 386, 3, 'Передал валихану', '2022-10-07 12:30:47.058731+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1527, 513, 1, 'Пнр', '2022-10-07 14:48:01.431922+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1528, 514, 1, 'Пнр', '2022-10-07 14:51:07.799878+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1529, 515, 1, 'Пнр', '2022-10-07 14:53:47.640558+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1530, 516, 1, 'Пнр', '2022-10-07 14:56:04.69944+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1531, 517, 1, 'Пнр на завтра обязательно', '2022-10-07 15:00:30.190085+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1532, 518, 1, 'Пнр', '2022-10-07 15:02:11.021674+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1533, 519, 1, 'Течёт с насоса', '2022-10-07 15:04:05.134387+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1534, 520, 1, 'Плохо греет дом', '2022-10-07 15:07:25.91392+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1535, 510, 2, '', '2022-10-07 15:56:01.576824+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1536, 510, 6, '', '2022-10-07 15:56:09.610372+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1537, 512, 2, '', '2022-10-07 15:59:09.860688+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1538, 512, 6, '', '2022-10-07 15:59:13.704203+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1539, 415, 2, '', '2022-10-07 16:06:37.541979+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1540, 415, 6, '3хадавой заменил', '2022-10-07 16:06:59.504287+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1541, 521, 1, 'Пнр', '2022-10-08 02:26:00.644344+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1542, 522, 1, 'Течёт с котла возможно трехходовой ', '2022-10-08 02:28:22.995621+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1543, 523, 1, 'Нет гвс', '2022-10-08 03:34:17.655402+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1544, 524, 1, 'Пнр', '2022-10-08 03:38:59.175543+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1545, 525, 1, 'Пнр', '2022-10-08 03:42:35.150339+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1546, 497, 2, '', '2022-10-08 03:44:10.645277+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1547, 526, 1, 'Пнр сегодня обязательно', '2022-10-08 03:47:25.847491+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1548, 527, 1, ' Поменять жилеты на природный газ сказал 5000', '2022-10-08 03:55:34.059948+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1549, 528, 1, 'Пнр', '2022-10-08 04:18:41.793536+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1550, 479, 4, '', '2022-10-08 04:19:23.49156+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1551, 480, 4, '', '2022-10-08 04:19:59.175439+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1552, 502, 4, '', '2022-10-08 04:20:36.375479+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1553, 481, 4, '', '2022-10-08 04:20:57.891566+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1554, 482, 4, '', '2022-10-08 04:21:23.890192+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1555, 483, 4, '', '2022-10-08 04:21:44.303432+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1556, 484, 4, '', '2022-10-08 04:22:05.330928+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1557, 486, 4, '', '2022-10-08 04:22:41.496456+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1558, 488, 4, '', '2022-10-08 04:23:15.064013+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1559, 497, 6, '', '2022-10-08 04:42:40.000687+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1560, 515, 2, '', '2022-10-08 04:43:37.438343+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1561, 529, 1, 'Пнр 8000', '2022-10-08 04:54:44.05574+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1562, 515, 6, '', '2022-10-08 05:34:26.26898+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1563, 516, 2, '', '2022-10-08 05:36:19.812334+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1564, 516, 6, '', '2022-10-08 05:36:23.740606+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1565, 514, 2, '', '2022-10-08 05:36:52.981962+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1566, 514, 6, '', '2022-10-08 06:00:32.223393+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1567, 524, 2, '', '2022-10-08 07:08:26.132993+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1568, 524, 6, '', '2022-10-08 07:24:57.245533+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1569, 527, 2, '', '2022-10-08 07:25:46.631272+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1570, 527, 6, '', '2022-10-08 08:10:20.817288+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1571, 498, 2, '', '2022-10-08 08:26:57.248469+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1572, 498, 6, '', '2022-10-08 09:12:45.242197+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1573, 520, 2, '', '2022-10-08 09:16:46.397636+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1574, 521, 2, '', '2022-10-08 09:31:24.491181+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1575, 521, 6, '', '2022-10-08 09:31:28.090135+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1576, 520, 6, 'Замена 3клапан оплатили 10000 долг 16000', '2022-10-08 10:12:35.534601+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1577, 500, 3, 'Не правильный номер', '2022-10-08 10:17:44.105085+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1578, 523, 2, '', '2022-10-10 04:05:08.109472+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1579, 523, 6, '', '2022-10-10 04:05:11.759372+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1580, 530, 1, 'Пнр', '2022-10-10 04:08:20.135072+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1581, 531, 1, 'Пнр', '2022-10-10 04:10:39.103497+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1582, 522, 2, '', '2022-10-10 04:11:22.382268+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1583, 522, 6, '', '2022-10-10 04:11:27.466504+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1584, 532, 1, 'Течёт с котла', '2022-10-10 04:14:30.598837+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1585, 533, 1, 'Пнр 10000', '2022-10-10 04:18:10.198997+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1586, 534, 1, 'Профилактика 15000', '2022-10-10 04:22:33.446258+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1587, 535, 1, 'Сломал с ростом клапан ', '2022-10-10 04:25:26.696199+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1588, 536, 1, 'Пнр', '2022-10-10 04:38:23.512347+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1589, 537, 1, 'Замена теплообменника', '2022-10-10 04:42:11.314848+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1590, 532, 2, '', '2022-10-10 04:48:19.160925+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1591, 535, 3, 'Клиент отремонтировал сам', '2022-10-10 04:51:18.300317+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1592, 538, 1, 'Пнр', '2022-10-10 05:01:43.444972+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1593, 525, 2, '', '2022-10-10 05:03:39.63586+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1594, 525, 6, '', '2022-10-10 05:03:43.473082+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1595, 539, 1, 'Нет гвс', '2022-10-10 05:05:12.202523+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1596, 540, 1, 'Пнр', '2022-10-10 05:07:09.157399+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1597, 532, 6, '', '2022-10-10 05:52:19.365807+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1598, 513, 2, '', '2022-10-10 05:59:08.772735+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1599, 530, 3, 'Не готов к пнр', '2022-10-10 06:09:33.797845+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1600, 541, 1, 'Пнр', '2022-10-10 06:11:02.848848+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1601, 513, 6, '', '2022-10-10 07:04:24.257224+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1602, 534, 2, '', '2022-10-10 07:05:29.770567+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1603, 539, 2, '', '2022-10-10 08:08:10.534142+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1604, 542, 1, 'Замена датчика протока по гарантии.', '2022-10-10 08:51:30.999512+00', 32);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1605, 491, 2, '', '2022-10-10 09:08:47.888848+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1606, 491, 6, '', '2022-10-10 09:08:52.945337+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1607, 538, 2, '', '2022-10-10 10:07:28.598909+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1608, 538, 6, '', '2022-10-10 10:07:34.766392+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1609, 534, 6, '', '2022-10-10 10:20:20.728354+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1610, 536, 2, '', '2022-10-10 10:26:29.523235+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1611, 541, 2, '', '2022-10-10 10:34:39.499305+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1612, 541, 6, '', '2022-10-10 10:34:43.649781+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1613, 533, 2, '', '2022-10-10 11:19:33.708708+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1614, 533, 6, '', '2022-10-10 11:19:37.936751+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1615, 536, 6, '', '2022-10-10 11:58:57.888007+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1616, 537, 2, '', '2022-10-10 12:00:33.205928+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1617, 528, 2, '', '2022-10-10 12:07:13.437592+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1618, 528, 6, 'Ярослав был', '2022-10-10 12:07:33.762004+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1619, 529, 2, '', '2022-10-10 12:20:56.613771+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1620, 529, 6, '', '2022-10-10 12:20:59.944546+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1621, 537, 6, '', '2022-10-10 13:40:36.135645+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1622, 543, 1, 'Пнр', '2022-10-10 15:09:35.113045+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1623, 544, 1, 'Чистка пятница до обеда ', '2022-10-10 15:11:38.444503+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1624, 545, 1, 'Не работает сенсор ', '2022-10-10 15:14:17.360604+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1625, 546, 1, 'Пнр', '2022-10-10 15:17:24.062373+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1626, 547, 1, 'Пнр перевод на пропан субота ', '2022-10-10 15:20:24.165448+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1627, 548, 1, 'Пнр', '2022-10-10 15:22:35.428863+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1628, 549, 1, 'Пнр', '2022-10-10 15:24:35.185192+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1629, 550, 1, 'Пнр', '2022-10-10 15:27:02.707123+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1630, 551, 1, 'Профилактика', '2022-10-10 15:29:20.190632+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1631, 552, 1, 'Не включается ', '2022-10-10 15:31:54.837934+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1632, 553, 1, 'Пнр', '2022-10-10 15:33:49.397499+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1633, 554, 1, 'Пнр', '2022-10-10 15:36:20.542213+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1634, 555, 1, 'Бахает при запуске течёт с котла', '2022-10-10 15:42:00.705989+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1635, 556, 1, 'Чистка 2 котла', '2022-10-10 15:43:52.503561+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1636, 557, 1, 'Е3', '2022-10-10 15:46:48.415473+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1637, 557, 2, '', '2022-10-11 03:43:29.712824+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1638, 558, 1, 'Пнр', '2022-10-11 03:45:44.12431+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1639, 559, 1, 'Пнр', '2022-10-11 03:55:56.717191+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1640, 560, 1, '101', '2022-10-11 04:04:22.198489+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1641, 561, 1, 'Нет циркуляции ', '2022-10-11 04:08:05.471185+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1642, 557, 6, '', '2022-10-11 05:29:08.262894+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1643, 558, 2, '', '2022-10-11 05:30:05.064148+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1644, 519, 2, '', '2022-10-11 05:45:32.183538+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1645, 519, 6, '', '2022-10-11 05:45:35.71215+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1646, 558, 6, '', '2022-10-11 06:01:01.26563+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1647, 556, 2, '', '2022-10-11 06:01:40.911276+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1648, 548, 2, '', '2022-10-11 07:00:45.140381+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1649, 556, 6, '', '2022-10-11 07:45:06.822147+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1650, 542, 2, '', '2022-10-11 07:58:56.527276+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1651, 542, 6, '', '2022-10-11 09:04:50.405297+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1652, 555, 2, '', '2022-10-11 09:08:58.245817+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1653, 559, 2, '', '2022-10-11 09:28:42.560184+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1654, 559, 6, '', '2022-10-11 09:28:48.39655+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1655, 546, 2, '', '2022-10-11 09:51:30.043808+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1656, 546, 6, '', '2022-10-11 09:51:33.547327+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1657, 548, 6, '', '2022-10-11 09:51:49.617874+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1658, 555, 6, '', '2022-10-11 11:03:28.343468+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1659, 543, 2, '', '2022-10-11 11:24:08.598846+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1660, 543, 6, '', '2022-10-11 11:36:57.622313+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1661, 494, 2, '', '2022-10-11 11:58:01.625438+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1662, 494, 6, '', '2022-10-11 11:58:05.955135+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1663, 547, 2, '', '2022-10-11 12:50:10.947037+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1664, 547, 6, '', '2022-10-11 12:50:14.256234+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1665, 551, 2, '', '2022-10-11 15:53:59.972244+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1666, 551, 6, '', '2022-10-11 15:54:03.924584+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1667, 549, 2, '', '2022-10-11 15:55:55.30885+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1668, 549, 6, '', '2022-10-11 15:55:58.423744+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1669, 562, 1, 'Пнр', '2022-10-12 04:16:39.646579+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1670, 563, 1, 'Пнр', '2022-10-12 04:18:53.384981+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1671, 564, 1, 'Пнр', '2022-10-12 04:20:39.358265+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1672, 565, 1, 'Замена трехходового 2.50', '2022-10-12 04:23:40.285254+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1673, 566, 1, 'Пнр', '2022-10-12 04:25:08.518742+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1674, 566, 3, 'Уже запустил', '2022-10-12 04:34:41.642661+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1675, 567, 1, 'Пнр', '2022-10-12 04:38:28.339996+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1676, 568, 1, 'Чистка', '2022-10-12 04:46:06.0737+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1677, 569, 1, 'Настроить кател', '2022-10-12 04:49:26.539245+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1678, 570, 1, 'Пнр', '2022-10-12 04:52:16.039994+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1679, 571, 1, 'Пнр', '2022-10-12 04:55:14.778479+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1680, 572, 1, 'Пнр', '2022-10-12 04:57:07.966883+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1681, 573, 1, 'Не греет дом', '2022-10-12 05:02:53.505875+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1682, 574, 1, 'Нет циркуляции ', '2022-10-12 05:15:29.654452+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1683, 575, 1, 'Пнр', '2022-10-12 05:18:32.176449+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1684, 563, 2, '', '2022-10-12 05:20:46.746212+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1685, 576, 1, 'Гудит', '2022-10-12 05:20:56.125828+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1686, 573, 2, '', '2022-10-12 06:33:59.735955+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1687, 573, 6, '', '2022-10-12 06:34:04.983535+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1688, 563, 6, '', '2022-10-12 06:57:29.145831+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1689, 564, 2, '', '2022-10-12 06:59:10.681379+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1690, 564, 6, '', '2022-10-12 07:27:02.717475+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1691, 562, 2, '', '2022-10-12 07:29:16.312756+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1692, 574, 2, '', '2022-10-12 08:21:01.261349+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1693, 574, 6, '', '2022-10-12 08:21:04.329068+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1694, 562, 6, '', '2022-10-12 08:37:57.46029+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1695, 567, 2, '', '2022-10-12 08:57:31.126402+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1696, 572, 2, '', '2022-10-12 09:01:58.829681+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1697, 572, 6, '', '2022-10-12 09:02:01.94393+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1698, 567, 6, '', '2022-10-12 09:04:15.497822+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1699, 571, 2, '', '2022-10-12 11:00:37.686511+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1700, 571, 6, '', '2022-10-12 11:00:41.268216+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1701, 568, 2, '', '2022-10-12 11:45:14.202923+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1702, 568, 6, 'Диагностика', '2022-10-12 11:55:49.897833+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1703, 552, 2, '', '2022-10-12 11:56:30.132498+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1704, 552, 6, '', '2022-10-12 11:56:33.644148+00', 40);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1705, 576, 2, '', '2022-10-12 12:08:12.132504+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1706, 576, 6, '', '2022-10-12 12:08:15.41927+00', 38);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1707, 561, 3, 'Отказ', '2022-10-12 14:25:12.751891+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1708, 518, 2, '', '2022-10-12 14:25:38.232064+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1709, 518, 6, '', '2022-10-12 14:25:42.165758+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1710, 490, 2, '', '2022-10-12 14:27:50.558772+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1711, 490, 6, '', '2022-10-12 14:27:55.057953+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1712, 526, 2, '', '2022-10-12 14:28:24.116576+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1713, 526, 6, '', '2022-10-12 14:28:28.218883+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1714, 489, 2, '', '2022-10-12 14:28:52.572539+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1715, 489, 6, '', '2022-10-12 14:28:57.769123+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1716, 517, 2, '', '2022-10-12 14:30:11.44935+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1717, 517, 6, '', '2022-10-12 14:30:14.443226+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1718, 492, 2, '', '2022-10-12 14:30:38.989291+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1719, 492, 6, '', '2022-10-12 14:30:44.230772+00', 36);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1720, 577, 1, 'Аа а4', '2022-10-13 03:40:28.051364+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1721, 578, 1, 'Гудит насос', '2022-10-13 03:47:39.699597+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1722, 579, 1, 'Пнр', '2022-10-13 03:56:06.376178+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1723, 580, 1, 'Пнр', '2022-10-13 04:05:23.517838+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1724, 565, 2, '', '2022-10-13 04:05:26.869465+00', 39);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1725, 581, 1, 'Пнр', '2022-10-13 04:10:24.833376+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1726, 582, 1, 'Пнр', '2022-10-13 04:18:43.569826+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1727, 583, 1, 'Пнр', '2022-10-13 04:23:32.984937+00', 42);
INSERT INTO "service-crm"."ordersStatusHistory" (id, "orderId", status, comment, "createdDate", "createdBy") VALUES (1728, 584, 1, 'Чистка', '2022-10-13 04:26:01.586868+00', 42);


--
-- Data for Name: serviceManPaidOuts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (160, 39, 2500, 0, 0, 189, '2022-06-27 03:33:15.125596+00', '2022-06-27 04:30:40.230183+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (161, 39, 2500, 0, 0, 190, '2022-06-27 04:31:41.641191+00', '2022-06-27 04:31:41.641191+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (162, 40, 0, 0, 0, 191, '2022-06-27 08:28:57.606233+00', '2022-06-27 08:28:57.606233+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (164, 40, 500, 0, 5000, 193, '2022-06-30 03:22:57.755602+00', '2022-06-30 03:22:57.755602+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (165, 36, 12500, 0, 0, 194, '2022-06-30 03:27:04.706169+00', '2022-06-30 03:27:04.706169+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (166, 36, 0, 0, 0, 195, '2022-06-30 04:24:03.165321+00', '2022-06-30 11:20:57.192242+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (169, 36, 12500, 0, 3000, 198, '2022-07-03 05:57:59.921268+00', '2022-07-03 05:57:59.921268+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (168, 40, 500, 8250, 2000, 197, '2022-07-01 02:54:03.073175+00', '2022-07-04 03:26:36.444844+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (163, 36, 4000, 0, 0, 192, '2022-06-30 03:19:18.598308+00', '2022-07-04 03:30:52.585879+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (170, 38, 0, 2880, 5000, 199, '2022-07-04 08:35:40.483442+00', '2022-07-04 08:35:40.483442+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (171, 36, 2500, 0, 0, 200, '2022-07-04 08:38:24.780855+00', '2022-07-04 08:41:30.406864+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (172, 36, 12500, 0, 0, 201, '2022-07-04 08:42:42.416711+00', '2022-07-04 08:42:42.416711+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (173, 39, 5500, 0, 2000, 202, '2022-07-04 08:48:47.018762+00', '2022-07-04 08:49:54.737369+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (174, 38, 2500, 0, 2000, 203, '2022-07-05 03:39:44.726455+00', '2022-07-05 03:39:44.726455+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (175, 40, 0, 0, 2000, 204, '2022-07-05 04:39:15.765172+00', '2022-07-05 04:39:15.765172+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (176, 40, 2500, 0, 0, 205, '2022-07-05 04:42:15.495129+00', '2022-07-05 04:42:15.495129+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (178, 36, 6500, 0, 0, 207, '2022-07-05 09:49:38.398261+00', '2022-07-05 09:49:38.398261+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (177, 40, 0, 0, 0, 206, '2022-07-05 05:32:55.253587+00', '2022-07-05 10:21:52.340987+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (179, 39, 7500, 3420, 0, 208, '2022-07-05 10:32:44.325652+00', '2022-07-05 10:32:44.325652+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (180, 36, 2500, 0, 0, 209, '2022-07-07 05:28:59.335463+00', '2022-07-07 05:28:59.335463+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (181, 40, 2500, 0, 0, 210, '2022-07-07 05:32:42.293598+00', '2022-07-07 05:32:42.293598+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (182, 40, 0, 0, 0, 211, '2022-07-07 05:36:28.480397+00', '2022-07-07 05:36:28.480397+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (183, 36, 2500, 0, 2000, 212, '2022-07-07 07:00:40.076135+00', '2022-07-07 07:00:40.076135+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (184, 40, 2500, 0, 0, 213, '2022-07-08 03:17:26.837241+00', '2022-07-08 03:17:26.837241+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (185, 40, 0, 0, 2000, 214, '2022-07-08 03:19:38.871824+00', '2022-07-08 03:19:38.871824+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (186, 36, 12500, 0, 0, 215, '2022-07-08 03:22:23.506373+00', '2022-07-08 03:22:23.506373+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (187, 36, 2500, 0, 0, 216, '2022-07-08 09:29:53.251119+00', '2022-07-08 09:29:53.251119+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (189, 37, 0, 0, 0, 218, '2022-07-10 05:18:41.172675+00', '2022-07-10 05:18:41.172675+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (190, 39, 7500, 0, 0, 219, '2022-07-11 03:19:35.571963+00', '2022-07-11 03:19:35.571963+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (188, 40, 0, 0, 5000, 217, '2022-07-08 09:34:24.389292+00', '2022-07-11 03:42:20.152252+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (192, 36, 2500, 0, 0, 221, '2022-07-11 04:24:50.753296+00', '2022-07-11 04:24:50.753296+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (193, 36, 2500, 0, 0, 222, '2022-07-12 05:35:21.950863+00', '2022-07-12 05:35:21.950863+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (194, 36, 12500, 0, 0, 223, '2022-07-12 14:54:56.040879+00', '2022-07-12 14:54:56.040879+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (195, 36, 0, 0, 0, 224, '2022-07-12 14:57:47.668947+00', '2022-07-12 14:57:47.668947+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (191, 36, 2500, 0, 0, 220, '2022-07-11 03:23:41.396547+00', '2022-07-12 14:58:20.171115+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (159, 39, 0, 0, 2500, 188, '2022-06-24 05:00:49.162576+00', '2022-07-13 04:16:55.887197+00', true);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (167, 37, 0, 0, 0, 196, '2022-06-30 06:26:56.295136+00', '2022-07-13 04:56:37.393804+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (196, 37, 0, 0, 0, 225, '2022-07-14 09:57:37.961374+00', '2022-07-14 09:57:37.961374+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (197, 37, 0, 0, 0, 226, '2022-07-15 08:49:14.009629+00', '2022-07-15 10:03:44.419761+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (198, 36, 2500, 0, 0, 227, '2022-07-15 15:44:04.442165+00', '2022-07-15 15:44:04.442165+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (199, 36, 0, 0, 0, 228, '2022-07-16 03:05:18.145114+00', '2022-07-16 03:05:18.145114+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (200, 36, 12500, 0, 0, 229, '2022-07-16 03:37:17.555397+00', '2022-07-16 03:37:17.555397+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (202, 36, 0, 0, 2000, 231, '2022-07-18 03:08:59.376801+00', '2022-07-18 03:08:59.376801+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (203, 39, 0, 0, 5000, 232, '2022-07-18 03:11:59.718769+00', '2022-07-18 03:11:59.718769+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (201, 39, 2500, 0, 0, 230, '2022-07-16 09:58:28.287195+00', '2022-07-18 03:28:46.723022+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (204, 38, 0, 0, 0, 233, '2022-07-18 04:22:17.97746+00', '2022-07-18 04:22:17.97746+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (205, 39, 2500, 0, 3000, 234, '2022-07-18 04:25:42.463564+00', '2022-07-18 04:25:42.463564+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (206, 36, 6000, 0, 0, 235, '2022-07-18 09:01:27.252149+00', '2022-07-18 11:24:07.044355+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (207, 39, 2500, 0, 0, 236, '2022-07-19 03:20:06.614981+00', '2022-07-19 03:20:06.614981+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (208, 36, 0, 0, 2000, 237, '2022-07-19 03:23:02.493319+00', '2022-07-19 03:23:02.493319+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (209, 36, 0, 0, 0, 238, '2022-07-19 03:25:01.525416+00', '2022-07-19 03:25:01.525416+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (210, 36, 2500, 0, 5000, 239, '2022-07-20 06:25:33.749014+00', '2022-07-20 06:25:33.749014+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (211, 36, 0, 0, 0, 240, '2022-07-20 06:29:25.958343+00', '2022-07-20 06:29:25.958343+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (212, 36, 0, 0, 0, 241, '2022-07-20 06:31:22.950997+00', '2022-07-20 06:31:22.950997+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (213, 36, 0, 0, 2000, 242, '2022-07-21 03:14:11.998591+00', '2022-07-21 03:14:11.998591+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (214, 36, 7500, 0, 0, 243, '2022-07-21 13:17:11.970311+00', '2022-07-21 13:18:16.925799+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (215, 36, 7500, 0, 0, 244, '2022-07-22 05:57:26.772328+00', '2022-07-22 05:57:26.772328+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (216, 36, 0, 0, 0, 245, '2022-07-22 06:05:44.205958+00', '2022-07-22 06:05:44.205958+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (217, 40, 0, 0, 2000, 246, '2022-07-22 06:07:49.252417+00', '2022-07-22 06:07:49.252417+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (218, 40, 0, 0, 0, 247, '2022-07-22 06:09:53.25192+00', '2022-07-22 06:09:53.25192+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (219, 40, 0, 0, 2000, 248, '2022-07-22 06:20:55.349138+00', '2022-07-22 06:20:55.349138+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (220, 40, 0, 0, 2000, 249, '2022-07-22 08:10:58.305283+00', '2022-07-22 08:10:58.305283+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (221, 36, 0, 0, 0, 250, '2022-07-23 02:32:17.514733+00', '2022-07-23 02:32:17.514733+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (222, 40, 2500, 0, 0, 251, '2022-07-25 03:40:40.190446+00', '2022-07-25 03:40:40.190446+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (223, 36, 0, 0, 0, 252, '2022-07-25 03:42:43.731072+00', '2022-07-25 03:42:43.731072+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (224, 40, 2500, 0, 2000, 253, '2022-07-27 06:10:34.374969+00', '2022-07-27 06:10:34.374969+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (227, 40, 2500, 0, 0, 256, '2022-07-30 03:42:58.128839+00', '2022-07-30 03:42:58.128839+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (225, 39, 2500, 0, 0, 254, '2022-07-29 14:01:18.43781+00', '2022-07-30 04:09:36.995007+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (230, 40, 12500, 0, 2000, 259, '2022-08-03 04:44:40.104876+00', '2022-08-03 04:44:40.104876+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (226, 39, 0, 0, 0, 255, '2022-07-29 14:21:54.034664+00', '2022-07-30 04:36:25.96567+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (228, 40, 12500, 0, 0, 257, '2022-08-01 07:01:06.968601+00', '2022-08-01 07:01:06.968601+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (229, 39, 0, 0, 0, 258, '2022-08-01 07:14:15.764558+00', '2022-08-01 07:14:15.764558+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (231, 36, 0, 0, 0, 260, '2022-08-05 05:19:36.886862+00', '2022-08-05 05:19:36.886862+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (233, 36, 12500, 0, 0, 262, '2022-08-08 04:00:41.329818+00', '2022-08-08 04:00:41.329818+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (234, 40, 0, 0, 2000, 263, '2022-08-08 04:26:44.185786+00', '2022-08-08 04:26:44.185786+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (232, 40, 1500, 3770, 3300, 261, '2022-08-05 06:40:15.727722+00', '2022-08-08 04:27:35.647299+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (235, 36, 0, 0, 2000, 264, '2022-08-09 06:59:05.365767+00', '2022-08-09 06:59:05.365767+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (236, 36, 2500, 0, 0, 265, '2022-08-09 07:30:08.722326+00', '2022-08-09 07:30:08.722326+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (237, 36, 7500, 0, 0, 266, '2022-08-09 08:12:37.415349+00', '2022-08-09 08:12:37.415349+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (238, 40, 12500, 0, 0, 267, '2022-08-11 03:51:07.879258+00', '2022-08-11 03:51:07.879258+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (239, 40, 2500, 0, 0, 268, '2022-08-11 04:22:45.498188+00', '2022-08-11 04:22:45.498188+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (240, 39, 0, 0, 0, 269, '2022-08-23 04:08:25.885398+00', '2022-08-23 04:08:25.885398+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (241, 39, 0, 0, 0, 270, '2022-08-23 04:08:43.906295+00', '2022-08-23 04:08:43.906295+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (242, 36, 0, 0, 0, 271, '2022-09-13 05:02:15.138709+00', '2022-09-13 05:02:15.138709+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (243, 36, 0, 0, 0, 272, '2022-09-14 07:40:24.675985+00', '2022-09-14 07:40:24.675985+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (245, 36, 12500, 0, 0, 274, '2022-09-16 03:54:05.4488+00', '2022-09-16 03:54:05.4488+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (246, 39, 12500, 0, 0, 275, '2022-09-16 03:57:27.502329+00', '2022-09-16 03:57:27.502329+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (247, 40, 2500, 0, 0, 276, '2022-09-16 04:02:12.164517+00', '2022-09-16 04:02:12.164517+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (248, 39, 2500, 0, 0, 277, '2022-09-16 04:26:41.021554+00', '2022-09-16 04:26:41.021554+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (250, 36, 12500, 0, 0, 279, '2022-09-16 05:31:49.642015+00', '2022-09-16 05:31:49.642015+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (244, 38, 2500, 0, 0, 273, '2022-09-14 11:34:24.757422+00', '2022-09-16 06:18:48.501345+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (251, 36, 0, 0, 0, 280, '2022-09-16 06:29:17.530312+00', '2022-09-16 06:29:17.530312+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (249, 36, 2500, 0, 0, 278, '2022-09-16 04:58:39.638211+00', '2022-09-17 03:40:01.38698+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (252, 39, 12500, 0, 0, 281, '2022-09-17 02:09:05.223046+00', '2022-09-17 03:25:44.314451+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (253, 39, 2500, 0, 0, 282, '2022-09-17 04:06:36.131796+00', '2022-09-17 04:06:36.131796+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (254, 38, 2500, 0, 2000, 283, '2022-09-17 04:19:36.339318+00', '2022-09-17 04:19:36.339318+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (255, 39, 12500, 0, 0, 284, '2022-09-17 04:52:53.030487+00', '2022-09-17 04:52:53.030487+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (256, 39, 2500, 0, 0, 285, '2022-09-17 07:44:37.418511+00', '2022-09-17 07:44:37.418511+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (257, 39, 0, 0, 0, 286, '2022-09-17 12:00:55.887953+00', '2022-09-17 12:00:55.887953+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (258, 36, 0, 0, 0, 288, '2022-09-17 12:11:23.805483+00', '2022-09-17 12:11:23.805483+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (259, 39, 2500, 0, 4000, 289, '2022-09-17 12:16:02.693461+00', '2022-09-17 12:16:46.023323+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (260, 38, 2500, 0, 0, 290, '2022-09-17 12:21:27.093198+00', '2022-09-17 12:21:27.093198+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (261, 39, 0, 0, 4000, 291, '2022-09-17 12:24:33.986804+00', '2022-09-17 12:24:33.986804+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (262, 39, 0, 0, 2000, 292, '2022-09-17 12:28:19.135886+00', '2022-09-17 12:28:19.135886+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (263, 39, 0, 0, 5000, 293, '2022-09-19 05:38:52.476926+00', '2022-09-19 05:38:52.476926+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (264, 39, 0, 0, 2000, 294, '2022-09-19 05:42:13.022623+00', '2022-09-19 05:42:13.022623+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (265, 36, 0, 0, 2000, 295, '2022-09-19 05:45:03.086045+00', '2022-09-19 05:45:03.086045+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (267, 39, 0, 0, 2000, 297, '2022-09-19 05:48:15.411193+00', '2022-09-19 05:48:15.411193+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (268, 36, 2500, 0, 3000, 298, '2022-09-19 05:50:42.133373+00', '2022-09-19 05:50:42.133373+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (338, 36, 10500, 1650, 3500, 373, '2022-09-29 04:07:42.008259+00', '2022-09-29 04:08:26.196593+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (340, 40, 0, 0, 5000, 375, '2022-09-29 04:10:22.93343+00', '2022-09-29 04:10:22.93343+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (269, 36, 0, 0, 2000, 299, '2022-09-19 05:57:35.711788+00', '2022-09-19 05:59:15.412182+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (270, 39, 0, 0, 5000, 300, '2022-09-19 06:02:23.429355+00', '2022-09-19 06:02:23.429355+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (266, 36, 0, 0, 2000, 296, '2022-09-19 05:46:15.853591+00', '2022-09-19 06:25:17.071289+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (271, 39, 2500, 0, 2000, 301, '2022-09-23 05:09:26.169177+00', '2022-09-23 05:09:26.169177+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (272, 39, 2500, 0, 2000, 302, '2022-09-23 05:58:16.329562+00', '2022-09-23 05:58:16.329562+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (273, 36, 0, 0, 2000, 304, '2022-09-23 06:02:20.1797+00', '2022-09-23 06:02:20.1797+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (274, 39, 0, 0, 5000, 305, '2022-09-23 06:16:04.663656+00', '2022-09-23 06:16:04.663656+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (276, 36, 2500, 0, 0, 307, '2022-09-23 07:13:34.390851+00', '2022-09-23 07:13:34.390851+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (275, 36, 0, 0, 5000, 306, '2022-09-23 06:18:35.038425+00', '2022-09-23 07:29:05.405961+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (277, 39, 5000, 0, 0, 308, '2022-09-24 07:07:21.436569+00', '2022-09-24 07:07:21.436569+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (278, 36, 0, 0, 2000, 310, '2022-09-24 07:12:42.850793+00', '2022-09-24 07:12:42.850793+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (279, 36, 2500, 0, 5000, 311, '2022-09-24 07:19:00.680295+00', '2022-09-24 07:19:00.680295+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (280, 36, 0, 0, 3000, 313, '2022-09-24 07:21:41.634438+00', '2022-09-24 07:21:41.634438+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (281, 36, 2500, 0, 0, 314, '2022-09-26 03:46:55.699016+00', '2022-09-26 03:46:55.699016+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (282, 39, 7500, 0, 0, 315, '2022-09-26 03:54:29.694445+00', '2022-09-26 03:54:29.694445+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (283, 39, 0, 0, 0, 316, '2022-09-26 03:58:11.592443+00', '2022-09-26 03:58:11.592443+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (284, 38, 7500, 0, 0, 317, '2022-09-26 04:02:16.688278+00', '2022-09-26 04:02:16.688278+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (285, 36, 2500, 0, 2000, 318, '2022-09-26 05:07:12.300975+00', '2022-09-26 05:07:12.300975+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (286, 39, 0, 0, 0, 319, '2022-09-26 05:20:48.091141+00', '2022-09-26 05:20:48.091141+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (287, 40, 0, 0, 2000, 320, '2022-09-26 07:29:17.831284+00', '2022-09-26 07:29:17.831284+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (288, 40, 0, 0, 2000, 321, '2022-09-26 07:31:07.293959+00', '2022-09-26 07:31:07.293959+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (289, 40, 0, 0, 0, 322, '2022-09-26 07:32:55.106336+00', '2022-09-26 07:32:55.106336+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (290, 40, 0, 0, 5000, 323, '2022-09-26 07:35:31.040945+00', '2022-09-26 07:35:31.040945+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (291, 40, 0, 0, 2000, 324, '2022-09-26 07:37:36.059995+00', '2022-09-26 07:37:36.059995+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (292, 41, 0, 0, 0, 327, '2022-09-26 08:42:57.623681+00', '2022-09-26 08:42:57.623681+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (293, 36, 2500, 0, 0, 328, '2022-09-26 14:09:45.016542+00', '2022-09-26 14:09:45.016542+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (294, 40, 0, 0, 0, 329, '2022-09-26 14:13:30.342537+00', '2022-09-26 14:13:30.342537+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (295, 39, 0, 0, 0, 330, '2022-09-27 02:17:18.224011+00', '2022-09-27 02:17:18.224011+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (296, 39, 0, 0, 2000, 331, '2022-09-27 02:19:30.322585+00', '2022-09-27 02:19:30.322585+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (297, 39, 0, 0, 2000, 332, '2022-09-27 02:21:30.174208+00', '2022-09-27 02:21:30.174208+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (298, 36, 0, 0, 0, 333, '2022-09-27 02:23:43.721799+00', '2022-09-27 02:23:43.721799+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (299, 40, 0, 0, 5000, 334, '2022-09-27 02:25:18.413388+00', '2022-09-27 02:26:16.347146+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (300, 40, 0, 0, 2000, 335, '2022-09-27 02:27:40.054483+00', '2022-09-27 02:27:40.054483+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (301, 40, 0, 0, 5000, 336, '2022-09-27 02:29:30.356505+00', '2022-09-27 02:29:30.356505+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (302, 40, 0, 0, 2000, 337, '2022-09-27 02:31:14.016071+00', '2022-09-27 02:31:14.016071+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (303, 40, 0, 0, 2000, 338, '2022-09-27 02:32:34.675556+00', '2022-09-27 02:32:34.675556+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (304, 40, 0, 0, 2000, 339, '2022-09-27 02:34:16.642411+00', '2022-09-27 02:34:16.642411+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (305, 36, 0, 0, 0, 340, '2022-09-27 02:36:07.476665+00', '2022-09-27 02:36:07.476665+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (306, 39, 0, 0, 2000, 341, '2022-09-27 02:38:14.726279+00', '2022-09-27 02:38:14.726279+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (307, 39, 0, 0, 0, 342, '2022-09-27 02:41:26.556015+00', '2022-09-27 02:41:26.556015+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (308, 39, 2500, 0, 2000, 343, '2022-09-27 03:37:07.574966+00', '2022-09-27 03:37:07.574966+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (309, 40, 0, 0, 5000, 344, '2022-09-27 03:43:49.139374+00', '2022-09-27 03:43:49.139374+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (310, 40, 0, 0, 5000, 345, '2022-09-27 09:52:49.076556+00', '2022-09-27 09:52:49.076556+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (311, 36, 7500, 0, 0, 346, '2022-09-28 04:11:56.603923+00', '2022-09-28 04:11:56.603923+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (312, 36, 12500, 0, 0, 347, '2022-09-28 04:28:22.357521+00', '2022-09-28 04:28:22.357521+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (313, 40, 0, 0, 2000, 348, '2022-09-28 04:30:11.868528+00', '2022-09-28 04:30:11.868528+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (314, 36, 0, 0, 0, 349, '2022-09-28 04:32:34.85828+00', '2022-09-28 04:32:34.85828+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (315, 39, 0, 0, 2000, 350, '2022-09-28 04:34:18.27485+00', '2022-09-28 04:34:18.27485+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (316, 40, 0, 0, 2000, 351, '2022-09-28 04:35:56.950941+00', '2022-09-28 04:35:56.950941+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (317, 36, 2500, 0, 0, 352, '2022-09-28 07:20:26.441577+00', '2022-09-28 07:20:26.441577+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (318, 39, 0, 0, 2000, 353, '2022-09-28 07:23:04.091259+00', '2022-09-28 07:23:04.091259+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (319, 36, 0, 0, 0, 354, '2022-09-28 07:24:59.086234+00', '2022-09-28 07:24:59.086234+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (320, 40, 0, 0, 0, 355, '2022-09-28 07:28:39.4055+00', '2022-09-28 07:28:39.4055+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (321, 40, 0, 0, 0, 356, '2022-09-28 07:30:42.793679+00', '2022-09-28 07:30:42.793679+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (322, 40, 0, 0, 0, 357, '2022-09-28 07:32:17.97952+00', '2022-09-28 07:32:17.97952+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (323, 40, 2500, 0, 0, 358, '2022-09-28 07:35:10.515031+00', '2022-09-28 07:35:10.515031+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (324, 36, 12500, 0, 0, 359, '2022-09-28 07:39:05.85829+00', '2022-09-28 07:39:05.85829+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (325, 40, 0, 0, 2000, 360, '2022-09-28 07:43:39.194199+00', '2022-09-28 07:43:39.194199+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (326, 39, 12500, 0, 5000, 361, '2022-09-28 07:46:52.421625+00', '2022-09-28 07:46:52.421625+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (327, 39, 0, 0, 0, 362, '2022-09-28 07:49:02.257155+00', '2022-09-28 07:49:02.257155+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (328, 39, 0, 0, 2000, 363, '2022-09-28 07:52:13.288351+00', '2022-09-28 07:52:13.288351+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (329, 38, 0, 0, 2000, 364, '2022-09-28 07:53:33.277966+00', '2022-09-28 07:53:33.277966+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (330, 40, 0, 0, 0, 365, '2022-09-28 07:56:01.883007+00', '2022-09-28 07:56:01.883007+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (331, 36, 12500, 0, 0, 366, '2022-09-28 07:58:41.819672+00', '2022-09-28 07:58:41.819672+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (332, 38, 0, 0, 2000, 367, '2022-09-29 03:45:01.928055+00', '2022-09-29 03:45:01.928055+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (333, 39, 12500, 0, 0, 368, '2022-09-29 03:48:45.838264+00', '2022-09-29 03:48:45.838264+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (334, 39, 7500, 0, 0, 369, '2022-09-29 03:54:06.934874+00', '2022-09-29 03:54:06.934874+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (335, 39, 0, 0, 0, 370, '2022-09-29 03:57:53.920145+00', '2022-09-29 03:57:53.920145+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (336, 40, 0, 0, 5000, 371, '2022-09-29 04:01:51.046594+00', '2022-09-29 04:01:51.046594+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (337, 40, 0, 0, 2000, 372, '2022-09-29 04:04:38.871107+00', '2022-09-29 04:04:38.871107+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (339, 40, 0, 0, 5000, 374, '2022-09-29 04:08:20.558887+00', '2022-09-29 04:08:20.558887+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (341, 36, 7500, 0, 0, 376, '2022-09-29 05:01:33.603446+00', '2022-09-29 05:01:53.088401+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (342, 39, 0, 0, 4000, 377, '2022-09-29 08:28:17.09996+00', '2022-09-29 08:43:30.210983+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (343, 39, 2500, 0, 0, 378, '2022-09-29 14:34:16.514819+00', '2022-09-29 14:34:16.514819+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (344, 36, 7500, 0, 0, 379, '2022-09-29 14:42:45.262637+00', '2022-09-29 14:42:45.262637+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (345, 36, 0, 0, 0, 380, '2022-09-29 14:45:32.65396+00', '2022-09-29 14:45:32.65396+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (346, 36, 0, 0, 0, 381, '2022-09-29 14:53:28.376388+00', '2022-09-29 14:53:28.376388+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (347, 40, 0, 0, 3000, 382, '2022-09-29 14:55:44.091816+00', '2022-09-29 14:55:44.091816+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (348, 36, 0, 0, 0, 383, '2022-09-29 14:58:08.610252+00', '2022-09-29 14:58:08.610252+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (349, 36, 0, 0, 0, 384, '2022-09-29 15:01:01.15636+00', '2022-09-29 15:01:01.15636+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (350, 39, 0, 0, 2000, 385, '2022-09-29 15:04:17.352262+00', '2022-09-29 15:04:17.352262+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (351, 36, 0, 0, 0, 386, '2022-09-29 15:07:05.027467+00', '2022-09-29 15:07:05.027467+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (352, 40, 0, 0, 2000, 387, '2022-09-29 15:09:57.578531+00', '2022-09-29 15:09:57.578531+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (353, 40, 0, 0, 2000, 388, '2022-09-29 15:13:02.689375+00', '2022-09-29 15:13:02.689375+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (354, 39, 0, 0, 0, 389, '2022-09-29 15:15:06.062813+00', '2022-09-29 15:15:06.062813+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (355, 36, 0, 0, 2000, 390, '2022-09-29 15:22:52.893463+00', '2022-09-29 15:22:52.893463+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (356, 39, 2500, 0, 2000, 391, '2022-09-30 01:42:16.370883+00', '2022-09-30 01:42:16.370883+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (357, 39, 2500, 0, 2000, 392, '2022-09-30 01:44:24.576272+00', '2022-09-30 01:44:24.576272+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (358, 38, 2500, 0, 0, 393, '2022-09-30 01:46:19.214244+00', '2022-09-30 01:46:19.214244+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (359, 38, 2500, 0, 0, 394, '2022-09-30 01:49:09.344485+00', '2022-09-30 01:49:09.344485+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (360, 39, 0, 0, 0, 395, '2022-09-30 01:51:56.596217+00', '2022-09-30 01:51:56.596217+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (361, 38, 0, 0, 0, 396, '2022-09-30 01:53:44.664373+00', '2022-09-30 01:53:44.664373+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (362, 38, 2500, 0, 3000, 397, '2022-09-30 03:34:32.855919+00', '2022-09-30 03:34:32.855919+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (363, 36, 0, 0, 0, 398, '2022-09-30 03:39:19.011445+00', '2022-09-30 03:39:19.011445+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (364, 40, 0, 0, 0, 399, '2022-09-30 03:41:20.466055+00', '2022-09-30 03:41:20.466055+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (365, 36, 12500, 0, 2000, 400, '2022-09-30 03:43:45.223652+00', '2022-09-30 03:43:45.223652+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (366, 40, 0, 0, 0, 401, '2022-09-30 03:46:16.819458+00', '2022-09-30 03:46:16.819458+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (367, 40, 2500, 0, 2000, 402, '2022-09-30 03:51:42.273384+00', '2022-09-30 03:51:42.273384+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (368, 36, 12500, 0, 0, 403, '2022-09-30 03:53:42.964704+00', '2022-09-30 03:53:42.964704+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (369, 36, 0, 0, 5000, 404, '2022-09-30 06:03:01.25256+00', '2022-09-30 06:03:01.25256+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (370, 40, 12500, 0, 5000, 405, '2022-09-30 06:05:59.665374+00', '2022-09-30 06:05:59.665374+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (371, 39, 0, 0, 5000, 406, '2022-09-30 06:16:56.748561+00', '2022-09-30 06:16:56.748561+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (372, 39, 7500, 0, 5000, 407, '2022-09-30 07:06:24.821873+00', '2022-09-30 07:06:24.821873+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (373, 36, 0, 0, 5000, 408, '2022-09-30 07:12:12.207752+00', '2022-09-30 07:12:12.207752+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (374, 39, 0, 5800, 5000, 409, '2022-09-30 08:34:17.092598+00', '2022-09-30 08:35:22.075781+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (375, 39, 0, 0, 2000, 410, '2022-10-01 03:32:17.066822+00', '2022-10-01 03:32:17.066822+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (376, 39, 12500, 0, 0, 411, '2022-10-01 03:37:56.298532+00', '2022-10-01 03:37:56.298532+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (377, 36, 0, 0, 0, 412, '2022-10-01 03:42:00.145151+00', '2022-10-01 03:42:00.145151+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (378, 38, 0, 0, 0, 413, '2022-10-01 03:52:02.636698+00', '2022-10-01 03:52:02.636698+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (379, 40, 0, 0, 0, 414, '2022-10-02 04:03:52.088448+00', '2022-10-02 04:03:52.088448+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (380, 40, 2500, 0, 0, 415, '2022-10-02 04:06:02.086545+00', '2022-10-02 04:06:02.086545+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (381, 40, 2500, 0, 0, 416, '2022-10-02 06:16:37.085085+00', '2022-10-02 06:16:37.085085+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (382, 40, 2500, 0, 0, 417, '2022-10-02 06:19:21.017176+00', '2022-10-02 06:19:21.017176+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (383, 40, 2500, 0, 2000, 418, '2022-10-02 06:21:56.885927+00', '2022-10-02 06:21:56.885927+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (384, 39, 0, 0, 0, 419, '2022-10-03 04:30:37.505892+00', '2022-10-03 04:30:37.505892+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (385, 36, 0, 0, 0, 420, '2022-10-03 04:32:31.045413+00', '2022-10-03 04:32:31.045413+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (386, 39, 2500, 0, 4000, 421, '2022-10-03 04:42:11.815436+00', '2022-10-03 04:42:11.815436+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (387, 39, 2500, 0, 2000, 422, '2022-10-03 04:45:15.176347+00', '2022-10-03 04:45:15.176347+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (388, 40, 0, 0, 2000, 423, '2022-10-03 05:00:23.428124+00', '2022-10-03 05:00:23.428124+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (389, 39, 2500, 0, 0, 424, '2022-10-03 05:10:48.732335+00', '2022-10-03 05:10:48.732335+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (390, 36, 0, 0, 0, 425, '2022-10-03 05:16:10.886256+00', '2022-10-03 05:16:10.886256+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (391, 36, 0, 0, 0, 426, '2022-10-03 05:21:12.280936+00', '2022-10-03 05:21:12.280936+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (392, 36, 0, 0, 0, 427, '2022-10-03 05:22:19.156925+00', '2022-10-03 05:22:19.156925+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (393, 36, 0, 0, 0, 428, '2022-10-03 05:24:30.353624+00', '2022-10-03 05:24:30.353624+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (394, 40, 0, 0, 2000, 429, '2022-10-03 05:26:50.586942+00', '2022-10-03 05:26:50.586942+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (395, 36, 0, 0, 0, 430, '2022-10-03 05:35:31.342628+00', '2022-10-03 05:35:31.342628+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (396, 39, 0, 0, 0, 431, '2022-10-03 05:41:34.09985+00', '2022-10-03 05:42:26.204211+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (397, 38, 0, 0, 0, 432, '2022-10-03 05:49:06.519903+00', '2022-10-03 05:49:06.519903+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (398, 38, 0, 0, 0, 433, '2022-10-03 05:51:17.109344+00', '2022-10-03 05:51:17.109344+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (399, 36, 0, 0, 5000, 434, '2022-10-03 10:52:01.195118+00', '2022-10-03 10:52:01.195118+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (400, 41, 0, 0, 0, 435, '2022-10-03 14:13:35.834034+00', '2022-10-03 14:13:35.834034+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (401, 39, 0, 0, 5000, 436, '2022-10-04 06:16:03.261085+00', '2022-10-04 06:16:03.261085+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (402, 39, 0, 0, 5000, 437, '2022-10-04 06:17:10.973448+00', '2022-10-04 06:17:10.973448+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (403, 39, 0, 0, 5000, 438, '2022-10-04 06:18:47.964688+00', '2022-10-04 06:19:39.649495+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (404, 38, 0, 0, 5000, 439, '2022-10-04 06:21:49.581629+00', '2022-10-04 06:21:49.581629+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (405, 38, 0, 0, 5000, 440, '2022-10-04 06:23:54.89833+00', '2022-10-04 06:23:54.89833+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (406, 39, 0, 0, 5000, 441, '2022-10-04 06:25:48.449293+00', '2022-10-04 06:25:48.449293+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (407, 38, 0, 0, 5000, 442, '2022-10-04 06:36:26.941821+00', '2022-10-04 06:36:26.941821+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (408, 40, 0, 0, 5000, 443, '2022-10-04 06:37:28.899178+00', '2022-10-04 06:37:28.899178+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (409, 40, 0, 0, 5000, 444, '2022-10-04 06:38:50.209788+00', '2022-10-04 06:38:50.209788+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (410, 36, 0, 0, 5000, 445, '2022-10-04 06:41:41.585951+00', '2022-10-04 06:41:41.585951+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (411, 36, 0, 0, 5000, 446, '2022-10-04 06:44:30.440868+00', '2022-10-04 06:44:30.440868+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (412, 36, 0, 0, 5000, 447, '2022-10-04 06:46:24.901226+00', '2022-10-04 06:46:24.901226+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (413, 39, 0, 0, 5000, 448, '2022-10-04 06:48:15.323421+00', '2022-10-04 06:48:15.323421+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (414, 39, 0, 0, 5000, 449, '2022-10-04 06:49:54.800888+00', '2022-10-04 06:49:54.800888+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (415, 38, 0, 0, 5000, 450, '2022-10-04 06:51:10.976677+00', '2022-10-04 06:51:10.976677+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (416, 39, 0, 0, 5000, 451, '2022-10-04 06:52:38.000245+00', '2022-10-04 06:52:38.000245+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (417, 38, 0, 0, 5000, 452, '2022-10-04 06:53:31.300182+00', '2022-10-04 06:53:31.300182+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (418, 38, 0, 0, 5000, 453, '2022-10-04 06:54:31.876157+00', '2022-10-04 06:54:31.876157+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (419, 38, 0, 0, 5000, 454, '2022-10-04 06:55:59.338694+00', '2022-10-04 06:55:59.338694+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (420, 39, 0, 0, 5000, 455, '2022-10-04 06:58:14.579144+00', '2022-10-04 06:58:14.579144+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (421, 36, 0, 0, 5000, 456, '2022-10-04 06:59:09.93282+00', '2022-10-04 06:59:09.93282+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (423, 40, 0, 0, 5000, 458, '2022-10-04 07:01:39.956796+00', '2022-10-04 07:01:39.956796+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (424, 40, 0, 0, 5000, 459, '2022-10-04 07:02:42.688277+00', '2022-10-04 07:02:42.688277+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (425, 40, 0, 0, 5000, 460, '2022-10-04 07:03:28.239131+00', '2022-10-04 07:03:28.239131+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (426, 40, 0, 0, 5000, 461, '2022-10-04 07:07:08.77844+00', '2022-10-04 07:07:08.77844+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (427, 40, 0, 0, 5000, 462, '2022-10-04 07:07:56.059292+00', '2022-10-04 07:07:56.059292+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (428, 40, 0, 0, 5000, 463, '2022-10-04 07:08:47.227856+00', '2022-10-04 07:08:47.227856+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (429, 40, 0, 0, 5000, 464, '2022-10-04 07:09:29.601388+00', '2022-10-04 07:09:29.601388+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (430, 40, 0, 0, 5000, 465, '2022-10-04 07:11:49.52071+00', '2022-10-04 07:11:49.52071+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (422, 40, 0, 0, 5000, 457, '2022-10-04 07:00:34.563156+00', '2022-10-04 07:59:36.613569+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (431, 40, 0, 0, 5000, 466, '2022-10-04 08:16:46.671949+00', '2022-10-04 08:16:46.671949+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (432, 38, 0, 0, 5000, 467, '2022-10-04 08:17:52.717401+00', '2022-10-04 08:17:52.717401+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (433, 40, 0, 0, 5000, 468, '2022-10-04 08:18:44.122558+00', '2022-10-04 08:18:44.122558+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (434, 40, 0, 0, 5000, 469, '2022-10-04 08:19:33.065782+00', '2022-10-04 08:19:33.065782+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (435, 38, 0, 0, 80000, 470, '2022-10-04 10:21:55.490934+00', '2022-10-05 05:06:41.481627+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (436, 39, 0, 0, 0, 471, '2022-10-06 04:28:03.102603+00', '2022-10-06 04:28:03.102603+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (437, 39, 0, 0, 0, 472, '2022-10-06 04:32:18.81631+00', '2022-10-06 04:32:18.81631+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (438, 38, 0, 0, 0, 473, '2022-10-06 04:40:19.103999+00', '2022-10-06 04:40:19.103999+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (439, 38, 0, 0, 0, 474, '2022-10-06 04:42:50.362403+00', '2022-10-06 04:42:50.362403+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (440, 38, 0, 0, 0, 475, '2022-10-06 04:47:07.639818+00', '2022-10-06 04:47:07.639818+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (441, 40, 0, 0, 2000, 476, '2022-10-06 04:58:43.929261+00', '2022-10-06 04:58:43.929261+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (442, 40, 0, 0, 0, 477, '2022-10-06 05:01:54.229641+00', '2022-10-06 05:01:54.229641+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (443, 40, 0, 0, 2000, 478, '2022-10-06 05:03:55.598964+00', '2022-10-06 05:03:55.598964+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (444, 40, 0, 0, 0, 479, '2022-10-06 05:08:14.552298+00', '2022-10-06 05:08:14.552298+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (445, 39, 0, 0, 0, 480, '2022-10-06 05:13:12.404052+00', '2022-10-06 05:13:12.404052+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (446, 40, 0, 0, 5000, 481, '2022-10-06 05:15:03.012413+00', '2022-10-06 05:15:03.012413+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (447, 40, 0, 0, 5000, 482, '2022-10-06 05:18:22.726215+00', '2022-10-06 05:18:22.726215+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (448, 40, 0, 0, 2000, 483, '2022-10-06 05:21:01.26702+00', '2022-10-06 05:21:01.26702+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (449, 38, 0, 0, 0, 484, '2022-10-06 05:22:36.292335+00', '2022-10-06 05:22:36.292335+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (450, 39, 0, 0, 2000, 485, '2022-10-06 05:31:17.34601+00', '2022-10-06 05:31:17.34601+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (451, 36, 0, 0, 2000, 486, '2022-10-06 05:38:28.271413+00', '2022-10-06 05:38:28.271413+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (452, 36, 0, 0, 0, 487, '2022-10-06 05:43:25.153079+00', '2022-10-06 05:43:25.153079+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (453, 40, 0, 0, 5000, 488, '2022-10-06 05:56:25.120123+00', '2022-10-06 05:56:25.120123+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (454, 36, 0, 0, 0, 489, '2022-10-06 14:00:54.296758+00', '2022-10-06 14:00:54.296758+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (455, 36, 0, 0, 0, 490, '2022-10-06 14:04:00.558225+00', '2022-10-06 14:04:00.558225+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (457, 36, 2500, 0, 0, 492, '2022-10-07 03:46:39.208907+00', '2022-10-07 03:46:39.208907+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (458, 36, 0, 0, 0, 493, '2022-10-07 03:49:11.704968+00', '2022-10-07 03:49:11.704968+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (459, 36, 0, 0, 0, 494, '2022-10-07 03:52:13.095143+00', '2022-10-07 03:52:13.095143+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (507, 39, 0, 0, 0, 542, '2022-10-10 08:51:31.003472+00', '2022-10-12 07:32:46.143755+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (460, 39, 0, 0, 0, 495, '2022-10-07 03:59:49.324844+00', '2022-10-07 03:59:49.324844+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (461, 36, 0, 0, 0, 496, '2022-10-07 04:04:25.897282+00', '2022-10-07 04:04:25.897282+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (462, 39, 0, 0, 0, 497, '2022-10-07 04:14:55.666463+00', '2022-10-07 04:14:55.666463+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (464, 39, 0, 0, 0, 499, '2022-10-07 04:23:42.530176+00', '2022-10-07 04:23:42.530176+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (465, 39, 0, 0, 5000, 500, '2022-10-07 04:26:45.711679+00', '2022-10-07 04:26:45.711679+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (466, 39, 0, 0, 0, 501, '2022-10-07 04:29:27.707065+00', '2022-10-07 04:29:27.707065+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (467, 36, 0, 0, 0, 502, '2022-10-07 04:33:00.906705+00', '2022-10-07 04:33:00.906705+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (468, 39, 0, 0, 0, 503, '2022-10-07 04:36:52.865482+00', '2022-10-07 04:36:52.865482+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (469, 36, 0, 0, 0, 504, '2022-10-07 04:45:35.181192+00', '2022-10-07 04:45:35.181192+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (470, 38, 0, 0, 0, 505, '2022-10-07 04:50:21.081809+00', '2022-10-07 04:50:21.081809+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (463, 39, 0, 0, 0, 498, '2022-10-07 04:19:49.008171+00', '2022-10-07 04:54:48.27859+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (471, 38, 0, 0, 0, 506, '2022-10-07 05:05:48.218938+00', '2022-10-07 05:05:48.218938+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (472, 40, 0, 0, 2000, 507, '2022-10-07 05:08:17.634802+00', '2022-10-07 05:08:17.634802+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (473, 39, 0, 0, 0, 508, '2022-10-07 05:12:44.216706+00', '2022-10-07 05:12:44.216706+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (474, 38, 0, 0, 0, 509, '2022-10-07 05:17:37.852802+00', '2022-10-07 05:17:37.852802+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (475, 40, 0, 0, 2000, 510, '2022-10-07 05:25:03.015861+00', '2022-10-07 05:25:03.015861+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (476, 40, 0, 0, 5000, 511, '2022-10-07 05:40:20.618211+00', '2022-10-07 05:40:20.618211+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (477, 40, 0, 0, 0, 512, '2022-10-07 05:45:04.841842+00', '2022-10-07 05:45:04.841842+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (478, 39, 2500, 0, 3000, 513, '2022-10-07 14:48:01.445501+00', '2022-10-07 14:48:54.60974+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (479, 39, 0, 0, 0, 514, '2022-10-07 14:51:07.803229+00', '2022-10-07 14:51:07.803229+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (480, 39, 0, 0, 0, 515, '2022-10-07 14:53:47.644364+00', '2022-10-07 14:53:47.644364+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (481, 39, 0, 0, 0, 516, '2022-10-07 14:56:04.703069+00', '2022-10-07 14:56:04.703069+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (482, 36, 0, 0, 0, 517, '2022-10-07 15:00:30.193657+00', '2022-10-07 15:00:30.193657+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (483, 36, 0, 0, 0, 518, '2022-10-07 15:02:11.028999+00', '2022-10-07 15:02:11.028999+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (484, 36, 0, 0, 0, 519, '2022-10-07 15:04:05.138013+00', '2022-10-07 15:04:05.138013+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (485, 39, 0, 0, 0, 520, '2022-10-07 15:07:25.917998+00', '2022-10-07 15:07:25.917998+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (486, 40, 0, 0, 0, 521, '2022-10-08 02:26:00.647919+00', '2022-10-08 02:26:00.647919+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (487, 40, 0, 0, 0, 522, '2022-10-08 02:28:22.999264+00', '2022-10-08 02:28:22.999264+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (488, 38, 0, 0, 2000, 523, '2022-10-08 03:34:17.65904+00', '2022-10-08 03:34:17.65904+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (489, 39, 0, 0, 0, 524, '2022-10-08 03:38:59.179239+00', '2022-10-08 03:38:59.179239+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (490, 40, 0, 0, 2000, 525, '2022-10-08 03:42:35.154118+00', '2022-10-08 03:42:35.154118+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (491, 36, 0, 0, 0, 526, '2022-10-08 03:47:25.850705+00', '2022-10-08 03:47:25.850705+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (492, 39, 0, 0, 5000, 527, '2022-10-08 03:55:34.063674+00', '2022-10-08 03:55:34.063674+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (493, 40, 0, 0, 0, 528, '2022-10-08 04:18:41.797705+00', '2022-10-08 04:18:41.797705+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (494, 38, 0, 0, 3000, 529, '2022-10-08 04:54:44.059579+00', '2022-10-08 04:54:44.059579+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (495, 39, 0, 0, 0, 530, '2022-10-10 04:08:20.13866+00', '2022-10-10 04:08:20.13866+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (497, 39, 0, 0, 0, 532, '2022-10-10 04:14:30.602633+00', '2022-10-10 04:14:30.602633+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (496, 38, 0, 0, 2000, 531, '2022-10-10 04:10:39.106734+00', '2022-10-10 04:15:03.290071+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (498, 38, 0, 0, 5000, 533, '2022-10-10 04:18:10.20271+00', '2022-10-10 04:18:10.20271+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (499, 39, 0, 0, 5000, 534, '2022-10-10 04:22:33.449637+00', '2022-10-10 04:22:33.449637+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (500, 39, 0, 0, 0, 535, '2022-10-10 04:25:26.70038+00', '2022-10-10 04:25:26.70038+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (501, 39, 0, 0, 0, 536, '2022-10-10 04:38:23.516124+00', '2022-10-10 04:38:23.516124+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (502, 39, 0, 0, 0, 537, '2022-10-10 04:42:11.318309+00', '2022-10-10 04:42:11.318309+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (503, 40, 0, 0, 2000, 538, '2022-10-10 05:01:43.448543+00', '2022-10-10 05:01:43.448543+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (504, 40, 0, 0, 2000, 539, '2022-10-10 05:05:12.206143+00', '2022-10-10 05:05:12.206143+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (505, 40, 0, 0, 0, 540, '2022-10-10 05:07:09.161434+00', '2022-10-10 05:07:09.161434+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (506, 38, 0, 0, 2000, 541, '2022-10-10 06:11:02.852341+00', '2022-10-10 06:11:02.852341+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (456, 39, 0, 0, 0, 491, '2022-10-07 02:52:09.100908+00', '2022-10-10 08:29:15.735483+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (508, 39, 0, 0, 0, 543, '2022-10-10 15:09:35.116994+00', '2022-10-10 15:09:35.116994+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (509, 39, 0, 0, 0, 544, '2022-10-10 15:11:38.448152+00', '2022-10-10 15:11:38.448152+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (510, 38, 0, 0, 2000, 545, '2022-10-10 15:14:17.364427+00', '2022-10-10 15:14:17.364427+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (511, 38, 0, 0, 3000, 546, '2022-10-10 15:17:24.065976+00', '2022-10-10 15:17:24.065976+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (512, 38, 0, 0, 5000, 547, '2022-10-10 15:20:24.170364+00', '2022-10-10 15:20:24.170364+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (513, 38, 0, 0, 2000, 548, '2022-10-10 15:22:35.432078+00', '2022-10-10 15:22:35.432078+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (514, 40, 0, 0, 2000, 549, '2022-10-10 15:24:35.188515+00', '2022-10-10 15:24:35.188515+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (515, 40, 0, 0, 0, 550, '2022-10-10 15:27:02.710921+00', '2022-10-10 15:27:02.710921+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (516, 40, 0, 0, 5000, 551, '2022-10-10 15:29:20.194108+00', '2022-10-10 15:29:20.194108+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (517, 40, 0, 0, 2000, 552, '2022-10-10 15:31:54.841347+00', '2022-10-10 15:31:54.841347+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (518, 40, 0, 0, 2000, 553, '2022-10-10 15:33:49.40108+00', '2022-10-10 15:33:49.40108+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (519, 40, 0, 0, 0, 554, '2022-10-10 15:36:20.545979+00', '2022-10-10 15:36:20.545979+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (520, 39, 0, 0, 0, 555, '2022-10-10 15:42:00.709473+00', '2022-10-10 15:42:00.709473+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (521, 39, 0, 0, 0, 556, '2022-10-10 15:43:52.507218+00', '2022-10-10 15:43:52.507218+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (522, 39, 0, 0, 0, 557, '2022-10-10 15:46:48.419064+00', '2022-10-10 15:46:48.419064+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (523, 39, 0, 0, 0, 558, '2022-10-11 03:45:44.127737+00', '2022-10-11 03:45:44.127737+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (524, 38, 0, 0, 3000, 559, '2022-10-11 03:55:56.720755+00', '2022-10-11 03:55:56.720755+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (525, 38, 0, 0, 5000, 560, '2022-10-11 04:04:22.201856+00', '2022-10-11 04:04:22.201856+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (526, 36, 0, 0, 0, 561, '2022-10-11 04:08:05.474691+00', '2022-10-11 04:08:05.474691+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (527, 39, 0, 0, 2000, 562, '2022-10-12 04:16:39.650357+00', '2022-10-12 04:16:39.650357+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (528, 39, 0, 0, 5000, 563, '2022-10-12 04:18:53.388934+00', '2022-10-12 04:18:53.388934+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (529, 39, 0, 0, 5000, 564, '2022-10-12 04:20:39.361957+00', '2022-10-12 04:20:39.361957+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (530, 39, 0, 0, 2000, 565, '2022-10-12 04:23:40.288982+00', '2022-10-12 04:23:40.288982+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (531, 39, 0, 0, 0, 566, '2022-10-12 04:25:08.52225+00', '2022-10-12 04:25:08.52225+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (532, 39, 0, 0, 0, 567, '2022-10-12 04:38:28.344776+00', '2022-10-12 04:38:28.344776+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (533, 40, 0, 0, 0, 568, '2022-10-12 04:46:06.077475+00', '2022-10-12 04:46:06.077475+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (534, 40, 0, 0, 3000, 569, '2022-10-12 04:49:26.542876+00', '2022-10-12 04:49:26.542876+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (535, 40, 0, 0, 0, 570, '2022-10-12 04:52:16.043777+00', '2022-10-12 04:52:16.043777+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (536, 36, 0, 0, 0, 571, '2022-10-12 04:55:14.782106+00', '2022-10-12 04:55:14.782106+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (537, 36, 0, 0, 0, 572, '2022-10-12 04:57:07.970521+00', '2022-10-12 04:57:07.970521+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (538, 36, 0, 0, 0, 573, '2022-10-12 05:02:53.509444+00', '2022-10-12 05:02:53.509444+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (539, 36, 0, 0, 0, 574, '2022-10-12 05:15:29.65799+00', '2022-10-12 05:15:29.65799+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (540, 38, 0, 0, 0, 575, '2022-10-12 05:18:32.180331+00', '2022-10-12 05:18:32.180331+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (541, 38, 0, 0, 0, 576, '2022-10-12 05:20:56.129305+00', '2022-10-12 05:20:56.129305+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (542, 39, 0, 0, 0, 577, '2022-10-13 03:40:28.057967+00', '2022-10-13 03:40:28.057967+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (543, 39, 0, 0, 0, 578, '2022-10-13 03:47:39.703178+00', '2022-10-13 03:47:39.703178+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (544, 39, 0, 0, 0, 579, '2022-10-13 03:56:06.379889+00', '2022-10-13 03:56:44.047547+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (545, 38, 0, 0, 0, 580, '2022-10-13 04:05:23.521152+00', '2022-10-13 04:05:23.521152+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (546, 36, 0, 0, 0, 581, '2022-10-13 04:10:24.83729+00', '2022-10-13 04:10:24.83729+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (547, 40, 0, 0, 2000, 582, '2022-10-13 04:18:43.573513+00', '2022-10-13 04:18:43.573513+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (548, 40, 0, 0, 2000, 583, '2022-10-13 04:23:32.988414+00', '2022-10-13 04:23:32.988414+00', false);
INSERT INTO "service-crm"."serviceManPaidOuts" (id, "userId", job, parts, visit, "orderId", "createdDate", "updatedDate", "isPaid") VALUES (549, 36, 0, 0, 5000, 584, '2022-10-13 04:26:01.59286+00', '2022-10-13 04:26:01.59286+00', false);


--
-- Data for Name: soldBoilers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--



--
-- Data for Name: soldJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (212, 35, 5000, 1, 5000, 253, '2022-07-27 06:10:34.371531+00', '2022-07-27 06:10:34.371531+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (214, 35, 5000, 1, 5000, 256, '2022-07-30 03:42:58.125383+00', '2022-07-30 03:42:58.125383+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (213, 35, 5000, 1, 5000, 254, '2022-07-29 14:01:18.434514+00', '2022-07-30 04:09:36.990679+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (143, 32, 25000, 1, 25000, 67, '2022-04-13 07:48:11.792087+00', '2022-04-13 07:48:29.358427+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (144, 32, 25000, 1, 25000, 67, '2022-04-13 07:48:29.360035+00', '2022-04-13 07:48:29.360035+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (142, 30, 0, 1, 0, 65, '2022-04-13 07:35:49.914602+00', '2022-04-13 07:49:01.034543+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (145, 30, 0, 1, 0, 65, '2022-04-13 07:49:01.035909+00', '2022-04-13 07:49:01.035909+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (146, 32, 25000, 1, 25000, 70, '2022-04-14 06:40:20.454033+00', '2022-04-14 06:40:20.454033+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (147, 29, 5000, 1, 5000, 71, '2022-04-14 06:43:26.348811+00', '2022-04-14 06:45:03.844612+00', 30, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (148, 29, 4000, 1, 4000, 71, '2022-04-14 06:45:03.846117+00', '2022-04-14 06:45:03.846117+00', 30, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (149, 30, 0, 1, 0, 69, '2022-04-14 06:46:14.500077+00', '2022-04-14 06:46:14.500077+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (150, 30, 0, 1, 0, 72, '2022-04-14 06:53:53.614548+00', '2022-04-14 06:53:53.614548+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (151, 34, 9000, 1, 9000, 66, '2022-04-14 06:57:07.950468+00', '2022-04-14 06:57:07.950468+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (152, 34, 9000, 1, 9000, 75, '2022-04-14 10:38:11.365433+00', '2022-04-14 10:38:11.365433+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (153, 33, 3000, 1, 3000, 73, '2022-04-14 11:26:55.070538+00', '2022-04-14 11:26:55.070538+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (215, 35, 5000, 1, 5000, 254, '2022-07-30 04:09:36.991963+00', '2022-07-30 04:09:36.991963+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (216, 32, 25000, 1, 25000, 257, '2022-08-01 07:01:06.965375+00', '2022-08-01 07:01:06.965375+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (158, 32, 15000, 1, 15000, 187, '2022-06-21 03:23:16.189054+00', '2022-06-21 03:23:16.189054+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (159, 30, 5000, 1, 5000, 189, '2022-06-27 04:30:40.226463+00', '2022-06-27 04:30:40.226463+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (160, 30, 5000, 1, 5000, 190, '2022-06-27 04:31:41.637639+00', '2022-06-27 04:31:41.637639+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (162, 35, 5000, 1, 5000, 193, '2022-06-30 03:22:57.752568+00', '2022-06-30 03:22:57.752568+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (163, 32, 25000, 1, 25000, 194, '2022-06-30 03:27:04.702601+00', '2022-06-30 03:27:04.702601+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (165, 30, 0, 1, 0, 195, '2022-06-30 11:20:57.189141+00', '2022-06-30 11:20:57.189141+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (167, 32, 25000, 1, 25000, 198, '2022-07-03 05:57:59.917737+00', '2022-07-03 05:57:59.917737+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (166, 35, 5000, 1, 5000, 197, '2022-07-01 02:54:03.069664+00', '2022-07-04 03:26:36.440716+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (168, 35, 5000, 1, 5000, 197, '2022-07-04 03:26:36.441835+00', '2022-07-04 03:26:36.441835+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (161, 35, 5000, 1, 5000, 192, '2022-06-30 03:19:18.594352+00', '2022-07-04 03:30:52.579489+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (169, 35, 5000, 1, 5000, 192, '2022-07-04 03:30:52.580823+00', '2022-07-04 03:30:52.580823+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (170, 29, 1000, 3, 3000, 192, '2022-07-04 03:30:52.582581+00', '2022-07-04 03:30:52.582581+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (171, 29, 0, 3, 0, 199, '2022-07-04 08:35:40.479694+00', '2022-07-04 08:35:40.479694+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (172, 35, 5000, 1, 5000, 200, '2022-07-04 08:38:24.777585+00', '2022-07-04 08:41:30.402801+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (173, 35, 5000, 1, 5000, 200, '2022-07-04 08:41:30.403931+00', '2022-07-04 08:41:30.403931+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (174, 32, 25000, 1, 25000, 201, '2022-07-04 08:42:42.413502+00', '2022-07-04 08:42:42.413502+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (175, 38, 6000, 1, 6000, 202, '2022-07-04 08:48:47.013998+00', '2022-07-04 08:49:54.730871+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (176, 30, 5000, 1, 5000, 202, '2022-07-04 08:48:47.015737+00', '2022-07-04 08:49:54.730871+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (177, 38, 6000, 1, 6000, 202, '2022-07-04 08:49:54.732325+00', '2022-07-04 08:49:54.732325+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (178, 30, 5000, 1, 5000, 202, '2022-07-04 08:49:54.734289+00', '2022-07-04 08:49:54.734289+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (179, 30, 5000, 1, 5000, 203, '2022-07-05 03:39:44.72299+00', '2022-07-05 03:39:44.72299+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (180, 35, 5000, 1, 5000, 205, '2022-07-05 04:42:15.491724+00', '2022-07-05 04:42:15.491724+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (181, 35, 5000, 1, 5000, 207, '2022-07-05 09:49:38.393085+00', '2022-07-05 09:49:38.393085+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (182, 29, 2000, 4, 8000, 207, '2022-07-05 09:49:38.394846+00', '2022-07-05 09:49:38.394846+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (183, 32, 15000, 1, 15000, 208, '2022-07-05 10:32:44.321928+00', '2022-07-05 10:32:44.321928+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (184, 35, 5000, 1, 5000, 209, '2022-07-07 05:28:59.331578+00', '2022-07-07 05:28:59.331578+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (185, 35, 5000, 1, 5000, 210, '2022-07-07 05:32:42.290213+00', '2022-07-07 05:32:42.290213+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (186, 35, 5000, 1, 5000, 212, '2022-07-07 07:00:40.072847+00', '2022-07-07 07:00:40.072847+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (187, 35, 5000, 1, 5000, 213, '2022-07-08 03:17:26.833855+00', '2022-07-08 03:17:26.833855+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (188, 32, 25000, 1, 25000, 215, '2022-07-08 03:22:23.500449+00', '2022-07-08 03:22:23.500449+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (189, 35, 5000, 1, 5000, 216, '2022-07-08 09:29:53.247534+00', '2022-07-08 09:29:53.247534+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (190, 32, 15000, 1, 15000, 219, '2022-07-11 03:19:35.56832+00', '2022-07-11 03:19:35.56832+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (192, 35, 5000, 1, 5000, 221, '2022-07-11 04:24:50.749633+00', '2022-07-11 04:24:50.749633+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (193, 35, 5000, 1, 5000, 222, '2022-07-12 05:35:21.946671+00', '2022-07-12 05:35:21.946671+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (194, 32, 25000, 1, 25000, 223, '2022-07-12 14:54:56.037393+00', '2022-07-12 14:54:56.037393+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (191, 35, 5000, 1, 5000, 220, '2022-07-11 03:23:41.392798+00', '2022-07-12 14:58:20.166735+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (195, 35, 5000, 1, 5000, 220, '2022-07-12 14:58:20.168057+00', '2022-07-12 14:58:20.168057+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (164, 35, 5000, 1, 5000, 196, '2022-06-30 06:26:56.291339+00', '2022-07-13 04:56:37.388875+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (196, 35, 5000, 1, 5000, 196, '2022-07-13 04:56:37.390226+00', '2022-07-13 04:56:37.390226+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (197, 35, 5000, 1, 5000, 227, '2022-07-15 15:44:04.438459+00', '2022-07-15 15:44:04.438459+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (198, 32, 25000, 1, 25000, 229, '2022-07-16 03:37:17.551864+00', '2022-07-16 03:37:17.551864+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (199, 35, 5000, 1, 5000, 230, '2022-07-16 09:58:28.283416+00', '2022-07-18 03:28:46.705528+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (200, 35, 5000, 1, 5000, 230, '2022-07-18 03:28:46.707043+00', '2022-07-18 03:28:46.707043+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (201, 35, 5000, 1, 5000, 234, '2022-07-18 04:25:42.460177+00', '2022-07-18 04:25:42.460177+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (202, 35, 5000, 1, 5000, 235, '2022-07-18 09:01:27.248317+00', '2022-07-18 11:24:07.036672+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (203, 35, 5000, 1, 5000, 235, '2022-07-18 11:24:07.037965+00', '2022-07-18 11:24:07.037965+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (204, 40, 4000, 1, 4000, 235, '2022-07-18 11:24:07.039581+00', '2022-07-18 11:24:07.039581+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (205, 40, 3000, 1, 3000, 235, '2022-07-18 11:24:07.041118+00', '2022-07-18 11:24:07.041118+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (206, 35, 5000, 1, 5000, 236, '2022-07-19 03:20:06.611643+00', '2022-07-19 03:20:06.611643+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (207, 35, 5000, 1, 5000, 239, '2022-07-20 06:25:33.745704+00', '2022-07-20 06:25:33.745704+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (208, 32, 15000, 1, 15000, 243, '2022-07-21 13:17:11.966428+00', '2022-07-21 13:18:16.92049+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (209, 32, 15000, 1, 15000, 243, '2022-07-21 13:18:16.92189+00', '2022-07-21 13:18:16.92189+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (210, 32, 15000, 1, 15000, 244, '2022-07-22 05:57:26.768649+00', '2022-07-22 05:57:26.768649+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (211, 35, 5000, 1, 5000, 251, '2022-07-25 03:40:40.186714+00', '2022-07-25 03:40:40.186714+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (217, 32, 25000, 1, 25000, 259, '2022-08-03 04:44:40.101274+00', '2022-08-03 04:44:40.101274+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (219, 32, 25000, 1, 25000, 262, '2022-08-08 04:00:41.325923+00', '2022-08-08 04:00:41.325923+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (218, 39, 3000, 1, 3000, 261, '2022-08-05 06:40:15.724069+00', '2022-08-08 04:27:35.64264+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (220, 39, 3000, 1, 3000, 261, '2022-08-08 04:27:35.644142+00', '2022-08-08 04:27:35.644142+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (221, 35, 5000, 1, 5000, 265, '2022-08-09 07:30:08.718611+00', '2022-08-09 07:30:08.718611+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (222, 32, 15000, 1, 15000, 266, '2022-08-09 08:12:37.411868+00', '2022-08-09 08:12:37.411868+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (223, 32, 25000, 1, 25000, 267, '2022-08-11 03:51:07.875861+00', '2022-08-11 03:51:07.875861+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (224, 35, 5000, 1, 5000, 268, '2022-08-11 04:22:45.494956+00', '2022-08-11 04:22:45.494956+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (225, 30, 0, 1, 0, 269, '2022-08-23 04:08:25.882328+00', '2022-08-23 04:08:25.882328+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (226, 30, 0, 1, 0, 270, '2022-08-23 04:08:43.903418+00', '2022-08-23 04:08:43.903418+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (227, 30, 0, 1, 0, 271, '2022-09-13 05:02:15.134955+00', '2022-09-13 05:02:15.134955+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (229, 32, 25000, 1, 25000, 274, '2022-09-16 03:54:05.44523+00', '2022-09-16 03:54:05.44523+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (230, 32, 25000, 1, 25000, 275, '2022-09-16 03:57:27.498498+00', '2022-09-16 03:57:27.498498+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (231, 35, 5000, 1, 5000, 276, '2022-09-16 04:02:12.16096+00', '2022-09-16 04:02:12.16096+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (232, 30, 5000, 1, 5000, 277, '2022-09-16 04:26:41.018235+00', '2022-09-16 04:26:41.018235+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (234, 32, 25000, 1, 25000, 279, '2022-09-16 05:31:49.638721+00', '2022-09-16 05:31:49.638721+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (228, 30, 5000, 1, 5000, 273, '2022-09-14 11:34:24.753802+00', '2022-09-16 06:18:48.496759+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (235, 30, 5000, 1, 5000, 273, '2022-09-16 06:18:48.498049+00', '2022-09-16 06:18:48.498049+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (240, 35, 5000, 1, 5000, 282, '2022-09-17 04:06:36.12827+00', '2022-09-17 04:06:36.12827+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (236, 32, 25000, 1, 25000, 281, '2022-09-17 02:09:05.218748+00', '2022-09-17 03:25:44.309162+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (237, 32, 25000, 1, 25000, 281, '2022-09-17 02:18:10.394335+00', '2022-09-17 03:25:44.309162+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (238, 32, 25000, 1, 25000, 281, '2022-09-17 03:25:44.310581+00', '2022-09-17 03:25:44.310581+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (233, 35, 5000, 1, 5000, 278, '2022-09-16 04:58:39.634307+00', '2022-09-17 03:40:01.382564+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (239, 35, 5000, 1, 5000, 278, '2022-09-17 03:40:01.383761+00', '2022-09-17 03:40:01.383761+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (241, 30, 5000, 1, 5000, 283, '2022-09-17 04:19:36.335581+00', '2022-09-17 04:19:36.335581+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (242, 32, 25000, 1, 25000, 284, '2022-09-17 04:52:53.026564+00', '2022-09-17 04:52:53.026564+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (243, 30, 5000, 1, 5000, 285, '2022-09-17 07:44:37.415307+00', '2022-09-17 07:44:37.415307+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (244, 35, 0, 1, 0, 286, '2022-09-17 12:00:55.884381+00', '2022-09-17 12:00:55.884381+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (245, 35, 5000, 1, 5000, 287, '2022-09-17 12:11:10.246724+00', '2022-09-17 12:11:10.246724+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (246, 30, 5000, 1, 5000, 289, '2022-09-17 12:16:02.690136+00', '2022-09-17 12:16:46.018574+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (247, 30, 5000, 1, 5000, 289, '2022-09-17 12:16:46.019934+00', '2022-09-17 12:16:46.019934+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (248, 30, 5000, 1, 5000, 290, '2022-09-17 12:21:27.089506+00', '2022-09-17 12:21:27.089506+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (249, 30, 0, 1, 0, 291, '2022-09-17 12:24:33.983138+00', '2022-09-17 12:24:33.983138+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (250, 30, 0, 1, 0, 292, '2022-09-17 12:28:19.132661+00', '2022-09-17 12:28:19.132661+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (251, 30, 0, 1, 0, 293, '2022-09-19 05:38:52.472902+00', '2022-09-19 05:38:52.472902+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (252, 30, 0, 1, 0, 294, '2022-09-19 05:42:13.019465+00', '2022-09-19 05:42:13.019465+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (253, 30, 0, 1, 0, 295, '2022-09-19 05:45:03.081379+00', '2022-09-19 05:45:03.081379+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (254, 30, 0, 1, 0, 297, '2022-09-19 05:48:15.405403+00', '2022-09-19 05:48:15.405403+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (255, 35, 5000, 1, 5000, 298, '2022-09-19 05:50:42.129768+00', '2022-09-19 05:50:42.129768+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (256, 30, 0, 1, 0, 299, '2022-09-19 05:57:35.708305+00', '2022-09-19 05:59:15.407556+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (257, 30, 0, 1, 0, 299, '2022-09-19 05:57:49.139592+00', '2022-09-19 05:59:15.407556+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (258, 30, 0, 1, 0, 299, '2022-09-19 05:58:31.711733+00', '2022-09-19 05:59:15.407556+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (259, 30, 0, 1, 0, 299, '2022-09-19 05:59:15.408841+00', '2022-09-19 05:59:15.408841+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (260, 35, 5000, 1, 5000, 301, '2022-09-23 05:09:26.165676+00', '2022-09-23 05:09:26.165676+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (261, 35, 5000, 1, 5000, 302, '2022-09-23 05:58:16.326409+00', '2022-09-23 05:58:16.326409+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (262, 30, 0, 1, 0, 304, '2022-09-23 06:02:20.176004+00', '2022-09-23 06:02:20.176004+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (263, 35, 5000, 1, 5000, 307, '2022-09-23 07:13:34.387693+00', '2022-09-23 07:13:34.387693+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (264, 35, 5000, 1, 5000, 308, '2022-09-24 07:07:21.4317+00', '2022-09-24 07:07:21.4317+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (265, 35, 5000, 1, 5000, 308, '2022-09-24 07:07:21.433323+00', '2022-09-24 07:07:21.433323+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (266, 30, 0, 1, 0, 310, '2022-09-24 07:12:42.847332+00', '2022-09-24 07:12:42.847332+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (267, 35, 5000, 1, 5000, 311, '2022-09-24 07:19:00.676729+00', '2022-09-24 07:19:00.676729+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (268, 30, 0, 1, 0, 313, '2022-09-24 07:21:41.630905+00', '2022-09-24 07:21:41.630905+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (269, 35, 5000, 1, 5000, 314, '2022-09-26 03:46:55.695712+00', '2022-09-26 03:46:55.695712+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (270, 32, 15000, 1, 15000, 315, '2022-09-26 03:54:29.689856+00', '2022-09-26 03:54:29.689856+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (271, 32, 15000, 1, 15000, 317, '2022-09-26 04:02:16.684871+00', '2022-09-26 04:02:16.684871+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (272, 35, 5000, 1, 5000, 318, '2022-09-26 05:07:12.29736+00', '2022-09-26 05:07:12.29736+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (273, 35, 0, 1, 0, 326, '2022-09-26 08:42:24.382021+00', '2022-09-26 08:42:24.382021+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (274, 35, 0, 1, 0, 327, '2022-09-26 08:42:57.618938+00', '2022-09-26 08:42:57.618938+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (275, 35, 0, 1, 0, 327, '2022-09-26 08:42:57.620537+00', '2022-09-26 08:42:57.620537+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (276, 35, 5000, 1, 5000, 328, '2022-09-26 14:09:45.013142+00', '2022-09-26 14:09:45.013142+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (277, 30, 5000, 1, 5000, 343, '2022-09-27 03:37:07.570989+00', '2022-09-27 03:37:07.570989+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (278, 32, 15000, 1, 15000, 346, '2022-09-28 04:11:56.60079+00', '2022-09-28 04:11:56.60079+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (279, 32, 25000, 1, 25000, 347, '2022-09-28 04:28:22.353978+00', '2022-09-28 04:28:22.353978+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (280, 35, 5000, 1, 5000, 352, '2022-09-28 07:20:26.438387+00', '2022-09-28 07:20:26.438387+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (281, 35, 5000, 1, 5000, 358, '2022-09-28 07:35:10.511831+00', '2022-09-28 07:35:10.511831+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (282, 32, 25000, 1, 25000, 359, '2022-09-28 07:39:05.85497+00', '2022-09-28 07:39:05.85497+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (283, 32, 25000, 1, 25000, 361, '2022-09-28 07:46:52.417855+00', '2022-09-28 07:46:52.417855+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (284, 32, 25000, 1, 25000, 366, '2022-09-28 07:58:41.815989+00', '2022-09-28 07:58:41.815989+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (285, 32, 25000, 1, 25000, 368, '2022-09-29 03:48:45.83499+00', '2022-09-29 03:48:45.83499+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (286, 35, 0, 1, 0, 369, '2022-09-29 03:54:06.929915+00', '2022-09-29 03:54:06.929915+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (287, 32, 15000, 1, 15000, 369, '2022-09-29 03:54:06.931807+00', '2022-09-29 03:54:06.931807+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (288, 39, 6000, 1, 6000, 373, '2022-09-29 04:07:42.003041+00', '2022-09-29 04:08:26.19096+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (289, 32, 15000, 1, 15000, 373, '2022-09-29 04:07:42.004914+00', '2022-09-29 04:08:26.19096+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (290, 39, 6000, 1, 6000, 373, '2022-09-29 04:08:26.192211+00', '2022-09-29 04:08:26.192211+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (291, 32, 15000, 1, 15000, 373, '2022-09-29 04:08:26.19385+00', '2022-09-29 04:08:26.19385+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (292, 32, 15000, 1, 15000, 376, '2022-09-29 05:01:33.599754+00', '2022-09-29 05:01:53.083622+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (293, 32, 15000, 1, 15000, 376, '2022-09-29 05:01:53.084837+00', '2022-09-29 05:01:53.084837+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (294, 30, 0, 1, 0, 377, '2022-09-29 08:28:17.09548+00', '2022-09-29 08:43:30.206299+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (295, 30, 0, 1, 0, 377, '2022-09-29 08:43:30.207598+00', '2022-09-29 08:43:30.207598+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (296, 30, 5000, 1, 5000, 378, '2022-09-29 14:34:16.511205+00', '2022-09-29 14:34:16.511205+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (297, 32, 15000, 1, 15000, 379, '2022-09-29 14:42:45.259357+00', '2022-09-29 14:42:45.259357+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (298, 30, 5000, 1, 5000, 391, '2022-09-30 01:42:16.367748+00', '2022-09-30 01:42:16.367748+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (299, 30, 5000, 1, 5000, 392, '2022-09-30 01:44:24.572826+00', '2022-09-30 01:44:24.572826+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (300, 30, 5000, 1, 5000, 393, '2022-09-30 01:46:19.210584+00', '2022-09-30 01:46:19.210584+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (301, 30, 5000, 1, 5000, 394, '2022-09-30 01:49:09.341174+00', '2022-09-30 01:49:09.341174+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (302, 30, 5000, 1, 5000, 397, '2022-09-30 03:34:32.852495+00', '2022-09-30 03:34:32.852495+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (303, 32, 25000, 1, 25000, 400, '2022-09-30 03:43:45.22033+00', '2022-09-30 03:43:45.22033+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (304, 35, 5000, 1, 5000, 402, '2022-09-30 03:51:42.269875+00', '2022-09-30 03:51:42.269875+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (305, 32, 25000, 1, 25000, 403, '2022-09-30 03:53:42.961446+00', '2022-09-30 03:53:42.961446+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (306, 32, 25000, 1, 25000, 405, '2022-09-30 06:05:59.661552+00', '2022-09-30 06:05:59.661552+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (307, 32, 15000, 1, 15000, 407, '2022-09-30 07:06:24.818042+00', '2022-09-30 07:06:24.818042+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (308, 30, 0, 1, 0, 408, '2022-09-30 07:12:12.204406+00', '2022-09-30 07:12:12.204406+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (309, 32, 25000, 1, 25000, 411, '2022-10-01 03:37:56.295261+00', '2022-10-01 03:37:56.295261+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (310, 35, 5000, 1, 5000, 415, '2022-10-02 04:06:02.08187+00', '2022-10-02 04:06:02.08187+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (311, 35, 5000, 1, 5000, 416, '2022-10-02 06:16:37.081453+00', '2022-10-02 06:16:37.081453+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (312, 35, 5000, 1, 5000, 417, '2022-10-02 06:19:21.013652+00', '2022-10-02 06:19:21.013652+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (313, 35, 5000, 1, 5000, 418, '2022-10-02 06:21:56.882417+00', '2022-10-02 06:21:56.882417+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (314, 30, 5000, 1, 5000, 421, '2022-10-03 04:42:11.811505+00', '2022-10-03 04:42:11.811505+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (315, 35, 5000, 1, 5000, 422, '2022-10-03 04:45:15.173162+00', '2022-10-03 04:45:15.173162+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (316, 35, 5000, 1, 5000, 424, '2022-10-03 05:10:48.728325+00', '2022-10-03 05:10:48.728325+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (317, 35, 5000, 1, 5000, 492, '2022-10-07 03:46:39.204975+00', '2022-10-07 03:46:39.204975+00', 14, true);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (318, 30, 5000, 1, 5000, 513, '2022-10-07 14:48:01.435772+00', '2022-10-07 14:48:54.6043+00', 14, false);
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (319, 30, 5000, 1, 5000, 513, '2022-10-07 14:48:54.605847+00', '2022-10-07 14:48:54.605847+00', 14, true);


--
-- Data for Name: soldParts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (156, 54500, 1, 54500, 68, 22, '2022-04-14 04:32:47.692512+00', '2022-04-14 04:32:47.692512+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (157, 49900, 1, 49900, 71, 13, '2022-04-14 06:43:26.345602+00', '2022-04-14 06:45:03.838592+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (158, 49900, 1, 49900, 71, 13, '2022-04-14 06:45:03.841835+00', '2022-04-14 06:45:03.841835+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (159, 26300, 1, 26300, 78, 7, '2022-04-15 05:05:55.688755+00', '2022-04-15 12:26:06.889886+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (160, 0, 1, 0, 78, 7, '2022-04-15 12:26:06.892162+00', '2022-04-15 12:26:06.892162+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (161, 11500, 1, 11500, 83, 7, '2022-04-21 03:54:31.407238+00', '2022-04-21 03:54:31.407238+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (166, 16500, 1, 16500, 197, 7, '2022-07-04 03:26:36.437872+00', '2022-07-04 03:26:36.437872+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (167, 16500, 1, 16500, 199, 7, '2022-07-04 08:35:40.473605+00', '2022-07-04 08:35:40.473605+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (168, 12300, 1, 12300, 199, 9, '2022-07-04 08:35:40.477303+00', '2022-07-04 08:35:40.477303+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (169, 34200, 1, 34200, 208, 16, '2022-07-05 10:32:44.319074+00', '2022-07-05 10:32:44.319074+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (170, 37700, 1, 37700, 261, 28, '2022-08-05 06:40:15.721152+00', '2022-08-08 04:27:35.63787+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (171, 37700, 1, 37700, 261, 28, '2022-08-08 04:27:35.639856+00', '2022-08-08 04:27:35.639856+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (172, 16500, 1, 16500, 373, 7, '2022-09-29 04:07:42.00011+00', '2022-09-29 04:08:26.18645+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (173, 16500, 1, 16500, 373, 7, '2022-09-29 04:08:26.188214+00', '2022-09-29 04:08:26.188214+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (174, 58000, 1, 58000, 409, 28, '2022-09-30 08:34:17.088286+00', '2022-09-30 08:35:22.069707+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (175, 58000, 1, 58000, 409, 28, '2022-09-30 08:35:22.071433+00', '2022-09-30 08:35:22.071433+00', 30, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (42, 'tech@z-star.kz', '1999-12-12', 'cdbdbe650a3f4c757e8a521db71d6ef49679d342000af287165061bd5f0a2ebc', '+7 (777) 055-60-09', true, '2022-04-13 07:34:04.084892+00', '2022-06-24 04:57:58.737018+00', 'Игорь Мачехин', 2, 10, 10, 10, 'zs_service_6009', '1130643307');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (39, 'vitya@z-star.kz', '1999-12-12', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (771) 766-70-02', true, '2022-04-13 07:17:40.793162+00', '2022-06-27 04:26:28.717408+00', 'Виктор Пен', 3, 50, 10, 100, 'zs_service_7002', '');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (38, 'oleg@z-star.kz', '1991-01-28', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '+7 (771) 766-70-05', true, '2022-03-02 09:22:50.597731+00', '2022-06-27 04:26:35.102505+00', 'Олег Огай', 3, 50, 10, 100, 'zs_service_7005', '5398040144');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (40, 'azret@z-star.kz', '1990-12-15', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (771) 766-70-03', true, '2022-04-13 07:22:21.044438+00', '2022-07-04 03:45:09.281506+00', 'Азымбек', 3, 50, 10, 100, 'zs_service_7003', '5303131787');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (36, 'yarik@z-star.kz', '2000-01-01', '8fcdbcba6e39dcd8f87bcfe31b9b9726af662988d707b5111a885f22d8a7aeb9', '+7 (771) 766-70-01', true, '2022-01-01 07:21:52.789373+00', '2022-07-11 03:43:52.627704+00', 'Ярослав Мацюк', 3, 50, 10, 100, 'zs_service_7001', '5332241406');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (37, 'val@z-star.kz', '1981-11-11', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (777) 555-00-17', true, '2022-01-20 08:28:42.194786+00', '2022-05-14 12:33:36.598394+00', 'Администратор', 3, 0, 0, 0, 'zs_service', NULL);
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (1, 'khegay.alexey@mail.ru', '2021-07-16', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '+7 (705) 577-88-52', true, '2021-05-25 00:00:00+00', '2022-05-22 09:22:37.417547+00', 'Full name', 1, 0, 0, 0, '', '213781013');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (32, 'info@z-star.kz', '2021-01-01', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '+7 (777) 005-31-36', true, '2021-11-19 06:29:49.889886+00', '2022-05-22 12:45:50.946981+00', 'Сергей Ним', 1, 0, 0, 0, 'zstar_almaty', '302982475');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (41, 'ilya@z-star.kz', '1999-12-12', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (771) 766-70-04', true, '2022-04-13 07:24:47.698394+00', '2022-05-04 09:25:57.633937+00', 'Илья Мачехин', 3, 0, 0, 0, 'zs_service_7004', NULL);


--
-- Data for Name: utils; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm".utils (id, name, value, "createdDate", "updatedDate", description) VALUES (1, 'paidOutTerm', '15', '2021-12-18 09:39:32.757578+00', '2021-12-18 09:39:32.757578+00', 'Количество дней, спустя которые возможна выплата для специалиста');


--
-- Name: cashHistoryLog_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."cashHistoryLog_id_seq"', 9, true);


--
-- Name: cash_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".cash_id_seq', 10, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".customers_id_seq', 593, true);


--
-- Name: dictBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictBoilers_id_seq"', 68, true);


--
-- Name: dictJobTypes_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictJobTypes_id_seq"', 42, true);


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

SELECT pg_catalog.setval('"service-crm"."ordersStatusHistory_id_seq"', 1728, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".orders_id_seq', 584, true);


--
-- Name: paidOuts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."paidOuts_id_seq"', 549, true);


--
-- Name: soldBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldBoilers_id_seq"', 1, false);


--
-- Name: soldJobTypes_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldJobTypes_id_seq"', 319, true);


--
-- Name: soldParts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldParts_id_seq"', 175, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".users_id_seq', 44, true);


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

