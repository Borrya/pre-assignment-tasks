--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-05-06 01:28:11

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
-- TOC entry 209 (class 1259 OID 32770)
-- Name: exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    teacher_id integer NOT NULL,
    training_course_id integer NOT NULL
);


ALTER TABLE public.exam OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 32768)
-- Name: exam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_id_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 208
-- Name: exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exam_id_seq OWNED BY public.exam.id;


--
-- TOC entry 211 (class 1259 OID 32791)
-- Name: exam_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam_result (
    id integer NOT NULL,
    teacher_id integer NOT NULL,
    student_id integer NOT NULL,
    result smallint NOT NULL,
    note character varying(50),
    exam_id integer NOT NULL
);


ALTER TABLE public.exam_result OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 32789)
-- Name: exam_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_result_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 210
-- Name: exam_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exam_result_id_seq OWNED BY public.exam_result.id;


--
-- TOC entry 203 (class 1259 OID 24591)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    birth_date date NOT NULL,
    sex bit(1) NOT NULL,
    hostel_live bit(1) DEFAULT NULL::"bit"
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24589)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 202
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 212 (class 1259 OID 32809)
-- Name: student_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_result (
    student_id integer NOT NULL,
    training_course_id integer NOT NULL,
    exam_id integer,
    result smallint NOT NULL,
    date date NOT NULL,
    note character varying(50)
);


ALTER TABLE public.student_result OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24600)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24598)
-- Name: teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 204
-- Name: teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;


--
-- TOC entry 207 (class 1259 OID 24610)
-- Name: training_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.training_course (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    teacher_id integer NOT NULL
);


ALTER TABLE public.training_course OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24608)
-- Name: training_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.training_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_course_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 206
-- Name: training_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.training_course_id_seq OWNED BY public.training_course.id;


--
-- TOC entry 2719 (class 2604 OID 32773)
-- Name: exam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam ALTER COLUMN id SET DEFAULT nextval('public.exam_id_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 32794)
-- Name: exam_result id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_result ALTER COLUMN id SET DEFAULT nextval('public.exam_result_id_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 24594)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 24603)
-- Name: teacher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 24613)
-- Name: training_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_course ALTER COLUMN id SET DEFAULT nextval('public.training_course_id_seq'::regclass);


--
-- TOC entry 2887 (class 0 OID 32770)
-- Dependencies: 209
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam (id, date, teacher_id, training_course_id) FROM stdin;
1	2020-01-03 09:00:00	3	1
2	2020-01-08 15:00:00	1	2
3	2020-01-16 15:30:00	2	3
4	2020-01-21 10:00:00	1	5
5	2020-01-28 10:00:00	2	8
\.


--
-- TOC entry 2889 (class 0 OID 32791)
-- Dependencies: 211
-- Data for Name: exam_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam_result (id, teacher_id, student_id, result, note, exam_id) FROM stdin;
1	3	1	7	fine	1
2	3	4	5	not bad	1
3	1	2	8	good	2
4	1	3	4	bad	2
5	2	5	7	a bit better	3
6	2	2	9	nice	3
7	1	1	10	perfect	4
8	2	3	7	a bit better	5
9	2	4	7	a bit better	5
10	3	1	9	cool wow	1
\.


--
-- TOC entry 2881 (class 0 OID 24591)
-- Dependencies: 203
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, first_name, last_name, birth_date, sex, hostel_live) FROM stdin;
1	Sasha	Koktev	2000-07-20	1	0
2	Dasha	Borisevich	2000-06-04	0	1
3	Anya	Pavlova	2000-07-28	0	1
4	Yana	Bernatskaya	2000-03-30	0	0
5	Timofey	Anischik	2000-07-04	1	1
\.


--
-- TOC entry 2890 (class 0 OID 32809)
-- Dependencies: 212
-- Data for Name: student_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_result (student_id, training_course_id, exam_id, result, date, note) FROM stdin;
1	1	1	7	2020-01-03	fine
3	1	1	10	2020-01-03	excellent
4	1	1	5	2020-01-03	not bad
3	2	2	4	2020-01-08	bad
5	2	2	10	2020-01-08	excellent
5	3	3	7	2020-01-16	a bit better
4	3	3	10	2020-01-16	excellent
1	5	4	10	2020-01-21	perfect
3	5	4	9	2020-01-21	excellent
3	8	5	7	2020-01-28	a bit better
4	8	5	7	2020-01-28	a bit better
2	3	3	2	2020-01-16	awful
2	8	5	2	2020-01-28	awful
2	2	2	8	2020-01-08	good
5	1	1	10	2020-01-03	automat
1	2	2	10	2019-01-04	\N
\.


--
-- TOC entry 2883 (class 0 OID 24600)
-- Dependencies: 205
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (id, first_name, last_name) FROM stdin;
1	Natalia	Pavlenok
2	Galina	Volchkova
3	Elena	Sobolevskaya
\.


--
-- TOC entry 2885 (class 0 OID 24610)
-- Dependencies: 207
-- Data for Name: training_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.training_course (id, name, teacher_id) FROM stdin;
1	DBMS	3
2	Math statistics	1
3	Graph theory	2
4	Optimization methods	1
5	Сomputer networks	1
6	The theory of algorithms	3
7	Operating systems	3
8	The equations of mathematical physics	2
\.


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 208
-- Name: exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_id_seq', 5, true);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 210
-- Name: exam_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_result_id_seq', 18, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 202
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 2, true);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 204
-- Name: teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_id_seq', 3, true);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 206
-- Name: training_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.training_course_id_seq', 8, true);


--
-- TOC entry 2731 (class 2606 OID 32775)
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32796)
-- Name: exam_result exam_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_result
    ADD CONSTRAINT exam_result_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 24597)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 32813)
-- Name: student_result student_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_result
    ADD CONSTRAINT student_result_pkey PRIMARY KEY (student_id, training_course_id);


--
-- TOC entry 2724 (class 2606 OID 24607)
-- Name: teacher teacher_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_last_name_key UNIQUE (last_name);


--
-- TOC entry 2726 (class 2606 OID 24605)
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 24615)
-- Name: training_course training_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_course
    ADD CONSTRAINT training_course_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 1259 OID 32832)
-- Name: exam_result_exam_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_result_exam_fk_idx ON public.exam_result USING btree (exam_id);


--
-- TOC entry 2738 (class 1259 OID 32808)
-- Name: exam_result_student_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_result_student_fk_idx ON public.exam_result USING btree (student_id);


--
-- TOC entry 2739 (class 1259 OID 32807)
-- Name: exam_result_teacher_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_result_teacher_fk_idx ON public.exam_result USING btree (teacher_id);


--
-- TOC entry 2732 (class 1259 OID 32782)
-- Name: exam_teacher_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_teacher_fk_idx ON public.exam USING btree (teacher_id);


--
-- TOC entry 2733 (class 1259 OID 32788)
-- Name: exam_training_course_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exam_training_course_fk_idx ON public.exam USING btree (training_course_id);


--
-- TOC entry 2734 (class 1259 OID 32776)
-- Name: id_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX id_unique ON public.exam USING btree (id);


--
-- TOC entry 2740 (class 1259 OID 32825)
-- Name: student_result__idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX student_result__idx ON public.student_result USING btree (training_course_id);


--
-- TOC entry 2741 (class 1259 OID 32838)
-- Name: student_result_exam_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX student_result_exam_fk_idx ON public.student_result USING btree (exam_id);


--
-- TOC entry 2744 (class 1259 OID 32826)
-- Name: student_result_student_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX student_result_student_id_idx ON public.student_result USING btree (student_id);


--
-- TOC entry 2727 (class 1259 OID 24621)
-- Name: teacher_fk_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teacher_fk_idx ON public.training_course USING btree (teacher_id);


--
-- TOC entry 2750 (class 2606 OID 32827)
-- Name: exam_result exam_result_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_result
    ADD CONSTRAINT exam_result_exam_fk FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- TOC entry 2749 (class 2606 OID 32802)
-- Name: exam_result exam_result_student_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_result
    ADD CONSTRAINT exam_result_student_fk FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- TOC entry 2748 (class 2606 OID 32797)
-- Name: exam_result exam_result_teacher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_result
    ADD CONSTRAINT exam_result_teacher_fk FOREIGN KEY (teacher_id) REFERENCES public.teacher(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2746 (class 2606 OID 32777)
-- Name: exam exam_teacher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_teacher_fk FOREIGN KEY (teacher_id) REFERENCES public.teacher(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2747 (class 2606 OID 32783)
-- Name: exam exam_training_course_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_training_course_fk FOREIGN KEY (training_course_id) REFERENCES public.training_course(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2753 (class 2606 OID 32833)
-- Name: student_result student_result_exam_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_result
    ADD CONSTRAINT student_result_exam_fk FOREIGN KEY (exam_id) REFERENCES public.exam(id);


--
-- TOC entry 2752 (class 2606 OID 32819)
-- Name: student_result student_result_student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_result
    ADD CONSTRAINT student_result_student_id FOREIGN KEY (student_id) REFERENCES public.student(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2751 (class 2606 OID 32814)
-- Name: student_result student_result_training_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_result
    ADD CONSTRAINT student_result_training_course FOREIGN KEY (training_course_id) REFERENCES public.training_course(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2745 (class 2606 OID 24616)
-- Name: training_course teacher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_course
    ADD CONSTRAINT teacher_fk FOREIGN KEY (teacher_id) REFERENCES public.teacher(id) ON UPDATE RESTRICT ON DELETE CASCADE;


-- Completed on 2020-05-06 01:28:12

--
-- PostgreSQL database dump complete
--

