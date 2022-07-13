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
DROP INDEX "service-crm".customers_phone_uindex;
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

INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (9, 38, 0, 0, '2022-06-23 08:55:19.08077+00', '2022-06-23 08:55:19.08077+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (8, 41, 0, 0, '2022-06-23 07:00:27.47617+00', '2022-06-23 09:01:03.794369+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (6, 40, 0, 0, '2022-06-23 06:55:32.940625+00', '2022-06-23 06:59:32.148182+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (10, 37, 0, 0, '2022-06-23 09:00:39.964672+00', '2022-06-23 09:00:39.964672+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (1, 36, 0, 0, '2022-01-01 08:00:40.46918+00', '2022-06-23 09:00:09.673175+00', 0);
INSERT INTO "service-crm".cash (id, "userId", "readySum", "notReadySum", "createdDate", "updatedDate", "paidSum") VALUES (7, 39, 0, 0, '2022-06-23 06:56:05.467552+00', '2022-06-23 09:01:43.363429+00', 0);


--
-- Data for Name: cashHistoryLog; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (55, 'Боролдай дачи', '', '2022-04-14 03:16:59.430402+00', '2022-04-22 05:59:05.225852+00', 42, 'Батыр', '+7 (707) 515-97-71', '', true, '6LK000238351', 13, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (50, 'пр. Рыскулова, 139в', 'asd@asd.rr', '2022-03-02 08:28:13.691558+00', '2022-04-17 10:25:26.648356+00', 32, 'ТЕСТ_1', '+7 (777) 777-77-77', '+7 (123) 123-45-67', true, '123123123123', 11, NULL);
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (66, 'Бесагаш баянаулы', '', '2022-04-15 12:22:48.684545+00', '2022-04-17 10:44:30.415806+00', 42, 'Неизв', '+7 (701) 521-11-46', '', true, '1509', 16, NULL);
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
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (82, 'Боролдай м.р. жайнак жангильдина4', '', '2022-04-21 04:12:15.016301+00', '2022-04-21 04:12:15.016301+00', 42, ' Эрика', '+7 (702) 431-13-26', '', true, '21048', 11, NULL);
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
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (186, 'Айгерим 2 шолкар 12', '', '2022-06-15 03:56:29.722846+00', '2022-06-15 03:56:29.722846+00', 42, ' Жанна', '+7 (701) 303-10-07', '', true, '1406', 20, '2021-11-22 00:00:00+00');
INSERT INTO "service-crm".customers (id, address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "isActive", "boilerSerial", "boilerId", "purchaseDate") VALUES (187, 'ул. Малиновая 163/1', '', '2022-06-21 03:22:48.076629+00', '2022-06-21 03:22:48.076629+00', 32, 'Халида', '+7 (775) 205-03-95', '', true, '20480087GCKG6KYA', 21, '2021-10-06 00:00:00+00');


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


--
-- Data for Name: dictJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (42, 'EXCH_ELECTRIC', 'Замена в электрической части', '2022-06-23 06:06:21.359263+00', '2022-06-23 06:06:21.359263+00', 4500, 32, 14, 3500, 2000, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (30, '1ST_START', 'ПНР', '2022-01-20 08:26:07.94059+00', '2022-04-13 06:39:53.171161+00', 0, 32, 14, 5000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (32, 'MAINT', 'Профилактика', '2022-04-13 06:40:39.178992+00', '2022-04-13 06:40:39.178992+00', 15000, 32, 14, 25000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (33, 'PCB_REMOVE', 'Замена блока управления', '2022-04-14 06:44:32.351565+00', '2022-06-23 05:56:47.774428+00', 3000, 32, 14, 5000, 10000, 15000, false);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (34, 'DHW_CLEAN', 'Чистка теплообменника ГВС', '2022-04-14 06:56:42.914998+00', '2022-06-23 05:56:53.10112+00', 7000, 32, 14, 9000, 12000, 15000, false);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (35, 'DIAG', 'Диагностика', '2022-06-16 05:13:04.328328+00', '2022-06-23 05:57:08.993571+00', 5000, 32, 14, 0, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (36, 'WAR_REPAIR', 'Ремонт по гарантии', '2022-06-23 05:57:55.310378+00', '2022-06-23 05:57:55.310378+00', 0, 32, 14, 0, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (29, 'WORK1', 'Почасовая оплата', '2022-01-01 07:23:06.965276+00', '2022-06-23 05:58:50.209794+00', 2000, 1, 14, 1000, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (37, 'REP_COMB_CHAMB', 'Ремонт камеры сгорания', '2022-06-23 06:00:51.259709+00', '2022-06-23 06:00:51.259709+00', 15000, 32, 14, 5500, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (38, 'EXCH_COMB_CHAMB', 'Замена в камере сгорания', '2022-06-23 06:02:32.874455+00', '2022-06-23 06:02:32.874455+00', 7500, 32, 14, 5500, 0, 0, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (39, 'EXCH_HYDRAULIC', 'Замена в гидроузле', '2022-06-23 06:03:35.419008+00', '2022-06-23 06:03:35.419008+00', 5500, 32, 14, 4500, 3500, 2000, true);
INSERT INTO "service-crm"."dictJobTypes" (id, code, name, "createdDate", "updatedDate", price, "createdBy", "daysOfGuarantee", price1, price2, price3, "isActive") VALUES (40, 'REP_HYDRAULIC', 'Ремонт в гидроузле', '2022-06-23 06:04:30.770617+00', '2022-06-23 06:04:30.770617+00', 11000, 32, 14, 9000, 4500, 4000, true);
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
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (7, '2040105', '3ходовой клапан (2.13-35)', 16500, '2022-01-01 07:24:33.734711+00', '2022-04-22 06:33:36.875891+00', 30, 487, 14900, 14000, 10700, 1, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (14, '2081024', 'Блок управления (VANS)', 54500, '2022-01-24 09:14:04.279017+00', '2022-04-22 11:24:29.550915+00', 30, 10, 49100, 46300, 35400, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (9, '2081212M', 'Манометр (круглый)', 12300, '2022-01-24 09:01:38.694007+00', '2022-04-22 06:52:05.048422+00', 30, 10, 11100, 10500, 8000, 32, true);
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
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (28, '52050118', 'Насос (ESR 13-20)', 58000, '2022-01-24 09:46:00.864624+00', '2022-04-22 11:37:54.95447+00', 30, 10, 52200, 49300, 37700, 32, true);
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
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (16, '2030280', 'Газовый клапан (2.13-35)', 52600, '2022-01-24 09:14:59.508114+00', '2022-04-22 11:25:32.549781+00', 30, 8, 47300, 44700, 34200, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (68, '2082760', 'Пульт (DSR-400U, 50)', 16100, '2022-01-24 10:13:12.658599+00', '2022-04-22 11:27:17.410195+00', 30, 10, 14500, 13700, 10500, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (67, '2130439', 'Теплообменник конденсационный (50)', 110300, '2022-01-24 10:12:38.403231+00', '2022-04-22 11:27:52.980493+00', 30, 10, 99300, 93800, 71700, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (66, '2070469M', 'Теплообменник основной (50)', 84700, '2022-01-24 10:12:07.316924+00', '2022-04-22 11:28:26.163424+00', 30, 10, 76200, 72000, 55100, 32, true);
INSERT INTO "service-crm"."dictParts" (id, article, name, price, "createdDate", "updatedDate", "daysOfGuarantee", quantity, price1, price2, price3, "createdBy", "isActive") VALUES (54, '3130448', 'Датчик температуры отопления (A 13-35)', 9300, '2022-01-24 10:03:37.74454+00', '2022-04-22 11:51:59.710413+00', 30, 10, 8400, 7900, 6000, 32, true);


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
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (75, 54, 42, 'Каскелен Жамбыла 23/1', '2022-04-14 10:33:52.806621+00', '2022-04-14 11:08:33.676549+00', 3, 39, 'А3 аа чистка теплообменника ', true, false, 16, 5000, 14000, '+7 (701) 289-71-23', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (66, 52, 32, 'пос. Гульдала, ул. Жибек жолы, д. 21', '2022-04-13 07:45:36.068784+00', '2022-06-23 08:59:42.58976+00', 4, 36, 'Нет ГВС.  Уточнить серийный номер и модель котла', true, false, 38, 5000, 90003000, '+7 (777) 290-00-77', '2022-06-23 08:59:42.58976+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (95, 89, 42, 'Казахфильм жанар37 а кв7', '2022-04-25 04:49:19.210284+00', '2022-05-18 16:50:04.839039+00', 3, 36, 'Нет гвс', true, false, 11, 5000, 5000, '+7 (701) 555-86-92', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (81, 68, 42, 'Аксай 3б', '2022-04-18 03:29:51.395914+00', '2022-04-18 03:34:47.795626+00', 3, 39, 'Нет гвс', true, false, 30, 5000, 5000, '+7 (701) 511-14-40', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (77, 64, 42, 'Жамбыл новострой ', '2022-04-15 04:22:21.236771+00', '2022-04-22 06:11:42.272642+00', 3, 36, 'Гремит на понедельник ', true, false, 22, 0, 0, '+7 (771) 606-21-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (87, 82, 42, 'Боролдай м.р. жайнак жангильдина4', '2022-04-21 04:12:49.986551+00', '2022-04-23 05:41:33.918902+00', 3, 40, 'Самсунг бежит ', true, false, 11, 5000, 5000, '+7 (702) 431-13-26', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (98, 92, 42, 'Туздыбастау м.р. Арматура Оролман35', '2022-04-27 04:04:26.730184+00', '2022-06-23 06:45:23.011022+00', 3, 40, '', true, false, 14, 25000, 25000, '+7 (700) 300-18-30', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (65, 51, 32, 'пос. Тумебаев, ул. 1 мая, д. 14', '2022-04-13 07:35:49.909692+00', '2022-06-23 06:55:32.937621+00', 4, 40, 'ПНР. Уточнить серийный номер и модель котла', true, false, 15, 3000, 3000, '+7 (705) 625-51-79', '2022-06-23 06:55:32.937621+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (82, 69, 42, 'Шарын 67', '2022-04-18 05:02:33.952917+00', '2022-04-19 13:07:46.537416+00', 4, 36, 'Пнр', true, false, 16, 0, 0, '+7 (701) 324-04-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (102, 98, 42, 'Алгабас серикбай 21', '2022-04-29 05:02:20.861954+00', '2022-04-29 11:06:40.878115+00', 3, 40, 'Профилактика', true, false, 13, 25000, 25000, '+7 (708) 190-39-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (144, 148, 42, 'Туздыбастау кунаева 568', '2022-05-12 11:13:51.97667+00', '2022-06-23 06:47:58.433042+00', 3, 39, 'Пнр', true, false, 27, 5000, 5000, '+7 (776) 280-79-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (108, 106, 42, 'Бетховена 4', '2022-05-03 04:19:01.407265+00', '2022-06-23 06:48:51.839838+00', 3, 39, 'Давление воды не в норме ростерм', true, false, 15, 5000, 5000, '+7 (778) 184-28-88', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (107, 105, 42, 'Карасу болашак 13', '2022-05-03 04:14:45.622772+00', '2022-06-23 06:49:15.39268+00', 3, 39, 'Шибка е3 уточнить по гарантии ', true, false, 15, 5000, 5000, '+7 (708) 177-70-77', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (109, 107, 42, 'Узынагаш алгабас 85', '2022-05-03 04:20:47.565623+00', '2022-05-18 16:50:49.683898+00', 3, 36, 'Пнр ростерм', true, false, 15, 5000, 5000, '+7 (777) 724-80-16', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (138, 136, 42, 'Ботан саламатова 14', '2022-05-12 04:13:54.015013+00', '2022-06-23 07:00:27.473787+00', 4, 41, 'Нет гвс дорога 2000 плюс остальное ', true, false, 17, 5000, 5000, '+7 (702) 310-04-82', '2022-06-23 07:00:27.473787+00');
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (118, 113, 32, 'Пока не знаю', '2022-05-04 08:25:00.642806+00', '2022-05-04 09:57:44.463122+00', 4, 39, 'Не могут включить ГВС', true, false, 27, 5000, 5000, '+7 (771) 815-19-47', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (125, 119, 42, 'Ерминсай переулок 7 д 27', '2022-05-05 06:04:08.813904+00', '2022-05-18 16:51:56.523645+00', 3, 36, 'Не включается', true, false, 16, 5000, 5000, '+7 (701) 755-69-48', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (113, 111, 42, 'Каскелен', '2022-05-03 06:24:15.799715+00', '2022-05-03 08:39:20.244198+00', 4, 39, '6р1', true, false, 30, 0, 0, '+7 (775) 336-77-21', NULL);
INSERT INTO "service-crm".orders (id, "customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment, "isActive", "isPaidOut", "boilerId", "visitPrice", "totalSum", phone, "doneDate") VALUES (147, 151, 42, 'Туздыбастау бокина 6', '2022-05-14 03:24:29.824784+00', '2022-05-14 03:24:29.824784+00', 1, 38, 'Пнр', true, false, 30, 5000, 5000, '+7 (701) 761-75-00', NULL);
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


--
-- Data for Name: serviceManPaidOuts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--



--
-- Data for Name: soldBoilers; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--



--
-- Data for Name: soldJobTypes; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

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
INSERT INTO "service-crm"."soldJobTypes" (id, "jobTypeId", price, quantity, sum, "orderId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (158, 32, 15000, 1, 15000, 187, '2022-06-21 03:23:16.189054+00', '2022-06-21 03:23:16.189054+00', 14, true);


--
-- Data for Name: soldParts; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (156, 54500, 1, 54500, 68, 22, '2022-04-14 04:32:47.692512+00', '2022-04-14 04:32:47.692512+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (157, 49900, 1, 49900, 71, 13, '2022-04-14 06:43:26.345602+00', '2022-04-14 06:45:03.838592+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (158, 49900, 1, 49900, 71, 13, '2022-04-14 06:45:03.841835+00', '2022-04-14 06:45:03.841835+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (159, 26300, 1, 26300, 78, 7, '2022-04-15 05:05:55.688755+00', '2022-04-15 12:26:06.889886+00', 30, false);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (160, 0, 1, 0, 78, 7, '2022-04-15 12:26:06.892162+00', '2022-04-15 12:26:06.892162+00', 30, true);
INSERT INTO "service-crm"."soldParts" (id, price, quantity, sum, "orderId", "partId", "createdDate", "updatedDate", "daysOfGuarantee", "isActive") VALUES (161, 11500, 1, 11500, 83, 7, '2022-04-21 03:54:31.407238+00', '2022-04-21 03:54:31.407238+00', 30, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: service-crm; Owner: postgres
--

INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (42, 'tech@z-star.kz', '1999-12-12', '121b2991403be995a2aa44fcaa0f90f3ad83ac97d0a94afdc0a9f94f6bdf28ce', '+7 (777) 055-60-09', true, '2022-04-13 07:34:04.084892+00', '2022-06-23 06:35:03.135928+00', 'Игорь Мачехин', 2, 10, 10, 10, 'zs_service_6009', '1130643307');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (37, 'val@z-star.kz', '1981-11-11', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (777) 555-00-17', true, '2022-01-20 08:28:42.194786+00', '2022-05-14 12:33:36.598394+00', 'Администратор', 3, 0, 0, 0, 'zs_service', NULL);
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (1, 'khegay.alexey@mail.ru', '2021-07-16', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '+7 (705) 577-88-52', true, '2021-05-25 00:00:00+00', '2022-05-22 09:22:37.417547+00', 'Full name', 1, 0, 0, 0, '', '213781013');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (32, 'info@z-star.kz', '2021-01-01', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '+7 (777) 005-31-36', true, '2021-11-19 06:29:49.889886+00', '2022-05-22 12:45:50.946981+00', 'Сергей Ним', 1, 0, 0, 0, 'zstar_almaty', '302982475');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (39, 'vitya@z-star.kz', '1999-12-12', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (771) 766-70-02', true, '2022-04-13 07:17:40.793162+00', '2022-06-16 05:34:12.069155+00', 'Виктор Пен', 3, 50, 10, 50, 'zs_service_7002', '');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (38, 'oleg@z-star.kz', '1991-01-28', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '+7 (771) 766-70-05', true, '2022-03-02 09:22:50.597731+00', '2022-06-16 05:34:25.871581+00', 'Олег Огай', 3, 50, 10, 50, 'zs_service_7005', '5398040144');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (36, 'yarik@z-star.kz', '2000-01-01', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '+7 (771) 766-70-01', true, '2022-01-01 07:21:52.789373+00', '2022-06-16 05:34:38.2684+00', 'Ярослав Мацюк', 3, 50, 10, 50, 'zs_service_7001', '5332241406');
INSERT INTO "service-crm".users (id, login, "birthDay", password, phone, "isActive", "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "tgAccount", "chatId") VALUES (40, 'azret@z-star.kz', '1990-12-15', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '+7 (771) 766-70-03', true, '2022-04-13 07:22:21.044438+00', '2022-06-23 06:34:24.710812+00', 'Азымбек', 3, 10, 50, 50, 'zs_service_7003', '5303131787');
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

SELECT pg_catalog.setval('"service-crm".customers_id_seq', 187, true);


--
-- Name: dictBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."dictBoilers_id_seq"', 46, true);


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

SELECT pg_catalog.setval('"service-crm"."ordersStatusHistory_id_seq"', 560, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm".orders_id_seq', 187, true);


--
-- Name: paidOuts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."paidOuts_id_seq"', 158, true);


--
-- Name: soldBoilers_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldBoilers_id_seq"', 1, false);


--
-- Name: soldJobTypes_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldJobTypes_id_seq"', 158, true);


--
-- Name: soldParts_id_seq; Type: SEQUENCE SET; Schema: service-crm; Owner: postgres
--

SELECT pg_catalog.setval('"service-crm"."soldParts_id_seq"', 165, true);


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

