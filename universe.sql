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
    name character varying(40) NOT NULL,
    number_of_stars integer,
    diameter_kiloparsecs numeric(10,3),
    radius_rounded_mlightyears integer,
    constellation text,
    danger_of_collision boolean,
    visible_naked_eye boolean
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
-- Name: galaxy_more_details; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_more_details (
    galaxy_type character varying(20) NOT NULL,
    highest_composition character varying(20),
    has_life boolean NOT NULL,
    galaxy_id integer,
    galaxy_more_details_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.galaxy_more_details OWNER TO freecodecamp;

--
-- Name: galaxy_more_details_galaxy_more_details_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_more_details_galaxy_more_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_more_details_galaxy_more_details_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_more_details_galaxy_more_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_more_details_galaxy_more_details_id_seq OWNED BY public.galaxy_more_details.galaxy_more_details_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_mill integer,
    diameter_km numeric(10,3),
    rotation_speed_km integer,
    planet_name text,
    danger_of_collision boolean,
    visible_naked_eye boolean,
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
    name character varying(40) NOT NULL,
    age_mill integer,
    diameter_km numeric(10,3),
    number_of_moons integer,
    constellation text,
    danger_of_collision boolean,
    visible_naked_eye boolean,
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
    name character varying(40) NOT NULL,
    effective_temperature_kelvin integer,
    solar_mass numeric(10,3),
    first_sight_year integer,
    constellation text,
    danger_of_collision boolean,
    visible_naked_eye boolean,
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
-- Name: galaxy_more_details galaxy_more_details_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_details ALTER COLUMN galaxy_more_details_id SET DEFAULT nextval('public.galaxy_more_details_galaxy_more_details_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 1000000000, 67.452, 110, 'Andromeda', true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 1000000000, 26.800, 52, 'Sagittarius', true, true);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 1000000000, 27.594, 45, 'Ursa Major', false, false);
INSERT INTO public.galaxy VALUES (4, 'Atennae Galaxies', 1000000000, 150.000, 500, 'Corvus', true, false);
INSERT INTO public.galaxy VALUES (5, 'Backward Galaxy NGC 4622', 0, 12.600, 61, 'Centaurus', false, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy Messier 64', 1000000000, 16.238, 26, 'Coma Berenices', false, false);


--
-- Data for Name: galaxy_more_details; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_more_details VALUES ('Spiral Galaxy', 'Dust and Gas', true, 2, 1, 'Silver River');
INSERT INTO public.galaxy_more_details VALUES ('Spiral Galaxy', 'Dust and Gas', false, 1, 2, 'Andromeda Nebula');
INSERT INTO public.galaxy_more_details VALUES ('Spiral Galaxy', 'Dust', false, 3, 3, 'Messier 81');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4530, 3474.000, 3683, 'Earth', true, true, 7);
INSERT INTO public.moon VALUES (2, 'Phobos', 270000000, 22533.000, 11, 'Mars', false, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 270000000, 12.400, 20000, 'Mars', false, false, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 450000000, 5268.000, 10880, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', 400000000, 4820.000, 8000, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (6, 'Io', 450000000, 3643.000, 271, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (7, 'Europe', 450000000, 3121.000, 2025, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (8, 'Amalthea', 400000000, 167.000, 2657, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (9, 'Himalia', 400000000, 170.000, 2344, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (10, 'Thebe', 400000000, 98.000, 2145, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (11, 'Elara', 400000000, 86.000, 2345, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 400000000, 100.000, 2114, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (13, 'Metis', 400000000, 43.000, 2456, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (14, 'Carme', 400000000, 46.000, 2632, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (15, 'Sinope', 400000000, 35.000, 2333, 'Jupiter', false, false, 1);
INSERT INTO public.moon VALUES (16, 'Titan', 100000000, 5149.000, 7765, 'Saturn', false, false, 3);
INSERT INTO public.moon VALUES (17, 'Rhea', 400000000, 1527.000, 3456, 'Saturn', false, false, 3);
INSERT INTO public.moon VALUES (18, 'Iapetus', 450000000, 1469.000, 2231, 'Saturn', false, false, 3);
INSERT INTO public.moon VALUES (19, 'Dione', 450000000, 1122.000, 5543, 'Saturn', false, false, 3);
INSERT INTO public.moon VALUES (20, 'Tethys', 450000000, 1062.000, 3342, 'Saturn', false, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 4603, 95.000, 1610, 'Leo', false, true, 7);
INSERT INTO public.planet VALUES (2, 'Mars', 4603, 2.000, 1610, 'Cygnus', false, true, 7);
INSERT INTO public.planet VALUES (3, 'Saturn', 4503, 146.000, 1610, 'Acuarius', false, true, 7);
INSERT INTO public.planet VALUES (4, 'Neptune', 4503, 14.000, 1846, 'Acuarius', false, false, 7);
INSERT INTO public.planet VALUES (5, 'Mercury', 4503, 0.000, 1610, 'Sagittarius', false, true, 7);
INSERT INTO public.planet VALUES (6, 'Venus', 4503, 0.000, 1769, 'Cancer', false, true, 7);
INSERT INTO public.planet VALUES (7, 'Earth', 4543, 1.000, 1946, NULL, false, true, 7);
INSERT INTO public.planet VALUES (8, 'Uranus', 4503, 27.000, 1781, 'Aries', false, false, 7);
INSERT INTO public.planet VALUES (9, '23 Librae b', 11000, 0.000, 1999, 'Libra', false, false, 1);
INSERT INTO public.planet VALUES (10, '109 Piscium b', 7000, 0.000, 1999, 'Pisces', false, false, 2);
INSERT INTO public.planet VALUES (11, 'Upsilon Andromedae d', 43000, 0.000, 1999, 'Andromeda', false, false, 3);
INSERT INTO public.planet VALUES (12, '16 Cygni Bb', 7600, 0.000, 1996, 'Cygnus', false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Berkeley 87', 200000, 28.600, 2021, 'Cygnus', false, true, 2);
INSERT INTO public.star VALUES (2, 'Trumpler 27', 3790, 5.860, 2000, 'Scorpius', false, true, 1);
INSERT INTO public.star VALUES (3, 'HD 150136', 40000, 54.000, 1654, 'Ara', false, true, 2);
INSERT INTO public.star VALUES (4, 'Eta Carinae', 35200, 99.000, 1600, 'Carina', false, true, 2);
INSERT INTO public.star VALUES (5, 'Pismis 24-1', 41500, 74.000, 1959, 'Scorpius', false, true, 2);
INSERT INTO public.star VALUES (6, 'HD 97950', 42000, 16.000, 1834, 'Carina', false, true, 2);
INSERT INTO public.star VALUES (7, 'Sun', 5800, 1989.000, NULL, 'Circinus', false, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_more_details_galaxy_more_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_more_details_galaxy_more_details_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy_more_details galaxy_more_details_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_details
    ADD CONSTRAINT galaxy_more_details_name_key UNIQUE (name);


--
-- Name: galaxy_more_details galaxy_more_details_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_details
    ADD CONSTRAINT galaxy_more_details_pkey PRIMARY KEY (galaxy_more_details_id);


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
-- Name: galaxy_more_details galaxy_more_details_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_details
    ADD CONSTRAINT galaxy_more_details_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

