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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50),
    distance_mly numeric,
    diameter_ly integer,
    galaxy_group_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_mly numeric,
    constellation text
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_galaxy_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_galaxy_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_galaxy_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovered integer,
    orbital_speed_kms numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass_earths numeric,
    discovered integer,
    habital_zone boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_class character varying(1),
    life_stage character varying(50),
    distance_ly numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_galaxy_group_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'M101', 'Intermediate Spiral', 20.9, 170000, 3);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Barred Spiral', NULL, 185000, 1);
INSERT INTO public.galaxy VALUES (3, 'M66', 'Intermediate Spiral', 31.0, 95000, 2);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 'Local Group', NULL, NULL);
INSERT INTO public.galaxy_group VALUES (2, 'Leo Triplet', 35.1, 'Leo');
INSERT INTO public.galaxy_group VALUES (3, 'M101', 23.9, 'Ursa Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1.022, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 2.138, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 1.351, 4);
INSERT INTO public.moon VALUES (4, 'Metis', 1979, 31.501, 5);
INSERT INTO public.moon VALUES (5, 'Adastrea', 1979, 31.378, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 1892, 26.570, 5);
INSERT INTO public.moon VALUES (7, 'Thebes', 1979, 23.920, 5);
INSERT INTO public.moon VALUES (8, 'Io', 1610, 17.334, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 1610, 13.743, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 1610, 10.880, 5);
INSERT INTO public.moon VALUES (11, 'Callisto', 1610, 8.204, 5);
INSERT INTO public.moon VALUES (12, 'Mimas', 1789, 14.230, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 1684, 11.350, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 1672, 8.480, 6);
INSERT INTO public.moon VALUES (15, 'Titan', 1655, 5.570, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 1671, 3.260, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 1948, 6.660, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 1851, 5.510, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1851, 4.670, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 1787, 3.640, 7);
INSERT INTO public.moon VALUES (21, 'Oberon', 1787, 3.150, 7);
INSERT INTO public.moon VALUES (22, 'Proteus', 1989, 7.623, 8);
INSERT INTO public.moon VALUES (23, 'Triton', 1846, 4.390, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 1610, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 1610, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.159, 1610, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.536, 1781, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.147, 1846, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Gliese 1132 b', 1.660, 2015, false, false, 2);
INSERT INTO public.planet VALUES (10, 'CoRoT-7A b', 4.077, 2009, false, false, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-186 f', 1.710, 2014, true, false, 5);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000, NULL, true, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.800, 1610, false, false, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 1631, false, false, 1);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 e', 0.692, 2017, true, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 'Main Sequence', 0, 2);
INSERT INTO public.star VALUES (2, 'Gliese 1132', 'M', 'Main Sequence', 41, 2);
INSERT INTO public.star VALUES (3, 'CoRoT-7A', 'K', 'Main Sequence', 522, 2);
INSERT INTO public.star VALUES (4, 'CoRoT-7B', 'M', 'Main Sequence', 522, 2);
INSERT INTO public.star VALUES (5, 'Kepler-186', 'M', 'Main Sequence', 579, 2);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 'M', 'Main Sequence', 41, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_galaxy_group_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy_group galaxy_group_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_name_key UNIQUE (name);


--
-- Name: galaxy_group galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (galaxy_group_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_group_id_fkey FOREIGN KEY (galaxy_group_id) REFERENCES public.galaxy_group(galaxy_group_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

