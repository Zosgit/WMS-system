--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2023-12-17 12:30:43

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
-- TOC entry 291 (class 1255 OID 28366)
-- Name: get_count_locations_area(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_count_locations_area(type integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	return_count bigint;
BEGIN
  select count(id) into return_count
  from locations
  where deleted_at is NULL
  and storearea_id = type;

  return return_count;
end;
$$;


ALTER FUNCTION public.get_count_locations_area(type integer) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 28367)
-- Name: get_count_locations_area(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_count_locations_area(type bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	return_count bigint;
BEGIN
  select count(id) into return_count
  from locations
  where deleted_at is NULL
  and storearea_id = type;

  return return_count;
end;
$$;


ALTER FUNCTION public.get_count_locations_area(type bigint) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 27509)
-- Name: increase(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.increase(INOUT i integer)
    LANGUAGE plpgsql
    AS $$
begin
    i = i+1; return; end ; $$;


ALTER PROCEDURE public.increase(INOUT i integer) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 27510)
-- Name: set_counter(character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.set_counter(IN code character varying, OUT number integer)
    LANGUAGE plpgsql
    AS $$
begin
	
    number = number+1; return; end ;
$$;


ALTER PROCEDURE public.set_counter(IN code character varying, OUT number integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 27511)
-- Name: counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counters (
    id bigint NOT NULL,
    code character varying(50),
    amount integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.counters OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 27514)
-- Name: counters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.counters_id_seq OWNER TO postgres;

--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 210
-- Name: counters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.counters_id_seq OWNED BY public.counters.id;


--
-- TOC entry 211 (class 1259 OID 27515)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 27521)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 212
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 213 (class 1259 OID 27522)
-- Name: firms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firms (
    id bigint NOT NULL,
    code character varying(50),
    longdesc character varying(200),
    tax character varying(50),
    street character varying(50),
    postcode character varying(50),
    city character varying(50),
    notes character varying(200),
    created_by bigint,
    shipment smallint DEFAULT 1,
    delivery smallint DEFAULT 1,
    owner smallint DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.firms OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27530)
-- Name: firms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firms_id_seq OWNER TO postgres;

--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 214
-- Name: firms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firms_id_seq OWNED BY public.firms.id;


--
-- TOC entry 215 (class 1259 OID 27531)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    storearea_id bigint,
    ean character varying(50),
    pos_x bigint,
    pos_y bigint,
    pos_z bigint,
    size_x numeric(6,2),
    size_y numeric(6,2),
    size_z numeric(6,2),
    loadwgt numeric(6,2),
    status_id bigint,
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27534)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 216
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 250 (class 1259 OID 28285)
-- Name: log_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_locations (
    id bigint NOT NULL,
    location_id bigint,
    status_id bigint,
    notes character varying(250),
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.log_locations OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 28284)
-- Name: log_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_locations_id_seq OWNER TO postgres;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 249
-- Name: log_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_locations_id_seq OWNED BY public.log_locations.id;


--
-- TOC entry 217 (class 1259 OID 27535)
-- Name: logical_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logical_areas (
    id bigint NOT NULL,
    code character varying(50),
    longdesc character varying(200)
);


ALTER TABLE public.logical_areas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27538)
-- Name: logicalareas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logicalareas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logicalareas_id_seq OWNER TO postgres;

--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 218
-- Name: logicalareas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logicalareas_id_seq OWNED BY public.logical_areas.id;


--
-- TOC entry 219 (class 1259 OID 27539)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27542)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 220
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 274 (class 1259 OID 29240)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    prod_code character varying(50) NOT NULL,
    prod_desc character varying(200) NOT NULL,
    serial_nr character varying(50),
    expiration_at date,
    logical_area_id bigint NOT NULL,
    quantity numeric(6,2) NOT NULL,
    quantity_pick numeric(6,2) NOT NULL,
    remarks character varying(200),
    shipment_id bigint,
    sn_pos_nr character varying(10),
    status_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 29239)
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO postgres;

--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 273
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- TOC entry 272 (class 1259 OID 29226)
-- Name: order_pick; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_pick (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    store_unit_id bigint NOT NULL,
    store_unit_ean character varying(50),
    product_id bigint,
    prod_code character varying(50),
    prod_desc character varying(200),
    expiration_at date,
    serial_nr character varying(50),
    quarantine date,
    ship_detail_id bigint,
    logical_area_id bigint,
    quantity numeric(6,2),
    fifo timestamp without time zone,
    remarks character varying(200),
    status_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.order_pick OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 29225)
-- Name: order_pick_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_pick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_pick_id_seq OWNER TO postgres;

--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 271
-- Name: order_pick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_pick_id_seq OWNED BY public.order_pick.id;


--
-- TOC entry 268 (class 1259 OID 29179)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    order_nr character varying(50) NOT NULL,
    external_nr character varying(50) NOT NULL,
    firm_id bigint NOT NULL,
    owner_id bigint NOT NULL,
    remarks character varying(200),
    realization_at date NOT NULL,
    progress smallint DEFAULT 0 NOT NULL,
    status_id bigint NOT NULL,
    location_id bigint,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 29178)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 267
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 27543)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 27548)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 27553)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 27558)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 224
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 225 (class 1259 OID 27559)
-- Name: product_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_metrics (
    id bigint NOT NULL,
    code character varying(50),
    longdesc character varying(200),
    amount numeric(6,2),
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.product_metrics OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 27562)
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    id bigint NOT NULL,
    code character varying(50),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_by bigint,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 27565)
-- Name: productmetrics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productmetrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productmetrics_id_seq OWNER TO postgres;

--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 227
-- Name: productmetrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productmetrics_id_seq OWNED BY public.product_metrics.id;


--
-- TOC entry 228 (class 1259 OID 27566)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    code character varying(50),
    longdesc character varying(200),
    producttype_id bigint,
    size_x numeric(6,2),
    size_y numeric(6,2),
    size_z numeric(6,2),
    weight numeric(6,2),
    ean character varying(50),
    metric_id bigint,
    created_by bigint,
    shipment smallint,
    delivery smallint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 27569)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 229
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 230 (class 1259 OID 27570)
-- Name: producttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producttypes_id_seq OWNER TO postgres;

--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 230
-- Name: producttypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producttypes_id_seq OWNED BY public.product_types.id;


--
-- TOC entry 256 (class 1259 OID 28354)
-- Name: shipment_control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipment_control (
    id bigint NOT NULL,
    ship_id bigint NOT NULL,
    store_unit_id bigint NOT NULL,
    store_unit_ean character varying(50),
    product_id bigint NOT NULL,
    prod_code character varying(50) NOT NULL,
    prod_desc character varying(200) NOT NULL,
    expiration_at date,
    serial_nr character varying(50),
    quarantine date,
    ship_detail_id bigint NOT NULL,
    logical_area_id bigint NOT NULL,
    quantity numeric(6,2) NOT NULL,
    fifo timestamp without time zone NOT NULL,
    remarks character varying(200),
    status_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.shipment_control OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 28353)
-- Name: shipment_control_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipment_control_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_control_id_seq OWNER TO postgres;

--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 255
-- Name: shipment_control_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipment_control_id_seq OWNED BY public.shipment_control.id;


--
-- TOC entry 253 (class 1259 OID 28298)
-- Name: shipment_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipment_details (
    id bigint NOT NULL,
    ship_id bigint NOT NULL,
    product_id bigint NOT NULL,
    prod_code character varying(50) NOT NULL,
    prod_desc character varying(200) NOT NULL,
    serial_nr character varying(50),
    expiration_at date,
    logical_area_id bigint NOT NULL,
    quantity numeric(6,2) NOT NULL,
    quantity_control numeric(6,2) NOT NULL,
    remarks character varying(200),
    status_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.shipment_details OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 28297)
-- Name: shipment_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipment_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_details_id_seq OWNER TO postgres;

--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 252
-- Name: shipment_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipment_details_id_seq OWNED BY public.shipment_details.id;


--
-- TOC entry 247 (class 1259 OID 28266)
-- Name: shipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipments (
    id bigint NOT NULL,
    ship_nr character varying(50) NOT NULL,
    external_nr character varying(50) NOT NULL,
    firm_id bigint NOT NULL,
    owner_id bigint NOT NULL,
    remarks character varying(200),
    status_id bigint NOT NULL,
    location_id bigint,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.shipments OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 28265)
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipments_id_seq OWNER TO postgres;

--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 246
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipments_id_seq OWNED BY public.shipments.id;


--
-- TOC entry 231 (class 1259 OID 27571)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id bigint NOT NULL,
    code character varying(50),
    objectname character varying(50)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 28401)
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    store_unit_id bigint NOT NULL,
    product_id bigint NOT NULL,
    prod_code character varying(50) NOT NULL,
    prod_desc character varying(200) NOT NULL,
    expiration_at date,
    serial_nr character varying(50),
    quarantine date,
    owner_id bigint NOT NULL,
    ship_detail_id bigint NOT NULL,
    logical_area_id bigint NOT NULL,
    quantity numeric(6,2) NOT NULL,
    fifo date NOT NULL,
    remarks character varying(200),
    status_id bigint NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 28400)
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO postgres;

--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 260
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- TOC entry 232 (class 1259 OID 27574)
-- Name: store_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_areas (
    id bigint NOT NULL,
    code character varying(50),
    longdesc character varying(200)
);


ALTER TABLE public.store_areas OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 28421)
-- Name: store_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_logs (
    id bigint NOT NULL,
    job_type smallint NOT NULL,
    storeunit_id_in bigint,
    storeunit_ean_in character varying(50),
    storeunit_id_out bigint,
    storeunit_ean_out character varying(50),
    location_in bigint,
    location_ean_in character varying(50),
    location_out bigint,
    location_ean_out character varying(50),
    prod_id bigint,
    prod_code character varying(50),
    prod_desc character varying(200),
    quantity numeric(6,2),
    expiration_at date,
    serial_nr character varying(50),
    owner_id bigint,
    ship_detail_id bigint,
    logical_area_id_in bigint,
    logical_area_code_in character varying(50),
    logical_area_id_out bigint,
    logical_area_code_out character varying(50),
    notes character varying(250),
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.store_logs OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 28420)
-- Name: store_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_logs_id_seq OWNER TO postgres;

--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 264
-- Name: store_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_logs_id_seq OWNED BY public.store_logs.id;


--
-- TOC entry 233 (class 1259 OID 27577)
-- Name: store_unit_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_unit_types (
    id bigint NOT NULL,
    code character varying(50),
    size_x numeric(6,2),
    size_y numeric(6,2),
    size_z numeric(6,2),
    loadwgt numeric(6,2),
    suwgt numeric(6,2),
    prefix character varying(10),
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.store_unit_types OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 27580)
-- Name: store_units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_units (
    id bigint NOT NULL,
    ean character varying(50),
    storeunittype_id bigint,
    location_id bigint,
    su_multi boolean DEFAULT false,
    status_id bigint,
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone,
    print character varying(50)
);


ALTER TABLE public.store_units OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 27584)
-- Name: store_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_units_id_seq OWNER TO postgres;

--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 235
-- Name: store_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_units_id_seq OWNED BY public.store_units.id;


--
-- TOC entry 243 (class 1259 OID 28233)
-- Name: store_units_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_units_logs (
    id bigint NOT NULL,
    su_id bigint NOT NULL,
    ean character varying(50),
    storeunittype_id bigint,
    location_id bigint,
    su_multi boolean DEFAULT false,
    status_id bigint,
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    log_info character varying(250)
);


ALTER TABLE public.store_units_logs OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 28232)
-- Name: store_units_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_units_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_units_logs_id_seq OWNER TO postgres;

--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 242
-- Name: store_units_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_units_logs_id_seq OWNED BY public.store_units_logs.id;


--
-- TOC entry 236 (class 1259 OID 27585)
-- Name: storeareas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storeareas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storeareas_id_seq OWNER TO postgres;

--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 236
-- Name: storeareas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storeareas_id_seq OWNED BY public.store_areas.id;


--
-- TOC entry 237 (class 1259 OID 27586)
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    code character varying(50),
    longdesc character varying(200),
    longdesc2 character varying(200),
    address character varying(50),
    address2 character varying(50),
    tax bigint,
    created_by bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 27591)
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 238
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- TOC entry 239 (class 1259 OID 27592)
-- Name: storeunittypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storeunittypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storeunittypes_id_seq OWNER TO postgres;

--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 239
-- Name: storeunittypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storeunittypes_id_seq OWNED BY public.store_unit_types.id;


--
-- TOC entry 240 (class 1259 OID 27593)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 27598)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 241
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 257 (class 1259 OID 28374)
-- Name: v_analize_store; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_analize_store AS
 SELECT z.storearea_id,
    z.status_id,
    z.code,
    z.code_status,
    z.count_area,
    public.get_count_locations_area(z.storearea_id) AS count_all_area,
    ((z.count_area * 100) / public.get_count_locations_area(z.storearea_id)) AS val_proc
   FROM ( SELECT l.storearea_id,
            l.status_id,
            sa.code,
            s.code AS code_status,
            count(*) AS count_area
           FROM ((public.locations l
             JOIN public.status s ON ((l.status_id = s.id)))
             JOIN public.store_areas sa ON ((l.storearea_id = sa.id)))
          GROUP BY l.storearea_id, l.status_id, sa.code, s.code) z;


ALTER TABLE public.v_analize_store OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 28341)
-- Name: v_control_list; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_control_list AS
 SELECT s.ship_id,
    s.ship_detail_id,
    s.store_unit_ean AS ean,
    s.prod_code,
    s.serial_nr,
    s.expiration_at,
    ls.code AS code_logical,
    s.quantity,
    s.remarks,
    s.updated_at
   FROM (public.shipment_control s
     LEFT JOIN public.logical_areas ls ON ((s.logical_area_id = ls.id)));


ALTER TABLE public.v_control_list OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 28250)
-- Name: v_locations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_locations AS
 SELECT l.id,
    l.ean,
    l.pos_x,
    l.pos_y,
    l.pos_z,
    l.updated_at,
    sa.code AS code_store_area,
    s.code AS code_status
   FROM ((public.locations l
     LEFT JOIN public.store_areas sa ON ((l.storearea_id = sa.id)))
     LEFT JOIN public.status s ON ((l.status_id = s.id)))
  WHERE (l.deleted_at IS NULL);


ALTER TABLE public.v_locations OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 29254)
-- Name: v_order_store_unit; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_order_store_unit AS
 SELECT op.id AS id_order_pick_id,
    su.id,
    su.ean,
    su.su_multi,
    su.created_at,
    su.updated_at,
    su.print,
    sut.code AS code_unit_type,
    l.ean AS ean_loc,
    s.code AS code_status,
    op.status_id
   FROM ((((public.store_units su
     JOIN public.order_pick op ON ((su.id = op.store_unit_id)))
     LEFT JOIN public.store_unit_types sut ON ((su.storeunittype_id = sut.id)))
     LEFT JOIN public.locations l ON ((su.location_id = l.id)))
     LEFT JOIN public.status s ON ((op.status_id = s.id)))
  WHERE (su.deleted_at IS NULL);


ALTER TABLE public.v_order_store_unit OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 29186)
-- Name: v_orders; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_orders AS
 SELECT s.id,
    s.order_nr,
    s.external_nr,
    f.code AS code_firm,
    o.code AS code_owner,
    st.code AS code_status,
    l.ean AS location,
    s.updated_at
   FROM ((((public.orders s
     JOIN public.firms f ON ((s.firm_id = f.id)))
     JOIN public.firms o ON ((s.owner_id = o.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
     LEFT JOIN public.locations l ON ((s.location_id = l.id)))
  WHERE ((s.deleted_at IS NULL) AND (s.status_id = 502));


ALTER TABLE public.v_orders OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 29259)
-- Name: v_orders_pick; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_orders_pick AS
 SELECT s.id,
    s.order_nr,
    s.external_nr,
    f.code AS code_firm,
    o.code AS code_owner,
    st.code AS code_status,
    l.ean AS location,
    s.updated_at
   FROM ((((public.orders s
     JOIN public.firms f ON ((s.firm_id = f.id)))
     JOIN public.firms o ON ((s.owner_id = o.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
     LEFT JOIN public.locations l ON ((s.location_id = l.id)))
  WHERE ((s.deleted_at IS NULL) AND (s.status_id > 502));


ALTER TABLE public.v_orders_pick OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 29220)
-- Name: v_pick_list; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_pick_list AS
 SELECT s.id AS id_stock,
    l.ean AS code_location,
    su.ean AS code_store_unit,
    s.product_id,
    s.prod_code,
    s.prod_desc,
    s.logical_area_id,
    s.quantity,
    s.fifo
   FROM ((public.stocks s
     JOIN public.store_units su ON ((s.store_unit_id = su.id)))
     JOIN public.locations l ON ((su.location_id = l.id)))
  WHERE ((s.status_id = 302) AND (su.status_id = 102) AND (l.status_id = 204) AND (l.storearea_id = 3))
  GROUP BY s.id, l.ean, su.ean, s.product_id, s.prod_code, s.prod_desc, s.logical_area_id, s.quantity, s.fifo;


ALTER TABLE public.v_pick_list OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 28437)
-- Name: v_product; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_product AS
 SELECT su.ean AS ean_su,
    l.ean AS ean_loc,
    la.longdesc AS desc_la,
    f.code,
    st.code AS code_status,
    s.id,
    s.store_unit_id,
    s.product_id,
    s.prod_code,
    s.prod_desc,
    s.expiration_at,
    s.serial_nr,
    s.quarantine,
    s.owner_id,
    s.ship_detail_id,
    s.logical_area_id,
    s.quantity,
    s.fifo,
    s.remarks,
    s.status_id,
    s.created_by,
    s.created_at,
    s.updated_at,
    s.deleted_at
   FROM (((((public.stocks s
     JOIN public.store_units su ON ((s.store_unit_id = su.id)))
     JOIN public.locations l ON ((su.location_id = l.id)))
     JOIN public.logical_areas la ON ((s.logical_area_id = la.id)))
     JOIN public.firms f ON ((s.owner_id = f.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
  WHERE (s.deleted_at IS NULL);


ALTER TABLE public.v_product OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 28255)
-- Name: v_products; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_products AS
 SELECT p.id,
    p.code,
    p.longdesc,
    p.ean,
    pt.code AS code_product_type,
    pm.code AS code_product_metric,
    p.updated_at
   FROM ((public.products p
     LEFT JOIN public.product_types pt ON ((p.producttype_id = pt.id)))
     LEFT JOIN public.product_metrics pm ON ((p.metric_id = pm.id)))
  WHERE (p.deleted_at IS NULL);


ALTER TABLE public.v_products OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 29248)
-- Name: v_reservation; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_reservation AS
 SELECT s.product_id,
    s.prod_code,
    p.longdesc,
    s.logical_area_id,
    la.longdesc AS code_la,
    s.owner_id,
    f.code AS code_firm,
    s.status_id,
    st.code,
    (sum(s.quantity) - ( SELECT COALESCE(sum(r.quantity), (0)::numeric) AS sum
           FROM public.order_details r
          WHERE ((r.product_id = s.product_id) AND (r.logical_area_id = s.logical_area_id) AND (r.status_id = 501)))) AS sum_stock
   FROM ((((public.stocks s
     JOIN public.products p ON ((s.product_id = p.id)))
     JOIN public.logical_areas la ON ((s.logical_area_id = la.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
     JOIN public.firms f ON ((s.owner_id = f.id)))
  WHERE (s.deleted_at IS NULL)
  GROUP BY s.product_id, s.prod_code, p.longdesc, s.owner_id, f.code, s.logical_area_id, la.longdesc, s.status_id, st.code
  ORDER BY s.prod_code;


ALTER TABLE public.v_reservation OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 28379)
-- Name: v_ship_locations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ship_locations AS
 SELECT su.id,
    su.ean,
    sc.ship_id,
    su.status_id
   FROM (public.store_units su
     LEFT JOIN public.shipment_control sc ON ((su.id = sc.store_unit_id)))
  GROUP BY su.id, su.ean, sc.ship_id, su.status_id;


ALTER TABLE public.v_ship_locations OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 28292)
-- Name: v_shipments; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_shipments AS
 SELECT s.id,
    s.ship_nr,
    s.external_nr,
    f.code AS code_firm,
    o.code AS code_owner,
    st.code AS code_status,
    l.ean AS location,
    s.updated_at
   FROM ((((public.shipments s
     JOIN public.firms f ON ((s.firm_id = f.id)))
     JOIN public.firms o ON ((s.owner_id = o.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
     LEFT JOIN public.locations l ON ((s.location_id = l.id)))
  WHERE ((s.deleted_at IS NULL) AND (s.status_id < 403));


ALTER TABLE public.v_shipments OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 28272)
-- Name: v_shipments_controls; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_shipments_controls AS
 SELECT s.id,
    s.ship_nr,
    s.external_nr,
    f.code AS code_firm,
    o.code AS code_owner,
    st.code AS code_status,
    l.ean AS location,
    s.updated_at
   FROM ((((public.shipments s
     JOIN public.firms f ON ((s.firm_id = f.id)))
     JOIN public.firms o ON ((s.owner_id = o.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
     LEFT JOIN public.locations l ON ((s.location_id = l.id)))
  WHERE ((s.deleted_at IS NULL) AND (s.status_id > 402));


ALTER TABLE public.v_shipments_controls OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 28410)
-- Name: v_stock; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_stock AS
 SELECT s.product_id,
    s.prod_code,
    p.longdesc,
    s.logical_area_id,
    la.longdesc AS code_la,
    s.owner_id,
    f.code AS code_firm,
    s.status_id,
    st.code,
    sum(s.quantity) AS sum_stock
   FROM ((((public.stocks s
     JOIN public.products p ON ((s.product_id = p.id)))
     JOIN public.logical_areas la ON ((s.logical_area_id = la.id)))
     JOIN public.status st ON ((s.status_id = st.id)))
     JOIN public.firms f ON ((s.owner_id = f.id)))
  WHERE (s.deleted_at IS NULL)
  GROUP BY s.product_id, s.prod_code, p.longdesc, s.owner_id, f.code, s.logical_area_id, la.longdesc, s.status_id, st.code
  ORDER BY s.prod_code;


ALTER TABLE public.v_stock OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 28415)
-- Name: v_stock_group; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_stock_group AS
 SELECT s.product_id,
    s.prod_code,
    p.longdesc,
    f.code AS code_firm,
    sum(s.quantity) AS sum_stock
   FROM ((public.stocks s
     JOIN public.products p ON ((s.product_id = p.id)))
     JOIN public.firms f ON ((s.owner_id = f.id)))
  WHERE (s.deleted_at IS NULL)
  GROUP BY s.product_id, s.prod_code, p.longdesc, f.code
  ORDER BY s.prod_code;


ALTER TABLE public.v_stock_group OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 28385)
-- Name: v_store_units; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_store_units AS
 SELECT su.id,
    su.ean,
    su.su_multi,
    su.created_at,
    su.updated_at,
    su.print,
    sut.code AS code_unit_type,
    l.ean AS ean_loc,
    s.code AS code_status,
    su.status_id
   FROM (((public.store_units su
     LEFT JOIN public.store_unit_types sut ON ((su.storeunittype_id = sut.id)))
     LEFT JOIN public.locations l ON ((su.location_id = l.id)))
     LEFT JOIN public.status s ON ((su.status_id = s.id)))
  WHERE (su.deleted_at IS NULL);


ALTER TABLE public.v_store_units OWNER TO postgres;

--
-- TOC entry 3364 (class 2604 OID 27599)
-- Name: counters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counters ALTER COLUMN id SET DEFAULT nextval('public.counters_id_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 27600)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 27601)
-- Name: firms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms ALTER COLUMN id SET DEFAULT nextval('public.firms_id_seq'::regclass);


--
-- TOC entry 3371 (class 2604 OID 27602)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 3387 (class 2604 OID 28288)
-- Name: log_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_locations ALTER COLUMN id SET DEFAULT nextval('public.log_locations_id_seq'::regclass);


--
-- TOC entry 3372 (class 2604 OID 27603)
-- Name: logical_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logical_areas ALTER COLUMN id SET DEFAULT nextval('public.logicalareas_id_seq'::regclass);


--
-- TOC entry 3373 (class 2604 OID 27604)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 29243)
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- TOC entry 3394 (class 2604 OID 29229)
-- Name: order_pick id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_pick ALTER COLUMN id SET DEFAULT nextval('public.order_pick_id_seq'::regclass);


--
-- TOC entry 3392 (class 2604 OID 29182)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3374 (class 2604 OID 27605)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3375 (class 2604 OID 27606)
-- Name: product_metrics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_metrics ALTER COLUMN id SET DEFAULT nextval('public.productmetrics_id_seq'::regclass);


--
-- TOC entry 3376 (class 2604 OID 27607)
-- Name: product_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types ALTER COLUMN id SET DEFAULT nextval('public.producttypes_id_seq'::regclass);


--
-- TOC entry 3377 (class 2604 OID 27608)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3389 (class 2604 OID 28357)
-- Name: shipment_control id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_control ALTER COLUMN id SET DEFAULT nextval('public.shipment_control_id_seq'::regclass);


--
-- TOC entry 3388 (class 2604 OID 28301)
-- Name: shipment_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_details ALTER COLUMN id SET DEFAULT nextval('public.shipment_details_id_seq'::regclass);


--
-- TOC entry 3386 (class 2604 OID 28269)
-- Name: shipments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipments ALTER COLUMN id SET DEFAULT nextval('public.shipments_id_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 28404)
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- TOC entry 3378 (class 2604 OID 27609)
-- Name: store_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_areas ALTER COLUMN id SET DEFAULT nextval('public.storeareas_id_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 28424)
-- Name: store_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_logs ALTER COLUMN id SET DEFAULT nextval('public.store_logs_id_seq'::regclass);


--
-- TOC entry 3379 (class 2604 OID 27610)
-- Name: store_unit_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_unit_types ALTER COLUMN id SET DEFAULT nextval('public.storeunittypes_id_seq'::regclass);


--
-- TOC entry 3381 (class 2604 OID 27611)
-- Name: store_units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_units ALTER COLUMN id SET DEFAULT nextval('public.store_units_id_seq'::regclass);


--
-- TOC entry 3384 (class 2604 OID 28236)
-- Name: store_units_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_units_logs ALTER COLUMN id SET DEFAULT nextval('public.store_units_logs_id_seq'::regclass);


--
-- TOC entry 3382 (class 2604 OID 27612)
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- TOC entry 3383 (class 2604 OID 27613)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3616 (class 0 OID 27511)
-- Dependencies: 209
-- Data for Name: counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counters (id, code, amount, created_at, updated_at) FROM stdin;
1	SU	400560	2023-10-06 11:41:55	2023-12-17 11:05:19
2	SHIPMENT	150	2023-01-01 00:00:00	2023-12-17 11:06:02
3	ORDER	31	2023-01-01 00:00:00	2023-12-17 11:14:44
\.


--
-- TOC entry 3618 (class 0 OID 27515)
-- Dependencies: 211
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3620 (class 0 OID 27522)
-- Dependencies: 213
-- Data for Name: firms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firms (id, code, longdesc, tax, street, postcode, city, notes, created_by, shipment, delivery, owner, created_at, updated_at, deleted_at) FROM stdin;
6	kaziu	dhewi	0	ulica	92032	mielec	dewui	6	1	0	0	2023-11-02 08:27:47	2023-11-02 08:54:24	2023-11-02 08:54:24
11	ww	ww	ww	ww	ww	ww	ww	6	1	0	1	2023-11-02 11:02:02	2023-11-02 11:02:11	2023-11-02 11:02:11
10	tata	tata	01-01-077	tata	21-21	mielec	tata	6	1	0	0	2023-11-02 09:26:37	2023-11-12 17:03:59	2023-11-12 17:03:59
9	kaziu	6	67	67	67	6	767	6	0	0	0	2023-11-02 08:55:52	2023-11-12 17:04:06	2023-11-12 17:04:06
8	kaziu	12	12	12	12	12	12	6	0	0	0	2023-11-02 08:55:14	2023-11-12 17:04:32	2023-11-12 17:04:32
12	ooo	ooo	ooo	ooo	oo	ooo	ooo	5	1	1	1	2023-11-17 10:59:05	2023-11-17 11:04:17	2023-11-17 11:04:17
4	lidl	lidl spoko tani	17263533	lidlowa 3	31-866	krakow	jest git	6	1	1	0	2023-10-16 16:55:44	2023-11-17 12:11:21	\N
3	biedra	biedronka spolka zoo	12349876	biedronkowa 2	123-098	mielec	fajna ale droga	6	0	0	1	2023-09-28 14:34:06	2023-11-17 12:12:48	\N
13	ak	ak	ak	ak	ak	ak	ak	5	1	1	0	2023-11-17 11:04:30	2023-11-17 12:13:02	\N
15	Firma BUCIK	Firma BUCIK - sorjjjfdk	4f6ewferfjui	hgerui fhreui	39400	mielec	fjeriofjerv hwuioh	5	0	0	1	2023-11-18 10:23:41	2023-11-18 10:25:28	\N
16	Firma Zofix	Firma Zofix	0	WP 3	39-300	Złotniki	Firma Zofix	5	0	0	1	2023-11-18 11:18:15	2023-11-18 11:18:15	\N
18	Media Expert	Firma Media Expert	gnueriosgnrepi	WP 3	39-300	Mielec	obsługujemy tylko pralki	5	1	1	1	2023-11-19 08:43:35	2023-11-19 08:43:35	\N
19	X-KOM	Firma X-KOM	yt578w34t75048	WP 32	39-300	Mielec	obsługujemy tylko lodówki	5	1	1	1	2023-11-19 08:44:26	2023-11-19 08:44:26	\N
20	Kwidzyń SA	Firma Kwidzyń SA	49745649879465	Wojska Polskiego 23	00-950	Kwidzyń	dostawca papieru	5	1	0	0	2023-12-09 08:09:09	2023-12-09 08:09:09	\N
17	ggg	ggg	ggg	Złotniki 346	39-300	Mielec	brak	5	1	0	0	2023-11-18 12:05:27	2023-12-14 06:14:36	2023-12-14 06:14:36
5	ew	ew	434343	ew	12	ew	w  e	6	1	1	0	2023-11-02 08:27:00	2023-12-14 06:14:41	2023-12-14 06:14:41
\.


--
-- TOC entry 3622 (class 0 OID 27531)
-- Dependencies: 215
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, storearea_id, ean, pos_x, pos_y, pos_z, size_x, size_y, size_z, loadwgt, status_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
55112	2	WYDANIE-06	0	0	0	120.00	100.00	100.00	1000.00	202	5	2023-12-16 10:11:31	2023-12-17 11:02:34	\N
55113	2	WYDANIE-07	0	0	0	120.00	100.00	100.00	1000.00	202	5	2023-12-16 10:47:39	2023-12-17 10:56:43	\N
55111	3	2-2-2	2	2	2	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:42:07	2023-12-17 10:56:37	\N
55103	2	Wydanie-02	0	0	0	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:41:32	2023-12-17 09:48:24	\N
55101	1	Dostawa - 02	0	0	0	120.00	12.00	12.00	1000.00	202	5	2023-12-14 11:40:48	2023-12-14 11:40:48	\N
55108	3	2-1-1	2	1	1	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:42:07	2023-12-14 11:42:07	\N
55109	3	2-1-2	2	1	2	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:42:07	2023-12-14 11:42:07	\N
55110	3	2-2-1	2	2	1	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:42:07	2023-12-14 11:42:07	\N
55107	3	1-2-2	1	2	2	120.00	100.00	100.00	1000.00	204	5	2023-12-14 11:42:07	2023-12-17 11:08:22	\N
55105	3	1-1-2	1	1	2	120.00	100.00	100.00	1000.00	204	5	2023-12-14 11:42:07	2023-12-17 11:08:51	\N
55100	1	Dostawa - 01	0	0	0	120.00	12.00	12.00	1000.00	202	5	2023-12-14 11:40:30	2023-12-17 11:08:51	\N
55106	3	1-2-1	1	2	1	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:42:07	2023-12-17 11:12:47	\N
55104	3	1-1-1	1	1	1	120.00	100.00	100.00	1000.00	202	5	2023-12-14 11:42:07	2023-12-17 11:13:30	\N
55102	2	Wydanie-01	0	0	0	120.00	12.00	100.00	1000.00	204	5	2023-12-14 11:41:10	2023-12-17 11:14:44	\N
\.


--
-- TOC entry 3654 (class 0 OID 28285)
-- Dependencies: 250
-- Data for Name: log_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_locations (id, location_id, status_id, notes, created_by, created_at, updated_at, deleted_at) FROM stdin;
8	54444	204	Zajmuję miejsce dla dostawy: D_2023125_86	5	2023-12-05 15:08:19	2023-12-05 15:08:19	\N
9	54446	204	Zajmuję miejsce dla dostawy: D_2023125_87	5	2023-12-05 15:22:06	2023-12-05 15:22:06	\N
10	54445	204	Zajmuję miejsce dla dostawy: D_2023125_88	5	2023-12-05 15:29:28	2023-12-05 15:29:28	\N
11	54447	204	Zajmuję miejsce dla dostawy: D_2023125_89	5	2023-12-05 16:03:49	2023-12-05 16:03:49	\N
12	54448	204	Zajmuję miejsce dla dostawy: D_2023125_90	5	2023-12-05 16:32:52	2023-12-05 16:32:52	\N
13	54449	204	Zajmuję miejsce dla dostawy: D_2023125_91	5	2023-12-05 16:53:46	2023-12-05 16:53:46	\N
14	54451	204	Zajmuję miejsce dla dostawy: D_2023125_92	5	2023-12-05 17:22:56	2023-12-05 17:22:56	\N
15	54452	204	Zajmuję miejsce dla dostawy: D_2023125_93	5	2023-12-05 17:28:20	2023-12-05 17:28:20	\N
16	54454	204	Zajmuję miejsce dla dostawy: D_2023125_94	5	2023-12-05 20:31:02	2023-12-05 20:31:02	\N
17	54453	204	Zajmuję miejsce dla dostawy: D_2023125_95	5	2023-12-05 20:34:48	2023-12-05 20:34:48	\N
18	54452	403	Wstawiam opakowanie: ...	5	2023-12-06 06:49:15	2023-12-06 06:49:15	\N
19	54452	403	Wstawiam opakowanie: ...	5	2023-12-06 06:49:30	2023-12-06 06:49:30	\N
20	54448	403	Wstawiam opakowanie: ...	5	2023-12-06 06:59:51	2023-12-06 06:59:51	\N
21	54448	403	Wstawiam opakowanie: ...	5	2023-12-06 07:02:59	2023-12-06 07:02:59	\N
22	54448	403	Wstawiam opakowanie: ...	5	2023-12-06 07:03:06	2023-12-06 07:03:06	\N
23	54448	403	Wstawiam opakowanie: ...	5	2023-12-06 07:03:44	2023-12-06 07:03:44	\N
24	54448	403	Wstawiam opakowanie: 059054680001970053	5	2023-12-06 07:11:59	2023-12-06 07:11:59	\N
25	54451	403	Wstawiam opakowanie: 059054680001975935	5	2023-12-06 07:13:37	2023-12-06 07:13:37	\N
26	54455	204	Zajmuję miejsce dla dostawy: D_2023126_96	5	2023-12-06 07:14:51	2023-12-06 07:14:51	\N
27	54455	403	Wstawiam opakowanie: 059054680001980571	5	2023-12-06 07:15:34	2023-12-06 07:15:34	\N
28	54455	403	Wstawiam opakowanie: 059054680001985637	5	2023-12-06 07:15:44	2023-12-06 07:15:44	\N
29	54455	403	Wstawiam opakowanie: 059054680001990761	5	2023-12-06 07:15:50	2023-12-06 07:15:50	\N
30	54455	403	Wstawiam opakowanie: 059054680001996107	5	2023-12-06 07:15:57	2023-12-06 07:15:57	\N
31	54455	403	Wstawiam opakowanie: 059054680002000629	5	2023-12-06 07:16:03	2023-12-06 07:16:03	\N
32	54455	403	Wstawiam opakowanie: 059054680002004252	5	2023-12-06 07:16:09	2023-12-06 07:16:09	\N
\.


--
-- TOC entry 3624 (class 0 OID 27535)
-- Dependencies: 217
-- Data for Name: logical_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logical_areas (id, code, longdesc) FROM stdin;
1	STD	Standard
2	ZPS	Zapas
3	NZ	Niezgodność
4	KWA	Kwarantanna
5	USZ	Uszkodzone
\.


--
-- TOC entry 3626 (class 0 OID 27539)
-- Dependencies: 219
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2014_10_12_100000_create_password_resets_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
\.


--
-- TOC entry 3668 (class 0 OID 29240)
-- Dependencies: 274
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (id, order_id, product_id, prod_code, prod_desc, serial_nr, expiration_at, logical_area_id, quantity, quantity_pick, remarks, shipment_id, sn_pos_nr, status_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
13	29	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	1	60.00	0.00	\N	\N	\N	504	5	2023-12-17 11:09:53	2023-12-17 11:14:21	\N
12	29	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	5	15.00	0.00	\N	\N	\N	504	5	2023-12-17 11:09:48	2023-12-17 11:14:21	\N
\.


--
-- TOC entry 3666 (class 0 OID 29226)
-- Dependencies: 272
-- Data for Name: order_pick; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_pick (id, order_id, store_unit_id, store_unit_ean, product_id, prod_code, prod_desc, expiration_at, serial_nr, quarantine, ship_detail_id, logical_area_id, quantity, fifo, remarks, status_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
41	29	729747	059054680004005585	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	63	5	15.00	2023-12-17 00:00:00	uszkodzone opakowanie	302	5	2023-12-17 11:11:00	2023-12-17 11:11:00	\N
40	29	729747	059054680004005585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	105	5	2023-12-17 11:10:19	2023-12-17 11:11:40	\N
43	29	729732	059054680004005431	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	62	1	20.00	2023-12-17 00:00:00	\N	302	5	2023-12-17 11:12:47	2023-12-17 11:12:47	\N
44	29	729732	059054680004005431	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	62	1	30.00	2023-12-17 00:00:00	\N	302	5	2023-12-17 11:13:30	2023-12-17 11:13:30	\N
45	29	729732	059054680004005431	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	62	1	10.00	2023-12-17 00:00:00	\N	302	5	2023-12-17 11:13:35	2023-12-17 11:13:35	\N
42	29	729732	059054680004005431	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	105	5	2023-12-17 11:11:53	2023-12-17 11:13:35	\N
\.


--
-- TOC entry 3664 (class 0 OID 29179)
-- Dependencies: 268
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_nr, external_nr, firm_id, owner_id, remarks, realization_at, progress, status_id, location_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
29	W_20231217_30	w1	18	16	\N	2023-12-17	0	504	55102	5	2023-12-17 11:09:30	2023-12-17 11:14:21	\N
30	W_20231217_31	y	18	16	\N	2023-12-17	0	502	55102	5	2023-12-17 11:14:44	2023-12-17 11:14:44	\N
\.


--
-- TOC entry 3628 (class 0 OID 27543)
-- Dependencies: 221
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3629 (class 0 OID 27548)
-- Dependencies: 222
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3630 (class 0 OID 27553)
-- Dependencies: 223
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3632 (class 0 OID 27559)
-- Dependencies: 225
-- Data for Name: product_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_metrics (id, code, longdesc, amount, created_by, created_at, updated_at, deleted_at) FROM stdin;
1	szt.	Sztuka	1.00	1	2023-01-01 00:00:00	2023-01-01 00:00:00	\N
2	kg.	Kilogram	1.00	1	2023-01-01 00:00:00	2023-01-01 00:00:00	\N
4	6pk	sześciopak	6.00	1	2023-01-02 00:00:00	2023-01-02 00:00:00	\N
5	cm	centymetry	1.00	6	2023-09-28 15:34:12	2023-09-28 15:34:12	\N
9	lb	funt	1.00	6	2023-10-16 17:06:05	2023-10-16 17:06:05	\N
8	litr	litr	1.00	5	2023-09-29 10:54:56	2023-11-02 09:30:15	2023-11-02 09:30:15
11	tttt	tttdddd	14.00	5	2023-11-14 18:01:13	2023-11-14 18:02:16	2023-11-14 18:02:16
12	fffff	ffffffffffff	12.00	5	2023-11-15 10:26:45	2023-11-15 10:39:15	2023-11-15 10:39:15
13	fre	de	1.00	5	2023-12-01 15:13:37	2023-12-01 15:13:37	\N
6	1L	litra	2.00	6	2023-09-28 19:48:14	2023-12-04 11:04:22	\N
14	brylok6	brylko 6 szt.	6.00	5	2023-12-04 11:04:52	2023-12-04 11:05:12	\N
15	qq	q	1.00	5	2023-12-04 11:11:27	2023-12-04 11:11:42	2023-12-04 11:11:42
\.


--
-- TOC entry 3633 (class 0 OID 27562)
-- Dependencies: 226
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_types (id, code, created_at, updated_at, created_by, deleted_at) FROM stdin;
2	meble	2023-09-27 18:02:55	2023-09-27 18:02:55	1	2023-09-27 18:02:55
6	Art. spożywcze	2023-09-29 10:54:26	2023-09-29 10:54:26	5	\N
7	Komputery	2023-09-30 17:36:29	2023-09-30 17:36:29	7	\N
3	ubrania	2023-09-28 15:27:59	2023-10-05 09:06:00	6	2023-10-05 09:06:00
1	sprzęt agd	1899-12-30 00:00:00	1899-12-30 00:00:00	1	\N
10	6525	2023-10-05 09:36:38	2023-10-05 09:36:59	5	2023-10-05 09:36:59
11	rower	2023-10-05 09:36:44	2023-10-05 09:37:05	5	2023-10-05 09:37:05
14	test2	2023-10-05 09:41:28	2023-10-05 09:41:38	5	2023-10-05 09:41:38
13	test nr 1	2023-10-05 09:41:17	2023-10-05 09:41:46	5	2023-10-05 09:41:46
15	Paleta Euro	2023-10-05 11:14:27	2023-10-05 11:14:52	5	2023-10-05 11:14:52
16	Paleta 2000x1100	2023-10-05 11:14:42	2023-10-05 11:14:56	5	2023-10-05 11:14:56
5	Paleta 1800x1100	2023-09-29 10:16:43	2023-10-05 11:15:00	5	2023-10-05 11:15:00
17	Buty	2023-10-05 11:15:17	2023-10-05 11:15:17	5	\N
21	Stół	2023-10-05 11:32:01	2023-10-05 11:32:01	5	\N
20	Stoły	2023-10-05 11:31:56	2023-10-05 11:32:06	5	2023-10-05 11:32:06
19	Spódnice	2023-10-05 11:15:38	2023-10-05 11:32:10	5	2023-10-05 11:32:10
22	koszula	2023-10-05 11:32:27	2023-10-05 11:32:27	5	\N
23	pojazdy	2023-10-05 11:32:38	2023-10-05 11:32:38	5	\N
24	rower	2023-10-05 11:32:43	2023-10-05 11:32:43	5	\N
25	ww	2023-11-02 09:37:10	2023-11-02 09:37:19	6	2023-11-02 09:37:19
26	rowerki	2023-11-14 18:02:35	2023-11-14 18:02:40	5	2023-11-14 18:02:40
27	ggggggggg	2023-11-14 18:02:51	2023-11-14 18:02:55	5	2023-11-14 18:02:55
28	oooooooooo	2023-11-15 10:40:40	2023-11-15 10:40:45	5	2023-11-15 10:40:45
29	Meble	2023-11-20 09:58:00	2023-11-20 09:58:00	5	\N
18	Spodnie	2023-10-05 11:15:22	2023-12-04 11:07:45	5	2023-12-04 11:07:45
30	spotn	2023-12-04 11:08:15	2023-12-04 11:08:15	5	\N
31	chleb	2023-12-04 11:08:21	2023-12-04 11:08:21	5	\N
32	marakron	2023-12-04 11:08:30	2023-12-04 11:08:30	5	\N
33	telefon	2023-12-04 11:08:45	2023-12-04 11:08:45	5	\N
34	okulary	2023-12-04 11:08:54	2023-12-04 11:08:54	5	\N
35	jj	2023-12-04 11:13:26	2023-12-04 11:13:26	5	\N
36	ii	2023-12-04 11:13:30	2023-12-04 11:13:30	5	\N
37	Papier	2023-12-09 08:07:25	2023-12-09 08:07:25	5	\N
\.


--
-- TOC entry 3635 (class 0 OID 27566)
-- Dependencies: 228
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, code, longdesc, producttype_id, size_x, size_y, size_z, weight, ean, metric_id, created_by, shipment, delivery, created_at, updated_at, deleted_at) FROM stdin;
110044	ww	ww	7	20.00	20.00	20.00	20.00	2345678	6	6	0	1	2023-11-02 11:16:13	2023-11-02 11:16:48	2023-11-02 11:16:48
110046	telewizor	65'', 4K UHD Smart TV	1	145.00	70.00	20.00	25.00	102938373	1	6	0	0	2023-11-12 17:14:38	2023-11-12 17:14:38	\N
110047	kubek na ryby	kubek na ryby2	21	12.00	12.00	12.00	12.00	1221211	1	5	1	0	2023-11-14 18:04:05	2023-11-14 18:05:06	2023-11-14 18:05:06
110048	oo	oo	7	12.00	12.00	12.00	12.00	oo	2	5	1	1	2023-11-15 10:42:05	2023-11-15 10:42:32	2023-11-15 10:42:32
110045	lodowka	samsung a++	1	80.00	50.00	170.00	90.00	098764287	1	6	0	0	2023-11-02 11:22:18	2023-11-20 09:52:25	\N
110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	7	12.00	12.00	12.00	1.00	5905468031632	1	5	0	0	2023-11-20 09:56:35	2023-11-20 09:56:35	\N
110051	L03-LOZ_LOZ_O-OM-2/3_2/4-FRN01	EXTAZA_BRW Łóżko_Łóżko_otwierane Olcha_miodowa 2/3_2/4 Front_01	29	12.00	12.00	12.00	10.00	5905468031632	1	5	0	0	2023-11-20 09:58:33	2023-11-20 09:58:33	\N
110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	7	35.00	40.00	30.00	12.00	5905698541698	1	5	0	0	2023-11-22 20:42:17	2023-11-22 20:42:17	\N
110053	de	de	1	1.00	1.00	1.00	1.00	1	1	5	0	0	2023-12-01 15:15:28	2023-12-01 15:15:38	2023-12-01 15:15:38
110054	rrr	rreereooooo	24	2.00	1.00	1.00	1.00	590001	1	5	0	0	2023-12-02 09:29:35	2023-12-04 11:38:34	2023-12-04 11:38:34
110055	uyuy	w	7	1.00	1.00	1.00	1.00	1	5	5	0	0	2023-12-04 11:33:40	2023-12-04 11:38:40	2023-12-04 11:38:40
110056	Telefon Samsung G23	Telefon Samsung G23	33	20.00	10.00	5.00	1.00	5902158465464	1	5	0	0	2023-12-06 13:58:15	2023-12-06 13:58:15	\N
110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	37	25.00	23.00	1.00	1.00	5905659965874	1	5	0	0	2023-12-09 08:08:15	2023-12-09 08:08:15	\N
\.


--
-- TOC entry 3658 (class 0 OID 28354)
-- Dependencies: 256
-- Data for Name: shipment_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipment_control (id, ship_id, store_unit_id, store_unit_ean, product_id, prod_code, prod_desc, expiration_at, serial_nr, quarantine, ship_detail_id, logical_area_id, quantity, fifo, remarks, status_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
1	56	729540	\N	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	HPWS21A65	\N	24	1	2.00	2023-12-08 10:15:20	\N	302	5	2023-12-08 10:15:20	2023-12-08 10:15:20	\N
2	56	729543	\N	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	2023-12-23	\N	\N	24	1	1.00	2023-12-08 10:15:32	\N	302	5	2023-12-08 10:15:32	2023-12-08 10:15:32	\N
3	56	729542	\N	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	2023-12-25	\N	\N	24	2	50.00	2023-12-08 10:15:59	od klienta	302	5	2023-12-08 10:15:59	2023-12-08 10:15:59	\N
4	56	729545	\N	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	HPWS21A65	\N	24	1	1.00	2023-12-08 10:18:34	aa	302	5	2023-12-08 10:18:34	2023-12-08 10:18:34	\N
5	56	729544	\N	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	24	1	1.00	2023-12-08 10:18:56	\N	302	5	2023-12-08 10:18:56	2023-12-08 10:18:56	\N
6	56	729546	059054680004003581	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	24	1	2.00	2023-12-08 10:20:18	bb	302	5	2023-12-08 10:20:18	2023-12-08 10:20:18	\N
7	56	729547	059054680004003598	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	24	1	1.00	2023-12-08 10:23:40	\N	302	5	2023-12-08 10:23:40	2023-12-08 10:23:40	\N
8	56	729548	059054680004003604	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	24	1	5.00	2023-12-08 10:24:55	65656565	302	5	2023-12-08 10:24:55	2023-12-08 10:24:55	\N
9	56	729549	059054680004003611	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	2023-12-17	HPWS21A612	\N	24	1	2.00	2023-12-08 10:26:45	towar przyszedł bardzo źle zapakowany !!!	302	5	2023-12-08 10:26:45	2023-12-08 10:26:45	\N
10	56	729550	059054680004003628	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	24	1	3.00	2023-12-08 10:29:33	porysowane !!!	302	5	2023-12-08 10:29:33	2023-12-08 10:29:33	\N
11	56	729551	059054680004003635	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	222	\N	24	1	2.00	2023-12-08 10:31:27	222	302	5	2023-12-08 10:31:27	2023-12-08 10:31:27	\N
12	57	729552	059054680004003642	110051	L03-LOZ_LOZ_O-OM-2/3_2/4-FRN01	EXTAZA_BRW Łóżko_Łóżko_otwierane Olcha_miodowa 2/3_2/4 Front_01	\N	\N	\N	25	1	80.00	2023-12-08 10:56:11	\N	302	5	2023-12-08 10:56:11	2023-12-08 10:56:11	\N
13	58	729553	059054680004003659	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	26	1	50.00	2023-12-08 10:58:56	\N	302	5	2023-12-08 10:58:56	2023-12-08 10:58:56	\N
14	59	729563	059054680004003758	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	29	1	1.00	2023-12-08 12:57:51	a	302	5	2023-12-08 12:57:51	2023-12-08 12:57:51	\N
15	59	729563	059054680004003758	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	29	1	2.00	2023-12-08 13:38:06	porysowane !!!	302	5	2023-12-08 13:38:06	2023-12-08 13:38:06	\N
16	59	729563	059054680004003758	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	29	1	3.00	2023-12-08 13:41:23	\N	302	5	2023-12-08 13:41:23	2023-12-08 13:41:23	\N
17	59	729563	059054680004003758	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	29	5	2.00	2023-12-08 13:41:43	porysowane obudowy !	302	5	2023-12-08 13:41:43	2023-12-08 13:41:43	\N
18	59	729563	059054680004003758	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	HPWS21A65	\N	29	1	1.00	2023-12-08 13:41:59	\N	302	5	2023-12-08 13:41:59	2023-12-08 13:41:59	\N
19	59	729563	059054680004003758	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	29	1	1.00	2023-12-08 13:42:34	\N	302	5	2023-12-08 13:42:34	2023-12-08 13:42:34	\N
20	60	729556	059054680004003680	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	HPWS21A65	\N	30	1	1.00	2023-12-08 13:49:05	\N	302	5	2023-12-08 13:49:05	2023-12-08 13:49:05	\N
21	60	729556	059054680004003680	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	2023-12-30	\N	\N	30	1	2.00	2023-12-08 13:49:39	\N	302	5	2023-12-08 13:49:39	2023-12-08 13:49:39	\N
22	60	729556	059054680004003680	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	\N	\N	30	1	7.00	2023-12-08 13:49:47	\N	302	5	2023-12-08 13:49:47	2023-12-08 13:49:47	\N
23	61	729554	059054680004003666	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	\N	\N	31	1	2.00	2023-12-08 15:38:16	\N	302	5	2023-12-08 15:38:16	2023-12-08 15:38:16	\N
24	61	729554	059054680004003666	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	HPWS21A65	\N	31	1	1.00	2023-12-08 15:38:29	\N	302	5	2023-12-08 15:38:29	2023-12-08 15:38:29	\N
25	61	729555	059054680004003673	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	2023-12-10	\N	\N	31	1	2.00	2023-12-08 15:38:41	\N	302	5	2023-12-08 15:38:41	2023-12-08 15:38:41	\N
26	61	729554	059054680004003666	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	\N	\N	31	5	2.00	2023-12-08 15:38:52	\N	302	5	2023-12-08 15:38:52	2023-12-08 15:38:52	\N
27	64	729566	059054680004003789	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	33	1	5.00	2023-12-08 18:47:30	\N	302	5	2023-12-08 18:47:30	2023-12-08 18:47:30	\N
28	64	729566	059054680004003789	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	HPWS21A65	\N	34	1	3.00	2023-12-08 18:47:41	\N	302	5	2023-12-08 18:47:41	2023-12-08 18:47:41	\N
29	64	729566	059054680004003789	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	33	5	1.00	2023-12-08 18:47:54	porysowane !!!	302	5	2023-12-08 18:47:54	2023-12-08 18:47:54	\N
30	64	729567	059054680004003796	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	33	1	10.00	2023-12-08 18:48:09	\N	302	5	2023-12-08 18:48:09	2023-12-08 18:48:09	\N
31	64	729567	059054680004003796	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	\N	\N	34	1	5.00	2023-12-08 18:48:25	\N	302	5	2023-12-08 18:48:25	2023-12-08 18:48:25	\N
32	65	729568	059054680004003802	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	35	1	1.00	2023-12-08 19:31:14	\N	302	5	2023-12-08 19:31:14	2023-12-08 19:31:14	\N
33	65	729569	059054680004003819	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	35	1	2.00	2023-12-08 19:31:21	\N	302	5	2023-12-08 19:31:21	2023-12-08 19:31:21	\N
34	65	729569	059054680004003819	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	35	5	2.00	2023-12-08 19:31:32	porysowane !!!	302	5	2023-12-08 19:31:32	2023-12-08 19:31:32	\N
35	66	729571	059054680004003833	110056	Telefon Samsung G23	Telefon Samsung G23	\N	585	\N	36	1	1.00	2023-12-08 19:36:26	\N	302	5	2023-12-08 19:36:26	2023-12-08 19:36:26	\N
36	66	729571	059054680004003833	110056	Telefon Samsung G23	Telefon Samsung G23	2023-12-24	\N	\N	36	1	50.00	2023-12-08 19:36:38	\N	302	5	2023-12-08 19:36:38	2023-12-08 19:36:38	\N
37	66	729572	059054680004003840	110056	Telefon Samsung G23	Telefon Samsung G23	\N	\N	\N	36	5	25.00	2023-12-08 19:37:05	uszkodzone opakowanie !!!	302	5	2023-12-08 19:37:05	2023-12-08 19:37:05	\N
38	66	729573	059054680004003857	110056	Telefon Samsung G23	Telefon Samsung G23	\N	\N	\N	36	1	6.00	2023-12-08 19:37:15	\N	302	5	2023-12-08 19:37:15	2023-12-08 19:37:15	\N
39	67	729570	059054680004003826	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	2023-12-09	HPWS21A65	\N	37	1	25.00	2023-12-08 19:48:56	\N	302	5	2023-12-08 19:48:56	2023-12-08 19:48:56	\N
40	67	729570	059054680004003826	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	37	5	5.00	2023-12-08 19:49:30	porysowane !!!	302	5	2023-12-08 19:49:30	2023-12-08 19:49:30	\N
41	67	729575	059054680004003871	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	37	1	6.00	2023-12-08 19:49:42	\N	302	5	2023-12-08 19:49:42	2023-12-08 19:49:42	\N
42	68	729574	059054680004003864	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	HPWS21A65	\N	38	1	1.00	2023-12-09 06:35:24	\N	302	5	2023-12-09 06:35:24	2023-12-09 06:35:24	\N
43	68	729574	059054680004003864	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	2023-12-22	\N	\N	38	1	3.00	2023-12-09 06:35:34	\N	302	5	2023-12-09 06:35:34	2023-12-09 06:35:34	\N
44	68	729574	059054680004003864	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	\N	\N	38	5	1.00	2023-12-09 06:35:44	porysowane !!!	302	5	2023-12-09 06:35:44	2023-12-09 06:35:44	\N
45	69	729576	059054680004003888	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	39	1	50.00	2023-12-09 08:11:31	\N	302	5	2023-12-09 08:11:31	2023-12-09 08:11:31	\N
46	70	729577	059054680004003895	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	40	1	10.00	2023-12-09 08:52:15	\N	302	5	2023-12-09 08:52:15	2023-12-09 08:52:15	\N
47	70	729579	059054680004003918	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	40	1	2.00	2023-12-09 08:52:24	\N	302	5	2023-12-09 08:52:24	2023-12-09 08:52:24	\N
48	70	729578	059054680004003901	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	40	1	2.00	2023-12-09 08:52:34	\N	302	5	2023-12-09 08:52:34	2023-12-09 08:52:34	\N
49	70	729584	059054680004003963	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	40	1	86.00	2023-12-09 08:52:43	\N	302	5	2023-12-09 08:52:43	2023-12-09 08:52:43	\N
50	71	729592	059054680004004038	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	41	1	1.00	2023-12-09 12:24:39	\N	302	5	2023-12-09 12:24:39	2023-12-09 12:24:39	\N
51	71	729593	059054680004004045	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	41	1	1.00	2023-12-09 12:24:45	\N	302	5	2023-12-09 12:24:45	2023-12-09 12:24:45	\N
52	71	729594	059054680004004052	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	41	1	8.00	2023-12-09 12:24:51	\N	302	5	2023-12-09 12:24:51	2023-12-09 12:24:51	\N
53	72	729601	059054680004004120	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	42	1	10.00	2023-12-10 07:05:47	\N	302	5	2023-12-10 07:05:47	2023-12-10 07:05:47	\N
54	72	729600	059054680004004113	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	42	3	20.00	2023-12-10 07:05:57	\N	302	5	2023-12-10 07:05:57	2023-12-10 07:05:57	\N
55	72	729598	059054680004004090	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	42	5	10.00	2023-12-10 07:06:09	porysowane !!!	302	5	2023-12-10 07:06:09	2023-12-10 07:06:09	\N
56	72	729600	059054680004004113	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	42	1	20.00	2023-12-10 07:06:24	zagięte rogi	302	5	2023-12-10 07:06:24	2023-12-10 07:06:24	\N
57	72	729598	059054680004004090	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	2023-12-17	\N	\N	42	1	40.00	2023-12-10 07:06:34	\N	302	5	2023-12-10 07:06:34	2023-12-10 07:06:34	\N
58	73	729602	059054680004004137	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	43	1	5.00	2023-12-10 11:01:10	\N	302	5	2023-12-10 11:01:10	2023-12-10 11:01:10	\N
59	73	729603	059054680004004144	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	43	1	5.00	2023-12-10 11:01:21	\N	302	5	2023-12-10 11:01:21	2023-12-10 11:01:21	\N
60	73	729604	059054680004004151	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	\N	\N	44	1	5.00	2023-12-10 11:01:32	\N	302	5	2023-12-10 11:01:32	2023-12-10 11:01:32	\N
61	73	729608	059054680004004199	110056	Telefon Samsung G23	Telefon Samsung G23	\N	\N	\N	46	1	10.00	2023-12-10 11:01:47	\N	302	5	2023-12-10 11:01:47	2023-12-10 11:01:47	\N
62	73	729610	059054680004004212	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	45	5	5.00	2023-12-10 11:02:07	mokry	302	5	2023-12-10 11:02:07	2023-12-10 11:02:07	\N
63	73	729611	059054680004004229	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	45	1	5.00	2023-12-10 11:02:16	\N	302	5	2023-12-10 11:02:16	2023-12-10 11:02:16	\N
64	75	729605	059054680004004168	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	47	1	100.00	2023-12-10 13:41:56	\N	302	5	2023-12-10 13:41:56	2023-12-10 13:41:56	\N
65	80	729607	059054680004004182	110050	Laptop HP G10 i7 14gen 1TB	Laptop HP G10 i7 14gen 1TB podświetlana klawiatura	\N	HPWS21A65	\N	51	1	2.00	2023-12-13 09:23:39	\N	302	5	2023-12-13 09:23:39	2023-12-13 09:23:39	\N
66	81	729613	059054680004004243	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	52	1	5.00	2023-12-13 20:15:22	\N	302	5	2023-12-13 20:15:22	2023-12-13 20:15:22	\N
67	81	729613	059054680004004243	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	52	5	2.00	2023-12-13 20:16:26	papier zalany !!!	302	5	2023-12-13 20:16:26	2023-12-13 20:16:26	\N
68	81	729615	059054680004004267	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	52	1	2.00	2023-12-13 20:16:55	\N	302	5	2023-12-13 20:16:55	2023-12-13 20:16:55	\N
69	82	729628	059054680004004397	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	53	1	50.00	2023-12-14 06:31:26	\N	302	5	2023-12-14 06:31:26	2023-12-14 06:31:26	\N
70	82	729637	059054680004004489	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	53	1	50.00	2023-12-14 06:31:41	\N	302	5	2023-12-14 06:31:41	2023-12-14 06:31:41	\N
71	82	729636	059054680004004472	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	PAPXV1	\N	54	1	50.00	2023-12-14 06:31:56	\N	302	5	2023-12-14 06:31:56	2023-12-14 06:31:56	\N
72	82	729635	059054680004004465	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	PAPXV1	\N	54	1	50.00	2023-12-14 06:32:06	\N	302	5	2023-12-14 06:32:06	2023-12-14 06:32:06	\N
73	83	729677	059054680004004885	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	55	1	2.00	2023-12-14 06:49:00	\N	302	5	2023-12-14 06:49:00	2023-12-14 06:49:00	\N
74	83	729678	059054680004004892	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	55	1	2.00	2023-12-14 06:49:11	\N	302	5	2023-12-14 06:49:11	2023-12-14 06:49:11	\N
75	83	729679	059054680004004908	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	55	5	1.00	2023-12-14 06:49:30	OPAKOWANIE USZKODZONE	302	5	2023-12-14 06:49:30	2023-12-14 06:49:30	\N
76	84	729680	059054680004004915	110052	Drukarka HP 2200 LaserJet	Drukarka HP 2200 LaserJet - mono duplex	\N	\N	\N	56	1	3.00	2023-12-14 06:50:29	\N	302	5	2023-12-14 06:50:29	2023-12-14 06:50:29	\N
77	85	729689	059054680004005004	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	57	1	20.00	2023-12-14 11:44:33	\N	302	5	2023-12-14 11:44:33	2023-12-14 11:44:33	\N
78	85	729690	059054680004005011	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	57	1	20.00	2023-12-14 11:44:43	\N	302	5	2023-12-14 11:44:43	2023-12-14 11:44:43	\N
79	85	729687	059054680004004984	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	57	1	5.00	2023-12-14 11:45:03	\N	302	5	2023-12-14 11:45:03	2023-12-14 11:45:03	\N
80	85	729691	059054680004005028	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	57	1	1.00	2023-12-14 11:45:12	\N	302	5	2023-12-14 11:45:12	2023-12-14 11:45:12	\N
81	85	729691	059054680004005028	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	57	1	4.00	2023-12-14 11:45:24	\N	302	5	2023-12-14 11:45:24	2023-12-14 11:45:24	\N
82	86	729692	059054680004005035	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	58	1	25.00	2023-12-14 12:59:37	\N	302	5	2023-12-14 12:59:37	2023-12-14 12:59:37	\N
83	86	729695	059054680004005066	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	58	1	25.00	2023-12-14 12:59:45	\N	302	5	2023-12-14 12:59:45	2023-12-14 12:59:45	\N
84	87	729700	059054680004005110	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	59	1	50.00	2023-12-17 09:13:35	\N	302	5	2023-12-17 09:13:35	2023-12-17 09:13:35	\N
85	87	729706	059054680004005172	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	59	1	10.00	2023-12-17 09:13:48	\N	302	5	2023-12-17 09:13:48	2023-12-17 09:13:48	\N
86	87	729702	059054680004005134	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	59	1	40.00	2023-12-17 09:13:54	\N	302	5	2023-12-17 09:13:54	2023-12-17 09:13:54	\N
87	88	729714	059054680004005257	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	60	1	5.00	2023-12-17 10:13:09	\N	302	5	2023-12-17 10:13:09	2023-12-17 10:13:09	\N
88	88	729716	059054680004005271	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	60	1	5.00	2023-12-17 10:13:16	\N	302	5	2023-12-17 10:13:16	2023-12-17 10:13:16	\N
89	89	729723	059054680004005349	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	61	1	5.00	2023-12-17 10:44:40	\N	302	5	2023-12-17 10:44:40	2023-12-17 10:44:40	\N
90	89	729722	059054680004005332	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	61	1	5.00	2023-12-17 10:44:50	\N	302	5	2023-12-17 10:44:50	2023-12-17 10:44:50	\N
91	90	729744	059054680004005554	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	63	5	20.00	2023-12-17 11:06:55	uszkodzone opakowanie	302	5	2023-12-17 11:06:55	2023-12-17 11:06:55	\N
92	90	729731	059054680004005424	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	62	1	20.00	2023-12-17 11:07:11	\N	302	5	2023-12-17 11:07:11	2023-12-17 11:07:11	\N
93	90	729745	059054680004005561	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	62	1	50.00	2023-12-17 11:07:20	\N	302	5	2023-12-17 11:07:20	2023-12-17 11:07:20	\N
94	90	729735	059054680004005462	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	62	1	30.00	2023-12-17 11:07:29	\N	302	5	2023-12-17 11:07:29	2023-12-17 11:07:29	\N
\.


--
-- TOC entry 3656 (class 0 OID 28298)
-- Dependencies: 253
-- Data for Name: shipment_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipment_details (id, ship_id, product_id, prod_code, prod_desc, serial_nr, expiration_at, logical_area_id, quantity, quantity_control, remarks, status_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
63	90	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	5	20.00	0.00	uszkodzone opakowanie	401	5	2023-12-17 11:06:34	2023-12-17 11:06:55	\N
62	90	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	1	100.00	0.00	\N	401	5	2023-12-17 11:06:16	2023-12-17 11:07:29	\N
\.


--
-- TOC entry 3652 (class 0 OID 28266)
-- Dependencies: 247
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipments (id, ship_nr, external_nr, firm_id, owner_id, remarks, status_id, location_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
90	D_20231217_150	Dostawa/2032rgy	20	16	tylko papier	404	55100	5	2023-12-17 11:06:02	2023-12-17 11:07:32	\N
\.


--
-- TOC entry 3638 (class 0 OID 27571)
-- Dependencies: 231
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, code, objectname) FROM stdin;
101	Nowa	SU
102	Dostępna	SU
202	Wolna	LOC
203	Zarezerwowana	LOC
204	Zajęta	LOC
205	Zablokowana	LOC
302	Dostępny	PROD
303	Zablokowany	PROD
404	Zakończony	SHIPMENT
401	Wprowadzony	SHIPMENT
402	Oczekuje na kontrolę	SHIPMENT
403	Kontrola przyjęcia	SHIPMENT
103	Zablokowana	SU
104	Usunięta	SU
501	Wprowadzony	ORDER
502	Oczekuje na realizację	ORDER
503	Kompletacja	ORDER
105	Zakończona	SU
504	Wydany	ORDER
\.


--
-- TOC entry 3660 (class 0 OID 28401)
-- Dependencies: 261
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (id, store_unit_id, product_id, prod_code, prod_desc, expiration_at, serial_nr, quarantine, owner_id, ship_detail_id, logical_area_id, quantity, fifo, remarks, status_id, created_by, created_at, updated_at, deleted_at) FROM stdin;
110	729745	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	16	62	1	40.00	2023-12-17	\N	302	5	2023-12-17 11:07:20	2023-12-17 11:13:35	\N
108	729744	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	16	63	5	5.00	2023-12-17	uszkodzone opakowanie	302	5	2023-12-17 11:06:55	2023-12-17 11:11:00	\N
109	729731	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	16	62	1	20.00	2023-12-17	\N	302	5	2023-12-17 11:07:11	2023-12-17 11:12:47	2023-12-17 11:12:47
111	729735	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	\N	\N	\N	16	62	1	30.00	2023-12-17	\N	302	5	2023-12-17 11:07:29	2023-12-17 11:13:30	2023-12-17 11:13:30
\.


--
-- TOC entry 3639 (class 0 OID 27574)
-- Dependencies: 232
-- Data for Name: store_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_areas (id, code, longdesc) FROM stdin;
1	SWEJ	Strefa przyjęć na magazyn
2	SWYJ	Strefa wydań z magazynu
3	SKPL	Strefa kompletacji
\.


--
-- TOC entry 3662 (class 0 OID 28421)
-- Dependencies: 265
-- Data for Name: store_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_logs (id, job_type, storeunit_id_in, storeunit_ean_in, storeunit_id_out, storeunit_ean_out, location_in, location_ean_in, location_out, location_ean_out, prod_id, prod_code, prod_desc, quantity, expiration_at, serial_nr, owner_id, ship_detail_id, logical_area_id_in, logical_area_code_in, logical_area_id_out, logical_area_code_out, notes, created_by, created_at, updated_at) FROM stdin;
248	1	\N	\N	\N	\N	\N	\N	55100	Dostawa - 01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Blokuję miejsce dla dostawy: D_20231217_150	5	2023-12-17 11:06:02	2023-12-17 11:06:02
249	3	\N	\N	729744	059054680004005554	\N	\N	55100	Dostawa - 01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	20.00	\N	\N	\N	63	\N	\N	5	USZ	90 - kontrola dostawy - wstawiam produkty	5	2023-12-17 11:06:55	2023-12-17 11:06:55
250	3	\N	\N	729731	059054680004005424	\N	\N	55100	Dostawa - 01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	20.00	\N	\N	\N	62	\N	\N	1	STD	90 - kontrola dostawy - wstawiam produkty	5	2023-12-17 11:07:11	2023-12-17 11:07:11
251	3	\N	\N	729745	059054680004005561	\N	\N	55100	Dostawa - 01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	50.00	\N	\N	\N	62	\N	\N	1	STD	90 - kontrola dostawy - wstawiam produkty	5	2023-12-17 11:07:20	2023-12-17 11:07:20
252	3	\N	\N	729735	059054680004005462	\N	\N	55100	Dostawa - 01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	30.00	\N	\N	\N	62	\N	\N	1	STD	90 - kontrola dostawy - wstawiam produkty	5	2023-12-17 11:07:29	2023-12-17 11:07:29
253	2	729735	059054680004005462	729735	059054680004005462	55100	Dostawa - 01	55104	1-1-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Przesunięcie opakowania.	5	2023-12-17 11:08:07	2023-12-17 11:08:07
254	2	729745	059054680004005561	729745	059054680004005561	55100	Dostawa - 01	55107	1-2-2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Przesunięcie opakowania.	5	2023-12-17 11:08:22	2023-12-17 11:08:22
255	2	729731	059054680004005424	729731	059054680004005424	55100	Dostawa - 01	55106	1-2-1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Przesunięcie opakowania.	5	2023-12-17 11:08:34	2023-12-17 11:08:34
256	2	729744	059054680004005554	729744	059054680004005554	55100	Dostawa - 01	55105	1-1-2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Przesunięcie opakowania.	5	2023-12-17 11:08:51	2023-12-17 11:08:51
257	1	\N	\N	\N	\N	\N	\N	55102	Wydanie-01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Blokuję miejsce dla wydania: W_20231217_30	5	2023-12-17 11:09:30	2023-12-17 11:09:30
258	1	\N	\N	729747	059054680004005585	\N	\N	55102	Wydanie-01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Wydanie - przypisuje opakowanie: W_20231217_30	5	2023-12-17 11:10:19	2023-12-17 11:10:19
259	3	729744	059054680004005554	729747	059054680004005585	55105	1-1-2	55102	Wydanie-01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	15.00	\N	\N	\N	63	\N	\N	5	USZ	Kompletacja - przesunięcie produktu, ilość: 15.00	5	2023-12-17 11:11:00	2023-12-17 11:11:00
260	1	\N	\N	729732	059054680004005431	\N	\N	55102	Wydanie-01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Wydanie - przypisuje opakowanie: W_20231217_30	5	2023-12-17 11:11:53	2023-12-17 11:11:53
261	3	729731	059054680004005424	729732	059054680004005431	55106	1-2-1	55102	Wydanie-01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	20.00	\N	\N	\N	62	\N	\N	1	STD	Kompletacja - przesunięcie produktu, ilość: 20.00	5	2023-12-17 11:12:47	2023-12-17 11:12:47
262	3	729735	059054680004005462	729732	059054680004005431	55104	1-1-1	55102	Wydanie-01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	30.00	\N	\N	\N	62	\N	\N	1	STD	Kompletacja - przesunięcie produktu, ilość: 30.00	5	2023-12-17 11:13:30	2023-12-17 11:13:30
263	3	729745	059054680004005561	729732	059054680004005431	55107	1-2-2	55102	Wydanie-01	110057	Papier A4 Kwidzyń 80	Papier A4 Kwidzyń 80gr biały	10.00	\N	\N	\N	62	\N	\N	1	STD	Kompletacja - przesunięcie produktu, ilość: 10.00	5	2023-12-17 11:13:35	2023-12-17 11:13:35
264	1	\N	\N	\N	\N	\N	\N	55102	Wydanie-01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Blokuję miejsce dla wydania: W_20231217_31	5	2023-12-17 11:14:44	2023-12-17 11:14:44
\.


--
-- TOC entry 3640 (class 0 OID 27577)
-- Dependencies: 233
-- Data for Name: store_unit_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_unit_types (id, code, size_x, size_y, size_z, loadwgt, suwgt, prefix, created_by, created_at, updated_at, deleted_at) FROM stdin;
5	Paleta Euro	120.00	80.00	20.00	1500.00	20.00	PL	1	2023-10-06 09:04:41	2023-10-06 09:04:42	\N
8	Paleta 180x110	180.00	110.00	20.00	2000.00	35.00	PL	1	2023-10-06 09:07:28	2023-10-06 09:07:29	\N
13	qw	12.00	12.00	12.00	12.00	12.00	qw	5	2023-11-14 17:47:47	2023-11-14 17:49:19	2023-11-14 17:49:19
14	Paleta 220x110	220.00	110.00	35.00	2000.00	35.00	22x110	5	2023-11-30 18:39:14	2023-11-30 18:39:14	\N
16	skrzynka na butelki krata 12szt	35.00	40.00	30.00	5.00	1.00	krata12	5	2023-12-01 12:29:35	2023-12-01 12:29:35	\N
17	skrzynka na ziemniaki 20kg	40.00	20.00	10.00	1.50	2.70	s20kg	5	2023-12-01 13:54:26	2023-12-01 13:54:26	\N
19	Skrzynka na pomidory 15kg	40.00	30.00	10.00	1.00	1.00	pom15	5	2023-12-04 10:41:35	2023-12-04 10:41:35	\N
12	ww	3.00	2.00	2.00	40.00	2.00	ww	6	2023-11-02 09:42:38	2023-12-04 10:46:17	2023-12-04 10:46:17
18	few	1.00	1.00	1.00	1.00	1.00	few	5	2023-12-01 15:01:55	2023-12-04 10:46:23	2023-12-04 10:46:23
15	skrzynka na butelki krata 24szt	120.00	12.00	12.00	1000.00	1.00	krata 24	5	2023-12-01 12:24:26	2023-12-04 10:46:39	2023-12-04 10:46:39
20	Skrzynka na papier A4-20szt	20.00	30.00	10.00	5.00	2.00	A4-20	5	2023-12-04 10:47:35	2023-12-04 10:56:32	\N
22	r	1.00	1.00	1.00	1.00	1.00	r2r	5	2023-12-04 11:12:30	2023-12-04 11:12:57	2023-12-04 11:12:57
21	q	1.00	1.00	1.00	1.00	1.00	qfewf	5	2023-12-04 11:09:14	2023-12-04 11:13:04	2023-12-04 11:13:04
23	Pudełko A3	50.00	30.00	10.00	2.00	1.00	PA3	5	2023-12-05 11:22:50	2023-12-05 11:23:06	2023-12-05 11:23:06
24	Paleta wysyłkowa AGD	120.00	80.00	20.00	1000.00	35.00	Wys AGD	5	2023-12-14 06:26:16	2023-12-14 06:26:16	\N
\.


--
-- TOC entry 3641 (class 0 OID 27580)
-- Dependencies: 234
-- Data for Name: store_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_units (id, ean, storeunittype_id, location_id, su_multi, status_id, created_by, created_at, updated_at, deleted_at, print) FROM stdin;
729739	059054680004005509	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729740	059054680004005516	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729741	059054680004005523	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729742	059054680004005530	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729743	059054680004005547	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729746	059054680004005578	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729748	059054680004005592	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729749	059054680004005608	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729745	059054680004005561	20	55107	t	102	5	2023-12-17 11:05:19	2023-12-17 11:08:22	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729744	059054680004005554	20	55105	t	102	5	2023-12-17 11:05:19	2023-12-17 11:08:51	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729730	059054680004005417	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729733	059054680004005448	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729734	059054680004005455	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729736	059054680004005479	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729737	059054680004005486	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729738	059054680004005493	20	\N	t	101	5	2023-12-17 11:05:19	2023-12-17 11:05:19	\N	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729731	059054680004005424	20	55106	t	102	5	2023-12-17 11:05:19	2023-12-17 11:12:47	2023-12-17 11:12:47	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729735	059054680004005462	20	55104	t	102	5	2023-12-17 11:05:19	2023-12-17 11:13:30	2023-12-17 11:13:30	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729747	059054680004005585	20	55102	t	105	5	2023-12-17 11:05:19	2023-12-17 11:14:21	2023-12-17 11:14:21	fac8ad82-ff41-4f6d-834d-9516b35d83d2
729732	059054680004005431	20	55102	t	105	5	2023-12-17 11:05:19	2023-12-17 11:14:21	2023-12-17 11:14:21	fac8ad82-ff41-4f6d-834d-9516b35d83d2
\.


--
-- TOC entry 3650 (class 0 OID 28233)
-- Dependencies: 243
-- Data for Name: store_units_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_units_logs (id, su_id, ean, storeunittype_id, location_id, su_multi, status_id, created_by, created_at, log_info) FROM stdin;
\.


--
-- TOC entry 3644 (class 0 OID 27586)
-- Dependencies: 237
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, code, longdesc, longdesc2, address, address2, tax, created_by, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 3647 (class 0 OID 27593)
-- Dependencies: 240
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, firstname, lastname, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	aa	aa	aa@aa.aa	\N	$2y$10$MgbsTUEQrlUK5RBXOeeeuOt3zwughg7sczH3.nH.tNcllqVwEtvXy	\N	2023-09-23 12:40:06	2023-09-23 12:40:06
2	bb	bb	bb@bb.bb	\N	$2y$10$62eS1WMXhZUZ7W/h5qt.d.iJL.nncyKpvpvjMXJoE.ChPV50IIxwC	\N	2023-09-23 12:44:57	2023-09-23 12:44:57
3	cc	cc	cc@cc.cc	\N	$2y$10$Y9EYOX7PuG3BEUvLMdTsyuH.ixb1Gf92cBim33rA3pMbDT6An3bvm	\N	2023-09-23 12:49:39	2023-09-23 12:49:39
4	Kaziu	Latawiec	zz@zz.zz	\N	$2y$10$pTNR0lBsFKUI9SduBDltxesehl0dt/RjgYfv3ld90VDwltNvjJ3I.	\N	2023-09-23 12:57:30	2023-09-23 12:57:30
5	kaziu	lata	kazlat@post.pl	\N	$2y$10$aGwIdMwDqy.OqNWaOBkZk.H4xHydpZETZxK3uM5X.UWV.EXIYwEg2	\N	2023-09-25 15:33:14	2023-09-25 15:49:26
6	zosia	latawiec	ll@ll.ll	\N	$2y$10$yWwkdxjL3a1ZvqQMh3q7ZeUwSCKQ90WYHzuTplNVTjGIABfWOC7Vi	\N	2023-09-26 10:50:07	2023-09-26 10:50:07
7	Maciej	Latawiec	maciek@super.pl	\N	$2y$10$4MvTeywYoKSKzwd5cIvQX.KYBh9yS4g38PUu66u3FMRXYMEUZsF7a	\N	2023-09-30 17:35:16	2023-09-30 17:35:16
\.


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 210
-- Name: counters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.counters_id_seq', 4, true);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 212
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 214
-- Name: firms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firms_id_seq', 20, true);


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 216
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 55113, true);


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 249
-- Name: log_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_locations_id_seq', 32, true);


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 218
-- Name: logicalareas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logicalareas_id_seq', 5, true);


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 220
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 5, true);


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 273
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 13, true);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 271
-- Name: order_pick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_pick_id_seq', 45, true);


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 267
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 30, true);


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 224
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 227
-- Name: productmetrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productmetrics_id_seq', 15, true);


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 229
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 110057, true);


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 230
-- Name: producttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producttypes_id_seq', 37, true);


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 255
-- Name: shipment_control_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipment_control_id_seq', 94, true);


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 252
-- Name: shipment_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipment_details_id_seq', 63, true);


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 246
-- Name: shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipments_id_seq', 90, true);


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 260
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_id_seq', 115, true);


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 264
-- Name: store_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_logs_id_seq', 264, true);


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 235
-- Name: store_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_units_id_seq', 729749, true);


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 242
-- Name: store_units_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_units_logs_id_seq', 1, false);


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 236
-- Name: storeareas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storeareas_id_seq', 4, true);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 238
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 1, false);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 239
-- Name: storeunittypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storeunittypes_id_seq', 24, true);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 241
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 3397 (class 2606 OID 27615)
-- Name: counters counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counters
    ADD CONSTRAINT counters_pkey PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 27617)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3401 (class 2606 OID 27619)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3403 (class 2606 OID 27621)
-- Name: firms firms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms
    ADD CONSTRAINT firms_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 27623)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3446 (class 2606 OID 28290)
-- Name: log_locations log_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_locations
    ADD CONSTRAINT log_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3407 (class 2606 OID 27625)
-- Name: logical_areas logicalareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logical_areas
    ADD CONSTRAINT logicalareas_pkey PRIMARY KEY (id);


--
-- TOC entry 3409 (class 2606 OID 27627)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3460 (class 2606 OID 29247)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3458 (class 2606 OID 29233)
-- Name: order_pick order_pick_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_pick
    ADD CONSTRAINT order_pick_pkey PRIMARY KEY (id);


--
-- TOC entry 3456 (class 2606 OID 29185)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 27629)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3414 (class 2606 OID 27631)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3416 (class 2606 OID 27633)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3419 (class 2606 OID 27635)
-- Name: product_metrics productmetrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_metrics
    ADD CONSTRAINT productmetrics_pkey PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 27637)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3421 (class 2606 OID 27639)
-- Name: product_types producttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (id);


--
-- TOC entry 3450 (class 2606 OID 28361)
-- Name: shipment_control shipment_control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_control
    ADD CONSTRAINT shipment_control_pkey PRIMARY KEY (id);


--
-- TOC entry 3448 (class 2606 OID 28305)
-- Name: shipment_details shipment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_details
    ADD CONSTRAINT shipment_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2606 OID 28271)
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 27641)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 3452 (class 2606 OID 28408)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- TOC entry 3454 (class 2606 OID 28428)
-- Name: store_logs store_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_logs
    ADD CONSTRAINT store_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3442 (class 2606 OID 28239)
-- Name: store_units_logs store_units_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_units_logs
    ADD CONSTRAINT store_units_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3428 (class 2606 OID 27643)
-- Name: store_areas storeareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_areas
    ADD CONSTRAINT storeareas_pkey PRIMARY KEY (id);


--
-- TOC entry 3436 (class 2606 OID 27645)
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- TOC entry 3434 (class 2606 OID 27647)
-- Name: store_units storeunits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_units
    ADD CONSTRAINT storeunits_pkey PRIMARY KEY (id);


--
-- TOC entry 3430 (class 2606 OID 27649)
-- Name: store_unit_types storeunittypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_unit_types
    ADD CONSTRAINT storeunittypes_pkey PRIMARY KEY (id);


--
-- TOC entry 3438 (class 2606 OID 27651)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3440 (class 2606 OID 27653)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 1259 OID 27654)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3417 (class 1259 OID 27655)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3422 (class 1259 OID 27656)
-- Name: products_idx_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_idx_updated_at ON public.products USING btree (updated_at, deleted_at);


--
-- TOC entry 3431 (class 1259 OID 28335)
-- Name: store_units_idx_ean; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_units_idx_ean ON public.store_units USING btree (ean);


--
-- TOC entry 3432 (class 1259 OID 28231)
-- Name: store_units_idx_print; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_units_idx_print ON public.store_units USING btree (print);


-- Completed on 2023-12-17 12:30:44

--
-- PostgreSQL database dump complete
--

