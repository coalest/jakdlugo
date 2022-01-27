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

COPY public.courses (id, name) FROM stdin;
1	ls95
2	rb100
3	rb101
4	rb120
5	rb130
6	ls170
7	rb175
8	ls180
9	rb185
10	ls202
11	js210
12	ls215
13	js225
14	js230
15	rb299
16	js100
17	js101
18	js120
19	js130
20	js175
21	js185
\.


--
-- Data for Name: hours; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hours (id, student_id, course_id, hours) FROM stdin;
1	1	3	127
2	1	4	73
3	1	5	75
4	1	7	67
5	1	8	50
6	1	9	12
7	1	10	63
8	1	11	86
9	2	10	130
10	2	11	134
11	2	13	72
12	2	14	175
13	3	3	109
14	3	4	129
15	3	5	139
16	3	6	171
17	3	7	95
18	3	8	181
19	3	9	28
20	3	10	209
21	3	11	211
22	3	12	216
23	3	13	229
24	3	14	239
25	4	3	78
26	4	4	91
27	4	5	58
28	4	7	52
29	4	8	51
30	4	9	16
31	4	10	55
32	4	11	66
33	5	4	150
34	5	5	127
35	5	8	128
36	5	10	161
37	5	11	257
38	5	13	109
39	5	14	246
40	5	3	233
41	6	2	44
42	6	3	165
43	6	4	95
44	6	5	51
45	6	6	37
46	6	7	45
47	6	8	51
48	6	9	11
49	7	3	102
50	7	4	87
51	7	5	37
52	7	6	35
53	7	7	76
54	7	8	27
55	7	9	12
56	8	2	29
57	8	3	114
58	8	4	63
59	8	5	61
60	8	6	17
61	8	7	24
62	8	8	26
63	8	9	7
64	8	10	4
65	8	11	67
66	8	12	60
67	8	13	59
68	8	14	91
69	9	6	18
70	9	8	50
71	9	16	12
72	9	17	48
73	9	18	83
74	9	19	47
75	9	20	16
76	9	21	24
81	10	3	307
82	10	4	131
83	10	5	70
84	10	6	39
85	10	7	59
86	10	8	59
87	10	9	15
88	10	10	47
89	10	11	97
90	10	12	105
91	10	13	91
92	10	14	188
93	11	1	20
94	11	2	43
95	11	3	149
96	11	4	85
97	11	5	155
98	11	6	30
99	11	7	90
100	11	8	48
101	11	9	15
102	11	10	92
103	11	11	63
104	11	12	52
105	11	13	75
106	11	14	187
108	12	3	190
109	12	4	175
110	12	5	80
111	12	6	26
112	12	7	73
113	12	8	49
114	12	9	10
115	12	10	38
116	12	11	112
117	12	12	89
118	12	13	119
119	12	14	192
120	13	6	41
121	13	8	59
122	13	10	65
123	13	12	77
124	13	14	173
125	13	16	9
126	13	17	239
127	13	18	87
128	13	19	75
129	13	20	32
130	13	21	22
132	14	2	48
133	14	3	282
134	14	4	116
135	14	5	54
136	14	6	30
137	14	7	49
138	14	8	42
139	14	9	8
140	14	10	10
141	14	11	87
142	14	12	73
143	14	13	87
144	14	14	193
145	15	6	20
146	15	8	35
147	15	10	51
148	15	12	51
149	15	14	144
150	15	17	179
151	15	18	79
152	15	19	58
153	15	20	33
154	15	21	20
155	16	12	87
156	16	14	200
157	16	16	85
158	16	17	286
159	16	18	99
160	16	19	81
161	17	6	25
162	17	8	43
163	17	10	22
164	17	12	51
165	17	14	124
166	17	17	194
167	17	18	112
168	17	19	63
169	17	20	17
170	17	21	13
171	18	1	24
172	18	6	41
173	18	8	59
174	18	10	52
175	18	12	52
176	18	14	146
177	18	16	42
178	18	17	188
179	18	18	112
180	18	19	93
181	18	20	27
182	18	21	16
183	19	1	25
184	19	2	52
185	19	3	382
186	19	4	205
187	19	5	162
188	19	6	59
189	19	7	84
190	19	8	85
191	19	9	16
192	19	10	54
193	19	11	186
194	19	12	150
195	19	13	169
196	19	14	276
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students (id, comment_num, track) FROM stdin;
1	74908	ruby
2	74931	\N
3	74995	ruby
4	77766	ruby
5	77950	ruby
6	77967	ruby
7	78210	ruby
8	80335	ruby
9	80817	javascript
10	81225	ruby
11	86022	ruby
12	87153	ruby
13	89078	javascript
14	90024	ruby
15	93341	javascript
16	93474	javascript
17	94474	javascript
18	95227	javascript
19	95545	ruby
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 63, true);


--
-- Name: hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hours_id_seq', 196, true);


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

