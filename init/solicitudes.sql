--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-15 16:16:19

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
-- TOC entry 4915 (class 1262 OID 18898)
-- Name: solicitudesdb; Type: DATABASE; Schema: -; Owner: postgres
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
-- TOC entry 218 (class 1259 OID 18900)
-- Name: estados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados (
    id integer NOT NULL,
    nombre character varying,
    descripcion character varying
);


ALTER TABLE public.estados OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18899)
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.estados ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 18915)
-- Name: solicitudes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitudes (
    id integer NOT NULL,
    monto numeric(20,3),
    email character varying(50),
    plazo character varying(40),
    id_estado integer,
    id_tipo_prestamo integer
);


ALTER TABLE public.solicitudes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18927)
-- Name: solicitudes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.solicitudes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.solicitudes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 18908)
-- Name: tipo_prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_prestamos (
    id integer NOT NULL,
    nombre character varying(200),
    monto_minimo numeric,
    monto_maximo numeric,
    tasa_interes numeric,
    validacion_automatica boolean
);


ALTER TABLE public.tipo_prestamos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18907)
-- Name: tipo_prestamos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tipo_prestamos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_prestamos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4905 (class 0 OID 18900)
-- Dependencies: 218
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estados (id, nombre, descripcion) OVERRIDING SYSTEM VALUE VALUES (1, 'Pendiente de revisión', 'Prestamo pendiente de revision');
INSERT INTO public.estados (id, nombre, descripcion) OVERRIDING SYSTEM VALUE VALUES (2, 'Rechazada', 'Rechazada');
INSERT INTO public.estados (id, nombre, descripcion) OVERRIDING SYSTEM VALUE VALUES (3, 'Aprobada', 'Aprobada');
INSERT INTO public.estados (id, nombre, descripcion) OVERRIDING SYSTEM VALUE VALUES (4, 'Revisión manual', 'Revisión manual');


--
-- TOC entry 4908 (class 0 OID 18915)
-- Dependencies: 221
-- Data for Name: solicitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (11, 25000000.000, 'luisadiaz@gmail.com', '120', 1, 1);
INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (12, 25000000.000, 'mariomontlz@gmail.com', '120', 1, 1);
INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (13, 23000000.000, 'luisadiaz@gmail.com', '36', 1, 1);
INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (14, 23000000.000, 'luisadiaz@gmail.com', '36', 1, 1);
INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (10, 12800000.000, 'luisadiaz@gmail.com', '48', 2, 2);
INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (15, 29000000.000, 'luisadiaz@gmail.com', '72', 1, 1);
INSERT INTO public.solicitudes (id, monto, email, plazo, id_estado, id_tipo_prestamo) OVERRIDING SYSTEM VALUE VALUES (16, 26000000.000, 'luisadiaz@gmail.com', '32', 1, 1);


--
-- TOC entry 4907 (class 0 OID 18908)
-- Dependencies: 220
-- Data for Name: tipo_prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_prestamos (id, nombre, monto_minimo, monto_maximo, tasa_interes, validacion_automatica) OVERRIDING SYSTEM VALUE VALUES (1, 'hipotecario', 15000000, 500000000, 4.5, true);
INSERT INTO public.tipo_prestamos (id, nombre, monto_minimo, monto_maximo, tasa_interes, validacion_automatica) OVERRIDING SYSTEM VALUE VALUES (2, 'educativo', 5000000, 50000000, 6, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 217
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_id_seq', 3, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 222
-- Name: solicitudes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_id_seq', 16, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipo_prestamos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_prestamos_id_seq', 2, true);


--
-- TOC entry 4753 (class 2606 OID 18906)
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 18914)
-- Name: tipo_prestamos pk_tipo_prestamo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_prestamos
    ADD CONSTRAINT pk_tipo_prestamo PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 18919)
-- Name: solicitudes solicitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_pkey PRIMARY KEY (id);


--
-- TOC entry 4758 (class 2606 OID 18920)
-- Name: solicitudes fk_estado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT fk_estado_id FOREIGN KEY (id_estado) REFERENCES public.estados(id);


-- Completed on 2025-09-15 16:16:19

--
-- PostgreSQL database dump complete
--

