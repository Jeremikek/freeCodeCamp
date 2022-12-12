--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Fabio', 4, 3);
INSERT INTO public.users VALUES (2, 'FreeCode', 1, 1);
INSERT INTO public.users VALUES (45, 'user_1670825962029', 5, 106);
INSERT INTO public.users VALUES (4, 'user_1670825785818', 2, 301);
INSERT INTO public.users VALUES (3, 'user_1670825785819', 5, 114);
INSERT INTO public.users VALUES (26, 'user_1670825913098', 2, 36);
INSERT INTO public.users VALUES (98, 'user_1670826299905', 2, 917);
INSERT INTO public.users VALUES (6, 'user_1670825828129', 2, 54);
INSERT INTO public.users VALUES (25, 'user_1670825913099', 5, 93);
INSERT INTO public.users VALUES (5, 'user_1670825828131', 5, 256);
INSERT INTO public.users VALUES (48, 'user_1670825982356', 2, 642);
INSERT INTO public.users VALUES (8, 'user_1670825831706', 2, 628);
INSERT INTO public.users VALUES (76, 'user_1670826053495', 2, 164);
INSERT INTO public.users VALUES (28, 'user_1670825916435', 2, 85);
INSERT INTO public.users VALUES (7, 'user_1670825831707', 5, 15);
INSERT INTO public.users VALUES (64, 'user_1670826034743', 2, 685);
INSERT INTO public.users VALUES (47, 'user_1670825982357', 5, 213);
INSERT INTO public.users VALUES (27, 'user_1670825916436', 5, 174);
INSERT INTO public.users VALUES (10, 'user_1670825836305', 2, 363);
INSERT INTO public.users VALUES (9, 'user_1670825836306', 5, 96);
INSERT INTO public.users VALUES (91, 'user_1670826171599', 5, 16);
INSERT INTO public.users VALUES (12, 'user_1670825846685', 2, 62);
INSERT INTO public.users VALUES (30, 'user_1670825920097', 2, 58);
INSERT INTO public.users VALUES (11, 'user_1670825846686', 5, 42);
INSERT INTO public.users VALUES (63, 'user_1670826034744', 5, 73);
INSERT INTO public.users VALUES (29, 'user_1670825920098', 5, 240);
INSERT INTO public.users VALUES (14, 'user_1670825855682', 1, 143);
INSERT INTO public.users VALUES (50, 'user_1670825988749', 2, 53);
INSERT INTO public.users VALUES (13, 'user_1670825855683', 5, 251);
INSERT INTO public.users VALUES (75, 'user_1670826053496', 5, 166);
INSERT INTO public.users VALUES (16, 'user_1670825867493', 2, 102);
INSERT INTO public.users VALUES (32, 'user_1670825925066', 2, 534);
INSERT INTO public.users VALUES (49, 'user_1670825988750', 5, 242);
INSERT INTO public.users VALUES (15, 'user_1670825867494', 5, 152);
INSERT INTO public.users VALUES (31, 'user_1670825925067', 5, 86);
INSERT INTO public.users VALUES (18, 'user_1670825883541', 2, 688);
INSERT INTO public.users VALUES (17, 'user_1670825883542', 5, 113);
INSERT INTO public.users VALUES (34, 'user_1670825928979', 2, 269);
INSERT INTO public.users VALUES (20, 'user_1670825888223', 2, 426);
INSERT INTO public.users VALUES (52, 'user_1670825994502', 2, 357);
INSERT INTO public.users VALUES (19, 'user_1670825888224', 5, 84);
INSERT INTO public.users VALUES (33, 'user_1670825928980', 5, 476);
INSERT INTO public.users VALUES (66, 'user_1670826038069', 2, 241);
INSERT INTO public.users VALUES (22, 'user_1670825891517', 2, 606);
INSERT INTO public.users VALUES (86, 'user_1670826135786', 2, 235);
INSERT INTO public.users VALUES (21, 'user_1670825891518', 5, 10);
INSERT INTO public.users VALUES (51, 'user_1670825994503', 5, 19);
INSERT INTO public.users VALUES (36, 'user_1670825932536', 2, 497);
INSERT INTO public.users VALUES (24, 'user_1670825894249', 2, 159);
INSERT INTO public.users VALUES (35, 'user_1670825932537', 5, 29);
INSERT INTO public.users VALUES (23, 'user_1670825894250', 5, 15);
INSERT INTO public.users VALUES (65, 'user_1670826038070', 5, 205);
INSERT INTO public.users VALUES (38, 'user_1670825936367', 2, 23);
INSERT INTO public.users VALUES (54, 'user_1670826002306', 2, 462);
INSERT INTO public.users VALUES (37, 'user_1670825936368', 5, 15);
INSERT INTO public.users VALUES (78, 'user_1670826057071', 2, 261);
INSERT INTO public.users VALUES (53, 'user_1670826002307', 5, 337);
INSERT INTO public.users VALUES (40, 'user_1670825948967', 2, 233);
INSERT INTO public.users VALUES (39, 'user_1670825948968', 5, 8);
INSERT INTO public.users VALUES (68, 'user_1670826041126', 2, 241);
INSERT INTO public.users VALUES (56, 'user_1670826005279', 2, 265);
INSERT INTO public.users VALUES (42, 'user_1670825952226', 2, 175);
INSERT INTO public.users VALUES (85, 'user_1670826135787', 5, 163);
INSERT INTO public.users VALUES (77, 'user_1670826057072', 5, 542);
INSERT INTO public.users VALUES (41, 'user_1670825952227', 5, 88);
INSERT INTO public.users VALUES (55, 'user_1670826005280', 5, 239);
INSERT INTO public.users VALUES (67, 'user_1670826041127', 5, 31);
INSERT INTO public.users VALUES (44, 'user_1670825955135', 2, 340);
INSERT INTO public.users VALUES (43, 'user_1670825955136', 5, 25);
INSERT INTO public.users VALUES (58, 'user_1670826015555', 2, 456);
INSERT INTO public.users VALUES (46, 'user_1670825962028', 2, 826);
INSERT INTO public.users VALUES (57, 'user_1670826015556', 5, 12);
INSERT INTO public.users VALUES (70, 'user_1670826044056', 2, 167);
INSERT INTO public.users VALUES (97, 'user_1670826299906', 5, 89);
INSERT INTO public.users VALUES (60, 'user_1670826026164', 2, 231);
INSERT INTO public.users VALUES (69, 'user_1670826044057', 5, 126);
INSERT INTO public.users VALUES (59, 'user_1670826026165', 5, 315);
INSERT INTO public.users VALUES (80, 'user_1670826075568', 2, 59);
INSERT INTO public.users VALUES (62, 'user_1670826031301', 2, 390);
INSERT INTO public.users VALUES (94, 'user_1670826282650', 2, 617);
INSERT INTO public.users VALUES (72, 'user_1670826047375', 2, 154);
INSERT INTO public.users VALUES (61, 'user_1670826031302', 5, 200);
INSERT INTO public.users VALUES (79, 'user_1670826075569', 5, 22);
INSERT INTO public.users VALUES (71, 'user_1670826047376', 5, 48);
INSERT INTO public.users VALUES (88, 'user_1670826145144', 2, 404);
INSERT INTO public.users VALUES (74, 'user_1670826049954', 2, 28);
INSERT INTO public.users VALUES (101, 'user_1670826315745', 5, 23);
INSERT INTO public.users VALUES (82, 'user_1670826101838', 2, 10);
INSERT INTO public.users VALUES (73, 'user_1670826049955', 5, 169);
INSERT INTO public.users VALUES (87, 'user_1670826145145', 5, 110);
INSERT INTO public.users VALUES (93, 'user_1670826282651', 5, 452);
INSERT INTO public.users VALUES (81, 'user_1670826101839', 5, 346);
INSERT INTO public.users VALUES (84, 'user_1670826132406', 2, 189);
INSERT INTO public.users VALUES (90, 'user_1670826150832', 2, 129);
INSERT INTO public.users VALUES (83, 'user_1670826132407', 5, 14);
INSERT INTO public.users VALUES (89, 'user_1670826150833', 5, 111);
INSERT INTO public.users VALUES (108, 'user_1670826353339', 2, 552);
INSERT INTO public.users VALUES (96, 'user_1670826289638', 2, 297);
INSERT INTO public.users VALUES (100, 'user_1670826304881', 2, 100);
INSERT INTO public.users VALUES (92, 'user_1670826171598', 2, 276);
INSERT INTO public.users VALUES (106, 'user_1670826328065', 2, 909);
INSERT INTO public.users VALUES (95, 'user_1670826289639', 5, 17);
INSERT INTO public.users VALUES (99, 'user_1670826304882', 5, 82);
INSERT INTO public.users VALUES (104, 'user_1670826323457', 2, 276);
INSERT INTO public.users VALUES (110, 'user_1670826381476', 2, 216);
INSERT INTO public.users VALUES (105, 'user_1670826328066', 5, 31);
INSERT INTO public.users VALUES (102, 'user_1670826315744', 2, 413);
INSERT INTO public.users VALUES (103, 'user_1670826323458', 5, 266);
INSERT INTO public.users VALUES (107, 'user_1670826353340', 5, 236);
INSERT INTO public.users VALUES (109, 'user_1670826381477', 5, 66);
INSERT INTO public.users VALUES (112, 'user_1670826385262', 2, 55);
INSERT INTO public.users VALUES (111, 'user_1670826385263', 5, 98);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 112, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

