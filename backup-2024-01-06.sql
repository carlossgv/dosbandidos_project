--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

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
-- Name: accounting_cashlog; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_cashlog (
    id bigint NOT NULL,
    date date NOT NULL,
    cash_sales numeric(8,2) NOT NULL,
    card_auto_grat numeric(8,2) NOT NULL,
    card_tips numeric(8,2) NOT NULL,
    modifications numeric(8,2) NOT NULL,
    comments text NOT NULL,
    restaurant_id bigint NOT NULL,
    "isChecked" boolean NOT NULL,
    "wasSent" boolean NOT NULL,
    "createdBy_id" integer
);


ALTER TABLE public.accounting_cashlog OWNER TO carlossgv;

--
-- Name: accounting_cashlog_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_cashlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_cashlog_id_seq OWNER TO carlossgv;

--
-- Name: accounting_cashlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_cashlog_id_seq OWNED BY public.accounting_cashlog.id;


--
-- Name: accounting_expense; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_expense (
    id bigint NOT NULL,
    amount numeric(8,2) NOT NULL,
    date date NOT NULL,
    cost_center character varying(20) NOT NULL,
    reference character varying(100) NOT NULL,
    comments text NOT NULL,
    restaurant_id bigint NOT NULL,
    supplier_id bigint NOT NULL,
    created_by_id integer
);


ALTER TABLE public.accounting_expense OWNER TO carlossgv;

--
-- Name: accounting_expense_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_expense_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_expense_id_seq OWNER TO carlossgv;

--
-- Name: accounting_expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_expense_id_seq OWNED BY public.accounting_expense.id;


--
-- Name: accounting_income; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_income (
    id bigint NOT NULL,
    amount numeric(8,2) NOT NULL,
    date date,
    initial_date date NOT NULL,
    comments text NOT NULL,
    restaurant_id bigint NOT NULL,
    supplier_id bigint NOT NULL
);


ALTER TABLE public.accounting_income OWNER TO carlossgv;

--
-- Name: accounting_income_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_income_id_seq OWNER TO carlossgv;

--
-- Name: accounting_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_income_id_seq OWNED BY public.accounting_income.id;


--
-- Name: accounting_metric; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_metric (
    id bigint NOT NULL,
    amount numeric(8,2) NOT NULL,
    initial_date date,
    date date NOT NULL,
    comments text NOT NULL,
    restaurant_id bigint NOT NULL,
    supplier_id bigint NOT NULL
);


ALTER TABLE public.accounting_metric OWNER TO carlossgv;

--
-- Name: accounting_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_metric_id_seq OWNER TO carlossgv;

--
-- Name: accounting_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_metric_id_seq OWNED BY public.accounting_metric.id;


--
-- Name: accounting_restaurant; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_restaurant (
    id bigint NOT NULL,
    name character varying(100),
    address character varying(100),
    username character varying(100) NOT NULL
);


ALTER TABLE public.accounting_restaurant OWNER TO carlossgv;

--
-- Name: accounting_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_restaurant_id_seq OWNER TO carlossgv;

--
-- Name: accounting_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_restaurant_id_seq OWNED BY public.accounting_restaurant.id;


--
-- Name: accounting_rule; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_rule (
    id bigint NOT NULL,
    description character varying(200) NOT NULL,
    supplier_id bigint NOT NULL
);


ALTER TABLE public.accounting_rule OWNER TO carlossgv;

--
-- Name: accounting_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_rule_id_seq OWNER TO carlossgv;

--
-- Name: accounting_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_rule_id_seq OWNED BY public.accounting_rule.id;


--
-- Name: accounting_supplier; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.accounting_supplier (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    supplier_type character varying(20) NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.accounting_supplier OWNER TO carlossgv;

--
-- Name: accounting_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.accounting_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_supplier_id_seq OWNER TO carlossgv;

--
-- Name: accounting_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.accounting_supplier_id_seq OWNED BY public.accounting_supplier.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO carlossgv;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO carlossgv;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO carlossgv;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO carlossgv;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO carlossgv;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO carlossgv;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO carlossgv;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO carlossgv;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO carlossgv;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO carlossgv;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO carlossgv;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO carlossgv;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO carlossgv;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO carlossgv;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO carlossgv;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO carlossgv;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO carlossgv;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO carlossgv;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO carlossgv;

--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.users_profile (
    id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_profile OWNER TO carlossgv;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.users_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_id_seq OWNER TO carlossgv;

--
-- Name: users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.users_profile_id_seq OWNED BY public.users_profile.id;


--
-- Name: users_profile_restaurant; Type: TABLE; Schema: public; Owner: carlossgv
--

CREATE TABLE public.users_profile_restaurant (
    id bigint NOT NULL,
    profile_id bigint NOT NULL,
    restaurant_id bigint NOT NULL
);


ALTER TABLE public.users_profile_restaurant OWNER TO carlossgv;

--
-- Name: users_profile_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: carlossgv
--

CREATE SEQUENCE public.users_profile_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_restaurant_id_seq OWNER TO carlossgv;

--
-- Name: users_profile_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlossgv
--

ALTER SEQUENCE public.users_profile_restaurant_id_seq OWNED BY public.users_profile_restaurant.id;


--
-- Name: accounting_cashlog id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_cashlog ALTER COLUMN id SET DEFAULT nextval('public.accounting_cashlog_id_seq'::regclass);


--
-- Name: accounting_expense id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_expense ALTER COLUMN id SET DEFAULT nextval('public.accounting_expense_id_seq'::regclass);


--
-- Name: accounting_income id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_income ALTER COLUMN id SET DEFAULT nextval('public.accounting_income_id_seq'::regclass);


--
-- Name: accounting_metric id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_metric ALTER COLUMN id SET DEFAULT nextval('public.accounting_metric_id_seq'::regclass);


--
-- Name: accounting_restaurant id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_restaurant ALTER COLUMN id SET DEFAULT nextval('public.accounting_restaurant_id_seq'::regclass);


--
-- Name: accounting_rule id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_rule ALTER COLUMN id SET DEFAULT nextval('public.accounting_rule_id_seq'::regclass);


--
-- Name: accounting_supplier id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_supplier ALTER COLUMN id SET DEFAULT nextval('public.accounting_supplier_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: users_profile id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN id SET DEFAULT nextval('public.users_profile_id_seq'::regclass);


--
-- Name: users_profile_restaurant id; Type: DEFAULT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile_restaurant ALTER COLUMN id SET DEFAULT nextval('public.users_profile_restaurant_id_seq'::regclass);


--
-- Data for Name: accounting_cashlog; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_cashlog (id, date, cash_sales, card_auto_grat, card_tips, modifications, comments, restaurant_id, "isChecked", "wasSent", "createdBy_id") FROM stdin;
61	2021-05-17	0.00	0.00	0.00	1000.00		2	f	f	\N
63	2021-05-18	0.00	0.00	0.00	1000.00	revisar banco	2	f	f	\N
65	2021-05-19	0.00	0.00	0.00	0.00		2	f	f	\N
67	2021-05-20	0.00	0.00	0.00	0.00		2	f	f	\N
69	2021-05-21	0.00	0.00	0.00	0.00		2	f	f	\N
71	2021-05-22	0.00	0.00	0.00	0.00		2	f	f	\N
72	2021-05-23	0.00	0.00	53.00	0.00		1	f	f	\N
73	2021-05-23	0.00	0.00	0.00	0.00		2	f	f	\N
75	2021-05-24	0.00	0.00	0.00	0.00		2	f	f	\N
77	2021-05-25	0.00	0.00	0.00	0.00		2	f	f	\N
79	2021-05-26	0.00	0.00	0.00	0.00		2	f	f	\N
81	2021-05-27	0.00	0.00	0.00	0.00		2	f	f	\N
83	2021-05-28	0.00	0.00	0.00	1000.00		2	f	f	\N
85	2021-05-29	0.00	0.00	0.00	0.00		2	f	f	\N
87	2021-05-30	0.00	0.00	0.00	0.00		2	f	f	\N
95	2021-05-31	0.00	0.00	0.00	0.00		2	f	f	\N
96	2021-06-01	0.00	0.00	0.00	2000.00		2	f	f	\N
97	2021-06-02	0.00	0.00	0.00	0.00		2	f	f	\N
98	2021-06-03	0.00	0.00	0.00	0.00		2	f	f	\N
99	2021-06-04	0.00	0.00	0.00	0.00		2	f	f	\N
100	2021-06-05	0.00	0.00	0.00	0.00		2	f	f	\N
101	2021-06-06	0.00	0.00	0.00	0.00		2	f	f	\N
109	2021-06-07	0.00	0.00	0.00	1500.00		2	f	f	\N
110	2021-06-08	0.00	0.00	0.00	0.00		2	f	f	\N
111	2021-06-09	0.00	0.00	0.00	0.00		2	f	f	\N
112	2021-06-10	0.00	0.00	0.00	0.00		2	f	f	\N
113	2021-06-11	0.00	0.00	0.00	0.00		2	f	f	\N
114	2021-06-12	0.00	0.00	0.00	0.00		2	f	f	\N
115	2021-06-13	0.00	0.00	0.00	0.00		2	f	f	\N
122	2021-06-20	0.00	0.00	0.00	0.00		1	f	f	\N
123	2021-06-14	0.00	0.00	0.00	0.00		2	f	f	\N
124	2021-06-15	0.00	0.00	0.00	1500.00	Cheque 507	2	f	f	\N
125	2021-06-16	0.00	0.00	0.00	0.00		2	f	f	\N
126	2021-06-17	0.00	0.00	0.00	0.00		2	f	f	\N
127	2021-06-18	0.00	0.00	0.00	0.00		2	f	f	\N
128	2021-06-19	0.00	0.00	0.00	1500.00	Cheque 2001	2	f	f	\N
129	2021-06-20	0.00	0.00	0.00	0.00		2	f	f	\N
137	2021-06-21	0.00	0.00	0.00	0.00		2	f	f	\N
138	2021-06-22	0.00	0.00	0.00	0.00		2	f	f	\N
139	2021-06-23	0.00	0.00	0.00	2000.00		2	f	f	\N
140	2021-06-24	0.00	0.00	0.00	0.00		2	f	f	\N
141	2021-06-25	0.00	0.00	0.00	0.00		2	f	f	\N
142	2021-06-26	0.00	0.00	0.00	0.00		2	f	f	\N
143	2021-06-27	0.00	0.00	0.00	0.00		2	f	f	\N
150	2021-07-04	0.00	0.00	0.00	0.00		1	f	f	\N
151	2021-06-28	0.00	0.00	0.00	-40.00		2	f	f	\N
152	2021-06-29	0.00	0.00	0.00	0.00		2	f	f	\N
153	2021-06-30	0.00	0.00	0.00	0.00		2	f	f	\N
154	2021-07-01	0.00	0.00	0.00	2000.00		2	f	f	\N
155	2021-07-02	0.00	0.00	0.00	0.00		2	f	f	\N
156	2021-07-03	0.00	0.00	0.00	0.00		2	f	f	\N
157	2021-07-04	0.00	0.00	0.00	0.00		2	f	f	\N
158	2021-07-05	0.00	0.00	0.00	0.00	no lo enviaron	1	f	f	\N
159	2021-07-06	0.00	0.00	0.00	0.00	no lo enviaron	1	f	f	\N
165	2021-07-05	0.00	0.00	0.00	0.00	listo	2	f	f	\N
166	2021-07-06	0.00	0.00	0.00	0.00	si	2	f	f	\N
167	2021-07-07	0.00	0.00	0.00	0.00	listo	2	f	f	\N
168	2021-07-08	0.00	0.00	0.00	0.00	listo	2	f	f	\N
169	2021-07-09	0.00	0.00	0.00	0.00	si	2	f	f	\N
170	2021-07-10	0.00	0.00	0.00	0.00	si	2	f	f	\N
171	2021-07-11	0.00	0.00	0.00	0.00	listo	2	f	f	\N
179	2021-07-12	0.00	0.00	0.00	2000.00	CHEQUEAR	2	f	f	\N
180	2021-07-13	0.00	0.00	0.00	0.00	listo	2	f	f	\N
181	2021-07-14	0.00	0.00	0.00	0.00	listo	2	f	f	\N
182	2021-07-15	0.00	0.00	0.00	0.00	listo	2	f	f	\N
183	2021-07-16	0.00	0.00	0.00	0.00	listo	2	f	f	\N
184	2021-07-17	0.00	0.00	0.00	0.00	listp	2	f	f	\N
185	2021-07-18	0.00	0.00	0.00	0.00	listo	2	f	f	\N
193	2021-07-19	0.00	0.00	0.00	0.00	listo	2	f	f	\N
194	2021-07-20	0.00	0.00	0.00	0.00	listo	2	f	f	\N
195	2021-07-21	0.00	0.00	0.00	0.00	listo	2	f	f	\N
196	2021-07-22	0.00	0.00	0.00	0.00	listo	2	f	f	\N
197	2021-07-23	0.00	0.00	0.00	0.00	listo	2	f	f	\N
198	2021-07-24	0.00	0.00	0.00	0.00	listo	2	f	f	\N
199	2021-07-25	0.00	0.00	0.00	0.00	listo	2	f	f	\N
207	2021-07-26	0.00	0.00	0.00	0.00	listo	2	f	f	\N
208	2021-07-27	0.00	0.00	0.00	0.00	listo	2	f	f	\N
209	2021-07-28	0.00	0.00	0.00	0.00	listo	2	f	f	\N
210	2021-07-29	0.00	0.00	0.00	2000.00	Chequear 2000	2	f	f	\N
211	2021-07-30	0.00	0.00	0.00	0.00	listo	2	f	f	\N
212	2021-07-31	0.00	0.00	0.00	0.00	listo	2	f	f	\N
213	2021-08-01	0.00	0.00	0.00	0.00	listo	2	f	f	\N
221	2021-08-02	0.00	0.00	0.00	0.00	listo	2	f	f	\N
222	2021-08-03	0.00	0.00	0.00	0.00	no lo enviaron	2	f	f	\N
223	2021-08-04	0.00	0.00	0.00	0.00	listo	2	f	f	\N
224	2021-08-05	0.00	0.00	0.00	0.00	listo	2	f	f	\N
225	2021-08-06	0.00	0.00	0.00	0.00	listo	2	f	f	\N
226	2021-08-07	0.00	0.00	0.00	0.00	listo	2	f	f	\N
227	2021-08-08	0.00	0.00	0.00	0.00	listo	2	f	f	\N
235	2021-08-09	0.00	0.00	0.00	0.00	done	2	f	f	\N
236	2021-08-10	0.00	0.00	0.00	0.00	envio tarde	2	f	f	\N
237	2021-08-11	0.00	0.00	0.00	0.00	envio tarde	2	f	f	\N
238	2021-08-12	0.00	0.00	0.00	0.00	done	2	f	f	\N
239	2021-08-13	0.00	0.00	0.00	0.00	done	2	f	f	\N
240	2021-08-14	0.00	0.00	0.00	0.00	done	2	f	f	\N
241	2021-08-15	0.00	0.00	0.00	0.00	done	2	f	f	\N
242	2021-08-16	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
243	2021-08-17	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
249	2021-08-16	0.00	0.00	0.00	0.00	done	2	f	f	\N
250	2021-08-17	0.00	0.00	0.00	0.00	done	2	f	f	\N
251	2021-08-18	0.00	0.00	0.00	0.00	done	2	f	f	\N
252	2021-08-19	0.00	0.00	0.00	0.00	done	2	f	f	\N
253	2021-08-20	0.00	0.00	0.00	0.00	envio tarde	2	f	f	\N
254	2021-08-21	0.00	0.00	0.00	0.00	envio tarde	2	f	f	\N
255	2021-08-22	0.00	0.00	0.00	0.00	sin facturas de gastos	2	f	f	\N
257	2021-08-24	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
261	2021-08-28	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
262	2021-08-29	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
263	2021-08-23	0.00	0.00	0.00	0.00	done	2	f	f	\N
264	2021-08-24	0.00	0.00	0.00	0.00	no enviado	2	f	f	\N
265	2021-08-25	0.00	0.00	0.00	0.00	done	2	f	f	\N
266	2021-08-26	0.00	0.00	0.00	0.00	done	2	f	f	\N
267	2021-08-27	0.00	0.00	0.00	0.00	done	2	f	f	\N
268	2021-08-28	0.00	0.00	0.00	0.00	done	2	f	f	\N
269	2021-08-29	0.00	0.00	0.00	0.00	done	2	f	f	\N
271	2021-08-31	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
273	2021-09-02	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
274	2021-09-03	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
276	2021-09-05	0.00	0.00	0.00	0.00	no enviado	1	f	f	\N
277	2021-08-30	0.00	0.00	0.00	0.00	done	2	f	f	\N
278	2021-08-31	0.00	0.00	0.00	0.00	done	2	f	f	\N
279	2021-09-01	0.00	0.00	0.00	0.00	done	2	f	f	\N
280	2021-09-02	0.00	0.00	0.00	0.00	done	2	f	f	\N
281	2021-09-03	0.00	0.00	0.00	0.00	done	2	f	f	\N
282	2021-09-04	0.00	0.00	0.00	0.00	done	2	f	f	\N
283	2021-09-05	0.00	0.00	0.00	0.00	no enviado	2	f	f	\N
291	2021-09-06	0.00	0.00	0.00	0.00	done	2	f	f	\N
292	2021-09-07	0.00	0.00	0.00	0.00	done	2	f	f	\N
293	2021-09-08	0.00	0.00	0.00	2000.00	done	2	f	f	\N
294	2021-09-09	0.00	0.00	0.00	0.00	done	2	f	f	\N
295	2021-09-10	0.00	0.00	0.00	0.00	done	2	f	f	\N
296	2021-09-11	0.00	0.00	0.00	0.00	done	2	f	f	\N
297	2021-09-12	0.00	0.00	0.00	0.00	done	2	f	f	\N
305	2021-09-13	0.00	0.00	0.00	0.00	done	2	f	f	\N
306	2021-09-14	0.00	0.00	0.00	0.00	done	2	f	f	\N
307	2021-09-15	0.00	0.00	0.00	0.00	no enviado	2	f	f	\N
308	2021-09-16	0.00	0.00	0.00	0.00	no enviado	2	f	f	\N
309	2021-09-17	0.00	0.00	0.00	2000.00	done	2	f	f	\N
310	2021-09-18	0.00	0.00	0.00	0.00	done	2	f	f	\N
311	2021-09-19	0.00	0.00	0.00	0.00	done	2	f	f	\N
319	2021-09-20	0.00	0.00	0.00	0.00	done	2	f	f	\N
320	2021-09-21	0.00	0.00	0.00	0.00	done	2	f	f	\N
321	2021-09-22	0.00	0.00	0.00	0.00	done	2	f	f	\N
322	2021-09-23	0.00	0.00	0.00	0.00	done	2	f	f	\N
323	2021-09-24	0.00	0.00	0.00	0.00	done	2	f	f	\N
325	2021-09-26	0.00	0.00	0.00	0.00	done	2	f	f	\N
244	2021-08-18	16.88	0.00	165.16	0.00		1	f	f	\N
58	2021-05-16	19.22	0.00	0.00	-15.00	Esto lo saqué del weekly de Luis porque no enviaron el daily	1	f	f	\N
66	2021-05-20	29.68	0.00	176.58	0.00		1	f	f	\N
29	2021-04-30	30.65	0.00	421.38	0.00		2	f	f	\N
31	2021-05-02	46.90	0.00	173.44	0.00		2	f	f	\N
50	2021-05-12	67.17	0.00	129.01	0.00		1	f	f	\N
187	2021-07-20	69.60	0.00	220.70	0.00		1	f	f	\N
80	2021-05-27	75.97	0.00	41.15	0.00		1	f	f	\N
117	2021-06-15	88.22	0.00	120.17	0.00		1	f	f	\N
147	2021-07-01	91.63	32.77	176.19	0.00		1	f	f	\N
119	2021-06-17	93.47	0.00	144.50	0.00		1	f	f	\N
86	2021-05-30	93.67	0.00	208.76	0.00		1	f	f	\N
64	2021-05-19	95.55	0.00	204.02	0.00		1	f	f	\N
217	2021-08-05	103.71	0.00	173.76	0.00	envio tarde	1	f	f	\N
312	2021-09-20	111.63	0.00	60.58	0.00	done	1	f	f	\N
46	2021-05-10	123.57	0.00	189.00	-200.00		1	f	f	\N
161	2021-07-08	126.83	0.00	209.37	-300.00	pico saco plata	1	f	f	\N
131	2021-06-22	128.69	0.00	99.23	0.00		1	f	f	\N
234	2021-08-15	129.21	0.00	139.23	0.00	envio tarde	1	f	f	\N
104	2021-06-09	132.05	0.00	160.92	0.00		1	f	f	\N
175	2021-07-15	133.14	0.00	168.17	0.00		1	f	f	\N
149	2021-07-03	134.97	0.00	150.66	0.00		1	f	f	\N
245	2021-08-19	139.00	0.00	166.21	0.00		1	f	f	\N
275	2021-09-04	141.82	0.00	180.03	0.00	done	1	f	f	\N
22	2021-04-26	143.94	0.00	97.26	0.00		1	f	f	\N
136	2021-06-27	144.90	0.00	232.43	0.00		1	f	f	\N
33	2021-05-03	145.68	0.00	104.68	-500.00		1	f	f	\N
17	2021-04-21	146.44	0.00	109.31	0.00		1	f	f	\N
173	2021-07-13	148.11	0.00	101.53	0.00		1	f	f	\N
200	2021-07-26	151.33	0.00	149.39	0.00		1	f	f	\N
48	2021-05-11	152.17	35.14	136.11	0.00		1	f	f	\N
164	2021-07-11	155.38	12.81	188.33	0.00	si	1	f	f	\N
19	2021-04-23	159.02	0.00	246.70	0.00		1	f	f	\N
14	2021-04-18	159.75	0.00	189.82	0.00		1	f	f	\N
15	2021-04-19	160.41	0.00	26.04	0.00		1	f	f	\N
299	2021-09-14	163.13	0.00	58.89	0.00	done	1	f	f	\N
93	2021-06-05	163.70	46.31	256.89	0.00		1	f	f	\N
190	2021-07-23	163.82	0.00	322.14	0.00		1	f	f	\N
216	2021-08-04	164.30	0.00	140.92	0.00	envio tarde	1	f	f	\N
18	2021-04-22	166.76	0.00	172.37	0.00		1	f	f	\N
1	2021-04-05	168.66	0.00	91.00	0.00		1	f	f	\N
228	2021-08-09	170.46	0.00	119.86	0.00	envio tarde	1	f	f	\N
259	2021-08-26	173.45	0.00	187.80	0.00	done	1	f	f	\N
102	2021-06-07	178.35	0.00	90.22	0.00		1	f	f	\N
70	2021-05-22	180.97	47.59	188.40	1500.00	revisar banco	1	f	f	\N
118	2021-06-16	181.16	0.00	157.37	0.00		1	f	f	\N
214	2021-08-02	182.49	3.04	125.72	0.00		1	f	f	\N
270	2021-08-30	184.28	0.00	124.41	0.00	done	1	f	f	\N
78	2021-05-26	184.89	0.00	102.32	0.00		1	f	f	\N
30	2021-05-01	187.88	0.00	387.44	500.00		2	f	f	\N
206	2021-08-01	192.05	0.00	197.59	0.00	envio tarde	1	f	f	\N
162	2021-07-09	192.77	0.00	315.99	-700.00	carlos saco plata	1	f	f	\N
215	2021-08-03	196.25	0.00	105.20	0.00		1	f	f	\N
172	2021-07-12	196.50	0.00	117.77	0.00		1	f	f	\N
203	2021-07-29	196.88	0.00	101.32	0.00		1	f	f	\N
24	2021-04-28	197.35	0.00	112.10	0.00		1	f	f	\N
74	2021-05-24	198.79	0.00	98.00	0.00		1	f	f	\N
178	2021-07-18	201.49	0.00	188.69	0.00		1	f	f	\N
94	2021-06-06	202.20	0.00	149.41	0.00		1	f	f	\N
232	2021-08-13	202.85	0.00	245.32	0.00		1	f	f	\N
303	2021-09-18	203.12	0.00	266.86	0.00	done	1	f	f	\N
233	2021-08-14	210.86	0.00	261.76	0.00		1	f	f	\N
91	2021-06-03	215.69	0.00	226.59	0.00		1	f	f	\N
220	2021-08-08	220.35	0.00	204.48	0.00	envio tarde	1	f	f	\N
90	2021-06-02	220.43	0.00	145.05	0.00		1	f	f	\N
34	2021-05-04	225.12	92.92	508.02	700.00		2	f	f	\N
5	2021-04-09	227.82	0.00	273.17	0.00		1	f	f	\N
219	2021-08-07	229.99	0.00	240.41	0.00		1	f	f	\N
188	2021-07-21	234.14	0.00	151.03	0.00		1	f	f	\N
189	2021-07-22	235.11	0.00	95.83	0.00		1	f	f	\N
62	2021-05-18	236.05	0.00	94.66	-800.00		1	f	f	\N
76	2021-05-25	238.87	0.00	208.06	0.00		1	f	f	\N
130	2021-06-21	239.40	0.00	133.39	0.00		1	f	f	\N
10	2021-04-14	241.32	0.00	89.50	0.00		1	f	f	\N
28	2021-05-02	241.35	363.03	0.00	0.00		1	f	f	\N
205	2021-07-31	242.02	0.00	149.83	0.00	envio tarde	1	f	f	\N
8	2021-04-12	243.41	0.00	143.53	0.00		1	f	f	\N
230	2021-08-11	243.93	0.00	186.26	0.00		1	f	f	\N
288	2021-09-10	246.31	0.00	298.69	0.00	done	1	f	f	\N
133	2021-06-24	247.85	0.00	143.44	0.00		1	f	f	\N
260	2021-08-27	248.47	0.00	220.00	0.00	done	1	f	f	\N
132	2021-06-23	250.26	0.00	116.43	0.00		1	f	f	\N
258	2021-08-25	251.10	0.00	166.00	0.00	done	1	f	f	\N
11	2021-04-15	251.17	74.70	183.23	0.00		1	f	f	\N
248	2021-08-22	251.58	0.00	146.49	0.00	envio tarde	1	f	f	\N
88	2021-05-31	253.02	0.00	175.09	0.00		1	f	f	\N
120	2021-06-18	253.05	39.17	260.59	0.00		1	f	f	\N
105	2021-06-10	254.36	0.00	178.67	0.00		1	f	f	\N
313	2021-09-21	255.22	0.00	133.69	0.00	done	1	f	f	\N
302	2021-09-17	255.83	0.00	379.40	0.00	done	1	f	f	\N
202	2021-07-28	256.07	0.00	269.70	0.00		1	f	f	\N
229	2021-08-10	259.09	0.00	188.97	0.00	envio tarde	1	f	f	\N
32	2021-05-03	262.97	0.00	188.29	300.00		2	f	f	\N
4	2021-04-08	263.48	0.00	199.93	0.00		1	f	f	\N
16	2021-04-20	264.23	0.00	180.45	0.00		1	f	f	\N
301	2021-09-16	264.77	0.00	130.97	0.00	done	1	f	f	\N
287	2021-09-09	267.39	0.00	76.39	0.00	done	1	f	f	\N
176	2021-07-16	268.94	0.00	244.76	0.00		1	f	f	\N
107	2021-06-12	269.57	0.00	170.79	0.00		1	f	f	\N
56	2021-05-15	271.40	0.00	261.47	-100.00		1	f	f	\N
145	2021-06-29	272.23	29.16	274.76	0.00		1	f	f	\N
231	2021-08-12	275.00	0.00	169.35	0.00	done	1	f	f	\N
41	2021-05-07	275.69	28.20	421.51	0.00		1	f	f	\N
186	2021-07-19	277.19	0.00	125.31	0.00		1	f	f	\N
192	2021-07-25	280.34	0.00	275.70	0.00		1	f	f	\N
256	2021-08-23	280.47	0.00	50.96	0.00	envio tarde	1	f	f	\N
314	2021-09-22	286.15	0.00	136.36	0.00	done	1	f	f	\N
89	2021-06-01	288.30	0.00	135.59	0.00		1	f	f	\N
39	2021-05-06	289.85	15.96	107.40	0.00		1	f	f	\N
38	2021-05-06	291.28	0.00	458.12	0.00		2	f	f	\N
272	2021-09-01	292.73	0.00	188.32	0.00	done	1	f	f	\N
60	2021-05-17	295.31	0.00	124.83	230.97	SGC diferencia en orden	1	f	f	\N
26	2021-04-30	297.18	46.52	294.73	0.00		1	f	f	\N
25	2021-04-29	297.23	0.00	187.39	0.00		1	f	f	\N
3	2021-04-07	299.32	0.00	131.24	0.00		1	f	f	\N
2	2021-04-06	302.94	0.00	158.73	0.00		1	f	f	\N
108	2021-06-13	308.85	0.00	150.88	0.00		1	f	f	\N
12	2021-04-16	311.08	0.00	225.58	0.00		1	f	f	\N
146	2021-06-30	311.75	0.00	150.81	0.00		1	f	f	\N
51	2021-05-12	314.95	0.00	600.18	0.00		2	f	f	\N
246	2021-08-20	322.20	0.00	287.35	0.00	envio tarde	1	f	f	\N
35	2021-05-04	325.92	0.00	98.75	0.00		1	f	f	\N
163	2021-07-10	330.27	44.49	273.77	0.00	si	1	f	f	\N
49	2021-05-11	333.17	0.00	357.94	0.00		2	f	f	\N
174	2021-07-14	348.81	0.00	164.30	0.00		1	f	f	\N
23	2021-04-27	359.03	0.00	135.63	0.00		1	f	f	\N
160	2021-07-07	360.52	0.00	77.32	0.00	si	1	f	f	\N
82	2021-05-28	360.72	32.86	319.33	0.00		1	f	f	\N
47	2021-05-10	362.37	0.00	310.07	0.00		2	f	f	\N
13	2021-04-17	371.95	0.00	201.68	0.00		1	f	f	\N
55	2021-05-14	374.31	88.03	1059.38	0.00		2	f	f	\N
135	2021-06-26	376.65	29.83	231.23	0.00		1	f	f	\N
121	2021-06-19	379.50	0.00	239.09	0.00		1	f	f	\N
21	2021-04-25	380.37	64.98	184.45	0.00		1	f	f	\N
103	2021-06-08	382.23	0.00	218.06	0.00		1	f	f	\N
27	2021-05-01	382.35	0.00	228.97	0.00		1	f	f	\N
59	2021-05-16	394.69	19.10	552.14	0.00		2	f	f	\N
218	2021-08-06	400.52	0.00	279.99	0.00		1	f	f	\N
6	2021-04-10	401.43	0.00	209.72	0.00		1	f	f	\N
201	2021-07-27	405.21	53.11	179.65	0.00		1	f	f	\N
53	2021-05-13	412.62	0.00	511.17	0.00		2	f	f	\N
204	2021-07-30	417.43	0.00	226.62	0.00	envio tarde	1	f	f	\N
36	2021-05-05	419.68	0.00	536.35	0.00		1	f	f	\N
148	2021-07-02	426.43	21.76	243.93	0.00		1	f	f	\N
7	2021-04-11	427.31	0.00	200.99	0.00		1	f	f	\N
92	2021-06-04	431.78	53.30	288.73	0.00		1	f	f	\N
177	2021-07-17	432.30	0.00	90.70	0.00		1	f	f	\N
45	2021-05-09	439.36	0.00	856.68	-45.00		2	f	f	\N
42	2021-05-08	471.39	51.26	242.15	0.00		1	f	f	\N
68	2021-05-21	478.52	0.00	270.72	0.00		1	f	f	\N
134	2021-06-25	502.10	0.00	258.03	0.00		1	f	f	\N
9	2021-04-13	505.03	0.00	174.79	0.00		1	f	f	\N
247	2021-08-21	521.75	0.00	193.46	0.00	sin reporte del POS	1	f	f	\N
116	2021-06-14	526.11	0.00	127.78	0.00		1	f	f	\N
54	2021-05-14	536.91	0.00	255.51	0.00		1	f	f	\N
44	2021-05-09	571.91	0.00	265.40	0.00		1	f	f	\N
84	2021-05-29	596.49	33.09	249.12	0.00		1	f	f	\N
37	2021-05-05	599.08	0.00	897.73	0.00		2	f	f	\N
191	2021-07-24	615.73	16.47	206.41	0.00		1	f	f	\N
106	2021-06-11	659.14	0.00	406.16	0.00		1	f	f	\N
52	2021-05-13	667.40	4.77	259.38	-107.41		1	f	f	\N
144	2021-06-28	683.36	0.00	217.09	0.00		1	f	f	\N
57	2021-05-15	739.01	51.85	802.67	0.00		2	f	f	\N
289	2021-09-11	756.35	0.00	271.63	0.00	done	1	f	f	\N
40	2021-05-07	829.46	0.00	782.07	1000.00		2	f	f	\N
20	2021-04-24	984.99	52.40	286.17	0.00		1	f	f	\N
43	2021-05-08	1184.22	104.60	1216.79	0.00		2	f	f	\N
284	2021-09-06	397.12	0.00	174.36	0.00	envio tarde	1	f	f	\N
285	2021-09-07	133.70	0.00	113.11	0.00	tarde - no enviado	1	f	f	\N
286	2021-09-08	114.62	0.00	111.13	0.00	tarde no enviado	1	f	f	\N
290	2021-09-12	219.17	0.00	257.94	0.00	tarde no enviado	1	f	f	\N
298	2021-09-13	191.81	0.00	66.44	0.00	tarde no enviado	1	f	f	\N
300	2021-09-15	658.58	0.00	168.00	0.00	tarde no enviado	1	f	f	\N
333	2021-10-01	0.00	0.00	0.00	1000.00	sent	2	f	f	\N
304	2021-09-19	374.57	0.00	174.47	0.00	tarde no enviado	1	f	f	\N
318	2021-09-26	193.65	0.00	171.89	0.00	tarde no enviado	1	f	f	\N
316	2021-09-24	308.74	0.00	269.38	0.00	tarde no enviado	1	f	f	\N
315	2021-09-23	301.93	0.00	108.65	0.00	tarde no enviado	1	f	f	\N
317	2021-09-25	451.72	0.00	268.61	0.00	tarde no enviado	1	f	f	\N
324	2021-09-25	0.00	0.00	0.00	-100.00	tarde, 100 dolares saco Carlos.	2	f	f	\N
327	2021-09-27	0.00	0.00	0.00	0.00	sent	2	f	f	\N
328	2021-09-27	322.65	0.00	180.34	0.00		1	f	f	\N
329	2021-09-28	0.00	0.00	0.00	0.00	sent	2	f	f	\N
330	2021-09-28	54.37	0.00	112.39	0.00		1	f	f	\N
331	2021-09-29	248.34	0.00	75.13	0.00		1	f	f	\N
332	2021-09-29	0.00	0.00	0.00	0.00	sent	2	f	f	\N
334	2021-10-02	505.02	0.00	360.60	0.00		1	f	f	\N
335	2021-10-02	0.00	0.00	0.00	0.00	sent	2	f	f	\N
336	2021-10-03	225.07	0.00	247.00	0.00		1	f	f	\N
337	2021-10-04	0.00	0.00	0.00	0.00	sent	2	f	f	\N
338	2021-10-05	282.44	0.00	127.95	0.00		1	f	f	\N
339	2021-10-05	0.00	0.00	0.00	0.00	sent	2	f	f	\N
340	2021-10-06	301.17	0.00	100.05	0.00		1	f	f	\N
341	2021-10-08	106.16	0.00	147.75	0.00		1	f	f	\N
342	2021-10-10	76.74	0.00	194.55	0.00		1	f	f	\N
343	2021-10-07	0.00	0.00	0.00	0.00	sent	2	f	f	\N
344	2021-10-08	0.00	0.00	0.00	0.00	sent	2	f	f	\N
345	2021-10-09	0.00	0.00	0.00	0.00	sent	2	f	f	\N
346	2021-10-10	0.00	0.00	0.00	0.00	sent	2	f	f	\N
347	2021-10-11	440.62	0.00	117.29	0.00		1	f	f	\N
348	2021-10-12	172.55	0.00	121.21	0.00		1	f	f	\N
349	2021-10-13	164.82	0.00	168.79	0.00		1	f	f	\N
350	2021-10-14	164.60	0.00	208.64	0.00		1	f	f	\N
351	2021-10-15	196.23	0.00	248.91	0.00		1	f	f	\N
352	2021-10-16	391.54	0.00	164.31	0.00		1	f	f	\N
353	2021-10-17	195.20	0.00	253.71	0.00		1	f	f	\N
354	2021-09-30	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
355	2021-10-03	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
357	2021-09-30	0.00	0.00	0.00	0.00	not sent	1	f	f	\N
358	2021-10-01	0.00	0.00	0.00	0.00	not sent	1	f	f	\N
359	2021-10-11	0.00	0.00	0.00	0.00	blurry picture	2	f	f	\N
360	2021-10-12	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
362	2021-10-14	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
364	2021-10-16	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
361	2021-10-13	0.00	0.00	0.00	0.00	sent	2	f	f	\N
363	2021-10-15	0.00	0.00	0.00	0.00	sent	2	f	f	\N
365	2021-10-17	0.00	0.00	0.00	0.00	sent	2	f	f	\N
368	2021-10-19	0.00	0.00	0.00	0.00	blurry	2	f	f	\N
372	2021-10-21	0.00	0.00	0.00	0.00	not sent	1	f	f	\N
373	2021-10-21	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
375	2021-10-22	0.00	0.00	0.00	0.00	not sent	1	f	f	\N
377	2021-10-23	0.00	0.00	0.00	0.00	not sent	1	f	f	\N
379	2021-10-24	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
356	2021-10-06	0.00	0.00	0.00	0.00	late	2	f	f	\N
385	2021-10-27	0.00	0.00	0.00	0.00	not sent	1	f	f	\N
399	2021-11-02	240.43	0.00	140.60	0.00	-	1	t	t	\N
367	2021-10-18	427.57	0.00	167.66	0.00		1	t	t	\N
366	2021-10-18	0.00	0.00	0.00	0.00	Blurry but checked	2	t	t	\N
369	2021-10-19	0.00	0.00	93.00	0.00		1	t	t	\N
370	2021-10-20	196.75	0.00	152.13	0.00		1	t	t	\N
371	2021-10-20	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
374	2021-10-22	0.00	0.00	0.00	0.00	sent	2	t	t	\N
376	2021-10-23	0.00	0.00	0.00	0.00	sent	2	t	t	\N
378	2021-10-24	140.15	0.00	305.28	0.00		1	t	t	\N
381	2021-10-25	0.00	0.00	0.00	0.00	sent	2	t	t	\N
382	2021-10-25	330.31	0.00	128.93	0.00		1	t	t	\N
383	2021-10-26	47.82	0.00	115.82	0.00	sent	1	t	t	\N
384	2021-10-26	0.00	0.00	0.00	0.00	sent	2	t	t	\N
389	2021-10-28	157.45	0.00	206.78	0.00		1	t	t	\N
390	2021-10-28	0.00	0.00	0.00	0.00		2	t	t	\N
391	2021-10-29	280.00	0.00	218.02	0.00		1	t	t	\N
392	2021-10-29	0.00	0.00	0.00	0.00		2	t	t	\N
393	2021-10-30	386.37	0.00	249.57	0.00		1	t	t	\N
394	2021-10-30	0.00	0.00	0.00	0.00		2	t	t	\N
395	2021-10-31	43.52	0.00	140.64	0.00		1	t	t	\N
396	2021-10-31	0.00	0.00	0.00	0.00		2	t	t	\N
400	2021-11-02	0.00	0.00	0.00	0.00	-	2	f	f	\N
402	2021-11-03	0.00	0.00	0.00	0.00	-	2	f	f	\N
404	2021-11-04	0.00	0.00	0.00	0.00	-	2	f	f	\N
406	2021-11-05	0.00	0.00	0.00	0.00	-	2	f	f	\N
408	2021-11-06	0.00	0.00	0.00	0.00	-	2	f	f	\N
410	2021-11-07	0.00	0.00	0.00	0.00	-	2	f	f	\N
386	2021-10-27	0.00	0.00	0.00	0.00	not sent	2	f	f	\N
409	2021-11-07	132.37	0.00	172.64	0.00	-	1	t	t	\N
397	2021-11-01	286.05	5.95	112.24	0.00	-	1	t	t	\N
403	2021-11-04	303.40	0.00	130.40	0.00	-	1	t	t	\N
407	2021-11-06	280.62	0.00	193.41	0.00	-	1	t	t	\N
405	2021-11-05	286.47	0.00	247.76	0.00	-	1	t	t	\N
401	2021-11-03	208.96	0.00	102.00	0.00	-	1	t	t	\N
398	2021-11-01	0.00	0.00	0.00	0.00	-	2	t	t	\N
411	2021-11-08	253.25	0.00	105.72	0.00	new entry	1	t	t	\N
413	2021-11-10	117.68	0.00	0.00	0.00	Falta info	1	f	t	\N
412	2021-11-09	187.19	0.00	133.18	0.00	new entry	1	t	t	\N
414	2021-11-11	63.31	0.00	123.07	0.00	new entry	1	t	t	\N
416	2021-11-13	212.38	0.00	267.83	0.00	new entry	1	t	t	\N
418	2021-11-08	0.00	0.00	0.00	0.00		2	t	t	\N
415	2021-11-12	155.78	0.00	295.65	0.00	new entry	1	t	t	\N
419	2021-11-09	0.00	0.00	0.00	0.00	new entry	2	f	f	\N
417	2021-11-14	68.72	0.00	198.94	0.00	new entry	1	t	t	\N
420	2021-11-10	0.00	0.00	0.00	0.00	new entry	2	f	f	\N
421	2021-11-11	0.00	0.00	0.00	0.00	new entry	2	f	f	\N
422	2021-11-12	0.00	0.00	0.00	0.00	new entry	2	f	f	\N
423	2021-11-13	0.00	0.00	0.00	0.00	new entry	2	f	f	\N
424	2021-11-14	0.00	0.00	0.00	0.00	new entry	2	t	t	\N
428	2021-11-18	55.11	0.00	148.36	0.00		1	t	t	\N
433	2021-11-16	0.00	0.00	0.00	0.00		2	f	f	\N
436	2021-11-19	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
429	2021-11-19	248.71	0.00	258.40	0.00		1	t	t	\N
430	2021-11-20	385.90	0.00	247.52	0.00		1	t	t	\N
434	2021-11-17	0.00	0.00	0.00	0.00		2	f	f	\N
425	2021-11-15	97.47	0.00	125.47	0.00		1	t	t	\N
426	2021-11-16	132.20	0.00	49.00	0.00		1	t	t	\N
444	2021-11-27	0.00	0.00	0.00	0.00		1	f	f	\N
457	2021-12-03	331.72	0.00	202.12	0.00		1	t	t	\N
488	2021-12-13	0.00	0.00	0.00	0.00	late	2	t	t	\N
445	2021-11-28	192.67	0.00	152.32	0.00		1	t	t	\N
480	2021-12-12	0.00	0.00	0.00	0.00		1	f	f	\N
458	2021-12-04	166.40	0.00	156.00	0.00		1	t	t	\N
462	2021-12-01	0.00	0.00	0.00	0.00		2	f	f	\N
460	2021-11-29	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
474	2021-12-06	371.53	0.00	113.39	0.00		1	t	t	\N
468	2021-12-07	0.00	0.00	0.00	0.00	Late	2	t	t	\N
464	2021-12-03	0.00	0.00	0.00	0.00		2	t	t	\N
459	2021-12-05	127.96	0.00	220.43	0.00		1	t	t	\N
507	2021-12-25	0.00	0.00	0.00	0.00	rest closed	2	t	f	17
475	2021-12-07	122.72	0.00	100.40	0.00		1	t	t	\N
505	2021-12-23	0.00	0.00	0.00	0.00	late	2	t	t	17
502	2021-12-20	0.00	0.00	0.00	0.00	late	2	t	t	17
469	2021-12-08	0.00	0.00	0.00	0.00	Late	2	t	t	\N
448	2021-11-24	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
446	2021-11-22	0.00	0.00	0.00	0.00		2	f	f	\N
476	2021-12-08	500.00	0.00	81.36	0.00		1	t	t	\N
481	2021-12-13	234.73	0.00	101.13	0.00		1	t	t	\N
504	2021-12-22	0.00	0.00	0.00	0.00	late	2	t	t	17
439	2021-11-22	341.72	0.00	135.66	0.00		1	t	t	\N
450	2021-11-26	0.00	0.00	0.00	0.00	LATE	2	t	t	\N
503	2021-12-21	0.00	0.00	0.00	0.00		2	t	t	\N
453	2021-11-29	363.30	0.00	171.68	0.00		1	t	t	\N
470	2021-12-09	0.00	0.00	0.00	0.00	Late	2	t	t	\N
492	2021-12-17	0.00	0.00	0.00	0.00		2	t	t	\N
440	2021-11-23	247.57	0.00	93.54	0.00		1	t	t	\N
477	2021-12-09	29.39	0.00	94.83	0.00		1	t	t	\N
485	2021-12-17	95.63	0.00	118.26	0.00		1	t	t	\N
427	2021-11-17	145.62	0.00	79.76	0.00	late	1	t	t	\N
452	2021-11-28	0.00	0.00	0.00	0.00		2	t	t	\N
435	2021-11-18	0.00	0.00	0.00	0.00		2	t	t	\N
501	2021-12-26	0.00	0.00	0.00	0.00		1	f	f	\N
454	2021-11-30	67.96	0.00	60.64	0.00		1	t	t	\N
441	2021-11-24	43.22	0.00	134.67	0.00		1	t	t	\N
438	2021-11-21	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
431	2021-11-21	140.02	0.00	120.02	0.00		1	t	t	\N
471	2021-12-10	0.00	0.00	0.00	0.00		2	t	t	\N
513	2021-12-27	0.00	0.00	0.00	0.00		2	f	f	\N
442	2021-11-25	0.00	0.00	0.00	0.00	THANKSGIVING	1	t	t	\N
443	2021-11-26	499.50	0.00	147.15	0.00		1	t	t	\N
465	2021-12-04	0.00	0.00	0.00	0.00		2	t	t	\N
478	2021-12-10	180.97	0.00	218.59	0.00		1	t	t	\N
499	2021-12-24	0.00	0.00	0.00	0.00		1	f	f	\N
482	2021-12-14	178.95	0.00	102.67	0.00		1	t	t	\N
455	2021-12-01	79.48	0.00	179.26	0.00		1	t	t	\N
514	2021-12-28	0.00	0.00	0.00	0.00		2	f	f	\N
486	2021-12-18	144.34	0.00	194.98	0.00		1	t	t	\N
472	2021-12-11	0.00	0.00	0.00	0.00	Late	2	t	t	\N
495	2021-12-20	365.06	0.00	123.24	0.00		1	t	t	\N
479	2021-12-11	220.91	0.00	280.92	0.00		1	t	t	\N
493	2021-12-18	0.00	0.00	0.00	0.00		2	t	t	\N
497	2021-12-22	45.18	0.00	175.20	0.00		1	t	t	\N
456	2021-12-02	190.25	0.00	85.74	0.00	 	1	t	t	\N
463	2021-12-02	0.00	0.00	0.00	0.00		2	t	t	\N
447	2021-11-23	0.00	0.00	0.00	0.00		2	f	f	\N
449	2021-11-25	0.00	0.00	0.00	0.00	THANKSGIVING	2	t	t	\N
473	2021-12-12	0.00	0.00	0.00	0.00	Late	2	t	t	\N
487	2021-12-19	0.00	0.00	0.00	0.00		1	f	f	\N
490	2021-12-15	0.00	0.00	0.00	0.00	late	2	t	t	\N
500	2021-12-25	0.00	0.00	0.00	0.00		1	f	f	\N
483	2021-12-15	132.41	0.00	102.69	0.00		1	t	t	\N
494	2021-12-19	0.00	0.00	0.00	0.00		2	t	t	\N
491	2021-12-16	0.00	0.00	0.00	0.00	late	2	t	t	\N
484	2021-12-16	140.94	0.00	107.56	0.00		1	t	t	\N
523	2022-01-13	0.00	0.00	0.00	0.00		2	t	t	\N
496	2021-12-21	175.40	0.00	193.28	0.00		1	t	t	\N
525	2022-01-15	0.00	0.00	0.00	0.00		2	t	t	\N
498	2021-12-23	0.00	0.00	0.00	0.00		1	f	f	\N
515	2021-12-29	0.00	0.00	0.00	0.00		2	f	f	\N
506	2021-12-24	0.00	0.00	0.00	0.00		2	t	t	\N
432	2021-11-15	0.00	0.00	0.00	0.00		2	t	t	\N
508	2021-12-26	0.00	0.00	0.00	0.00		2	t	t	\N
451	2021-11-27	0.00	0.00	0.00	0.00		2	t	t	\N
461	2021-11-30	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
437	2021-11-20	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
516	2021-12-30	0.00	0.00	0.00	0.00		2	f	f	\N
517	2021-12-31	0.00	0.00	0.00	0.00		2	f	f	\N
466	2021-12-05	0.00	0.00	0.00	0.00		2	f	f	\N
518	2022-01-01	0.00	0.00	0.00	0.00		2	f	f	\N
519	2022-01-02	0.00	0.00	0.00	0.00		2	f	f	\N
526	2022-01-16	0.00	0.00	0.00	0.00		2	t	t	\N
524	2022-01-14	0.00	0.00	0.00	400.00		2	t	t	\N
527	2022-01-03	0.00	0.00	0.00	0.00		2	t	t	\N
520	2022-01-10	0.00	0.00	0.00	0.00		2	t	t	\N
521	2022-01-11	0.00	0.00	0.00	0.00		2	t	t	\N
522	2022-01-12	0.00	0.00	0.00	0.00	late	2	t	t	\N
528	2022-01-04	0.00	0.00	0.00	0.00		2	t	t	\N
530	2022-01-06	0.00	0.00	0.00	0.00		2	t	t	\N
532	2022-01-08	0.00	0.00	0.00	0.00		2	t	t	\N
533	2022-01-09	0.00	0.00	0.00	0.00		2	t	t	\N
467	2021-12-06	0.00	0.00	0.00	0.00		2	f	f	\N
617	2022-03-27	0.00	0.00	0.00	0.00		2	t	t	\N
582	2022-02-20	0.00	0.00	0.00	0.00		2	t	t	\N
586	2022-02-24	0.00	0.00	0.00	0.00		2	t	t	\N
573	2022-02-04	0.00	0.00	0.00	0.00		2	t	t	\N
489	2021-12-14	0.00	0.00	0.00	0.00	late	2	t	t	\N
553	2022-01-29	0.00	0.00	0.00	0.00		2	t	t	\N
538	2022-01-21	0.00	0.00	0.00	0.00		2	t	t	\N
539	2022-01-22	0.00	0.00	0.00	0.00		2	t	t	\N
554	2022-01-30	0.00	0.00	0.00	0.00		2	t	t	\N
540	2022-01-23	0.00	0.00	0.00	0.00	late	2	t	t	\N
529	2022-01-05	0.00	0.00	0.00	0.00		2	t	t	\N
531	2022-01-07	0.00	0.00	0.00	0.00		2	t	t	\N
546	2022-02-12	0.00	0.00	0.00	0.00		2	t	t	\N
548	2022-01-24	0.00	0.00	0.00	0.00		2	f	f	\N
577	2022-02-15	0.00	0.00	0.00	0.00		2	t	t	\N
534	2022-01-17	0.00	0.00	0.00	0.00		2	t	t	\N
587	2022-02-25	0.00	0.00	0.00	-650.00	Kike saco plata segun el reporte	2	t	t	\N
574	2022-02-05	0.00	0.00	0.00	0.00		2	t	t	\N
549	2022-01-25	0.00	0.00	0.00	0.00		2	t	t	\N
607	2022-03-17	0.00	0.00	0.00	0.00		2	t	t	\N
547	2022-02-13	0.00	0.00	0.00	0.00		2	t	t	\N
535	2022-01-18	0.00	0.00	0.00	0.00		2	t	t	\N
550	2022-01-26	0.00	0.00	0.00	0.00		2	t	t	\N
536	2022-01-19	0.00	0.00	0.00	0.00	late	2	t	t	\N
575	2022-02-06	0.00	0.00	0.00	0.00	Late	2	t	t	\N
569	2022-01-31	0.00	0.00	0.00	-10.00		2	t	t	\N
551	2022-01-27	0.00	0.00	0.00	0.00		2	t	t	\N
537	2022-01-20	0.00	0.00	0.00	0.00		2	t	t	\N
601	2022-03-11	0.00	0.00	0.00	0.00		2	t	t	\N
552	2022-01-28	0.00	0.00	0.00	0.00		2	t	t	\N
541	2022-02-07	0.00	0.00	0.00	0.00		2	t	t	\N
570	2022-02-01	0.00	0.00	0.00	500.00	En el reporte del restaurant solo hay 500 dolares aca.. hable con kike, tomo 500 de ahi	2	t	t	\N
594	2022-03-04	0.00	0.00	0.00	0.00		2	f	f	\N
613	2022-03-23	0.00	0.00	0.00	0.00		2	t	t	\N
578	2022-02-16	0.00	0.00	0.00	0.00		2	t	t	\N
616	2022-03-26	0.00	0.00	0.00	0.00		2	f	f	\N
588	2022-02-26	0.00	0.00	0.00	0.00		2	t	t	\N
542	2022-02-08	0.00	0.00	0.00	0.00		2	t	t	\N
571	2022-02-02	0.00	0.00	0.00	0.00		2	t	t	\N
590	2022-02-28	0.00	0.00	0.00	0.00		2	t	t	\N
598	2022-03-08	0.00	0.00	0.00	0.00		2	t	t	\N
583	2022-02-21	0.00	0.00	0.00	0.00		2	t	t	\N
608	2022-03-18	0.00	0.00	0.00	1000.00		2	t	t	\N
612	2022-03-22	0.00	0.00	0.00	0.00		2	t	t	\N
595	2022-03-05	0.00	0.00	0.00	0.00		2	f	f	\N
543	2022-02-09	0.00	0.00	0.00	1000.00		2	t	t	\N
572	2022-02-03	0.00	0.00	0.00	0.00	Closed due to weather conditions	2	t	t	\N
579	2022-02-17	0.00	0.00	0.00	0.00	late	2	t	t	\N
602	2022-03-12	0.00	0.00	0.00	0.00		2	f	f	\N
589	2022-02-27	0.00	0.00	0.00	0.00		2	t	t	\N
584	2022-02-22	0.00	0.00	0.00	0.00		2	t	t	\N
591	2022-03-01	0.00	0.00	0.00	0.00		2	t	t	\N
544	2022-02-10	0.00	0.00	0.00	0.00		2	t	t	\N
609	2022-03-19	0.00	0.00	0.00	0.00		2	t	t	\N
599	2022-03-09	0.00	0.00	0.00	0.00		2	t	t	\N
611	2022-03-21	0.00	0.00	0.00	0.00		2	t	t	\N
580	2022-02-18	0.00	0.00	0.00	0.00		2	f	f	\N
585	2022-02-23	0.00	0.00	0.00	0.00		2	f	f	\N
596	2022-03-06	0.00	0.00	0.00	0.00		2	t	t	\N
545	2022-02-11	0.00	0.00	0.00	0.00		2	t	t	\N
592	2022-03-02	0.00	0.00	0.00	0.00		2	t	t	\N
581	2022-02-19	0.00	0.00	0.00	0.00		2	f	f	\N
593	2022-03-03	0.00	0.00	0.00	0.00		2	t	t	\N
605	2022-03-15	0.00	0.00	0.00	0.00		2	t	t	\N
576	2022-02-14	0.00	0.00	0.00	1000.00		2	t	t	\N
615	2022-03-25	0.00	0.00	0.00	0.00		2	f	f	\N
603	2022-03-13	0.00	0.00	0.00	0.00		2	t	t	\N
600	2022-03-10	0.00	0.00	0.00	0.00		2	t	t	\N
597	2022-03-07	0.00	0.00	0.00	0.00		2	f	f	\N
610	2022-03-20	0.00	0.00	0.00	0.00		2	f	f	\N
614	2022-03-24	0.00	0.00	0.00	0.00		2	f	f	\N
620	2022-03-30	0.00	0.00	0.00	0.00		2	t	t	\N
619	2022-03-29	0.00	0.00	0.00	0.00		2	f	f	\N
618	2022-03-28	0.00	0.00	0.00	0.00		2	t	t	\N
622	2022-04-01	0.00	0.00	0.00	0.00		2	t	t	\N
624	2022-04-03	0.00	0.00	0.00	0.00		2	t	t	\N
621	2022-03-31	0.00	0.00	0.00	0.00		2	f	f	\N
604	2022-03-14	0.00	0.00	0.00	0.00		2	f	f	\N
623	2022-04-02	0.00	0.00	0.00	0.00		2	t	t	\N
606	2022-03-16	0.00	0.00	0.00	1000.00	modification verified with weekly report, daily not sent	2	f	f	\N
670	2022-04-23	0.00	0.00	0.00	0.00		2	t	t	\N
694	2022-05-17	0.00	0.00	0.00	0.00	late	2	t	t	\N
682	2022-05-05	0.00	0.00	0.00	1000.00	cash de kike	2	f	f	\N
723	2022-06-15	0.00	0.00	0.00	0.00		2	t	t	\N
688	2022-05-11	0.00	0.00	0.00	0.00	late	2	t	t	\N
628	2022-04-07	0.00	0.00	0.00	0.00		2	t	t	\N
704	2022-05-27	0.00	0.00	0.00	0.00	late	2	t	t	\N
635	2022-04-14	0.00	0.00	0.00	0.00		2	t	t	\N
696	2022-05-19	0.00	0.00	0.00	0.00		2	t	t	\N
699	2022-05-22	0.00	0.00	0.00	0.00		2	f	f	\N
671	2022-04-24	0.00	0.00	0.00	0.00		2	t	t	\N
695	2022-05-18	0.00	0.00	0.00	0.00		2	t	t	\N
629	2022-04-08	0.00	0.00	0.00	0.00	late	2	t	t	\N
683	2022-05-06	0.00	0.00	0.00	1000.00	cash withdrawal	2	t	t	\N
636	2022-04-15	0.00	0.00	0.00	0.00		2	t	t	\N
689	2022-05-12	0.00	0.00	0.00	0.00		2	t	t	\N
672	2022-04-25	0.00	0.00	0.00	0.00		2	t	t	\N
630	2022-04-09	0.00	0.00	0.00	0.00	couldn't understand the expenses	2	f	t	\N
637	2022-04-16	0.00	0.00	0.00	0.00		2	t	t	\N
697	2022-05-20	0.00	0.00	0.00	0.00		2	t	t	\N
724	2022-06-16	0.00	0.00	0.00	0.00	late	2	t	t	\N
698	2022-05-21	0.00	0.00	0.00	0.00	late	2	t	t	\N
673	2022-04-26	0.00	0.00	0.00	0.00		2	f	f	\N
684	2022-05-07	0.00	0.00	0.00	1000.00	cash withdrawal	2	t	t	\N
690	2022-05-13	0.00	0.00	0.00	0.00		2	t	t	\N
631	2022-04-10	0.00	0.00	0.00	0.00		2	t	t	\N
632	2022-04-11	0.00	0.00	0.00	0.00	late	2	t	t	\N
715	2022-06-07	0.00	0.00	0.00	0.00		2	t	t	\N
716	2022-06-08	0.00	0.00	0.00	1000.00		2	t	t	\N
665	2022-04-18	0.00	0.00	0.00	0.00		2	f	f	\N
705	2022-05-28	0.00	0.00	0.00	0.00		2	t	t	\N
633	2022-04-12	0.00	0.00	0.00	0.00		2	t	t	\N
674	2022-04-27	0.00	0.00	0.00	0.00		2	f	f	\N
708	2022-05-31	0.00	0.00	0.00	0.00		2	t	t	\N
730	2022-06-22	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
638	2022-04-17	0.00	0.00	0.00	0.00	closed for easter	2	t	t	\N
701	2022-05-24	0.00	0.00	0.00	0.00		2	t	t	\N
691	2022-05-14	0.00	0.00	0.00	0.00		2	t	t	\N
625	2022-04-04	0.00	0.00	0.00	0.00		2	t	t	\N
685	2022-05-08	0.00	0.00	0.00	0.00		2	t	t	\N
679	2022-05-02	0.00	0.00	0.00	0.00		2	t	t	\N
666	2022-04-19	0.00	0.00	0.00	0.00	late	2	t	t	\N
711	2022-06-03	0.00	0.00	0.00	0.00	late	2	t	t	\N
675	2022-04-28	0.00	0.00	0.00	0.00		2	t	t	\N
626	2022-04-05	0.00	0.00	0.00	1800.00	tarde	2	t	t	\N
667	2022-04-20	0.00	0.00	0.00	0.00		2	f	f	\N
733	2022-06-25	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
692	2022-05-15	0.00	0.00	0.00	0.00		2	t	t	\N
686	2022-05-09	0.00	0.00	0.00	0.00		2	t	t	\N
680	2022-05-03	0.00	0.00	0.00	0.00		2	t	t	\N
676	2022-04-29	0.00	0.00	0.00	-60.00		2	t	t	\N
634	2022-04-13	0.00	0.00	0.00	0.00	late	2	t	t	\N
668	2022-04-21	0.00	0.00	0.00	0.00		2	f	t	\N
627	2022-04-06	0.00	0.00	0.00	0.00		2	t	t	\N
706	2022-05-29	0.00	0.00	0.00	0.00		2	t	t	\N
677	2022-04-30	0.00	0.00	0.00	0.00		2	t	t	\N
669	2022-04-22	0.00	0.00	0.00	-50.00		2	t	t	\N
678	2022-05-01	0.00	0.00	0.00	0.00		2	f	f	\N
687	2022-05-10	0.00	0.00	0.00	0.00		2	t	t	\N
681	2022-05-04	0.00	0.00	0.00	0.00		2	t	t	\N
702	2022-05-25	0.00	0.00	0.00	0.00		2	t	t	\N
709	2022-06-01	0.00	0.00	0.00	0.00		2	t	t	\N
712	2022-06-04	0.00	0.00	0.00	0.00		2	t	t	\N
729	2022-06-21	0.00	0.00	0.00	0.00		2	t	t	\N
720	2022-06-12	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
707	2022-05-30	0.00	0.00	0.00	0.00		2	t	t	\N
703	2022-05-26	0.00	0.00	0.00	0.00	late	2	t	t	\N
721	2022-06-13	0.00	0.00	0.00	0.00		2	t	t	\N
710	2022-06-02	0.00	0.00	0.00	0.00		2	t	t	\N
726	2022-06-18	0.00	0.00	0.00	0.00		2	t	t	\N
713	2022-06-05	0.00	0.00	0.00	0.00		2	t	t	\N
725	2022-06-17	0.00	0.00	0.00	0.00		2	f	f	\N
700	2022-05-23	0.00	0.00	0.00	0.00		2	t	t	\N
727	2022-06-19	0.00	0.00	0.00	0.00		2	t	t	\N
717	2022-06-09	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
719	2022-06-11	0.00	0.00	0.00	0.00		2	t	t	\N
714	2022-06-06	0.00	0.00	0.00	0.00		2	t	t	\N
722	2022-06-14	0.00	0.00	0.00	0.00		2	t	t	\N
732	2022-06-24	0.00	0.00	0.00	0.00		2	t	t	\N
728	2022-06-20	0.00	0.00	0.00	0.00	late	2	t	t	\N
731	2022-06-23	0.00	0.00	0.00	0.00		2	f	f	\N
693	2022-05-16	0.00	0.00	0.00	0.00		2	t	t	\N
734	2022-06-26	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
737	2022-06-29	0.00	0.00	0.00	0.00		2	t	t	\N
739	2022-07-01	0.00	0.00	0.00	1000.00		2	t	t	\N
740	2022-07-02	0.00	0.00	0.00	0.00		2	t	t	\N
741	2022-07-03	0.00	0.00	0.00	-300.00	tarde\r\nponce	2	t	t	\N
718	2022-06-10	0.00	0.00	0.00	1000.00	late	2	t	t	\N
736	2022-06-28	0.00	0.00	0.00	0.00		2	t	t	\N
735	2022-06-27	0.00	0.00	0.00	0.00		2	t	t	\N
738	2022-06-30	0.00	0.00	0.00	0.00		2	t	t	\N
744	2022-07-06	0.00	0.00	0.00	0.00		2	t	t	\N
791	2022-08-22	0.00	0.00	0.00	0.00		2	t	t	\N
769	2022-07-31	0.00	0.00	0.00	0.00		2	t	t	\N
745	2022-07-07	0.00	0.00	0.00	1500.00		2	t	t	\N
761	2022-07-23	0.00	0.00	0.00	0.00		2	t	t	\N
746	2022-07-08	0.00	0.00	0.00	0.00		2	t	t	\N
753	2022-07-15	0.00	0.00	0.00	0.00		2	t	t	\N
747	2022-07-09	0.00	0.00	0.00	0.00		2	t	t	\N
786	2022-08-17	0.00	0.00	0.00	0.00		2	f	f	\N
808	2022-09-08	0.00	0.00	0.00	0.00		2	t	t	\N
762	2022-07-24	0.00	0.00	0.00	0.00		2	t	t	\N
770	2022-08-01	0.00	0.00	0.00	0.00		2	t	t	\N
781	2022-08-12	0.00	0.00	0.00	0.00		2	t	t	\N
784	2022-08-15	0.00	0.00	0.00	0.00		2	t	t	\N
748	2022-07-10	0.00	0.00	0.00	0.00	\r\n	2	t	t	\N
754	2022-07-16	0.00	0.00	0.00	0.00		2	t	t	\N
775	2022-08-06	0.00	0.00	0.00	0.00		2	t	t	\N
796	2022-08-27	0.00	0.00	0.00	0.00		2	t	t	\N
763	2022-07-25	0.00	0.00	0.00	1500.00		2	t	t	\N
789	2022-08-20	0.00	0.00	0.00	0.00		2	t	t	\N
771	2022-08-02	0.00	0.00	0.00	1000.00		2	t	t	\N
755	2022-07-17	0.00	0.00	0.00	0.00		2	t	t	\N
782	2022-08-13	0.00	0.00	0.00	0.00		2	t	t	\N
793	2022-08-24	0.00	0.00	0.00	0.00		2	t	t	\N
764	2022-07-26	0.00	0.00	0.00	0.00		2	t	t	\N
788	2022-08-19	0.00	0.00	0.00	0.00		2	t	t	\N
756	2022-07-18	0.00	0.00	0.00	0.00		2	t	t	\N
783	2022-08-14	0.00	0.00	0.00	0.00		2	t	t	\N
765	2022-07-27	0.00	0.00	0.00	0.00		2	t	t	\N
777	2022-08-08	0.00	0.00	0.00	0.00		2	t	t	\N
742	2022-07-04	0.00	0.00	0.00	0.00	close 4 july	2	t	t	\N
757	2022-07-19	0.00	0.00	0.00	0.00		2	t	t	\N
774	2022-08-05	0.00	0.00	0.00	0.00		2	f	f	\N
766	2022-07-28	0.00	0.00	0.00	0.00		2	t	t	\N
743	2022-07-05	0.00	0.00	0.00	700.00	1000 entran\r\n300 salen (ponce)	2	t	t	\N
749	2022-07-11	0.00	0.00	0.00	0.00		2	t	t	\N
758	2022-07-20	0.00	0.00	0.00	0.00		2	t	t	\N
778	2022-08-09	0.00	0.00	0.00	0.00		2	t	t	\N
816	2022-09-30	0.00	0.00	0.00	1000.00		2	f	f	\N
814	2022-09-28	0.00	0.00	0.00	0.00		2	f	f	\N
803	2022-09-03	0.00	0.00	0.00	0.00		2	t	t	\N
772	2022-08-03	0.00	0.00	0.00	0.00		2	t	t	\N
767	2022-07-29	0.00	0.00	0.00	0.00		2	t	t	\N
813	2022-09-27	0.00	0.00	0.00	0.00		2	f	f	\N
790	2022-08-21	0.00	0.00	0.00	0.00		2	t	t	\N
750	2022-07-12	0.00	0.00	0.00	0.00		2	t	t	\N
817	2022-10-01	0.00	0.00	0.00	0.00		2	t	t	\N
785	2022-08-16	0.00	0.00	0.00	0.00		2	t	t	\N
759	2022-07-21	0.00	0.00	0.00	0.00		2	t	t	\N
779	2022-08-10	0.00	0.00	0.00	0.00		2	t	t	\N
809	2022-09-09	0.00	0.00	0.00	0.00		2	t	t	\N
751	2022-07-13	0.00	0.00	0.00	0.00		2	t	t	\N
768	2022-07-30	0.00	0.00	0.00	0.00		2	t	t	\N
760	2022-07-22	0.00	0.00	0.00	0.00		2	t	t	\N
752	2022-07-14	0.00	0.00	0.00	0.00		2	t	t	\N
792	2022-08-23	0.00	0.00	0.00	0.00		2	t	t	\N
787	2022-08-18	0.00	0.00	0.00	0.00		2	t	t	\N
780	2022-08-11	0.00	0.00	0.00	1000.00		2	t	t	\N
811	2022-09-11	0.00	0.00	0.00	0.00		2	t	t	\N
797	2022-08-28	0.00	0.00	0.00	0.00		2	t	t	\N
794	2022-08-25	0.00	0.00	0.00	1500.00		2	t	t	\N
776	2022-08-07	0.00	0.00	0.00	0.00		2	t	t	\N
826	2022-09-12	0.00	0.00	0.00	0.00		2	t	t	\N
773	2022-08-04	0.00	0.00	0.00	0.00		2	t	t	\N
806	2022-09-06	0.00	0.00	0.00	0.00		2	t	t	\N
795	2022-08-26	0.00	0.00	0.00	0.00		2	t	t	\N
810	2022-09-10	0.00	0.00	0.00	0.00		2	f	f	\N
827	2022-09-13	0.00	0.00	0.00	0.00		2	t	t	\N
818	2022-10-02	0.00	0.00	0.00	0.00		2	t	t	\N
828	2022-09-14	0.00	0.00	0.00	0.00		2	t	t	\N
830	2022-09-16	0.00	0.00	0.00	0.00		2	t	t	\N
829	2022-09-15	0.00	0.00	0.00	1000.00	revisados en banco	2	f	f	\N
831	2022-09-17	0.00	0.00	0.00	0.00		2	t	t	\N
832	2022-09-18	0.00	0.00	0.00	0.00		2	t	t	\N
812	2022-09-26	0.00	0.00	0.00	0.00		2	t	t	\N
815	2022-09-29	0.00	0.00	0.00	0.00		2	t	t	\N
805	2022-09-05	0.00	0.00	0.00	800.00		2	t	t	\N
833	2022-09-19	0.00	0.00	0.00	0.00		2	t	t	\N
834	2022-09-20	0.00	0.00	0.00	0.00		2	t	t	\N
835	2022-09-21	0.00	0.00	0.00	0.00		2	t	t	\N
807	2022-09-07	0.00	0.00	0.00	0.00		2	t	t	\N
836	2022-09-22	0.00	0.00	0.00	0.00		2	t	t	\N
837	2022-09-23	0.00	0.00	0.00	1000.00		2	t	t	\N
838	2022-09-24	0.00	0.00	0.00	0.00		2	t	t	\N
839	2022-09-25	0.00	0.00	0.00	0.00		2	t	t	\N
854	2022-10-24	0.00	0.00	0.00	0.00		2	t	t	\N
802	2022-09-02	0.00	0.00	0.00	0.00		2	t	t	\N
863	2022-11-02	0.00	0.00	0.00	0.00		2	t	t	\N
848	2022-10-18	0.00	0.00	0.00	1200.00		2	f	f	\N
798	2022-08-29	0.00	0.00	0.00	0.00		2	t	t	\N
860	2022-10-30	0.00	0.00	0.00	0.00		2	f	f	\N
801	2022-09-01	0.00	0.00	0.00	0.00		2	t	t	\N
853	2022-10-23	0.00	0.00	0.00	0.00		2	t	t	\N
800	2022-08-31	0.00	0.00	0.00	930.00	930 de 1000 sacados del banco	2	t	t	\N
821	2022-10-05	0.00	0.00	0.00	0.00		2	f	f	\N
859	2022-10-29	0.00	0.00	0.00	0.00		2	t	t	\N
858	2022-10-28	0.00	0.00	0.00	0.00		2	t	t	\N
850	2022-10-20	0.00	0.00	0.00	0.00		2	t	t	\N
820	2022-10-04	0.00	0.00	0.00	0.00		2	f	f	\N
799	2022-08-30	0.00	0.00	0.00	0.00		2	t	t	\N
852	2022-10-22	0.00	0.00	0.00	0.00		2	t	t	\N
857	2022-10-27	0.00	0.00	0.00	0.00		2	t	t	\N
866	2022-11-05	0.00	0.00	0.00	0.00		2	t	t	\N
819	2022-10-03	0.00	0.00	0.00	0.00		2	t	t	\N
804	2022-09-04	0.00	0.00	0.00	0.00		2	t	t	\N
825	2022-10-09	0.00	0.00	0.00	0.00		2	t	t	\N
824	2022-10-08	0.00	0.00	0.00	0.00		2	t	t	\N
823	2022-10-07	0.00	0.00	0.00	700.00		2	f	f	\N
851	2022-10-21	0.00	0.00	0.00	0.00		2	t	t	\N
822	2022-10-06	0.00	0.00	0.00	0.00		2	f	f	\N
856	2022-10-26	0.00	0.00	0.00	0.00		2	t	t	\N
849	2022-10-19	0.00	0.00	0.00	0.00		2	f	f	\N
855	2022-10-25	0.00	0.00	0.00	0.00		2	t	t	\N
862	2022-11-01	0.00	0.00	0.00	0.00		2	f	f	\N
867	2022-11-06	0.00	0.00	0.00	0.00		2	t	t	\N
864	2022-11-03	0.00	0.00	0.00	0.00		2	f	f	\N
865	2022-11-04	0.00	0.00	0.00	1000.00		2	f	f	\N
868	2022-11-07	0.00	0.00	0.00	0.00		2	t	t	\N
869	2022-11-08	0.00	0.00	0.00	0.00		2	t	t	\N
872	2022-11-11	0.00	0.00	0.00	0.00		2	t	t	\N
870	2022-11-09	0.00	0.00	0.00	0.00		2	f	f	\N
871	2022-11-10	0.00	0.00	0.00	0.00		2	f	f	\N
861	2022-10-31	0.00	0.00	0.00	1000.00		2	t	t	\N
873	2022-11-12	0.00	0.00	0.00	0.00		2	f	f	\N
874	2022-11-13	0.00	0.00	0.00	0.00		2	f	f	\N
840	2022-10-10	0.00	0.00	0.00	0.00		2	t	t	\N
876	2022-11-15	0.00	0.00	0.00	0.00		2	t	t	\N
842	2022-10-12	0.00	0.00	0.00	0.00		2	t	t	\N
841	2022-10-11	0.00	0.00	0.00	0.00		2	f	f	\N
843	2022-10-13	0.00	0.00	0.00	0.00		2	t	t	\N
844	2022-10-14	0.00	0.00	0.00	0.00		2	t	t	\N
845	2022-10-15	0.00	0.00	0.00	0.00		2	t	t	\N
846	2022-10-16	0.00	0.00	0.00	0.00		2	t	t	\N
847	2022-10-17	0.00	0.00	0.00	0.00		2	t	t	\N
897	2022-12-06	0.00	0.00	0.00	0.00		2	t	t	\N
938	2023-01-30	0.00	0.00	0.00	0.00		2	f	f	\N
955	2023-02-16	0.00	0.00	0.00	0.00		2	t	t	\N
888	2022-11-27	0.00	0.00	0.00	0.00		2	f	f	\N
903	2023-01-16	0.00	0.00	0.00	0.00		2	f	f	\N
908	2023-01-21	0.00	0.00	0.00	0.00		2	t	t	\N
878	2022-11-17	0.00	0.00	0.00	0.00		2	f	f	\N
948	2023-02-09	0.00	0.00	0.00	0.00	foto borrosa con gastos	2	f	f	\N
898	2022-12-07	0.00	0.00	0.00	0.00		2	f	f	\N
936	2023-01-28	0.00	0.00	0.00	0.00		2	t	t	\N
943	2023-02-04	0.00	0.00	0.00	0.00		2	f	f	\N
889	2022-11-28	0.00	0.00	0.00	1000.00		2	t	t	\N
927	2023-01-12	0.00	0.00	0.00	1000.00	foto borrosa sin gastos	2	t	t	\N
952	2023-02-13	0.00	0.00	0.00	0.00		2	f	f	\N
904	2023-01-17	0.00	0.00	0.00	0.00		2	f	f	\N
879	2022-11-18	0.00	0.00	0.00	0.00		2	t	t	\N
933	2023-01-25	0.00	0.00	0.00	0.00	foto borrosa sin gastos	2	t	t	\N
899	2022-12-08	0.00	0.00	0.00	0.00		2	t	t	\N
890	2022-11-29	0.00	0.00	0.00	0.00		2	f	f	\N
947	2023-02-08	0.00	0.00	0.00	0.00	foto borrosa con gastos	2	f	f	\N
909	2023-01-22	0.00	0.00	0.00	0.00		2	t	t	\N
928	2023-01-13	0.00	0.00	0.00	0.00		2	f	f	\N
880	2022-11-19	0.00	0.00	0.00	0.00		2	f	f	\N
905	2023-01-18	0.00	0.00	0.00	0.00		2	f	f	\N
900	2022-12-09	0.00	0.00	0.00	0.00		2	t	t	\N
891	2022-11-30	0.00	0.00	0.00	0.00		2	t	t	\N
924	2023-01-09	0.00	0.00	0.00	0.00		2	f	f	\N
881	2022-11-20	0.00	0.00	0.00	0.00		2	f	f	\N
901	2022-12-10	0.00	0.00	0.00	0.00		2	f	f	\N
929	2023-01-14	0.00	0.00	0.00	0.00		2	t	t	\N
892	2022-12-01	0.00	0.00	0.00	0.00		2	f	f	\N
906	2023-01-19	0.00	0.00	0.00	0.00		2	f	f	\N
941	2023-02-02	0.00	0.00	0.00	0.00		2	t	t	\N
939	2023-01-31	0.00	0.00	0.00	0.00		2	t	t	\N
902	2022-12-11	0.00	0.00	0.00	0.00		2	f	f	\N
882	2022-11-21	0.00	0.00	0.00	1000.00		2	t	t	\N
893	2022-12-02	0.00	0.00	0.00	0.00		2	f	f	\N
894	2022-12-03	0.00	0.00	0.00	0.00		2	f	f	\N
883	2022-11-22	0.00	0.00	0.00	0.00		2	t	t	\N
910	2022-12-19	0.00	0.00	0.00	0.00		2	f	f	\N
911	2022-12-20	0.00	0.00	0.00	0.00		2	f	f	\N
912	2022-12-21	0.00	0.00	0.00	0.00		2	f	f	\N
913	2022-12-22	0.00	0.00	0.00	0.00		2	f	f	\N
914	2022-12-23	0.00	0.00	0.00	0.00		2	f	f	\N
915	2022-12-24	0.00	0.00	0.00	0.00		2	f	f	\N
895	2022-12-04	0.00	0.00	0.00	0.00		2	f	f	\N
884	2022-11-23	0.00	0.00	0.00	0.00		2	t	t	\N
916	2022-12-25	0.00	0.00	0.00	0.00		2	f	f	\N
885	2022-11-24	0.00	0.00	0.00	0.00		2	f	f	\N
917	2023-01-02	0.00	0.00	0.00	0.00		2	f	f	\N
875	2022-11-14	0.00	0.00	0.00	1000.00		2	t	t	\N
918	2023-01-03	0.00	0.00	0.00	0.00		2	f	f	\N
919	2023-01-04	0.00	0.00	0.00	0.00		2	f	f	\N
920	2023-01-05	0.00	0.00	0.00	0.00		2	f	f	\N
921	2023-01-06	0.00	0.00	0.00	0.00		2	f	f	\N
886	2022-11-25	0.00	0.00	0.00	0.00		2	f	f	\N
896	2022-12-05	0.00	0.00	0.00	0.00		2	f	f	\N
877	2022-11-16	0.00	0.00	0.00	0.00		2	t	t	\N
922	2023-01-07	0.00	0.00	0.00	0.00		2	f	f	\N
923	2023-01-08	0.00	0.00	0.00	0.00		2	f	f	\N
887	2022-11-26	0.00	0.00	0.00	0.00		2	t	t	\N
925	2023-01-10	0.00	0.00	0.00	0.00		2	t	t	\N
953	2023-02-14	0.00	0.00	0.00	0.00		2	f	f	\N
937	2023-01-29	0.00	0.00	0.00	0.00		2	t	t	\N
930	2023-01-15	0.00	0.00	0.00	0.00		2	f	f	\N
907	2023-01-20	0.00	0.00	0.00	0.00		2	f	f	\N
934	2023-01-26	0.00	0.00	0.00	0.00	foto borrosa sin gastos	2	t	t	\N
931	2023-01-23	0.00	0.00	0.00	0.00		2	t	t	\N
926	2023-01-11	0.00	0.00	0.00	0.00	foto borrosa sin gastos	2	t	t	\N
935	2023-01-27	0.00	0.00	0.00	0.00		2	f	f	\N
932	2023-01-24	0.00	0.00	0.00	0.00		2	t	t	\N
946	2023-02-07	0.00	0.00	0.00	0.00		2	t	t	\N
945	2023-02-06	0.00	0.00	0.00	0.00		2	t	t	\N
954	2023-02-15	0.00	0.00	0.00	0.00		2	f	f	\N
944	2023-02-05	0.00	0.00	0.00	0.00		2	t	t	\N
942	2023-02-03	0.00	0.00	0.00	0.00	foto borrosa con gasto	2	f	f	\N
940	2023-02-01	0.00	0.00	0.00	0.00		2	t	t	\N
951	2023-02-12	0.00	0.00	0.00	0.00		2	f	f	\N
950	2023-02-11	0.00	0.00	0.00	0.00		2	f	f	\N
958	2023-02-19	0.00	0.00	0.00	0.00		2	t	t	\N
949	2023-02-10	0.00	0.00	0.00	0.00	foto borrosa con gastos	2	f	f	\N
956	2023-02-17	0.00	0.00	0.00	0.00		2	f	f	\N
957	2023-02-18	0.00	0.00	0.00	0.00		2	f	f	\N
959	2023-02-20	0.00	0.00	0.00	0.00		2	f	f	\N
960	2023-02-21	0.00	0.00	0.00	0.00		2	f	f	\N
961	2023-02-22	0.00	0.00	0.00	0.00		2	f	f	\N
962	2023-02-23	0.00	0.00	0.00	0.00		2	f	f	\N
963	2023-02-24	0.00	0.00	0.00	0.00		2	f	f	\N
964	2023-02-25	0.00	0.00	0.00	0.00		2	f	f	\N
965	2023-02-26	0.00	0.00	0.00	0.00		2	f	f	\N
994	2023-03-27	0.00	0.00	0.00	0.00		2	t	t	\N
972	2023-03-05	0.00	0.00	0.00	0.00		2	t	t	\N
988	2023-03-21	0.00	0.00	0.00	0.00		2	f	f	\N
985	2023-03-18	0.00	0.00	0.00	0.00		2	t	t	\N
1016	2023-04-18	0.00	0.00	0.00	0.00		2	f	f	\N
966	2023-02-27	0.00	0.00	0.00	0.00		2	f	f	\N
1032	2023-04-27	0.00	0.00	0.00	0.00		2	f	f	\N
1041	2023-05-06	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
979	2023-03-12	0.00	0.00	0.00	0.00		2	t	t	\N
1006	2023-04-08	0.00	0.00	0.00	0.00		2	t	t	\N
1031	2023-04-26	0.00	0.00	0.00	0.00		2	t	t	\N
973	2023-03-06	0.00	0.00	0.00	0.00		2	t	t	\N
995	2023-03-28	0.00	0.00	0.00	0.00		2	t	t	\N
989	2023-03-22	0.00	0.00	0.00	0.00		2	t	t	\N
1038	2023-05-03	0.00	0.00	0.00	0.00		2	t	t	\N
986	2023-03-19	0.00	0.00	0.00	0.00		2	t	t	\N
1012	2023-04-14	0.00	0.00	0.00	0.00		2	f	f	\N
980	2023-03-13	0.00	0.00	0.00	0.00		2	t	t	\N
967	2023-02-28	0.00	0.00	0.00	0.00		2	f	f	\N
1021	2023-04-23	0.00	0.00	0.00	0.00		2	t	t	\N
974	2023-03-07	0.00	0.00	0.00	0.00		2	t	t	\N
1007	2023-04-09	0.00	0.00	0.00	0.00		2	t	t	\N
1001	2023-04-03	0.00	0.00	0.00	0.00		2	t	t	\N
990	2023-03-23	0.00	0.00	0.00	0.00		2	f	f	\N
996	2023-03-29	0.00	0.00	0.00	0.00		2	t	t	\N
981	2023-03-14	0.00	0.00	0.00	0.00		2	t	t	\N
968	2023-03-01	0.00	0.00	0.00	0.00		2	t	t	\N
975	2023-03-08	0.00	0.00	0.00	0.00		2	t	t	\N
991	2023-03-24	0.00	0.00	0.00	0.00		2	f	f	\N
1002	2023-04-04	0.00	0.00	0.00	0.00	enviaron dos reportes, cual es el correcto?	2	f	f	\N
997	2023-03-30	0.00	0.00	0.00	0.00		2	f	f	\N
1017	2023-04-19	0.00	0.00	0.00	0.00		2	t	t	\N
982	2023-03-15	0.00	0.00	0.00	0.00		2	f	f	\N
969	2023-03-02	0.00	0.00	0.00	0.00		2	t	t	\N
1013	2023-04-15	0.00	0.00	0.00	0.00		2	t	t	\N
1003	2023-04-05	0.00	0.00	0.00	0.00		2	t	t	\N
992	2023-03-25	0.00	0.00	0.00	0.00		2	t	t	\N
976	2023-03-09	0.00	0.00	0.00	0.00		2	t	t	\N
1008	2023-04-10	0.00	0.00	0.00	0.00		2	f	f	\N
998	2023-03-31	0.00	0.00	0.00	1000.00		2	t	t	\N
983	2023-03-16	0.00	0.00	0.00	0.00		2	t	t	\N
970	2023-03-03	0.00	0.00	0.00	0.00		2	t	t	\N
1018	2023-04-20	0.00	0.00	0.00	0.00		2	f	f	\N
1004	2023-04-06	0.00	0.00	0.00	1000.00		2	t	t	\N
1014	2023-04-16	0.00	0.00	0.00	0.00		2	t	t	\N
993	2023-03-26	0.00	0.00	0.00	0.00		2	t	t	\N
1009	2023-04-11	0.00	0.00	0.00	0.00		2	t	t	\N
987	2023-03-20	0.00	0.00	0.00	0.00		2	t	t	\N
977	2023-03-10	0.00	0.00	0.00	0.00		2	t	t	\N
999	2023-04-01	0.00	0.00	0.00	0.00		2	t	t	\N
984	2023-03-17	0.00	0.00	0.00	0.00		2	t	t	\N
971	2023-03-04	0.00	0.00	0.00	0.00		2	t	t	\N
1005	2023-04-07	0.00	0.00	0.00	0.00		2	f	f	\N
978	2023-03-11	0.00	0.00	0.00	0.00		2	f	f	\N
1000	2023-04-02	0.00	0.00	0.00	0.00		2	t	t	\N
1010	2023-04-12	0.00	0.00	0.00	0.00		2	t	t	\N
1011	2023-04-13	0.00	0.00	0.00	0.00		2	f	f	\N
1019	2023-04-21	0.00	0.00	0.00	1000.00		2	f	f	\N
1037	2023-05-02	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1036	2023-05-01	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1034	2023-04-29	0.00	0.00	0.00	0.00		2	t	t	\N
1015	2023-04-17	0.00	0.00	0.00	1000.00		2	t	t	\N
1033	2023-04-28	0.00	0.00	0.00	0.00		2	t	t	\N
1030	2023-04-25	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1020	2023-04-22	0.00	0.00	0.00	0.00		2	t	t	\N
1035	2023-04-30	0.00	0.00	0.00	0.00		2	t	t	\N
1039	2023-05-04	0.00	0.00	0.00	0.00		2	t	t	\N
1040	2023-05-05	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1044	2023-05-16	0.00	0.00	0.00	0.00		2	t	t	\N
1045	2023-05-17	0.00	0.00	0.00	0.00		2	t	t	\N
1046	2023-05-18	0.00	0.00	0.00	1000.00		2	t	t	\N
1023	2023-05-24	0.00	0.00	0.00	0.00		2	t	t	\N
1024	2023-05-25	0.00	0.00	0.00	800.00		2	t	t	\N
1042	2023-05-07	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1047	2023-05-19	0.00	0.00	0.00	0.00		2	f	f	\N
1048	2023-05-20	0.00	0.00	0.00	0.00		2	f	f	\N
1049	2023-05-21	0.00	0.00	0.00	0.00		2	f	f	\N
1050	2023-05-22	0.00	0.00	0.00	0.00		2	f	f	\N
1022	2023-05-23	0.00	0.00	0.00	0.00		2	f	f	\N
1051	2023-05-30	0.00	0.00	0.00	0.00		2	t	t	\N
1025	2023-05-26	0.00	0.00	0.00	0.00		2	f	f	\N
1026	2023-05-27	0.00	0.00	0.00	0.00		2	f	f	\N
1027	2023-05-28	0.00	0.00	0.00	0.00		2	f	f	\N
1052	2023-05-31	0.00	0.00	0.00	0.00		2	t	t	\N
1028	2023-05-29	0.00	0.00	0.00	0.00		2	f	f	\N
1053	2023-06-01	0.00	0.00	0.00	0.00		2	t	t	\N
1054	2023-06-02	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1029	2023-04-24	0.00	0.00	0.00	0.00		2	t	t	\N
1055	2023-06-03	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1056	2023-06-04	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1043	2023-05-15	0.00	0.00	0.00	1000.00		2	t	t	\N
1104	2023-07-15	0.00	0.00	0.00	0.00		2	t	t	\N
1080	2023-06-21	0.00	0.00	0.00	0.00		2	t	t	\N
1076	2023-06-17	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1100	2023-07-11	0.00	0.00	0.00	0.00		2	t	t	\N
1072	2023-06-13	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1057	2023-05-08	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1122	2023-08-02	0.00	0.00	0.00	0.00		2	f	f	\N
1114	2023-07-25	0.00	0.00	0.00	0.00		2	t	t	\N
1097	2023-07-08	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1093	2023-07-04	0.00	0.00	0.00	0.00		2	f	f	\N
1068	2023-06-09	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1135	2023-08-15	0.00	0.00	0.00	0.00		2	t	t	\N
1058	2023-05-09	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1059	2023-05-10	0.00	0.00	0.00	0.00		2	f	f	\N
1120	2023-07-31	0.00	0.00	0.00	0.00		2	f	f	\N
1134	2023-08-14	0.00	0.00	0.00	0.00		2	f	f	\N
1064	2023-06-05	0.00	0.00	0.00	1000.00	tarde	2	t	t	\N
1089	2023-06-30	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1143	2023-08-23	0.00	0.00	0.00	0.00		2	t	t	\N
1060	2023-05-11	0.00	0.00	0.00	0.00		2	f	f	\N
1118	2023-07-29	0.00	0.00	0.00	0.00		2	f	f	\N
1081	2023-06-22	0.00	0.00	0.00	0.00		2	t	t	\N
1061	2023-05-12	0.00	0.00	0.00	0.00		2	f	f	\N
1085	2023-06-26	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1062	2023-05-13	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1077	2023-06-18	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1136	2023-08-16	0.00	0.00	0.00	0.00		2	f	f	\N
1098	2023-07-09	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1094	2023-07-05	0.00	0.00	0.00	0.00		2	t	t	\N
1063	2023-05-14	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1109	2023-07-20	0.00	0.00	0.00	0.00		2	t	t	\N
1090	2023-07-01	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1105	2023-07-16	0.00	0.00	0.00	0.00		2	t	t	\N
1101	2023-07-12	0.00	0.00	0.00	0.00	no se ve	2	f	f	\N
1073	2023-06-14	0.00	0.00	0.00	0.00		2	t	t	\N
1069	2023-06-10	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1065	2023-06-06	0.00	0.00	0.00	0.00		2	t	t	\N
1082	2023-06-23	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1086	2023-06-27	0.00	0.00	0.00	0.00	tarrde	2	t	t	\N
1115	2023-07-26	0.00	0.00	0.00	0.00		2	t	t	\N
1078	2023-06-19	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1125	2023-08-05	0.00	0.00	0.00	0.00		2	t	t	\N
1106	2023-07-17	0.00	0.00	0.00	0.00		2	f	f	\N
1095	2023-07-06	0.00	0.00	0.00	1000.00		2	t	t	\N
1110	2023-07-21	0.00	0.00	0.00	0.00		2	t	t	\N
1123	2023-08-03	0.00	0.00	0.00	0.00		2	f	f	\N
1091	2023-07-02	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1133	2023-08-13	0.00	0.00	0.00	0.00		2	f	f	\N
1074	2023-06-15	0.00	0.00	0.00	0.00		2	t	t	\N
1070	2023-06-11	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1121	2023-08-01	0.00	0.00	0.00	0.00		2	t	t	\N
1119	2023-07-30	0.00	0.00	0.00	0.00		2	f	f	\N
1102	2023-07-13	0.00	0.00	0.00	1000.00		2	t	t	\N
1087	2023-06-28	0.00	0.00	0.00	1000.00		2	t	t	\N
1113	2023-07-24	0.00	0.00	0.00	0.00		2	t	t	\N
1116	2023-07-27	0.00	0.00	0.00	0.00		2	t	t	\N
1083	2023-06-24	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1096	2023-07-07	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1066	2023-06-07	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1079	2023-06-20	0.00	0.00	0.00	1000.00	tarde	2	t	t	\N
1075	2023-06-16	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1111	2023-07-22	0.00	0.00	0.00	0.00		2	t	t	\N
1107	2023-07-18	0.00	0.00	0.00	1000.00	solo 1000 de 2000	2	t	t	\N
1092	2023-07-03	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1071	2023-06-12	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1103	2023-07-14	0.00	0.00	0.00	0.00		2	t	t	\N
1099	2023-07-10	0.00	0.00	0.00	0.00		2	t	t	\N
1067	2023-06-08	0.00	0.00	0.00	0.00		2	t	t	\N
1088	2023-06-29	0.00	0.00	0.00	0.00		2	t	t	\N
1112	2023-07-23	0.00	0.00	0.00	0.00		2	f	f	\N
1108	2023-07-19	0.00	0.00	0.00	0.00		2	t	t	\N
1084	2023-06-25	0.00	0.00	0.00	0.00	tarde	2	t	t	\N
1117	2023-07-28	0.00	0.00	0.00	0.00		2	f	f	\N
1130	2023-08-10	0.00	0.00	0.00	0.00		2	f	f	\N
1127	2023-08-07	0.00	0.00	0.00	0.00		2	t	t	\N
1128	2023-08-08	0.00	0.00	0.00	0.00		2	t	t	\N
1129	2023-08-09	0.00	0.00	0.00	0.00		2	t	t	\N
1124	2023-08-04	0.00	0.00	0.00	0.00		2	f	f	\N
1126	2023-08-06	0.00	0.00	0.00	0.00		2	f	f	\N
1132	2023-08-12	0.00	0.00	0.00	0.00		2	t	t	\N
1131	2023-08-11	0.00	0.00	0.00	0.00		2	t	t	\N
1137	2023-08-17	0.00	0.00	0.00	0.00		2	f	f	\N
1138	2023-08-18	0.00	0.00	0.00	0.00		2	f	f	\N
1139	2023-08-19	0.00	0.00	0.00	0.00		2	f	f	\N
1140	2023-08-20	0.00	0.00	0.00	0.00		2	f	f	\N
1141	2023-08-21	0.00	0.00	0.00	0.00		2	f	f	\N
1142	2023-08-22	0.00	0.00	0.00	0.00		2	f	f	\N
1144	2023-08-24	0.00	0.00	0.00	0.00		2	t	t	\N
1145	2023-08-25	0.00	0.00	0.00	0.00		2	f	f	\N
1146	2023-08-26	0.00	0.00	0.00	0.00		2	f	f	\N
1147	2023-08-27	0.00	0.00	0.00	0.00		2	f	f	\N
1159	2023-09-08	0.00	0.00	0.00	0.00		2	f	f	\N
1148	2023-08-28	0.00	0.00	0.00	0.00		2	f	f	\N
1184	2023-10-03	0.00	0.00	0.00	0.00		2	t	t	\N
1160	2023-09-09	0.00	0.00	0.00	0.00		2	f	f	\N
1178	2023-09-27	0.00	0.00	0.00	0.00		2	t	t	\N
1149	2023-08-29	0.00	0.00	0.00	0.00		2	f	f	\N
1223	2023-11-11	0.00	0.00	0.00	0.00		2	t	t	\N
1161	2023-09-10	0.00	0.00	0.00	0.00		2	f	f	\N
1150	2023-08-30	0.00	0.00	0.00	0.00		2	f	f	\N
1151	2023-08-31	0.00	0.00	0.00	0.00		2	f	f	\N
1213	2023-10-25	0.00	0.00	0.00	0.00		2	f	f	\N
1177	2023-09-26	0.00	0.00	0.00	0.00		2	f	f	\N
1189	2023-10-08	0.00	0.00	0.00	0.00		2	t	t	\N
1207	2023-11-02	0.00	0.00	0.00	0.00		2	t	t	\N
1202	2023-10-21	0.00	0.00	0.00	0.00		2	t	t	\N
1152	2023-09-01	0.00	0.00	0.00	0.00		2	t	t	\N
1162	2023-09-11	0.00	0.00	0.00	0.00		2	f	f	\N
1183	2023-10-02	0.00	0.00	0.00	0.00		2	t	t	\N
1212	2023-10-24	0.00	0.00	0.00	0.00		2	t	t	\N
1211	2023-10-23	0.00	0.00	0.00	0.00		2	t	t	\N
1188	2023-10-07	0.00	0.00	0.00	0.00		2	f	f	\N
1153	2023-09-02	0.00	0.00	0.00	0.00		2	f	f	\N
1222	2023-11-10	0.00	0.00	0.00	0.00		2	t	t	\N
1163	2023-09-12	0.00	0.00	0.00	0.00		2	f	f	\N
1195	2023-10-14	0.00	0.00	0.00	0.00		2	t	t	\N
1205	2023-10-31	0.00	0.00	0.00	0.00		2	t	t	\N
1221	2023-11-09	0.00	0.00	0.00	0.00		2	t	t	\N
1154	2023-09-03	0.00	0.00	0.00	0.00		2	f	f	\N
1226	2023-11-21	0.00	0.00	0.00	0.00		2	t	t	\N
1220	2023-11-08	0.00	0.00	0.00	0.00		2	t	t	\N
1164	2023-09-13	0.00	0.00	0.00	0.00		2	f	f	\N
1182	2023-10-01	0.00	0.00	0.00	0.00		2	t	t	\N
1216	2023-10-28	0.00	0.00	0.00	0.00		2	f	f	\N
1187	2023-10-06	0.00	0.00	0.00	0.00		2	f	f	\N
1155	2023-09-04	0.00	0.00	0.00	0.00		2	t	t	\N
1229	2023-11-24	0.00	0.00	0.00	1000.00		2	t	t	\N
1218	2023-11-06	0.00	0.00	0.00	0.00		2	f	f	\N
1181	2023-09-30	0.00	0.00	0.00	0.00		2	f	f	\N
1165	2023-09-14	0.00	0.00	0.00	0.00		2	t	t	\N
1194	2023-10-13	0.00	0.00	0.00	0.00		2	t	t	\N
1156	2023-09-05	0.00	0.00	0.00	0.00		2	f	f	\N
1215	2023-10-27	0.00	0.00	0.00	0.00		2	t	t	\N
1227	2023-11-22	0.00	0.00	0.00	0.00		2	f	f	\N
1193	2023-10-12	0.00	0.00	0.00	0.00		2	t	t	\N
1166	2023-09-15	0.00	0.00	0.00	0.00		2	f	f	\N
1157	2023-09-06	0.00	0.00	0.00	0.00		2	t	t	\N
1192	2023-10-11	0.00	0.00	0.00	0.00		2	t	t	\N
1201	2023-10-20	0.00	0.00	0.00	0.00		2	t	t	\N
1167	2023-09-16	0.00	0.00	0.00	0.00		2	f	f	\N
1191	2023-10-10	0.00	0.00	0.00	0.00		2	f	f	\N
1158	2023-09-07	0.00	0.00	0.00	0.00		2	t	t	\N
1186	2023-10-05	0.00	0.00	0.00	0.00		2	f	f	\N
1168	2023-09-17	0.00	0.00	0.00	0.00		2	f	f	\N
1169	2023-09-18	0.00	0.00	0.00	0.00		2	f	f	\N
1170	2023-09-19	0.00	0.00	0.00	0.00		2	f	f	\N
1171	2023-09-20	0.00	0.00	0.00	0.00		2	f	f	\N
1172	2023-09-21	0.00	0.00	0.00	0.00		2	f	f	\N
1173	2023-09-22	0.00	0.00	0.00	0.00		2	f	f	\N
1174	2023-09-23	0.00	0.00	0.00	0.00		2	f	f	\N
1175	2023-09-24	0.00	0.00	0.00	0.00		2	f	f	\N
1210	2023-11-05	0.00	0.00	0.00	0.00		2	t	t	\N
1228	2023-11-23	0.00	0.00	0.00	0.00		2	f	f	\N
1176	2023-09-25	0.00	0.00	0.00	0.00		2	f	f	\N
1190	2023-10-09	0.00	0.00	0.00	0.00		2	f	f	\N
1200	2023-10-19	0.00	0.00	0.00	0.00		2	t	t	\N
1208	2023-11-03	0.00	0.00	0.00	0.00		2	t	t	\N
1214	2023-10-26	0.00	0.00	0.00	0.00		2	t	t	\N
1180	2023-09-29	0.00	0.00	0.00	0.00		2	f	f	\N
1206	2023-11-01	0.00	0.00	0.00	0.00		2	t	t	\N
1224	2023-11-12	0.00	0.00	0.00	0.00		2	t	t	\N
1217	2023-10-29	0.00	0.00	0.00	0.00		2	f	f	\N
1204	2023-10-30	0.00	0.00	0.00	1000.00		2	t	t	\N
1197	2023-10-16	0.00	0.00	0.00	0.00		2	t	t	\N
1232	2023-11-27	0.00	0.00	0.00	0.00		2	t	t	\N
1179	2023-09-28	0.00	0.00	0.00	0.00		2	t	t	\N
1219	2023-11-07	0.00	0.00	0.00	0.00		2	t	t	\N
1209	2023-11-04	0.00	0.00	0.00	0.00		2	t	t	\N
1185	2023-10-04	0.00	0.00	0.00	0.00		2	t	t	\N
1199	2023-10-18	0.00	0.00	0.00	0.00		2	t	t	\N
1230	2023-11-25	0.00	0.00	0.00	0.00		2	f	f	\N
1198	2023-10-17	0.00	0.00	0.00	0.00		2	t	t	\N
1196	2023-10-15	0.00	0.00	0.00	0.00		2	f	f	\N
1203	2023-10-22	0.00	0.00	0.00	0.00		2	t	t	\N
1231	2023-11-26	0.00	0.00	0.00	0.00		2	f	f	\N
1234	2023-11-29	0.00	0.00	0.00	0.00		2	t	t	\N
1233	2023-11-28	0.00	0.00	0.00	0.00	no se ve	2	f	f	\N
1235	2023-11-30	0.00	0.00	0.00	0.00		2	t	t	\N
1236	2023-12-01	0.00	0.00	0.00	1000.00		2	t	t	\N
1237	2023-12-02	0.00	0.00	0.00	0.00		2	f	f	\N
1238	2023-12-03	0.00	0.00	0.00	0.00	borroso	2	f	f	\N
1225	2023-11-20	0.00	0.00	0.00	0.00		2	t	t	\N
1240	2023-11-14	0.00	0.00	0.00	0.00		2	f	f	\N
1251	2023-12-09	0.00	0.00	0.00	0.00		2	f	f	\N
1239	2023-11-13	0.00	0.00	0.00	0.00		2	t	t	\N
1260	2023-12-18	0.00	0.00	0.00	0.00	no se ve	2	f	f	\N
1268	2023-12-26	0.00	0.00	0.00	0.00		2	t	t	\N
1252	2023-12-10	0.00	0.00	0.00	0.00		2	t	t	\N
1241	2023-11-15	0.00	0.00	0.00	0.00		2	t	t	\N
1242	2023-11-16	0.00	0.00	0.00	0.00		2	f	f	\N
1261	2023-12-19	0.00	0.00	0.00	0.00		2	t	t	\N
1243	2023-11-17	0.00	0.00	0.00	0.00		2	f	f	\N
1269	2023-12-27	0.00	0.00	0.00	0.00		2	t	t	\N
1253	2023-12-11	0.00	0.00	0.00	0.00	100 gastados en morelos sin factura	2	f	t	\N
1244	2023-11-18	0.00	0.00	0.00	0.00		2	t	t	\N
1262	2023-12-20	0.00	0.00	0.00	0.00		2	t	t	\N
1254	2023-12-12	0.00	0.00	0.00	0.00		2	t	t	\N
1270	2023-12-28	0.00	0.00	0.00	0.00	parece que tiene un modification de 200 pero no se de donde viene	2	f	f	\N
1245	2023-11-19	0.00	0.00	0.00	0.00		2	t	t	\N
1263	2023-12-21	0.00	0.00	0.00	0.00		2	f	f	\N
1255	2023-12-13	0.00	0.00	0.00	0.00		2	t	t	\N
1246	2023-12-04	0.00	0.00	0.00	0.00	cash log dice que entraron 300 de los 1000 del banco	2	f	t	\N
1271	2023-12-29	0.00	0.00	0.00	0.00		2	f	f	\N
1264	2023-12-22	0.00	0.00	0.00	0.00	tiene un gasto de 41 que no dice para quien es	2	f	f	\N
1247	2023-12-05	0.00	0.00	0.00	0.00		2	f	f	\N
1256	2023-12-14	0.00	0.00	0.00	0.00		2	t	t	\N
1272	2023-12-30	0.00	0.00	0.00	0.00		2	f	f	\N
1265	2023-12-23	0.00	0.00	0.00	0.00	tiene un gasto de 60 que parece que es para morelos pero no se ve bien y no tiene factura	2	f	f	\N
1248	2023-12-06	0.00	0.00	0.00	0.00		2	t	t	\N
1257	2023-12-15	0.00	0.00	0.00	0.00		2	f	f	\N
1249	2023-12-07	0.00	0.00	0.00	0.00		2	t	t	\N
1266	2023-12-24	0.00	0.00	0.00	0.00		2	f	f	\N
1258	2023-12-16	0.00	0.00	0.00	0.00		2	f	f	\N
1250	2023-12-08	0.00	0.00	0.00	0.00		2	f	f	\N
1259	2023-12-17	0.00	0.00	0.00	0.00		2	t	t	\N
1273	2023-12-31	0.00	0.00	0.00	0.00		2	f	f	\N
1267	2023-12-25	0.00	0.00	0.00	0.00		2	f	f	\N
\.


--
-- Data for Name: accounting_expense; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_expense (id, amount, date, cost_center, reference, comments, restaurant_id, supplier_id, created_by_id) FROM stdin;
1	180.02	2021-04-09	primaryAccount	1210		1	57	1
2	20.00	2021-04-08	primaryAccount			1	58	1
3	20.00	2021-04-08	primaryAccount			1	58	1
4	373.48	2021-04-08	primaryAccount	1206		1	24	1
5	3375.00	2021-04-08	primaryAccount	1205		1	16	1
6	190.31	2021-04-08	primaryAccount			1	18	1
7	950.00	2021-04-08	primaryAccount			1	50	1
8	250.00	2021-04-08	primaryAccount			1	59	1
9	165.00	2021-04-07	primaryAccount	1277		1	32	1
10	1413.86	2021-04-06	primaryAccount			1	56	1
11	212.36	2021-04-06	primaryAccount			1	21	1
12	14.40	2021-04-05	primaryAccount			1	55	1
13	2761.03	2021-04-05	primaryAccount	1276		1	29	1
14	512.16	2021-04-05	primaryAccount			1	15	1
15	327.56	2021-04-05	primaryAccount			1	17	1
16	147.85	2021-04-05	primaryAccount			1	17	1
17	82.14	2021-04-05	primaryAccount			1	15	1
18	11.65	2021-04-07	expensesAccount			1	49	1
19	1.00	2021-04-06	expensesAccount			1	32	1
20	1.00	2021-04-06	expensesAccount			1	32	1
21	9.95	2021-04-05	expensesAccount			1	43	1
22	3.58	2021-04-05	cash			1	48	1
23	5.75	2021-04-05	cash			1	29	1
24	17.61	2021-04-07	cash			1	47	1
25	158.50	2021-04-08	cash			1	34	1
26	58.00	2021-04-08	cash			1	25	1
27	46.87	2021-04-10	cash			1	47	1
28	623.20	2021-04-12	primaryAccount	1215		1	6	1
29	2091.50	2021-04-12	primaryAccount			1	29	1
30	264.99	2021-04-15	primaryAccount			1	1	1
31	260.32	2021-04-16	primaryAccount			1	60	1
32	1467.00	2021-04-12	primaryAccount	1217		1	11	1
33	892.76	2021-04-12	primaryAccount	1004		1	7	1
34	694.30	2021-04-12	primaryAccount	1208		1	13	1
35	1857.55	2021-04-12	primaryAccount	1212		1	5	1
36	786.13	2021-04-12	primaryAccount	1211		1	4	1
37	1064.13	2021-04-12	primaryAccount	1209		1	8	1
38	2058.27	2021-04-14	primaryAccount	1278		1	12	1
39	317.16	2021-04-13	primaryAccount	1213		1	9	1
40	500.00	2021-04-16	primaryAccount	1005		1	61	1
41	1537.48	2021-04-12	primaryAccount			1	14	1
42	58.88	2021-04-12	primaryAccount			1	14	1
43	317.59	2021-04-14	expensesAccount			1	32	1
44	50.33	2021-04-13	expensesAccount			1	47	1
45	46.93	2021-04-13	expensesAccount			1	43	1
46	128.26	2021-04-12	expensesAccount			1	32	1
47	40.19	2021-04-12	expensesAccount			1	44	1
48	19.42	2021-04-12	expensesAccount			1	49	1
49	120.33	2021-04-12	cash			1	44	1
50	21.70	2021-04-12	cash			1	47	1
51	11.72	2021-04-12	cash			1	43	1
52	-17.01	2021-04-12	cash			1	29	1
53	500.00	2021-04-13	cash			1	62	1
54	-500.00	2021-04-13	primaryAccount			1	62	1
55	25.70	2021-04-14	cash			1	33	1
56	53.90	2021-04-15	cash			1	25	1
57	259.13	2021-04-16	cash			1	41	1
58	4.40	2021-04-17	cash			1	47	1
59	16.30	2021-04-17	cash			1	42	1
60	9.33	2021-04-18	cash			1	47	1
61	10.00	2021-04-18	cash			1	48	1
62	294.98	2021-04-15	primaryAccount	2371296		1	29	1
63	120.20	2021-04-03	primaryAccount	32904		1	31	1
64	237.00	2021-04-10	primaryAccount	33404		1	31	1
65	128.60	2021-04-07	primaryAccount	33092		1	31	1
66	197.43	2021-04-21	primaryAccount	34199		1	31	1
67	291.59	2021-04-14	primaryAccount	33650		1	31	1
68	260.50	2021-04-19	primaryAccount	34015		1	31	1
69	33.59	2021-04-19	cash			1	33	1
70	30.49	2021-04-20	cash			1	48	1
71	7.16	2021-04-21	cash			1	47	1
72	3.21	2021-04-21	cash			1	47	1
73	57.30	2021-04-22	cash			1	25	1
74	5.20	2021-04-23	cash			1	47	1
75	30.79	2021-04-24	cash			1	33	1
76	18.21	2021-04-24	cash			1	33	1
77	3.46	2021-04-24	cash			1	47	1
78	48.48	2021-04-24	cash			1	47	1
79	25.00	2021-04-24	cash			1	25	1
80	20.92	2021-04-25	cash			1	33	1
81	8.15	2021-04-25	cash			1	48	1
82	34.62	2021-04-25	cash			1	32	1
83	35.00	2021-04-19	primaryAccount	1201		1	3	1
84	24.04	2021-04-25	cash			1	47	1
85	454.40	2021-04-19	primaryAccount			1	21	1
86	308.05	2021-04-20	primaryAccount			1	26	1
87	146.30	2021-04-20	primaryAccount			1	28	1
88	1529.00	2021-04-21	primaryAccount	1218		1	30	1
89	167.43	2021-04-22	primaryAccount	1207		1	63	1
90	500.00	2021-04-23	primaryAccount	1279		1	6	1
91	28.45	2021-04-23	primaryAccount	502		1	6	1
92	132.53	2021-04-23	primaryAccount	497		1	57	1
93	1402.00	2021-04-23	primaryAccount		Tax Liabilities	1	14	1
94	662.92	2021-04-23	primaryAccount		Direct Deposits	1	14	1
95	58.88	2021-04-23	primaryAccount		Payroll Billing	1	14	1
96	630.71	2021-04-19	primaryAccount	2375122		1	29	1
97	1889.02	2021-04-19	primaryAccount	2375121		1	29	1
98	354.36	2021-04-23	primaryAccount	2380707		1	29	1
99	6.00	2021-04-30	expensesAccount			1	55	1
100	4.00	2021-04-30	expensesAccount			1	55	1
101	6.00	2021-04-30	primaryAccount			1	55	1
102	804.73	2021-04-29	primaryAccount			1	41	1
103	78.00	2021-04-29	primaryAccount			1	22	1
104	277.93	2021-04-27	primaryAccount	500		1	9	1
105	1467.00	2021-04-26	primaryAccount	1110		1	11	1
106	1857.55	2021-04-26	primaryAccount	499		1	5	1
107	796.32	2021-04-26	primaryAccount	498		1	4	1
108	1064.13	2021-04-26	primaryAccount	496		1	8	1
109	107.28	2021-04-26	primaryAccount			1	22	1
110	730.00	2021-04-27	primaryAccount		Salio de un retiro de 2001.21	1	35	1
111	825.96	2021-04-27	primaryAccount		Salio de un retiro de 2001.21	1	34	1
112	439.25	2021-04-27	primaryAccount		Salio de un retiro de 2001.21	1	66	1
113	2259.30	2021-04-26	primaryAccount	2383189		1	29	1
114	50.29	2021-04-27	primaryAccount	2384908		1	29	1
115	66.27	2021-04-27	primaryAccount	2384902		1	29	1
116	441.36	2021-04-29	notPaid	2388176		1	29	1
117	3.74	2021-04-26	cash			1	33	1
118	10.04	2021-04-26	cash			1	47	1
119	17.35	2021-04-30	cash			1	67	1
120	57.30	2021-04-30	cash			1	25	1
121	123.25	2021-04-30	cash			1	35	1
122	14.32	2021-05-01	cash			1	47	1
123	26.00	2021-04-16	cash			1	78	1
124	67.00	2021-05-03	cash			2	81	1
125	25.00	2021-05-03	cash			2	82	1
126	73.48	2021-05-04	cash			2	25	1
127	32.00	2021-05-04	cash			2	81	1
128	57.30	2021-05-05	cash			1	25	1
129	35.00	2021-05-07	cash			2	79	1
130	4.63	2021-05-07	cash			1	47	1
131	12.30	2021-05-07	cash			1	47	1
132	5.43	2021-05-07	cash			1	42	1
133	30.98	2021-05-08	cash			1	80	1
134	11.63	2021-05-08	cash			2	33	1
135	12.61	2021-05-08	cash			2	33	1
136	11.69	2021-05-08	cash			2	33	1
137	15.00	2021-05-09	cash			1	48	1
138	5.50	2021-05-09	cash			1	48	1
139	9.74	2021-05-09	cash			1	47	1
140	19.90	2021-05-09	cash			1	47	1
141	39.53	2021-05-09	cash			2	33	1
142	96.81	2021-05-09	cash			2	32	1
143	25.00	2021-05-09	cash			2	83	1
144	26.83	2021-05-08	cash			2	33	1
145	3081.53	2021-05-03	primaryAccount	2392126	Se pago con cash	1	29	1
146	183.00	2021-05-03	notPaid			1	30	1
147	317.81	2021-05-08	primaryAccount	35429		1	31	1
148	104.25	2021-05-08	primaryAccount	35437		1	31	1
149	182.20	2021-05-04	primaryAccount	35051		1	31	1
150	1653.00	2021-05-07	primaryAccount			1	14	1
151	692.90	2021-05-07	primaryAccount			1	14	1
152	58.88	2021-05-07	primaryAccount			1	14	1
153	6.30	2021-05-06	primaryAccount			1	55	1
154	609.88	2021-05-05	primaryAccount			1	21	1
155	1365.77	2021-05-04	primaryAccount			1	56	1
156	101.74	2021-05-04	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	84	1
157	25.00	2021-05-03	primaryAccount			1	55	1
158	325.00	2021-05-03	primaryAccount			1	85	1
159	25.00	2021-05-03	primaryAccount			1	55	1
160	440.32	2021-05-03	primaryAccount			1	86	1
161	25.00	2021-05-03	primaryAccount			1	55	1
162	103.11	2021-05-03	primaryAccount			1	85	1
163	25.00	2021-05-03	primaryAccount			1	55	1
164	800.00	2021-05-03	primaryAccount		Emmanuel Ramirez (Truck F250 Tow)	1	84	1
165	785.35	2021-05-03	primaryAccount			1	88	1
166	344.99	2021-05-03	primaryAccount			1	17	1
167	180.00	2021-05-03	primaryAccount			1	27	1
168	33.07	2021-05-03	primaryAccount			1	17	1
169	189.78	2021-05-03	primaryAccount			1	19	1
170	127.50	2021-05-05	primaryAccount			1	87	1
171	162.23	2021-05-05	primaryAccount			1	64	1
172	778.80	2021-05-05	primaryAccount			1	34	1
173	425.00	2021-05-07	primaryAccount	2011		2	89	1
174	62.50	2021-05-05	primaryAccount	2012		2	89	1
175	694.69	2021-05-07	primaryAccount			2	90	1
176	11.00	2021-05-07	primaryAccount			2	90	1
177	22.00	2021-05-06	expensesAccount			1	91	1
178	87.30	2021-04-27	cash			2	66	1
179	48.23	2021-05-07	expensesAccount			2	33	1
180	37.96	2021-05-06	expensesAccount			2	32	1
181	10.89	2021-05-05	expensesAccount			1	92	1
182	71.19	2021-05-04	expensesAccount			2	93	1
183	56.06	2021-05-04	expensesAccount			1	51	1
184	110.69	2021-05-03	expensesAccount			2	32	1
185	77.48	2021-05-03	expensesAccount			1	32	1
186	37.55	2021-05-03	expensesAccount			2	65	1
187	28.72	2021-05-03	expensesAccount			1	32	1
188	8.53	2021-05-03	expensesAccount			2	44	1
189	2257.50	2021-05-10	notPaid	2400555		1	29	1
190	43.22	2021-05-12	notPaid	2404428		1	29	1
191	64.20	2021-05-14	expensesAccount			1	43	1
192	79.98	2021-05-12	expensesAccount			2	32	1
193	45.82	2021-05-12	expensesAccount			1	32	1
194	17.48	2021-05-11	expensesAccount			1	49	1
195	1.00	2021-05-10	expensesAccount			2	32	1
196	1.00	2021-05-10	expensesAccount			1	32	1
197	108.78	2021-05-10	expensesAccount			1	32	1
198	42.82	2021-05-10	expensesAccount			2	32	1
199	18.63	2021-05-10	expensesAccount			1	44	1
200	11.26	2021-05-10	expensesAccount			1	32	1
201	10.23	2021-05-10	expensesAccount			2	33	1
202	25.00	2021-05-14	primaryAccount	1118		1	55	1
203	3370.00	2021-05-14	primaryAccount	1118		1	16	1
204	90.51	2021-05-11	primaryAccount	1283		1	32	1
205	844.00	2021-05-11	primaryAccount	1114		2	30	1
206	727.00	2021-05-11	primaryAccount	1113		1	30	1
207	223.36	2021-05-11	primaryAccount	510		1	9	1
208	751.80	2021-05-11	primaryAccount	508		1	94	1
209	218.93	2021-05-10	primaryAccount	1123		1	11	1
210	144.45	2021-05-10	primaryAccount	1121		1	95	1
211	2078.00	2021-05-10	primaryAccount	1120		1	5	1
212	500.00	2021-05-10	primaryAccount	1117		1	6	1
213	1913.38	2021-05-10	primaryAccount	1115		1	11	1
214	18.09	2021-05-10	primaryAccount	512		1	6	1
215	146.28	2021-05-10	primaryAccount	506		1	57	1
216	1064.13	2021-05-10	primaryAccount	505		1	8	1
217	126.14	2021-05-10	primaryAccount	504		1	63	1
218	123.95	2021-05-10	primaryAccount	495		1	63	1
219	15.00	2021-05-10	cash			1	46	1
220	18.27	2021-05-10	cash			1	33	1
221	13.01	2021-05-10	cash			2	96	1
222	21.66	2021-05-10	cash			2	97	1
223	11.17	2021-05-12	cash			1	33	1
224	26.61	2021-05-12	cash			2	33	1
225	203.51	2021-05-11	cash			2	97	1
226	57.30	2021-05-13	cash			1	25	1
227	5.40	2021-05-13	cash			1	33	1
228	4.36	2021-05-13	cash			1	92	1
229	28.00	2021-05-13	cash			1	46	1
230	15.00	2021-05-13	cash			1	46	1
231	8.67	2021-05-13	cash			2	98	1
232	3.25	2021-05-13	cash			2	96	1
233	100.00	2021-05-14	cash			1	4	1
234	30.00	2021-05-14	cash			1	46	1
235	67.29	2021-05-14	cash			1	42	1
236	4.89	2021-05-15	cash			1	48	1
237	53.00	2021-05-15	cash			2	82	1
238	2.16	2021-05-16	cash		key for bethanny	2	33	1
239	15.02	2021-05-17	cash			1	47	1
240	3.91	2021-05-17	cash			1	33	1
241	20.85	2021-05-18	cash			2	125	1
242	2331.99	2021-05-18	primaryAccount	2140223		2	29	1
243	130.43	2021-05-19	primaryAccount			2	64	1
244	9.78	2021-05-20	cash			1	48	1
245	100.00	2021-05-22	cash			2	46	1
246	72.00	2021-05-22	cash			2	101	1
247	19.38	2021-05-22	cash			2	33	1
248	80.00	2021-05-22	cash			2	102	1
249	65.00	2021-05-22	cash			2	95	1
250	36.34	2021-05-23	cash			2	32	1
251	30.34	2021-05-23	cash			2	44	1
252	9.82	2021-05-23	cash			2	33	1
253	234.69	2021-05-24	cash			2	25	1
254	7.00	2021-05-24	cash		tip gift card bixby	2	84	1
255	3337.45	2021-05-25	primaryAccount	2417917		2	29	1
256	848.63	2021-04-27	primaryAccount	34544		2	31	1
257	58.39	2021-04-29	primaryAccount	34708		2	31	1
258	324.15	2021-05-03	primaryAccount	34997		2	31	1
259	64.95	2021-05-03	primaryAccount	35011		2	31	1
260	342.05	2021-05-06	primaryAccount	35230		2	31	1
261	944.34	2021-05-10	primaryAccount	35547		2	31	1
262	25.33	2021-05-10	primaryAccount	35550		2	31	1
263	75.35	2021-05-12	primaryAccount	35686		2	31	1
264	349.20	2021-05-15	primaryAccount	35952		2	31	1
265	243.56	2021-05-17	primaryAccount	36028		2	31	1
266	291.15	2021-05-19	primaryAccount	36194		2	31	1
267	213.34	2021-05-20	primaryAccount			2	41	1
268	79.20	2021-05-21	primaryAccount	2414637		2	29	1
269	2018.88	2021-05-21	primaryAccount	2414636		2	29	1
270	340.70	2021-05-22	primaryAccount	36447		2	31	1
271	28.81	2021-05-22	primaryAccount	36468		2	31	1
272	33.15	2021-05-19	notPaid	2411192		2	29	1
273	343.00	2021-05-18	primaryAccount	18992		2	30	1
274	306.50	2021-05-10	primaryAccount	18856		2	30	1
275	187.00	2021-05-14	primaryAccount	18932		2	30	1
276	429.34	2021-05-19	primaryAccount	238435		2	34	1
277	4269.83	2021-05-11	notPaid	2401804		2	29	1
278	1154.44	2021-05-14	notPaid	2406922		2	29	1
279	2619.25	2021-05-07	notPaid	2399327		2	29	1
280	519.24	2021-05-12	primaryAccount	234351		2	34	1
281	233.00	2021-05-07	notPaid	18801		2	30	1
282	300.00	2021-03-05	notPaid			2	30	1
283	311.00	2021-04-27	notPaid			2	30	1
284	201.79	2021-05-14	primaryAccount	671363A		2	41	1
285	56.75	2021-05-14	primaryAccount			2	41	1
286	124.56	2021-05-07	notPaid	670199A		2	41	1
287	778.89	2021-05-05	notPaid	231719		2	34	1
288	229.40	2021-05-18	primaryAccount	158664		2	35	1
289	202.01	2021-05-13	notPaid			2	103	1
290	327.05	2021-05-11	notPaid	153966		2	35	1
291	3.88	2021-05-25	cash			2	96	1
292	185.05	2021-05-26	primaryAccount	163570		2	35	1
293	556.70	2021-05-26	notPaid	242691		2	34	1
294	299.73	2021-05-26	notPaid	36726		2	31	1
295	12.93	2021-05-26	cash			2	33	1
296	58.24	2021-05-26	cash			2	39	1
297	86.28	2021-05-27	notPaid	2420976		2	29	1
298	674.25	2021-05-27	notPaid	6570065		2	24	1
299	276.00	2021-05-21	notPaid	19055		2	30	1
300	264.50	2021-05-27	notPaid	19137		2	30	1
301	144.76	2021-05-28	cash	2422493		2	29	1
302	1836.16	2021-05-28	notPaid	2422492		2	29	1
303	198.70	2021-05-28	notPaid	36871		2	30	1
304	28.69	2021-05-29	cash			1	47	1
305	49.33	2021-05-29	cash			1	42	1
306	960.15	2021-05-23	primaryAccount			2	105	1
307	158.85	2021-05-21	primaryAccount	136		2	107	1
308	569.95	2021-05-21	primaryAccount	132		2	21	1
309	1975.02	2021-05-21	primaryAccount	127		2	11	1
310	529.30	2021-05-20	primaryAccount	124		2	66	1
311	225.86	2021-05-20	primaryAccount	123		2	34	1
312	242.40	2021-05-20	primaryAccount	122		2	35	1
313	130.43	2021-05-20	primaryAccount			2	64	1
314	31.20	2021-05-20	primaryAccount			2	89	1
315	26.00	2021-05-20	primaryAccount			2	89	1
316	151.11	2021-05-19	primaryAccount	110011		2	106	1
317	250.00	2021-05-19	primaryAccount			2	59	1
318	10000.00	2021-05-18	primaryAccount	1008	construccion	2	104	1
319	500.00	2021-05-18	primaryAccount	1004		2	108	1
320	267.40	2021-05-18	primaryAccount	1002		2	66	1
321	2146.65	2021-05-18	primaryAccount		maquina margarita	2	112	1
322	82.29	2021-05-17	primaryAccount	110008		2	109	1
323	803.00	2021-05-17	primaryAccount	1001		2	111	1
324	200.00	2021-05-17	primaryAccount	235		2	110	1
325	128.59	2021-05-17	primaryAccount			2	64	1
326	693.23	2021-05-24	primaryAccount	1009		2	113	1
327	43.52	2021-05-24	primaryAccount	138		2	114	1
328	730.70	2021-05-24	primaryAccount	134		2	115	1
329	531.00	2021-05-24	primaryAccount	131		2	95	1
330	550.79	2021-05-24	primaryAccount	130		2	116	1
331	1112.80	2021-05-24	primaryAccount	129		2	117	1
332	1175.32	2021-05-24	primaryAccount	126		2	118	1
333	1300.00	2021-05-24	primaryAccount	121		2	119	1
334	5381.11	2021-05-24	primaryAccount			2	90	1
335	841.95	2021-05-25	primaryAccount	139		2	120	1
336	155.14	2021-05-25	primaryAccount	137		2	109	1
337	43.52	2021-05-25	primaryAccount	135		2	121	1
338	960.15	2021-05-25	primaryAccount			2	105	1
339	72.12	2021-05-25	primaryAccount			2	97	1
340	9.21	2021-05-25	primaryAccount		Subway	2	84	1
341	1.07	2021-05-26	primaryAccount			2	97	1
342	4.00	2021-05-27	primaryAccount			2	55	1
343	1836.16	2021-05-28	primaryAccount	161		2	103	1
344	43.42	2021-05-17	expensesAccount			2	32	1
345	20.96	2021-05-17	expensesAccount			2	32	1
346	66.02	2021-05-18	expensesAccount			2	44	1
347	43.41	2021-05-18	expensesAccount			2	49	1
348	33.65	2021-05-18	expensesAccount			1	44	1
349	59.38	2021-05-19	standBy		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 93114	1	100	1
350	7.96	2021-05-19	expensesAccount			1	32	1
351	53.06	2021-05-20	expensesAccount			1	122	1
352	19.27	2021-05-20	expensesAccount			1	33	1
353	1.00	2021-05-17	primaryAccount			1	107	1
354	795.42	2021-05-17	primaryAccount	507		1	4	1
355	394.66	2021-05-17	primaryAccount			1	21	1
356	260.32	2021-05-17	primaryAccount			1	60	1
357	25.00	2021-05-18	primaryAccount	1284		1	55	1
358	457.41	2021-05-18	primaryAccount	1284		1	85	1
359	285.31	2021-05-18	primaryAccount	1125		1	24	1
360	2525.35	2021-05-18	standBy			1	100	1
361	25.00	2021-05-20	primaryAccount	1124		1	55	1
362	125.00	2021-05-20	primaryAccount	1124		1	123	1
363	25.00	2021-05-20	primaryAccount			1	55	1
364	2227.08	2021-05-20	primaryAccount			1	14	1
365	641.01	2021-05-20	primaryAccount			1	14	1
366	305.56	2021-05-20	primaryAccount			1	26	1
367	146.30	2021-05-20	primaryAccount			1	28	1
368	61.47	2021-05-20	primaryAccount			1	14	1
369	25.00	2021-05-21	primaryAccount	1119		1	55	1
370	10.80	2021-05-17	notPaid	2409419		1	29	1
371	268.90	2021-05-19	notPaid	2411189		1	29	1
372	32.50	2021-05-19	notPaid	2412203		1	29	1
373	36.59	2021-05-25	notPaid	2417919		1	29	1
374	2111.88	2021-05-24	primaryAccount	2416516		1	29	1
375	25.00	2021-05-17	standBy	1008		1	55	1
376	439.25	2021-05-17	standBy	1008		1	66	1
377	25.00	2021-05-17	standBy			1	55	1
378	3169.34	2021-05-17	standBy			1	124	1
379	30.00	2021-05-30	cash			2	126	1
380	5000.00	2021-05-24	standBy		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
381	2000.00	2021-05-25	standBy		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
382	2000.00	2021-05-26	standBy		COUNTER WITHDRAWAL -  -	2	100	1
383	4000.00	2021-05-26	standBy		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
384	579.77	2021-05-27	standBy		COUNTER WITHDRAWAL -  -	2	100	1
385	5000.00	2021-05-28	standBy		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
386	1.00	2021-05-24	primaryAccount		ATM Service Charge - ATM D/F DTV*DIRECTV SERV - 800-347-3288 CA REF# 517600	1	55	1
387	800.00	2021-05-24	primaryAccount	1291	CHECK -  -	1	127	1
388	500.00	2021-05-24	primaryAccount	1286	CHECK -  -	1	6	1
389	686.00	2021-05-24	primaryAccount	1252	CHECK -  -	1	128	1
390	688.99	2021-05-24	primaryAccount	520	CHECK -  -	1	129	1
391	20.05	2021-05-24	primaryAccount	519	CHECK -  -	1	6	1
392	915.98	2021-05-24	primaryAccount	516	CHECK -  -	1	4	1
393	161.25	2021-05-24	primaryAccount	515	CHECK -  -	1	57	1
394	83.28	2021-05-24	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 86551	1	22	1
395	300.00	2021-05-24	standBy		COUNTER WITHDRAWAL -  -	1	100	1
396	25.00	2021-05-25	primaryAccount	1290	OD ITEM FEE -  -	1	55	1
397	989.50	2021-05-25	primaryAccount	1290	CHECK -  -	1	101	1
398	307.81	2021-05-25	primaryAccount	1285	CHECK -  -	1	106	1
399	151.80	2021-05-25	primaryAccount	1256	CHECK -  -	1	131	1
400	67.77	2021-05-25	primaryAccount	522	CHECK -  -	1	130	1
401	320.98	2021-05-25	primaryAccount	518	CHECK -  -	1	9	1
402	868.45	2021-05-25	primaryAccount	517	CHECK -  -	1	94	1
403	1064.13	2021-05-25	primaryAccount	514	CHECK -  -	1	8	1
404	235.86	2021-05-25	standBy		COUNTER WITHDRAWAL -  -	1	100	1
405	1.00	2021-05-26	primaryAccount		ATM Service Charge - ATM D/F Paisa Produce - Tulsa OK REF# 86985	1	55	1
406	1.00	2021-05-26	primaryAccount		ATM Service Charge - ATM D/F Paisa Produce - Tulsa OK REF# 86610	1	55	1
407	1.00	2021-05-26	primaryAccount		ATM Service Charge - ATM D/F Paisa Produce - Tulsa OK REF# 86840	1	55	1
408	25.00	2021-05-27	primaryAccount	1294	OD ITEM FEE -  -	1	55	1
409	1055.00	2021-05-27	primaryAccount	1294	CHECK -  -	1	5	1
410	400.00	2021-05-27	primaryAccount	1292	CHECK -  -	1	85	1
411	1055.00	2021-05-27	primaryAccount	1288	CHECK -  -	1	5	1
412	500.00	2021-05-27	primaryAccount	1287	CHECK -  -	1	108	1
413	6.00	2021-05-28	primaryAccount		Account Service Charge -  -	1	55	1
414	57.30	2021-05-28	primaryAccount	1295	CHECK -  -	1	25	1
415	732.24	2021-05-28	primaryAccount		ACH Debit - ACH BILL PAY   AEP PUBLIC SERV -	1	25	1
416	269.00	2021-05-28	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	1
417	109.17	2021-05-28	primaryAccount		ACH Debit - ACH BILL PAY   AEP PUBLIC SERV -	1	15	1
418	160.42	2021-05-28	primaryAccount		160.42	1	31	1
419	6.00	2021-05-28	primaryAccount			1	55	1
420	34.99	2021-05-27	primaryAccount			1	133	1
421	1433.89	2021-05-26	primaryAccount			1	124	1
422	200.00	2021-05-25	primaryAccount			1	55	1
423	25.00	2021-05-24	primaryAccount			1	55	1
424	3080.68	2021-05-24	primaryAccount			1	124	1
425	3.45	2021-05-24	primaryAccount			1	44	1
426	56.00	2021-05-27	cash			2	46	1
427	457.23	2021-06-04	primaryAccount	114		2	115	1
428	934.88	2021-06-04	primaryAccount	113		2	101	1
429	1975.02	2021-06-04	primaryAccount	109		2	11	1
430	566.16	2021-06-04	primaryAccount			2	21	1
431	75.00	2021-06-04	primaryAccount			2	135	1
432	1643.82	2021-06-04	primaryAccount	2429460		2	29	1
433	15.54	2021-06-04	expensesAccount	POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 30968		1	49	1
434	894.50	2021-06-03	primaryAccount	104		2	30	1
435	40.67	2021-06-03	expensesAccount	POS Transaction DDA - D/C TRN Parkhills Liquor - Tulsa OK REF# 7345		1	87	1
436	3519.56	2021-06-03	primaryAccount			2	90	1
437	37.25	2021-06-03	expensesAccount	POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 458		1	44	1
438	94.40	2021-06-03	primaryAccount			2	35	1
439	14.91	2021-06-03	expensesAccount	POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 563680		1	32	1
440	9756.00	2021-06-02	primaryAccount	1007		2	138	1
441	8.85	2021-06-03	expensesAccount	POS Transaction DDA - D/C TRN WAL-MART #1597 - TULSA OK REF# 233068		1	33	1
442	2208.56	2021-06-02	primaryAccount			2	137	1
443	250.00	2021-06-02	expensesAccount	ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ		1	59	1
444	674.25	2021-06-01	primaryAccount	163		2	24	1
445	482.23	2021-06-01	primaryAccount	162		2	134	1
446	16.46	2021-06-04	primaryAccount	531		1	6	1
447	56.00	2021-06-01	primaryAccount	105		2	134	1
448	108.27	2021-06-04	primaryAccount	526		1	57	1
449	2958.79	2021-06-01	standBy	103	dice que es SGC pero no tengo factura asociada	2	29	1
450	25.00	2021-06-03	primaryAccount	1298		1	55	1
451	1267.00	2021-06-03	primaryAccount	1298		1	30	1
452	3562.50	2021-06-01	primaryAccount			2	136	1
453	2158.22	2021-06-03	primaryAccount			1	14	1
454	556.70	2021-06-01	primaryAccount			2	34	1
455	1356.67	2021-06-03	primaryAccount			1	56	1
456	679.56	2021-06-03	primaryAccount			1	14	1
457	66.65	2021-06-03	primaryAccount			1	14	1
458	78.00	2021-06-03	primaryAccount			1	22	1
459	960.57	2021-06-02	primaryAccount			1	139	1
460	716.20	2021-06-02	primaryAccount			1	15	1
461	340.47	2021-06-02	primaryAccount			1	17	1
462	30.49	2021-06-02	primaryAccount			1	17	1
463	184.25	2021-06-02	primaryAccount			1	19	1
464	54.33	2021-06-01	primaryAccount	1296		1	85	1
465	180.00	2021-06-01	primaryAccount			1	27	1
466	2389.19	2021-06-01	standBy			1	100	1
467	500.00	2021-06-01	standBy			1	100	1
468	1500.00	2021-06-02	primaryAccount			1	124	1
469	10.00	2021-06-01	primaryAccount			1	55	1
470	1370.90	2021-06-01	primaryAccount			1	124	1
471	396.10	2021-05-31	notPaid	37033		2	31	1
472	97.50	2021-06-01	cash			2	25	1
473	192.21	2021-06-03	notPaid			2	22	1
474	63.24	2021-06-03	cash			1	25	1
475	62.80	2021-06-04	cash			2	39	1
476	72.50	2021-06-04	cash			2	117	1
477	106.90	2021-06-05	cash			2	39	1
478	19.40	2021-06-05	cash			2	33	1
479	48.39	2021-06-01	cash			2	39	1
480	19.10	2021-06-01	cash			2	33	1
481	12.08	2021-06-01	cash			2	44	1
482	46.90	2021-06-01	cash			2	32	1
483	226.00	2021-06-01	cash			2	81	1
484	132.00	2021-06-01	cash			2	140	1
485	37.78	2021-06-02	cash			2	33	1
486	97.22	2021-06-07	expensesAccount			1	32	1
487	15.53	2021-06-07	expensesAccount			1	33	1
488	3391.31	2021-06-11	primaryAccount			1	124	1
890	28.02	2021-07-24	cash			1	33	1
489	1.00	2021-06-08	primaryAccount			1	141	1
490	1.00	2021-06-07	primaryAccount			1	22	1
491	3286.96	2021-06-07	primaryAccount			1	124	1
492	838.15	2021-06-11	primaryAccount	528	payroll	1	94	1
493	1500.00	2021-06-11	primaryAccount		?	1	100	1
494	25.00	2021-06-10	primaryAccount	1297		1	55	1
495	125.00	2021-06-10	primaryAccount	1297	payroll	1	142	1
496	25.00	2021-06-10	primaryAccount	1231		1	55	1
497	1300.00	2021-06-10	primaryAccount	1231		1	143	1
498	25.00	2021-06-10	primaryAccount	1230		1	55	1
499	3400.00	2021-06-10	primaryAccount	1230	rent	1	16	1
500	2673.24	2021-06-10	primaryAccount	533	?	1	147	1
501	400.00	2021-06-10	primaryAccount			1	100	1
502	230.00	2021-06-09	primaryAccount	1229	payroll	1	85	1
503	300.00	2021-06-09	primaryAccount	1228	Services	1	144	1
504	326.42	2021-06-08	primaryAccount	1227		1	85	1
505	820.59	2021-06-08	primaryAccount	532	payroll	1	129	1
506	14.40	2021-06-07	primaryAccount			1	55	1
507	500.00	2021-06-07	primaryAccount	1299	payroll	1	6	1
508	285.13	2021-06-07	primaryAccount	529	payroll	1	9	1
509	983.26	2021-06-07	primaryAccount	527	payroll	1	4	1
510	300.60	2021-06-07	primaryAccount	524	payroll	1	145	1
511	208.36	2021-06-07	primaryAccount	523	payroll	1	146	1
512	609.88	2021-06-07	primaryAccount			1	21	1
513	192.21	2021-06-07	primaryAccount			1	22	1
514	2381.82	2021-06-07	primaryAccount	2431632		1	29	1
515	52.12	2021-06-07	notPaid	2431633		1	29	1
516	52.12	2021-06-07	notPaid	2431634		1	29	1
517	2028.16	2021-06-11	primaryAccount	2437007		2	29	1
518	3000.00	2021-06-11	primaryAccount			2	100	1
519	3000.00	2021-06-11	primaryAccount			2	100	1
520	325.00	2021-06-10	primaryAccount	512		2	30	1
521	329.95	2021-06-10	primaryAccount			2	35	1
522	101.32	2021-06-10	primaryAccount			2	33	1
523	75.83	2021-06-10	primaryAccount			2	97	1
524	161.95	2021-06-09	primaryAccount	511		2	150	1
525	343.84	2021-06-09	primaryAccount	505		2	151	1
526	471.45	2021-06-09	primaryAccount			2	18	1
527	400.56	2021-06-09	primaryAccount			2	15	1
528	89.85	2021-06-09	primaryAccount			2	99	1
529	2.81	2021-06-09	primaryAccount			2	43	1
530	168.21	2021-06-08	primaryAccount	509		2	103	1
531	3013.92	2021-06-08	primaryAccount	2433215		2	29	1
532	500.00	2021-06-08	primaryAccount	107		2	108	1
533	1300.00	2021-06-08	primaryAccount	106		2	152	1
534	18.98	2021-06-08	primaryAccount			2	32	1
535	11.70	2021-06-07	primaryAccount			2	55	1
536	251.65	2021-06-07	primaryAccount	510		2	107	1
537	1055.00	2021-06-07	primaryAccount	502		2	5	1
538	1055.00	2021-06-07	primaryAccount	501		2	5	1
539	43.52	2021-06-07	primaryAccount	128		2	153	1
540	616.82	2021-06-07	primaryAccount	120		2	127	1
541	215.63	2021-06-07	primaryAccount	119		2	154	1
542	77.76	2021-06-07	primaryAccount	118		2	109	1
543	221.27	2021-06-07	primaryAccount	117		2	106	1
544	473.20	2021-06-07	primaryAccount	116		2	116	1
545	292.68	2021-06-07	primaryAccount	115		2	95	1
546	649.62	2021-06-07	primaryAccount	112		2	113	1
547	696.98	2021-06-07	primaryAccount	111		2	120	1
548	876.23	2021-06-07	primaryAccount	110		2	155	1
549	1131.37	2021-06-07	primaryAccount	108		2	118	1
550	542.78	2021-06-07	primaryAccount			2	34	1
551	331.56	2021-06-07	primaryAccount			2	156	1
552	85.95	2021-06-07	primaryAccount			2	64	1
553	5.86	2021-06-07	primaryAccount			2	48	1
554	1500.00	2021-06-07	standBy		En teoría es cash para local	2	62	1
555	50.00	2021-06-07	cash			2	140	1
556	97.50	2021-06-07	cash			2	25	1
557	395.88	2021-06-07	notPaid			2	31	1
558	100.00	2021-06-10	cash			1	25	1
559	80.19	2021-06-10	cash			2	39	1
560	236.29	2021-06-12	notPaid			2	31	1
561	18.43	2021-06-12	cash			2	33	1
562	81.28	2021-06-12	cash			2	39	1
563	15.18	2021-06-13	cash			2	157	1
564	2.47	2021-06-13	cash			2	33	1
565	3.56	2021-06-13	cash			1	33	1
566	500.00	2021-06-18	primaryAccount	1224		1	6	1
567	45.83	2021-06-18	primaryAccount	1223		1	57	1
568	14.62	2021-06-18	primaryAccount	543		1	6	1
569	2830.95	2021-06-18	primaryAccount			1	89	1
570	1625.02	2021-06-18	primaryAccount			1	14	1
571	297.54	2021-06-18	primaryAccount			1	14	1
572	193.73	2021-06-18	primaryAccount			1	89	1
573	146.30	2021-06-18	primaryAccount			1	28	1
574	66.65	2021-06-18	primaryAccount			1	14	1
575	108.20	2021-06-17	primaryAccount	525		1	63	1
576	394.59	2021-06-17	primaryAccount			1	21	1
577	82.28	2021-06-17	primaryAccount			1	22	1
578	260.32	2021-06-16	primaryAccount			1	60	1
579	43.07	2021-06-16	primaryAccount			1	55	1
580	536.23	2021-06-16	primaryAccount			1	1	1
581	5.53	2021-06-15	primaryAccount			1	19	1
582	2312.83	2021-06-14	primaryAccount	1232		1	12	1
583	3097.73	2021-06-14	primaryAccount	2439313		1	29	1
584	648.65	2021-06-18	primaryAccount	2012		2	113	1
585	914.26	2021-06-18	primaryAccount	2011		2	117	1
891	20.91	2021-07-25	cash			2	33	1
586	945.72	2021-06-18	primaryAccount	2010		2	101	1
587	1074.59	2021-06-18	primaryAccount	2009		2	120	1
588	3464.04	2021-06-18	primaryAccount			2	90	1
589	3002.09	2021-06-18	primaryAccount			2	90	1
590	2450.22	2021-06-17	primaryAccount			2	29	1
591	113.20	2021-06-17	primaryAccount			2	35	1
592	445.97	2021-06-17	primaryAccount			2	157	1
593	53.10	2021-06-17	primaryAccount			2	39	1
594	48.96	2021-06-17	primaryAccount			2	158	1
595	27.35	2021-06-16	primaryAccount			2	55	1
596	35.56	2021-06-16	primaryAccount			2	33	1
597	5.74	2021-06-16	primaryAccount			2	97	1
598	1500.00	2021-06-15	primaryAccount	507		2	5	1
599	153.97	2021-06-15	primaryAccount	506		2	25	1
600	545.77	2021-06-15	primaryAccount			2	34	1
601	70.64	2021-06-14	primaryAccount	125		2	159	1
602	67.38	2021-06-14	primaryAccount			2	97	1
603	13.68	2021-06-14	primaryAccount			2	48	1
604	177.00	2021-06-14	cash			1	130	1
605	39.76	2021-06-17	cash			2	33	1
606	100.09	2021-06-17	cash			1	80	1
607	37.58	2021-06-18	cash			2	93	1
608	147.43	2021-06-18	cash			2	160	1
609	23.31	2021-06-18	cash			2	49	1
610	63.15	2021-06-18	cash			2	32	1
611	19.21	2021-06-18	cash			2	51	1
612	5.22	2021-06-18	cash			1	48	1
613	133.34	2021-06-19	cash			2	39	1
614	11.23	2021-06-15	cash			2	33	1
615	60.00	2021-06-15	cash			2	46	1
616	14.16	2021-06-20	cash			1	47	1
617	276.25	2021-06-18	notPaid			2	31	1
618	2267.37	2021-06-18	notPaid			2	29	1
619	267.50	2021-06-18	primaryAccount	508		2	30	1
620	409.50	2021-06-18	primaryAccount	508		2	30	1
621	29.10	2021-06-25	expensesAccount			1	87	1
622	119.75	2021-06-23	expensesAccount			1	32	1
623	29.29	2021-06-23	expensesAccount			1	65	1
624	28.22	2021-06-23	expensesAccount			1	32	1
625	32.32	2021-06-22	expensesAccount			1	32	1
626	27.36	2021-06-22	expensesAccount			1	44	1
627	250.00	2021-06-21	expensesAccount			1	59	1
628	811.19	2021-06-24	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	55	1
629	2665.81	2021-06-25	primaryAccount			1	89	1
630	439.25	2021-06-25	primaryAccount	1258	Confirmado por kike	1	66	1
631	622.27	2021-06-23	primaryAccount	1233		1	161	1
632	1631.32	2021-06-22	primaryAccount	1225		1	31	1
633	765.62	2021-06-22	primaryAccount	544		1	129	1
634	2673.25	2021-06-22	primaryAccount			1	14	1
635	916.12	2021-06-22	primaryAccount			1	14	1
636	35.57	2021-06-22	primaryAccount			1	14	1
637	2259.32	2021-06-22	primaryAccount	2446836		1	29	1
638	231.49	2021-06-21	primaryAccount	1221		1	85	1
639	286.15	2021-06-21	primaryAccount	545		1	142	1
640	294.46	2021-06-21	primaryAccount	541		1	9	1
641	960.44	2021-06-21	primaryAccount	539		1	4	1
642	1000.98	2021-06-21	primaryAccount	535		1	145	1
643	216.58	2021-06-21	primaryAccount	534		1	146	1
644	340.76	2021-06-21	primaryAccount			1	26	1
645	2000.00	2021-06-25	primaryAccount	2018		2	104	1
646	405.00	2021-06-25	primaryAccount			2	52	1
647	128.00	2021-06-24	primaryAccount			2	35	1
648	71.41	2021-06-24	primaryAccount			2	48	1
649	1055.00	2021-06-23	primaryAccount	2004		2	5	1
650	1055.00	2021-06-23	primaryAccount	2003		2	5	1
651	2620.85	2021-06-23	primaryAccount			2	29	1
652	566.16	2021-06-23	primaryAccount			2	21	1
653	391.61	2021-06-22	primaryAccount	2013		2	116	1
654	435.73	2021-06-22	primaryAccount	2002		2	24	1
655	542.30	2021-06-22	primaryAccount			2	51	1
656	500.00	2021-06-21	primaryAccount	2016		2	108	1
657	219.53	2021-06-21	primaryAccount	2008		2	127	1
658	582.97	2021-06-21	primaryAccount	2007		2	151	1
659	140.38	2021-06-21	primaryAccount	2005		2	109	1
660	2222.11	2021-06-21	primaryAccount			2	29	1
661	536.80	2021-06-21	primaryAccount			2	34	1
662	313.12	2021-06-21	primaryAccount			2	21	1
663	250.00	2021-06-21	primaryAccount			2	59	1
664	162.23	2021-06-21	cash			2	25	1
665	20.97	2021-06-21	cash			2	96	1
666	22.24	2021-06-22	cash			2	32	1
667	50.00	2021-06-23	cash			2	81	1
668	50.00	2021-06-23	cash			2	162	1
669	14.00	2021-06-23	cash			2	96	1
670	11.71	2021-06-23	cash			2	33	1
671	21.04	2021-06-24	cash			1	31	1
672	63.24	2021-06-24	cash			1	25	1
673	216.00	2021-06-25	notPaid			2	31	1
674	22.94	2021-06-25	cash			2	33	1
675	23.85	2021-06-25	cash			2	157	1
676	61.70	2021-06-25	cash			2	33	1
677	13.14	2021-06-27	cash			1	47	1
678	20.00	2021-06-26	cash			2	95	1
679	33.98	2021-06-26	cash			2	39	1
680	19.88	2021-06-28	cash			1	92	1
681	154.00	2021-06-28	cash			2	25	1
682	60.44	2021-06-26	expensesAccount			1	39	1
683	438.74	2021-06-28	notPaid	39012		2	31	1
684	70.74	2021-06-26	cash			2	49	1
685	38.08	2021-07-01	cash			2	160	1
686	287.25	2021-07-01	cash	39280		1	31	1
687	63.24	2021-07-01	cash			1	25	1
688	113.50	2021-07-01	notPaid			2	41	1
689	263.95	2021-07-02	notPaid	39349		2	31	1
690	10.38	2021-07-02	cash			2	96	1
691	40.00	2021-07-02	cash			2	46	1
692	2.13	2021-07-02	cash			1	33	1
693	8.51	2021-07-02	cash			1	33	1
694	184.00	2021-07-03	notPaid			2	31	1
695	7.72	2021-07-03	cash			1	47	1
696	59.51	2021-07-03	cash			1	33	1
697	42.81	2021-07-04	cash			2	51	1
698	247.22	2021-06-30	expensesAccount	pago por pico		1	87	1
699	40.46	2021-07-02	expensesAccount	pago por pico		1	47	1
700	19.36	2021-06-28	expensesAccount	pago por pico		1	32	1
701	15.80	2021-06-28	expensesAccount	pago por pico		1	33	1
702	179.92	2021-06-28	expensesAccount	pago por pico		2	32	1
703	9.98	2021-06-28	expensesAccount	pago por pico		1	32	1
704	23.77	2021-06-28	expensesAccount	pago por pico		1	39	1
705	777.27	2021-07-02	primaryAccount	3009		2	117	1
706	2127.88	2021-07-02	primaryAccount			2	137	1
707	66.68	2021-07-02	primaryAccount			2	29	1
708	3741.21	2021-07-01	primaryAccount			2	90	1
709	3562.50	2021-07-01	primaryAccount			2	136	1
710	3307.28	2021-07-01	primaryAccount			2	90	1
711	363.85	2021-07-01	primaryAccount			2	35	1
712	168.21	2021-06-30	primaryAccount	3020		2	103	1
713	2500.00	2021-06-30	primaryAccount	3004		2	104	1
714	2914.99	2021-06-30	primaryAccount			2	29	1
715	37.72	2021-06-30	primaryAccount			2	48	1
716	52.09	2021-06-29	primaryAccount			2	163	1
717	1608.83	2021-06-28	primaryAccount	3001		2	134	1
718	750.53	2021-06-28	primaryAccount	2006		2	118	1
719	1264.17	2021-06-28	primaryAccount			2	29	1
720	546.35	2021-06-28	primaryAccount			2	34	1
721	70.74	2021-06-28	primaryAccount			2	49	1
722	25.00	2021-07-02	primaryAccount	1262		1	55	1
723	500.00	2021-07-02	primaryAccount	1262		1	6	1
724	25.00	2021-07-02	primaryAccount	555		1	55	1
725	26.22	2021-07-02	primaryAccount	555		1	6	1
726	25.00	2021-07-02	primaryAccount	553		1	55	1
727	279.80	2021-07-02	primaryAccount	553		1	9	1
728	25.00	2021-07-02	primaryAccount	551		1	55	1
729	828.32	2021-07-02	primaryAccount	551		1	4	1
730	25.00	2021-07-02	primaryAccount			1	55	1
731	983.47	2021-07-02	primaryAccount			1	15	1
732	880.67	2021-07-02	primaryAccount			1	139	1
733	135.49	2021-07-02	primaryAccount			1	15	1
734	658.73	2021-07-01	primaryAccount	1259		1	24	1
735	2673.24	2021-07-01	primaryAccount			1	14	1
736	2478.25	2021-07-01	primaryAccount			1	14	1
737	311.93	2021-07-01	primaryAccount			1	17	1
738	180.00	2021-07-01	primaryAccount			1	27	1
739	66.65	2021-07-01	primaryAccount			1	14	1
740	21.11	2021-07-01	primaryAccount			1	17	1
741	184.25	2021-07-01	primaryAccount			1	19	1
742	6.00	2021-06-30	primaryAccount			1	55	1
743	295.00	2021-06-30	primaryAccount			1	132	1
744	100.00	2021-06-29	primaryAccount	1260		1	140	1
745	843.65	2021-06-28	primaryAccount	540		1	94	1
746	2370.47	2021-06-28	primaryAccount			1	29	1
747	25.00	2021-07-01	primaryAccount			1	55	1
748	2818.04	2021-07-01	primaryAccount			1	124	1
749	6.00	2021-06-30	primaryAccount			1	55	1
750	10.00	2021-06-30	primaryAccount			1	55	1
751	25.00	2021-06-29	primaryAccount			1	55	1
752	3684.72	2021-06-29	primaryAccount			1	124	1
753	34.99	2021-06-29	primaryAccount			1	133	1
754	192.21	2021-06-28	primaryAccount			1	22	1
755	100.00	2021-07-06	cash			2	25	1
756	63.24	2021-07-08	cash			1	25	1
757	28.00	2021-07-08	cash			1	31	1
758	165.00	2021-07-08	cash			1	165	1
759	35.00	2021-07-09	cash			2	46	1
760	49.48	2021-07-10	cash			2	33	1
761	3.44	2021-07-10	cash			2	33	1
762	13.96	2021-07-10	cash			2	33	1
763	25.39	2021-07-11	cash			1	47	1
764	1034.87	2021-07-09	primaryAccount			2	15	1
765	2659.56	2021-07-09	primaryAccount			2	29	1
766	225.20	2021-07-08	primaryAccount	3008		2	154	1
767	117.95	2021-07-08	primaryAccount			2	35	1
768	32.40	2021-07-07	primaryAccount			2	55	1
769	1457.67	2021-07-07	primaryAccount			2	29	1
770	789.53	2021-07-06	primaryAccount	3016		2	101	1
771	545.64	2021-07-06	primaryAccount	3015		2	127	1
772	717.83	2021-07-06	primaryAccount	3014		2	120	1
773	778.27	2021-07-06	primaryAccount	3013		2	151	1
774	165.29	2021-07-06	primaryAccount	3012		2	166	1
775	350.78	2021-07-06	primaryAccount	3011		2	95	1
776	354.11	2021-07-06	primaryAccount	3010		2	116	1
777	500.00	2021-07-06	primaryAccount	3006		2	108	1
778	369.00	2021-07-06	primaryAccount	3002		2	30	1
779	1658.52	2021-07-06	primaryAccount			2	29	1
780	504.36	2021-07-06	primaryAccount			2	18	1
781	453.33	2021-07-06	primaryAccount			2	34	1
782	243.70	2021-07-06	primaryAccount			2	41	1
783	462.14	2021-07-09	primaryAccount	1264		1	85	1
784	2659.56	2021-07-09	primaryAccount	2461572 OJO, SE PAGO DOS VECES?		1	29	1
785	1052.05	2021-07-08	primaryAccount	548		1	145	1
786	13.95	2021-07-07	primaryAccount			1	55	1
787	609.88	2021-07-07	primaryAccount			1	21	1
788	25.00	2021-07-06	primaryAccount	1268		1	55	1
789	1244.72	2021-07-06	primaryAccount	1268		1	147	1
790	25.00	2021-07-06	primaryAccount	1267		1	55	1
791	25.00	2021-07-06	primaryAccount	1266		1	55	1
792	2660.00	2021-07-06	primaryAccount	1265/2461572		1	29	1
793	1127.50	2021-07-06	primaryAccount	1261		1	30	1
794	651.72	2021-07-06	primaryAccount	556		1	129	1
795	807.94	2021-07-06	primaryAccount	552		1	94	1
796	213.30	2021-07-06	primaryAccount	546		1	146	1
797	1351.25	2021-07-06	primaryAccount			1	56	1
798	222.44	2021-07-06	primaryAccount			1	18	1
799	149.00	2021-07-06	primaryAccount			1	20	1
800	78.00	2021-07-06	primaryAccount			1	22	1
801	25.00	2021-07-06	primaryAccount			1	55	1
802	3520.14	2021-07-06	primaryAccount			1	124	1
803	23.94	2021-07-06	expensesAccount			1	43	1
804	12.96	2021-07-07	expensesAccount			1	47	1
805	29.47	2021-07-06	expensesAccount			1	33	1
806	214.34	2021-07-06	expensesAccount			2	32	1
807	41.17	2021-07-06	expensesAccount			2	44	1
808	6.01	2021-07-09	expensesAccount			1	33	1
809	249.49	2021-07-09	expensesAccount			1	87	1
810	3.89	2021-07-12	cash			2	167	1
811	40.00	2021-07-17	cash			2	46	1
812	47.00	2021-07-17	cash			2	46	1
813	70.00	2021-07-01	cash			2	46	1
814	54.00	2021-07-16	cash			2	152	1
815	14.64	2021-07-17	cash			1	87	1
816	49.30	2021-07-17	cash			1	32	1
817	77.36	2021-07-17	cash			2	32	1
818	11.99	2021-07-17	cash			1	44	1
819	10.83	2021-07-17	cash			1	44	1
820	2.88	2021-07-17	cash			1	44	1
821	188.64	2021-07-12	cash			2	25	1
822	63.24	2021-07-15	cash			1	25	1
823	10.67	2021-07-14	cash			2	33	1
824	3.88	2021-07-14	cash			2	33	1
825	31.55	2021-07-17	cash			2	33	1
826	6.46	2021-07-17	cash			2	33	1
827	10.23	2021-07-18	cash			2	33	1
828	682.22	2021-07-12	primaryAccount	3017		2	118	1
829	962.95	2021-07-12	primaryAccount	1003		2	5	1
830	89.85	2021-07-12	primaryAccount			2	99	1
831	1055.69	2021-07-12	primaryAccount	3019		2	5	1
832	1503.54	2021-07-12	primaryAccount	3007	Ponce and Gabriel	2	5	1
833	2643.05	2021-07-12	primaryAccount		2466215	2	29	1
834	472.93	2021-07-12	primaryAccount			2	34	1
835	2000.00	2021-07-12	primaryAccount		cash	2	62	1
836	144.30	2021-07-13	primaryAccount	101		2	103	1
837	559.00	2021-07-13	primaryAccount	102		2	5	1
838	700.00	2021-07-13	primaryAccount			2	169	1
839	700.00	2021-07-13	primaryAccount			2	169	1
840	424.95	2021-07-13	primaryAccount			2	33	1
841	2911.72	2021-07-14	primaryAccount		IMPORTANTE	1	29	1
842	610.00	2021-07-14	primaryAccount			2	168	1
843	2457.08	2021-07-14	primaryAccount		2469738	2	29	1
844	326.50	2021-07-14	primaryAccount	104		2	30	1
845	226.77	2021-07-15	primaryAccount			2	93	1
846	191.80	2021-07-15	primaryAccount			2	35	1
847	93.91	2021-07-15	primaryAccount			2	90	1
848	183.38	2021-07-15	primaryAccount			2	158	1
849	806.59	2021-07-16	primaryAccount	110120		2	101	1
850	810.74	2021-07-16	primaryAccount	110098		2	118	1
851	1975.02	2021-07-16	primaryAccount	110100		2	11	1
852	797.62	2021-07-16	primaryAccount	110114		2	120	1
853	515.08	2021-07-16	primaryAccount	110103		2	116	1
854	475.43	2021-07-16	primaryAccount	110108		2	115	1
855	27.16	2021-07-16	primaryAccount			2	43	1
856	630.50	2021-07-16	primaryAccount	110105		2	170	1
857	788.00	2021-07-15	expensesAccount			1	122	1
858	321.87	2021-07-12	primaryAccount			1	132	1
859	300.00	2021-07-12	primaryAccount		CASH	1	62	1
860	3326.66	2021-07-13	primaryAccount			1	89	1
861	454.71	2021-07-13	primaryAccount			1	89	1
862	310.28	2021-07-13	primaryAccount			1	89	1
863	104.63	2021-07-13	primaryAccount			1	89	1
864	134.20	2021-07-14	primaryAccount			1	63	1
865	125.93	2021-07-14	primaryAccount			1	63	1
866	25.00	2021-07-14	primaryAccount			1	55	1
867	3350.00	2021-07-14	primaryAccount			1	16	1
868	292.33	2021-07-15	primaryAccount			1	171	1
869	400.00	2021-07-16	primaryAccount			1	124	1
870	294.55	2021-07-16	primaryAccount			1	142	1
871	3000.00	2021-07-14	primaryAccount			1	124	1
872	1469.66	2021-07-16	primaryAccount			1	60	1
873	25.00	2021-07-13	primaryAccount			1	55	1
874	1307.56	2021-07-16	primaryAccount			1	14	1
875	3258.06	2021-07-13	primaryAccount			1	124	1
876	1244.74	2021-07-16	primaryAccount			1	14	1
877	52.61	2021-07-12	primaryAccount			1	22	1
878	260.32	2021-07-16	primaryAccount			1	60	1
879	80.95	2021-07-16	primaryAccount			1	14	1
880	264.99	2021-07-16	primaryAccount			1	1	1
881	27.35	2021-07-19	cash			1	48	1
882	14.98	2021-07-19	cash			1	33	1
883	11.90	2021-07-19	cash			2	97	1
884	10.29	2021-07-20	cash			1	33	1
885	35.00	2021-07-21	cash			2	46	1
886	63.24	2021-07-22	cash			1	25	1
887	11.30	2021-07-22	cash			1	33	1
888	211.00	2021-07-23	cash			1	35	1
889	29.15	2021-07-24	cash			1	47	1
892	26.38	2021-07-25	cash			1	33	1
893	17.25	2021-07-25	cash			1	33	1
894	167.44	2021-07-25	cash			1	172	1
895	247.60	2021-07-26	cash			2	25	1
896	237.20	2021-07-26	cash			1	174	1
897	16.53	2021-07-27	cash			1	32	1
898	296.15	2021-07-28	cash			1	24	1
899	13.63	2021-07-28	cash			1	33	1
900	63.24	2021-07-29	cash			1	25	1
901	52.00	2021-07-30	cash			2	173	1
902	33.00	2021-07-30	cash			2	49	1
903	11.52	2021-07-30	cash			2	33	1
904	5.39	2021-07-30	cash			1	47	1
905	293.70	2021-07-31	cash			2	39	1
906	13.65	2021-07-31	cash			1	33	1
907	2.57	2021-07-31	cash			1	47	1
908	21.31	2021-08-01	cash			2	44	1
909	23.09	2021-07-24	cash			2	33	1
910	34.57	2021-07-24	cash			2	51	1
911	20.57	2021-07-24	cash			2	122	1
912	30.00	2021-07-24	cash			2	46	1
913	71.52	2021-07-24	cash			2	33	1
914	115.18	2021-07-26	cash			2	64	1
915	182.65	2021-07-23	primaryAccount			2	181	1
916	162.23	2021-07-23	primaryAccount			2	25	1
917	44.00	2021-07-28	cash			2	46	1
918	81.00	2021-07-29	cash			2	46	1
919	475.00	2021-07-23	primaryAccount			2	119	1
920	39.63	2021-07-22	primaryAccount			2	182	1
921	143.00	2021-07-22	primaryAccount			2	35	1
922	1045.58	2021-07-21	primaryAccount			2	177	1
923	1055.58	2021-07-21	primaryAccount			2	5	1
924	682.40	2021-07-21	primaryAccount			2	117	1
925	2296.62	2021-07-21	primaryAccount			2	29	1
926	35.81	2021-07-21	primaryAccount			2	168	1
927	504.38	2021-07-20	primaryAccount			2	18	1
928	300.24	2021-07-19	primaryAccount			2	106	1
929	526.80	2021-07-19	primaryAccount			2	127	1
930	62.06	2021-07-19	primaryAccount			2	109	1
931	140.00	2021-07-19	primaryAccount			2	107	1
932	49.12	2021-07-19	primaryAccount			2	150	1
933	288.23	2021-07-19	primaryAccount			2	95	1
934	767.74	2021-07-19	primaryAccount			2	176	1
935	850.00	2021-07-19	primaryAccount			2	108	1
936	3132.30	2021-07-19	primaryAccount			2	90	1
937	1877.21	2021-07-19	primaryAccount			2	29	1
938	713.98	2021-07-19	primaryAccount			2	34	1
939	673.04	2021-07-19	primaryAccount			2	66	1
940	250.00	2021-07-19	primaryAccount			2	59	1
941	125.00	2021-07-23	primaryAccount	1236		1	180	1
942	846.79	2021-07-21	primaryAccount			1	29	1
943	439.61	2021-07-20	primaryAccount	1273	insumos bixby	1	175	1
944	744.84	2021-07-20	primaryAccount	563		1	94	1
945	899.19	2021-07-20	primaryAccount	558		1	146	1
946	338.91	2021-07-20	primaryAccount			1	26	1
947	146.30	2021-07-20	primaryAccount			1	28	1
948	500.00	2021-07-19	primaryAccount	1269		1	6	1
949	200.00	2021-07-19	primaryAccount	1237		1	169	1
950	513.11	2021-07-19	primaryAccount	567		1	129	1
951	312.51	2021-07-19	primaryAccount	564		1	9	1
952	303.79	2021-07-19	primaryAccount	562		1	4	1
953	686.53	2021-07-19	primaryAccount	559		1	178	1
954	394.59	2021-07-19	primaryAccount			1	21	1
955	149.00	2021-07-19	primaryAccount			1	20	1
956	112.27	2021-07-19	primaryAccount			1	22	1
957	2355.63	2021-07-19	primaryAccount			1	29	1
958	500.00	2021-07-23	primaryAccount			1	55	1
959	314.59	2021-07-22	primaryAccount			1	124	1
960	402.52	2021-07-21	primaryAccount			1	124	1
961	816.34	2021-07-19	primaryAccount			1	124	1
962	430.30	2021-07-30	primaryAccount	110138		2	183	1
963	673.73	2021-07-30	primaryAccount	110137		2	101	1
964	1045.58	2021-07-30	primaryAccount	110135		2	177	1
965	1055.58	2021-07-30	primaryAccount	110132		2	5	1
966	150.25	2021-07-30	primaryAccount	110125		2	116	1
967	213.76	2021-07-30	primaryAccount	142		2	175	1
968	247.60	2021-07-30	primaryAccount			2	25	1
969	180.00	2021-07-30	primaryAccount			2	184	1
970	3288.66	2021-07-29	primaryAccount			2	90	1
971	3249.50	2021-07-29	primaryAccount			2	90	1
972	852.56	2021-07-29	primaryAccount			2	17	1
973	189.05	2021-07-29	primaryAccount			2	35	1
974	1866.08	2021-07-29	primaryAccount			2	105	1
975	2000.00	2021-07-28	primaryAccount	1101		2	62	1
976	2914.74	2021-07-28	primaryAccount			2	29	1
977	798.58	2021-07-27	primaryAccount	141		2	175	1
978	400.55	2021-07-27	primaryAccount			2	185	1
979	70.00	2021-07-26	primaryAccount	1106		2	118	1
980	150.00	2021-07-26	primaryAccount	1105		2	169	1
981	5909.03	2021-07-26	primaryAccount	1104		2	31	1
982	535.47	2021-07-26	primaryAccount	103		2	24	1
983	1904.14	2021-07-26	primaryAccount			2	29	1
984	539.89	2021-07-26	primaryAccount			2	34	1
985	6.00	2021-07-30	primaryAccount			1	55	1
986	500.00	2021-07-30	primaryAccount	1301		1	146	1
987	79.32	2021-07-30	primaryAccount	1275		1	175	1
988	1276.31	2021-07-30	primaryAccount			1	14	1
989	1244.72	2021-07-30	primaryAccount			1	14	1
990	369.00	2021-07-30	primaryAccount			1	132	1
991	80.95	2021-07-30	primaryAccount			1	14	1
992	78.00	2021-07-30	primaryAccount			1	22	1
1095	13.65	2021-07-31	cash			1	33	1
993	613.85	2021-07-30	primaryAccount			1	66	1
994	300.00	2021-07-28	primaryAccount			1	62	1
995	433.61	2021-07-27	primaryAccount	1274		1	175	1
996	500.00	2021-07-27	primaryAccount			1	179	1
997	335.65	2021-07-26	primaryAccount	1272		1	85	1
998	2318.00	2021-07-26	primaryAccount	1238		1	12	1
999	158.22	2021-07-26	primaryAccount	560		1	171	1
1000	6.00	2021-07-30	primaryAccount			1	55	1
1001	3151.83	2021-07-27	primaryAccount			1	124	1
1002	34.99	2021-07-27	primaryAccount			1	133	1
1003	52.61	2021-07-26	primaryAccount			1	22	1
1004	6.00	2021-07-30	expensesAccount			1	55	1
1005	4.00	2021-07-30	expensesAccount			1	55	1
1006	1.00	2021-07-30	expensesAccount			1	55	1
1007	25.00	2021-07-28	expensesAccount			1	55	1
1008	250.00	2021-07-28	expensesAccount			1	59	1
1009	290.07	2021-07-28	expensesAccount			1	39	1
1010	57.95	2021-07-28	expensesAccount			1	32	1
1011	21.96	2021-07-27	expensesAccount			1	65	1
1012	15.76	2021-07-27	expensesAccount			1	32	1
1013	20.35	2021-08-02	cash			2	44	1
1014	13.88	2021-08-02	cash			2	32	1
1015	87.78	2021-08-02	cash			2	32	1
1016	90.00	2021-08-02	cash			1	9	1
1017	162.08	2021-08-03	cash			1	33	1
1018	25.00	2021-08-04	cash			2	46	1
1019	40.00	2021-08-06	cash			2	46	1
1020	124.36	2021-08-06	cash			2	32	1
1021	12.60	2021-08-07	cash			1	33	1
1022	8.33	2021-08-07	cash			2	33	1
1023	200.00	2021-08-07	cash			2	188	1
1024	28.18	2021-08-08	cash			2	97	1
1025	92.23	2021-08-08	cash			2	39	1
1026	15.44	2021-08-08	cash			2	33	1
1027	500.00	2021-08-02	primaryAccount			1	62	1
1028	222.70	2021-08-02	primaryAccount			1	142	1
1029	664.32	2021-08-03	primaryAccount			2	120	1
1030	657.17	2021-08-06	primaryAccount		Bixby Payroll	1	186	1
1031	383.82	2021-08-06	primaryAccount			1	186	1
1032	1172.22	2021-08-03	primaryAccount			1	15	1
1033	272.44	2021-08-03	primaryAccount			1	15	1
1034	2314.60	2021-08-04	primaryAccount			1	124	1
1035	2768.24	2021-08-02	primaryAccount			1	124	1
1036	1544.66	2021-08-02	primaryAccount			1	124	1
1037	1.75	2021-08-02	primaryAccount			2	55	1
1038	25.00	2021-08-04	primaryAccount			1	55	1
1039	10.00	2021-08-02	primaryAccount			1	55	1
1040	583.33	2021-08-02	primaryAccount			1	6	1
1041	19.81	2021-08-02	primaryAccount			1	6	1
1042	2000.00	2021-08-05	primaryAccount		To Downtown	2	179	1
1043	767.97	2021-08-02	primaryAccount			2	108	1
1044	544.33	2021-08-02	primaryAccount			1	129	1
1045	2000.00	2021-08-06	primaryAccount		checked	2	62	1
1046	149.00	2021-08-06	primaryAccount			1	20	1
1047	391.39	2021-08-04	primaryAccount			1	94	1
1048	507.59	2021-08-03	primaryAccount			2	127	1
1049	610.62	2021-08-05	primaryAccount			1	21	1
1050	885.24	2021-08-05	primaryAccount			2	21	1
1051	615.58	2021-08-02	primaryAccount			2	113	1
1052	57.31	2021-08-02	primaryAccount			2	150	1
1053	149.80	2021-08-02	primaryAccount			2	154	1
1054	360.00	2021-08-04	primaryAccount			2	168	1
1055	845.88	2021-08-02	primaryAccount			1	4	1
1056	239.77	2021-08-02	primaryAccount			1	19	1
1057	0.73	2021-08-02	primaryAccount			1	19	1
1058	3562.50	2021-08-02	primaryAccount			2	136	1
1059	213.90	2021-08-05	primaryAccount			2	35	1
1060	814.30	2021-08-02	primaryAccount			1	139	1
1061	25.00	2021-08-02	primaryAccount			1	187	1
1062	5.00	2021-08-02	primaryAccount			1	187	1
1063	2016.79	2021-08-02	primaryAccount			2	187	1
1064	294.44	2021-08-02	primaryAccount			1	17	1
1065	21.11	2021-08-02	primaryAccount			1	17	1
1066	180.00	2021-08-02	primaryAccount			1	27	1
1067	500.00	2021-08-02	primaryAccount			1	146	1
1068	1003.30	2021-08-02	primaryAccount			1	178	1
1069	620.46	2021-08-02	primaryAccount			2	117	1
1070	238.25	2021-08-02	primaryAccount			1	9	1
1071	2439.33	2021-08-04	primaryAccount			2	29	1
1072	1505.03	2021-08-02	primaryAccount			2	29	1
1073	2490.46	2021-08-02	primaryAccount			1	29	1
1074	394.23	2021-08-02	primaryAccount			2	34	1
1075	97.50	2021-08-06	primaryAccount			2	25	1
1076	706.97	2021-08-02	primaryAccount			2	118	1
1077	1627.00	2021-08-04	primaryAccount			2	30	1
1078	41.63	2021-08-09	cash			2	44	1
1079	211.32	2021-08-09	cash			2	32	1
1080	40.00	2021-08-12	cash			2	46	1
1081	15.00	2021-08-12	cash			2	46	1
1082	25.34	2021-08-12	cash			2	190	1
1083	20.12	2021-08-12	cash			1	33	1
1084	94.05	2021-08-12	cash			1	80	1
1085	63.24	2021-08-12	cash			1	25	1
1086	107.34	2021-08-13	cash			2	43	1
1087	99.15	2021-08-14	cash			2	39	1
1088	54.20	2021-08-14	cash			2	191	1
1089	20.01	2021-08-15	cash			2	33	1
1090	34.73	2021-08-15	cash			2	30	1
1091	100.00	2021-08-04	cash		kike saco plata	1	100	1
1092	10.87	2021-08-05	cash			1	43	1
1093	62.48	2021-08-05	cash			1	25	1
1094	5.39	2021-07-30	cash			1	47	1
1096	2.57	2021-07-31	cash			1	47	1
1097	25.00	2021-08-03	cash			2	46	1
1098	90.00	2021-08-02	cash			1	9	1
1099	200.00	2021-08-18	cash			1	146	1
1100	63.24	2021-08-19	cash			1	25	1
1101	375.11	2021-08-19	cash			1	161	1
1102	19.32	2021-08-19	cash			2	33	1
1103	26.16	2021-08-22	cash			2	32	1
1104	124.00	2021-08-22	cash			2	32	1
1105	40.00	2021-08-22	cash			2	82	1
1106	1045.57	2021-08-13	primaryAccount	110153	CHECK -  -	2	177	1
1107	1055.57	2021-08-13	primaryAccount	110150	CHECK -  -	2	5	1
1108	625.28	2021-08-13	primaryAccount	110149	CHECK -  -	2	127	1
1109	781.99	2021-08-13	primaryAccount	110148	CHECK -  -	2	120	1
1110	29.15	2021-08-13	primaryAccount	110144	CHECK -  -	2	81	1
1111	247.69	2021-08-13	primaryAccount	110142	CHECK -  -	2	116	1
1112	709.34	2021-08-13	primaryAccount	110141	CHECK -  -	2	117	1
1113	969.43	2021-08-13	primaryAccount	110139	CHECK -  -	2	118	1
1114	3420.89	2021-08-13	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1115	3042.61	2021-08-13	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1116	153.97	2021-08-13	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1117	51.70	2021-08-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1118	300.00	2021-08-13	primaryAccount		CASH??? CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
1119	310.45	2021-08-12	primaryAccount		ACH Debit - ACH EFT0812    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1120	1312.65	2021-08-12	primaryAccount		POS Transaction DDA - D/C TRN AMERICAN AIR0012 - FORT WORTH TX REF# 12341	2	189	1
1121	169.47	2021-08-12	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 64687	2	158	1
1122	2000.00	2021-08-12	primaryAccount		CASH ??? CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
1123	2280.32	2021-08-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1124	18.21	2021-08-10	primaryAccount	110127	CHECK -  -	2	81	1
1125	22.69	2021-08-10	primaryAccount	110107	CHECK -  -	2	81	1
1126	140.94	2021-08-10	primaryAccount	2019	CHECK -  -	2	103	1
1127	1136.91	2021-08-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	1
1128	89.85	2021-08-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	1
1129	676.10	2021-08-10	primaryAccount		Transfer to Loan - DOS BANDIDOS BA LLC - PAYMENT PER BLH	2	100	1
1130	700.37	2021-08-09	primaryAccount	110123	CHECK -  -	2	176	1
1131	500.00	2021-08-09	primaryAccount	2015	CHECK -  -	2	146	1
1132	3350.00	2021-08-09	primaryAccount	2014	CHECK -  -	2	16	1
1133	1988.73	2021-08-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1134	729.37	2021-08-09	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
1135	597.04	2021-08-09	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1136	500.91	2021-08-13	primaryAccount	579	CHECK -  -	1	192	1
1137	150.45	2021-08-13	primaryAccount	569	CHECK -  -	1	171	1
1138	1495.54	2021-08-12	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1139	1244.73	2021-08-12	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1140	75.77	2021-08-12	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1141	800.00	2021-08-11	primaryAccount	1239	CHECK -  -	1	189	1
1142	1481.00	2021-08-09	primaryAccount	1303	CHECK -  -	1	30	1
1143	254.15	2021-08-09	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DosBandidos	1	18	1
1144	2519.33	2021-08-09	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
1145	300.00	2021-08-09	primaryAccount		CASH? COUNTER WITHDRAWAL -  -	1	100	1
1146	25.00	2021-08-12	primaryAccount		OD ITEM FEE -  -	1	55	1
1147	2900.87	2021-08-12	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M0876	1	124	1
1148	500.00	2021-08-09	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	55	1
1149	52.61	2021-08-09	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 18011	1	22	1
1150	500.00	2021-08-20	primaryAccount	1307	CASH CHECK -  -	1	189	1
1151	146.30	2021-08-20	primaryAccount		ACH Debit - ACH DRAFTS     BIXBY METRO CHA - Dos Bandidos	1	28	1
1152	14.85	2021-08-19	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JULY 2021	1	55	1
1153	400.89	2021-08-19	primaryAccount		ACH Debit - ACH Payment    ATT -	1	26	1
1154	700.00	2021-08-18	primaryAccount	1306	CHECK -  -	1	193	1
1155	90.85	2021-08-18	primaryAccount	570	CHECK -  -	1	63	1
1156	127.94	2021-08-18	primaryAccount	561	CHECK -  -	1	63	1
1157	586.24	2021-08-17	primaryAccount	584	CHECK -  -	1	186	1
1158	1469.66	2021-08-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
1159	394.59	2021-08-17	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - CARLOS LOPEZ        08	1	21	1
1160	260.32	2021-08-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
1161	3415.52	2021-08-16	primaryAccount	1305	ORDEN INSUMOS CHECK -  -	1	175	1
1162	446.38	2021-08-16	primaryAccount	1304	CHECK -  -	1	12	1
1163	88.00	2021-08-16	primaryAccount	1240	CHECK -  -	1	113	1
1164	913.30	2021-08-16	primaryAccount	585	CHECK -  -	1	129	1
1165	237.78	2021-08-16	primaryAccount	582	CHECK -  -	1	9	1
1166	895.90	2021-08-16	primaryAccount	581	CHECK -  -	1	4	1
1167	981.69	2021-08-16	primaryAccount	578	CHECK -  -	1	178	1
1331	6.00	2021-08-31	primaryAccount		Account Service Charge -  -	1	55	1
1168	264.99	2021-08-16	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN DTV*DIRECTV SERV - 800-347-3288 CA REF# 62569	1	1	1
1169	2590.07	2021-08-16	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M9594	1	124	1
1170	250.00	2021-08-19	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	1	59	1
1171	34.19	2021-08-16	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 46991	1	32	1
1172	162.23	2021-08-20	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1173	2000.00	2021-08-20	primaryAccount		CASH? COUNTER WITHDRAWAL -  -	2	100	1
1174	2000.00	2021-08-20	primaryAccount		CASH? CITYNET TRANSFER- DEBIT - change -	2	100	1
1175	28.80	2021-08-19	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JULY 2021	2	55	1
1176	469.32	2021-08-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	1
1177	250.00	2021-08-19	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	1
1178	205.40	2021-08-19	primaryAccount		ACH Debit - ACH EFT0819    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1179	5000.00	2021-08-19	primaryAccount		BIXBY? CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
1180	619.23	2021-08-18	primaryAccount	110156	CHECK -  -	2	101	1
1181	2160.89	2021-08-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1182	8.84	2021-08-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	1
1183	33.16	2021-08-17	primaryAccount	110133	CHECK -  -	2	182	1
1184	182.65	2021-08-17	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	1
1185	130.20	2021-08-17	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	1
1186	409.95	2021-08-16	primaryAccount	110157	CHECK -  -	2	183	1
1187	568.77	2021-08-16	primaryAccount	110152	CHECK -  -	2	113	1
1188	78.40	2021-08-16	primaryAccount	110147	CHECK -  -	2	154	1
1189	767.98	2021-08-16	primaryAccount	110146	CHECK -  -	2	108	1
1190	607.75	2021-08-16	primaryAccount	110140	CHECK -  -	2	176	1
1191	318.05	2021-08-16	primaryAccount	143	CHECK -  -	2	12	1
1192	2119.09	2021-08-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1193	554.70	2021-08-16	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1194	150.00	2021-08-16	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*ADILENE - 8774174551 CA REF# 5963	2	189	1
1195	2000.00	2021-08-16	primaryAccount		CASH? COUNTER WITHDRAWAL -  -	2	100	1
1196	2700.00	2021-08-16	primaryAccount		BIXBY? CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
1197	654.30	2021-08-16	primaryAccount		??? Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	100	1
1198	1.00	2021-08-18	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #8263 - TULSA OK REF# 191775	2	32	1
1199	70.00	2021-08-16	expensesAccount		POS Transaction DDA - D/C TRN QT 5 OUTSIDE - TULSA OK REF# 909401	2	97	1
1200	28.18	2021-08-23	cash			2	39	1
1201	40.00	2021-08-23	cash			2	46	1
1202	206.89	2021-08-25	cash			1	24	1
1203	45.70	2021-08-26	cash			1	80	1
1204	63.24	2021-08-26	cash			1	25	1
1205	250.00	2021-08-26	cash			1	194	1
1206	60.28	2021-08-27	cash			2	33	1
1207	11.39	2021-08-29	cash			2	160	1
1208	192.14	2021-08-31	cash		sin factura	2	32	1
1209	18.39	2021-09-02	cash			2	39	1
1210	40.00	2021-09-03	cash		floor fan	2	195	1
1211	46.32	2021-09-03	cash			2	51	1
1212	6.60	2021-09-03	cash			2	33	1
1213	114.29	2021-09-03	cash			2	39	1
1214	114.34	2021-09-04	cash			2	39	1
1215	21.14	2021-09-04	cash			2	92	1
1216	75.92	2021-08-10	cash			2	51	1
1217	31.00	2021-08-10	cash			2	46	1
1218	53.00	2021-09-01	cash			2	46	1
1310	25.00	2021-09-03	primaryAccount		OD ITEM FEE -  -	1	55	1
1311	1358.47	2021-09-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M8560	1	124	1
1312	25.00	2021-09-02	primaryAccount		OD ITEM FEE -  -	1	55	1
1313	2810.29	2021-09-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M5648	1	124	1
1314	6.00	2021-08-31	primaryAccount		Account Service Charge -  -	1	55	1
1315	10.00	2021-08-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	1	55	1
1316	34.99	2021-08-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	1	133	1
1317	3336.68	2021-08-26	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M1914	1	124	1
1318	2357.99	2021-08-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M6202	1	124	1
1319	98.93	2021-08-23	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 58211	1	22	1
1320	6.00	2021-08-31	expensesAccount		Account Service Charge -  -	1	55	1
1321	4.00	2021-08-31	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	1	55	1
1322	25.00	2021-09-02	primaryAccount	1313	OD ITEM FEE -  -	1	55	1
1323	1529.50	2021-09-02	primaryAccount	1313	CHECK -  -	1	12	1
1324	822.15	2021-09-02	primaryAccount		ACH Debit - ACH MERCH FEES BNKCD SETTLE - DOS BANDIDOS BIXBY	1	187	1
1325	28.34	2021-09-02	primaryAccount		ACH Debit - ACH MERCH FEES BEYOND - DOS BANDIDOS BIXBY	1	139	1
1326	81.80	2021-09-01	primaryAccount	591	CHECK -  -	1	196	1
1327	1167.50	2021-09-01	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
1328	255.96	2021-09-01	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
1329	180.00	2021-09-01	primaryAccount		ACH Debit - ACH LEASE PYMT ICE MAKER SALES - DOS BANDIDO'S	1	27	1
1330	239.77	2021-09-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN LAVU.COM - HTTPSLAVU.COM NM REF# 78882	1	19	1
1332	255.36	2021-08-31	primaryAccount	593	CHECK -  -	1	186	1
1333	867.66	2021-08-31	primaryAccount	590	CHECK -  -	1	4	1
1334	302.03	2021-08-31	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
1335	21.10	2021-08-31	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
1336	2520.00	2021-08-30	primaryAccount	1312	FOOD ORDER	1	146	1
1337	334.33	2021-08-30	primaryAccount	1311	CHECK -  -	1	175	1
1338	596.05	2021-08-30	primaryAccount	594	CHECK -  -	1	129	1
1339	136.75	2021-08-30	primaryAccount	592	CHECK -  -	1	9	1
1340	396.72	2021-08-30	primaryAccount	588	CHECK -  -	1	197	1
1341	952.26	2021-08-30	primaryAccount	586	CHECK -  -	1	178	1
1342	371.00	2021-08-30	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	1
1343	78.00	2021-08-30	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 78373	1	22	1
1344	800.00	2021-08-27	primaryAccount	1310	CHECK -  -	1	146	1
1345	557.26	2021-08-27	primaryAccount	587	CHECK -  -	1	192	1
1346	1322.48	2021-08-27	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1347	1244.72	2021-08-27	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1348	78.36	2021-08-27	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1349	422.33	2021-08-24	primaryAccount	1309	CHECK -  -	1	175	1
1350	2105.00	2021-08-23	primaryAccount	1308	CHECK -  -	1	29	1
1351	211.42	2021-08-23	primaryAccount	580	CHECK -  -	1	171	1
1352	6.00	2021-08-31	expensesAccount		Account Service Charge -  -	2	55	1
1353	4.00	2021-08-31	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
1354	2000.00	2021-08-30	expensesAccount		COUNTER WITHDRAWAL -  -	2	100	1
1355	624.19	2021-09-03	primaryAccount	110169	CHECK -  -	2	127	1
1356	370.00	2021-09-03	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	1
1357	97.50	2021-09-03	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1358	2500.00	2021-09-03	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 20753	2	31	1
1359	1861.77	2021-09-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	1
1360	298.40	2021-09-02	primaryAccount		ACH Debit - ACH EFT0902    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1361	37.93	2021-09-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1362	26.18	2021-09-01	primaryAccount	110155	CHECK -  -	2	140	1
1363	3562.50	2021-09-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	1
1364	2837.34	2021-09-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1365	500.00	2021-09-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
1366	62.57	2021-08-31	primaryAccount	110176	CHECK -  -	2	183	1
1367	28.87	2021-08-31	primaryAccount	905	CHECK -  -	2	182	1
1368	140.94	2021-08-31	primaryAccount	148	CHECK -  -	2	103	1
1369	573.45	2021-08-31	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	1
1370	759.34	2021-08-30	primaryAccount	7110160	CHECK -  -	2	176	1
1371	627.17	2021-08-30	primaryAccount	110171	CHECK -  -	2	113	1
1372	896.90	2021-08-30	primaryAccount	110168	CHECK -  -	2	120	1
1373	120.69	2021-08-30	primaryAccount	110162	CHECK -  -	2	116	1
1374	346.22	2021-08-30	primaryAccount	110161	CHECK -  -	2	117	1
1375	915.29	2021-08-30	primaryAccount	110159	CHECK -  -	2	118	1
1376	767.98	2021-08-30	primaryAccount	146	CHECK -  -	2	108	1
1377	2088.71	2021-08-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1378	925.86	2021-08-30	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
1379	489.33	2021-08-30	primaryAccount		ACH Debit - ACH SGWSOK3    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1380	1000.00	2021-08-30	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*AUSTIN - 8774174551 CA REF# 55961	2	100	1
1381	518.17	2021-08-27	primaryAccount	110175	CHECK -  -	2	101	1
1382	1045.58	2021-08-27	primaryAccount	110172	CHECK -  -	2	177	1
1383	1055.58	2021-08-27	primaryAccount	110170	CHECK -  -	2	5	1
1384	25.10	2021-08-27	primaryAccount	110164	CHECK -  -	2	81	1
1385	238.10	2021-08-27	primaryAccount	150	CHECK -  -	2	175	1
1386	292.32	2021-08-27	primaryAccount	149	CHECK -  -	2	175	1
1387	2908.08	2021-08-27	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1388	2852.18	2021-08-27	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1389	97.50	2021-08-27	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1390	44.76	2021-08-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1391	64.00	2021-08-26	primaryAccount		ACH Debit - ACH EFT0826    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1392	1300.00	2021-08-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
1393	2198.26	2021-08-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1394	30.21	2021-08-24	primaryAccount	110121	CHECK -  -	2	159	1
1395	500.00	2021-08-24	primaryAccount	145	CHECK -  - A PONCE?	2	5	1
1396	600.00	2021-08-24	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*XIMENA - 8774174551 CA REF# 38808	2	100	1
1397	790.34	2021-08-23	primaryAccount	2020	CHECK -  -	2	24	1
1398	1799.39	2021-08-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1399	605.77	2021-08-23	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1549	200.00	2021-09-17	primaryAccount	1241	CHECK -  -	1	146	1
1400	2400.00	2021-08-23	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	1
1401	6.00	2021-08-31	expensesAccount		Account Service Charge -  -	2	55	1
1402	4.00	2021-08-31	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
1403	2000.00	2021-08-30	expensesAccount		COUNTER WITHDRAWAL -  -	2	100	1
1606	25.70	2021-09-25	cash			1	46	1
1404	1.00	2021-08-18	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #8263 - TULSA OK REF# 191775	2	32	1
1405	70.00	2021-08-16	expensesAccount		POS Transaction DDA - D/C TRN QT 5 OUTSIDE - TULSA OK REF# 909401	2	97	1
1406	2000.00	2021-08-12	expensesAccount		COUNTER WITHDRAWAL -  -	2	100	1
1407	6.00	2021-07-30	expensesAccount		Account Service Charge -  -	2	55	1
1408	4.00	2021-07-30	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
1409	1.00	2021-07-30	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #6342 - TULSA OK REF# 65977	2	32	1
1410	289.58	2021-07-27	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 204991	2	32	1
1411	33.29	2021-07-27	expensesAccount		POS Transaction DDA - D/C TRN LAS AMERICAS SUP - TULSA OK REF# 240436	2	65	1
1412	42.22	2021-07-21	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 12422	2	39	1
1413	1.00	2021-07-20	expensesAccount		ATM Service Charge - ATM D/F B &amp; B LIQUOR WAR - TULSA OK REF# 747875	2	39	1
1414	65.98	2021-07-20	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 33805	2	32	1
1415	6.00	2021-06-30	expensesAccount		Account Service Charge -  -	2	55	1
1416	4.00	2021-06-30	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
1417	88.41	2021-06-22	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 532	2	44	1
1418	48.28	2021-06-22	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 865965	2	32	1
1419	150.00	2021-06-18	expensesAccount		POS Transaction DDA - D/C TRN THE HOME DEPOT # - TULSA OK REF# 121	2	93	1
1420	1.00	2021-06-17	expensesAccount		ATM Service Charge - ATM D/F THE HOME DEPOT # - TULSA OK REF# 597801	2	93	1
1421	92.84	2021-06-15	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 413203	2	32	1
1422	86.86	2021-06-15	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 247520	2	51	1
1423	1.00	2021-06-07	expensesAccount		ATM Service Charge - ATM D/F SAM'S Club - TULSA OK REF# 1959	2	32	1
1424	1.00	2021-06-01	expensesAccount		ATM Service Charge - ATM D/F SAM'S Club - TULSA OK REF# 17754	2	32	1
1425	79.06	2021-06-01	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 2129	2	32	1
1426	4.00	2021-05-28	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
1427	1.00	2021-05-25	expensesAccount		ATM Service Charge - ATM D/F SAMS CLUB #8263 - TULSA OK REF# 51435	2	32	1
1428	1.00	2021-05-21	expensesAccount		ATM Service Charge - ATM D/F WAL-MART #0894 - TULSA OK REF# 46074	2	33	1
1429	1.00	2021-05-21	expensesAccount		ATM Service Charge - ATM D/F Wal-Mart Super C - TULSA OK REF# 717724	2	33	1
1430	1.00	2021-05-21	expensesAccount		ATM Service Charge - ATM D/F WAL-MART #0894 - TULSA OK REF# 906549	2	33	1
1431	25.00	2021-07-09	cash			2	46	1
1432	63.75	2021-09-09	cash			1	25	1
1433	33.62	2021-09-09	cash			2	198	1
1434	60.00	2021-09-10	cash			2	200	1
1435	32.50	2021-09-11	cash			2	39	1
1436	20.57	2021-09-11	cash			1	32	1
1437	8.05	2021-09-11	cash			1	33	1
1438	22.41	2021-09-12	cash			2	33	1
1439	3.88	2021-09-12	cash			2	33	1
1440	243.88	2021-09-12	cash			2	32	1
1441	77.52	2021-09-12	cash			2	32	1
1442	10.00	2021-09-12	cash			2	162	1
1443	60.00	2021-09-12	cash			2	200	1
1444	20.37	2021-09-14	cash			2	39	1
1445	63.75	2021-09-16	cash			1	25	1
1446	106.61	2021-09-17	cash			1	80	1
1447	41.15	2021-09-18	cash			1	32	1
1448	110.21	2021-09-18	cash			1	33	1
1449	74.80	2021-09-18	cash			2	96	1
1450	40.72	2021-09-19	cash			2	160	1
1451	9.86	2021-09-19	cash			2	162	1
1452	60.62	2021-09-20	cash			1	199	1
1453	357.93	2021-09-20	cash			1	87	1
1454	20.00	2021-09-20	cash		gas money	1	146	1
1455	72.00	2021-09-20	cash			2	46	1
1456	11.18	2021-09-21	cash			2	93	1
1457	49.18	2021-09-21	cash			2	32	1
1458	45.52	2021-09-21	cash			2	44	1
1459	180.00	2021-09-22	cash			2	200	1
1460	20.63	2021-09-23	cash			1	43	1
1461	785.03	2021-09-21	cash			1	29	1
1462	124.97	2021-09-23	cash			2	98	1
1463	448.68	2021-09-24	cash			1	24	1
1464	58.66	2021-09-24	cash			1	32	1
1465	70.00	2021-09-24	cash			2	95	1
1466	37.00	2021-09-24	cash			2	98	1
1467	4.00	2021-09-24	cash			2	157	1
1468	2000.00	2021-09-08	expensesAccount		COUNTER WITHDRAWAL -  -	2	62	1
1469	855.93	2021-09-24	primaryAccount	990009	CHECK -  -	2	117	1
1470	1045.58	2021-09-24	primaryAccount	110209	CHECK -  -	2	177	1
1471	1055.58	2021-09-24	primaryAccount	110206	CHECK -  -	2	5	1
1472	30.90	2021-09-24	primaryAccount	110201	CHECK -  -	2	81	1
1473	682.87	2021-09-24	primaryAccount	905	CHECK -  -	2	120	1
1474	3564.05	2021-09-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1607	6.50	2021-09-25	cash			1	47	1
1475	3044.73	2021-09-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1476	760.08	2021-09-24	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BA, LLC	2	21	1
1477	97.50	2021-09-24	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1550	122.46	2021-09-17	primaryAccount	599	CHECK -  -	1	201	1
1478	150.00	2021-09-24	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*ADILENE - 8774174551 CA REF# 31930	2	189	1
1479	85.95	2021-09-23	primaryAccount		ACH Debit - ACH EFT0923    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
3469	34.00	2022-04-08	cash			2	251	17
1481	2136.16	2021-09-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1483	41.36	2021-09-21	primaryAccount	110177	CHECK -  - Noah Watkins	2	206	1
1484	45.87	2021-09-21	primaryAccount	110158	CHECK -  - noah wat	2	206	1
1485	140.37	2021-09-20	primaryAccount	110186	CHECK -  -	2	154	1
1486	2299.44	2021-09-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1487	500.86	2021-09-20	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
1488	469.32	2021-09-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	1
1489	272.63	2021-09-20	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1490	250.00	2021-09-20	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	1
1492	218.68	2021-09-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1493	2000.00	2021-09-17	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
1494	184.05	2021-09-16	primaryAccount		ACH Debit - ACH EFT0916    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1495	143.21	2021-09-16	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 8158	2	158	1
1497	34.13	2021-09-15	primaryAccount	110194	CHECK -  - Mikyla Smith	2	205	1
1498	448.43	2021-09-15	primaryAccount	110188	CHECK -  -	2	127	1
3598	21.12	2022-05-03	cash			2	44	17
3599	6.67	2022-05-03	cash			2	44	17
1499	2246.02	2021-09-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1500	182.65	2021-09-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	1
1501	699.84	2021-09-14	primaryAccount	110178	CHECK -  -	2	176	1
1502	1045.58	2021-09-13	primaryAccount	110192	CHECK -  -	2	177	1
1503	1055.58	2021-09-13	primaryAccount	110189	CHECK -  -	2	5	1
1504	905.77	2021-09-13	primaryAccount	110187	CHECK -  -	2	120	1
1505	18.66	2021-09-13	primaryAccount	110182	CHECK -  -	2	81	1
1506	330.60	2021-09-13	primaryAccount	154	CHECK -  -	2	175	1
1507	834.82	2021-09-13	primaryAccount	152	CHECK -  -	2	118	1
1508	1892.50	2021-09-13	primaryAccount	151	CHECK -  -	2	30	1
1509	930.61	2021-09-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1510	568.10	2021-09-13	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1511	411.57	2021-09-10	primaryAccount	110195	CHECK -  -	2	101	1
1512	23.10	2021-09-10	primaryAccount	110193	CHECK -  - Trevor Sigmon	2	203	1
1513	367.34	2021-09-10	primaryAccount	110191	CHECK -  - juan carlos rivera	2	204	1
1514	637.06	2021-09-10	primaryAccount	110190	CHECK -  -	2	113	1
1515	767.97	2021-09-10	primaryAccount	110184	CHECK -  -	2	108	1
1516	29.82	2021-09-10	primaryAccount	110181	CHECK -  -	2	150	1
1517	896.44	2021-09-10	primaryAccount	110180	CHECK -  -	2	117	1
1518	97.50	2021-09-10	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1519	89.85	2021-09-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	1
1520	3053.07	2021-09-09	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1521	2875.71	2021-09-09	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1522	20.70	2021-09-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH ON AUGUST 2021	2	55	1
1523	1600.02	2021-09-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1524	1263.55	2021-09-08	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	1
1525	326.90	2021-09-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	1
1527	400.00	2021-09-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - To downtown	2	179	1
1531	42.94	2021-09-07	primaryAccount	110136	CHECK -  -	2	140	1
1532	500.00	2021-09-07	primaryAccount	153	CHECK -  - Jason Walters	2	202	1
1533	2150.63	2021-09-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1534	427.07	2021-09-07	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1535	2500.00	2021-09-07	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 88277	2	31	1
1530	34.63	2021-09-07	primaryAccount	110163	CHECK -  -	2	150	1
1539	800.00	2021-09-24	primaryAccount	1321	CHECK -  -	1	146	1
1540	1182.76	2021-09-24	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1541	499.27	2021-09-24	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1542	80.95	2021-09-24	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1543	580.51	2021-09-22	primaryAccount	1320	CHECK -  -	1	175	1
1544	256.32	2021-09-20	primaryAccount	1242	CHECK -  -	1	201	1
1545	146.46	2021-09-20	primaryAccount	598	CHECK -  -	1	171	1
1546	144.18	2021-09-20	primaryAccount	589	CHECK -  -	1	171	1
1547	146.30	2021-09-20	primaryAccount		ACH Debit - ACH DRAFTS     BIXBY METRO CHA - Dos Bandidos	1	28	1
1491	5.84	2021-09-20	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	1
1551	394.59	2021-09-17	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - CARLOS LOPEZ	1	21	1
1482	1643.85	2021-09-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	1
1548	3000.00	2021-09-20	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
1552	25.00	2021-09-16	primaryAccount	1317	OD ITEM FEE -  -	1	55	1
1553	1296.50	2021-09-16	primaryAccount	1317	CHECK -  -	1	30	1
1554	583.31	2021-09-16	primaryAccount	600	CHECK -  -	1	4	1
1555	1469.66	2021-09-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
1556	260.32	2021-09-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
1557	58.95	2021-09-16	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 38721	1	22	1
1558	264.99	2021-09-15	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN DTV*DIRECTV SERV - 800-347-3288 CA REF# 24828	1	1	1
1559	172.64	2021-09-14	primaryAccount	601	CHECK -  -	1	196	1
1560	266.53	2021-09-14	primaryAccount	597	CHECK -  -	1	197	1
1561	112.73	2021-09-13	primaryAccount	1319	CHECK -  -	1	175	1
1562	800.00	2021-09-13	primaryAccount	1318	CHECK -  -	1	146	1
1563	581.98	2021-09-13	primaryAccount	604	CHECK -  -	1	129	1
1564	127.71	2021-09-13	primaryAccount	602	CHECK -  -	1	9	1
1565	931.06	2021-09-13	primaryAccount	596	CHECK -  -	1	178	1
1566	2614.04	2021-09-13	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
1568	1744.72	2021-09-09	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1569	1227.15	2021-09-09	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1570	190.00	2021-09-09	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DosBandidos	1	18	1
1571	83.54	2021-09-09	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
1572	11.25	2021-09-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH ON AUGUST 2021	1	55	1
1573	3350.00	2021-09-08	primaryAccount	1314	CHECK -  -	1	16	1
1574	610.58	2021-09-08	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BIXBY	1	21	1
1575	1868.71	2021-09-07	primaryAccount	1316	CHECK -  -	1	146	1
1576	311.19	2021-09-07	primaryAccount	1315	CHECK -  -	1	175	1
1577	149.00	2021-09-07	primaryAccount		ACH Debit - ACH CHOWNOW, I CHOWNOW, INC. - DOS BANDIDOS BIXBY LLC	1	20	1
1578	106.00	2021-09-23	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	55	1
1579	127.23	2021-09-23	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 58813	1	22	1
1580	758.96	2021-09-22	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M8914	1	124	1
1581	20.00	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* GUEST RIDE - HTTPSBIRD.CO CA REF# 83533	1	189	1
1582	20.00	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* GUEST RIDE - HTTPSBIRD.CO CA REF# 40011	1	189	1
1583	20.00	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* GUEST RIDE - HTTPSBIRD.CO CA REF# 9207	1	189	1
1584	20.00	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* RIDE - HTTPSBIRD.CO CA REF# 98988	1	189	1
1585	4.38	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* HOLD GUEST - HTTPSBIRD.CO CA REF# 96349	1	189	1
1586	3.00	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* TEMP HOLD - HTTPSBIRD.CO CA REF# 73709	1	189	1
1587	1.59	2021-09-13	primaryAccount		POS Transaction DDA - D/C TRN BIRD* HOLD GUEST - HTTPSBIRD.CO CA REF# 74776	1	189	1
1588	52.61	2021-09-09	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 18599	1	22	1
1589	2452.63	2021-09-08	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M9164	1	124	1
1590	1.00	2021-09-07	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 413175	1	55	1
1529	165.68	2021-09-07	primaryAccount	110167	CHECK -  -	2	154	1
1537	3000.00	2021-09-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - to downtown	2	179	1
1528	26.36	2021-09-07	primaryAccount	110174	CHECK -  -	2	140	1
1592	5.11	2021-09-06	cash			1	48	1
1593	31.00	2021-09-07	cash			1	43	1
1594	247.19	2021-09-08	cash			1	87	1
1595	20.43	2021-09-07	cash			1	48	1
1596	183.28	2021-09-07	cash			1	29	1
1597	97.50	2021-09-06	cash			1	102	1
1598	39.14	2021-09-06	cash			1	48	1
1599	45.66	2021-09-12	cash			1	33	1
1600	11.74	2021-09-12	cash			1	43	1
1601	213.00	2021-09-13	cash			1	207	1
1602	58.66	2021-09-24	cash			1	32	1
1603	448.68	2021-09-24	cash			1	24	1
1604	20.63	2021-09-23	cash			1	43	1
1605	63.75	2021-09-23	cash			1	25	1
1608	4.34	2021-09-25	cash			2	92	1
1609	43.19	2021-09-27	cash			2	49	1
1610	24.39	2021-09-27	cash			2	33	1
1611	80.00	2021-09-27	cash			2	46	1
1612	21.76	2021-09-27	cash			1	208	1
1613	151.80	2021-09-28	cash			1	131	1
1614	63.75	2021-09-30	cash			1	25	1
1615	8.68	2021-09-30	cash			1	92	1
2065	32.39	2021-10-13	cash			2	49	1
1618	10.35	2021-10-02	cash			1	33	1
1619	86.80	2021-10-01	cash			1	209	1
1620	40.13	2021-10-02	cash			1	32	1
1621	3.76	2021-10-02	cash			1	47	1
1622	86.67	2021-10-02	cash			2	39	1
1623	200.00	2021-10-02	cash			2	5	1
1624	7.69	2021-10-03	cash			1	47	1
1625	123.62	2021-10-04	cash			2	33	1
1626	32.42	2021-10-06	cash			1	199	1
1627	45.70	2021-10-07	cash			1	80	1
1628	63.75	2021-10-07	cash			1	25	1
1629	9.12	2021-10-08	cash			1	33	1
1630	43.55	2021-10-08	cash			1	47	1
1538	500.00	2021-09-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	189	1
1567	734.87	2021-09-13	primaryAccount		COUNTER WITHDRAWAL -  -	1	161	1
2068	63.82	2021-10-15	cash			2	32	1
1631	122.00	2021-10-07	cash			2	46	1
1632	7.86	2021-10-07	cash			2	92	1
1633	67.00	2021-10-08	cash			2	120	1
1634	65.00	2021-10-08	cash			2	46	1
1635	11.39	2021-10-08	cash			2	160	1
1636	59.01	2021-10-08	cash			2	210	1
1637	90.71	2021-10-09	cash			2	32	1
1638	32.26	2021-10-09	cash			2	33	1
1639	36.00	2021-10-09	cash			2	211	1
1640	36.00	2021-10-09	cash			2	46	1
1641	66.29	2021-10-10	cash			2	44	1
1642	10.00	2021-10-13	cash			1	48	1
1643	86.73	2021-10-13	cash			1	212	1
1644	39.04	2021-10-13	cash			1	212	1
1645	48.77	2021-10-13	cash			1	33	1
1646	30.46	2021-10-13	cash			1	199	1
1647	37.00	2021-10-14	cash			1	43	1
1648	63.75	2021-10-14	cash			1	25	1
1649	100.00	2021-10-15	cash			1	146	1
1650	68.38	2021-10-15	cash			1	32	1
1651	30.00	2021-10-16	cash		gas money	1	188	1
1652	10.00	2021-10-17	cash		gas money	1	188	1
1892	182.65	2021-10-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	1
1893	162.60	2021-10-15	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1895	56.30	2021-10-14	primaryAccount		ACH Debit - ACH EFT1014    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1896	40.15	2021-10-14	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1898	145.78	2021-10-14	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 56318	2	158	1
3601	12.72	2022-05-04	cash			2	92	17
3602	20.00	2022-05-06	cash			2	235	17
3603	37.89	2022-05-06	cash			2	39	17
1907	1936.67	2021-10-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1903	858.00	2021-10-13	primaryAccount	1107	ACH Debit - ACH PAYMENT     US TREASURY - CK# 1107	2	89	1
1890	279.54	2021-10-15	primaryAccount	110223	CHECK -  -	2	204	1
1900	29.23	2021-10-13	primaryAccount	110227	CHECK -  -	2	206	1
1894	17.27	2021-10-14	primaryAccount	110101	CHECK -  - georgia	2	219	1
1908	640.91	2021-10-12	primaryAccount	110222	CHECK -  -	2	113	1
1909	719.61	2021-10-12	primaryAccount	110220	CHECK -  -	2	120	1
1902	300.00	2021-10-13	primaryAccount	1104	CHECK -  - richard stewart	2	220	1
1901	28.40	2021-10-13	primaryAccount	110226	CHECK -  -	2	205	1
1891	717.50	2021-10-15	primaryAccount	110213	CHECK -  -	2	176	1
1913	1261.39	2021-10-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1914	89.85	2021-10-12	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	1
1922	3582.29	2021-10-08	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1923	2962.95	2021-10-08	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
1924	1271.09	2021-10-08	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	1
1925	379.51	2021-10-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	1
1926	260.00	2021-10-08	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	1
1927	102.95	2021-10-08	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1930	201.30	2021-10-07	primaryAccount		ACH Debit - ACH EFT1007    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1931	37.41	2021-10-07	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
1933	2489.71	2021-10-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1934	15.75	2021-10-05	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF SEPT 2021	2	55	1
1936	1.75	2021-10-04	primaryAccount		ATM Transaction Charge - ATM FEE 4187 EAST 66 STREET - NORTH TULSA OK REF# 902866	2	55	1
1939	1805.07	2021-10-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1940	1598.78	2021-10-04	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	1
1951	6.00	2021-09-30	primaryAccount		Account Service Charge -  -	2	55	1
1952	64.00	2021-09-30	primaryAccount		ACH Debit - ACH EFT0930    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
1956	1316.95	2021-09-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1957	27.09	2021-09-29	primaryAccount		POS Transaction DDA - D/C TRN LOWE'S #1536 - BROKEN ARROW OK REF# 473936	2	43	1
1958	1.75	2021-09-28	primaryAccount		ATM Transaction Charge - ATM FEE 10202 N Cincinnati - Sperry OK REF# 877523	2	55	1
1962	723.80	2021-09-28	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1963	402.05	2021-09-28	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	1
1964	174.00	2021-09-28	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	1
1899	2000.00	2021-10-14	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
1947	361.54	2021-10-01	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
1948	201.88	2021-10-01	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
1897	1000.00	2021-10-14	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*PAUL JO - 8774174551 CA REF# 33762	2	221	1
2066	92.86	2021-10-13	cash			2	33	1
2067	7.32	2021-10-15	cash			2	92	1
2069	55.00	2021-10-15	cash			2	46	1
1973	2819.65	2021-09-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
1966	603.52	2021-09-27	primaryAccount	110208	CHECK -  -	2	204	1
1970	725.92	2021-09-27	primaryAccount	110198	CHECK -  -	2	176	1
1969	61.46	2021-09-27	primaryAccount	110200	CHECK -  -	2	150	1
1959	22.14	2021-09-28	primaryAccount	110210	CHECK -  -	2	205	1
1960	1174.00	2021-09-28	primaryAccount	1108	CHECK -  -	2	30	1
1954	26.28	2021-09-29	primaryAccount	110211	CHECK -  -	2	206	1
1953	204.47	2021-09-30	primaryAccount		POS Transaction DDA - D/C TRN FEDEX OFFIC57900 - BROKEN ARROW OK REF# 62923	2	64	1
1938	13.27	2021-10-04	primaryAccount	110112	CHECK -  -	2	82	1
1937	14.94	2021-10-04	primaryAccount	110203	CHECK -  -	2	82	1
1929	36.00	2021-10-07	primaryAccount	1106	CHECK -  -	2	217	1
1920	817.35	2021-10-08	primaryAccount	110215	CHECK -  -	2	117	1
1971	370.91	2021-09-27	primaryAccount	1105	CHECK -  -	2	215	1
1972	3500.00	2021-09-27	primaryAccount	1101	CHECK -  -	2	214	1
1904	5854.97	2021-10-13	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
1906	2370.78	2021-10-13	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
1955	2132.77	2021-09-29	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
1961	600.00	2021-09-28	primaryAccount	1102	CHECK -  -	2	216	1
1919	534.04	2021-10-08	primaryAccount	110216	CHECK -  -	2	217	1
1916	1045.58	2021-10-08	primaryAccount	110224	CHECK -  -	2	177	1
1917	1055.58	2021-10-08	primaryAccount	110221	CHECK -  -	2	5	1
1918	12.39	2021-10-08	primaryAccount	110217	CHECK -  -	2	81	1
1921	856.84	2021-10-08	primaryAccount	110212	CHECK -  -	2	118	1
1912	493.00	2021-10-12	primaryAccount	1103	CHECK -  -	2	89	1
1910	15.07	2021-10-12	primaryAccount	110219	CHECK -  -	2	82	1
1911	527.53	2021-10-12	primaryAccount	110214	CHECK -  -	2	177	1
1944	2000.00	2021-10-04	primaryAccount	sent to expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	189	1
1965	22.99	2021-09-28	primaryAccount		ATM - Withdrawal - DDA - ATM W/D 10202 N Cincinnati - Sperry OK REF# 877523	2	189	1
1978	6.00	2021-09-30	expensesAccount		Account Service Charge -  -	2	55	1
1979	4.00	2021-09-30	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
1982	6.00	2021-09-30	expensesAccount		Account Service Charge -  -	1	55	1
1983	4.00	2021-09-30	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	1	55	1
1984	264.99	2021-10-15	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN DTV*DIRECTV SERV - 800-347-3288 CA REF# 83595	1	1	1
1989	52.66	2021-10-14	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 29303	1	22	1
1993	2717.00	2021-10-13	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
1994	2714.95	2021-10-13	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
1995	354.52	2021-10-13	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2001	190.00	2021-10-12	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DosBandidos	1	18	1
2004	1822.67	2021-10-08	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2005	1224.31	2021-10-08	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2006	80.95	2021-10-08	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2008	149.00	2021-10-06	primaryAccount		ACH Debit - ACH CHOWNOW, I CHOWNOW, INC. - DOS BANDIDOS BIXBY LLC	1	20	1
4743	23.71	2022-10-21	cash			2	44	17
2009	0.45	2021-10-05	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF SEPT 2021	1	55	1
2010	610.58	2021-10-05	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BIXBY	1	21	1
2011	1.00	2021-10-04	primaryAccount		ATM Service Charge - ATM D/F LAVU.COM - +18664910510 NM REF# 472544	1	19	1
2012	1.00	2021-10-04	primaryAccount		ATM Service Charge - ATM D/F LAVU.COM - +18664910510 NM REF# 658280	1	19	1
2013	795.76	2021-10-04	primaryAccount		ACH Debit - ACH MERCH FEES BNKCD SETTLE - DOS BANDIDOS BIXBY	1	187	1
2014	25.09	2021-10-04	primaryAccount		ACH Debit - ACH MERCH FEES BEYOND - DOS BANDIDOS BIXBY	1	139	1
2015	241.29	2021-10-04	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN LAVU.COM - HTTPSLAVU.COM NM REF# 52881	1	19	1
2016	78.00	2021-10-04	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 89053	1	22	1
2018	1.00	2021-10-01	primaryAccount		ATM Service Charge - ATM D/F LAVU.COM - +18664910510 NM REF# 320967	1	19	1
2019	25.00	2021-10-01	primaryAccount		OD ITEM FEE -  -	1	55	1
2020	1084.15	2021-10-01	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
2021	25.00	2021-10-01	primaryAccount		OD ITEM FEE -  -	1	55	1
2022	321.84	2021-10-01	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
2023	314.62	2021-10-01	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
2024	180.00	2021-10-01	primaryAccount		ACH Debit - ACH LEASE PYMT ICE MAKER SALES - DOS BANDIDO'S	1	27	1
2025	21.04	2021-10-01	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
2026	6.00	2021-09-30	primaryAccount		Account Service Charge -  -	1	55	1
2027	1.00	2021-09-30	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 414369	1	22	1
1949	1000.00	2021-10-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	62	1
1950	1000.00	2021-10-01	primaryAccount	sent to expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	189	1
1974	134.97	2021-09-27	primaryAccount		COUNTER WITHDRAWAL -  -	2	90	1
1943	800.00	2021-10-04	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
1935	3314.14	2021-10-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
1928	250.00	2021-10-08	primaryAccount		COUNTER WITHDRAWAL -  -	2	90	1
2028	25.00	2021-09-30	primaryAccount		OD ITEM FEE -  -	1	55	1
2029	401.94	2021-09-30	primaryAccount		ACH Debit - ACH Payment    ATT -	1	26	1
2030	25.00	2021-09-29	primaryAccount	1244	OD ITEM FEE -  -	1	55	1
2032	25.00	2021-09-29	primaryAccount		OD ITEM FEE -  -	1	55	1
2033	311.00	2021-09-29	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	1
2034	25.00	2021-09-28	primaryAccount	1243	OD ITEM FEE -  -	1	55	1
2043	930.54	2021-09-27	primaryAccount	606	CHECK -  -	1	178	1
2042	72.92	2021-09-27	primaryAccount	607	CHECK -  -	1	197	1
2040	789.78	2021-09-27	primaryAccount	610	CHECK -  -	1	4	1
2039	140.17	2021-09-27	primaryAccount	612	CHECK -  -	1	9	1
2038	473.45	2021-09-27	primaryAccount	613	CHECK -  -	1	186	1
2037	630.37	2021-09-27	primaryAccount	614	CHECK -  -	1	129	1
2035	3977.60	2021-09-28	primaryAccount	1243	CHECK -  -	1	31	1
2003	763.15	2021-10-08	primaryAccount	104	CHECK -  -	1	4	1
2000	702.69	2021-10-12	primaryAccount	616	CHECK -  -	1	178	1
1999	397.83	2021-10-12	primaryAccount	617	CHECK -  -	1	197	1
1998	301.09	2021-10-12	primaryAccount	619	CHECK -  -	1	201	1
1997	98.56	2021-10-12	primaryAccount	621	CHECK -  -	1	9	1
1996	405.78	2021-10-12	primaryAccount	623	CHECK -  -	1	129	1
1991	81.42	2021-10-13	primaryAccount	611	CHECK -  -	1	196	1
1987	161.03	2021-10-14	primaryAccount	618	CHECK -  -	1	171	1
1988	150.37	2021-10-14	primaryAccount	608	CHECK -  -	1	171	1
1986	3550.00	2021-10-14	primaryAccount	2100	CHECK -  -	1	16	1
2031	589.84	2021-09-29	primaryAccount	1244	CHECK -  -	1	213	1
1981	150.00	2021-10-08	expensesAccount	105	CHECK -  -	1	146	1
1992	390.39	2021-10-13	primaryAccount	103	CHECK -  -	1	213	1
1980	400.00	2021-10-15	expensesAccount	107	CHECK -  -	1	146	1
2048	102.00	2021-10-07	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	55	1
2053	79.27	2021-10-06	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 99147	1	22	1
2058	3597.35	2021-10-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M0572	1	124	1
2059	6.00	2021-09-30	primaryAccount		Account Service Charge -  -	1	55	1
2060	10.00	2021-09-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	1	55	1
2061	25.00	2021-09-28	primaryAccount		OD ITEM FEE -  -	1	55	1
2062	2000.00	2021-09-28	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	55	1
2063	34.99	2021-09-28	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	1	133	1
2064	3657.73	2021-09-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M5388	1	124	1
2054	20.00	2021-10-06	primaryAccount		POS Transaction DDA - D/C TRN BIRD* RIDE - HTTPSBIRD.CO CA REF# 79485	1	189	1
2036	1244.74	2021-09-27	primaryAccount	1322	CHECK -  -	1	161	1
2118	25.00	2021-11-05	primaryAccount		OD ITEM FEE -  -	2	55	1
2051	20.00	2021-10-07	primaryAccount		POS Transaction DDA - D/C TRN BIRD* RIDE - HTTPSBIRD.CO CA REF# 46299	1	189	1
2055	20.00	2021-10-06	primaryAccount		POS Transaction DDA - D/C TRN BIRD* NEG BALANC - HTTPSBIRD.CO CA REF# 19259	1	189	1
2044	54.27	2021-09-27	primaryAccount	603	CHECK -  -	1	186	1
1985	1000.00	2021-10-15	primaryAccount	a expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2050	20.00	2021-10-07	primaryAccount		POS Transaction DDA - D/C TRN BIRD* GUEST RIDE - HTTPSBIRD.CO CA REF# 82482	1	189	1
2041	515.19	2021-09-27	primaryAccount	609	CHECK -  -	1	201	1
2057	1.00	2021-10-05	primaryAccount		ATM Service Charge - ATM D/F BIRD* GUEST RIDE - +18662052442 CA REF# 257474	1	189	1
2049	20.00	2021-10-07	primaryAccount		POS Transaction DDA - D/C TRN BIRD* RIDE - HTTPSBIRD.CO CA REF# 1998	1	189	1
2056	1.00	2021-10-05	primaryAccount		ATM Service Charge - ATM D/F BIRD* RIDE - +18662052442 CA REF# 754223	1	189	1
1967	626.57	2021-09-27	primaryAccount	110207	CHECK -  -	2	113	1
2046	20.00	2021-10-12	primaryAccount		POS Transaction DDA - D/C TRN BIRD* RIDE - HTTPSBIRD.CO CA REF# 12253	1	189	1
2052	20.00	2021-10-07	primaryAccount		POS Transaction DDA - D/C TRN BIRD* GUEST RIDE - HTTPSBIRD.CO CA REF# 20183	1	189	1
1968	152.28	2021-09-27	primaryAccount	110204	CHECK -  -	2	154	1
2007	150.00	2021-10-08	primaryAccount	a expenses bix	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
1941	2.38	2021-10-04	primaryAccount		POS Transaction DDA - D/C TRN FIESTA MART 42 - TULSA OK REF# 903276	2	135	1
1526	2000.00	2021-09-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	62	1
1616	8.29	2021-10-01	cash			2	44	1
1946	3562.50	2021-10-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	1
1945	883.93	2021-10-01	primaryAccount	110197	CHECK -  -	2	118	1
1977	1000.00	2021-10-01	expensesAccount		COUNTER WITHDRAWAL -  -	2	62	1
2070	56.19	2021-10-17	cash			2	32	1
1617	23.00	2021-10-01	cash			2	46	1
1536	290.00	2021-09-07	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*ANTHONY - 8774174551 CA REF# 51156	2	189	1
1975	1500.00	2021-09-27	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile - kike lo paso a su cuenta personal	2	189	1
2045	2535.38	2021-09-27	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2017	2509.88	2021-10-04	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2002	2300.00	2021-10-12	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2047	1500.00	2021-10-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
1990	1000.00	2021-10-14	primaryAccount		COUNTER WITHDRAWAL -  -	1	189	1
1976	2000.00	2021-10-04	expensesAccount		COUNTER WITHDRAWAL -  -	2	62	1
2071	100.00	2021-10-18	cash			2	46	1
2072	26.52	2021-10-19	cash			1	33	1
2073	62.50	2021-10-21	cash			1	25	1
2074	23.00	2021-10-21	cash			1	91	1
2075	271.00	2021-10-21	cash			1	91	1
1496	676.11	2021-09-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	1
1942	202.75	2021-10-04	primaryAccount		ATM - Withdrawal - DDA - ATM W/D 4187 EAST 66 STREET - NORTH TULSA OK REF# 902866	2	189	1
1915	104.00	2021-10-12	primaryAccount		POS Transaction DDA - D/C TRN SECRETARY OF STA - OKLAHOMA CITY OK REF# 50044	2	222	1
2076	107.49	2021-10-21	cash			1	34	1
2078	45.00	2021-10-23	cash			2	46	1
2077	28.00	2021-10-22	cash			2	46	1
2079	36.58	2021-10-24	cash			2	33	1
2080	8.00	2021-10-06	cash			2	33	1
2081	45.27	2021-10-06	cash			2	44	1
2082	70.00	2021-10-25	cash			2	46	1
2083	19.52	2021-10-25	cash			1	43	1
2084	63.75	2021-10-28	cash			1	25	1
3606	100.00	2022-05-08	cash			2	188	17
2085	63.17	2021-10-28	cash			2	51	1
2088	15.20	2021-10-30	cash			1	80	1
2089	55.60	2021-10-30	cash			1	33	1
2095	22.47	2021-10-31	cash			2	98	1
3607	36.85	2022-05-08	cash			2	39	17
3608	20.00	2022-05-07	cash			2	188	17
3706	22.98	2022-05-20	cash			2	44	17
3772	287.90	2022-05-26	primaryAccount		ACH Debit - ACH EFT0526    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3775	100.00	2022-05-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3777	2281.69	2022-05-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3778	733.97	2022-05-24	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
3789	1981.27	2022-05-23	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3790	474.45	2022-05-23	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
3791	241.58	2022-05-23	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3792	768.00	2022-05-23	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 9441	2	243	\N
3793	354.00	2022-05-23	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 16136	2	243	\N
3794	330.00	2022-05-23	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 20829	2	243	\N
2119	2834.78	2021-11-05	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
3795	309.93	2022-05-23	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 12330	2	243	\N
3796	296.00	2022-05-23	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 27518	2	243	\N
3800	1446.57	2022-05-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3801	468.54	2022-05-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
3802	107.16	2022-05-20	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3803	100.00	2022-05-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3805	100.00	2022-05-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3808	4935.92	2022-05-17	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3809	2302.65	2022-05-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3810	1577.21	2022-05-17	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3811	1563.44	2022-05-17	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3812	1464.24	2022-05-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3813	1451.35	2022-05-17	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3814	260.32	2022-05-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3815	184.86	2022-05-17	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
3818	229.49	2022-05-16	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3819	91.92	2022-05-16	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 23410	2	22	\N
3821	2745.57	2022-05-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
3824	2449.39	2022-06-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3817	438.31	2022-05-16	primaryAccount	104	CHECK -  -	2	262	\N
3816	578.57	2022-05-16	primaryAccount	110455	CHECK -  -	2	113	\N
3806	1089.97	2022-05-17	primaryAccount	110458	CHECK -  -	2	177	\N
3807	1098.97	2022-05-17	primaryAccount	110454	CHECK -  -	2	5	\N
3798	1200.00	2022-05-20	primaryAccount	102	CHECK -  -	2	146	\N
3799	1000.00	2022-05-20	primaryAccount	101	CHECK -  -	2	62	\N
3797	1486.27	2022-05-20	primaryAccount	110465	CHECK -  -	2	244	\N
3785	30.68	2022-05-23	primaryAccount	110464	CHECK -  -	2	233	\N
3786	846.00	2022-05-23	primaryAccount	110463	CHECK -  -	2	117	\N
3780	574.07	2022-05-23	primaryAccount	110478	CHECK -  -	2	242	\N
3782	88.81	2022-05-23	primaryAccount	110473	CHECK -  -	2	257	\N
3783	33.72	2022-05-23	primaryAccount	110470	CHECK -  -	2	108	\N
3784	816.49	2022-05-23	primaryAccount	110466	CHECK -  -	2	265	\N
3781	504.77	2022-05-23	primaryAccount	110474	CHECK -  -	2	260	\N
3774	102.15	2022-05-25	primaryAccount	110451	CHECK -  -	2	252	\N
3773	163.72	2022-05-25	primaryAccount	110467	CHECK -  -	2	252	\N
3771	436.24	2022-05-26	primaryAccount	102	CHECK -  -	2	262	\N
3770	108.74	2022-05-26	primaryAccount	110476	CHECK -  -	2	205	\N
3823	1.00	2022-06-03	primaryAccount		ATM Service Charge - ATM D/F BIRD* GUEST RIDE - +18662052442 CA REF# 65409	2	189	\N
3788	453.90	2022-05-23	primaryAccount	103	CHECK -  - Alan Arias-Cedeno	2	266	\N
3820	2000.00	2022-05-16	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3787	162.10	2022-05-23	primaryAccount	110462	CHECK -  -	2	266	\N
3776	1000.00	2022-05-25	primaryAccount	check	COUNTER WITHDRAWAL -  -	2	62	\N
2086	31.64	2021-10-28	cash			2	160	1
2087	10.47	2021-10-29	cash			2	33	1
2090	24.83	2021-10-30	cash			1	33	1
2091	45.32	2021-10-31	cash			1	33	1
2092	19.52	2021-10-31	cash			1	43	1
2093	71.81	2021-10-31	cash			1	32	1
2094	18.44	2021-10-31	cash			1	44	1
2096	78.00	2021-11-07	cash			1	223	1
2097	16.27	2021-11-05	cash			1	47	1
2098	60.91	2021-11-05	cash			1	80	1
2099	30.00	2021-11-05	cash			1	224	1
2100	27.50	2021-11-04	cash			1	25	1
2101	23.00	2021-11-04	cash			1	91	1
2102	76.11	2021-11-06	cash			1	80	1
2103	15.00	2021-11-06	cash			1	48	1
2104	128.30	2021-11-06	cash			1	33	1
2105	16.88	2021-11-06	cash			1	40	1
2106	76.84	2021-11-06	cash			1	32	1
2107	8.69	2021-11-06	cash			1	47	1
2108	5.26	2021-11-02	cash			1	47	1
2109	134.00	2021-11-02	cash			1	213	1
2110	11.00	2021-11-02	cash			1	62	1
2111	25.91	2021-11-02	cash			2	49	1
2112	16.49	2021-11-02	cash			2	33	1
2113	77.56	2021-11-02	cash			2	32	1
2114	3.13	2021-11-01	cash			1	33	1
2115	55.09	2021-11-01	cash			2	33	1
2116	25.00	2021-11-05	primaryAccount		OD ITEM FEE -  -	2	55	1
2117	3532.02	2021-11-05	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2120	25.00	2021-11-05	primaryAccount		OD ITEM FEE -  -	2	55	1
2121	1109.74	2021-11-05	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	1
2122	102.95	2021-11-05	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2123	25.00	2021-11-04	primaryAccount		OD ITEM FEE -  -	2	55	1
2124	203.15	2021-11-04	primaryAccount		ACH Debit - ACH EFT1104    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
3609	8.61	2022-05-07	cash			2	33	17
2126	1.00	2021-11-03	primaryAccount		ATM Service Charge - ATM D/F CASH APP*ADILENE - Visa Transfer CA REF# 126901	2	180	1
2127	1.00	2021-11-03	primaryAccount		ATM Service Charge - ATM D/F CASH APP*ADILENE - Visa Transfer CA REF# 152956	2	180	1
2128	25.00	2021-11-03	primaryAccount		OD ITEM FEE -  -	2	55	1
2129	3029.24	2021-11-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2130	306.38	2021-11-03	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2131	182.00	2021-11-03	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	1
2132	19.80	2021-11-02	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF OCTOBER 2021	2	55	1
2133	25.00	2021-11-02	primaryAccount	103	OD ITEM FEE -  -	2	55	1
3610	68.25	2022-05-07	cash			2	39	17
2135	3562.50	2021-11-02	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	1
2136	1775.82	2021-11-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	1
3616	51.93	2022-05-14	cash			2	33	17
3618	17.10	2022-05-15	cash			2	44	17
3710	62.39	2022-05-24	cash			2	44	17
2141	1638.96	2021-11-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2145	6.00	2021-10-29	primaryAccount		Account Service Charge -  -	2	55	1
2147	162.60	2021-10-29	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2149	184.65	2021-10-28	primaryAccount		ACH Debit - ACH EFT1028    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2157	191.76	2021-10-27	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2160	2427.01	2021-10-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2161	433.18	2021-10-26	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	1
2162	300.00	2021-10-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
2158	53.00	2021-10-26	primaryAccount	110234	CHECK -  -	2	81	1
2159	629.03	2021-10-26	primaryAccount	110232	CHECK -  -	2	215	1
2156	5.21	2021-10-27	primaryAccount	110236	CHECK -  -	2	108	1
2155	60.87	2021-10-27	primaryAccount	110238	CHECK -  -	2	154	1
2154	49.33	2021-10-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
2148	375.00	2021-10-28	primaryAccount	101	CHECK -  - bonus labor	2	11	1
2146	375.00	2021-10-29	primaryAccount	102	CHECK -  - bonus labor	2	5	1
2143	1000.00	2021-11-01	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2139	139.41	2021-11-01	primaryAccount	105	CHECK -  - from Bixby	1	103	1
2125	25.00	2021-11-03	primaryAccount	103	NSF RETURN ITEM FEE -  -	2	55	1
2151	500.00	2021-10-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	29	1
2152	583.47	2021-10-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
2142	350.00	2021-11-01	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	1
2144	2000.00	2021-11-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2138	5500.00	2021-11-02	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2137	514.74	2021-11-02	primaryAccount		COUNTER WITHDRAWAL -  - Bixby liquor, which one?	2	34	1
2164	1308.61	2021-10-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
3611	83.38	2022-05-09	cash			2	43	17
2168	25.00	2021-10-22	primaryAccount	110242	OD ITEM FEE -  -	2	55	1
3612	68.81	2022-05-13	cash			2	97	17
3613	5.00	2022-05-13	cash			2	96	17
3614	5.00	2022-05-13	cash			2	108	17
3615	17.35	2022-05-13	cash			2	44	17
3617	62.74	2022-05-15	cash			2	39	17
2174	3673.84	2021-10-22	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2175	3011.60	2021-10-22	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2177	525.14	2021-10-22	primaryAccount		ACH Debit - ACH SGWSOK3    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2178	171.31	2021-10-22	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2179	126.40	2021-10-21	primaryAccount		ACH Debit - ACH EFT1021    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2182	1725.70	2021-10-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2183	468.84	2021-10-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	1
2187	250.00	2021-10-19	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	1
2189	2245.22	2021-10-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2191	371.56	2021-10-18	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
2194	25.00	2021-11-05	primaryAccount		OD ITEM FEE -  -	1	55	1
2195	2009.00	2021-11-05	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2196	1453.97	2021-11-05	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2197	610.58	2021-11-05	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BIXBY	1	21	1
2198	83.54	2021-11-05	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2199	9.00	2021-11-02	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF OCTOBER 2021	1	55	1
2200	390.33	2021-11-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2201	25.00	2021-11-02	primaryAccount		ACH Debit - ACH MERCH FEES BEYOND - DOS BANDIDOS BIXBY	1	139	1
2202	215.02	2021-11-02	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN LAVU.COM - HTTPSLAVU.COM NM REF# 91242	1	19	1
2205	1033.39	2021-11-01	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
2206	825.76	2021-11-01	primaryAccount		ACH Debit - ACH MERCH FEES BNKCD SETTLE - DOS BANDIDOS BIXBY	1	187	1
2207	300.08	2021-11-01	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
2208	254.46	2021-11-01	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
2209	180.00	2021-11-01	primaryAccount		ACH Debit - ACH LEASE PYMT ICE MAKER SALES - DOS BANDIDO'S	1	27	1
2210	21.04	2021-11-01	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
2213	6.00	2021-10-29	primaryAccount		Account Service Charge -  -	1	55	1
2216	78.00	2021-10-29	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 79623	1	22	1
2217	320.00	2021-10-28	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	1
2218	25.00	2021-10-27	primaryAccount	635	OD ITEM FEE -  -	1	55	1
2220	25.00	2021-10-26	primaryAccount	634	OD ITEM FEE -  -	1	55	1
2223	429.44	2021-10-26	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2167	3500.00	2021-10-25	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
2193	2736.75	2021-10-18	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	100	1
2221	499.16	2021-10-26	primaryAccount	634	CHECK -  -	1	129	1
2219	414.53	2021-10-27	primaryAccount	635	CHECK -  -	1	213	1
2214	113.81	2021-10-29	primaryAccount	627	CHECK -  -	1	197	1
2215	700.00	2021-10-29	primaryAccount	104	CHECK -  -	1	216	1
2203	362.37	2021-11-01	primaryAccount	633	CHECK -  -	1	186	1
2222	238.18	2021-10-26	primaryAccount	630	CHECK -  - rosa jungo	1	226	1
2190	1050.00	2021-10-18	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	100	1
2192	35.00	2021-10-18	primaryAccount		COUNTER WITHDRAWAL -  - cashiers check	2	100	1
2188	1900.00	2021-10-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
2185	28.05	2021-10-20	primaryAccount		ACH Debit - ACH EMPL SEC   EMPL SEC COMM - TEMI PAY LLC	2	100	1
2180	10.52	2021-10-21	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	100	1
2173	825.89	2021-10-22	primaryAccount	110228	CHECK -  -	2	118	1
2172	962.00	2021-10-22	primaryAccount	110231	CHECK -  -	2	117	1
2169	1045.59	2021-10-22	primaryAccount	110242	CHECK -  -	2	177	1
2170	1055.59	2021-10-22	primaryAccount	110240	CHECK -  -	2	5	1
2171	754.01	2021-10-22	primaryAccount	110233	CHECK -  - vanessa gray	2	227	1
2186	12.43	2021-10-20	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
2166	2600.00	2021-10-25	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	1
2181	2356.99	2021-10-20	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
2176	1694.11	2021-10-22	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	1
2184	33.92	2021-10-20	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
3619	16.98	2022-05-13	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 106074	2	32	\N
3620	7.35	2022-05-13	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 360900	2	44	\N
3621	53.47	2022-05-11	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 672329	2	97	\N
3622	131.58	2022-05-10	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 579860	2	32	\N
3623	13.76	2022-05-10	expensesAccount		POS Transaction DDA - D/C TRN QT 80 - BROKEN ARROW OK REF# 47278	2	97	\N
2231	1800.52	2021-10-22	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2232	1609.22	2021-10-22	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2233	88.72	2021-10-22	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2234	12.85	2021-10-22	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
3624	13.58	2022-05-10	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 614888	2	32	\N
3625	159.38	2022-05-09	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 117640	2	51	\N
3626	69.36	2022-05-09	expensesAccount		POS Transaction DDA - D/C TRN PARKHILL'S LIQUO - TULSA OK REF# 91282	2	87	\N
2238	627.77	2021-10-20	primaryAccount		ACH Debit - ACH Payment    ATT -	1	26	1
2239	146.30	2021-10-20	primaryAccount		ACH Debit - ACH DRAFTS     BIXBY METRO CHA - Dos Bandidos	1	28	1
3627	59.26	2022-05-09	expensesAccount		POS Transaction DDA - D/C TRN LAS AMERICAS SUP - TULSA OK REF# 48031	2	65	\N
3628	34.55	2022-05-09	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 56168	2	49	\N
3629	25.18	2022-05-09	expensesAccount		POS Transaction DDA - D/C TRN QT 7 OUTSIDE - TULSA OK REF# 597162	2	97	\N
2243	1469.66	2021-10-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
2244	394.59	2021-10-18	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - CARLOS LOPEZ	1	21	1
2245	260.32	2021-10-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
3630	15.06	2022-05-09	expensesAccount		POS Transaction DDA - D/C TRN QT 7 INSIDE - TULSA OK REF# 502403	2	97	\N
2247	237.28	2021-11-01	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 65116	1	32	1
2248	6.00	2021-10-29	expensesAccount		Account Service Charge -  -	1	55	1
2249	4.00	2021-10-29	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	1	55	1
3631	217.98	2022-05-03	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 356989	2	32	\N
3699	25.00	2022-05-13	primaryAccount		OD ITEM FEE -  -	2	55	\N
2252	25.00	2021-10-25	expensesAccount	106	OD ITEM FEE -  -	1	55	1
3700	2755.03	2022-05-13	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
2254	25.00	2021-10-22	expensesAccount	108	OD ITEM FEE -  -	1	55	1
2257	250.00	2021-10-19	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	1	59	1
2258	250.00	2021-10-18	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	1	59	1
2261	6.00	2021-10-29	expensesAccount		Account Service Charge -  -	2	55	1
2262	4.00	2021-10-29	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
2263	1.00	2021-11-04	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 206923	1	22	1
2264	10.00	2021-11-01	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	1	55	1
2267	6.00	2021-10-29	primaryAccount		Account Service Charge -  -	1	55	1
2269	25.00	2021-10-27	primaryAccount		OD ITEM FEE -  -	1	55	1
2270	34.99	2021-10-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	1	133	1
2271	25.00	2021-10-25	primaryAccount		OD ITEM FEE -  -	1	55	1
2272	3462.41	2021-10-25	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M9412	1	124	1
2276	30.95	2021-10-21	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 49421	1	22	1
2277	2550.53	2021-10-19	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M4082	1	124	1
2278	2036.55	2021-10-18	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M5434	1	124	1
2259	761.77	2021-11-05	expensesAccount	2003	CHECK -  -	2	118	1
2242	240.00	2021-10-18	primaryAccount	102	CHECK -  - DIEGO SANCHEZ	1	189	1
2230	700.00	2021-10-22	primaryAccount	101	CHECK -  -	1	146	1
2260	867.61	2021-11-05	expensesAccount	2002	CHECK -  -	2	227	1
2226	778.22	2021-10-25	primaryAccount	631	CHECK -  -	1	4	1
2227	444.19	2021-10-25	primaryAccount	629	CHECK -  -	1	201	1
2228	791.81	2021-10-25	primaryAccount	626	CHECK -  -	1	178	1
2229	1830.00	2021-10-25	primaryAccount	103	CHECK -  -	1	30	1
2225	78.70	2021-10-25	primaryAccount	632	CHECK -  -	1	9	1
2204	372.33	2021-11-01	primaryAccount	622	CHECK -  -	1	186	1
2240	134.77	2021-10-18	primaryAccount	615	CHECK -  - reese erickson	1	225	1
2241	73.51	2021-10-18	primaryAccount	595	CHECK -  - Reese erickson	1	225	1
2255	119.08	2021-10-22	expensesAccount	108	CHECK -  - returned	1	189	1
2253	464.74	2021-10-25	expensesAccount	106	CHECK -  - returned	1	189	1
2251	25.00	2021-10-25	expensesAccount	108	NSF RETURN ITEM FEE -  -	1	55	1
2250	25.00	2021-10-26	expensesAccount	106	NSF RETURN ITEM FEE -  -	1	55	1
2246	3000.00	2021-10-18	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2237	300.00	2021-10-21	primaryAccount		COUNTER WITHDRAWAL -  -	1	62	1
2273	1810.07	2021-10-25	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	100	1
2352	45.54	2021-11-16	expensesAccount		POS Transaction DDA - D/C TRN PARKHILL'S LIQUO - TULSA OK REF# 2279	1	87	1
2346	728.97	2021-11-08	primaryAccount	637	CHECK -  -	1	178	1
2358	200.00	2021-11-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2340	75.36	2021-11-08	primaryAccount	642	CHECK -  -	1	9	1
2334	388.71	2021-11-09	primaryAccount	645	CHECK -  -	1	213	1
2268	174.54	2021-10-29	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	100	1
2344	55.70	2021-11-08	primaryAccount	640	CHECK -  -	1	226	1
2274	900.00	2021-10-22	primaryAccount		POS Transaction DDA - D/C TRN FACEBK WBFU9AFHF - 650-5434800 CA REF# 25734	1	100	1
2332	184.31	2021-11-12	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 19841	1	22	1
2333	25.00	2021-11-09	primaryAccount	645	OD ITEM FEE -  -	1	55	1
3636	1373.57	2022-05-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2335	25.00	2021-11-09	primaryAccount	644	OD ITEM FEE -  -	1	55	1
3637	107.16	2022-05-13	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
2337	25.00	2021-11-09	primaryAccount		OD ITEM FEE -  -	1	55	1
2275	400.00	2021-10-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	100	1
2338	205.94	2021-11-09	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DosBandidos	1	18	1
2339	25.00	2021-11-08	primaryAccount	642	OD ITEM FEE -  -	1	55	1
3638	100.00	2022-05-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
2341	25.00	2021-11-08	primaryAccount	641	OD ITEM FEE -  -	1	55	1
2343	25.00	2021-11-08	primaryAccount	640	OD ITEM FEE -  -	1	55	1
2256	164.00	2021-10-22	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	100	1
2345	25.00	2021-11-08	primaryAccount	637	OD ITEM FEE -  -	1	55	1
3642	271.82	2022-05-12	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 88840	2	158	\N
2347	149.00	2021-11-08	primaryAccount		ACH Debit - ACH CHOWNOW, I CHOWNOW, INC. - DOS BANDIDOS BIXBY LLC	1	20	1
3644	100.00	2022-05-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
2235	642.07	2021-10-22	primaryAccount		COUNTER WITHDRAWAL -  -	1	66	1
3645	94.85	2022-05-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
2212	300.00	2021-11-01	primaryAccount		COUNTER WITHDRAWAL -  -	1	62	1
3641	5000.00	2022-05-12	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - QL3ZT2F3	2	189	\N
2353	1.00	2021-11-15	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #6342 - TULSA OK REF# 18709	1	32	1
2354	1.00	2021-11-15	expensesAccount		ATM Service Charge - ATM D/F SAMS CLUB #6342 - TULSA OK REF# 45705	1	32	1
2355	198.84	2021-11-15	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 19405	1	32	1
2236	300.00	2021-10-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	100	1
2356	30.74	2021-11-15	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 79654	1	44	1
2224	2594.02	2021-10-26	primaryAccount		COUNTER WITHDRAWAL -  - la foto no carga, SGC?	1	29	1
2348	3000.00	2021-11-08	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2359	55.11	2021-11-18	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 39981	1	22	1
2360	3031.92	2021-11-17	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M7132	1	124	1
2361	1000.00	2021-11-12	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M3988	1	124	1
3639	1430.00	2022-05-13	primaryAccount		POS Transaction DDA - D/C TRN OKLAHOMA ABLE CO - 405-522-0603 OK REF# 10111	2	89	\N
2363	128.23	2021-11-08	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 9773	1	22	1
2366	25.00	2021-11-15	expensesAccount	119659	OD ITEM FEE -  -	2	55	1
3640	382.64	2022-05-12	primaryAccount	110450	CHECK -  -	2	249	\N
2368	25.00	2021-11-15	expensesAccount	119622	OD ITEM FEE -  -	2	55	1
2362	600.00	2021-11-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	189	1
2342	788.68	2021-11-08	primaryAccount	641	CHECK -  -	1	4	1
2336	549.76	2021-11-09	primaryAccount	644	CHECK -  -	1	129	1
2351	778.16	2021-11-19	expensesAccount	2011	CHECK -  -	1	227	1
2331	146.41	2021-11-12	primaryAccount	628	CHECK -  -	1	171	1
2349	986.49	2021-11-19	expensesAccount	2013	CHECK -  -	1	117	1
2364	1000.00	2021-11-08	primaryAccount		COUNTER WITHDRAWAL -  -	1	62	1
2365	8.78	2021-11-18	expensesAccount		POS Transaction DDA - D/C TRN SQ *THE LAURANNA - Broken Arrow OK REF# 74156	2	189	1
2350	797.91	2021-11-19	expensesAccount	2012	CHECK -  -	1	118	1
3634	10.58	2022-05-13	primaryAccount	110363	CHECK -  -	2	256	\N
2357	234.20	2021-11-19	primaryAccount		COUNTER WITHDRAWAL -  -	1	35	1
2265	1000.00	2021-11-01	primaryAccount		COUNTER WITHDRAWAL -  - no dice nada	1	189	1
3633	9.50	2022-05-13	primaryAccount	110399	CHECK -  -	2	256	\N
3632	867.22	2022-05-13	primaryAccount	110449	CHECK -  - IGNACIO GUZMAN	2	265	\N
3635	202.00	2022-05-13	primaryAccount	102	CHECK -  - IGNACIO GUZMAN	2	265	\N
2367	30.00	2021-11-15	expensesAccount	119659	CHECK -  -	2	55	1
3646	23.10	2022-05-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
3647	2296.91	2022-05-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2280	2517.25	2021-11-19	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2281	671.70	2021-11-19	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2282	468.26	2021-11-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	1
3648	848.38	2022-05-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
2283	250.00	2021-11-19	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	1
2284	205.70	2021-11-19	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	1
2285	162.60	2021-11-19	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2211	3000.00	2021-11-01	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
3649	364.02	2022-05-10	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
2288	447.40	2021-11-18	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2289	211.30	2021-11-18	primaryAccount		ACH Debit - ACH EFT1118    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2290	25.93	2021-11-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2292	2222.67	2021-11-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2293	184.07	2021-11-16	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	1
2299	1176.73	2021-11-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2163	620.33	2021-10-25	primaryAccount	110241	CHECK -  -	2	113	1
2300	102.95	2021-11-15	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2301	23.10	2021-11-15	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	1
2303	167.41	2021-11-12	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 43705	2	158	1
2304	1623.66	2021-11-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2140	800.00	2021-11-01	primaryAccount	104	CHECK -  -	2	146	1
2306	387.18	2021-11-09	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2307	89.85	2021-11-09	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	1
2134	5206.05	2021-11-02	primaryAccount	103	CHECK -  -	2	31	1
2309	933.34	2021-11-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2310	647.82	2021-11-08	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
2165	400.00	2021-10-25	primaryAccount		VISA MONEY TRANSFER- DEBIT - D/C TRN CASH APP*ANTHONY - 8774174551 CA REF# 67863	2	100	1
2311	325.20	2021-11-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	1
2312	25.00	2021-11-19	primaryAccount		OD ITEM FEE -  -	1	55	1
2313	2527.42	2021-11-19	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2314	1087.68	2021-11-19	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2150	1000.00	2021-10-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2315	640.72	2021-11-19	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2316	360.69	2021-11-19	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2318	146.30	2021-11-19	primaryAccount		ACH Debit - ACH DRAFTS     BIXBY METRO CHA - Dos Bandidos	1	28	1
2153	210.08	2021-10-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	1
2319	78.36	2021-11-19	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2320	13.58	2021-11-18	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2323	392.76	2021-11-17	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - CARLOS LOPEZ	1	21	1
2325	1464.24	2021-11-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
2326	260.32	2021-11-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
2327	2827.05	2021-11-15	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	1
2328	264.99	2021-11-15	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN DTV*DIRECTV SERV - 800-347-3288 CA REF# 46972	1	1	1
2321	80.68	2021-11-17	primaryAccount	625	CHECK -  -	1	225	1
2322	341.89	2021-11-17	primaryAccount	102	CHECK -  -	1	24	1
2308	483.43	2021-11-08	primaryAccount	70009	CHECK -  -	2	120	1
2317	214.34	2021-11-19	primaryAccount		ACH Debit - ACH SALE       ZEPHYR HARDWARE - DOS BANDIDOS BIXBY	1	228	1
2305	3000.00	2021-11-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2298	178.04	2021-11-15	primaryAccount	106	CHECK -  -	2	154	1
2294	1600.00	2021-11-16	primaryAccount		COUNTER WITHDRAWAL -  - 1000 al rest y 600 cash para kike	2	62	1
2296	550.00	2021-11-16	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2291	232.50	2021-11-17	primaryAccount	108	CHECK -  -	2	89	1
2279	172.50	2021-11-19	primaryAccount	107	CHECK -  -	2	89	1
2297	34.49	2021-11-15	primaryAccount	905	CHECK -  - kalley miesner	2	229	1
2287	2500.00	2021-11-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	146	1
3711	20.00	2022-05-20	cash			2	235	17
2377	6.67	2021-11-09	expensesAccount		POS Transaction DDA - D/C TRN FEDEX OFFIC57900 - BROKEN ARROW OK REF# 76492	2	64	1
2378	25.00	2021-11-08	expensesAccount	2008	OD ITEM FEE -  -	2	55	1
2380	25.00	2021-11-08	expensesAccount	2007	OD ITEM FEE -  -	2	55	1
3655	768.51	2022-05-09	primaryAccount	110456	CHECK -  -	2	257	\N
3656	16.58	2022-05-09	primaryAccount	110447	CHECK -  -	2	233	\N
3652	68.87	2022-05-09	primaryAccount	110460	CHECK -  -	2	206	\N
2373	25.00	2021-11-09	expensesAccount	2007	NSF RETURN ITEM FEE -  -	2	55	1
2371	3000.00	2021-11-15	expensesAccount	1007	CHECK -  -	1	29	1
2330	98.53	2021-11-12	primaryAccount	638	CHECK -  -	1	171	1
3651	527.58	2022-05-09	primaryAccount	110461	CHECK -  -	2	242	\N
2382	257.24	2021-11-08	expensesAccount	2006	CHECK -  - cesar guzman	2	231	1
2417	4000.00	2021-11-30	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2424	1000.00	2021-11-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2374	614.71	2021-11-09	expensesAccount	2004	CHECK -  -	2	215	1
2385	168.00	2021-11-08	expensesAccount	1012	CHECK -  -	2	178	1
2388	48.96	2021-11-09	cash			1	47	1
2389	49.68	2021-11-11	cash			1	40	1
2390	24.99	2021-11-10	cash			1	80	1
2375	60.00	2021-11-09	expensesAccount	1011	CHECK -  -	2	213	1
2384	516.66	2021-11-08	expensesAccount	2001	CHECK -  -	2	218	1
2391	63.75	2021-11-11	cash			1	25	1
2392	34.86	2021-11-13	cash			1	43	1
2393	45.70	2021-11-13	cash			1	80	1
2394	12.00	2021-11-18	cash			2	97	1
2395	50.00	2021-11-18	cash			2	46	1
2376	315.00	2021-11-09	expensesAccount	1001	CHECK -  -	2	129	1
2383	983.99	2021-11-08	expensesAccount	2005	CHECK -  -	2	117	1
2396	63.75	2021-11-18	cash			1	25	1
2397	44.13	2021-11-19	cash			1	47	1
2398	19.68	2021-11-19	cash			1	32	1
3653	88.27	2022-05-09	primaryAccount	110459	CHECK -  -	2	205	\N
2399	4.13	2021-11-20	cash			1	47	1
3654	776.32	2022-05-09	primaryAccount	110457	CHECK -  -	2	260	\N
3713	20.00	2022-05-25	cash			2	46	17
2286	8.36	2021-11-19	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	1
2402	1238.20	2021-12-03	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2403	270.24	2021-12-03	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2404	234.00	2021-12-03	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	1
2405	210.36	2021-12-03	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2379	622.00	2021-11-08	expensesAccount	2008	CHECK -  -	2	113	1
2406	25.00	2021-12-02	primaryAccount	1001	OD ITEM FEE -  -	2	55	1
2370	1200.00	2021-11-15	expensesAccount	1008	CHECK -  -	2	146	1
2381	2111.16	2021-11-08	expensesAccount	2007	CHECK -  -	2	5	1
2408	25.00	2021-12-02	primaryAccount		OD ITEM FEE -  -	2	55	1
2387	10.80	2021-11-08	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW( OK REF# 8795	2	33	1
2409	1517.82	2021-12-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	1
2410	156.80	2021-12-02	primaryAccount		ACH Debit - ACH EFT1202    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2411	3562.50	2021-12-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	1
2372	25.00	2021-11-09	expensesAccount	2008	NSF RETURN ITEM FEE -  -	2	55	1
2412	1702.46	2021-12-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2415	6.00	2021-11-30	primaryAccount		Account Service Charge -  -	2	55	1
2386	263.49	2021-11-08	expensesAccount	1003	CHECK -  - uncategorized food costs	2	230	1
2418	852.15	2021-11-29	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2419	799.60	2021-11-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2420	102.95	2021-11-29	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2421	136.48	2021-11-29	primaryAccount		POS Transaction DDA - D/C TRN WAL-MART #1597 - TULSA OK REF# 811149	2	33	1
2423	19.97	2021-11-29	primaryAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - TULSA OK REF# 22413	2	33	1
2329	400.00	2021-11-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2425	250.00	2021-11-29	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2400	603.76	2021-12-03	primaryAccount	110282	CHECK -  -	2	215	1
2401	869.27	2021-12-03	primaryAccount	110279	CHECK -  -	2	117	1
2414	2000.00	2021-12-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2413	3100.00	2021-12-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2369	622.00	2021-11-15	expensesAccount	119622	CHECK -  - estaba relacionado ya de un cheque del 11/08	2	189	1
2426	5000.00	2021-11-26	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	1
2422	55.00	2021-11-29	primaryAccount		POS Transaction DDA - D/C TRN AMAZING THAI CUI - BROKEN ARROW OK REF# 31	2	189	1
2416	22.00	2021-11-30	primaryAccount		POS Transaction DDA - D/C TRN TULSA HAIR COMPA - 918-9335353 OK REF# 33825	2	189	1
2407	850.00	2021-12-02	primaryAccount	1001	CHECK -  - Omar Maduro Service	2	241	1
2427	2376.62	2021-11-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2428	266.85	2021-11-24	primaryAccount		ACH Debit - ACH EFT1124    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
3659	2152.61	2022-05-09	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2432	914.03	2021-11-23	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BA, LLC	2	21	1
3660	664.40	2022-05-09	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3712	30.34	2022-05-25	cash			2	98	17
3715	8.67	2022-05-30	cash			2	92	17
3716	15.07	2022-05-30	cash			2	92	17
2441	1472.58	2021-11-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2442	213.87	2021-11-22	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2445	25.00	2021-12-03	primaryAccount		OD ITEM FEE -  -	1	55	1
2446	935.72	2021-12-03	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2447	593.18	2021-12-03	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2448	78.36	2021-12-03	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2449	25.00	2021-12-02	primaryAccount	1001	OD ITEM FEE -  -	1	55	1
2452	767.57	2021-12-02	primaryAccount		ACH Debit - ACH MERCH FEES BNKCD SETTLE - DOS BANDIDOS BIXBY	1	187	1
2453	376.43	2021-12-02	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
2454	25.00	2021-12-02	primaryAccount		ACH Debit - ACH MERCH FEES BEYOND - DOS BANDIDOS BIXBY	1	139	1
2455	21.04	2021-12-02	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	1	17	1
2456	180.00	2021-12-01	primaryAccount		ACH Debit - ACH LEASE PYMT ICE MAKER SALES - DOS BANDIDO'S	1	27	1
2457	215.02	2021-12-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN LAVU/ MENUDRIVE - HTTPSLAVU.COM NM REF# 42876	1	19	1
2459	6.00	2021-11-30	primaryAccount		Account Service Charge -  -	1	55	1
2460	809.53	2021-11-30	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
2461	146.19	2021-11-30	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	1
2462	312.15	2021-11-29	primaryAccount		ACH Debit - ACH Payment    ATT - 717334003COL1E	1	26	1
2463	78.00	2021-11-29	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 60132	1	22	1
2466	329.00	2021-11-26	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	1
2471	6.00	2021-11-30	expensesAccount		Account Service Charge -  -	1	55	1
2472	4.00	2021-11-30	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	1	55	1
2473	1.00	2021-11-29	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #6342 - TULSA OK REF# 892086	1	32	1
2474	1.00	2021-11-29	expensesAccount		ATM Service Charge - ATM D/F SAM'S Club - TULSA OK REF# 85577	1	32	1
2475	1.00	2021-11-29	expensesAccount		ATM Service Charge - ATM D/F SAM'S Club - TULSA OK REF# 494942	1	32	1
2477	75.94	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 16342	1	32	1
2478	53.14	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN LAS AMERICAS SUP - TULSA OK REF# 862321	1	65	1
2481	22.53	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 56902	1	44	1
2482	20.00	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN QT 97 OUTSIDE - TULSA OK REF# 946239	1	97	1
2484	25.00	2021-11-26	expensesAccount	2008	OD ITEM FEE -  -	1	55	1
2488	25.00	2021-11-22	expensesAccount	2010	OD ITEM FEE -  -	1	55	1
2431	55.41	2021-11-23	primaryAccount	110267	CHECK -  -	2	100	1
2468	546.41	2021-11-22	primaryAccount	643	CHECK -  -	1	186	1
2469	131.98	2021-11-22	primaryAccount	636	CHECK -  -	1	225	1
2470	2500.00	2021-11-22	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2464	2506.99	2021-11-29	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2451	511.49	2021-12-02	primaryAccount	653	CHECK -  -	1	213	1
2450	1188.00	2021-12-02	primaryAccount	1001	CHECK -  -	1	146	1
2489	94.21	2021-11-22	expensesAccount	2010	CHECK -  -	1	9	1
2486	92.00	2021-11-23	expensesAccount	2009	CHECK -  -	1	226	1
2485	663.82	2021-11-26	expensesAccount	2008	CHECK -  -	1	129	1
2479	29.76	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - TULSA OK REF# 105841	1	33	1
2480	23.75	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 56816	1	49	1
2476	77.09	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN WORLD LIQUORS - TULSA OK REF# 577	1	232	1
2437	1045.58	2021-11-22	primaryAccount	110275	CHECK -  -	2	177	1
2438	609.70	2021-11-22	primaryAccount	110274	CHECK -  -	2	113	1
2439	1055.58	2021-11-22	primaryAccount	110273	CHECK -  -	2	5	1
2430	16.29	2021-11-23	primaryAccount	110272	CHECK -  -	2	108	1
2435	2888.00	2021-11-23	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2465	900.00	2021-11-29	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2434	3000.00	2021-11-23	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2433	11.32	2021-11-23	primaryAccount		ACH Debit - ACH DEBITS     SWIPE IT 5153 - DOS BANDITO	2	162	1
2429	1000.00	2021-11-24	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2440	33.10	2021-11-22	primaryAccount	110265	CHECK -  - Chase Cox	2	233	1
2458	1900.00	2021-12-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2490	25.00	2021-11-22	expensesAccount	2007	OD ITEM FEE -  -	1	55	1
3661	497.06	2022-05-09	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
2492	25.00	2021-11-22	expensesAccount	2004	OD ITEM FEE -  -	1	55	1
3662	326.40	2022-05-09	primaryAccount		ACH Debit - ACH EFT0509    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
2494	25.00	2021-11-22	expensesAccount	2003	OD ITEM FEE -  -	1	55	1
3663	165.00	2022-05-09	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
2496	25.00	2021-11-22	expensesAccount		OD ITEM FEE -  -	1	55	1
2497	250.00	2021-11-22	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	1	59	1
2498	98.64	2021-11-22	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 76118	1	39	1
2499	13.48	2021-11-22	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 854050	1	32	1
3664	149.50	2022-05-09	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
2502	1.00	2021-12-02	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 602857	1	22	1
2503	2740.93	2021-12-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M5416	1	124	1
2504	6.00	2021-11-30	primaryAccount		Account Service Charge -  -	1	55	1
2505	10.00	2021-11-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	1	55	1
2506	25.00	2021-11-30	primaryAccount		OD ITEM FEE -  -	1	55	1
2508	25.00	2021-11-29	primaryAccount		OD ITEM FEE -  -	1	55	1
2509	3414.27	2021-11-29	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M2092	1	124	1
2510	34.99	2021-11-29	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	1	133	1
2515	25.00	2021-11-24	primaryAccount		OD ITEM FEE -  -	1	55	1
2516	1000.00	2021-11-24	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M8148	1	124	1
2518	1000.00	2021-11-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M5898	1	124	1
2519	1000.00	2021-11-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M9404	1	124	1
2521	25.00	2021-12-03	expensesAccount	1004	NSF RETURN ITEM FEE -  -	2	55	1
2522	25.00	2021-12-02	expensesAccount	1004	OD ITEM FEE -  -	2	55	1
2525	6.00	2021-11-30	expensesAccount		Account Service Charge -  -	2	55	1
2526	4.00	2021-11-30	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	1
2500	8.99	2021-11-22	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - BIXBY OK REF# 59767	1	92	1
2523	3079.00	2021-12-02	expensesAccount	1004	CHECK -  -	2	30	1
2527	28.59	2021-11-24	cash			1	44	1
2483	8.68	2021-11-29	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR TREE - TULSA OK REF# 62826	1	236	1
2528	63.75	2021-11-24	cash			1	25	1
2512	993.30	2021-11-26	primaryAccount		POS Transaction DDA - D/C TRN FACEBK 93FA7A7JF - 650-5434800 CA REF# 26355	1	169	1
2491	935.38	2021-11-22	expensesAccount	2007	CHECK -  -	1	4	1
2529	7.14	2021-11-27	cash			2	97	1
2467	140.00	2021-11-22	primaryAccount	1325	CHECK -  -	1	178	1
2507	1000.00	2021-11-30	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	214	1
2487	539.87	2021-11-22	expensesAccount	2014	CHECK -  -	1	215	1
2530	22.74	2021-11-30	cash			1	47	1
2531	24.83	2021-12-01	cash			1	92	1
2493	801.80	2021-11-22	expensesAccount	2004	CHECK -  -	1	178	1
2532	63.75	2021-12-02	cash			1	25	1
2533	15.20	2021-12-03	cash			1	80	1
2514	1.00	2021-11-24	primaryAccount		ATM Service Charge - ATM D/F FACEBK *HVRZ583J - fb.me/ads CA REF# 61127	1	169	1
2534	67.48	2021-12-02	cash			2	43	1
2535	60.00	2021-12-02	cash			2	234	1
2495	209.86	2021-11-22	expensesAccount	2003	CHECK -  -	1	225	1
2536	56.16	2021-12-03	cash			2	32	1
2537	43.37	2021-12-03	cash			2	97	1
2520	800.00	2021-11-22	primaryAccount		COUNTER WITHDRAWAL -  -	1	62	1
2538	213.00	2021-12-03	cash			2	235	1
2513	1.00	2021-11-24	primaryAccount		ATM Service Charge - ATM D/F FACEBK 3EZRK9KJF - 650-5434800 CA REF# 422671	1	169	1
2542	1000.00	2021-12-24	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2517	1.00	2021-11-23	primaryAccount		ATM Service Charge - ATM D/F FACEBK UNUZ89PHF - 650-5434800 CA REF# 290638	1	169	1
2511	1.00	2021-11-26	primaryAccount		ATM Service Charge - ATM D/F FACEBK *737Y683J - fb.me/ads CA REF# 347206	1	169	1
2436	1000.00	2021-11-23	primaryAccount		ACCOUNT ADJUSTMENT- DEBIT - 11/22 Withdrawal Drawer 5525 - Trans 6	2	100	1
2541	55.26	2021-12-24	primaryAccount		POS Transaction DDA - D/C TRN QT 80 INSIDE - BROKEN ARROW OK REF# 951671	2	97	1
2543	1.75	2021-12-23	primaryAccount		ATM Transaction Charge - ATM FEE 2003 S 129TH E AVE - TULSA OK REF# 923395	2	55	1
2544	1.75	2021-12-23	primaryAccount		ATM Transaction Charge - ATM FEE 2003 S 129TH E AVE - TULSA OK REF# 591018	2	55	1
2324	1700.00	2021-11-17	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2524	1000.00	2021-12-02	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2540	200.00	2021-12-08	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2539	792.41	2021-12-14	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2501	1000.00	2021-12-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
2546	118.50	2021-12-23	primaryAccount		ACH Debit - ACH EFT1223    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2547	102.95	2021-12-23	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
3667	500.00	2022-05-09	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2549	1776.20	2021-12-23	primaryAccount		POS Transaction DDA - D/C TRN IN *CREATIVE DEV - 561-3105774 FL REF# 67311	2	105	1
2552	1764.07	2021-12-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
3668	1486.26	2022-05-06	primaryAccount	110448	CHECK -  -	2	244	\N
3669	865.72	2022-05-06	primaryAccount	110445	CHECK -  -	2	117	\N
3670	1327.08	2022-05-06	primaryAccount	111	CHECK -  -	2	221	\N
3666	1000.00	2022-05-09	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
2566	1733.52	2021-12-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2567	519.01	2021-12-20	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2568	466.54	2021-12-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	1
2569	250.00	2021-12-20	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	1
2573	2852.08	2021-12-17	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2574	637.86	2021-12-17	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	1
2575	162.60	2021-12-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2581	217.60	2021-12-16	primaryAccount		ACH Debit - ACH EFT1216    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2582	149.31	2021-12-16	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 64324	2	158	1
2585	2377.32	2021-12-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2586	184.07	2021-12-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	1
2594	45.71	2021-12-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2596	15.96	2021-12-14	primaryAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - BROKEN ARROW( OK REF# 701641	2	33	1
2597	1133.10	2021-12-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2598	432.81	2021-12-13	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	1
2599	23.10	2021-12-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	1
2603	102.95	2021-12-10	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	1
2571	713.91	2021-12-17	primaryAccount	110294	CHECK -  - Caleb Forster Labor	2	244	1
2595	19.00	2021-12-14	primaryAccount		POS Transaction DDA - D/C TRN EL GALLO GIRO RE - TULSA OK REF# 24872	2	189	1
2584	3079.00	2021-12-15	primaryAccount	405	CHECK -  -	2	30	1
2588	3000.00	2021-12-15	primaryAccount		COUNTER WITHDRAWAL -  -	2	29	1
2589	1000.00	2021-12-15	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2560	556.65	2021-12-20	primaryAccount	110302	CHECK -  - Jordan Westerfield	2	242	1
2572	1000.00	2021-12-17	primaryAccount	406	CHECK -  - Caleb Forster - Labor?	2	189	1
2563	744.19	2021-12-20	primaryAccount	110293	CHECK -  -	2	215	1
2570	1000.00	2021-12-20	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2565	558.61	2021-12-20	primaryAccount	401	CHECK -  -	2	238	1
2564	979.21	2021-12-20	primaryAccount	110291	CHECK -  -	2	117	1
2561	643.56	2021-12-20	primaryAccount	110299	CHECK -  -	2	113	1
2548	6.32	2021-12-23	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	1
2557	587.99	2021-12-21	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 50755	2	24	1
2555	1055.58	2021-12-21	primaryAccount	110298	CHECK -  -	2	5	1
2554	300.00	2021-12-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	235	1
2553	5000.00	2021-12-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2545	150.00	2021-12-23	primaryAccount	408	CHECK -  - Leo Paycheck?	2	235	1
2587	3500.00	2021-12-15	primaryAccount		COUNTER WITHDRAWAL -  - to bixby primary	2	179	1
2590	2500.00	2021-12-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile - to bixby primary	2	179	1
2559	2500.00	2021-12-21	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - to bixby primary	2	179	1
2558	12000.00	2021-12-21	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - to bixby primary	2	179	1
2583	2736.75	2021-12-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	1
2551	23.00	2021-12-23	primaryAccount		ATM - Withdrawal - DDA - ATM W/D 2003 S 129TH E AVE - TULSA OK REF# 923395	2	188	1
2550	83.00	2021-12-23	primaryAccount		ATM - Withdrawal - DDA - ATM W/D 2003 S 129TH E AVE - TULSA OK REF# 591018	2	188	1
2576	653.73	2021-12-17	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 50001	2	243	1
2577	538.11	2021-12-17	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 53170	2	243	1
2578	366.46	2021-12-17	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 36415	2	243	1
2591	5652.29	2021-12-14	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
2592	4997.54	2021-12-14	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
2593	1485.14	2021-12-14	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
2604	19.35	2021-12-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
3672	2919.08	2022-05-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3673	175.00	2022-05-06	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
3674	107.16	2022-05-06	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3675	100.00	2022-05-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
2611	435.78	2021-12-09	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	1
2612	126.40	2021-12-09	primaryAccount		ACH Debit - ACH EFT1209    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	1
2613	89.85	2021-12-09	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	1
2614	5.40	2021-12-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF NOVEMBER 2021	2	55	1
2615	2241.24	2021-12-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
3678	165.00	2022-05-05	primaryAccount		ACH Debit - ACH EFT0505    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3679	19.80	2022-05-04	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF APRIL 2022	2	55	\N
3714	65.00	2022-05-29	cash			2	110	17
3680	43.09	2022-05-04	primaryAccount	110427	CHECK -  -	2	259	\N
3677	61.54	2022-05-05	primaryAccount	110410	CHECK -  -	2	259	\N
3717	13.52	2022-05-31	cash			2	44	17
2627	1262.38	2021-12-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	1
2628	765.93	2021-12-06	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	1
2629	442.00	2021-12-06	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	1
2634	17.21	2021-12-24	expensesAccount		POS Transaction DDA - D/C TRN QT 94 INSIDE - BROKEN ARROW OK REF# 969869	1	97	1
2639	250.00	2021-12-20	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	1	59	1
2644	1.00	2021-12-10	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #6342 - TULSA OK REF# 740829	1	32	1
2645	130.52	2021-12-10	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 24099	1	32	1
2646	53.67	2021-12-10	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 129176	1	32	1
2651	12.50	2021-12-08	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - TULSA OK REF# 290380	1	33	1
2652	48.39	2021-12-06	expensesAccount		POS Transaction DDA - D/C TRN DOC'S COUNTRY MA - BIXBY OK REF# 878652	1	47	1
2650	1.00	2021-12-08	expensesAccount		ATM Service Charge - ATM D/F Two Parts Liquor - Bixby OK REF# 409265	1	80	1
2637	1.00	2021-12-23	expensesAccount		ATM Service Charge - ATM D/F KUM&amp;GO 1835 BIXB - BIXBY OK REF# 627641	1	48	1
2649	1.00	2021-12-08	expensesAccount		ATM Service Charge - ATM D/F Two Parts Liquor - Bixby OK REF# 406279	1	80	1
2647	169.28	2021-12-09	expensesAccount		POS Transaction DDA - D/C TRN TWO PARTS LIQUOR - BIXBY OK REF# 80008	1	80	1
2638	73.48	2021-12-23	expensesAccount		POS Transaction DDA - D/C TRN KUM&amp;GO 1835 BIXB - BIXBY OK REF# 717275	1	48	1
2648	56.40	2021-12-09	expensesAccount		POS Transaction DDA - D/C TRN PARKHILL'S LIQUO - TULSA OK REF# 2078	1	87	1
2642	74.77	2021-12-15	expensesAccount	308	CHECK -  -	1	9	1
2635	1.00	2021-12-23	expensesAccount		ATM Service Charge - ATM D/F KUM&amp;GO 1835 BIXB - BIXBY OK REF# 613863	1	48	1
2636	1.00	2021-12-23	expensesAccount		ATM Service Charge - ATM D/F KUM&amp;GO 1835 BIXB - BIXBY OK REF# 689658	1	48	1
2643	1300.00	2021-12-15	expensesAccount	307	CHECK -  -	1	146	1
2641	871.74	2021-12-16	expensesAccount	306	CHECK -  -	1	4	1
2640	216.08	2021-12-16	expensesAccount	2006	CHECK -  -	1	171	1
2621	583.69	2021-12-06	primaryAccount	110286	CHECK -  -	2	113	1
2620	1045.58	2021-12-06	primaryAccount	110287	CHECK -  -	2	177	1
2631	1000.00	2021-12-06	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2609	2555.00	2021-12-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2626	120.00	2021-12-06	primaryAccount	1003	CHECK -  -	2	106	1
2624	115.98	2021-12-06	primaryAccount	110277	CHECK -  -	2	118	1
2610	350.00	2021-12-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2623	87.01	2021-12-06	primaryAccount	110280	CHECK -  -	2	233	1
2622	1055.58	2021-12-06	primaryAccount	110285	CHECK -  -	2	5	1
2619	584.86	2021-12-07	primaryAccount	1002	CHECK -  -	2	227	1
2632	650.00	2021-12-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile - To bixby primary	2	179	1
2617	22.99	2021-12-08	primaryAccount		POS Transaction DDA - D/C TRN EL GALLO GIRO RE - TULSA OK REF# 50518	2	189	1
2625	362.76	2021-12-06	primaryAccount	1004	CHECK -  - Jordan Westerfield	2	242	1
2633	180.00	2021-12-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2607	37.50	2021-12-10	primaryAccount		POS Transaction DDA - D/C TRN SQ *BARBER CITY - Tulsa OK REF# 16143	2	189	1
2616	350.00	2021-12-08	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	1
2608	1000.00	2021-12-10	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	1
2618	12.93	2021-12-08	primaryAccount		POS Transaction DDA - D/C TRN CHICK-FIL-A #028 - BROKEN ARROW OK REF# 17099	2	189	1
2606	103.09	2021-12-10	primaryAccount		POS Transaction DDA - D/C TRN JD 480 - TULSA OK REF# 59283	2	189	1
2605	108.35	2021-12-10	primaryAccount		POS Transaction DDA - D/C TRN WOODLAND HILLS, - TULSA OK REF# 29359	2	189	1
2656	264.99	2021-12-22	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN DTV*DIRECTV SERV - 800-347-3288 CA REF# 66398	1	1	1
2659	25.00	2021-12-20	primaryAccount	672	OD ITEM FEE -  -	1	55	1
2661	25.00	2021-12-20	primaryAccount	671	OD ITEM FEE -  -	1	55	1
2663	25.00	2021-12-20	primaryAccount	670	OD ITEM FEE -  -	1	55	1
2665	25.00	2021-12-20	primaryAccount	667	OD ITEM FEE -  -	1	55	1
2667	25.00	2021-12-20	primaryAccount	665	OD ITEM FEE -  -	1	55	1
4744	100.00	2022-10-24	cash		Empanadas	2	188	17
2670	146.30	2021-12-20	primaryAccount		ACH Debit - ACH DRAFTS     BIXBY METRO CHA - Dos Bandidos	1	28	1
2671	26.33	2021-12-20	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 40548	1	22	1
2674	392.76	2021-12-17	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - CARLOS LOPEZ	1	21	1
2675	1.00	2021-12-16	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 201105	1	22	1
2676	25.00	2021-12-16	primaryAccount	657	OD ITEM FEE -  -	1	55	1
2678	25.00	2021-12-16	primaryAccount		OD ITEM FEE -  -	1	55	1
2679	1464.24	2021-12-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
2680	1371.71	2021-12-16	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2681	673.56	2021-12-16	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2682	303.79	2021-12-16	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	1
2683	260.32	2021-12-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	1
2684	1.00	2021-12-15	primaryAccount		ATM Service Charge - ATM D/F DTV*DIRECTV SERV - 800-347-3288 CA REF# 279703	1	1	1
2686	25.00	2021-12-14	primaryAccount	658	OD ITEM FEE -  -	1	55	1
2688	1.00	2021-12-13	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 412677	1	22	1
2689	25.00	2021-12-13	primaryAccount	1326	OD ITEM FEE -  -	1	55	1
2691	25.00	2021-12-13	primaryAccount	1324	OD ITEM FEE -  -	1	55	1
2693	25.00	2021-12-13	primaryAccount	661	OD ITEM FEE -  -	1	55	1
2695	25.00	2021-12-13	primaryAccount	660	OD ITEM FEE -  -	1	55	1
2697	25.00	2021-12-10	primaryAccount		OD ITEM FEE -  -	1	55	1
2698	205.95	2021-12-10	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DosBandidos	1	18	1
2699	1.00	2021-12-09	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 423016	1	22	1
2700	4.50	2021-12-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF NOVEMBER 2021	1	55	1
2701	25.00	2021-12-07	primaryAccount	1003	OD ITEM FEE -  -	1	55	1
2703	25.00	2021-12-07	primaryAccount	662	OD ITEM FEE -  -	1	55	1
2705	25.00	2021-12-07	primaryAccount	656	OD ITEM FEE -  -	1	55	1
2707	25.00	2021-12-07	primaryAccount		OD ITEM FEE -  -	1	55	1
2708	7558.58	2021-12-07	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BIXBY	1	21	1
2709	25.00	2021-12-06	primaryAccount	1002	OD ITEM FEE -  -	1	55	1
2713	149.00	2021-12-06	primaryAccount		ACH Debit - ACH CHOWNOW, I CHOWNOW, INC. - DOS BANDIDOS BIXBY LLC	1	20	1
2715	25.00	2021-12-23	primaryAccount		OD ITEM FEE -  -	1	55	1
2716	3476.46	2021-12-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M1430	1	124	1
2717	25.00	2021-12-20	primaryAccount		OD ITEM FEE -  -	1	55	1
2718	1568.50	2021-12-20	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M6502	1	124	1
2719	79.27	2021-12-16	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 30516	1	22	1
2720	3570.38	2021-12-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M2310	1	124	1
2721	105.58	2021-12-06	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 90298	1	22	1
2751	50.00	2021-11-21	cash			2	5	1
2711	78.83	2021-12-06	primaryAccount	659	CHECK -  -	1	9	1
2702	1459.50	2021-12-07	primaryAccount	1003	CHECK -  -	1	30	1
2706	863.89	2021-12-07	primaryAccount	656	CHECK -  -	1	178	1
2704	308.94	2021-12-07	primaryAccount	662	CHECK -  -	1	213	1
2694	561.00	2021-12-13	primaryAccount	661	CHECK -  -	1	129	1
2696	451.75	2021-12-13	primaryAccount	660	CHECK -  -	1	186	1
2692	516.10	2021-12-13	primaryAccount	1324	CHECK -  -	1	186	1
2687	688.29	2021-12-14	primaryAccount	658	CHECK -  -	1	4	1
2677	132.81	2021-12-16	primaryAccount	657	CHECK -  -	1	171	1
2673	94.57	2021-12-17	primaryAccount	655	CHECK -  -	1	225	1
2664	514.80	2021-12-20	primaryAccount	670	CHECK -  -	1	186	1
2660	752.89	2021-12-20	primaryAccount	672	CHECK -  -	1	129	1
2666	75.42	2021-12-20	primaryAccount	667	CHECK -  -	1	226	1
2668	953.07	2021-12-20	primaryAccount	665	CHECK -  -	1	178	1
2712	503.72	2021-12-06	primaryAccount	654	CHECK -  - Zachary DuBois	1	237	1
2710	402.00	2021-12-06	primaryAccount	1002	CHECK -  - Teodoro Mendez	1	238	1
2690	217.08	2021-12-13	primaryAccount	1326	CHECK -  - Jessi Rosas	1	239	1
2669	546.71	2021-12-20	primaryAccount	663	CHECK -  - zachary dubois	1	237	1
2662	143.54	2021-12-20	primaryAccount	671	CHECK -  - Jessi Rosas	1	239	1
2672	2300.00	2021-12-20	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2655	20.00	2021-12-22	primaryAccount		Wire Transfer Fee -  -	1	55	1
2685	2500.00	2021-12-15	primaryAccount		COUNTER WITHDRAWAL -  -	1	179	1
2654	500.00	2021-12-23	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	1	179	1
3259	3.84	2022-03-22	cash			2	44	17
3502	10.00	2022-04-22	cash			2	233	17
2749	56.34	2021-11-21	cash			2	49	1
2601	16.77	2021-12-13	primaryAccount		POS Transaction DDA - D/C TRN LA ROMA PIZZA - TULSA OK REF# 70003	2	189	1
3504	63.87	2022-04-23	cash			2	44	17
3681	1818.00	2022-05-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2295	2736.75	2021-11-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	1
3718	38.79	2022-05-31	cash			2	44	17
2444	1000.00	2021-11-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2653	459.24	2021-12-23	primaryAccount	673	CHECK -  -	1	213	1
2562	589.70	2021-12-20	primaryAccount	110295	CHECK -  -	2	227	1
2752	41.72	2021-11-24	cash			2	32	1
2556	625.46	2021-12-21	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 50748	2	24	1
2600	22.22	2021-12-13	primaryAccount		POS Transaction DDA - D/C TRN SQ *THE LAURANNA - Broken Arrow OK REF# 13662	2	188	1
2443	2500.00	2021-11-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2266	300.00	2021-11-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile - to expenses	1	179	1
2602	2.16	2021-12-13	primaryAccount		POS Transaction DDA - D/C TRN NESTLE TOLL HOUS - TULSA OK REF# 37136	2	189	1
2756	40.16	2021-12-20	cash			2	39	17
2714	2800.00	2021-12-06	primaryAccount		COUNTER WITHDRAWAL -  -	1	29	1
2580	90.00	2021-12-17	primaryAccount		POS Transaction DDA - D/C TRN OK PWP LLC - 000-0000000 OK REF# 16006	2	189	1
2757	15.16	2021-12-20	cash			2	39	17
2758	24.95	2021-12-20	cash			2	87	17
2657	11525.00	2021-12-22	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - EUGENIA SEARS Rent nov-dec-jan	1	16	1
2630	25.00	2021-12-06	primaryAccount		POS Transaction DDA - D/C TRN EL GALLO GIRO RE - TULSA OK REF# 50524	2	189	1
2760	39.22	2021-12-20	cash			2	44	17
2759	20.74	2021-12-20	cash			2	44	17
2658	57.89	2021-12-20	primaryAccount	1327	CHECK -  - Martha Jungo	1	240	1
2761	16.26	2021-12-20	cash			2	92	17
2762	45.47	2021-12-20	cash			2	39	17
2302	4200.00	2021-11-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	1
2579	110.00	2021-12-17	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 30171	2	243	1
2722	25.00	2021-12-06	cash			1	46	1
2723	9.26	2021-12-08	cash			1	92	1
2724	63.75	2021-12-09	cash			1	25	1
2763	15.80	2021-12-20	cash			2	33	17
2725	20.11	2021-12-10	cash			1	43	1
2726	64.85	2021-12-10	cash			2	49	1
2727	100.32	2021-12-10	cash			2	245	1
2728	20.00	2021-12-10	cash			1	95	1
2729	13.03	2021-12-13	cash			1	43	1
2730	14.33	2021-12-14	cash			1	47	1
2731	26.05	2021-12-17	cash			1	47	1
2732	2.13	2021-12-17	cash			1	33	1
2733	12.80	2021-12-17	cash			1	43	1
2734	5.30	2021-12-18	cash			1	33	1
2735	8.26	2021-12-18	cash			1	48	1
2736	5.32	2021-12-18	cash			1	33	1
2737	62.89	2021-12-17	cash			2	232	1
2738	30.00	2021-12-17	cash			2	29	1
2739	8.67	2021-12-22	cash			1	47	1
2740	140.03	2021-12-22	cash			1	25	1
2741	7.14	2021-11-26	cash			2	97	1
2742	20.00	2021-11-26	cash			2	95	1
2743	14.00	2021-12-21	cash			2	206	1
2744	20.00	2021-12-24	cash			2	95	1
2745	24.60	2021-12-24	cash			2	246	1
2746	15.58	2021-12-26	cash			2	44	1
2747	280.00	2021-11-29	cash			2	5	1
2748	41.72	2021-11-24	cash			2	32	1
2750	48.64	2021-11-21	cash			2	39	1
2764	30.44	2021-12-22	cash			2	32	17
2765	12.58	2022-01-22	cash			2	33	17
2766	16.25	2021-12-13	cash			2	39	17
2767	43.03	2021-12-13	cash			2	44	17
2768	60.00	2021-12-15	cash			2	211	17
2769	116.18	2021-12-15	cash			2	32	17
2770	6.00	2021-12-31	expensesAccount		Account Service Charge -  -	2	55	\N
2771	4.00	2021-12-31	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	\N
2773	250.00	2022-01-19	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	1	59	\N
2774	6.00	2021-12-31	expensesAccount		Account Service Charge -  -	1	55	\N
2775	4.00	2021-12-31	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	1	55	\N
2776	25.23	2021-12-30	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 949388	1	97	\N
2777	15.00	2021-12-28	expensesAccount		POS Transaction DDA - D/C TRN QT 7 OUTSIDE - TULSA OK REF# 895871	1	97	\N
2778	104.62	2022-01-21	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
2780	289.04	2022-01-21	primaryAccount		POS Transaction DDA - D/C TRN FEDEX OFFIC20900 - TULSA OK REF# 38341	2	64	\N
2781	500.00	2022-01-21	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2779	9.68	2022-01-21	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	100	\N
2772	1200.00	2021-12-31	expensesAccount	1002	CHECK -  -	2	146	\N
3503	23.00	2022-04-23	cash			2	51	17
3505	40.00	2022-04-23	cash			2	235	17
2786	1854.06	2022-01-20	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BA, LLC	2	21	\N
2787	46.73	2022-01-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3506	22.10	2022-04-24	cash			2	44	17
2792	1818.17	2022-01-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2793	466.54	2022-01-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
2794	250.00	2022-01-19	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
2795	184.07	2022-01-19	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
2812	1540.62	2022-01-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2813	2736.75	2022-01-18	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
2816	2430.65	2022-01-14	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2817	331.43	2022-01-14	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2818	323.00	2022-01-14	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2819	104.62	2022-01-14	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
2821	162.36	2022-01-13	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 54250	2	158	\N
2822	974.84	2022-01-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2823	390.44	2022-01-11	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
2824	89.85	2022-01-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
2825	61.67	2022-01-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2826	23.10	2022-01-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
2830	1235.16	2022-01-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2831	316.77	2022-01-10	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
2833	1833.77	2022-01-10	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 74004	2	31	\N
2834	5000.00	2022-01-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2835	104.62	2022-01-07	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
2836	7044.04	2022-01-07	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 58647	2	31	\N
2838	812.90	2022-01-06	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
2839	295.15	2022-01-06	primaryAccount		ACH Debit - ACH EFT0106    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
2840	240.50	2022-01-06	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
2832	28.56	2022-01-10	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2828	400.00	2022-01-11	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
2827	10060.07	2022-01-11	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
2815	1200.00	2022-01-14	primaryAccount	405	CHECK -  -	2	146	\N
2814	616.44	2022-01-14	primaryAccount	110317	CHECK -  -	2	117	\N
2811	2309.00	2022-01-18	primaryAccount	406	CHECK -  -	2	30	\N
2810	10.37	2022-01-18	primaryAccount	110292	CHECK -  -	2	233	\N
2809	5.94	2022-01-18	primaryAccount	110318	CHECK -  -	2	233	\N
2807	494.73	2022-01-18	primaryAccount	110320	CHECK -  -	2	227	\N
2806	731.54	2022-01-18	primaryAccount	110321	CHECK -  -	2	231	\N
2805	589.60	2022-01-18	primaryAccount	110325	CHECK -  -	2	113	\N
2804	1527.72	2022-01-18	primaryAccount	110326	CHECK -  -	2	177	\N
2803	25.00	2022-01-18	primaryAccount	110328	CHECK -  -	2	205	\N
2801	485.82	2022-01-18	primaryAccount	110331	CHECK -  -	2	242	\N
2796	49.55	2022-01-19	primaryAccount		POS Transaction DDA - D/C TRN CENTRAL PARK TAG - BROKEN ARROW OK REF# 10001	2	100	\N
2797	27.57	2022-01-19	primaryAccount		POS Transaction DDA - D/C TRN CENTRAL PARK TAG - BROKEN ARROW OK REF# 50010	2	100	\N
2791	1876.14	2022-01-19	primaryAccount	410	CHECK -  -	2	214	\N
2790	300.00	2022-01-19	primaryAccount	411	CHECK -  -	2	189	\N
2789	1536.72	2022-01-19	primaryAccount	110324	CHECK -  -	2	5	\N
2788	57.22	2022-01-19	primaryAccount	110330	CHECK -  -	2	206	\N
2782	19.19	2022-01-20	primaryAccount	110323	CHECK -  -	2	108	\N
2802	33.24	2022-01-18	primaryAccount	110329	CHECK -  - Alex Soto	2	250	\N
2784	36.50	2022-01-20	primaryAccount	110309	CHECK -  -Kailey Miesner	2	229	\N
2783	49.44	2022-01-20	primaryAccount	110322	CHECK -  -Kailey Miesner	2	229	\N
2785	41.10	2022-01-20	primaryAccount	110296	CHECK -  - Kailey Miesner	2	229	\N
2799	2500.00	2022-01-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - a Bixby	2	179	\N
2902	564.65	2022-01-06	primaryAccount	664	CHECK -  -	1	225	\N
2829	1420.88	2022-01-10	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2841	460.72	2022-01-06	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 97213	2	24	\N
2842	1110.76	2022-01-05	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4745	56.34	2022-10-26	cash			2	39	17
4750	20.00	2022-10-29	cash			2	235	17
2843	350.00	2022-01-05	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
3507	20.97	2022-04-24	cash			2	44	17
3508	10.73	2022-04-24	cash			2	33	17
2850	1800.00	2022-01-04	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2851	27.00	2022-01-03	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF DECEMBER 2021	2	55	\N
2858	3562.50	2022-01-03	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
2859	1853.32	2022-01-03	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
2860	1075.96	2022-01-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2864	6.00	2021-12-31	primaryAccount		Account Service Charge -  -	2	55	\N
2866	2221.28	2021-12-31	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2867	712.55	2021-12-31	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2868	1300.00	2021-12-31	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2870	171.31	2021-12-30	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
2871	5481.38	2021-12-30	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 80963	2	31	\N
2872	4518.62	2021-12-30	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 80962	2	31	\N
2877	1000.81	2021-12-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2879	412.20	2021-12-28	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
2882	875.64	2021-12-27	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
2883	699.63	2021-12-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2884	235.92	2021-12-27	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
2886	2030.00	2021-12-27	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2888	25.00	2022-01-20	primaryAccount	677	OD ITEM FEE -  -	1	55	\N
2890	59.16	2022-01-20	primaryAccount		ACH Debit - ACH DRAFTS     BIXBY METRO CHA - Dos Bandidos	1	28	\N
2891	1.00	2022-01-18	primaryAccount		ATM Service Charge - ATM D/F DTV*DIRECTV SERV - 800-347-3288 CA REF# 434743	1	1	\N
2892	25.00	2022-01-18	primaryAccount		OD ITEM FEE -  -	1	55	\N
2893	1464.24	2022-01-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	\N
2894	25.00	2022-01-18	primaryAccount		OD ITEM FEE -  -	1	55	\N
2895	392.76	2022-01-18	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - CARLOS LOPEZ	1	21	\N
2896	25.00	2022-01-18	primaryAccount		OD ITEM FEE -  -	1	55	\N
2897	260.32	2022-01-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	1	60	\N
2898	25.00	2022-01-11	primaryAccount	683	OD ITEM FEE -  -	1	55	\N
2900	205.95	2022-01-10	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DosBandidos	1	18	\N
2901	25.00	2022-01-06	primaryAccount	664	OD ITEM FEE -  -	1	55	\N
2869	18.99	2021-12-30	primaryAccount	110301	CHECK -  - Alex Soto	2	250	\N
2880	1045.58	2021-12-27	primaryAccount	110300	CHECK -  -	2	177	\N
2874	5929.36	2021-12-29	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2873	5000.00	2021-12-29	primaryAccount	404	CHECK -  -	2	189	\N
2865	1084.86	2021-12-31	primaryAccount	110306	CHECK -  -	2	244	\N
2852	452.05	2022-01-03	primaryAccount	110315	CHECK -  -	2	242	\N
2855	1055.58	2022-01-03	primaryAccount	110311	CHECK -  -	2	5	\N
2856	728.64	2022-01-03	primaryAccount	110307	CHECK -  -	2	227	\N
2854	1045.58	2022-01-03	primaryAccount	110313	CHECK -  -	2	177	\N
2849	7.08	2022-01-04	primaryAccount	110297	CHECK -  -	2	108	\N
2848	867.11	2022-01-04	primaryAccount	110304	CHECK -  -	2	117	\N
2847	553.38	2022-01-04	primaryAccount	110305	CHECK -  -	2	215	\N
2846	120.11	2022-01-04	primaryAccount	110308	CHECK -  -	2	231	\N
2845	14.79	2022-01-04	primaryAccount	110310	CHECK -  -	2	108	\N
2844	608.36	2022-01-04	primaryAccount	110312	CHECK -  -	2	113	\N
2857	288.00	2022-01-03	primaryAccount	408	CHECK -  - Mariana Perez	2	251	\N
2853	14.95	2022-01-03	primaryAccount	110314	CHECK -  - Alex Soto	2	250	\N
2878	1000.00	2021-12-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
2862	4500.00	2022-01-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - a downtown	2	179	\N
2899	327.72	2022-01-11	primaryAccount	683	CHECK -  -	1	213	\N
2889	112.98	2022-01-20	primaryAccount	677	CHECK -  -	1	171	\N
2887	267.29	2022-01-21	primaryAccount	679	CHECK -  -	1	4	\N
2876	1174.63	2021-12-29	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2875	4471.78	2021-12-29	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2903	25.00	2022-01-06	primaryAccount		OD ITEM FEE -  -	1	55	\N
2904	2981.28	2022-01-06	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BIXBY, LL	1	89	\N
2905	25.00	2022-01-06	primaryAccount		OD ITEM FEE -  -	1	55	\N
2906	149.00	2022-01-06	primaryAccount		ACH Debit - ACH CHOWNOW, I CHOWNOW, INC. - DOS BANDIDOS BIXBY LLC	1	20	\N
2907	25.00	2022-01-05	primaryAccount		OD ITEM FEE -  -	1	55	\N
2908	610.58	2022-01-05	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BIXBY	1	21	\N
2909	25.00	2022-01-05	primaryAccount		OD ITEM FEE -  -	1	55	\N
2910	180.00	2022-01-05	primaryAccount		ACH Debit - ACH LEASE PYMT ICE MAKER SALES - DOS BANDIDO'S	1	27	\N
2911	25.00	2022-01-04	primaryAccount	2102	OD ITEM FEE -  -	1	55	\N
3509	10.56	2022-04-25	cash			2	44	17
3510	14.41	2022-04-25	cash			2	44	17
3682	281.70	2022-05-03	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
2915	1.35	2022-01-03	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF DECEMBER 2021	1	55	\N
2916	25.00	2022-01-03	primaryAccount	2103	OD ITEM FEE -  -	1	55	\N
3683	39.99	2022-05-03	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
2918	25.00	2022-01-03	primaryAccount	676	OD ITEM FEE -  -	1	55	\N
3684	500.00	2022-05-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2921	682.36	2022-01-03	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	\N
2922	557.96	2022-01-03	primaryAccount		ACH Debit - ACH MERCH FEES BNKCD SETTLE - DOS BANDIDOS BIXBY	1	187	\N
2923	93.10	2022-01-03	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS BIXBY LLC	1	15	\N
2924	25.00	2022-01-03	primaryAccount		ACH Debit - ACH MERCH FEES BEYOND - DOS BANDIDOS BIXBY	1	139	\N
2925	212.73	2022-01-03	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN LAVU/ MENUDRIVE - HTTPSLAVU.COM NM REF# 38936	1	19	\N
2926	6.00	2021-12-31	primaryAccount		Account Service Charge -  -	1	55	\N
2927	636.22	2021-12-31	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	\N
2928	627.40	2021-12-31	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	\N
2929	86.13	2021-12-31	primaryAccount		ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	1	14	\N
2930	357.00	2021-12-30	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	\N
2931	252.00	2021-12-30	primaryAccount		ACH Debit - ACH Payment    ATT - 525916002COL1L	1	26	\N
2932	78.00	2021-12-30	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 70742	1	22	\N
3688	4730.17	2022-05-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2920	126.68	2022-01-03	primaryAccount	666	CHECK -  -	1	171	\N
2913	687.01	2022-01-04	primaryAccount	682	CHECK -  -	1	129	\N
3689	4497.07	2022-05-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3690	4095.80	2022-05-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3691	3662.50	2022-05-02	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
2919	638.31	2022-01-03	primaryAccount	676	CHECK -  -	1	178	\N
3693	1564.39	2022-05-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3694	1557.89	2022-05-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
3695	1428.57	2022-05-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
2917	400.00	2022-01-03	primaryAccount	2103	CHECK -  -	1	5	\N
3696	402.18	2022-05-02	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3697	100.00	2022-05-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3698	59.61	2022-05-02	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 73088	2	22	\N
3719	1.50	2022-05-31	cash			2	97	17
2914	277.20	2022-01-04	primaryAccount	674	CHECK -  -	1	237	\N
3723	16.00	2022-06-05	cash			2	44	17
3825	25.00	2022-06-02	primaryAccount		OD ITEM FEE -  -	2	55	\N
2912	428.00	2022-01-04	primaryAccount	2102	CHECK -  -	1	231	\N
3692	2500.00	2022-05-02	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - GBL99PDG	2	189	\N
3827	6.00	2022-05-31	primaryAccount		Account Service Charge -  -	2	55	\N
3687	464.29	2022-05-02	primaryAccount	102	CHECK -  -	2	249	\N
3686	1000.00	2022-05-02	primaryAccount	407	CHECK -  -	2	189	\N
3685	1098.98	2022-05-02	primaryAccount	110417	CHECK -  -	2	5	\N
3828	10.00	2022-05-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
3829	25.00	2022-05-31	primaryAccount		OD ITEM FEE -  -	2	55	\N
3830	3527.26	2022-05-31	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3831	34.99	2022-05-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
3832	1059.82	2022-05-24	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3834	25.22	2022-06-11	cash			2	44	17
3826	282.00	2022-06-02	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	221	\N
3846	15.35	2022-05-26	cash			2	33	17
2933	25.00	2022-01-21	primaryAccount		OD ITEM FEE -  -	1	55	\N
2934	3596.08	2022-01-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	1	124	\N
2935	1.00	2022-01-20	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 6287	1	22	\N
2936	25.00	2022-01-20	primaryAccount		OD ITEM FEE -  -	1	55	\N
3511	6.00	2022-04-29	expensesAccount		Account Service Charge -  -	2	55	\N
2938	25.00	2022-01-20	primaryAccount		OD ITEM FEE -  -	1	55	\N
3512	6.00	2022-04-29	expensesAccount		Account Service Charge -  -	2	55	\N
2941	1.00	2022-01-18	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 407310	1	22	\N
2942	25.00	2022-01-14	primaryAccount		OD ITEM FEE -  -	1	55	\N
2943	2259.66	2022-01-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	1	124	\N
2944	1.00	2022-01-13	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 410215	1	22	\N
2945	1.00	2022-01-10	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 12499	1	22	\N
2946	25.00	2022-01-07	primaryAccount		OD ITEM FEE -  -	1	55	\N
2948	1.00	2022-01-06	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 12974	1	22	\N
2949	1.00	2022-01-05	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 202748	1	22	\N
2950	25.00	2022-01-04	primaryAccount		OD ITEM FEE -  -	1	55	\N
2951	2922.52	2022-01-04	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M1672	1	124	\N
2952	1.00	2022-01-03	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 201675	1	22	\N
2953	2291.80	2022-01-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M3714	1	124	\N
2954	6.00	2021-12-31	primaryAccount		Account Service Charge -  -	1	55	\N
2955	10.00	2021-12-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	1	55	\N
2956	25.00	2021-12-30	primaryAccount		OD ITEM FEE -  -	1	55	\N
2957	3696.14	2021-12-30	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - M1008	1	124	\N
2958	25.00	2021-12-28	primaryAccount		OD ITEM FEE -  -	1	55	\N
2959	34.99	2021-12-28	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	1	133	\N
3513	1.00	2022-04-26	expensesAccount		ATM Service Charge - ATM D/F SUPERMERCADOS MO - Broken Arrow OK REF# 986048	2	44	\N
2881	743.00	2021-12-27	primaryAccount	409	CHECK -  - pedro hernandez	2	249	\N
2837	1000.00	2022-01-07	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
2947	68.00	2022-01-07	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	100	\N
3514	104.11	2022-04-26	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 4631	2	32	\N
3515	40.94	2022-04-26	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 149449	2	32	\N
2939	100.97	2022-01-20	primaryAccount		ACH Debit - ACH CAT PMTS   EZCATER INC - DOS BANDIDOS DOWN...	1	46	\N
3516	250.00	2022-04-22	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
3517	17.30	2022-04-22	expensesAccount		POS Transaction DDA - D/C TRN QT 80 INSIDE - BROKEN ARROW OK REF# 784683	2	97	\N
2798	4800.00	2022-01-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online - a Downtown	2	179	\N
2961	6.00	2022-01-11	cash			2	229	17
3518	12.10	2022-04-22	expensesAccount		POS Transaction DDA - D/C TRN QT 80 - BROKEN ARROW OK REF# 3694	2	97	\N
2962	12.00	2022-01-15	cash			2	33	17
2940	1000.00	2022-01-19	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	1	100	\N
2963	48.30	2022-01-17	cash			2	39	17
2808	1486.27	2022-01-18	primaryAccount	110319	CHECK -  -	2	244	\N
2964	6.00	2022-01-18	cash			2	162	17
2800	50.00	2022-01-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	\N
2863	2100.00	2022-01-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	\N
2965	12.98	2022-01-22	cash			2	96	17
3519	85.80	2022-04-21	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 14130	2	32	\N
2966	200.00	2022-01-17	cash			2	188	17
2937	191.62	2022-01-20	primaryAccount		ACH Debit - ACH CAT PMTS   EZCATER INC - DOS BANDIDOS DOWN...	1	46	\N
2974	1200.00	2022-01-28	primaryAccount	407	CHECK -  -	2	146	\N
2973	847.21	2022-01-28	primaryAccount	110332	CHECK -  -	2	117	\N
2972	1486.27	2022-01-28	primaryAccount	110334	CHECK -  -	2	244	\N
3520	1.00	2022-04-18	expensesAccount		ATM Service Charge - ATM D/F SUPERMERCADOS MO - Broken Arrow OK REF# 813642	2	44	\N
2885	123.15	2021-12-27	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 785041	2	100	\N
2967	43.36	2022-01-12	cash			2	49	17
2968	16.00	2022-01-12	cash			2	44	17
2969	33.37	2022-01-12	cash			2	44	17
2970	9.84	2022-01-12	cash			2	49	17
2975	1873.58	2022-01-28	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2976	325.10	2022-01-28	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
2977	164.27	2022-01-28	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
2971	1098.97	2022-01-28	primaryAccount	110339	CHECK -  -	2	5	\N
2978	7500.00	2022-01-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
2980	201.68	2022-01-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
2981	122.40	2022-01-27	primaryAccount		ACH Debit - ACH EFT0127    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
2982	163.69	2022-01-27	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 71302	2	22	\N
2984	1970.11	2022-01-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2985	193.77	2022-01-26	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
2989	992.00	2022-01-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
2990	602.18	2022-01-24	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
2991	74.94	2022-01-24	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
2996	25.00	2022-01-28	primaryAccount	681	OD ITEM FEE -  -	1	55	\N
2998	25.00	2022-01-28	primaryAccount		OD ITEM FEE -  -	1	55	\N
2999	341.54	2022-01-28	primaryAccount		ACH Debit - ACH Payment    ATT - 184626004COL1N	1	26	\N
3000	25.00	2022-01-28	primaryAccount		OD ITEM FEE -  -	1	55	\N
3001	334.00	2022-01-28	primaryAccount		ACH Debit - ACH PAYMENTS   OpenTable - Dos Bandidos Bixby	1	132	\N
3002	25.00	2022-01-27	primaryAccount	678	OD ITEM FEE -  -	1	55	\N
3005	1.00	2022-01-24	primaryAccount		ATM Service Charge - ATM D/F DTV*DIRECTV SERV - 800-347-3288 CA REF# 236781	1	1	\N
3006	25.00	2022-01-27	primaryAccount		OD ITEM FEE -  -	1	55	\N
3007	34.99	2022-01-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	1	133	\N
3008	1.00	2022-01-24	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 7273	1	22	\N
3004	72.84	2022-01-27	primaryAccount	675	CHECK -  -	1	225	\N
2988	1000.00	2022-01-24	primaryAccount		ACH Debit - ACH ASARFGWY   Coinbase.com - ASARFGWYfb0e	2	189	\N
2994	6.00	2022-01-24	primaryAccount		POS Transaction DDA - D/C TRN SQ *REWIND ESPOR - BROKEN ARROW OK REF# 327288	2	189	\N
3029	54.00	2022-01-31	cash			2	32	17
2995	1000.00	2022-01-24	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3030	34.34	2022-02-02	cash			2	32	17
3031	9.72	2022-02-04	cash			2	44	17
2992	23.00	2022-01-24	primaryAccount		POS Transaction DDA - D/C TRN SQ *REWIND ESPOR - BROKEN ARROW OK REF# 169608	2	189	\N
2986	1000.00	2022-01-24	primaryAccount		ACH Debit - ACH VTNSNYBP   Coinbase.com - VTNSNYBPfb0e	2	189	\N
2983	267.37	2022-01-26	primaryAccount	110327	CHECK -  -	2	106	\N
2987	1000.00	2022-01-24	primaryAccount		ACH Debit - ACH MYT3AYK4   Coinbase.com - MYT3AYK4fb0e	2	189	\N
3032	5.50	2022-02-07	cash			2	44	17
2993	8.00	2022-01-24	primaryAccount		POS Transaction DDA - D/C TRN SQ *REWIND ESPOR - BROKEN ARROW OK REF# 172233	2	189	\N
2997	93.15	2022-01-28	primaryAccount	681	CHECK -  -	1	239	\N
1905	2644.24	2021-10-13	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
1932	5796.16	2021-10-06	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
2979	2000.00	2022-01-27	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - 2DYGWRXZ	2	189	\N
1480	6870.37	2021-09-22	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	1
3009	200.00	2022-01-03	cash			2	237	17
3010	128.94	2022-01-04	cash			2	39	17
3011	60.00	2022-01-05	cash			2	170	17
3003	45.89	2022-01-27	primaryAccount	678	CHECK -  -	1	226	\N
3012	30.00	2022-01-05	cash		Cake Georgia	2	188	17
3013	30.00	2022-01-05	cash		Diego	2	46	17
3033	32.52	2022-02-07	cash			2	49	17
3014	6.40	2022-01-07	cash			2	33	17
3015	12.80	2022-01-08	cash			2	96	17
3016	12.52	2022-01-27	cash			2	44	17
3017	11.72	2022-01-27	cash			2	44	17
3018	33.00	2022-01-28	cash			2	97	17
3019	36.98	2022-01-25	cash			2	32	17
3020	32.52	2022-01-26	cash			2	49	17
3021	7.42	2022-01-26	cash			2	33	17
3022	35.00	2022-01-29	cash			2	39	17
3023	58.12	2022-01-30	cash			2	33	17
3024	30.31	2022-01-30	cash			2	33	17
3025	74.10	2022-01-30	cash			2	33	17
3026	33.98	2022-01-30	cash			2	39	17
3027	32.52	2022-01-30	cash			2	49	17
3028	11.72	2022-01-30	cash			2	51	17
3034	7.42	2022-02-07	cash			2	33	17
3035	93.72	2022-02-08	cash			2	39	17
3036	68.18	2022-02-09	cash			2	33	17
3037	97.24	2022-02-09	cash			2	32	17
3038	64.19	2022-02-10	cash			2	44	17
3039	24.03	2022-02-10	cash			2	44	17
3040	18.42	2022-02-11	cash			2	39	17
3041	31.27	2022-02-11	cash			2	43	17
3042	14.10	2022-02-11	cash			2	43	17
3043	13.56	2022-02-11	cash			2	51	17
3044	20.00	2022-02-11	cash			2	108	17
3045	136.33	2022-02-13	cash			2	39	17
3046	6.00	2022-01-31	expensesAccount		Account Service Charge -  -	2	55	\N
3047	4.00	2022-01-31	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	\N
3048	1218.80	2022-02-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3049	104.62	2022-02-11	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3050	23.10	2022-02-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4746	22.21	2022-10-28	cash			2	97	17
3052	205.34	2022-02-10	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 28980	2	158	\N
3053	2065.58	2022-02-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3054	1202.47	2022-02-09	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
3055	457.69	2022-02-09	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
3056	175.00	2022-02-09	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
3057	89.85	2022-02-09	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
3521	43.36	2022-04-18	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 27174	2	49	\N
3059	471.51	2022-02-08	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 37656	2	24	\N
3063	536.49	2022-02-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3064	253.50	2022-02-07	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
3065	209.08	2022-02-07	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3066	104.62	2022-02-04	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3067	21.60	2022-02-03	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JANUARY 2022	2	55	\N
3068	1318.57	2022-02-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
3069	24.16	2022-02-02	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 91458	2	22	\N
3072	3562.50	2022-02-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
3073	2846.96	2022-02-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3074	251.38	2022-02-01	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
3082	789.21	2022-01-31	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3083	410.82	2022-01-31	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3084	25.00	2022-02-10	primaryAccount		OD ITEM FEE -  -	2	55	\N
3085	3766.58	2022-02-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3086	25.00	2022-02-02	primaryAccount		OD ITEM FEE -  -	2	55	\N
3087	3381.02	2022-02-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3088	6.00	2022-01-31	primaryAccount		Account Service Charge -  -	2	55	\N
3089	10.00	2022-01-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
3090	2433.86	2022-01-31	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3091	544.42	2022-01-31	primaryAccount		POS Transaction DDA - D/C TRN FACEBK TKBEXBKHF - 650-5434800 CA REF# 84744	2	169	\N
3077	60.08	2022-01-31	primaryAccount	110342	CHECK -  -	2	205	\N
3060	2549.90	2022-02-08	primaryAccount		Para cerrar Bixby -- COUNTER WITHDRAWAL -  -	2	189	\N
3079	656.31	2022-01-31	primaryAccount	110335	CHECK -  -	2	227	\N
3080	20.94	2022-01-31	primaryAccount	110333	CHECK -  -	2	233	\N
3076	562.17	2022-01-31	primaryAccount	110344	CHECK -  -	2	242	\N
3058	1255.00	2022-02-09	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3078	623.28	2022-01-31	primaryAccount	110340	CHECK -  -	2	113	\N
3070	31.04	2022-02-01	primaryAccount	110343	CHECK -  -	2	206	\N
3075	1000.00	2022-02-01	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3062	1089.97	2022-02-07	primaryAccount	110341	CHECK -  -	2	177	\N
3092	80.00	2022-02-14	cash			2	39	17
3081	780.00	2022-01-31	primaryAccount	155	CHECK -  -	2	189	\N
3093	47.70	2022-02-16	cash			2	32	17
3094	11.26	2022-02-21	cash			2	32	17
3095	140.80	2022-02-21	cash			2	103	17
3096	61.45	2022-02-24	cash			2	93	17
3071	234.57	2022-02-01	primaryAccount	110336	CHECK -  - Jaylee Hood	2	252	\N
3061	210.00	2022-02-08	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3097	70.54	2022-02-25	cash			2	51	17
3098	19.21	2022-02-25	cash			2	44	17
3099	29.25	2022-02-25	cash			2	43	17
3100	17.45	2022-02-26	cash			2	44	17
3101	29.94	2022-02-26	cash			2	33	17
3102	36.82	2022-02-27	cash			2	39	17
3107	263.20	2022-02-25	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3105	841.32	2022-02-25	primaryAccount	110358	CHECK -  -	2	117	\N
3104	1098.97	2022-02-25	primaryAccount	110367	CHECK -  -	2	5	\N
3103	1089.97	2022-02-25	primaryAccount	110370	CHECK -  -	2	177	\N
3106	223.90	2022-02-25	primaryAccount	106	CHECK -  - Pablo Hernandez	2	255	\N
3111	2335.13	2022-02-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3112	452.73	2022-02-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3114	3124.53	2022-02-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3118	924.25	2022-02-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3119	480.63	2022-02-22	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3120	468.84	2022-02-22	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
3121	250.00	2022-02-22	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
3122	2197.38	2022-02-22	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 1472	2	31	\N
3123	1305.73	2022-02-22	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 1471	2	31	\N
3124	1000.00	2022-02-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3125	172.99	2022-02-18	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3129	253.20	2022-02-17	primaryAccount		ACH Debit - ACH EFT0217    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3130	132.74	2022-02-17	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 31688	2	22	\N
3133	397.80	2022-02-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3134	2730.62	2022-02-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
3135	2612.14	2022-02-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3136	184.07	2022-02-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
3146	1903.01	2022-02-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3147	321.30	2022-02-14	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3149	1.00	2022-02-25	primaryAccount		ATM Service Charge - ATM D/F FACEBK JY2MCCBJF - 650-5434800 CA REF# 420559	2	169	\N
3150	25.00	2022-02-22	primaryAccount		OD ITEM FEE -  -	2	55	\N
3151	3224.30	2022-02-22	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3152	250.00	2022-02-23	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
3154	17.53	2022-02-23	expensesAccount		POS Transaction DDA - D/C TRN LAS AMERICAS SUP - TULSA OK REF# 88288	2	65	\N
3155	15.72	2022-02-23	expensesAccount		POS Transaction DDA - D/C TRN QT 7 OUTSIDE - TULSA OK REF# 365272	2	97	\N
3156	1.00	2022-02-22	expensesAccount		ATM Service Charge - ATM D/F RESTAURANT EQUIP - TULSA OK REF# 943634	2	51	\N
3157	1.00	2022-02-22	expensesAccount		ATM Service Charge - ATM D/F RESTAURANT EQUIP - TULSA OK REF# 411440	2	51	\N
3158	16.70	2022-02-22	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 33386	2	44	\N
3159	12.96	2022-02-22	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 96897	2	49	\N
3160	10.93	2022-02-22	expensesAccount		POS Transaction DDA - D/C TRN QT 7 - TULSA OK REF# 54169	2	97	\N
3161	77.82	2022-02-18	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 720629	2	32	\N
3162	25.91	2022-02-16	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 37651	2	49	\N
3163	7.48	2022-02-15	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 46708	2	44	\N
3164	127.64	2022-02-14	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - TULSA OK REF# 17164	2	33	\N
3197	486.14	2022-03-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3139	531.80	2022-02-14	primaryAccount	110353	CHECK -  -	2	113	\N
3140	16.11	2022-02-14	primaryAccount	110350	CHECK -  -	2	108	\N
3145	121.60	2022-02-14	primaryAccount	101	CHECK -  -	2	106	\N
3144	1486.27	2022-02-14	primaryAccount	105	CHECK -  -	2	244	\N
3142	857.59	2022-02-14	primaryAccount	110345	CHECK -  -	2	117	\N
3141	695.86	2022-02-14	primaryAccount	110347	CHECK -  -	2	227	\N
3137	482.52	2022-02-14	primaryAccount	110357	CHECK -  -	2	242	\N
3138	34.63	2022-02-14	primaryAccount	110356	CHECK -  -	2	205	\N
3132	1925.50	2022-02-16	primaryAccount	104	CHECK -  -	2	30	\N
3131	134.29	2022-02-16	primaryAccount	110355	CHECK -  -	2	106	\N
3116	1098.98	2022-02-22	primaryAccount	110352	CHECK -  -	2	5	\N
3115	1089.98	2022-02-22	primaryAccount	110354	CHECK -  -	2	177	\N
3117	41.79	2022-02-22	primaryAccount	110346	CHECK -  -	2	233	\N
3113	500.00	2022-02-23	primaryAccount	107	CHECK -  - Carlos Lopez Labor	2	254	\N
3109	1486.27	2022-02-24	primaryAccount	110360	CHECK -  -	2	244	\N
3143	150.06	2022-02-14	primaryAccount	110338	CHECK -  - Ava Moss	2	253	\N
3148	1000.00	2022-02-14	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3126	5.84	2022-02-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
3127	1000.00	2022-02-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3128	600.00	2022-02-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	169	\N
3198	164.27	2022-03-11	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3522	17.67	2022-04-18	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 689323	2	44	\N
3192	1486.27	2022-03-11	primaryAccount	110378	CHECK -  -	2	244	\N
3191	1098.97	2022-03-11	primaryAccount	110384	CHECK -  -	2	5	\N
3153	128.96	2022-02-23	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 71668	2	39	\N
3195	1503.50	2022-03-11	primaryAccount	101	CHECK -  -	2	30	\N
3190	598.98	2022-03-11	primaryAccount	110386	CHECK -  -	2	113	\N
3531	6500.00	2022-04-27	primaryAccount	159	CHECK -  -	2	189	\N
3804	5.00	2022-05-19	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
3194	1200.00	2022-03-11	primaryAccount	103	CHECK -  -	2	146	\N
3165	5.63	2022-02-17	cash			2	44	17
3166	22.73	2022-03-01	cash			2	39	17
3523	54.41	2022-04-29	primaryAccount	110434	CHECK -  -	2	108	\N
3168	29.40	2022-03-01	cash			2	96	17
3167	7.16	2022-03-01	cash			2	92	17
3169	18.52	2022-03-01	cash			2	44	17
3170	24.04	2022-03-02	cash			2	44	17
3171	34.72	2022-03-08	cash			2	33	17
3172	38.47	2022-03-08	cash			2	44	17
3173	3.50	2022-03-11	cash			2	64	17
3174	6.00	2022-02-28	expensesAccount		Account Service Charge -  -	2	55	\N
3175	4.00	2022-02-28	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	\N
3176	19.04	2022-03-11	expensesAccount		POS Transaction DDA - D/C TRN LOWE'S #1536 - BROKEN ARROW OK REF# 793445	2	43	\N
3177	79.96	2022-03-10	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 859570	2	32	\N
3178	91.28	2022-03-07	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #4839 - TULSA OK REF# 58965	2	32	\N
3179	43.19	2022-03-04	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 6203	2	49	\N
3180	21.62	2022-03-04	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 76190	2	39	\N
3181	18.34	2022-03-04	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #3340 - TULSA OK REF# 264803	2	33	\N
3182	123.14	2022-03-03	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 154922	2	32	\N
3183	42.53	2022-03-03	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 172445	2	44	\N
3184	20.00	2022-03-03	expensesAccount		POS Transaction DDA - D/C TRN QT 7 OUTSIDE - TULSA OK REF# 300510	2	97	\N
3185	149.69	2022-03-01	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 53669	2	39	\N
3186	6.00	2022-02-28	expensesAccount		Account Service Charge -  -	2	55	\N
3187	4.00	2022-02-28	expensesAccount		Account Service Fee - PAPER STATEMENT FEE-BUSINESS -	2	55	\N
3188	43.32	2022-02-28	expensesAccount		POS Transaction DDA - D/C TRN LOWE'S #1536 - BROKEN ARROW OK REF# 603974	2	43	\N
3189	22.13	2022-02-28	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 234105	2	44	\N
3752	2000.00	2022-06-01	primaryAccount	103	CHECK -  - Juventino Duran	2	267	\N
3525	654.26	2022-04-29	primaryAccount	105	CHECK -  -	2	113	\N
3196	2253.66	2022-03-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3701	25.00	2022-05-05	primaryAccount		OD ITEM FEE -  -	2	55	\N
3193	862.83	2022-03-11	primaryAccount	110375	CHECK -  -	2	117	\N
3702	2703.05	2022-05-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3703	10.00	2022-05-02	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
3720	115.00	2022-05-31	cash			2	89	17
3721	20.00	2022-06-04	cash			2	235	17
3722	16.29	2022-06-05	cash			2	92	17
3737	1776.00	2022-05-18	expensesAccount	305	CHECK -  -	2	30	\N
3843	20.00	2022-05-21	cash			2	235	17
3841	7.94	2022-05-21	cash			2	33	17
3779	327.31	2022-05-24	primaryAccount		POS Transaction DDA - D/C TRN DRI*UPRINTING - 888-888-4211 CA REF# 87795	2	169	\N
3822	2500.00	2022-05-16	primaryAccount		Transfer to DDA - trans from DDx4583 to DDx6235 -	2	179	\N
3839	21.54	2022-05-21	cash			2	49	17
3844	6.57	2022-06-24	cash			2	44	17
3847	35.13	2022-05-27	cash			2	49	17
3848	41.28	2022-05-27	cash			2	44	17
3849	20.00	2022-05-27	cash			2	235	17
3851	106.65	2022-06-03	cash			2	268	17
3852	28.18	2022-06-03	cash			2	39	17
3853	16.25	2022-06-03	cash			2	39	17
3854	20.00	2022-06-03	cash			2	235	17
3855	6.43	2022-06-03	cash			2	33	17
3857	600.00	2022-06-24	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3858	12.99	2022-06-26	expensesAccount		EFT PIN DDA SUPERMERCADOS MO 000000001299184800220626000000242373	2	44	\N
3859	30.32	2022-06-25	expensesAccount		EFT-SAF PIN DDA QT 28 OUTSIDE 000000003032094714220625605598	2	97	\N
3199	23.10	2022-03-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
3200	800.33	2022-03-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
3201	188.40	2022-03-10	primaryAccount		ACH Debit - ACH EFT0310    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3202	175.00	2022-03-10	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
3203	438.67	2022-03-09	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
3204	89.85	2022-03-09	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
3206	2555.01	2022-03-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3208	104.62	2022-03-08	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3209	644.97	2022-03-08	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 28376	2	24	\N
3214	1587.63	2022-03-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3215	339.46	2022-03-07	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3216	82.27	2022-03-07	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 92018	2	22	\N
3219	273.00	2022-03-03	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
3220	5300.00	2022-03-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3221	2500.00	2022-03-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3222	1000.00	2022-03-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3223	4.95	2022-03-02	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH ON FEBRUARY 2022	2	55	\N
3224	2117.09	2022-03-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3225	1430.12	2022-03-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
3229	3562.50	2022-03-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
3230	355.70	2022-03-01	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
3238	515.27	2022-02-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3239	277.10	2022-02-28	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3241	25.00	2022-03-04	primaryAccount		OD ITEM FEE -  -	2	55	\N
3242	2589.89	2022-03-04	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3243	25.00	2022-03-01	primaryAccount		OD ITEM FEE -  -	2	55	\N
3244	3163.90	2022-03-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3245	25.00	2022-03-01	primaryAccount		OD ITEM FEE -  -	2	55	\N
3246	34.99	2022-03-01	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
3247	6.00	2022-02-28	primaryAccount		Account Service Charge -  -	2	55	\N
3248	10.00	2022-02-28	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
3249	1.00	2022-02-28	primaryAccount		ATM Service Charge - ATM D/F FACEBK QAY96D7JF - 650-5434800 CA REF# 292225	2	169	\N
3250	1.00	2022-02-28	primaryAccount		ATM Service Charge - ATM D/F FACEBK *NBNW5D7J - fb.me/ads CA REF# 259458	2	169	\N
3251	1.00	2022-02-28	primaryAccount		ATM Service Charge - ATM D/F FACEBK 5RJSDCBJF - 650-5434800 CA REF# 325593	2	169	\N
3252	1.00	2022-02-28	primaryAccount		ATM Service Charge - ATM D/F FACEBK *FPD4KCKJ - fb.me/ads CA REF# 95419	2	169	\N
3258	13.30	2022-03-22	cash			2	96	17
3231	514.58	2022-02-28	primaryAccount	110374	CHECK -  -	2	242	\N
3237	2500.00	2022-02-28	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - 4GZS4L53	2	189	\N
3236	1200.00	2022-02-28	primaryAccount	105	CHECK -  -	2	146	\N
3235	721.92	2022-02-28	primaryAccount	110361	CHECK -  -	2	227	\N
3234	633.62	2022-02-28	primaryAccount	110369	CHECK -  -	2	113	\N
3233	374.37	2022-02-28	primaryAccount	110371	CHECK -  -	2	106	\N
3232	22.64	2022-02-28	primaryAccount	110372	CHECK -  -	2	205	\N
3226	12.36	2022-03-01	primaryAccount	110373	CHECK -  -	2	206	\N
3228	1000.00	2022-03-01	primaryAccount	107	CHECK -  -	2	62	\N
3227	10.97	2022-03-01	primaryAccount	110365	CHECK -  -	2	108	\N
3218	653.25	2022-03-03	primaryAccount	106	CHECK -  -	2	235	\N
3217	1000.00	2022-03-04	primaryAccount	108	CHECK -  -	2	62	\N
3213	5000.00	2022-03-07	primaryAccount	156	CHECK -  -	2	221	\N
3212	5000.00	2022-03-07	primaryAccount	157	CHECK -  -	2	221	\N
3211	309.56	2022-03-07	primaryAccount	110348	CHECK -  -	2	252	\N
3205	171.58	2022-03-08	primaryAccount	110362	CHECK -  -	2	252	\N
3207	2500.00	2022-03-08	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - UDX3ER7Q	2	189	\N
3240	1000.00	2022-02-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3210	3000.00	2022-03-08	primaryAccount		COUNTER WITHDRAWAL -  -	2	179	\N
3253	23.40	2022-03-15	cash			2	33	17
3254	3.55	2022-03-17	cash			2	33	17
3255	24.55	2022-03-17	cash			2	44	17
3257	9.93	2022-03-18	cash		Food Safety Manager Principles Training + Food	2	97	17
3260	29.55	2022-03-28	cash			2	40	17
3261	62.03	2022-03-28	cash			2	40	17
3262	174.96	2022-03-28	cash			2	103	17
3263	43.37	2022-04-01	cash			2	67	17
3264	57.45	2022-04-01	cash			2	39	17
3265	14.28	2022-04-01	cash			2	44	17
3266	111.29	2022-04-01	cash			2	32	17
3267	8.42	2022-04-03	cash			2	44	17
3268	6.00	2022-03-31	expensesAccount		Account Service Charge -  -	2	55	\N
3272	25.00	2022-03-25	expensesAccount	1009	OD ITEM FEE -  -	2	55	\N
3274	6.00	2022-03-31	expensesAccount		Account Service Charge -  -	2	55	\N
3275	1.00	2022-03-28	expensesAccount		ATM Service Charge - ATM D/F NAM HAI ORIENTAL - TULSA OK REF# 30761	2	49	\N
3276	172.35	2022-03-28	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 32878	2	39	\N
3277	59.58	2022-03-28	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0472 - BROKEN ARROW OK REF# 363126	2	33	\N
3278	25.00	2022-03-25	expensesAccount		OD ITEM FEE -  -	2	55	\N
3279	61.04	2022-03-25	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 70511	2	51	\N
3280	82.32	2022-03-24	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 60178	2	39	\N
3281	59.68	2022-03-24	expensesAccount		POS Transaction DDA - D/C TRN LAS AMERICAS SUP - TULSA OK REF# 64056	2	65	\N
3524	2238.00	2022-04-29	primaryAccount	110	CHECK -  -	2	5	\N
3283	62.23	2022-03-23	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 15198	2	44	\N
3284	39.13	2022-03-23	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - TULSA OK REF# 38417	2	33	\N
3285	30.36	2022-03-23	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 779988	2	44	\N
3286	16.46	2022-03-23	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 798604	2	32	\N
3288	25.00	2022-03-21	expensesAccount		OD ITEM FEE -  -	2	55	\N
3289	250.00	2022-03-21	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
3290	302.98	2022-03-21	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 20601	2	39	\N
3291	26.80	2022-03-16	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #6942 - BROKEN ARROW OK REF# 59928	2	33	\N
3292	220.36	2022-03-15	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 179493	2	32	\N
3293	172.35	2022-03-14	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 37472	2	39	\N
3294	17.84	2022-03-14	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 873513	2	32	\N
3295	14.43	2022-03-14	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #3340 - TULSA OK REF# 703255	2	33	\N
3298	3662.50	2022-04-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
3299	104.62	2022-04-01	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3300	563.66	2022-04-01	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 56032	2	24	\N
3310	1782.93	2022-03-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3311	201.50	2022-03-30	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWOT -	2	21	\N
3312	3800.00	2022-03-30	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3315	2268.34	2022-03-29	primaryAccount		ACH Debit - ACH INSPAYMENT FARMERS INS EXC - DOS BANDIDOS BA, LLC	2	21	\N
3316	423.35	2022-03-29	primaryAccount		ACH Debit - ACH EFT PYMT   FARMERS INS - DOS BANDIDOS BA LLC	2	21	\N
3317	155.00	2022-03-29	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
3322	558.86	2022-03-28	primaryAccount	110404	CHECK -  -	2	113	\N
3320	326.81	2022-03-28	primaryAccount	110408	CHECK -  -	2	106	\N
3319	47.10	2022-03-28	primaryAccount	110409	CHECK -  -	2	242	\N
3314	138.90	2022-03-29	primaryAccount	110380	CHECK -  -	2	252	\N
3313	326.01	2022-03-29	primaryAccount	110398	CHECK -  -	2	252	\N
3309	80.63	2022-03-30	primaryAccount	110337	CHECK -  -	2	229	\N
3308	49.35	2022-03-30	primaryAccount	110349	CHECK -  -	2	229	\N
3307	28.99	2022-03-30	primaryAccount	110364	CHECK -  -	2	229	\N
3306	40.96	2022-03-30	primaryAccount	110382	CHECK -  -	2	229	\N
3304	36.03	2022-03-30	primaryAccount	110400	CHECK -  -	2	229	\N
3321	730.19	2022-03-28	primaryAccount	110406	CHECK -  - Sergio Sanchez	2	260	\N
3305	55.58	2022-03-30	primaryAccount	110393	CHECK -  - Mary Collins	2	259	\N
3303	113.12	2022-03-31	primaryAccount	110368	CHECK -  - Brayden Ramsey	2	261	\N
3273	816.00	2022-03-25	expensesAccount	1009	CHECK -  -	2	117	\N
3271	801.00	2022-03-28	expensesAccount	1010	CHECK -  -	2	257	\N
3269	348.50	2022-03-30	expensesAccount	1006	CHECK -  -	2	189	\N
3270	150.00	2022-03-30	expensesAccount	1005	CHECK -  -	2	180	\N
3318	400.00	2022-03-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3301	1000.00	2022-04-01	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3282	250.00	2022-03-24	expensesAccount	Error arreglado en el banco	ACCOUNT ADJUSTMENT- DEBIT - CNB DOS BANDIDOS -CORR - DET	2	189	\N
3526	813.70	2022-04-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3328	2296.09	2022-03-28	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3329	1166.64	2022-03-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3330	677.21	2022-03-28	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3331	515.48	2022-03-28	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3334	3500.00	2022-03-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3335	3000.00	2022-03-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3336	500.00	2022-03-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3339	2953.48	2022-03-25	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3340	520.64	2022-03-25	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3341	104.62	2022-03-25	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3343	191.05	2022-03-24	primaryAccount		ACH Debit - ACH EFT0324    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3344	73.70	2022-03-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3347	2134.71	2022-03-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3348	470.01	2022-03-22	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
3350	450.00	2022-03-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3356	1730.58	2022-03-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3357	250.00	2022-03-21	primaryAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
3358	87.92	2022-03-21	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 32266	2	22	\N
3359	269.05	2022-03-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3360	172.99	2022-03-18	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3365	192.60	2022-03-17	primaryAccount		ACH Debit - ACH EFT0317    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3367	178.14	2022-03-17	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 84837	2	158	\N
3368	1779.53	2022-03-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3371	2730.62	2022-03-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
3373	184.86	2022-03-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
3381	965.70	2022-03-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3382	471.76	2022-03-14	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3383	282.90	2022-03-14	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
3379	655.96	2022-03-14	primaryAccount	110379	CHECK -  -	2	227	\N
3374	1611.79	2022-03-15	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
3366	6.08	2022-03-17	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
3378	106.27	2022-03-14	primaryAccount	110381	CHECK -  - Nathan Keady	2	256	\N
3377	26.77	2022-03-14	primaryAccount	110383	CHECK -  -	2	108	\N
3372	147.76	2022-03-15	primaryAccount	110366	CHECK -  -	2	253	\N
3364	500.00	2022-03-17	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - CXXR875T	2	189	\N
3363	5000.00	2022-03-17	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - 6Q2923X4	2	189	\N
3355	476.32	2022-03-21	primaryAccount	101	CHECK -  -	2	189	\N
3351	1089.97	2022-03-21	primaryAccount	110388	CHECK -  -	2	177	\N
3353	10.23	2022-03-21	primaryAccount	110359	CHECK -  -	2	233	\N
3352	13.62	2022-03-21	primaryAccount	110377	CHECK -  -	2	233	\N
3345	29.16	2022-03-23	primaryAccount	110390	CHECK -  -	2	205	\N
3338	850.00	2022-03-25	primaryAccount	404	CHECK -  -	2	169	\N
3337	1486.27	2022-03-25	primaryAccount	110395	CHECK -  -	2	244	\N
3333	1.85	2022-03-28	primaryAccount		ACH Debit - ACH BILLPAYFEE BILLMATRIX -	2	189	\N
3332	326.39	2022-03-28	primaryAccount		ACH Debit - ACH BILL PAY   AEP PUBLIC SERV -	2	15	\N
3327	369.52	2022-03-28	primaryAccount	158	CHECK -  - Estilita Villafane (se relaciona)	2	189	\N
3326	1048.02	2022-03-28	primaryAccount	402	CHECK -  -	2	254	\N
3325	1200.00	2022-03-28	primaryAccount	403	CHECK -  -	2	146	\N
3324	11.75	2022-03-28	primaryAccount	110394	CHECK -  -	2	233	\N
3323	59.32	2022-03-28	primaryAccount	110401	CHECK -  -	2	108	\N
3376	545.60	2022-03-14	primaryAccount	110387	CHECK -  - Jose Sanchez	2	257	\N
3354	196.00	2022-03-21	primaryAccount	104	CHECK -  - Jose Sanchez	2	257	\N
3346	130.52	2022-03-23	primaryAccount	110376	CHECK -  - Mary Collins	2	259	\N
3369	10000.00	2022-03-16	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3370	1000.00	2022-03-16	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3361	1000.00	2022-03-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3349	1200.00	2022-03-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
3384	6.00	2022-03-31	primaryAccount		Account Service Charge -  -	2	55	\N
3385	10.00	2022-03-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
3386	25.00	2022-03-29	primaryAccount		OD ITEM FEE -  -	2	55	\N
3387	1205.42	2022-03-29	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3388	25.00	2022-03-29	primaryAccount		OD ITEM FEE -  -	2	55	\N
3389	34.99	2022-03-29	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
3390	25.00	2022-03-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
3391	3014.20	2022-03-28	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3392	25.00	2022-03-22	primaryAccount		OD ITEM FEE -  -	2	55	\N
3527	206.10	2022-04-29	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3394	25.00	2022-03-21	primaryAccount		OD ITEM FEE -  -	2	55	\N
3395	3505.52	2022-03-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3396	25.00	2022-03-14	primaryAccount		OD ITEM FEE -  -	2	55	\N
3397	3264.35	2022-03-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3529	5760.21	2022-04-28	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
3736	25.00	2022-05-18	expensesAccount	305	OD ITEM FEE -  -	2	55	\N
3530	201.50	2022-04-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
3375	185.91	2022-03-14	primaryAccount	110389	CHECK -  -	2	106	\N
3532	1069.34	2022-04-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3533	342.35	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 1187	2	243	\N
3380	2500.00	2022-03-14	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - 8LQY6C3W	2	189	\N
3534	254.71	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 87732	2	243	\N
3535	242.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 2990	2	243	\N
3362	716.42	2022-03-17	primaryAccount	104	CHECK -  -	2	255	\N
3412	8.65	2022-04-08	expensesAccount		POS Transaction DDA - D/C TRN WALGREENS STORE - BROKEN ARROW OK REF# 438978	2	98	\N
3536	176.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 1890	2	243	\N
3537	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 99991	2	243	\N
3538	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 95539	2	243	\N
3296	1098.98	2022-04-01	primaryAccount	110402	CHECK -  -	2	5	\N
3539	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 83164	2	243	\N
3540	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 4030	2	243	\N
3528	2000.00	2022-04-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
3393	1500.00	2022-03-22	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	221	\N
3297	556.54	2022-04-01	primaryAccount	110397	CHECK -  -	2	249	\N
3287	1.00	2022-03-22	expensesAccount		ATM Service Charge - ATM D/F QT 80 INSIDE - BROKEN ARROW OK REF# 836117	2	97	\N
3398	2.59	2022-04-20	cash			2	44	17
3399	2.59	2022-04-04	cash			2	44	17
3400	177.15	2022-04-07	cash			2	32	17
3401	10.00	2022-04-10	cash			2	162	17
3256	99.00	2022-03-17	cash		Training	2	258	17
3402	18.49	2022-04-10	cash			2	92	17
3403	17.69	2022-04-10	cash			2	33	17
3404	20.00	2022-04-15	cash			2	108	17
3405	40.00	2022-04-15	cash			2	46	17
3406	29.57	2022-04-15	cash			2	44	17
3407	114.90	2022-04-15	cash			2	39	17
3408	41.42	2022-04-12	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - BROKEN ARROW OK REF# 521144	2	33	\N
3409	172.35	2022-04-11	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 85029	2	39	\N
3410	81.94	2022-04-11	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 15141	2	39	\N
3342	434.25	2022-03-24	primaryAccount	110391	CHECK -  -	2	242	\N
3411	52.99	2022-04-11	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 13325	2	33	\N
3413	1.00	2022-04-07	expensesAccount		ATM Service Charge - ATM D/F SAMSCLUB #8263 - TULSA OK REF# 114849	2	32	\N
3414	22.79	2022-04-07	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - TULSA OK REF# 838713	2	33	\N
3302	241.04	2022-03-31	primaryAccount	110385	CHECK -  - brayden	2	261	\N
3415	18.12	2022-04-07	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 73318	2	51	\N
3416	124.57	2022-04-05	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 66288	2	39	\N
3417	210.45	2022-04-04	expensesAccount		POS Transaction DDA - D/C TRN PARKHILL'S LIQUO - TULSA OK REF# 84858	2	87	\N
3418	34.68	2022-04-04	expensesAccount		POS Transaction DDA - D/C TRN PARKHILL'S LIQUO - TULSA OK REF# 84860	2	87	\N
3419	19.71	2022-04-04	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 376568	2	44	\N
3420	13.03	2022-04-04	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0472 - BROKEN ARROW OK REF# 665656	2	33	\N
3557	695.60	2022-04-25	primaryAccount	107	CHECK -  -	2	260	\N
3424	184.86	2022-04-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
3425	107.16	2022-04-15	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3426	100.00	2022-04-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3427	287.59	2022-04-15	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 86890	2	158	\N
3428	159.60	2022-04-14	primaryAccount		ACH Debit - ACH EFT0414    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3430	1940.09	2022-04-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3463	1500.00	2022-04-05	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3541	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 96476	2	243	\N
3542	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 98005	2	243	\N
3435	23.10	2022-04-12	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
3543	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 99178	2	243	\N
3544	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 94567	2	243	\N
3545	168.00	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 92958	2	243	\N
3546	168.00	2022-04-27	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 90778	2	243	\N
3547	153.21	2022-04-27	primaryAccount		POS Transaction DDA - D/C TRN CASANOVAS HANDYM - HTTPSMERCHANT OK REF# 93717	2	243	\N
3443	1902.52	2022-04-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3444	1524.52	2022-04-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3445	539.69	2022-04-11	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3446	257.39	2022-04-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3447	94.85	2022-04-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
3448	29.19	2022-04-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3449	1000.00	2022-04-11	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3550	2737.11	2022-04-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3551	1427.97	2022-04-26	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
3452	902.95	2022-04-08	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
3453	479.36	2022-04-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
3454	104.62	2022-04-08	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3455	100.00	2022-04-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3456	312.15	2022-04-07	primaryAccount		ACH Debit - ACH EFT0407    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3458	24.30	2022-04-06	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF MARCH 2022	2	55	\N
3459	2163.16	2022-04-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3460	175.00	2022-04-06	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
3461	149.50	2022-04-06	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
3464	1895.23	2022-04-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3465	1566.21	2022-04-04	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
3466	33.70	2022-04-04	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 72570	2	22	\N
3552	85.89	2022-04-25	primaryAccount	110443	CHECK -  -	2	206	\N
3561	2179.51	2022-04-25	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3562	407.77	2022-04-25	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
3462	1089.98	2022-04-05	primaryAccount	110407	CHECK -  -	2	177	\N
3563	309.74	2022-04-25	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3553	43.89	2022-04-25	primaryAccount	110442	CHECK -  -	2	205	\N
3554	12.05	2022-04-25	primaryAccount	110428	CHECK -  -	2	233	\N
3555	463.83	2022-04-25	primaryAccount	108	CHECK -  -	2	242	\N
3556	110.86	2022-04-25	primaryAccount	108	CHECK -  -	2	64	\N
3559	812.41	2022-04-25	primaryAccount	106	CHECK -  -	2	257	\N
3560	193.75	2022-04-25	primaryAccount	103	CHECK -  -	2	252	\N
3549	300.00	2022-04-26	primaryAccount	101	CHECK -  -	2	238	\N
3548	3000.00	2022-04-27	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
3558	251.13	2022-04-25	primaryAccount	107	CHECK -  - GABRIEL MEJIAS	2	262	\N
3467	25.00	2022-04-04	primaryAccount		OD ITEM FEE -  -	2	55	\N
3468	3609.86	2022-04-04	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3566	1200.00	2022-04-22	primaryAccount	111	CHECK -  -	2	146	\N
3450	1089.98	2022-04-08	primaryAccount	110422	CHECK -  -	2	177	\N
3457	320.00	2022-04-07	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3451	890.00	2022-04-08	primaryAccount	102	CHECK -  -	2	117	\N
3569	1383.91	2022-04-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3440	174.26	2022-04-11	primaryAccount	110414	CHECK -  -	2	252	\N
3570	235.18	2022-04-22	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3572	155.40	2022-04-21	primaryAccount		ACH Debit - ACH EFT0421    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3573	100.00	2022-04-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3441	1486.26	2022-04-11	primaryAccount	110412	CHECK -  -	2	244	\N
3574	5000.00	2022-04-21	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3575	500.00	2022-04-21	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3576	619.86	2022-04-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3577	3515.56	2022-04-20	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 23358	2	31	\N
3442	1200.00	2022-04-11	primaryAccount	101	CHECK -  -	2	146	\N
3578	468.84	2022-04-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
3579	445.85	2022-04-19	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3436	47.69	2022-04-11	primaryAccount	110424	CHECK -  -	2	206	\N
3582	1529.12	2022-04-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3583	1464.24	2022-04-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3584	260.32	2022-04-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3585	117.83	2022-04-18	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 22856	2	22	\N
3437	88.04	2022-04-11	primaryAccount	110423	CHECK -  -	2	205	\N
3587	2730.62	2022-04-18	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
3588	6.00	2022-04-29	primaryAccount		Account Service Charge -  -	2	55	\N
3589	25.00	2022-04-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
3438	911.22	2022-04-11	primaryAccount	110420	CHECK -  -	2	257	\N
3590	3554.02	2022-04-28	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3591	34.99	2022-04-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
3592	25.00	2022-04-18	primaryAccount		OD ITEM FEE -  -	2	55	\N
3593	3225.11	2022-04-18	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3439	44.76	2022-04-11	primaryAccount	110416	CHECK -  -	2	108	\N
3581	23.19	2022-04-18	primaryAccount	110411	CHECK -  -	2	233	\N
3565	693.86	2022-04-22	primaryAccount	112	CHECK -  -	2	117	\N
3571	310.00	2022-04-21	primaryAccount	105	CHECK -  -	2	189	\N
3671	1418.00	2022-05-06	primaryAccount	101	CHECK -  -	2	146	\N
3431	355.61	2022-04-12	primaryAccount	110425	CHECK -  -	2	242	\N
3676	1000.00	2022-05-06	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3433	151.83	2022-04-12	primaryAccount	110418	CHECK -  -	2	261	\N
3842	40.00	2022-05-21	cash			2	256	17
3564	1486.27	2022-04-22	primaryAccount	110429	CHECK -  -	2	244	\N
3434	132.00	2022-04-12	primaryAccount	102	CHECK -  -	2	242	\N
3568	333.49	2022-04-22	primaryAccount	106	CHECK -  -	2	64	\N
3567	92.70	2022-04-22	primaryAccount	109	CHECK -  -	2	64	\N
3580	6.56	2022-04-19	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
3658	2500.00	2022-05-09	primaryAccount		ACH Debit - ACH 8889087930 COINBASE INC. - EG3D6G43	2	189	\N
3586	1200.00	2022-04-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
3650	6000.00	2022-05-10	primaryAccount		COUNTER WITHDRAWAL -  -	2	179	\N
3665	747.64	2022-05-09	primaryAccount		POS Transaction DDA - D/C TRN The Webstaurant - 717-392-7472 PA REF# 45971	2	263	\N
3643	18.39	2022-05-11	primaryAccount	110453	CHECK -  -	2	108	\N
3724	6.00	2022-05-31	expensesAccount		Account Service Charge -  -	2	55	\N
3657	600.00	2022-05-09	primaryAccount	112	CHECK -  - OMAR PEREZ	2	264	\N
3833	20.00	2022-06-11	cash			2	46	17
3835	20.00	2022-06-11	cash			2	235	17
3836	23.96	2022-06-18	cash			2	32	17
3837	24.72	2022-06-14	cash			2	92	17
3838	8.66	2022-06-19	cash			2	33	17
3840	74.94	2022-05-21	cash			2	32	17
3845	14.00	2022-05-16	cash			2	92	17
3850	285.00	2022-06-03	cash			2	268	17
3856	18.65	2022-06-03	cash			2	33	17
3861	48.43	2022-06-24	expensesAccount		EFT-REP POS DDA B &amp; B LIQUOR WHS 000000004843192539220624409439	2	39	\N
3594	11.00	2022-05-02	cash			2	205	17
3595	66.00	2022-05-02	cash			2	251	17
3596	20.02	2022-05-03	cash			2	32	17
3597	44.45	2022-05-03	cash			2	44	17
3432	755.68	2022-04-12	primaryAccount	110421	CHECK -  -	2	260	\N
3600	36.84	2022-05-04	cash			2	97	17
3604	40.97	2022-05-08	cash			2	96	17
3605	15.02	2022-05-08	cash			2	44	17
3704	11.48	2022-05-19	cash			2	44	17
3429	230.10	2022-04-13	primaryAccount	101	CHECK -  -	2	106	\N
3705	3.69	2022-05-20	cash			2	64	17
3707	25.86	2022-05-20	cash			2	33	17
3708	17.25	2022-05-23	cash			2	44	17
3709	4.85	2022-05-23	cash			2	44	17
3421	572.25	2022-04-15	primaryAccount	110419	CHECK -  -	2	113	\N
3725	30.25	2022-06-02	expensesAccount		POS Transaction DDA - D/C TRN QT 7 OUTSIDE - TULSA OK REF# 819184	2	97	\N
3726	6.00	2022-05-31	expensesAccount		Account Service Charge -  -	2	55	\N
3727	250.00	2022-05-31	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
3728	76.66	2022-05-31	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 63157	2	32	\N
3423	617.00	2022-04-15	primaryAccount	104	CHECK -  -	2	249	\N
3729	56.62	2022-05-31	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 5474	2	39	\N
3730	32.20	2022-05-31	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 988720	2	97	\N
3731	127.42	2022-05-27	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 206660	2	51	\N
3732	66.22	2022-05-27	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 722474	2	32	\N
3422	1984.00	2022-04-15	primaryAccount	104	CHECK -  -	2	30	\N
3734	1.00	2022-05-20	expensesAccount		ATM Service Charge - ATM D/F WAL-MART #6942 - BROKEN ARROW OK REF# 48313	2	33	\N
3735	1.00	2022-05-20	expensesAccount		ATM Service Charge - ATM D/F Wal-Mart Super C - BROKEN ARROW OK REF# 547857	2	33	\N
3738	27.22	2022-05-17	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 14215	2	44	\N
3739	16.46	2022-05-16	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 78249	2	44	\N
3742	909.03	2022-06-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3743	175.00	2022-06-03	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
3744	107.16	2022-06-03	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3745	100.00	2022-06-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3747	4300.00	2022-06-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3748	2500.00	2022-06-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3749	1831.55	2022-06-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
3753	3662.50	2022-06-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
3754	1597.54	2022-06-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3755	260.40	2022-06-01	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
3756	100.00	2022-06-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3758	460.90	2022-05-31	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3759	201.50	2022-05-31	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
3760	39.99	2022-05-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
3761	59.61	2022-05-31	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 63642	2	22	\N
3764	2211.28	2022-05-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3765	235.18	2022-05-27	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3766	100.00	2022-05-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3767	541.98	2022-05-27	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 16169	2	24	\N
3768	2500.00	2022-05-27	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3733	1.00	2022-05-23	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 292602	2	189	\N
3769	96.55	2022-05-26	primaryAccount	110477	CHECK -  -	2	206	\N
3763	701.82	2022-05-27	primaryAccount	110472	CHECK -  -	2	113	\N
3757	50.10	2022-05-31	primaryAccount	110446	CHECK -  -	2	259	\N
3751	1098.97	2022-06-01	primaryAccount	110471	CHECK -  -	2	5	\N
3740	1486.26	2022-06-03	primaryAccount	110483	CHECK -  -	2	244	\N
3741	677.98	2022-06-03	primaryAccount	110479	CHECK -  - Alan Arias	2	266	\N
3762	1000.00	2022-05-31	primaryAccount	check	COUNTER WITHDRAWAL -  -	2	62	\N
3750	1300.00	2022-06-02	primaryAccount		COUNTER WITHDRAWAL -  -	2	235	\N
3746	329.57	2022-06-03	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 20211	2	189	\N
3862	32.42	2022-06-24	expensesAccount		EFT-REP POS DDA NAM HAI ORIENTAL 000000003242155232220624009013	2	49	\N
3863	1.00	2022-06-24	expensesAccount		ATM Service Charge - ATM D/F SAM'S Club - TULSA OK REF# 790364	2	32	\N
3864	115.43	2022-06-24	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 298643	2	32	\N
3865	66.51	2022-06-24	expensesAccount		POS Transaction DDA - D/C TRN FEDEX OFFIC57900 - BROKEN ARROW OK REF# 3152	2	64	\N
3866	58.52	2022-06-24	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 801757	2	32	\N
3867	34.09	2022-06-23	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - BROKEN ARROW OK REF# 188557	2	33	\N
3868	25.91	2022-06-21	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 79203	2	49	\N
3869	6.26	2022-06-21	expensesAccount		POS Transaction DDA - D/C TRN QT 80 - BROKEN ARROW OK REF# 41090	2	97	\N
3870	3.13	2022-06-21	expensesAccount		POS Transaction DDA - D/C TRN QT 80 - BROKEN ARROW OK REF# 27923	2	97	\N
3871	1.00	2022-06-17	expensesAccount		ATM Service Charge - ATM D/F SAM'S Club - TULSA OK REF# 135344	2	32	\N
3872	1.00	2022-06-17	expensesAccount		ATM Service Charge - ATM D/F SAMS CLUB #8263 - TULSA OK REF# 3119	2	32	\N
3873	119.92	2022-06-17	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 59410	2	32	\N
3874	40.47	2022-06-17	expensesAccount		POS Transaction DDA - D/C TRN QT 50 OUTSIDE - BROKEN ARROW OK REF# 715809	2	97	\N
3876	78.56	2022-06-14	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 35386	2	32	\N
3877	25.25	2022-06-14	expensesAccount		POS Transaction DDA - D/C TRN QT 99 OUTSIDE - TULSA OK REF# 767790	2	97	\N
3878	30.95	2022-06-13	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 32456	2	33	\N
3879	30.43	2022-06-13	expensesAccount		POS Transaction DDA - D/C TRN QT 99 OUTSIDE - TULSA OK REF# 805351	2	97	\N
3880	14.29	2022-06-13	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 119427	2	44	\N
3881	11.68	2022-06-10	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 8186	2	33	\N
3882	12.03	2022-06-06	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 586532	2	44	\N
3885	1705.14	2022-06-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3886	100.00	2022-06-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3887	83.48	2022-06-24	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3888	473.67	2022-06-24	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 46374	2	24	\N
3890	1044.52	2022-06-23	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
3891	249.85	2022-06-23	primaryAccount		ACH Debit - ACH EFT0623    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3893	250.12	2022-06-23	primaryAccount		POS Transaction DDA - D/C TRN FEDEX OFFIC57900 - BROKEN ARROW OK REF# 27033	2	64	\N
3898	1961.35	2022-06-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3899	100.00	2022-06-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3911	3471.78	2022-06-21	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3912	2246.59	2022-06-21	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3913	469.71	2022-06-21	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
3917	1752.19	2022-06-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3918	107.16	2022-06-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3916	706.26	2022-06-17	primaryAccount	110497	CHECK -  -	2	266	\N
3915	1486.27	2022-06-17	primaryAccount	110502	CHECK -  -	2	244	\N
3909	877.09	2022-06-21	primaryAccount	110499	CHECK -  -	2	117	\N
3908	44.85	2022-06-21	primaryAccount	110501	CHECK -  -	2	233	\N
3907	675.54	2022-06-21	primaryAccount	110503	CHECK -  -	2	265	\N
3904	101.88	2022-06-21	primaryAccount	110512	CHECK -  -	2	205	\N
3903	42.13	2022-06-21	primaryAccount	110514	CHECK -  -	2	206	\N
3902	546.35	2022-06-21	primaryAccount	110515	CHECK -  -	2	242	\N
3895	1098.98	2022-06-22	primaryAccount	110508	CHECK -  -	2	5	\N
3894	647.44	2022-06-22	primaryAccount	110509	CHECK -  -	2	113	\N
3884	205.38	2022-06-24	primaryAccount	110505	CHECK -  -	2	252	\N
3883	34.78	2022-06-24	primaryAccount	110507	CHECK -  -	2	108	\N
3906	345.30	2022-06-21	primaryAccount	110504	CHECK -  - Adrian Hernandez	2	272	\N
3910	285.34	2022-06-21	primaryAccount	110498	CHECK -  - Kevin Bishop	2	271	\N
3897	74.11	2022-06-22	primaryAccount	110468	CHECK -  - randy knight	2	273	\N
3896	30.22	2022-06-22	primaryAccount	110487	CHECK -  - randy	2	273	\N
3900	5.00	2022-06-22	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
3914	3500.00	2022-06-21	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
3901	1500.00	2022-06-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3889	5000.00	2022-06-24	primaryAccount	pal viaje del niño	COUNTER WITHDRAWAL -  -	2	189	\N
3919	100.00	2022-06-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3920	1000.00	2022-06-17	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3921	300.00	2022-06-17	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3922	1464.24	2022-06-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3923	260.32	2022-06-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
3924	180.56	2022-06-16	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
3925	262.03	2022-06-16	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 75799	2	158	\N
3926	172.65	2022-06-16	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 23984	2	22	\N
3927	2745.57	2022-06-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
3929	778.98	2022-06-15	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
3930	192.25	2022-06-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
3931	100.00	2022-06-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3933	2285.58	2022-06-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3934	3970.12	2022-06-14	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 73121	2	31	\N
3935	5000.00	2022-06-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3937	475.38	2022-06-13	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3938	107.16	2022-06-13	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
3939	23.10	2022-06-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
3940	1019.69	2022-06-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3941	100.00	2022-06-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3942	94.85	2022-06-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
3947	414.75	2022-06-09	primaryAccount		ACH Debit - ACH EFT0609    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
3949	958.27	2022-06-08	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
3950	457.01	2022-06-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
3951	100.00	2022-06-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
3952	60.87	2022-06-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3956	28.35	2022-06-07	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF MAY 2022	2	55	\N
3962	1865.72	2022-06-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
3971	2276.26	2022-06-06	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
3972	465.96	2022-06-06	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
3973	130.00	2022-06-06	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
3963	516.53	2022-06-06	primaryAccount	110496	CHECK -  -	2	242	\N
3970	1089.97	2022-06-06	primaryAccount	110475	CHECK -  -	2	177	\N
3969	643.03	2022-06-06	primaryAccount	110480	CHECK -  -	2	117	\N
3968	14.86	2022-06-06	primaryAccount	110482	CHECK -  -	2	233	\N
3967	658.35	2022-06-06	primaryAccount	110484	CHECK -  -	2	265	\N
3966	12.75	2022-06-06	primaryAccount	110489	CHECK -  -	2	108	\N
3965	1098.97	2022-06-06	primaryAccount	110490	CHECK -  -	2	5	\N
3953	375.00	2022-06-08	primaryAccount		POS Transaction DDA - D/C TRN OK STATE DEPT OF - OKLAHOMA CITY OK REF# 80100	2	89	\N
3954	12.53	2022-06-08	primaryAccount		POS Transaction DDA - D/C TRN OK.GOV - EGOV.COM OK REF# 3427	2	89	\N
3946	168.74	2022-06-09	primaryAccount	110485	CHECK -  -	2	252	\N
3944	47.05	2022-06-09	primaryAccount	110494	CHECK -  -	2	205	\N
3945	652.76	2022-06-09	primaryAccount	110491	CHECK -  -	2	113	\N
3936	1089.97	2022-06-13	primaryAccount	110493	CHECK -  -	2	177	\N
3932	721.00	2022-06-14	primaryAccount	104	CHECK -  -	2	91	\N
3928	1209.00	2022-06-15	primaryAccount	103	CHECK -  -	2	30	\N
3964	562.25	2022-06-06	primaryAccount	110492	CHECK -  - Teresa Salcido	2	269	\N
3957	59.13	2022-06-07	primaryAccount	110488	CHECK -  - Kailey Miesner	2	270	\N
3958	39.08	2022-06-07	primaryAccount	110469	CHECK -  - Kailey Miesner	2	270	\N
3961	46.95	2022-06-07	primaryAccount	104	CHECK -  - Kailey	2	270	\N
3960	88.26	2022-06-07	primaryAccount	110415	CHECK -  - Kailey Miesner	2	270	\N
3959	75.31	2022-06-07	primaryAccount	110452	CHECK -  - Kailey Miesner	2	270	\N
3948	143.24	2022-06-09	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN BETTER VIEW - clean@betterv OK REF# 94985 - Cleaning	2	274	\N
3955	1000.00	2022-06-08	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3943	1000.00	2022-06-10	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3975	25.00	2022-06-16	primaryAccount		OD ITEM FEE -  -	2	55	\N
3976	1500.00	2022-06-16	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3977	1881.05	2022-06-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3978	196.00	2022-06-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
3979	25.00	2022-06-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
3980	3040.88	2022-06-09	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
3875	117.92	2022-06-15	expensesAccount		POS Transaction DDA - D/C TRN LIDS 5189 - TULSA OK REF# 5	2	50	\N
3974	1240.00	2022-06-21	primaryAccount	1120	CHECK -  -	2	146	\N
3892	500.00	2022-06-23	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 39585	2	169	\N
3905	656.76	2022-06-21	primaryAccount	110510	CHECK -  - teresa salcido	2	269	\N
3981	22.92	2022-06-12	cash			2	44	17
3982	6.56	2022-06-20	cash			2	44	17
3983	21.67	2022-06-20	cash			2	39	17
3860	50.00	2022-06-25	expensesAccount		EFT POS DDA QT 28 OUTSIDE                                ATH 000000005000094601220625598756	2	97	\N
3984	5.36	2022-06-20	cash			2	33	17
3985	10.17	2022-06-22	cash			2	44	17
3986	78.71	2022-06-26	cash			2	33	17
3987	20.00	2022-06-26	cash			2	235	17
3988	10.88	2022-06-28	cash			2	92	17
3989	50.76	2022-06-28	cash			2	32	17
3990	39.63	2022-07-01	cash			2	33	17
3991	11.32	2022-07-01	cash			2	32	17
3992	27.29	2022-07-01	cash			2	51	17
3993	20.00	2022-07-01	cash			2	235	17
3994	30.36	2022-07-01	cash			2	44	17
3995	20.00	2022-07-02	cash			2	235	17
3996	300.00	2022-07-05	cash			2	5	17
3997	12.46	2022-07-06	cash			2	44	17
3998	33.85	2022-07-06	cash			2	33	17
3999	11.97	2022-07-06	cash			2	33	17
4000	32.94	2022-07-08	cash			2	39	17
4001	23.83	2022-07-09	cash			2	33	17
4002	21.13	2022-07-09	cash			2	39	17
4003	6.00	2022-06-30	expensesAccount		Account Service Charge -  -	2	55	\N
4071	2500.00	2022-07-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4072	2730.77	2022-07-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4073	6.00	2022-06-30	primaryAccount		Account Service Charge -  -	2	55	\N
4074	10.00	2022-06-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
4075	481.22	2022-06-30	primaryAccount		POS Transaction DDA - D/C TRN FACEBK 45L5LFKJF - 650-5434800 CA REF# 88682	2	169	\N
4076	34.99	2022-06-28	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4077	25.00	2022-06-27	primaryAccount		OD ITEM FEE -  -	2	55	\N
4078	3422.88	2022-06-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4004	16.23	2022-07-08	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 31243	2	39	\N
4005	81.72	2022-07-07	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 767963	2	44	\N
4006	20.05	2022-07-07	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 947467	2	97	\N
4007	16.23	2022-07-07	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 17223	2	33	\N
4008	128.27	2022-07-01	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 34508	2	32	\N
4009	11.55	2022-07-01	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 897398	2	44	\N
4010	6.00	2022-06-30	expensesAccount		Account Service Charge -  -	2	55	\N
4011	36.05	2022-06-29	expensesAccount		POS Transaction DDA - D/C TRN QT 28 OUTSIDE - TULSA OK REF# 603742	2	97	\N
4012	250.00	2022-06-27	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
4013	48.43	2022-06-27	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 449	2	39	\N
4014	32.42	2022-06-27	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 72635	2	49	\N
4015	30.32	2022-06-27	expensesAccount		POS Transaction DDA - D/C TRN QT 28 OUTSIDE - TULSA OK REF# 605598	2	97	\N
4016	12.99	2022-06-27	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 147515	2	44	\N
4017	12.99	2022-06-27	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 242373	2	44	\N
4021	1344.11	2022-07-08	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
4022	1251.83	2022-07-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4023	449.47	2022-07-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
4024	100.00	2022-07-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4025	75.94	2022-07-08	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4028	93.50	2022-07-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4029	20.70	2022-07-06	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JUNE 2022	2	55	\N
4031	1823.25	2022-07-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4032	175.00	2022-07-06	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
4033	100.00	2022-07-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4035	2500.00	2022-07-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4043	2556.51	2022-07-05	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4044	1642.88	2022-07-05	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
4045	494.94	2022-07-05	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4046	3500.00	2022-07-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4052	3662.50	2022-07-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
4053	1508.68	2022-07-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4054	100.00	2022-07-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4055	83.48	2022-07-01	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4056	39.99	2022-07-01	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4060	3000.00	2022-07-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4051	1000.00	2022-07-01	primaryAccount	1017	CHECK -  - Revisados	2	62	\N
4047	1486.27	2022-07-01	primaryAccount	110521	CHECK -  -	2	244	\N
4048	828.28	2022-07-01	primaryAccount	110518	CHECK -  -	2	117	\N
4049	515.22	2022-07-01	primaryAccount	110516	CHECK -  -	2	266	\N
4059	19.93	2022-07-01	primaryAccount		POS Transaction DDA - D/C TRN WWW.HOSTELWORLD. - DUBLIN IE REF# 17030	2	189	\N
4057	965.44	2022-07-01	primaryAccount		POS Transaction DDA - D/C TRN PAYPAL *RUMBO SA - 35314369001 ES REF# 38468	2	100	\N
4041	700.00	2022-07-05	primaryAccount	1011	CHECK -  -	2	100	\N
4036	501.53	2022-07-05	primaryAccount	110535	CHECK -  -	2	242	\N
4037	570.84	2022-07-05	primaryAccount	110530	CHECK -  -	2	269	\N
4038	588.27	2022-07-05	primaryAccount	110522	CHECK -  -	2	265	\N
4039	1000.00	2022-07-05	primaryAccount	1025	CHECK -  - Revisados	2	62	\N
4040	700.00	2022-07-05	primaryAccount	1012	CHECK -  -	2	100	\N
4042	700.00	2022-07-05	primaryAccount	1010	CHECK -  -	2	100	\N
4030	3627.00	2022-07-06	primaryAccount	160	CHECK -  - estilita	2	100	\N
4034	38.68	2022-07-06	primaryAccount		ACH Debit - ACH MTOT DEP   BANKCARD - DOS BANDIDOS BA	2	100	\N
4027	396.64	2022-07-07	primaryAccount	110517	CHECK -  -	2	271	\N
4026	21.29	2022-07-07	primaryAccount	110532	CHECK -  -	2	205	\N
4019	1500.00	2022-07-08	primaryAccount	1022	CHECK -  - Revisados	2	62	\N
4020	1378.50	2022-07-08	primaryAccount	1020	CHECK -  -	2	30	\N
4018	15.58	2022-07-08	primaryAccount	110534	CHECK -  -	2	206	\N
4061	400.00	2022-07-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4062	70.31	2022-06-30	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 64204	2	22	\N
4064	100.00	2022-06-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4066	2137.99	2022-06-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4067	948.00	2022-06-28	primaryAccount		ACH Debit - ACH ACH        ARMADA DISTRIBU - DOS BANDIDOS-BA	2	41	\N
4068	201.49	2022-06-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
4069	500.00	2022-06-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4070	688.22	2022-06-27	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4109	300.00	2022-07-20	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	189	\N
4063	1089.98	2022-06-29	primaryAccount	110511	CHECK -  -	2	177	\N
4050	1297.57	2022-07-01	primaryAccount	1018	CHECK -  -	2	146	\N
4058	306.10	2022-07-01	primaryAccount		POS Transaction DDA - D/C TRN TRAINLINE - LONDON GB REF# 76651	2	189	\N
4079	13.00	2022-06-10	cash			2	206	17
4080	90.58	2022-06-10	cash			2	39	17
4081	31.75	2022-06-10	cash			2	51	17
4082	24.61	2022-06-10	cash			2	49	17
4083	20.00	2022-06-10	cash			2	275	17
4084	16.22	2022-06-10	cash			2	112	17
4085	20.00	2022-07-10	cash			2	33	17
4086	39.23	2022-07-12	cash			2	276	17
4087	32.42	2022-07-12	cash			2	49	17
4088	25.00	2022-07-13	cash			2	108	17
4089	20.00	2022-07-13	cash			2	277	17
4090	149.00	2022-07-14	cash		Urgent care Rafael	2	188	17
4091	11.58	2022-07-16	cash		ALDI?	2	188	17
4092	200.00	2022-07-19	cash			2	5	17
4093	10.93	2022-07-21	cash			2	33	17
4094	18.91	2022-07-21	cash			2	278	17
4095	17.07	2022-07-23	cash			2	44	17
4096	19.68	2022-07-23	cash			2	92	17
4097	11.45	2022-07-26	cash			2	33	17
4098	98.25	2022-07-26	cash			2	33	17
4099	12.99	2022-07-26	cash			2	39	17
4100	33.50	2022-07-26	cash			2	49	17
4101	11.20	2022-07-29	cash			2	44	17
4102	21.18	2022-07-29	cash			2	33	17
4103	20.00	2022-07-29	cash			2	235	17
4104	50.00	2022-07-30	cash			2	235	17
4105	65.00	2022-07-30	cash			2	39	17
4106	8.66	2022-07-30	cash			2	39	17
4107	9.11	2022-07-30	cash			2	33	17
4108	6.00	2022-07-29	expensesAccount		Account Service Charge -  -	2	55	\N
4110	6.00	2022-07-29	expensesAccount		Account Service Charge -  -	2	55	\N
4111	42.03	2022-07-29	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 278436	2	44	\N
4112	30.26	2022-07-27	expensesAccount		POS Transaction DDA - D/C TRN QT 96 OUTSIDE - TULSA OK REF# 235568	2	97	\N
4113	104.00	2022-07-25	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 58530	2	32	\N
4114	9.64	2022-07-22	expensesAccount		POS Transaction DDA - D/C TRN QT 31 - TULSA OK REF# 37732	2	97	\N
4115	118.67	2022-07-21	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 33338	2	33	\N
4116	23.50	2022-07-21	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 521163	2	97	\N
4117	6.17	2022-07-21	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 610748	2	44	\N
4118	4.95	2022-07-21	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 22337	2	44	\N
4119	250.00	2022-07-19	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
4120	72.60	2022-07-18	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 55134	2	32	\N
4121	58.22	2022-07-14	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 727469	2	32	\N
4122	24.10	2022-07-14	expensesAccount		POS Transaction DDA - D/C TRN QT 40 OUTSIDE - CLAREMORE OK REF# 653002	2	97	\N
4123	24.90	2022-07-12	expensesAccount		POS Transaction DDA - D/C TRN QT 38 OUTSIDE - SAPULPA OK REF# 993296	2	97	\N
4124	148.54	2022-07-11	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 32218	2	32	\N
4125	21.74	2022-07-11	expensesAccount		POS Transaction DDA - D/C TRN QT 99 OUTSIDE - TULSA OK REF# 568982	2	97	\N
4130	2503.24	2022-07-29	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4131	1469.44	2022-07-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4132	75.94	2022-07-29	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4133	273.25	2022-07-28	primaryAccount		ACH Debit - ACH EFT0728    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4134	201.49	2022-07-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
4135	63.61	2022-07-28	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 64790	2	22	\N
4136	485.76	2022-07-27	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4138	4869.09	2022-07-26	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
4139	2575.50	2022-07-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4140	496.50	2022-07-26	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 25424	2	24	\N
4142	1853.51	2022-07-25	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
4143	1044.48	2022-07-25	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
4144	53.42	2022-07-25	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4149	1947.59	2022-07-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4150	101.94	2022-07-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4151	75.94	2022-07-22	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4155	226.45	2022-07-21	primaryAccount		ACH Debit - ACH EFT0721    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4159	468.54	2022-07-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
4160	100.00	2022-07-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4165	2314.84	2022-07-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4171	2796.55	2022-07-18	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4168	519.87	2022-07-18	primaryAccount	110539	CHECK -  -	2	265	\N
4164	180.08	2022-07-19	primaryAccount	110541	CHECK -  -	2	252	\N
4157	20.07	2022-07-20	primaryAccount	110546	CHECK -  -	2	108	\N
4158	560.49	2022-07-20	primaryAccount	1023	CHECK -  -	2	257	\N
4154	174.22	2022-07-21	primaryAccount	110540	CHECK -  -	2	272	\N
4153	18.05	2022-07-21	primaryAccount	110543	CHECK -  -	2	273	\N
4152	465.95	2022-07-21	primaryAccount	110555	CHECK -  -	2	242	\N
4148	1089.97	2022-07-22	primaryAccount	110531	CHECK -  -	2	177	\N
4146	1089.97	2022-07-22	primaryAccount	110550	CHECK -  -	2	177	\N
4141	1098.97	2022-07-25	primaryAccount	110547	CHECK -  -	2	5	\N
4129	1300.00	2022-07-29	primaryAccount	1501	CHECK -  -	2	146	\N
4128	840.87	2022-07-29	primaryAccount	110559	CHECK -  -	2	117	\N
4127	1486.28	2022-07-29	primaryAccount	110561	CHECK -  -	2	244	\N
4126	12.53	2022-07-29	primaryAccount	110573	CHECK -  -	2	205	\N
4166	628.23	2022-07-18	primaryAccount	110552	CHECK -  - David Tarazona	2	283	\N
4167	133.84	2022-07-18	primaryAccount	110544	CHECK -  - Evelyn Lopez	2	282	\N
4162	35.81	2022-07-20	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 42728	2	284	\N
4147	710.44	2022-07-22	primaryAccount	110548	CHECK -  - Jose Reyes	2	279	\N
4161	5.00	2022-07-20	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
4163	3100.00	2022-07-20	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4156	550.03	2022-07-21	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 137462	2	189	\N
4145	1500.00	2022-07-25	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4172	1464.24	2022-07-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4173	831.24	2022-07-18	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4174	260.32	2022-07-18	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4175	63.11	2022-07-18	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4176	2745.57	2022-07-18	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
4183	1240.10	2022-07-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4184	197.18	2022-07-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
4185	174.86	2022-07-15	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4186	100.00	2022-07-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4188	259.45	2022-07-14	primaryAccount		ACH Debit - ACH EFT0714    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4189	94.85	2022-07-14	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
4190	90.82	2022-07-14	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 14580	2	22	\N
4191	100.00	2022-07-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos Downtown	2	29	\N
4194	2177.43	2022-07-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4195	162.50	2022-07-12	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
4196	23.10	2022-07-12	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4197	2000.00	2022-07-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4198	658.61	2022-07-11	primaryAccount	110529	CHECK -  -	2	113	\N
4193	742.50	2022-07-12	primaryAccount	1024	CHECK -  - Jose Reyes	2	279	\N
4199	134.27	2022-07-11	primaryAccount	110524	CHECK -  -	2	252	\N
4200	3.55	2022-07-11	primaryAccount	110520	CHECK -  -	2	233	\N
4439	25.00	2022-09-21	expensesAccount		OD ITEM FEE -  -	2	55	\N
4201	513.10	2022-07-11	primaryAccount		POS Transaction DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 31907	2	17	\N
4202	6.00	2022-07-29	primaryAccount		Account Service Charge -  -	2	55	\N
4203	34.99	2022-07-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4204	3654.24	2022-07-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4205	25.00	2022-07-11	primaryAccount		OD ITEM FEE -  -	2	55	\N
4206	2997.28	2022-07-11	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4207	500.00	2022-07-11	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4223	197.19	2022-08-10	expensesAccount		POS Transaction DDA - D/C TRN O'REILLY AUTO PA - TULSA OK REF# 224581	2	289	\N
4187	1098.97	2022-07-14	primaryAccount	110528	CHECK -  -	2	5	\N
4192	151.97	2022-07-12	primaryAccount	110533	CHECK -  - Ty Thrashar	2	280	\N
4182	1441.00	2022-07-15	primaryAccount	1013	CHECK -  -	2	146	\N
4242	100.00	2022-08-10	primaryAccount	223	CHECK -  -	2	117	\N
4177	328.69	2022-07-15	primaryAccount	110557	CHECK -  - anthony russell	2	281	\N
4245	150.00	2022-08-10	primaryAccount	220	CHECK -  -	2	146	\N
4208	25.96	2022-07-15	cash			2	44	17
4209	32.45	2022-07-15	cash			2	44	17
4210	8.68	2022-07-22	cash			2	33	17
4180	819.97	2022-07-15	primaryAccount	110537	CHECK -  -	2	117	\N
4211	13.11	2022-07-22	cash			2	44	17
4212	74.29	2022-07-22	cash			2	51	17
4213	10.57	2022-07-22	cash			2	92	17
4179	1486.26	2022-07-15	primaryAccount	110538	CHECK -  -	2	244	\N
4214	40.09	2022-08-02	cash			2	39	17
4215	40.15	2022-08-02	cash			2	51	17
4216	20.00	2022-08-04	cash			2	277	17
4178	560.49	2022-07-15	primaryAccount	110549	CHECK -  -	2	269	\N
4217	100.00	2022-08-06	cash			2	254	17
4218	320.00	2022-08-11	cash			2	5	17
4219	20.00	2022-08-13	cash			2	235	17
4181	20.21	2022-07-15	primaryAccount	110495	CHECK -  -	2	206	\N
4220	20.00	2022-08-12	cash			2	235	17
4221	40.09	2022-08-12	cash			2	39	17
4169	217.60	2022-07-18	primaryAccount	110523	CHECK -  -	2	272	\N
4224	20.36	2022-08-10	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - TULSA OK REF# 458428	2	33	\N
4225	92.70	2022-08-09	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 867107	2	32	\N
4170	1000.00	2022-07-18	primaryAccount	1019	CHECK -  -	2	62	\N
4226	60.50	2022-08-09	expensesAccount		POS Transaction DDA - D/C TRN LOWE'S #1536 - BROKEN ARROW OK REF# 900119	2	43	\N
4137	375.40	2022-07-26	primaryAccount	110536	CHECK -  -	2	271	\N
4227	39.55	2022-08-08	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 54231	2	44	\N
4228	43.23	2022-08-03	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 72948	2	49	\N
4229	32.18	2022-08-03	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 19022	2	44	\N
4230	27.16	2022-08-02	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 504799	2	32	\N
4234	2198.16	2022-08-12	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4235	718.82	2022-08-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4236	75.94	2022-08-12	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4237	211.80	2022-08-11	primaryAccount		ACH Debit - ACH EFT0811    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4238	23.10	2022-08-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4239	3836.93	2022-08-11	primaryAccount		POS Transaction DDA - D/C TRN Paisa Produce - 539-867-3508 OK REF# 74121	2	31	\N
4240	63.61	2022-08-11	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 15110	2	22	\N
4244	150.00	2022-08-10	primaryAccount	221	CHECK -  -	2	117	\N
4233	1300.00	2022-08-12	primaryAccount	224	CHECK -  -	2	146	\N
4243	165.00	2022-08-10	primaryAccount	222	CHECK -  -	2	146	\N
4232	835.00	2022-08-12	primaryAccount	110578	CHECK -  -	2	117	\N
4222	1.00	2022-08-11	expensesAccount		ATM Service Charge - ATM D/F QT 79 OUTSIDE - TULSA OK REF# 834815	2	55	\N
4231	773.57	2022-08-12	primaryAccount	110581	CHECK -  -	2	244	\N
4241	1000.00	2022-08-11	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4246	94.85	2022-08-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
4248	1591.42	2022-08-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4249	1586.18	2022-08-09	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
4250	200.00	2022-08-09	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4251	468.99	2022-08-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
4252	458.76	2022-08-08	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4253	251.67	2022-08-08	primaryAccount		POS Transaction DDA - D/C TRN ATT* BILL PAYMEN - 800-331-0500 TX REF# 1690	2	26	\N
4254	6000.00	2022-08-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4747	23.83	2022-10-28	cash			2	44	17
4255	3500.00	2022-08-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4257	1859.80	2022-08-05	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4258	203.96	2022-08-05	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4260	60.16	2022-08-05	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 87910	2	17	\N
4262	1500.00	2022-08-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4263	300.00	2022-08-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4264	208.00	2022-08-04	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
4266	175.00	2022-08-03	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
4267	3100.00	2022-08-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4268	300.00	2022-08-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4269	22.05	2022-08-02	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JULY 2022	2	55	\N
4270	20.00	2022-08-02	primaryAccount		Account Service Fee - CHARITABLE FUNDRAISER - Food Bank	2	55	\N
4276	4609.94	2022-08-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
4277	1934.75	2022-08-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
4278	1649.70	2022-08-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4279	1518.30	2022-08-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
4280	39.99	2022-08-02	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4294	3662.50	2022-08-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
4295	716.16	2022-08-01	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
4297	3408.25	2022-08-08	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4298	25.00	2022-08-04	primaryAccount		OD ITEM FEE -  -	2	55	\N
4300	25.00	2022-08-02	primaryAccount		OD ITEM FEE -  -	2	55	\N
4301	3503.34	2022-08-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4302	10.00	2022-08-01	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
4303	6.00	2022-08-31	expensesAccount		Account Service Charge -  -	2	55	\N
4283	517.34	2022-08-01	primaryAccount	110576	CHECK -  -	2	242	\N
4293	823.82	2022-08-01	primaryAccount	1503	CHECK -  -	2	113	\N
4292	684.89	2022-08-01	primaryAccount	1504	CHECK -  -	2	283	\N
4289	16.80	2022-08-01	primaryAccount	110542	CHECK -  -	2	256	\N
4287	408.30	2022-08-01	primaryAccount	110562	CHECK -  -	2	265	\N
4286	208.45	2022-08-01	primaryAccount	110563	CHECK -  -	2	272	\N
4285	208.90	2022-08-01	primaryAccount	110564	CHECK -  -	2	252	\N
4284	8.92	2022-08-01	primaryAccount	110568	CHECK -  -	2	108	\N
4275	12750.00	2022-08-02	primaryAccount	216	CHECK -  - Tranch LLC	2	189	\N
4271	1098.97	2022-08-02	primaryAccount	110569	CHECK -  -	2	5	\N
4272	21000.00	2022-08-02	primaryAccount	219	CHECK -  - Marta Reyes	2	189	\N
4273	4000.00	2022-08-02	primaryAccount	218	CHECK -  -	2	189	\N
4274	4799.00	2022-08-02	primaryAccount	217	CHECK -  -	2	189	\N
4265	1295.00	2022-08-03	primaryAccount	1502	CHECK -  -	2	30	\N
4259	100.00	2022-08-05	primaryAccount		Insurance ACH Debit - ACH Surety ACH CNA Surety - DeleonCelia	2	290	\N
4256	91.31	2022-08-05	primaryAccount	110571	CHECK -  -	2	269	\N
4247	724.61	2022-08-09	primaryAccount	110570	CHECK -  -	2	279	\N
4288	133.91	2022-08-01	primaryAccount	110560	CHECK -  - Sarahy Duran	2	286	\N
4291	42.62	2022-08-01	primaryAccount	110303	CHECK -  - Georgia Benham	2	285	\N
4290	46.99	2022-08-01	primaryAccount	110316	CHECK -  - Georgia	2	285	\N
4281	1000.00	2022-08-02	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4261	2000.00	2022-08-05	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
4296	2500.00	2022-08-01	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
4304	112.90	2022-09-03	expensesAccount		EFT PIN DDA SAMS CLUB #8263 000000011290141825220903454200	2	32	\N
4305	6.00	2022-08-31	expensesAccount		Account Service Charge -  -	2	55	\N
4306	250.00	2022-08-30	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
4307	37.77	2022-08-29	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0472 - BROKEN ARROW OK REF# 68654	2	33	\N
4308	27.19	2022-08-29	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 65095	2	44	\N
4309	9.94	2022-08-29	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 81245	2	44	\N
4310	30.20	2022-08-26	expensesAccount		POS Transaction DDA - D/C TRN QT 78 OUTSIDE - TULSA OK REF# 419121	2	97	\N
4311	11.97	2022-08-26	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0472 - BROKEN ARROW OK REF# 457621	2	33	\N
4312	35.58	2022-08-25	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - TULSA OK REF# 19438	2	33	\N
4313	40.09	2022-08-24	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 1606	2	39	\N
4314	39.45	2022-08-23	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 11037	2	44	\N
4748	20.00	2022-10-28	cash			2	235	17
4315	18.07	2022-08-19	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 24809	2	39	\N
4316	5.58	2022-08-19	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 261256	2	32	\N
4319	52.98	2022-09-02	primaryAccount		EFT-REP POS DDA OKLAHOMANATURALG 000000005298024108220902380034	2	17	\N
4320	1680.86	2022-09-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
4321	806.27	2022-09-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4323	1500.00	2022-09-02	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4324	250.00	2022-09-02	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4325	130.00	2022-09-02	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4327	3662.50	2022-09-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
4328	240.75	2022-09-01	primaryAccount		ACH Debit - ACH EFT0901    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4332	39.99	2022-08-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4333	35.81	2022-08-31	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 64409	2	284	\N
4337	1891.33	2022-08-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4338	1044.48	2022-08-30	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
4340	500.00	2022-08-30	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4348	361.35	2022-08-29	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4349	201.49	2022-08-29	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
4350	495.41	2022-08-29	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 60874	2	24	\N
4351	3500.00	2022-08-29	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4352	500.00	2022-08-29	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4355	1899.59	2022-08-26	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4356	742.18	2022-08-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4357	75.94	2022-08-26	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4359	600.00	2022-08-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4360	97.92	2022-08-25	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 55376	2	22	\N
4354	2276.00	2022-08-26	primaryAccount	227	CHECK -  - Labor + Catering tips	2	146	\N
4353	839.55	2022-08-26	primaryAccount	110598	CHECK -  -	2	117	\N
4342	15.74	2022-08-29	primaryAccount	110612	CHECK -  -	2	205	\N
4346	496.73	2022-08-29	primaryAccount	110600	CHECK -  -	2	265	\N
4345	1098.98	2022-08-29	primaryAccount	110606	CHECK -  -	2	5	\N
4344	541.11	2022-08-29	primaryAccount	110609	CHECK -  -	2	269	\N
4343	407.60	2022-08-29	primaryAccount	110610	CHECK -  -	2	257	\N
4341	444.31	2022-08-29	primaryAccount	110613	CHECK -  -	2	242	\N
4335	626.74	2022-08-30	primaryAccount	110607	CHECK -  -	2	113	\N
4336	341.48	2022-08-30	primaryAccount	228	CHECK -  -	2	283	\N
4331	104.35	2022-08-31	primaryAccount	110601	CHECK -  -	2	252	\N
4330	13.20	2022-08-31	primaryAccount	110604	CHECK -  -	2	108	\N
4326	2000.00	2022-09-01	primaryAccount	229	CHECK -  -	2	189	\N
4361	1500.00	2022-08-25	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4334	1000.00	2022-08-31	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4339	500.00	2022-08-30	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 69585	2	141	\N
4329	179.47	2022-09-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 75736	2	141	\N
4347	708.32	2022-08-29	primaryAccount	226	Sysco Food Cost CHECK -  -	2	288	\N
4364	5337.05	2022-08-24	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
4365	1530.56	2022-08-24	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS BA LLC	2	189	\N
4368	1682.52	2022-08-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4373	1025.93	2022-08-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4374	470.55	2022-08-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
4375	75.94	2022-08-19	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4377	221.40	2022-08-18	primaryAccount		ACH Debit - ACH EFT0818    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4386	1588.77	2022-08-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4387	1464.24	2022-08-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4388	260.32	2022-08-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4389	197.18	2022-08-16	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
4390	2816.81	2022-08-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
4400	1500.00	2022-08-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4401	6.00	2022-08-31	primaryAccount		Account Service Charge -  -	2	55	\N
4402	10.00	2022-08-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
4403	3526.49	2022-08-29	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4404	34.99	2022-08-29	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4405	25.00	2022-08-25	primaryAccount		OD ITEM FEE -  -	2	55	\N
4408	2428.86	2022-08-17	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4391	271.00	2022-08-15	primaryAccount	110596	CHECK -  -	2	242	\N
4398	175.58	2022-08-15	primaryAccount	110577	CHECK -  -	2	271	\N
4383	3500.00	2022-08-17	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	\N
4392	31.48	2022-08-15	primaryAccount	110595	CHECK -  -	2	206	\N
4396	207.52	2022-08-15	primaryAccount	110584	CHECK -  -	2	252	\N
4399	297.23	2022-08-15	primaryAccount	110558	CHECK -  -	2	271	\N
4317	11.65	2022-08-17	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - BROKEN ARROW OK REF# 4154	2	92	\N
4397	9.75	2022-08-15	primaryAccount	110579	CHECK -  -	2	233	\N
4394	32.85	2022-08-15	primaryAccount	110593	CHECK -  -	2	205	\N
4395	302.10	2022-08-15	primaryAccount	110591	CHECK -  -	2	269	\N
4385	424.85	2022-08-16	primaryAccount	110589	CHECK -  -	2	113	\N
4393	704.52	2022-08-15	primaryAccount	110594	CHECK -  -	2	283	\N
4380	756.52	2022-08-17	primaryAccount	110582	CHECK -  -	2	265	\N
4370	0.38	2022-08-22	primaryAccount	110551	CHECK -  -	2	205	\N
4381	24.52	2022-08-17	primaryAccount	110554	CHECK -  -	2	206	\N
4372	13.89	2022-08-19	primaryAccount	110525	CHECK -  -	2	273	\N
4379	8.67	2022-08-17	primaryAccount	110587	CHECK -  -	2	108	\N
4363	85.53	2022-08-24	primaryAccount	110583	CHECK -  -	2	272	\N
4367	1089.97	2022-08-23	primaryAccount	110572	CHECK -  -	2	177	\N
4369	1098.98	2022-08-22	primaryAccount	110588	CHECK -  -	2	5	\N
4362	744.37	2022-08-24	primaryAccount	110590	CHECK -  -	2	279	\N
4371	1000.00	2022-08-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
4378	1000.00	2022-08-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
4409	151.71	2022-08-18	cash			2	39	17
4410	20.00	2022-08-20	cash			2	235	17
4411	108.00	2022-08-25	cash			2	277	17
4412	16.75	2022-08-27	cash			2	44	17
4413	13.50	2022-08-27	cash			2	44	17
4414	20.00	2022-08-27	cash			2	277	17
4415	200.00	2022-08-27	cash			2	283	17
4416	12.49	2022-08-27	cash			2	33	17
4417	20.57	2022-08-27	cash			2	39	17
4418	26.67	2022-09-03	cash			2	44	17
4419	19.92	2022-09-03	cash			2	44	17
4384	2000.00	2022-08-17	primaryAccount	downtown	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4376	200.00	2022-08-19	primaryAccount	to expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4407	300.00	2022-08-19	primaryAccount	to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4358	500.00	2022-08-26	primaryAccount	to exp bixby	POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 88146	2	179	\N
4406	1000.00	2022-08-25	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	124	\N
4299	300.00	2022-08-04	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	221	\N
4282	1000.00	2022-08-02	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4382	5.00	2022-08-17	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
4459	411.53	2022-10-12	primaryAccount	110654	CHECK -  -	2	265	\N
4426	21.14	2022-10-04	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - BROKEN ARROW OK REF# 46096	2	92	\N
4422	1.00	2022-10-06	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 849341	2	97	\N
4366	27.50	2022-08-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 13255	2	287	\N
4420	6.00	2022-09-30	expensesAccount		Account Service Charge -  -	2	55	\N
4421	18.64	2022-10-13	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 19492	2	33	\N
4425	29.54	2022-10-06	expensesAccount		POS Transaction DDA - D/C TRN QT 80 INSIDE - BROKEN ARROW OK REF# 867378	2	97	\N
4427	57.52	2022-10-03	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 1006	2	44	\N
4428	16.23	2022-10-03	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 72335	2	39	\N
4429	6.00	2022-09-30	expensesAccount		Account Service Charge -  -	2	55	\N
4430	40.09	2022-09-30	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 36791	2	39	\N
4431	26.02	2022-09-29	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 58483	2	39	\N
4432	16.18	2022-09-28	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0894 - TULSA OK REF# 714278	2	33	\N
4434	80.19	2022-09-27	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 50000	2	39	\N
4435	272.49	2022-09-26	expensesAccount		POS Transaction DDA - D/C TRN CURTIS RESTAURAN - TULSA OK REF# 40016	2	122	\N
4436	30.15	2022-09-26	expensesAccount		POS Transaction DDA - D/C TRN QT 4 OUTSIDE - TULSA OK REF# 906196	2	97	\N
4437	1.00	2022-09-21	expensesAccount		ATM Service Charge - ATM D/F KUM&amp;GO 0867 TULS - TULSA OK REF# 237573	2	48	\N
4440	80.22	2022-09-21	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WAR - TULSA OK REF# 71932	2	39	\N
4441	25.00	2022-09-20	expensesAccount		OD ITEM FEE -  -	2	55	\N
4442	250.00	2022-09-20	expensesAccount		ACH Debit - ACH TRANSFER   CNB DOS BANDIDO - CARLOS GONZALEZ	2	59	\N
4443	11.89	2022-09-20	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 91543	2	44	\N
4444	49.40	2022-09-19	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 53163	2	32	\N
4445	56.74	2022-09-12	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 98518	2	49	\N
4446	19.16	2022-09-12	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 60951	2	33	\N
4447	3.60	2022-09-12	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 75730	2	44	\N
4448	13.83	2022-09-09	expensesAccount		POS Transaction DDA - D/C TRN QT 80 - BROKEN ARROW OK REF# 11273	2	97	\N
4449	112.90	2022-09-06	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 63417	2	32	\N
4450	22.50	2022-10-14	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF SEPT 2022	2	55	\N
4451	993.65	2022-10-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4452	79.97	2022-10-14	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4453	678.64	2022-10-14	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 62587	2	24	\N
4423	1.00	2022-10-06	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 839616	2	97	\N
4424	1.00	2022-10-06	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 835232	2	97	\N
4438	1.00	2022-09-21	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 743516	2	97	\N
4457	688.74	2022-10-12	primaryAccount	110660	crisanto CHECK -  -	2	292	\N
4454	500.00	2022-10-14	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 13629	2	141	\N
4456	580.98	2022-10-12	primaryAccount	110662	CHECK -  -	2	113	\N
4433	10.94	2022-09-28	expensesAccount		POS Transaction DDA - D/C TRN PERFECT FOOD &amp; G - TULSA OK REF# 344768	2	100	\N
4455	1089.97	2022-10-13	primaryAccount	110628	CHECK -  -	2	177	\N
4460	1538.18	2022-10-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4461	47.66	2022-10-12	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4470	161.67	2022-10-11	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4471	104.80	2022-10-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
4472	23.10	2022-10-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4477	2483.64	2022-10-07	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4478	1360.34	2022-10-07	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
4479	1263.08	2022-10-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4480	156.00	2022-10-07	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
4481	79.97	2022-10-07	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4482	30.70	2022-10-07	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4486	540.10	2022-10-06	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
4487	290.70	2022-10-06	primaryAccount		ACH Debit - ACH EFT1006    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4488	129.13	2022-10-06	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 16274	2	22	\N
4490	175.00	2022-10-05	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
4491	102.59	2022-10-05	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4493	304.04	2022-10-05	primaryAccount		POS Transaction DDA - D/C TRN ATT* BILL PAYMEN - 800-331-0500 TX REF# 39686	2	26	\N
4494	91.87	2022-10-05	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 47271	2	17	\N
4497	1546.42	2022-10-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4501	3662.50	2022-10-03	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
4502	1359.67	2022-10-03	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
4503	41.75	2022-10-03	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4504	39.99	2022-10-03	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4507	44.75	2022-10-03	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 413	2	284	\N
4510	2357.47	2022-09-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4511	79.97	2022-09-30	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4749	100.00	2022-10-29	cash			2	251	17
4814	68.00	2022-09-09	cash			2	32	17
4508	10000.00	2022-10-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4495	300.00	2022-10-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4484	200.00	2022-10-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4513	2000.00	2022-09-30	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4514	252.16	2022-09-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
4515	1464.79	2022-09-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4516	150.00	2022-09-27	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4505	500.00	2022-10-03	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 85729	2	141	\N
4506	97.82	2022-10-03	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 81322	2	141	\N
4492	500.00	2022-10-05	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE *ADS99438 - Mountain View CA REF# 280522	2	141	\N
4473	500.00	2022-10-11	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 11292	2	141	\N
4489	33.90	2022-10-05	primaryAccount	110618	CHECK -  -	2	252	\N
4476	1741.00	2022-10-07	primaryAccount	1002	CHECK -  -	2	146	\N
4474	903.15	2022-10-07	primaryAccount	110652	CHECK -  -	2	117	\N
4462	508.87	2022-10-11	primaryAccount	110670	CHECK -  -	2	242	\N
4468	8.50	2022-10-11	primaryAccount	110658	CHECK -  -	2	108	\N
4467	814.63	2022-10-11	primaryAccount	110663	CHECK -  -	2	279	\N
4466	531.64	2022-10-11	primaryAccount	110664	CHECK -  -	2	269	\N
4464	378.45	2022-10-11	primaryAccount	110666	CHECK -  -	2	257	\N
4485	127.42	2022-10-06	primaryAccount	1004	lorena quintana CHECK -  -	2	295	\N
4475	592.00	2022-10-07	primaryAccount	1003	miriam perez CHECK -  -	2	293	\N
4463	846.99	2022-10-11	primaryAccount	110667	emilia sandoval CHECK -  -	2	296	\N
4469	129.27	2022-10-11	primaryAccount	110656	Peggy Marcano CHECK -  -	2	297	\N
4465	17.50	2022-10-11	primaryAccount	110665	azeneth CHECK -  -	2	294	\N
4483	700.00	2022-10-07	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4529	27.50	2022-09-26	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 86615	2	287	\N
4531	2900.00	2022-09-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4532	500.00	2022-09-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4533	400.00	2022-09-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4534	400.00	2022-09-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4535	25.00	2022-09-26	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4538	2674.22	2022-09-23	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4539	807.16	2022-09-23	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4541	592.75	2022-09-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4542	75.94	2022-09-23	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4544	65.61	2022-09-23	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 55934	2	22	\N
4546	2228.48	2022-09-22	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
4547	300.00	2022-09-22	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4549	2856.24	2022-09-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4553	471.74	2022-09-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
4554	300.00	2022-09-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4555	1464.24	2022-09-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4556	885.55	2022-09-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4557	302.88	2022-09-16	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4558	260.32	2022-09-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4559	484.62	2022-09-16	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 92109	2	24	\N
4560	2816.81	2022-09-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
4561	231.00	2022-09-15	primaryAccount		ACH Debit - ACH EFT0915    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4562	197.18	2022-09-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
4564	1000.00	2022-09-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4568	26.50	2022-09-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4570	500.00	2022-09-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4573	1704.55	2022-09-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4574	23.10	2022-09-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4575	1800.00	2022-09-13	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4551	200.00	2022-09-20	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	\N
4548	5.00	2022-09-21	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	100	\N
4543	500.00	2022-09-23	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 24345	2	141	\N
4540	624.00	2022-09-23	primaryAccount		ACH Debit - ACH Equipment  PAYSAFE OPS - 3300396	2	299	\N
4523	625.39	2022-09-26	primaryAccount	110643	CHECK -  -	2	113	\N
4528	500.00	2022-09-26	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 68932	2	141	\N
4565	628.23	2022-09-14	primaryAccount	110624	CHECK -  -	2	113	\N
4567	1089.98	2022-09-14	primaryAccount	110611	CHECK -  -	2	177	\N
4566	271.12	2022-09-14	primaryAccount	110614	CHECK -  -	2	271	\N
4552	250.00	2022-09-19	primaryAccount	235	CHECK -  -	2	91	\N
4536	914.31	2022-09-23	primaryAccount	110634	CHECK -  -	2	117	\N
4537	775.76	2022-09-23	primaryAccount	110625	CHECK -  -	2	279	\N
4521	441.05	2022-09-26	primaryAccount	110645	CHECK -  -	2	269	\N
4519	490.05	2022-09-26	primaryAccount	110647	CHECK -  -	2	257	\N
4518	23.54	2022-09-26	primaryAccount	110649	CHECK -  -	2	206	\N
4527	1300.00	2022-09-26	primaryAccount	104	CHECK -  -	2	146	\N
4526	416.18	2022-09-26	primaryAccount	110636	CHECK -  -	2	265	\N
4522	638.17	2022-09-26	primaryAccount	110644	CHECK -  -	2	279	\N
4571	755.38	2022-09-13	primaryAccount	110621	Miriam Perez CHECK -  -	2	293	\N
4520	156.47	2022-09-26	primaryAccount	110646	Azeneth Sanchez CHECK -  -	2	294	\N
4524	758.26	2022-09-26	primaryAccount	110641	crisanto CHECK -  -	2	292	\N
4572	300.00	2022-09-13	primaryAccount	236	Home expenses Ashton Woods? CHECK -  -	2	298	\N
4563	1000.00	2022-09-15	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4545	1400.00	2022-09-23	primaryAccount	solo 1000 se fueron a cash	COUNTER WITHDRAWAL -  -	2	62	\N
4530	1100.00	2022-09-26	primaryAccount		COUNTER WITHDRAWAL -  -	2	189	\N
4585	557.41	2022-09-12	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 3946349 DOS BANDIDOS	2	66	\N
4586	380.00	2022-09-12	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4588	500.00	2022-09-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4589	250.00	2022-09-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4593	2259.74	2022-09-09	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4594	962.01	2022-09-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4595	109.29	2022-09-09	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
4596	75.94	2022-09-09	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4597	5000.00	2022-09-09	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4598	30.60	2022-09-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF AUGUST 2022	2	55	\N
4599	165.69	2022-09-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4600	143.00	2022-09-08	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
4601	93.82	2022-09-08	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 5682	2	22	\N
4605	2230.27	2022-09-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4606	1503.86	2022-09-07	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
4607	1408.77	2022-09-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
4608	175.00	2022-09-07	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
4609	464.53	2022-09-07	primaryAccount		POS Transaction DDA - D/C TRN ATT* BILL PAYMEN - 800-331-0500 TX REF# 93620	2	26	\N
4612	377.53	2022-09-06	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4613	135.59	2022-09-06	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4615	52.98	2022-09-06	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 32060	2	17	\N
4617	2000.00	2022-09-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4618	500.00	2022-09-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4619	150.00	2022-09-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4622	2124.10	2022-10-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4623	6.00	2022-09-30	primaryAccount		Account Service Charge -  -	2	55	\N
4624	10.00	2022-09-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
4625	25.00	2022-09-27	primaryAccount		OD ITEM FEE -  -	2	55	\N
4626	34.99	2022-09-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4627	3596.64	2022-09-26	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4628	25.00	2022-09-12	primaryAccount		OD ITEM FEE -  -	2	55	\N
4629	1728.09	2022-09-12	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4631	25.00	2022-09-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
4632	3644.39	2022-09-08	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4614	500.00	2022-09-06	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 26828	2	141	\N
4587	500.00	2022-09-12	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 13292	2	141	\N
4621	300.00	2022-10-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4610	771.77	2022-09-06	primaryAccount	110608	CHECK -  -	2	279	\N
4611	334.25	2022-09-06	primaryAccount	110597	CHECK -  -	2	271	\N
4602	86.14	2022-09-07	primaryAccount	110553	CHECK -  -	2	280	\N
4604	1478.50	2022-09-07	primaryAccount	230	CHECK -  -	2	30	\N
4603	129.32	2022-09-07	primaryAccount	110513	CHECK -  -	2	280	\N
4591	911.16	2022-09-09	primaryAccount	110615	CHECK -  -	2	117	\N
4592	1089.98	2022-09-09	primaryAccount	110592	CHECK -  -	2	177	\N
4590	191.13	2022-09-09	primaryAccount	110630	CHECK -  -	2	283	\N
4630	1500.00	2022-09-09	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	221	\N
4577	24.42	2022-09-12	primaryAccount	110629	CHECK -  -	2	205	\N
4576	508.95	2022-09-12	primaryAccount	110632	CHECK -  -	2	242	\N
4579	532.82	2022-09-12	primaryAccount	110626	CHECK -  -	2	269	\N
4578	361.83	2022-09-12	primaryAccount	110627	CHECK -  -	2	257	\N
4582	1300.00	2022-09-12	primaryAccount	233	CHECK -  -	2	146	\N
4581	464.28	2022-09-12	primaryAccount	110617	CHECK -  -	2	265	\N
4580	23.25	2022-09-12	primaryAccount	110620	CHECK -  -	2	108	\N
4583	713.40	2022-09-12	primaryAccount	232	crisanto pineda CHECK -  -	2	292	\N
4584	1515.19	2022-09-12	primaryAccount	231	jonathan gardner CHECK -  -	2	291	\N
4616	1000.00	2022-09-06	primaryAccount	se fueron 800 a cash	COUNTER WITHDRAWAL -  -	2	62	\N
4498	1089.97	2022-10-03	primaryAccount	110648	CHECK -  -	2	177	\N
4569	500.00	2022-09-14	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 21883	2	141	\N
4318	500.00	2022-09-04	primaryAccount		Funds Transfer via Mobile	2	100	\N
4496	343.68	2022-10-04	primaryAccount	110633	CHECK -  -	2	271	\N
4525	246.35	2022-09-26	primaryAccount	110640	miriam perez CHECK -  -	2	293	\N
4550	305.47	2022-09-20	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 505666	2	100	\N
4512	1000.00	2022-09-30	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4458	517.09	2022-10-12	primaryAccount	110659	miriam p CHECK -  -	2	293	\N
4633	20.00	2022-09-09	cash			2	235	17
4634	25.98	2022-09-11	cash			2	39	17
4635	20.00	2022-10-01	cash			2	235	17
4517	510.99	2022-09-26	primaryAccount	110650	CHECK -  -	2	242	\N
4636	20.00	2022-10-01	cash			2	235	17
4637	8.67	2022-08-01	cash			2	92	17
4638	14.57	2022-08-03	cash			2	33	17
4639	77.75	2022-08-03	cash			2	32	17
4640	300.00	2022-08-19	cash			2	5	17
4641	20.00	2022-08-19	cash			2	235	17
4642	80.19	2022-08-23	cash			2	39	17
4643	100.00	2022-08-24	cash		Empanadas	2	188	17
4644	55.27	2022-08-26	cash		Empanadas	2	39	17
4499	1098.97	2022-10-03	primaryAccount	110642	CHECK -  -	2	5	\N
4645	42.69	2022-08-26	cash			2	49	17
4646	20.00	2022-08-26	cash			2	235	17
4647	68.00	2022-08-26	cash			2	206	17
4648	140.00	2022-08-28	cash			2	110	17
4500	1098.97	2022-10-03	primaryAccount	110623	CHECK -  -	2	5	\N
4649	39.34	2022-08-29	cash			2	44	17
4650	52.00	2022-09-02	cash			2	242	17
4651	20.00	2022-09-05	cash			2	235	17
4322	450.00	2022-09-02	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
4652	56.34	2022-09-06	cash			2	97	17
4653	27.40	2022-09-06	cash			2	235	17
4654	17.35	2022-09-12	cash			2	44	17
4655	3.26	2022-09-12	cash			2	92	17
4656	10.32	2022-09-12	cash			2	33	17
4657	13.66	2022-09-16	cash			2	33	17
4658	13.66	2022-09-16	cash			2	33	17
4659	20.00	2022-09-16	cash			2	235	17
4660	40.00	2022-09-16	cash			2	5	17
4661	36.83	2022-09-18	cash			2	276	17
4662	50.16	2022-09-20	cash			2	44	17
4663	37.83	2022-09-20	cash			2	49	17
4664	35.71	2022-09-23	cash			2	44	17
4665	20.00	2022-09-23	cash			2	235	17
4666	135.47	2022-09-24	cash			2	39	17
4667	20.00	2022-09-24	cash			2	235	17
4668	9.09	2022-09-25	cash			2	44	17
4669	47.47	2022-10-13	cash			2	44	17
4670	17.33	2022-10-14	cash			2	39	17
4671	27.18	2022-10-14	cash			2	97	17
4672	20.00	2022-10-14	cash			2	235	17
4673	20.00	2022-10-15	cash			2	235	17
2861	1000.00	2022-01-03	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
2820	400.00	2022-01-14	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
3051	1200.00	2022-02-11	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
3110	350.00	2022-02-24	primaryAccount	102	CHECK -  -	2	100	\N
3108	1000.00	2022-02-25	primaryAccount	eran 3000, lo cambie a 1000 para que cuadrara con la caja, los 2 mil fue efectivo para kike	COUNTER WITHDRAWAL -  -	2	62	\N
4674	4.81	2022-10-25	expensesAccount		POS Transaction DDA - D/C TRN FEDEX OFFIC57900 - BROKEN ARROW OK REF# 45626	2	64	\N
4065	35.81	2022-06-29	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 40276	2	284	\N
4675	1.00	2022-10-24	expensesAccount		ATM Service Charge - ATM D/F FEDEX OFFICE #57 - BROKEN ARROW OK REF# 361867	2	64	\N
4676	1.00	2022-10-21	expensesAccount		ATM Service Charge - ATM D/F SUPERMERCADOS MO - Broken Arrow OK REF# 496760	2	44	\N
4677	17.29	2022-10-21	expensesAccount		POS Transaction DDA - D/C TRN QT 80 INSIDE - BROKEN ARROW OK REF# 625329	2	97	\N
4678	2.74	2022-10-21	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW OK REF# 25566	2	33	\N
4680	7.79	2022-10-20	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0894 - TULSA OK REF# 289435	2	33	\N
4681	127.44	2022-10-17	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 34941	2	32	\N
4682	7.31	2022-10-17	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 33133	2	44	\N
4683	960.51	2022-10-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4684	252.16	2022-10-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
4685	79.97	2022-10-28	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4692	1546.98	2022-10-25	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
4693	1494.79	2022-10-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4694	493.35	2022-10-25	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
4695	44.75	2022-10-25	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 87410	2	284	\N
4707	1598.50	2022-10-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4708	148.11	2022-10-24	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4709	94.44	2022-10-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4712	27.50	2022-10-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 98056	2	287	\N
4716	909.19	2022-10-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4717	79.97	2022-10-21	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4719	470.57	2022-10-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
4720	236.55	2022-10-20	primaryAccount		ACH Debit - ACH EFT1020    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4725	2530.58	2022-10-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4727	500.00	2022-10-18	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 27706	2	141	\N
4731	1464.24	2022-10-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4732	260.32	2022-10-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4730	114.17	2022-10-17	primaryAccount	110651	CHECK -  -	2	271	\N
4723	12.59	2022-10-18	primaryAccount	110669	CHECK -  -	2	206	\N
4726	5.00	2022-10-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	100	\N
4724	1786.00	2022-10-18	primaryAccount	237	CHECK -  -	2	30	\N
4722	397.40	2022-10-19	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 995472	2	100	\N
4721	1089.97	2022-10-19	primaryAccount	110668	CHECK -  -	2	177	\N
4718	51.70	2022-10-20	primaryAccount	110637	CHECK -  -	2	252	\N
4714	114.86	2022-10-21	primaryAccount	110687	CHECK -  -	2	205	\N
4715	824.98	2022-10-21	primaryAccount	110671	CHECK -  -	2	117	\N
4702	632.50	2022-10-24	primaryAccount	110679	CHECK -  -	2	113	\N
4703	1098.98	2022-10-24	primaryAccount	110678	CHECK -  -	2	5	\N
4704	1098.97	2022-10-24	primaryAccount	110661	CHECK -  -	2	5	\N
4705	1.16	2022-10-24	primaryAccount	110653	CHECK -  -	2	233	\N
4706	5.36	2022-10-24	primaryAccount	110635	CHECK -  -	2	233	\N
4711	241.18	2022-10-24	primaryAccount		POS Transaction DDA - D/C TRN CLOVER  GIFT CAR - SMB.GYFT.COM CA REF# 69617	2	100	\N
4699	332.35	2022-10-24	primaryAccount	110684	CHECK -  -	2	257	\N
4701	1154.99	2022-10-24	primaryAccount	110680	CHECK -  -	2	279	\N
4698	191.81	2022-10-24	primaryAccount	110685	CHECK -  -	2	296	\N
4697	35.70	2022-10-24	primaryAccount	110688	CHECK -  -	2	206	\N
4696	454.68	2022-10-24	primaryAccount	110689	CHECK -  -	2	242	\N
4700	497.67	2022-10-24	primaryAccount	110682	CHECK -  -	2	269	\N
4691	425.23	2022-10-25	primaryAccount	110672	CHECK -  -	2	265	\N
4690	564.78	2022-10-25	primaryAccount	110677	CHECK -  -	2	292	\N
4687	1000.00	2022-10-26	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
4686	17.37	2022-10-27	primaryAccount	110676	CHECK -  -	2	108	\N
4689	320.98	2022-10-25	primaryAccount	110681	CHECK -  - Luis Rios	2	300	\N
4679	9.98	2022-10-20	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - TULSA OK REF# 26363	2	92	\N
4688	3100.00	2022-10-26	primaryAccount	dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4728	1200.00	2022-10-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4742	37.30	2022-10-21	cash			2	44	17
4733	191.89	2022-10-17	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
4734	157.44	2022-10-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4735	2816.81	2022-10-17	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
4737	34.99	2022-10-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4738	25.00	2022-10-25	primaryAccount		OD ITEM FEE -  -	2	55	\N
4739	3530.63	2022-10-25	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4740	25.00	2022-10-17	primaryAccount		OD ITEM FEE -  -	2	55	\N
4741	3581.43	2022-10-17	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4620	850.00	2022-10-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4776	29.65	2022-11-07	primaryAccount	110709	CHECK -  -	2	205	\N
4766	20.02	2022-11-08	primaryAccount	110710	CHECK -  -	2	206	\N
4729	1900.00	2022-10-18	primaryAccount	dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4775	441.56	2022-11-07	primaryAccount	110711	CHECK -  -	2	242	\N
4778	624.49	2022-11-07	primaryAccount	110702	CHECK -  -	2	113	\N
4769	607.98	2022-11-08	primaryAccount	110700	CHECK -  -	2	292	\N
4713	300.00	2022-10-24	primaryAccount	ba expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4752	6.00	2022-10-31	expensesAccount		Account Service Charge -  -	2	55	\N
4754	74.54	2022-11-07	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 31351	2	49	\N
4755	44.75	2022-11-07	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - BROKEN ARROW( OK REF# 4531	2	33	\N
4756	19.51	2022-11-07	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 20898	2	39	\N
4757	55.28	2022-11-04	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 755187	2	32	\N
4758	6.00	2022-10-31	expensesAccount		Account Service Charge -  -	2	55	\N
4759	1.00	2022-10-31	expensesAccount		ATM Service Charge - ATM D/F SUPERMERCADOS MO - Broken Arrow OK REF# 366625	2	44	\N
4761	363.75	2022-11-10	primaryAccount		ACH Debit - ACH EFT1110    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4736	2500.00	2022-10-17	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4762	104.80	2022-11-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
4763	20.70	2022-11-09	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF OCTOBER 2022	2	55	\N
4710	500.00	2022-10-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 45585	2	141	\N
4764	500.00	2022-11-09	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 42585	2	141	\N
4765	495.41	2022-11-09	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 97150	2	24	\N
4509	2000.00	2022-10-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4777	278.38	2022-11-07	primaryAccount	110706	CHECK -  -	2	257	\N
4772	2441.70	2022-11-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4773	175.00	2022-11-08	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
4781	2765.09	2022-11-07	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4780	1575.00	2022-11-07	primaryAccount	1001	CHECK -  -	2	146	\N
4779	1089.98	2022-11-07	primaryAccount	110686	CHECK -  -	2	177	\N
4768	1299.31	2022-11-08	primaryAccount	110703	CHECK -  -	2	279	\N
4767	254.53	2022-11-08	primaryAccount	110704	CHECK -  -	2	300	\N
4753	6.88	2022-11-09	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - BROKEN ARROW OK REF# 39918	2	92	\N
4770	330.21	2022-11-08	primaryAccount	110694	CHECK -  -	2	265	\N
4774	4050.00	2022-11-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4751	200.00	2022-11-08	expensesAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4771	368.22	2022-11-08	primaryAccount	110690	CHECK -  - Mariana Badillo	2	301	\N
4760	604.35	2022-11-10	primaryAccount	110	CHECK -  - Devan Culbert	2	302	\N
4782	1266.42	2022-11-07	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
4783	513.93	2022-11-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
4784	14.94	2022-11-07	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 38717	2	189	\N
4789	910.17	2022-11-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4790	215.22	2022-11-04	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4791	182.00	2022-11-04	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
4792	83.65	2022-11-04	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 85947	2	17	\N
4795	72.71	2022-11-03	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 16858	2	22	\N
4797	1499.27	2022-11-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
4798	551.93	2022-11-02	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
4801	3662.50	2022-11-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
4802	1413.26	2022-11-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4803	39.99	2022-11-01	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4804	450.81	2022-11-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 78585	2	141	\N
4807	25.00	2022-11-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
4809	1500.00	2022-11-07	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4810	25.00	2022-11-04	primaryAccount		OD ITEM FEE -  -	2	55	\N
4811	1000.00	2022-11-04	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4812	6.00	2022-10-31	primaryAccount		Account Service Charge -  -	2	55	\N
4813	10.00	2022-10-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
4796	1255.00	2022-11-02	primaryAccount	238	CHECK -  -	2	265	\N
4793	1000.00	2022-11-04	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4787	519.10	2022-11-04	primaryAccount	110705	CHECK -  -	2	269	\N
4788	819.69	2022-11-04	primaryAccount	110691	CHECK -  -	2	117	\N
4805	1400.00	2022-10-31	primaryAccount	111	CHECK -  -	2	146	\N
4794	300.00	2022-11-04	primaryAccount	Expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4799	425.00	2022-11-01	primaryAccount	113	CHECK -  -	2	220	\N
4800	750.00	2022-11-01	primaryAccount	112	CHECK -  -	2	251	\N
4786	500.00	2022-11-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4806	1000.00	2022-10-31	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4785	2030.00	2022-11-07	primaryAccount	a DT	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4808	221.00	2022-11-08	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	100	\N
4815	18.83	2022-09-09	cash			2	33	17
4816	100.00	2022-09-09	cash	jose s check		2	257	17
4817	200.00	2022-10-17	cash			2	5	17
4818	37.83	2022-10-17	cash			2	49	17
4819	20.00	2022-10-22	cash			2	235	17
4820	33.32	2022-10-22	cash			2	32	17
4821	70.00	2022-10-22	cash			2	5	17
4822	16.14	2022-10-22	cash			2	39	17
4823	20.00	2022-11-05	cash			2	235	17
4824	20.40	2022-11-06	cash			2	44	17
4825	75.00	2022-11-06	cash	sr jose		2	188	17
4826	10.00	2022-11-07	cash	gift card tips		2	188	17
4827	129.38	2022-11-08	cash			2	93	17
4828	15.96	2022-11-08	cash			2	43	17
4829	34.25	2022-11-11	cash			2	39	17
4830	20.00	2022-11-11	cash			2	188	17
4831	8.64	2022-11-14	cash			2	44	17
4832	100.00	2022-11-14	cash			2	146	17
4833	80.00	2022-11-16	cash			2	303	17
4834	20.00	2022-11-18	cash			2	235	17
4835	26.00	2022-11-18	cash			2	110	17
4836	135.00	2022-11-21	cash	sr jose		2	235	17
4837	40.06	2022-11-21	cash			2	39	17
4838	16.01	2022-11-21	cash			2	44	17
4839	95.00	2022-11-22	cash			2	43	17
4840	11.94	2022-11-22	cash			2	43	17
4841	20.00	2022-11-26	cash			2	235	17
4842	200.00	2022-11-28	cash			2	5	17
4843	6.00	2022-11-30	expensesAccount		Account Service Charge -  -	2	55	\N
4844	136.56	2022-12-02	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 65417	2	39	\N
4845	20.72	2022-12-01	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 150083	2	97	\N
4846	6.00	2022-11-30	expensesAccount		Account Service Charge -  -	2	55	\N
4847	115.27	2022-11-30	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 42895	2	32	\N
4848	61.48	2022-11-29	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 86257	2	32	\N
4849	50.91	2022-11-28	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 1452	2	39	\N
4850	17.32	2022-11-28	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 10358	2	44	\N
4851	1.62	2022-11-28	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - Broken Arrow OK REF# 143899	2	44	\N
4852	35.77	2022-11-25	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - TULSA OK REF# 165	2	33	\N
4853	396.52	2022-11-23	expensesAccount		POS Transaction DDA - D/C TRN THE HOME DEPOT # - TULSA OK REF# 340201	2	93	\N
4855	28.18	2022-11-21	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 71417	2	39	\N
4856	13.14	2022-11-21	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 57848	2	39	\N
4857	10.73	2022-11-21	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 92511	2	44	\N
4858	133.46	2022-11-18	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 645064	2	32	\N
4859	51.18	2022-11-18	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 40157	2	44	\N
4860	32.42	2022-11-18	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 5934	2	49	\N
4861	29.89	2022-11-18	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - BROKEN ARROW OK REF# 569140	2	33	\N
4863	48.75	2022-11-14	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 92537	2	39	\N
4865	11.26	2022-11-14	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 63110	2	44	\N
4867	1336.88	2022-12-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
4868	683.59	2022-12-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4869	152.08	2022-12-02	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4870	3662.50	2022-12-01	primaryAccount		ACH Debit - ACH TRANSFER   CNB D BANDIDOS - LAWS BROS LLC	2	136	\N
4871	335.50	2022-12-01	primaryAccount		ACH Debit - ACH EFT1201    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4872	39.99	2022-12-01	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4873	276.67	2022-12-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 11585	2	141	\N
4876	6.00	2022-11-30	primaryAccount		Account Service Charge -  -	2	55	\N
4878	44.75	2022-11-30	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 58177	2	284	\N
4939	25.00	2022-12-02	primaryAccount		OD ITEM FEE -  -	2	55	\N
4864	31.03	2022-11-14	expensesAccount		POS Transaction DDA - D/C TRN ALDI 46017 - TUSLA OK REF# 512786	2	100	\N
4877	218.47	2022-11-30	primaryAccount	110718	CHECK -  - Maggie Loftin	2	304	\N
4874	500.00	2022-12-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4866	654.88	2022-12-02	primaryAccount	110737	CHECK -  -	2	117	\N
4875	400.00	2022-12-01	primaryAccount	to downtown	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4879	9.91	2022-11-30	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 96532	2	189	\N
4882	2165.12	2022-11-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4885	775.90	2022-11-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4886	252.16	2022-11-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
4893	89.05	2022-11-25	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4894	500.00	2022-11-25	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 35851	2	141	\N
4895	55.00	2022-11-25	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 64498	2	287	\N
4899	8.25	2022-11-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4908	2371.69	2022-11-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4917	2143.55	2022-11-21	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
4918	469.66	2022-11-21	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
4919	277.65	2022-11-21	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4922	735.09	2022-11-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4923	89.05	2022-11-18	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4925	500.00	2022-11-17	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - SUPPORT.GOOGL CA REF# 28682	2	141	\N
4926	130.63	2022-11-17	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 57114	2	22	\N
4927	1489.81	2022-11-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4928	260.32	2022-11-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4930	2899.46	2022-11-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
4931	2084.40	2022-11-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4932	186.73	2022-11-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
4935	1058.48	2022-11-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4936	98.16	2022-11-14	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4937	23.10	2022-11-14	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4934	1208.68	2022-11-14	primaryAccount	110693	CHECK -  -	2	302	\N
4924	1089.97	2022-11-17	primaryAccount	110708	CHECK -  -	2	177	\N
4921	817.35	2022-11-18	primaryAccount	110714	CHECK -  -	2	117	\N
4910	470.17	2022-11-21	primaryAccount	110734	CHECK -  -	2	242	\N
4916	1300.00	2022-11-21	primaryAccount	1002	CHECK -  -	2	146	\N
4915	1098.97	2022-11-21	primaryAccount	110701	CHECK -  -	2	5	\N
4914	493.03	2022-11-21	primaryAccount	110728	CHECK -  -	2	269	\N
4913	214.11	2022-11-21	primaryAccount	110729	CHECK -  -	2	257	\N
4912	61.06	2022-11-21	primaryAccount	110732	CHECK -  -	2	205	\N
4911	43.56	2022-11-21	primaryAccount	110733	CHECK -  -	2	206	\N
4907	29.08	2022-11-22	primaryAccount	110697	CHECK -  -	2	297	\N
4901	92.81	2022-11-22	primaryAccount	110730	CHECK -  -	2	296	\N
4902	296.89	2022-11-22	primaryAccount	110727	CHECK -  -	2	300	\N
4903	1226.48	2022-11-22	primaryAccount	110726	CHECK -  -	2	279	\N
4904	657.71	2022-11-22	primaryAccount	110723	CHECK -  -	2	292	\N
4905	714.34	2022-11-22	primaryAccount	110713	CHECK -  -	2	301	\N
4906	67.60	2022-11-22	primaryAccount	110707	CHECK -  -	2	296	\N
4898	1208.70	2022-11-23	primaryAccount	110716	CHECK -  -	2	302	\N
4897	595.82	2022-11-23	primaryAccount	110725	CHECK -  -	2	113	\N
4892	8.65	2022-11-25	primaryAccount	110721	CHECK -  -	2	108	\N
4891	1089.97	2022-11-25	primaryAccount	110731	CHECK -  -	2	177	\N
4889	1500.00	2022-11-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4887	91.40	2022-11-28	primaryAccount		POS Transaction DDA - D/C TRN MAD EATS - OWASSO OK REF# 40114	2	100	\N
4884	1098.97	2022-11-28	primaryAccount	110724	CHECK -  -	2	5	\N
4881	178.53	2022-11-29	primaryAccount	110712	CHECK -  - Jessica Arenz	2	305	\N
4920	1000.00	2022-11-21	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4896	1320.00	2022-11-25	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4888	1490.00	2022-11-28	primaryAccount	solo mil fueron al cash log	COUNTER WITHDRAWAL -  -	2	62	\N
4883	1838.00	2022-11-29	primaryAccount		POS Transaction DDA - D/C TRN TORTILLERIA MILA - TULSA OK REF# 85116	2	30	\N
4929	5.00	2022-11-16	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
4880	500.00	2022-11-30	primaryAccount	expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
4890	1000.00	2022-11-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	62	\N
4940	2000.00	2022-12-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4941	1.00	2022-12-01	primaryAccount		ATM Service Charge - ATM D/F FACEBK XQ2BCKFJF - 650-5434800 CA REF# 293217	2	169	\N
4942	500.00	2022-12-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4943	6.00	2022-11-30	primaryAccount		Account Service Charge -  -	2	55	\N
4944	10.00	2022-11-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
4945	1.00	2022-11-30	primaryAccount		ATM Service Charge - ATM D/F FACEBK *2EVFMKKH - fb.me/ads CA REF# 17365	2	169	\N
4946	1.00	2022-11-30	primaryAccount		ATM Service Charge - ATM D/F FACEBK B3HCFKKJF - 650-5434800 CA REF# 299733	2	169	\N
4947	25.00	2022-11-29	primaryAccount		OD ITEM FEE -  -	2	55	\N
4948	34.99	2022-11-29	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
4949	25.00	2022-11-23	primaryAccount		OD ITEM FEE -  -	2	55	\N
4950	500.00	2022-11-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4951	25.00	2022-11-22	primaryAccount		OD ITEM FEE -  -	2	55	\N
4952	500.00	2022-11-22	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4953	25.00	2022-11-21	primaryAccount		OD ITEM FEE -  -	2	55	\N
4954	500.00	2022-11-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
4854	1.00	2022-11-21	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 994488	2	97	\N
4900	650.00	2022-11-23	primaryAccount	expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	179	\N
4938	1000.00	2022-11-14	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
4960	813.06	2022-12-16	primaryAccount	110758	CHECK -  -	2	117	\N
4955	500.00	2022-11-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4862	1.00	2022-11-14	expensesAccount		ATM Service Charge - ATM D/F ALDI 46017 - TUSLA OK REF# 211019	2	100	\N
4933	750.00	2022-11-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	100	\N
4909	308.41	2022-11-22	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 506188	2	100	\N
4956	17.48	2022-12-16	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #8263 - TULSA OK REF# 912766	2	32	\N
4957	25.62	2022-12-14	expensesAccount		POS Transaction DDA - D/C TRN QT 4 OUTSIDE - TULSA OK REF# 965027	2	97	\N
4958	22.76	2022-12-08	expensesAccount		POS Transaction DDA - D/C TRN QT 80 INSIDE - BROKEN ARROW OK REF# 999914	2	97	\N
4959	25.00	2022-12-16	primaryAccount	110758	OD ITEM FEE -  -	2	55	\N
4961	1514.35	2022-12-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4962	1489.81	2022-12-16	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
4963	193.57	2022-12-16	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4964	2899.46	2022-12-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
4965	291.50	2022-12-15	primaryAccount		ACH Debit - ACH EFT1215    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
4966	190.72	2022-12-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
4970	1664.61	2022-12-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4971	23.10	2022-12-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
4972	20.00	2022-12-12	primaryAccount		Wire Transfer Fee -  -	2	55	\N
4973	15.75	2022-12-12	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF NOVEMBER 2022	2	55	\N
4974	1.00	2022-12-12	primaryAccount		ATM Service Charge - ATM D/F GOOGLE *ADS99438 - cc@google.com CA REF# 503039	2	141	\N
4975	1.00	2022-12-12	primaryAccount		ATM Service Charge - ATM D/F Google ADS994382 - 650-2530000 CA REF# 328763	2	141	\N
4977	231.99	2022-12-12	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
4978	130.63	2022-12-12	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 37572	2	22	\N
4982	25.00	2022-12-09	primaryAccount	102	OD ITEM FEE -  -	2	55	\N
4984	25.00	2022-12-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
4985	1177.32	2022-12-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
4986	25.00	2022-12-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
4987	1164.98	2022-12-09	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
4988	25.00	2022-12-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
4989	214.50	2022-12-09	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
4990	25.00	2022-12-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
4991	89.05	2022-12-09	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
4992	25.00	2022-12-08	primaryAccount	110736	OD ITEM FEE -  -	2	55	\N
4994	25.00	2022-12-08	primaryAccount	239	OD ITEM FEE -  -	2	55	\N
4996	25.00	2022-12-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
4997	463.24	2022-12-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
4998	25.00	2022-12-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
4999	175.00	2022-12-08	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
5000	25.00	2022-12-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
5001	141.60	2022-12-08	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
5008	25.00	2022-12-07	primaryAccount	110698	OD ITEM FEE -  -	2	55	\N
5010	25.00	2022-12-07	primaryAccount	110675	OD ITEM FEE -  -	2	55	\N
5012	25.00	2022-12-07	primaryAccount	110657	OD ITEM FEE -  -	2	55	\N
5014	25.00	2022-12-07	primaryAccount	110619	OD ITEM FEE -  -	2	55	\N
5016	25.00	2022-12-07	primaryAccount		OD ITEM FEE -  -	2	55	\N
5017	76.91	2022-12-07	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 40968	2	17	\N
5018	25.00	2022-12-06	primaryAccount	110752	OD ITEM FEE -  -	2	55	\N
5020	25.00	2022-12-06	primaryAccount	110748	OD ITEM FEE -  -	2	55	\N
5022	25.00	2022-12-06	primaryAccount	110747	OD ITEM FEE -  -	2	55	\N
5024	25.00	2022-12-06	primaryAccount	110746	OD ITEM FEE -  -	2	55	\N
5023	1272.38	2022-12-06	primaryAccount	110747	CHECK -  -	2	279	\N
5025	1098.97	2022-12-06	primaryAccount	110746	CHECK -  -	2	5	\N
5026	615.88	2022-12-06	primaryAccount	110745	CHECK -  -	2	292	\N
5011	84.15	2022-12-07	primaryAccount	110675	CHECK -  -	2	270	\N
5013	33.37	2022-12-07	primaryAccount	110657	CHECK -  -	2	270	\N
5015	19.49	2022-12-07	primaryAccount	110619	CHECK -  -	2	270	\N
5003	19.00	2022-12-07	primaryAccount	110754	CHECK -  -	2	206	\N
5005	26.80	2022-12-07	primaryAccount	110742	CHECK -  -	2	270	\N
5006	18.17	2022-12-07	primaryAccount	110735	CHECK -  -	2	305	\N
5007	70.98	2022-12-07	primaryAccount	110720	CHECK -  -	2	270	\N
5009	27.69	2022-12-07	primaryAccount	110698	CHECK -  -	2	270	\N
4995	1208.70	2022-12-08	primaryAccount	239	CHECK -  -	2	302	\N
4979	1629.03	2022-12-12	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
4983	624.85	2022-12-09	primaryAccount	102	CHECK -  -	2	113	\N
4976	14.10	2022-12-12	primaryAccount	110738	CHECK -  -	2	233	\N
4981	1000.00	2022-12-12	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - MIGUEL KAFFURE	2	100	\N
4980	1000.00	2022-12-12	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
4969	260.00	2022-12-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4967	2000.00	2022-12-15	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
4968	1400.00	2022-12-15	primaryAccount	downtown	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5004	221.43	2022-12-07	primaryAccount	110744	CHECK -  - Alexander Moreno	2	307	\N
5028	2106.25	2022-12-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5029	953.88	2022-12-06	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
5030	594.50	2022-12-06	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
5040	2265.25	2022-12-05	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5041	495.41	2022-12-05	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 97886	2	24	\N
5043	21.95	2022-12-05	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 61591	2	189	\N
5044	15.92	2022-12-05	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 84166	2	189	\N
5045	11.93	2022-12-05	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 32109	2	189	\N
5048	25.00	2022-12-16	primaryAccount		OD ITEM FEE -  -	2	55	\N
5049	1500.00	2022-12-16	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5050	25.00	2022-12-14	primaryAccount		OD ITEM FEE -  -	2	55	\N
5052	25.00	2022-12-07	primaryAccount		OD ITEM FEE -  -	2	55	\N
5053	2000.00	2022-12-07	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5054	1.00	2022-12-05	primaryAccount		ATM Service Charge - ATM D/F FACEBK F23HRKKHF - 650-5434800 CA REF# 302913	2	169	\N
5055	1.00	2022-12-05	primaryAccount		ATM Service Charge - ATM D/F FACEBK *ABLQ8KPH - fb.me/ads CA REF# 370722	2	169	\N
5056	20.00	2022-12-09	cash			2	188	17
5075	685.00	2023-01-03	expensesAccount	102	CHECK -  -	2	301	\N
5019	1089.97	2022-12-06	primaryAccount	110752	CHECK -  -	2	177	\N
5039	1592.00	2022-12-05	primaryAccount	1003	CHECK -  -	2	146	\N
5034	499.70	2022-12-05	primaryAccount	110755	CHECK -  -	2	242	\N
5038	400.00	2022-12-05	primaryAccount	1004	CHECK -  - Algo Grande Repair	2	306	\N
5021	244.79	2022-12-06	primaryAccount	110748	CHECK -  -	2	300	\N
5047	2000.00	2022-12-05	primaryAccount	downtown	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5031	403.00	2022-12-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5035	37.86	2022-12-05	primaryAccount	110753	CHECK -  -	2	205	\N
5002	500.00	2022-12-08	primaryAccount		ACCOUNT ADJUSTMENT- DEBIT - Withdrawal tlr#5545 tr#8 - 120622 didn't post	2	100	\N
5069	25.49	2023-01-03	expensesAccount	113	CHECK -  -	2	206	\N
5073	736.18	2023-01-03	expensesAccount	104	CHECK -  -	2	117	\N
5071	36.38	2023-01-03	expensesAccount	111	CHECK -  -	2	205	\N
5036	296.58	2022-12-05	primaryAccount	110750	CHECK -  -	2	257	\N
5027	27.07	2022-12-06	primaryAccount	110740	CHECK -  -	2	304	\N
5051	88.00	2022-12-14	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	100	\N
5037	505.47	2022-12-05	primaryAccount	110749	CHECK -  -	2	269	\N
5046	4500.00	2022-12-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5033	19.67	2022-12-06	primaryAccount	110743	CHECK PAID- FORCE PAY -  - sin foto	2	100	\N
4993	551.96	2022-12-08	primaryAccount	110736	CHECK -  -	2	301	\N
5060	25.00	2023-01-04	expensesAccount	120	NSF RETURN ITEM FEE -  -	2	55	\N
5061	25.00	2023-01-04	expensesAccount	117	NSF RETURN ITEM FEE -  -	2	55	\N
5042	41.37	2022-12-05	primaryAccount		POS Transaction DDA - D/C TRN CENTRAL PARK TAG - BROKEN ARROW OK REF# 90009	2	100	\N
5032	300.00	2022-12-06	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5063	25.00	2023-01-03	expensesAccount	120	OD ITEM FEE -  -	2	55	\N
5065	25.00	2023-01-03	expensesAccount	117	OD ITEM FEE -  -	2	55	\N
5067	1475.00	2023-01-03	expensesAccount	115	CHECK -  -	2	146	\N
5066	500.00	2023-01-03	expensesAccount	117	CHECK -  -	2	108	\N
5059	500.00	2023-01-05	expensesAccount	117	CHECK -  - Britanny District	2	189	\N
5074	239.96	2023-01-03	expensesAccount	103	CHECK -  -	2	271	\N
5064	1632.00	2023-01-03	expensesAccount	120	CHECK -  -	2	30	\N
5058	534.40	2023-01-06	expensesAccount	106	CHECK -  -	2	103	\N
5068	464.32	2023-01-03	expensesAccount	114	CHECK -  -	2	242	\N
5070	1286.54	2023-01-03	expensesAccount	112	CHECK -  -	2	279	\N
5072	9.43	2023-01-03	expensesAccount	105	CHECK -  -	2	233	\N
5062	35.26	2023-01-04	expensesAccount	101	CHECK -  -	2	305	\N
5057	553.30	2023-01-06	expensesAccount	110	CHECK -  -	2	113	\N
5076	6.00	2022-12-30	expensesAccount		Account Service Charge -  -	2	55	\N
5077	16.40	2023-01-07	expensesAccount		EFT PIN DDA WAL-MART #0472 000000001640101500230107000000887766	2	33	\N
5078	13.36	2023-01-06	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 107066	2	32	\N
5079	24.25	2023-01-04	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 14225	2	44	\N
5080	39.99	2023-01-03	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 61136	2	49	\N
5081	32.78	2023-01-03	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 5227	2	44	\N
5082	28.11	2023-01-03	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 801192	2	51	\N
5083	6.00	2022-12-30	expensesAccount		Account Service Charge -  -	2	55	\N
5086	164.76	2022-12-29	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 86201	2	39	\N
5087	29.21	2022-12-29	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 720047	2	97	\N
5089	76.80	2022-12-27	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 239194	2	32	\N
5090	27.88	2022-12-27	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 23535	2	44	\N
5091	10.78	2022-12-27	expensesAccount		POS Transaction DDA - D/C TRN Wal-Mart Super C - BROKEN ARROW( OK REF# 785653	2	33	\N
5092	56.66	2022-12-20	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 5146	2	44	\N
5093	37.83	2022-12-19	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 51981	2	49	\N
5094	18.82	2022-12-19	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 21248	2	44	\N
5103	495.41	2023-01-06	primaryAccount		EFT-REP POS DDA AUTO-CHLOR SERVI 000000049541054724230106017994	2	24	\N
5105	1038.34	2023-01-06	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
5106	979.03	2023-01-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5107	175.00	2023-01-06	primaryAccount		ACH Debit - ACH SALE       SCULPTURE HOSPI - CARLOS LOPEZ	2	144	\N
5108	117.00	2023-01-06	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
5109	89.05	2023-01-06	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5111	2026.03	2023-01-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5112	102.42	2023-01-04	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 8028	2	22	\N
5113	12.97	2023-01-04	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 97091	2	189	\N
5117	1.00	2023-01-03	primaryAccount		ATM Service Charge - ATM D/F AUTO-CHLOR SYSTE - 5042192170 LA REF# 502	2	24	\N
5120	2256.77	2023-01-03	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5121	1488.08	2023-01-03	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
5122	224.13	2023-01-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5123	39.99	2023-01-03	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5124	6.00	2022-12-30	primaryAccount		Account Service Charge -  -	2	55	\N
5084	1.00	2022-12-29	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 690291	2	189	\N
5085	1.00	2022-12-29	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 702062	2	189	\N
5126	30.00	2022-12-30	primaryAccount		Stop Payment Charge -  -	2	100	\N
5125	30.00	2022-12-30	primaryAccount		Stop Payment Charge -  -	2	100	\N
5127	1.00	2022-12-30	primaryAccount		ATM Service Charge - ATM D/F UBER   *TRIP - SAN FRANCISCO CA REF# 351967	2	189	\N
5119	600.00	2023-01-03	primaryAccount	200	CHECK -  -	2	31	\N
5104	154.39	2023-01-06	primaryAccount	166	CHECK -  -	2	100	\N
5100	5.00	2023-01-07	primaryAccount		EFT POS DDA UBR* PENDING.UBE                             ATH 000000000500161032230107761528	2	189	\N
5099	16.93	2023-01-07	primaryAccount		EFT-SAF POS DDA UBER   TRIP 000000001693161032230107046814	2	189	\N
5101	11.93	2023-01-07	primaryAccount		EFT POS DDA UBR* PENDING.UBE                             ATH 000000001193161032230107761528	2	189	\N
5102	5.00	2023-01-07	primaryAccount		EFT POS DDA UBER   *TRIP 000000000500160956230107822592	2	189	\N
5097	5.74	2023-01-08	primaryAccount		EFT POS DDA UBR* PENDING.UBE                             ATH 000000000574004610230108701180	2	189	\N
5096	28.72	2023-01-08	primaryAccount		EFT-SAF POS DDA UBER   TRIP 000000002872004610230108074477	2	189	\N
5095	22.96	2023-01-08	primaryAccount		EFT POS DDA UBR* PENDING.UBE 000000002296033645230108701331	2	189	\N
5116	1.00	2023-01-03	primaryAccount		ATM Service Charge - ATM D/F UBER   *TRIP - SAN FRANCISCO CA REF# 352047	2	189	\N
5118	1.00	2023-01-03	primaryAccount		ATM Service Charge - ATM D/F DRI*UPRINTING - 888-888-4211 CA REF# 686362	2	189	\N
5114	2500.00	2023-01-04	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5115	2000.00	2023-01-04	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5110	1200.00	2023-01-05	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5131	25.00	2022-12-30	primaryAccount	165	OD ITEM FEE -  -	2	55	\N
5133	25.00	2022-12-30	primaryAccount		OD ITEM FEE -  -	2	55	\N
5134	5570.75	2022-12-30	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5135	1677.22	2022-12-30	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5136	1633.88	2022-12-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5137	89.05	2022-12-30	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5140	44.75	2022-12-29	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 61366	2	284	\N
5142	832.33	2022-12-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5143	252.16	2022-12-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
5146	637.44	2022-12-27	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 22815	2	24	\N
5147	67.11	2022-12-27	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 77808	2	22	\N
5148	55.00	2022-12-27	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 47466	2	287	\N
5149	1158.90	2022-12-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5150	1138.98	2022-12-23	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
5151	161.29	2022-12-23	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5152	1.00	2022-12-22	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 213751	2	22	\N
5153	25.00	2022-12-22	primaryAccount	110759	OD ITEM FEE -  -	2	55	\N
5155	25.00	2022-12-21	primaryAccount	199	OD ITEM FEE -  -	2	55	\N
5157	25.00	2022-12-21	primaryAccount	161	OD ITEM FEE -  -	2	55	\N
5159	1.00	2022-12-20	primaryAccount		ATM Service Charge - ATM D/F AUTO-CHLOR SYSTE - 5042192170 LA REF# 201684	2	24	\N
5161	25.00	2022-12-20	primaryAccount	110760	OD ITEM FEE -  -	2	55	\N
5163	25.00	2022-12-20	primaryAccount	198	OD ITEM FEE -  -	2	55	\N
5165	25.00	2022-12-20	primaryAccount	194	OD ITEM FEE -  -	2	55	\N
5167	25.00	2022-12-20	primaryAccount	193	OD ITEM FEE -  -	2	55	\N
5169	25.00	2022-12-20	primaryAccount		OD ITEM FEE -  -	2	55	\N
5170	2305.58	2022-12-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5171	470.83	2022-12-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
5172	25.00	2022-12-19	primaryAccount	110773	OD ITEM FEE -  -	2	55	\N
5174	25.00	2022-12-19	primaryAccount	110772	OD ITEM FEE -  -	2	55	\N
5176	25.00	2022-12-19	primaryAccount	110771	OD ITEM FEE -  -	2	55	\N
5178	25.00	2022-12-19	primaryAccount	110770	OD ITEM FEE -  -	2	55	\N
5188	1816.13	2022-12-19	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5189	92.77	2022-12-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5190	5.00	2022-12-19	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	100	\N
5187	64.43	2022-12-19	primaryAccount	191	CHECK -  -	2	305	\N
5186	1098.97	2022-12-19	primaryAccount	192	CHECK -  -	2	5	\N
5185	275.67	2022-12-19	primaryAccount	195	CHECK -  -	2	292	\N
5184	1677.00	2022-12-19	primaryAccount	197	CHECK -  -	2	146	\N
5182	171.96	2022-12-19	primaryAccount	110751	CHECK -  -	2	296	\N
5181	726.68	2022-12-19	primaryAccount	110757	CHECK -  -	2	301	\N
5180	149.60	2022-12-19	primaryAccount	110769	CHECK -  -	2	296	\N
5177	62.84	2022-12-19	primaryAccount	110771	CHECK -  -	2	205	\N
5175	57.99	2022-12-19	primaryAccount	110772	CHECK -  -	2	206	\N
5162	1208.69	2022-12-20	primaryAccount	110760	CHECK -  -	2	302	\N
5160	303.76	2022-12-20	primaryAccount	110768	CHECK -  -	2	257	\N
5168	1360.25	2022-12-20	primaryAccount	193	CHECK -  -	2	279	\N
5166	543.21	2022-12-20	primaryAccount	194	CHECK -  -	2	269	\N
5158	1000.00	2022-12-21	primaryAccount	161	CHECK -  -	2	100	\N
5156	665.27	2022-12-21	primaryAccount	199	CHECK -  -	2	113	\N
5154	17.49	2022-12-22	primaryAccount	110759	CHECK -  -	2	233	\N
5144	200.00	2022-12-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5139	599.60	2022-12-29	primaryAccount	163	CHECK -  -	2	35	\N
5128	1.00	2022-12-30	primaryAccount		ATM Service Charge - ATM D/F UBER* PENDING - WWW.UBER.COM CA REF# 103044	2	189	\N
5129	1.00	2022-12-30	primaryAccount		ATM Service Charge - ATM D/F UBR* PENDING.UBE - SAN FRANCISCO CA REF# 540959	2	189	\N
5132	250.00	2022-12-30	primaryAccount	165	CHECK -  -	2	100	\N
5183	720.00	2022-12-19	primaryAccount	240	CHECK -  - vent hood	2	308	\N
5164	302.60	2022-12-20	primaryAccount	198	CHECK -  - Alexis Argueta	2	309	\N
5141	2200.00	2022-12-29	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5138	3000.00	2022-12-29	primaryAccount	164	CHECK -  - Ponce District Sublabor	2	100	\N
5194	25.00	2023-01-04	primaryAccount		OD ITEM FEE -  -	2	55	\N
5195	1000.00	2023-01-04	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5196	10.00	2023-01-03	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
5197	25.00	2023-01-03	primaryAccount		OD ITEM FEE -  -	2	55	\N
5198	1000.00	2023-01-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5199	25.00	2023-01-03	primaryAccount		OD ITEM FEE -  -	2	55	\N
5200	1000.00	2023-01-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5201	25.00	2023-01-03	primaryAccount		OD ITEM FEE -  -	2	55	\N
5202	500.00	2023-01-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5203	6.00	2022-12-30	primaryAccount		Account Service Charge -  -	2	55	\N
5204	500.00	2022-12-29	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5205	25.00	2022-12-27	primaryAccount		OD ITEM FEE -  -	2	55	\N
5206	1000.00	2022-12-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5207	25.00	2022-12-27	primaryAccount		OD ITEM FEE -  -	2	55	\N
5208	600.00	2022-12-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5209	25.00	2022-12-27	primaryAccount		OD ITEM FEE -  -	2	55	\N
5210	500.00	2022-12-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5211	34.99	2022-12-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5212	25.00	2022-12-22	primaryAccount		OD ITEM FEE -  -	2	55	\N
5213	300.00	2022-12-22	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5214	25.00	2022-12-21	primaryAccount		OD ITEM FEE -  -	2	55	\N
5215	2000.00	2022-12-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5216	25.00	2022-12-19	primaryAccount		OD ITEM FEE -  -	2	55	\N
5217	800.00	2022-12-19	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5218	500.00	2022-12-19	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5192	2500.00	2022-12-19	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5219	20.00	2022-10-21	cash			2	235	17
5220	37.30	2022-10-21	cash			2	44	17
5221	23.71	2022-10-21	cash			2	44	17
5224	25.00	2023-01-09	expensesAccount	144630	OD ITEM FEE -  -	2	55	\N
5173	436.40	2022-12-19	primaryAccount	110773	CHECK -  -	2	242	\N
5226	25.00	2023-01-09	expensesAccount	144601	OD ITEM FEE -  -	2	55	\N
5130	1.00	2022-12-30	primaryAccount		ATM Service Charge - ATM D/F UBR* PENDING.UBE - SAN FRANCISCO CA REF# 570555	2	189	\N
5088	1.00	2022-12-27	expensesAccount		ATM Service Charge - ATM D/F QT 4 OUTSIDE - TULSA OK REF# 717482	2	189	\N
5179	1089.97	2022-12-19	primaryAccount	110770	CHECK -  -	2	177	\N
5098	22.98	2023-01-08	primaryAccount		EFT POS DDA UBR* PENDING.UBE                             ATH 000000002298004610230108701180	2	189	\N
5229	55.92	2023-01-13	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 52136	2	32	\N
5231	16.40	2023-01-09	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0472 - BROKEN ARROW OK REF# 887766	2	33	\N
5193	200.00	2022-12-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5191	1000.00	2022-12-19	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5232	13.83	2023-01-09	expensesAccount		POS Transaction DDA - D/C TRN QT 80 - BROKEN ARROW OK REF# 58153	2	97	\N
5145	389.90	2022-12-27	primaryAccount	162	CHECK -  - Yurisbelis Hernandez	2	310	\N
5237	1518.18	2023-01-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5238	153.42	2023-01-13	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5239	8.93	2023-01-13	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 85070	2	189	\N
5242	309.60	2023-01-12	primaryAccount		ACH Debit - ACH EFT0112    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5243	5.00	2023-01-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 55816	2	189	\N
5228	150.00	2023-01-09	expensesAccount	119	CHECK -  -	2	270	\N
5225	30.00	2023-01-09	expensesAccount	144630	CHECK -  -	2	30	\N
5230	1.00	2023-01-10	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 271154	2	189	\N
5223	300.00	2023-01-13	expensesAccount	122	CHECK -  -	2	205	\N
5233	18.53	2023-01-13	primaryAccount	110808	CHECK -  -	2	205	\N
5234	730.75	2023-01-13	primaryAccount	110796	CHECK -  -	2	117	\N
5235	750.00	2023-01-13	primaryAccount	170	CHECK -  -	2	31	\N
5222	1340.00	2023-01-13	expensesAccount	123	CHECK -  -	2	146	\N
5227	1632.00	2023-01-09	expensesAccount	144601	CHECK -  -	2	30	\N
5244	1000.00	2023-01-12	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5241	200.00	2023-01-13	primaryAccount	DT to Expenses Bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5236	11250.00	2023-01-13	primaryAccount	167	CHECK -  -	2	312	\N
5246	401.06	2023-01-11	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
5247	131.00	2023-01-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
5248	23.10	2023-01-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
5249	8.92	2023-01-11	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 93957	2	189	\N
5250	1451.43	2023-01-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5252	150.89	2023-01-10	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 8951	2	17	\N
5253	7.91	2023-01-10	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 13399	2	189	\N
5254	5.00	2023-01-10	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 18213	2	189	\N
5259	495.41	2023-01-09	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 17994	2	24	\N
5260	28.72	2023-01-09	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 74477	2	189	\N
5261	22.96	2023-01-09	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 57024	2	189	\N
5262	16.93	2023-01-09	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 46814	2	189	\N
5263	5.74	2023-01-09	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 91258	2	189	\N
5264	5.00	2023-01-09	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 74878	2	189	\N
5265	25.00	2023-01-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
5266	3000.00	2023-01-09	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6327	20.00	2023-06-17	cash			2	188	17
5257	24.76	2023-01-09	primaryAccount	110695	CHECK -  -	2	252	\N
5251	1981.66	2023-01-10	primaryAccount		POS Transaction DDA - D/C TRN ACCURATE FIRE EQ - 918-437-5572 OK REF# 10005	2	311	\N
5245	3793.00	2023-01-11	primaryAccount	169	CHECK -  -	2	136	\N
5267	6.00	2023-01-31	expensesAccount		Account Service Charge -  -	2	55	\N
5258	49.46	2023-01-09	primaryAccount	196	CHECK -  -	2	229	\N
5270	25.00	2023-01-18	expensesAccount	118	OD ITEM FEE -  -	2	55	\N
5256	1.61	2023-01-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	189	\N
5272	25.00	2023-01-17	expensesAccount	116	OD ITEM FEE -  -	2	55	\N
5274	153.18	2023-02-09	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #8263 - TULSA OK REF# 9302	2	32	\N
5275	54.04	2023-02-08	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 39545	2	49	\N
5276	49.41	2023-02-07	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 49431	2	44	\N
5277	30.12	2023-02-07	expensesAccount		POS Transaction DDA - D/C TRN QT 4 OUTSIDE - TULSA OK REF# 757440	2	97	\N
5278	47.25	2023-02-06	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 95924	2	39	\N
5280	6.00	2023-01-31	expensesAccount		Account Service Charge -  -	2	55	\N
5281	24.94	2023-01-31	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 51740	2	39	\N
5283	250.94	2023-01-30	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 183974	2	32	\N
5255	3030.00	2023-01-10	primaryAccount	BA a DT	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5240	2500.00	2023-01-13	primaryAccount	BA a Expenses BA	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5284	46.58	2023-01-30	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 25132	2	39	\N
5285	31.40	2023-01-30	expensesAccount		POS Transaction DDA - D/C TRN QT 80 OUTSIDE - BROKEN ARROW OK REF# 537759	2	97	\N
5286	30.33	2023-01-30	expensesAccount		POS Transaction DDA - D/C TRN RESTAURANT EQUIP - TULSA OK REF# 900319	2	51	\N
5287	12.95	2023-01-30	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 25026	2	39	\N
5288	12.58	2023-01-30	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 4109	2	44	\N
5289	59.00	2023-01-23	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 78039	2	39	\N
5290	30.16	2023-01-23	expensesAccount		POS Transaction DDA - D/C TRN QT 28 OUTSIDE - TULSA OK REF# 719198	2	97	\N
5291	11.26	2023-01-23	expensesAccount		POS Transaction DDA - D/C TRN WAL-MART #0472 - BROKEN ARROW OK REF# 331512	2	33	\N
5292	88.86	2023-01-18	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 64047	2	39	\N
5273	952.40	2023-01-17	expensesAccount	116	CHECK -  - Gasto de District	2	189	\N
5271	1208.69	2023-01-18	expensesAccount	118	CHECK -  -	2	302	\N
5269	2197.96	2023-01-24	expensesAccount	121	CHECK -  -	2	5	\N
5268	300.00	2023-01-26	expensesAccount	124	CHECK -  -	2	270	\N
5282	1.00	2023-01-30	expensesAccount		ATM Service Charge - ATM D/F REASORS #7 7114 - TULSA OK REF# 156305	2	96	\N
5279	10.68	2023-02-02	expensesAccount		POS Transaction DDA - D/C TRN SAMSCLUB #6342 - TULSA OK REF# 975546	2	32	\N
6330	10.00	2023-06-20	cash	refund		2	188	17
6333	20.00	2023-06-30	cash			2	188	17
6336	157.33	2023-07-03	cash			2	46	17
6338	20.00	2023-07-08	cash			2	188	17
5294	78.76	2023-01-17	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 85641	2	44	\N
5295	43.23	2023-01-17	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 17502	2	49	\N
5296	32.35	2023-01-17	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 96244	2	39	\N
5297	29.25	2023-01-17	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 137	2	39	\N
5298	2000.00	2023-02-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5299	25.00	2023-02-07	primaryAccount		OD ITEM FEE -  -	2	55	\N
5301	25.00	2023-02-06	primaryAccount		OD ITEM FEE -  -	2	55	\N
5302	1600.00	2023-02-06	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5305	1500.00	2023-02-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5306	6.00	2023-01-31	primaryAccount		Account Service Charge -  -	2	55	\N
5307	10.00	2023-01-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
5308	1.00	2023-01-31	primaryAccount		ATM Service Charge - ATM D/F FACEBK *PDST5MKJ - fb.me/ads CA REF# 252721	2	169	\N
5309	1.00	2023-01-31	primaryAccount		ATM Service Charge - ATM D/F FACEBK E6YE2MFJF - 650-5434800 CA REF# 416985	2	169	\N
5310	25.00	2023-01-31	primaryAccount		OD ITEM FEE -  -	2	55	\N
5311	1800.00	2023-01-31	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5312	25.00	2023-01-27	primaryAccount		OD ITEM FEE -  -	2	55	\N
5313	34.99	2023-01-27	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5314	1000.00	2023-01-25	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5315	25.00	2023-01-23	primaryAccount		OD ITEM FEE -  -	2	55	\N
5316	1300.00	2023-01-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5317	25.00	2023-01-17	primaryAccount		OD ITEM FEE -  -	2	55	\N
5318	2350.00	2023-01-17	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5319	25.00	2023-02-10	primaryAccount	110845	OD ITEM FEE -  -	2	55	\N
5321	25.00	2023-02-10	primaryAccount	110842	OD ITEM FEE -  -	2	55	\N
5323	25.00	2023-02-10	primaryAccount	110830	OD ITEM FEE -  -	2	55	\N
5325	25.00	2023-02-10	primaryAccount	5004	OD ITEM FEE -  -	2	55	\N
5327	1840.14	2023-02-10	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5328	123.30	2023-02-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
5329	89.05	2023-02-10	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5332	1147.91	2023-02-09	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
5333	25.65	2023-02-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JANUARY 2023	2	55	\N
5334	444.16	2023-02-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
5335	214.50	2023-02-08	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
5336	500.00	2023-02-08	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 486	2	141	\N
5337	267.57	2023-02-08	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 40105	2	17	\N
5338	91.81	2023-02-08	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 81430	2	284	\N
5339	8.94	2023-02-08	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 96426	2	189	\N
5341	1349.67	2023-02-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5342	5.00	2023-02-07	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 62564	2	189	\N
5344	529.74	2023-02-06	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5345	20.00	2023-02-03	primaryAccount		Wire Transfer Fee -  -	2	55	\N
5346	25.00	2023-02-03	primaryAccount	110822	OD ITEM FEE -  -	2	55	\N
5349	911.83	2023-02-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5350	224.30	2023-02-03	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5347	1444.64	2023-02-03	primaryAccount	110822	CHECK -  -	2	279	\N
5343	386.97	2023-02-06	primaryAccount	110817	CHECK -  -	2	310	\N
5330	1000.00	2023-02-10	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5326	3750.00	2023-02-10	primaryAccount	5004	CHECK -  -	2	312	\N
5340	4210.00	2023-02-08	primaryAccount	primary ba a dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5322	36.09	2023-02-10	primaryAccount	110842	CHECK -  -	2	205	\N
5320	264.02	2023-02-10	primaryAccount	110845	CHECK -  -	2	301	\N
5324	675.68	2023-02-10	primaryAccount	110830	CHECK -  -	2	301	\N
5348	39.21	2023-02-03	primaryAccount	110816	CHECK -  - Pedro Gutierrez	2	314	\N
5331	1000.00	2023-02-10	primaryAccount	primary ba a dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5303	25.00	2023-02-02	primaryAccount		OD ITEM FEE -  -	2	55	\N
5304	1800.00	2023-02-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5358	1535.28	2023-02-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5359	491.96	2023-02-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 15573	2	141	\N
5360	6.00	2023-01-31	primaryAccount		Account Service Charge -  -	2	55	\N
5366	1461.49	2023-01-31	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5367	39.99	2023-01-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5368	112.48	2023-01-31	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 88546	2	22	\N
5375	252.16	2023-01-30	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
5377	1175.53	2023-01-30	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5381	1888.04	2023-01-27	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5382	153.57	2023-01-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5383	89.05	2023-01-27	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5386	422.95	2023-01-26	primaryAccount		ACH Debit - ACH EFT0126    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5387	55.00	2023-01-25	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 99869	2	287	\N
5389	1520.29	2023-01-25	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5390	1363.27	2023-01-25	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5391	15.15	2023-01-25	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5392	2008.82	2023-01-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5393	1144.98	2023-01-24	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
5394	495.41	2023-01-24	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 58833	2	24	\N
5395	406.51	2023-01-24	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 58841	2	24	\N
5397	261.37	2023-01-23	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5398	82.08	2023-01-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5399	158.84	2023-01-23	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 68432	2	22	\N
5400	35.00	2023-01-23	primaryAccount		POS Transaction DDA - D/C TRN FACEBK AH6F7NX9R - 650-5434800 CA REF# 2363	2	169	\N
5401	8.96	2023-01-23	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 42672	2	189	\N
5402	6.00	2023-01-23	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 23311	2	189	\N
5404	1586.80	2023-01-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5405	256.58	2023-01-20	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5406	16.01	2023-01-20	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 25746	2	189	\N
5407	5.00	2023-01-20	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 98799	2	189	\N
6328	20.00	2023-06-18	cash			2	188	17
5396	184.08	2023-01-24	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 756136	2	100	\N
5384	1089.97	2023-01-26	primaryAccount	110807	CHECK -  -	2	177	\N
5385	24.53	2023-01-26	primaryAccount	110803	CHECK -  -	2	270	\N
5380	1098.97	2023-01-27	primaryAccount	110804	CHECK -  -	2	5	\N
5379	512.69	2023-01-27	primaryAccount	110824	CHECK -  -	2	269	\N
5378	17.89	2023-01-27	primaryAccount	110826	CHECK -  -	2	205	\N
5371	257.44	2023-01-30	primaryAccount	110825	CHECK -  -	2	257	\N
5370	435.17	2023-01-30	primaryAccount	110828	CHECK -  -	2	242	\N
5372	17.70	2023-01-30	primaryAccount	110819	CHECK -  -	2	297	\N
5373	11.66	2023-01-30	primaryAccount	110814	CHECK -  -	2	233	\N
5374	1376.33	2023-01-30	primaryAccount	110811	CHECK -  -	2	305	\N
5364	794.48	2023-01-31	primaryAccount	110812	CHECK -  -	2	301	\N
5363	434.58	2023-01-31	primaryAccount	110813	CHECK -  -	2	271	\N
5357	604.68	2023-02-01	primaryAccount	110821	CHECK -  -	2	113	\N
5388	2007.00	2023-01-25	primaryAccount	prim ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5365	30.77	2023-01-31	primaryAccount	110806	CHECK -  - Leon Reyes	2	316	\N
5361	395.78	2023-01-31	primaryAccount	110827	CHECK -  - Francisca Valencia	2	317	\N
5362	32.75	2023-01-31	primaryAccount	110823	CHECK -  - Leon Reyes	2	316	\N
5353	234.58	2023-02-02	primaryAccount	110815	CHECK -  - Ana Dominguez	2	315	\N
5369	600.00	2023-01-31	primaryAccount	primary ba a exp bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5352	3793.00	2023-02-03	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - BRYAN DE FABIO	2	136	\N
5354	1219.08	2023-02-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
5355	130.63	2023-02-02	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 98598	2	22	\N
5356	7500.00	2023-02-02	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6331	20.00	2023-06-23	cash			2	188	17
6334	39.77	2023-06-30	cash			2	49	17
5408	4.59	2023-01-20	primaryAccount		POS Transaction DDA - D/C TRN FACEBK JGNP9NBAR - 650-5434800 CA REF# 75996	2	169	\N
5411	24.75	2023-01-19	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF DECEMBER 2022	2	55	\N
5413	470.83	2023-01-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
5414	5.00	2023-01-19	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 79171	2	189	\N
5415	1843.07	2023-01-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5416	1074.05	2023-01-18	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
5417	190.72	2023-01-18	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
5431	2672.59	2023-01-17	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5432	1489.81	2023-01-17	primaryAccount		ACH Debit - ACH AT TRNSFER First Pryority - Dos Bandidos Bixby L	2	60	\N
5433	358.38	2023-01-17	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5434	2899.46	2023-01-17	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
5436	20.00	2023-01-14	cash			2	235	17
5437	20.00	2023-01-21	cash			2	235	17
5438	20.00	2023-01-28	cash			2	235	17
5439	131.95	2023-01-29	cash			2	96	17
5428	1376.33	2023-01-17	primaryAccount	110793	CHECK -  -	2	305	\N
5403	192.57	2023-01-20	primaryAccount	110799	CHECK -  - Ana Dominguez	2	315	\N
5300	1000.00	2023-02-07	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	100	\N
5423	33.33	2023-01-17	primaryAccount	110800	CHECK -  - Pedro Gutierrez	2	314	\N
5440	6.00	2023-02-28	expensesAccount		Account Service Charge -  -	2	55	\N
5427	768.65	2023-01-17	primaryAccount	110794	CHECK -  -	2	301	\N
5441	6.00	2023-02-28	expensesAccount		Account Service Charge -  -	2	55	\N
5430	24.92	2023-01-17	primaryAccount	110741	CHECK -  -	2	297	\N
5426	357.39	2023-01-17	primaryAccount	110795	CHECK -  -	2	271	\N
5422	575.37	2023-01-17	primaryAccount	110801	CHECK -  -	2	310	\N
5429	18.70	2023-01-17	primaryAccount	110762	CHECK -  -	2	297	\N
5425	12.35	2023-01-17	primaryAccount	110797	CHECK -  -	2	233	\N
5412	23.76	2023-01-19	primaryAccount	110802	CHECK -  -	2	304	\N
5421	1354.20	2023-01-17	primaryAccount	110805	CHECK -  -	2	279	\N
5418	5.00	2023-01-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
5424	686.47	2023-01-17	primaryAccount	110798	CHECK -  - Adres de Franca Boris	2	313	\N
5442	1.00	2023-02-22	expensesAccount		ATM Service Charge - ATM D/F SAMS CLUB #8263 - TULSA OK REF# 62760	2	32	\N
5351	5.00	2023-02-03	primaryAccount		ACCOUNT ADJUSTMENT- DEBIT - WD 7505. posted in error - as 7500. 02/02/23	2	189	\N
5443	57.50	2023-02-13	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 17826	2	32	\N
5444	30.33	2023-02-13	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 11110	2	39	\N
5420	17.85	2023-01-17	primaryAccount	110809	CHECK -  -	2	206	\N
5445	18.45	2023-03-03	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF FEBRUARY 2023	2	55	\N
5446	1224.63	2023-03-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5419	479.12	2023-01-17	primaryAccount	110810	CHECK -  -	2	242	\N
5447	89.05	2023-03-03	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5410	5.00	2023-01-20	primaryAccount		ACCOUNT ADJUSTMENT- DEBIT - WD 7255. posted in error - as 7250.	2	189	\N
5376	350.00	2023-01-30	primaryAccount	primary ba a exp bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5293	1.00	2023-01-17	expensesAccount		ATM Service Charge - ATM D/F QT 9 OUTSIDE - TULSA OK REF# 819288	2	189	\N
5435	250.00	2023-01-17	primaryAccount	primary ba a exp bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5450	1260.47	2023-03-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
5451	39.99	2023-03-02	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5409	7250.00	2023-01-20	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5452	67.11	2023-03-02	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 89158	2	22	\N
5453	20.00	2023-03-01	primaryAccount		Wire Transfer Fee -  -	2	55	\N
5454	25.00	2023-03-01	primaryAccount	110857	OD ITEM FEE -  -	2	55	\N
5455	1458.13	2023-03-01	primaryAccount	110857	CHECK -  -	2	279	\N
5457	150.11	2023-03-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5458	419.09	2023-03-01	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - INTERNET CA REF# 55018	2	141	\N
5456	976.19	2023-03-01	primaryAccount	110848	CHECK -  -	2	301	\N
5449	27.88	2023-03-02	primaryAccount	110839	CHECK -  -	2	316	\N
5448	74.59	2023-03-02	primaryAccount	110858	CHECK -  -	2	316	\N
5459	3793.00	2023-03-01	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
5460	6.00	2023-02-28	primaryAccount		Account Service Charge -  -	2	55	\N
5462	2632.83	2023-02-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5463	252.15	2023-02-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
5477	2183.13	2023-02-27	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5481	1792.91	2023-02-27	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5485	1249.52	2023-02-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5486	152.08	2023-02-24	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5487	55.00	2023-02-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 41389	2	287	\N
5488	1133.32	2023-02-23	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
5489	226.15	2023-02-23	primaryAccount		ACH Debit - ACH EFT0223    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5490	495.41	2023-02-23	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 21855	2	24	\N
5492	1883.71	2023-02-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5493	608.21	2023-02-22	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 7246	2	24	\N
5494	500.00	2023-02-22	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 68585	2	141	\N
5497	618.17	2023-02-21	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
5498	84.36	2023-02-21	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 48966	2	22	\N
5500	11.41	2023-02-21	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 83014	2	189	\N
5501	5.00	2023-02-21	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 89783	2	189	\N
5502	3.00	2023-02-21	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 63212	2	189	\N
5504	25.00	2023-02-17	primaryAccount		OD ITEM FEE -  -	2	55	\N
5505	1177.33	2023-02-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5506	89.05	2023-02-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5508	44.75	2023-02-17	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 82935	2	284	\N
5509	6.09	2023-02-17	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 88670	2	189	\N
5510	2964.75	2023-02-17	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
5511	1.00	2023-02-16	primaryAccount		ATM Service Charge - ATM D/F Java Dave's Coff - 918-8365570 OK REF# 503658	2	22	\N
5513	190.72	2023-02-16	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
5514	130.63	2023-02-16	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 38954	2	22	\N
5515	5.00	2023-02-16	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 7503	2	189	\N
5516	25.00	2023-02-15	primaryAccount	110838	OD ITEM FEE -  -	2	55	\N
5512	137.55	2023-02-16	primaryAccount	5025	CHECK -  -	2	103	\N
5496	481.88	2023-02-21	primaryAccount	110831	CHECK -  -	2	271	\N
5491	2212.00	2023-02-22	primaryAccount	5008	CHECK -  -	2	30	\N
5482	558.70	2023-02-24	primaryAccount	110859	CHECK -  -	2	269	\N
5483	591.78	2023-02-24	primaryAccount	110856	CHECK -  -	2	113	\N
5478	115.57	2023-02-27	primaryAccount		POS Transaction DDA - D/C TRN FSI*PSO BILLMATR - 888-333-4026 OH REF# 89244	2	100	\N
5476	300.00	2023-02-27	primaryAccount	5021	CHECK -  -	2	205	\N
5475	300.00	2023-02-27	primaryAccount	5022	CHECK -  -	2	270	\N
5474	300.00	2023-02-27	primaryAccount	5027	CHECK -  -	2	270	\N
5473	18.33	2023-02-27	primaryAccount	110820	CHECK -  -	2	270	\N
5472	27.96	2023-02-27	primaryAccount	110835	CHECK -  -	2	270	\N
5471	1376.33	2023-02-27	primaryAccount	110847	CHECK -  -	2	305	\N
5470	27.97	2023-02-27	primaryAccount	110850	CHECK -  -	2	233	\N
5469	1599.98	2023-02-27	primaryAccount	110851	CHECK -  -	2	146	\N
5468	21.44	2023-02-27	primaryAccount	110854	CHECK -  -	2	270	\N
5467	269.18	2023-02-27	primaryAccount	110860	CHECK -  -	2	257	\N
5466	88.66	2023-02-27	primaryAccount	110861	CHECK -  -	2	205	\N
5465	729.22	2023-02-27	primaryAccount	110862	CHECK -  -	2	317	\N
5484	85.06	2023-02-24	primaryAccount	110855	CHECK -  - Christopher	2	319	\N
5507	5.00	2023-02-17	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
5499	16.93	2023-02-21	primaryAccount		POS Transaction DDA - D/C TRN UBER* TRIP - WWW.UBER.COM CA REF# 79840	2	189	\N
5503	500.00	2023-02-21	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5480	1500.00	2023-02-27	primaryAccount	from primary to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5479	1000.00	2023-02-27	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5519	500.00	2023-02-15	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 62585	2	141	\N
5520	7.29	2023-02-15	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 20018	2	189	\N
5522	1832.04	2023-02-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5523	976.18	2023-02-14	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
5524	16.71	2023-02-14	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 20309	2	189	\N
5525	5.00	2023-02-14	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 21503	2	189	\N
5535	612.73	2023-02-13	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5536	50.00	2023-02-13	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5537	23.10	2023-02-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
5538	7.76	2023-02-13	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 21651	2	189	\N
5539	5.00	2023-02-13	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 71472	2	189	\N
5540	25.00	2023-03-03	primaryAccount		OD ITEM FEE -  -	2	55	\N
5541	1000.00	2023-03-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5542	25.00	2023-03-02	primaryAccount		OD ITEM FEE -  -	2	55	\N
5543	1000.00	2023-03-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5544	1000.00	2023-03-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5545	6.00	2023-02-28	primaryAccount		Account Service Charge -  -	2	55	\N
5546	10.00	2023-02-28	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
5547	25.00	2023-02-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
5548	34.99	2023-02-28	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5549	1.00	2023-02-27	primaryAccount		ATM Service Charge - ATM D/F FACEBK KDC4TMFJF - 650-5434800 CA REF# 305934	2	169	\N
5550	700.00	2023-02-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5551	25.00	2023-02-23	primaryAccount		OD ITEM FEE -  -	2	55	\N
5552	750.00	2023-02-23	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5553	25.00	2023-02-21	primaryAccount		OD ITEM FEE -  -	2	55	\N
5554	1500.00	2023-02-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5555	25.00	2023-02-14	primaryAccount		OD ITEM FEE -  -	2	55	\N
5556	1200.00	2023-02-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5529	190.61	2023-02-13	primaryAccount	110841	CHECK -  -	2	257	\N
5532	13.26	2023-02-13	primaryAccount	110832	CHECK -  -	2	233	\N
5526	1600.00	2023-02-13	primaryAccount	110846	CHECK -  -	2	146	\N
5561	900.00	2023-03-17	primaryAccount	5030	CHECK -  -	2	144	\N
5461	358.20	2023-02-28	primaryAccount	110849	CHECK -  -	2	271	\N
5534	300.00	2023-02-13	primaryAccount	5028	CHECK -  -	2	205	\N
5531	8.49	2023-02-13	primaryAccount	110834	CHECK -  -	2	297	\N
5564	200.00	2023-03-17	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 99864	2	23	\N
5528	735.37	2023-02-13	primaryAccount	110843	CHECK -  -	2	317	\N
5533	1376.33	2023-02-13	primaryAccount	110829	CHECK -  -	2	305	\N
5518	513.68	2023-02-15	primaryAccount	110837	CHECK -  -	2	113	\N
5560	345.02	2023-03-17	primaryAccount	110865	CHECK -  -	2	271	\N
5530	313.29	2023-02-13	primaryAccount	110840	CHECK -  -	2	269	\N
5527	498.96	2023-02-13	primaryAccount	110844	CHECK -  -	2	242	\N
5517	1475.44	2023-02-15	primaryAccount	110838	CHECK -  -	2	279	\N
5464	275.95	2023-02-27	primaryAccount	110863	CHECK -  -	2	242	\N
5521	108.60	2023-02-14	primaryAccount	110836	CHECK -  - Christopher Pendley	2	319	\N
5495	200.00	2023-02-22	primaryAccount	from primary to expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5559	58.54	2023-03-13	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 17347	2	39	\N
5562	1472.12	2023-03-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5563	89.05	2023-03-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5565	20.96	2023-03-17	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 80340	2	189	\N
5566	190.72	2023-03-16	primaryAccount		ACH Debit - ACH AUTO0PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
5568	2964.75	2023-03-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
5570	500.00	2023-03-15	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 84585	2	141	\N
5574	1486.75	2023-03-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5586	2205.05	2023-03-13	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5587	474.33	2023-03-13	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5588	23.10	2023-03-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
5589	3.00	2023-03-13	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 37881	2	189	\N
5591	1980.61	2023-03-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5592	777.39	2023-03-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
5593	161.29	2023-03-10	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5594	121.80	2023-03-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
5595	432.72	2023-03-09	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
5596	149.50	2023-03-08	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
5597	500.00	2023-03-08	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 88585	2	141	\N
5598	239.42	2023-03-08	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 85929	2	17	\N
5601	2903.62	2023-03-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5603	1111.54	2023-03-06	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
5604	711.24	2023-03-06	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5605	18.99	2023-03-06	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 39244	2	189	\N
5606	12.99	2023-03-06	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 69174	2	189	\N
5607	12.92	2023-03-06	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 92060	2	189	\N
5608	25.00	2023-03-14	primaryAccount		OD ITEM FEE -  -	2	55	\N
5609	1500.00	2023-03-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5610	25.00	2023-03-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
5611	1500.00	2023-03-09	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5612	25.00	2023-03-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
5613	1000.00	2023-03-09	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5614	25.00	2023-03-06	primaryAccount		OD ITEM FEE -  -	2	55	\N
5615	2000.00	2023-03-06	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5621	6.00	2023-03-31	expensesAccount		Account Service Charge -  -	2	55	\N
5578	881.80	2023-03-13	primaryAccount	110876	CHECK -  - Lourdes Sanchez	2	321	\N
5567	5.00	2023-03-16	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
5599	3750.00	2023-03-07	primaryAccount	5023	CHECK -  -	2	312	\N
5577	25.57	2023-03-13	primaryAccount	110877	CHECK -  -	2	205	\N
5582	1599.99	2023-03-13	primaryAccount	110867	CHECK -  -	2	146	\N
5590	2000.00	2023-03-10	primaryAccount	5029	CHECK -  -	2	243	\N
5579	333.34	2023-03-13	primaryAccount	110875	CHECK -  -	2	257	\N
5580	470.85	2023-03-13	primaryAccount	110874	CHECK -  -	2	269	\N
5583	13.17	2023-03-13	primaryAccount	110866	CHECK -  -	2	233	\N
5581	14.89	2023-03-13	primaryAccount	110868	CHECK -  -	2	297	\N
5602	3605.00	2023-03-07	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5584	618.05	2023-03-13	primaryAccount	110864	CHECK -  -	2	301	\N
5576	745.81	2023-03-13	primaryAccount	110878	CHECK -  -	2	317	\N
5585	13.67	2023-03-13	primaryAccount	110853	CHECK -  -	2	297	\N
5575	478.13	2023-03-13	primaryAccount	110879	CHECK -  -	2	242	\N
5573	18.38	2023-03-14	primaryAccount	110833	CHECK -  -	2	304	\N
5572	22.57	2023-03-14	primaryAccount	110852	CHECK -  -	2	304	\N
5569	1299.41	2023-03-15	primaryAccount	110872	CHECK -  -	2	279	\N
5571	454.27	2023-03-14	primaryAccount	110871	CHECK -  -	2	113	\N
5616	137.57	2023-03-13	cash			2	35	17
5600	600.00	2023-03-07	primaryAccount	201	CHECK -  - Taxes Manuel Briceno	2	320	\N
5617	25.00	2023-03-13	cash			2	91	17
5618	30.00	2023-03-13	cash			2	322	17
5619	150.00	2023-03-19	cash			2	165	17
5620	18.30	2023-03-19	cash			2	33	17
5622	6.00	2023-03-31	expensesAccount		Account Service Charge -  -	2	55	\N
5624	2.00	2023-03-27	expensesAccount		POS Transaction DDA - D/C TRN WM SUPERCENTER # - TULSA OK REF# 51769	2	33	\N
5625	6.00	2023-03-31	primaryAccount		Account Service Charge -  -	2	55	\N
5627	980.13	2023-03-31	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5628	89.05	2023-03-31	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5629	39.99	2023-03-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5630	123.53	2023-03-31	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 89848	2	22	\N
5633	236.55	2023-03-30	primaryAccount		ACH Debit - ACH EFT0330    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5634	500.00	2023-03-30	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - INTERNET CA REF# 1981	2	141	\N
5640	2067.78	2023-03-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5641	376.20	2023-03-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
5651	2238.44	2023-03-27	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5652	648.04	2023-03-27	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5653	152.08	2023-03-27	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5655	3.14	2023-03-27	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 19171	2	189	\N
5660	1146.85	2023-03-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5661	1133.24	2023-03-24	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
5662	55.00	2023-03-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 79649	2	287	\N
5665	229.25	2023-03-23	primaryAccount		ACH Debit - ACH EFT0323    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5666	500.00	2023-03-23	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - INTERNET CA REF# 21710	2	141	\N
5667	4034.10	2023-03-23	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5668	1031.38	2023-03-23	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5669	479.25	2023-03-22	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
5670	565.18	2023-03-22	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 22782	2	24	\N
5671	517.09	2023-03-22	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 22790	2	24	\N
5672	1232.36	2023-03-22	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5676	1721.14	2023-03-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5677	314.38	2023-03-21	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5679	84.00	2023-03-20	primaryAccount		ACH Debit - ACH SGWSOK1    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5681	140.60	2023-03-20	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 49580	2	22	\N
5682	137.73	2023-03-20	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 49610	2	22	\N
5683	44.75	2023-03-20	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 16815	2	284	\N
5678	27.31	2023-03-20	primaryAccount	110870	CHECK -  -	2	319	\N
5684	1000.00	2023-03-20	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5673	435.00	2023-03-21	primaryAccount	5032	CHECK -  -	2	265	\N
5674	2000.00	2023-03-21	primaryAccount	5031	CHECK -  -	2	31	\N
5675	8767.65	2023-03-21	primaryAccount	172	CHECK -  -	2	222	\N
5663	20.15	2023-03-23	primaryAccount	110869	CHECK -  -	2	270	\N
5664	300.00	2023-03-23	primaryAccount	171	CHECK -  -	2	270	\N
5658	22.03	2023-03-24	primaryAccount	110894	CHECK -  -	2	205	\N
5659	40.53	2023-03-24	primaryAccount	110873	CHECK -  -	2	316	\N
5649	1599.99	2023-03-27	primaryAccount	110883	CHECK -  -	2	146	\N
5642	518.71	2023-03-27	primaryAccount	110896	CHECK -  -	2	242	\N
5643	757.28	2023-03-27	primaryAccount	110895	CHECK -  -	2	317	\N
5644	311.63	2023-03-27	primaryAccount	110892	CHECK -  -	2	257	\N
5645	502.43	2023-03-27	primaryAccount	110891	CHECK -  -	2	269	\N
5646	1445.09	2023-03-27	primaryAccount	110889	CHECK -  -	2	279	\N
5647	643.99	2023-03-27	primaryAccount	110888	CHECK -  -	2	113	\N
5648	21.07	2023-03-27	primaryAccount	110885	CHECK -  -	2	297	\N
5650	14.29	2023-03-27	primaryAccount	110882	CHECK -  -	2	233	\N
5656	1000.00	2023-03-27	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5657	3000.00	2023-03-27	primaryAccount		CITYNET TRANSFER- DEBIT - prestamo de cuatro a dos - bandidos	2	100	\N
5639	6373.80	2023-03-28	primaryAccount	176	CHECK -  -	2	222	\N
5638	2500.00	2023-03-28	primaryAccount	177	CHECK -  -	2	31	\N
5637	400.27	2023-03-28	primaryAccount	110880	CHECK -  -	2	301	\N
5636	300.00	2023-03-29	primaryAccount	174	CHECK -  -	2	270	\N
5635	70000.00	2023-03-29	primaryAccount	180	CHECK -  -	2	221	\N
5632	150.00	2023-03-30	primaryAccount	179	CHECK -  -	2	205	\N
5626	1000.00	2023-03-31	primaryAccount	173	CHECK -  -	2	243	\N
5631	1000.00	2023-03-31	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5726	1426.74	2023-04-11	primaryAccount	110905	CHECK -  -	2	279	\N
5687	3848.66	2023-03-20	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5688	6.00	2023-03-31	primaryAccount		Account Service Charge -  -	2	55	\N
5689	10.00	2023-03-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
5690	1.00	2023-03-31	primaryAccount		ATM Service Charge - ATM D/F FACEBK BZQ3QNFJF - 650-5434800 CA REF# 445376	2	169	\N
5691	1.00	2023-03-31	primaryAccount		ATM Service Charge - ATM D/F FACEBK *4HQ3BM3J - fb.me/ads CA REF# 904731	2	169	\N
5692	1.00	2023-03-30	primaryAccount		ATM Service Charge - ATM D/F FACEBK *GACEHQFH - fb.me/ads CA REF# 937453	2	169	\N
5693	1.00	2023-03-29	primaryAccount		ATM Service Charge - ATM D/F FACEBK SBRUPPXHF - 650-5434800 CA REF# 299094	2	169	\N
5694	1.00	2023-03-28	primaryAccount		ATM Service Charge - ATM D/F FACEBK H67ZNPXHF - 650-5434800 CA REF# 413382	2	169	\N
5695	1.00	2023-03-28	primaryAccount		ATM Service Charge - ATM D/F FACEBK *4D7KYNKH - fb.me/ads CA REF# 906971	2	169	\N
5696	25.00	2023-03-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
5697	2000.00	2023-03-28	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5698	1.00	2023-03-27	primaryAccount		ATM Service Charge - ATM D/F FACEBK *VHNWQNKJ - fb.me/ads CA REF# 169400	2	169	\N
5699	1000.00	2023-03-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5700	25.00	2023-03-20	primaryAccount		OD ITEM FEE -  -	2	55	\N
5701	1000.00	2023-03-20	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5685	5000.00	2023-03-20	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5680	510.00	2023-03-20	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 94318	2	23	\N
5713	1.00	2023-04-06	expensesAccount		ATM Service Charge - ATM D/F QT 90 OUTSIDE - TULSA OK REF# 737083	2	189	\N
5715	10.57	2023-04-05	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - BROKEN ARROW OK REF# 16651	2	92	\N
5686	100.00	2023-03-20	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5654	150.00	2023-03-27	primaryAccount		POS Transaction DDA - D/C TRN IN *BEVINCO OF T - 405-7406759 OK REF# 35454	2	323	\N
5702	20.00	2023-03-25	cash			2	235	17
5703	20.00	2023-04-01	cash			2	235	17
5704	20.00	2023-03-04	cash			2	235	17
5705	20.00	2023-03-03	cash			2	235	17
5706	40.00	2023-03-06	cash			2	73	17
5707	20.00	2023-03-10	cash			2	235	17
5708	22.00	2023-03-10	cash			2	205	17
5709	20.00	2023-03-17	cash			2	235	17
5710	20.00	2023-03-18	cash			2	235	17
5711	12.11	2023-04-11	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 23127	2	44	\N
5623	6.51	2023-03-31	expensesAccount		POS Transaction DDA - D/C TRN DOLLAR-GENERAL # - BROKEN ARROW OK REF# 42472	2	92	\N
5714	104.88	2023-04-06	expensesAccount		POS Transaction DDA - D/C TRN SAM'S Club - TULSA OK REF# 605251	2	32	\N
5724	615.63	2023-04-11	primaryAccount	110909	CHECK -  -	2	321	\N
5716	54.04	2023-04-04	expensesAccount		POS Transaction DDA - D/C TRN NAM HAI ORIENTAL - TULSA OK REF# 9473	2	49	\N
5717	53.29	2023-04-03	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 93750	2	44	\N
5718	20.34	2023-04-03	expensesAccount		POS Transaction DDA - D/C TRN QT 31 OUTSIDE - TULSA OK REF# 759179	2	97	\N
5719	11.37	2023-04-03	expensesAccount		POS Transaction DDA - D/C TRN B &amp; B LIQUOR WHS - BROKEN ARROW OK REF# 55254	2	39	\N
5720	1090.53	2023-04-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5721	44.75	2023-04-14	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 67152	2	284	\N
5723	25.00	2023-04-11	primaryAccount	110909	OD ITEM FEE -  -	2	55	\N
5725	25.00	2023-04-11	primaryAccount	110905	OD ITEM FEE -  -	2	55	\N
5712	1.00	2023-04-10	expensesAccount		ATM Service Charge - ATM D/F QT 80 OUTSIDE - BROKEN ARROW OK REF# 674962	2	189	\N
5722	1300.00	2023-04-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5729	2339.09	2023-04-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5730	126.15	2023-04-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
5731	23.10	2023-04-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
5744	2206.04	2023-04-10	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5745	772.51	2023-04-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
5746	119.92	2023-04-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5747	1025.56	2023-04-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5748	476.92	2023-04-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
5749	224.30	2023-04-07	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5750	25.65	2023-04-06	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF MARCH 2023	2	55	\N
5752	236.55	2023-04-06	primaryAccount		ACH Debit - ACH EFT0406    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5753	130.00	2023-04-06	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
5754	183.28	2023-04-06	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 97455	2	17	\N
5758	2537.19	2023-04-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5759	20.00	2023-04-03	primaryAccount		Wire Transfer Fee -  -	2	55	\N
5763	1474.71	2023-04-03	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
5764	332.78	2023-04-03	primaryAccount		ACH Debit - ACH SGWSOK3    Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5765	75.26	2023-04-03	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - INTERNET CA REF# 49637	2	141	\N
5769	3793.00	2023-04-03	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
5770	25.00	2023-04-13	primaryAccount		OD ITEM FEE -  -	2	55	\N
5771	1500.00	2023-04-13	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5773	25.00	2023-04-10	primaryAccount		OD ITEM FEE -  -	2	55	\N
5774	1500.00	2023-04-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5775	25.00	2023-04-07	primaryAccount		OD ITEM FEE -  -	2	55	\N
5777	1500.00	2023-04-06	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5778	25.00	2023-04-05	primaryAccount		OD ITEM FEE -  -	2	55	\N
5779	1500.00	2023-04-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5780	1000.00	2023-04-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5781	1000.00	2023-04-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5767	2050.00	2023-04-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5760	692.73	2023-04-03	primaryAccount	110893	CHECK -  -	2	321	\N
5762	180.29	2023-04-03	primaryAccount	181	CHECK -  -	2	103	\N
5761	22.13	2023-04-03	primaryAccount	110884	CHECK -  -	2	304	\N
5757	1300.00	2023-04-05	primaryAccount	182	CHECK -  -	2	216	\N
5751	465.00	2023-04-06	primaryAccount	178	CHECK -  -	2	91	\N
5740	1599.98	2023-04-10	primaryAccount	110899	CHECK -  -	2	146	\N
5734	440.03	2023-04-10	primaryAccount	110912	CHECK -  -	2	242	\N
5735	917.53	2023-04-10	primaryAccount	110911	CHECK -  -	2	317	\N
5736	27.82	2023-04-10	primaryAccount	110910	CHECK -  -	2	205	\N
5737	371.69	2023-04-10	primaryAccount	110908	CHECK -  -	2	257	\N
5738	521.08	2023-04-10	primaryAccount	110907	CHECK -  -	2	269	\N
5739	38.77	2023-04-10	primaryAccount	110906	CHECK -  -	2	316	\N
5741	352.52	2023-04-10	primaryAccount	110897	CHECK -  -	2	271	\N
5742	31.25	2023-04-10	primaryAccount	110890	CHECK -  -	2	316	\N
5743	377.15	2023-04-10	primaryAccount	110881	CHECK -  -	2	271	\N
5785	11.00	2023-04-28	expensesAccount		Account Service Charge -  -	2	55	\N
5727	531.39	2023-04-11	primaryAccount	110904	CHECK -  -	2	113	\N
5728	2728.00	2023-04-11	primaryAccount	5026	CHECK -  -	2	30	\N
5772	290.00	2023-04-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5776	240.00	2023-04-07	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
5732	150.00	2023-04-11	primaryAccount		POS Transaction DDA - D/C TRN IN *BEVINCO OF T - 405-7406759 OK REF# 45781	2	323	\N
5768	1100.00	2023-04-03	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5766	2500.00	2023-04-03	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5756	2520.00	2023-04-06	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5733	1800.00	2023-04-11	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5755	1000.00	2023-04-06	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5782	10.00	2023-04-03	cash			2	162	17
5783	20.00	2023-04-08	cash			2	235	17
5784	20.00	2023-04-15	cash			2	235	17
5786	6.00	2023-04-28	expensesAccount		Account Service Charge -  -	2	55	\N
5787	89.38	2023-04-24	expensesAccount		POS Transaction DDA - D/C TRN SAMS CLUB #6342 - TULSA OK REF# 5267	2	32	\N
5788	54.83	2023-04-19	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - TULSA OK REF# 83835	2	44	\N
5789	35.13	2023-04-19	expensesAccount		POS Transaction DDA - D/C TRN SUPERMERCADOS MO - BROKEN ARROW OK REF# 22351	2	44	\N
5790	6.00	2023-04-28	primaryAccount		Account Service Charge -  -	2	55	\N
5791	1338.75	2023-04-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5792	376.20	2023-04-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
5793	89.05	2023-04-28	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5794	84.36	2023-04-28	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 60419	2	22	\N
5795	38.90	2023-04-28	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 60471	2	22	\N
5799	232.30	2023-04-27	primaryAccount		ACH Debit - ACH EFT0427    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5804	2596.89	2023-04-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5805	260.00	2023-04-25	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 48774	2	23	\N
5816	2143.68	2023-04-24	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5817	967.65	2023-04-24	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
5818	281.30	2023-04-24	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5820	55.00	2023-04-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 34993	2	287	\N
5821	15.99	2023-04-24	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 45643	2	189	\N
5824	1067.43	2023-04-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5825	89.05	2023-04-21	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5828	4442.33	2023-04-21	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5829	1443.56	2023-04-21	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5832	551.74	2023-04-19	primaryAccount		ACH Debit - ACH SGWS041423 Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5833	479.25	2023-04-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
5834	537.86	2023-04-19	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 80833	2	24	\N
5835	517.09	2023-04-19	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 80841	2	24	\N
5836	2887.49	2023-04-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6325	6.79	2023-06-16	cash			2	98	17
5844	400.00	2023-04-17	primaryAccount	5027	CHECK -  -	2	270	\N
5843	8.18	2023-04-17	primaryAccount	110886	CHECK -  -	2	270	\N
5842	9.53	2023-04-17	primaryAccount	110898	CHECK -  -	2	233	\N
5841	25.78	2023-04-17	primaryAccount	110902	CHECK -  -	2	270	\N
5838	6500.00	2023-04-18	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5830	15000.00	2023-04-19	primaryAccount	1024	CHECK -  -	2	100	\N
5831	35000.00	2023-04-19	primaryAccount	1021	CHECK -  -	2	221	\N
5822	903.40	2023-04-21	primaryAccount	110927	CHECK -  -	2	317	\N
5823	494.22	2023-04-21	primaryAccount	110923	CHECK -  -	2	269	\N
5826	201.09	2023-04-21	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 273664	2	100	\N
5807	508.24	2023-04-24	primaryAccount	110928	CHECK -  -	2	242	\N
5808	12.20	2023-04-24	primaryAccount	110926	CHECK -  -	2	205	\N
5809	345.21	2023-04-24	primaryAccount	110924	CHECK -  -	2	257	\N
5810	1411.18	2023-04-24	primaryAccount	110921	CHECK -  -	2	279	\N
5811	6.09	2023-04-24	primaryAccount	110917	CHECK -  -	2	297	\N
5812	1599.98	2023-04-24	primaryAccount	110915	CHECK -  -	2	146	\N
5813	2.22	2023-04-24	primaryAccount	110901	CHECK -  -	2	297	\N
5814	150.00	2023-04-24	primaryAccount	185	CHECK -  -	2	234	\N
5815	300.00	2023-04-24	primaryAccount	183	CHECK -  -	2	205	\N
5806	1000.00	2023-04-25	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5803	787.43	2023-04-25	primaryAccount	110925	CHECK -  -	2	321	\N
5802	2500.00	2023-04-26	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5801	228.01	2023-04-26	primaryAccount	110913	CHECK -  -	2	271	\N
5800	562.81	2023-04-26	primaryAccount	110920	CHECK -  -	2	113	\N
5798	1460.00	2023-04-27	primaryAccount	175	CHECK -  -	2	146	\N
5797	200.00	2023-04-28	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5796	1000.00	2023-04-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5827	1000.00	2023-04-21	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5840	200.00	2023-04-18	primaryAccount	from ba to expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5839	900.00	2023-04-18	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5837	5.00	2023-04-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
5846	190.72	2023-04-17	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
5847	89.05	2023-04-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5848	168.72	2023-04-17	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 30235	2	22	\N
5849	67.11	2023-04-17	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 30261	2	22	\N
5851	2964.75	2023-04-17	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
5852	6.00	2023-04-28	primaryAccount		Account Service Charge -  -	2	55	\N
5853	25.00	2023-04-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
5854	1500.00	2023-04-28	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5855	25.00	2023-04-25	primaryAccount		OD ITEM FEE -  -	2	55	\N
5856	1500.00	2023-04-25	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5857	25.00	2023-04-19	primaryAccount		OD ITEM FEE -  -	2	55	\N
5858	1500.00	2023-04-19	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5894	26.72	2023-05-05	primaryAccount	110922	CHECK -  -	2	316	\N
5895	12000.00	2023-05-05	primaryAccount	5026	CHECK -  -	2	100	\N
5819	150.00	2023-04-24	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 6562	2	144	\N
5859	20.00	2023-04-22	cash			2	235	17
5860	2469.06	2023-05-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5861	152.08	2023-05-12	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5862	1264.40	2023-05-12	primaryAccount		POS Transaction DDA - D/C TRN IN *CREATIVE DEV - 561-3105774 FL REF# 95765	2	105	\N
5865	236.55	2023-05-11	primaryAccount		ACH Debit - ACH EFT05111   LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5866	23.10	2023-05-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
5868	1153.24	2023-05-10	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
5869	898.14	2023-05-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
5870	149.55	2023-05-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
5850	1000.00	2023-04-17	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5873	2583.31	2023-05-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5845	330.00	2023-04-17	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 2957412	2	131	\N
5877	17.10	2023-05-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF APRIL 2023	2	55	\N
5896	450.00	2023-05-05	primaryAccount	2007	CHECK -  -	2	205	\N
5887	2240.60	2023-05-08	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5888	464.42	2023-05-08	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
5889	436.60	2023-05-08	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5890	140.00	2023-05-08	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
5893	200.00	2023-05-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5878	525.40	2023-05-08	primaryAccount	110945	CHECK -  -	2	242	\N
5879	1069.76	2023-05-08	primaryAccount	110944	CHECK -  -	2	317	\N
5880	653.41	2023-05-08	primaryAccount	110942	CHECK -  -	2	321	\N
5881	258.20	2023-05-08	primaryAccount	110941	CHECK -  -	2	257	\N
5882	388.86	2023-05-08	primaryAccount	110940	CHECK -  -	2	269	\N
5883	1425.55	2023-05-08	primaryAccount	110938	CHECK -  -	2	279	\N
5884	634.69	2023-05-08	primaryAccount	110937	CHECK -  -	2	113	\N
5885	1599.98	2023-05-08	primaryAccount	110931	CHECK -  -	2	146	\N
5886	300.00	2023-05-08	primaryAccount	2006	CHECK -  -	2	234	\N
5891	1000.00	2023-05-08	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5892	300.00	2023-05-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5876	500.00	2023-05-09	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5874	3000.00	2023-05-09	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5872	13.68	2023-05-09	primaryAccount	110887	CHECK -  -	2	319	\N
5871	7.57	2023-05-09	primaryAccount	110903	CHECK -  -	2	319	\N
5864	4500.00	2023-05-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5863	1000.00	2023-05-12	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5875	1000.00	2023-05-09	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5867	2850.00	2023-05-11	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5897	2427.63	2023-05-05	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5898	150.00	2023-05-05	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 58626	2	144	\N
5901	232.30	2023-05-04	primaryAccount		ACH Debit - ACH EFT0504    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5902	89.05	2023-05-04	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5909	2204.12	2023-05-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5910	1586.40	2023-05-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
5911	39.99	2023-05-02	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5914	20.00	2023-05-01	primaryAccount		Wire Transfer Fee -  -	2	55	\N
5916	450.59	2023-05-01	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5917	167.27	2023-05-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN GOOGLE *ADS99438 - cc@google.com CA REF# 95405	2	141	\N
5922	3793.00	2023-05-01	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
5923	1900.00	2023-05-11	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5924	25.00	2023-05-10	primaryAccount		OD ITEM FEE -  -	2	55	\N
5925	1500.00	2023-05-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5926	25.00	2023-05-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
5927	1500.00	2023-05-08	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
5928	10.00	2023-05-01	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
5921	120.00	2023-05-01	primaryAccount	from ba to expenses bixby	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5919	2200.00	2023-05-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5950	650.00	2023-05-31	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5918	1000.00	2023-05-01	primaryAccount		COUNTER WITHDRAWAL -  -	2	103	\N
5949	1050.00	2023-05-31	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
5904	75000.00	2023-05-03	primaryAccount	5025	CHECK PAID- FORCE PAY -  -	2	100	\N
5929	11.00	2023-05-31	expensesAccount		Account Service Charge -  -	2	55	\N
5930	6.00	2023-05-31	expensesAccount		Account Service Charge -  -	2	55	\N
5915	129.60	2023-05-01	primaryAccount	1022	CHECK -  -	2	103	\N
5920	950.00	2023-05-01	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5905	14.14	2023-05-02	primaryAccount	110916	CHECK -  -	2	304	\N
5899	13.55	2023-05-04	primaryAccount	110918	CHECK -  -	2	270	\N
5908	205.12	2023-05-02	primaryAccount	110	CHECK -  -	2	106	\N
5934	1646.91	2023-06-02	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5935	1642.45	2023-06-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
5906	3.50	2023-05-02	primaryAccount	110900	CHECK -  -	2	304	\N
5936	89.05	2023-06-02	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5912	2500.00	2023-05-02	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5900	400.00	2023-05-04	primaryAccount	184	CHECK -  -	2	270	\N
5903	39.80	2023-05-03	primaryAccount	109	CHECK -  -	2	261	\N
5938	20.00	2023-06-01	primaryAccount		Wire Transfer Fee -  -	2	55	\N
5939	20.00	2023-06-01	primaryAccount		Wire Transfer Fee -  -	2	55	\N
5940	580.00	2023-06-01	primaryAccount		POS Transaction DDA - D/C TRN BROKEN ARROW UTI - 918-259-2400 OK REF# 34740	2	158	\N
5941	437.77	2023-06-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 76585	2	141	\N
5942	9.09	2023-06-01	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 96296	2	189	\N
5907	679.24	2023-05-02	primaryAccount	1023	CHECK -  - DBC	2	325	\N
5943	6.09	2023-06-01	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 30357	2	189	\N
5913	200.00	2023-05-02	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5944	3793.00	2023-06-01	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
5946	1734.96	2023-05-31	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5947	39.99	2023-05-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
5948	3.00	2023-05-31	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 53218	2	189	\N
5932	137.96	2023-06-02	primaryAccount	110975	CHECK -  -	2	269	\N
5931	437.97	2023-06-02	primaryAccount	110976	CHECK -  -	2	257	\N
5933	450.00	2023-06-02	primaryAccount	1023	CHECK -  -	2	205	\N
5937	1090.00	2023-06-02	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5945	650.00	2023-06-01	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - TULSA BITE MARKETING	2	169	\N
5954	376.20	2023-05-30	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
5955	164.24	2023-05-30	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5956	11.60	2023-05-30	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 73609	2	189	\N
5960	1362.87	2023-05-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5961	328.82	2023-05-26	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
5964	468.85	2023-05-25	primaryAccount		ACH Debit - ACH EFT0525    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
5965	112.48	2023-05-25	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 50985	2	22	\N
5966	67.11	2023-05-25	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 51015	2	22	\N
5968	3939.64	2023-05-25	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5970	55.00	2023-05-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 46367	2	287	\N
5974	1876.41	2023-05-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5975	63.75	2023-05-23	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 11140	2	284	\N
5976	44.98	2023-05-23	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 70687	2	189	\N
5985	1201.47	2023-05-22	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
5986	480.50	2023-05-22	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
5987	343.25	2023-05-22	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
5988	15.90	2023-05-22	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 62551	2	189	\N
5989	9.13	2023-05-22	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 50217	2	189	\N
5990	3.00	2023-05-22	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 23640	2	189	\N
5992	1514.25	2023-05-22	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5993	1419.50	2023-05-22	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
5996	2424.71	2023-05-19	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
5997	926.90	2023-05-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
5998	89.05	2023-05-19	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6000	80.00	2023-05-18	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 1564045	2	131	\N
6009	1536.08	2023-05-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6003	15.95	2023-05-17	primaryAccount	110943	CHECK -  -	2	205	\N
5995	150.00	2023-05-19	primaryAccount	187	CHECK -  -	2	180	\N
5999	1000.00	2023-05-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
5994	489.09	2023-05-19	primaryAccount	110956	CHECK -  -	2	269	\N
5984	11.51	2023-05-22	primaryAccount	110934	CHECK -  -	2	297	\N
5977	363.55	2023-05-22	primaryAccount	110961	CHECK -  -	2	242	\N
5978	1083.53	2023-05-22	primaryAccount	110960	CHECK -  -	2	317	\N
5979	15.62	2023-05-22	primaryAccount	110959	CHECK -  -	2	205	\N
5980	361.72	2023-05-22	primaryAccount	110957	CHECK -  -	2	257	\N
5981	1441.98	2023-05-22	primaryAccount	110953	CHECK -  -	2	279	\N
5983	1599.99	2023-05-22	primaryAccount	110948	CHECK -  -	2	146	\N
5973	553.90	2023-05-23	primaryAccount	110952	CHECK -  -	2	113	\N
5971	687.58	2023-05-23	primaryAccount	110958	CHECK -  -	2	321	\N
5969	376.58	2023-05-24	primaryAccount	110946	CHECK -  -	2	271	\N
5962	23.25	2023-05-25	primaryAccount	110951	CHECK -  -	2	270	\N
5963	400.00	2023-05-25	primaryAccount	1021	CHECK -  -	2	270	\N
5957	7.83	2023-05-26	primaryAccount	110947	CHECK -  -	2	233	\N
5959	6.58	2023-05-26	primaryAccount	110914	CHECK -  -	2	233	\N
5958	10.58	2023-05-26	primaryAccount	110930	CHECK -  -	2	233	\N
5953	6000.00	2023-05-30	primaryAccount	1025	CHECK -  -	2	104	\N
5972	362.58	2023-05-23	primaryAccount	110955	CHECK -  - Luis Rodriguez	2	326	\N
6004	510.02	2023-05-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6006	525.24	2023-05-17	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 46718	2	24	\N
6007	517.09	2023-05-17	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 46700	2	24	\N
6005	5.00	2023-05-17	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
6002	2903.00	2023-05-18	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
5991	3750.00	2023-05-22	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6001	1000.00	2023-05-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
5967	1000.00	2023-05-25	primaryAccount	entraron 800	COUNTER WITHDRAWAL -  -	2	62	\N
6010	190.72	2023-05-16	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6011	2989.58	2023-05-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6015	524.70	2023-05-15	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6017	102.42	2023-05-15	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 10817	2	22	\N
6021	25.00	2023-06-01	primaryAccount		OD ITEM FEE -  -	2	55	\N
6022	1500.00	2023-06-01	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6023	6.00	2023-05-31	primaryAccount		Account Service Charge -  -	2	55	\N
6024	10.00	2023-05-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6025	25.00	2023-05-26	primaryAccount		OD ITEM FEE -  -	2	55	\N
6026	1500.00	2023-05-26	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6027	1500.00	2023-05-22	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6028	25.00	2023-05-19	primaryAccount		OD ITEM FEE -  -	2	55	\N
6029	2200.00	2023-05-19	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6030	1500.00	2023-05-18	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6031	25.00	2023-05-16	primaryAccount		OD ITEM FEE -  -	2	55	\N
6032	1500.00	2023-05-16	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6033	25.00	2023-05-16	primaryAccount		OD ITEM FEE -  -	2	55	\N
6018	32.50	2023-05-15	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*4C8 - Amzn.com/bill WA REF# 75198	2	112	\N
6012	25.93	2023-05-15	primaryAccount	110935	CHECK -  -	2	270	\N
6034	105.00	2023-05-16	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
5951	250.00	2023-05-31	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6014	4400.00	2023-05-15	primaryAccount	186	CHECK -  -	2	189	\N
6035	38.15	2023-05-15	cash			2	44	17
6013	300.00	2023-05-15	primaryAccount	2005	CHECK -  -	2	270	\N
6036	8.17	2023-05-17	cash			2	33	17
6037	300.00	2023-05-30	cash			2	146	17
6038	20.00	2023-04-28	cash			2	235	17
6039	20.00	2023-04-29	cash			2	235	17
6040	140.00	2023-04-30	cash			2	254	17
6041	18.00	2023-04-30	cash			2	297	17
6008	2092.00	2023-05-16	primaryAccount	5005	CHECK -  -	2	30	\N
6016	122.00	2023-05-15	primaryAccount		POS Transaction DDA - D/C TRN Amazon.com*IW2MT - Amzn.com/bill WA REF# 26330	2	112	\N
6042	96.00	2023-05-01	cash	sr jose?		2	183	17
6043	13.41	2023-05-01	cash			2	44	17
6044	46.00	2023-05-02	cash			2	49	17
6045	100.00	2023-05-05	cash			2	254	17
5982	8.00	2023-05-22	primaryAccount	110950	CHECK -  -	2	297	\N
6046	20.00	2023-05-05	cash			2	235	17
5952	68.66	2023-05-30	primaryAccount	110954	CHECK -  -	2	316	\N
6047	6.00	2023-05-05	cash			2	44	17
6019	6005.00	2023-05-15	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6048	36.94	2023-05-06	cash			2	44	17
6049	20.00	2023-05-06	cash			2	277	17
6050	20.00	2023-05-06	cash			2	235	17
6051	102.00	2023-05-08	cash			2	32	17
6020	1000.00	2023-05-15	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6053	34.89	2023-05-13	cash			2	44	17
6054	31.43	2023-05-13	cash			2	39	17
6055	20.00	2023-05-13	cash			2	235	17
6056	42.48	2023-05-14	cash			2	44	17
6057	20.00	2023-05-14	cash			2	235	17
6061	1059.42	2023-06-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6069	46.23	2023-06-14	primaryAccount	110939	CHECK -  -	2	316	\N
6065	2989.58	2023-06-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6067	193.43	2023-06-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6068	120.72	2023-06-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6070	30.60	2023-06-13	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF MAY 2023	2	55	\N
6071	2635.78	2023-06-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6066	400.00	2023-06-15	primaryAccount	5002	CHECK -  -	2	146	\N
6059	269.63	2023-06-16	primaryAccount	110993	CHECK -  -	2	269	\N
6060	750.00	2023-06-16	primaryAccount	202	CHECK -  -	2	205	\N
6062	5.00	2023-06-16	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	100	\N
6064	1000.00	2023-06-16	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6058	425.43	2023-06-16	primaryAccount	110994	CHECK -  -	2	257	\N
6063	143.43	2023-06-16	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*W38 - Amzn.com/bill WA REF# 61643	2	112	\N
6072	23.10	2023-06-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6075	739.20	2023-06-12	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6076	149.15	2023-06-12	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6077	130.63	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 1389	2	22	\N
6078	63.75	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 72239	2	284	\N
6079	24.96	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 73363	2	189	\N
6080	23.64	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 65123	2	189	\N
6081	22.96	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 3539	2	189	\N
6082	14.99	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 4734	2	189	\N
6083	14.97	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 45331	2	189	\N
6084	12.91	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 18825	2	189	\N
6085	10.98	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 31169	2	189	\N
6086	4.59	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 44681	2	189	\N
6087	4.50	2023-06-12	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 82541	2	189	\N
6091	1276.71	2023-06-09	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6092	152.08	2023-06-09	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6093	80.00	2023-06-09	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 7389026	2	131	\N
6094	13.00	2023-06-09	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 82952	2	189	\N
6096	959.46	2023-06-08	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6097	240.00	2023-06-08	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 4603	2	23	\N
6098	12.95	2023-06-08	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 73113	2	189	\N
6103	292.82	2023-06-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6106	2267.35	2023-06-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6108	147.00	2023-06-06	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6110	57.27	2023-06-06	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 4226	2	17	\N
6126	2254.11	2023-06-05	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6127	374.60	2023-06-05	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6128	150.00	2023-06-05	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 23552	2	144	\N
6124	300.00	2023-06-05	primaryAccount	1024	CHECK -  -	2	234	\N
6125	400.00	2023-06-05	primaryAccount	1022	CHECK -  -	2	270	\N
6130	650.00	2023-06-05	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	100	\N
6113	463.22	2023-06-05	primaryAccount	110980	CHECK -  -	2	242	\N
6114	971.17	2023-06-05	primaryAccount	110979	CHECK -  -	2	317	\N
6115	24.03	2023-06-05	primaryAccount	110978	CHECK -  -	2	205	\N
6116	88.37	2023-06-05	primaryAccount	110973	CHECK -  -	2	316	\N
6117	1462.56	2023-06-05	primaryAccount	110972	CHECK -  -	2	279	\N
6118	26.91	2023-06-05	primaryAccount	110970	CHECK -  -	2	319	\N
6119	15.98	2023-06-05	primaryAccount	110969	CHECK -  -	2	270	\N
6120	17.42	2023-06-05	primaryAccount	110968	CHECK -  -	2	297	\N
6111	2000.00	2023-06-06	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6109	1430.00	2023-06-06	primaryAccount		POS Transaction DDA - D/C TRN OKLAHOMA ABLE CO - 405-521-3484 OK REF# 142	2	100	\N
6112	723.15	2023-06-06	primaryAccount	1027	CHECK PAID- FORCE PAY -  - NO PICTURE	2	100	\N
6104	528.10	2023-06-06	primaryAccount	110971	CHECK -  -	2	113	\N
6105	8.14	2023-06-06	primaryAccount	110933	CHECK -  -	2	304	\N
6107	276.63	2023-06-06	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	100	\N
6101	6.72	2023-06-07	primaryAccount	110966	CHECK -  -	2	304	\N
6102	250.00	2023-06-07	primaryAccount	5007	CHECK -  -	2	205	\N
6100	250.00	2023-06-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6099	700.00	2023-06-08	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6095	2500.00	2023-06-09	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6090	394.71	2023-06-09	primaryAccount	110962	CHECK -  -	2	271	\N
6073	692.93	2023-06-12	primaryAccount	110977	CHECK -  -	2	321	\N
6074	362.08	2023-06-12	primaryAccount	110974	CHECK -  -	2	326	\N
6089	500.00	2023-06-12	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6129	1000.00	2023-06-05	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6131	25.00	2023-06-16	primaryAccount		OD ITEM FEE -  -	2	55	\N
6132	1300.00	2023-06-16	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6134	1500.00	2023-06-12	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6135	25.00	2023-06-09	primaryAccount		OD ITEM FEE -  -	2	55	\N
6136	2000.00	2023-06-09	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6137	25.00	2023-06-06	primaryAccount		OD ITEM FEE -  -	2	55	\N
6138	1500.00	2023-06-06	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6139	25.00	2023-06-05	primaryAccount		OD ITEM FEE -  -	2	55	\N
6140	1500.00	2023-06-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6172	644.50	2023-07-03	primaryAccount	111003	CHECK -  -	2	328	\N
6133	104.00	2023-06-16	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6122	1599.98	2023-06-05	primaryAccount	110965	CHECK -  -	2	146	\N
6171	194.65	2023-07-03	primaryAccount	111004	CHECK -  -	2	270	\N
6167	48.02	2023-07-03	primaryAccount	111008	CHECK -  -	2	316	\N
6088	2500.00	2023-06-12	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6141	6.00	2023-06-30	expensesAccount		Account Service Charge -  -	2	55	\N
6142	6.00	2023-06-30	expensesAccount		Account Service Charge -  -	2	55	\N
6145	602.39	2023-07-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6146	240.39	2023-07-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6147	161.00	2023-07-07	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6148	89.05	2023-07-07	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6152	204.03	2023-07-06	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 61731	2	22	\N
6153	158.84	2023-07-06	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 61803	2	22	\N
6154	57.66	2023-07-06	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 46362	2	17	\N
6123	264.12	2023-06-05	primaryAccount	110963	CHECK -  - David Blanco	2	327	\N
6121	714.56	2023-06-05	primaryAccount	110967	CHECK -  - Alexis Mantilla	2	328	\N
6159	2660.37	2023-07-05	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6160	2817.00	2023-07-05	primaryAccount		POS Transaction DDA - D/C TRN TORTILLERIA MILA - TULSA OK REF# 30343	2	30	\N
6163	20.00	2023-07-03	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6170	11.57	2023-07-03	primaryAccount	111005	CHECK -  -	2	319	\N
6164	20.00	2023-07-03	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6175	2502.86	2023-07-03	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6176	2226.27	2023-07-03	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
6177	1630.70	2023-07-03	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
6178	671.53	2023-07-03	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6169	566.56	2023-07-03	primaryAccount	111006	CHECK -  -	2	113	\N
6166	414.12	2023-07-03	primaryAccount	111015	CHECK -  -	2	242	\N
6168	1470.53	2023-07-03	primaryAccount	111007	CHECK -  -	2	279	\N
6173	46.35	2023-07-03	primaryAccount	110991	CHECK -  -	2	316	\N
6165	1599.98	2023-07-03	primaryAccount	4101064583	CHECK -  -	2	146	\N
6174	10.91	2023-07-03	primaryAccount	110988	CHECK -  -	2	319	\N
6157	347.01	2023-07-05	primaryAccount	111009	CHECK -  -	2	326	\N
6326	20.00	2023-06-16	cash			2	188	17
6158	2200.00	2023-07-05	primaryAccount	2002	CHECK -  - STONEMEN GRANITE	2	329	\N
6150	99.85	2023-07-06	primaryAccount	111002	CHECK -  -	2	304	\N
6156	1011.44	2023-07-05	primaryAccount	111014	CHECK -  -	2	317	\N
6162	500.00	2023-07-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6155	1000.00	2023-07-06	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6144	415.00	2023-07-07	primaryAccount	2001	CHECK -  -	2	234	\N
6161	1500.00	2023-07-05	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6329	4.00	2023-06-18	cash	refund		2	188	17
6151	270.08	2023-07-06	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	100	\N
6149	2000.00	2023-07-07	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6143	45.00	2023-07-09	primaryAccount		Funds Transfer via Mobile	2	100	\N
6332	20.00	2023-06-24	cash			2	188	17
6335	20.00	2023-07-01	cash			2	188	17
6337	20.00	2023-07-07	cash			2	188	17
6826	17.88	2023-10-21	cash			2	44	17
6179	39.99	2023-07-03	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
6180	166.05	2023-07-03	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE *ADS99438 - 650-2530000 CA REF# 43094	2	141	\N
6181	15.39	2023-07-03	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 8244	2	189	\N
6182	3.00	2023-07-03	primaryAccount		POS Transaction DDA - D/C TRN UBER   TRIP - HELP.UBER.COM CA REF# 34043	2	189	\N
6185	3793.00	2023-07-03	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
6191	1845.21	2023-06-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6192	89.05	2023-06-30	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6193	150.00	2023-06-30	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 5858	2	144	\N
6194	290.10	2023-06-29	primaryAccount		ACH Debit - ACH EFT0629    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6196	376.19	2023-06-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
6200	2514.11	2023-06-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6201	281.30	2023-06-27	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6202	81.25	2023-06-27	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*9D3 - Amzn.com/bill WA REF# 95594	2	112	\N
6207	150.00	2023-06-26	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 78091	2	144	\N
6209	55.00	2023-06-26	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 21791	2	287	\N
6210	1587.79	2023-06-23	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6211	224.30	2023-06-22	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6216	1974.63	2023-06-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6217	500.00	2023-06-21	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - CC GOOGLE.COM CA REF# 2105	2	141	\N
6226	2302.55	2023-06-20	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6227	478.46	2023-06-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6228	329.01	2023-06-20	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6229	89.05	2023-06-20	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6230	551.61	2023-06-20	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 42550	2	24	\N
6231	517.09	2023-06-20	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 42543	2	24	\N
6233	1500.00	2023-07-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6234	1500.00	2023-07-03	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6235	6.00	2023-06-30	primaryAccount		Account Service Charge -  -	2	55	\N
6236	10.00	2023-06-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6237	25.00	2023-06-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
6238	1500.00	2023-06-28	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6225	300.00	2023-06-20	primaryAccount	203	CHECK -  - SIN FOTO	2	100	\N
6224	1599.98	2023-06-20	primaryAccount	110984	CHECK -  -	2	146	\N
6222	559.66	2023-06-20	primaryAccount	110989	CHECK -  -	2	113	\N
6221	1447.01	2023-06-20	primaryAccount	110990	CHECK -  -	2	279	\N
6220	14.38	2023-06-20	primaryAccount	110996	CHECK -  - SIN FOTO	2	100	\N
6219	997.50	2023-06-20	primaryAccount	110997	CHECK -  - SIN FOTO	2	100	\N
6213	389.91	2023-06-21	primaryAccount	110992	CHECK -  -	2	326	\N
6215	115.50	2023-06-21	primaryAccount	204	CHECK -  - SIN FOTO	2	100	\N
6214	542.79	2023-06-21	primaryAccount	110982	CHECK -  - SIN FOTO	2	100	\N
6212	634.96	2023-06-21	primaryAccount	110995	CHECK -  -	2	321	\N
6204	137.90	2023-06-26	primaryAccount	5003	CHECK -  -	2	103	\N
6206	400.00	2023-06-26	primaryAccount	2004	CHECK -  - SIN FOTO	2	100	\N
6205	397.23	2023-06-26	primaryAccount	2008	CHECK -  - SIN FOTO	2	100	\N
6203	17.76	2023-06-26	primaryAccount	110987	CHECK -  -	2	229	\N
6197	3005.00	2023-06-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6199	20.81	2023-06-28	primaryAccount		RIGHT OF SET-OFF DEBIT -  -	2	100	\N
6195	1000.00	2023-06-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6188	303.21	2023-06-30	primaryAccount	111011	CHECK -  -	2	257	\N
6187	698.46	2023-06-30	primaryAccount	111013	CHECK -  -	2	205	\N
6189	485.26	2023-06-30	primaryAccount	111010	CHECK -  -	2	269	\N
6190	4000.00	2023-06-30	primaryAccount	1028	CHECK -  -	2	31	\N
6184	150.00	2023-07-03	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6186	650.00	2023-07-03	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6232	1000.00	2023-06-20	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6198	1000.00	2023-06-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6183	3200.00	2023-07-03	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6239	1500.00	2023-06-26	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6249	490.00	2023-07-19	primaryAccount	1002	CHECK -  -	2	234	\N
6218	425.96	2023-06-20	primaryAccount	110998	CHECK -  -	2	242	\N
6223	573.10	2023-06-20	primaryAccount	110986	CHECK -  -	2	328	\N
6256	205.55	2023-07-18	primaryAccount	111031	CHECK -  -	2	317	\N
6260	2000.00	2023-07-18	primaryAccount	solo 1000 de 2000	COUNTER WITHDRAWAL -  -	2	62	\N
6243	714.88	2023-07-20	primaryAccount	111030	CHECK -  -	2	205	\N
6251	5.00	2023-07-19	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	189	\N
6240	84.90	2023-06-07	cash			2	32	17
6241	43.20	2023-07-21	primaryAccount	111025	CHECK -  -	2	316	\N
6258	249.81	2023-07-18	primaryAccount	111016	CHECK -  -	2	327	\N
6208	113.31	2023-06-26	primaryAccount		POS Transaction DDA - D/C TRN FSI*PSO BILLMATR - 888-333-4026 OH REF# 50311	2	100	\N
6242	516.03	2023-07-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6245	480.50	2023-07-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6246	4474.91	2023-07-20	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
6247	834.38	2023-07-20	primaryAccount		CHECK PAID- FORCE PAY - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
6250	34.78	2023-07-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6252	95.32	2023-07-19	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 12061	2	22	\N
6253	18.42	2023-07-19	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*305 - Amzn.com/bill WA REF# 47052	2	112	\N
6259	2019.33	2023-07-18	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6257	320.84	2023-07-18	primaryAccount	111026	CHECK -  -	2	326	\N
6255	1500.00	2023-07-19	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6248	574.67	2023-07-19	primaryAccount	111023	CHECK -  -	2	113	\N
6244	44.23	2023-07-20	primaryAccount	111020	CHECK -  - taylor mcadoo	2	330	\N
6254	3000.00	2023-07-19	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6261	2500.00	2023-07-18	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6268	2317.30	2023-07-17	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6269	831.16	2023-07-17	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6270	198.90	2023-07-17	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6271	150.00	2023-07-17	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 98051	2	144	\N
6272	2989.58	2023-07-17	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6275	838.17	2023-07-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6276	89.05	2023-07-14	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6277	63.75	2023-07-14	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 46046	2	284	\N
6280	367.95	2023-07-13	primaryAccount		ACH Debit - ACH EFT0713    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6282	29.70	2023-07-12	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JUNE 2023	2	55	\N
6283	152.30	2023-07-12	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6284	531.42	2023-07-12	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 82173	2	24	\N
6285	517.09	2023-07-12	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 82165	2	24	\N
6287	2533.59	2023-07-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6288	23.10	2023-07-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6293	1398.32	2023-07-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6294	1320.99	2023-07-10	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
6295	470.67	2023-07-10	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6298	1284.03	2023-07-20	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6299	25.00	2023-07-18	primaryAccount		OD ITEM FEE -  -	2	55	\N
6300	1763.70	2023-07-18	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6301	25.00	2023-07-17	primaryAccount		OD ITEM FEE -  -	2	55	\N
6302	112.00	2023-07-17	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6303	25.00	2023-07-13	primaryAccount		OD ITEM FEE -  -	2	55	\N
6304	1500.00	2023-07-13	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6305	25.00	2023-07-11	primaryAccount		OD ITEM FEE -  -	2	55	\N
6306	2000.00	2023-07-11	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6307	25.00	2023-07-10	primaryAccount		OD ITEM FEE -  -	2	55	\N
6308	1500.00	2023-07-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6290	2300.00	2023-07-11	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6291	597.93	2023-07-10	primaryAccount	111012	CHECK -  -	2	321	\N
6310	20.00	2023-07-15	cash			2	188	17
6292	550.77	2023-07-10	primaryAccount	110999	CHECK -  -	2	327	\N
6289	4500.00	2023-07-11	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6309	20.00	2023-07-14	cash			2	188	17
6262	406.43	2023-07-17	primaryAccount	111032	CHECK -  -	2	242	\N
6264	8.70	2023-07-17	primaryAccount	111022	CHECK -  -	2	319	\N
6286	3020.00	2023-07-12	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6274	482.38	2023-07-14	primaryAccount	111027	CHECK -  -	2	269	\N
6296	3000.00	2023-07-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6273	336.44	2023-07-14	primaryAccount	111028	CHECK -  -	2	257	\N
6281	1000.00	2023-07-13	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6263	1445.68	2023-07-17	primaryAccount	111024	CHECK -  -	2	279	\N
6265	434.81	2023-07-17	primaryAccount	111021	CHECK -  -	2	270	\N
6267	1600.00	2023-07-17	primaryAccount	111017	CHECK -  -	2	146	\N
6266	755.90	2023-07-17	primaryAccount	111019	CHECK -  -	2	328	\N
6279	150.00	2023-07-14	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6278	1500.00	2023-07-14	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6297	45.00	2023-07-10	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6311	20.00	2023-07-21	cash			2	188	17
6312	20.00	2023-07-22	cash			2	188	17
6313	20.00	2023-06-02	cash			2	188	17
6314	20.00	2023-06-03	cash			2	188	17
6315	49.62	2023-06-05	cash			2	39	17
6316	49.62	2023-06-05	cash			2	39	17
6317	100.00	2023-06-06	cash			2	331	17
6318	20.00	2023-06-09	cash			2	188	17
6319	34.74	2023-06-09	cash			2	32	17
6320	20.00	2023-06-10	cash			2	188	17
6321	16.98	2023-06-12	cash			2	32	17
6322	59.40	2023-06-16	cash			2	44	17
6323	100.00	2023-06-16	cash			2	242	17
6324	37.83	2023-06-16	cash			2	49	17
6339	6.00	2023-07-31	expensesAccount		Account Service Charge -  -	2	55	\N
6340	11.00	2023-07-31	expensesAccount		Account Service Charge -  -	2	55	\N
6344	688.94	2023-08-04	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6345	521.94	2023-08-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6346	256.58	2023-08-04	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6347	60.83	2023-08-04	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 66073	2	17	\N
6348	27.90	2023-08-03	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF JULY 2023	2	55	\N
6351	294.95	2023-08-03	primaryAccount		ACH Debit - ACH EFT0803    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6352	4242.90	2023-08-02	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
6353	1605.56	2023-08-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
6354	113.75	2023-08-02	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*TH4 - Amzn.com/bill WA REF# 47750	2	112	\N
6355	20.00	2023-08-01	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6356	20.00	2023-08-01	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6360	1120.88	2023-08-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6361	39.99	2023-08-01	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
6362	117.40	2023-08-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 70585	2	141	\N
6363	3793.00	2023-08-01	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
6375	2461.78	2023-07-31	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6376	500.00	2023-07-31	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - CC GOOGLE.COM CA REF# 25734	2	141	\N
6377	150.00	2023-07-31	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 12900	2	144	\N
6382	524.99	2023-07-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6383	376.19	2023-07-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
6384	89.05	2023-07-28	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6385	80.00	2023-07-28	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 0497166	2	131	\N
6388	2249.71	2023-07-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6393	861.23	2023-07-24	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6394	152.08	2023-07-24	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6395	500.00	2023-07-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN Google ADS994382 - 650-2530000 CA REF# 13585	2	141	\N
6396	55.00	2023-07-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 30674	2	287	\N
6399	6.00	2023-07-31	primaryAccount		Account Service Charge -  -	2	55	\N
6391	788.99	2023-07-24	primaryAccount	64583	CHECK -  -	2	66	\N
6390	593.31	2023-07-24	primaryAccount	111029	CHECK -  -	2	321	\N
6389	300.00	2023-07-25	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6386	1000.00	2023-07-28	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6381	3741.01	2023-07-28	primaryAccount	5006	CHECK -  -	2	31	\N
6379	466.26	2023-07-28	primaryAccount	111047	CHECK -  -	2	205	\N
6380	607.98	2023-07-28	primaryAccount	111040	CHECK -  -	2	113	\N
6371	731.21	2023-07-31	primaryAccount	111036	CHECK -  -	2	328	\N
6365	486.24	2023-07-31	primaryAccount	111048	CHECK -  -	2	242	\N
6366	441.28	2023-07-31	primaryAccount	111045	CHECK -  -	2	257	\N
6367	500.36	2023-07-31	primaryAccount	111044	CHECK -  -	2	269	\N
6368	1734.65	2023-07-31	primaryAccount	111041	CHECK -  -	2	279	\N
6369	208.35	2023-07-31	primaryAccount	111038	CHECK -  -	2	270	\N
6370	33.42	2023-07-31	primaryAccount	111037	CHECK -  -	2	330	\N
6372	1599.98	2023-07-31	primaryAccount	111035	CHECK -  -	2	146	\N
6374	650.00	2023-07-31	primaryAccount	1004	CHECK -  - Ortegas	2	334	\N
6359	37.68	2023-08-01	primaryAccount	111042	CHECK -  -	2	316	\N
6358	282.72	2023-08-01	primaryAccount	111043	CHECK -  -	2	326	\N
6357	649.05	2023-08-01	primaryAccount	111046	CHECK -  -	2	321	\N
6349	67.61	2023-08-03	primaryAccount	110981	CHECK -  -	2	271	\N
6350	407.57	2023-08-03	primaryAccount	5028	CHECK -  -	2	146	\N
6342	2.29	2023-08-04	primaryAccount	110949	CHECK -  -	2	314	\N
6343	1.39	2023-08-04	primaryAccount	110932	CHECK -  -	2	314	\N
6341	5.83	2023-08-04	primaryAccount	111001	CHECK -  -	2	314	\N
6392	392.00	2023-07-24	primaryAccount	1001	CHECK -  - Isela Rodriguez	2	332	\N
6378	2100.00	2023-07-31	primaryAccount	between ba and dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6387	100.00	2023-07-26	primaryAccount		POS Transaction DDA - D/C TRN CNA SURETY - 800-331-6053 SD REF# 42249	2	335	\N
6364	650.00	2023-08-01	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6400	10.00	2023-07-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6401	814.02	2023-07-31	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6402	727.80	2023-07-31	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6403	25.00	2023-07-25	primaryAccount		OD ITEM FEE -  -	2	55	\N
6404	1052.07	2023-07-25	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6405	1121.88	2023-07-24	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6397	10000.00	2023-07-24	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6406	20.00	2023-08-05	cash			2	188	17
6407	8.00	2023-08-05	cash			2	330	17
6411	819.18	2023-08-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6412	232.30	2023-08-25	primaryAccount		ACH Debit - ACH EFT0825    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6413	152.08	2023-08-25	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6414	27.09	2023-08-25	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*T33 - Amzn.com/bill WA REF# 5862	2	112	\N
6416	60.00	2023-08-24	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 82907	2	287	\N
6417	991.02	2023-08-23	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
6420	500.00	2023-08-23	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - CC GOOGLE.COM CA REF# 25164	2	141	\N
6421	2126.42	2023-08-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6424	513.71	2023-08-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6425	501.82	2023-08-21	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6426	478.51	2023-08-18	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6427	161.29	2023-08-18	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6428	80.00	2023-08-18	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 6353662	2	131	\N
6429	155.62	2023-08-18	primaryAccount		POS Transaction DDA - D/C TRN AMAZON.COM*TQ5I0 - SEATTLE WA REF# 516423	2	26	\N
6373	746.22	2023-07-31	primaryAccount	111034	CHECK -  - Marco Casas	2	333	\N
6431	584.21	2023-08-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6432	260.00	2023-08-17	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 9005	2	23	\N
6433	63.75	2023-08-17	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 32746	2	284	\N
6434	58.52	2023-08-17	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*TO6 - Amzn.com/bill WA REF# 64487	2	112	\N
6435	52.02	2023-08-17	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*TO6 - Amzn.com/bill WA REF# 28903	2	112	\N
6437	283.97	2023-08-16	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6439	500.00	2023-08-16	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE *ADS99438 - 650-2530000 CA REF# 89552	2	141	\N
6398	406.00	2023-07-24	primaryAccount	between ba and dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6440	123.53	2023-08-16	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 32629	2	22	\N
6441	3001.26	2023-08-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6445	2063.78	2023-08-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6446	198.90	2023-08-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6423	3000.00	2023-08-22	primaryAccount	to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6422	1000.00	2023-08-22	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6415	2500.00	2023-08-25	primaryAccount		CITYNET TRANSFER- DEBIT - prestamo dos a district -	2	336	\N
6418	26.13	2023-08-23	primaryAccount		ACH Debit - ACH CHK ORDER  HARLAND CLARKE - DOS BANDIDOS BA LLC	2	337	\N
6447	443.89	2023-08-14	primaryAccount	111063	CHECK -  -	2	242	\N
6448	792.40	2023-08-14	primaryAccount	111062	CHECK -  -	2	205	\N
6449	446.84	2023-08-14	primaryAccount	111060	CHECK -  -	2	257	\N
6450	47.57	2023-08-14	primaryAccount	111057	CHECK -  -	2	316	\N
6451	1633.72	2023-08-14	primaryAccount	111056	CHECK -  -	2	279	\N
6452	321.60	2023-08-14	primaryAccount	111055	CHECK -  -	2	113	\N
6453	14.60	2023-08-14	primaryAccount	111052	CHECK -  -	2	330	\N
6444	362.84	2023-08-15	primaryAccount	111033	CHECK -  -	2	327	\N
6442	721.48	2023-08-15	primaryAccount	111061	CHECK -  -	2	321	\N
6443	344.74	2023-08-15	primaryAccount	111058	CHECK -  -	2	326	\N
6430	496.30	2023-08-17	primaryAccount	111049	CHECK -  -	2	333	\N
6408	293.34	2023-08-25	primaryAccount	111076	CHECK -  -	2	242	\N
6409	665.86	2023-08-25	primaryAccount	111075	CHECK -  -	2	205	\N
6410	463.67	2023-08-25	primaryAccount	111072	CHECK -  -	2	269	\N
6438	5.00	2023-08-16	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	340	\N
6419	692.16	2023-08-23	primaryAccount		POS Transaction DDA - D/C TRN BillMatrix - Columbus OH REF# 988654	2	15	\N
6456	2487.09	2023-08-14	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6457	150.00	2023-08-14	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 8305	2	144	\N
6460	781.48	2023-08-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6461	23.10	2023-08-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6463	148.05	2023-08-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6464	89.05	2023-08-10	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6465	1832.98	2023-08-09	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
6466	1627.67	2023-08-09	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6467	126.00	2023-08-09	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6468	536.20	2023-08-09	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 26021	2	24	\N
6469	525.77	2023-08-09	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 26013	2	24	\N
6470	1980.19	2023-08-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6471	500.00	2023-08-08	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - CC GOOGLE.COM CA REF# 21998	2	141	\N
6473	836.33	2023-08-07	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
6475	254.92	2023-08-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6476	204.03	2023-08-07	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 92357	2	22	\N
6477	38.90	2023-08-07	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 92429	2	22	\N
6478	36.88	2023-08-07	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*TA7 - Amzn.com/bill WA REF# 50123	2	112	\N
6482	25.00	2023-08-21	primaryAccount		OD ITEM FEE -  -	2	55	\N
6483	570.99	2023-08-21	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6484	25.00	2023-08-17	primaryAccount		OD ITEM FEE -  -	2	55	\N
6485	2771.25	2023-08-17	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6486	112.00	2023-08-16	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6487	2015.51	2023-08-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6488	293.15	2023-08-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6489	25.00	2023-08-10	primaryAccount		OD ITEM FEE -  -	2	55	\N
6490	1500.00	2023-08-10	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6491	25.00	2023-08-07	primaryAccount		OD ITEM FEE -  -	2	55	\N
6492	3150.33	2023-08-07	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6455	1599.98	2023-08-14	primaryAccount	111050	CHECK -  -	2	146	\N
6459	500.93	2023-08-11	primaryAccount	111059	CHECK -  -	2	269	\N
6480	5000.00	2023-08-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	2	336	\N
6499	6.00	2023-08-31	expensesAccount		Account Service Charge -  -	2	55	\N
6500	11.00	2023-08-31	expensesAccount		Account Service Charge -  -	2	55	\N
6472	3100.00	2023-08-08	primaryAccount	to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6501	1769.09	2023-09-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6481	250.00	2023-08-07	primaryAccount	to expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6502	198.90	2023-09-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6503	152.08	2023-09-15	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6462	150.00	2023-08-11	primaryAccount	to expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6454	815.71	2023-08-14	primaryAccount	111051	CHECK -  -	2	328	\N
6458	3210.00	2023-08-14	primaryAccount	to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6436	1000.00	2023-08-17	primaryAccount	to expenses	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6505	105.49	2023-09-14	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 43177	2	22	\N
6507	240.00	2023-09-13	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 49422	2	23	\N
6474	278.18	2023-08-07	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	338	\N
6508	63.75	2023-09-13	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 46984	2	284	\N
6479	1000.00	2023-08-07	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6493	96.75	2023-08-08	cash			2	32	17
6494	20.00	2023-08-11	cash			2	188	17
6495	104.00	2023-08-11	cash			2	242	17
6496	10.00	2023-08-12	cash			2	188	17
6497	20.00	2023-08-12	cash			2	188	17
6498	9.76	2023-08-12	cash	mariela		2	188	17
6510	468.63	2023-09-12	primaryAccount	111079	CHECK -  -	2	333	\N
6504	1566.00	2023-09-14	primaryAccount	285	CHECK -  -	2	104	\N
6506	350.00	2023-09-13	primaryAccount	286	CHECK -  - Richard stewart CPA	2	220	\N
6511	1379.57	2023-09-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6512	150.80	2023-09-12	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6513	23.10	2023-09-12	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6514	525.77	2023-09-12	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 86616	2	24	\N
6515	150.00	2023-09-12	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 20883	2	144	\N
6525	2918.58	2023-09-11	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6526	433.15	2023-09-11	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6530	24.75	2023-09-08	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF AUGUST 2023	2	55	\N
6532	1646.04	2023-09-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6533	152.08	2023-09-08	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6535	1.00	2023-09-07	primaryAccount		ATM Service Charge - ATM D/F AUTO-CHLOR SYSTE - 504-2192170 LA REF# 665664	2	24	\N
6536	25.00	2023-09-07	primaryAccount		OD ITEM FEE -  -	2	55	\N
6537	1580.64	2023-09-07	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6538	258.07	2023-09-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6539	133.00	2023-09-07	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6540	80.00	2023-09-07	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 1744420	2	131	\N
6541	542.80	2023-09-07	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 65466	2	24	\N
6542	25.00	2023-09-06	primaryAccount	111070	OD ITEM FEE -  -	2	55	\N
6544	25.00	2023-09-06	primaryAccount	284	OD ITEM FEE -  -	2	55	\N
6546	990.99	2023-09-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6547	217.84	2023-09-06	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	338	\N
6548	59.72	2023-09-06	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 31484	2	17	\N
6549	20.00	2023-09-05	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6550	20.00	2023-09-05	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6552	1.00	2023-09-05	primaryAccount		ATM Service Charge - ATM D/F GOOGLE *ADS99438 - Mountain View CA REF# 429587	2	141	\N
6553	25.00	2023-09-05	primaryAccount	111074	OD ITEM FEE -  -	2	55	\N
6555	25.00	2023-09-05	primaryAccount		OD ITEM FEE -  -	2	55	\N
6556	1505.09	2023-09-05	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
6558	634.11	2023-09-05	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6559	3793.00	2023-09-05	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAWS BROS LLC	2	136	\N
6561	1.00	2023-09-01	primaryAccount		ATM Service Charge - ATM D/F Google ADS994382 - 650-2530000 CA REF# 315723	2	141	\N
6563	25.00	2023-09-01	primaryAccount	283	OD ITEM FEE -  -	2	55	\N
6565	25.00	2023-09-01	primaryAccount		OD ITEM FEE -  -	2	55	\N
6566	1345.47	2023-09-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6567	388.85	2023-09-01	primaryAccount		ACH Debit - ACH EFT0901    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6568	193.57	2023-09-01	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6569	6.00	2023-08-31	primaryAccount		Account Service Charge -  -	2	55	\N
6554	622.50	2023-09-05	primaryAccount	111074	CHECK -  -	2	321	\N
6545	862.01	2023-09-06	primaryAccount	284	CHECK -  -	2	338	\N
6543	126.28	2023-09-06	primaryAccount	111070	CHECK -  -	2	316	\N
6531	412.50	2023-09-08	primaryAccount	282	CHECK -  -	2	91	\N
6524	1386.66	2023-09-11	primaryAccount	111077	CHECK -  -	2	234	\N
6523	1599.98	2023-09-11	primaryAccount	111080	CHECK -  -	2	146	\N
6522	615.72	2023-09-11	primaryAccount	111081	CHECK -  -	2	314	\N
6521	724.70	2023-09-11	primaryAccount	111082	CHECK -  -	2	328	\N
6520	609.34	2023-09-11	primaryAccount	111086	CHECK -  -	2	113	\N
6519	1722.76	2023-09-11	primaryAccount	111087	CHECK -  -	2	279	\N
6518	480.39	2023-09-11	primaryAccount	111090	CHECK -  -	2	269	\N
6517	173.88	2023-09-11	primaryAccount	111091	CHECK -  -	2	257	\N
6560	650.00	2023-09-05	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6516	58.55	2023-09-11	primaryAccount	111093	CHECK -  - Aleesia Tarver	2	341	\N
6562	1.00	2023-09-01	primaryAccount		ATM Service Charge - ATM D/F AMZN Mktp US - Amzn.com/bill WA REF# 608641	2	112	\N
6551	1.00	2023-09-05	primaryAccount		ATM Service Charge - ATM D/F AMZN Mktp US - Amzn.com/bill WA REF# 95638	2	112	\N
6527	70.43	2023-09-11	primaryAccount		POS Transaction DDA - D/C TRN Amazon.com*TR5SI - Amzn.com/bill WA REF# 44330	2	112	\N
6529	40.00	2023-09-11	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6557	914.29	2023-09-05	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
6528	1000.00	2023-09-11	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6572	39.99	2023-08-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
6573	25.00	2023-08-30	primaryAccount	111066	OD ITEM FEE -  -	2	55	\N
6575	25.00	2023-08-30	primaryAccount	111064	OD ITEM FEE -  -	2	55	\N
6577	25.00	2023-08-30	primaryAccount	241	OD ITEM FEE -  -	2	55	\N
6579	3828.46	2023-08-30	primaryAccount		ACH Debit - ACH OK TAX PMT OKLAHOMATAXPMTS - DOS BANDIDOS	2	189	\N
6580	237.55	2023-08-30	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6581	500.00	2023-08-30	primaryAccount		POS Transaction DDA - D/C TRN GOOGLE*ADS994382 - CC GOOGLE.COM CA REF# 20688	2	141	\N
6582	115.85	2023-08-30	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 92823	2	22	\N
6583	69.12	2023-08-30	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 92857	2	22	\N
6587	2154.85	2023-08-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6597	1706.70	2023-08-28	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6598	655.36	2023-08-28	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6599	376.19	2023-08-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
6600	150.00	2023-08-28	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 50776	2	144	\N
6601	53.10	2023-08-28	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*T34 - Amzn.com/bill WA REF# 97412	2	112	\N
6602	25.00	2023-09-14	primaryAccount		OD ITEM FEE -  -	2	55	\N
6603	2842.95	2023-09-14	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6604	65.52	2023-09-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6605	6.00	2023-08-31	primaryAccount		Account Service Charge -  -	2	55	\N
6606	10.00	2023-08-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6607	25.00	2023-08-28	primaryAccount		OD ITEM FEE -  -	2	55	\N
6608	3596.78	2023-08-28	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6610	6.00	2023-09-29	expensesAccount		Account Service Charge -  -	2	55	\N
6591	1706.18	2023-08-28	primaryAccount	111069	CHECK -  -	2	279	\N
6594	1599.98	2023-08-28	primaryAccount	111065	CHECK -  -	2	146	\N
6590	271.28	2023-08-28	primaryAccount	111073	CHECK -  -	2	257	\N
6564	2823.00	2023-09-01	primaryAccount	283	CHECK -  -	2	30	\N
6611	11.00	2023-09-29	expensesAccount		Account Service Charge -  -	2	55	\N
6596	625.27	2023-08-28	primaryAccount	281	CHECK -  -	2	113	\N
6593	91.10	2023-08-28	primaryAccount	111067	CHECK -  -	2	270	\N
6586	850.00	2023-08-29	primaryAccount	242	CHECK -  - Chamber	2	169	\N
6595	20.86	2023-08-28	primaryAccount	111053	CHECK -  -	2	229	\N
6571	1.00	2023-08-31	primaryAccount		ATM Service Charge - ATM D/F AMZN Mktp US - Amzn.com/bill WA REF# 879038	2	112	\N
6589	3500.00	2023-08-29	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6592	133.65	2023-08-28	primaryAccount	111068	CHECK -  -	2	319	\N
6585	215.61	2023-08-29	primaryAccount	111071	CHECK -  -	2	326	\N
6612	6.00	2023-09-29	primaryAccount		Account Service Charge -  -	2	55	\N
6578	3000.00	2023-08-30	primaryAccount	241	CHECK -  -	2	31	\N
6534	1.00	2023-09-07	primaryAccount		ATM Service Charge - ATM D/F PAYPAL *WISEY - 4029357733 CA REF# 385057	2	344	\N
6576	481.97	2023-08-30	primaryAccount	111064	CHECK -  -	2	333	\N
6613	10.00	2023-09-29	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6574	675.48	2023-08-30	primaryAccount	111066	CHECK -  -	2	328	\N
6570	1.00	2023-08-31	primaryAccount		ATM Service Charge - ATM D/F AMZN Mktp US - Amzn.com/bill WA REF# 51770	2	112	\N
6615	1311.25	2023-09-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6509	158.95	2023-09-12	primaryAccount	111089	CHECK -  -	2	326	\N
6584	250.00	2023-08-30	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6616	236.78	2023-09-29	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6588	1000.00	2023-08-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6609	20.66	2023-09-14	cash			2	33	17
6617	426.84	2023-09-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
6618	206.40	2023-09-28	primaryAccount		ACH Debit - ACH EFT0928    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6621	507.95	2023-09-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6623	1123.50	2023-09-26	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6625	499.46	2023-09-25	primaryAccount	111106	CHECK -  -	2	269	\N
6626	64.15	2023-09-25	primaryAccount	111105	CHECK -  -	2	326	\N
6627	51.08	2023-09-25	primaryAccount	111104	CHECK -  -	2	316	\N
6622	666.25	2023-09-26	primaryAccount	111096	CHECK -  -	2	333	\N
6619	594.61	2023-09-27	primaryAccount	111102	CHECK -  -	2	113	\N
6614	284.90	2023-09-29	primaryAccount	288	CHECK -  -	2	235	\N
6634	2124.75	2023-09-25	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6635	443.13	2023-09-25	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6636	348.75	2023-09-25	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6640	1041.65	2023-09-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6641	89.05	2023-09-22	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6643	963.67	2023-09-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6644	478.77	2023-09-19	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6650	346.62	2023-09-18	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6651	3001.26	2023-09-18	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6652	6.00	2023-09-29	primaryAccount		Account Service Charge -  -	2	55	\N
6653	25.00	2023-09-29	primaryAccount		OD ITEM FEE -  -	2	55	\N
6654	2000.00	2023-09-29	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6655	2500.00	2023-09-25	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6656	25.00	2023-09-18	primaryAccount		OD ITEM FEE -  -	2	55	\N
6657	112.00	2023-09-18	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6639	65.00	2023-09-25	primaryAccount	from primary to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6647	575.37	2023-09-18	primaryAccount	111092	CHECK -  -	2	321	\N
6631	925.98	2023-09-25	primaryAccount	111094	CHECK -  -	2	234	\N
6633	137.55	2023-09-25	primaryAccount	5024	CHECK -  -	2	103	\N
6620	644.31	2023-09-27	primaryAccount	111095	CHECK -  - eduardo arenas	2	345	\N
6648	697.06	2023-09-18	primaryAccount	111078	CHECK -  - EDUARDO ARENAS	2	345	\N
6629	371.13	2023-09-25	primaryAccount	111098	CHECK -  -	2	328	\N
6624	281.59	2023-09-25	primaryAccount	111107	CHECK -  -	2	257	\N
6642	1000.00	2023-09-19	primaryAccount		ACH Debit - ACH PAYMENT    SBA EIDL LOAN - CARLOS LOPEZ	2	346	\N
6646	5.00	2023-09-19	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	340	\N
6630	615.72	2023-09-25	primaryAccount	111097	CHECK -  -	2	314	\N
6649	754.51	2023-09-18	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
6628	1704.14	2023-09-25	primaryAccount	111103	CHECK -  -	2	279	\N
6632	33.33	2023-09-25	primaryAccount	111088	CHECK -  -	2	316	\N
6661	217.00	2023-10-19	primaryAccount		ACH Debit - ACH PAYMENT    SBA EIDL LOAN - CARLOS LOPEZ	2	346	\N
6645	217.00	2023-09-19	primaryAccount		ACH Debit - ACH PAYMENT    SBA EIDL LOAN - CARLOS LOPEZ	2	346	\N
6658	593.28	2023-10-20	primaryAccount	111135	CHECK -  -	2	113	\N
6638	4200.00	2023-09-25	primaryAccount	from primary to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6637	1000.00	2023-09-25	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6659	1913.17	2023-10-20	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6660	478.77	2023-10-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6662	203.90	2023-10-19	primaryAccount		ACH Debit - ACH EFT1019    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6663	534.44	2023-10-19	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 22784	2	24	\N
6664	517.09	2023-10-19	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 22776	2	24	\N
6665	300.00	2023-10-19	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 53331	2	144	\N
6666	5.00	2023-10-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	340	\N
6667	1794.54	2023-10-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6668	198.90	2023-10-17	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6675	683.13	2023-10-16	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6676	600.49	2023-10-16	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
6677	204.30	2023-10-16	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6678	63.75	2023-10-16	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 77292	2	284	\N
6679	29.26	2023-10-16	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*TE9 - Amzn.com/bill WA REF# 93850	2	112	\N
6680	3001.26	2023-10-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6682	1098.27	2023-10-13	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6683	378.22	2023-10-13	primaryAccount		ACH Debit - ACH BILL PAY   AEP PUBLIC SERV - 19234696991	2	15	\N
6684	69.12	2023-10-13	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 53833	2	22	\N
6685	299.17	2023-10-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6689	953.36	2023-10-11	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6690	153.05	2023-10-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6691	23.10	2023-10-11	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6702	1614.00	2023-10-10	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6703	1506.53	2023-10-10	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6704	229.11	2023-10-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6705	154.00	2023-10-10	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6709	1569.66	2023-10-06	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6710	325.73	2023-10-06	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6711	243.70	2023-10-06	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	338	\N
6712	93.90	2023-10-06	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6713	1118.99	2023-10-05	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
6714	10.35	2023-10-04	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR MONTH OF SEPTEMBER 2023	2	55	\N
6715	119.70	2023-10-04	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6718	1768.54	2023-10-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6719	39.99	2023-10-03	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
6720	20.00	2023-10-02	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6721	20.00	2023-10-02	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6723	1424.87	2023-10-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
6724	634.74	2023-10-02	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6722	1200.00	2023-10-02	primaryAccount	291	CHECK -  -	2	169	\N
6716	620.00	2023-10-03	primaryAccount	111108	CHECK -  -	2	321	\N
6708	615.72	2023-10-06	primaryAccount	111113	CHECK -  -	2	314	\N
6695	587.27	2023-10-10	primaryAccount	111119	CHECK -  -	2	113	\N
6692	244.70	2023-10-10	primaryAccount	111124	CHECK -  -	2	257	\N
6693	344.20	2023-10-10	primaryAccount	111123	CHECK -  -	2	269	\N
6694	1696.51	2023-10-10	primaryAccount	111120	CHECK -  -	2	279	\N
6696	218.38	2023-10-10	primaryAccount	111115	CHECK -  -	2	328	\N
6698	671.90	2023-10-10	primaryAccount	111111	CHECK -  -	2	345	\N
6699	936.48	2023-10-10	primaryAccount	111110	CHECK -  -	2	234	\N
6700	2250.00	2023-10-10	primaryAccount	295	CHECK -  -	2	59	\N
6701	1030.20	2023-10-10	primaryAccount	292	CHECK -  -	2	333	\N
6706	1000.00	2023-10-10	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6687	117.47	2023-10-11	primaryAccount	111122	CHECK -  -	2	326	\N
6688	1862.00	2023-10-11	primaryAccount	294	CHECK -  -	2	30	\N
6686	738.44	2023-10-11	primaryAccount	111125	CHECK -  -	2	321	\N
6672	136.79	2023-10-16	primaryAccount	111121	CHECK -  -	2	316	\N
6674	260.41	2023-10-16	primaryAccount	244	CHECK -  -	2	230	\N
6673	384.76	2023-10-16	primaryAccount	293	CHECK -  -	2	230	\N
6725	1000.00	2023-10-02	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6681	3000.00	2023-10-16	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6697	133.04	2023-10-10	primaryAccount	111114	CHECK -  - BAO HUYNH	2	347	\N
6669	59.95	2023-10-17	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN JOINHOMEBASE.COM - HTTPSJOINHOME CA REF# 57884	2	348	\N
6671	1000.00	2023-10-17	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6887	1611.00	2023-11-14	primaryAccount	247	CHECK -  -	2	30	\N
6886	1200.00	2023-11-14	primaryAccount	248	CHECK -  -	2	169	\N
6728	650.00	2023-10-02	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6729	1405.29	2023-10-16	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6730	116.00	2023-10-16	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6731	25.00	2023-10-13	primaryAccount		OD ITEM FEE -  -	2	55	\N
6732	2544.13	2023-10-13	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6733	25.00	2023-10-05	primaryAccount		OD ITEM FEE -  -	2	55	\N
6734	3011.11	2023-10-05	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6735	10.00	2023-10-02	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6736	2464.69	2023-10-02	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6745	48.74	2023-11-09	primaryAccount	111146	CHECK -  -	2	328	\N
6762	510.83	2023-11-06	primaryAccount	111150	CHECK -  -	2	113	\N
6727	3793.00	2023-10-02	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAW BROS LLC	2	136	\N
6759	224.96	2023-11-06	primaryAccount	111154	CHECK -  -	2	257	\N
6760	324.70	2023-11-06	primaryAccount	111153	CHECK -  -	2	269	\N
6670	59.95	2023-10-17	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN JOINHOMEBASE.COM - HTTPSJOINHOME CA REF# 27342	2	348	\N
6737	6.00	2023-10-31	expensesAccount		Account Service Charge -  -	2	55	\N
6717	86757.90	2023-10-03	primaryAccount	290	CHECK -  -	2	312	\N
6738	11.00	2023-10-31	expensesAccount		Account Service Charge -  -	2	55	\N
6739	1360.80	2023-11-10	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6740	149.80	2023-11-10	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6741	93.90	2023-11-10	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6742	76.95	2023-11-10	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 64343	2	22	\N
6743	63.75	2023-11-10	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 92258	2	284	\N
6751	1420.16	2023-11-07	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6726	3800.00	2023-10-02	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6752	1124.60	2023-11-07	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6753	243.70	2023-11-07	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	338	\N
6754	182.00	2023-11-07	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6707	120.00	2023-10-10	primaryAccount	from ba to expenses broken arrow	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6757	20.00	2023-11-06	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6758	20.00	2023-11-06	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6763	1911.16	2023-11-06	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6764	303.60	2023-11-06	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6765	108.00	2023-11-06	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6766	534.44	2023-11-06	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 40189	2	24	\N
6767	517.09	2023-11-06	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 40197	2	24	\N
6761	1723.39	2023-11-06	primaryAccount	111151	CHECK -  -	2	279	\N
6747	674.22	2023-11-07	primaryAccount	111155	CHECK -  -	2	321	\N
6748	228.56	2023-11-07	primaryAccount	111149	CHECK -  - sofia ramos	2	349	\N
6756	2000.00	2023-11-07	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6750	625.58	2023-11-07	primaryAccount	111143	CHECK -  -	2	345	\N
6755	49.99	2023-11-07	primaryAccount		POS Transaction DDA - D/C TRN PAYPAL *WISEY - 402-935-7733 CA REF# 56457	2	344	\N
6746	3000.00	2023-11-08	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6749	805.97	2023-11-07	primaryAccount	111145	CHECK -  -	2	333	\N
6744	156.85	2023-11-09	primaryAccount	111156	CHECK -  - shelby shaffer	2	350	\N
6768	32.49	2023-11-06	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*5V4 - Amzn.com/bill WA REF# 55430	2	112	\N
6769	3793.00	2023-11-06	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAW BROS LLC	2	136	\N
6770	650.00	2023-11-06	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6771	14.40	2023-11-03	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF OCTOBER 2023	2	55	\N
6774	872.82	2023-11-03	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6775	160.46	2023-11-03	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6776	150.00	2023-11-03	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 39049	2	144	\N
6777	118.50	2023-11-03	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 20228	2	17	\N
6778	1312.79	2023-11-02	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
6779	80.00	2023-11-02	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 7604068	2	131	\N
6781	60.00	2023-11-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 47393	2	287	\N
6785	948.88	2023-10-31	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6786	39.99	2023-10-31	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
6787	426.84	2023-10-30	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
6788	314.05	2023-10-30	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6791	757.10	2023-10-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6792	93.90	2023-10-27	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6793	154.28	2023-10-27	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 14011	2	22	\N
6794	136.09	2023-10-27	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 14047	2	22	\N
6796	274.70	2023-10-26	primaryAccount		ACH Debit - ACH EFT1026    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6797	123.26	2023-10-25	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 93953	2	22	\N
6800	1691.60	2023-10-24	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6809	1848.49	2023-10-23	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6810	828.58	2023-10-23	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
6811	502.27	2023-10-23	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6812	93.90	2023-10-23	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6813	150.00	2023-10-23	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 52397	2	144	\N
6816	25.00	2023-11-08	primaryAccount		OD ITEM FEE -  -	2	55	\N
6817	3000.00	2023-11-08	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6818	6.00	2023-10-31	primaryAccount		Account Service Charge -  -	2	55	\N
6819	10.00	2023-10-31	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6820	25.00	2023-10-30	primaryAccount		OD ITEM FEE -  -	2	55	\N
6821	3000.00	2023-10-30	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6827	6.00	2023-11-30	expensesAccount		Account Service Charge -  -	2	55	\N
6801	167.89	2023-10-23	primaryAccount	111139	CHECK -  -	2	257	\N
6814	1000.00	2023-10-23	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6808	132.99	2023-10-23	primaryAccount	111112	CHECK -  -	2	327	\N
6807	572.77	2023-10-23	primaryAccount	111126	CHECK -  -	2	234	\N
6806	134.54	2023-10-23	primaryAccount	111128	CHECK -  -	2	327	\N
6805	738.55	2023-10-23	primaryAccount	111130	CHECK -  -	2	333	\N
6804	172.60	2023-10-23	primaryAccount	111131	CHECK -  -	2	328	\N
6802	91.64	2023-10-23	primaryAccount	111138	CHECK -  -	2	326	\N
6798	1520.11	2023-10-24	primaryAccount	111136	CHECK -  -	2	279	\N
6799	631.78	2023-10-24	primaryAccount	111127	CHECK -  -	2	345	\N
6795	300.00	2023-10-26	primaryAccount	296	CHECK -  - Donacion	2	100	\N
6783	712.01	2023-10-31	primaryAccount	111140	CHECK -  -	2	321	\N
6784	933.63	2023-10-31	primaryAccount	297	CHECK -  - Runners Licensing?	2	100	\N
6782	2500.00	2023-11-01	primaryAccount		CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	100	\N
6772	993.15	2023-11-03	primaryAccount	111142	CHECK -  -	2	234	\N
6773	31.60	2023-11-03	primaryAccount	111137	CHECK -  -	2	316	\N
6803	226.44	2023-10-23	primaryAccount	111134	CHECK -  - Sofia Ramos	2	349	\N
6790	56.24	2023-10-27	primaryAccount	111141	CHECK -  - Shelby Shaffer	2	350	\N
6780	2700.75	2023-11-01	primaryAccount	246	CHECK -  - City of Broken Arrow (Water)	2	351	\N
6815	100.00	2023-10-23	primaryAccount	between ba and expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6789	1000.00	2023-10-30	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6822	12.18	2023-10-11	cash			2	44	17
6823	27.31	2023-10-11	cash			2	44	17
6824	30.77	2023-10-11	cash			2	33	17
6825	12.97	2023-10-21	cash			2	278	17
6829	11.00	2023-11-30	expensesAccount		Account Service Charge -  -	2	55	\N
6830	1112.65	2023-12-01	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6831	39.99	2023-12-01	primaryAccount		ACH Debit - ACH 9187777233 TAS SYSTEMS LLC - CARLOS LOPEZ	2	133	\N
6832	60.00	2023-12-01	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN INTUIT *QBooks O - CL.INTUIT.COM CA REF# 87896	2	287	\N
6834	6.00	2023-11-30	primaryAccount		Account Service Charge -  -	2	55	\N
6835	93.90	2023-11-30	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6836	619.01	2023-11-30	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 47937	2	24	\N
6837	517.09	2023-11-30	primaryAccount		POS Transaction DDA - D/C TRN AUTO-CHLOR SERVI - JEFFERSON LA REF# 47929	2	24	\N
6841	1198.15	2023-11-28	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6842	426.84	2023-11-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
6843	346.36	2023-11-28	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6845	1615.33	2023-11-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6846	539.75	2023-11-27	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
6851	291.19	2023-11-24	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
6852	93.90	2023-11-24	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6855	235.95	2023-11-22	primaryAccount		ACH Debit - ACH EFT1122    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6856	124.81	2023-11-22	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 4513	2	22	\N
6857	70.15	2023-11-22	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 4541	2	22	\N
6862	889.76	2023-11-21	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6871	1601.59	2023-11-20	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6872	479.92	2023-11-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6874	57.36	2023-11-20	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*983 - Amzn.com/bill WA REF# 41591	2	112	\N
6875	35.28	2023-11-20	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*9V6 - Amzn.com/bill WA REF# 27036	2	112	\N
6876	1271.12	2023-11-17	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6877	236.78	2023-11-17	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6878	5.00	2023-11-17	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	340	\N
6880	150.00	2023-11-17	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 47061	2	144	\N
6881	59.95	2023-11-17	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN JOINHOMEBASE.COM - HTTPSJOINHOME CA REF# 99577	2	348	\N
6882	59.95	2023-11-17	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN JOINHOMEBASE.COM - HTTPSJOINHOME CA REF# 96449	2	348	\N
6883	3013.06	2023-11-16	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
6884	200.30	2023-11-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6863	165.89	2023-11-20	primaryAccount	111166	CHECK -  -	2	257	\N
6864	313.17	2023-11-20	primaryAccount	111165	CHECK -  -	2	269	\N
6865	1628.39	2023-11-20	primaryAccount	111164	CHECK -  -	2	279	\N
6866	561.31	2023-11-20	primaryAccount	111163	CHECK -  -	2	113	\N
6867	511.99	2023-11-20	primaryAccount	111158	CHECK -  -	2	345	\N
6868	940.21	2023-11-20	primaryAccount	111157	CHECK -  -	2	234	\N
6869	16.78	2023-11-20	primaryAccount	111133	CHECK -  -	2	319	\N
6858	543.00	2023-11-22	primaryAccount		CITYNET TRANSFER- DEBIT - St. John labor -	2	100	\N
6861	200.00	2023-11-21	primaryAccount	300	CHECK -  -	2	350	\N
6859	184.70	2023-11-21	primaryAccount	111168	CHECK -  -	2	350	\N
6860	297.83	2023-11-21	primaryAccount	111162	CHECK -  -	2	349	\N
6849	695.68	2023-11-24	primaryAccount	111167	CHECK -  -	2	321	\N
6850	224.00	2023-11-24	primaryAccount	303	CHECK -  - David Santiago Cuith	2	353	\N
6839	942.00	2023-11-28	primaryAccount	250	CHECK -  -	2	333	\N
6840	2000.00	2023-11-28	primaryAccount	245	CHECK -  -	2	243	\N
6838	300.00	2023-11-29	primaryAccount	304	CHECK -  - Tulsa Latina Leadership	2	354	\N
6870	18.30	2023-11-20	primaryAccount	111117	CHECK -  -	2	319	\N
6873	217.00	2023-11-20	primaryAccount		ACH Debit - ACH PAYMENT    SBA EIDL LOAN - CARLOS LOPEZ	2	346	\N
6848	150.00	2023-11-27	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6847	2310.00	2023-11-27	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6844	350.00	2023-11-28	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6828	320.00	2023-11-20	expensesAccount	from expenses 6473 to 6051	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6853	1000.00	2023-11-24	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6833	1000.00	2023-12-01	primaryAccount		COUNTER WITHDRAWAL -  -	2	62	\N
6888	1140.32	2023-11-14	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6889	498.57	2023-11-14	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6893	552.76	2023-11-13	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
6894	148.59	2023-11-13	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6895	23.10	2023-11-13	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6896	6.00	2023-11-30	primaryAccount		Account Service Charge -  -	2	55	\N
6897	10.00	2023-11-30	primaryAccount		Account Service Fee - BUSINESS MOBILE CHECK DEPOSIT -	2	55	\N
6898	4250.78	2023-11-27	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6899	25.00	2023-11-16	primaryAccount		OD ITEM FEE -  -	2	55	\N
6900	110.00	2023-11-16	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6901	25.00	2023-11-13	primaryAccount		OD ITEM FEE -  -	2	55	\N
6902	1500.00	2023-11-13	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6912	1089.97	2023-12-14	primaryAccount	111183	CHECK -  -	2	177	\N
6891	2600.00	2023-11-14	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6908	2000.00	2023-12-15	primaryAccount	305	CHECK -  -	2	31	\N
6892	644.92	2023-11-13	primaryAccount	298	CHECK -  -	2	5	\N
6918	4040.00	2023-12-13	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6885	1100.00	2023-11-14	primaryAccount	249	CHECK -  - 	2	241	\N
6854	120.52	2023-11-22	primaryAccount	111161	CHECK -  - chylee	2	352	\N
6879	201.76	2023-11-17	primaryAccount		POS Transaction DDA - D/C TRN FSI*PSO BILLMATR - 888-333-4026 OH REF# 86214	2	40	\N
6914	9.21	2023-12-13	primaryAccount	111148	CHECK -  - salone pope	2	357	\N
6905	339.66	2023-12-15	primaryAccount	111196	CHECK -  -	2	257	\N
6917	31.21	2023-12-13	primaryAccount	111085	CHECK -  - salone	2	357	\N
6906	349.07	2023-12-15	primaryAccount	111195	CHECK -  -	2	269	\N
6890	1000.00	2023-11-14	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6903	47.00	2023-10-20	cash			2	235	17
6904	23.83	2023-11-23	cash			2	97	17
6909	1298.15	2023-12-15	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6910	200.30	2023-12-15	primaryAccount		ACH Debit - ACH AUTO-PAY   AMERICAN WASTE - DOS BANDIDOS	2	181	\N
6911	160.46	2023-12-15	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6913	13.50	2023-12-13	primaryAccount		Account Service Fee - EXCESS LINE ITEM FEE - FOR THE MONTH OF NOVEMBER 2023	2	55	\N
6919	2049.78	2023-12-12	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6920	539.75	2023-12-12	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
6921	308.97	2023-12-12	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6922	133.00	2023-12-12	primaryAccount		ACH Debit - ACH PURCHASE   KASTENBERRY BIL - DOS BANDIDOS BA	2	168	\N
6923	23.10	2023-12-12	primaryAccount		ACH Debit - ACH INS. PREM  FARMERS N W LIF - CARLOS LOPEZ	2	21	\N
6924	240.00	2023-12-12	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 78318	2	23	\N
6915	9.19	2023-12-13	primaryAccount	111118	CHECK -  - salone	2	357	\N
6907	766.71	2023-12-15	primaryAccount	111189	CHECK -  - guillermo	2	355	\N
6916	10.87	2023-12-13	primaryAccount	111101	CHECK -  - salone	2	357	\N
6925	13.00	2023-12-12	primaryAccount		POS Transaction DDA - D/C TRN Amazon.com*AI2VC - Amzn.com/bill WA REF# 38091	2	112	\N
6927	675.88	2023-12-11	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6928	150.05	2023-12-11	primaryAccount		ACH Debit - ACH CLOVER APP CLOVER APP MRKT - DOS BANDIDOS BA LLC	2	99	\N
6931	1190.93	2023-12-08	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6932	313.48	2023-12-08	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
6933	93.90	2023-12-08	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6934	353.33	2023-12-07	primaryAccount		ACH Debit - ACH UTIL PAYMT OK NATURAL GAS - DOS BANDIDOS	2	17	\N
6935	271.35	2023-12-07	primaryAccount		ACH Debit - ACH EFT1207    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6936	25.00	2023-12-06	primaryAccount		OD ITEM FEE -  -	2	55	\N
6937	1024.44	2023-12-06	primaryAccount		ACH Debit - ACH CPPWDRAWAL AMER ELECT PWR - DOS BANDIDOS LLC	2	15	\N
6938	219.44	2023-12-06	primaryAccount		ACH Debit - ACH TULSA UTIL CITY OF TULSA - ESTILITA VILLAFANE	2	338	\N
6939	85.44	2023-12-06	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN OKLAHOMANATURALG - 800-664-5463 OK REF# 56342	2	17	\N
6940	63.75	2023-12-06	primaryAccount		POS Transaction DDA - D/C TRN IN *BETTER VIEW - 918-8036210 OK REF# 62834	2	284	\N
6941	1.00	2023-12-05	primaryAccount		ATM Service Charge - ATM D/F AMZN Mktp US - Amzn.com/bill WA REF# 298734	2	112	\N
6942	25.00	2023-12-05	primaryAccount	111169	OD ITEM FEE -  -	2	55	\N
6944	1480.95	2023-12-05	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6945	150.00	2023-12-05	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 25235	2	144	\N
6946	120.74	2023-12-05	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*6R1 - Amzn.com/bill WA REF# 30904	2	112	\N
6947	20.00	2023-12-04	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6948	20.00	2023-12-04	primaryAccount		Wire Transfer Fee -  -	2	55	\N
6949	25.00	2023-12-04	primaryAccount	111184	OD ITEM FEE -  -	2	55	\N
6964	1857.29	2023-12-04	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
6965	1174.47	2023-12-04	primaryAccount		ACH Debit - ACH MTOT DISC  BANKCARD - DOS BANDIDOS BA	2	187	\N
6966	221.56	2023-12-04	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
6967	80.00	2023-12-04	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 6705126	2	131	\N
6968	87.78	2023-12-04	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*I13 - Amzn.com/bill WA REF# 17624	2	112	\N
6970	3793.00	2023-12-04	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - LAW BROS LLC	2	136	\N
6971	650.00	2023-12-04	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6972	650.00	2023-12-04	primaryAccount		Wire Transfer Debit - Wire Transfer Debit - XIMENA MARTINEZ	2	216	\N
6973	25.00	2023-12-12	primaryAccount		OD ITEM FEE -  -	2	55	\N
6974	4000.00	2023-12-12	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
6950	367.40	2023-12-04	primaryAccount	111184	CHECK -  -	2	350	\N
6952	329.14	2023-12-04	primaryAccount	111181	CHECK -  -	2	257	\N
6951	731.33	2023-12-04	primaryAccount	111182	CHECK -  -	2	321	\N
6953	332.91	2023-12-04	primaryAccount	111180	CHECK -  -	2	269	\N
6954	1087.96	2023-12-04	primaryAccount	111179	CHECK -  -	2	279	\N
6955	504.68	2023-12-04	primaryAccount	111178	CHECK -  -	2	113	\N
6956	289.70	2023-12-04	primaryAccount	111177	CHECK -  -	2	349	\N
6958	232.73	2023-12-04	primaryAccount	111174	CHECK -  -	2	353	\N
6959	471.21	2023-12-04	primaryAccount	111173	CHECK -  -	2	333	\N
6930	91.00	2023-12-08	primaryAccount	252	CHECK -  - algo rodriguez	2	100	\N
6961	558.86	2023-12-04	primaryAccount	111170	CHECK -  -	2	345	\N
6962	16.30	2023-12-04	primaryAccount	111132	CHECK -  -	2	270	\N
6957	241.17	2023-12-04	primaryAccount	111175	CHECK -  - Guillermo Lopez	2	355	\N
6963	36.10	2023-12-04	primaryAccount	111116	CHECK -  -	2	270	\N
6960	106.79	2023-12-04	primaryAccount	111171	CHECK -  - Rosa Ayala	2	356	\N
6943	349.64	2023-12-05	primaryAccount	111169	CHECK -  -	2	234	\N
6929	250.00	2023-12-11	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6975	100.00	2023-12-11	cash			2	44	17
6926	1000.00	2023-12-11	primaryAccount	253	CHECK -  -	2	62	\N
6976	6.00	2023-12-29	expensesAccount		Account Service Charge -  -	2	55	\N
6977	11.00	2023-12-29	expensesAccount		Account Service Charge -  -	2	55	\N
6969	1000.00	2023-12-04	primaryAccount		COUNTER WITHDRAWAL -  - en cash log dice que entraron 300	2	100	\N
6980	2205.98	2023-12-22	primaryAccount		ACH Debit - ACH EFT PYMT   Farmers Ins Exc - f009321024	2	21	\N
6981	1169.62	2023-12-22	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6978	1098.97	2023-12-22	primaryAccount	2002	CHECK -  -	2	5	\N
7029	545.22	2023-12-26	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
7028	770.00	2023-12-26	primaryAccount	309	CHECK -  - MAX GARAGE	2	358	\N
6982	615.78	2023-12-22	primaryAccount		ACH Debit - ACH CORP PMT   PBG - G&amp;A OU - 2001108078 DOSBANDIDOS	2	66	\N
6983	204.30	2023-12-22	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
6986	237.80	2023-12-21	primaryAccount		ACH Debit - ACH EFT1221    LDF Sales &amp; Dis - DOS BANDIDOS BA	2	35	\N
6987	4.00	2023-12-20	primaryAccount		Account Service Fee - TEMPORARY CHECK CHARGE -	2	55	\N
6989	480.42	2023-12-20	primaryAccount		ACH Debit - ACH BANK DRAFT COX COMM TUL - DOSBANDIDOSBA	2	18	\N
6992	1106.16	2023-12-19	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
6999	1834.48	2023-12-18	primaryAccount		ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	2	90	\N
7000	252.84	2023-12-18	primaryAccount		ACH Debit - ACH SGWSOK     Jarboe Sales Co - DOS BANDIDOS - BA	2	34	\N
7001	228.45	2023-12-18	primaryAccount		ACH Debit - ACH VENDOR PAY US FOODSERVICE -	2	343	\N
7002	80.00	2023-12-18	primaryAccount		ACH Debit - ACH ORKIN PEST ORKIN - 1692950	2	131	\N
7003	5.00	2023-12-18	primaryAccount		ACH Debit - ACH CORP COLL  SWIPE IT 5153 - DOS BANDIDOS	2	340	\N
7004	150.00	2023-12-18	primaryAccount		POS Transaction DDA - D/C TRN IN *SCULPTURE HO - 405-7406759 OK REF# 57843	2	144	\N
7005	59.95	2023-12-18	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN JOINHOMEBASE.COM - HTTPSJOINHOME CA REF# 8759	2	348	\N
7006	59.95	2023-12-18	primaryAccount		POS RECURRING TRANSACTION DDA - D/C TRN JOINHOMEBASE.COM - HTTPSJOINHOME CA REF# 8058	2	348	\N
7008	3013.06	2023-12-18	primaryAccount		Transfer to Loan - Transfer to Loan - Acct No.        704221770	2	221	\N
7009	6.00	2023-12-29	primaryAccount		Account Service Charge -  -	2	55	\N
7010	25.00	2023-12-26	primaryAccount		OD ITEM FEE -  -	2	55	\N
7011	4500.00	2023-12-26	primaryAccount		ACH Debit - ACH ACH PMT    AMEX EPAYMENT - Carlos Lopez	2	124	\N
7012	25.00	2023-12-18	primaryAccount		OD ITEM FEE -  -	2	55	\N
7013	124.00	2023-12-18	primaryAccount		ACH Debit - ACH WEB PYMT   CARDMEMBER SERV - ***********0795	2	318	\N
6996	525.13	2023-12-18	primaryAccount	111193	CHECK -  -	2	113	\N
7020	200.00	2023-12-29	primaryAccount	from ba to expenses ba	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
7019	1000.00	2023-12-29	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
7026	486.86	2023-12-26	primaryAccount	111187	CHECK -  -	2	333	\N
6988	272.72	2023-12-20	primaryAccount	111192	CHECK -  -	2	349	\N
6995	1118.36	2023-12-18	primaryAccount	111194	CHECK -  -	2	279	\N
6985	1500.00	2023-12-21	primaryAccount	306	CHECK -  - Nicks Collisions	2	359	\N
6993	217.00	2023-12-19	primaryAccount		ACH Debit - ACH PAYMENT    SBA EIDL LOAN - CARLOS LOPEZ	2	346	\N
6994	367.40	2023-12-18	primaryAccount	111199	CHECK -  -	2	350	\N
7007	1000.00	2023-12-18	primaryAccount		COUNTER WITHDRAWAL -  -	2	100	\N
6997	39.75	2023-12-18	primaryAccount	111186	CHECK -  -	2	356	\N
6990	733.45	2023-12-19	primaryAccount	111197	CHECK -  -	2	321	\N
6984	1089.97	2023-12-21	primaryAccount	111198	CHECK -  -	2	177	\N
7014	6.00	2023-12-29	primaryAccount		Account Service Charge -  -	2	55	\N
6991	585.14	2023-12-19	primaryAccount	11185	CHECK -  -	2	345	\N
7016	722.27	2023-12-29	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
7017	93.90	2023-12-29	primaryAccount		ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken	2	25	\N
7018	32.14	2023-12-29	primaryAccount		POS Transaction DDA - D/C TRN AMZN Mktp US*XC5 - Amzn.com/bill WA REF# 14264	2	112	\N
7021	426.84	2023-12-28	primaryAccount		ACH Debit - ACH INS PMT    Farmers GWRP - CARLOS LOPEZ	2	21	\N
7022	892.15	2023-12-27	primaryAccount		ACH Debit - ACH INVOICES   SPFD GROCER CO - Dos Bandidos BA LLC	2	29	\N
7023	260.00	2023-12-27	primaryAccount		POS Transaction DDA - D/C TRN BROOKS GREASE SE - 918-836-1772 OK REF# 6278	2	23	\N
7024	62.86	2023-12-27	primaryAccount		POS Transaction DDA - D/C TRN AMAZON.COM*4G4IE - SEATTLE WA REF# 619535	2	26	\N
7015	882.45	2023-12-29	primaryAccount	111204	CHECK -  -	2	355	\N
7025	320.00	2023-12-27	primaryAccount	from ba to dt	CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -	2	179	\N
6998	189.00	2023-12-18	primaryAccount	251	CHECK -  -	2	100	\N
7030	168.07	2023-12-26	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 45089	2	22	\N
7031	106.52	2023-12-26	primaryAccount		POS Transaction DDA - D/C TRN JAVA DAVE'S COFF - 562-2932888 OK REF# 45117	2	22	\N
6979	1000.00	2023-12-22	primaryAccount	308	CHECK -  -	2	100	\N
7027	1436.80	2023-12-26	primaryAccount	2004	CHECK -  - grand cattle company	2	100	\N
\.


--
-- Data for Name: accounting_income; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_income (id, amount, date, initial_date, comments, restaurant_id, supplier_id) FROM stdin;
1	1510.19	2021-04-05	2021-05-02		1	69
2	1746.00	2021-04-05	2021-05-02		1	72
3	498.87	2021-04-05	2021-05-02		1	71
4	5641.41	2021-04-05	2021-05-02		1	70
5	37141.90	2021-04-05	2021-05-02		1	68
6	12840.93	2021-05-03	2021-05-09		1	68
7	10333.92	2021-05-10	2021-05-16		1	68
8	7750.93	2021-05-17	2021-05-23		1	68
9	8702.12	2021-05-24	2021-05-30		1	68
10	29873.74	2021-05-03	2021-05-09		2	68
11	23280.08	2021-05-10	2021-05-16		2	68
12	23554.06	2021-05-17	2021-05-23		2	68
13	21991.57	2021-05-24	2021-05-30		2	68
14	357.43	2021-05-03	2021-05-09		1	71
15	51.15	2021-05-10	2021-05-16		1	71
16	116.04	2021-05-17	2021-05-23		1	71
17	186.89	2021-05-24	2021-05-30		1	71
18	1682.15	2021-05-03	2021-05-09		1	70
19	1275.27	2021-05-10	2021-05-16		1	70
20	1264.98	2021-05-17	2021-05-23		1	70
21	1322.50	2021-05-24	2021-05-30		1	70
22	22576.75	2021-05-31	2021-06-06		2	68
23	9529.87	2021-05-31	2021-06-06		1	68
24	1693.74	2021-05-31	2021-06-06		1	70
25	294.71	2021-05-31	2021-06-06		1	71
26	22522.68	2021-06-13	2021-06-07		2	68
27	9993.48	2021-06-13	2021-06-07		1	68
28	1842.12	2021-06-13	2021-06-07		1	70
29	133.42	2021-06-13	2021-06-07		1	71
30	25213.50	2021-06-20	2021-06-14		2	68
31	8521.18	2021-06-20	2021-06-14		1	68
32	1659.32	2021-06-20	2021-06-14		1	70
33	33.03	2021-06-20	2021-06-14		1	71
34	23653.04	2021-06-27	2021-06-21		2	68
35	8896.44	2021-06-27	2021-06-21		1	68
36	1313.41	2021-06-27	2021-06-21		1	70
37	155.83	2021-06-27	2021-06-21		1	71
38	18716.25	2021-07-04	2021-06-28		2	68
39	8501.27	2021-07-04	2021-06-28		1	68
40	1249.27	2021-07-04	2021-06-28		1	70
41	154.99	2021-07-04	2021-06-28		1	71
42	23012.66	2021-07-11	2021-07-05		2	68
43	8650.33	2021-07-11	2021-07-05		1	68
44	1488.62	2021-07-11	2021-07-05		1	70
45	93.63	2021-07-11	2021-07-05		1	71
46	21268.65	2021-07-18	2021-07-12		2	68
47	7925.36	2021-07-18	2021-07-12		1	68
48	1165.82	2021-07-18	2021-07-12		1	70
49	134.70	2021-07-18	2021-07-12		1	71
50	21307.02	2021-07-25	2021-07-19		2	68
51	9205.49	2021-07-25	2021-07-19		1	68
52	1763.25	2021-07-25	2021-07-19		1	70
53	77.64	2021-07-25	2021-07-19		1	71
54	21009.83	2021-08-01	2021-07-26		2	68
55	8937.70	2021-08-01	2021-07-26		1	68
56	1315.00	2021-08-01	2021-07-26		1	70
57	255.02	2021-08-01	2021-07-26		1	71
58	21403.61	2021-08-08	2021-08-02		2	68
59	9436.99	2021-08-08	2021-08-02		1	68
60	1270.56	2021-08-08	2021-08-02		1	70
61	128.12	2021-08-08	2021-08-02		1	71
62	18487.69	2021-08-15	2021-08-09		2	68
63	8456.76	2021-08-15	2021-08-09		1	68
64	1675.03	2021-08-15	2021-08-09		1	70
65	154.29	2021-08-15	2021-08-09		1	71
66	18674.70	2021-08-22	2021-08-16		2	68
67	8385.54	2021-08-22	2021-08-16		1	68
68	1802.20	2021-08-22	2021-08-16		1	70
69	99.78	2021-08-22	2021-08-16		1	71
70	18880.05	2021-08-29	2021-08-23		2	68
71	7770.41	2021-08-29	2021-08-23		1	68
72	1184.05	2021-08-29	2021-08-23		1	70
73	126.91	2021-08-29	2021-08-23		1	71
74	15537.91	2021-09-05	2021-08-30		2	68
75	9579.06	2021-09-05	2021-08-30		1	68
76	1422.46	2021-09-05	2021-08-30		1	70
77	182.90	2021-09-05	2021-08-30		1	71
78	17333.91	2021-09-12	2021-09-06		2	68
79	9499.88	2021-09-12	2021-09-06		1	68
80	1302.23	2021-09-12	2021-09-06		1	70
81	0.00	2021-09-12	2021-09-06		1	71
82	19330.46	2021-09-19	2021-09-13		2	68
83	9046.86	2021-09-19	2021-09-13		1	68
84	1522.05	2021-09-19	2021-09-13		1	70
85	0.00	2021-09-19	2021-09-13		1	71
86	18494.83	2021-09-26	2021-09-20		2	68
87	8467.49	2021-09-26	2021-09-20		1	68
88	1372.71	2021-09-26	2021-09-20		1	70
89	0.00	2021-09-26	2021-09-20		1	71
90	19294.20	2021-10-03	2021-09-27		2	68
91	9116.46	2021-10-03	2021-09-27		1	68
92	1510.76	2021-10-03	2021-09-27		1	70
93	167.45	2021-10-03	2021-09-27		1	71
94	18434.20	2021-10-10	2021-10-04		2	68
95	8204.68	2021-10-10	2021-10-04		1	68
96	1706.56	2021-10-10	2021-10-04		1	70
97	192.56	2021-10-10	2021-10-04		1	71
98	18269.96	2021-10-17	2021-10-11		2	68
99	9034.90	2021-10-17	2021-10-11		1	68
100	1216.16	2021-10-17	2021-10-11		1	70
101	7884.60	2021-10-17	2021-10-11		1	71
102	17232.55	2021-10-24	2021-10-18		2	68
103	16872.41	2021-10-31	2021-10-25		2	68
104	14598.65	2021-11-07	2021-11-01		2	68
105	9288.76	2021-10-24	2021-10-18		1	68
106	8122.79	2021-10-31	2021-10-25		1	68
107	7727.74	2021-11-07	2021-11-01		1	68
108	10.15	2021-10-24	2021-10-18		1	71
109	97.66	2021-10-31	2021-10-25		1	71
110	82.79	2021-11-07	2021-11-01		1	71
111	2118.37	2021-10-24	2021-10-18		1	70
112	2274.54	2021-10-31	2021-10-25		1	70
113	2333.76	2021-11-07	2021-11-01		1	70
114	16239.75	2021-11-14	2021-11-08		2	68
115	16631.35	2021-11-21	2021-11-15		2	68
116	1815.98	2021-11-14	2021-11-08		1	70
117	1878.25	2021-11-21	2021-11-15		1	70
118	211.40	2021-11-14	2021-11-08		1	71
119	172.23	2021-11-21	2021-11-15		1	71
120	7893.62	2021-11-14	2021-11-08		1	68
121	7018.70	2021-11-21	2021-11-15		1	68
122	14537.63	2021-11-28	2021-11-22		2	68
123	16583.34	2021-12-05	2021-11-29		2	68
124	5781.89	2021-11-28	2021-11-22		1	68
125	7015.13	2021-12-05	2021-11-29		1	68
126	1716.36	2021-11-28	2021-11-22		1	70
127	1428.85	2021-12-05	2021-11-29		1	70
128	126.95	2021-11-28	2021-11-22		1	71
129	247.86	2021-12-05	2021-11-29		1	71
130	19274.01	2021-12-12	2021-12-06		2	68
131	20891.63	2021-12-19	2021-12-13		2	68
132	16867.24	2021-12-26	2021-12-20		2	68
133	9159.88	2021-12-12	2021-12-06		1	68
134	5512.54	2021-12-19	2021-12-13		1	68
135	3075.27	2021-12-26	2021-12-20		2	68
136	1510.55	2021-12-12	2021-12-06		1	70
137	2025.00	2021-12-19	2021-12-13		1	70
138	635.41	2021-12-26	2021-12-20		1	70
139	14454.79	2022-01-02	2021-12-27		2	68
140	10444.52	2022-01-09	2022-01-03		2	68
141	12985.34	2022-01-16	2022-01-10		2	68
142	16756.41	2022-01-23	2022-01-17		2	68
143	15231.66	2022-01-30	2022-01-24		2	68
144	12730.09	2022-02-06	2022-01-31		2	68
145	18505.81	2022-02-13	2022-02-07		2	68
146	17964.10	2022-02-20	2022-02-14		2	68
147	16750.40	2022-02-27	2022-02-21		2	68
148	15955.36	2022-03-06	2022-02-28		2	68
149	13878.28	2022-03-13	2022-03-07		2	68
150	18469.18	2022-03-20	2022-03-14		2	68
151	16629.52	2022-03-27	2022-03-21		2	68
152	16068.18	2022-04-03	2022-03-28		2	68
153	18002.81	2022-04-10	2022-04-04		2	68
154	12946.51	2022-04-17	2022-04-11		2	68
186	16340.25	2022-04-24	2022-04-18		2	68
187	15510.65	2022-05-01	2022-04-25		2	68
188	24100.53	2022-05-08	2022-05-02		2	68
189	17857.61	2022-05-15	2022-05-09		2	68
190	17140.12	2022-05-22	2022-05-16		2	68
191	15248.09	2022-05-29	2022-05-23		2	68
192	16016.03	2022-06-05	2022-05-30		2	68
193	17546.15	2022-06-12	2022-06-06		2	68
194	18643.96	2022-06-19	2022-06-13		2	68
195	18735.89	2022-06-26	2022-06-20		2	68
196	16526.92	2022-07-03	2022-06-27		2	68
197	17749.47	2022-07-10	2022-07-04		2	68
198	19891.27	2022-07-17	2022-07-11		2	68
199	22437.31	2022-07-24	2022-07-18		2	68
200	16535.07	2022-07-31	2022-07-25		2	68
201	17345.46	2022-08-07	2022-08-01		2	68
202	15963.54	2022-08-14	2022-08-08		2	68
203	16071.19	2022-08-21	2022-08-15		2	68
204	16177.44	2022-08-28	2022-08-22		2	68
205	16013.72	2022-09-04	2022-08-29		2	68
206	15389.70	2022-09-11	2022-09-05		2	68
207	14046.64	2022-09-18	2022-09-12		2	68
208	14058.31	2022-09-25	2022-09-19		2	68
209	18302.91	2022-10-02	2022-09-26		2	68
210	15483.77	2022-10-09	2022-10-03		2	68
211	14165.34	2022-10-16	2022-10-10		2	68
212	12441.41	2022-10-23	2022-10-17		2	68
213	14803.49	2022-10-30	2022-10-24		2	68
214	14593.37	2022-11-06	2022-10-31		2	68
215	10764.86	2022-11-13	2022-11-07		2	68
216	15552.63	2022-11-20	2022-11-14		2	68
217	13802.21	2022-11-27	2022-11-21		2	68
218	13652.87	2022-11-27	2022-11-21		2	68
219	16976.77	2022-12-18	2022-12-12		2	68
220	15794.54	2022-12-11	2022-12-05		2	68
221	9645.60	2022-12-25	2022-12-19		2	68
222	14110.08	2023-01-01	2022-12-26		2	68
223	13498.72	2023-01-08	2023-01-02		2	68
224	12658.75	2023-01-15	2023-01-09		2	68
225	12487.83	2023-01-22	2023-01-16		2	68
226	11571.99	2023-01-29	2023-01-23		2	68
227	11571.99	2023-02-05	2023-01-30		2	68
228	12542.01	2023-02-12	2023-02-06		2	68
229	14872.57	2023-02-19	2023-02-13		2	68
230	14985.46	2023-02-26	2023-02-20		2	68
231	14978.50	2023-03-05	2023-02-27		2	68
232	15280.52	2023-03-12	2023-03-06		2	68
233	15527.71	2023-03-19	2023-03-13		2	68
234	13769.15	2023-03-26	2023-03-20		2	68
235	16040.86	2023-04-02	2023-03-27		2	68
236	15012.41	2023-04-09	2023-04-03		2	68
237	15755.96	2023-04-16	2023-04-10		2	68
238	15235.18	2023-04-23	2023-04-17		2	68
239	15955.54	2023-04-30	2023-04-24		2	68
240	17154.20	2023-05-07	2023-05-01		2	68
241	19493.42	2023-05-14	2023-05-08		2	68
242	14305.66	2023-05-21	2023-05-15		2	68
243	13920.48	2023-05-28	2023-05-22		2	68
244	16099.77	2023-06-04	2023-05-29		2	68
245	15189.75	2023-06-11	2023-06-05		2	68
246	17115.90	2023-06-18	2023-06-12		2	68
247	17053.35	2023-06-25	2023-06-19		2	68
248	16223.18	2023-07-02	2023-06-26		2	68
249	13659.30	2023-07-09	2023-07-03		2	68
250	15482.98	2023-07-16	2023-07-10		2	68
251	15065.53	2023-07-23	2023-07-17		2	68
252	15329.94	2023-07-30	2023-07-24		2	68
253	12401.02	2023-08-06	2023-07-31		2	68
254	14894.26	2023-08-13	2023-08-07		2	68
255	16358.90	2023-08-20	2023-08-14		2	68
256	16550.07	2023-08-27	2023-08-21		2	68
257	12575.95	2023-09-03	2023-08-28		2	68
258	15024.79	2023-09-10	2023-09-04		2	68
259	14015.48	2023-09-17	2023-09-11		2	68
260	15238.87	2023-09-24	2023-09-18		2	68
261	15668.41	2023-10-01	2023-09-25		2	68
262	12197.49	2023-11-08	2023-10-02		2	68
263	15285.03	2023-10-15	2023-10-09		2	68
264	12816.03	2023-10-22	2023-10-16		2	68
265	11112.86	2023-10-29	2023-10-23		2	68
266	11528.51	2023-11-05	2023-10-30		2	68
267	11487.06	2023-11-12	2023-11-06		2	68
268	14090.54	2023-11-19	2023-11-13		2	68
269	12166.15	2023-11-26	2023-11-20		2	68
270	10848.79	2023-12-03	2023-11-27		2	68
271	16705.88	2023-12-10	2023-12-04		2	68
272	14971.16	2023-12-17	2023-12-11		2	68
273	13667.58	2023-12-24	2023-12-18		2	68
274	13524.68	2023-12-31	2023-12-25		2	68
\.


--
-- Data for Name: accounting_metric; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_metric (id, amount, initial_date, date, comments, restaurant_id, supplier_id) FROM stdin;
1	8071.94	2021-04-05	2021-05-02		1	75
2	49370.49	2021-04-05	2021-05-02		1	76
3	1189.00	2021-04-05	2021-05-02		1	77
4	4626.10	2021-04-05	2021-05-02		1	74
5	2335.87	2021-05-03	2021-05-09		1	74
6	2379.89	2021-05-03	2021-05-09		1	75
7	16567.22	2021-05-03	2021-05-09		1	76
8	383.00	2021-05-03	2021-05-09		1	77
9	1618.28	2021-05-10	2021-05-16		1	74
10	2537.82	2021-05-10	2021-05-16		1	75
11	12870.33	2021-05-10	2021-05-16		1	76
12	295.00	2021-05-10	2021-05-16		1	77
13	1206.96	2021-05-17	2021-05-23		1	74
14	2684.88	2021-05-17	2021-05-23		1	75
15	10404.55	2021-05-17	2021-05-23		1	76
16	251.00	2021-05-17	2021-05-23		1	77
17	1410.11	2021-05-24	2021-05-30		1	74
18	2991.33	2021-05-24	2021-05-30		1	75
19	12056.93	2021-05-24	2021-05-30		1	76
20	269.00	2021-05-24	2021-05-30		1	77
21	8046.26	2021-05-03	2021-05-09		2	74
22	6054.27	2021-05-03	2021-05-09		2	75
23	31352.64	2021-05-03	2021-05-09		2	76
24	735.00	2021-05-03	2021-05-09		2	77
25	6435.38	2021-05-10	2021-05-16		2	74
26	4964.62	2021-05-10	2021-05-16		2	75
27	24136.29	2021-05-10	2021-05-16		2	76
28	592.00	2021-05-10	2021-05-16		2	77
29	5932.08	2021-05-17	2021-05-23		2	74
30	4772.93	2021-05-17	2021-05-23		2	75
31	24381.08	2021-05-17	2021-05-23		2	76
32	580.00	2021-05-17	2021-05-23		2	77
33	5736.19	2021-05-24	2021-05-30		2	74
34	4482.31	2021-05-24	2021-05-30		2	75
35	22648.32	2021-05-24	2021-05-30		2	76
36	563.00	2021-05-24	2021-05-30		2	77
37	6080.04	2021-05-31	2021-06-06		2	74
38	3857.98	2021-05-31	2021-06-06		2	75
39	23287.62	2021-05-31	2021-06-06		2	76
40	594.00	2021-05-31	2021-06-06		2	77
41	1066.33	2021-05-31	2021-06-06		1	74
42	3512.52	2021-05-31	2021-06-06		1	75
43	13242.29	2021-05-31	2021-06-06		1	76
44	340.00	2021-05-31	2021-06-06		1	77
45	6137.09	2021-06-07	2021-06-13		2	74
46	3751.14	2021-06-07	2021-06-13		2	75
47	23522.68	2021-06-07	2021-06-13		2	76
48	648.00	2021-06-07	2021-06-13		2	77
49	1392.96	2021-06-07	2021-06-13		1	74
50	3205.58	2021-06-07	2021-06-13		1	75
51	13715.16	2021-06-07	2021-06-13		1	76
52	317.00	2021-06-07	2021-06-13		1	77
53	6306.47	2021-06-14	2021-06-20		2	74
54	4571.56	2021-06-14	2021-06-20		2	75
55	26362.61	2021-06-14	2021-06-20		2	76
56	686.00	2021-06-14	2021-06-20		2	77
57	1260.86	2021-06-14	2021-06-20		1	74
58	3833.00	2021-06-14	2021-06-20		1	75
59	12214.80	2021-06-14	2021-06-20		1	76
60	291.00	2021-06-14	2021-06-20		1	77
61	5835.83	2021-06-21	2021-06-27		2	74
62	4771.80	2021-06-21	2021-06-27		2	75
63	24806.81	2021-06-21	2021-06-27		2	76
64	636.00	2021-06-21	2021-06-27		2	77
65	1023.49	2021-06-21	2021-06-27		1	74
66	3467.82	2021-06-21	2021-06-27		1	75
67	11910.77	2021-06-21	2021-06-27		1	76
68	286.00	2021-06-21	2021-06-27		1	77
69	5268.48	2021-06-28	2021-07-04		2	74
70	4463.64	2021-06-28	2021-07-04		2	75
71	19628.88	2021-06-28	2021-07-04		2	76
72	514.00	2021-06-28	2021-07-04		2	77
73	1256.51	2021-06-28	2021-07-04		1	74
74	2224.62	2021-06-28	2021-07-04		1	75
75	11687.12	2021-06-28	2021-07-04		1	76
76	299.00	2021-06-28	2021-07-04		1	77
77	5737.66	2021-07-05	2021-07-11		2	74
78	4878.37	2021-07-05	2021-07-11		2	75
79	24254.70	2021-07-05	2021-07-11		2	76
80	607.00	2021-07-05	2021-07-11		2	77
81	1139.01	2021-07-05	2021-07-11		1	74
82	2702.08	2021-07-05	2021-07-11		1	75
83	11850.27	2021-07-05	2021-07-11		1	76
84	297.00	2021-07-05	2021-07-11		1	77
85	5550.39	2021-07-12	2021-07-18		2	74
86	3566.15	2021-07-12	2021-07-18		2	75
87	21828.90	2021-07-12	2021-07-18		2	76
88	588.00	2021-07-12	2021-07-18		2	77
89	881.43	2021-07-12	2021-07-18		1	74
90	2748.65	2021-07-12	2021-07-18		1	75
91	10769.80	2021-07-12	2021-07-18		1	76
92	285.00	2021-07-12	2021-07-18		1	77
93	5521.52	2021-07-19	2021-07-25		2	74
94	4005.86	2021-07-19	2021-07-25		2	75
95	22059.09	2021-07-19	2021-07-25		2	76
96	590.00	2021-07-19	2021-07-25		2	77
97	1396.30	2021-07-19	2021-07-25		1	74
98	2514.64	2021-07-19	2021-07-25		1	75
99	12888.15	2021-07-19	2021-07-25		1	76
100	322.00	2021-07-19	2021-07-25		1	77
101	5282.56	2021-07-26	2021-08-01		2	74
102	3798.91	2021-07-26	2021-08-01		2	75
103	21828.33	2021-07-26	2021-08-01		2	76
104	570.00	2021-07-26	2021-08-01		2	77
105	1017.09	2021-07-26	2021-08-01		1	74
106	3102.41	2021-07-26	2021-08-01		1	75
107	12147.74	2021-07-26	2021-08-01		1	76
108	304.00	2021-07-26	2021-08-01		1	77
109	5715.44	2021-08-02	2021-08-08		2	74
110	4263.52	2021-08-02	2021-08-08		2	75
111	22463.30	2021-08-02	2021-08-08		2	76
112	603.00	2021-08-02	2021-08-08		2	77
113	1114.63	2021-08-02	2021-08-08		1	74
114	3061.34	2021-08-02	2021-08-08		1	75
115	12379.44	2021-08-02	2021-08-08		1	76
116	331.00	2021-08-02	2021-08-08		1	77
117	4962.74	2021-08-09	2021-08-15		2	74
118	3867.19	2021-08-09	2021-08-15		2	75
119	19862.87	2021-08-09	2021-08-15		2	76
120	548.00	2021-08-09	2021-08-15		2	77
121	1090.66	2021-08-09	2021-08-15		1	74
122	2307.10	2021-08-09	2021-08-15		1	75
123	11648.76	2021-08-09	2021-08-15		1	76
124	301.00	2021-08-09	2021-08-15		1	77
125	5498.70	2021-08-16	2021-08-22		2	74
126	3230.06	2021-08-16	2021-08-22		2	75
127	20152.65	2021-08-16	2021-08-22		2	76
128	510.00	2021-08-16	2021-08-22		2	77
129	1100.71	2021-08-16	2021-08-22		1	74
130	2432.17	2021-08-16	2021-08-22		1	75
131	12046.66	2021-08-16	2021-08-22		1	76
132	297.00	2021-08-16	2021-08-22		1	77
133	5416.39	2021-08-23	2021-08-29		2	74
134	3562.54	2021-08-23	2021-08-29		2	75
135	20580.76	2021-08-23	2021-08-29		2	76
136	533.00	2021-08-23	2021-08-29		2	77
137	953.31	2021-08-23	2021-08-29		1	74
138	1840.72	2021-08-23	2021-08-29		1	75
139	10551.11	2021-08-23	2021-08-29		1	76
140	287.00	2021-08-23	2021-08-29		1	77
141	4045.11	2021-08-30	2021-09-05		2	74
142	3885.97	2021-08-30	2021-09-05		2	75
143	17360.76	2021-08-30	2021-09-05		2	76
144	498.00	2021-08-30	2021-09-05		2	77
145	1234.10	2021-08-30	2021-09-05		1	74
146	2313.32	2021-08-30	2021-09-05		1	75
147	12872.63	2021-08-30	2021-09-05		1	76
148	332.00	2021-08-30	2021-09-05		1	77
149	4194.67	2021-09-06	2021-09-12		2	74
150	3247.11	2021-09-06	2021-09-12		2	75
151	18651.25	2021-09-06	2021-09-12		2	76
152	485.00	2021-09-06	2021-09-12		2	77
153	1162.32	2021-09-06	2021-09-12		1	74
154	2621.32	2021-09-06	2021-09-12		1	75
155	12398.71	2021-09-06	2021-09-12		1	76
156	316.00	2021-09-06	2021-09-12		1	77
157	5592.62	2021-09-13	2021-09-19		2	74
158	3627.97	2021-09-13	2021-09-19		2	75
159	20927.77	2021-09-13	2021-09-19		2	76
160	544.00	2021-09-13	2021-09-19		2	77
161	1196.28	2021-09-13	2021-09-19		1	74
162	2275.96	2021-09-13	2021-09-19		1	75
163	12307.74	2021-09-13	2021-09-19		1	76
164	318.00	2021-09-13	2021-09-19		1	77
165	5286.22	2021-09-20	2021-09-26		2	74
166	3757.75	2021-09-20	2021-09-26		2	75
167	19434.31	2021-09-20	2021-09-26		2	76
168	546.00	2021-09-20	2021-09-26		2	77
169	711.00	2021-09-20	2021-09-26		1	74
170	2633.11	2021-09-20	2021-09-26		1	75
171	11478.69	2021-09-20	2021-09-26		1	76
172	318.00	2021-09-20	2021-09-26		1	77
173	4838.55	2021-09-27	2021-10-03		2	74
174	3677.86	2021-09-27	2021-10-03		2	75
175	20398.91	2021-09-27	2021-10-03		2	76
176	570.00	2021-09-27	2021-10-03		2	77
177	950.93	2021-09-27	2021-10-03		1	74
178	2133.44	2021-09-27	2021-10-03		1	75
179	12176.25	2021-09-27	2021-10-03		1	76
180	329.00	2021-09-27	2021-10-03		1	77
181	4239.45	2021-10-04	2021-10-10		2	74
182	3355.49	2021-10-04	2021-10-10		2	75
183	19373.70	2021-10-04	2021-10-10		2	76
184	542.00	2021-10-04	2021-10-10		2	77
185	987.70	2021-10-04	2021-10-10		1	74
186	2170.15	2021-10-04	2021-10-10		1	75
187	11801.25	2021-10-04	2021-10-10		1	76
188	310.00	2021-10-04	2021-10-10		1	77
189	4048.17	2021-10-11	2021-10-17		2	74
190	3330.07	2021-10-11	2021-10-17		2	75
191	19253.08	2021-10-11	2021-10-17		2	76
192	492.00	2021-10-11	2021-10-17		2	77
193	1002.73	2021-10-11	2021-10-17		1	74
194	2301.29	2021-10-11	2021-10-17		1	75
195	11818.07	2021-10-11	2021-10-17		1	76
196	317.00	2021-10-11	2021-10-17		1	77
197	18014.55	2021-10-18	2021-10-24		2	76
198	482.00	2021-10-18	2021-10-24		2	77
199	3394.55	2021-10-18	2021-10-24		2	75
200	4142.66	2021-10-18	2021-10-24		2	74
201	4043.76	2021-10-25	2021-10-31		2	74
202	17779.90	2021-10-25	2021-10-31		2	76
203	3401.83	2021-10-25	2021-10-31		2	75
204	475.00	2021-10-25	2021-10-31		2	77
205	15496.11	2021-11-01	2021-11-07		2	76
206	3505.10	2021-11-01	2021-11-07		2	75
207	432.00	2021-11-01	2021-11-07		2	77
208	3939.04	2021-11-01	2021-11-07		2	74
209	12106.56	2021-10-18	2021-10-24		1	76
210	311.00	2021-10-18	2021-10-24		1	77
211	1041.57	2021-10-18	2021-10-24		1	74
212	2163.23	2021-10-18	2021-10-24		1	75
213	2667.27	2021-10-25	2021-10-31		1	75
214	997.00	2021-10-25	2021-10-31		1	74
215	11074.63	2021-10-25	2021-10-31		1	76
216	288.00	2021-10-25	2021-10-31		1	77
217	11196.75	2021-11-01	2021-11-07		1	76
218	300.00	2021-11-01	2021-11-07		1	77
219	1024.37	2021-11-01	2021-11-07		1	74
220	3406.55	2021-11-01	2021-11-07		1	75
221	17302.53	2021-11-08	2021-11-14		2	76
222	2467.06	2021-11-08	2021-11-14		2	75
223	471.00	2021-11-08	2021-11-14		2	77
224	4328.72	2021-11-08	2021-11-14		2	74
225	4575.55	2021-11-15	2021-11-21		2	74
226	17468.79	2021-11-15	2021-11-21		2	76
227	2100.09	2021-11-15	2021-11-21		2	75
228	451.00	2021-11-15	2021-11-21		2	77
229	10715.09	2021-11-08	2021-11-14		1	76
230	2234.05	2021-11-08	2021-11-14		1	75
231	903.49	2021-11-08	2021-11-14		1	74
232	285.00	2021-11-08	2021-11-14		1	77
233	9836.96	2021-11-15	2021-11-21		1	76
234	2883.21	2021-11-15	2021-11-21		1	75
235	941.73	2021-11-15	2021-11-21		1	74
236	941.73	2021-11-15	2021-11-21		1	74
237	252.00	2021-11-15	2021-11-21		1	77
238	15290.41	2021-11-22	2021-11-28		2	76
239	2572.48	2021-11-22	2021-11-28		2	75
240	390.00	2021-11-22	2021-11-28		2	77
241	3407.08	2021-11-22	2021-11-28		2	74
242	4009.75	2021-11-29	2021-12-05		2	74
243	17663.66	2021-11-29	2021-12-05		2	76
244	3025.77	2021-11-29	2021-12-05		2	75
245	472.00	2021-11-29	2021-12-05		2	77
246	7999.61	2021-11-22	2021-11-28		1	76
247	2121.11	2021-11-22	2021-11-28		1	75
248	639.46	2021-11-22	2021-11-28		1	74
250	210.00	2021-11-22	2021-11-28		1	77
251	9901.06	2021-11-29	2021-12-05		1	76
252	2638.41	2021-11-29	2021-12-05		1	75
253	774.48	2021-11-29	2021-12-05		1	74
254	272.00	2021-11-29	2021-12-05		1	77
255	20003.72	2021-12-06	2021-12-12		2	76
256	21900.14	2021-12-06	2021-12-12		2	76
257	17934.60	2021-12-06	2021-12-12		2	76
258	3132.83	2021-12-06	2021-12-12		2	75
259	3059.25	2021-12-06	2021-12-12		2	75
260	3084.25	2021-12-06	2021-12-12		2	75
261	511.00	2021-12-06	2021-12-12		2	77
262	528.00	2021-12-13	2021-12-19		2	77
263	420.00	2021-12-20	2021-12-26		2	77
264	5025.00	2021-12-06	2021-12-12		2	74
265	4951.41	2021-12-13	2021-12-19		2	74
266	3870.17	2021-12-20	2021-12-26		2	74
267	12301.58	2021-12-06	2021-12-12		1	76
268	3297.77	2021-12-06	2021-12-12		1	75
269	702.23	2021-12-06	2021-12-12		1	74
270	249.00	2021-12-06	2021-12-12		1	77
271	8693.66	2021-12-13	2021-12-19		1	76
272	3471.88	2021-12-13	2021-12-19		1	75
273	539.89	2021-12-13	2021-12-19		1	74
274	250.00	2021-12-13	2021-12-19		1	77
275	4068.80	2021-12-20	2021-12-26		1	76
276	717.48	2021-12-20	2021-12-26		1	75
277	312.73	2021-12-20	2021-12-26		1	74
278	114.00	2021-12-20	2021-12-26		1	77
279	15763.84	2021-12-27	2022-01-02		2	76
280	2114.98	2021-12-27	2022-01-02		2	75
281	3671.09	2021-12-27	2022-01-02		2	74
282	406.00	2021-12-27	2022-01-02		2	77
283	12081.76	2022-01-03	2022-01-09		2	76
284	2156.20	2022-01-03	2022-01-09		2	75
285	2624.37	2022-01-03	2022-01-09		2	74
286	328.00	2022-01-03	2022-01-09		2	77
287	14435.87	2022-01-10	2022-01-16		2	76
288	2254.74	2022-01-10	2022-01-16		2	75
289	3337.70	2022-01-10	2022-01-16		2	74
290	398.00	2022-01-10	2022-01-16		2	77
291	18458.71	2022-01-17	2022-01-23		2	76
292	2330.97	2022-01-17	2022-01-23		2	75
293	4344.73	2022-01-17	2022-01-23		2	74
294	472.00	2022-01-17	2022-01-23		2	77
295	17339.71	2022-01-24	2022-01-30		2	76
296	2491.54	2022-01-24	2022-01-30		2	75
297	484.00	2022-01-24	2022-01-30		2	77
298	3803.17	2022-01-24	2022-01-30		2	74
299	14723.06	2022-01-31	2022-02-06		2	76
300	1958.74	2022-01-31	2022-02-06		2	75
301	3235.96	2022-01-31	2022-02-06		2	74
302	387.00	2022-01-31	2022-02-06		2	77
303	20031.15	2022-02-07	2022-02-13		2	76
304	2414.55	2022-02-07	2022-02-13		2	75
305	4855.19	2022-02-07	2022-02-13		2	74
306	497.00	2022-02-07	2022-02-13		2	77
307	19939.66	2022-02-14	2022-02-20		2	76
308	3062.27	2022-02-14	2022-02-20		2	75
309	512.00	2022-02-14	2022-03-20		2	77
310	5103.00	2022-02-14	2022-02-20		2	74
311	18560.24	2022-02-21	2022-02-27		2	76
312	2795.03	2022-02-21	2022-02-27		2	75
313	466.00	2022-02-21	2022-02-27		2	77
314	4429.69	2022-02-21	2022-02-27		2	74
315	17256.90	2022-02-28	2022-03-06		2	76
316	3058.65	2022-02-28	2022-03-06		2	75
317	3801.06	2022-02-28	2022-03-06		2	74
318	467.00	2022-02-28	2022-03-06		2	77
321	4108.30	2022-03-07	2022-03-13		2	74
322	403.00	2022-03-07	2022-03-13		2	77
320	3157.49	2022-03-07	2022-03-13		2	75
319	15084.04	2022-03-07	2022-03-13		2	76
323	4633.11	2022-03-14	2022-03-20		2	74
324	3282.75	2022-03-14	2022-03-20		2	75
325	20053.20	2022-03-14	2022-03-20		2	76
326	555.00	2022-03-14	2022-03-20		2	77
327	4462.87	2022-03-21	2022-03-27		2	74
328	3334.58	2022-03-21	2022-03-27		2	75
329	18356.16	2022-03-21	2022-03-27		2	76
330	487.00	2022-03-21	2022-03-27		2	77
331	4269.94	2022-03-28	2022-04-03		2	74
332	3169.42	2022-03-28	2022-04-03		2	75
333	17598.68	2022-03-28	2022-04-03		2	76
334	471.00	2022-03-28	2022-04-03		2	77
335	4724.86	2022-04-04	2022-04-10		2	74
336	3361.03	2022-04-04	2022-04-10		2	75
337	19581.59	2022-04-04	2022-04-10		2	76
338	513.00	2022-04-04	2022-04-10		2	77
339	3160.13	2022-04-11	2022-04-17		2	74
340	2623.40	2022-04-11	2022-04-17		2	75
341	14588.39	2022-04-11	2022-04-17		2	76
342	393.00	2022-04-11	2022-04-17		2	77
368	4477.93	2022-04-18	2022-04-24		2	74
369	3147.72	2022-04-18	2022-04-24		2	75
370	17847.33	2022-04-18	2022-04-24		2	76
371	451.00	2022-04-18	2022-04-24		2	77
372	4041.32	2022-04-25	2022-05-01		2	74
373	3234.04	2022-04-25	2022-05-01		2	75
374	16659.73	2022-04-25	2022-05-01		2	76
375	416.00	2022-04-25	2022-05-01		2	77
376	6875.78	2022-05-02	2022-05-08		2	74
377	3114.05	2022-05-02	2022-05-08		2	75
378	26518.94	2022-05-02	2022-05-08		2	76
379	632.00	2022-05-02	2022-05-08		2	77
380	4159.96	2022-05-09	2022-05-15		2	74
381	2241.81	2022-05-09	2022-05-15		2	75
382	19141.75	2022-05-09	2022-05-15		2	76
383	485.00	2022-05-09	2022-05-15		2	77
384	4515.98	2022-05-16	2022-05-22		2	74
385	2133.28	2022-05-16	2022-05-22		2	75
386	18933.60	2022-05-16	2022-05-22		2	76
387	487.00	2022-05-16	2022-05-22		2	77
388	3831.40	2022-05-23	2022-05-29		2	74
389	2769.15	2022-05-23	2022-05-29		2	75
390	16601.55	2022-05-23	2022-05-29		2	76
391	431.00	2022-05-23	2022-05-29		2	77
392	4199.84	2022-05-30	2022-06-05		2	74
393	2895.66	2022-05-30	2022-06-05		2	75
394	16938.25	2022-05-30	2022-06-05		2	76
395	444.00	2022-05-30	2022-06-05		2	77
396	4791.87	2022-06-06	2022-06-12		2	74
397	2915.84	2022-06-06	2022-06-12		2	75
398	18380.18	2022-06-06	2022-06-12		2	76
399	471.00	2022-06-06	2022-06-12		2	77
400	3650.72	2022-06-13	2022-06-19		2	74
401	3085.43	2022-06-13	2022-06-19		2	75
402	20339.51	2022-06-13	2022-06-19		2	76
403	566.00	2022-06-13	2022-06-19		2	77
404	4394.76	2022-06-20	2022-06-26		2	74
405	2589.87	2022-06-20	2022-06-26		2	75
406	20086.94	2022-06-20	2022-06-26		2	76
407	531.00	2022-06-20	2022-06-26		2	77
408	3913.44	2022-06-27	2022-07-03		2	74
409	3201.03	2022-06-27	2022-07-03		2	75
410	18052.88	2022-06-27	2022-07-03		2	76
411	480.00	2022-06-27	2022-07-03		2	77
412	4688.04	2022-07-04	2022-07-10		2	74
413	2826.02	2022-07-04	2022-07-10		2	75
414	18885.77	2022-07-04	2022-07-10		2	76
415	457.00	2022-07-04	2022-07-10		2	77
416	4195.18	2022-07-11	2022-07-17		2	74
417	2897.56	2022-07-11	2022-07-17		2	75
418	21160.06	2022-07-11	2022-07-17		2	76
419	545.00	2022-07-11	2022-07-17		2	77
420	5772.26	2022-07-18	2022-07-24		2	74
421	2984.18	2022-07-18	2022-07-24		2	75
422	24309.38	2022-07-18	2022-07-24		2	76
423	616.00	2022-07-18	2022-07-24		2	77
424	3855.60	2022-07-25	2022-07-31		2	74
425	3246.14	2022-07-25	2022-07-31		2	75
426	17786.16	2022-07-25	2022-07-31		2	76
427	444.00	2022-07-25	2022-07-31		2	77
428	4214.94	2022-08-01	2022-08-07		2	74
429	2311.90	2022-08-01	2022-08-07		2	75
430	18811.46	2022-08-01	2022-08-07		2	76
431	485.00	2022-08-01	2022-08-07		2	77
432	3928.24	2022-08-08	2022-08-14		2	74
433	2831.24	2022-08-08	2022-08-14		2	75
434	17327.62	2022-08-08	2022-08-14		2	76
435	461.00	2022-08-08	2022-08-14		2	77
436	3653.61	2022-08-15	2022-08-21		2	74
437	2990.24	2022-08-15	2022-08-21		2	75
438	17438.47	2022-08-15	2022-08-21		2	76
439	478.00	2022-08-15	2022-08-21		2	77
440	3957.65	2022-08-22	2022-08-28		2	74
441	2843.16	2022-08-22	2022-08-28		2	75
442	17857.53	2022-08-22	2022-08-28		2	76
443	462.00	2022-08-22	2022-08-28		2	77
444	4160.90	2022-08-29	2022-09-04		2	74
445	2726.66	2022-08-29	2022-09-04		2	75
446	17754.92	2022-08-29	2022-09-04		2	76
447	462.00	2022-08-29	2022-09-04		2	77
448	3748.02	2022-09-05	2022-09-11		2	74
449	3383.42	2022-09-05	2022-09-11		2	75
450	17075.54	2022-09-05	2022-09-11		2	76
451	436.00	2022-09-05	2022-09-11		2	77
452	3315.60	2022-09-12	2022-09-18		2	74
453	3031.32	2022-09-12	2022-09-18		2	75
454	15822.65	2022-09-12	2022-09-18		2	76
455	441.00	2022-09-12	2022-09-18		2	77
456	3315.60	2022-09-19	2022-09-25		2	74
457	3468.50	2022-09-19	2022-09-25		2	75
458	15558.79	2022-09-19	2022-09-25		2	76
459	435.00	2022-09-19	2022-09-25		2	77
460	4467.08	2022-09-26	2022-10-02		2	74
461	3339.47	2022-09-26	2022-10-02		2	75
462	19846.10	2022-09-26	2022-10-02		2	76
463	524.00	2022-09-26	2022-10-02		2	77
464	3137.78	2022-10-03	2022-10-09		2	74
465	2977.93	2022-10-03	2022-10-09		2	75
466	16969.99	2022-10-03	2022-10-09		2	76
467	478.00	2022-10-03	2022-10-09		2	77
468	3278.99	2022-10-10	2022-10-16		2	74
469	3044.11	2022-10-10	2022-10-16		2	75
470	15613.63	2022-10-10	2022-10-16		2	76
471	402.00	2022-10-10	2022-10-16		2	77
472	2624.18	2022-10-17	2022-10-23		2	74
473	3001.46	2022-10-17	2022-10-23		2	75
474	14133.66	2022-10-17	2022-10-23		2	76
475	377.00	2022-10-17	2022-10-23		2	77
476	2776.57	2022-10-24	2022-10-30		2	74
477	2759.66	2022-10-24	2022-10-30		2	75
478	16286.25	2022-10-24	2022-10-30		2	76
479	461.00	2022-10-24	2022-10-30		2	77
480	3082.69	2022-10-31	2022-11-06		2	74
481	2969.89	2022-10-31	2022-11-06		2	75
482	16177.63	2022-10-31	2022-11-06		2	76
483	447.00	2022-10-31	2022-11-06		2	77
484	2034.51	2022-11-07	2022-11-13		2	74
485	2972.14	2022-11-07	2022-11-13		2	75
486	12208.39	2022-11-07	2022-11-13		2	76
487	357.00	2022-11-07	2022-11-13		2	77
488	3816.94	2022-11-14	2022-11-20		2	74
489	3634.59	2022-11-14	2022-11-20		2	75
490	17381.04	2022-11-14	2022-11-20		2	76
491	482.00	2022-11-14	2022-11-20		2	77
492	2951.76	2022-11-21	2022-11-27		2	74
493	2956.67	2022-11-21	2022-11-27		2	75
494	14996.12	2022-11-21	2022-11-27		2	76
495	366.00	2022-11-21	2022-11-27		2	77
496	3268.45	2022-11-21	2022-11-27		2	74
497	3404.91	2022-11-21	2022-11-27		2	75
498	15653.57	2022-11-21	2022-11-27		2	76
499	445.00	2022-11-21	2022-11-27		2	77
500	3794.77	2022-12-12	2022-12-18		2	74
501	2802.56	2022-12-12	2022-12-18		2	75
502	18594.55	2022-12-12	2022-12-18		2	76
503	476.00	2022-12-12	2022-12-18		2	77
504	4640.71	2022-12-05	2022-12-11		2	74
505	2892.21	2022-12-05	2022-12-11		2	75
506	17755.07	2022-12-05	2022-12-11		2	76
507	457.00	2022-12-05	2022-12-11		2	77
508	2899.37	2022-12-19	2022-12-25		2	74
509	2047.73	2022-12-19	2022-12-25		2	75
510	10937.35	2022-12-19	2022-12-25		2	76
511	270.00	2022-12-19	2022-12-25		2	77
512	3228.90	2022-12-26	2023-01-01		2	74
513	3288.17	2022-12-26	2023-01-01		2	75
514	15544.82	2022-12-26	2023-01-01		2	76
515	397.00	2022-12-26	2023-01-01		2	77
516	3124.17	2023-01-02	2023-01-08		2	74
517	3261.32	2023-01-02	2023-01-08		2	75
518	15113.34	2023-01-02	2023-01-08		2	76
519	407.00	2023-01-02	2023-01-08		2	77
520	2777.92	2023-01-09	2023-01-15		2	74
521	3210.03	2023-01-09	2023-01-15		2	75
522	14239.71	2023-01-09	2023-01-15		2	76
523	381.00	2023-01-09	2023-01-15		2	77
524	3476.26	2023-01-16	2023-01-22		2	74
525	3247.00	2023-01-16	2023-01-22		2	75
526	14699.55	2023-01-16	2023-01-22		2	76
527	423.00	2023-01-16	2023-01-22		2	77
528	2930.90	2023-01-23	2023-01-29		2	74
529	3168.76	2023-01-23	2023-01-29		2	75
530	13130.09	2023-01-23	2023-01-29		2	76
531	393.00	2023-01-23	2023-01-29		2	77
532	2935.01	2023-01-30	2023-02-05		2	74
533	2746.63	2023-01-30	2023-02-05		2	75
534	14024.36	2023-01-30	2023-02-05		2	76
535	376.00	2023-01-30	2023-02-05		2	77
536	2676.47	2023-02-06	2023-02-12		2	74
537	2972.15	2023-02-06	2023-02-12		2	75
538	14689.73	2023-02-06	2023-02-12		2	76
539	378.00	2023-02-06	2023-02-12		2	77
540	4114.38	2023-02-13	2023-02-19		2	74
541	2745.39	2023-02-13	2023-02-19		2	75
542	16973.04	2023-02-13	2023-02-19		2	76
543	452.00	2023-02-13	2023-02-19		2	77
544	3599.33	2023-02-20	2023-02-26		2	74
545	2835.94	2023-02-20	2023-02-26		2	75
546	16696.75	2023-02-20	2023-02-26		2	76
547	452.00	2023-02-20	2023-02-26		2	77
548	3502.01	2023-02-27	2023-03-05		2	74
549	3275.46	2023-02-27	2023-03-05		2	75
550	16579.54	2023-02-27	2023-03-05		2	76
551	475.00	2023-02-27	2023-03-05		2	77
552	4315.21	2023-03-06	2023-03-12		2	74
553	3202.99	2023-03-06	2023-03-12		2	75
554	16821.35	2023-03-06	2023-03-12		2	76
555	458.00	2023-03-06	2023-03-12		2	77
556	4033.91	2023-03-13	2023-03-19		2	74
557	2890.58	2023-03-13	2023-03-19		2	75
558	17212.86	2023-03-13	2023-03-19		2	76
559	479.00	2023-03-13	2023-03-19		2	77
560	3690.91	2023-03-20	2023-03-26		2	74
561	3236.09	2023-03-20	2023-03-26		2	75
562	15775.05	2023-03-20	2023-03-26		2	76
563	418.00	2023-03-20	2023-03-26		2	77
564	4580.23	2023-03-27	2023-04-02		2	74
565	3207.65	2023-03-27	2023-04-02		2	75
566	17726.59	2023-03-27	2023-04-02		2	76
567	454.00	2023-03-27	2023-04-02		2	77
568	3962.28	2023-04-03	2023-04-09		2	74
569	3314.15	2023-04-03	2023-04-09		2	75
570	16727.65	2023-04-03	2023-04-09		2	76
571	453.00	2023-04-03	2023-04-09		2	77
572	4609.40	2023-04-10	2023-04-16		2	74
573	3210.89	2023-04-10	2023-04-16		2	75
574	17580.78	2023-04-10	2023-04-16		2	76
575	473.00	2023-04-10	2023-04-16		2	77
576	3921.23	2023-04-17	2023-04-23		2	74
577	3316.64	2023-04-17	2023-04-23		2	75
578	16708.29	2023-04-17	2023-04-23		2	76
579	441.00	2023-04-17	2023-04-23		2	77
580	3475.08	2023-04-24	2023-04-30		2	74
581	3190.82	2023-04-24	2023-04-30		2	75
582	17945.04	2023-04-24	2023-04-30		2	76
583	471.00	2023-04-24	2023-04-30		2	77
584	5043.22	2023-05-01	2023-05-07		2	74
585	3396.12	2023-05-01	2023-05-07		2	75
586	19074.85	2023-05-01	2023-05-07		2	76
587	507.00	2023-05-01	2023-05-07		2	77
588	4920.83	2023-05-08	2023-05-14		2	74
589	3783.03	2023-05-08	2023-05-14		2	75
590	21544.39	2023-05-08	2023-05-14		2	76
591	531.00	2023-05-08	2023-05-14		2	77
592	3491.07	2023-05-15	2023-05-21		2	74
593	3783.78	2023-05-15	2023-05-21		2	75
594	15787.32	2023-05-15	2023-05-21		2	76
595	455.00	2023-05-15	2023-05-21		2	77
596	3536.39	2023-05-22	2023-05-28		2	74
597	3746.12	2023-05-22	2023-05-28		2	75
598	15271.85	2023-05-22	2023-05-28		2	76
599	428.00	2023-05-22	2023-05-28		2	77
600	4135.10	2023-05-29	2023-06-04		2	74
601	3550.14	2023-05-29	2023-06-04		2	75
602	18181.69	2023-05-29	2023-06-04		2	76
603	517.00	2023-05-29	2023-06-04		2	77
604	3667.83	2023-06-05	2023-06-11		2	74
605	3717.07	2023-06-05	2023-06-11		2	75
606	16992.96	2023-06-05	2023-06-11		2	76
607	453.00	2023-06-05	2023-06-11		2	77
608	4518.22	2023-06-12	2023-06-18		2	74
609	4005.76	2023-06-12	2023-06-18		2	75
610	19384.68	2023-06-12	2023-06-18		2	76
611	507.00	2023-06-12	2023-06-18		2	77
612	4326.55	2023-06-19	2023-06-25		2	74
613	3755.40	2023-06-19	2023-06-25		2	75
614	19353.94	2023-06-19	2023-06-25		2	76
615	500.00	2023-06-19	2023-06-25		2	77
616	4076.31	2023-06-26	2023-07-02		2	74
617	3581.69	2023-06-26	2023-07-02		2	75
618	17462.24	2023-06-26	2023-07-02		2	76
619	445.00	2023-06-26	2023-07-02		2	77
620	4063.82	2023-07-03	2023-07-09		2	74
621	3109.85	2023-07-03	2023-07-09		2	75
622	15349.88	2023-07-03	2023-07-09		2	76
623	405.00	2023-07-03	2023-07-09		2	77
624	3913.33	2023-07-10	2023-07-16		2	74
625	5136.95	2023-07-10	2023-07-16		2	75
626	17429.07	2023-07-10	2023-07-16		2	76
627	491.00	2023-07-10	2023-07-16		2	77
628	3909.77	2023-07-17	2023-07-23		2	74
629	6005.03	2023-07-17	2023-07-23		2	75
630	16772.50	2023-07-17	2023-07-23		2	76
631	449.00	2023-07-17	2023-07-23		2	77
632	3675.40	2023-07-24	2023-07-30		2	74
633	3729.97	2023-07-24	2023-07-30		2	75
634	17534.85	2023-07-24	2023-07-30		2	76
635	456.00	2023-07-24	2023-07-30		2	77
636	3510.66	2023-07-31	2023-08-06		2	74
637	3894.56	2023-07-31	2023-08-06		2	75
638	14165.51	2023-07-31	2023-08-06		2	76
639	404.00	2023-07-31	2023-08-06		2	77
640	3563.13	2023-08-07	2023-08-13		2	74
641	3641.49	2023-08-07	2023-08-13		2	75
642	16407.84	2023-08-07	2023-08-13		2	76
643	426.00	2023-08-07	2023-08-13		2	77
644	4022.89	2023-08-14	2023-08-20		2	74
645	3357.25	2023-08-14	2023-08-20		2	75
646	18557.60	2023-08-14	2023-08-20		2	76
647	485.00	2023-08-14	2023-08-20		2	77
648	4833.29	2023-08-21	2023-08-27		2	74
649	3147.70	2023-08-21	2023-08-27		2	75
650	18243.14	2023-08-21	2023-08-27		2	76
651	477.00	2023-08-21	2023-08-27		2	77
652	3235.92	2023-08-28	2023-09-03		2	74
653	3648.13	2023-08-28	2023-09-03		2	75
654	13939.46	2023-08-28	2023-09-03		2	76
655	391.00	2023-08-28	2023-09-03		2	77
656	3676.58	2023-09-04	2023-09-10		2	74
657	3703.35	2023-09-04	2023-09-10		2	75
658	16419.22	2023-09-04	2023-09-10		2	76
659	430.00	2023-09-04	2023-09-10		2	77
660	3283.20	2023-09-11	2023-09-17		2	74
661	3596.71	2023-09-11	2023-09-17		2	75
662	15523.30	2023-09-11	2023-09-17		2	76
663	400.00	2023-09-11	2023-09-17		2	77
664	4029.09	2023-09-18	2023-09-24		2	74
665	3304.15	2023-09-18	2023-09-24		2	75
666	16548.59	2023-09-18	2023-09-24		2	76
667	419.00	2023-09-18	2023-09-24		2	77
668	3727.76	2023-09-25	2023-10-01		2	74
669	3508.82	2023-09-25	2023-10-01		2	75
670	17582.02	2023-09-25	2023-10-01		2	76
671	500.00	2023-09-25	2023-10-01		2	77
672	2872.17	2023-10-02	2023-11-08		2	74
673	3464.44	2023-10-02	2023-11-08		2	75
674	14188.22	2023-10-02	2023-11-08		2	76
675	374.00	2023-10-02	2023-11-08		2	77
676	3918.20	2023-10-09	2023-10-15		2	74
677	3374.17	2023-10-09	2023-10-15		2	75
678	16723.95	2023-10-09	2023-10-15		2	76
679	442.00	2023-10-09	2023-10-15		2	77
680	3017.86	2023-10-16	2023-10-22		2	74
681	3463.22	2023-10-16	2023-10-22		2	75
682	14353.78	2023-10-16	2023-10-22		2	76
683	397.00	2023-10-16	2023-10-22		2	77
684	2369.95	2023-10-23	2023-10-29		2	74
685	3220.45	2023-10-23	2023-10-29		2	75
686	12519.65	2023-10-23	2023-10-29		2	76
687	339.00	2023-10-23	2023-10-29		2	77
688	2634.24	2023-10-30	2023-11-05		2	74
689	3251.66	2023-10-30	2023-11-05		2	75
690	13031.82	2023-10-30	2023-11-05		2	76
691	348.00	2023-10-30	2023-11-05		2	77
692	2584.05	2023-11-06	2023-11-12		2	74
693	3397.58	2023-11-06	2023-11-12		2	75
694	11970.93	2023-11-06	2023-11-12		2	76
695	323.00	2023-11-06	2023-11-12		2	77
696	3497.23	2023-11-13	2023-11-19		2	74
697	3505.21	2023-11-13	2023-11-19		2	75
698	14400.44	2023-11-13	2023-11-19		2	76
699	415.00	2023-11-13	2023-11-19		2	77
700	2988.30	2023-11-20	2023-11-26		2	74
701	3364.86	2023-11-20	2023-11-26		2	75
702	12522.47	2023-11-20	2023-11-26		2	76
703	286.00	2023-11-20	2023-11-26		2	77
704	2306.55	2023-11-27	2023-12-03		2	74
705	3617.72	2023-11-27	2023-12-03		2	75
706	11241.27	2023-11-27	2023-12-03		2	76
707	318.00	2023-11-27	2023-12-03		2	77
708	4283.28	2023-12-04	2023-12-10		2	74
709	3911.28	2023-12-04	2023-12-10		2	75
710	17059.04	2023-12-04	2023-12-10		2	76
711	512.00	2023-12-04	2023-12-10		2	77
712	3524.68	2023-12-11	2023-12-17		2	74
713	3483.38	2023-12-11	2023-12-17		2	75
714	15447.85	2023-12-11	2023-12-17		2	76
715	388.00	2023-12-11	2023-12-17		2	77
716	3512.32	2023-12-18	2023-12-24		2	74
717	3215.00	2023-12-18	2023-12-24		2	75
718	13935.78	2023-12-18	2023-12-24		2	76
719	354.00	2023-12-18	2023-12-24		2	77
720	3382.75	2023-12-25	2023-12-31		2	74
721	2650.98	2023-12-25	2023-12-31		2	75
722	13909.92	2023-12-25	2023-12-31		2	76
723	361.00	2023-12-25	2023-12-31		2	77
\.


--
-- Data for Name: accounting_restaurant; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_restaurant (id, name, address, username) FROM stdin;
1	Bixby	\N	dosbandidosbixby
2	Broken Arrow	\N	dosbandidosba
\.


--
-- Data for Name: accounting_rule; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_rule (id, description, supplier_id) FROM stdin;
1	Account Service Charge	55
2	Account Service Fee	55
6	TAS SYSTEMS LLC	133
7	ARMADA DIST	41
8	AMEX EPAYMENT	124
9	First Pryority	60
10	AMERICAN WASTE	181
11	COX COMM	18
12	Superior Linen	25
13	CHOWNOW	20
14	CLOVER APP	99
15	AMER ELECT PWR	15
17	BIXBY METRO	28
18	FARMERS	21
19	LDF	35
22	SPFD GROCER CO	29
23	PYMT ICE MAKER	27
24	MERCH FEES BEYOND	139
25	ACH MERCH FEES BNKCD SETTLE	187
26	ACH MTOT DISC  BANKCARD	187
28	ATT	26
29	PAYMENTS   OpenTable	132
30	ACH Debit - ACH PAYROLL    0160MO81 DOS BA - DOS BANDIDOS BIXBY LLC	14
31	ACH Debit - ACH Payroll    DOS BANDIDOS BA - DOS BANDIDOS BA LLC	90
32	KASTENBERRY	168
33	Jarboe Sales Co	34
34	LAWS BROS LLC	136
35	CARLOS GONZALEZ	59
36	OK NATURAL GAS	17
38	TIMBERLAND-ENCO	56
40	ATM - Withdrawal - DDA - ATM W/D 9037 S YALE - TULSA OK	100
42	SAM'S Club	32
43	ATM Transaction Charge	55
44	CHECK -  -	100
45	CITYNET TRANSFER- DEBIT - Funds Transfer via Online -	100
46	COUNTER WITHDRAWAL -  -	100
47	OD ITEM FEE	55
48	DIRECTV	1
49	LAVU	19
50	LIQUOR WAR	39
51	TRN BROKEN ARROW UTI	158
52	CURTIS RESTAURAN	122
53	TRN DOMINO'S	189
54	TRN DOORDASH	189
55	TRN EB QUENTIN LIGGI	189
56	CREATIVE DEV	105
57	JAVA	22
58	TRN KEO	189
59	LAS AMERICAS SUP	65
60	LOWE'S	43
61	TRN QT	97
63	SAMSCLUB	32
64	THE HOME DEPOT	93
65	MOSQUITO C	184
66	TRN UBER   TRIP	189
67	WALMART	33
68	PBG	66
69	Paisa	31
70	SUPERMERCADOS MO	44
71	WAL-MART	33
72	SAMS CLUB	32
73	RESTAURANT EQUIP	51
74	*BIRD	189
75	ADILENE	180
76	Java	22
77	HTTPSBIRD.CO	189
78	FEDEX	64
79	FIESTA MART	135
80	Farmers	21
81	WM SUPERCENTER	33
82	NSF RETURN ITEM FEE	55
83	Wal-Mart	33
84	NAM HAI	49
85	FACEBK	169
86	COUNTRY MA	47
87	Two Parts Liquor	80
88	PARKHILL'S	87
89	KUM&	48
90	Wire Transfer Fee	55
91	AUTO-CHLOR	24
93	SCULPTURE HOSP	144
94	Transfer to Loan	221
95	CASANOVAS	243
27	OKLAHOMATAXPMTS	189
96	B &amp; B LIQUOR	39
97	AEP PUBLIC SERV	15
98	WALGREENS	98
131	BETTER VIEW	284
132	OKLAHOMANATURALG	17
133	INTUIT	287
134	GOOGLE	141
135	Google	141
136	TORTILLERIA MIL	30
137	BROOKS GREASE	23
138	BEVINCO	323
139	DOLLAR-GENERAL	92
140	ORKIN PEST	131
141	SCULPTURE HO	144
142	PYMT   CARDMEMBER	318
143	TRN AMZN	112
144	UTIL CITY OF TULSA	338
145	CORP COLL SWIPE IT	340
146	XIMENA MARTINEZ	216
147	AMZN Mktp	112
148	Amazon.com	112
149	US FOODSERVICE	343
150	SWIPE IT	340
151	LAW BROS LLC	136
152	JOINHOMEBASE	348
153	WISEY	344
154	EIDL LOAN	346
\.


--
-- Data for Name: accounting_supplier; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.accounting_supplier (id, name, supplier_type, comments) FROM stdin;
1	Direct TV	service	
2	Edgar Garcia	labor	
3	Thayluz Kher	labor	
4	Laura Muñoz	labor	
5	Francisco Ponce	labor	
6	Bianca Rosario	labor	
7	Daniela Valencia	labor	
8	Luis Lopez	labor	
9	Sarai Ramirez	labor	
10	Erika Guerrero	labor	
11	Alisha Axaman	labor	
12	Omar Miret	labor	
13	Esmeralda Ponce	labor	
14	Payroll Bixby (Heartland)	labor	
15	Amer Electric Power (AEP)	service	Electricity
16	Riverbend Sloppes	service	Bixby Rent
17	Oklahoma Natural Gas	service	
18	Cox Communications Tulsa	service	Internet
19	Lavu	service	
20	Chow Now	service	
21	Farmers	service	
22	Java Daves	service	
23	Brookes Greease	service	
24	Autochlor	service	
25	Superior	service	
26	AT&T	service	
27	Ice Machine	service	
28	Bixby Metro	service	
29	SGC	operationFood	
30	Tortilleria Mil Arcos	operationFood	
31	Paisa Products	operationFood	
32	Sams	operationFood	
33	Walmart	operationFood	
34	Southern Glazers (Jarboe)	operationLiquor	
35	LDF	operationLiquor	
36	Republic	operationLiquor	
37	Boardwalk	operationLiquor	
38	Store	operationLiquor	
39	B&B Liquor	liquorMisc	
40	Wine Rack	liquorMisc	
41	Armada	liquorMisc	
42	Bixby Wine	liquorMisc	
43	Lowes	foodMisc	
44	Supermercados Morelos	foodMisc	
45	Linen	foodMisc	
46	Catering	foodMisc	
47	Country Mart	foodMisc	
48	Kum & Go	foodMisc	
49	Nam Hai Market	foodMisc	
50	Uniforms (Carlos Borges)	uncategorized	
51	Restaurant Equipment and Supply	uncategorized	
52	Credit Card Processing	uncategorized	Merch fees beyond (se carga en mes anterior)
53	Kiva Loan	uncategorized	
54	Car Payment	uncategorized	
55	Bank Fees	uncategorized	
56	Timberland (Carlos’ Rent)	uncategorized	
57	Katelyn Morrow	labor	
58	Wire Transfer Fee	uncategorized	
59	Carlos Gonzalez	labor	
60	First Pryority	uncategorized	
61	Dereck Kerley	uncategorized	Murales
62	Cash Withdrawal	notAnExpense	
63	Dorismar Jungo	labor	
64	Fedex	uncategorized	
65	Las Americas Supermercado	foodMisc	
66	Pepsi Co	operationFood	
67	Staples Connect	uncategorized	
68	Restaurant Net Sales	sales	
69	Chow Now Sales	sales	
70	Door Dash	sales	
71	Uber Eats	sales	
72	Grub Hub	sales	
73	EZ Catering	sales	
74	Restaurant Liquor Sales	restaurantInfo	
75	Restaurant Labor	restaurantInfo	
76	Restaurant Gross Sales	restaurantInfo	
77	Restaurant Order Count	restaurantInfo	
78	Carter	labor	
79	Main Street Bar	liquorMisc	
80	Two Parts Liquor	liquorMisc	
81	Madison Hassell	labor	
82	James Norman	labor	
83	Tyler Check	labor	
84	Other Expenses	uncategorized	See expenses comments
85	Caleb Rhokhar	labor	
86	Dora Perez	labor	
87	Parkhill Liquor	liquorMisc	
88	Credit Card Beyond	uncategorized	
89	Licenses and Taxes	uncategorized	
90	Payroll BA (TPI)	labor	
91	Cozzini Bros	service	
92	Dollar General	foodMisc	
93	Home Depot	uncategorized	
94	Doris Perez	labor	
95	Diego Gallego	labor	
96	Reasors	foodMisc	
97	QuickTrip	liquorMisc	
98	Walgreens	foodMisc	
99	Clover	service	
100	Stand By	standBy	
101	Gabriela Tasej	labor	
102	Freedom ICE	service	
103	Budweiser	operationLiquor	
104	Air Cool	service	
105	Creative Dev	uncategorized	Shirts
106	Seth Simms	labor	
107	Abigail Main	labor	
108	Brittany Minci	labor	
109	Cameron McColloch	labor	
110	Esmeralda Carrillo	labor	
111	The Auto Doctor	uncategorized	
112	Amazon	uncategorized	
113	Gabriel Reyes	labor	
114	Kala Olmstead	labor	
115	Kaylynne Hurley	labor	
116	Crystal Esparza	labor	
117	Rosa Carrillo	labor	
119	John Mathew Consulting	service	
120	Alejandra Perez	labor	
121	Abby Kallain	labor	
122	Curtis Restaurant	service	
123	Housekeeping	service	
124	American Express	uncategorized	
125	Airgas USA	service	
126	CMP Benefits	foodMisc	
127	Eduardo Perez	labor	
128	Junk Free LLC	service	
129	Carlos Sanchez	labor	
130	Alyssa White	labor	
131	Orkin	service	
132	Open Table	service	
133	TAS Systems	service	
134	Arturo Lopez	labor	
135	Fiesta Mart	foodMisc	
136	Laws Bros (Renta BA)	service	
137	MTOT Bankcard	service	
138	OCC Construction	service	
139	Beyond Merch Fees	service	
140	Lucas Summers	labor	
141	Google	service	
142	Aiden Sudler	labor	
143	DDFA Graphics	service	
144	Sculpture Hospitality	service	
145	Adrian Joshimar	labor	
146	Rafael Galue	labor	
147	Estilita Villafane	labor	
150	Jonathan Gonzalez	labor	
151	Daniel Paez	labor	
152	Eduardo Delgado	labor	
153	George Beahar	labor	
154	Kasi Norman	labor	
155	Rosa Esmeralda	labor	
156	Acoustimac	service	
157	Target	uncategorized	
158	Broken Arrow UTI	service	
159	Nicholette Abbott	labor	
160	WinCo Foods	foodMisc	
161	Kevin Morris	labor	
162	Gift Card Collected	uncategorized	
163	High Gravity	foodMisc	
164	Idea Graphic	service	
165	Jorge Plumber	service	
166	Daniela Gonzalez	labor	
167	Braums	foodMisc	
168	Kastenberry (Merch Fees)	service	
169	Marketing	service	
170	Pablo Godinez	labor	
171	Mayra Ibanez	labor	
172	Fabiana Bixby	labor	
173	Eddie Bixby	labor	
174	Truck SFC	service	
175	Omar Miret GASTOS	uncategorized	
176	Francisco Arenas	labor	
177	Javier Sandoval	labor	
178	Roberto Garcia	labor	
179	Transfers Between Accounts	notAnExpense	
180	Adilene Serrano	labor	
181	American Waste	service	
182	Ashlynn Price	labor	
183	Jose Valencia	labor	
184	Mosquito	uncategorized	
185	Sherry Maintenance	service	
186	Alex Rosas	labor	
187	Merch Fees BNKCD	service	
188	Uncategorized Cash Expense	uncategorized	
189	Not An Expense	notAnExpense	
190	CVS	foodMisc	
191	Taylor Brewing Co	foodMisc	
192	Justin Graham	labor	
193	Durant Heat And AC	service	
194	Security Locks	service	
195	Carlos Rivera	uncategorized	
196	Bryan Palomino	labor	
197	David Harris	labor	
198	Ace Hardware	uncategorized	
199	Costco	foodMisc	
200	Thomas Dishwasher	labor	
201	Mason Jabe	labor	
202	Jason Walter Floor	service	
203	Trevor Sigmon	labor	
204	Juan Carlos Rivera	labor	
205	Mikyla Smith	labor	
206	Noah Watkins	labor	
207	Plumber	service	
208	Freezer Tech	service	
209	Office Depot	uncategorized	
210	D&J Liquor	liquorMisc	
211	Tres Leches	foodMisc	
212	Parkhill's South	liquorMisc	
213	Marcos Vasquez	labor	
214	Barrier Enterprises	service	
215	Angel Cuevas	labor	
216	Ximena Martinez	service	Marketing
217	Alejandra Javier	foodMisc	
218	Thomas Balley	labor	
219	Georgia M B	labor	
220	Richard Stewart	service	Accountant
221	Loan Payment	uncategorized	
222	Legal Fees	uncategorized	
223	Refund	uncategorized	
224	City Tickets	uncategorized	
225	Reese Erickson	labor	
226	Rosa Jungo	labor	
227	Vanessa Gray	labor	
228	Zephyr Hardware	service	
118	Lazaro Tanori	labor	
229	Kalley Miesner	labor	
230	Food Cost (Uncategorized)	foodMisc	
231	Cesar Guzman	labor	
232	World Liquors	liquorMisc	
233	Chase Cox	labor	
235	Labor Uncategorized	labor	
234	Karen Adrian	labor	
236	Dollar Tree	foodMisc	
237	Zachary DuBois	labor	
238	Teodoro Mendez	labor	
239	Jessi Rosas	labor	
240	Martha Jungo	labor	
241	Omar Maduro Decorations	service	
242	Jordan Westerfield	labor	
243	Casanovas Handyman	service	
244	Caleb Forster	labor	
245	Burtons Liquor Mart	liquorMisc	
247	Andolinis	uncategorized	
246	Coney I-Lander	uncategorized	
249	Pedro Hernandez	labor	
250	Alex Soto	labor	
251	Mariana Perez	labor	
252	Jaylee Hood	labor	
253	Ava Moss	labor	
254	Carlos Lopez	labor	
255	Pablo Hernandez	labor	
256	Nathan Keady	labor	
257	Jose Sanchez	labor	
258	Training	uncategorized	
259	Mary Collins	labor	
260	Sergio Sanchez	labor	
261	Brayden Ramsey	labor	
262	Gabriel Mejias	labor	
263	Webstaurant	uncategorized	
264	Omar Perez	service	
265	Ignacio Guzman	labor	
266	Alan Arias	labor	
267	Juventino Duran	service	
268	Admiral Security	service	
269	Teresa Salcido	labor	
270	Kailey Miesner	labor	
271	Kevin Bishop	labor	
272	Adrian Hernandez	labor	
273	Randy Knight	labor	
274	Cleaning	service	
275	Marisa	labor	
276	LiquorPOS	liquorMisc	
277	Alvaro Hernandez	labor	
278	AsianMart	foodMisc	
279	Jose Reyes	labor	
280	Ty Thrashar	labor	
281	Anthony Russell	labor	
282	Evelyn Lopez	labor	
283	David Tarazona	labor	
284	Better View	service	
285	Georgia Benham	labor	
286	Sarahy Duran	labor	
287	Quickbooks	service	
288	Sysco	operationFood	
289	OReilly Auto	uncategorized	
290	Celia Deleon (Insurance)	uncategorized	
291	Jonathan Gardner	labor	
292	Crisanto Pineda	labor	
293	Miriam Perez	labor	
294	Azeneth Sanchez	labor	
295	Lorena Quintana	labor	
296	Emilia Sandoval	labor	
297	Peggy Marcano	labor	
298	Home Expenses	uncategorized	
299	Paysafe	service	
300	Luis Rios	labor	
301	Mariana Badillo	labor	
302	Devan Culbert	labor	
303	Wellness Family Clinic	uncategorized	
304	Maggie Loftin	labor	
305	Jessica Arenz	labor	
306	Algo Grande	service	
307	Alexander Moreno	labor	
308	Vent Hood	service	
309	Alexis Argueta	labor	
310	Yurisbelis Hernandez	labor	
311	Accurate Fire Equipment	service	
312	TEDC (Loan)	uncategorized	
313	Adres de Franca Boris	labor	
314	Pedro Gutierrez	labor	
315	Ana Dominguez	labor	
316	Leon Reyes	labor	
317	Francisca Valencia	labor	
318	Credit Card Payment	uncategorized	
319	Christopher Pendley	labor	
320	Taxes Manuel Briceno	uncategorized	
321	Lourdes Sanchez	labor	
322	Jeannie Doe	labor	
323	Bevinco	foodMisc	
325	DBC	foodMisc	
326	Luis Rodriguez	labor	
327	David Blanco	labor	
328	Alexis Mantilla	labor	
329	Stonemen Granite	service	
330	Taylor McAdoo	labor	
331	District Burger	uncategorized	
332	Isela Rodriguez	labor	
333	Marco Casas	labor	
334	Ortegas Cleaning Solutions	service	
335	CNA Surety	uncategorized	
336	Loan Payable District Burger	uncategorized	
337	Harland Clarke	uncategorized	
338	Utilities City of Tulsa (Water)	service	
339	Gift Cards	uncategorized	
340	Swipe It	service	
341	Aleesia Tarver	labor	
342	Richard Stewart CPA	uncategorized	Taxes CPA
343	US Foodservice	operationFood	
344	Wisey	service	
345	Eduardo Arenas	labor	
346	Loan Payable EIDL	uncategorized	
347	Bao Huynh	labor	
348	Homebase	service	
349	Sofia Ramos	labor	
350	Shelby Shaffer	labor	
351	City of Broken Arrow (Water)	service	
352	Chylee Malarzewski	labor	
353	David Santiago Cuith	labor	
354	Tulsa Latina Leadership	service	
355	Guillermo Lopez	labor	
356	Rosa Ayala	labor	
357	Salone Pope	labor	
358	Max Garage	service	
359	Nicks Collisions	service	
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.auth_group (id, name) FROM stdin;
1	read_only_users
2	managers
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add supplier	1	add_supplier
2	Can change supplier	1	change_supplier
3	Can delete supplier	1	delete_supplier
4	Can view supplier	1	view_supplier
5	Can add expense	2	add_expense
6	Can change expense	2	change_expense
7	Can delete expense	2	delete_expense
8	Can view expense	2	view_expense
9	Can add cash log	3	add_cashlog
10	Can change cash log	3	change_cashlog
11	Can delete cash log	3	delete_cashlog
12	Can view cash log	3	view_cashlog
13	Can add income	4	add_income
14	Can change income	4	change_income
15	Can delete income	4	delete_income
16	Can view income	4	view_income
17	Can add metric	5	add_metric
18	Can change metric	5	change_metric
19	Can delete metric	5	delete_metric
20	Can view metric	5	view_metric
21	Can add rule	6	add_rule
22	Can change rule	6	change_rule
23	Can delete rule	6	delete_rule
24	Can view rule	6	view_rule
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add content type	11	add_contenttype
42	Can change content type	11	change_contenttype
43	Can delete content type	11	delete_contenttype
44	Can view content type	11	view_contenttype
45	Can add session	12	add_session
46	Can change session	12	change_session
47	Can delete session	12	delete_session
48	Can view session	12	view_session
49	Can add restaurant	13	add_restaurant
50	Can change restaurant	13	change_restaurant
51	Can delete restaurant	13	delete_restaurant
52	Can view restaurant	13	view_restaurant
53	Can add profile	14	add_profile
54	Can change profile	14	change_profile
55	Can delete profile	14	delete_profile
56	Can view profile	14	view_profile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$IOS99VSrIMz8Kl4Qr12eoj$Go/hcVNqQ1+7Jy9zG3j+qwJilNQ7siRGmtreI1BGKNQ=	2021-10-23 16:39:52.187644+00	t	dosbandidosbixby	Dos Bandidos	Bixby		t	t	2021-04-26 15:39:15+00
23	pbkdf2_sha256$260000$0kAM5fAttxcluzaCslYcLO$vJ5VXZcpptCfcgwbDe4MmNQBWjzXCNPOxFnKoFVGCZM=	2022-01-02 13:55:04.223819+00	f	francisco.ponce				f	t	2022-01-02 00:50:25+00
20	pbkdf2_sha256$260000$yFS1DEDOSAkk7eCRTqC3SU$y5XutDw3YCeevpKu1KVMDI/5Ra5W9C14adjXP3f6TP8=	2022-01-05 01:05:43.671641+00	f	caleb.forster				f	t	2022-01-01 20:56:44+00
18	pbkdf2_sha256$260000$GbyxwGtppMOVn295l1TslH$krpLxxq5G2yE6UclwK3DF7cDgCWRMC7U5CIVJbG+9S4=	\N	f	bamanagers				f	t	2021-12-29 02:43:08+00
16	pbkdf2_sha256$260000$pSmwhNGaPYQPouflZN4e8d$HwXITweNpC2mlZ6JuTAX5T2l5BAN2SPak2nUtvJIbjs=	2022-01-05 01:13:43.014458+00	f	carlos_lopez	Carlos	Lopez		f	t	2021-10-23 22:12:32+00
2	pbkdf2_sha256$260000$CGNhldecjT8Y7WWhYG23Li$twGAlDQxDmMcnuyWJr7UXAMgxrbTks5IqlhOM7K/Whc=	2021-11-14 20:35:14.095717+00	t	dosbandidosba	Dos Bandidos	BA		t	t	2021-04-30 01:04:48+00
22	pbkdf2_sha256$260000$bbkHd80Qbg5qkdrF5OHcux$e03W0H3+Akh92GB48kjmRpy4MljEMUXK3kg01NxtTzQ=	\N	f	rafael.gaude				f	t	2022-01-01 20:59:38+00
21	pbkdf2_sha256$260000$GXJFskr4Y4r1fWgcuqqfnk$1gjrSxO0rU6GdL99wG7pnxyzjTpxqHpIZcGqWbC69yI=	2022-01-01 21:00:53.27208+00	f	carlos.sanchez				f	t	2022-01-01 20:57:41+00
17	pbkdf2_sha256$260000$TgG8G7EyZTsU9pJpDAwQNH$fzL/WKKlTOUqv02rBAXHYPglTsUCeZtj/0T0a6vgia0=	2024-01-03 20:52:46.8252+00	t	carlossgv	Carlos	Gonzalez		t	t	2021-11-14 13:36:43+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	16	1
2	18	1
4	16	2
5	20	2
6	21	2
7	22	2
8	23	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-26 16:46:44.88511+00	1	Direct TV (service)	1	[{added: {}}]	7	1
2	2021-04-26 16:49:44.480096+00	1	264.99 paid to Direct TV	1	[{added: {}}]	8	1
3	2021-04-26 22:23:00.335683+00	2	58.1 paid to Direct TV on 2021-04-26	1	[{added: {}}]	8	1
4	2021-04-26 22:29:21.774643+00	2	58.10 paid to Direct TV on 2021-05-26	3		8	1
5	2021-04-26 22:38:46.76531+00	57	Katelyn Morrow (labor)	1	[{added: {}}]	7	1
6	2021-04-26 22:42:39.445315+00	58	Wire Transfer Fee (uncategorized)	1	[{added: {}}]	7	1
7	2021-04-26 22:46:18.42483+00	59	Carlos Gonzalez (labor)	1	[{added: {}}]	7	1
8	2021-04-29 15:33:21.919878+00	85	123.72 paid to Sams (32) on 2021-04-22 from Cash	1	[{added: {}}]	8	1
9	2021-04-29 16:12:57.640425+00	63	(63) Dorismar Jungo (labor)	1	[{added: {}}]	7	1
10	2021-04-30 01:01:36.864906+00	1	dosbandidosbixby	2	[{changed: {fields: [Username, First name, Last name]}}]	4	1
11	2021-04-30 01:06:31.639784+00	2	dosbandidosba	2	[{changed: {fields: [First name, Last name]}}]	4	1
12	2021-10-11 23:36:16.587763+00	14	testuser	1	[{"added": {}}]	10	2
13	2021-10-11 23:36:35.596869+00	14	testuser	3		10	2
14	2021-10-11 23:37:02.570998+00	15	testuser	1	[{"added": {}}]	10	2
15	2021-10-11 23:37:14.076882+00	15	testuser	3		10	2
16	2021-10-20 22:11:29.830264+00	1591	1 paid to Abby Kallain (121) on 2021-10-20 from Cash	1	[{"added": {}}]	2	2
17	2021-10-20 22:12:40.374329+00	1591	1.00 paid to Abby Kallain (121) on 2021-10-20 from Cash	3		2	2
18	2021-10-20 22:17:14.934371+00	326	2021-10-20: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	1
19	2021-10-20 22:17:24.146782+00	326	2021-10-20: Cash Sales 0.00, Card Auto Grat: 0.00, Card Tips: 0.00 	3		3	1
20	2021-10-21 00:00:40.939844+00	284	dosbandidosbixby - 2021-09-06: Cash Sales 397.12, Card Auto Grat: 0.00, Card Tips: 174.36 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
21	2021-10-21 00:01:38.354744+00	1592	5.11 paid to Kum & Go (48) on 2021-09-06 from Cash	1	[{"added": {}}]	2	2
22	2021-10-21 00:02:47.189684+00	285	dosbandidosbixby - 2021-09-07: Cash Sales 133.7, Card Auto Grat: 0.00, Card Tips: 113.11 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
23	2021-10-21 00:03:24.400525+00	1593	31 paid to Lowes (43) on 2021-09-07 from Cash	1	[{"added": {}}]	2	2
24	2021-10-21 00:03:59.38919+00	286	dosbandidosbixby - 2021-09-08: Cash Sales 114.62, Card Auto Grat: 0.00, Card Tips: 111.13 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
25	2021-10-21 00:04:27.079338+00	1594	247.19 paid to Parkhill Liquor (87) on 2021-09-08 from Cash	1	[{"added": {}}]	2	2
26	2021-10-21 00:04:54.559921+00	1595	20.43 paid to Kum & Go (48) on 2021-09-07 from Cash	1	[{"added": {}}]	2	2
27	2021-10-21 00:05:19.245174+00	1596	183.28 paid to SGC (29) on 2021-09-07 from Cash	1	[{"added": {}}]	2	2
28	2021-10-21 00:05:49.599622+00	1597	97.5 paid to Freedom ICE (102) on 2021-09-06 from Cash	1	[{"added": {}}]	2	2
29	2021-10-21 00:06:08.769526+00	1598	39.14 paid to Kum & Go (48) on 2021-09-06 from Cash	1	[{"added": {}}]	2	2
30	2021-10-21 00:07:53.244584+00	290	dosbandidosbixby - 2021-09-12: Cash Sales 219.17, Card Auto Grat: 0.00, Card Tips: 257.94 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
31	2021-10-21 00:08:19.968831+00	1599	45.66 paid to Walmart (33) on 2021-09-12 from Cash	1	[{"added": {}}]	2	2
32	2021-10-21 00:08:42.274274+00	1600	11.74 paid to Lowes (43) on 2021-09-12 from Cash	1	[{"added": {}}]	2	2
33	2021-10-21 00:09:14.341238+00	298	dosbandidosbixby - 2021-09-13: Cash Sales 191.81, Card Auto Grat: 0.00, Card Tips: 66.44 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
34	2021-10-21 00:12:48.803252+00	207	(207) Plumber (Services)	1	[{"added": {}}]	1	2
35	2021-10-21 00:13:20.137281+00	1601	213 paid to Plumber (207) on 2021-09-13 from Cash	1	[{"added": {}}]	2	2
36	2021-10-21 00:14:26.498556+00	300	dosbandidosbixby - 2021-09-15: Cash Sales 658.58, Card Auto Grat: 0.00, Card Tips: 168 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
37	2021-10-21 00:14:57.816169+00	304	dosbandidosbixby - 2021-09-19: Cash Sales 374570.00, Card Auto Grat: 0.00, Card Tips: 174.47 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
38	2021-10-21 00:17:47.858565+00	304	dosbandidosbixby - 2021-09-19: Cash Sales 374.57, Card Auto Grat: 0.00, Card Tips: 174.47 	2	[{"changed": {"fields": ["Cash sales"]}}]	3	2
39	2021-10-21 00:49:09.26234+00	318	dosbandidosbixby - 2021-09-26: Cash Sales 193.65, Card Auto Grat: 0.00, Card Tips: 171.89 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
40	2021-10-21 00:49:46.644994+00	316	dosbandidosbixby - 2021-09-24: Cash Sales 308.74, Card Auto Grat: 0.00, Card Tips: 269.38 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
41	2021-10-21 00:50:22.392746+00	1602	58.66 paid to Sams (32) on 2021-09-24 from Cash	1	[{"added": {}}]	2	2
42	2021-10-21 00:50:44.075821+00	1603	448.68 paid to Autochlor (24) on 2021-09-24 from Cash	1	[{"added": {}}]	2	2
43	2021-10-21 00:51:00.517207+00	315	dosbandidosbixby - 2021-09-23: Cash Sales 301.93, Card Auto Grat: 0.00, Card Tips: 108.65 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
44	2021-10-21 00:51:28.558544+00	1604	20.63 paid to Lowes (43) on 2021-09-23 from Cash	1	[{"added": {}}]	2	2
45	2021-10-21 00:51:51.85391+00	1605	63.75 paid to Superior (25) on 2021-09-23 from Cash	1	[{"added": {}}]	2	2
46	2021-10-21 00:52:39.762825+00	317	dosbandidosbixby - 2021-09-25: Cash Sales 451.72, Card Auto Grat: 0.00, Card Tips: 268.61 	2	[{"changed": {"fields": ["Cash sales", "Card tips", "Comments"]}}]	3	2
47	2021-10-21 00:53:13.350434+00	1606	25.7 paid to Catering (46) on 2021-09-25 from Cash	1	[{"added": {}}]	2	2
48	2021-10-21 00:53:29.792741+00	1607	6.5 paid to Country Mart (47) on 2021-09-25 from Cash	1	[{"added": {}}]	2	2
49	2021-10-21 00:54:55.545518+00	324	dosbandidosba - 2021-09-25: Cash Sales 0.00, Card Auto Grat: 0.00, Card Tips: 0.00 	2	[{"changed": {"fields": ["Modifications", "Comments"]}}]	3	2
50	2021-10-21 00:55:19.34421+00	1608	4.34 paid to Dollar General (92) on 2021-09-25 from Cash	1	[{"added": {}}]	2	2
51	2021-10-21 00:57:00.70539+00	1609	43.19 paid to Nam Hai Market (49) on 2021-09-27 from Cash	1	[{"added": {}}]	2	2
52	2021-10-21 00:57:28.266101+00	1610	24.39 paid to Walmart (33) on 2021-09-27 from Cash	1	[{"added": {}}]	2	2
53	2021-10-21 00:57:55.057759+00	1611	80 paid to Catering (46) on 2021-09-27 from Cash	1	[{"added": {}}]	2	2
54	2021-10-21 00:58:45.448996+00	327	dosbandidosba - 2021-09-27: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
55	2021-10-21 00:59:28.112379+00	208	(208) Freezer Tech (Services)	1	[{"added": {}}]	1	2
56	2021-10-21 00:59:54.427043+00	1612	21.76 paid to Freezer Tech (208) on 2021-09-27 from Cash	1	[{"added": {}}]	2	2
57	2021-10-21 01:00:24.295403+00	328	dosbandidosbixby - 2021-09-27: Cash Sales 322.65, Card Auto Grat: 0, Card Tips: 180.34 	1	[{"added": {}}]	3	2
58	2021-10-21 01:00:45.443689+00	329	dosbandidosba - 2021-09-28: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
59	2021-10-21 01:01:42.905852+00	1613	151.8 paid to Orkin (131) on 2021-09-28 from Cash	1	[{"added": {}}]	2	2
60	2021-10-21 01:01:59.646249+00	330	dosbandidosbixby - 2021-09-28: Cash Sales 54.37, Card Auto Grat: 0, Card Tips: 112.39 	1	[{"added": {}}]	3	2
61	2021-10-21 01:02:25.838343+00	331	dosbandidosbixby - 2021-09-29: Cash Sales 248.34, Card Auto Grat: 0, Card Tips: 75.13 	1	[{"added": {}}]	3	2
62	2021-10-21 01:02:45.739374+00	332	dosbandidosba - 2021-09-29: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
63	2021-10-21 01:03:26.170747+00	1614	63.75 paid to Superior (25) on 2021-09-30 from Cash	1	[{"added": {}}]	2	2
64	2021-10-21 01:03:41.91251+00	1615	8.68 paid to Dollar General (92) on 2021-09-30 from Cash	1	[{"added": {}}]	2	2
65	2021-10-21 01:04:35.95465+00	1616	8.29 paid to Supermercados Morelos (44) on 2021-10-01 from Cash	1	[{"added": {}}]	2	2
66	2021-10-21 01:04:55.599837+00	1617	23 paid to Catering (46) on 2021-10-01 from Cash	1	[{"added": {}}]	2	2
67	2021-10-21 01:05:08.322444+00	333	dosbandidosba - 2021-10-01: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
68	2021-10-21 01:07:39.366688+00	333	dosbandidosba - 2021-10-01: Cash Sales 0.00, Card Auto Grat: 0.00, Card Tips: 0.00 	2	[{"changed": {"fields": ["Modifications"]}}]	3	2
69	2021-10-21 01:08:22.466539+00	1618	10.35 paid to Walmart (33) on 2021-10-02 from Cash	1	[{"added": {}}]	2	2
70	2021-10-21 01:08:48.719929+00	209	(209) Office Depot (Uncategorized)	1	[{"added": {}}]	1	2
71	2021-10-21 01:09:18.2732+00	1619	86.8 paid to Office Depot (209) on 2021-10-01 from Cash	1	[{"added": {}}]	2	2
72	2021-10-21 01:09:39.74592+00	1620	40.13 paid to Sams (32) on 2021-10-02 from Cash	1	[{"added": {}}]	2	2
73	2021-10-21 01:10:04.874958+00	1621	3.76 paid to Country Mart (47) on 2021-10-02 from Cash	1	[{"added": {}}]	2	2
74	2021-10-21 01:10:35.730829+00	334	dosbandidosbixby - 2021-10-02: Cash Sales 505.02, Card Auto Grat: 0, Card Tips: 360.60 	1	[{"added": {}}]	3	2
75	2021-10-21 01:12:08.053067+00	335	dosbandidosba - 2021-10-02: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
76	2021-10-21 01:12:28.057538+00	1622	86.67 paid to B&B Liquor (39) on 2021-10-02 from Cash	1	[{"added": {}}]	2	2
77	2021-10-21 01:12:40.342976+00	1623	200 paid to Francisco Ponce (5) on 2021-10-02 from Cash	1	[{"added": {}}]	2	2
78	2021-10-21 01:13:21.244747+00	1624	7.69 paid to Country Mart (47) on 2021-10-03 from Cash	1	[{"added": {}}]	2	2
79	2021-10-21 01:13:41.160862+00	336	dosbandidosbixby - 2021-10-03: Cash Sales 225.07, Card Auto Grat: 0, Card Tips: 247.00 	1	[{"added": {}}]	3	2
80	2021-10-21 01:18:17.544119+00	1625	123.62 paid to Walmart (33) on 2021-10-04 from Cash	1	[{"added": {}}]	2	2
81	2021-10-21 01:18:33.555067+00	337	dosbandidosba - 2021-10-04: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
82	2021-10-21 01:19:33.496105+00	338	dosbandidosbixby - 2021-10-05: Cash Sales 282.44, Card Auto Grat: 0, Card Tips: 127.95 	1	[{"added": {}}]	3	2
83	2021-10-21 01:19:49.832637+00	339	dosbandidosba - 2021-10-05: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
84	2021-10-21 01:20:47.096986+00	340	dosbandidosbixby - 2021-10-06: Cash Sales 301.17, Card Auto Grat: 0, Card Tips: 100.05 	1	[{"added": {}}]	3	2
85	2021-10-21 01:20:48.61309+00	1626	32.42 paid to Costco (199) on 2021-10-06 from Cash	1	[{"added": {}}]	2	2
86	2021-10-21 01:21:19.391457+00	1627	45.7 paid to Two Parts Liquor (80) on 2021-10-07 from Cash	1	[{"added": {}}]	2	2
87	2021-10-21 01:21:37.715408+00	1628	63.75 paid to Superior (25) on 2021-10-07 from Cash	1	[{"added": {}}]	2	2
88	2021-10-21 01:22:13.342219+00	1629	9.12 paid to Walmart (33) on 2021-10-08 from Cash	1	[{"added": {}}]	2	2
89	2021-10-21 01:22:32.413782+00	1630	43.55 paid to Country Mart (47) on 2021-10-08 from Cash	1	[{"added": {}}]	2	2
90	2021-10-21 01:22:50.560898+00	341	dosbandidosbixby - 2021-10-08: Cash Sales 106.16, Card Auto Grat: 0, Card Tips: 147.75 	1	[{"added": {}}]	3	2
91	2021-10-21 01:23:20.003788+00	342	dosbandidosbixby - 2021-10-10: Cash Sales 76.74, Card Auto Grat: 0, Card Tips: 194.55 	1	[{"added": {}}]	3	2
92	2021-10-21 01:26:18.937425+00	1631	122 paid to Catering (46) on 2021-10-07 from Cash	1	[{"added": {}}]	2	2
93	2021-10-21 01:26:52.283891+00	1632	7.86 paid to Dollar General (92) on 2021-10-07 from Cash	1	[{"added": {}}]	2	2
94	2021-10-21 01:27:02.913473+00	343	dosbandidosba - 2021-10-07: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
95	2021-10-21 01:27:29.382705+00	1633	67 paid to Alejandra Perez (120) on 2021-10-08 from Cash	1	[{"added": {}}]	2	2
96	2021-10-21 01:27:43.940945+00	1634	65 paid to Catering (46) on 2021-10-08 from Cash	1	[{"added": {}}]	2	2
97	2021-10-21 01:28:23.878151+00	210	(210) D&J Liquor (Liquor (Miscellaneous))	1	[{"added": {}}]	1	2
98	2021-10-21 01:28:37.020798+00	1635	11.39 paid to WinCo Foods (160) on 2021-10-08 from Cash	1	[{"added": {}}]	2	2
99	2021-10-21 01:28:53.975565+00	1636	59.01 paid to D&J Liquor (210) on 2021-10-08 from Cash	1	[{"added": {}}]	2	2
100	2021-10-21 01:29:15.278791+00	344	dosbandidosba - 2021-10-08: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
101	2021-10-21 01:29:36.632716+00	1637	90.71 paid to Sams (32) on 2021-10-09 from Cash	1	[{"added": {}}]	2	2
102	2021-10-21 01:29:55.947382+00	1638	32.26 paid to Walmart (33) on 2021-10-09 from Cash	1	[{"added": {}}]	2	2
103	2021-10-21 01:30:38.317649+00	211	(211) Tres Leches (Food (Miscellaneous))	1	[{"added": {}}]	1	2
104	2021-10-21 01:30:59.394954+00	1639	36 paid to Tres Leches (211) on 2021-10-09 from Cash	1	[{"added": {}}]	2	2
105	2021-10-21 01:31:23.106266+00	1640	36 paid to Catering (46) on 2021-10-09 from Cash	1	[{"added": {}}]	2	2
106	2021-10-21 01:31:32.575031+00	345	dosbandidosba - 2021-10-09: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
107	2021-10-21 01:31:56.644519+00	1641	66.29 paid to Supermercados Morelos (44) on 2021-10-10 from Cash	1	[{"added": {}}]	2	2
108	2021-10-21 01:32:13.855447+00	346	dosbandidosba - 2021-10-10: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
109	2021-10-21 01:33:48.513292+00	347	dosbandidosbixby - 2021-10-11: Cash Sales 440.62, Card Auto Grat: 0, Card Tips: 117.29 	1	[{"added": {}}]	3	2
110	2021-10-21 01:34:58.81888+00	348	dosbandidosbixby - 2021-10-12: Cash Sales 172.55, Card Auto Grat: 0, Card Tips: 121.21 	1	[{"added": {}}]	3	2
111	2021-10-21 01:35:26.86823+00	1642	10 paid to Kum & Go (48) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
112	2021-10-21 01:36:10.892516+00	212	(212) Parkhill's South (Liquor (Miscellaneous))	1	[{"added": {}}]	1	2
113	2021-10-21 01:36:28.649434+00	1643	86.73 paid to Parkhill's South (212) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
114	2021-10-21 01:36:45.319236+00	1644	39.04 paid to Parkhill's South (212) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
115	2021-10-21 01:37:06.056745+00	1645	48.77 paid to Walmart (33) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
116	2021-10-21 01:37:22.888878+00	1646	30.46 paid to Costco (199) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
117	2021-10-21 01:37:54.656122+00	349	dosbandidosbixby - 2021-10-13: Cash Sales 164.82, Card Auto Grat: 0, Card Tips: 168.79 	1	[{"added": {}}]	3	2
118	2021-10-21 01:38:33.25271+00	1647	37 paid to Lowes (43) on 2021-10-14 from Cash	1	[{"added": {}}]	2	2
119	2021-10-21 01:38:48.018394+00	1648	63.75 paid to Superior (25) on 2021-10-14 from Cash	1	[{"added": {}}]	2	2
120	2021-10-21 01:39:01.573545+00	350	dosbandidosbixby - 2021-10-14: Cash Sales 164.6, Card Auto Grat: 0, Card Tips: 208.64 	1	[{"added": {}}]	3	2
121	2021-10-21 01:39:36.440966+00	1649	100 paid to Rafael Galue (146) on 2021-10-15 from Cash	1	[{"added": {}}]	2	2
122	2021-10-21 01:40:05.094019+00	1650	68.38 paid to Sams (32) on 2021-10-15 from Cash	1	[{"added": {}}]	2	2
123	2021-10-21 01:40:22.608986+00	351	dosbandidosbixby - 2021-10-15: Cash Sales 196.23, Card Auto Grat: 0, Card Tips: 248.91 	1	[{"added": {}}]	3	2
124	2021-10-21 01:41:49.073686+00	1651	30 paid to Uncategorized Cash Expense (188) on 2021-10-16 from Cash	1	[{"added": {}}]	2	2
125	2021-10-21 01:42:03.767891+00	352	dosbandidosbixby - 2021-10-16: Cash Sales 391.54, Card Auto Grat: 0, Card Tips: 164.31 	1	[{"added": {}}]	3	2
126	2021-10-21 01:42:28.632524+00	1652	10 paid to Uncategorized Cash Expense (188) on 2021-10-17 from Cash	1	[{"added": {}}]	2	2
127	2021-10-21 01:42:42.296907+00	353	dosbandidosbixby - 2021-10-17: Cash Sales 195.20, Card Auto Grat: 0, Card Tips: 253.71 	1	[{"added": {}}]	3	2
128	2021-10-23 15:37:24.91605+00	213	(213) Marcos Vasquez (Labor)	1	[{"added": {}}]	1	2
129	2021-10-23 15:40:22.382257+00	77	(77) 'BIRD*' | Supplier: (Not An Expense)	1	[{"added": {}}]	6	2
130	2021-10-23 15:56:00.696013+00	77	(77) 'HTTPSBIRD.CO' | Supplier: (Not An Expense)	2	[{"changed": {"fields": ["Description"]}}]	6	2
131	2021-10-23 15:58:57.661784+00	214	(214) Barrier Enterprises (Services)	1	[{"added": {}}]	1	2
132	2021-10-23 15:59:33.965686+00	215	(215) Angel Cuevas (Labor)	1	[{"added": {}}]	1	2
133	2021-10-23 16:00:45.549997+00	216	(216) Ximena Martinez (Services)	1	[{"added": {}}]	1	2
134	2021-10-23 16:01:35.136498+00	78	(78) 'FEDEX' | Supplier: (Fedex)	1	[{"added": {}}]	6	2
135	2021-10-23 16:02:42.500498+00	79	(79) 'FIESTA MART' | Supplier: (Fiesta Mart)	1	[{"added": {}}]	6	2
136	2021-10-23 16:03:21.8886+00	217	(217) Alejandra Javier (Food (Miscellaneous))	1	[{"added": {}}]	1	2
137	2021-10-23 16:06:14.779835+00	118	(118) Tanori Lazaro (Labor)	2	[{"changed": {"fields": ["Name"]}}]	1	2
138	2021-10-23 16:07:53.35525+00	218	(218) Thomas Balley (Labor)	1	[{"added": {}}]	1	2
139	2021-10-23 16:11:27.809497+00	219	(219) Georgia M B (Labor)	1	[{"added": {}}]	1	2
140	2021-10-23 16:14:30.553864+00	220	(220) Richard Stewart (Labor)	1	[{"added": {}}]	1	2
141	2021-10-23 16:19:18.164864+00	354	dosbandidosba - 2021-09-30: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
142	2021-10-23 16:20:08.880959+00	355	dosbandidosba - 2021-10-03: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
143	2021-10-23 16:21:22.702136+00	356	dosbandidosba - 2021-10-06: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
144	2021-10-23 16:44:03.626334+00	357	dosbandidosbixby - 2021-09-30: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
145	2021-10-23 16:44:11.088685+00	358	dosbandidosbixby - 2021-10-01: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
146	2021-10-23 16:46:35.996726+00	220	(220) Richard Stewart (Services)	2	[{"changed": {"fields": ["Supplier type", "Comments"]}}]	1	2
147	2021-10-23 22:12:32.504927+00	16	carlos_lopez	1	[{"added": {}}]	10	2
148	2021-10-23 22:13:13.747106+00	1	read_only_users	1	[{"added": {}}]	9	2
149	2021-10-23 22:13:31.107175+00	16	carlos_lopez	2	[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]	10	2
150	2021-10-26 15:17:27.29098+00	221	(221) Loan Payment (Uncategorized)	1	[{"added": {}}]	1	2
151	2021-10-26 15:43:01.352064+00	222	(222) Legal Fees (Uncategorized)	1	[{"added": {}}]	1	2
152	2021-10-26 15:48:24.963847+00	39	(39) 'CARDMEMBER SERV' | Supplier: (Bank Fees)	3		6	2
153	2021-11-14 00:08:19.279244+00	359	dosbandidosba - 2021-10-11: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
154	2021-11-14 00:08:43.372259+00	360	dosbandidosba - 2021-10-12: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
155	2021-11-14 00:10:52.488366+00	2065	32.39 paid to Nam Hai Market (49) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
156	2021-11-14 00:11:18.482127+00	2066	92.86 paid to Walmart (33) on 2021-10-13 from Cash	1	[{"added": {}}]	2	2
157	2021-11-14 00:11:32.341147+00	361	dosbandidosba - 2021-10-13: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
158	2021-11-14 00:11:48.687552+00	362	dosbandidosba - 2021-10-14: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
159	2021-11-14 00:14:39.91928+00	2067	7.32 paid to Dollar General (92) on 2021-10-15 from Cash	1	[{"added": {}}]	2	2
160	2021-11-14 00:15:04.194819+00	2068	63.82 paid to Sams (32) on 2021-10-15 from Cash	1	[{"added": {}}]	2	2
161	2021-11-14 00:15:34.573333+00	363	dosbandidosba - 2021-10-15: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
162	2021-11-14 00:16:15.538103+00	2069	55 paid to Catering (46) on 2021-10-15 from Cash	1	[{"added": {}}]	2	2
163	2021-11-14 00:16:39.642893+00	364	dosbandidosba - 2021-10-16: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
164	2021-11-14 00:17:05.114488+00	2070	56.19 paid to Sams (32) on 2021-10-17 from Cash	1	[{"added": {}}]	2	2
165	2021-11-14 00:17:11.294061+00	365	dosbandidosba - 2021-10-17: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	2
166	2021-11-14 13:36:44.403333+00	17	carlossgv	1	[{"added": {}}]	10	2
167	2021-11-14 13:37:00.590799+00	17	carlossgv	2	[{"changed": {"fields": ["First name", "Last name"]}}]	10	2
168	2021-11-14 13:39:07.47655+00	17	carlossgv	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	10	2
169	2021-11-14 13:56:48.244787+00	1	1 Bixby	1	[{"added": {}}]	13	17
170	2021-11-14 13:56:59.644418+00	2	2 Broken Arrow	1	[{"added": {}}]	13	17
171	2021-11-14 14:15:43.754409+00	102	17232.55 sold from Restaurant Net Sales (68) from 2021-10-18 to 2021-10-24)	1	[{"added": {}}]	4	17
172	2021-11-14 16:04:59.397128+00	197	Broken Arrow | Restaurant Gross Sales | 2021-10-24	1	[{"added": {}}]	5	17
173	2021-11-14 16:05:43.058319+00	198	Broken Arrow | Restaurant Order Count | 2021-10-24	1	[{"added": {}}]	5	17
174	2021-11-14 16:10:08.761756+00	199	Broken Arrow | Restaurant Labor | 2021-10-24	1	[{"added": {}}]	5	17
175	2021-11-14 16:10:44.635223+00	200	Broken Arrow | Restaurant Liquor Sales | 2021-10-24	1	[{"added": {}}]	5	17
311	2021-11-14 19:49:00.152278+00	226	(226) Rosa Jungo (Labor)	1	[{"added": {}}]	1	17
176	2021-11-14 16:11:10.477463+00	201	Broken Arrow | Restaurant Liquor Sales | 2021-10-31	1	[{"added": {}}]	5	17
178	2021-11-14 16:11:53.389285+00	203	Broken Arrow | Restaurant Labor | 2021-10-31	1	[{"added": {}}]	5	17
180	2021-11-14 16:12:30.066249+00	103	16872.41 sold from Restaurant Net Sales (68) from 2021-10-25 to 2021-10-31)	1	[{"added": {}}]	4	17
177	2021-11-14 16:11:34.376383+00	202	Broken Arrow | Restaurant Gross Sales | 2021-10-31	1	[{"added": {}}]	5	17
179	2021-11-14 16:12:06.271447+00	204	Broken Arrow | Restaurant Order Count | 2021-10-31	1	[{"added": {}}]	5	17
181	2021-11-14 16:19:35.823989+00	104	14598.65 sold from Restaurant Net Sales (68) from 2021-11-01 to 2021-11-07)	1	[{"added": {}}]	4	17
182	2021-11-14 16:20:18.274891+00	205	Broken Arrow | Restaurant Gross Sales | 2021-11-07	1	[{"added": {}}]	5	17
183	2021-11-14 16:20:35.23142+00	206	Broken Arrow | Restaurant Labor | 2021-11-07	1	[{"added": {}}]	5	17
184	2021-11-14 16:20:48.755906+00	207	Broken Arrow | Restaurant Order Count | 2021-11-07	1	[{"added": {}}]	5	17
185	2021-11-14 16:21:07.147218+00	208	Broken Arrow | Restaurant Liquor Sales | 2021-11-07	1	[{"added": {}}]	5	17
186	2021-11-14 16:22:56.335884+00	105	9288.76 sold from Restaurant Net Sales (68) from 2021-10-18 to 2021-10-24)	1	[{"added": {}}]	4	17
187	2021-11-14 16:23:11.679905+00	209	Bixby | Restaurant Gross Sales | 2021-10-02	1	[{"added": {}}]	5	17
188	2021-11-14 16:23:26.072514+00	209	Bixby | Restaurant Gross Sales | 2021-10-24	2	[{"changed": {"fields": ["Date"]}}]	5	17
189	2021-11-14 16:24:05.183789+00	210	Bixby | Restaurant Order Count | 2021-10-24	1	[{"added": {}}]	5	17
190	2021-11-14 16:24:45.175928+00	211	Bixby | Restaurant Liquor Sales | 2021-10-24	1	[{"added": {}}]	5	17
191	2021-11-14 16:25:05.828924+00	212	Bixby | Restaurant Labor | 2021-10-02	1	[{"added": {}}]	5	17
192	2021-11-14 16:25:17.071587+00	212	Bixby | Restaurant Labor | 2021-10-24	2	[{"changed": {"fields": ["Date"]}}]	5	17
193	2021-11-14 16:25:45.253383+00	213	Bixby | Restaurant Labor | 2021-10-31	1	[{"added": {}}]	5	17
194	2021-11-14 16:26:14.066181+00	214	Bixby | Restaurant Liquor Sales | 2021-10-31	1	[{"added": {}}]	5	17
195	2021-11-14 16:26:31.391519+00	215	Bixby | Restaurant Gross Sales | 2021-10-31	1	[{"added": {}}]	5	17
196	2021-11-14 16:26:42.761822+00	216	Bixby | Restaurant Order Count | 2021-10-31	1	[{"added": {}}]	5	17
197	2021-11-14 16:26:53.566878+00	106	8122.79 sold from Restaurant Net Sales (68) from 2021-10-25 to 2021-10-31)	1	[{"added": {}}]	4	17
198	2021-11-14 16:27:23.009632+00	107	7727.74 sold from Restaurant Net Sales (68) from 2021-11-01 to 2021-11-07)	1	[{"added": {}}]	4	17
199	2021-11-14 16:27:35.874068+00	217	Bixby | Restaurant Gross Sales | 2021-11-07	1	[{"added": {}}]	5	17
200	2021-11-14 16:27:54.407911+00	218	Bixby | Restaurant Order Count | 2021-11-07	1	[{"added": {}}]	5	17
201	2021-11-14 16:28:07.708913+00	219	Bixby | Restaurant Liquor Sales | 2021-11-07	1	[{"added": {}}]	5	17
202	2021-11-14 16:28:28.119355+00	220	Bixby | Restaurant Labor | 2021-11-07	1	[{"added": {}}]	5	17
203	2021-11-14 16:35:35.258189+00	108	10.15 sold from Uber Eats (71) from 2021-10-18 to 2021-10-24)	1	[{"added": {}}]	4	17
204	2021-11-14 16:37:41.995046+00	109	97.66 sold from Uber Eats (71) from 2021-10-25 to 2021-10-31)	1	[{"added": {}}]	4	17
205	2021-11-14 16:38:50.735363+00	110	82.79 sold from Uber Eats (71) from 2021-11-01 to 2021-11-07)	1	[{"added": {}}]	4	17
206	2021-11-14 16:40:23.417882+00	111	2118.37 sold from Door Dash (70) from 2021-10-18 to 2021-10-24)	1	[{"added": {}}]	4	17
207	2021-11-14 16:40:47.839074+00	112	2274.54 sold from Door Dash (70) from 2021-10-25 to 2021-10-31)	1	[{"added": {}}]	4	17
208	2021-11-14 16:41:06.770622+00	113	2333.76 sold from Door Dash (70) from 2021-11-01 to 2021-11-07)	1	[{"added": {}}]	4	17
209	2021-11-14 18:07:27.100979+00	2071	100 paid to Catering (46) on 2021-10-18 from Cash	1	[{"added": {}}]	2	17
210	2021-11-14 18:07:36.425879+00	366	2 Broken Arrow - 2021-10-18: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
211	2021-11-14 18:08:28.089813+00	367	1 Bixby - 2021-10-18: Cash Sales 427.57, Card Auto Grat: 0, Card Tips: 167.66 	1	[{"added": {}}]	3	17
212	2021-11-14 18:11:41.032336+00	368	2 Broken Arrow - 2021-10-19: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
213	2021-11-14 18:12:22.026184+00	2072	26.52 paid to Walmart (33) on 2021-10-19 from Cash	1	[{"added": {}}]	2	17
214	2021-11-14 18:12:36.783494+00	369	1 Bixby - 2021-10-19: Cash Sales 0, Card Auto Grat: 0, Card Tips: 93 	1	[{"added": {}}]	3	17
215	2021-11-14 18:15:01.319804+00	370	1 Bixby - 2021-10-20: Cash Sales 196.75, Card Auto Grat: 0, Card Tips: 152.13 	1	[{"added": {}}]	3	17
216	2021-11-14 18:15:16.884899+00	371	2 Broken Arrow - 2021-10-20: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
217	2021-11-14 18:15:48.602447+00	2073	62.5 paid to Superior (25) on 2021-10-21 from Cash	1	[{"added": {}}]	2	17
218	2021-11-14 18:16:09.952045+00	2074	23 paid to Cozzini Bros (91) on 2021-10-21 from Cash	1	[{"added": {}}]	2	17
219	2021-11-14 18:17:54.45319+00	2075	271 paid to Cozzini Bros (91) on 2021-10-21 from Cash	1	[{"added": {}}]	2	17
220	2021-11-14 18:18:28.69724+00	2076	107.49 paid to Southern Glazers (Jarboe) (34) on 2021-10-21 from Cash	1	[{"added": {}}]	2	17
221	2021-11-14 18:18:56.003705+00	372	1 Bixby - 2021-10-21: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
222	2021-11-14 18:19:06.330607+00	373	2 Broken Arrow - 2021-10-21: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
223	2021-11-14 18:19:25.165697+00	2077	28 paid to Catering (46) on 2021-10-22 from Cash	1	[{"added": {}}]	2	17
224	2021-11-14 18:19:37.748823+00	374	2 Broken Arrow - 2021-10-22: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
225	2021-11-14 18:19:50.417807+00	375	1 Bixby - 2021-10-22: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
226	2021-11-14 18:20:21.273153+00	2078	45 paid to Catering (46) on 2021-10-23 from Cash	1	[{"added": {}}]	2	17
227	2021-11-14 18:20:37.123389+00	376	2 Broken Arrow - 2021-10-23: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
228	2021-11-14 18:21:00.094831+00	377	1 Bixby - 2021-10-23: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
229	2021-11-14 18:21:20.8842+00	378	1 Bixby - 2021-10-24: Cash Sales 140.15, Card Auto Grat: 0, Card Tips: 305.28 	1	[{"added": {}}]	3	17
230	2021-11-14 18:21:36.728152+00	379	2 Broken Arrow - 2021-10-24: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
231	2021-11-14 18:21:57.112721+00	380	2 Broken Arrow - 2021-10-24: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
232	2021-11-14 18:22:13.592833+00	2079	36.58 paid to Walmart (33) on 2021-10-24 from Cash	1	[{"added": {}}]	2	17
233	2021-11-14 18:22:31.918643+00	380	2 Broken Arrow - 2021-10-24: Cash Sales 0.00, Card Auto Grat: 0.00, Card Tips: 0.00 	3		3	17
234	2021-11-14 18:29:59.712947+00	2080	8 paid to Walmart (33) on 2021-10-06 from Cash	1	[{"added": {}}]	2	17
235	2021-11-14 18:30:35.145214+00	2081	45.27 paid to Supermercados Morelos (44) on 2021-10-06 from Cash	1	[{"added": {}}]	2	17
236	2021-11-14 18:31:01.013082+00	356	2 Broken Arrow - 2021-10-06: Cash Sales 0.00, Card Auto Grat: 0.00, Card Tips: 0.00 	2	[{"changed": {"fields": ["Comments"]}}]	3	17
237	2021-11-14 18:31:32.126032+00	2082	70 paid to Catering (46) on 2021-10-25 from Cash	1	[{"added": {}}]	2	17
238	2021-11-14 18:31:47.242522+00	381	2 Broken Arrow - 2021-10-25: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
240	2021-11-14 18:32:27.761737+00	382	1 Bixby - 2021-10-25: Cash Sales 330.31, Card Auto Grat: 0, Card Tips: 128.93 	1	[{"added": {}}]	3	17
243	2021-11-14 18:34:00.516615+00	385	1 Bixby - 2021-10-27: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
239	2021-11-14 18:32:11.548785+00	2083	19.52 paid to Lowes (43) on 2021-10-25 from Cash	1	[{"added": {}}]	2	17
241	2021-11-14 18:33:03.40226+00	383	1 Bixby - 2021-10-26: Cash Sales 47.82, Card Auto Grat: 0, Card Tips: 115.82 	1	[{"added": {}}]	3	17
242	2021-11-14 18:33:19.718322+00	384	2 Broken Arrow - 2021-10-26: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
244	2021-11-14 18:34:11.652801+00	386	2 Broken Arrow - 2021-10-27: Cash Sales 0, Card Auto Grat: 0, Card Tips: 0 	1	[{"added": {}}]	3	17
245	2021-11-14 18:41:31.719704+00	366	2 Broken Arrow - 2021-10-18: (Checked: False) (Sent: False)	2	[{"changed": {"fields": ["Comments"]}}]	3	17
246	2021-11-14 18:41:43.206948+00	367	1 Bixby - 2021-10-18: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
247	2021-11-14 18:42:41.318153+00	366	2 Broken Arrow - 2021-10-18: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Comments", "IsChecked", "WasSent"]}}]	3	17
248	2021-11-14 18:42:55.732481+00	369	1 Bixby - 2021-10-19: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
249	2021-11-14 18:43:01.449851+00	370	1 Bixby - 2021-10-20: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
250	2021-11-14 18:43:06.238056+00	371	2 Broken Arrow - 2021-10-20: (Checked: False) (Sent: False)	2	[]	3	17
251	2021-11-14 18:43:13.503985+00	374	2 Broken Arrow - 2021-10-22: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
252	2021-11-14 18:43:22.382902+00	376	2 Broken Arrow - 2021-10-23: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
253	2021-11-14 18:43:29.306078+00	378	1 Bixby - 2021-10-24: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
254	2021-11-14 18:43:36.356068+00	381	2 Broken Arrow - 2021-10-25: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
255	2021-11-14 18:43:42.213247+00	382	1 Bixby - 2021-10-25: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
256	2021-11-14 18:44:25.024573+00	383	1 Bixby - 2021-10-26: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
257	2021-11-14 18:44:30.51451+00	384	2 Broken Arrow - 2021-10-26: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
258	2021-11-14 19:03:10.520438+00	2084	63.75 paid to Superior (25) on 2021-10-28 from Cash	1	[{"added": {}}]	2	17
259	2021-11-14 19:03:39.717672+00	389	1 Bixby - 2021-10-28: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
260	2021-11-14 19:04:21.719008+00	2085	63.17 paid to Restaurant Equipment and Supply (51) on 2021-10-28 from Cash	1	[{"added": {}}]	2	17
261	2021-11-14 19:04:45.710103+00	2085	63.17 paid to Restaurant Equipment and Supply (51) on 2021-10-28 from Cash	2	[]	2	17
262	2021-11-14 19:05:05.011082+00	2086	31.64 paid to WinCo Foods (160) on 2021-10-28 from Cash	1	[{"added": {}}]	2	17
263	2021-11-14 19:05:07.063363+00	390	2 Broken Arrow - 2021-10-28: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
264	2021-11-14 19:05:33.127691+00	391	1 Bixby - 2021-10-29: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
265	2021-11-14 19:06:01.915708+00	2087	10.47 paid to Walmart (33) on 2021-10-29 from Cash	1	[{"added": {}}]	2	17
266	2021-11-14 19:06:06.303579+00	392	2 Broken Arrow - 2021-10-29: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
267	2021-11-14 19:06:35.731173+00	2088	15.20 paid to Two Parts Liquor (80) on 2021-10-30 from Cash	1	[{"added": {}}]	2	17
268	2021-11-14 19:07:02.718993+00	2089	55.6 paid to Walmart (33) on 2021-10-30 from Cash	1	[{"added": {}}]	2	17
269	2021-11-14 19:07:22.860712+00	2090	24.83 paid to Walmart (33) on 2021-10-30 from Cash	1	[{"added": {}}]	2	17
270	2021-11-14 19:07:50.550415+00	393	1 Bixby - 2021-10-30: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
271	2021-11-14 19:08:03.397943+00	394	2 Broken Arrow - 2021-10-30: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
272	2021-11-14 19:08:27.525436+00	2091	45.32 paid to Walmart (33) on 2021-10-31 from Cash	1	[{"added": {}}]	2	17
273	2021-11-14 19:08:44.136353+00	2092	19.52 paid to Lowes (43) on 2021-10-31 from Cash	1	[{"added": {}}]	2	17
274	2021-11-14 19:08:58.345475+00	2093	71.81 paid to Sams (32) on 2021-10-31 from Cash	1	[{"added": {}}]	2	17
275	2021-11-14 19:09:18.5011+00	2094	18.44 paid to Supermercados Morelos (44) on 2021-10-31 from Cash	1	[{"added": {}}]	2	17
276	2021-11-14 19:09:31.693689+00	395	1 Bixby - 2021-10-31: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
277	2021-11-14 19:09:55.872082+00	2095	22.47 paid to Walgreens (98) on 2021-10-31 from Cash	1	[{"added": {}}]	2	17
278	2021-11-14 19:09:59.734957+00	396	2 Broken Arrow - 2021-10-31: (Checked: True) (Sent: True)	1	[{"added": {}}]	3	17
279	2021-11-14 19:19:53.689217+00	223	(223) Refund (Uncategorized)	1	[{"added": {}}]	1	17
280	2021-11-14 19:20:19.414904+00	2096	78 paid to Refund (223) on 2021-11-07 from Cash	1	[{"added": {}}]	2	17
281	2021-11-14 19:20:36.653802+00	409	1 Bixby - 2021-11-07: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card tips", "IsChecked", "WasSent"]}}]	3	17
282	2021-11-14 19:21:29.091531+00	2097	16.27 paid to Country Mart (47) on 2021-11-05 from Cash	1	[{"added": {}}]	2	17
283	2021-11-14 19:21:48.616643+00	2098	60.91 paid to Two Parts Liquor (80) on 2021-11-05 from Cash	1	[{"added": {}}]	2	17
284	2021-11-14 19:22:10.987291+00	405	1 Bixby - 2021-11-05: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card tips", "IsChecked", "WasSent"]}}]	3	17
285	2021-11-14 19:22:31.66455+00	224	(224) City Tickets (Uncategorized)	1	[{"added": {}}]	1	17
286	2021-11-14 19:22:48.261862+00	2099	30 paid to City Tickets (224) on 2021-11-05 from Cash	1	[{"added": {}}]	2	17
287	2021-11-14 19:23:32.634657+00	2100	27.50 paid to Superior (25) on 2021-11-04 from Cash	1	[{"added": {}}]	2	17
288	2021-11-14 19:23:53.719123+00	2101	23 paid to Cozzini Bros (91) on 2021-11-04 from Cash	1	[{"added": {}}]	2	17
289	2021-11-14 19:24:12.242557+00	403	1 Bixby - 2021-11-04: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card tips", "IsChecked", "WasSent"]}}]	3	17
290	2021-11-14 19:25:01.086622+00	407	1 Bixby - 2021-11-06: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card tips", "IsChecked", "WasSent"]}}]	3	17
291	2021-11-14 19:25:34.708395+00	2102	76.11 paid to Two Parts Liquor (80) on 2021-11-06 from Cash	1	[{"added": {}}]	2	17
292	2021-11-14 19:25:52.524013+00	2103	15 paid to Kum & Go (48) on 2021-11-06 from Cash	1	[{"added": {}}]	2	17
293	2021-11-14 19:26:07.166056+00	2104	128.30 paid to Walmart (33) on 2021-11-06 from Cash	1	[{"added": {}}]	2	17
294	2021-11-14 19:26:29.070402+00	2105	16.88 paid to Wine Rack (40) on 2021-11-06 from Cash	1	[{"added": {}}]	2	17
295	2021-11-14 19:26:46.192594+00	2106	76.84 paid to Sams (32) on 2021-11-06 from Cash	1	[{"added": {}}]	2	17
296	2021-11-14 19:27:05.404806+00	2107	8.69 paid to Country Mart (47) on 2021-11-06 from Cash	1	[{"added": {}}]	2	17
297	2021-11-14 19:28:28.920661+00	405	1 Bixby - 2021-11-05: (Checked: True) (Sent: True)	2	[]	3	17
298	2021-11-14 19:28:48.343136+00	401	1 Bixby - 2021-11-03: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card tips", "IsChecked", "WasSent"]}}]	3	17
299	2021-11-14 19:29:20.800956+00	399	1 Bixby - 2021-11-02: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card tips", "IsChecked", "WasSent"]}}]	3	17
300	2021-11-14 19:29:48.687996+00	2108	5.26 paid to Country Mart (47) on 2021-11-02 from Cash	1	[{"added": {}}]	2	17
301	2021-11-14 19:30:13.213461+00	2109	134 paid to Marcos Vasquez (213) on 2021-11-02 from Cash	1	[{"added": {}}]	2	17
302	2021-11-14 19:30:32.710674+00	2110	11 paid to Cash Withdrawal (62) on 2021-11-02 from Cash	1	[{"added": {}}]	2	17
303	2021-11-14 19:31:20.806748+00	2111	25.91 paid to Nam Hai Market (49) on 2021-11-02 from Cash	1	[{"added": {}}]	2	17
304	2021-11-14 19:31:35.917689+00	2112	16.49 paid to Walmart (33) on 2021-11-02 from Cash	1	[{"added": {}}]	2	17
305	2021-11-14 19:32:02.40063+00	2113	77.56 paid to Sams (32) on 2021-11-02 from Cash	1	[{"added": {}}]	2	17
306	2021-11-14 19:32:54.618053+00	2114	3.13 paid to Walmart (33) on 2021-11-01 from Cash	1	[{"added": {}}]	2	17
307	2021-11-14 19:33:24.057074+00	397	1 Bixby - 2021-11-01: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Cash sales", "Card auto grat", "Card tips", "IsChecked", "WasSent"]}}]	3	17
308	2021-11-14 19:33:45.708324+00	2115	55.09 paid to Walmart (33) on 2021-11-01 from Cash	1	[{"added": {}}]	2	17
309	2021-11-14 19:33:53.034889+00	398	2 Broken Arrow - 2021-11-01: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["IsChecked", "WasSent"]}}]	3	17
310	2021-11-14 19:46:37.86741+00	225	(225) Reese Erickson (Labor)	1	[{"added": {}}]	1	17
312	2021-11-14 20:08:23.513696+00	227	(227) Vanessa Gray (Labor)	1	[{"added": {}}]	1	17
313	2021-11-14 20:15:03.370284+00	80	(80) 'Farmers' | Supplier: (Farmers)	1	[{"added": {}}]	6	17
314	2021-11-26 16:16:41.489167+00	228	(228) Zephyr Hardware (Services)	1	[{"added": {}}]	1	17
315	2021-11-26 16:19:34.402896+00	118	(118) Lazaro Tanori (Labor)	2	[{"changed": {"fields": ["Name"]}}]	1	17
316	2021-11-26 16:23:23.343126+00	81	(81) 'WM SUPERCENTER' | Supplier: (Walmart)	1	[{"added": {}}]	6	17
317	2021-11-26 16:26:41.529915+00	229	(229) Kalley Miesner (Labor)	1	[{"added": {}}]	1	17
318	2021-11-26 16:34:10.537513+00	230	(230) Food Cost (Uncategorized) (Food (Miscellaneous))	1	[{"added": {}}]	1	17
319	2021-11-26 16:35:15.982364+00	231	(231) Cesar Guzman (Labor)	1	[{"added": {}}]	1	17
320	2021-11-26 16:36:28.3729+00	82	(82) 'NSF RETURN ITEM FEE' | Supplier: (Bank Fees)	1	[{"added": {}}]	6	17
321	2021-11-26 22:13:50.807028+00	114	16239.75 sold from Restaurant Net Sales (68) from 2021-11-08 to 2021-11-14)	1	[{"added": {}}]	4	17
322	2021-11-26 22:14:06.219204+00	221	Broken Arrow | Restaurant Gross Sales | 2021-11-14	1	[{"added": {}}]	5	17
323	2021-11-26 22:14:19.529891+00	222	Broken Arrow | Restaurant Labor | 2021-11-14	1	[{"added": {}}]	5	17
324	2021-11-26 22:14:33.443272+00	223	Broken Arrow | Restaurant Order Count | 2021-11-14	1	[{"added": {}}]	5	17
325	2021-11-26 22:14:54.086518+00	224	Broken Arrow | Restaurant Liquor Sales | 2021-11-14	1	[{"added": {}}]	5	17
326	2021-11-26 22:15:27.751563+00	225	Broken Arrow | Restaurant Liquor Sales | 2021-11-21	1	[{"added": {}}]	5	17
327	2021-11-26 22:15:48.449856+00	226	Broken Arrow | Restaurant Gross Sales | 2021-11-21	1	[{"added": {}}]	5	17
328	2021-11-26 22:16:01.42932+00	227	Broken Arrow | Restaurant Labor | 2021-11-21	1	[{"added": {}}]	5	17
329	2021-11-26 22:16:21.621695+00	228	Broken Arrow | Restaurant Order Count | 2021-11-21	1	[{"added": {}}]	5	17
330	2021-11-26 22:16:36.757159+00	115	16631.35 sold from Restaurant Net Sales (68) from 2021-11-15 to 2021-11-21)	1	[{"added": {}}]	4	17
331	2021-11-26 22:19:09.734906+00	116	1815.98 sold from Door Dash (70) from 2021-11-08 to 2021-11-14)	1	[{"added": {}}]	4	17
332	2021-11-26 22:19:26.924043+00	117	1878.25 sold from Door Dash (70) from 2021-11-15 to 2021-11-21)	1	[{"added": {}}]	4	17
333	2021-11-26 22:22:20.891133+00	118	211.4 sold from Uber Eats (71) from 2021-11-08 to 2021-11-14)	1	[{"added": {}}]	4	17
334	2021-11-26 22:23:17.301283+00	119	172.23 sold from Uber Eats (71) from 2021-11-15 to 2021-11-21)	1	[{"added": {}}]	4	17
335	2021-11-26 22:26:15.170986+00	120	7893.62 sold from Restaurant Net Sales (68) from 2021-11-08 to 2021-11-14)	1	[{"added": {}}]	4	17
336	2021-11-26 22:26:30.951018+00	229	Bixby | Restaurant Gross Sales | 2021-11-14	1	[{"added": {}}]	5	17
337	2021-11-26 22:26:57.407189+00	230	Bixby | Restaurant Labor | 2021-11-14	1	[{"added": {}}]	5	17
338	2021-11-26 22:27:20.503918+00	231	Bixby | Restaurant Liquor Sales | 2021-11-14	1	[{"added": {}}]	5	17
339	2021-11-26 22:27:34.107513+00	232	Bixby | Restaurant Order Count | 2021-11-14	1	[{"added": {}}]	5	17
340	2021-11-26 22:27:52.968312+00	121	7018.70 sold from Restaurant Net Sales (68) from 2021-11-15 to 2021-11-21)	1	[{"added": {}}]	4	17
341	2021-11-26 22:28:07.989945+00	233	Bixby | Restaurant Gross Sales | 2021-11-21	1	[{"added": {}}]	5	17
342	2021-11-26 22:28:24.977214+00	234	Bixby | Restaurant Labor | 2021-11-21	1	[{"added": {}}]	5	17
343	2021-11-26 22:28:41.068915+00	235	Bixby | Restaurant Liquor Sales | 2021-11-21	1	[{"added": {}}]	5	17
344	2021-11-26 22:28:41.324177+00	236	Bixby | Restaurant Liquor Sales | 2021-11-21	1	[{"added": {}}]	5	17
345	2021-11-26 22:28:53.049038+00	237	Bixby | Restaurant Order Count | 2021-11-21	1	[{"added": {}}]	5	17
346	2021-11-26 22:36:10.916409+00	2388	48.96 paid to Country Mart (47) on 2021-11-09 from Cash	1	[{"added": {}}]	2	17
347	2021-11-26 22:38:24.636503+00	2389	49.68 paid to Wine Rack (40) on 2021-11-11 from Cash	1	[{"added": {}}]	2	17
348	2021-11-26 22:38:53.365169+00	2390	24.99 paid to Two Parts Liquor (80) on 2021-11-10 from Cash	1	[{"added": {}}]	2	17
349	2021-11-26 22:41:16.072812+00	2391	63.75 paid to Superior (25) on 2021-11-11 from Cash	1	[{"added": {}}]	2	17
350	2021-11-26 22:43:35.406611+00	2392	34.86 paid to Lowes (43) on 2021-11-13 from Cash	1	[{"added": {}}]	2	17
351	2021-11-26 22:43:54.329203+00	2393	45.70 paid to Two Parts Liquor (80) on 2021-11-13 from Cash	1	[{"added": {}}]	2	17
352	2021-11-26 23:00:29.61709+00	2394	12 paid to QuickTrip (97) on 2021-11-18 from Cash	1	[{"added": {}}]	2	17
353	2021-11-26 23:00:46.104534+00	2395	50 paid to Catering (46) on 2021-11-18 from Cash	1	[{"added": {}}]	2	17
354	2021-11-26 23:01:51.755157+00	2396	63.75 paid to Superior (25) on 2021-11-18 from Cash	1	[{"added": {}}]	2	17
355	2021-11-26 23:02:43.42149+00	2397	44.13 paid to Country Mart (47) on 2021-11-19 from Cash	1	[{"added": {}}]	2	17
356	2021-11-26 23:03:09.610966+00	2398	19.68 paid to Sams (32) on 2021-11-19 from Cash	1	[{"added": {}}]	2	17
357	2021-11-26 23:03:47.912802+00	2399	4.13 paid to Country Mart (47) on 2021-11-20 from Cash	1	[{"added": {}}]	2	17
358	2021-12-08 14:02:47.731818+00	232	(232) World Liquors (Liquor (Miscellaneous))	1	[{"added": {}}]	1	17
359	2021-12-08 14:03:12.99352+00	83	(83) 'Wal-Mart' | Supplier: (Walmart)	1	[{"added": {}}]	6	17
360	2021-12-08 14:03:34.200704+00	84	(84) 'NAM HAI' | Supplier: (Nam Hai Market)	1	[{"added": {}}]	6	17
361	2021-12-08 14:08:28.588016+00	233	(233) Chase Cox (Labor)	1	[{"added": {}}]	1	17
362	2021-12-08 14:27:02.743887+00	2527	28.59 paid to Supermercados Morelos (44) on 2021-11-24 from Cash	1	[{"added": {}}]	2	17
363	2021-12-08 14:27:26.049254+00	2528	63.75 paid to Superior (25) on 2021-11-24 from Cash	1	[{"added": {}}]	2	17
364	2021-12-08 14:32:05.968547+00	2529	7.14 paid to QuickTrip (97) on 2021-11-27 from Cash	1	[{"added": {}}]	2	17
365	2021-12-08 14:40:50.521314+00	2530	22.74 paid to Country Mart (47) on 2021-11-30 from Cash	1	[{"added": {}}]	2	17
366	2021-12-08 14:41:44.932358+00	2531	24.83 paid to Dollar General (92) on 2021-12-01 from Cash	1	[{"added": {}}]	2	17
367	2021-12-08 14:43:33.997982+00	2532	63.75 paid to Superior (25) on 2021-12-02 from Cash	1	[{"added": {}}]	2	17
368	2021-12-08 14:44:35.528024+00	2533	15.2 paid to Two Parts Liquor (80) on 2021-12-03 from Cash	1	[{"added": {}}]	2	17
369	2021-12-08 14:47:00.787175+00	2534	67.48 paid to Lowes (43) on 2021-12-02 from Cash	1	[{"added": {}}]	2	17
370	2021-12-08 14:47:25.068107+00	234	(234) Karen (Labor)	1	[{"added": {}}]	1	17
371	2021-12-08 14:47:43.271465+00	2535	60 paid to Karen (234) on 2021-12-02 from Cash	1	[{"added": {}}]	2	17
372	2021-12-08 14:48:47.522207+00	2536	56.16 paid to Sams (32) on 2021-12-03 from Cash	1	[{"added": {}}]	2	17
373	2021-12-08 14:49:02.213466+00	2537	43.37 paid to QuickTrip (97) on 2021-12-03 from Cash	1	[{"added": {}}]	2	17
374	2021-12-08 14:50:24.602263+00	235	(235) Labor Uncategorized (Labor)	1	[{"added": {}}]	1	17
375	2021-12-08 14:50:45.415767+00	2538	213 paid to Labor Uncategorized (235) on 2021-12-03 from Cash	1	[{"added": {}}]	2	17
376	2021-12-08 14:52:13.723924+00	234	(234) Karen Adrian (Labor)	2	[{"changed": {"fields": ["Name"]}}]	1	17
377	2021-12-08 20:29:31.333574+00	85	(85) 'FACEBK' | Supplier: (Marketing)	1	[{"added": {}}]	6	17
378	2021-12-08 20:30:13.648582+00	236	(236) Dollar Tree (Food (Miscellaneous))	1	[{"added": {}}]	1	17
379	2021-12-08 20:31:29.799094+00	122	14537.63 sold from Restaurant Net Sales (68) from 2021-11-22 to 2021-11-28)	1	[{"added": {}}]	4	17
380	2021-12-08 20:31:49.00904+00	123	16583.34 sold from Restaurant Net Sales (68) from 2021-11-29 to 2021-12-05)	1	[{"added": {}}]	4	17
381	2021-12-08 20:32:15.416388+00	238	Broken Arrow | Restaurant Gross Sales | 2021-11-28	1	[{"added": {}}]	5	17
382	2021-12-08 20:32:29.436656+00	239	Broken Arrow | Restaurant Labor | 2021-11-28	1	[{"added": {}}]	5	17
383	2021-12-08 20:32:44.732503+00	240	Broken Arrow | Restaurant Order Count | 2021-11-28	1	[{"added": {}}]	5	17
384	2021-12-08 20:33:17.089621+00	241	Broken Arrow | Restaurant Liquor Sales | 2021-11-28	1	[{"added": {}}]	5	17
385	2021-12-08 20:33:38.524985+00	242	Broken Arrow | Restaurant Liquor Sales | 2021-12-05	1	[{"added": {}}]	5	17
386	2021-12-08 20:33:56.547379+00	243	Broken Arrow | Restaurant Gross Sales | 2021-12-05	1	[{"added": {}}]	5	17
387	2021-12-08 20:34:12.319158+00	244	Broken Arrow | Restaurant Labor | 2021-12-05	1	[{"added": {}}]	5	17
388	2021-12-08 20:34:30.539904+00	245	Broken Arrow | Restaurant Order Count | 2021-12-05	1	[{"added": {}}]	5	17
389	2021-12-08 20:35:40.863637+00	124	5781.89 sold from Restaurant Net Sales (68) from 2021-11-22 to 2021-11-28)	1	[{"added": {}}]	4	17
390	2021-12-08 20:36:02.119086+00	125	7015.13 sold from Restaurant Net Sales (68) from 2021-11-29 to 2021-12-05)	1	[{"added": {}}]	4	17
391	2021-12-08 20:36:37.671055+00	246	Bixby | Restaurant Gross Sales | 2021-11-28	1	[{"added": {}}]	5	17
392	2021-12-08 20:37:05.188305+00	247	Bixby | Restaurant Labor | 2021-11-28	1	[{"added": {}}]	5	17
393	2021-12-08 20:37:27.803148+00	248	Bixby | Restaurant Liquor Sales | 2021-11-28	1	[{"added": {}}]	5	17
394	2021-12-08 20:37:43.72549+00	249	Broken Arrow | Restaurant Order Count | 2021-11-28	1	[{"added": {}}]	5	17
395	2021-12-08 20:38:06.263548+00	249	Broken Arrow | Restaurant Order Count | 2021-11-28	3		5	17
396	2021-12-08 20:38:32.42751+00	250	Bixby | Restaurant Order Count | 2021-11-28	1	[{"added": {}}]	5	17
397	2021-12-08 20:38:48.867278+00	251	Bixby | Restaurant Gross Sales | 2021-12-05	1	[{"added": {}}]	5	17
398	2021-12-08 20:39:11.464945+00	252	Bixby | Restaurant Labor | 2021-12-05	1	[{"added": {}}]	5	17
399	2021-12-08 20:39:27.876444+00	253	Bixby | Restaurant Liquor Sales | 2021-12-05	1	[{"added": {}}]	5	17
400	2021-12-08 20:39:44.012098+00	254	Bixby | Restaurant Order Count | 2021-12-05	1	[{"added": {}}]	5	17
401	2021-12-08 20:42:24.474584+00	126	1716.36 sold from Door Dash (70) from 2021-11-22 to 2021-11-28)	1	[{"added": {}}]	4	17
402	2021-12-08 20:42:48.24501+00	127	1428.85 sold from Door Dash (70) from 2021-11-29 to 2021-12-05)	1	[{"added": {}}]	4	17
403	2021-12-08 20:44:47.129285+00	128	126.95 sold from Uber Eats (71) from 2021-11-22 to 2021-11-28)	1	[{"added": {}}]	4	17
404	2021-12-08 20:45:34.831966+00	129	247.86 sold from Uber Eats (71) from 2021-11-29 to 2021-12-05)	1	[{"added": {}}]	4	17
405	2021-12-28 22:20:59.405788+00	86	(86) 'COUNTRY MA' | Supplier: (Country Mart)	1	[{"added": {}}]	6	17
406	2021-12-28 22:22:23.989182+00	237	(237) Zachary DuBois (Labor)	1	[{"added": {}}]	1	17
407	2021-12-28 22:23:00.460263+00	238	(238) Teodoro Mendez (Labor)	1	[{"added": {}}]	1	17
408	2021-12-28 22:24:15.126826+00	87	(87) 'Two Parts Liquor' | Supplier: (Two Parts Liquor)	1	[{"added": {}}]	6	17
409	2021-12-28 22:24:59.614801+00	88	(88) 'PARKHILL'S' | Supplier: (Parkhill Liquor)	1	[{"added": {}}]	6	17
410	2021-12-28 22:26:00.545061+00	239	(239) Jessi Rosas (Labor)	1	[{"added": {}}]	1	17
411	2021-12-28 22:31:33.472134+00	89	(89) 'KUM&' | Supplier: (Kum & Go)	1	[{"added": {}}]	6	17
412	2021-12-28 22:37:05.677958+00	90	(90) 'Wire Transfer Fee' | Supplier: (Bank Fees)	1	[{"added": {}}]	6	17
413	2021-12-28 22:50:34.568682+00	91	(91) 'AUTO-CHLOR' | Supplier: (Autochlor)	1	[{"added": {}}]	6	17
414	2021-12-29 01:32:05.559946+00	240	(240) Martha Jungo (Labor)	1	[{"added": {}}]	1	17
415	2021-12-29 01:35:16.799942+00	92	(92) 'CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -' | Supplier: (Transfers Between Accounts)	1	[{"added": {}}]	6	17
416	2021-12-29 01:39:53.716324+00	93	(93) 'SCULPTURE HOSP' | Supplier: (Sculpture Hospitality)	1	[{"added": {}}]	6	17
417	2021-12-29 01:41:13.592064+00	2507	1000.00 paid to Barrier Enterprises (214) on 2021-11-30 from Primary Account	2	[{"changed": {"fields": ["Restaurant"]}}]	2	17
418	2021-12-29 01:57:20.090655+00	94	(94) 'Transfer to Loan' | Supplier: (Loan Payment)	1	[{"added": {}}]	6	17
419	2021-12-29 02:12:03.720124+00	241	(241) Omar Maduro Decorations (Services)	1	[{"added": {}}]	1	17
420	2021-12-29 02:13:33.820351+00	242	(242) Jordan Westerfield (Labor)	1	[{"added": {}}]	1	17
421	2021-12-29 02:17:09.897053+00	243	(243) Casanovas Handyman (Services)	1	[{"added": {}}]	1	17
422	2021-12-29 02:20:14.734114+00	244	(244) Caleb Forster (Labor)	1	[{"added": {}}]	1	17
423	2021-12-29 02:20:55.947325+00	95	(95) 'CASANOVAS' | Supplier: (Casanovas Handyman)	1	[{"added": {}}]	6	17
424	2021-12-29 02:21:38.83796+00	2571	713.91 paid to Caleb Forster (244) on 2021-12-17 from Primary Account	2	[{"changed": {"fields": ["Supplier"]}}]	2	17
425	2021-12-29 02:43:08.309832+00	18	bamanagers	1	[{"added": {}}]	10	17
426	2021-12-29 02:43:59.643309+00	18	bamanagers	2	[{"changed": {"fields": ["Groups"]}}]	10	17
427	2021-12-30 20:50:37.726067+00	2722	25 paid to Catering (46) on 2021-12-06 from Cash	1	[{"added": {}}]	2	17
428	2021-12-30 20:52:20.223135+00	2723	9.26 paid to Dollar General (92) on 2021-12-08 from Cash	1	[{"added": {}}]	2	17
429	2021-12-30 20:52:49.719885+00	2724	63.75 paid to Superior (25) on 2021-12-09 from Cash	1	[{"added": {}}]	2	17
430	2021-12-30 20:53:40.184792+00	2725	20.11 paid to Lowes (43) on 2021-12-10 from Cash	1	[{"added": {}}]	2	17
431	2021-12-30 20:55:29.301157+00	2726	64.85 paid to Nam Hai Market (49) on 2021-12-10 from Cash	1	[{"added": {}}]	2	17
432	2021-12-30 20:56:36.827433+00	245	(245) Burtons Liquor Mart (Liquor (Miscellaneous))	1	[{"added": {}}]	1	17
433	2021-12-30 20:57:04.849877+00	2727	100.32 paid to Burtons Liquor Mart (245) on 2021-12-10 from Cash	1	[{"added": {}}]	2	17
434	2021-12-30 21:11:17.6172+00	2728	20 paid to Diego Gallego (95) on 2021-12-10 from Cash	1	[{"added": {}}]	2	17
435	2021-12-30 21:12:10.832233+00	2729	13.03 paid to Lowes (43) on 2021-12-13 from Cash	1	[{"added": {}}]	2	17
436	2021-12-30 21:12:56.225279+00	2730	14.33 paid to Country Mart (47) on 2021-12-14 from Cash	1	[{"added": {}}]	2	17
437	2021-12-30 21:16:42.940833+00	2731	26.05 paid to Country Mart (47) on 2021-12-17 from Cash	1	[{"added": {}}]	2	17
438	2021-12-30 21:17:00.859693+00	2732	2.13 paid to Walmart (33) on 2021-12-17 from Cash	1	[{"added": {}}]	2	17
439	2021-12-30 21:17:24.697705+00	2733	12.80 paid to Lowes (43) on 2021-12-17 from Cash	1	[{"added": {}}]	2	17
440	2021-12-30 21:18:08.632887+00	2734	5.30 paid to Walmart (33) on 2021-12-18 from Cash	1	[{"added": {}}]	2	17
441	2021-12-30 21:20:40.193482+00	2735	8.26 paid to Kum & Go (48) on 2021-12-18 from Cash	1	[{"added": {}}]	2	17
442	2021-12-30 21:22:01.35846+00	2736	5.32 paid to Walmart (33) on 2021-12-18 from Cash	1	[{"added": {}}]	2	17
443	2021-12-30 21:25:26.944478+00	2737	62.89 paid to World Liquors (232) on 2021-12-17 from Cash	1	[{"added": {}}]	2	17
444	2021-12-30 21:25:49.42736+00	2738	30 paid to SGC (29) on 2021-12-17 from Cash	1	[{"added": {}}]	2	17
445	2021-12-30 21:38:01.753702+00	2739	8.67 paid to Country Mart (47) on 2021-12-22 from Cash	1	[{"added": {}}]	2	17
446	2021-12-30 21:38:22.115938+00	2740	140.03 paid to Superior (25) on 2021-12-22 from Cash	1	[{"added": {}}]	2	17
447	2021-12-30 21:40:38.001709+00	2741	7.14 paid to QuickTrip (97) on 2021-11-26 from Cash	1	[{"added": {}}]	2	17
448	2021-12-30 21:40:54.117945+00	2742	20 paid to Diego Gallego (95) on 2021-11-26 from Cash	1	[{"added": {}}]	2	17
449	2021-12-30 21:42:25.522853+00	2743	14 paid to Noah Watkins (206) on 2021-12-21 from Cash	1	[{"added": {}}]	2	17
450	2021-12-30 21:42:59.114003+00	2744	20 paid to Diego Gallego (95) on 2021-12-24 from Cash	1	[{"added": {}}]	2	17
451	2021-12-30 21:44:50.764209+00	246	Coney I-Lander (Food (Miscellaneous) (246))	1	[{"added": {}}]	1	17
452	2021-12-30 21:45:13.885046+00	2745	24.6 paid to Coney I-Lander (246) on 2021-12-24 from Cash	1	[{"added": {}}]	2	17
453	2021-12-30 21:48:03.18417+00	247	Andolinis (Uncategorized (247))	1	[{"added": {}}]	1	17
454	2021-12-30 21:48:12.613184+00	246	Coney I-Lander (Uncategorized (246))	2	[{"changed": {"fields": ["Supplier type"]}}]	1	17
455	2021-12-30 21:51:42.794671+00	2746	15.58 paid to Supermercados Morelos (44) on 2021-12-26 from Cash	1	[{"added": {}}]	2	17
456	2021-12-30 22:07:28.140136+00	2747	280 paid to Francisco Ponce (5) on 2021-11-29 from Cash	1	[{"added": {}}]	2	17
457	2021-12-30 22:09:13.957307+00	2748	41.72 paid to Sams (32) on 2021-11-24 from Cash	1	[{"added": {}}]	2	17
458	2021-12-30 22:09:56.447171+00	2749	6.34 paid to Nam Hai Market (49) on 2021-11-21 from Cash	1	[{"added": {}}]	2	17
459	2021-12-30 22:10:14.443783+00	2750	48.64 paid to B&B Liquor (39) on 2021-11-21 from Cash	1	[{"added": {}}]	2	17
460	2021-12-30 22:11:11.050957+00	2751	50 paid to Francisco Ponce (5) on 2021-11-21 from Cash	1	[{"added": {}}]	2	17
461	2021-12-30 22:11:17.30359+00	2749	56.34 paid to Nam Hai Market (49) on 2021-11-21 from Cash	2	[{"changed": {"fields": ["Amount"]}}]	2	17
462	2021-12-30 22:12:37.647391+00	2752	41.72 paid to Sams (32) on 2021-11-24 from Cash	1	[{"added": {}}]	2	17
463	2021-12-30 22:42:54.052138+00	130	19274.01 sold from Restaurant Net Sales (68) from 2021-12-06 to 2021-12-12)	1	[{"added": {}}]	4	17
464	2021-12-30 22:43:11.544119+00	131	20891.63 sold from Restaurant Net Sales (68) from 2021-12-13 to 2021-12-19)	1	[{"added": {}}]	4	17
465	2021-12-30 22:43:30.60891+00	132	16867.24 sold from Restaurant Net Sales (68) from 2021-12-20 to 2021-12-26)	1	[{"added": {}}]	4	17
466	2021-12-30 22:44:04.67699+00	255	Broken Arrow | Restaurant Gross Sales | 2021-12-12	1	[{"added": {}}]	5	17
467	2021-12-30 22:44:20.812737+00	256	Broken Arrow | Restaurant Gross Sales | 2021-12-12	1	[{"added": {}}]	5	17
468	2021-12-30 22:44:33.044726+00	257	Broken Arrow | Restaurant Gross Sales | 2021-12-12	1	[{"added": {}}]	5	17
469	2021-12-30 22:45:02.941233+00	258	Broken Arrow | Restaurant Labor | 2021-12-12	1	[{"added": {}}]	5	17
470	2021-12-30 22:45:16.483478+00	259	Broken Arrow | Restaurant Labor | 2021-12-12	1	[{"added": {}}]	5	17
471	2021-12-30 22:45:26.812138+00	260	Broken Arrow | Restaurant Labor | 2021-12-12	1	[{"added": {}}]	5	17
472	2021-12-30 22:45:51.784844+00	261	Broken Arrow | Restaurant Order Count | 2021-12-12	1	[{"added": {}}]	5	17
475	2021-12-30 22:47:16.756567+00	264	Broken Arrow | Restaurant Liquor Sales | 2021-12-12	1	[{"added": {}}]	5	17
477	2021-12-30 22:47:57.668231+00	266	Broken Arrow | Restaurant Liquor Sales | 2021-12-26	1	[{"added": {}}]	5	17
473	2021-12-30 22:46:09.934683+00	262	Broken Arrow | Restaurant Order Count | 2021-12-19	1	[{"added": {}}]	5	17
474	2021-12-30 22:46:27.714522+00	263	Broken Arrow | Restaurant Order Count | 2021-12-26	1	[{"added": {}}]	5	17
476	2021-12-30 22:47:35.282155+00	265	Broken Arrow | Restaurant Liquor Sales | 2021-12-19	1	[{"added": {}}]	5	17
478	2021-12-30 22:51:55.907471+00	267	Bixby | Restaurant Gross Sales | 2021-12-12	1	[{"added": {}}]	5	17
479	2021-12-30 22:52:09.91069+00	268	Bixby | Restaurant Labor | 2021-12-12	1	[{"added": {}}]	5	17
480	2021-12-30 22:53:58.994297+00	269	Bixby | Restaurant Liquor Sales | 2021-12-12	1	[{"added": {}}]	5	17
481	2021-12-30 22:54:14.671421+00	270	Bixby | Restaurant Order Count | 2021-12-12	1	[{"added": {}}]	5	17
482	2021-12-30 22:56:04.287553+00	133	9159.88 sold from Restaurant Net Sales (68) from 2021-12-06 to 2021-12-12)	1	[{"added": {}}]	4	17
483	2021-12-30 22:56:18.784697+00	134	5512.54 sold from Restaurant Net Sales (68) from 2021-12-13 to 2021-12-19)	1	[{"added": {}}]	4	17
484	2021-12-30 22:56:35.744259+00	271	Bixby | Restaurant Gross Sales | 2021-12-19	1	[{"added": {}}]	5	17
485	2021-12-30 22:58:19.009802+00	272	Bixby | Restaurant Labor | 2021-12-19	1	[{"added": {}}]	5	17
486	2021-12-30 23:00:09.945513+00	273	Bixby | Restaurant Liquor Sales | 2021-12-19	1	[{"added": {}}]	5	17
487	2021-12-30 23:00:25.918656+00	274	Bixby | Restaurant Order Count | 2021-12-19	1	[{"added": {}}]	5	17
488	2021-12-30 23:01:10.159159+00	135	3075.27 sold from Restaurant Net Sales (68) from 2021-12-20 to 2021-12-26)	1	[{"added": {}}]	4	17
489	2021-12-30 23:01:32.201314+00	275	Bixby | Restaurant Gross Sales | 2021-12-26	1	[{"added": {}}]	5	17
490	2021-12-30 23:01:47.707755+00	276	Bixby | Restaurant Labor | 2021-12-26	1	[{"added": {}}]	5	17
491	2021-12-30 23:02:16.952385+00	277	Bixby | Restaurant Liquor Sales | 2021-12-26	1	[{"added": {}}]	5	17
492	2021-12-30 23:02:46.951541+00	278	Bixby | Restaurant Order Count | 2021-12-26	1	[{"added": {}}]	5	17
493	2021-12-30 23:09:15.100145+00	136	1510.55 sold from Door Dash (70) from 2021-12-06 to 2021-12-12)	1	[{"added": {}}]	4	17
494	2021-12-30 23:09:54.628258+00	137	2025 sold from Door Dash (70) from 2021-12-13 to 2021-12-19)	1	[{"added": {}}]	4	17
495	2021-12-30 23:10:12.749834+00	138	635.41 sold from Door Dash (70) from 2021-12-20 to 2021-12-26)	1	[{"added": {}}]	4	17
496	2022-01-01 17:35:36.094003+00	2	carlos_lopez's Profile	1	[{"added": {}}]	14	17
497	2022-01-01 17:35:50.86216+00	2	carlos_lopez's Profile	2	[{"changed": {"fields": ["Restaurant"]}}]	14	17
498	2022-01-01 17:38:23.546947+00	19	caleb_forster	1	[{"added": {}}]	10	17
499	2022-01-01 17:38:44.531914+00	3	caleb_forster's Profile	2	[{"changed": {"fields": ["Restaurant"]}}]	14	17
500	2022-01-01 17:39:29.70235+00	2	managers	1	[{"added": {}}]	9	17
501	2022-01-01 17:39:46.585343+00	19	caleb_forster	2	[{"changed": {"fields": ["Groups"]}}]	10	17
502	2022-01-01 20:53:42.736859+00	16	carlos_lopez	2	[{"changed": {"fields": ["Groups"]}}]	10	17
503	2022-01-01 20:56:04.920726+00	19	caleb_forster	3		10	17
504	2022-01-01 20:56:45.095446+00	20	caleb.forster	1	[{"added": {}}]	10	17
505	2022-01-01 20:56:55.725521+00	20	caleb.forster	2	[{"changed": {"fields": ["Groups"]}}]	10	17
506	2022-01-01 20:57:07.243724+00	4	caleb.forster's Profile	2	[{"changed": {"fields": ["Restaurant"]}}]	14	17
507	2022-01-01 20:57:41.700134+00	21	carlos.sanchez	1	[{"added": {}}]	10	17
508	2022-01-01 20:57:50.43784+00	21	carlos.sanchez	2	[{"changed": {"fields": ["Groups"]}}]	10	17
509	2022-01-01 20:59:39.199035+00	22	rafael.gaude	1	[{"added": {}}]	10	17
510	2022-01-01 20:59:46.30912+00	22	rafael.gaude	2	[{"changed": {"fields": ["Groups"]}}]	10	17
511	2022-01-01 20:59:54.691635+00	6	rafael.gaude's Profile	2	[{"changed": {"fields": ["Restaurant"]}}]	14	17
512	2022-01-01 20:59:59.935029+00	5	carlos.sanchez's Profile	2	[{"changed": {"fields": ["Restaurant"]}}]	14	17
513	2022-01-01 21:00:04.955704+00	4	caleb.forster's Profile	2	[]	14	17
514	2022-01-01 21:00:09.206449+00	2	carlos_lopez's Profile	2	[]	14	17
515	2022-01-01 21:00:13.22926+00	1	carlossgv's Profile	2	[]	14	17
516	2022-01-02 00:50:26.286937+00	23	francisco.ponce	1	[{"added": {}}]	10	17
517	2022-01-02 00:50:34.091977+00	23	francisco.ponce	2	[{"changed": {"fields": ["Groups"]}}]	10	17
518	2022-01-02 00:50:44.705855+00	7	francisco.ponce's Profile	2	[{"changed": {"fields": ["Restaurant"]}}]	14	17
519	2022-01-22 16:32:33.411681+00	507	2 Broken Arrow - 2021-12-25: (Checked: True) (Sent: False)	2	[{"changed": {"fields": ["Comments", "IsChecked", "CreatedBy"]}}]	3	17
520	2022-01-22 16:33:30.16331+00	505	2 Broken Arrow - 2021-12-23: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Comments", "IsChecked", "WasSent", "CreatedBy"]}}]	3	17
521	2022-01-22 16:35:45.556575+00	2756	40.16 paid to B&B Liquor (39) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
522	2022-01-22 16:36:11.607466+00	2757	15.16 paid to B&B Liquor (39) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
523	2022-01-22 16:36:49.940647+00	2758	24.95 paid to Parkhill Liquor (87) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
524	2022-01-22 16:37:16.008382+00	2759	39.22 paid to Supermercados Morelos (44) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
525	2022-01-22 16:37:34.850513+00	2760	39.22 paid to Supermercados Morelos (44) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
526	2022-01-22 16:38:00.503675+00	2759	20.74 paid to Supermercados Morelos (44) on 2021-12-20 from Cash	2	[{"changed": {"fields": ["Amount"]}}]	2	17
527	2022-01-22 16:38:21.080937+00	2761	16.26 paid to Dollar General (92) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
528	2022-01-22 16:38:48.282199+00	2762	45.47 paid to B&B Liquor (39) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
529	2022-01-22 16:39:14.459865+00	2763	15.80 paid to Walmart (33) on 2021-12-20 from Cash	1	[{"added": {}}]	2	17
530	2022-01-22 16:41:32.764509+00	502	2 Broken Arrow - 2021-12-20: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Comments", "IsChecked", "WasSent", "CreatedBy"]}}]	3	17
531	2022-01-22 16:42:14.49402+00	2764	30.44 paid to Sams (32) on 2021-12-22 from Cash	1	[{"added": {}}]	2	17
532	2022-01-22 16:42:38.284497+00	2765	12.58 paid to Walmart (33) on 2022-01-22 from Cash	1	[{"added": {}}]	2	17
533	2022-01-22 16:42:53.430002+00	504	2 Broken Arrow - 2021-12-22: (Checked: True) (Sent: True)	2	[{"changed": {"fields": ["Comments", "IsChecked", "WasSent", "CreatedBy"]}}]	3	17
534	2022-01-25 22:07:02.564625+00	2766	16.25 paid to B&B Liquor (39) on 2021-12-13 from Cash	1	[{"added": {}}]	2	17
535	2022-01-25 22:07:22.404347+00	2767	43.03 paid to Supermercados Morelos (44) on 2021-12-13 from Cash	1	[{"added": {}}]	2	17
536	2022-01-25 22:08:20.295155+00	2768	60 paid to Tres Leches (211) on 2021-12-15 from Cash	1	[{"added": {}}]	2	17
537	2022-01-25 22:08:37.577929+00	2769	116.18 paid to Sams (32) on 2021-12-15 from Cash	1	[{"added": {}}]	2	17
538	2022-01-25 23:02:50.731066+00	249	Pedro Hernandez (Labor (249))	1	[{"added": {}}]	1	17
539	2022-01-25 23:03:37.089884+00	250	Alex Soto (Labor (250))	1	[{"added": {}}]	1	17
540	2022-01-25 23:04:53.931021+00	251	Mariana Perez (Labor (251))	1	[{"added": {}}]	1	17
541	2022-01-25 23:39:50.994618+00	2960	15.58 paid to Supermercados Morelos (44) on 2022-01-26 from Cash	1	[{"added": {}}]	2	17
542	2022-01-25 23:47:16.016062+00	2961	6 paid to Kalley Miesner (229) on 2022-01-11 from Cash	1	[{"added": {}}]	2	17
543	2022-01-25 23:48:26.61421+00	2962	12 paid to Walmart (33) on 2022-01-15 from Cash	1	[{"added": {}}]	2	17
544	2022-01-25 23:55:57.505802+00	2963	48.30 paid to B&B Liquor (39) on 2022-01-17 from Cash	1	[{"added": {}}]	2	17
545	2022-01-26 00:01:24.835005+00	2964	6 paid to Gift Card Collected (162) on 2022-01-18 from Cash	1	[{"added": {}}]	2	17
546	2022-01-26 00:02:00.866353+00	2965	12.98 paid to Reasors (96) on 2022-01-22 from Cash	1	[{"added": {}}]	2	17
547	2022-01-26 00:03:37.758672+00	2966	200 paid to Zachary DuBois (237) on 2022-01-17 from Cash	1	[{"added": {}}]	2	17
548	2022-01-26 00:04:02.003564+00	2966	200.00 paid to Uncategorized Cash Expense (188) on 2022-01-17 from Cash	2	[{"changed": {"fields": ["Supplier"]}}]	2	17
549	2022-01-26 00:16:01.863294+00	139	14454.79 sold from Restaurant Net Sales (68) from 2021-12-27 to 2022-01-02)	1	[{"added": {}}]	4	17
550	2022-01-26 00:16:28.443031+00	279	Broken Arrow | Restaurant Gross Sales | 2022-01-02	1	[{"added": {}}]	5	17
551	2022-01-26 00:16:42.500413+00	280	Broken Arrow | Restaurant Labor | 2022-01-02	1	[{"added": {}}]	5	17
552	2022-01-26 00:17:20.912149+00	281	Broken Arrow | Restaurant Liquor Sales | 2022-01-02	1	[{"added": {}}]	5	17
553	2022-01-26 00:17:42.875401+00	282	Broken Arrow | Restaurant Order Count | 2022-01-02	1	[{"added": {}}]	5	17
554	2022-01-26 00:18:06.296053+00	140	10444.52 sold from Restaurant Net Sales (68) from 2022-01-03 to 2022-01-09)	1	[{"added": {}}]	4	17
555	2022-01-26 00:18:22.359002+00	283	Broken Arrow | Restaurant Gross Sales | 2022-01-09	1	[{"added": {}}]	5	17
556	2022-01-26 00:18:41.019104+00	284	Broken Arrow | Restaurant Labor | 2022-01-09	1	[{"added": {}}]	5	17
557	2022-01-26 00:19:00.321396+00	285	Broken Arrow | Restaurant Liquor Sales | 2022-01-09	1	[{"added": {}}]	5	17
558	2022-01-26 00:19:13.948886+00	286	Broken Arrow | Restaurant Order Count | 2022-01-09	1	[{"added": {}}]	5	17
559	2022-01-26 00:20:14.446152+00	141	12985.34 sold from Restaurant Net Sales (68) from 2022-01-10 to 2022-01-16)	1	[{"added": {}}]	4	17
560	2022-01-26 00:20:26.257448+00	287	Broken Arrow | Restaurant Gross Sales | 2022-01-16	1	[{"added": {}}]	5	17
561	2022-01-26 00:20:42.776393+00	288	Broken Arrow | Restaurant Labor | 2022-01-16	1	[{"added": {}}]	5	17
562	2022-01-26 00:21:07.165716+00	289	Broken Arrow | Restaurant Liquor Sales | 2022-01-16	1	[{"added": {}}]	5	17
563	2022-01-26 00:21:18.406411+00	290	Broken Arrow | Restaurant Order Count | 2022-01-16	1	[{"added": {}}]	5	17
564	2022-01-26 00:21:40.527061+00	142	16756.41 sold from Restaurant Net Sales (68) from 2022-01-17 to 2022-01-23)	1	[{"added": {}}]	4	17
565	2022-01-26 00:21:57.609363+00	291	Broken Arrow | Restaurant Gross Sales | 2022-01-23	1	[{"added": {}}]	5	17
566	2022-01-26 00:22:09.416092+00	292	Broken Arrow | Restaurant Labor | 2022-01-23	1	[{"added": {}}]	5	17
567	2022-01-26 00:22:29.953678+00	293	Broken Arrow | Restaurant Liquor Sales | 2022-01-23	1	[{"added": {}}]	5	17
568	2022-01-26 00:22:46.115431+00	294	Broken Arrow | Restaurant Order Count | 2022-01-23	1	[{"added": {}}]	5	17
569	2022-01-26 00:37:47.393329+00	2967	43.36 paid to Nam Hai Market (49) on 2022-01-12 from Cash	1	[{"added": {}}]	2	17
570	2022-01-26 00:38:04.07443+00	2968	16 paid to Supermercados Morelos (44) on 2022-01-12 from Cash	1	[{"added": {}}]	2	17
571	2022-01-26 00:38:31.48562+00	2969	33.37 paid to Supermercados Morelos (44) on 2022-01-12 from Cash	1	[{"added": {}}]	2	17
572	2022-01-26 00:38:49.169289+00	2970	9.84 paid to Nam Hai Market (49) on 2022-01-12 from Cash	1	[{"added": {}}]	2	17
573	2022-02-03 23:12:21.966549+00	143	15231.66 sold from Restaurant Net Sales (68) from 2022-01-24 to 2022-01-30)	1	[{"added": {}}]	4	17
574	2022-02-03 23:13:07.979593+00	295	Broken Arrow | Restaurant Gross Sales | 2022-01-30	1	[{"added": {}}]	5	17
575	2022-02-03 23:13:22.822356+00	296	Broken Arrow | Restaurant Labor | 2022-01-30	1	[{"added": {}}]	5	17
576	2022-02-03 23:13:37.91056+00	297	Broken Arrow | Restaurant Order Count | 2022-01-30	1	[{"added": {}}]	5	17
577	2022-02-03 23:14:04.964524+00	298	Broken Arrow | Restaurant Liquor Sales | 2022-01-30	1	[{"added": {}}]	5	17
578	2022-02-03 23:24:32.572967+00	27	(27) 'OKLAHOMATAXPMTS' | Supplier: (Not An Expense)	2	[{"changed": {"fields": ["Supplier"]}}]	6	17
579	2022-02-17 23:05:17.406065+00	252	Jaylee Hood (Labor (252))	1	[{"added": {}}]	1	17
580	2022-02-17 23:24:53.592826+00	144	12730.09 sold from Restaurant Net Sales (68) from 2022-01-31 to 2022-02-06)	1	[{"added": {}}]	4	17
581	2022-02-17 23:25:09.866481+00	299	Broken Arrow | Restaurant Gross Sales | 2022-02-06	1	[{"added": {}}]	5	17
582	2022-02-17 23:25:26.095697+00	300	Broken Arrow | Restaurant Labor | 2022-02-06	1	[{"added": {}}]	5	17
583	2022-02-17 23:25:45.833881+00	301	Broken Arrow | Restaurant Liquor Sales | 2022-02-06	1	[{"added": {}}]	5	17
584	2022-02-17 23:26:01.380973+00	302	Broken Arrow | Restaurant Order Count | 2022-02-06	1	[{"added": {}}]	5	17
585	2022-02-17 23:26:34.699375+00	145	18505.81 sold from Restaurant Net Sales (68) from 2022-02-07 to 2022-02-13)	1	[{"added": {}}]	4	17
586	2022-02-17 23:26:50.45179+00	303	Broken Arrow | Restaurant Gross Sales | 2022-02-13	1	[{"added": {}}]	5	17
587	2022-02-17 23:27:02.105747+00	304	Broken Arrow | Restaurant Labor | 2022-02-13	1	[{"added": {}}]	5	17
588	2022-02-17 23:27:22.873104+00	305	Broken Arrow | Restaurant Liquor Sales | 2022-02-13	1	[{"added": {}}]	5	17
589	2022-02-17 23:27:41.296625+00	306	Broken Arrow | Restaurant Order Count | 2022-02-13	1	[{"added": {}}]	5	17
590	2022-03-03 23:48:38.77779+00	146	17964.1 sold from Restaurant Net Sales (68) from 2022-02-14 to 2022-02-20)	1	[{"added": {}}]	4	17
591	2022-03-03 23:49:17.842132+00	147	16750.4 sold from Restaurant Net Sales (68) from 2022-03-21 to 2022-03-27)	1	[{"added": {}}]	4	17
592	2022-03-03 23:51:44.065569+00	307	Broken Arrow | Restaurant Gross Sales | 2022-02-20	1	[{"added": {}}]	5	17
593	2022-03-03 23:52:10.410854+00	308	Broken Arrow | Restaurant Labor | 2022-02-20	1	[{"added": {}}]	5	17
594	2022-03-03 23:52:30.320991+00	309	Broken Arrow | Restaurant Order Count | 2022-03-20	1	[{"added": {}}]	5	17
595	2022-03-03 23:53:00.923743+00	310	Broken Arrow | Restaurant Liquor Sales | 2022-02-20	1	[{"added": {}}]	5	17
596	2022-03-03 23:53:45.236769+00	311	Broken Arrow | Restaurant Gross Sales | 2022-02-27	1	[{"added": {}}]	5	17
597	2022-03-03 23:54:01.870793+00	312	Broken Arrow | Restaurant Labor | 2022-02-27	1	[{"added": {}}]	5	17
598	2022-03-03 23:54:17.096117+00	313	Broken Arrow | Restaurant Order Count | 2022-02-27	1	[{"added": {}}]	5	17
599	2022-03-03 23:54:42.057815+00	314	Broken Arrow | Restaurant Liquor Sales | 2022-02-27	1	[{"added": {}}]	5	17
600	2022-03-04 00:27:20.829131+00	253	Ava Moss (Labor (253))	1	[{"added": {}}]	1	17
601	2022-03-04 00:29:28.507509+00	254	Carlos Lopez (Labor (254))	1	[{"added": {}}]	1	17
602	2022-03-04 00:31:08.478937+00	255	Pablo Hernandez (Labor (255))	1	[{"added": {}}]	1	17
603	2022-03-04 00:34:30.566577+00	96	(96) 'B &amp; B LIQUOR' | Supplier: (B&B Liquor)	1	[{"added": {}}]	6	17
604	2022-03-19 19:14:30.058245+00	3167	7.16 paid to Dollar General (92) on 2022-03-01 from Cash	2	[{"changed": {"fields": ["Supplier"]}}]	2	17
605	2022-03-19 19:28:35.460162+00	148	15955.36 sold from Restaurant Net Sales (68) from 2022-02-28 to 2022-03-06)	1	[{"added": {}}]	4	17
606	2022-03-19 19:28:51.905745+00	149	15891.91 sold from Restaurant Net Sales (68) from 2022-03-07 to 2022-03-13)	1	[{"added": {}}]	4	17
607	2022-03-19 19:30:41.481955+00	315	Broken Arrow | Restaurant Gross Sales | 2022-03-06	1	[{"added": {}}]	5	17
608	2022-03-19 19:30:55.460109+00	316	Broken Arrow | Restaurant Labor | 2022-03-06	1	[{"added": {}}]	5	17
609	2022-03-19 19:31:24.525786+00	317	Broken Arrow | Restaurant Liquor Sales | 2022-03-06	1	[{"added": {}}]	5	17
610	2022-03-19 19:31:39.926719+00	318	Broken Arrow | Restaurant Order Count | 2022-03-06	1	[{"added": {}}]	5	17
611	2022-03-19 19:32:03.672041+00	319	Broken Arrow | Restaurant Gross Sales | 2022-03-13	1	[{"added": {}}]	5	17
612	2022-03-19 19:32:18.477004+00	320	Broken Arrow | Restaurant Labor | 2022-03-13	1	[{"added": {}}]	5	17
613	2022-03-19 19:32:53.717407+00	321	Broken Arrow | Restaurant Liquor Sales | 2022-03-13	1	[{"added": {}}]	5	17
614	2022-03-19 19:33:17.124816+00	322	Broken Arrow | Restaurant Order Count | 2022-03-13	1	[{"added": {}}]	5	17
615	2022-03-19 19:33:39.943747+00	149	13878.28 sold from Restaurant Net Sales (68) from 2022-03-07 to 2022-03-13)	2	[{"changed": {"fields": ["Amount"]}}]	4	17
616	2022-03-19 19:33:52.126594+00	319	Broken Arrow | Restaurant Gross Sales | 2022-03-13	2	[{"changed": {"fields": ["Amount"]}}]	5	17
617	2022-03-19 19:34:04.335729+00	320	Broken Arrow | Restaurant Labor | 2022-03-13	2	[{"changed": {"fields": ["Amount"]}}]	5	17
618	2022-04-06 23:30:39.136262+00	256	Nathan Keady (Labor (256))	1	[{"added": {}}]	1	17
619	2022-04-06 23:31:58.439763+00	257	Jose Sanchez (Labor (257))	1	[{"added": {}}]	1	17
620	2022-04-06 23:35:11.310616+00	258	Training (Uncategorized (258))	1	[{"added": {}}]	1	17
621	2022-04-06 23:38:39.047447+00	259	Mary Collins (Labor (259))	1	[{"added": {}}]	1	17
622	2022-04-06 23:40:26.026803+00	97	(97) 'AEP PUBLIC SERV' | Supplier: (Amer Electric Power (AEP))	1	[{"added": {}}]	6	17
623	2022-04-06 23:43:07.903584+00	260	Sergio Sanchez (Labor (260))	1	[{"added": {}}]	1	17
624	2022-04-06 23:46:02.672656+00	261	Brayden Ramsey (Labor (261))	1	[{"added": {}}]	1	17
625	2022-04-20 23:51:17.966353+00	98	(98) 'WALGREENS' | Supplier: (Walgreens)	1	[{"added": {}}]	6	17
658	2022-05-04 23:00:55.046504+00	3503	23.00 paid to Restaurant Equipment and Supply (51) on 2022-04-23 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
659	2022-05-04 23:01:03.472183+00	3504	63.87 paid to Supermercados Morelos (44) on 2022-04-23 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
660	2022-05-04 23:01:09.754349+00	3505	40.00 paid to Labor Uncategorized (235) on 2022-04-23 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
661	2022-05-04 23:28:47.604622+00	262	Gabriel Mejias (Labor (262))	1	[{"added": {}}]	1	17
662	2022-05-19 16:46:15.030124+00	263	Webstaurant (Uncategorized (263))	1	[{"added": {}}]	1	17
663	2022-05-19 16:55:59.42895+00	264	Omar Perez (Services (264))	1	[{"added": {}}]	1	17
664	2022-05-19 16:58:04.378668+00	265	Ignacio Guzman (Labor (265))	1	[{"added": {}}]	1	17
665	2022-06-15 00:11:55.442211+00	266	Alan Arias (Labor (266))	1	[{"added": {}}]	1	17
666	2022-06-15 00:15:14.579447+00	267	Juventino Duran (Services (267))	1	[{"added": {}}]	1	17
667	2022-06-27 15:41:32.445025+00	3843	20.00 paid to Labor Uncategorized (235) on 2022-05-21 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
668	2022-06-27 15:41:39.89581+00	3842	40.00 paid to Nathan Keady (256) on 2022-05-21 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
669	2022-06-27 15:41:46.334522+00	3841	7.94 paid to Walmart (33) on 2022-05-21 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
670	2022-06-27 15:41:53.127104+00	3840	74.94 paid to Sams (32) on 2022-05-21 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
671	2022-06-27 15:42:01.093319+00	3839	21.54 paid to Nam Hai Market (49) on 2022-05-21 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
672	2022-06-27 15:58:24.931722+00	268	Admiral Security (Services (268))	1	[{"added": {}}]	1	17
673	2022-06-27 16:18:48.515838+00	269	Teresa Salcido (Labor (269))	1	[{"added": {}}]	1	17
674	2022-06-27 16:21:08.146729+00	270	Kailey Miesner (Labor (270))	1	[{"added": {}}]	1	17
675	2022-06-27 16:27:08.127389+00	271	Kevin Bishop (Labor (271))	1	[{"added": {}}]	1	17
676	2022-06-27 16:28:01.065234+00	272	Adrian Hernandez (Labor (272))	1	[{"added": {}}]	1	17
677	2022-06-27 16:29:24.244221+00	273	Randy Knight (Labor (273))	1	[{"added": {}}]	1	17
678	2022-06-27 16:30:38.302266+00	274	Cleaning (Services (274))	1	[{"added": {}}]	1	17
679	2022-07-15 22:02:40.295323+00	275	Marisa (Labor (275))	1	[{"added": {}}]	1	17
680	2022-07-15 22:21:07.306232+00	4084	16.22 paid to Amazon (112) on 2022-06-10 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
681	2022-08-01 22:49:52.973506+00	276	LiquorPOS (Liquor (Miscellaneous) (276))	1	[{"added": {}}]	1	17
682	2022-08-01 22:52:21.453791+00	277	Alvaro Hernandez (Labor (277))	1	[{"added": {}}]	1	17
683	2022-08-01 22:58:53.475079+00	278	AsianMart (Food (Miscellaneous) (278))	1	[{"added": {}}]	1	17
684	2022-08-01 23:21:21.970846+00	279	Jose Reyes (Labor (279))	1	[{"added": {}}]	1	17
685	2022-08-01 23:22:17.602529+00	280	Ty Thrashar (Labor (280))	1	[{"added": {}}]	1	17
686	2022-08-01 23:23:15.096558+00	281	Anthony Russell (Labor (281))	1	[{"added": {}}]	1	17
687	2022-08-01 23:25:40.973169+00	282	Evelyn Lopez (Labor (282))	1	[{"added": {}}]	1	17
688	2022-08-01 23:26:04.720513+00	283	David Tarazona (Labor (283))	1	[{"added": {}}]	1	17
689	2022-08-01 23:28:01.207067+00	284	Better View (Services (284))	1	[{"added": {}}]	1	17
690	2022-08-01 23:28:17.31604+00	131	(131) 'BETTER VIEW' | Supplier: (Better View)	1	[{"added": {}}]	6	17
691	2022-08-01 23:33:27.149896+00	132	(132) 'OKLAHOMANATURALG' | Supplier: (Oklahoma Natural Gas)	1	[{"added": {}}]	6	17
692	2022-08-18 00:25:47.584591+00	285	Georgia Benham (Labor (285))	1	[{"added": {}}]	1	17
693	2022-08-18 00:26:44.437695+00	286	Sarahy Duran (Labor (286))	1	[{"added": {}}]	1	17
694	2022-10-20 17:17:08.066865+00	287	Quickbooks (Services (287))	1	[{"added": {}}]	1	17
695	2022-10-20 17:17:32.421439+00	133	(133) 'INTUIT' | Supplier: (Quickbooks)	1	[{"added": {}}]	6	17
696	2022-10-20 17:32:15.665584+00	288	Sysco (Food (288))	1	[{"added": {}}]	1	17
697	2022-10-20 17:32:31.755772+00	289	OReilly Auto (Uncategorized (289))	1	[{"added": {}}]	1	17
698	2022-10-20 17:32:47.276888+00	290	Celia Deleon (Insurance) (Uncategorized (290))	1	[{"added": {}}]	1	17
699	2022-10-20 18:10:19.340518+00	134	(134) 'GOOGLE' | Supplier: (Google)	1	[{"added": {}}]	6	17
700	2022-10-20 18:19:14.574375+00	291	Jonathan Gardner (Labor (291))	1	[{"added": {}}]	1	17
701	2022-10-20 18:19:42.469066+00	292	Crisanto Pineda (Labor (292))	1	[{"added": {}}]	1	17
702	2022-10-20 18:21:08.187397+00	293	Miriam Perez (Labor (293))	1	[{"added": {}}]	1	17
703	2022-10-20 18:23:53.396863+00	294	Azeneth Sanchez (Labor (294))	1	[{"added": {}}]	1	17
704	2022-10-20 18:26:41.981309+00	295	Lorena Quintana (Labor (295))	1	[{"added": {}}]	1	17
705	2022-10-20 18:28:00.129361+00	296	Emilia Sandoval (Labor (296))	1	[{"added": {}}]	1	17
706	2022-10-20 18:28:55.508423+00	297	Peggy Marcano (Labor (297))	1	[{"added": {}}]	1	17
707	2022-10-20 23:08:29.673098+00	4661	36.83 paid to LiquorPOS (276) on 2022-09-18 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
708	2022-10-20 23:19:29.901764+00	298	Home Expenses (Uncategorized (298))	1	[{"added": {}}]	1	17
709	2022-10-20 23:32:13.934432+00	299	Paysafe (Services (299))	1	[{"added": {}}]	1	17
710	2022-11-02 22:23:13.058303+00	300	Luis Rios (Labor (300))	1	[{"added": {}}]	1	17
711	2022-11-02 22:28:49.143993+00	134	(134) 'GOOGLE' | Supplier: (Google)	2	[]	6	17
712	2022-11-02 22:28:57.301637+00	135	(135) 'Google' | Supplier: (Google)	1	[{"added": {}}]	6	17
713	2022-11-02 22:48:30.525138+00	92	(92) 'CITYNET TRANSFER- DEBIT - Funds Transfer via Mobile -' | Supplier: (Transfers Between Accounts)	3		6	17
714	2022-11-15 21:54:35.116491+00	301	Mariana Badillo (Labor (301))	1	[{"added": {}}]	1	17
715	2022-11-15 21:54:42.803289+00	302	Devan Culbert (Labor (302))	1	[{"added": {}}]	1	17
716	2022-12-06 22:53:03.507952+00	303	Wellness Family Clinic (Uncategorized (303))	1	[{"added": {}}]	1	17
717	2022-12-06 23:52:03.677218+00	304	Maggie Loftin (Labor (304))	1	[{"added": {}}]	1	17
718	2022-12-06 23:52:21.041275+00	305	Jessica Arenz (Labor (305))	1	[{"added": {}}]	1	17
719	2022-12-07 00:00:59.76032+00	136	(136) 'TORTILLERIA MIL' | Supplier: (Tortilleria Mil Arcos)	1	[{"added": {}}]	6	17
720	2022-12-25 16:30:00.314438+00	306	Algo Grande (Services (306))	1	[{"added": {}}]	1	17
721	2022-12-25 16:33:29.440027+00	307	Alexander Moreno (Labor (307))	1	[{"added": {}}]	1	17
722	2023-01-09 22:54:32.794072+00	308	Vent Hood (Services (308))	1	[{"added": {}}]	1	17
723	2023-01-09 23:04:13.543292+00	309	Alexis Argueta (Labor (309))	1	[{"added": {}}]	1	17
724	2023-01-09 23:11:25.255857+00	310	Yurisbelis Hernandez (Labor (310))	1	[{"added": {}}]	1	17
725	2023-01-09 23:26:14.143164+00	5138	3000.00 paid to Stand By (100) on 2022-12-29 from Primary Account	2	[{"changed": {"fields": ["Supplier", "Comments"]}}]	2	17
726	2023-01-21 19:53:46.275014+00	311	Accurate Fire Equipment (Services (311))	1	[{"added": {}}]	1	17
727	2023-01-21 20:12:47.72146+00	312	TEDC (Loan) (Uncategorized (312))	1	[{"added": {}}]	1	17
728	2023-02-18 21:21:58.168798+00	313	Adres de Franca Boris (Labor (313))	1	[{"added": {}}]	1	17
729	2023-02-18 21:23:06.150467+00	314	Pedro Gutierrez (Labor (314))	1	[{"added": {}}]	1	17
730	2023-02-18 21:28:49.855979+00	315	Ana Dominguez (Labor (315))	1	[{"added": {}}]	1	17
731	2023-02-18 21:33:26.957994+00	316	Leon Reyes (Labor (316))	1	[{"added": {}}]	1	17
732	2023-02-18 21:35:07.457808+00	317	Francisca Valencia (Labor (317))	1	[{"added": {}}]	1	17
733	2023-02-18 22:16:06.648164+00	318	Credit Card Payment (Uncategorized (318))	1	[{"added": {}}]	1	17
734	2023-03-06 23:02:35.059819+00	319	Christopher Pendley (Labor (319))	1	[{"added": {}}]	1	17
735	2023-03-07 00:34:25.193173+00	5558	42.02 paid to Sams (32) on 2023-02-16 from Cash	3		2	17
736	2023-03-07 00:34:25.195818+00	5557	37.62 paid to Supermercados Morelos (44) on 2023-02-16 from Cash	3		2	17
737	2023-03-24 20:46:54.969234+00	320	Taxes Manuel Briceno (Uncategorized (320))	1	[{"added": {}}]	1	17
738	2023-03-24 20:49:19.965646+00	321	Lourdes Sanchez (Labor (321))	1	[{"added": {}}]	1	17
739	2023-03-24 21:18:08.505944+00	322	Jeannie Doe (Labor (322))	1	[{"added": {}}]	1	17
740	2023-04-09 14:31:51.168908+00	137	(137) 'BROOKS GREASE' | Supplier: (Brookes Greease)	1	[{"added": {}}]	6	17
741	2023-04-09 15:12:06.284216+00	323	Bevinco (Food (Miscellaneous) (323))	1	[{"added": {}}]	1	17
742	2023-04-23 20:45:58.238225+00	138	(138) 'BEVINCO' | Supplier: (Bevinco)	1	[{"added": {}}]	6	17
743	2023-04-23 20:46:30.739029+00	139	(139) 'DOLLAR-GENERAL' | Supplier: (Dollar General)	1	[{"added": {}}]	6	17
744	2023-05-05 19:36:11.248717+00	324	Orkin Pest Control (Services (324))	1	[{"added": {}}]	1	17
745	2023-05-05 19:36:38.322819+00	140	(140) 'ORKIN PEST' | Supplier: (Orkin)	1	[{"added": {}}]	6	17
746	2023-05-05 19:37:03.179647+00	324	Orkin Pest Control (Services (324))	3		1	17
747	2023-05-05 19:55:27.37565+00	141	(141) 'SCULPTURE HO' | Supplier: (Sculpture Hospitality)	1	[{"added": {}}]	6	17
748	2023-05-17 22:27:59.178104+00	325	DBC (Food (Miscellaneous) (325))	1	[{"added": {}}]	1	17
749	2023-06-09 22:02:08.165461+00	326	Luis Rodriguez (Labor (326))	1	[{"added": {}}]	1	17
750	2023-06-09 22:46:03.841326+00	6052	20.00 paid to Labor Uncategorized (235) on 2023-05-12 from Cash	3		2	17
751	2023-06-21 19:48:24.704155+00	327	David Blanco (Labor (327))	1	[{"added": {}}]	1	17
752	2023-06-21 19:53:00.388675+00	328	Alexis Mantilla (Labor (328))	1	[{"added": {}}]	1	17
753	2023-06-21 20:01:58.314138+00	142	(142) 'PYMT   CARDMEMBER' | Supplier: (Credit Card Payment)	1	[{"added": {}}]	6	17
754	2023-06-21 20:02:24.089788+00	143	(143) 'TRN AMZN' | Supplier: (Amazon)	1	[{"added": {}}]	6	17
755	2023-07-10 16:13:24.825129+00	329	Stonemen Granite (Services (329))	1	[{"added": {}}]	1	17
756	2023-07-26 21:33:25.680771+00	330	Taylor McAdoo (Labor (330))	1	[{"added": {}}]	1	17
757	2023-07-26 22:00:53.498646+00	6310	20.00 paid to Uncategorized Cash Expense (188) on 2023-07-15 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
758	2023-07-26 22:01:05.044198+00	6309	20.00 paid to Uncategorized Cash Expense (188) on 2023-07-14 from Cash	2	[{"changed": {"fields": ["Date"]}}]	2	17
759	2023-07-26 22:07:31.740795+00	331	District Burger (Uncategorized (331))	1	[{"added": {}}]	1	17
760	2023-08-12 15:57:58.777435+00	332	Isela Rodriguez (Labor (332))	1	[{"added": {}}]	1	17
761	2023-08-12 16:05:25.029756+00	333	Marco Casas (Labor (333))	1	[{"added": {}}]	1	17
762	2023-08-12 16:06:41.629342+00	334	Ortegas Cleaning Solutions (Services (334))	1	[{"added": {}}]	1	17
763	2023-08-12 16:16:47.446116+00	335	CNA Surety (Uncategorized (335))	1	[{"added": {}}]	1	17
764	2023-08-30 14:43:03.969983+00	336	Loan Payable District Burger (Uncategorized (336))	1	[{"added": {}}]	1	17
765	2023-08-30 14:56:44.112398+00	337	Harland Clarke (Uncategorized (337))	1	[{"added": {}}]	1	17
766	2023-08-30 15:01:36.596533+00	338	Utilities City of Tulsa (Water) (Services (338))	1	[{"added": {}}]	1	17
767	2023-08-30 15:01:47.350444+00	144	(144) 'UTIL CITY OF TULSA' | Supplier: (Utilities City of Tulsa (Water))	1	[{"added": {}}]	6	17
768	2023-08-30 15:45:00.129092+00	339	Gift Cards (Uncategorized (339))	1	[{"added": {}}]	1	17
769	2023-08-30 15:47:04.807881+00	340	Swipe It (Services (340))	1	[{"added": {}}]	1	17
770	2023-08-30 15:48:21.721921+00	145	(145) 'CORP COLL SWIPE IT' | Supplier: (Swipe It)	1	[{"added": {}}]	6	17
771	2023-09-18 13:30:02.779984+00	341	Aleesia Tarver (Labor (341))	1	[{"added": {}}]	1	17
772	2023-09-18 13:32:13.349877+00	342	Richard Stewart CPA (Uncategorized (342))	1	[{"added": {}}]	1	17
773	2023-09-18 13:34:23.934926+00	146	(146) 'XIMENA MARTINEZ' | Supplier: (Ximena Martinez)	1	[{"added": {}}]	6	17
774	2023-09-18 13:48:47.546858+00	147	(147) 'AMZN Mktp' | Supplier: (Amazon)	1	[{"added": {}}]	6	17
775	2023-09-18 13:49:09.080324+00	148	(148) 'Amazon.com' | Supplier: (Amazon)	1	[{"added": {}}]	6	17
776	2023-09-18 13:54:34.127132+00	343	US Foodservice (Food (343))	1	[{"added": {}}]	1	17
777	2023-09-18 13:56:19.050112+00	344	Wisey (Services (344))	1	[{"added": {}}]	1	17
778	2023-10-08 22:47:02.74565+00	345	Eduardo Arenas (Labor (345))	1	[{"added": {}}]	1	17
779	2023-10-08 22:51:30.618544+00	149	(149) 'US FOODSERVICE' | Supplier: (US Foodservice)	1	[{"added": {}}]	6	17
780	2023-10-08 22:52:22.989467+00	150	(150) 'SWIPE IT' | Supplier: (Swipe It)	1	[{"added": {}}]	6	17
781	2023-10-08 23:03:53.358221+00	346	Loan Payable EIDL (Uncategorized (346))	1	[{"added": {}}]	1	17
782	2023-11-01 17:45:17.411512+00	347	Bao Huynh (Labor (347))	1	[{"added": {}}]	1	17
783	2023-11-01 17:54:06.370402+00	151	(151) 'LAW BROS LLC' | Supplier: (Laws Bros (Renta BA))	1	[{"added": {}}]	6	17
784	2023-11-01 17:56:02.080409+00	348	Homebase (Services (348))	1	[{"added": {}}]	1	17
785	2023-11-01 17:56:10.335065+00	152	(152) 'JOINHOMEBASE' | Supplier: (Homebase)	1	[{"added": {}}]	6	17
786	2023-11-19 14:58:31.756921+00	349	Sofia Ramos (Labor (349))	1	[{"added": {}}]	1	17
787	2023-11-19 15:01:41.928031+00	350	Shelby Shaffer (Labor (350))	1	[{"added": {}}]	1	17
788	2023-11-19 15:04:24.817723+00	351	City of Broken Arrow (Water) (Services (351))	1	[{"added": {}}]	1	17
789	2023-11-19 15:18:25.80934+00	153	(153) 'WISEY' | Supplier: (Wisey)	1	[{"added": {}}]	6	17
790	2023-12-07 00:04:25.923242+00	352	Chylee Malarzewski (Labor (352))	1	[{"added": {}}]	1	17
791	2023-12-07 00:06:19.493297+00	353	David Santiago Cuith (Labor (353))	1	[{"added": {}}]	1	17
792	2023-12-07 00:07:48.322937+00	354	Tulsa Latina Leadership (Services (354))	1	[{"added": {}}]	1	17
793	2023-12-21 19:54:33.304011+00	355	Guillermo Lopez (Labor (355))	1	[{"added": {}}]	1	17
794	2023-12-21 19:55:51.800479+00	356	Rosa Ayala (Labor (356))	1	[{"added": {}}]	1	17
795	2023-12-21 19:59:47.543983+00	357	Salone Pope (Labor (357))	1	[{"added": {}}]	1	17
796	2024-01-03 21:13:17.453892+00	358	Max Garage (Services (358))	1	[{"added": {}}]	1	17
797	2024-01-03 21:13:52.001148+00	359	Nicks Collisions (Services (359))	1	[{"added": {}}]	1	17
798	2024-01-03 21:18:17.503646+00	154	(154) 'EIDL LOAN' | Supplier: (Loan Payable EIDL)	1	[{"added": {}}]	6	17
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	accounting	supplier
2	accounting	expense
3	accounting	cashlog
4	accounting	income
5	accounting	metric
6	accounting	rule
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
13	accounting	restaurant
14	users	profile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-11 16:37:51.170024+00
2	auth	0001_initial	2021-10-11 16:37:51.239351+00
3	accounting	0001_initial	2021-10-11 16:37:51.263123+00
4	accounting	0002_expense_restaurant	2021-10-11 16:37:51.275025+00
5	accounting	0003_cashlog	2021-10-11 16:37:51.283108+00
6	accounting	0004_cashlog_restaurant	2021-10-11 16:37:51.295024+00
7	accounting	0005_auto_20210506_1643	2021-10-11 16:37:51.321206+00
8	accounting	0006_auto_20210506_1912	2021-10-11 16:37:51.353693+00
9	accounting	0007_auto_20210724_1622	2021-10-11 16:37:51.368109+00
10	accounting	0008_rule	2021-10-11 16:37:51.379376+00
11	accounting	0009_auto_20210822_0048	2021-10-11 16:37:51.394355+00
12	accounting	0010_auto_20210912_0003	2021-10-11 16:37:51.408261+00
13	accounting	0011_auto_20210912_2120	2021-10-11 16:37:51.428421+00
14	accounting	0012_auto_20210912_2144	2021-10-11 16:37:51.434957+00
15	admin	0001_initial	2021-10-11 16:37:51.45642+00
16	admin	0002_logentry_remove_auto_add	2021-10-11 16:37:51.464529+00
17	admin	0003_logentry_add_action_flag_choices	2021-10-11 16:37:51.472685+00
18	contenttypes	0002_remove_content_type_name	2021-10-11 16:37:51.487623+00
19	auth	0002_alter_permission_name_max_length	2021-10-11 16:37:51.498555+00
20	auth	0003_alter_user_email_max_length	2021-10-11 16:37:51.507369+00
21	auth	0004_alter_user_username_opts	2021-10-11 16:37:51.515676+00
22	auth	0005_alter_user_last_login_null	2021-10-11 16:37:51.524411+00
23	auth	0006_require_contenttypes_0002	2021-10-11 16:37:51.526549+00
24	auth	0007_alter_validators_add_error_messages	2021-10-11 16:37:51.534958+00
25	auth	0008_alter_user_username_max_length	2021-10-11 16:37:51.548517+00
26	auth	0009_alter_user_last_name_max_length	2021-10-11 16:37:51.558006+00
27	auth	0010_alter_group_name_max_length	2021-10-11 16:37:51.567686+00
28	auth	0011_update_proxy_permissions	2021-10-11 16:37:51.576116+00
29	auth	0012_alter_user_first_name_max_length	2021-10-11 16:37:51.584743+00
30	sessions	0001_initial	2021-10-11 16:37:51.598761+00
31	accounting	0013_alter_expense_reference	2021-10-11 17:21:03.585421+00
32	accounting	0002_restaurant	2021-11-14 13:52:36.573649+00
33	accounting	0003_auto_20211114_0248	2021-11-14 13:52:36.614582+00
34	accounting	0004_auto_20211114_0249	2021-11-14 13:52:36.630662+00
35	accounting	0005_auto_20211114_1433	2021-11-14 18:40:33.430107+00
36	accounting	0006_alter_metric_supplier	2021-11-14 18:40:33.466687+00
37	accounting	0007_alter_metric_supplier	2021-11-14 18:40:33.47825+00
38	accounting	0008_alter_metric_supplier	2021-11-14 18:40:33.490791+00
39	accounting	0009_auto_20211114_1838	2021-11-14 18:40:33.519837+00
40	accounting	0010_alter_cashlog_restaurant	2022-01-01 17:26:26.597177+00
41	accounting	0011_alter_cashlog_unique_together	2022-01-01 17:26:26.62174+00
42	accounting	0012_cashlog_createdby	2022-01-01 17:26:26.661019+00
43	users	0001_initial	2022-01-01 17:26:26.723154+00
44	users	0002_alter_profile_restaurant	2022-01-01 17:26:26.745784+00
45	users	0003_alter_profile_restaurant	2022-01-01 17:26:26.77655+00
46	accounting	0013_expense_created_by	2022-01-01 19:43:34.548697+00
47	accounting	0014_alter_expense_created_by	2022-01-01 20:51:33.642988+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
n85uvb9dbohmwrpl2ob81lmbqre9b58u	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1lcaNE:7ILuFizw7kd_ziRGmk4JB0FSLwkCXnO6sjKTWX4BwbA	2021-05-14 21:08:32.608931+00
rgjz2ss2tre21tiytj05982e8h28hc64	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1lcaOy:-GheHCtNuzrWGsHbm5rCOGX9cz3p_UJp7EdNgRerGeQ	2021-05-14 21:10:20.584064+00
ho5xltvhgr1q9tk4kizj7muu8jgutrae	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1ldFJ2:e-is7kkBKK75pVS5X_oHYd5fdLK2QnB6dAIO8yxQhds	2021-05-16 16:50:56.615651+00
jxuh19qm6q9w8v75s4pxj9hll8nscr6h	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1lj8dN:Anu74jExeYL4Xlw2azRceCxgFju2fHfeOCw6zCR9_YY	2021-06-01 22:56:17.207798+00
pr8paxeinaplzja60qtl8gft1hrgcfyl	.eJxVjEEOwiAURO_C2pBfwIbv0r1nIPMBpWpoUtpV491tky50-96bWVXAMpewtDyFIamL6tTplwniK9ddpCfqY9RxrPM0iN4Tfdimb2PK7-vR_h0UtLKtvWFCzIbAIILnu_SJBNJ3HNkaYkQfsQFn2GYL2AwjxM4Jnzmpzxf1Zjh1:1ljRYw:cb7fQBXoJMXAZqX41q8n6ZwPQBR_C1njEibP-ruL3_Q	2021-06-02 19:08:58.601009+00
j42qcytwvoal603wpd107znef4l6vood	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1lqiHW:_k4GhXRCfHq4Kug7rnSNa9MYJYUv5IKjzAzwl3T2Vuc	2021-06-22 20:25:02.917991+00
acqs3erblw9k6hifl9pi56fcm2cb1z5x	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1lqiut:XbePlhtnQPgLF7epjQ9PHFwMZ6LrLa9x9Lz5HOcFNFw	2021-06-22 21:05:43.78551+00
blsiq28o4cekp9c0d3xiz78hwyfvp2mn	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1lqmR4:5gjl3HS96Ap4OU42ASLbl6RgXbKDQ_2FB_N7WNbZeDc	2021-06-23 00:51:10.875815+00
1wbyzjjctiheqhl9zzr8efebhri20h6m	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1m7Il0:W-7tCbuAo4KIRZcwn3nxE2DyIqI-_xwW1ESQIIjEAxc	2021-08-07 14:36:02.708977+00
llatsayh9h3sx7ihu03c4h7tqur564j7	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1mFHjL:H4-_LTYRC3Zau-_fPQdDAmA3_yJM_LfpF-DzsVh1zVA	2021-08-29 15:07:19.674823+00
lot9vqe14p7q57jsnnszesbi660gnu9x	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1mHbsq:jFC8aVR3Ql8BFCUH7joNUlAEF--XKv3q0aKe9KyUlGk	2021-09-05 01:02:44.340274+00
mnvbs10bb8fkf6yem0dhqqdwyafn6yma	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1mKQva:gzmD7EMgqBfUi85JSWfQOL9hh18htpeU0XAgYlOJl9A	2021-09-12 19:57:14.221814+00
5c33gk9mvgosqxewb8pkq13168jmdg72	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1mP9Ba:qL2Oxxq3LFqPNgDOlGP5w4ZybbWCiZWiwaNx_p_khvA	2021-09-25 20:01:14.4759+00
d7zmks8dfmpemj3i6cbb6tl7cymbm9id	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1mPCsj:PrjCKZEoM3ib3rehHJvxs9sHJKAmTtebZUqOjCLcSD8	2021-09-25 23:58:01.208249+00
kl18hamem9p059wizwgzlcdcpfhuxux7	.eJxVjMsOwiAQRf-FtSFAWwGX7vsNZGaYkaqBpI-V8d-1SRe6veec-1IJtrWkbeE5TVldlFWn3w2BHlx3kO9Qb01Tq-s8od4VfdBFjy3z83q4fwcFlvKtPaEjMYiBckQWNpHJIluQM_YOYrDeSCSPwcTgZBh623VGgoDhAYJ6fwAe2zjE:1mPY3t:u8-cjNLTMhe9bGOqRxGfwAvqzZY96WzYSHRyibGerW8	2021-09-26 22:34:57.245645+00
zs2ifwjdbhbrxjq7spxgz21i8dcaww0w	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1mS6ym:tPxnxVLxnE9ROVTwrK9Tddk6fCEulRoGX_kt2hr785k	2021-10-04 00:16:16.657167+00
q3mb7brfc44pcb8k9f3o7766mi5mdmcw	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1mUBFJ:PQs94VbpLcwYi7CIWXw_2nRoRythKHQGdje8lSgc2GA	2021-10-09 17:13:53.322569+00
jfmg4sbg90vgawfoil3ojffe8s029fte	.eJxVjMsOwiAQRf-FtSHDm3Hp3m8gwFCpGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsTOT7PS7pZgfpe2A7rHdOs-9rcuc-K7wgw5-7VSel8P9O6hx1G8NlJKYhERD0tqsnCBlfRTKa2fRRPSAJBNIQc5rmCygLoBCajDZlczeH7lqNoE:1mWfQ1:uzY3vH434o9qcFQ4rSNHfPgEO_iapzLGpPhMhAMACYo	2021-10-16 13:51:13.248408+00
143335bewh1rbqdkjzcwz5ww7hzpu2ev	.eJxVjM0OwiAQhN-FsyHyUxY8evcZCOwuUjU0Ke3J-O62SQ96nPm-mbeIaV1qXDvPcSRxEVqcfruc8MltB_RI7T5JnNoyj1nuijxol7eJ-HU93L-Dmnrd1iUAoT7rggHRc0EzEDg12ExbJMtJaQreU0AFDGxstiU4g2DYAXnx-QIPXDi9:1ma2yS:XHXFxJ0Z4ysV0NosURw9kHzFV2kr9oRfL4Qr4Cr7o9Y	2021-10-25 21:36:44.267611+00
2qzjfudy1w5bybb6z1lqlns6huvd1ecu	.eJxVjM0OwiAQhN-FsyHyUxY8evcZCOwuUjU0Ke3J-O62SQ96nPm-mbeIaV1qXDvPcSRxEVqcfruc8MltB_RI7T5JnNoyj1nuijxol7eJ-HU93L-Dmnrd1iUAoT7rggHRc0EzEDg12ExbJMtJaQreU0AFDGxstiU4g2DYAXnx-QIPXDi9:1mdJhF:eIs8N6RFfUH-onTP2oEimEBrItFVT2kghO__kDdh_TM	2021-11-03 22:04:29.881825+00
q67w3vs0u71md3r1wjp63emn8srysczp	.eJxVjDsOwyAQBe9CHSHAC4aU6X0GtMsnOIlAMnYV5e6xJRdJOzPvvZnHbS1-62nxc2RXJtnllxGGZ6qHiA-s98ZDq-syEz8SftrOpxbT63a2fwcFe9nXLgAgiuCUtKhkyJCcARMHDTaPWgoJIxBGUmkg2lEWqGkQWRgXyCL7fAHZ0Df0:1mdNH3:Dgx70csOhbnZwNho0oIgP4cP7NXAKdJG6cxLpGKQbYs	2021-11-04 01:53:41.320909+00
cdf5o92au9544e2w28ehkks60kboymsn	.eJxVjM0OwiAQhN-FsyHyUxY8evcZCOwuUjU0Ke3J-O62SQ96nPm-mbeIaV1qXDvPcSRxEVqcfruc8MltB_RI7T5JnNoyj1nuijxol7eJ-HU93L-Dmnrd1iUAoT7rggHRc0EzEDg12ExbJMtJaQreU0AFDGxstiU4g2DYAXnx-QIPXDi9:1meKBv:wu3nde7MXzoDfmDECNVHmG_wFS9Yj6UDeQvQDweFCgE	2021-11-06 16:48:19.649866+00
92fw5ssiw38hz1umz1oycd6bzs2o08m3	.eJxVjEEOwiAQRe_C2hBgGAGX7nsGMgNUqoYmpV0Z765NutDtf-_9l4i0rTVuvSxxyuIi9Fmcfkem9ChtJ_lO7TbLNLd1mVjuijxol8Ocy_N6uH8HlXr91mMgSJSMVeCdTVm7oJ0BtE4H9IyW2RjP3htSMCIYLKxy4UAWMhGK9wfsNzeb:1meRwJ:2nGE_wpyyiNnQz3GhXIPRzzoTohVFtKVQ7ahRVaVITc	2021-11-07 01:04:43.990151+00
du0snsi4pueig6re8fbqw2mnz8vo822g	.eJxVjEEOwiAQRe_C2hBgGAGX7nsGMgNUqoYmpV0Z765NutDtf-_9l4i0rTVuvSxxyuIi9Fmcfkem9ChtJ_lO7TbLNLd1mVjuijxol8Ocy_N6uH8HlXr91mMgSJSMVeCdTVm7oJ0BtE4H9IyW2RjP3htSMCIYLKxy4UAWMhGK9wfsNzeb:1mhgsm:3AvNHwEguIMotY7L-p_K3TfEpDU_uOe9eQ8_ZhQ17XA	2021-11-15 23:38:28.680927+00
l6b42ehrn2qe6yo5bjxjg7gti8il8sry	.eJxVjM0OwiAQhN-FsyHyUxY8evcZCOwuUjU0Ke3J-O62SQ96nPm-mbeIaV1qXDvPcSRxEVqcfruc8MltB_RI7T5JnNoyj1nuijxol7eJ-HU93L-Dmnrd1iUAoT7rggHRc0EzEDg12ExbJMtJaQreU0AFDGxstiU4g2DYAXnx-QIPXDi9:1mm3qW:2C5nO4zgRllyCH1nhj6SjLns7-AEDfhO-91hrTeqtAs	2021-11-28 00:58:12.524665+00
ycm5i9dp7oivzvqv33r9rijwp2z0ghe3	e30:1n3i7T:lmvE6j07-bVx4RSXbwt-U-IfBTaF3anXoM5CpD2tD7c	2022-01-15 17:24:39.381699+00
f9thore652cp4f263pk2dk68yh6n9t8i	e30:1n3i7c:ADqFCtw89LOtNBDRK84febOuKnY8z5fXbO7ctfY0KQo	2022-01-15 17:24:48.25242+00
m18axqhtitazd880gmq551nhqmv26737	e30:1n3i7o:1Q453oWo4x0Imr6AxfObEZFogAgaJuzg6OGcC7QZsTo	2022-01-15 17:25:00.686673+00
z18uc3zhchjjkntucfoydqa791iwcihc	.eJxVjM0OwiAQhN-FsyHyUxY8evcZCOwuUjU0Ke3J-O62SQ96nPm-mbeIaV1qXDvPcSRxEVqcfruc8MltB_RI7T5JnNoyj1nuijxol7eJ-HU93L-Dmnrd1iUAoT7rggHRc0EzEDg12ExbJMtJaQreU0AFDGxstiU4g2DYAXnx-QIPXDi9:1mm3xu:dHbfKROVD286ASwOIXYakWQ69qJRPfmYalAfoedL7cU	2021-11-28 01:05:50.502796+00
n41sd32c5gd8qn1d1zf5qqlixdbx9se8	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nS0cN:kTt0XN5lQ_0QVlsKPscA48ZM_ZNPVRIEc3Z-2aC1Hq8	2022-03-23 18:00:59.1756+00
ndyrjtfmv8k9x1ubphbtnt43lmy8imus	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nczPI:GnU_u3PfP3llZt64slXnYkOQc-0P6Qu0lnbHmMxaRZE	2022-04-23 00:56:52.43702+00
wmggbnf2k1l7w4dh36aw5qfys0lvttlz	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nmNqy:ygSAa_ia5vqGcEfx_rxN9K9jOpq_9bJ_FpunPhqIv40	2022-05-18 22:52:16.135285+00
0ybxf01t06xatktepajnk99hl25jr071	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nriMW:xQNaZxqv6sBcJdPnuF6-4-UNVuNvrkL9XE9gdCVP0Pw	2022-06-02 15:46:52.941149+00
bsoe5j6a5jug0cpv7sylfavn7sv3sx3i	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1o1FSq:jAZkeRjBsWu2sIyinAof669hRgJMYHxkSNhKkMSOZHE	2022-06-28 22:56:48.847074+00
jnqaq87av55v2gk64z93mp7favxuukkw	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oD6vc:ZSGB-yjdbAfQeU5lOrBPvfDFXBT_qdJAyJgwNjP7RtE	2022-07-31 16:15:32.291968+00
nncow7hskw54s5xn1odzvlpdqr0syfrj	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oIe9q:Ko62wRqwjTDQn0vOAfNhvjLBS-NDAoXC8xlVZHUzjMU	2022-08-15 22:45:06.894319+00
zgz51771cy85b8q8fi8wug0o24pa9jil	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oOSGN:TVkChUEBTCKVxKpf7wpjROMthGWQVIu7p494oVXxo30	2022-08-31 23:15:51.544827+00
4occ5sd40itonb51efvywd41r2mzj078	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oleHp:kwUckNUG-hXeqgqAOwK-BZOAFpqqVsG9XNPzQnEbqCg	2022-11-03 22:45:13.498787+00
yemnpo5fr2wuj0enpuzlf5c74u6p4kxb	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nCVZ7:q3vJtDcJ7aJEsgtxOPvzZvG4rXCT1YQMZD1DVlT1ltg	2022-02-08 23:49:33.942382+00
lxhwl5v1a318g7q30t79j1a6mhi0pzgz	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nKKJb:imRWGh5A-E8YhsLDKci6rc-1Yn5s0CYnPRhJRDLFFVQ	2022-03-02 13:25:51.984883+00
ukn35hgo7v3g4zcojbjqxosqwbh2176k	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nVeBS:wSGrE8JEPjOakAkj5-izGT75keimaFfGbxWtepBAOEs	2022-04-02 18:52:14.12241+00
s007z7phzr6w5twwtrz1gq49ilxcbb8k	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1ncEQD:ZluIL-_JUdvGf8m9Vq_QZhEkv7jaarztN3TM33R5-QI	2022-04-20 22:46:41.114286+00
qee9o1yb51735iv2phjjcbc7licrnmb4	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1niH5S:JtnUdnI-ylXaszsVS-kuzckiEH-udNns8hoiBDDhLEM	2022-05-07 14:50:14.549754+00
k6wpd3fr25cs7nd8sna2wxxe82r2h5g7	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1o5qaj:l3WjGQGtkuxNEweI4kRzx9iV3ydvv1M4Lm8C290YW_0	2022-07-11 15:23:57.229749+00
e541ev0u1lwv8x1dzo7lsc38z0b8qoke	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oJ1yK:4QD_g7BVVVvtUR1IypAwOyhylYoZHADy_AK8Q-MqEcg	2022-08-17 00:10:48.558514+00
0z5sqek8bfcb0vn9lnjyny1tr5v0z7rq	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nPvsL:6XwMpcvLv98Bj9-mTSMXP5Sm3zGMMYURWm3wwyQSO-M	2022-03-18 00:32:53.070964+00
g1ur8uizvkhvvh9p4anr3y9la0onv5e7	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nijPO:6ygXB5x7xxzKm6b5ijuJg60NYpPCQ6_Z7bGhWfZCcbc	2022-05-08 21:04:42.572067+00
enmoguoyx7sa7ey3rwu4oiwerc2p6jhi	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oRzXA:pELH6a7g8-SDNitqC9NePTNaKEsfI1V0t-braFcQct0	2022-09-10 17:23:48.574849+00
yhti0wu7n0ol5mr5w6iymt7wxhhl1zoo	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1nPtfn:6RaQ0ytLddPvWeoEkkv7Pedm40WKfCkd1WLpN96JYa4	2022-03-17 22:11:47.477071+00
w727oh3peg0nevscm1zkcaqj7li9z1bw	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oVHzg:v1_9uh5wBGE1FMRPHtMzj0Tqa6IN9zuTSFGLTLAjeAA	2022-09-19 19:42:52.533864+00
cjsfz0jg4yp9te0pgd0rhnj46e401iq3	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1oX3uA:0CPBLdJimdJGjBbZvjyixsGPU4PgxQY5-lfSqct_srk	2022-09-24 17:04:30.276461+00
07ume4r88u4pag444bgzpy4b00qxaa7x	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1mulF1:l572qyAFtPW1cBRJj8GcWcYbNHxuATKqj3T-vt7Ba-s	2021-12-22 00:55:27.003811+00
sewopo8lb2yaglh72zpccdqxjqzv7xjy	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1mv3Xc:wtFQXPCYSFMM0ar9iqMmkzz02w_gtZlHPWpngTphSrI	2021-12-22 20:27:52.421598+00
uh8vl449k8q3xzgrcl6lmo8xr952j58u	.eJxVjEEOwiAQRe_C2hBgGAGX7nsGMgNUqoYmpV0Z765NutDtf-_9l4i0rTVuvSxxyuIi9Fmcfkem9ChtJ_lO7TbLNLd1mVjuijxol8Ocy_N6uH8HlXr91mMgSJSMVeCdTVm7oJ0BtE4H9IyW2RjP3htSMCIYLKxy4UAWMhGK9wfsNzeb:1n2Oun:9LknYPDb4XstsNeCvFksVCEBs1FRBGr5VJkj9nO4wes	2022-01-12 02:42:09.710178+00
qnq3b6dluzolaa21woo262jm6ejsi44u	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1n32M5:k0xRjpBRV_jLimCJQnfDedr4u5aLeEMkqsocrVl5R5Q	2022-01-13 20:48:57.46213+00
cp1nxo341qtvgmnn4s6fp3rq35jhimsq	e30:1n3i9Y:x_A1SHUf4VZAqtTDE3LP2UFzxdkm6oHx5HYb9dBYWf0	2022-01-15 17:26:48.749549+00
4czo9yfejiwdqz1l2ehun2p2uzdphyp4	e30:1n3iA5:1s-dI4THnYXatqpOGfcH_hS4jgpxc2XzuQAnMNv3YTs	2022-01-15 17:27:21.118159+00
yd17qo3uer544cp8lo5t5z8ubc18z35t	e30:1n3iDR:1MdV994aO1Mk7NxayWoojq0uBUO5-jakVPYiEW8mUr0	2022-01-15 17:30:49.268199+00
n4lf5cr1hs62f6eb2bpyxuw6vshbeka0	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1n5ylz:ESrt_B3Zbf3TYX18heVUItM4R2wi63-Ys4V7Un3Z0jQ	2022-01-21 23:35:51.240908+00
d1ybpmsc7b3tknlo3mppjbobgranpzq0	.eJxVjDsOwjAQBe_iGlle_xIo6TmDteu1cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFwFmcfkfC-Ex1J_zAem8ytrrME8ldkQft8tY4va6H-3dQsJetdgSjsgBsDKJWiKTBsLGYIMYxRa8N-DyQzkNOtIkegVl5dpYdRxafLwm-OJY:1n3kII:MuDR8I8Yx2C_fO74VfkW8aMn1fXelu1Nu9ccTU1uEis	2022-01-15 19:43:59.000178+00
dzcw5urcfxknwf2rffayflmk5hiufm93	.eJxVjMsOwiAQRf-FtSFQZqB16d5vIMMw2KqBpI-V8d-1SRe6veec-1KRtnWM2yJznLI6KxvU6XdMxA-pO8l3qremudV1npLeFX3QRV9bluflcP8ORlrGb-2dN8YjWFN6ZOuQwXBnEPohe-wdFyEpiDBIAkq2GGAOYL0LMnTI6v0B2GE3Rg:1n4Tlm:n5_dQQH1Dzr0FKiTprOsD9j_ehaL0eWbZY8qO4Y4iik	2022-01-17 20:17:26.858065+00
gskt2111vyqqn2mvf0bn8fp459m85jhj	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1omHTr:CDh6SBJlnJeguDn3QZWeGtV_hS73AdUvxaRjpOYUaYA	2022-11-05 16:36:15.978575+00
qheg75f8rvebws5gdwimoborbhgyztub	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1orjUt:EZ5WvObbka1ttcCqNgYSTPeC2RCs5Lcymrq5L460S3E	2022-11-20 17:31:51.96797+00
1if4bxore9a9xga1uju7c3ddfqzwq216	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1ov34s:oyQ6Cv30oTgD8R3qL8P_N_dqD9CzqbGAAyyAD4AQwz8	2022-11-29 21:02:42.065777+00
hl5cjvh54h6kii1srr8w1tw4xnnfyhxa	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1p5Cuj:Nas7ybVxav6bp1g23UCIb1Oat_pBMiio36cXndVM8Qc	2022-12-27 21:34:13.522091+00
h5ggbl5eq35q7ur8vw2b67kxp9zv5afq	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1p9TIa:s_9gTFjCgn_Y9gF6SP4rNC60D2MwmITqID1d5-tuURE	2023-01-08 15:52:28.228958+00
m78l7c8mbf1w0szyyzvzzwg7qqtzprhp	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1p9Tog:CTWw10yV_wQ8BwirBDO-s2_VIFKN_6mUdcIh0uLiOiQ	2023-01-08 16:25:38.036191+00
st0ntzuua9bpzcmufnsg1ys568oorcx9	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pF0Si:HF9AkNRChTAc9oAKRIsrlPvj8vz81-8UwiDPwOi5E9k	2023-01-23 22:17:48.391913+00
vqfn83sj4fmtx22f1218thf1gpx8sx6o	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pJKDY:15inJwLqBvXDoHd7hWgI5L_dG0peb9UlhW-5Cu1YDAM	2023-02-04 20:12:00.213241+00
l81iujrkmw8voly02f9da5mqbt5jll88	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pTTNP:rymxX5OI3FBqS-0zdKIgnAoSLpUDJDHChSCmG4gxvTo	2023-03-04 20:00:07.525927+00
a0jjzchoa1o0goubt71t7pfxwsink9rf	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pZL74:sZPIIsGYAz2MVxTtTAhUaMDs79v_o2HocMsmZzESJDQ	2023-03-21 00:23:30.625558+00
ukn5pvweqt2snr6d31ab1yw630mozysj	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pfnzC:CVa1kS4LJ21WGASxMtE73jM9CaHKL7E1GDQsyaoszdU	2023-04-07 20:26:06.630596+00
5v1y2p9ww361moa7xfkxkz68drlq6rq1	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1plVqu:V_ExSKxIYsiqehBp4RolAWdU4nZ355TDLB4_uxNCQjI	2023-04-23 14:17:08.42654+00
9oyprgsa2j5clu6cljwayzc0qy7swltw	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pqg9Y:ySTXDt7l2cc0LrkHTB8lRsb3vYSe8gXbeGxm3wHkxAY	2023-05-07 20:17:44.825484+00
8hbz09a6eeq05r6noh1j5lz0m4moujai	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1pzQ0j:dmaWjXiXkN3R95itmCQM4IROJI1QSoYUB0q7Zw_pZwg	2023-05-31 22:52:45.325063+00
efqv25w7tw9sfvxmp99mymvcrwa558ok	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1q7k3F:MJ9ItJOn8bRcrrbsCndBxvXKkE-hDavYX125wvvvhlg	2023-06-23 21:53:45.199997+00
s58utdn8f7k0t7q3mccg386m1ljkj8h6	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qC3ka:v9lrijgNu18UjX1OznFSvXOlBtFWGT98n38tB8jAVFM	2023-07-05 19:44:20.788552+00
iwjjiamyfnihcjdoomm82bgqcqwmm3rp	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qFMHT:6s2ughXuBbNfVz4GlRO303e-dRuKGufmfKp-YPclSLY	2023-07-14 22:07:55.424586+00
wh22ap8zu01uij3ue96n7tymz8pz995i	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qOm0K:Xr1Ri0ZnfQlGQg4hkuCLrg7_U9SWRRYcrav1O2c-hJU	2023-08-09 21:25:08.922934+00
zytdcuu0yl2phm1vd5m4ef2h0khs50tv	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qbM2R:M_AqwYPg8wQM0_wMIKlA3x2Bd3kgyXkvbavHPTgaM5Y	2023-09-13 14:19:19.721632+00
dqnk7iqmkrk25uoqcule266tzdwmq92v	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qf5SU:GrzaCAVW0W5lhRvpfn0FD7amWHSGwgRIrKre9nQo9UI	2023-09-23 21:25:38.537943+00
85z3gl8srv6j86f4s651os6srzkpmzxi	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qiDma:wvDdZZcMCGh7p-4ftBr7sBj9ZFIXaIZZEOX5oG1a5OE	2023-10-02 12:55:20.438116+00
yp4utop35mf7flrd2itpl65bqvoifrhk	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qpcOP:PG_mpydVD3FZMnX9NWePzFeKYiDIqr-6FxfkrbrUCfc	2023-10-22 22:36:57.398004+00
q8m5s9rmhe8joa3g0ig6nnubc9el4ypt	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1qyFBI:tH4SHMWiSzeRzQN7DbnnAPbkG2YFkbsYgpQhhZfi_9Q	2023-11-15 17:39:04.22405+00
kh2vz10iusy1ve0xd6jsw1t63bc2j2dt	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1r4j50:hGbNXnLuyGn4PX5wR6pL6MV2GIsTmssYpIQCYL80qHk	2023-12-03 14:47:22.595261+00
qgmw81i4lr5u7rgw2hqftdhyjygtg48a	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1rAzJe:71FngfNKupwtlsPnOidVNqWGni4f8AVHB9ADhhUNf_M	2023-12-20 21:20:22.385143+00
4q0cg2nj9fkaag7ku6zfxpyk3ijkzbr5	.eJxVjMsOwiAQRf-FtSEDLR1w6d5vIMNjpGogKe3K-O_apAvd3nPOfQlP21r81vPi5yTOQqE4_Y6B4iPXnaQ71VuTsdV1mYPcFXnQLq8t5eflcP8OCvXyrScIaFR0yRhn9RDZ5jEi2JGZJ3CatCXFgOwUMkPQhAoBEjgYYHAk3h_1ojdK:1rL8EI:q_zlyx11Yw40roGc574u0uObuvfP8nTVi439kR2kp2w	2024-01-17 20:52:46.830437+00
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.users_profile (id, user_id) FROM stdin;
6	22
5	21
7	23
4	20
2	16
1	17
\.


--
-- Data for Name: users_profile_restaurant; Type: TABLE DATA; Schema: public; Owner: carlossgv
--

COPY public.users_profile_restaurant (id, profile_id, restaurant_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
6	4	2
7	6	1
8	5	1
9	7	2
\.


--
-- Name: accounting_cashlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_cashlog_id_seq', 1273, true);


--
-- Name: accounting_expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_expense_id_seq', 7031, true);


--
-- Name: accounting_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_income_id_seq', 274, true);


--
-- Name: accounting_metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_metric_id_seq', 723, true);


--
-- Name: accounting_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_restaurant_id_seq', 2, true);


--
-- Name: accounting_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_rule_id_seq', 154, true);


--
-- Name: accounting_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.accounting_supplier_id_seq', 359, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 8, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 23, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 798, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 47, true);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.users_profile_id_seq', 7, true);


--
-- Name: users_profile_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlossgv
--

SELECT pg_catalog.setval('public.users_profile_restaurant_id_seq', 9, true);


--
-- Name: accounting_cashlog accounting_cashlog_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_cashlog
    ADD CONSTRAINT accounting_cashlog_pkey PRIMARY KEY (id);


--
-- Name: accounting_cashlog accounting_cashlog_restaurant_id_date_b007bdff_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_cashlog
    ADD CONSTRAINT accounting_cashlog_restaurant_id_date_b007bdff_uniq UNIQUE (restaurant_id, date);


--
-- Name: accounting_expense accounting_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_expense
    ADD CONSTRAINT accounting_expense_pkey PRIMARY KEY (id);


--
-- Name: accounting_income accounting_income_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_income
    ADD CONSTRAINT accounting_income_pkey PRIMARY KEY (id);


--
-- Name: accounting_metric accounting_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_metric
    ADD CONSTRAINT accounting_metric_pkey PRIMARY KEY (id);


--
-- Name: accounting_restaurant accounting_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_restaurant
    ADD CONSTRAINT accounting_restaurant_pkey PRIMARY KEY (id);


--
-- Name: accounting_restaurant accounting_restaurant_username_key; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_restaurant
    ADD CONSTRAINT accounting_restaurant_username_key UNIQUE (username);


--
-- Name: accounting_rule accounting_rule_description_key; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_rule
    ADD CONSTRAINT accounting_rule_description_key UNIQUE (description);


--
-- Name: accounting_rule accounting_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_rule
    ADD CONSTRAINT accounting_rule_pkey PRIMARY KEY (id);


--
-- Name: accounting_supplier accounting_supplier_name_key; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_supplier
    ADD CONSTRAINT accounting_supplier_name_key UNIQUE (name);


--
-- Name: accounting_supplier accounting_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_supplier
    ADD CONSTRAINT accounting_supplier_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_profile_restaurant users_profile_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile_restaurant
    ADD CONSTRAINT users_profile_restaurant_pkey PRIMARY KEY (id);


--
-- Name: users_profile_restaurant users_profile_restaurant_profile_id_restaurant_id_6bfdd7f0_uniq; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile_restaurant
    ADD CONSTRAINT users_profile_restaurant_profile_id_restaurant_id_6bfdd7f0_uniq UNIQUE (profile_id, restaurant_id);


--
-- Name: users_profile users_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_key UNIQUE (user_id);


--
-- Name: accounting_cashlog_createdBy_id_10e4ef7d; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX "accounting_cashlog_createdBy_id_10e4ef7d" ON public.accounting_cashlog USING btree ("createdBy_id");


--
-- Name: accounting_cashlog_restaurant_id_73249df2; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_cashlog_restaurant_id_73249df2 ON public.accounting_cashlog USING btree (restaurant_id);


--
-- Name: accounting_expense_created_by_id_4df76f5c; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_expense_created_by_id_4df76f5c ON public.accounting_expense USING btree (created_by_id);


--
-- Name: accounting_expense_restaurant_id_e6e2b905; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_expense_restaurant_id_e6e2b905 ON public.accounting_expense USING btree (restaurant_id);


--
-- Name: accounting_expense_supplier_id_039bcaff; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_expense_supplier_id_039bcaff ON public.accounting_expense USING btree (supplier_id);


--
-- Name: accounting_income_restaurant_id_0527e265; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_income_restaurant_id_0527e265 ON public.accounting_income USING btree (restaurant_id);


--
-- Name: accounting_income_supplier_id_66b16fea; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_income_supplier_id_66b16fea ON public.accounting_income USING btree (supplier_id);


--
-- Name: accounting_metric_restaurant_id_0614fac4; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_metric_restaurant_id_0614fac4 ON public.accounting_metric USING btree (restaurant_id);


--
-- Name: accounting_metric_supplier_id_e3607249; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_metric_supplier_id_e3607249 ON public.accounting_metric USING btree (supplier_id);


--
-- Name: accounting_restaurant_username_13653ce7_like; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_restaurant_username_13653ce7_like ON public.accounting_restaurant USING btree (username varchar_pattern_ops);


--
-- Name: accounting_rule_description_be96a465_like; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_rule_description_be96a465_like ON public.accounting_rule USING btree (description varchar_pattern_ops);


--
-- Name: accounting_rule_supplier_id_6a7fca27; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_rule_supplier_id_6a7fca27 ON public.accounting_rule USING btree (supplier_id);


--
-- Name: accounting_supplier_name_a01c8c08_like; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX accounting_supplier_name_a01c8c08_like ON public.accounting_supplier USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_profile_restaurant_profile_id_f2c84d00; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX users_profile_restaurant_profile_id_f2c84d00 ON public.users_profile_restaurant USING btree (profile_id);


--
-- Name: users_profile_restaurant_restaurant_id_346715f8; Type: INDEX; Schema: public; Owner: carlossgv
--

CREATE INDEX users_profile_restaurant_restaurant_id_346715f8 ON public.users_profile_restaurant USING btree (restaurant_id);


--
-- Name: accounting_cashlog accounting_cashlog_createdBy_id_10e4ef7d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_cashlog
    ADD CONSTRAINT "accounting_cashlog_createdBy_id_10e4ef7d_fk_auth_user_id" FOREIGN KEY ("createdBy_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_cashlog accounting_cashlog_restaurant_id_73249df2_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_cashlog
    ADD CONSTRAINT accounting_cashlog_restaurant_id_73249df2_fk_accountin FOREIGN KEY (restaurant_id) REFERENCES public.accounting_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_expense accounting_expense_created_by_id_4df76f5c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_expense
    ADD CONSTRAINT accounting_expense_created_by_id_4df76f5c_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_expense accounting_expense_restaurant_id_e6e2b905_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_expense
    ADD CONSTRAINT accounting_expense_restaurant_id_e6e2b905_fk_accountin FOREIGN KEY (restaurant_id) REFERENCES public.accounting_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_expense accounting_expense_supplier_id_039bcaff_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_expense
    ADD CONSTRAINT accounting_expense_supplier_id_039bcaff_fk_accountin FOREIGN KEY (supplier_id) REFERENCES public.accounting_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_income accounting_income_restaurant_id_0527e265_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_income
    ADD CONSTRAINT accounting_income_restaurant_id_0527e265_fk_accountin FOREIGN KEY (restaurant_id) REFERENCES public.accounting_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_income accounting_income_supplier_id_66b16fea_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_income
    ADD CONSTRAINT accounting_income_supplier_id_66b16fea_fk_accountin FOREIGN KEY (supplier_id) REFERENCES public.accounting_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_metric accounting_metric_restaurant_id_0614fac4_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_metric
    ADD CONSTRAINT accounting_metric_restaurant_id_0614fac4_fk_accountin FOREIGN KEY (restaurant_id) REFERENCES public.accounting_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_metric accounting_metric_supplier_id_e3607249_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_metric
    ADD CONSTRAINT accounting_metric_supplier_id_e3607249_fk_accountin FOREIGN KEY (supplier_id) REFERENCES public.accounting_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounting_rule accounting_rule_supplier_id_6a7fca27_fk_accounting_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.accounting_rule
    ADD CONSTRAINT accounting_rule_supplier_id_6a7fca27_fk_accounting_supplier_id FOREIGN KEY (supplier_id) REFERENCES public.accounting_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile_restaurant users_profile_restau_profile_id_f2c84d00_fk_users_pro; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile_restaurant
    ADD CONSTRAINT users_profile_restau_profile_id_f2c84d00_fk_users_pro FOREIGN KEY (profile_id) REFERENCES public.users_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile_restaurant users_profile_restau_restaurant_id_346715f8_fk_accountin; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile_restaurant
    ADD CONSTRAINT users_profile_restau_restaurant_id_346715f8_fk_accountin FOREIGN KEY (restaurant_id) REFERENCES public.accounting_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_user_id_2112e78d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carlossgv
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_2112e78d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

