--
-- PostgreSQL database dump
--

\restrict 8JlbQa0seWkgXZHIO3igDyMuj7XEnJLWDWCzast7dsR2jxascffRnJgbGu8FtXt

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

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

ALTER TABLE IF EXISTS ONLY public.experiments DROP CONSTRAINT IF EXISTS experiments_predecessor_id_fkey;
ALTER TABLE IF EXISTS ONLY public.experiments DROP CONSTRAINT IF EXISTS experiments_culture_id_fkey;
ALTER TABLE IF EXISTS ONLY public.experiments DROP CONSTRAINT IF EXISTS experiments_condition_id_fkey;
ALTER TABLE IF EXISTS ONLY public.predecessors DROP CONSTRAINT IF EXISTS predecessors_pkey;
ALTER TABLE IF EXISTS ONLY public.predecessors DROP CONSTRAINT IF EXISTS predecessors_name_key;
ALTER TABLE IF EXISTS ONLY public.experiments DROP CONSTRAINT IF EXISTS experiments_pkey;
ALTER TABLE IF EXISTS ONLY public.cultures DROP CONSTRAINT IF EXISTS cultures_pkey;
ALTER TABLE IF EXISTS ONLY public.cultures DROP CONSTRAINT IF EXISTS cultures_name_key;
ALTER TABLE IF EXISTS ONLY public.conditions DROP CONSTRAINT IF EXISTS conditions_pkey;
ALTER TABLE IF EXISTS ONLY public.conditions DROP CONSTRAINT IF EXISTS conditions_name_key;
ALTER TABLE IF EXISTS public.predecessors ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.experiments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.cultures ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conditions ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.predecessors_id_seq;
DROP TABLE IF EXISTS public.predecessors;
DROP SEQUENCE IF EXISTS public.experiments_id_seq;
DROP TABLE IF EXISTS public.experiments;
DROP SEQUENCE IF EXISTS public.cultures_id_seq;
DROP TABLE IF EXISTS public.cultures;
DROP SEQUENCE IF EXISTS public.conditions_id_seq;
DROP TABLE IF EXISTS public.conditions;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: conditions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.conditions (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.conditions OWNER TO "user";

--
-- Name: conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conditions_id_seq OWNER TO "user";

--
-- Name: conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.conditions_id_seq OWNED BY public.conditions.id;


--
-- Name: cultures; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.cultures (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.cultures OWNER TO "user";

--
-- Name: cultures_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.cultures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cultures_id_seq OWNER TO "user";

--
-- Name: cultures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.cultures_id_seq OWNED BY public.cultures.id;


--
-- Name: experiments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.experiments (
    id integer NOT NULL,
    year integer,
    field integer,
    culture_id integer,
    predecessor_id integer,
    condition_id integer,
    yield numeric(5,2)
);


ALTER TABLE public.experiments OWNER TO "user";

--
-- Name: experiments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.experiments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experiments_id_seq OWNER TO "user";

--
-- Name: experiments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.experiments_id_seq OWNED BY public.experiments.id;


--
-- Name: predecessors; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.predecessors (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.predecessors OWNER TO "user";

--
-- Name: predecessors_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.predecessors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.predecessors_id_seq OWNER TO "user";

--
-- Name: predecessors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.predecessors_id_seq OWNED BY public.predecessors.id;


--
-- Name: conditions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.conditions ALTER COLUMN id SET DEFAULT nextval('public.conditions_id_seq'::regclass);


--
-- Name: cultures id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cultures ALTER COLUMN id SET DEFAULT nextval('public.cultures_id_seq'::regclass);


--
-- Name: experiments id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.experiments ALTER COLUMN id SET DEFAULT nextval('public.experiments_id_seq'::regclass);


--
-- Name: predecessors id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.predecessors ALTER COLUMN id SET DEFAULT nextval('public.predecessors_id_seq'::regclass);


--
-- Data for Name: conditions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.conditions (id, name) FROM stdin;
1	Без травы
2	С травой
\.


--
-- Data for Name: cultures; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.cultures (id, name) FROM stdin;
1	Горох
2	Овёс
3	Пшеница
4	Ячмень
\.


--
-- Data for Name: experiments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.experiments (id, year, field, culture_id, predecessor_id, condition_id, yield) FROM stdin;
1	2015	1	1	1	2	19.10
2	2015	1	4	2	1	31.80
3	2015	2	4	1	2	22.00
4	2015	2	1	4	2	16.00
5	2015	3	3	3	1	27.50
6	2015	3	1	3	1	17.20
7	2015	4	3	2	1	35.00
8	2015	4	2	1	1	23.10
9	2015	5	1	4	1	17.50
10	2015	5	4	3	1	24.70
11	2015	6	1	1	1	21.30
12	2015	6	3	1	2	27.80
13	2015	7	2	1	1	24.20
14	2015	7	3	3	1	28.30
15	2015	8	2	2	1	31.60
16	2015	8	3	4	1	25.80
17	2015	9	4	1	1	24.60
18	2015	9	2	4	1	22.20
19	2015	10	2	3	1	21.10
20	2015	10	2	3	1	22.10
21	2015	11	2	3	1	22.30
22	2015	11	1	1	1	19.60
23	2015	12	1	1	2	18.50
24	2015	12	2	4	2	25.30
25	2015	13	1	4	1	16.10
26	2015	13	3	2	2	31.90
27	2015	14	3	1	1	25.90
28	2015	14	4	1	2	24.40
29	2015	15	1	2	2	25.00
30	2015	15	4	3	1	27.60
31	2015	16	1	2	2	23.70
32	2015	16	1	2	2	26.30
33	2015	17	2	1	1	25.90
34	2015	17	4	3	2	27.50
35	2015	18	4	2	2	30.10
36	2015	18	4	3	2	25.60
37	2015	19	4	2	2	31.70
38	2015	19	4	1	1	25.10
39	2015	20	3	1	1	32.60
40	2015	20	4	2	2	33.20
41	2015	21	4	2	2	35.20
42	2015	21	2	4	1	24.60
43	2015	22	2	2	2	28.80
44	2015	22	1	4	1	16.10
45	2015	23	2	3	2	19.50
46	2015	23	4	2	1	32.30
47	2015	24	3	2	2	31.30
48	2015	24	1	3	2	14.00
49	2015	25	2	2	2	26.80
50	2015	25	4	4	2	26.80
51	2015	26	1	3	1	12.80
52	2015	26	3	3	1	29.50
53	2015	27	1	4	1	20.20
54	2015	27	3	2	1	37.00
55	2015	28	4	2	2	31.90
56	2015	28	3	1	1	29.70
57	2015	29	3	2	2	34.70
58	2015	29	1	3	1	20.90
59	2015	30	4	4	1	25.60
60	2015	30	4	2	1	31.60
61	2015	31	3	4	1	27.90
62	2015	31	1	1	1	19.40
63	2015	32	3	2	1	38.90
64	2015	32	1	1	1	19.20
65	2015	33	1	1	2	19.80
66	2015	33	1	4	2	18.20
67	2015	34	3	4	2	27.90
68	2015	34	3	4	2	22.10
69	2015	35	3	4	2	27.40
70	2015	35	4	3	2	21.10
71	2015	36	1	4	1	18.00
72	2015	36	2	2	2	29.80
73	2015	37	2	4	1	25.00
74	2015	37	3	1	2	28.30
75	2015	38	4	1	1	27.20
76	2015	38	1	3	2	16.20
77	2015	39	1	4	2	18.70
78	2015	39	2	4	2	25.60
79	2015	40	3	1	2	26.00
80	2015	40	2	3	2	18.80
81	2015	41	3	4	2	24.30
82	2015	41	1	4	1	17.90
83	2015	42	4	1	2	26.80
84	2015	42	4	1	1	23.20
85	2015	43	2	1	1	24.60
86	2015	43	2	1	1	24.10
87	2015	44	4	1	1	29.60
88	2015	44	1	1	2	15.30
89	2015	45	1	2	2	29.60
90	2015	45	3	4	1	27.90
91	2015	46	1	2	1	21.40
92	2015	46	4	3	1	24.50
93	2015	47	3	2	1	36.20
94	2015	47	4	1	1	23.10
95	2015	48	1	2	2	22.10
96	2015	48	1	2	2	22.80
97	2015	49	2	4	2	24.20
98	2015	49	1	1	1	18.30
99	2015	50	2	4	1	20.70
100	2015	50	4	1	1	29.80
101	2016	1	2	3	2	21.90
102	2016	1	4	3	1	28.60
103	2016	2	2	1	2	21.50
104	2016	2	3	1	1	29.40
105	2016	3	1	2	2	23.70
106	2016	3	1	3	2	14.60
107	2016	4	4	1	1	23.90
108	2016	4	2	1	2	27.00
109	2016	5	2	2	2	28.20
110	2016	5	2	3	2	22.20
111	2016	6	4	3	1	26.90
112	2016	6	1	4	1	17.00
113	2016	7	4	2	1	32.20
114	2016	7	4	3	2	24.90
115	2016	8	1	1	1	16.40
116	2016	8	4	3	1	21.00
117	2016	9	2	2	2	28.70
118	2016	9	3	4	2	25.40
119	2016	10	2	3	2	17.90
120	2016	10	1	3	2	15.30
121	2016	11	3	4	2	27.50
122	2016	11	4	4	2	29.50
123	2016	12	3	3	2	26.20
124	2016	12	3	1	1	27.80
125	2016	13	3	2	1	36.40
126	2016	13	3	4	1	29.20
127	2016	14	3	3	2	25.40
128	2016	14	2	3	2	22.00
129	2016	15	1	3	2	19.90
130	2016	15	1	4	1	18.80
131	2016	16	2	1	2	23.70
132	2016	16	1	4	1	19.90
133	2016	17	4	3	1	25.50
134	2016	17	3	1	1	28.50
135	2016	18	3	1	2	25.70
136	2016	18	3	2	1	36.20
137	2016	19	2	1	1	24.20
138	2016	19	3	1	1	28.10
139	2016	20	3	4	1	25.80
140	2016	20	3	1	2	30.60
141	2016	21	2	4	2	23.10
142	2016	21	1	4	2	16.60
143	2016	22	3	2	2	29.60
144	2016	22	1	4	2	19.80
145	2016	23	4	2	1	32.30
146	2016	23	1	4	2	15.90
147	2016	24	1	3	2	17.50
148	2016	24	3	1	2	25.80
149	2016	25	2	2	2	28.30
150	2016	25	2	2	2	35.50
151	2016	26	4	1	2	25.20
152	2016	26	2	4	2	24.00
153	2016	27	1	4	2	15.30
154	2016	27	4	2	1	33.00
155	2016	28	1	2	2	23.30
156	2016	28	2	2	1	30.50
157	2016	29	2	1	2	26.60
158	2016	29	1	1	2	18.80
159	2016	30	2	3	1	22.10
160	2016	30	3	3	1	27.10
161	2016	31	3	3	1	23.80
162	2016	31	1	4	2	17.20
163	2016	32	2	2	1	30.60
164	2016	32	1	2	1	24.60
165	2016	33	1	3	2	11.30
166	2016	33	4	1	1	26.30
167	2016	34	4	3	2	20.80
168	2016	34	1	3	1	16.20
169	2016	35	1	3	1	18.30
170	2016	35	3	1	2	29.10
171	2016	36	1	2	1	23.90
172	2016	36	1	2	2	19.10
173	2016	37	3	3	1	23.20
174	2016	37	2	4	2	23.20
175	2016	38	1	1	2	19.70
176	2016	38	2	2	2	26.90
177	2016	39	3	2	1	33.20
178	2016	39	3	1	2	31.10
179	2016	40	2	4	1	22.70
180	2016	40	1	4	2	15.80
181	2016	41	2	4	1	20.60
182	2016	41	2	4	1	26.20
183	2016	42	3	4	2	26.40
184	2016	42	3	1	2	24.70
185	2016	43	3	2	1	32.00
186	2016	43	2	2	2	30.40
187	2016	44	2	2	1	33.40
188	2016	44	2	2	1	26.50
189	2016	45	2	4	1	20.50
190	2016	45	3	4	1	28.40
191	2016	46	2	2	1	28.80
192	2016	46	4	1	2	28.90
193	2016	47	3	2	1	35.70
194	2016	47	2	2	2	32.80
195	2016	48	4	2	2	33.80
196	2016	48	3	1	2	29.60
197	2016	49	3	3	1	25.30
198	2016	49	2	4	2	20.10
199	2016	50	1	2	1	25.00
200	2016	50	2	3	2	20.10
201	2017	1	2	1	1	22.90
202	2017	1	4	1	2	31.10
203	2017	2	2	2	1	30.40
204	2017	2	2	3	1	22.10
205	2017	3	4	3	2	24.50
206	2017	3	2	2	2	28.10
207	2017	4	4	4	1	26.40
208	2017	4	3	2	2	30.20
209	2017	5	2	4	1	23.90
210	2017	5	1	4	2	18.20
211	2017	6	2	3	2	18.70
212	2017	6	1	1	2	16.80
213	2017	7	4	1	2	30.70
214	2017	7	2	1	1	21.80
215	2017	8	1	4	1	16.50
216	2017	8	4	4	2	28.30
217	2017	9	1	2	1	22.30
218	2017	9	3	2	1	36.00
219	2017	10	2	4	2	22.10
220	2017	10	3	2	1	34.00
221	2017	11	2	3	1	21.30
222	2017	11	3	1	1	27.40
223	2017	12	4	2	2	32.20
224	2017	12	4	1	1	30.90
225	2017	13	3	2	1	35.40
226	2017	13	4	1	1	27.10
227	2017	14	2	3	1	22.40
228	2017	14	3	3	1	30.20
229	2017	15	4	3	1	25.80
230	2017	15	2	1	2	21.40
231	2017	16	1	1	2	17.30
232	2017	16	4	1	1	28.80
233	2017	17	4	2	2	32.50
234	2017	17	4	2	1	30.40
235	2017	18	2	3	1	20.60
236	2017	18	1	2	1	22.60
237	2017	19	3	1	2	33.10
238	2017	19	2	3	2	19.80
239	2017	20	1	4	2	13.00
240	2017	20	2	2	1	32.10
241	2017	21	1	3	1	17.00
242	2017	21	3	3	2	22.70
243	2017	22	3	2	1	33.80
244	2017	22	1	4	1	15.50
245	2017	23	2	1	1	25.60
246	2017	23	2	1	1	24.30
247	2017	24	2	2	1	31.60
248	2017	24	4	3	2	25.10
249	2017	25	2	4	2	21.10
250	2017	25	2	3	1	23.00
251	2017	26	1	1	2	18.40
252	2017	26	2	2	1	33.40
253	2017	27	2	4	2	23.50
254	2017	27	4	2	2	32.00
255	2017	28	2	2	1	34.10
256	2017	28	1	3	1	13.10
257	2017	29	1	2	1	29.80
258	2017	29	2	1	2	21.80
259	2017	30	3	2	1	33.90
260	2017	30	1	2	2	27.00
261	2017	31	2	2	1	31.30
262	2017	31	2	4	1	22.60
263	2017	32	3	4	1	29.10
264	2017	32	2	4	2	23.40
265	2017	33	3	2	2	35.30
266	2017	33	1	3	2	13.40
267	2017	34	2	2	2	28.00
268	2017	34	2	4	1	26.80
269	2017	35	3	1	1	24.30
270	2017	35	3	2	2	37.00
271	2017	36	4	2	2	30.50
272	2017	36	4	4	2	25.10
273	2017	37	2	1	1	26.40
274	2017	37	1	3	1	15.20
275	2017	38	4	1	2	29.40
276	2017	38	1	1	2	17.90
277	2017	39	3	3	2	27.90
278	2017	39	2	2	1	31.40
279	2017	40	2	3	1	25.30
280	2017	40	2	3	2	20.90
281	2017	41	4	1	1	31.50
282	2017	41	3	1	1	27.10
283	2017	42	3	2	2	36.80
284	2017	42	4	1	2	25.10
285	2017	43	1	1	1	20.40
286	2017	43	4	4	1	29.10
287	2017	44	1	3	1	16.20
288	2017	44	2	3	2	18.10
289	2017	45	2	4	2	23.70
290	2017	45	1	1	1	17.10
291	2017	46	1	4	1	20.40
292	2017	46	2	1	2	24.30
293	2017	47	4	3	2	22.70
294	2017	47	2	4	2	21.00
295	2017	48	3	2	2	31.90
296	2017	48	3	1	2	26.50
297	2017	49	3	2	2	35.20
298	2017	49	3	3	2	24.70
299	2017	50	1	1	2	14.90
300	2017	50	3	1	1	23.40
301	2018	1	4	1	1	26.60
302	2018	1	4	2	1	33.60
303	2018	2	3	3	1	29.10
304	2018	2	2	1	1	22.60
305	2018	3	2	4	2	22.90
306	2018	3	3	2	1	35.00
307	2018	4	2	3	1	19.30
308	2018	4	3	1	1	29.30
309	2018	5	2	2	2	31.70
310	2018	5	1	3	1	16.30
311	2018	6	3	2	2	36.20
312	2018	6	2	1	2	22.20
313	2018	7	4	3	2	28.90
314	2018	7	2	2	1	33.90
315	2018	8	4	3	2	23.40
316	2018	8	4	1	2	24.60
317	2018	9	2	4	1	23.10
318	2018	9	4	2	2	33.90
319	2018	10	1	4	1	17.50
320	2018	10	4	2	2	34.00
321	2018	11	4	4	2	30.10
322	2018	11	4	2	2	32.30
323	2018	12	4	1	2	29.40
324	2018	12	1	1	1	19.90
325	2018	13	1	3	1	13.60
326	2018	13	4	3	1	23.20
327	2018	14	3	1	2	28.70
328	2018	14	2	3	2	22.70
329	2018	15	3	1	1	31.00
330	2018	15	4	1	2	25.00
331	2018	16	1	4	2	19.40
332	2018	16	2	2	2	27.70
333	2018	17	4	4	1	26.30
334	2018	17	2	1	2	21.00
335	2018	18	1	4	2	21.60
336	2018	18	1	2	1	19.40
337	2018	19	3	2	2	35.20
338	2018	19	1	3	1	14.60
339	2018	20	3	3	2	28.20
340	2018	20	2	3	1	24.30
341	2018	21	2	2	1	28.50
342	2018	21	3	2	1	35.00
343	2018	22	1	3	2	14.20
344	2018	22	1	1	1	17.20
345	2018	23	3	4	2	32.50
346	2018	23	2	2	2	28.60
347	2018	24	2	4	1	19.30
348	2018	24	4	3	2	22.00
349	2018	25	3	1	1	28.50
350	2018	25	3	4	2	29.40
351	2018	26	1	1	2	17.70
352	2018	26	2	4	1	24.10
353	2018	27	1	2	2	24.60
354	2018	27	4	1	1	23.60
355	2018	28	3	1	1	28.00
356	2018	28	3	2	1	39.60
357	2018	29	3	2	2	35.50
358	2018	29	4	2	2	35.20
359	2018	30	2	1	2	25.00
360	2018	30	3	2	2	32.80
361	2018	31	3	3	2	24.30
362	2018	31	1	4	2	17.10
363	2018	32	4	4	2	26.60
364	2018	32	2	4	1	24.90
365	2018	33	2	2	2	31.70
366	2018	33	3	2	1	37.10
367	2018	34	1	1	1	16.50
368	2018	34	2	1	2	28.20
369	2018	35	4	2	2	31.60
370	2018	35	4	1	2	25.70
371	2018	36	4	3	1	24.90
372	2018	36	2	1	2	21.70
373	2018	37	2	2	2	30.80
374	2018	37	2	2	2	25.00
375	2018	38	4	2	1	28.80
376	2018	38	4	1	1	24.40
377	2018	39	1	2	2	26.50
378	2018	39	1	2	2	25.70
379	2018	40	1	3	1	14.80
380	2018	40	2	3	2	16.30
381	2018	41	3	1	2	29.30
382	2018	41	4	1	1	26.70
383	2018	42	3	4	1	33.20
384	2018	42	4	4	2	23.70
385	2018	43	2	3	2	21.60
386	2018	43	2	2	2	24.80
387	2018	44	3	1	1	30.60
388	2018	44	2	3	2	20.10
389	2018	45	1	2	2	23.50
390	2018	45	1	4	2	15.20
391	2018	46	3	3	2	27.10
392	2018	46	1	1	2	14.90
393	2018	47	1	3	2	15.80
394	2018	47	1	4	2	17.10
395	2018	48	2	1	2	22.70
396	2018	48	3	2	1	34.00
397	2018	49	1	1	1	20.00
398	2018	49	3	1	2	30.40
399	2018	50	1	1	1	15.60
400	2018	50	2	1	1	24.40
401	2019	1	3	3	1	26.80
402	2019	1	1	2	2	25.90
403	2019	2	3	1	2	23.50
404	2019	2	1	1	2	16.20
405	2019	3	4	2	2	33.00
406	2019	3	4	1	1	26.60
407	2019	4	1	4	2	17.10
408	2019	4	1	2	1	23.70
409	2019	5	1	2	2	24.10
410	2019	5	2	1	2	25.10
411	2019	6	1	4	1	20.20
412	2019	6	2	2	1	30.30
413	2019	7	1	1	1	17.70
414	2019	7	3	4	2	26.10
415	2019	8	3	1	2	26.10
416	2019	8	4	2	2	33.20
417	2019	9	3	3	2	24.90
418	2019	9	4	1	1	28.30
419	2019	10	2	4	1	21.40
420	2019	10	1	3	2	17.70
421	2019	11	4	3	2	22.00
422	2019	11	1	3	1	17.30
423	2019	12	3	4	2	26.20
424	2019	12	2	1	2	21.70
425	2019	13	2	4	2	19.60
426	2019	13	3	2	1	34.20
427	2019	14	1	4	1	19.00
428	2019	14	2	2	1	28.80
429	2019	15	2	2	1	34.00
430	2019	15	3	4	1	26.50
431	2019	16	3	1	2	27.10
432	2019	16	4	4	2	27.30
433	2019	17	4	3	1	24.80
434	2019	17	3	4	2	24.60
435	2019	18	3	2	2	36.60
436	2019	18	1	1	1	19.20
437	2019	19	4	3	1	24.00
438	2019	19	3	1	1	28.30
439	2019	20	1	4	1	18.90
440	2019	20	4	2	1	33.50
441	2019	21	4	3	2	20.30
442	2019	21	1	3	1	15.90
443	2019	22	2	1	2	23.70
444	2019	22	1	4	1	17.40
445	2019	23	1	1	1	16.60
446	2019	23	3	2	2	34.30
447	2019	24	1	2	2	27.30
448	2019	24	4	1	2	21.00
449	2019	25	1	4	2	16.70
450	2019	25	2	3	2	18.30
451	2019	26	2	2	1	30.70
452	2019	26	3	4	1	24.80
453	2019	27	2	1	1	25.80
454	2019	27	4	4	1	22.60
455	2019	28	3	2	1	38.90
456	2019	28	2	3	2	20.20
457	2019	29	2	1	1	26.40
458	2019	29	2	4	2	23.50
459	2019	30	4	4	1	24.80
460	2019	30	3	4	1	28.90
461	2019	31	4	4	1	23.10
462	2019	31	2	2	1	29.80
463	2019	32	2	4	1	23.10
464	2019	32	3	2	1	33.40
465	2019	33	3	2	1	32.20
466	2019	33	4	3	1	22.80
467	2019	34	2	3	1	22.70
468	2019	34	4	2	2	32.30
469	2019	35	3	3	1	30.00
470	2019	35	2	2	1	33.00
471	2019	36	1	4	1	20.50
472	2019	36	4	1	2	27.10
473	2019	37	4	1	1	31.30
474	2019	37	2	3	2	23.30
475	2019	38	4	1	2	25.60
476	2019	38	2	3	1	19.60
477	2019	39	1	1	2	22.70
478	2019	39	4	1	1	26.20
479	2019	40	3	4	1	27.60
480	2019	40	4	4	1	28.10
481	2019	41	2	3	1	19.40
482	2019	41	3	4	2	29.40
483	2019	42	1	1	1	16.30
484	2019	42	4	3	2	23.10
485	2019	43	4	2	1	35.30
486	2019	43	1	2	1	24.50
487	2019	44	2	4	1	29.20
488	2019	44	1	1	2	18.70
489	2019	45	2	4	2	25.10
490	2019	45	2	1	1	20.90
491	2019	46	4	3	1	22.40
492	2019	46	1	3	2	12.90
493	2019	47	3	1	2	27.00
494	2019	47	4	3	1	27.80
495	2019	48	2	4	1	17.80
496	2019	48	3	3	2	26.80
497	2019	49	2	3	1	25.20
498	2019	49	3	1	1	25.70
499	2019	50	4	3	1	22.30
500	2019	50	2	4	2	24.10
501	2020	1	3	2	2	37.40
502	2020	1	3	4	2	30.10
503	2020	2	4	1	2	25.70
504	2020	2	2	4	2	24.00
505	2020	3	1	3	1	16.70
506	2020	3	4	4	1	23.70
507	2020	4	3	2	1	32.40
508	2020	4	3	1	2	25.00
509	2020	5	1	2	2	25.40
510	2020	5	1	4	2	18.90
511	2020	6	2	1	1	23.00
512	2020	6	2	3	2	21.10
513	2020	7	3	1	1	29.30
514	2020	7	2	1	2	22.00
515	2020	8	4	2	2	32.40
516	2020	8	2	4	1	21.20
517	2020	9	2	2	1	26.90
518	2020	9	2	1	2	24.00
519	2020	10	2	4	1	21.50
520	2020	10	3	2	2	35.00
521	2020	11	3	4	1	29.60
522	2020	11	2	1	2	20.60
523	2020	12	2	3	1	23.30
524	2020	12	1	1	2	17.00
525	2020	13	4	4	1	27.20
526	2020	13	3	3	1	27.30
527	2020	14	3	2	1	33.00
528	2020	14	2	4	2	21.10
529	2020	15	3	2	2	33.50
530	2020	15	1	1	1	18.00
531	2020	16	2	2	1	29.80
532	2020	16	2	3	2	22.50
533	2020	17	4	2	2	31.40
534	2020	17	2	3	2	22.90
535	2020	18	3	2	2	36.70
536	2020	18	3	1	2	31.20
537	2020	19	3	4	2	29.10
538	2020	19	1	1	1	23.50
539	2020	20	4	3	2	24.90
540	2020	20	2	3	2	18.90
541	2020	21	3	1	1	25.70
542	2020	21	4	4	2	25.30
543	2020	22	4	4	1	27.70
544	2020	22	3	1	2	30.00
545	2020	23	4	1	2	26.30
546	2020	23	4	1	1	27.80
547	2020	24	3	2	1	34.10
548	2020	24	1	4	2	16.10
549	2020	25	2	4	2	22.10
550	2020	25	1	4	1	19.50
551	2020	26	2	4	1	23.60
552	2020	26	3	3	1	26.90
553	2020	27	4	1	2	26.70
554	2020	27	4	1	2	26.80
555	2020	28	3	4	1	26.40
556	2020	28	3	3	1	26.70
557	2020	29	3	4	1	28.50
558	2020	29	3	4	1	32.50
559	2020	30	4	2	1	32.10
560	2020	30	1	3	1	14.80
561	2020	31	3	4	1	26.30
562	2020	31	4	4	1	23.90
563	2020	32	4	4	1	27.20
564	2020	32	3	3	2	27.40
565	2020	33	3	3	2	27.00
566	2020	33	4	2	2	31.30
567	2020	34	2	2	1	27.90
568	2020	34	1	1	2	16.50
569	2020	35	3	3	1	25.90
570	2020	35	2	2	1	30.30
571	2020	36	4	1	2	24.80
572	2020	36	4	2	2	35.80
573	2020	37	4	2	2	34.10
574	2020	37	2	4	1	22.00
575	2020	38	1	3	2	14.50
576	2020	38	3	2	1	36.70
577	2020	39	3	1	1	26.10
578	2020	39	1	1	2	15.60
579	2020	40	1	2	1	24.00
580	2020	40	3	4	1	28.40
581	2020	41	1	3	1	14.80
582	2020	41	4	3	1	26.50
583	2020	42	2	3	2	18.00
584	2020	42	2	1	2	20.30
585	2020	43	1	3	1	15.40
586	2020	43	3	2	2	34.30
587	2020	44	4	1	2	25.30
588	2020	44	3	3	2	23.60
589	2020	45	1	4	2	12.30
590	2020	45	1	1	2	17.00
591	2020	46	2	4	2	23.70
592	2020	46	3	2	1	36.50
593	2020	47	1	2	1	26.60
594	2020	47	3	4	2	25.60
595	2020	48	1	4	1	17.40
596	2020	48	2	2	2	28.20
597	2020	49	2	2	2	29.10
598	2020	49	1	1	1	15.80
599	2020	50	2	1	1	24.70
600	2020	50	3	4	1	30.80
\.


--
-- Data for Name: predecessors; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.predecessors (id, name) FROM stdin;
1	Овёс
2	Пар
3	Пшеница
4	Ячмень
\.


--
-- Name: conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.conditions_id_seq', 2, true);


--
-- Name: cultures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.cultures_id_seq', 4, true);


--
-- Name: experiments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.experiments_id_seq', 600, true);


--
-- Name: predecessors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.predecessors_id_seq', 4, true);


--
-- Name: conditions conditions_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.conditions
    ADD CONSTRAINT conditions_name_key UNIQUE (name);


--
-- Name: conditions conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.conditions
    ADD CONSTRAINT conditions_pkey PRIMARY KEY (id);


--
-- Name: cultures cultures_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cultures
    ADD CONSTRAINT cultures_name_key UNIQUE (name);


--
-- Name: cultures cultures_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cultures
    ADD CONSTRAINT cultures_pkey PRIMARY KEY (id);


--
-- Name: experiments experiments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_pkey PRIMARY KEY (id);


--
-- Name: predecessors predecessors_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.predecessors
    ADD CONSTRAINT predecessors_name_key UNIQUE (name);


--
-- Name: predecessors predecessors_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.predecessors
    ADD CONSTRAINT predecessors_pkey PRIMARY KEY (id);


--
-- Name: experiments experiments_condition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_condition_id_fkey FOREIGN KEY (condition_id) REFERENCES public.conditions(id);


--
-- Name: experiments experiments_culture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_culture_id_fkey FOREIGN KEY (culture_id) REFERENCES public.cultures(id);


--
-- Name: experiments experiments_predecessor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.experiments
    ADD CONSTRAINT experiments_predecessor_id_fkey FOREIGN KEY (predecessor_id) REFERENCES public.predecessors(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO user_connect;


--
-- Name: TABLE conditions; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.conditions TO user_connect;


--
-- Name: SEQUENCE conditions_id_seq; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT,USAGE ON SEQUENCE public.conditions_id_seq TO user_connect;


--
-- Name: TABLE cultures; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.cultures TO user_connect;


--
-- Name: SEQUENCE cultures_id_seq; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT,USAGE ON SEQUENCE public.cultures_id_seq TO user_connect;


--
-- Name: TABLE experiments; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.experiments TO user_connect;


--
-- Name: SEQUENCE experiments_id_seq; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT,USAGE ON SEQUENCE public.experiments_id_seq TO user_connect;


--
-- Name: TABLE predecessors; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT ON TABLE public.predecessors TO user_connect;


--
-- Name: SEQUENCE predecessors_id_seq; Type: ACL; Schema: public; Owner: user
--

GRANT SELECT,USAGE ON SEQUENCE public.predecessors_id_seq TO user_connect;


--
-- PostgreSQL database dump complete
--

\unrestrict 8JlbQa0seWkgXZHIO3igDyMuj7XEnJLWDWCzast7dsR2jxascffRnJgbGu8FtXt

