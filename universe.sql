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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: five_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.five_table (
    name character varying(50),
    five_table_id integer NOT NULL,
    type integer,
    distance integer NOT NULL
);


ALTER TABLE public.five_table OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    has_life boolean,
    is_spherical boolean,
    years numeric,
    desciption text,
    distance integer NOT NULL,
    types integer,
    star_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer,
    has_life boolean,
    is_spherial boolean,
    years numeric,
    description text,
    distance integer NOT NULL,
    types integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    star_id integer,
    has_life boolean,
    is_spherial boolean,
    years numeric,
    description text,
    distance integer NOT NULL,
    types integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer,
    has_life boolean,
    is_spherial boolean,
    years numeric,
    description text,
    distance integer NOT NULL,
    types integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: five_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.five_table VALUES (NULL, 1, NULL, 2);
INSERT INTO public.five_table VALUES (NULL, 2, NULL, 3);
INSERT INTO public.five_table VALUES (NULL, 3, NULL, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (2, NULL, 2, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.moon VALUES (3, NULL, 3, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (4, NULL, 4, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (5, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (12, NULL, 2, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.moon VALUES (31, NULL, 3, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (14, NULL, 4, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (15, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (211, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (122, NULL, 2, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.moon VALUES (321, NULL, 3, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (214, NULL, 4, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (215, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (1211, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (1223, NULL, 2, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.moon VALUES (3321, NULL, 3, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (2314, NULL, 4, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (2315, NULL, 5, NULL, NULL, NULL, NULL, 5, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, NULL, 1, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.planet VALUES (3, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, NULL, 1, NULL, NULL, NULL, NULL, 11, NULL);
INSERT INTO public.planet VALUES (5, NULL, 66, NULL, NULL, NULL, NULL, 11, NULL);
INSERT INTO public.planet VALUES (6, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, NULL, 1, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.planet VALUES (31, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (41, NULL, 1, NULL, NULL, NULL, NULL, 11, NULL);
INSERT INTO public.planet VALUES (15, NULL, 66, NULL, NULL, NULL, NULL, 11, NULL);
INSERT INTO public.planet VALUES (61, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, 1, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.star VALUES (21, NULL, 1, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.star VALUES (55, NULL, 1, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.star VALUES (6, NULL, 2, NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.star VALUES (66, NULL, 4, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.star VALUES (4, NULL, 5, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.star VALUES (5, NULL, 6, NULL, NULL, NULL, NULL, 7, NULL);


--
-- Name: five_table five_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.five_table
    ADD CONSTRAINT five_table_pkey PRIMARY KEY (five_table_id);


--
-- Name: five_table five_table_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.five_table
    ADD CONSTRAINT five_table_type_key UNIQUE (type);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_types_key UNIQUE (types);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_types_key UNIQUE (types);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_types_key UNIQUE (types);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_types_key UNIQUE (types);


--
-- Name: star fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

