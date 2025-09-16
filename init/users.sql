--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-15 16:18:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4908 (class 1262 OID 27092)
-- Name: usersdb; Type: DATABASE; Schema: -; Owner: postgres
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 27093)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(30),
    descripcion character varying(200)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27110)
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rol_id_rol_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 219
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.roles.id;


--
-- TOC entry 218 (class 1259 OID 27098)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    documento_identidad character varying,
    nombre character varying,
    apellidos character varying,
    email character varying,
    fecha_nacimiento date,
    direccion character varying,
    id_rol integer,
    salario_base numeric,
    password character varying
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27112)
-- Name: usuarios_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_rol_seq OWNER TO postgres;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 220
-- Name: usuarios_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_rol_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4747 (class 2604 OID 27111)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 27113)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_rol_seq'::regclass);


--
-- TOC entry 4899 (class 0 OID 27093)
-- Dependencies: 217
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, nombre, descripcion) VALUES (1, 'ADMIN', 'administrador');
INSERT INTO public.roles (id, nombre, descripcion) VALUES (2, 'ASESOR', 'asesor');
INSERT INTO public.roles (id, nombre, descripcion) VALUES (3, 'CLIENTE', 'cliente');


--
-- TOC entry 4900 (class 0 OID 27098)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id, documento_identidad, nombre, apellidos, email, fecha_nacimiento, direccion, id_rol, salario_base, password) VALUES (1, '1859896494', 'Luisa', 'Diaz Lopez', 'luisadiaz@gmail.com', '1990-05-18', 'Calle 47 N 45-58', 3, 2000000.000000, '$2a$10$FFab/vQbAc86XQqdqfiJiOGqLsGtOnpBmOfHGzVDQ8J007bFlq7tC');
INSERT INTO public.usuarios (id, documento_identidad, nombre, apellidos, email, fecha_nacimiento, direccion, id_rol, salario_base, password) VALUES (2, '1067964945', 'Mario', 'Montes Lopez', 'mariomontlz@gmail.com', '1996-09-18', 'Calle 77 N 45-58', 1, 6000000.000000, '$2a$10$eMeOFIGGpzct3qg9OFN0k.mq3iEW9zWgvi9BQKNNM/HO1u3p4/7KW');
INSERT INTO public.usuarios (id, documento_identidad, nombre, apellidos, email, fecha_nacimiento, direccion, id_rol, salario_base, password) VALUES (3, '1067564995', 'Maria', 'Miranda Lopez', 'mariamiranda@gmail.com', '1990-09-18', 'Calle 43 N 45-58', 2, 4000000.000000, '$2a$10$eJGvtxHJmel8nuBnddvvlefmLxv13hjz5g1/vY5wUNDPrHJ2hN6D6');


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 219
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 3, true);


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 220
-- Name: usuarios_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_rol_seq', 3, true);


--
-- TOC entry 4750 (class 2606 OID 27097)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 27104)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 27105)
-- Name: usuarios usuarios_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id);


-- Completed on 2025-09-15 16:18:34

--
-- PostgreSQL database dump complete
--

