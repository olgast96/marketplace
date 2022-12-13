--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-08-08 00:40:02

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
-- TOC entry 209 (class 1259 OID 24586)
-- Name: colour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colour (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.colour OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24589)
-- Name: colour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colour_id_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 210
-- Name: colour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colour_id_seq OWNED BY public.colour.id;


--
-- TOC entry 211 (class 1259 OID 24590)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    email character varying NOT NULL,
    phone_number character varying NOT NULL,
    CONSTRAINT ck_email CHECK (((email)::text ~ '^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$'::text)),
    CONSTRAINT ck_phone_number CHECK (((phone_number)::text ~ '^((\+7|7|8)+([0-9]){10})$'::text))
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24597)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 212
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 213 (class 1259 OID 24598)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    patronymic character varying(50),
    email character varying NOT NULL,
    phone_number character varying NOT NULL,
    date_of_birth date NOT NULL,
    CONSTRAINT ck_email CHECK (((email)::text ~ '^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$'::text)),
    CONSTRAINT ck_phone_number CHECK (((phone_number)::text ~ '^((\+7|7|8)+([0-9]){10})$'::text))
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24605)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 214
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 215 (class 1259 OID 24606)
-- Name: employee_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_post (
    employee_id integer NOT NULL,
    shop_id integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.employee_post OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24609)
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.material OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24612)
-- Name: material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_id_seq OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 217
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_id_seq OWNED BY public.material.id;


--
-- TOC entry 218 (class 1259 OID 24613)
-- Name: ord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ord (
    id integer NOT NULL,
    product_id integer NOT NULL,
    customer_id integer NOT NULL,
    employee_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL
);


ALTER TABLE public.ord OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24618)
-- Name: ord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ord_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ord_id_seq OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 219
-- Name: ord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ord_id_seq OWNED BY public.ord.id;


--
-- TOC entry 220 (class 1259 OID 24619)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    salary numeric NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24624)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 221
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 222 (class 1259 OID 24625)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying NOT NULL,
    colour_id integer NOT NULL,
    material_id integer NOT NULL,
    price numeric NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24630)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 224 (class 1259 OID 24631)
-- Name: product_shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_shop (
    product_id integer NOT NULL,
    shop_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.product_shop OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24634)
-- Name: product_warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_warehouse (
    product_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.product_warehouse OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24637)
-- Name: shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop (
    id integer NOT NULL,
    address character varying NOT NULL,
    phone_number character varying NOT NULL,
    CONSTRAINT ck_phone_number CHECK (((phone_number)::text ~ '^((\+7|7|8)+([0-9]){10})$'::text))
);


ALTER TABLE public.shop OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24643)
-- Name: shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_id_seq OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 227
-- Name: shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_id_seq OWNED BY public.shop.id;


--
-- TOC entry 228 (class 1259 OID 24644)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    id integer NOT NULL,
    address character varying NOT NULL,
    phone_number character varying NOT NULL,
    CONSTRAINT ck_phone_number CHECK (((phone_number)::text ~ '^((\+7|7|8)+([0-9]){10})$'::text))
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24650)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 229
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;


--
-- TOC entry 3216 (class 2604 OID 24651)
-- Name: colour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colour ALTER COLUMN id SET DEFAULT nextval('public.colour_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 24652)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 24653)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 24654)
-- Name: material id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material ALTER COLUMN id SET DEFAULT nextval('public.material_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 24655)
-- Name: ord id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ord ALTER COLUMN id SET DEFAULT nextval('public.ord_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 24656)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 24657)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 24658)
-- Name: shop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop ALTER COLUMN id SET DEFAULT nextval('public.shop_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 24659)
-- Name: warehouse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3399 (class 0 OID 24586)
-- Dependencies: 209
-- Data for Name: colour; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.colour (id, name) VALUES (1, 'Красный');
INSERT INTO public.colour (id, name) VALUES (2, 'Черный');
INSERT INTO public.colour (id, name) VALUES (3, 'Коричневый');
INSERT INTO public.colour (id, name) VALUES (4, 'Белый');
INSERT INTO public.colour (id, name) VALUES (5, 'Синий');


--
-- TOC entry 3401 (class 0 OID 24590)
-- Dependencies: 211
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (id, first_name, last_name, patronymic, email, phone_number) VALUES (1, 'Дугин', 'Вениамин', 'Климентьевич', 'veniamin1502@outlook.com', '+79873237242');
INSERT INTO public.customer (id, first_name, last_name, patronymic, email, phone_number) VALUES (2, 'Живкова', 'Юлия', 'Егоровна', 'yuliya5540@yandex.ru', '+79328249174');
INSERT INTO public.customer (id, first_name, last_name, patronymic, email, phone_number) VALUES (3, 'Казьмин', 'Михаил', 'Павлович', 'mihail1960@outlook.com', '+79358268674');
INSERT INTO public.customer (id, first_name, last_name, patronymic, email, phone_number) VALUES (4, 'Сагунова', 'Полина', 'Константиновна', 'polina20041993@rambler.ru', '+79741644574');
INSERT INTO public.customer (id, first_name, last_name, patronymic, email, phone_number) VALUES (5, 'Буклина', 'Елизавета', 'Серафимовна', 'elizaveta3397@mail.ru', '+79997999672');


--
-- TOC entry 3403 (class 0 OID 24598)
-- Dependencies: 213
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee (id, first_name, last_name, patronymic, email, phone_number, date_of_birth) VALUES (1, 'Жвиков', 'Сергей', 'Егорович', 'sergey1996@gmail.com', '+79666009321', '1996-08-06');
INSERT INTO public.employee (id, first_name, last_name, patronymic, email, phone_number, date_of_birth) VALUES (2, 'Яловенко', 'Венедикт', 'Валерьевич', 'venedikt24121971@outlook.com', '+79334401040', '1971-12-24');
INSERT INTO public.employee (id, first_name, last_name, patronymic, email, phone_number, date_of_birth) VALUES (3, 'Жариков', 'Иван', 'Ефимович', 'ivan7642@outlook.com', '+79564106019', '1973-02-05');
INSERT INTO public.employee (id, first_name, last_name, patronymic, email, phone_number, date_of_birth) VALUES (4, 'Золотухина', 'Лидия', 'Феодосьевна', 'lidiya66@outlook.com', '+79785783215', '1972-12-22');
INSERT INTO public.employee (id, first_name, last_name, patronymic, email, phone_number, date_of_birth) VALUES (5, 'Голодяев', 'Даниил', 'Леонидович', 'daniil06111976@rambler.ru', '+79254979625', '1976-06-11');


--
-- TOC entry 3405 (class 0 OID 24606)
-- Dependencies: 215
-- Data for Name: employee_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee_post (employee_id, shop_id, date) VALUES (1, 1, '2019-12-10');
INSERT INTO public.employee_post (employee_id, shop_id, date) VALUES (1, 2, '2019-12-10');
INSERT INTO public.employee_post (employee_id, shop_id, date) VALUES (2, 3, '2021-06-24');
INSERT INTO public.employee_post (employee_id, shop_id, date) VALUES (3, 4, '2018-01-16');
INSERT INTO public.employee_post (employee_id, shop_id, date) VALUES (4, 5, '2020-08-11');
INSERT INTO public.employee_post (employee_id, shop_id, date) VALUES (5, 5, '2021-09-25');


--
-- TOC entry 3406 (class 0 OID 24609)
-- Dependencies: 216
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.material (id, name) VALUES (1, 'Пластик');
INSERT INTO public.material (id, name) VALUES (2, 'Селикон');
INSERT INTO public.material (id, name) VALUES (3, 'ДСП');
INSERT INTO public.material (id, name) VALUES (4, 'Ткань');
INSERT INTO public.material (id, name) VALUES (5, 'Картон');


--
-- TOC entry 3408 (class 0 OID 24613)
-- Dependencies: 218
-- Data for Name: ord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ord (id, product_id, customer_id, employee_id, quantity, price, date, "time") VALUES (1, 1, 1, 1, 10, 2500, '2021-05-12', '12:00:00');
INSERT INTO public.ord (id, product_id, customer_id, employee_id, quantity, price, date, "time") VALUES (2, 2, 2, 2, 5, 2500, '2021-08-31', '18:20:00');
INSERT INTO public.ord (id, product_id, customer_id, employee_id, quantity, price, date, "time") VALUES (3, 3, 3, 3, 1, 15000, '2021-09-21', '10:09:00');
INSERT INTO public.ord (id, product_id, customer_id, employee_id, quantity, price, date, "time") VALUES (4, 4, 4, 4, 4, 14000, '2021-01-16', '14:28:00');
INSERT INTO public.ord (id, product_id, customer_id, employee_id, quantity, price, date, "time") VALUES (5, 5, 5, 5, 15, 1050, '2021-11-26', '09:16:00');


--
-- TOC entry 3410 (class 0 OID 24619)
-- Dependencies: 220
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post (id, name, salary) VALUES (1, 'Кассир', 35000);
INSERT INTO public.post (id, name, salary) VALUES (2, 'Бухгалтер', 100000);
INSERT INTO public.post (id, name, salary) VALUES (3, 'Директор', 120000);
INSERT INTO public.post (id, name, salary) VALUES (4, 'Грузчик', 35000);
INSERT INTO public.post (id, name, salary) VALUES (5, 'Работник склада', 40000);


--
-- TOC entry 3412 (class 0 OID 24625)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, name, colour_id, material_id, price, description) VALUES (1, 'Cпортивная скакалка', 1, 1, 250, 'Спортивная скакалка длиной 150 см');
INSERT INTO public.product (id, name, colour_id, material_id, price, description) VALUES (2, 'Чехол для телефона', 2, 2, 500, 'Чехол для телефона iphone 13 из силикона с защитой камеры');
INSERT INTO public.product (id, name, colour_id, material_id, price, description) VALUES (3, 'Офисный стол', 3, 3, 15000, 'Офисный стол из ДСП шириной 120см и высотой 70см');
INSERT INTO public.product (id, name, colour_id, material_id, price, description) VALUES (4, 'Штора', 4, 4, 3500, 'Шторы для спальни длиной 150 см и высотой 200 см');
INSERT INTO public.product (id, name, colour_id, material_id, price, description) VALUES (5, 'Коробка', 5, 5, 70, 'Коробка для упаковки и хранения предметов');


--
-- TOC entry 3414 (class 0 OID 24631)
-- Dependencies: 224
-- Data for Name: product_shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (1, 1, 10);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (2, 1, 20);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (3, 1, 7);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (4, 1, 25);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (5, 1, 17);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (1, 2, 9);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (1, 2, 90);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (5, 3, 3);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (3, 4, 4);
INSERT INTO public.product_shop (product_id, shop_id, quantity) VALUES (2, 5, 10);


--
-- TOC entry 3415 (class 0 OID 24634)
-- Dependencies: 225
-- Data for Name: product_warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (1, 3, 10);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (2, 3, 20);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (3, 3, 7);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (4, 3, 25);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (5, 3, 17);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (1, 4, 9);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (1, 4, 90);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (5, 6, 3);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (3, 5, 4);
INSERT INTO public.product_warehouse (product_id, warehouse_id, quantity) VALUES (2, 5, 10);


--
-- TOC entry 3416 (class 0 OID 24637)
-- Dependencies: 226
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shop (id, address, phone_number) VALUES (1, 'Россия, г. Каменск - Уральский, Солнечный пер., д. 12 кв.205', '+79329254024');
INSERT INTO public.shop (id, address, phone_number) VALUES (2, 'Россия, г. Астрахань, Вишневая ул., д. 13 кв.20', '+79051357332');
INSERT INTO public.shop (id, address, phone_number) VALUES (3, 'Россия, г. Краснодар, Кирова ул., д. 22 кв.7', '+79396452035');
INSERT INTO public.shop (id, address, phone_number) VALUES (4, 'Россия, г. Камышин, Севернаяул., д. 24 кв.133', '+79269258538');
INSERT INTO public.shop (id, address, phone_number) VALUES (5, 'Россия, г. Бердск, Заслонова ул., д. 1 кв.180', '+79813364868');


--
-- TOC entry 3418 (class 0 OID 24644)
-- Dependencies: 228
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.warehouse (id, address, phone_number) VALUES (3, 'Россия, г. Кемерово, Красноармейская ул., д. 8 кв.136', '+79653076242');
INSERT INTO public.warehouse (id, address, phone_number) VALUES (4, 'Россия, г. Сургут, Заводская ул., д. 1 кв.110', '+79597162660');
INSERT INTO public.warehouse (id, address, phone_number) VALUES (5, 'Россия, г. Грозный, Ленина ул., д. 25 кв.158', '+79612168022');
INSERT INTO public.warehouse (id, address, phone_number) VALUES (6, 'Россия, г. Владикавказ, Юбилейная ул., д. 1 кв.25', '+79233169968');
INSERT INTO public.warehouse (id, address, phone_number) VALUES (7, 'Россия, г. Чебоксары, Пролетарская ул., д. 12 кв.36', '+79779948336');


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 210
-- Name: colour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colour_id_seq', 5, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 212
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 5, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 214
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 5, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 217
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_id_seq', 5, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 219
-- Name: ord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ord_id_seq', 5, true);


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 221
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 5, true);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 5, true);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 227
-- Name: shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_id_seq', 5, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 229
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 7, true);


--
-- TOC entry 3232 (class 2606 OID 24661)
-- Name: colour colour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colour
    ADD CONSTRAINT colour_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 24663)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 24665)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 24667)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 24669)
-- Name: ord ord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ord
    ADD CONSTRAINT ord_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 24671)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 24673)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 24675)
-- Name: shop shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 24677)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 24678)
-- Name: employee_post employee_post_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_post
    ADD CONSTRAINT employee_post_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- TOC entry 3250 (class 2606 OID 24683)
-- Name: employee_post employee_post_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_post
    ADD CONSTRAINT employee_post_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(id);


--
-- TOC entry 3251 (class 2606 OID 24688)
-- Name: ord ord_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ord
    ADD CONSTRAINT ord_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- TOC entry 3252 (class 2606 OID 24693)
-- Name: ord ord_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ord
    ADD CONSTRAINT ord_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- TOC entry 3253 (class 2606 OID 24698)
-- Name: ord ord_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ord
    ADD CONSTRAINT ord_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3254 (class 2606 OID 24703)
-- Name: product product_colour_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_colour_id_fkey FOREIGN KEY (colour_id) REFERENCES public.colour(id);


--
-- TOC entry 3255 (class 2606 OID 24708)
-- Name: product product_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.material(id);


--
-- TOC entry 3256 (class 2606 OID 24713)
-- Name: product_shop product_shop_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_shop
    ADD CONSTRAINT product_shop_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3257 (class 2606 OID 24718)
-- Name: product_shop product_shop_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_shop
    ADD CONSTRAINT product_shop_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(id);


--
-- TOC entry 3258 (class 2606 OID 24723)
-- Name: product_warehouse product_warehouse_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_warehouse
    ADD CONSTRAINT product_warehouse_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3259 (class 2606 OID 24728)
-- Name: product_warehouse product_warehouse_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_warehouse
    ADD CONSTRAINT product_warehouse_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id);


-- Completed on 2022-08-08 00:40:02

--
-- PostgreSQL database dump complete
--

