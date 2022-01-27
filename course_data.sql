--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Debian 13.5-0+deb11u1)
-- Dumped by pg_dump version 13.5 (Debian 13.5-0+deb11u1)

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
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: hours; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hours (
    id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    hours integer NOT NULL
);


--
-- Name: hours_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hours_id_seq OWNED BY public.hours.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    comment_num integer,
    track character varying(10),
    CONSTRAINT students_track_check CHECK (((track)::text = ANY ('{ruby,javascript}'::text[])))
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: hours id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hours ALTER COLUMN id SET DEFAULT nextval('public.hours_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courses VALUES (1, 'ls95');
INSERT INTO public.courses VALUES (2, 'rb100');
INSERT INTO public.courses VALUES (3, 'rb101');
INSERT INTO public.courses VALUES (4, 'rb120');
INSERT INTO public.courses VALUES (5, 'rb130');
INSERT INTO public.courses VALUES (6, 'ls170');
INSERT INTO public.courses VALUES (7, 'rb175');
INSERT INTO public.courses VALUES (8, 'ls180');
INSERT INTO public.courses VALUES (9, 'rb185');
INSERT INTO public.courses VALUES (10, 'ls202');
INSERT INTO public.courses VALUES (11, 'js210');
INSERT INTO public.courses VALUES (12, 'ls215');
INSERT INTO public.courses VALUES (13, 'js225');
INSERT INTO public.courses VALUES (14, 'js230');
INSERT INTO public.courses VALUES (15, 'rb299');
INSERT INTO public.courses VALUES (16, 'js100');
INSERT INTO public.courses VALUES (17, 'js101');
INSERT INTO public.courses VALUES (18, 'js120');
INSERT INTO public.courses VALUES (19, 'js130');
INSERT INTO public.courses VALUES (20, 'js175');
INSERT INTO public.courses VALUES (21, 'js185');


--
-- Data for Name: hours; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hours VALUES (1, 1, 3, 127);
INSERT INTO public.hours VALUES (2, 1, 4, 73);
INSERT INTO public.hours VALUES (3, 1, 5, 75);
INSERT INTO public.hours VALUES (4, 1, 7, 67);
INSERT INTO public.hours VALUES (5, 1, 8, 50);
INSERT INTO public.hours VALUES (6, 1, 9, 12);
INSERT INTO public.hours VALUES (7, 1, 10, 63);
INSERT INTO public.hours VALUES (8, 1, 11, 86);
INSERT INTO public.hours VALUES (9, 2, 10, 130);
INSERT INTO public.hours VALUES (10, 2, 11, 134);
INSERT INTO public.hours VALUES (11, 2, 13, 72);
INSERT INTO public.hours VALUES (12, 2, 14, 175);
INSERT INTO public.hours VALUES (13, 3, 3, 187);
INSERT INTO public.hours VALUES (14, 3, 4, 87);
INSERT INTO public.hours VALUES (15, 3, 5, 114);
INSERT INTO public.hours VALUES (16, 3, 6, 16);
INSERT INTO public.hours VALUES (17, 3, 7, 95);
INSERT INTO public.hours VALUES (18, 3, 8, 40);
INSERT INTO public.hours VALUES (19, 3, 9, 28);
INSERT INTO public.hours VALUES (20, 3, 10, 78);
INSERT INTO public.hours VALUES (21, 3, 11, 66);
INSERT INTO public.hours VALUES (22, 3, 12, 75);
INSERT INTO public.hours VALUES (23, 3, 13, 73);
INSERT INTO public.hours VALUES (24, 3, 14, 212);
INSERT INTO public.hours VALUES (25, 4, 3, 78);
INSERT INTO public.hours VALUES (26, 4, 4, 91);
INSERT INTO public.hours VALUES (27, 4, 5, 58);
INSERT INTO public.hours VALUES (28, 4, 7, 52);
INSERT INTO public.hours VALUES (29, 4, 8, 51);
INSERT INTO public.hours VALUES (30, 4, 9, 16);
INSERT INTO public.hours VALUES (31, 4, 10, 55);
INSERT INTO public.hours VALUES (32, 4, 11, 66);
INSERT INTO public.hours VALUES (33, 5, 4, 150);
INSERT INTO public.hours VALUES (34, 5, 5, 127);
INSERT INTO public.hours VALUES (35, 5, 8, 128);
INSERT INTO public.hours VALUES (36, 5, 10, 161);
INSERT INTO public.hours VALUES (37, 5, 11, 257);
INSERT INTO public.hours VALUES (38, 5, 13, 109);
INSERT INTO public.hours VALUES (39, 5, 14, 246);
INSERT INTO public.hours VALUES (40, 5, 3, 233);
INSERT INTO public.hours VALUES (41, 6, 2, 44);
INSERT INTO public.hours VALUES (42, 6, 3, 165);
INSERT INTO public.hours VALUES (43, 6, 4, 95);
INSERT INTO public.hours VALUES (44, 6, 5, 51);
INSERT INTO public.hours VALUES (45, 6, 6, 37);
INSERT INTO public.hours VALUES (46, 6, 7, 45);
INSERT INTO public.hours VALUES (47, 6, 8, 51);
INSERT INTO public.hours VALUES (48, 6, 9, 11);
INSERT INTO public.hours VALUES (49, 7, 3, 102);
INSERT INTO public.hours VALUES (50, 7, 4, 87);
INSERT INTO public.hours VALUES (51, 7, 5, 37);
INSERT INTO public.hours VALUES (52, 7, 6, 35);
INSERT INTO public.hours VALUES (53, 7, 7, 76);
INSERT INTO public.hours VALUES (54, 7, 8, 27);
INSERT INTO public.hours VALUES (55, 7, 9, 12);
INSERT INTO public.hours VALUES (56, 8, 2, 29);
INSERT INTO public.hours VALUES (57, 8, 3, 114);
INSERT INTO public.hours VALUES (58, 8, 4, 63);
INSERT INTO public.hours VALUES (59, 8, 5, 61);
INSERT INTO public.hours VALUES (60, 8, 6, 17);
INSERT INTO public.hours VALUES (61, 8, 7, 24);
INSERT INTO public.hours VALUES (62, 8, 8, 26);
INSERT INTO public.hours VALUES (63, 8, 9, 7);
INSERT INTO public.hours VALUES (64, 8, 10, 4);
INSERT INTO public.hours VALUES (65, 8, 11, 67);
INSERT INTO public.hours VALUES (66, 8, 12, 60);
INSERT INTO public.hours VALUES (67, 8, 13, 59);
INSERT INTO public.hours VALUES (68, 8, 14, 91);
INSERT INTO public.hours VALUES (69, 9, 6, 18);
INSERT INTO public.hours VALUES (70, 9, 8, 50);
INSERT INTO public.hours VALUES (71, 9, 16, 12);
INSERT INTO public.hours VALUES (72, 9, 17, 48);
INSERT INTO public.hours VALUES (73, 9, 18, 83);
INSERT INTO public.hours VALUES (74, 9, 19, 47);
INSERT INTO public.hours VALUES (75, 9, 20, 16);
INSERT INTO public.hours VALUES (76, 9, 21, 24);
INSERT INTO public.hours VALUES (81, 10, 3, 307);
INSERT INTO public.hours VALUES (82, 10, 4, 131);
INSERT INTO public.hours VALUES (83, 10, 5, 70);
INSERT INTO public.hours VALUES (84, 10, 6, 39);
INSERT INTO public.hours VALUES (85, 10, 7, 59);
INSERT INTO public.hours VALUES (86, 10, 8, 59);
INSERT INTO public.hours VALUES (87, 10, 9, 15);
INSERT INTO public.hours VALUES (88, 10, 10, 47);
INSERT INTO public.hours VALUES (89, 10, 11, 97);
INSERT INTO public.hours VALUES (90, 10, 12, 105);
INSERT INTO public.hours VALUES (91, 10, 13, 91);
INSERT INTO public.hours VALUES (92, 10, 14, 188);
INSERT INTO public.hours VALUES (93, 11, 1, 20);
INSERT INTO public.hours VALUES (94, 11, 2, 43);
INSERT INTO public.hours VALUES (95, 11, 3, 149);
INSERT INTO public.hours VALUES (96, 11, 4, 85);
INSERT INTO public.hours VALUES (97, 11, 5, 155);
INSERT INTO public.hours VALUES (98, 11, 6, 30);
INSERT INTO public.hours VALUES (99, 11, 7, 90);
INSERT INTO public.hours VALUES (100, 11, 8, 48);
INSERT INTO public.hours VALUES (101, 11, 9, 15);
INSERT INTO public.hours VALUES (102, 11, 10, 92);
INSERT INTO public.hours VALUES (103, 11, 11, 63);
INSERT INTO public.hours VALUES (104, 11, 12, 52);
INSERT INTO public.hours VALUES (105, 11, 13, 75);
INSERT INTO public.hours VALUES (106, 11, 14, 187);
INSERT INTO public.hours VALUES (108, 12, 3, 190);
INSERT INTO public.hours VALUES (109, 12, 4, 175);
INSERT INTO public.hours VALUES (110, 12, 5, 80);
INSERT INTO public.hours VALUES (111, 12, 6, 26);
INSERT INTO public.hours VALUES (112, 12, 7, 73);
INSERT INTO public.hours VALUES (113, 12, 8, 49);
INSERT INTO public.hours VALUES (114, 12, 9, 10);
INSERT INTO public.hours VALUES (115, 12, 10, 38);
INSERT INTO public.hours VALUES (116, 12, 11, 112);
INSERT INTO public.hours VALUES (117, 12, 12, 89);
INSERT INTO public.hours VALUES (118, 12, 13, 119);
INSERT INTO public.hours VALUES (119, 12, 14, 192);
INSERT INTO public.hours VALUES (120, 13, 6, 41);
INSERT INTO public.hours VALUES (121, 13, 8, 59);
INSERT INTO public.hours VALUES (122, 13, 10, 65);
INSERT INTO public.hours VALUES (123, 13, 12, 77);
INSERT INTO public.hours VALUES (124, 13, 14, 173);
INSERT INTO public.hours VALUES (125, 13, 16, 9);
INSERT INTO public.hours VALUES (126, 13, 17, 239);
INSERT INTO public.hours VALUES (127, 13, 18, 87);
INSERT INTO public.hours VALUES (128, 13, 19, 75);
INSERT INTO public.hours VALUES (129, 13, 20, 32);
INSERT INTO public.hours VALUES (130, 13, 21, 22);
INSERT INTO public.hours VALUES (132, 14, 2, 48);
INSERT INTO public.hours VALUES (133, 14, 3, 282);
INSERT INTO public.hours VALUES (134, 14, 4, 116);
INSERT INTO public.hours VALUES (135, 14, 5, 54);
INSERT INTO public.hours VALUES (136, 14, 6, 30);
INSERT INTO public.hours VALUES (137, 14, 7, 49);
INSERT INTO public.hours VALUES (138, 14, 8, 42);
INSERT INTO public.hours VALUES (139, 14, 9, 8);
INSERT INTO public.hours VALUES (140, 14, 10, 10);
INSERT INTO public.hours VALUES (141, 14, 11, 87);
INSERT INTO public.hours VALUES (142, 14, 12, 73);
INSERT INTO public.hours VALUES (143, 14, 13, 87);
INSERT INTO public.hours VALUES (144, 14, 14, 193);
INSERT INTO public.hours VALUES (145, 15, 6, 20);
INSERT INTO public.hours VALUES (146, 15, 8, 35);
INSERT INTO public.hours VALUES (147, 15, 10, 51);
INSERT INTO public.hours VALUES (148, 15, 12, 51);
INSERT INTO public.hours VALUES (149, 15, 14, 144);
INSERT INTO public.hours VALUES (150, 15, 17, 179);
INSERT INTO public.hours VALUES (151, 15, 18, 79);
INSERT INTO public.hours VALUES (152, 15, 19, 58);
INSERT INTO public.hours VALUES (153, 15, 20, 33);
INSERT INTO public.hours VALUES (154, 15, 21, 20);
INSERT INTO public.hours VALUES (155, 16, 12, 87);
INSERT INTO public.hours VALUES (156, 16, 14, 200);
INSERT INTO public.hours VALUES (157, 16, 16, 85);
INSERT INTO public.hours VALUES (158, 16, 17, 286);
INSERT INTO public.hours VALUES (159, 16, 18, 99);
INSERT INTO public.hours VALUES (160, 16, 19, 81);
INSERT INTO public.hours VALUES (161, 17, 6, 25);
INSERT INTO public.hours VALUES (162, 17, 8, 43);
INSERT INTO public.hours VALUES (163, 17, 10, 22);
INSERT INTO public.hours VALUES (164, 17, 12, 51);
INSERT INTO public.hours VALUES (165, 17, 14, 124);
INSERT INTO public.hours VALUES (166, 17, 17, 194);
INSERT INTO public.hours VALUES (167, 17, 18, 112);
INSERT INTO public.hours VALUES (168, 17, 19, 63);
INSERT INTO public.hours VALUES (169, 17, 20, 17);
INSERT INTO public.hours VALUES (170, 17, 21, 13);
INSERT INTO public.hours VALUES (171, 18, 1, 24);
INSERT INTO public.hours VALUES (172, 18, 6, 41);
INSERT INTO public.hours VALUES (173, 18, 8, 59);
INSERT INTO public.hours VALUES (174, 18, 10, 52);
INSERT INTO public.hours VALUES (175, 18, 12, 52);
INSERT INTO public.hours VALUES (176, 18, 14, 146);
INSERT INTO public.hours VALUES (177, 18, 16, 42);
INSERT INTO public.hours VALUES (178, 18, 17, 188);
INSERT INTO public.hours VALUES (179, 18, 18, 112);
INSERT INTO public.hours VALUES (180, 18, 19, 93);
INSERT INTO public.hours VALUES (181, 18, 20, 27);
INSERT INTO public.hours VALUES (182, 18, 21, 16);
INSERT INTO public.hours VALUES (183, 19, 1, 25);
INSERT INTO public.hours VALUES (184, 19, 2, 52);
INSERT INTO public.hours VALUES (185, 19, 3, 382);
INSERT INTO public.hours VALUES (186, 19, 4, 205);
INSERT INTO public.hours VALUES (187, 19, 5, 162);
INSERT INTO public.hours VALUES (188, 19, 6, 59);
INSERT INTO public.hours VALUES (189, 19, 7, 84);
INSERT INTO public.hours VALUES (190, 19, 8, 85);
INSERT INTO public.hours VALUES (191, 19, 9, 16);
INSERT INTO public.hours VALUES (192, 19, 10, 54);
INSERT INTO public.hours VALUES (193, 19, 11, 186);
INSERT INTO public.hours VALUES (194, 19, 12, 150);
INSERT INTO public.hours VALUES (195, 19, 13, 169);
INSERT INTO public.hours VALUES (196, 19, 14, 276);
INSERT INTO public.hours VALUES (197, 12, 2, 40);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students VALUES (1, 74908, 'ruby');
INSERT INTO public.students VALUES (2, 74931, NULL);
INSERT INTO public.students VALUES (3, 74995, 'ruby');
INSERT INTO public.students VALUES (4, 77766, 'ruby');
INSERT INTO public.students VALUES (5, 77950, 'ruby');
INSERT INTO public.students VALUES (6, 77967, 'ruby');
INSERT INTO public.students VALUES (7, 78210, 'ruby');
INSERT INTO public.students VALUES (8, 80335, 'ruby');
INSERT INTO public.students VALUES (9, 80817, 'javascript');
INSERT INTO public.students VALUES (10, 81225, 'ruby');
INSERT INTO public.students VALUES (11, 86022, 'ruby');
INSERT INTO public.students VALUES (12, 87153, 'ruby');
INSERT INTO public.students VALUES (13, 89078, 'javascript');
INSERT INTO public.students VALUES (14, 90024, 'ruby');
INSERT INTO public.students VALUES (15, 93341, 'javascript');
INSERT INTO public.students VALUES (16, 93474, 'javascript');
INSERT INTO public.students VALUES (17, 94474, 'javascript');
INSERT INTO public.students VALUES (18, 95227, 'javascript');
INSERT INTO public.students VALUES (19, 95545, 'ruby');


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 63, true);


--
-- Name: hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hours_id_seq', 197, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 19, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: hours hours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hours
    ADD CONSTRAINT hours_pkey PRIMARY KEY (id);


--
-- Name: hours hours_student_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hours
    ADD CONSTRAINT hours_student_id_course_id_key UNIQUE (student_id, course_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: hours hours_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hours
    ADD CONSTRAINT hours_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: hours hours_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hours
    ADD CONSTRAINT hours_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

