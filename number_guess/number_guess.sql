--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    attempts integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (106, 778, 'user_1738002238357');
INSERT INTO public.games VALUES (107, 847, 'user_1738002238357');
INSERT INTO public.games VALUES (108, 278, 'user_1738002238356');
INSERT INTO public.games VALUES (109, 659, 'user_1738002238356');
INSERT INTO public.games VALUES (110, 365, 'user_1738002238357');
INSERT INTO public.games VALUES (111, 955, 'user_1738002238357');
INSERT INTO public.games VALUES (112, 25, 'user_1738002238357');
INSERT INTO public.games VALUES (113, 741, 'user_1738002259469');
INSERT INTO public.games VALUES (114, 744, 'user_1738002259469');
INSERT INTO public.games VALUES (115, 533, 'user_1738002259468');
INSERT INTO public.games VALUES (116, 224, 'user_1738002259468');
INSERT INTO public.games VALUES (117, 251, 'user_1738002259469');
INSERT INTO public.games VALUES (118, 366, 'user_1738002259469');
INSERT INTO public.games VALUES (119, 730, 'user_1738002259469');
INSERT INTO public.games VALUES (120, 259, 'user_1738002333017');
INSERT INTO public.games VALUES (121, 183, 'user_1738002333017');
INSERT INTO public.games VALUES (122, 844, 'user_1738002333016');
INSERT INTO public.games VALUES (123, 297, 'user_1738002333016');
INSERT INTO public.games VALUES (124, 564, 'user_1738002333017');
INSERT INTO public.games VALUES (125, 543, 'user_1738002333017');
INSERT INTO public.games VALUES (126, 861, 'user_1738002333017');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1738002238357');
INSERT INTO public.users VALUES ('user_1738002238356');
INSERT INTO public.users VALUES ('user_1738002259469');
INSERT INTO public.users VALUES ('user_1738002259468');
INSERT INTO public.users VALUES ('user_1738002333017');
INSERT INTO public.users VALUES ('user_1738002333016');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 126, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

